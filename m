Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070711;
	b=GWQaWl4V9398XbIYXuUzRaWx4/b3pn5Af7emqK/4lOm6VU774BFviWOLHjXrMiqPp795
	 ODUkd02vNltXszuZTmIg5jECjMAWig7EiYv8bcxVv+2lPX9SFlbVJHiGP0lCdZX4j4PoZ
	 y4v7frCcNLpkPFGka45kKWvKV2Tx1SsKJrveUkr6pvcYlMi9XqrZnR4wA1k4bQkFpeWPK
	 iB3IQbZrEQN8xUK6OkDyD7cIQMo+4sdLb0qHYWIGdGSmJUveKnaHJesF3m4ikY0jY1gF1
	 rBC6g0+5p6dbbE8XJ70TPOKiW4GIITQ6qgD3Qpp6wmKqH3uPCHcUCBYeDBgZllWejNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070711;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UdTd0hx70MMT/7jb9AzOq7Cs//ObrUl//SznuQX15j0=;
	b=ut0YFqGkPHbvwMyrJg9aToLGtybn/05yh13s9ZUnOVq2G9w9NWMN3EEvRGqAGGWipnT0
	 w6ylOYasexcNrLssLrC5/RZnDeNWi+rcD9P/hC7Q4zCStY7Fkg3qxn8A3QyjxDh/Knnvj
	 zP7a1kEANf7GmBeFFKpwEC2hm+3nvQt/bs6kISSc7rg9JxK1HTCP5kf84OdePhEVTRRVl
	 kNfoeyAljLsLDDlGsGC1HPGGkcwx8jeRsUJih2sD0Mv++DfXCiVLlZbVqXiE5k9oFqU5o
	 FgB3DMLYbL112Y9EFUg6e9ZiA2qPChD+2dy+3CmuD1GaFJudGzlk8il9De9YgpXMAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRoX09gc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A7660A2614
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QRoX09gc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017DD1F000C4;
	Thu, 19 Nov 2026 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070711;
	bh=UdTd0hx70MMT/7jb9AzOq7Cs//ObrUl//SznuQX15j0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QRoX09gcEDJptkeHFXrV0ALNYnMPqQLl/GN9Q1ANKev9ilKYPqWuiCEEn/5t6c9jo
	 rcXY//FQUUXu2doDj1+eh3bsLqQnxLMzbXcrKqrTY6/PDRt6F4xQpE5FoESbov0pPT
	 Z91eacX90Sp2ecsKVE/9nyfgO71NkJ1fnHYifFmdm6pKHXf9c75EJkUa6MRt3lo1tv
	 I9bEuR26uz0kvzX5t8T9Y4W/kdwGpRH9ODItQ3Ay6c7s0RWUEzrGcYgbF9rpDD1AKf
	 x9hbcg7hRuLzQ+vlI0djnimuhNvV2sx/sVDf9u64yZoUPYh+74zPEPXu281u+CXaRx
	 vJvtgl+bXfXrQ==
Subject: Re: [net-next v6 15/15] ice: support up to 256 VF queues
From: netdev-bot+sashiko@kernel.org
To: przemyslaw.kitszel@intel.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, aleksandr.loktionov@intel.com,
 andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, corbet@lwn.net, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, jacob.e.keller@intel.com,
 jedrzej.jagielski@intel.com, jiri@resnulli.us, leon@kernel.org,
 mbloch@nvidia.com, mschmidt@redhat.com, ohartoov@nvidia.com,
 pabeni@redhat.com, poros@redhat.com, rdunlap@infradead.org, saeedm@nvidia.com,
 skhan@linuxfoundation.org, tariqt@nvidia.com
Date: Thu, 19 Nov 2026 06:45:09 +0000
Message-ID: <179507070958.3136.1417899053971480636@kernel.org>
In-Reply-To: <20261117094913.100756-16-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-16-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch caps the RSS queue count by LUT capacity
  (ice_lut_type_to_qs_num(): 64 for ICE_LUT_GLOBAL) only on paths where…
- [Medium] The new ice_vc_get_max_rss_qregion() tells the VF that its RSS
  queue region is 2^qregion_width queues:…
- [Medium] The new VF devlink LUT path (ice_rss_lut_vf_occ_set_pf/global
  -> ice_devl_res_change -> ice_maybe_change_rss_lut) serializes VF VSI…
- [Medium] ice: lock ordering inversion in ice_init_vf_devlink() under
  vfs.table_lock
- [Low] This patch caps rss_size by LUT capacity for every VSI type, the
  PF VSI included.
- [Low] The commit message that goes into git history leaves out several
  changes made by this patch.
- [Low] In ice_vf_max_contig_qs(), if either bitmap_alloc() fails the
  code jumps to 'out' and returns min(max_tx, max_rx) = min(0, 0) = 0,…
- [Low] Goto-based cleanup is mixed with scope-based guards in the same
  function, which the cleanup.h rule in the subsystem guide forbids.

--

ice: support up to 256 VF queues

This commit lets a VF use more than 16 queues: up to 64 with a global RSS
LUT, and up to 256 with a PF LUT. To do that it adds per-VF devlink
instances that expose the RSS LUT resources, defers VF resets to the
service task, and wires up the v2 queue virtchnl opcodes. It also changes
VF queue requests so they must fit in one contiguous free range of PF
queues.

> diff --git a/Documentation/networking/devlink/ice.rst b/Documentation/networking/devlink/ice.rst
> index 6e34c107b28d2..90ec1c7848d89 100644
> --- a/Documentation/networking/devlink/ice.rst
> +++ b/Documentation/networking/devlink/ice.rst

[ ... ]

> @@ -520,6 +523,21 @@ A PF must own at least one of the two LUTs at all times, so switching a PF
>  to a global LUT takes two steps: take a global LUT, then release the PF LUT.
>  A PF that owns both uses its PF LUT.
>  
> +A VF uses its VSI LUT by default, which spreads traffic over up to 16
> +queues. With a global LUT the VF can use up to 64 queues, and up to 256 with
> +a PF LUT (preferred when the VF owns both). Changing the LUT of a VF resets

[Severity: Low]
This patch also caps the PF VSI by ice_lut_type_to_qs_num(). The cap is
applied in three places, for every VSI type:

- ice_get_valid_rss_size()
- ice_maybe_change_rss_lut()
- ice_vsi_cfg_rss_lut_key()

So a PF that is moved to a global LUT now spreads RSS over at most 64
queues. Step 2 of the 256-queue VF recipe in the commit message requires
exactly that move.

Should this section and the commit message mention the 64-queue limit for
a PF on a global LUT? Only the VF limits are documented here.

Also, ice_set_channels() still accepts "ethtool -L combined N" with N > 64,
up to ice_get_max_rxq(). It then clamps rss_size without any message:

	scoped_guard(mutex, &pf->rss_lut_lock)
		vsi->rss_size = ice_get_valid_rss_size(vsi, new_rx);

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.c b/drivers/net/ethernet/intel/ice/devlink/resource.c
> index de9c13e928fae..ec3a095deb9f2 100644
> --- a/drivers/net/ethernet/intel/ice/devlink/resource.c
> +++ b/drivers/net/ethernet/intel/ice/devlink/resource.c

[ ... ]

> @@ -299,6 +341,15 @@ static int ice_maybe_change_rss_lut(struct ice_pf *pf, void *owner,
>  		vsi->global_lut_id = params.global_lut_id;
>  	vsi->rss_table_size = lut_size;
>  	vsi->rss_lut_type = lut_type;
> +	vsi->rss_size = rss_size;
> +	if (vf) {
> +		u16 max_qs = ice_lut_type_to_qs_num(lut_type);
> +
> +		/* don't keep queues that the new LUT can't spread traffic to */
> +		if ((vf->num_req_qs ?: vf->num_vf_qs) > max_qs)
> +			vf->num_req_qs = max_qs;
> +		ice_schedule_vf_reset(vf);
> +	}

[Severity: Medium]
Is this VF path serialized against ice_sriov_set_msix_vec_count()?

The devlink path holds vf->cfg_lock, the adapter devl lock and
pf->rss_lut_lock, and is gated by ice_vf_is_ready().

The sriov_vf_msix_count path only holds the PF and VF device_lock. It
takes none of the locks above and does not set ICE_VF_STATE_DIS:

ice_sriov_set_msix_vec_count()
    vf->num_vf_qs = queues;
    ...
    ice_vsi_rebuild(vsi, ICE_VSI_FLAG_NO_INIT)
        ice_vsi_set_rss_params()     /* writes vsi->rss_size */
        ice_vsi_init()
            ice_set_rss_vsi_ctx()
                lut_type = ice_lut_type_to_aq_qopt_rss_val(vsi->rss_lut_type);
            ice_update_vsi()
            vsi->info = ctxt->info;

sriov_vf_msix_count requires that no driver is bound to the VF, but the VF
devlink instance is still registered. So this interleaving looks possible:

CPU1 (msix rebuild)              CPU2 (devlink resource set on the VF)
ice_set_rss_vsi_ctx()
  reads old rss_lut_type
                                 ice_aq_set_rss_lut()
                                 ice_vsi_update_rss_lut()
                                   updates VSI ctx and vsi->info.q_opt_rss
ice_update_vsi() with old type
vsi->info = ctxt->info
                                 vsi->rss_lut_type = lut_type;

Could the VSI context in hardware and vsi->rss_lut_type then disagree about
which LUT the VF VSI uses? The deferred reset scheduled here might repair
the context later.

In the same window, the num_req_qs clamp above reads vf->num_vf_qs while
the msix path is rewriting it.

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
> index 822b94f87156f..6f393e13b3748 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
> @@ -3831,14 +3831,15 @@ ice_get_channels(struct net_device *dev, struct ethtool_channels *ch)

[ ... ]

> -static int ice_get_valid_rss_size(struct ice_hw *hw, int new_size)
> +static int ice_get_valid_rss_size(struct ice_vsi *vsi, int new_size)
>  {
> -	struct ice_hw_common_caps *caps = &hw->func_caps.common_cap;
> +	struct ice_hw_common_caps *caps = &vsi->back->hw.func_caps.common_cap;
>  
> -	return min_t(int, new_size, BIT(caps->rss_table_entry_width));
> +	new_size = min_t(int, new_size, BIT(caps->rss_table_entry_width));
> +	return min_t(int, new_size, ice_lut_type_to_qs_num(vsi->rss_lut_type));
>  }

[Severity: Medium]
This caps the queue count for LUTs the driver fills itself. Is the same cap
needed for user indirection tables?

ice_set_rxfh() still copies the user entries directly:

	for (i = 0; i < vsi->rss_table_size; i++)
		vsi->rss_lut_user[i] = (u8)(rxfh->indir[i]);

It then calls ice_set_rss_lut() without checking the entries against
ice_lut_type_to_qs_num(vsi->rss_lut_type). The ethtool core only rejects
entries >= the number of Rx rings.

Take a PF with more than 64 Rx queues that has been moved to a global LUT.
"ethtool -X equal 128" would be accepted and written to a LUT that this
patch treats as able to address only 64 queues.

ice_set_channels() keeps a configured user LUT across ethtool -L and only
updates rss_size, so the table is never checked against the cap later
either.

Moving the PF to a global LUT was added earlier in this series ("ice:
represent RSS LUTs as devlink resources"). What does the hardware do with
entries >= 64 in a global LUT? ethtool -x would report the stored table
either way.

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
> index f87ccf5d370bb..76f2ba7790537 100644
> --- a/drivers/net/ethernet/intel/ice/virt/queues.c
> +++ b/drivers/net/ethernet/intel/ice/virt/queues.c
> @@ -986,6 +986,48 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)

[ ... ]

> +static int ice_vf_max_contig_qs(struct ice_vf *vf, struct ice_vsi *vsi)
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
This isn't a bug, but this function mixes goto based cleanup (goto out for
the two bitmaps) with scoped_guard(). include/linux/cleanup.h asks that
goto and cleanup helpers are not mixed in the same function.

Would "unsigned long *txqs __free(bitmap) = bitmap_alloc(...)" with plain
returns work here?

The same applies to the scoped_guard(mutex, &pf->rss_lut_lock) added to
ice_set_channels(), which already exits through goto adev_unlock with
manual unlocks.

> +	for (int i = 0; i < vsi->alloc_txq; i++)
> +		clear_bit(vsi->txq_map[i], txqs);

[ ... ]

> +out:
> +	bitmap_free(txqs);
> +	bitmap_free(rxqs);
> +
> +	return min(max_tx, max_rx);
> +}

[ ... ]

> @@ -1014,23 +1056,31 @@ int ice_vc_request_qs_msg(struct ice_vf *vf, u8 *msg)

[ ... ]

> +	max_allowed_vf_queues = min(ice_vf_max_contig_qs(vf, vsi),
> +				    max_lut_queues);

[ ... ]

> +	} else if (req_queues > max_allowed_vf_queues) {
> +		dev_warn(dev, "VF %d requested %u queues, but only %u are free in one range.\n",
> +			 vf->vf_id, req_queues, max_allowed_vf_queues);
> +		vfres->num_queue_pairs = max_allowed_vf_queues;

[Severity: Low]
What happens here if either bitmap_alloc() in ice_vf_max_contig_qs() fails?
It jumps to out with max_tx and max_rx still 0, and returns 0. That is the
same value as "no free range".

max_allowed_vf_queues is then 0. Any req_queues in 1..max_lut_queues takes
this branch, logs "only 0 are free in one range", and replies
VIRTCHNL_STATUS_SUCCESS with num_queue_pairs = 0. That happens even when
the request is not larger than the VF's current queue count.

Should the allocation failure be reported differently, for example with
VIRTCHNL_STATUS_ERR_NO_MEMORY?

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/virt/rss.c b/drivers/net/ethernet/intel/ice/virt/rss.c
> index 960012ca91b53..99d9295af79c0 100644
> --- a/drivers/net/ethernet/intel/ice/virt/rss.c
> +++ b/drivers/net/ethernet/intel/ice/virt/rss.c

[ ... ]

> @@ -1746,24 +1749,38 @@ int ice_vc_config_rss_lut(struct ice_vf *vf, u8 *msg)

[ ... ]

> +	/* the LUT size reported in the GET_VF_RESOURCES reply */
> +	if (vf->driver_caps & VIRTCHNL_VF_LARGE_NUM_QPAIRS)
> +		lut_size = vsi->rss_table_size;
> +	if (vrl->lut_entries != lut_size) {
>  		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
>  		goto error_param;
>  	}

[ ... ]

> -	if (ice_set_rss_lut(vsi, vrl->lut, ICE_LUT_VSI_SIZE))
> +	lut = kmalloc(vsi->rss_table_size, GFP_KERNEL);
> +	if (!lut) {
> +		v_ret = VIRTCHNL_STATUS_ERR_NO_MEMORY;
> +		goto error_param;
> +	}
> +
> +	/* repeat the LUT of the VF over the whole RSS LUT of its VSI */
> +	for (int i = 0; i < vsi->rss_table_size; i++)
> +		lut[i] = vrl->lut[i % lut_size];
> +
> +	if (ice_set_rss_lut(vsi, lut, vsi->rss_table_size))
>  		v_ret = VIRTCHNL_STATUS_ERR_ADMIN_QUEUE_ERROR;
> +	kfree(lut);

[Severity: Medium]
The new ice_vc_get_max_rss_qregion() advertises a region width of
ilog2(ice_lut_type_to_qs_num(vsi->rss_lut_type)), so 16, 64 or 256 queues.
Does anything here check the VF's entries against that region, or against
vsi->num_rxq?

Only vrl->lut_entries is compared with lut_size. The entries themselves are
repeated over the 512 or 2048 entry LUT and programmed as they are.

A guest driver that ignores the advertised region could then write values
up to 255, including queues the VF does not own. This patch is the first to
let a VF VSI use a global or PF LUT.

For comparison, i40e_vc_config_rss_lut() rejects entries >=
vf->num_queue_pairs. Is a similar check needed here?

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/virt/virtchnl.c b/drivers/net/ethernet/intel/ice/virt/virtchnl.c
> index ca8018e3dd428..778637f2868c2 100644
> --- a/drivers/net/ethernet/intel/ice/virt/virtchnl.c
> +++ b/drivers/net/ethernet/intel/ice/virt/virtchnl.c

[ ... ]

> @@ -2533,6 +2539,10 @@ static const struct ice_virtchnl_ops ice_virtchnl_dflt_ops = {
>  	.cfg_q_quanta = ice_vc_cfg_q_quanta,
>  	.get_ptp_cap = ice_vc_get_ptp_cap,
>  	.get_phc_time = ice_vc_get_phc_time,
> +	.get_max_rss_qregion = ice_vc_get_max_rss_qregion,
> +	.ena_qs_v2_msg = ice_vc_ena_qs_v2_msg,
> +	.dis_qs_v2_msg = ice_vc_dis_qs_v2_msg,
> +	.map_q_vector_msg = ice_vc_map_q_vector_msg,

[ ... ]

> @@ -2766,6 +2780,13 @@ void ice_vc_process_vf_msg(struct ice_pf *pf, struct ice_rq_event_info *event,
>  		goto error_handler;
>  	}
>  
> +	/* VF must not see a config change before the reset that applies it */
> +	if (test_and_clear_bit(ICE_VF_STATE_NEEDS_RESET, vf->vf_states)) {
> +		dev_info(dev, "doing deferred reset of VF %d\n", vf_id);
> +		ice_reset_vf(vf, ICE_VF_RESET_NOTIFY);
> +		goto finish;
> +	}

[Severity: Low]
This isn't a bug, but the commit message leaves out several behaviour
changes made by this patch:

- It wires up four virtchnl handlers that a guest can reach for the first
  time: get_max_rss_qregion, ena_qs_v2_msg, dis_qs_v2_msg and
  map_q_vector_msg. It also adds vf_ops->get_q_vector for them. The
  allowlist already permits these opcodes once VIRTCHNL_VF_LARGE_NUM_QPAIRS
  is granted, and this patch is the first to grant that capability.

- The VIRTCHNL_OP_REQUEST_QUEUES grant policy changes for every VF. A
  request must now fit in the longest contiguous free Tx/Rx range from
  ice_vf_max_contig_qs(), not the total free count. VFs without
  LARGE_NUM_QPAIRS are capped at ICE_MAX_QS_PER_VF_VCV1. Requests above
  the LUT limit are answered without a log line.

- The deferred VF reset can also run synchronously here, on the VF's next
  mailbox message. That message is then dropped without a reply through
  goto finish.

- ice_set_vf_state_dis() now sets ICE_VF_STATE_DIS on every PF reset
  preparation, whether or not RSS LUTs are in use.

The second and fourth points are only described in the v4/v5 changelog
below the --- line, which won't be in git history. Could the commit message
mention these changes?

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> @@ -1450,3 +1473,52 @@ void ice_vf_update_mac_lldp_num(struct ice_vf *vf, struct ice_vsi *vsi,
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
> +	if (err) {
> +		devlink_free(devlink);
> +		return;
> +	}
> +
> +	vf->devlink = devlink;
> +	scoped_guard(devl, devlink) {
> +		ice_devlink_vf_resources_register(vf);
> +		devl_register(devlink);
> +	}
> +}
> +
> +void ice_deinit_vf_devlink(struct ice_vf *vf)
> +{
> +	struct devlink *devlink = vf->devlink;
> +
> +	lockdep_assert_held(&vf->pf->vfs.table_lock);
> +
> +	if (!devlink)
> +		return;
> +
> +	vf->devlink = NULL;
> +	scoped_guard(devl, devlink) {
> +		devl_unregister(devlink);
> +		devl_resources_unregister(devlink);
> +	}
> +	devlink_free(devlink);
> +}

[Severity: Medium]
Does this create an AB-BA ordering between pf->vfs.table_lock and the
PF devlink instance lock?

ice_ena_vfs() takes pf->vfs.table_lock and calls ice_start_vfs(). That
now calls ice_init_vf_devlink() for every VF, including in the default
legacy eswitch mode. The PF devlink lock is then taken here while
table_lock is held:

    ice_ena_vfs()
      mutex_lock(&pf->vfs.table_lock)
      ice_start_vfs()
        ice_init_vf_devlink()
          devl_lock(priv_to_devlink(pf))

ice_tear_down_devlink_rate_tree() takes the two locks in the opposite
order:

	devl_lock(devlink);
	mutex_lock(&pf->vfs.table_lock);

It is reached from two places:

- ice_setup_tc_mqprio_qdisc(), when ADQ is configured
- ice_pf_dcb_cfg(), when DCB is configured with more than one TC

sriov_numvfs_store() only holds the PF device_lock, not rtnl or
pf->tc_mutex. So enabling VFs while ADQ or DCB is being configured
looks like it could deadlock. Even when the two paths run one after
the other, lockdep should report a circular dependency.

Could devl_nested_devlink_set() be done after table_lock is dropped?
Alternatively, could ice_ena_vfs() take the PF devlink lock before
table_lock?

The lockdep_assert_held() on table_lock in ice_init_vf_devlink()
suggests the first option would need some other way to keep the VF
entry alive.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
