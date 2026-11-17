Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959673;
	b=XyR4NYe88b7tV814qu/U5+jiOlMfm3jLcKCVd456+yi/8t573n6PVlIR25y6/7okkOhO
	 1f67kcceGJz9sqsWQ3wTIGN0T+5Jt6Nw4233YmAy6dgbZ7RHVZQZr/8pZqgCHow76up12
	 YaeKzpe/phy3cCMHO4/8Y8NTqEtp3ioK0KgodqX8HAwVO2V3i/3YMXqxpg6Z7pZ2H40FI
	 N9zceQD+7pw0nKPZ4gp0wLaQ3FwDR4hV/I0rZQnc+aKzNcJWm+mJZze/GTMCu+7W1AlvB
	 vsQtQGUOmFMkIPVorfNzWc+Vk/fOfv7P1KXGKycivWZZqrHLBgwfsJUAU2ZVMTTF8tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959673;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Nz92Qnvv3ONHYTAUH+flUULBiUOlFIkNUBNbtL50PkY=;
	b=E0XSY9spkyv60XBQ7lN3QbVViiNAW3YEHTKWTXIg9J5SZC8dCOIiVfgMD9Qpqk2yIBa0
	 lIpFK4HrGJwFVM0/q4pHvm1HRedJ5RXYHcrEFPip5FS+8v8atWrCcs9Bi9Qiz1J+3S5L2
	 qiFFrhTdYvv8je/XgsAlCxmA3dBLtrvHgJjF9FwUnfDp8l3dJQC3i+U+F4y+4J2vD3Hoc
	 vQZTYlYZEA4lT1Eo0gyBR2cfjzyNXzdMI42RzAmo6C0HNYiCQNUy7jq5lnFiS6//jHqR8
	 cv+pejmaYFZ//bu4jcH6dHeA3r7FweZQ6UktID4p63kFIAtpREK0OahJQ4nQbHiuMrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AI1GMr9t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D06606A338
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AI1GMr9t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78E51F000C4;
	Tue, 17 Nov 2026 23:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959672;
	bh=Nz92Qnvv3ONHYTAUH+flUULBiUOlFIkNUBNbtL50PkY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AI1GMr9t89MmKpuva5xY5VbV3isFSNz1lypLb7uH0E1X09VLcFGM+GYTUi6+tXggB
	 8+Uzx9lLDdnA6uL9lOdPQkexrH1IVyA923lRTwP162AJeSdUtGGXJkYw5jsCvv6Aj0
	 Z2H06NvfaLbQIZdV6h1ELDYQIYYoo8Bxfhn6HmendycjzkK45FtUIm2Q2/OqgNrDl2
	 rAA3IhzhoyGDsbB9w0Q9WLCPJhyH/DEQAVDS0SK10Sxto4y4gvewT7fF9rhCjZ3J9Q
	 JbXeGHI+Xc0/s9lzVGZls4guznL+yx7iSr2thuufrNIkjps4JPAfj+Xevfpb6Cy/Hh
	 9LYHT1hq+vSWQ==
Subject: Re: [PATCH net 2/6] ice: skip per-VLAN promisc rules when default VSI
 Rx rule is set
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, poros@redhat.com,
 david.m.ertman@intel.com, pengpeng@iscas.ac.cn, przemyslaw.kitszel@intel.com,
 vinicius.gomes@intel.com, sridhar.samudrala@intel.com,
 aleksandr.loktionov@intel.com, horms@kernel.org, alexander.nowlin@intel.com
Date: Tue, 17 Nov 2026 23:54:31 +0000
Message-ID: <179495967132.3136.6714105968141020753@kernel.org>
In-Reply-To: <20261113231225.1864810-3-anthony.l.nguyen@intel.com>
References: <20261113231225.1864810-3-anthony.l.nguyen@intel.com>
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

Critical: 0 · High: 0 · Medium: 5 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] While the VSI holds the default (DFLT) Rx rule,
  ice_vlan_rx_add_vid() still converts the vid=0 multicast rule from the…
- [Medium] ice_vsi_sync_fltr() calls ice_vsi_clear_vlan_mc_promisc()
  whenever ice_set_dflt_vsi() returns 0 or -EEXIST, even if no DFLT rule…
- [Medium] After this patch, whether per-VID multicast promisc rules
  exist depends on port-level DFLT state (ice_is_vsi_dflt_vsi()).
- [Medium] ice_vsi_exit_dflt_promisc() makes leaving promiscuous mode
  depend on allocating one switch rule per VLAN, which can fail in the…
- [Medium] Clearing IFF_ALLMULTI while IFF_PROMISC stays set removes the
  promiscuous VSI's multicast subscription, which the patch says it…
- [Low] The commit message does not mention the change to
  ice_clear_promisc().
- [Low] When a VSI with VLANs and ALLMULTI enters promisc,
  ice_vsi_sync_fltr() leaves a window with no multicast promisc rule at…

--

ice: skip per-VLAN promisc rules when default VSI Rx rule is set

While the VSI holds the default VSI Rx rule, this patch skips the per-VLAN
ICE_SW_LKUP_PROMISC_VLAN expansion in ice_set_promisc() and
ice_vlan_rx_add_vid(), so the shared FLU pool is not exhausted. Once the
DFLT rule is installed, it drops the per-VID multicast rules that are now
redundant, and the new ice_vsi_exit_dflt_promisc() puts them back on
promisc exit. A promiscuous VSI is also subscribed to multicast when the
default VSI rule is already in use.

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 47c6798c97e8f..ecd05f5050ff1 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c

[ ... ]

> @@ -304,9 +305,20 @@ static int ice_clear_promisc(struct ice_vsi *vsi, u8 promisc_m)
>  		return 0;
>  
>  	if (ice_vsi_has_non_zero_vlans(vsi)) {
> -		promisc_m |= (ICE_PROMISC_VLAN_RX | ICE_PROMISC_VLAN_TX);
> +		u8 vlan_promisc_m = promisc_m | ICE_PROMISC_VLAN_RX |
> +				    ICE_PROMISC_VLAN_TX;
> +		int vid0_status;
> +
> +		/* the vid=0 rule may be in either recipe (the recipe used to
> +		 * set it is not recorded), so clear both; clearing an absent
> +		 * rule returns 0
> +		 */
>  		status = ice_fltr_clear_vlan_vsi_promisc(&vsi->back->hw, vsi,
> -							 promisc_m);
> +							 vlan_promisc_m);
> +		vid0_status = ice_fltr_clear_vsi_promisc(&vsi->back->hw,
> +							 vsi->idx, promisc_m, 0);

[Severity: Medium]
If only IFF_ALLMULTI is cleared, can a promiscuous VSI end up with no
multicast subscription?

The ALLMULTI-off branch of ice_vsi_sync_fltr() calls this function without
checking IFF_PROMISC:

	} else {
		/* !(vsi->current_netdev_flags & IFF_ALLMULTI) */
		err = ice_clear_promisc(vsi, ICE_MCAST_PROMISC_BITS);

After this change it also removes the vid=0 ICE_SW_LKUP_PROMISC rule. For
a DFLT VSI, that is the subscription ice_set_promisc() installs for promisc
mode. IFF_PROMISC did not change and ICE_VSI_PROMISC_CHANGED is not set, so
the PROMISC branch is skipped and nothing reinstalls the rule. For example:

  ip link set dev X promisc on allmulticast on
  ip link set dev X allmulticast off

The commit message says ice_set_promisc(ICE_MCAST_PROMISC_BITS) is issued
"whenever the netdev is promiscuous", so that a promiscuous VSI no longer
ends up "in unicast promisc with no multicast subscription".

The PROMISC-off branch guards its clear with
!(vsi->current_netdev_flags & IFF_ALLMULTI). Should the ALLMULTI-off branch
have a matching IFF_PROMISC guard?

> +		if (!status)
> +			status = vid0_status;

[Severity: Low]
This isn't a bug, but the commit message does not mention this change to
ice_clear_promisc(). With non-zero VLANs present, it now also clears the
vid=0 rule in the non-VLAN ICE_SW_LKUP_PROMISC recipe and merges the two
status values.

The message also leaves out that, for a DFLT VSI, ice_set_promisc() now
installs the multicast subscription in the VLAN-agnostic recipe. That
recipe switch, not the DFLT rule, is what keeps multicast coverage on
every VID.

The commit message says:

  The DFLT rule already catches every packet on the port regardless of VLAN
  tag, so the per-VLAN promisc expansion is redundant while it is installed.

But the new comment in ice_vsi_sync_fltr() says:

  the unicast catch-all does not cover the multicast subscription.

Could the commit message describe the multicast rule layout change and the
new clear path, and reconcile these two statements?

>  	} else {
>  		status = ice_fltr_clear_vsi_promisc(&vsi->back->hw, vsi->idx,
>  						    promisc_m, 0);
> @@ -317,6 +329,61 @@ static int ice_clear_promisc(struct ice_vsi *vsi, u8 promisc_m)
>  	return status;
>  }
>  
> +/**
> + * ice_vsi_exit_dflt_promisc - drop the default VSI Rx rule on promisc off
> + * @vsi: the VSI leaving promiscuous mode

[ ... ]

> +static int ice_vsi_exit_dflt_promisc(struct ice_vsi *vsi)
> +{
> +	struct ice_vsi_vlan_ops *vlan_ops = ice_get_compat_vsi_vlan_ops(vsi);
> +	struct net_device *netdev = vsi->netdev;
> +	struct ice_hw *hw = &vsi->back->hw;
> +	bool restore_mc;
> +	int err;
> +
> +	restore_mc = (vsi->current_netdev_flags & IFF_ALLMULTI) &&
> +		     ice_vsi_has_non_zero_vlans(vsi);
> +
> +	if (restore_mc) {
> +		err = ice_fltr_set_vlan_vsi_promisc(hw, vsi,
> +						    ICE_MCAST_VLAN_PROMISC_BITS);
> +		if (err && err != -EEXIST)
> +			return err;
> +	}
> +
> +	err = ice_clear_dflt_vsi(vsi);

[Severity: Medium]
Can leaving promiscuous mode now fail because of the FLU exhaustion this
patch is meant to address?

On promisc entry, ice_vsi_clear_vlan_mc_promisc() frees every per-VID
multicast rule, and other PFs sharing the pool can take those entries. On
promisc exit with IFF_ALLMULTI and VLANs, every per-VID rule has to be
reinstalled here before ice_clear_dflt_vsi() runs.

ice_set_vlan_vsi_promisc() stops at the first error other than -EEXIST and
keeps the rules it has already added:

	if (status && status != -EEXIST)
		break;

On ENOSPC this function returns before ice_clear_dflt_vsi(), and
ice_vsi_sync_fltr() sets IFF_PROMISC in current_netdev_flags again. The
port stays in DFLT mode with VLAN pruning disabled even though the user
cleared promisc. The partially reinstalled rules are not rolled back. The
retry happens on the next rx_mode event and can fail the same way.

If promisc is then turned back on, ice_is_dflt_vsi_in_use() is true. The
ice_vsi_clear_vlan_mc_promisc() block is skipped, so those per-VID rules
stay alongside DFLT and the vid=0 rule.

Before this patch the per-VID rules stayed allocated while promisc was on,
so leaving promisc only removed DFLT. Is it intended that promisc exit can
now fail on rule allocation?

[ ... ]

> @@ -429,30 +496,31 @@ static int ice_vsi_sync_fltr(struct ice_vsi *vsi)
>  				err = 0;
>  				vlan_ops->dis_rx_filtering(vsi);
>  
> -				/* promiscuous mode implies allmulticast so
> -				 * that VSIs that are in promiscuous mode are
> -				 * subscribed to multicast packets coming to
> -				 * the port
> +				/* a prior allmulti pass may have added per-VID
> +				 * rules now covered by the DFLT rule
>  				 */
> -				err = ice_set_promisc(vsi,
> -						      ICE_MCAST_PROMISC_BITS);
> -				if (err)
> -					goto out_promisc;
> +				ice_vsi_clear_vlan_mc_promisc(vsi);

[Severity: Medium]
Is this reached even when no DFLT rule was actually installed?

When the PF is in a LAG with switchdev running, ice_set_dflt_vsi() returns
0 without calling ice_cfg_dflt_vsi():

drivers/net/ethernet/intel/ice/ice_lib.c:ice_set_dflt_vsi() {
	...
	if (ice_lag_is_switchdev_running(vsi->back)) {
		dev_dbg(dev, "VSI %d passed is a part of LAG containing interfaces in switchdev mode, nothing to do\n",
			vsi->vsi_num);
		return 0;
	}
	...
}

In that case ice_vsi_clear_vlan_mc_promisc() deletes every per-VID
multicast rule left by an earlier ALLMULTI pass. The following
ice_set_promisc(ICE_MCAST_PROMISC_BITS) sees ice_is_vsi_dflt_vsi() as
false and adds them all back.

Multicast on those VLANs is not delivered in between. If the re-add fails
partway, for example with ENOSPC after another PF takes the freed entries,
the VSI ends up with fewer multicast rules than it had before.

The commit message says the logic is keyed on ice_is_vsi_dflt_vsi() so
that a "LAG-suppressed DFLT install still falls back to the per-VLAN
rules", but this call is keyed on the return code instead. Would guarding
it with ice_is_vsi_dflt_vsi(vsi) match the stated design?

>  			}
> +
> +			/* Promiscuous mode implies allmulticast. Subscribe
> +			 * the VSI to all multicast even when the default VSI
> +			 * rule is already in use and the block above is
> +			 * skipped (it may be owned by another VSI, or
> +			 * preserved across a switchdev session); the unicast
> +			 * catch-all does not cover the multicast subscription.
> +			 */
> +			err = ice_set_promisc(vsi, ICE_MCAST_PROMISC_BITS);
> +			if (err)
> +				goto out_promisc;

[Severity: Low]
Separately, ice_vsi_clear_vlan_mc_promisc() above removes the per-VID
ICE_SW_LKUP_PROMISC_VLAN multicast rules, vid=0 included, before this
ice_set_promisc() call installs the VLAN-agnostic vid=0 replacement. Does
that leave a window with no multicast promisc rule while the bulk removal
runs?

ice_vsi_exit_dflt_promisc() is ordered so that "coverage never lapses",
but the entry path uses the opposite order. The two recipes are separate
and can coexist. Could the VLAN-agnostic rule be installed before the
per-VID rules are removed?

[ ... ]

> @@ -3675,10 +3743,9 @@ int ice_vlan_rx_add_vid(struct net_device *netdev, __be16 proto, u16 vid)
>  	while (test_and_set_bit(ICE_CFG_BUSY, vsi->state))
>  		usleep_range(1000, 2000);
>  
> -	/* Add multicast promisc rule for the VLAN ID to be added if
> -	 * all-multicast is currently enabled.
> -	 */
> -	if (vsi->current_netdev_flags & IFF_ALLMULTI) {
> +	/* skip the per-VID rule when the DFLT Rx rule already covers this VID */
> +	if ((vsi->current_netdev_flags & IFF_ALLMULTI) &&
> +	    !ice_is_vsi_dflt_vsi(vsi)) {
>  		ret = ice_fltr_set_vsi_promisc(&vsi->back->hw, vsi->idx,
>  					       ICE_MCAST_VLAN_PROMISC_BITS,
>  					       vid);

[Severity: Medium]
The per-VID rule is skipped here for a DFLT VSI, but the conversion further
down in ice_vlan_rx_add_vid() is not gated the same way:

	if ((vsi->current_netdev_flags & IFF_ALLMULTI) &&
	    ice_vsi_num_non_zero_vlans(vsi) == 1) {
		ice_fltr_clear_vsi_promisc(&vsi->back->hw, vsi->idx,
					   ICE_MCAST_PROMISC_BITS, 0);
		ice_fltr_set_vsi_promisc(&vsi->back->hw, vsi->idx,
					 ICE_MCAST_VLAN_PROMISC_BITS, 0);
	}

Can this drop multicast on every tagged VLAN while the VSI holds the DFLT
rule?

In DFLT mode, ice_set_promisc() now installs only the VLAN-agnostic
ICE_SW_LKUP_PROMISC vid=0 rule. When the first non-zero VID is added, this
block removes that rule and installs an ICE_SW_LKUP_PROMISC_VLAN rule that
matches VID 0 only.

For example, start with the VSI in PROMISC+ALLMULTI and no non-zero VLANs,
then add VID 10 and VIDs 11..4094. The switch is left with DFLT plus a
vid=0 PROMISC_VLAN multicast rule, and no multicast promisc rule for any
tagged VID.

Commit 1273f89578f2 notes that a PROMISC_VLAN rule only receives multicast
for its own VID. The new comment in ice_vsi_sync_fltr() also says the
unicast catch-all does not cover the multicast subscription.

The result depends on ordering too. VLANs that exist before DFLT is set
get the VLAN-agnostic rule. VLANs added afterwards do not, until promisc
is cleared through ice_vsi_exit_dflt_promisc().

Should this conversion also be skipped when ice_is_vsi_dflt_vsi(vsi) is
true?

[Severity: Medium]
Is the per-VID rule also skipped here when the eswitch owns the DFLT rule,
rather than netdev promisc?

ice_eswitch_setup_env() makes the uplink the default VSI through
ice_set_dflt_vsi(). With switchdev running and IFF_ALLMULTI set, every
VLAN added during the session skips its per-VID multicast rule here.

On teardown, the DFLT Rx rule is removed directly through this path:

ice_eswitch_detach_vf()/ice_eswitch_detach_sf()
  ice_eswitch_disable_switchdev()
    ice_eswitch_release_env()
	ice_cfg_dflt_vsi(uplink_vsi->port_info, uplink_vsi->idx, false,
			 ICE_FLTR_RX);

That path does not go through ice_vsi_exit_dflt_promisc(), does not take
ICE_CFG_BUSY, and does not set any resync bit. The skipped per-VID rules
are never reinstalled, and IFF_ALLMULTI stays broken for those VLANs
until allmulticast is toggled.

At this commit ice_eswitch_release_env() removes DFLT unconditionally. The
later patch in this series, "ice: preserve uplink DFLT Rx rule on
switchdev release", keeps DFLT only when the uplink is IFF_PROMISC, so a
non-promisc ALLMULTI uplink still hits this. For example:

  ip link set eth0 allmulticast on
  (create VFs in switchdev mode)
  ip link add link eth0 name eth0.10 type vlan id 10
  (remove the VFs)

ice_vlan_rx_add_vid() and ice_eswitch_release_env() also do not share a
lock. Can add_vid see DFLT present just before release_env removes it,
leaving the same gap?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113231225.1864810-1-anthony.l.nguyen%40intel.com
