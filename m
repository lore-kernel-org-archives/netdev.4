Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419226;
	b=iOsNcAy1mHUqd4QnMpkHKRVWCwlmypH56/QjCxmecv9nwqIhCvyktaaMaxYzOaDZ7H7c
	 CnPTGX9E2+yuBmzGu/rL3O77qyVEkqHbe1e/qnCFeNq0HMiQ6LAdo4LWePB1SuZYB1VIy
	 0ygXPrXMv275EGSgsRsZCcDGjWDeAarJoDZ39wJ/8pIodmop/S1Kz0NPkloiZTyX8seE3
	 WAsBkirY+f2jg83zDk1aB+bc1pn28Th9iUQ/Sx4A2xPtaF+YHt/Xmrfv3qg6Nk5hjdlM6
	 6j8alq20f9MYDztjZpoYdglfKfzG6OLH2wXwW3YVnGQ6WZItud9FJwILyD2B15MjeLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419226;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Tu2DqMM+ZYfQaMG7ADHRtxgkDLAvEOYaekIz0Cq8T3Q=;
	b=bwUTorKkNun+9sOmkGEd5/UGzrwi6rZVSj8+oTah5otbN88Ti2frJtlho9xgKkO1x8tu
	 Ocg5ShaAQeVwbRt8QqA6egzXZfxRoEvMgFGfHMlnKZa+/P5SU6xTBRux5nZzjmwcA6krc
	 hvJKAx7e3RiGSTdURCHGtrh6C9TPJOiafz+BtNa95JmU1L55dUXb9fuZIT+x5hjxpoEG6
	 FsIMYKXMMwbyaq93T2Iu/qLa7kGuGNVy/pb1BVqeACwbfwKgVQLMOyYaPbaoqAFZpF06s
	 aIIEiDPj+2yY+uWWUY2ptqP51IXDrk2ZPLPYsYEFgcwl4H8ogzHkF8wmZbBgY1R+zSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="LE/qs1ME";
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E760D606A31E;
	Mon, 23 Nov 2026 07:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E760D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LE/qs1ME
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Tu2DqMM+ZYfQaMG7ADHRtxgkDLAvEOYaekIz0Cq8T3Q=;
	b=LE/qs1MEjoNp8+qbJatKZUj69K/AIAohvCbKhGKps6xkHt1HlPP8mvGjPnCYBhKa7t/1Jgddo
	vK1H8qyimiz3bupdCzAqC4wg773aruaJFUG2HLvULx9nmSX9pVPXxgMbSdbFEv0u3ZZLInafX0W
	L7rF3L9u3MY/Sptv5n1g8E8=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jXyNN1B5bz1K9Vq;
	Mon, 23 Nov 2026 15:33:24 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id D277D40586;
	Mon, 23 Nov 2026 15:33:40 +0800 (CST)
Received: from [10.67.121.233] (10.67.121.233) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 15:33:40 +0800
Message-ID: <a727a596-2718-4aaa-8baf-69b1aee9df43@huawei.com>
Date: Mon, 23 Nov 2026 15:33:39 +0800
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
CC: <shaojijie@huawei.com>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <andrew+netdev@lunn.ch>,
	<shenjian15@huawei.com>, <liuyonglong@huawei.com>, <chenhao418@huawei.com>,
	<yangshuaisong@h-partners.com>, <ningwei15@huawei.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 net 3/4] net: hns3: fix interface stuck after OOM with
 full hardware rx queue
To: <netdev-bot+sashiko@kernel.org>
References: <20261118130330.3026625-4-shaojijie@huawei.com>
 <179535384062.3135.791733868582964041@kernel.org>
From: Jijie Shao <shaojijie@huawei.com>
In-Reply-To: <179535384062.3135.791733868582964041@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo500018.china.huawei.com (7.202.195.199)


on 2026/11/22 21:24, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 · High: 1 · Medium: 2 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] hns3_oom_task() (hns3_enet.c:4456-4470) reads
>    HNS3_NIC_STATE_DOWN once into the local `down` at entry.
> - [Medium] The patch adds a new private ethtool -S string,
>    HNS3_TQP_STAT("rx_oom_cnt", rx_oom_cnt), to hns3_rxq_stats[] in…
> - [Medium] rx_oom_cnt can be incremented twice in one NAPI poll, which
>    contradicts the stated v5 semantics ("Count rx_oom_cnt for each NAPI…
>
> --
>
> net: hns3: fix interface stuck after OOM with full hardware rx queue
>
> This patch adds a 250ms delayed_work that re-schedules NAPI for RX rings
> that hit an allocation failure. A per-ring bitmap tracks those rings. The
> patch also replaces the earlier approach of returning budget from
> hns3_clean_rx_ring() on allocation failure, and adds a per-ring rx_oom_cnt
> ethtool counter.
>
>> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
>> index 5677e32fc3da4..60fc296020ab2 100644
>> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
>> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
> [ ... ]
>
>> @@ -4161,6 +4163,7 @@ static int hns3_add_frag(struct hns3_enet_ring *ring)
>>   			if (unlikely(!new_skb)) {
>>   				hns3_rl_err(ring_to_netdev(ring),
>>   					    "alloc rx fraglist skb fail\n");
>> +				hns3_ring_set_oom_state(ring);
>>   				return -ENXIO;
>>   			}
>>   
>> @@ -4450,6 +4453,30 @@ static int hns3_handle_rx_bd(struct hns3_enet_ring *ring)
>>   	return 0;
>>   }
>>   
>> +static void hns3_oom_task(struct work_struct *work)
>> +{
>> +	struct hns3_nic_priv *priv = container_of(work, struct hns3_nic_priv,
>> +						  oom_task.work);
>> +	bool down = test_bit(HNS3_NIC_STATE_DOWN, &priv->state);
>> +	struct hnae3_handle *h = priv->ae_handle;
>> +	struct hns3_enet_ring *ring;
>> +	u16 i;
>> +
>> +	for (i = 0; i < h->kinfo.num_tqps; i++)
>> +		if (test_and_clear_bit(i, priv->rx_ring_oom_bm) && !down) {
>> +			ring = &priv->ring[i + h->kinfo.num_tqps];
>> +			napi_schedule(&ring->tqp_vector->napi);
>> +		}
>> +}
> [Severity: High]
> Can the stale down value here lose a recovery bit that was set after the
> interface came back up?
>
> hns3_nic_net_down() doesn't cancel oom_task, so an instance can still be
> running while hns3_nic_net_up() runs. Consider this sequence:
>
> hns3_oom_task()
>    down = test_bit(HNS3_NIC_STATE_DOWN, ...);   /* true */
>    <preempted before reaching ring i>
>
>                      hns3_nic_net_up()
>                        clear_bit(HNS3_NIC_STATE_DOWN, &priv->state);
>                        hns3_enable_irqs_and_tqps(netdev);
>
>                      NAPI poll on ring i, allocation fails
>                      hns3_clean_rx_ring()
>                        hns3_ring_set_oom_state(ring);  /* sets bit i */
>                        hns3_oom_task_schedule(ring);   /* queues new run */
>                        return recv_pkts;               /* NAPI completes */
>
> hns3_oom_task() resumes
>    test_and_clear_bit(i, ...) returns true, but down is still true,
>    so napi_schedule() is skipped and bit i is now clear
>
> 250ms later the newly queued instance finds bit i clear and does nothing.
>
> hns3_clean_rx_ring() now returns recv_pkts instead of budget, so NAPI has
> already exited. If ring i has no armed RX buffers left, the hardware won't
> raise another RX interrupt. Wouldn't the ring then stay stuck? That is the
> condition this patch is meant to fix.
>
> The commit message says:
>
>    If it runs while DOWN is set, it clears the per-ring bits without
>    scheduling NAPI. [ ... ] Both outcomes are harmless.
>
> That doesn't seem to hold for this interleaving. Two possible ways to
> close the window:
>
> - return early without clearing any bits when DOWN is set, or
> - re-check DOWN after each test_and_clear_bit() and set the bit again.
>
> Would either of these work here?

I don't think this is reachable.  hns3_nic_net_up() rebuilds the rings
before it clears HNS3_NIC_STATE_DOWN:

	ret = hns3_nic_reset_all_ring(h);
	if (ret)
		return ret;
	clear_bit(HNS3_NIC_STATE_DOWN, &priv->state);

If the rebuild fails, DOWN stays set and net_open() returns an error, so
the interface never comes up.  If it succeeds, hns3_nic_reset_all_ring()
calls hns3_reuse_buffer() on every descriptor, so the ring is full when
the interface comes up.


>
>> +
>> +static void hns3_oom_task_schedule(struct hns3_enet_ring *ring)
>> +{
> [ ... ]
>
>> @@ -4489,10 +4519,15 @@ int hns3_clean_rx_ring(struct hns3_enet_ring *ring, int budget,
>>   	 * FBD number with head pointer
>>   	 */
>>   	if (unused_count > 0)
>> -		failure = failure ||
>> -			  hns3_nic_alloc_rx_buffers(ring, unused_count);
>> +		failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
>> +
>> +	if (unlikely(failure))
>> +		hns3_ring_set_oom_state(ring);
> [Severity: Medium]
> Can rx_oom_cnt be incremented twice in a single NAPI poll here?
>
> The commit message says the counter is "incremented for each NAPI poll
> that hits an RX allocation failure". When the fraglist napi_alloc_skb()
> fails in hns3_add_frag(), the path looks like this:
>
> hns3_clean_rx_ring()
>    hns3_handle_rx_bd()
>      hns3_add_frag()
>        hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ */
>        return -ENXIO;
>    goto out;
>    failure |= hns3_nic_alloc_rx_buffers(ring, unused_count);
>    if (unlikely(failure))
>        hns3_ring_set_oom_state(ring);   /* rx_oom_cnt++ again */
>
> -ENXIO doesn't match the new err == -ENOMEM check. But failure can still
> be true, either from a failed exit refill or from an earlier failed
> in-loop refill. Under the memory pressure that caused the fraglist
> failure, the refill is likely to fail too.
>
> hns3_ring_set_oom_state() has no per-poll dedup, so in this case the
> counter goes up by two for one poll.

The second increment only happens when a second allocation actually
failed.  hns3_add_frag() counts its failed napi_alloc_skb() and returns
-ENXIO, which doesn't set `failure`, so the exit refill still runs and
bumps the counter again only if it fails too.  Two increments mean two
failures.  I agree "for each NAPI poll" can read as at most once per
poll, that's just imprecise wording.


>
> [ ... ]
>
>> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
>> index 7b92a3c73ef6d..14642f81efe1a 100644
>> --- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
>> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
>> @@ -62,6 +62,7 @@ static const struct hns3_stats hns3_rxq_stats[] = {
>>   	HNS3_TQP_STAT("non_reuse_pg", non_reuse_pg),
>>   	HNS3_TQP_STAT("frag_alloc_err", frag_alloc_err),
>>   	HNS3_TQP_STAT("frag_alloc", frag_alloc),
>> +	HNS3_TQP_STAT("rx_oom_cnt", rx_oom_cnt),
> [Severity: Medium]
> Should this value go through the standard per-queue rx-alloc-fail qstat
> rather than a new ethtool -S string?
>
> hns3_ring_set_oom_state() increments rx_oom_cnt on RX skb and buffer
> allocation failures. That is the event the alloc_fail field of struct
> netdev_queue_stats_rx tracks. Documentation/netlink/specs/netdev.yaml
> describes rx-alloc-fail as:
>
>    Number of times skb or buffer allocation failed on the Rx datapath.
>    Allocation failure may, or may not result in a packet drop, depending
>    on driver implementation and whether system recovers quickly.
>
> The commit message says:
>
>    It is a diagnostic counter for this recovery path, not the standard
>    rx-alloc-fail qstat.
>
> Counting per poll instead of per allocation looks like a granularity
> choice, and the standard definition leaves that choice to the driver.
>
> hns3 doesn't implement netdev_stat_ops or get_queue_stats_rx yet.
> Implementing them would expose this value through the standard uAPI.
>
> The same failures already increment the existing sw_err_cnt ("dropped")
> counter in hns3_alloc_skb() and hns3_nic_alloc_rx_buffers().
>
> This patch carries a Fixes: tag, and the new user-visible counter makes it
> harder to take through the net tree as-is. Could the counter be split out
> of this fix?

I answered this in v4 and the reasoning still holds.  hns3 has no
netdev_stat_ops, alloc_fail is an exact failure count while this is a
diagnostic for the recovery path, and the existing per-queue stats and
customer tooling read ethtool -S.  The new string is additive and
doesn't change any existing one.



