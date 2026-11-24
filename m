Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557448;
	b=x59Q7mwIPyxWiIiAr5szkHg0XCoIuvr0kAZwWLBSKD9MsLnQdQDOkXDoDL8tVyQgfDK8
	 UQQULfe7qcCH1Xtnggf5GxlStNOQrQCAywZZoAIDU/B1yv8tLrXx7N3zdStqQymlKuEug
	 zjXhAbuKDEZJknlkOkrqsUUU7JtKDNeu0dzj6gOpg1ZMMx8JTSRc91wsW4/oiEtu3QxUG
	 OUosiK4cSFHyASLa1I96m1EKBKID6ID+14HVSP8l11aqF27p9XbzVX89GHKu7fh6FrXao
	 sCUrHP1YS5L4MZ83FVJUHNzGASTWML8hIQetGKm6aeNb90mns8HOA+zHBSLQfq2yclw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557448;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0P7+ZyyVCZ1JDeUcm9y05PO0ngvsEzwcfMmqkUmPnIQ=;
	b=sSi0JDIuNptdAg0PPWis55OnTEsHCXMC5KSKbvB8STpk/W7+mazbjeaQn+EL/SKeHt8e
	 RMyK56ZrFgSDAxJDOnembrwhszb0ubbk/+N+w2KZU5xQWETFHXyQ6larexXJrffyS0+yo
	 K+4i1FDzNsKsupm/WckxRwncCj/Ul3SmIbKtB7z19pmByGrIqrp/dFcESbMCXGZvJoXc8
	 Gl6yCbymhSCW5wAkSnqpzAkN2nFt/bCDbPALawCKk6JoWIClcSWkA0L0a/tDz8K7mHOgm
	 za0voY2ZVBp87NkCG8Tdv46dbnQM6R5dgVsUV4mNi/mtknZYADgzcHJSY9/EAEverVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwRkCnR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA16B606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WwRkCnR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203491F000C0;
	Tue, 24 Nov 2026 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557448;
	bh=0P7+ZyyVCZ1JDeUcm9y05PO0ngvsEzwcfMmqkUmPnIQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WwRkCnR5eKQTfXqn1TatJB+cOHSUotBze826HDfN8Ifao81IjsrydIpX7hQc5eNaf
	 dsLrDiiEsRkvKVssDrUJaOukiyHhyuLr3HrdpVn9OCqbZQoYCSH7U0NtmZT0XJkONy
	 1UHbcWpGTc03sGlnMceptrQGU4ww1dnXmjKtWMIPisduU2+s1wZen6mHxdfyrFHsv/
	 Z9ptTVC3D8hZ3uF1WFuLozyDOcpMSQl/EZHGlaVWaSjX31/gueX9GE3qyBsAQvKAOr
	 9IKfyL2ASrfftKIdBMqVIKM/sIMILu3JKYlOEowtYxW+/kKq4mF/ktZzvNca8W8PO0
	 wJQRxSrnzKvXQ==
Subject: Re: [PATCH net-next v7 02/15] ice: prepare RSS LUT config for runtime
 LUT changes
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
Date: Tue, 24 Nov 2026 21:57:26 +0000
Message-ID: <179555744667.3135.6613548571231576927@kernel.org>
In-Reply-To: <20261121230123.316391-3-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-3-przemyslaw.kitszel@intel.com>
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

- [Low] The ice_cfg_rdma_fltr() change
  (drivers/net/ethernet/intel/ice/ice_switch.c) fixes a user-visible…
- [Low] The commit message says pf->rss_lut_lock protects "q_opt_rss of
  the VSI context" and is taken "around VSI context writes that include…
- [Low] The patch adds scoped_guard() (a scope-based cleanup helper) to
  functions that also use goto-based cleanup labels.

--

ice: prepare RSS LUT config for runtime LUT changes

This commit adds pf->rss_lut_lock to protect the RSS LUT config of a VSI.
It now sets the default LUT type and size only on VSI init, and it caps the
RSS queue count to what the LUT type can address. It also changes
ice_cfg_rdma_fltr() to take the Q_OPT section from vsi->info instead of the
cached VSI context.

> diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
> index 432da05c48c08..f614b9360f7bd 100644
> --- a/drivers/net/ethernet/intel/ice/ice.h
> +++ b/drivers/net/ethernet/intel/ice/ice.h
> @@ -595,6 +595,7 @@ struct ice_pf {
>  	struct mutex tc_mutex;		/* lock to protect TC changes */
>  	struct mutex adev_mutex;	/* lock to protect aux device access */
>  	struct mutex lag_mutex;		/* protect ice_lag struct in PF */
> +	struct mutex rss_lut_lock;	/* protect VSI RSS LUT config */

[Severity: Low]
The commit message says this lock protects "q_opt_rss of the VSI context"
and is taken "around VSI context writes that include q_opt_rss". Do the VF
virtchnl paths follow that contract?

In drivers/net/ethernet/intel/ice/virt/rss.c, these callers don't take
rss_lut_lock, either at this commit or at the end of the series:

ice_vc_rss_hash_update()
    read-modify-write of vsi->info.q_opt_rss, then a Q_OPT VSI update

ice_vc_config_rss_hfunc()
    ice_set_rss_hfunc(vsi, hfunc)

ice_vc_config_rss_lut()
    ice_set_rss_lut(vsi, vrl->lut, ICE_LUT_VSI_SIZE)
        reads vsi->rss_lut_type and vsi->global_lut_id

ice_set_rxfh() now calls the same ice_set_rss_hfunc() helper under
scoped_guard(mutex, &pf->rss_lut_lock), so the ethtool and virtchnl paths
don't match.

Today vf->cfg_lock, taken in ice_vc_process_vf_msg(), serializes these VF
handlers. The later devlink VF LUT change also takes vf->cfg_lock, so I
couldn't find a concrete race.

Should the virtchnl paths take rss_lut_lock too? Or should the commit
message and the lock comment be narrowed to what the lock actually covers?

Later in the series, vsi->rss_table_size replaces the hard-coded
ICE_LUT_VSI_SIZE in ice_vc_config_rss_lut().

> diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
> index dffa213734f10..6d1e506b69cd8 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
> @@ -3645,11 +3645,13 @@ ice_get_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh)
>  	if (!rxfh->indir)
>  		return 0;
>  
> -	lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
> -	if (!lut)
> -		return -ENOMEM;
> +	scoped_guard(mutex, &pf->rss_lut_lock) {
> +		lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
> +		if (!lut)
> +			return -ENOMEM;
>  
> -	err = ice_get_rss(vsi, rxfh->key, lut, vsi->rss_table_size);
> +		err = ice_get_rss(vsi, rxfh->key, lut, vsi->rss_table_size);
> +	}
>  	if (err)
>  		goto out;

[Severity: Low]
This isn't a bug, but this function now uses both scoped_guard() and
goto-based cleanup. include/linux/cleanup.h says:

    the expectation is that usage of "goto" and cleanup helpers is never
    mixed in the same function.

Here lut is allocated inside the guard, which has an early return. It is
then freed by hand through goto out after the guard ends.

The same mix appears in:

ice_vsi_cfg_rss_lut_key()  - lut freed at goto ice_vsi_cfg_rss_exit
ice_vsi_cfg_def()          - scoped_guard() followed by goto unroll_get_qs
ice_set_channels()         - scoped_guard() next to goto adev_unlock

ice_vsi_set_dflt_rss_lut() and ice_vsi_manage_rss_lut() also kzalloc() lut
inside the guard and kfree() it outside.

No current path leaks, because lut is NULL on the early return. The pattern
is still there at the end of the series.

Could these functions use plain mutex_lock()/mutex_unlock()? Or could lut
become __free(kfree) and the goto labels be dropped?

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_switch.c b/drivers/net/ethernet/intel/ice/ice_switch.c
> index d873eda9af826..70eed3bcc404b 100644
> --- a/drivers/net/ethernet/intel/ice/ice_switch.c
> +++ b/drivers/net/ethernet/intel/ice/ice_switch.c

[ ... ]

> @@ -1850,9 +1852,10 @@ ice_cfg_rdma_fltr(struct ice_hw *hw, u16 vsi_handle, bool enable)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> -	ctx->info.q_opt_rss = cached_ctx->info.q_opt_rss;
> -	ctx->info.q_opt_tc = cached_ctx->info.q_opt_tc;
> -	ctx->info.q_opt_flags = cached_ctx->info.q_opt_flags;
> +	/* not from the cached ctx, that misses later RSS changes */
> +	ctx->info.q_opt_rss = info->q_opt_rss;
> +	ctx->info.q_opt_tc = info->q_opt_tc;
> +	ctx->info.q_opt_flags = info->q_opt_flags;

[Severity: Low]
This change fixes a user-visible bug, which the commit message admits
("which the toggle reverted"). Could it be split out as a standalone fix
for net with a Fixes: tag?

ice_set_rss_hfunc() and the NO_INIT path of ice_vsi_init() both go through
ice_update_vsi(). That function only sends the AQ command and doesn't
refresh hw->vsi_ctx[].

Before this patch, an irdma probe or remove then did:

ice_rdma_update_vsi_filter()
    ice_cfg_rdma_fltr()
        ctx->info.q_opt_rss = cached_ctx->info.q_opt_rss;  (stale hash bits)
        ice_update_vsi()

So hardware silently went back to plain Toeplitz after a symmetric-xor hash
was set with ethtool -X. Meanwhile vsi->rss_hfunc and ethtool still
reported symmetric-xor.

As submitted, the fix depends on the new pf->rss_lut_lock and the changed
ice_cfg_rdma_fltr() signature, so stable trees can't pick it up. A
standalone version could carry:

Fixes: 352e9bf23813 ("ice: enable symmetric-xor RSS for Toeplitz hash function")

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
