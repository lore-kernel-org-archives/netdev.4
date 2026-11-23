Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426103;
	b=qTKtMxZ+DaERDo2SutSWppWlYFWxfS3jmWBHSOBZphTccugwmDEX/hneyBonaUkby1er
	 iJHNFPo7CRED5QwmKySu4JlXGifX9KPRMxrf09zfLj4Sq/Qju6ElnNC/E79LniG0wi8dk
	 eZY6cwMCaiiyEPZ7IFgwn6FeOvN/iq1Fyv88jBH0LpUFG8aCKkE+QXWCw3cWlhyv3anLV
	 EPRVhB1Nq1CqQXK4mFfwTK7spVWstY+vSwWNj3hC9CHJmzCCl70JMk2zto8WgLgFQFd3W
	 Wh+/B0hJZrfEFsgMn1BDn5v5HeurA0Jogox8G8cxW4DI9a56RlG1kWquTXPDbDozsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=a9kNFv3i6DzeVLwuA4+zA4l2VEe2BPXfCCuP+XtEJik=;
	b=jWwK4tvVcPDdkv7s3OOzorpo5C+kJ91ldcosbYBLywpKuysRiyKJ6GFdNL8zrx/sGtVb
	 W7R7nyVAPiBQ293bNTsyxDFFJjiJiAJ+8SfaCSJfpG6AfxpCoPxq31iAlHB87g4NtTaKX
	 uNPCWJq2ABqN9KqA5WE2V7d9hb+hgC7sLhLmQ03dNsPbQ3z3d6KI9n2WuVlQtnVvZZH4d
	 u9Woms69WcrNig3TW8mjbmJ1M2zJMaHEoJpiQ4fkOO179Hxp6lneQeC3utMl8GpwIo9yv
	 SZPhuRLucZUVNbAVZud4M9J9Kdw/Mr6skL2NegzrMjrjrrjdpGPxYzIh96PVXDvKa1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+jZhfGf;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CF7606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CF7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+jZhfGf
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1471856a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426103; x=1796030903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a9kNFv3i6DzeVLwuA4+zA4l2VEe2BPXfCCuP+XtEJik=;
        b=L+jZhfGfpdi6MbR4YSG/gT5HFuK72uh/Hlo1eqRCLKYI6XjKyW7fSNVa2vD6CoLL7X
         WJ+ytAgDrebm4yfciaepOPJE/wMR1QqzkGp1Y5qWWDTmdDQwdCNDFWepVPbZlK6pAvf9
         KXKjmqGmydB8Nvbi/q6wNsVrMd6H1HMCF3+OYqqd/CJge9hme+Cmrfsb5tKqDV0dqYme
         xvyU6gT9TSnK578BBXwFpgaFg/Gye9wDOXiRcEgKXt0UNKmUAv8pTheYVX7OZ66sebBJ
         Lyi2ekCXyXxNreBO3nmBrqFoF7cpIY3bwMF914v1p9s6Xz/4LwldGUPcu346TnXqNIKn
         05JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426103; x=1796030903;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9kNFv3i6DzeVLwuA4+zA4l2VEe2BPXfCCuP+XtEJik=;
        b=i+JRGw2muL4lBWjAb7VBcoggBFuQ45k1imb1FnB5GVgoaLov621tC2nsJqZJA0l+v2
         19VsrDzlZxG9g+mS67FAEK+f5eZVZQ0WcOwaokDWANN2iQtSx56NhAU2HjUDtL67/dU1
         U0eBul/WOA/dOJ7vSoctGaAQin8fAxXo+7D0Q5dDcVJ+rqREKLV/scA4wTN5yFCwxGlF
         xRoJNnfZi2AwpzXA8TgYLdrgwM3mflIV12NMpf+Uxv5RqJpyi+Ii/odrtH89IQtkvp5I
         b9ibk0cbET4t3v/PVh7u3hzDDI3cnmtPmiROxKYkF7Eu0Cf5l1YatQl2u8KKxNDm/8BF
         mNKg==
X-Forwarded-Encrypted: i=1; AL+hErG6dr0hcQjc1IW10vyRRM5XvKxoIoU00JJAdpac3erik9qBm1Vlk3UlxvODmlHWWz1dfzGR6Jc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N9RYt43yRaTRKWHDYCAUlZX0/rmuqGCuf4D0GyTS4UH2ZHzvE
	NjLQop8QPfDsNPhKduuTEAjquYt40tkgvQjONyozC/iAUDZNkAK7jPAkoL/e7S2YwiY=
X-Gm-Gg: AZFdTZfA81Y3LKpEsLU/tDqbA3SIbzeFRHd46RkUhiyOVUxnwzRg7uhW/K5CSkZPiwR
	hveIQwPlAeqE6kwA9kcMAZJvBmJooNvMaYc56/g4FD4AqXSMlTU071Q1FUNOUOG9hnixkVszq7S
	PSOzOTvcMDRj0Pcz0PAqL5qiUSAJ6BYLreJAGrN5X1PRkUnQ0aViXhKCRKuFqI6m3jvuuYO9J6t
	+mEwhgkQKw/1TvR4U7dUFSd+MaiqGI95jZxjbTcnVx5vTowSxreLVjVEbS0fSpShPjhKF9Xiw9g
	RopC26AE36+GdLHqdLsCcxKPyXt0aYyw6IMTXXTGcDTCZWRuMV/8UMMC97GmdBPIYG9EW0c9rMe
	gsgDy39g/uMJml9Tmo7X2nXrHCvHvnnK1VXmmepLwyDYR7TfnHYlrSlsoaCiSS8+NidCOkFxJFQ
	aihd6n9oL+0mbKmEcRF9ZTfTkSnE3SQVhJBW3mkLuE9ioM03VKuJWfTpcZEMPfL6fW3YgVIGp4I
	8wjtVEzSoA7cCWxNZYiQ7BFThD+bbUbS/wNHSMXddSJvnQK0+e7zd3q/9utpVOwHpugfcz2/gmE
	2POrRWXw5Vflb2aDD+z3nbBVfJQM7/BBDOhDh71hFvJBReQdmsagzlKcLaWw
X-Received: by 2002:a17:90b:1dcd:b0:3b4:1bf1:988a with SMTP id 98e67ed59e1d1-3b41c975107mr9420575a91.55.1795426102533;
        Mon, 23 Nov 2026 01:28:22 -0800 (PST)
Received: from [192.168.255.10] ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm17576817a91.12.2026.11.23.01.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:28:22 -0800 (PST)
Message-ID: <174ac01e-d542-4a83-8ccb-f95eb9e65a50@gmail.com>
Date: Mon, 23 Nov 2026 17:28:18 +0800
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
Subject: Re: [PATCH] bonding: unbind 802.3ad slaves on enslave failure
To: netdev-bot+sashiko@kernel.org
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 sfeldma@cumulusnetworks.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiapenglin@tencent.com, corvus@tencent.com
References: <20261113130454.63032-1-ljp1205831794@gmail.com>
 <179492298736.3136.7707420195276794847@kernel.org>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <179492298736.3136.7707420195276794847@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-11-17 9:43 p.m., netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 (1) · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix is incomplete: a failed bond_master_upper_dev_link()
>    skips the new unbind and leaves the same use-after-free reachable.
> - [High] The new bond_3ad_unbind_slave() call can cause a NULL pointer
>    dereference in the RX softirq path.
> - [Medium] The new caller breaks bond_3ad_unbind_slave()'s 'caller
>    updates array' contract.
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the same
>    publish-then-fail window leaves TLB/ALB hash entries pointing at the…
> 
> --
> 
> bonding: unbind 802.3ad slaves on enslave failure
> 
> This commit adds a bond_3ad_unbind_slave() call at the err_upper_unlink
> label of bond_enslave() in 802.3ad mode. If the state machine attached the
> new slave's port to a LAG during enslavement, the port is now detached
> before the slave is freed. This addresses a KASAN slab-use-after-free in
> ad_agg_selection_logic() seen when bond_sysfs_slave_add() fails.
> 
>> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
>> index e9f5e753f6770..60cc9a6a4fc7d 100644
>> --- a/drivers/net/bonding/bond_main.c
>> +++ b/drivers/net/bonding/bond_main.c
>> @@ -2355,6 +2355,8 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>>   	bond_sysfs_slave_del(new_slave);
>>   
>>   err_upper_unlink:
>> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +		bond_3ad_unbind_slave(new_slave);
> 
> [Severity: High]
> Can this unbind race with the 802.3ad receive path and cause a NULL pointer
> dereference in softirq context?
> 
> At err_upper_unlink, bond_handle_frame() is still registered as the
> rx_handler for slave_dev. netdev_rx_handler_unregister() drains in-flight
> handlers through synchronize_net(), but it only runs later, at
> err_unregister.
> 
> bond_3ad_rx_indication() checks port->slave without holding mode_lock:
> 
> drivers/net/bonding/bond_3ad.c:bond_3ad_rx_indication() {
>      ...
> 	port = &(SLAVE_AD_INFO(slave)->port);
> 	if (!port->slave) {
> 		...
> 		return ret;
> 	}
>      ...
> 		spin_lock(&slave->bond->mode_lock);
> 		ad_rx_machine(lacpdu, port);
>      ...
> 			ad_marker_info_received(marker, port);
>      ...
> }
> 
> Both callees dereference port->slave right away:
> 
> drivers/net/bonding/bond_3ad.c:ad_rx_machine() {
>      ...
> 	if (lacpdu) {
> 		atomic64_inc(&SLAVE_AD_INFO(port->slave)->stats.lacpdu_rx);
>      ...
> }
> 
> drivers/net/bonding/bond_3ad.c:ad_marker_info_received() {
>      ...
> 	atomic64_inc(&SLAVE_AD_INFO(port->slave)->stats.marker_rx);
>      ...
> }
> 
> bond_3ad_unbind_slave() sets port->slave = NULL under mode_lock. For a
> LACPDU, the RX CPU can pass the check, spin on mode_lock while the unbind
> runs, and then call ad_rx_machine() after port->slave is already NULL. The
> marker handlers don't take mode_lock at all.
> 
> __bond_release_one() avoids this by draining RX first:
> 
> 	/* unregister rx_handler early so bond_handle_frame wouldn't be called
> 	 * for this slave anymore.
> 	 */
> 	netdev_rx_handler_unregister(slave_dev);
> 
> 	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> 		bond_3ad_unbind_slave(slave);
> 
> The commit message says this "preserves the invalidate-drain-free ordering
> used by normal release". Here, though, port->slave is cleared before the
> drain. Should the unbind come after netdev_rx_handler_unregister()?
> 
> One deterministic way to reach this rollback is the XDP check in
> bond_enslave(). With an XDP program on the bond and one already loaded on
> the slave, the code jumps to err_dec_slave_cnt and falls through to
> err_upper_unlink.
> 
> [Severity: Medium]
> Does this rollback leave bond->usable_slaves stale?
> 
> bond_3ad_unbind_slave() discards the update_slave_arr result from
> ad_agg_selection_logic() and expects the caller to rebuild the array:
> 
> 	bool dummy_slave_update; /* Ignore this value as caller updates array */
> 
> __bond_release_one() does this by calling bond_update_slave_arr() after the
> unbind and unlink. In bond_enslave(), bond_update_slave_arr() is only called
> on the success path, so nothing in the rollback rebuilds the array.
> 
> The unbind can reselect the active aggregator, for example when the new
> port was already in the active aggregator. In that case
> ad_agg_selection_logic() can disable the old aggregator's ports and enable
> the new one's.
> 
> Wouldn't bond_3ad_xor_xmit() then keep using the old usable_slaves until
> some other event forces a rebuild?
> 
>>   	bond_upper_dev_unlink(bond, new_slave);
>>   
>>   err_unregister:
> 
> [Severity: High]
> Should the bond_master_upper_dev_link() failure path also unbind the port?
> 
> bond_3ad_bind_slave() runs well before the upper link, but a failure in the
> upper link jumps past the new unbind:
> 
> 	res = bond_master_upper_dev_link(bond, new_slave, extack);
> 	if (res) {
> 		slave_dbg(bond_dev, slave_dev, "Error %d calling bond_master_upper_dev_link\n", res);
> 		goto err_unregister;
> 	}
> 
> The slave can be visible to the 3ad state machine during that failed call.
> __netdev_upper_dev_link() first calls
> __netdev_adjacent_dev_link_neighbour(), which adds slave_dev to the list
> walked by bond_for_each_slave_rcu(). Only after that does it send
> NETDEV_CHANGEUPPER, and if a notifier fails it rolls the adjacency back.
> 
> CHANGEUPPER handlers can fail, and they can sleep. For example,
> dsa_user_changeupper() -> dsa_port_lag_join() can return -ENOMEM from
> dsa_port_lag_create(), a driver error from DSA_NOTIFIER_LAG_JOIN, or an
> error from dsa_port_bridge_join().
> 
> bond_3ad_state_machine_handler() only takes mode_lock and RCU. During that
> window it can run ad_port_selection_logic() on the new port and link it into
> another live slave's aggregator. The rollback then reaches
> kobject_put(&new_slave->kobj) and frees ad_info while lag_ports or
> port->aggregator still point into it.
> 
> Isn't that the same use-after-free in ad_agg_selection_logic() that this
> commit fixes for the sysfs failure?
> 
> The commit message says "earlier unpublished failures are unchanged", but
> this failure publishes the slave and then rolls it back. Could the unbind
> cover every failure after bond_3ad_bind_slave(), placed after the
> rx_handler drain?
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but can the same
> publish-then-fail window leave TLB/ALB hash entries pointing at the freed
> slave?
> 
> In balance-tlb/alb mode, bond_enslave() calls bond_alb_init_slave() and
> bond_set_active_slave(new_slave). Once the upper link publishes the slave,
> bond_slave_can_tx(new_slave) can be true, and a concurrent transmit can
> store the slave in the TX hash table:
> 
> bond_xmit_tlb_slave_get()
>    tlb_choose_channel()
>      __tlb_choose_channel()
>        tlb_get_least_loaded_slave()
> 
> drivers/net/bonding/bond_alb.c:__tlb_choose_channel() {
>      ...
> 	assigned_slave = hash_table[hash_index].tx_slave;
> 	if (!assigned_slave) {
> 		assigned_slave = tlb_get_least_loaded_slave(bond);
> 
> 		if (assigned_slave) {
> 			...
> 			hash_table[hash_index].tx_slave = assigned_slave;
>      ...
> }
> 
> Normal release clears these references in bond_alb_deinit_slave(), through
> tlb_clear_slave() and rlb_clear_slave(). The enslave rollback does nothing
> equivalent before kobject_put(&new_slave->kobj) frees the slave.
> bond_alb_monitor() only rebalances slaves that are still on the list.
> 
> A later packet with the same hash would get the freed slave back from
> __tlb_choose_channel(). bond_do_alb_xmit() would then use it:
> 
> 	if (tx_slave && bond_slave_can_tx(tx_slave)) {
> 		...
> 		return bond_dev_queue_xmit(bond, skb, tx_slave->dev);
> 
> In TLB/ALB, two failures can happen after the slave is published:
> bond_sysfs_slave_add() failing (goto err_upper_unlink) and a failing
> NETDEV_CHANGEUPPER notifier (goto err_unregister). Should the rollback also
> call bond_alb_deinit_slave() for these modes?
> 

I agree with the two High issues. In v2, I will drain the RX handler
before unbinding and also cover the NETDEV_CHANGEUPPER failure path,
without repeating upper-dev unlink. I will add the slave-array update
where needed.

The array issue appears to be a consistency problem rather than a UAF,
since slave_arr_work may already rebuild it.

The TLB/ALB issue is not directly related to this patch. If confirmed by
further validation, it can be addressed with a separate patch.

pw-bot: cr
