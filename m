Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557454;
	b=IrJEteS+/Uma0XVest3y+rg7iJ7UmYSZK2qaLSPksezna2JqOQnLVlh0pM8M9dPjPRG4
	 AU48y950YcA+WySQy0PRQU5j0t8ma4oBlTPOBI0lyd+xDfvC3+D06wmHLZQvrWTgpVy4z
	 7Nd+a9Ql8M5QeS1nIqKzHshMQcFZQrm9sNSAkqTPMvxxH8Wcz1tu8pdNCrZ0pO6LsSnKM
	 wao862uVVJMLm/ZiAPcZFpQJ+3R58lxOH5gItPS1Beh0G7NLD2wmWRw3KWK7gvhmquTfR
	 2qigYGDmiqsJ2yrnnVsXBkOUUAMGK/IaLUqYZpV8LYBIhSzU/2VRMBDf9MOmrnCcuww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557454;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lDauEOTc03t/mjQGLaYVyHGY3GQYT1TyjJExRGdHjj8=;
	b=Ig9y1+87pNHhXbQ8w/eVk9x1rDHfGEbfjgzT89ImBgAAb96HggBXBbDxd1OUeGkbZaDt
	 RyEkMXTf31P9WSKCTpUIgn+lki4BWkllg1G1BjNdvJr2HWoOfbMbUET2k6sey3EvVBF+4
	 I1DQGfKodlIC2y9Q89N2rwZZYdMQDhE2C/CB3G0t2xBxV8TsdQbXKEi+ap92aryoUsP7u
	 biq+uzCKxwbxTVHi6YzhAo4TzzIPjYcnD+FIRYSo3KnXPtwFtfwZtBnDv/i9jx1bNHIL4
	 Ul3lISIjX7UkSTGsKku9tdgnyaHLVYIBHixJfM7efjcvBLxIqQvO/O+T6bi0ENjNFcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LafbdpH4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C966606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LafbdpH4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DFA1F000C0;
	Tue, 24 Nov 2026 21:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557453;
	bh=lDauEOTc03t/mjQGLaYVyHGY3GQYT1TyjJExRGdHjj8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LafbdpH4LFnDMSnuqJ2CBBGJQUkZCvRH1QwV3f2se6cy10kIZGfGPVgbzQHjuqdHH
	 1yjPQvEN8JXMme/rw7oRAUIr2wGSoyKQefMDWfxIVziS2/Dzst3GYohUYalCKEaS14
	 Iz7/OvBmBMYoRsCrbyJ9f0zM7qk2a2tXqnQ1JRpakzMtc3uWWohCx20n7kqanUJR4/
	 2j+c8y0SKGY+ITRJTBun/uNNZo+7jclD6sTsQme+mL8wO7zU6ofzbwsBEe8TRStvY5
	 7jo3oaYxlDdOsiZQtQBbQDqfngj3E2agTnKSAiAqqbZriPyXO/sTOms9uZF2SUvFG9
	 pCVuFuV2R3x/g==
Subject: Re: [PATCH net-next v7 06/15] ice: bump to 256qs for VF
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
Date: Tue, 24 Nov 2026 21:57:31 +0000
Message-ID: <179555745171.3135.7481127088391251734@kernel.org>
In-Reply-To: <20261121230123.316391-7-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-7-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 (2) · Medium: 4 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The err_scatter rollback in __ice_vsi_get_qs_sc() clears the
  wrong bits when vsi_map_offset != 0: clear_bit(qs_cfg->vsi_map[index],…
- [Medium] This feature commit carries fixes for bugs that already exist,
  without Fixes: tags and without splitting them out.
- [Medium] The patch makes __ice_vsi_get_qs() fail whenever the
  contiguous search fails and q_count exceeds scatter_count (16).
- [Medium] The kernel-doc of the new helper ice_lag_cfg_lan_txq() defines
  '@numq: number of queues in @qbuf', i.e. the count that…
- [Medium] The new ice_lag_cfg_lan_txq() splits the queue move
  (ICE_AQC_Q_CFG_TC_CHNG) into several ice_aq_cfg_lan_txq() commands of…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  resizes lag->q_home[][] to ICE_MAX_QS_PER_VF (256) and still never…
- [High] This problem wasn't introduced by this patch, but the patch
  edits these exact lines: ice_init_lag() frees struct ice_lag (now…

--

ice: bump to 256qs for VF

This commit resizes the VF bitmaps and arrays in ice for 256 queues per
VF. The legacy virtchnl opcodes keep the 16 queue limit. It also makes the
__ice_vsi_get_qs() scatter fallback fail instead of truncating, reworks
the ice_vc_cfg_qs_msg() rollback, sends LAG queue moves in commands of up
to U8_MAX queues each, and allocates struct ice_lag with kvzalloc_obj().

> Disable only the queue pairs that passed validation when
> ice_vc_cfg_qs_msg() fails, by their queue IDs instead of their index in
> the message, as the queue config can now come in many messages.

[Severity: Medium]
Do some of these changes fix bugs that exist before this series?

The old scatter clamp in __ice_vsi_get_qs() already breaks the ring
mapping for VFs. ice_sriov_set_msix_vec_count() sets
vf->num_vf_qs = queues with no 16 queue cap, so a VF can have more than 16
queues today.

Before this patch, a __ice_vsi_get_qs() failure in ice_prepare_xdp_rings()
jumped to err_map_xdp and ran:

	clear_bit(vsi->txq_map[i + vsi->alloc_txq], pf->avail_txqs);

Those txq_map slots hold 0 (freshly allocated, or zeroed by the scatter
unwind), or ICE_INVAL_Q_INDEX after an earlier XDP teardown. Doesn't that
free PF queue 0, which the main VSI still uses, or clear bit 0xffff past
the end of avail_txqs?

The old ice_vc_cfg_qs_msg() rollback disabled queues 0..i by message
index. A single message can already carry qpair[] entries whose queue_id
differs from their index. The commit message gives the reason as "the
queue config can now come in many messages".

Could these be split out with Fixes: tags so stable kernels pick them up?

> diff --git a/drivers/net/ethernet/intel/ice/ice_base.c b/drivers/net/ethernet/intel/ice/ice_base.c
> index 1667f686ff751..f65634e3d44ef 100644
> --- a/drivers/net/ethernet/intel/ice/ice_base.c
> +++ b/drivers/net/ethernet/intel/ice/ice_base.c

[ ... ]

> @@ -817,11 +817,9 @@ int __ice_vsi_get_qs(struct ice_qs_cfg *qs_cfg)
>  	int ret = 0;
>  
>  	ret = __ice_vsi_get_qs_contig(qs_cfg);
> -	if (ret) {
> +	if (ret && qs_cfg->q_count <= qs_cfg->scatter_count) {
>  		/* contig failed, so try with scatter approach */
>  		qs_cfg->mapping_mode = ICE_VSI_MAP_SCATTER;
> -		qs_cfg->q_count = min_t(unsigned int, qs_cfg->q_count,
> -					qs_cfg->scatter_count);
>  		ret = __ice_vsi_get_qs_sc(qs_cfg);
>  	}
>  	return ret;

[Severity: Medium]
With this change, __ice_vsi_get_qs() fails whenever no contiguous range is
free and q_count is above scatter_count. Can ordinary fragmentation now
trigger a Tx queue leak in ice_vsi_get_qs()?

ice_vsi_get_qs() takes the Tx queues first and then the Rx queues:

ice_vsi_get_qs() {
    ...
	ret = __ice_vsi_get_qs(&rx_qs_cfg);
	if (ret)
		return ret;
    ...
}

This return does not release the Tx bits just set in pf->avail_txqs.

ice_vsi_cfg_def() then does goto unroll_vsi_alloc_stat, which skips
unroll_get_qs and ice_vsi_put_qs(). ice_vsi_free_arrays() then frees
txq_map, so nothing can find those Tx bits again.

Before this patch, this Rx failure needed fewer than min(alloc_rxq, 16)
free Rx queues in total. Now any VSI with more than 16 Rx queues can hit
it when the Rx bitmap has no contiguous range. Examples are asymmetric
ethtool -L changes, sriov_vf_msix_count writes or SF churn.

> diff --git a/drivers/net/ethernet/intel/ice/ice_lag.c b/drivers/net/ethernet/intel/ice/ice_lag.c
> index 08a17ded0ad55..4bb28564c0d65 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lag.c
> +++ b/drivers/net/ethernet/intel/ice/ice_lag.c
> @@ -549,6 +549,41 @@ ice_lag_qbuf_recfg(struct ice_hw *hw, struct ice_aqc_cfg_txqs_buf *qbuf,
>  	return count;
>  }
>  
> +/**
> + * ice_lag_cfg_lan_txq - reconfigure queues for a new port
> + * @hw: HW struct to send the command on
> + * @qbuf: buffer filled by ice_lag_qbuf_recfg(), gets modified
> + * @numq: number of queues in @qbuf
> + * @oldport: lport of the current queues location
> + * @newport: lport of the destination queues location
> + *
> + * One command takes up to U8_MAX queues, a VF could have more.
> + *
> + * Return: 0 on success, negative on failure.
> + */
> +static int
> +ice_lag_cfg_lan_txq(struct ice_hw *hw, struct ice_aqc_cfg_txqs_buf *qbuf,
> +		    u16 numq, u8 oldport, u8 newport)
> +{
> +	while (numq) {
> +		int num = min(numq, U8_MAX);
> +		int err;
> +
> +		err = ice_aq_cfg_lan_txq(hw, qbuf,
> +					 struct_size(qbuf, queue_info, num),
> +					 num, oldport, newport,
> +					 ICE_AQC_Q_CFG_TC_CHNG, NULL);
> +		if (err)
> +			return err;

[Severity: Medium]
If a later ice_aq_cfg_lan_txq() command fails here, the queues moved by
earlier commands stay on newport. Does anything handle that partial move?

All three callers treat any error as meaning nothing moved:

- ice_lag_move_vf_node_tc() goes to qbuf_err.
- ice_lag_reclaim_vf_tc() goes to reclaim_qerr.
- ice_lag_move_vf_nodes_tc_sync() goes to sync_qerr.

Each then skips ice_aq_move_sched_elems() for the VSI node and resumes
traffic.

That would leave some of the VF's queues for that TC on the destination
port. The rest, and the VSI scheduler node, stay on the source port, and
the driver does not record the split. This needs more than 255 queues in
one TC, which 256 queue VFs now allow.

[ ... ]

> @@ -689,8 +724,7 @@ ice_lag_move_vf_node_tc(struct ice_lag *lag, u8 oldport, u8 newport,
>  		goto qbuf_none;
>  	}
>  
> -	if (ice_aq_cfg_lan_txq(&lag->pf->hw, qbuf, qbuf_size, valq, oldport,
> -			       newport, ICE_AQC_Q_CFG_TC_CHNG, NULL)) {
> +	if (ice_lag_cfg_lan_txq(&lag->pf->hw, qbuf, valq, oldport, newport)) {
>  		dev_warn(dev, "Failure to configure queues for LAG failover\n");
>  		goto qbuf_err;
>  	}
> @@ -1277,9 +1311,8 @@ ice_lag_reclaim_vf_tc(struct ice_lag *lag, struct ice_hw *src_hw, u16 vsi_num,
>  		goto reclaim_none;
>  	}
>  
> -	if (ice_aq_cfg_lan_txq(hw, qbuf, qbuf_size, numq,
> -			       src_hw->port_info->lport, hw->port_info->lport,
> -			       ICE_AQC_Q_CFG_TC_CHNG, NULL)) {
> +	if (ice_lag_cfg_lan_txq(hw, qbuf, numq, src_hw->port_info->lport,
> +				hw->port_info->lport)) {

[Severity: Medium]
Should this pass valq rather than numq?

The kernel-doc of ice_lag_cfg_lan_txq() says "@numq: number of queues in
@qbuf", and ice_lag_move_vf_node_tc() above passes valq.

Here numq is ctx->num_lan_q_entries[tc]. ice_lag_qbuf_recfg() skips queues
with no q_ctx, ICE_INVAL_TEID or ICE_INVAL_Q_HANDLE, and fills only valq
entries.

When a VF has configured fewer Tx queues than it was allocated, entries
[valq, numq) of the kzalloc'ed qbuf (q_handle 0, q_teid 0) are sent to
firmware. With the chunking, those entries can also land in a later
command after earlier commands have already moved real queues.

The new ice_lag_cfg_lan_txq() call in ice_lag_move_vf_nodes_tc_sync() also
passes numq.

>  		dev_warn(dev, "Failure to configure queues for LAG failover\n");
>  		goto reclaim_qerr;
>  	}

[ ... ]

> @@ -2651,7 +2683,7 @@ int ice_init_lag(struct ice_pf *pf)
>  	ice_free_hw_res(&pf->hw, ICE_AQC_RES_TYPE_RECIPE, 1,
>  			&lag->pf_recipe);
>  lag_error:
> -	kfree(lag);
> +	kvfree(lag);
>  	pf->lag = NULL;
>  	return err;
>  }

[Severity: High]
This is a pre-existing issue, but since these lines are being changed: can
this free lag while &lag->notif_block is still registered?

ice_init_lag() calls ice_register_lag_handler(lag), which registers
lag->notif_block with register_netdevice_notifier(). That happens before
the ice_create_lag_recipe() calls.

If one of those calls fails, the path through free_lport_res and
free_rcp_res to lag_error does kvfree(lag) and sets pf->lag = NULL. It
never calls ice_unregister_lag_handler().

ice_init_features() only warns, so the probe continues. ice_deinit_lag()
later returns early because pf->lag is NULL.

The netdev notifier chain then keeps a notifier_block that lives in freed
memory. On bonding events, ice_lag_event_handler() gets the freed lag
back through container_of().

The changelog says this will be fixed separately.

> diff --git a/drivers/net/ethernet/intel/ice/ice_lag.h b/drivers/net/ethernet/intel/ice/ice_lag.h
> index 4bfffecbdc975..39f6a6cc844d8 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lag.h
> +++ b/drivers/net/ethernet/intel/ice/ice_lag.h
> @@ -52,7 +52,7 @@ struct ice_lag {
>  	u8 bond_lport_sec; /* lport values for secondary PF */
>  
>  	/* q_home keeps track of which interface the q is currently on */
> -	u8 q_home[ICE_MAX_SRIOV_VFS][ICE_MAX_QS_PER_VF_VCV1];
> +	u8 q_home[ICE_MAX_SRIOV_VFS][ICE_MAX_QS_PER_VF];

[Severity: High]
This isn't a bug introduced by this patch, but the code still does not
check a VF's queue count against the size of q_home[][]. Can a VF with
more than 256 Tx queues overflow q_home[vf_id][]?

ice_sriov_set_msix_vec_count() (sriov_vf_msix_count in sysfs) sets
vf->num_vf_qs = queues. The only limits are min(avail_txq, avail_rxq) and
ICE_MIN_INTR_PER_VF. ice_vsi_get_num_qs() then sets alloc_txq to
num_req_qs ?: num_vf_qs, also with no cap.

ice_lag_aa_move_vf_qs() loops over num_q = num_lan_q_entries[0], and both
reads and writes lag->q_home[vf_id][i]:

ice_lag_aa_move_vf_qs() {
    ...
	for (int i = 0; i < num_q; i++) {
    ...
		lag->q_home[vf_id][i] = dest;
    ...
}

With i >= ICE_MAX_QS_PER_VF, this writes into the next VF's row. For the
last vf_id values it writes past the array into lag->sec_vf[], and those
VSI pointers are dereferenced later.

The later commit "ice: support up to 256 VF queues" adds only a contiguity
check (ice_vf_max_contig_qs()) in ice_sriov_set_msix_vec_count(), not a
256 queue cap. So this looks like it remains at the end of the series.

>  
>  	/* placeholder VSI for hanging VF queues from on secondary interface */
>  	struct ice_vsi *sec_vf[ICE_MAX_SRIOV_VFS];

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 0bc53f404957f..3e8cf1c5f0e81 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -2758,7 +2758,6 @@ int ice_prepare_xdp_rings(struct ice_vsi *vsi, struct bpf_prog *prog,
>  			vsi->xdp_rings[i] = NULL;
>  		}
>  
> -err_map_xdp:
>  	mutex_lock(&pf->avail_q_mutex);
>  	ice_for_each_xdp_txq(vsi, i) {
>  		clear_bit(vsi->txq_map[i + vsi->alloc_txq], pf->avail_txqs);
> @@ -2766,6 +2765,7 @@ int ice_prepare_xdp_rings(struct ice_vsi *vsi, struct bpf_prog *prog,
>  	}
>  	mutex_unlock(&pf->avail_q_mutex);
>  
> +err_map_xdp:
>  	devm_kfree(dev, vsi->xdp_rings);
>  	vsi->xdp_rings = NULL;
>  

[Severity: High]
With the label moved, a failed __ice_vsi_get_qs() leaves all bitmap
cleanup to the helper. Does the err_scatter rollback in
__ice_vsi_get_qs_sc() work when vsi_map_offset is not 0?

__ice_vsi_get_qs_sc() {
    ...
err_scatter:
	for (index = 0; index < i; index++) {
		clear_bit(qs_cfg->vsi_map[index], qs_cfg->pf_map);
		qs_cfg->vsi_map[index + qs_cfg->vsi_map_offset] = 0;
	}
    ...
}

The slots it filled are vsi_map[index + vsi_map_offset], but the bits it
clears come from vsi_map[index].

ice_prepare_xdp_rings() passes .vsi_map = vsi->txq_map and
.vsi_map_offset = vsi->alloc_txq. A scatter allocation that fails part-way
would therefore:

- mark the VSI's live LAN Tx queues (txq_map[0..i-1]) as free in
  pf->avail_txqs
- leak the XDP bits it just set

The scatter path can still run for num_xdp_txq <= 16 when the contiguous
search fails. It can fail part-way if a concurrent allocation takes Tx
queues between ice_vsi_determine_xdp_res() and ice_prepare_xdp_rings().
Examples are a VF reset or a sriov_vf_msix_count write, which do not hold
rtnl.

A later VSI allocation could then get a hardware Tx queue that the PF VSI
is still using.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
