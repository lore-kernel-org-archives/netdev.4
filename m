Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590047;
	b=UGkBwWrBW49/2vDlqxKOkfJp8mMK+G1zhUthheBeZ1M756Q4GqDx6aY0WAGrdK7gYgDL
	 9hAjSJGrS3kEvQXN42G72sBCrNGJpolXKMYFFL/2k/ScP+18HAVj1OgC3lF85G/Isz8Y7
	 jXhZf+13a/mS7YLMRi20JIKKOF360tBb+QaOhQ/DHfw0A8LSgAjQeo5W+731ZRLUrhEe0
	 qj3vli8Ch/8gPw1pykLfPkB46wNzSaWi5Nr8cEtajej6s6ZdUTwVYxSEKqO2m8Ypg/Bul
	 D9CZXVJEV5sof0FHA/hFvOhahEzeZvf+2C8VGLWwssPHnvAKTcVutkixOElJrmBIntQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590047;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
	bh=m1q9khOarWhPvFmmpMt92L2bFshdQUMvx9wv6wCJtYU=;
	b=ZtgeG6DhbZRPdoBUXigvifmrsg90wHi+3TynmBMqG5uFQ/iqh3xCI9MvnuzFWwTEmCYx
	 Rw5tbPE/mr1kAijU/8ykY6BhQn8qYRQN6g1GObgvD003xwHwt2A+59ZPQwV913yxu4Oc+
	 9hMfn8UQIPz8ollPaVnCVLA+uUi5UiXiN/uHnZTnPjlwaz2YNMrldpXp5ZUY6RlnQun9/
	 n0DfgLeeZEgC4wk9Lh9TNh47pMaRs/wulHBlfRi0IkBsEOloTBVftjG18a9U8EXWf/inZ
	 qgZq6LtpMiFz713IRgoiVA3wB3W7Yh0+rw1EJj2Smu0hwal5P85o9sxXjFzgYhnTIIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5GWbwqXh;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8998606A329;
	Wed, 25 Nov 2026 07:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8998606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5GWbwqXh
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m1q9khOarWhPvFmmpMt92L2bFshdQUMvx9wv6wCJtYU=;
	b=5GWbwqXhtlsmZckgqSs888Rnd8UTfhq/1wGM5l1/RxArQ+p6LmQUAqS0TtYBgw62s2YAY0OeW
	n2Cg18PIZIopLR787jRzd7VxS5PLbe4w7Vkt80f6qyD4cTBd0jTF2xyykillALnqrz5PxHpsvcs
	YThIu/XXv2RJeveRruqwPmQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jZ9YM1Bxrz1prqH;
	Wed, 25 Nov 2026 15:00:23 +0800 (CST)
Received: from whupemp200008.china.huawei.com (unknown [7.152.184.21])
	by mail.maildlp.com (Postfix) with ESMTPS id 21D3C40561;
	Wed, 25 Nov 2026 15:00:40 +0800 (CST)
Received: from [10.174.176.113] (10.174.176.113) by
 whupemp200008.china.huawei.com (7.152.184.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 25 Nov 2026 15:00:38 +0800
Message-ID: <3001f950-9693-4f71-aabc-41b741af865b@huawei.com>
Date: Wed, 25 Nov 2026 15:00:37 +0800
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
Subject: Re: [PATCH net] bonding: clear stale usable_slaves in broadcast mode
To: Hangbin Liu <hangbin.liu@linux.dev>
CC: <netdev@vger.kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Hangbin Liu <liuhangbin@kylinos.cn>, Changzhong Zhang
	<zhangchangzhong@huawei.com>, <linux-kernel@vger.kernel.org>
References: <20261124130102.18807-1-jiangjiehua1@huawei.com>
 <20261125012632.GB19338@Liu-laptop>
Content-Language: en-US
From: "jiangjiehua (A)" <jiangjiehua1@huawei.com>
In-Reply-To: <20261125012632.GB19338@Liu-laptop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemp200008.china.huawei.com (7.152.184.21)


Hi Hangbin,
On 11/25/2026 9:26 AM, Hangbin Liu wrote:
> Hi Jiehua,
> On Tue, Nov 24, 2026 at 09:01:02PM +0800, JiangJieHua wrote:
>> In broadcast mode, bond_set_slave_arr() frees the usable_slaves argument
>> and returns early, but does not clear bond->usable_slaves.
> 
> Since the issue was introduced in bond_set_slave_arr(). Should we set
> the bond->usable_slaves to NULL here before return?

Clearing bond->usable_slaves in bond_set_slave_arr() does fix the leak,
but it is too late for updelay: bond_enslave() links the new slave via
bond_master_upper_dev_link() before calling bond_update_slave_arr(),
so miimon can already see the slave while the stale empty array is
still there and skip updelay.

Clearing when the mode changes to broadcast happens while the bond is
down with no slaves and mii_work has already been canceled, so the
stale pointer is gone before any new slave is visible.  That fixes both
the leak and the updelay issue.

Thanks,
Jiehua

> 
> Thanks
> Hangbin
>> 
>> A mode change requires the bond to be down with no slaves.  When the
>> last slave is removed in balance-xor, balance-tlb or balance-alb,
>> bond_update_slave_arr() publishes an empty usable array, and later mode
>> changes do not clear it.  If the bond is switched to broadcast, the
>> stale pointer remains: bond_miimon_inspect() sees count == 0 and
>> ignores updelay for slaves enslaved while the stale array remains, and
>> bond_uninit() leaks the array.
>> 
>> Clear bond->usable_slaves when the mode is changed to broadcast.  The
>> bond is down and has no slaves at that point, so the array can be freed
>> and set to NULL before the bond is brought up again.  Broadcast never
>> publishes usable_slaves, so it stays NULL.
>> 
>> The issue was discovered by an AI code review agent and confirmed by
>> manual code inspection.  It was reproduced on mainline with virtme-ng;
>> no kernel modifications or error injection were needed.  With a dummy
>> slave and miimon=1:
>> 
>>   ip link add bond0 type bond mode balance-xor miimon 1 updelay 1000
>>   ip link add dummy0 type dummy
>>   ip link set bond0 up
>>   ip link set dummy0 master bond0
>>   ip link set dummy0 nomaster
>>   ip link set bond0 down
>>   ip link set bond0 type bond mode broadcast
>>   ip link set bond0 up
>>   ip link set dummy0 master bond0
>> 
>> After the final enslavement, dummy0 comes up within 50 ms despite
>> updelay=1000 (20 of 20 runs on the unpatched kernel).  With the fix,
>> none of 300 runs skipped updelay.  The bonding mode-2 recovery-updelay
>> selftest passes on the same kernel.
>> 
>> Fixes: 45fc134bcfad ("bonding: do not set usable_slaves for broadcast mode")
>> Signed-off-by: JiangJieHua <jiangjiehua1@huawei.com>
>> ---
>>  drivers/net/bonding/bond_options.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/net/bonding/bond_options.c b/drivers/net/bonding/bond_options.c
>> index 9efadeff6a22..f65916444fa1 100644
>> --- a/drivers/net/bonding/bond_options.c
>> +++ b/drivers/net/bonding/bond_options.c
>> @@ -936,6 +936,14 @@ static int bond_option_mode_set(struct bonding *bond,
>>  	WRITE_ONCE(bond->params.arp_validate, BOND_ARP_VALIDATE_NONE);
>>  	WRITE_ONCE(bond->params.mode, newval->value);
>>  
>> +	if (newval->value == BOND_MODE_BROADCAST) {
>> +		struct bond_up_slave *usable;
>> +
>> +		usable = rtnl_dereference(bond->usable_slaves);
>> +		RCU_INIT_POINTER(bond->usable_slaves, NULL);
>> +		kfree_rcu(usable, rcu);
>> +	}
>> +
>>  	/* When changing mode, the bond device is down, we may reduce
>>  	 * the bond_bcast_neigh_enabled in bond_close() if broadcast_neighbor
>>  	 * enabled in 8023ad mode. Therefore, only clear broadcast_neighbor
>> -- 
>> 2.33.8
>> 

