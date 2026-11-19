Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070704;
	b=R0jhI5RSTj9Ghl9qnlspA0Sb7gu2+3bOczH7XFhGEQGGDPLppfdvEz0YuuSELxjZ2bTw
	 hHSZ6s0DIHSxGuUDjAT26YlFj7yA6dUKnoAss/vbsOKXOhVclPftCma/dilXcD8AYLToY
	 AUjNY19D1TOQH+GpLbqDJiHTFgMhmXXmNYAddm+pPHFpnE6Z1XLgrZHtUWFXUuQXppJUS
	 6jg22n0OqqHxfZZ7RTqFUKFwomzfor3rWoa7hbK0t+cddAO6MAZiCII9fp+PbDw8++bVA
	 zWm5t1GB/YnlPWIW5GmB5wu8KI2njahQX69Gj9x4fQPt7gx+142pwMrcATlL2X08QZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070704;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SscW4jPT8Or0Syda4jZxOH9RJv46Uc4ZJHe6Zhovo4Q=;
	b=B8EtULmqDMp93eFoVyR1D2Z6WXLiGMSB59RC9dfJjH6OXs2OYVT/tWIzAOVg44vsVX2S
	 vbhkqTE5YvCVt2tg/dM9CPFJ2IOq5GVgX8q/SSV4PpGBItFL6URllFtwZVLZYrt2Zs62I
	 TFuQHbf4QHdE+zTYxu5hvIhev72etetUH76rqR1wO+2nXF5LMOtT/ye+uqQ79RqkkwJ3N
	 BDwFSfU/+7yRX5COJDx3jfTkitbQyaS6YWoBF4CQXpk5w2WRQXHIkckYeNVX/FunnfPob
	 0FzLiui7/S+cla4+PC2tlDF067OdSdPPTkSRx8pElhVp3VKV/U8fQ0n9+rgGn+RFLLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GE/uihCP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7760A2624
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GE/uihCP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95981F000C4;
	Thu, 19 Nov 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070703;
	bh=SscW4jPT8Or0Syda4jZxOH9RJv46Uc4ZJHe6Zhovo4Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GE/uihCPShiaZhq3bG15MHEM0FTZusWfqiq5FqaJSBeJvJE1TliHhnA0QhkAJXz8U
	 l3YS0mdqyTYloAYZeJjGbSlHggyPdx4hEDLddGdh7cAJE/5p3AcZYT/gAaLKJPvdxT
	 yDYZEOzZBCB3psnCblrOhUygArfISbvmFWXWow28S/dCIBVZypTWnu5yOaz4+qbPyP
	 iNNeLJu9JPAVVPqonduljtjzJzcRiWzJNTCzB2JePKaEuvOmtX+GFNbO4zbF/2gzBx
	 NyBn+KY/P/84i7YiQ4+ZAZYtjI3iuAsOdMjqHwKHYHX7jR0+7t/RZXj/MoO05aT4uP
	 O2hc49vSQs6Kw==
Subject:
 Re: [net-next v6 11/15] ice: introduce handling of virtchnl LARGE VF opcodes
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
Date: Thu, 19 Nov 2026 06:45:02 +0000
Message-ID: <179507070227.3136.5959529573012279667@kernel.org>
In-Reply-To: <20261117094913.100756-12-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-12-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch widens struct ice_q_vector::num_ring_rx/num_ring_tx
  from u8 to u16.
- [Medium] ice_vc_validate_qs_v2_msg() bounds each chunk (start_queue_id
  + num_queues <= min(num_vf_qs, 256)), and the only limit on num_chunks…

--

ice: introduce handling of virtchnl LARGE VF opcodes

This adds PF-side handlers for VIRTCHNL_OP_ENABLE_QUEUES_V2,
VIRTCHNL_OP_DISABLE_QUEUES_V2 and VIRTCHNL_OP_MAP_QUEUE_VECTOR. They are
allowlisted under VIRTCHNL_VF_LARGE_NUM_QPAIRS so that VFs can use more
than 16 queues. It also widens num_ring_rx/num_ring_tx in struct
ice_q_vector to u16.

> diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
> index 89a2bdbecf609..fc2e84136e247 100644
> --- a/drivers/net/ethernet/intel/ice/ice.h
> +++ b/drivers/net/ethernet/intel/ice/ice.h
> @@ -474,8 +474,8 @@ struct ice_q_vector {
>  
>  	u16 v_idx;			/* index in the vsi->q_vector array. */
>  	u16 reg_idx;			/* PF relative register index */
> -	u8 num_ring_rx;			/* total number of Rx rings in vector */
> -	u8 num_ring_tx;			/* total number of Tx rings in vector */
> +	u16 num_ring_rx;		/* total number of Rx rings in vector */
> +	u16 num_ring_tx;		/* total number of Tx rings in vector */

[Severity: Medium]

The v5 notes say these fields were widened because mapping all 256 queues
of a VF to one vector made the counters wrap. The main writer of these
fields still truncates to u8, though:

drivers/net/ethernet/intel/ice/ice_base.c:ice_vsi_map_rings_to_vectors() {
    ...
		u8 tx_rings_per_v, rx_rings_per_v;
		u16 q_id, q_base;

		/* Tx rings mapping to vector */
		tx_rings_per_v = (u8)DIV_ROUND_UP(tx_rings_rem,
						  q_vectors - v_id);
		q_vector->num_ring_tx = tx_rings_per_v;
    ...
		for (q_id = q_base; q_id < (q_base + tx_rings_per_v); q_id++) {
    ...
}

With 256 rings and one q_vector, DIV_ROUND_UP(256, 1) cast to u8 is 0.
That sets num_ring_tx to 0, links no rings and leaves ring->q_vector
unchanged. The Rx side has the same problem.

This function also runs on VF VSIs. ice_pf_dcb_recfg() calls it for every
VSI except ICE_VSI_CHNL. On resume, ice_reinit_interrupt_scheme() calls it
for every VSI right after it re-allocates the q_vectors.

Readers then use the truncated count. For example, ice_vsi_release_msix(),
which ice_vsi_free_irq() also calls for VF VSIs, does this:

	for (q = 0; q < q_vector->num_ring_tx; q++) {
		ice_write_itr(&q_vector->tx, 0);
		wr32(hw, QINT_TQCTL(vsi->txq_map[txq]), 0);

Wouldn't this skip clearing QINT_TQCTL/QINT_RQCTL for every one of these
queues?

On the resume path, can rings be left with ring->q_vector pointing at
q_vectors that were freed at suspend? ice_free_q_vector() only clears the
pointer for rings on the linked list, and VF rings mapped through virtchnl
are never on that list.

At the end of the series, this needs a VF with the PF LUT
(ICE_LUT_PF_MAX_QS = 256) and ICE_MIN_INTR_PER_VF MSI-X vectors, so
num_q_vectors = 1. The VF requests 256 queues, and then a DCB
reconfiguration or a suspend/resume runs. The u8 locals and the (u8) casts
in ice_vsi_map_rings_to_vectors() are still there at the end of the
series.

Should tx_rings_per_v/rx_rings_per_v and the casts be widened to u16 in
this patch as well?

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
> index 7f2b459dbc836..f87ccf5d370bb 100644
> --- a/drivers/net/ethernet/intel/ice/virt/queues.c
> +++ b/drivers/net/ethernet/intel/ice/virt/queues.c
> @@ -1046,3 +1046,342 @@ int ice_vc_request_qs_msg(struct ice_vf *vf, u8 *msg)

[ ... ]

> +static bool ice_vc_validate_qs_v2_msg(struct ice_vf *vf,
> +				      struct virtchnl_del_ena_dis_queues *qs_msg,
> +				      u16 msglen)
> +{
> +	u32 max_qs = min_t(u32, vf->num_vf_qs, ICE_MAX_QS_PER_VF);
> +
> +	if (msglen < virtchnl_struct_size(qs_msg, chunks, 0))
> +		return false;
> +
> +	if (msglen < virtchnl_struct_size(qs_msg, chunks, qs_msg->num_chunks))
> +		return false;

[ ... ]

> +	for (int i = 0; i < qs_msg->num_chunks; i++) {
> +		struct virtchnl_queue_chunk *chunk = &qs_msg->chunks[i];
> +		u32 end;
> +
> +		if (!ice_vc_supported_queue_type(chunk->type))
> +			return false;
> +
> +		if (!chunk->num_queues)
> +			return false;
> +
> +		end = chunk->start_queue_id + chunk->num_queues;
> +		if (end > max_qs)
> +			return false;
> +	}

[Severity: Medium]

Each chunk is bounds-checked here. Is anything rejecting duplicate or
overlapping chunks? The only limit on num_chunks is msglen.

For VIRTCHNL_OP_DISABLE_QUEUES_V2, ice_vc_dis_txq_chunk() calls
ice_vf_vsi_dis_single_txq() for every queue in every chunk. That helper
does not return early for queues that are already disabled:

drivers/net/ethernet/intel/ice/virt/queues.c:ice_vf_vsi_dis_single_txq() {
	if (!test_bit(q_id, vf->txq_ena))
		dev_dbg(ice_pf_to_dev(vsi->back), "Queue %u on VSI %u is not enabled, but stopping it anyway\n",
			q_id, vsi->vsi_num);
	...
	err = ice_vsi_stop_tx_ring(vsi, ICE_NO_RESET, vf->vf_id, ring, &txq_meta);
	...
}

Each ice_vsi_stop_tx_ring() call does an MMIO read-modify-write of
QINT_TQCTL, an ndelay(100), ice_trigger_sw_intr() and ice_dis_vsi_txq().
ice_dis_vsi_txq() takes pi->sched_lock and searches the Tx scheduler tree
with ice_sched_find_node_by_teid().

A 4 KiB mailbox message can hold the 8 byte header plus about 511 chunks,
each set to {type TX, start 0, num max_qs}. With 256 queues, that is about
130k stop-ring operations from one message. They run in the PF service
task with vf->cfg_lock held.

The v1 DISABLE_QUEUES bitmap limits this to at most 16 queues, and each
one is processed once.

Can a VF keep sending this message to keep the PF service task busy? That
would delay mailbox handling for other VFs, as well as AdminQ events and
resets. The validation and the Tx disable helper are unchanged at the end
of the series.

Could the validation build a bitmap of the requested queues and reject
overlapping chunks? Another option is to skip queues that are not set in
vf->txq_ena on the v2 path.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
