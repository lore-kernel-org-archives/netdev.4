Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070698;
	b=j6zi/hE8Aoos5vE801oFbTdNwCZ3DBccfOMx8Tw+NPIO8ZNp1caJZhVp8P0wvrY9thnC
	 2MmpAl755zKfHfzeJi/iTT9TtrtfxpvFD8dt2s0EkxbT+lCKKkgvKZlpoIQlJBiRRxOql
	 xe8ekPoLRb84MPnEbkiPctfuN5m/ZUYhuADdfTGRTSuarHGx2Tn9gMDg5Sk7MvIzLG82e
	 8i8SIheXsAVWMplVR8vUjBoh51ukodxeWM+OUH8ebcUKgXryzeNHVjZ0kYlk4aO3eWPSa
	 cUEoW9zKLpd+7jJeObFO3up5gr9Ex821/NiGOAJQvAijE4UqubJelTwuX2jqSRZquDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070698;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4g6UqbJYoWB4dWQzewc5NsAi2MteBmflyRsOTCVmnxA=;
	b=ern6uzwpOsIy50FrOvHK+iDVdeNmAWvlC5uq20xMN2vM8TSshyTYc4WeKLSXGMkRpsun
	 RyoKq8CgoMIXepof7E820+o/GGbuzhYjQWyX2DvVuWFKgz8d8RgGKldxpjZvG5CjTWYNc
	 wwxUGeU/sC3P8uDje1zu0X3r+FNOGiofIVPadl1TNwQPEVXtzCsthrb8S1YA2YTIfDNuE
	 ob5LUWh+hGLpn6RbUlNU9vXuwHhceowv+l+5Vxy+HYX1SH7VYLigyRYP9T6i3WtGyRCR0
	 boeOq/jbyZk01ghoZggizfvoOW/qEtvgjwMSMrTd96GzLyZ6KrTjBjy7omsy0WVe2nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LD13h0e7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094860A2600
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LD13h0e7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400471F000C4;
	Thu, 19 Nov 2026 06:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070698;
	bh=4g6UqbJYoWB4dWQzewc5NsAi2MteBmflyRsOTCVmnxA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LD13h0e7jrfrIG/+dBBUciLgG7UmIAcgx9ESdRLDNV1Mvw9ghr0F2WTdS8ZQplBE5
	 rXbpmRlLAAm7GdvIo6AmGiQ415vdgVtFywT0r/srihX6tpEuUues6aOUk9cjreBo0u
	 dmdmGqV/X98l4IDgny/vEBID5a9wDnmis4j2zeOCOoyMGpZSn1lZhlOTI77YmWCS4o
	 HN67xQFqZkWzYPTMS7mrBxdcVdXqyDjrVLBVcNp0TU2EGeOYeFVqewHQzUF8DttRYF
	 9hrPj7CG8n1DY/wCYLVBmk/8yN00AZMjB1jpeQeCb6rY3F99PVIdTgwZTFo/jFWVYI
	 6l+O9GKxHZV8w==
Subject: Re: [net-next v6 06/15] ice: bump to 256qs for VF
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
Date: Thu, 19 Nov 2026 06:44:56 +0000
Message-ID: <179507069682.3136.17019862181092608378@kernel.org>
In-Reply-To: <20261117094913.100756-7-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-7-przemyslaw.kitszel@intel.com>
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

Critical: 0 · High: 0 (1) · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message does not match the code.
- [Medium] ice_lag_cfg_lan_txq()
  (drivers/net/ethernet/intel/ice/ice_lag.c) splits the…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it is worth
  reporting.

--

ice: bump to 256qs for VF

This commit resizes the ice per-VF bitmaps and arrays (txq_ena, rxq_ena,
qs_bw, LAG q_home) from 16 to 256 queues and widens num_req_qs. It raises
the VIRTCHNL_OP_REQUEST_QUEUES limit to 256. It also splits the LAG
cfg_txqs admin queue command into chunks of at most U8_MAX queues.

> Raise also the limits for the default VF queue count and for
> VIRTCHNL_OP_REQUEST_QUEUES to 256. New virtchnl opcodes, needed to
> make use of more than 16 queues, are handled by subsequent commits
> of this series, the work is split for easier review.

[Severity: Medium]
Is the default VF queue count actually raised by this patch? In
ice_set_per_vf_res() the count is still bounded by the MSI-X count:

    num_txq = min_t(u16, num_msix_per_vf - ICE_NONQ_VECS_VF,
                    ICE_MAX_QS_PER_VF);

num_msix_per_vf is at most ICE_NUM_VF_MSIX_MED (17) and ICE_NONQ_VECS_VF
is 1, so the default stays at 16 or below.

Several functional changes are described only in the v2/v3/v5 notes
below the --- line. Those notes are dropped when the patch is applied:

- ice_vc_cfg_qs_msg() now rolls back by qpair[].rxq.queue_id, up to
  last_valid. Before, it used the qpair index i, which could be left over
  from the CRC check loop, so it could disable the wrong queues. That
  looks like a separate fix.

- ice_lag_cfg_lan_txq() splits the LAG cfg_txqs command into chunks of
  at most U8_MAX queues.

- ice_vsi_set_rss_params() changes vsi->rss_size for VF VSIs from 16
  to 256.

- struct ice_lag is now allocated with kvzalloc, since q_home grows
  to 64KB.

Could the commit message describe these changes? Could the rollback fix
in ice_vc_cfg_qs_msg() go in its own patch?

> diff --git a/drivers/net/ethernet/intel/ice/ice_lag.c b/drivers/net/ethernet/intel/ice/ice_lag.c
> index 08a17ded0ad55..4bb28564c0d65 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lag.c
> +++ b/drivers/net/ethernet/intel/ice/ice_lag.c
> @@ -549,6 +549,41 @@ ice_lag_qbuf_recfg(struct ice_hw *hw, struct ice_aqc_cfg_txqs_buf *qbuf,
>  	return count;
>  }
>  

[ ... ]

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
If the second or a later ice_aq_cfg_lan_txq() call fails, firmware has
already moved the Tx queues of the earlier chunks from oldport to
newport. Does anything move them back?

All three callers, ice_lag_move_vf_node_tc(), ice_lag_reclaim_vf_tc()
and ice_lag_move_vf_nodes_tc_sync(), treat the error as if nothing was
applied. They skip ice_aq_move_sched_elems() for the VF VSI node and
resume the subtree:

    ice_lag_move_vf_node_tc()
        if (ice_lag_cfg_lan_txq(&lag->pf->hw, qbuf, valq, oldport, newport)) {
            dev_warn(dev, "Failure to configure queues for LAG failover\n");
            goto qbuf_err;
        ...
    qbuf_err:
        kfree(qbuf);
    resume_traffic:
        ice_sched_suspend_resume_elems(&lag->pf->hw, 1, &tmp_teid, false)

The VF's Tx queues would then be split across the two ports, while the
VSI scheduler node stays under the old port's tree. That would last
until the next failover or VF reset.

Before this change the move was a single command, which firmware either
applied in full or rejected in full.

> +
> +		numq -= num;
> +		memmove(qbuf->queue_info, &qbuf->queue_info[num],
> +			numq * sizeof(*qbuf->queue_info));
> +	}
> +
> +	return 0;
> +}

[ ... ]

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
>  
>  	/* placeholder VSI for hanging VF queues from on secondary interface */
>  	struct ice_vsi *sec_vf[ICE_MAX_SRIOV_VFS];

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. Is
the per-VF queue count capped at ICE_MAX_QS_PER_VF anywhere?

ice_sriov_set_msix_vec_count() takes its value from a write to the
sriov_vf_msix_count sysfs file:

    queues = msix_vec_count;
    ...
    if (queues > min(ice_get_avail_txq_count(pf),
                     ice_get_avail_rxq_count(pf)))
        return -EINVAL;
    ...
    vf->num_vf_qs = queues;

The VF VSI then gets alloc_txq = alloc_rxq = num_vf_qs, and
num_lan_q_entries[0] follows alloc_txq.

In ice_lag_aa_failover() the loop is bounded by
num_q = pv_ctx->num_lan_q_entries[0], and it does:

    lag->q_home[vf_id][i] = dest;

For i >= 256, can this write into the next VF's row? For the highest
vf_id, can it write into sec_vf[], which follows q_home in struct
ice_lag, or past the end of the allocation?

The same question applies without LAG. ice_vc_cfg_qs_msg() accepts any
queue_id below vsi->alloc_txq and passes it to
ice_vf_vsi_dis_single_txq(). That function does
test_bit()/clear_bit(q_id, vf->txq_ena) on a 256-bit bitmap. Can a
queue_id >= 256 chosen by the guest clear bits in rxq_ena or in later
fields of struct ice_vf?

The same uncapped path existed before, with the 16-entry sizes. The
later patches in the series don't seem to add a cap in
ice_sriov_set_msix_vec_count() either.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
