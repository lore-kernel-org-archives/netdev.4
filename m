Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557461;
	b=iWfzM52fTO5wfcIHvKeRVb+0L+3g9Xbyf8qbNpf+0nTDFg4i3bsP4miCpwIfravVCHch
	 6sfr9E9uMtmyg6/Y3TtZ4B27J87eMrwXYkEpttbw/iP5+hbIEONWPr9g5vL40isDeS+V5
	 ZzPjmzJk+lOL1dspQyH+CCXGHvFB9SrStHlHaw6L2RCG8DeDi2MOylmHvdX8tS1MzavG0
	 lF6mSy5hHJUUeh+4WScv7+ROWHXrRWrNapl9IeUSvzB7U4So7IVxSf2RhktvE/OV1+s1S
	 MRoOdt6NGs8198X9GM7c9oQmKhb3xRVRRxDO0O66uKMc4eZZF8Mok5vBkSOlpz/wYYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557461;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7Xdk7c9B/1k0UBw/HiFgZCdj3vyUUeOt0txVXTBKSgw=;
	b=M4HDZ4/lQy10X0pOwz+WEWOS4rxOSySqhxksyzZriIrPcmDo8nd89gRQ/ePgeZIG7LN7
	 /9c+sKV+218jhU2U5A4nH0QBIXnAzlMrjdDWFd/mVZPWHMew3Xq44HibnZuz5ScKWjLPL
	 xcTF8vlkFnKIeRszAanSvvVthpr5Y9VXSJAfz77ttIoTyIgLHQvEfSOzYF/QWEYoQaSaZ
	 9vk4yBUWK7RDSXL7AKP6LnQm7lTT5hWz5ApyetpeyBKDG2shEvc36/MsuZ1YbkmVZp+0z
	 2QKFYbcioXZM7LQae1Zoz/FnPjwFMmDEjrfZaVu4ETcwf42ayxFVAoMnbNqdv5EIg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fL5K69wg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38C8606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fL5K69wg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D696A1F000D3;
	Tue, 24 Nov 2026 21:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557461;
	bh=7Xdk7c9B/1k0UBw/HiFgZCdj3vyUUeOt0txVXTBKSgw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fL5K69wgoMU1a2Jd8XUMh/M63+VgvA17jE8T0NCNGMhylwkyihJ4ZJdq9dkNWZRU/
	 pUxUS4SJnmwQURbX2KpMWUfHi3D8sETT8qg6U2k1DCBIs6Qzdk/HpS8502Da/dNuns
	 5zvoNqdG9fFTfOfinowlR2dcHZS5307Cc+rMP7a9HmaVaUvDEvP2yyXN72jWPgehGU
	 Guyk3VOzaOPlFWpAmuzn0ZneRo6UaL6qvvUBPH3zXp4F/HaCLByShUIwfyFXHDywww
	 ELJwT6eH6NSr6UYgBAoXlQWj9wpbeSTpul2cnxJ5vYCpv2lzTGyPfXdQW5P9v2oujr
	 tleKuQcKdj7Hw==
Subject: Re: [PATCH net-next v7 11/15] ice: introduce handling of virtchnl
 LARGE VF opcodes
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
Date: Tue, 24 Nov 2026 21:57:39 +0000
Message-ID: <179555745942.3135.1778871392388007351@kernel.org>
In-Reply-To: <20261121230123.316391-12-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-12-przemyslaw.kitszel@intel.com>
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

- [Low] The kernel-doc for three new handlers in
  drivers/net/ethernet/intel/ice/virt/queues.c describes the return…

--

ice: introduce handling of virtchnl LARGE VF opcodes

This commit adds PF handlers for VIRTCHNL_OP_ENABLE_QUEUES_V2,
VIRTCHNL_OP_DISABLE_QUEUES_V2 and VIRTCHNL_OP_MAP_QUEUE_VECTOR, and
allowlists them, along with GET_MAX_RSS_QREGION, behind
VIRTCHNL_VF_LARGE_NUM_QPAIRS. It also widens num_ring_{rx,tx} in struct
ice_q_vector to u16, so a VF can map all 256 of its queues to one vector.

> diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
> index a8a2f5e5b3223..e8635236cb6c1 100644
> --- a/drivers/net/ethernet/intel/ice/virt/queues.c
> +++ b/drivers/net/ethernet/intel/ice/virt/queues.c

[ ... ]

> +/**
> + * ice_vc_ena_qs_v2_msg - message handling for VIRTCHNL_OP_ENABLE_QUEUES_V2
> + * @vf: source of the request
> + * @msg: message to handle
> + * @msglen: length of the @msg
> + *
> + * Return: 0 on success or negative on error.
> + */
> +int ice_vc_ena_qs_v2_msg(struct ice_vf *vf, u8 *msg, u16 msglen)
> +{
> +	struct virtchnl_del_ena_dis_queues *ena_qs_msg =
> +			(struct virtchnl_del_ena_dis_queues *)msg;
> +	enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_ERR_PARAM;
> +	struct ice_vsi *vsi;
> +
> +	if (!ice_vc_validate_qs_v2_msg(vf, ena_qs_msg, msglen))
> +		goto error_param;

[ ... ]

> +	v_ret = VIRTCHNL_STATUS_SUCCESS;
> +	set_bit(ICE_VF_STATE_QS_ENA, vf->vf_states);
> +
> +error_param:
> +	return ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_ENABLE_QUEUES_V2,
> +				     v_ret, NULL, 0);
> +}

[Severity: Low]
Is the "Return:" line in this kernel-doc accurate?

When validation fails, v_ret stays VIRTCHNL_STATUS_ERR_PARAM. The code then
jumps to error_param and returns the result of ice_vc_send_msg_to_vf(). That
function returns 0 whenever the mailbox write succeeds:

ice_vc_send_msg_to_vf() {
    ...
	aq_ret = ice_aq_send_msg_to_vf(&pf->hw, vf->vf_id, v_opcode, v_retval,
				       msg, msglen, NULL);
	if (aq_ret && pf->hw.mailboxq.sq_last_status != LIBIE_AQ_RC_ENOSYS) {
		...
		return -EIO;
	}

	return 0;
}

So a rejected request still returns 0. A negative value only means the
response could not be sent to the VF.

ice_vc_dis_qs_v2_msg() and ice_vc_map_q_vector_msg() have the same
"Return: 0 on success or negative on error" text. The V1 handler
ice_vc_dis_qs_msg() says:

 * Return: exit code of sending the virtchnl response.

Could the new handlers use similar wording? This text is still unchanged at
the end of the series.

[ ... ]

> +/**
> + * ice_vc_validate_qv_maps - validate parameters sent in the qs_msg structure
> + * @vf: VF the message was received from
> + * @qv_maps: contents of the message from the VF
> + * @msglen: length of the @qv_maps
> + *
> + * Used to validate VIRTCHNL_OP_MAP_QUEUE_VECTOR messages. This should always
> + * be called before attempting map interrupts to queues. If all checks succeed,
> + * then return success indicating to the caller that the qv_maps are valid.
> + * Otherwise return false, indicating to the caller that the qv_maps are
> + * invalid.
> + *
> + * Return: true if parameters are valid, false otherwise.
> + */
> +static bool ice_vc_validate_qv_maps(struct ice_vf *vf,
> +				    struct virtchnl_queue_vector_maps *qv_maps,
> +				    u16 msglen)

[Severity: Low]
This isn't a bug, but the summary line mentions "the qs_msg structure"
while the function takes struct virtchnl_queue_vector_maps *qv_maps.

The body also says "then return success", but this is a bool function that
returns true or false. Should that say "return true" to match the Return:
line?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
