Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557459;
	b=PBfyYKSi+K913smQ4sQS9ImDsiyDqMxUyrpAsg6dAbJNL8D0NswD+FjU2gxosyfDggBz
	 YC/3H5wbrEiQKyJqt/hH/XUHeDk1nxubij5ABJYIM/5BkS9OW4IPCrBsio12/cQ9xiXh4
	 h2UlXSsLQ+7+fO8ytQoe4uMCIucKjdGstIrQ9AFwXsfoNlAINe4QUzWlK+Al0pM1e/cyT
	 lbrlIhbIW+nwhk58jE+AXz34bi8V+QxRSAUaU/GlSBeOv99k39oW57sLPokFxk9fnK2xW
	 yzhGprkAQkpG93lyOA3q3oW9pJqnhfWOmjnWYG8IEOPs2Ligl/FZ5b6eo+Qwolr++RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557459;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=P4YZYB5h5SJHUyYBU11E7mWvSFdKMAR59rHqYdAnbsA=;
	b=nXlboIBKcafSd1pGAg90n7LZnt/NjBdKUh4lIhIRsNHPblgSckqe0LrfLQQbZjOtt4Ps
	 eZRD1UNk/I54ygL82jfKXMd7tXeeZ883W+OScX6fxlzLBg5zwJ8Wi8+VfvEhx5nr0kO2R
	 0xSZLYCdRsOgdXHk8gTq0raAi+Y2wUbUM+Vlh8fozZ/4XgeT+jmNBMgpPQzh/5o0R78rK
	 qwEw126zapOIk8RrY4yXqLlVkAQ9DIQTjEABGMJzGuINENTDcciYXytNUEy86RPFm71A+
	 /IRzLUu/ORzCHKU0IGLk6mv9bt+YVdmrv6ZNMsry1vEbfNZke8SAM11eSind+Gk6vkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LDPISwzR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50E606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LDPISwzR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6241F000CF;
	Tue, 24 Nov 2026 21:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557458;
	bh=P4YZYB5h5SJHUyYBU11E7mWvSFdKMAR59rHqYdAnbsA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LDPISwzRoTBheu0MxVpMEmM9/dy2+7Y0J2F8d6LUmXIUKbi9ugv5nh9nIvs7DZDlm
	 FhVtgAj4mEVB8rOVT2Niv/7mpo+xJ7dzVPgvluuRpGySkdS/5GcNOnksnZD6VUMSTI
	 mZpiQbzHIE2EITcdn678qyAS8renm3d8zjCg/AxKZpVL3M0614MAnNGk1rpzNpA7sv
	 XQcoBJxDQRsKNDFeLxNM0f7QEp6SXiA3uWgztUY32tGUjgdJkW3mC6xE9/MFVHiJWu
	 n9WWHzCUsb4VLTwKuwCSd1G9N4DPKjmEdPkZHSCgWVFNsShUEyOuI4q2Y9NNVNzbiT
	 fumz980ZWh8Tg==
Subject: Re: [PATCH net-next v7 10/15] iavf: use new opcodes to request more
 than 16 queues
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
Date: Tue, 24 Nov 2026 21:57:36 +0000
Message-ID: <179555745695.3135.2186928648847971137@kernel.org>
In-Reply-To: <20261121230123.316391-11-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-11-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In LARGE mode, iavf_get_channels() can report combined_count >
  max_combined in the same reply.
- [Medium] After a queue request is sent and the PF grants it, a later
  'ethtool -L combined <current active count>' can return success while…
- [Low] In iavf_reset_step()
  (drivers/net/ethernet/intel/iavf/iavf_main.c), the patch moves the…
- [Low] iavf_send_max_rss_qregion()
  (drivers/net/ethernet/intel/iavf/iavf_virtchnl.c) calls…
- [Low] In the VIRTCHNL_OP_GET_MAX_RSS_QREGION case of
  iavf_virtchnl_completion(), a change in qregion_width makes the code…
- [Low] iavf_get_req_queues_reply() returns `err ?:
  msg.vfres.num_queue_pairs` without checking event.msg_len >=…
- [Low] iavf_set_channels() checks num_req against iavf_max_channels(),
  which depends on LARGE_NUM_QPAIRS, REQ_QUEUES and BIT(qregion_width),…

--

iavf: use new opcodes to request more than 16 queues

This adds the VIRTCHNL_VF_LARGE_NUM_QPAIRS capability. It also adds the
new ENABLE_QUEUES_V2, DISABLE_QUEUES_V2, MAP_QUEUE_VECTOR and
GET_MAX_RSS_QREGION virtchnl opcodes, so iavf can use more than 16 queue
pairs. At init iavf asks for one queue pair per CPU, and ethtool -L goes
through an asynchronous REQUEST_QUEUES sent by the watchdog.

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
> index b76622fa9661d..a0d4b7bfb607d 100644
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
> +
> +	return adapter->vsi_res->num_queue_pairs;
> +}
> +

[ ... ]

> @@ -1697,12 +1715,17 @@ static void iavf_get_channels(struct net_device *netdev,
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

[Severity: Medium]
Can iavf_get_channels() report a combined_count larger than max_combined
in the same reply?

In LARGE mode iavf_max_channels() returns BIT(qregion_width). But
num_active_queues comes from iavf_alloc_queues(), which has no RSS
region cap:

	num_active_queues = min_t(int,
				  adapter->vsi_res->num_queue_pairs,
				  (int)(num_online_cpus()));

With the in-tree ice PF, ice_sriov_set_msix_vec_count() sets
vf->num_vf_qs = msix - 1 (e.g. 63) whatever the VF LUT type is.
ice_vc_get_max_rss_qregion() reports a width of 4 for a VSI LUT. The VF
then runs 63 queues while ethtool -l shows max_combined = 16.

The ethtool core rejects combined_count > max_combined, and
iavf_set_channels() also rejects num_req > iavf_max_channels(). So the
user can't set back the count the driver chose by itself, and netlink
set requests that keep the current combined count fail validation.

> +	/* the requested count, until the PF grants or denies it */
> +	if (adapter->aq_required & IAVF_FLAG_AQ_REQUEST_QUEUES)
> +		ch->combined_count = adapter->num_req_queues_next;
> +	else if (adapter->num_req_queues)
> +		ch->combined_count = adapter->num_req_queues;
>  }

[ ... ]

> @@ -1730,15 +1753,29 @@ static int iavf_set_channels(struct net_device *netdev,
>  	/* All of these should have already been checked by ethtool before this
>  	 * even gets to us, but just to be sure.
>  	 */
> -	if (num_req == 0 || num_req > adapter->vsi_res->num_queue_pairs)
> +	if (num_req == 0 || num_req > iavf_max_channels(adapter))
>  		return -EINVAL;
>  
> -	if (num_req == adapter->num_active_queues)
> -		return 0;
> -
>  	if (ch->rx_count || ch->tx_count || ch->other_count != NONQ_VECS)
>  		return -EINVAL;
>  
> +	/* PF has not answered our previous request yet */
> +	if (adapter->current_op == VIRTCHNL_OP_REQUEST_QUEUES)
> +		return -EBUSY;
> +
> +	if (num_req == adapter->num_active_queues) {
> +		adapter->aq_required &= ~IAVF_FLAG_AQ_REQUEST_QUEUES;
> +		return 0;
> +	}

[Severity: Medium]
Can a later ethtool -L return success here but be silently ignored,
after a queue request has been granted?

iavf_request_queues() sets:

    current_op = VIRTCHNL_OP_REQUEST_QUEUES
    num_req_queues = N
    flags |= IAVF_FLAG_REINIT_ITR_NEEDED

The PF grants the request by resetting the VF and sends no reply. If
iavf_watchdog_step() sees IAVF_VF_ARQLEN1 cleared first, it does:

	adapter->aq_required &= IAVF_FLAG_AQ_REQUEST_QUEUES;
	adapter->current_op = VIRTCHNL_OP_UNKNOWN;
	...
	iavf_schedule_reset(adapter, IAVF_FLAG_RESET_PENDING);

This leaves num_req_queues and IAVF_FLAG_REINIT_ITR_NEEDED set.
reset_task takes netdev_lock only after the watchdog releases it, so an
ethtool call can run in between.

In that window iavf_get_channels() reports combined_count = N. The core
then passes M = num_active_queues to iavf_set_channels(). The -EBUSY
check no longer fires, and this shortcut only clears
IAVF_FLAG_AQ_REQUEST_QUEUES and returns 0.

iavf_reset_step() then sees IAVF_FLAG_REINIT_ITR_NEEDED, and
iavf_alloc_queues() uses num_req_queues = N. The VF ends up with N
queues, although the last ethtool -L that returned success asked for M.

Should this shortcut also take a pending num_req_queues into account?

> +
> +	if (LARGE_NUM_QPAIRS_SUPPORT(adapter) &&
> +	    adapter->vf_res->vf_cap_flags & VIRTCHNL_VF_OFFLOAD_REQ_QUEUES) {
> +		/* the watchdog sends it once no other op is in flight */
> +		adapter->num_req_queues_next = num_req;
> +		iavf_schedule_aq_request(adapter, IAVF_FLAG_AQ_REQUEST_QUEUES);
> +		return 0;
> +	}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
> index a2aef35c0a074..66beb83acc94b 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_main.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_main.c

[ ... ]

> @@ -2332,6 +2340,12 @@ static int iavf_process_aq_command(struct iavf_adapter *adapter)
>  		iavf_virtchnl_send_ptp_cmd(adapter);
>  		return IAVF_SUCCESS;
>  	}
> +	if (adapter->aq_required & IAVF_FLAG_AQ_REQUEST_QUEUES) {
> +		/* ethtool -L has already reported success, retry until sent */
> +		if (!iavf_request_queues(adapter, adapter->num_req_queues_next))
> +			adapter->aq_required &= ~IAVF_FLAG_AQ_REQUEST_QUEUES;
> +		return 0;
> +	}

[Severity: Low]
Is num_req_queues_next still valid when it is finally sent here?

iavf_set_channels() checks num_req against iavf_max_channels() and
num_active_queues, then defers the send. The patch keeps
IAVF_FLAG_AQ_REQUEST_QUEUES across resets, both in iavf_reset_step() and
in the watchdog's hardware reset detection:

	adapter->aq_required &= IAVF_FLAG_AQ_REQUEST_QUEUES;

Those resets re-negotiate vf_res->vf_cap_flags and max_rss_qregion, and
can change num_active_queues. None of the checks are repeated here.

Could the VF then send a REQUEST_QUEUES that is above BIT(new width),
or sent without LARGE_NUM_QPAIRS or REQ_QUEUES still negotiated? Could
it also equal the new active count and cause a needless VF reset?

[ ... ]

> @@ -3444,8 +3614,6 @@ void iavf_reset_step(struct iavf_adapter *adapter)
>  			err = iavf_request_traffic_irqs(adapter, netdev->name);
>  			if (err)
>  				goto reset_err;
> -
> -			adapter->flags &= ~IAVF_FLAG_REINIT_MSIX_NEEDED;
>  		}
>  
>  		iavf_configure(adapter);
> @@ -3463,7 +3631,8 @@ void iavf_reset_step(struct iavf_adapter *adapter)
>  		wake_up(&adapter->down_waitqueue);
>  	}
>  
> -	adapter->flags &= ~IAVF_FLAG_REINIT_ITR_NEEDED;
> +	adapter->flags &= ~(IAVF_FLAG_REINIT_MSIX_NEEDED |
> +			    IAVF_FLAG_REINIT_ITR_NEEDED);

[Severity: Low]
This isn't a bug, but moving the IAVF_FLAG_REINIT_MSIX_NEEDED clear out
of the running branch fixes a separate issue that affects every PF, and
the commit message doesn't describe it.

iavf_parse_vf_resource_msg() can set IAVF_FLAG_REINIT_MSIX_NEEDED while
the interface is down, in the "PF gave us fewer queues" and "PF could cut
our queues on reset" paths. Before this patch the flag stayed set. A
later reset then rebuilt the interrupt scheme with num_req_queues == 0
and lost a channel count set with ethtool -L while down.

The fix is mentioned only in the v7 changelog below the --- line, which
is dropped when the patch is applied. The v7 notes also say the every-PF
changes moved to "iavf: keep RSS config across resets", but this one is
still in this patch.

Other every-PF changes are bundled the same way:

- the reordered rx/tx/other validation in iavf_set_channels()
- the REQUEST_QUEUES completion ignoring replies with a non-zero
  v_retval
- iavf_init_config_adapter() clearing num_req_queues and
  IAVF_FLAG_REINIT_ITR_NEEDED

Could these be split out, or at least described in the commit message,
possibly with a Fixes: tag?

>  
>  	return;
>  reset_err:

> diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
> index 151824102acda..e643c205884f6 100644
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
> +}

[Severity: Low]
Should this return the result of iavf_send_pf_msg()?

iavf_send_vf_offload_vlan_v2_msg(), iavf_send_vf_ptp_caps_msg() and
iavf_send_vf_config_msg() all return it. iavf_process_aq_command() passes
this return value straight back to the watchdog.

As written, a failed ASQ send looks like success. At init,
iavf_init_recv_max_rss_qregion() then polls for a reply that was never
requested.

[ ... ]

> +int iavf_get_req_queues_reply(struct iavf_adapter *adapter)
> +{
> +	/* poll looks for the reset event in the same buffer */
> +	union {
> +		struct virtchnl_vf_res_request vfres;
> +		struct virtchnl_pf_event vpe;
> +	} msg = {};
> +	struct iavf_arq_event_info event = {
> +		.buf_len = sizeof(msg),
> +		.msg_buf = (u8 *)&msg,
> +	};
> +	int err;
> +
> +	err = iavf_poll_virtchnl_msg(&adapter->hw, &event,
> +				     VIRTCHNL_OP_REQUEST_QUEUES);
> +
> +	return err ?: msg.vfres.num_queue_pairs;
> +}

[Severity: Low]
Should event.msg_len be checked before msg.vfres.num_queue_pairs is used?

iavf_poll_virtchnl_msg() reuses this buffer for every ARQ message it
skips, such as link events. iavf_clean_arq_element() copies only
min(datalen, buf_len) bytes, and nothing at all for an empty message:

	e->msg_len = min(datalen, e->buf_len);
	if (e->msg_buf && (e->msg_len != 0))
		memcpy(e->msg_buf, hw->aq.arq.r.arq_bi[desc_idx].va,
		       e->msg_len);

A short or empty REQUEST_QUEUES reply would then return stale bytes from
an earlier message. iavf_get_max_rss_qregion() above does check
event.msg_len == len.

iavf_init_recv_req_queues() also passes the offered count on as is:

		if (num > adapter->vsi_res->num_queue_pairs &&
		    !iavf_request_queues(adapter, num))
			return;

There is no clamp to IAVF_MAX_REQ_QUEUES, so a value up to 65535 could
end up in adapter->num_req_queues. Should it be bounded?

[ ... ]

> @@ -2710,6 +2934,22 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
>  			aq_required;
>  		}
>  		break;
> +	case VIRTCHNL_OP_GET_MAX_RSS_QREGION: {
> +		u16 width = adapter->max_rss_qregion.qregion_width;
> +
> +		if (v_retval || msglen != sizeof(adapter->max_rss_qregion))
> +			break;
> +		memcpy(&adapter->max_rss_qregion, msg, msglen);
> +		adapter->max_rss_qregion.qregion_width =
> +			min(adapter->max_rss_qregion.qregion_width,
> +			    ilog2(IAVF_MAX_REQ_QUEUES));
> +		/* LUT was filled before this reply, for the old region */
> +		if (adapter->max_rss_qregion.qregion_width != width) {
> +			iavf_fill_rss_lut(adapter);
> +			iavf_config_rss(adapter);

[Severity: Low]
Does iavf_config_rss() work from here on the RSS_AQ path?

adapter->current_op is still VIRTCHNL_OP_GET_MAX_RSS_QREGION at this
point, because it is reset only after the opcode switch. So
iavf_config_rss_aq() bails out:

	if (adapter->current_op != VIRTCHNL_OP_UNKNOWN) {
		/* bail because we already have a command pending */
		dev_err(&adapter->pdev->dev, "Cannot configure RSS, command %d pending\n",

The return value is dropped, so the refilled LUT is never programmed and
nothing retries it. Only the RSS_PF and RSS_REG paths work from this
context.

> +		}
> +		break;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
