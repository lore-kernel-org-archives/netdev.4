Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070707;
	b=FHvRO+jGMd5EGWAkZSlTT0dN3ztFMFPzu4AndgwFBsUNWDv4bQ2o6l2/QAd7T6zriIiq
	 GCDFRXGP4rNwkj1inLge/DpZl4yokkirzEw8SX4caIs7P50MIllsU1Inn+TEz5awKifqD
	 7HtBNI3XxcYeg7K7LggUiw+K57paXZrHKez98K+9MLGWce6UmXueU9CVx1rRMiHT+EIUX
	 fjB3naH4hI3X9aphdKUXbesmfKJXkpegLV4czDqrwgLFLd+g+jxulKXZYPJKhBwTngkhO
	 8i3GioML6lDa5CoQR4Z9Fv+2eqFMXTJFUlIIi+erlfBVwudZE8eTkqRwgmomWEn9SoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070707;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hh/8AAODZBtLOkMOefGOMVcCzd08cpcaC4om7tDkHrs=;
	b=I5s+wH2GA220xYQj0cSUf3XyG30/kfq6d8sPggMxJzt22Xr5WQIzc8+iVx/oH5jvAy9h
	 68jwpSmnM2XmSqIpkNPWy9GBbDYGDbMBGZtHsiVDWrez+oeEjqGS+D3JnfirAaGz06nqu
	 Kw0H9+NPgy4SVGUkBUblzmDOqaxvoUMmMi0Lt0u59YVMh0JkWar85xXkfgIEyMQvctYiZ
	 1RjptQvRvCJgmJ/ZfAf4eT08mjoyTgSFR0PEPXmh0xH4UfPoj7CycXXWN+Hj5yS6erRBa
	 q2WG60ngvlx6VGBIYaYOUszAeAMxcP16N74qTCFRxSH7ooapU8FQw6C8V2hDC8BGrsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nn8LFzof;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450760A263B
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nn8LFzof
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F4B1F000C4;
	Thu, 19 Nov 2026 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795070707;
	bh=hh/8AAODZBtLOkMOefGOMVcCzd08cpcaC4om7tDkHrs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nn8LFzofKQfVg8yasK66SBMPgL9x4ptnrfSW7/RDXIiJ+4wcVBb891wVqNz5VGcJ/
	 3pdRuHixLZ0+VYickOH9RuJXiB2XAyzs38YHj+QbNUARedDG6qQoo1NQeBUG84gCwM
	 tmBJ6dRrckFSl5B+lQW9RTN3RUaiRz9BdtXN2q1ZGo2LwgxXaZOG4psmOwYEqBT9FH
	 5x8s9OIBGPJGe0ecXqgQYEftDmBTWrg4gbKlx3PenqV9FhzVJ3gGqXF2cqZFbnzAPa
	 I78VQru86OIxa4XzpcKrHZBVP6W/St0dKYTDazSrwspfg2kyzmXcgrrD+KQoq7FeEY
	 uFA5JWHMRZ2Iw==
Subject: Re: [net-next v6 13/15] ice: represent RSS LUTs as devlink resources
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
Date: Thu, 19 Nov 2026 06:45:05 +0000
Message-ID: <179507070588.3136.4417600568531157422@kernel.org>
In-Reply-To: <20261117094913.100756-14-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-14-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ABBA deadlock between the PF devlink instance lock and rtnl.
- [Medium] Cross-PF race on the shared global RSS LUT table during
  device-wide resets (CORER/GLOBR/EMPR).
- [Medium] [Baseline: discarded, fixed later in the series] At this
  commit, switching the PF from its PF LUT (up to 256 queues) to a…
- [Medium] ice: premature rate teardown and leaked flag in
  ice_setup_tc_mqprio_qdisc()
- [Low] ice_set_safe_mode_caps() now keeps dev_caps.nac_topo across the
  safe-mode caps reset.
- [Low] [Baseline: discarded as defensive] The concern is that the global
  LUT ID returned by firmware from ice_alloc_rss_global_lut() is used…

--

ice: represent RSS LUTs as devlink resources

This patch exposes the E800 RSS LUTs (the 512 entry global LUTs and the
2048 entry PF LUTs) as devlink resources on each PF devlink instance and
on the whole device devlink instance. A PF can switch between its PF LUT
and a global LUT with devlink resource set. LUT ownership is tracked in
a table on the shared ice_adapter, the default assignment is restored
after reset, and a new pf->rss_lut_lock serializes RSS LUT configuration.

> diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.c b/drivers/net/ethernet/intel/ice/devlink/resource.c
> new file mode 100644
> index 0000000000000..de9c13e928fae
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/ice/devlink/resource.c
> @@ -0,0 +1,663 @@

[ ... ]

> +static int ice_devl_res_take(struct ice_pf *pf,
> +			     enum ice_devl_resource_id res_id, int slot,
> +			     void *owner)
> +{
> +	struct ice_devl_resource *res = ice_devl_res_tbl(pf, res_id);
> +	int beg, end, new_id = ICE_ANY_SLOT;
> +	u16 lut_id;
> +
> +	if (res_id == ICE_RSS_LUT_GLOBAL) {
> +		int err;
> +
> +		WARN_ON_ONCE(slot != ICE_ANY_SLOT);
> +
> +		err = ice_alloc_rss_global_lut(&pf->hw, &lut_id);
> +		if (err)
> +			return err;
> +
> +		slot = lut_id;

[Severity: Low]
This isn't a bug, but lut_id comes straight from firmware through
ice_alloc_rss_global_lut(). It is then used as an index into the 16
entry res->owner[] and res->pf_id[] arrays.

The hardware field ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_M is 4 bits wide, so a
value above 15 would take a firmware bug. Would a check against
ARRAY_SIZE(res->owner) still be worth adding as hardening?

> +	}
> +
> +	end = slot == ICE_ANY_SLOT ? ARRAY_SIZE(res->owner) : slot + 1;
> +	beg = slot == ICE_ANY_SLOT ? 0 : slot;
> +	for (int id = beg; id < end; id++) {
> +		if (!res->owner[id]) {
> +			new_id = id;
> +			break;
> +		}
> +	}
> +	if (new_id == ICE_ANY_SLOT) {
> +		if (WARN_ON(res_id == ICE_RSS_LUT_GLOBAL))
> +			ice_free_rss_global_lut(&pf->hw, lut_id);

[Severity: Medium]
Can this WARN_ON() fire after a device-wide reset (CORER, GLOBR or
EMPR)?

That kind of reset frees the global LUTs of every PF in firmware at
once. A PF that did not start the reset only removes its stale entries
from adapter->resources[ICE_RSS_LUT_GLOBAL] (or sec_nac_global_luts)
when its own service task gets to them:

ice_reset_subtask()
  ice_prepare_for_reset()
    ice_prepare_rss_luts_for_reset()

Say PF B finishes its rebuild, and an admin runs devlink resource set on
B before PF A's service task has done that cleanup. ice_devl_res_change()
only checks B's own reset state:

    if (ice_is_reset_in_progress(pf->state)) {

Firmware can then hand B an ID that owner[] still records as owned by
A. The loop above finds no free slot, the WARN_ON() fires, and the user
gets -ENOSPC.

The v4 changelog handles this race only for PF-initiated resets. Should
the device-wide case be covered too?

> +
> +		return -ENOSPC;
> +	}

[ ... ]

> +static int ice_maybe_change_rss_lut(struct ice_pf *pf, void *owner,
> +				    enum ice_rss_lut_resource_state old,
> +				    enum ice_rss_lut_resource_state new,
> +				    struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	lut_size = ice_lut_type_to_size(lut_type);
> +	lut = kzalloc(lut_size, GFP_KERNEL);
> +	if (!lut)
> +		return -ENOMEM;
> +	params.lut = lut;
> +	params.lut_size = lut_size;
> +	params.lut_type = lut_type;
> +	params.vsi_handle = vsi->idx;
> +	mutex_lock(&pf->rss_lut_lock);
> +	/* PF with RXHASH disabled keeps its LUT zeroed */
> +	if (!vsi->netdev || vsi->netdev->features & NETIF_F_RXHASH)
> +		ice_fill_rss_lut(lut, lut_size, vsi->rss_size);

[Severity: Medium]
When the PF moves from its PF LUT (up to 256 queues) to a global LUT (up
to 64 queues), is vsi->rss_size limited anywhere here?

vsi->rss_size was sized for the PF LUT. At this commit,
ice_get_valid_rss_size() only clamps by rss_table_entry_width, and
ice_vsi_cfg_rss_lut_key() has no clamp by LUT type either. A PF with
more than 64 RSS queues would then get queue indices in the global LUT
that it cannot use.

The later patch in this series, "ice: support up to 256 VF queues", adds
ice_lut_type_to_qs_num() and clamps rss_size in
ice_maybe_change_rss_lut(), ice_get_valid_rss_size() and
ice_vsi_cfg_rss_lut_key(). Could that clamping move into this patch, so
this commit is correct on its own?

> +	err = ice_aq_set_rss_lut(hw, &params);

[ ... ]

> +/* ethtool core sizes RSS buffers by rss_table_size under rtnl, and the new
> + * LUT is filled based on NETIF_F_RXHASH, which is also changed under rtnl
> + */
> +static int ice_rss_lut_pf_occ_set(u64 size, enum ice_devl_resource_id res_id,
> +				  struct ice_pf *pf, int slot,
> +				  struct netlink_ext_ack *extack)
> +{
> +	int err;
> +
> +	rtnl_lock();
> +	scoped_guard(ice_adapter_devl, pf->adapter)
> +		err = ice_devl_res_change(size, res_id, pf, pf, slot, extack);
> +	rtnl_unlock();

[Severity: High]
Can this deadlock against the tc mqprio path?

ice_rss_lut_pf_occ_set() is reached from DEVLINK_CMD_RESOURCE_SET.
There, devlink_nl_pre_doit() already holds the PF devlink instance lock
before devlink_nl_resource_set_doit() calls occ_set. So this path takes
the PF devl lock, then rtnl.

ice_setup_tc_mqprio_qdisc() runs under rtnl from ndo_setup_tc. In
TC_MQPRIO_MODE_CHANNEL it calls ice_tear_down_devlink_rate_tree(),
which does:

    devlink = priv_to_devlink(pf);

    devl_lock(devlink);

That path takes rtnl, then the PF devl lock. ice_pf_dcb_cfg() does the
same from dcbnl.

CPU0                                  CPU1
tc qdisc add ... mqprio mode channel  devlink resource set ... lut_512
rtnl_lock()                           devlink_nl_pre_doit()
ice_setup_tc_mqprio_qdisc()             devl_lock(PF devlink)
  ice_tear_down_devlink_rate_tree()   devlink_nl_resource_set_doit()
    devl_lock(PF devlink)               ice_rss_lut_pf_occ_set()
                                          rtnl_lock()

The rtnl then devl lock order in ice_tear_down_devlink_rate_tree() was
there before this patch. The new resource set path adds the opposite
order, and both are still in place at the end of the series.

> +
> +	return err;
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
> index 90e01eb49ea21..48c3449a2434d 100644
> --- a/drivers/net/ethernet/intel/ice/ice_common.c
> +++ b/drivers/net/ethernet/intel/ice/ice_common.c

[ ... ]

> @@ -3217,6 +3218,7 @@ void ice_set_safe_mode_caps(struct ice_hw *hw)
>  	/* cache some dev_caps values that should be restored after memset */
>  	cached_caps = dev_caps->common_cap;
>  	num_funcs = dev_caps->num_funcs;
> +	nac_topo = dev_caps->nac_topo;
>  
>  	/* unset dev capabilities */
>  	memset(dev_caps, 0, sizeof(*dev_caps));
> @@ -3235,6 +3237,7 @@ void ice_set_safe_mode_caps(struct ice_hw *hw)
>  	ICE_RESTORE_DEV_CAP(nvm_update_pending_orom);
>  	ICE_RESTORE_DEV_CAP(nvm_update_pending_netlist);
>  	dev_caps->num_funcs = num_funcs;
> +	dev_caps->nac_topo = nac_topo;

[Severity: Low]
This changes what ice_is_dual() and ice_is_primary() return in safe mode
for every caller, not only the new devlink resource code.

Before this patch, every safe-mode PF on a dual-NAC E825 counted as
primary and non-dual. Existing users include the PHY lane computation in
ice_common.c:

    if (hw->mac_type == ICE_MAC_GENERIC_3K_E825 &&
        ice_is_dual(hw) && !ice_is_primary(hw))
            lane += ICE_PORTS_PER_QUAD;

Others are the sideband destination selection and the CPI PHY selection
in ice_cpi.c.

The commit message doesn't mention this. Only the v5 changelog below
the --- line does, and that text is dropped when the patch is applied.
Could this go into its own patch, or at least be described in the
commit message?

>  
>  	/* one Tx and one Rx queue per function in safe mode */
>  	dev_caps->common_cap.num_rxq = num_funcs;

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -9192,8 +9211,14 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
>  				   ret);
>  			return ret;
>  		}
> +		scoped_guard(ice_adapter_devl, pf->adapter) {
> +			if (ice_rss_lut_is_reassigned(pf)) {
> +				dev_err(dev, "RSS LUTs reassigned via devlink, can't configure ADQ\n");
> +				return -EOPNOTSUPP;
> +			}
> +			set_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
> +		}
>  		memcpy(&vsi->mqprio_qopt, mqprio_qopt, sizeof(*mqprio_qopt));
> -		set_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
>  		/* don't assume state of hw_tc_offload during driver load
>  		 * and set the flag for TC flower filter if hw_tc_offload
>  		 * already ON

[Severity: Medium]
Does this check come too late in ice_setup_tc_mqprio_qdisc()?

In the TC_MQPRIO_MODE_CHANNEL case, ice_tear_down_devlink_rate_tree()
has already run by the time ice_rss_lut_is_reassigned() is checked.
Say an admin tries to enable ADQ on a PF whose RSS LUTs were moved via
devlink. The command fails with -EOPNOTSUPP, but the PF's VF devlink
rate leaves and rate nodes have already been destroyed. A rejected
command should not have that side effect.

Could the reassigned check move ahead of the rate tree teardown?
ice_validate_mqprio_qopt() is ordered the same way and has the same
problem.

The flag has a second problem. ICE_FLAG_TC_MQPRIO is now set under the
adapter devlink lock, but nothing clears it if the rest of the ADQ
setup fails:

- the second ice_vsi_rebuild() failure returns directly;
- failures in ice_vsi_cfg_tc(), ice_set_bw_limit() or
  ice_create_q_channels() jump to the exit label, which only resets
  all_numtc and all_enatc.

This leak predates the patch, but the patch gives it a new effect.
ice_devl_res_change() tests the raw ICE_FLAG_TC_MQPRIO bit, not the
real ADQ state the way ice_is_adq_active() does. After a failed ADQ
setup, every devlink RSS LUT change is refused with "ADQ configured,
can't change RSS LUTs", even though no ADQ is in place.

Should those error paths clear the flag again, under the same adapter
devlink lock? Or should ice_devl_res_change() check whether ADQ is
actually configured?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117094913.100756-1-przemyslaw.kitszel%40intel.com
