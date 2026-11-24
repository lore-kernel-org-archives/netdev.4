Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557468;
	b=0fTF6Sf3pLTrNim+3WxEaJ/a22D1f0gx399aNOpWQKWRYk6o5pnFVAFTtNiwSzOTxqaJ
	 gt3VTMqf917XWn3VJbxPjO/AwBMbhlKkoWmuN73wn1c0lfCkZkEkL8lNQJfC/5qPyfszF
	 GMwlXjNGRiLzNh8Kz/s06Jv7F5naGf12OsB4WsNv9WhuRDi2do2RqBuWjLgZnR9s0/oIr
	 PC+AqQ8MfdY7pV3x+ysdTBugUJ2sr8jAEIKNZO6r6NZPsNusd5BbMmSdvejXO7TmFNBXF
	 t6m1d9WCarz5LylalCNjOb1j42fdyrLh5fMDbEdeXVS6FQ8ykiEjHOldIe9p09ch+vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557468;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lr2s3TX+8fB4ktwh7x/Ny3DlVqR6UV8qlhEjWjGQVaI=;
	b=r8ldTJv48zYD+quUdMvMnaKGSuX9XsdV1LrBwCTCCFWFc3WmWhhcLd58/tOzoRKM+kIV
	 in7E/SG/h77fDGW6FMrtFEF5bv/nUZed4o0DHZdt1P/hzRbHhIkPwgxa4OYlZwTspuqpT
	 EnPBZ83guqovL61KA3JB4f/v4EqJ0C0hj4ybzmiHQMnCH28CGuu9ofjWdBH1kEO/m0glI
	 0GjYOKOXAHIy6jMLZxozwel951B81fRPxDUZLOjkCjaP5/WX/ZLp8UoM4Ha4V6Ndyil+u
	 UsgKSK3/yXE16JCHoIEa/TXKouK/oYcpBVNa2XG0HNIzKG4Kr8Z3Uu+6vsleffUODFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCBq2QiK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CD5606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCBq2QiK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6981F000C0;
	Tue, 24 Nov 2026 21:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557468;
	bh=lr2s3TX+8fB4ktwh7x/Ny3DlVqR6UV8qlhEjWjGQVaI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BCBq2QiKXne6WrL4Lr/ccWGXDqTQC7lu331WPYLpBcBEINlTKbO/j1dJ8UTe/0JvW
	 VMGoOsF4mvJEjGiQSwqRR1Id1NLW+4365kYre05oTdvHMCDQ4Jp5NQucCXe70VgU7+
	 Oh3sZ7QjoEr59aE1BxfoLioZd0HJZbXWszLaNyY8yOoeRBHylLuZNbVh+yezZpFebv
	 odeegUXzLbztxMj8SUoYF6j/YQlWZpybFHW5sSUffJJzODgkKlsZr+oErB38818mSz
	 zgZX/oTwzklhAgb9WgqNO0rIOnGo7kElROCU1YDxlfEW3wMm4HT+Xinnp2RW1Wqaee
	 wr6TdXaaDRnhg==
Subject: Re: [PATCH net-next v7 15/15] ice: support up to 256 VF queues
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, jiri@resnulli.us,
 anthony.l.nguyen@intel.com, aleksandr.loktionov@intel.com,
 mschmidt@redhat.com, edumazet@kernel.org, horms@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, leon@kernel.org, mbloch@nvidia.com,
 jacob.e.keller@intel.com, jedrzej.jagielski@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, ohartoov@nvidia.com, poros@redhat.com,
 donald.hunter@gmail.com
Date: Tue, 24 Nov 2026 21:57:46 +0000
Message-ID: <179555746609.3135.17615546634769705803@kernel.org>
In-Reply-To: <20261121230123.316391-16-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-16-przemyslaw.kitszel@intel.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ice_init_vf_devlink()
  (drivers/net/ethernet/intel/ice/ice_vf_lib.c) asserts that…
- [High] ice_sriov_set_msix_vec_count() (sriov_vf_msix_count sysfs) reads
  and rebuilds the VF VSI without vf->cfg_lock.
- [Medium] ice: NULL pointer dereference on VF recovery after VSI rebuild
  failure
- [Medium] ice: sriov_vf_msix_count overridden by num_req_qs and not
  capped to LUT or 256
- [Low] ice_vf_max_contig_qs() returns 0 when either
  bitmap_alloc(GFP_KERNEL) fails: it jumps to `out` with max_tx and…
- [Low] ice_sriov_set_msix_vec_count() now has two capacity checks that
  measure different things.
- [Low] ice_vf_max_contig_qs() copies pf->avail_txqs/avail_rxqs under
  pf->avail_q_mutex, drops the mutex, and returns the longest free range…
- [Low] ice_init_vf_devlink() returns void and exits silently when
  devlink_alloc_drv() returns NULL or devl_nested_devlink_set() fails:…

--

ice: support up to 256 VF queues

This patch supports up to 256 queues per VF. A VF gets the bigger RSS
LUT it needs through a new per-VF devlink instance with an rss_lut
resource. It also hooks up the large-queue virtchnl opcodes, defers the
VF reset to the service task, and only grants queue requests that fit in
one contiguous free range of PF queues.

> diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
> index d7c4a65400083..24c521aaf3f3b 100644
> --- a/drivers/net/ethernet/intel/ice/ice_sriov.c
> +++ b/drivers/net/ethernet/intel/ice/ice_sriov.c

[ ... ]

> @@ -969,6 +991,12 @@ int ice_sriov_set_msix_vec_count(struct pci_dev *vf_dev, int msix_vec_count)
>  		return 0;
>  	}
>  
> +	/* VSI rebuild takes one free range for all queues of the VF */
> +	if ((vf->num_req_qs ?: queues) > ice_vf_max_contig_qs(vf, vsi)) {
> +		ice_put_vf(vf);
> +		return -ENOSPC;
> +	}
> +
>  	prev_msix = vf->num_msix;
>  	prev_queues = vf->num_vf_qs;
>  

[Severity: Medium]
This check uses vf->num_req_qs ?: queues, but
ice_sriov_set_msix_vec_count() never updates vf->num_req_qs. On
rebuild, ice_vsi_set_num_qs() overwrites vf->num_vf_qs with
vf->num_req_qs whenever that is non-zero.

This patch adds two places that set num_req_qs without the admin or
the VF asking for it. ice_change_rss_lut() and ice_rebuild_rss_luts()
set vf->num_req_qs = max_qs when (vf->num_req_qs ?: vf->num_vf_qs) is
above the LUT limit.

Take a VF with a global LUT that got 64 queues through
sriov_vf_msix_count. After a PF reset, num_req_qs is latched at 16.
>From then on, a sriov_vf_msix_count write changes vf->num_msix and sets
vf->num_vf_qs = queues, but the VSI rebuild puts the queue count back
to 16. That also happens after the VF gets a bigger LUT again. The
-ENOSPC check here is done against that stale 16, not the count that
was written. vsi->req_txq/req_rxq do not help either, since they are
only read for ICE_VSI_PF.

When num_req_qs is 0, queues is capped neither by
ice_lut_type_to_qs_num(vsi->rss_lut_type) nor by ICE_MAX_QS_PER_VF.
VIRTCHNL_VF_LARGE_NUM_QPAIRS is now granted to any VF with a global
or PF LUT. So a VF with a 512 entry global LUT and sriov_vf_msix_count
set to 128 gets num_queue_pairs = 128 in the GET_VF_RESOURCES reply,
while its LUT spreads traffic over only 64 of them.

Above 256 queues it gets worse. ice_ena_vf_q_mappings() writes
max_txq - 1 into the 8-bit VFNUMQ fields of VPLAN_TX_QBASE and
VPLAN_RX_QBASE, so 257 queues wrap to a single queue in hardware. Queue
id 256 also passes ice_vc_isvalid_q_id(), which only checks against
vsi->alloc_txq. ice_vf_vsi_dis_single_txq() then indexes past the
ICE_MAX_QS_PER_VF sized vf->txq_ena bitmap.

Should the sysfs path set or clear vf->num_req_qs together with
vf->num_vf_qs? Should it also cap queues to the RSS LUT limit and to
ICE_MAX_QS_PER_VF, the way ice_vc_request_qs_msg() caps a VF request?

[Severity: High]
ice_sriov_set_msix_vec_count() does not take vf->cfg_lock. With this
patch, the VF devlink rss_lut setter can work on the same VF VSI at the
same time:

devlink resource set pci/<VF> path rss_lut ...
  ice_rss_lut_vf_size_set()        (VF devl lock + vf->cfg_lock)
    ice_rss_lut_set()
      ice_change_rss_lut()
        writes vsi->rss_table_size, rss_lut_type, rss_size,
        vf->num_req_qs
        ice_schedule_vf_reset()

service task
  ice_handle_deferred_vf_reset()
    ice_reset_vf()
      ice_vf_reconfig_vsi()
        ice_vsi_decfg() / ice_vsi_cfg()   (cfg_lock only)

sriov_vf_msix_count store
  ice_sriov_set_msix_vec_count()   (no cfg_lock)
    reads vf->num_req_qs
    ice_vf_max_contig_qs()         walks vsi->txq_map[] / rxq_map[]
    ice_vsi_rebuild()

The sysfs path only needs the VF to be unbound. The devlink setter only
needs ice_vf_is_ready(), and an unbound VF in INIT state passes that
check.

Can the two paths run decfg/cfg on the same VSI at once? Can
ice_vf_max_contig_qs() read vsi->txq_map[] while it is being freed or
reallocated?

ice_rebuild_rss_luts() also writes vf->num_req_qs and the VF VSI rss
fields while holding table_lock and rss_lut_lock, but not cfg_lock.

The missing cfg_lock in ice_sriov_set_msix_vec_count() predates this
patch, since ndo_set_vf_* resets can already race with it. This patch
adds a new concurrent writer and new unlocked reads on top of that.

[Severity: Low]
Earlier in ice_sriov_set_msix_vec_count() there is still the older
capacity check:

	if (queues > min(ice_get_avail_txq_count(pf),
			 ice_get_avail_rxq_count(pf)))
		return -EINVAL;

That check counts the VF's current queues as used, because they are
still set in pf->avail_txqs/avail_rxqs. It also tests queues, not
vf->num_req_qs ?: queues.

The new check counts the VF's own queues as free, as the
ice_vf_max_contig_qs() kernel-doc says. Will a write that would fit once
the VF's own queues are released be rejected early with -EINVAL? Will a
VF that really does not fit usually get -EINVAL rather than -ENOSPC?

The commit message says:

  A write to sriov_vf_msix_count fails with -ENOSPC when the VF would
  not fit.

That only holds when the older check passes first. Should the two
checks be reconciled?

> diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> index 320b393ddaaf0..015b50c70bdcc 100644
> --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c

[ ... ]

> @@ -1450,3 +1474,52 @@ void ice_vf_update_mac_lldp_num(struct ice_vf *vf, struct ice_vsi *vsi,
>  	if (was_ena != is_ena)
>  		ice_vsi_cfg_sw_lldp(vsi, false, is_ena);
>  }
> +
> +void ice_init_vf_devlink(struct ice_vf *vf)
> +{
> +	struct devlink *pf_devlink = priv_to_devlink(vf->pf);
> +	static const struct devlink_ops noop = {};
> +	struct devlink *devlink;
> +	int err;
> +
> +	lockdep_assert_held(&vf->pf->vfs.table_lock);
> +
> +	/* no VF pci_dev when the VFs were not scanned, e.g. on s390 */
> +	if (!vf->vfdev)
> +		return;
> +
> +	devlink = devlink_alloc_drv(&noop, 0, &vf->vfdev->dev,
> +				    ice_pf_to_dev(vf->pf)->driver);
> +	if (!devlink)
> +		return;
> +
> +	scoped_guard(devl, pf_devlink)
> +		err = devl_nested_devlink_set(pf_devlink, devlink);

[Severity: High]
Can this deadlock against ice_tear_down_devlink_rate_tree()?

ice_start_vfs() calls ice_init_vf_devlink() for every VF while
ice_ena_vfs() holds pf->vfs.table_lock. That gives the order
table_lock -> PF devl.

ice_tear_down_devlink_rate_tree() in devlink/devlink.c takes the locks
the other way round:

	devl_lock(devlink);
	mutex_lock(&pf->vfs.table_lock);

It is reached from ice_pf_dcb_cfg() (dcbnl setets/setpfc/setapp, DCB
rebuild, LLDP MIB change handling). It is also reached from
ice_setup_tc_mqprio_qdisc() in channel mode.

CPU0                              CPU1
sriov_numvfs store                dcbnl setets / LLDP MIB change
ice_ena_vfs()                     ice_pf_dcb_cfg()
  lock table_lock                   ice_tear_down_devlink_rate_tree()
  ice_start_vfs()                     devl_lock(pf devlink)
    ice_init_vf_devlink()             lock table_lock  <- waits
      devl lock(pf devlink) <- waits

Before this patch, the table_lock -> PF devl order only showed up in
switchdev mode, through ice_eswitch_attach_vf()/ice_eswitch_detach_vf()
under table_lock. Now it also happens in the default legacy mode.

> +	if (err) {
> +		devlink_free(devlink);
> +		return;
> +	}

[Severity: Low]
When devlink_alloc_drv() returns NULL or devl_nested_devlink_set()
fails, ice_init_vf_devlink() returns without logging anything.

The VF devlink instance is the only way to give a VF a bigger RSS LUT.
Would a dev_warn() on these paths help explain why "devlink resource set
pci/<VF BDF> path rss_lut ..." is not available for that VF?

> +
> +	vf->devlink = devlink;
> +	scoped_guard(devl, devlink) {
> +		ice_devlink_vf_resources_register(vf);
> +		devl_register(devlink);
> +	}
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
> index e8635236cb6c1..1afb7a2946fe9 100644
> --- a/drivers/net/ethernet/intel/ice/virt/queues.c
> +++ b/drivers/net/ethernet/intel/ice/virt/queues.c
> @@ -986,6 +986,48 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)

[ ... ]

> +int ice_vf_max_contig_qs(struct ice_vf *vf, struct ice_vsi *vsi)
> +{
> +	struct ice_pf *pf = vf->pf;
> +	unsigned long *txqs, *rxqs;
> +	int max_tx = 0, max_rx = 0;
> +	int b, e;
> +
> +	txqs = bitmap_alloc(pf->max_pf_txqs, GFP_KERNEL);
> +	rxqs = bitmap_alloc(pf->max_pf_rxqs, GFP_KERNEL);
> +	if (!txqs || !rxqs)
> +		goto out;
> +
> +	scoped_guard(mutex, &pf->avail_q_mutex) {
> +		bitmap_copy(txqs, pf->avail_txqs, pf->max_pf_txqs);
> +		bitmap_copy(rxqs, pf->avail_rxqs, pf->max_pf_rxqs);
> +	}

[Severity: Low]
The snapshot is taken under avail_q_mutex, but the result is used after
the mutex is dropped.

ice_vc_request_qs_msg() then sets vf->num_req_qs and calls
ice_reset_vf(). The real allocation happens later, in
ice_vsi_get_qs()->__ice_vsi_get_qs(), under avail_q_mutex again.

A PF VSI rebuild (ethtool -L, XDP rings, ADQ channel VSIs) or another
sriov_vf_msix_count write can take queues in between. In that case
__ice_vsi_get_qs_contig() fails, and this fallback runs:

	ret = __ice_vsi_get_qs_contig(qs_cfg);
	if (ret && qs_cfg->q_count <= qs_cfg->scatter_count) {
		qs_cfg->mapping_mode = ICE_VSI_MAP_SCATTER;

ice_ena_vf_q_mappings() does not program scatter mode for VFs. Larger
counts make the rebuild fail and leave the VF disabled.

Doesn't that make the guarantee in the commit message ("granted only
when the VF fits in one free range of PF queues") best effort only?

> +	for (int i = 0; i < vsi->alloc_txq; i++)
> +		clear_bit(vsi->txq_map[i], txqs);
> +	for (int i = 0; i < vsi->alloc_rxq; i++)
> +		clear_bit(vsi->rxq_map[i], rxqs);
> +
> +	for_each_clear_bitrange(b, e, txqs, pf->max_pf_txqs)
> +		max_tx = max(max_tx, e - b);
> +	for_each_clear_bitrange(b, e, rxqs, pf->max_pf_rxqs)
> +		max_rx = max(max_rx, e - b);
> +out:
> +	bitmap_free(txqs);
> +	bitmap_free(rxqs);
> +
> +	return min(max_tx, max_rx);
> +}

[Severity: Medium]
When ice_vf_rebuild_vsi() fails here, the VF VSI is left half torn
down. ice_vsi_rebuild() runs ice_vsi_decfg() before ice_vsi_cfg_def(),
and both ice_vsi_decfg() and the ice_vsi_cfg_def() unwind call
ice_vsi_free_arrays(). That leaves vsi->txq_map, vsi->rxq_map,
vsi->tx_rings, vsi->rx_rings and vsi->q_vectors NULL, while
vsi->alloc_txq, alloc_rxq, num_txq and num_rxq keep their old values.

This patch sets ICE_VF_STATE_DIS while preparing for the PF reset, and
clears it again here so that a VFLR can reset the VF. With the bit
clear, ice_is_vf_disabled() is false, and a VFLR from the guest runs
the full reset on that VSI:

ice_process_vflr_event()
  ice_reset_vf(vf, ICE_VF_RESET_VFLR | ICE_VF_RESET_LOCK)
    ice_dis_vf_qs()
      ice_vsi_stop_all_rx_rings()    reads vsi->rxq_map[i]
    ice_reset_interrupts()           reads vsi->txq_map[i], rxq_map[i]
    ice_vf_reconfig_vsi()
      ice_vsi_decfg()                second decfg
      ice_vsi_cfg()                  with ICE_VSI_FLAG_NO_INIT

Isn't that a NULL pointer dereference in the first two steps?

Even if those were guarded, the second ice_vsi_decfg() still runs
ice_vsi_put_qs() on the NULL maps and drops vsi->agg_node->num_vsis
again. ice_vsi_cfg() with ICE_VSI_FLAG_NO_INIT then ends in
ice_update_vsi() for a VSI that firmware lost on the PF reset. That VSI
was never added back with ICE_VSI_FLAG_INIT. So the VFLR does not seem
able to recover the VF.

The new ice_vf_max_contig_qs() has the same problem. A
sriov_vf_msix_count write for this VF walks vsi->txq_map[] and
vsi->rxq_map[] up to alloc_txq and alloc_rxq without a NULL check.

Should the VSI be put into a consistent state before the bit is
cleared? Or should ice_reset_vf() notice a VF whose VSI rebuild failed
and do a full rebuild with ICE_VSI_FLAG_INIT instead?

[Severity: Low]
When either bitmap_alloc() fails, this returns 0. Callers cannot tell
that apart from "no free contiguous range".

ice_sriov_set_msix_vec_count() then returns -ENOSPC instead of -ENOMEM.

ice_vc_request_qs_msg() sets max_allowed_vf_queues to 0. It then logs
"only 0 are free in one range" and replies to the VF with
num_queue_pairs = 0.

Should the allocation failure be reported separately, for example as a
negative errno?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
