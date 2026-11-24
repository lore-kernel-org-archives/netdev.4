Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515638;
	b=QvzfG6ZUNo+yyI4DbOnPUjCdSQJQsekkDjjGpYMKWC7VnfOWhOGvo6EU8WkG/uYL7cs7
	 +hUpWr/8KBFf2c5Sr/24GMVNhDgaeXNsV4IJ2lMtIes4VCrNCOQ3X3TdJ1QMm492lVJc3
	 LniWlqUpkesUrElJY7VlhGE2/FXZCZb50dP0BS9r0kvQG+REK6iZTeLl3rmIeWKPu4PLq
	 fTuk3hSPnbcD3K6MNEFEUz/t25pK+l7/9DHpeKvwvso1SPV1kXPl4OBsgPd5YwopsztqT
	 VCIKDG5dwLFI1e21Z28Q4sUob4OfeOtBm799jNOsFBLHY8zVpieLFHqj0qqT/LIS34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515638;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tZhiFUE3loJbHDNpXfaeHt2tUX5p8IQUiFuicnwa5lM=;
	b=BfohjWreZjr1+MQ34b1vIxdZ7mSuhfGlXFsyd5RqTgMnFvbxdPdJdPfUK0n8KkHqYsYx
	 meV+Lh5uRHWqyJT6oaktqB8USFAwqYxm9AR2vu4BQt+klczmbYD2QvuzlckuJBnsGgHal
	 Aaqq1c6/71K4oVMjnO8qF/xstSCqooTui9lcCLkzEhQDNgiJI8GbWyUoRpTRCmpPW719w
	 wGRJOOk6meYa4b39vqiN+KdFpw4nbHB4beUnMd51nPPgR4/dEFBu3kPYtMhln1QUwOpay
	 SEhJYquW+Wj2SHOz32uFOl2/4dUr/t22t5tG7Rf0A/vbDuFqnEG9Ukv/8RQ0Fs6CkuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYDpHVHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67745606A691;
	Tue, 24 Nov 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYDpHVHM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F65C1F000EF;
	Tue, 24 Nov 2026 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515638;
	bh=tZhiFUE3loJbHDNpXfaeHt2tUX5p8IQUiFuicnwa5lM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DYDpHVHMVCWVvXYhqxEDOGSp5uAWxONRsfUrLsrDkExe0Q3ESQ94OZtqEoJ941Chn
	 jrKf2yXMS/N9qzUNlHi1poSoB9qcH3Rf8CxPLBLcRdvZZV9n2Z7zaqCBPDveToS+y6
	 NPB9U4IAJHrlslnQPnPHKd6eIqUgSFSVJTR1DJwBs6/jbqm4LFCQreR55/URf6g+W1
	 W8xWZZAbPGrAJ6ZOPiiBbxxIdDZ7LBTtSyJ7AqZFUncwYfe5k7pVzIKHp+JfGhb4t+
	 lljshaN6HX0G4DOmTWJ7gFy2MYsjLkRon1BVhJdvK9JkjNUSO+KqRByTW3MHkgyPFl
	 n9Jstg9HFoq/g==
Subject:
 Re: [PATCH net-next v9 09/10] bnge: add aRFS flow steering ndo support
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:36 +0000
Message-ID: <179551563693.3135.10615302430341667167@kernel.org>
In-Reply-To: <20261123100746.1975030-10-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-10-vikas.gupta@broadcom.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In the expire loop of bnge_cfg_ntp_filters() (bnge_filter.c),
  the aRFS filter is unlinked with hlist_del_init_rcu() under…
- [Low] This patch adds bnge_rx_flow_steer() and wires it into
  bnge_netdev_ops.
- [Low] The concern is that bnge_cfg_one_usr_fltr() rewrites
  ntp_fltr->l2_key under ntp_fltr_lock while bnge_rx_flow_steer() reads…

--

bnge: add aRFS flow steering ndo support

This patch adds the ndo_rx_flow_steer callback bnge_rx_flow_steer(). The
callback creates ntuple filters for aRFS, and sp_task programs and expires
them later through bnge_cfg_ntp_filters(). The patch also changes ntuple
filter matching to compare the bound L2 filter by key, not by firmware id.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> index 639c36d571f24..b7261018216bc 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c

[ ... ]

> @@ -643,7 +658,11 @@ static void bnge_cfg_one_usr_fltr(struct bnge_net *bn,
>  	if (fltr->type == BNGE_FLTR_TYPE_NTUPLE) {
>  		ntp_fltr = container_of(fltr, struct bnge_ntuple_filter, base);
>  		l2_fltr = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
> +		/* bnge_rx_flow_steer() can already run and match this rule */
> +		spin_lock_bh(&bn->ntp_fltr_lock);
>  		ntp_fltr->l2_filter_id = l2_fltr->base.filter_id;
> +		ntp_fltr->l2_key = l2_fltr->l2_key;
> +		spin_unlock_bh(&bn->ntp_fltr_lock);

[Severity: Low]
This isn't a bug, but is this comment accurate about what the lock
protects?

The reader it mentions runs under RCU only and never takes ntp_fltr_lock:

bnge_rx_flow_steer()
  rcu_read_lock()
  bnge_lookup_ntp_filter_from_idx()
    bnge_fltr_match()
      reads f1->l2_key and f2->l2_key

So the spinlock does not serialize this write against that lookup.

In practice the stored value does not seem to change. bnge_netdev_ops has
no .ndo_set_mac_address, so dev_addr stays as set by bnge_init_mac_addr().
l2_filters[0] is always created with the key {dev_addr, vlan 0}, and
bnge_add_ntuple_cls_rule() has already copied that same key into the rule.

Could the lock be dropped here? Otherwise, could the comment be reworded so
it does not suggest the RCU lookup in bnge_rx_flow_steer() is covered?

[ ... ]

> +	list_for_each_entry_safe(fltr, tmp, &expire_list, base.list_node) {
> +		list_del_init(&fltr->base.list_node);
> +		/* Decide again under ntp_fltr_lock: the scan ran without it and
> +		 * the firmware calls above can take long. Use the rxq and
> +		 * flow_id that bnge_rx_flow_steer() writes under it. Unlink
> +		 * here too, so a flow cannot be retargeted onto a filter that
> +		 * is about to be freed. The firmware free comes after the
> +		 * unlock.
> +		 */
> +		spin_lock_bh(&bn->ntp_fltr_lock);
> +		if (test_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state) ||
> +		    !rps_may_expire_flow(bn->netdev, fltr->base.rxq,
> +					 fltr->flow_id, fltr->base.sw_id)) {
> +			spin_unlock_bh(&bn->ntp_fltr_lock);
> +			continue;
> +		}
> +		hlist_del_init_rcu(&fltr->base.hlist);
> +		spin_unlock_bh(&bn->ntp_fltr_lock);
> +
> +		bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
> +		bnge_del_ntp_filter_rcu(bn, fltr);

[Severity: Medium]
Can this leak the firmware ntuple rule when the free fails?

bnge_hwrm_cfa_ntuple_filter_free() resets filter_id only when the HWRM
send succeeds:

	rc = bnge_hwrm_req_send(bd, req);
	if (!rc)
		fltr->base.filter_id = BNGE_FLTR_ID_INVALID;
	return rc;

If bnge_hwrm_req_init() or bnge_hwrm_req_send() fails here, the return
value is ignored. bnge_del_ntp_filter_rcu() then frees the descriptor, and
that descriptor is the only place the driver keeps the firmware filter id.

The hardware rule would keep steering the flow to the old RFS ring. It
would also hold a firmware ntuple slot until the interface is closed.

If the flow is steered again, bnge_rx_flow_steer() creates a new entry.
sp_task then sends a second CFA_NTUPLE_FILTER_ALLOC with the same match
fields. Firmware may reject it, or it may install an overlapping rule.

The update loop earlier in the same function checks this return value and
leaves the rule in place when the free fails:

	if (bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr))
		continue;

Should the expire path handle a failed free the same way, and not drop the
only copy of the firmware filter id?

> +	}
> +#endif
> +}
> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index 44637152b075c..de7320521a3e0 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -3442,6 +3591,9 @@ static const struct net_device_ops bnge_netdev_ops = {
>  	.ndo_features_check	= bnge_features_check,
>  	.ndo_fix_features	= bnge_fix_features,
>  	.ndo_set_features	= bnge_set_features,
> +#ifdef CONFIG_RFS_ACCEL
> +	.ndo_rx_flow_steer	= bnge_rx_flow_steer,
> +#endif
>  };

[Severity: Low]
This isn't a bug, but can bnge_rx_flow_steer() be reached at this point in
the series?

set_rps_cpu() in net/core/dev.c calls ndo_rx_flow_steer only when
dev->rx_cpu_rmap is set:

		if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
		    !(dev->features & NETIF_F_NTUPLE))
			goto out;

Nothing in bnge sets rx_cpu_rmap at this commit. Until then the new callback
and the aRFS install, retarget and expire paths in bnge_cfg_ntp_filters()
are dead code.

The next patch in the series, "bnge: add cpu_rmap support for IRQ
affinity", allocates and fills dev->rx_cpu_rmap and turns aRFS on, so the
end state of the series is complete.

Would it help to say in the commit message that aRFS only becomes active
with that follow-up patch?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
