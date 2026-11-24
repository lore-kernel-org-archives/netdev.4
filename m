Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486251;
	b=aVpJIM05Sf7O6k/fi0purNjm8xE3FXvCRTHYXQMi3vold4h+vWQoIk7suD84tT4iicTh
	 e3PfTvjLsZN59Rew4b4j8lvlHpM1PYj+57b0cweBe8uYUadFP1MRmiL6H+Cvr0D0GTelp
	 yuA10wlIyZxnKXSLlIV/LVU+pyvfUDKtq3VriLM82PKzcY7wCdRbAPibGT5iSo7qa1D1w
	 LDi+dPUgzP3n+ea+UkzGPwXG+/p79f71oPhD9/s/5f7DFC9n84GX7fa0JDiEJP2g9R70P
	 U3IHKbZDn0SD8xfAVb8m/8pR6VMqrWltwwkSN0zk1nt0nN6Lz/cs7MA2pHycEhKeLWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486251;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oJmAlrgxrBlKgqKHo0n5T0b+LujKVapl/bClJpE9yZs=;
	b=IIAKG9pZCkikurq8YxhOl0f6zgYdzH9oKVvz/ndztnLW3qPFbU3dmvecuiTCd8hGVSyA
	 48Kr37q+5x7RBmiZtuNNCmv4ipM/PQ7QGALRe5aOWAwrQ9b3+sSvErDvJWwCs8JzOnIpn
	 yFU8tm9JYt6NJADviWxRVollQDDi4zXAinHaTRZI8fFLeVg99j522tPU4WT3ZA7KRxhg6
	 wKi/gUlM2ddaAL39Rr/6Z7rW5jxNsPZkt6RS6NOL1ZTW0XtohUzHfWOOvKpq366436JZQ
	 /KQX/bW7uDNalhQmFTQELYN/VmdIggkRsJi9wGMi4IZRTo/1UHDhQ6CyKth0BE+Q6pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOnY5W4x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F719606A330
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOnY5W4x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A521E1F000C6;
	Tue, 24 Nov 2026 02:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486251;
	bh=oJmAlrgxrBlKgqKHo0n5T0b+LujKVapl/bClJpE9yZs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KOnY5W4xbnCWFUMzHdg+TEQ1glidl7KxVvlIv0QFW4vDOWos5h+rAjlSzjbd6HPmB
	 nKapBlwDrISxMWqNOcdeib6AHu78KKeAQ/Ye71fe1YypEXLzRW+VN5ZZdnH5ipYMXr
	 OcyloDHC9k2QMvLWTPm3xpmcMJFWgu0bZ2BXa4FMSRdAQbXh91L1waehCZYqs+6XUn
	 rMs+8AkbRbiVpTCeBKu9VbTxAwl+u/xZo9uzi39TnZzFsWOA/Yk4WwtMfahrBH5h7/
	 BBWv7h4HwedGCP3nCkaNgoN3cXViC2+TVYt/vc+dDgs1pkX6K0of35s0wyr98RX4n3
	 D9cstcDwg5rdA==
Subject:
 Re: [PATCH net-next v5 5/9] bnxt_en: Reinit IRQ when configuring LRO/GRO/HDS
From: netdev-bot+sashiko@kernel.org
To: michael.chan@broadcom.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 pavan.chebbi@broadcom.com, andrew.gospodarek@broadcom.com
Date: Tue, 24 Nov 2026 02:10:50 +0000
Message-ID: <179548625022.3135.12630325753455613911@kernel.org>
In-Reply-To: <20261120012921.2537903-6-michael.chan@broadcom.com>
References: <20261120012921.2537903-6-michael.chan@broadcom.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message understates the bug being fixed.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but this patch
  sends more paths into it.

--

bnxt_en: Reinit IRQ when configuring LRO/GRO/HDS

When LRO/GRO/HDS is enabled, new RX aggregation rings may be needed. The
FW may grant fewer rings than requested, and then the number of channels
shrinks. The patch sets irq_re_init in bnxt_set_features() and
bnxt_set_ringparam() so that the IRQs and NAPIs are rebuilt when agg rings
are newly needed.

> Without
> this patch, when the driver is eventually shutdown, some memory for the
> unused NAPIs may never be freed properly if the rings have shrunk.

[Severity: Low]
Does this describe the pre-patch behavior accurately? It reads more like
a use-after-free than a leak.

Before this patch, the sequence looks like this:

bnxt_set_features() / bnxt_set_ringparam()
  close/open with irq_re_init == false
    bp->bnapi is kept, NAPIs for the old cp_nr_rings stay registered
  __bnxt_reserve_rings()
    BNXT_FLAG_AGG_RINGS is set, FW grants fewer rings
    bp->rx_nr_rings and bp->cp_nr_rings shrink

Then the next close with irq_re_init == true (ndo_stop, remove, ...) runs:

__bnxt_close_nic()
  bnxt_free_irq()      <- loops only to the reduced bp->cp_nr_rings
  bnxt_del_napi()      <- same bound
  bnxt_free_mem()
    kfree(bp->bnapi);  <- single block holding every bnxt_napi

The napi_structs above the reduced count would stay linked on
dev->napi_list after their memory is freed. Their IRQs would also stay
requested, with dev_id pointing into the freed block.

Later walks of dev->napi_list would then read freed memory. Examples are
netif_napi_dev_list_add() from the next bnxt_init_napi(), and
netif_napi_del() from free_netdev().

Could the commit message call this a use-after-free, so stable and
distro reviewers can see it is a memory safety fix?

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index f4eff048eea5a..887a67d42bb37 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c

[ ... ]

> @@ -14184,8 +14185,12 @@ static int bnxt_set_features(struct net_device *dev, netdev_features_t features)
>  		update_tpa = true;
>  		if ((bp->flags & BNXT_FLAG_TPA) == 0 ||
>  		    (flags & BNXT_FLAG_TPA) == 0 ||
> -		    (bp->flags & BNXT_FLAG_CHIP_P5_PLUS))
> +		    (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)) {
>  			re_init = true;
> +			if (!(bp->flags & BNXT_FLAG_AGG_RINGS) &&
> +			    (flags & BNXT_FLAG_AGG_RINGS))
> +				irq_re_init = true;
> +		}
>  	}

[ ... ]

> @@ -14208,7 +14213,7 @@ static int bnxt_set_features(struct net_device *dev, netdev_features_t features)
>  			return bnxt_reinit_features(bp, true, false, flags, update_tpa);
>  
>  		if (re_init)
> -			return bnxt_reinit_features(bp, false, false, flags, update_tpa);
> +			return bnxt_reinit_features(bp, irq_re_init, false, flags, update_tpa);

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but this
patch sends more paths into it.

irq_re_init can now be true here, and in bnxt_set_ringparam() when
tcp-data-split is enabled. That means ethtool -K gro/lro on and ethtool -G
tcp-data-split on now reach the part of __bnxt_close_nic() that frees
bp->bnapi and the ring stats. Existing triggers already include
set_channels, change_mtu, the ntuple toggle and FW reset.

That free path is protected against stats readers by a single shared
state bit:

bnxt_get_stats64() {
	set_bit(BNXT_STATE_READ_STATS, &bp->state);
	smp_mb__after_atomic();
	if (!test_bit(BNXT_STATE_OPEN, &bp->state)) {
		clear_bit(BNXT_STATE_READ_STATS, &bp->state);
		...
	}
	bnxt_sync_ring_stats(bp);
	bnxt_get_ring_stats(bp, stats);
	...
	clear_bit(BNXT_STATE_READ_STATS, &bp->state);
}

__bnxt_close_nic() {
	clear_bit(BNXT_STATE_OPEN, &bp->state);
	smp_mb__after_atomic();
	while (bnxt_drv_busy(bp))
		msleep(20);
	...
	if (irq_re_init) {
		bnxt_free_irq(bp);
		bnxt_del_napi(bp);
	}
	bnxt_free_mem(bp, irq_re_init);
}

Stats readers such as /proc/net/dev and the sysfs statistics files can run
at the same time, and they do not hold RTNL. What happens when there are
two readers?

reader A                         reader B
set_bit(READ_STATS)              set_bit(READ_STATS)
sees OPEN                        sees OPEN
bnxt_get_ring_stats()            bnxt_get_ring_stats()
  (preempted mid-walk)           clear_bit(READ_STATS)

__bnxt_close_nic()
  clear_bit(OPEN)
  bnxt_drv_busy() returns false
  bnxt_free_mem(bp, true)
    kfree(bp->bnapi)

reader A resumes
  bp->bnapi[i]->cp_ring.stats    <- freed or NULL

Can reader A end up dereferencing freed bnapi or stats memory in
bnxt_get_ring_stats() here?

Would a real lock or RCU in bnxt_get_stats64() and __bnxt_close_nic() be
a better fit than the BNXT_STATE_READ_STATS bit?

>  
>  		if (update_tpa) {
>  			bp->flags = flags;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120012921.2537903-1-michael.chan%40broadcom.com
