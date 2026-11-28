Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858215;
	b=SRe7DNyyQOw7yNqz8TYBCNHkQhWYkAcuYgmZogRTlzezmNfhO3zMB/JjSUYFKXIWl2Yl
	 tDuvR8MRl02i04eHJcD4XcDHOA/JzJi/1wGJLr/OanmUco0Gr6WLSg34+cQ5slCFlGTHF
	 iBKvCBcLBzLVoR3wss3f3bLeOYImKT9VTOjKgM/BVxpnbFZvSY21HzswPiGdrdKEa7OIQ
	 xC57kJLM3SugBcV7KNBZCWNnvOckicKDz6A/RFyJftrUiDH1qxDRfqdNgaSmk1KlLQHov
	 P8l2SZbPOQqyVt0xlKL2YF7tlfgZHXY1dPozwk/gIP3wim88hzhrJZkTHUMhGLKV6WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858215;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YlUSTqlDLSiYnKXcQwkZ7xCXG+D4DiBqjnIkYe6WzA8=;
	b=Yrg/BNiECIj9VWxg1F+MOMaYvgYT/JDyR3XyoSqHYGQgjhBQI8FC0hbFxTCOBiFamOLR
	 zjc27hRFH3xuhOiTgjVlZZgxlfhGMya49QyyK6cwzYxloonbAHuv3Ydv762U94Zq0bax/
	 sqQCrXX3UpJAalT24Hq3OijS+UjgqZgIyGTlOPh+VuN8+3/qVBFXJderXWJzvOPEMxJ6P
	 a69LJleL3ih1L6BxTDIPUY55AeqA3sROzPNEqXgJFSrObajmYXqrmohhavWA4+IsPfKfX
	 DcT76BeDpxTmswSNwS6Yvt+Z9sz5LsNkWOr2TzzPjLoOtOPKOSV6WbSNvCxXeRwpnNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjORHsWA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40C6606A688;
	Sat, 28 Nov 2026 09:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SjORHsWA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDA01F0089A;
	Sat, 28 Nov 2026 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795858214;
	bh=YlUSTqlDLSiYnKXcQwkZ7xCXG+D4DiBqjnIkYe6WzA8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SjORHsWAO9yz/Mt5R6NvoEtQfbJgdaJpkD4VjFddJYzw3KwVI4attRiCksHVhYvMs
	 dY2M5BWX09WPPlzgx0ORURCZTK0RYkA/l6v2xZrhckHNOK3RMJZl9C+x8OckCUa22X
	 kjk1ovdm6hQ1dGa/HJcBiMuPWCqw0JTL9AHNJQsgM2SLLVAM82YEMIZfUc4hH1qvip
	 mRfW+FPP3+eFhQ9odyavFx8Y0DpSzWRAzuiJn+53YOJQCTof3imkJXjBzVy+Sr50jr
	 ey7WgwpjQMwzc/C0h3kVqX11ekw/DYQx7crPEjzVwkSFd+MZ+rzMs97Dxdk+qzl3Pr
	 5nfGBZytQgJhg==
Subject: Re: [PATCH net v5 4/4] ice: use a VLAN agnostic multicast promisc
 rule pair for PF VSIs
From: netdev-bot+sashiko@kernel.org
To: poros@redhat.com
Cc: netdev@vger.kernel.org, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 aleksandr.loktionov@intel.com, horms@kernel.org,
 michal.swiatkowski@linux.intel.com, grzegorz.nitka@intel.com,
 pmenzel@molgen.mpg.de, wojciech.drewek@intel.com,
 marcin.szycik@linux.intel.com, martyna.szapar-mudlaw@linux.intel.com,
 ivecera@redhat.com, alice.michael@intel.com, jacob.e.keller@intel.com,
 jbrandeb@kernel.org, patryk.holda@intel.com, sx.rinitha@intel.com,
 aaron.ma@canonical.com, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org
Date: Sat, 28 Nov 2026 09:30:12 +0000
Message-ID: <179585821237.3135.7178956472467266393@kernel.org>
In-Reply-To: <20261127085714.1207361-5-poros@redhat.com>
References: <20261127085714.1207361-5-poros@redhat.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In ice_vsi_sync_fltr()
  (drivers/net/ethernet/intel/ice/ice_main.c), the error paths rewritten…

--

ice: use a VLAN agnostic multicast promisc rule pair for PF VSIs

On PF VSIs, this patch replaces the per-VID ICE_SW_LKUP_PROMISC_VLAN
multicast promisc rule pairs with one VLAN agnostic ICE_SW_LKUP_PROMISC
pair, so the switch lookup table no longer runs out. It removes the
per-VID handling from ice_vlan_rx_add_vid() and ice_vlan_rx_kill_vid().
The multicast subscription is now reconciled from IFF_PROMISC and
IFF_ALLMULTI in one place in ice_vsi_sync_fltr().

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 2ce2b7138f668..ea6da46bf7955 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c

[ ... ]

> @@ -399,91 +408,65 @@ static int ice_vsi_sync_fltr(struct ice_vsi *vsi)
>  		goto exit;
>  
>  	/* check for changes in promiscuous modes */

[ ... ]

> +	promisc_changed = test_and_clear_bit(ICE_VSI_PROMISC_CHANGED,
> +					     vsi->state);
> +	if ((changed_flags & IFF_PROMISC) || promisc_forced_on)
> +		promisc_changed = true;
> +
> +	if (promisc_changed && (vsi->current_netdev_flags & IFF_PROMISC)) {
> +		/* Apply Rx filter rule to get traffic from wire */
> +		if (!ice_is_dflt_vsi_in_use(vsi->port_info)) {
> +			err = ice_set_dflt_vsi(vsi);
> +			if (err && err != -EEXIST) {
> +				netdev_err(netdev, "Error %d setting default VSI %i Rx rule\n",
> +					   err, vsi->vsi_num);
> +				vsi->current_netdev_flags &= ~IFF_PROMISC;
> +				set_bit(ICE_VSI_PROMISC_CHANGED, vsi->state);
> +				dflt_err = true;

[ ... ]

> +	/* promiscuous mode implies allmulticast */
> +	if (promisc_changed || (changed_flags & IFF_ALLMULTI)) {
> +		int mc_err = 0;
> +
> +		/* a failed DFLT install leaves the netdev promiscuous */
> +		if (ice_vsi_wants_mc_promisc(vsi))
> +			mc_err = ice_set_promisc(vsi, ICE_MCAST_PROMISC_BITS);
> +		else if (!dflt_err)
> +			mc_err = ice_clear_promisc(vsi, ICE_MCAST_PROMISC_BITS);
> +		if (mc_err) {
> +			netdev_err(netdev, "Error %d syncing multicast promiscuous on VSI %i\n",
> +				   mc_err, vsi->vsi_num);
> +			/* retried by the next sync, with the allmulti change */
> +			vsi->current_netdev_flags ^=
> +				changed_flags & IFF_ALLMULTI;
> +			set_bit(ICE_VSI_PROMISC_CHANGED, vsi->state);
> +			if (!err)
> +				err = mc_err;
>  		}
>  	}
>  	goto exit;

[Severity: Medium]
Does this retry actually happen? Both the comment above and the commit
message ("a failed DFLT install does not remove it before the retry")
expect a later sync.

Three error paths are involved: the failed DFLT install (dflt_err), the
failed DFLT clear and this mc_err path. Each one only sets
ICE_VSI_PROMISC_CHANGED, returns an error and leaves through exit.

ice_sync_fltr_subtask() calls ice_vsi_sync_fltr() only when
ice_vsi_fltr_changed() is true:

ice_sync_fltr_subtask() {
    ...
	ice_for_each_vsi(pf, v)
		if (pf->vsi[v] && ice_vsi_fltr_changed(pf->vsi[v]) &&
		    ice_vsi_sync_fltr(pf->vsi[v])) {
			/* come back and try again later */
			set_bit(ICE_FLAG_FLTR_SYNC, pf->flags);
			break;
		}
}

ice_vsi_fltr_changed() looks only at the UMAC and MMAC bits:

	return test_bit(ICE_VSI_UMAC_FLTR_CHANGED, vsi->state) ||
	       test_bit(ICE_VSI_MMAC_FLTR_CHANGED, vsi->state);

ice_vsi_sync_fltr() clears both bits near its start. Only the out label
sets them again, and these paths skip it. So ICE_FLAG_FLTR_SYNC is set
again after the error, but on the next service task pass the VSI is
skipped and the flag is cleared.

The admin queue can fail transiently, for example in the FW ENOSPC ->
-EIO case from the commit message. Could the VSI then stay with
IFF_PROMISC set but no DFLT Rx rule? Could it also stay with IFF_ALLMULTI
or IFF_PROMISC set and missing or stale multicast promisc rules?

Removing VLANs to free FLU entries would not trigger a resync, because
ice_vlan_rx_kill_vid() sets no sync bits. The state seems to last until
an unrelated ice_set_rx_mode() call or an eswitch resync.

The old out_promisc label had the same gating, but this patch adds new
retry state and depends on it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127085714.1207361-1-poros%40redhat.com
