Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557451;
	b=5tpJTs6FuCsT7cYPXB73/ttE3Uc/x84GQaI+HiguoSt3TfI54bQYdRFxbIaXBlwC+ywi
	 XgQH9hRJ2I2k8xrOBireChH8z6acr0X+EEgl328vtPJtDbW52ssf4dMxjSgCXjA+/hTqM
	 5fDSzesOdAbt5tWTkUeiYXIX99iJ7yN6o5Kr9czqvCJ3k94qA/2ceLrmzjWtEDZIp0KIj
	 8DPtWl+WiC1k518LOAhk2Fv9S7/ZOCV/OlZK/CSPu21vKM1jwDS5cctH/+ReEGgI9M8yT
	 YgoIoYcBiTz30PnGBQAOJMe58OWOOiawK75uFKGU4prr0063smMlOP1xPTyyZgnQtRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557451;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TArzLoLUYwMpIZqTTTy7GR5e8qQr6mIuaPk2+tZwmCk=;
	b=QBOeBfKmLrIAIgNqbajCj5lE3r1r7ETvy1/GRE6NT1cUrkvbwrdyjK3UFp87tRmDb098
	 Ew4We7gH/vZxlhzW3Wfe+pnKtbRB8jnB2pjmyceoCRAk6A3KvJu8Uvh0Cp0s40d+DXUZv
	 frZGrursEPVrPtsKWHDDmMXyIMATavIVrvRJVOgsaT++YZo99G817afzu7FOrjDJSTp6X
	 rZ/vbjY4H6PVopOlL8icDeYr/v4ETP4i9k33KG+4Xe3bw3cqKznJMK9T6JfoMQvv+gYVD
	 roEq0GpzDvNYmhNEl4VnNeQ9oYGYPqoiGylep47RdBdKL3V7rTWS6eMnJmueELzqxMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3Pa1wXt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D40606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3Pa1wXt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908461F000C4;
	Tue, 24 Nov 2026 21:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557451;
	bh=TArzLoLUYwMpIZqTTTy7GR5e8qQr6mIuaPk2+tZwmCk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k3Pa1wXtY9lAyUXnu6R+ikKU929odt1MF3IiHdbtD2eOLMm70yWGO62QcNip9DkDR
	 6PBsW6EVBaOHWvG+mqLTWt365uiyCldypAa/OxTr5z8YjE5T5UOrH51uIRCFo2P0VO
	 cFMteyJnC0yjJQUgJD4fdTOoTuy2aFq8oa1/YTVgz5ZL6pWX5cDl/fffSNgmNGLHMe
	 ByEVex2NpqfTM7P5KzM50fo32UpOFKtXHnLSnbLlUOEoRgsCgouAF+rLLw3XEW8MoB
	 LXno+SZnwWDSsu/V8royniXqQ519TT/1OTYgIUPl80PU6iliz2ur9ql6G/aq+aYXqe
	 hJLoN4l5dZs5w==
Subject: Re: [PATCH net-next v7 04/15] ice: add helpers for Global RSS LUT
 alloc, free, vsi_update
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
Date: Tue, 24 Nov 2026 21:57:29 +0000
Message-ID: <179555744911.3135.1325849072139693644@kernel.org>
In-Reply-To: <20261121230123.316391-5-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-5-przemyslaw.kitszel@intel.com>
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

- [Low] This is fixed later in the series.

--

ice: add helpers for Global RSS LUT alloc, free, vsi_update

This commit adds AQ helpers to allocate and free a Global RSS LUT. It also
teaches ice_set_rss_vsi_ctx() to encode the RSS LUT type, and the global
LUT ID when the type is ICE_LUT_GLOBAL, into the VSI context q_opt_rss.

> diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
> index bd59c0a122158..517d87aadfad9 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_lib.c

[ ... ]

> @@ -1316,8 +1332,12 @@ static void ice_set_rss_vsi_ctx(struct ice_vsi_ctx *ctxt, struct ice_vsi *vsi)
>  	hash_type = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
>  	vsi->rss_hfunc = hash_type;
>  
> +	if (vsi->rss_lut_type == ICE_LUT_GLOBAL)
> +		global_lut_id = vsi->global_lut_id;
> +
>  	ctxt->info.q_opt_rss =
>  		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_LUT_M, lut_type) |
> +		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_M, global_lut_id) |
>  		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_HASH_M, hash_type);
>  }

[Severity: Low]
With this change the VSI context binds the VSI to vsi->global_lut_id. At
this commit, though, ice_set_rss_lut() and ice_get_rss_lut() in
ice_main.c do not pass that ID down:

ice_set_rss_lut() {
    ...
	params.vsi_handle = vsi->idx;
	params.lut_size = lut_size;
	params.lut_type = vsi->rss_lut_type;
	params.lut = lut;
    ...
}

__ice_aq_get_set_rss_lut() takes the descriptor index from params:

	if (lut_type == ICE_LUT_GLOBAL)
		glob_lut_idx = FIELD_PREP(ICE_AQC_LUT_GLOBAL_IDX,
					  params->global_lut_id);

If a VSI were using a nonzero global LUT, would it end up bound to LUT N
while SET/GET_RSS_LUT read and write LUT 0?

As far as I can tell, this can't happen at any point in the series.
Nothing sets vsi->rss_lut_type to ICE_LUT_GLOBAL until "ice: represent
RSS LUTs as devlink resources". That commit also adds the following to
both ice_set_rss_lut() and ice_get_rss_lut():

	if (params.lut_type == ICE_LUT_GLOBAL)
		params.global_lut_id = vsi->global_lut_id;

So the final tree is consistent. Would it make sense to move that
params.global_lut_id assignment into this patch, so the VSI context and
the LUT AQ path pick up the global LUT ID in the same commit?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
