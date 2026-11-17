Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959674;
	b=jExdBhhLoMUxp/2sSDr5pndtRi495AHeU6aZW/U1rhjhlRf7qpl3j0wzk110pdCZlom/
	 pFjfV5LstzAsgBtp37OzTNrg5oyLlgqNQt9R6aUxgSi/8fwLTGZX4S4mb7h1vpL6mUwh5
	 fihomcseqUEHOlZ+7BD6zLBlTAG4BUhfFlEeuT7X2agNOTbc7ome6SUYuQh0Si3yatcNs
	 HQ1vGjMQjvhyZpiG529MwZiasJ99tcxvdg9k7CmAQsua6uIDHmlHCmuOTYu/nhgDj+Zp6
	 PYR7QFh1wDtItaDjur1cVi+ConvuE5/3gxsnTApX5CePFE8t/uHAxwe42Z5j+OICs6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959674;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oFlW+N0oRi43LAcM/8cQTaqFOyYMm+Fh8LJoujmGxMY=;
	b=OjyQW0ISFTeyT8Cbip2ikt4IWb8AZjlY4vYqAcLS1u90ra+1cmJu4ZhQYfX5ZFIsMpBO
	 eDg6M5K8WH95Tq6cuebhEszXXgIhG82kh2qUJ3EEd/sCNAzNHuiOL/33z0paeGFKK49Hy
	 s37a/JPn6R6txbWrk3kH6ocSiMPRrUZpwv+44gez/A2iDW2y9mZtgwExM3/xF+estXfJS
	 6fsxklsQjbgs/k5gINUbWqXMoGvwn0H4Nn/xTdDUeAIpIFqfgxzmoN+rNmV4QVwUu3CSE
	 pe80wHdU3ast4WRvs91Tp/dsVFuZdBliXzzrYFM6ZMPBuk2qj/1ntPr7DTE5NnQp0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSAcYBWS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F29606A882
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSAcYBWS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEC21F000C4;
	Tue, 17 Nov 2026 23:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959674;
	bh=oFlW+N0oRi43LAcM/8cQTaqFOyYMm+Fh8LJoujmGxMY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iSAcYBWSkkUD1FyWRCj6qvf+0+IPTMSgDWNDGWK2GPN8DI78t+7VuuYp6Pk8J816M
	 QzxU8opFGUwoTU3sr8LHBgZkU4pxWcEXGcr0o1PV+aDrQyE9okutH1Kl71tiU0RWIB
	 spXXCnds9Fx0lPzYou2VvRhaB7EY7qq8iDE785EaBr2AQzejtd+fqkVYVg9aOknSPH
	 CTPKsHKL/JVCiQuIM/hvpaSu6SH3+DwOXMZS1gs5rMu2+HszMnXmgALasa6Nd5kBML
	 jrZfCiLq7vaRE+8ldnC0fXX8inpASe2kY3ONtNp2eNw2VWdREW4WW1L6vTH8pkAczo
	 z9mTYyAAaZcCQ==
Subject:
 Re: [PATCH net 3/6] ice: preserve uplink DFLT Rx rule on switchdev release
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, poros@redhat.com,
 david.m.ertman@intel.com, pengpeng@iscas.ac.cn, przemyslaw.kitszel@intel.com,
 vinicius.gomes@intel.com, sridhar.samudrala@intel.com,
 aleksandr.loktionov@intel.com, horms@kernel.org, alexander.nowlin@intel.com
Date: Tue, 17 Nov 2026 23:54:33 +0000
Message-ID: <179495967304.3136.16113490698897758196@kernel.org>
In-Reply-To: <20261113231225.1864810-4-anthony.l.nguyen@intel.com>
References: <20261113231225.1864810-4-anthony.l.nguyen@intel.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ice_eswitch_release_env() (and the err_def_tx unwind in
  ice_eswitch_setup_env()) now keeps or removes the Rx DFLT rule based…
- [Medium] The fix leaves the uplink's promiscuous configuration only
  half restored after a switchdev session.
- [Medium] ice_eswitch_release_env() makes its keep/remove decision for
  the Rx DFLT rule from one unlocked snapshot of…
- [Medium] The new comment in ice_eswitch_release_env() says that testing
  the live netdev->flags keeps 'the preserved DFLT rule and the pruning…

--

ice: preserve uplink DFLT Rx rule on switchdev release

This commit stops ice_eswitch_release_env() and the err_def_tx unwind in
ice_eswitch_setup_env() from removing the uplink's ICE_SW_LKUP_DFLT Rx
rule when the uplink netdev has IFF_PROMISC set. The Tx DFLT rule is
still removed. The decision is based on the live netdev->flags.

> diff --git a/drivers/net/ethernet/intel/ice/ice_eswitch.c b/drivers/net/ethernet/intel/ice/ice_eswitch.c
> index 6e7bba4738989..c32d6b201369b 100644
> --- a/drivers/net/ethernet/intel/ice/ice_eswitch.c
> +++ b/drivers/net/ethernet/intel/ice/ice_eswitch.c

[ ... ]

> @@ -276,8 +278,16 @@ static void ice_eswitch_release_env(struct ice_pf *pf)
>  	vlan_ops->ena_rx_filtering(uplink_vsi);
>  	ice_cfg_dflt_vsi(uplink_vsi->port_info, uplink_vsi->idx, false,
>  			 ICE_FLTR_TX);
> -	ice_cfg_dflt_vsi(uplink_vsi->port_info, uplink_vsi->idx, false,
> -			 ICE_FLTR_RX);
> +
> +	/* Keep the Rx DFLT rule if the uplink is promiscuous; it must outlive
> +	 * the session. Test the live netdev->flags, the same value
> +	 * ena_rx_filtering() -> ice_cfg_vlan_pruning() above keys its decision
> +	 * on, so the preserved DFLT rule and the pruning state stay consistent.
> +	 */

[Severity: Medium]
Does the "same value" claim in this comment still hold if promisc changes
concurrently?

ice_cfg_vlan_pruning() does its own plain load of the flags:

drivers/net/ethernet/intel/ice/ice_vsi_vlan_lib.c:ice_cfg_vlan_pruning() {
    ...
	if (vsi->netdev && vsi->netdev->flags & IFF_PROMISC && ena)
		return 0;
    ...
}

The new check below is a second, separate load. It runs after the
ice_cfg_dflt_vsi(..., ICE_FLTR_TX) admin queue command, and neither read
is done under RTNL.

If IFF_PROMISC flips between the two reads, ice_set_rx_mode() returns
early because pf->eswitch.is_running is still true. Nothing corrects the
state later.

Could that leave VLAN pruning disabled with the DFLT rule removed and
promisc off? Or pruning enabled with the catch-all kept and promisc on?

If the flag were read once into a local (or under RTNL) and used for both
decisions, the comment would be accurate.

> +	if (!(uplink_vsi->netdev->flags & IFF_PROMISC))
> +		ice_cfg_dflt_vsi(uplink_vsi->port_info, uplink_vsi->idx,
> +				 false, ICE_FLTR_RX);

[Severity: High]
Does this leave vsi->current_netdev_flags out of sync with the hardware
filter state?

The keep/remove decision uses the live netdev->flags. Nothing here updates
vsi->current_netdev_flags or sets ICE_VSI_PROMISC_CHANGED or
ICE_FLAG_FLTR_SYNC.

While switchdev is running, ice_set_rx_mode() drops every rx_mode event:

drivers/net/ethernet/intel/ice/ice_main.c:ice_set_rx_mode() {
    ...
	if (!vsi || ice_is_switchdev_running(vsi->back))
		return;
    ...
}

So a promisc change made during the session is never recorded. After
teardown, ice_vsi_sync_fltr() computes changed_flags against that stale
value:

	changed_flags = vsi->current_netdev_flags ^ vsi->netdev->flags;
	vsi->current_netdev_flags = vsi->netdev->flags;
	...
	if (((changed_flags & IFF_PROMISC) || promisc_forced_on) ||
	    test_bit(ICE_VSI_PROMISC_CHANGED, vsi->state)) {

Take the case where promisc is off before switchdev and is turned on
during the session (for example by tcpdump on the PF):

- This code keeps the DFLT Rx rule that switchdev installed.
- ice_cfg_vlan_pruning() also leaves pruning off.
- When promisc is turned off after teardown, changed_flags has no
  IFF_PROMISC, so ice_vsi_exit_dflt_promisc() is never called.

Would the uplink then stay the port's default VSI, with VLAN pruning
disabled while IFF_PROMISC is clear? Other VSIs would then see
ice_is_dflt_vsi_in_use() return true.

The reverse case also looks reachable:

- Promisc is on before switchdev and is turned off during the session.
- This code removes the DFLT rule.
- When promisc is turned back on after teardown, changed_flags again has
  no IFF_PROMISC, so ice_set_dflt_vsi() and dis_rx_filtering() are
  skipped.

Isn't that IFF_PROMISC set with no catch-all, the same symptom the commit
message describes? The commit message says:

    including for a promisc change made while switchdev ran (which never
    reached the gated filter sync).

Would retriggering the sync handle these cases instead of special-casing
the Rx rule? That could mean setting ICE_VSI_PROMISC_CHANGED and
ICE_FLAG_FLTR_SYNC, or reconciling vsi->current_netdev_flags.

The err_def_tx unwind in ice_eswitch_setup_env() has the same check and
looks like it has the same problem.

[Severity: Medium]
Can a concurrent promisc change be lost between this check and the point
where is_running is cleared?

ice_eswitch_release_env() is reached from ice_eswitch_detach() without
RTNL. It cannot hold RTNL there, because repr->ops.rem() calls
unregister_netdev():

drivers/net/ethernet/intel/ice/ice_eswitch.c:ice_eswitch_detach() {
    ...
	repr->ops.rem(repr);

	xa_erase(&pf->eswitch.reprs, repr->id);

	if (xa_empty(&pf->eswitch.reprs))
		ice_eswitch_disable_switchdev(pf);
    ...
}

is_running is cleared only after release_env returns:

drivers/net/ethernet/intel/ice/ice_eswitch.c:ice_eswitch_disable_switchdev() {
	ice_eswitch_br_offloads_deinit(pf);
	ice_eswitch_release_env(pf);

	pf->eswitch.is_running = false;
}

release_env also issues more admin queue commands after this check:
ice_fltr_add_mac_and_broadcast() and ice_vsi_cfg_sw_lldp().

Suppose "ip link set promisc on|off" runs __dev_change_flags() under RTNL
in that window. ice_set_rx_mode() returns early because is_running is
still true, and no ICE_FLAG_FLTR_SYNC is left pending.

Could that leave IFF_PROMISC set without the Rx DFLT rule, or a leftover
catch-all with promisc off, until some unrelated rx_mode event?

The err_def_tx unwind in ice_eswitch_setup_env() uses the same unlocked
read.

> +
>  	ice_fltr_add_mac_and_broadcast(uplink_vsi,
>  				       uplink_vsi->port_info->mac.perm_addr,
>  				       ICE_FWD_TO_VSI);

[Severity: Medium]
Does the uplink still lose its multicast promisc subscription after the
session?

On entry, ice_eswitch_setup_env() calls ice_remove_vsi_fltr():

drivers/net/ethernet/intel/ice/ice_switch.c:ice_remove_vsi_fltr() {
    ...
	ice_remove_vsi_lkup_fltr(hw, vsi_handle, ICE_SW_LKUP_PROMISC);
    ...
	ice_remove_vsi_lkup_fltr(hw, vsi_handle, ICE_SW_LKUP_DFLT);
    ...
	ice_remove_vsi_lkup_fltr(hw, vsi_handle, ICE_SW_LKUP_PROMISC_VLAN);
}

The PROMISC and PROMISC_VLAN rules are removed through
ice_remove_promisc(). ICE_SW_LKUP_DFLT falls into the unsupported lookup
type default, which is why only the DFLT rule survives.

That means the ICE_MCAST_PROMISC_BITS rule that ice_vsi_sync_fltr()
installed with ice_set_promisc() is gone after entry.

On teardown, release_env keeps the DFLT Rx rule and re-adds only the perm
MAC and broadcast filters. It does not set ICE_VSI_PROMISC_CHANGED, the
UMAC/MMAC_FLTR_CHANGED bits or ICE_FLAG_FLTR_SYNC.

If promisc did not change during the session, vsi->current_netdev_flags
equals netdev->flags. ice_vsi_sync_fltr() then never enters this block
again:

			/* Promiscuous mode implies allmulticast. Subscribe
			 * the VSI to all multicast even when the default VSI
			 * rule is already in use and the block above is
			 * skipped (it may be owned by another VSI, or
			 * preserved across a switchdev session); the unicast
			 * catch-all does not cover the multicast subscription.
			 */
			err = ice_set_promisc(vsi, ICE_MCAST_PROMISC_BITS);

Wouldn't the uplink then stay in unicast promisc with no multicast
subscription until promisc is toggled?

The commit message gives the cause as "the sync path was not
retriggered". Would retriggering the sync here restore both the DFLT
rule and the multicast rule?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113231225.1864810-1-anthony.l.nguyen%40intel.com
