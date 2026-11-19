Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070697;
	b=hLnhrhms+UuEhWEINFRkF6TvdToU6CBuvljZDtRIzEbiAbpVNotm6KQOf/O+xBrWliNl
	 MY1DV2JPRhIFVvn8CNkazNTcKnVcrYni49I9xqU2KQo8J6stMimL6jAU6zdXJ3CYRpjPn
	 RSpaXr4kRbls1yXp48dxcepNATfzxPOJdojjxxY1H4vYDt66yhAjzbUxO108hWsA9jqTv
	 nWVhz6fjeLMAVNnDO42/MKYL8R6duKnDbCKndEwW/cL9nSJM5unWWzVZroLGLj0eLvJvg
	 XTT8SdousPZKL79HPuuXCLsS1BVZ6ZjQ6D5KM5N+HdVZdVHGts9CVc64lUCY2Rw73xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070697;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JLBL2wrg3mE0HWqiTHlCWKNYklhYyRHXyYX58075LC4=;
	b=kXZulQDVinJlF16LjfZPsBD6L28sxjyB9QW/675yF1I3iCedROeaS5JM+NnhEUzC4VQs
	 0kgJy7ix81x7aUFMaOZvpKY9VfHiTtNzjA9rdRyoYm3gDbfn8t/Sb6z9dt/R5dcmmOqwo
	 OhJYGUWBYK2iBU8HaDJuAmEXNTaNXjpP2ncFYP+/l8JPRfBMM+7V8SIcFo3YPlzrWzovU
	 rx4xB1+W1ovJaD5fZaDYaMIMyW2GspWPmRCHwJwAihnYptx+MGptSEFhIPQ3Ak9rgP/sY
	 8AoVLsfEFZ/b84HS8p9jcx6vVHeSA9lF8xvhbx9YNUU91SfkaFXhobmuDbLcfYYdPmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4HjtuVz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F507606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4HjtuVz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560E41F000C4;
	Thu, 19 Nov 2026 06:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070696;
	bh=JLBL2wrg3mE0HWqiTHlCWKNYklhYyRHXyYX58075LC4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h4HjtuVz0OrTPPR7vgSb5uOH/NlV+9Goh1sQNVAB93vDNEqh3HBnnJYpDSqfeVm3O
	 alTdiZw1wZNc6hDgE4qPeGuCd9MOD3cpKnfn1Q0CgfBu959NBoi+QmXUj4rvMnWByX
	 CuTMuK0ABx0TmtrbX01n31o1DWdzxLm3GuDGNAt+AtpJVf5XZi75O/nT0Gc/qfe+M7
	 v6lR4XP4c9eBT47wffFk583LELWoKklApwI7Jvs91FU67xDcI6B6oIYZPcTjbPHYYZ
	 SQzLkcy7mE7UqgIF9bwzwWkElcysvXRboLguKMXQd2pSUWpxYD4GDAvH2xV7stEx+s
	 XP0pL2bDtRKWQ==
Subject: Re: [net-next v6 05/15] ice: rename ICE_MAX_RSS_QS_PER_VF to
 ICE_MAX_QS_PER_VF_VCV1
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
Date: Thu, 19 Nov 2026 06:44:54 +0000
Message-ID: <179507069485.3136.3088916078389743897@kernel.org>
In-Reply-To: <20261117094913.100756-6-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-6-przemyslaw.kitszel@intel.com>
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

- [Low] The rename marks every user of the old ICE_MAX_RSS_QS_PER_VF as a
  legacy virtchnl-v1 opcode limit.

--

ice: rename ICE_MAX_RSS_QS_PER_VF to ICE_MAX_QS_PER_VF_VCV1

This commit renames ICE_MAX_RSS_QS_PER_VF to ICE_MAX_QS_PER_VF_VCV1 across
the ice driver and keeps the value at 16. It prepares for the next patch,
which raises the per-VF queue maximum to 256. It also adjusts the
kernel-doc of ice_vf_has_no_qs_ena().

> diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.h b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
> index fa436b3b1eac2..4959ecee0c21c 100644
> --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.h
> +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
> @@ -19,7 +19,8 @@
>  #define ICE_MAX_SRIOV_VFS		256
>  
>  /* VF resource constraints */
> -#define ICE_MAX_RSS_QS_PER_VF	16
> +/* for "old" virtchnl opcodes that accept up to 16 queues */
> +#define ICE_MAX_QS_PER_VF_VCV1	16

[Severity: Low]
This isn't a bug, but the new comment calls this constant a limit for the
"old" virtchnl opcodes. At this point in the series, several of its users
are not opcode limits.

The txq_ena/rxq_ena bitmaps and qs_bw[] in struct ice_vf, and q_home[][]
in struct ice_lag, use it as a storage size. ice_set_per_vf_res() uses it
as the per-VF Tx/Rx queue cap. ice_vsi_set_rss_params() uses it as the VF
VSI rss_size.

The value is still 16 everywhere, so nothing goes out of bounds here. The
next patch in the series ("ice: bump to 256qs for VF") adds
ICE_MAX_QS_PER_VF and moves the storage, allocation and RSS users over to
it. After that, ICE_MAX_QS_PER_VF_VCV1 remains only at the v1 opcode
sites.

Could ICE_MAX_QS_PER_VF be introduced in this patch, with only the opcode
sites switched to the VCV1 name? That way the intermediate tree would
match the new comment.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
