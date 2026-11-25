Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590863;
	b=Xn0Jj3o4sRWQ30n8m6S5pXiiFr4f+FZR1db6k1ty87rKSPGbhqDTl1ZEC0QzE4/v1cL2
	 8BHK7R7giRkoLQBLmkNe9ShALsflmTuSLT64WQjBzzqDvv0vFQLth/oL/dEUU6H0oI29O
	 dMCy4SiQsVDI9Hq9U7aEw7Nqg+3PuhQ8Ra2K8PNIRKBTssCvNRtd7Hrb8PKkzXRmgMaeV
	 vkwJrHmt5TvSR4LT8XQK0qi3bWkHxYnX68f0FTDfj2BdI7Q0SqxBvl6LxnT5NVoccWJGC
	 c1PSyabLUM4wxk/cMuHzyG4C5cUybFJRBXw5yPaqWLRjvGbLom1Rtau3secayGUUwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OS4S/3wgJzlNANveRHhJ0JCqQT7lj4OoQJmmJFDLZnQ=;
	b=aK4kU8v5jaMydSiPvYw1Jii+CMvG5DDxjGG8AFI+zN40E4MXGWl476Ghs7pEJfzR4YWL
	 u1jfxU/MiPHvt7G47fXP+dPulndFi0NHXRkeq1KBW8ZTV5JIvkFzTIiglkRE0r2HHSmDm
	 2nScbdWfQ0vkfhiV2xW4FXqC9M/an23PhlIY0a9ofwOTNCQlidOoRj1D3GIGb5vtZrsIZ
	 zrtyAtr8TjUzsGXcq9BPIxaIBgFdmIq1KbeIMRnD2EMy8wF3zRCltyEbM2WdqruF4/QHU
	 4G4GUTmxwJ3sKNAL+spkpq6U2al4uv3Eghsn0OIXLtqctSjl36Be6bj1rtiSKJdkkjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Y7d+PtKP;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0A6606A68B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0A6606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Y7d+PtKP
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so46883855e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795590860; x=1796195660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OS4S/3wgJzlNANveRHhJ0JCqQT7lj4OoQJmmJFDLZnQ=;
        b=Y7d+PtKPrZc9qrL8ruw1v2fnEiDIJp/Oiw2UpSegR2quLKxNQMSfHY8uFKTccIL/4R
         LryGVJ39a7dQhuuNh96TtjzmrNy6WXtuaXlWmHSDUtsvgdqUe/iV0pQxxrUKTcdi6d/G
         JzgjhkCIGo991kVo+5OuxAOat0SDzClE4Q7lxRlHMmYqBEdV4IJioU1kPuJyz6zX0Wjh
         wkt2/sPUo2ko3roosjYwPxD7nOOlOm+xiYO/8xs5reM3rtyZrIj2XhlrBVNrD266dGbM
         ycDAljyKKsdUTSXsstGvHR6kbQTTMw67gMFKXtXTLQfS6ny3OhYLy/FzBbUdHy0Yv2/+
         Upow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590860; x=1796195660;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS4S/3wgJzlNANveRHhJ0JCqQT7lj4OoQJmmJFDLZnQ=;
        b=nWwSiuHrvjguw8Tl8IajFOQPR0HNWckjve4N5KPwn7tZewYQKTpmXdqdtkc/l5DQI4
         /o9seS+e0taQUcchT0SZyDVA2EjYsvJFTxFmQFDmJL6vpXsnkbxcYLLD3pxJzAFt4ouo
         4adIodFXbOt0ewBc3mQFc8V9jo4ODbv27+2hwjJ8kBhFfwJnSBt0XirmWDWEtycCrj2N
         nGKfHTZEpy+AsIyN+s1PldyjLgAkwqatySKSNaE0arrl1xnfEmsx1mqAZbc4R1OBIZq6
         iklk2YlMLy9qHP4yyBvzUstHAvS37Fs2nKoXvSfK+Ut0zb5q3f2A/hkg4VJPCyG8rq+f
         LIWw==
X-Forwarded-Encrypted: i=1; AL+hErGWT7Gzyg1jGq9Og+J5zx4Ni+9F/AyvZaT0TOkLhY8iBf5qil12DTsceG1uNa17KwKRrV7qess=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S2SrFm2E+hdstcNNkM6CNdBscDwi41ZGNivdO6OuPbprVClji
	hVG/dt9uzDVXl4Fc7Xazm8M6y38gCXXSn1Ijs2ez7kMzTn/r+Nt6KSJv0e5fK70fRaE=
X-Gm-Gg: AZFdTZeyrjVXhgMnIMis/Nd4VQ9qEHRNQqaVxqVlwhR8xlEvM+w2qG1AgSBAMn1bcPh
	IHjpqYCqxpzx+tkMYjIOR6CFRgWBk5ym44z7kx3ww7YDv6cyHn2ttvWMIapmBwEg+VwH2q+gBDM
	BrX3SxTwe5cSekhyfixxxrWTAcVItaHIehnBTFR2a7v6WjfjbnV4gU5t4crE/ewxuw3paupY9Ll
	1c2Au9k2egmlxqWdJTqJfWU/d0kbnXB1Y+JTP7vCpGGZJmNVdKNaoCAynmZ9/RXdE12/EuQgxW6
	m9WsX9FA0OHBoekDYt90YnnX6kSpDgYY2bvjjIC5rFPSRtRcOn5dkHCm3NhO3JaxOKwtJivvd1q
	K6qlb32pc9VGOj+btpLn3hCAIxGfQc+F7VzV2yNKr0cqyHhOtxOSjVDZ0FYhow6n9uCi4grrMCg
	UsTUxhlwqchq9Hsh/mwVBt685e8EgAwOMeFis/wqIF48XnN/h5smRHGtvqMzgFZLduzi6yhv4i+
	J9kv+jGoJDZQUAes8qKDsZtFnxd9mjWKDbdI18R8QkRrCXfXqguJ5Jvt9edFoZjwRp4bEKenTBt
	scv00YhfNny3Wc3GpSPkMCOGu0xqN6DEj1+wo8PscBws6AU+uR7H5yXJGD0=
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr301676605e9.8.1795590859967;
        Tue, 24 Nov 2026 23:14:19 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm582103175e9.11.2026.11.24.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 23:14:19 -0800 (PST)
Message-ID: <654889ea-3b83-4fd4-b283-184f87b3d208@blackwall.org>
Date: Wed, 25 Nov 2026 09:14:17 +0200
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
Content-Language: en-US, bg
To: Lin Jiapeng <ljp1205831794@gmail.com>, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, sfeldma@cumulusnetworks.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20261124024319.52145-1-ljp1205831794@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261124024319.52145-1-ljp1205831794@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 04:41, Lin Jiapeng wrote:
> From: Lin Jiapeng <jiapenglin@tencent.com>
> 
> The 802.3ad enslave path binds a slave before publishing it in the bond's
> slave list. The periodic state machine can select the port and attach it to
> a LAG while enslavement is in progress, including while NETDEV_CHANGEUPPER
> notifiers are running.
> 
> If enslavement fails, rollback can free ad_slave_info without unbinding its
> port and leave later LAG processing with a dangling pointer. This affects
> both a failed upper-link notification and later failures such as
> bond_sysfs_slave_add(). A test-only kretprobe forces the latter to return
> -ENOMEM, after which KASAN reports:
>       BUG: KASAN: slab-use-after-free in ad_agg_selection_logic+0x1a0d/0x1fa0
>       Read of size 1 by task kworker/u16:0/13
>       Freed by task 110:
>         kfree
>         slave_kobj_release
>         kobject_put
>         bond_enslave
> 
> Drain the RX handler before unbinding so receive handlers cannot race with
> port->slave becoming NULL. Unbind before upper unlink when the link exists,
> and also unbind after an upper-link failure without repeating the unlink.
> Rebuild the slave array after aggregator changes and leave earlier
> unpublished failures unchanged.
> 
> Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Link: https://lore.kernel.org/netdev/20261113130454.63032-1-ljp1205831794@gmail.com/
> ---
> v1 -> v2:
>    - Drain the RX handler before unbinding to avoid NULL dereferences in the
>      802.3ad receive path.
>    - Cover NETDEV_CHANGEUPPER failure after transient upper-link publication,
>      without repeating upper-dev unlink.
>    - Rebuild the 802.3ad slave array after rollback.
> 
>   drivers/net/bonding/bond_main.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index e9f5e753f677..7ca948bb27d0 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2355,10 +2355,21 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   	bond_sysfs_slave_del(new_slave);
>   
>   err_upper_unlink:
> +	netdev_rx_handler_unregister(slave_dev);
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +		bond_3ad_unbind_slave(new_slave);
>   	bond_upper_dev_unlink(bond, new_slave);
> +	goto err_update_slave_arr;
>   
>   err_unregister:
>   	netdev_rx_handler_unregister(slave_dev);
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +		bond_3ad_unbind_slave(new_slave);
> +
> +err_update_slave_arr:
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD &&
> +	    bond_update_slave_arr(bond, new_slave))
> +		bond_slave_arr_work_rearm(bond, 0);
>   
>   err_detach:
>   	vlan_vids_del_by_dev(slave_dev, bond_dev);
> 
> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea

This looks awful jumping around error labels and doing the same thing
at different places. Surely you could rearrange them better, maybe
something like this (untested, needs proper review):
--- a/drivers/net/bonding/bond_main.c
   +++ b/drivers/net/bonding/bond_main.c
   @@ -1888,10 +1888,11 @@
    int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
                  struct netlink_ext_ack *extack)
    {
   +     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
         struct bonding *bond = netdev_priv(bond_dev);
   -     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
         struct slave *new_slave = NULL, *prev_slave;
         struct sockaddr_storage ss;
   +     bool upper_linked = false;
         int res = 0, i;
  
         if (slave_dev->type == ARPHRD_CAN ||
   @@ -2246,13 +2247,14 @@
                 slave_dbg(bond_dev, slave_dev, "Error %d calling bond_master_upper_dev_link\n", res);
                 goto err_unregister;
         }
   +     upper_linked = true;
  
         bond_lower_state_changed(new_slave);
  
         res = bond_sysfs_slave_add(new_slave);
         if (res) {
                 slave_dbg(bond_dev, slave_dev, "Error %d calling bond_sysfs_slave_add\n", res);
   -             goto err_upper_unlink;
   +             goto err_unregister;
         }
  
         /* If the mode uses primary, then the following is handled by
   @@ -2357,11 +2359,15 @@
    err_sysfs_del:
         bond_sysfs_slave_del(new_slave);
  
   -err_upper_unlink:
   -     bond_upper_dev_unlink(bond, new_slave);
   -
    err_unregister:
         netdev_rx_handler_unregister(slave_dev);
   +     if (BOND_MODE(bond) == BOND_MODE_8023AD) {
   +             bond_3ad_unbind_slave(new_slave);
   +             if (bond_update_slave_arr(bond, new_slave))
   +                     bond_slave_arr_work_rearm(bond, 0);
   +     }
   +     if (upper_linked)
   +             bond_upper_dev_unlink(bond, new_slave);
  
    err_detach:
         vlan_vids_del_by_dev(slave_dev, bond_dev);



