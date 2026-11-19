Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070702;
	b=UK1Mh5VllLgck30rUwZSU98eV9gFhnn9q0EYcf9CtTBUQGPO1Y9wyEyuLqdu/e496cpB
	 xX8+07c1K60Y5CPKZaNqoJyjc3M0p9xvWwOOJnXEHoowOCt9oXcBay2QFfWqHdBOd/iJ7
	 9SoVMKF0IeYHDmlR2iyb/RAqwi5j0dWn2aU1WUK01d7tS03Caajkj7SjzbmwJUhD0wCSJ
	 I0rq5OELKY+rFUp2XRdkUqen9jGtlmzHLPZULM2JRBHJ/1uzMpVH6AutE/flDB9iJChsl
	 uXvJmRaBDPg2As463a9fm4l4DInYx6nXVEc0rHArSPNVV1UBF2NdGcdYCcbiJplT9+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070702;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DVhf8E6vU45fi1fFp/xQin1xd76pOaf12Vox7bZew1M=;
	b=05wQvP4jtFdnRvLAu7dgiCzxFNC2IVmS2f23+9+Q1R7CZrQL2tjcUTuLW9BFtC78BzxD
	 uFOmGOXNV+tEKo26iHJcPrA2Xq2W3HYGcujw54bWyNi0W3zXJdb7Jap3/m6UvE5tJq919
	 Uhzi9tgJCrhS/g4ZJjJFJL/Sd7+F1k+dGyei4XcmyT5sBDiFiTWGtJtfqSc8qPQYC6GTy
	 MtL0xqHI8cqfZBX3TQwdlYrZ85KAdKEGV1t/ZcrBXPqjoE+0A3McGOxkOkSWSAdpLJdcq
	 bN46VgmTMhqxUfReGQFlQTHAnyr1quV22jAtMuVEUs6BXcfWYIgfJTn7tiJQCRTNreQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6rrkELB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFCC606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6rrkELB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9331F000CB;
	Thu, 19 Nov 2026 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070702;
	bh=DVhf8E6vU45fi1fFp/xQin1xd76pOaf12Vox7bZew1M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d6rrkELBP+Vxw+MGuvPA1EGKyKjD2tkdFmkbglIPB2/umvu9vrsqqDhbZ5rY0Xjs1
	 Z4LIHicSQTOGZqHhUDC0eFtNFCgCYCqxlDdUW0Ob2P7NyWWUnHyP7j8das4cM1Zsfi
	 YwPV0dOdJTzFm92DcuE8AqbXMk5Pd1inr/1+51EIkAi0lSAqUe3jVn6xhbFFaRo2p6
	 731c+wCzNsyqgrOZn+mJ+haoHQ7nO+GePU/zV87zsGK2477ORW5QsB1JL2GUORIdET
	 AECfsuUMZfPqyZnGh48WBz+yReBoSL+t+ClmQt9fGKU8GMh1+0dWaBv6LGWhm4VvRU
	 nLCiTbA9MrLKw==
Subject:
 Re: [net-next v6 10/15] iavf: use new opcodes to request more than 16 queues
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
Date: Thu, 19 Nov 2026 06:45:00 +0000
Message-ID: <179507070042.3136.3855498470367554970@kernel.org>
In-Reply-To: <20261117094913.100756-11-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-11-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 13 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 6 · Low: 7

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message leaves out a major behaviour change and
  gets the init ordering wrong.
- [Medium] Possible out-of-bounds write in iavf_map_vector_to_rxq().
- [Medium] The fix for RSS key/LUT size changes across a reset is
  incomplete.
- [Medium] qregion_width from VIRTCHNL_OP_GET_MAX_RSS_QREGION is used as
  a shift count in BIT(width) with no range check, both at init…
- [Medium] iavf: iavf_get_channels() reports old count while queue
  request is in flight
- [Medium] iavf: IAVF_FLAG_REINIT_MSIX_NEEDED not cleared in
  iavf_reset_step() when down
- [Low] This feature patch also fixes a bug that affects every PF:
  adapter->aq_wait_count is never reset.
- [Low] The commit message lists 'two changes in
  iavf_parse_vf_resource_msg()' plus the aq_wait_count reset as the…
- [Low] iavf_send_max_rss_qregion() drops the return value of
  iavf_send_pf_msg() and always returns 0 once current_op is set.
- [Low] iavf_virtchnl_completion() now does `if
  (iavf_parse_vf_resource_msg(adapter)) break;` with the comment 'a…
- [Low] In LARGE mode, iavf_get_channels() can report combined_count
  (num_active_queues) larger than max_combined (iavf_max_channels() =…
- [Low] The VIRTCHNL_OP_GET_MAX_RSS_QREGION case in
  iavf_virtchnl_completion() refills the LUT and calls iavf_config_rss()…
- [Low] The new VIRTCHNL_OP_GET_MAX_RSS_QREGION completion handler runs
  iavf_fill_rss_lut() and iavf_config_rss() whenever the reported width…

--

iavf: use new opcodes to request more than 16 queues

This adds the VIRTCHNL_VF_LARGE_NUM_QPAIRS capability and the
GET_MAX_RSS_QREGION, ENABLE/DISABLE_QUEUES_V2 and MAP_QUEUE_VECTOR
opcodes, so the VF can use more than 16 queues. ethtool -L goes through
iavf_request_queues() in LARGE mode. The patch also changes
iavf_parse_vf_resource_msg() to handle the PF lowering queue counts or
RSS key/LUT sizes across a reset, and it resets aq_wait_count on recovery.

> The VIRTCHNL_OP_GET_MAX_RSS_QREGION is exchanged right after the VF
> resource message is received. This is done similar to the PTP and other
> extended cap exchanges.

[ ... ]

> Use the new iavf_request_queues() for ethtool -L.

[Severity: Medium]
The commit message only mentions iavf_request_queues() for ethtool -L.
However, iavf_parse_vf_resource_msg() now also sends
VIRTCHNL_OP_REQUEST_QUEUES during probe when both LARGE_NUM_QPAIRS and
OFFLOAD_REQ_QUEUES are negotiated:

    if (init_req) {
        qnum = min_t(int, num_online_cpus(), IAVF_MAX_REQ_QUEUES);
        ...
        return iavf_request_queues(adapter, qnum);
    }

If the PF grants the request, it resets the VF during probe. The new
iavf_init_recv_req_queues() step can send a second request after a
denial. Only the v3/v4 changelog below the --- line describes this, and
that part is dropped when the patch is applied.

Could the commit message describe this init-time request?

Also, is "right after the VF resource message is received" accurate for
the init path? iavf_init_process_extended_caps() handles the RSS qregion
exchange last. It comes after the queue request wait, VLAN V2, RXDID and
PTP.

> Two changes in iavf_parse_vf_resource_msg() apply to every PF: when the
> PF reports fewer queue pairs than the VF has in use (PF has lowered its
> limit on reset), reinit queues and MSI-X with that count; when the RSS
> key or LUT size changes across a reset, reallocate both and fill them
> again.

[Severity: Low]
Is this list complete? Several other changes also affect every PF, or
can be seen by users. Only the changelog below the --- line explains them:

  - iavf_validate_num_queues() now clamps PFs without LARGE_NUM_QPAIRS
    to IAVF_MAX_VSI_QP (16) instead of IAVF_MAX_REQ_QUEUES
  - the iavf_init_get_resources() error path now memsets
    adapter->vf_res instead of freeing it
  - an error reply to VIRTCHNL_OP_REQUEST_QUEUES is now treated as a
    denial
  - iavf_reset_step() clears num_req_queues when interrupts are not
    reinitialized
  - IAVF_FLAG_AQ_REQUEST_QUEUES now survives a hardware reset and
    iavf_reset_step()
  - in LARGE mode, max_combined becomes BIT(qregion_width), and
    ethtool -L can return -EBUSY or finish asynchronously
  - virtchnl_vc_validate_vf_msg(), which PF drivers share, gets new
    opcode cases

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
> index e7cf12eaa2689..07beff9c1983b 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c

[ ... ]

> @@ -1683,6 +1688,19 @@ static int iavf_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
>  
>  	return ret;
>  }
> +
> +/* in LARGE mode PF gives us up to its RSS region once it has told us that */
> +static u32 iavf_max_channels(struct iavf_adapter *adapter)
> +{
> +	u16 width = adapter->max_rss_qregion.qregion_width;
> +
> +	if (LARGE_NUM_QPAIRS_SUPPORT(adapter) && width &&
> +	    adapter->vf_res->vf_cap_flags & VIRTCHNL_VF_OFFLOAD_REQ_QUEUES)
> +		return BIT(width);

[Severity: Medium]
Can this let ethtool -L request more than IAVF_MAX_REQ_QUEUES queues?
BIT(width) comes straight from the PF and is not clamped.
iavf_set_channels() only checks num_req > iavf_max_channels(adapter).

If the PF reports qregion_width >= 9, combined N > 256 is accepted and
queued:

iavf_process_aq_command()
  iavf_request_queues(adapter, N)
    adapter->num_req_queues = N;
    adapter->flags |= IAVF_FLAG_REINIT_ITR_NEEDED;

Then on the next VF reset:

iavf_reset_step()
  iavf_reinit_interrupt_scheme()
    iavf_init_interrupt_scheme()
      iavf_alloc_queues()
        if (adapter->num_req_queues)
            num_active_queues = adapter->num_req_queues;
    iavf_map_rings_to_vectors()
      iavf_map_vector_to_rxq()
        set_bit(r_idx, q_vector->ring_mask);

ring_mask is DECLARE_BITMAP(ring_mask, IAVF_MAX_REQ_QUEUES). Does this
write past the end of ring_mask once r_idx >= 256? The netdev also has
only IAVF_MAX_REQ_QUEUES tx/rx queues.

Before this patch, the bound was vsi_res->num_queue_pairs, which
iavf_validate_num_queues() caps. In-tree ice reports a width of at most 8,
so this needs a PF that reports a larger width.

Could the return value be clamped to IAVF_MAX_REQ_QUEUES here?

> +
> +	return adapter->vsi_res->num_queue_pairs;
> +}
> +
>  /**
>   * iavf_get_channels - get the number of channels supported by the device
>   * @netdev: network interface device structure
> @@ -1697,12 +1715,15 @@ static void iavf_get_channels(struct net_device *netdev,
>  	struct iavf_adapter *adapter = netdev_priv(netdev);
>  
>  	/* Report maximum channels */
> -	ch->max_combined = adapter->vsi_res->num_queue_pairs;
> +	ch->max_combined = iavf_max_channels(adapter);
>  
>  	ch->max_other = NONQ_VECS;
>  	ch->other_count = NONQ_VECS;
>  
>  	ch->combined_count = adapter->num_active_queues;

[Severity: Low]
In LARGE mode, can combined_count end up larger than max_combined?

The init request asks for min(num_online_cpus(), IAVF_MAX_REQ_QUEUES)
queues before the qregion is known. After that, nothing caps
num_active_queues to BIT(qregion_width).

If a PF grants more queues than its RSS region, ethtool -l shows current
> max. ethnl_set_channels() then rejects any request that leaves combined
unchanged, with "requested channel count exceeds maximum". In-tree ice
caps grants to its LUT queue count, so this needs a different PF.

> +	/* ethtool -L count, until the watchdog sends the request */
> +	if (adapter->aq_required & IAVF_FLAG_AQ_REQUEST_QUEUES)
> +		ch->combined_count = adapter->num_req_queues_next;
>  }

[Severity: Medium]
This only covers the time before the watchdog sends the request. When
iavf_process_aq_command() sends VIRTCHNL_OP_REQUEST_QUEUES, it clears
IAVF_FLAG_AQ_REQUEST_QUEUES. combined_count then falls back to
adapter->num_active_queues.

The new count takes effect only after the PF resets the VF and
iavf_reset_step() reallocates the queues. Until then, ethtool -l shows
the old count while a different count is already on its way to the PF.

This also defeats the -EBUSY check this patch adds to
iavf_set_channels(). Suppose the user runs ethtool -L back to the old
count while the request is in flight. ethnl_set_channels() compares
the request against iavf_get_channels(), sees no change, and returns
0 without calling iavf_set_channels(). The PF then grants the earlier
request. The VF ends up with the count the user just tried to undo,
even though ethtool reported success.

The current_op check does not cover the whole window either.
iavf_watchdog_step() resets current_op to VIRTCHNL_OP_UNKNOWN as soon
as it sees ARQLEN1 drop for the grant reset. That happens before
reset_task has applied the new count.

Could iavf_get_channels() report the in-flight count, for example
adapter->num_req_queues, until iavf_parse_vf_resource_msg() confirms
or drops it? The v6 changelog says the requested count is reported
until the watchdog sends the request. The change users see happens
later than that.

[ ... ]

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
> index db769eead68f3..b6b6d61ac2ac6 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_main.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_main.c

[ ... ]

> @@ -1783,12 +1784,17 @@ int iavf_config_rss(struct iavf_adapter *adapter)
>   * iavf_fill_rss_lut - Fill the lut with default values
>   * @adapter: board private structure
>   **/
> -static void iavf_fill_rss_lut(struct iavf_adapter *adapter)
> +void iavf_fill_rss_lut(struct iavf_adapter *adapter)
>  {
> -	u16 i;
> +	struct virtchnl_max_rss_qregion *qregion = &adapter->max_rss_qregion;
> +	int max = adapter->num_active_queues;
> +
> +	/* width == 0: PF has not told us the region yet */
> +	if (LARGE_NUM_QPAIRS_SUPPORT(adapter) && qregion->qregion_width)
> +		max = min(max, (int)BIT(qregion->qregion_width));
>  
> -	for (i = 0; i < adapter->rss_lut_size; i++)
> -		adapter->rss_lut[i] = i % adapter->num_active_queues;
> +	for (int i = 0; i < adapter->rss_lut_size; i++)
> +		adapter->rss_lut[i] = i % max;

[Severity: Medium]
What happens here if the PF reports a qregion_width of 32? On 64-bit,
(int)BIT(32) truncates to 0. max then becomes 0, and i % max divides by
zero.

A width of 31 gives INT_MIN, which puts LUT entries past
num_active_queues. A width >= BITS_PER_LONG is an undefined shift.

Neither iavf_get_max_rss_qregion() nor the VIRTCHNL_OP_GET_MAX_RSS_QREGION
case in iavf_virtchnl_completion() checks the range of qregion_width. The
completion handler calls iavf_fill_rss_lut() whenever the width changes.
The same unchecked BIT(width) also feeds iavf_get_rx_ring_count() (0
rings for width 32), iavf_max_channels() and iavf_set_rxfh().

The changelog says the PF is trusted. Still, the driver already validates
other values from the PF: iavf_validate_num_queues(), the max_mtu range
check, and the msglen checks for the RXDID and PTP caps.

Would a bound such as width <= ilog2(IAVF_MAX_REQ_QUEUES) be acceptable?

>  }

[ ... ]

> @@ -2504,13 +2542,56 @@ int iavf_parse_vf_resource_msg(struct iavf_adapter *adapter)
>  	vsi->netdev = adapter->netdev;
>  	vsi->qs_handle = adapter->vsi_res->qset_handle;
>  	if (adapter->vf_res->vf_cap_flags & VIRTCHNL_VF_OFFLOAD_RSS_PF) {
> -		adapter->rss_key_size = adapter->vf_res->rss_key_size;
> -		adapter->rss_lut_size = adapter->vf_res->rss_lut_size;
> +		if ((adapter->rss_key &&
> +		     adapter->rss_key_size != adapter->vf_res->rss_key_size) ||
> +		    (adapter->rss_lut &&
> +		     adapter->rss_lut_size != adapter->vf_res->rss_lut_size)) {
> +			reconfig_rss = true;
> +		} else {
> +			adapter->rss_key_size = adapter->vf_res->rss_key_size;
> +			adapter->rss_lut_size = adapter->vf_res->rss_lut_size;
> +		}
>  	} else {
>  		adapter->rss_key_size = IAVF_HKEY_ARRAY_SIZE;
>  		adapter->rss_lut_size = IAVF_HLUT_ARRAY_SIZE;
>  	}

[Severity: Medium]
iavf_reset_step() calls iavf_reinit_interrupt_scheme() whenever either
REINIT flag is set, whether or not the interface is running. It clears
IAVF_FLAG_REINIT_MSIX_NEEDED only in the running branch, next to
iavf_request_traffic_irqs(). IAVF_FLAG_REINIT_ITR_NEEDED is cleared
unconditionally at the end.

This patch adds a second place that sets IAVF_FLAG_REINIT_MSIX_NEEDED:
the num_active_queues > num_queue_pairs check in
iavf_parse_vf_resource_msg(). That can fire while the VF is down,
which is the state after probe or after ndo_stop. The flag then stays
set. Every later reset while the VF is down tears down and reallocates
MSI-X, q_vectors and rings again. Those resets never reach the new
else branch that drops num_req_queues.

This can also lose user settings. In legacy mode, ethtool -L 4 while
down reallocates 4 queues. iavf_parse_vf_resource_msg() then clears
num_req_queues. On the next reset, the stale flag sends us through
iavf_reinit_interrupt_scheme() again. iavf_alloc_queues() then falls
back to min(vsi_res->num_queue_pairs, num_online_cpus()), so the
channel count the user set is silently replaced.

Clearing the flag only when running predates this patch. The
"Requested %d queues, but PF only gave us %d" path already sets it.
The new setter and the new else branch make it matter more, though.
Could IAVF_FLAG_REINIT_MSIX_NEEDED also be cleared on the !running
path, for example together with IAVF_FLAG_REINIT_ITR_NEEDED? As far
as I can see, iavf_open() requests the traffic IRQs itself.

[Severity: Medium]
The commit message says the key and LUT are reallocated when their sizes
change across a reset, but only the RSS_PF branch checks for that.

Suppose the VF first negotiated RSS_PF with vf_res->rss_key_size and
rss_lut_size smaller than 52/64, and a later reset drops RSS_PF. Does this
else branch then raise the sizes while keeping the smaller buffers that
iavf_init_config_adapter() allocated?

Later, for example on the next reset, iavf_init_rss()->iavf_fill_rss_lut()
writes rss_lut_size bytes. iavf_config_rss_reg() and iavf_config_rss_aq()
read rss_key_size and rss_lut_size worth of data. Can these run past the
end of the old allocations?

In-tree i40e and ice report a key of 52 and a LUT of at least 64, so this
needs an unusual PF.

[ ... ]

> @@ -2977,6 +3179,9 @@ static int iavf_watchdog_step(struct iavf_adapter *adapter)
>  			 */
>  			iavf_change_state(adapter, __IAVF_STARTUP);
>  			adapter->flags &= ~IAVF_FLAG_PF_COMMS_FAILED;
> +			/* fresh retry budget, and init asks for queues again */
> +			adapter->aq_wait_count = 0;
> +			adapter->num_req_queues = 0;

[Severity: Low]
This isn't a bug, but the aq_wait_count reset fixes a problem that
affects every PF, as the commit message describes. Before this patch, the
only use of aq_wait_count is the increment in the __IAVF_INIT_FAILED case:

    if (++adapter->aq_wait_count > IAVF_AQ_MAX_ERR) {

Could this go out as a separate patch for net, with a Fixes: tag? The
logic comes from 898ef1cb1cb2 ("iavf: Combine init and watchdog state
machines"). As it stands, stable can only take it together with the whole
large queue count feature.

>  		}
>  		adapter->aq_required = 0;
>  		adapter->current_op = VIRTCHNL_OP_UNKNOWN;

[ ... ]

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
> index 1296ea0f1716a..6437fd4681be7 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c

[ ... ]

> @@ -251,6 +252,18 @@ int iavf_send_vf_ptp_caps_msg(struct iavf_adapter *adapter)
>  				(u8 *)&hw_caps, sizeof(hw_caps));
>  }
>  
> +int iavf_send_max_rss_qregion(struct iavf_adapter *adapter)
> +{
> +	adapter->aq_required &= ~IAVF_FLAG_AQ_GET_MAX_RSS_QREGION;
> +
> +	if (!LARGE_NUM_QPAIRS_SUPPORT(adapter))
> +		return -EOPNOTSUPP;
> +
> +	adapter->current_op = VIRTCHNL_OP_GET_MAX_RSS_QREGION;
> +	iavf_send_pf_msg(adapter, VIRTCHNL_OP_GET_MAX_RSS_QREGION, NULL, 0);
> +	return 0;

[Severity: Low]
Should this return the status of iavf_send_pf_msg(), as
iavf_send_vf_offload_vlan_v2_msg() and iavf_send_vf_ptp_caps_msg() do?

The header comment of iavf_init_send_max_rss_qregion() says it "Must
clear IAVF_EXTENDED_CAP_RECV_RSS_QREGION if the message is not sent".
That function cannot see a failed send, so the RECV step polls for a
reply that never comes. Init does recover through an INIT_FAILED retry.

That comment also starts with /* instead of the kernel-doc /** that the
neighbouring helpers use.

> +}
> +

[ ... ]

> @@ -2638,7 +2859,9 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
>  
>  		iavf_activate_fdir_filters(adapter);
>  
> -		iavf_parse_vf_resource_msg(adapter);
> +		/* a reset is scheduled on error, it will configure us again */
> +		if (iavf_parse_vf_resource_msg(adapter))
> +			break;

[Severity: Low]
Does this comment hold for every error path? The -ENODEV return in
iavf_parse_vf_resource_msg() does not schedule a reset:

    if (!vsi_res) {
        dev_err(&adapter->pdev->dev, "No LAN VSI found\n");
        return -ENODEV;
    }

In that case the break skips iavf_process_config(),
iavf_schedule_finish_config() and the MAC filter re-add, and nothing
retries them. adapter->vsi_res also keeps pointing into the vf_res buffer
that was just overwritten.

In-tree PFs always report an SRIOV VSI, so this needs a misbehaving PF.

[ ... ]

> @@ -2709,6 +2932,20 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
>  			aq_required;
>  		}
>  		break;
> +	case VIRTCHNL_OP_GET_MAX_RSS_QREGION: {
> +		u16 width = adapter->max_rss_qregion.qregion_width;
> +
> +		if (v_retval)
> +			break;
> +		memcpy(&adapter->max_rss_qregion, msg,
> +		       sizeof(adapter->max_rss_qregion));
> +		/* LUT was filled before this reply, for the old region */
> +		if (adapter->max_rss_qregion.qregion_width != width) {
> +			iavf_fill_rss_lut(adapter);
> +			iavf_config_rss(adapter);

[Severity: Low]
Does iavf_config_rss() work here for a VF that negotiated RSS_AQ? At this
point current_op is still VIRTCHNL_OP_GET_MAX_RSS_QREGION, so
iavf_config_rss_aq() bails out:

    if (adapter->current_op != VIRTCHNL_OP_UNKNOWN) {
        /* bail because we already have a command pending */
        dev_err(&adapter->pdev->dev, "Cannot configure RSS, command %d pending\n",
            adapter->current_op);
        return -EBUSY;
    }

The return value is ignored here, so the refilled LUT never reaches the
hardware. With RSS_PF, iavf_config_rss() only sets aq_required flags, so
in-tree ice is not affected.

[Severity: Low]
Can this branch run while rss_lut is NULL or num_active_queues is 0?
Nothing checks either before iavf_fill_rss_lut() is called.

iavf_free_rss() runs on the err_mem path of iavf_init_config_adapter() and
on the register_netdevice() failure path in iavf_finish_config(), while
the adapter stays alive. If a reply with a different width is processed
in that window, rss_lut[i] is written through a NULL pointer. If
num_active_queues is 0, i % max divides by zero.

The window is narrow, because stale replies left by init retries carry
the same width.

> +		}
> +		break;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
