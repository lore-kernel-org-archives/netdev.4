Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681260;
	b=tcaoZTJOfWQbae7AYjocWcDQnZEWb8oRhg+maWR43wXAS7G1RJjUlKQs2Y5ljznIjvc7
	 RlFAoIl9mLPPsvKCNwXgx0q1sRxtQ13ZiuuKY9bBrNqjcOBXxPQuhdoycLjSOX33hAT18
	 XoJKOYubfxvpcceNL0ghzMd0yTDw6JXkYPNVPkl0f1rd1C3Pyn7b9KyPuHnznkSVP6/Uh
	 064jeyBb27r60WDkM9jfWTiLFX5r8Yseb0hVJp+2cSGnxBlN86FRhzyNYlP2n0QwtHN6t
	 dnAU1DBTQf3pO3Dw6tR2niWVHblJ3DELXeeTWJITHAxloYXrJZupf/tI9eYdfYyCgxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nWb5Z5t6RK8tqOX0Y27tfK1vMpGLhP24jlEag1RHczg=;
	b=3pEDQc0jHdbjegPUGD5BvWIFRcTjC6RGbVhwmWjsFRB203EyXQhRHmMgoZHv/7J59xeG
	 2rYvGYrxIGLEpRuiuvLJv1VV4jyVMH3/CEBFm1WNz+7WGj2OD50L34NYvd0s8RtEvSYPV
	 WmfoDQkQoS3WGoKlmQ7K3nOtjzKvlO23zQIayMRMLTBUJPf5aOeFmqX7ckvtyFk5+3WTM
	 oQVMDEgffmugNnYrnSwWjlTsuXO1xOlQp9bwLHClzA9lmk3MOh06s1wGOsrDLtEDdtLfr
	 bNN53wWvojADIaVdOdjLjxPqMuNMJoKRp112dtaB6im/D3FzqKD+TzULE+VWAcgUjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxxYqGEl;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699B606A33B
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E699B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxxYqGEl
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso3403880a91.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681259; x=1796286059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWb5Z5t6RK8tqOX0Y27tfK1vMpGLhP24jlEag1RHczg=;
        b=KxxYqGElOq5lW5A+bS0tALx/oAwqgEL/9qSYCKn911jBtH9pbkiCvxaJdT0v3oGq3y
         JpIDQ7J47l4wGfqo1POzNlMjh9XpzAUNYJpVCzlRnT5nG7iXcLCu/Vz/xbP39rJmUjLt
         WQC83CX4eLHB2JEgZ0wi+5j1ZG8zU1CJgHbFq04jnxvORYhdDk6lpQhmqdt/OrJT3bol
         vzwnv0GVfY8TAvewFH10/FOXMcP10wcGVmiAR8F+BjDVEGeRy8FMuadMM16AkunvxQ1M
         YlvqpRwapZin13rZ0jJ/1a7Gm+j+6MxvgrjXxvZOrLfyzekjgBU7IZAvBgpb1TGV6Yst
         WZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681259; x=1796286059;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWb5Z5t6RK8tqOX0Y27tfK1vMpGLhP24jlEag1RHczg=;
        b=rERe9Ed/3hunmJ+gt8euF4jBoffuhGsoa3vsRET59lNaGNrXiLW5j423914HJ5CBwr
         frFHma+e5fj+VbZITZF0VCP7DvoK6POw5jVH1BRBkWxa+h2omgcaUX8umcEgcN/FtE8w
         zlmD/72xtLg91Bw+XDJTUhd8TvD0vEcLlTVMpZ0/iIfrco1dwZA6O2eo0mE6prSghe+x
         dOZoJuq1fEVkUFcBS3d61Y/80LMILbaF8ZJehJAcd5510+06IfnGYEy8uITMXEBqCwMg
         vTidw9weYk30Y9GI3kAXbs3M4xzW6LHDEieenB7/jDCwuXRqzGCwWqQyDFewhWUbgzeE
         3UgA==
X-Forwarded-Encrypted: i=1; AL+hErHHaBzg/eLKXGJdgrbjarz0E5GF1wyQ+DnJS+ZmOWTh42aduIWppjtIv26JZ0W/2uOzBRegzxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xbMnF/5GR2C4vSky+3InLhAepBWg+7GH/k/2pOQh7J1GgCIHo
	2DxKFRVpNexnXXpyF76klBoVDsCbD2/UPt3pMXh5ypjKpOFfklbVt+Z8
X-Gm-Gg: AZFdTZctcQo++VGRgTvh9A110An733fFZKxTd1IyD6WQXih57MgGSxfM0n5oE5Zb44x
	5s14hNu9i6wBRIBRzronUB7jI3ZNupLWvFhQiF3PhSR5oxb7pxGNPiov5Q/mExcWEPmAan6mRMs
	m8mJlCKOWxFxlf4pVxddjJacWblTM+wxqd7QEIwtOwdiktnZXw7ltgfrxPy/VwJmfDELwrtYpgs
	zI2AbyxxxrTZqS7vvt1bu6jmVdNNGJeiv8uFisCUvtNr6H6NI1Gk0USsKsRyBHzc4IxrAAZkxWl
	thcOSiUGQ8pI0oqko0vK8jEtdZfBDIZ2GQ9GZMlW+z3diuTsNYGKW8wq9zCfiKobm2b+gDjkCjL
	D6tVvu7RZ9CafbW6Q218/ypysZhhPmJ3lFCeGvc1ZFObzX7PETbf1BHRSgkrXf1NRNuDXgOBgeY
	hsZIPyg+SUhGuniTug55t0wDJP7CTy349dL/kMVjLOvCoBbOMmbpDj91ftN51G03/sR/wAbCtDx
	68cXJDmcjg7fNmYYf22dB7wSDeklR5XXEDUe+ipBcCk22RecNhQYlvk7PACYljdfRe+EaPXCYg8
	x0kYohOvD/s7f0QzYfw5iaTiwPRjIlxjcOnGFeyC1IRzy/anx79CB4J640+K
X-Received: by 2002:a17:90b:3f0f:b0:3b0:934c:5e41 with SMTP id 98e67ed59e1d1-3b41c9080e7mr24217936a91.29.1795681258845;
        Thu, 26 Nov 2026 00:20:58 -0800 (PST)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm30537371a91.7.2026.11.26.00.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:20:58 -0800 (PST)
Message-ID: <5b2703a3-ae4f-431e-bf4e-d44348654913@gmail.com>
Date: Thu, 26 Nov 2026 16:20:55 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] bonding: unbind 802.3ad slaves on enslave failure
To: Nikolay Aleksandrov <razor@blackwall.org>, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, sfeldma@cumulusnetworks.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20261124024319.52145-1-ljp1205831794@gmail.com>
 <654889ea-3b83-4fd4-b283-184f87b3d208@blackwall.org>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <654889ea-3b83-4fd4-b283-184f87b3d208@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026-11-25 3:14 p.m., Nikolay Aleksandrov wrote:
> On 24/11/2026 04:41, Lin Jiapeng wrote:
>> From: Lin Jiapeng <jiapenglin@tencent.com>
>>
>> The 802.3ad enslave path binds a slave before publishing it in the bond's
>> slave list. The periodic state machine can select the port and attach 
>> it to
>> a LAG while enslavement is in progress, including while 
>> NETDEV_CHANGEUPPER
>> notifiers are running.
>>
>> If enslavement fails, rollback can free ad_slave_info without 
>> unbinding its
>> port and leave later LAG processing with a dangling pointer. This affects
>> both a failed upper-link notification and later failures such as
>> bond_sysfs_slave_add(). A test-only kretprobe forces the latter to return
>> -ENOMEM, after which KASAN reports:
>>       BUG: KASAN: slab-use-after-free in 
>> ad_agg_selection_logic+0x1a0d/0x1fa0
>>       Read of size 1 by task kworker/u16:0/13
>>       Freed by task 110:
>>         kfree
>>         slave_kobj_release
>>         kobject_put
>>         bond_enslave
>>
>> Drain the RX handler before unbinding so receive handlers cannot race 
>> with
>> port->slave becoming NULL. Unbind before upper unlink when the link 
>> exists,
>> and also unbind after an upper-link failure without repeating the unlink.
>> Rebuild the slave array after aggregator changes and leave earlier
>> unpublished failures unchanged.
>>
>> Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave 
>> devices.")
>> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
>> Link: https://lore.kernel.org/netdev/20261113130454.63032-1- 
>> ljp1205831794@gmail.com/
>> ---
>> v1 -> v2:
>>    - Drain the RX handler before unbinding to avoid NULL dereferences 
>> in the
>>      802.3ad receive path.
>>    - Cover NETDEV_CHANGEUPPER failure after transient upper-link 
>> publication,
>>      without repeating upper-dev unlink.
>>    - Rebuild the 802.3ad slave array after rollback.
>>
>>   drivers/net/bonding/bond_main.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/ 
>> bond_main.c
>> index e9f5e753f677..7ca948bb27d0 100644
>> --- a/drivers/net/bonding/bond_main.c
>> +++ b/drivers/net/bonding/bond_main.c
>> @@ -2355,10 +2355,21 @@ int bond_enslave(struct net_device *bond_dev, 
>> struct net_device *slave_dev,
>>       bond_sysfs_slave_del(new_slave);
>>   err_upper_unlink:
>> +    netdev_rx_handler_unregister(slave_dev);
>> +    if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +        bond_3ad_unbind_slave(new_slave);
>>       bond_upper_dev_unlink(bond, new_slave);
>> +    goto err_update_slave_arr;
>>   err_unregister:
>>       netdev_rx_handler_unregister(slave_dev);
>> +    if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +        bond_3ad_unbind_slave(new_slave);
>> +
>> +err_update_slave_arr:
>> +    if (BOND_MODE(bond) == BOND_MODE_8023AD &&
>> +        bond_update_slave_arr(bond, new_slave))
>> +        bond_slave_arr_work_rearm(bond, 0);
>>   err_detach:
>>       vlan_vids_del_by_dev(slave_dev, bond_dev);
>>
>> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
> 
> This looks awful jumping around error labels and doing the same thing
> at different places. Surely you could rearrange them better, maybe
> something like this (untested, needs proper review):
> --- a/drivers/net/bonding/bond_main.c
>    +++ b/drivers/net/bonding/bond_main.c
>    @@ -1888,10 +1888,11 @@
>     int bond_enslave(struct net_device *bond_dev, struct net_device 
> *slave_dev,
>                   struct netlink_ext_ack *extack)
>     {
>    +     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
>          struct bonding *bond = netdev_priv(bond_dev);
>    -     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
>          struct slave *new_slave = NULL, *prev_slave;
>          struct sockaddr_storage ss;
>    +     bool upper_linked = false;
>          int res = 0, i;
> 
>          if (slave_dev->type == ARPHRD_CAN ||
>    @@ -2246,13 +2247,14 @@
>                  slave_dbg(bond_dev, slave_dev, "Error %d calling 
> bond_master_upper_dev_link\n", res);
>                  goto err_unregister;
>          }
>    +     upper_linked = true;
> 
>          bond_lower_state_changed(new_slave);
> 
>          res = bond_sysfs_slave_add(new_slave);
>          if (res) {
>                  slave_dbg(bond_dev, slave_dev, "Error %d calling 
> bond_sysfs_slave_add\n", res);
>    -             goto err_upper_unlink;
>    +             goto err_unregister;
>          }
> 
>          /* If the mode uses primary, then the following is handled by
>    @@ -2357,11 +2359,15 @@
>     err_sysfs_del:
>          bond_sysfs_slave_del(new_slave);
> 
>    -err_upper_unlink:
>    -     bond_upper_dev_unlink(bond, new_slave);
>    -
>     err_unregister:
>          netdev_rx_handler_unregister(slave_dev);
>    +     if (BOND_MODE(bond) == BOND_MODE_8023AD) {
>    +             bond_3ad_unbind_slave(new_slave);
>    +             if (bond_update_slave_arr(bond, new_slave))
>    +                     bond_slave_arr_work_rearm(bond, 0);
>    +     }
>    +     if (upper_linked)
>    +             bond_upper_dev_unlink(bond, new_slave);
> 
>     err_detach:
>          vlan_vids_del_by_dev(slave_dev, bond_dev);

Thanks a lot for the suggestions. I have adopted your suggested 
structure in v3: the err_upper_unlink label is
gone and the rollback is a single err_unregister block gated by
upper_linked. On top of that, v3 includes a few changes based on the
pw-bot review of v2, mainly binding the 802.3ad port only after the
upper link has been established and re-evaluating the carrier in the
rollback path.

