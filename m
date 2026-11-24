Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557466;
	b=v4+RTmty61nqx2ynxufI3Q029sA4gRErxJ/liwPzUftnYEASt4qAwjXilok3RhH5Eoe0
	 ItPeJ1//kuY/Hz9EPjres7L96FftZIE2mFLW3ne92mtcNwZnL4ECXjCYlUA6/y6ERi6zR
	 JeDMaf+Y9ivd4RSSsrnj8bonxuGeS1U/2bW82w8JU8sJ9+sGWhGuTttRWB8+L+VMG+uwH
	 hXbyHhcsV+vaRGsOiMeRsu+8kHh60a3NxSlszCTIDFdsb2xw1Rj+6tlzs1WXLGOs5PyJ8
	 KeZ8xmLh7yl8jAyApBxA6+aqAhllPK1TWIekbPix63lvbgITiKUxm+sRmWGwQcYNU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557466;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V6dAA6lJ6WA+HVJjcEB9R4HOhDXzG0VbqeaMd3kHZ7s=;
	b=4cl5QocMbEzF6VlU3+bvWABZ60bg6Osd1CIFd0YQoN8HXZKlEI1ka1iqMkgociBrRpSu
	 zIMzur4vSbsBMZSFvtz44Pjsc5aIQwNQUmo4jP0WnmB/v1pWBJQIhcwQSHLS3h037AOzh
	 8f8WPKET0S+Ck4S/yzOvoFyO179mC2U6VQ9KTw9iht+GpDpBzmo43myWDjI0ueXPJz5fx
	 yZglgIlO6wBYkXxhz6y1x3HUlMV3jrz7oyJwgDuZ/nA3GcSthTBdbmURwFYpyG3xcFnzK
	 4V9plJxnB5qdD27qN8dFOiNqEC7dnSIaqcNsNkgIue+SlGFRYZqfubZSrK6Z07bh9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ch70VMU5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A4606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ch70VMU5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235901F000CA;
	Tue, 24 Nov 2026 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557465;
	bh=V6dAA6lJ6WA+HVJjcEB9R4HOhDXzG0VbqeaMd3kHZ7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ch70VMU5wsS+tAirZE+r657nfxJ6cLWRPp2aghQzKape7PZ/cNUacDqo9wnNswRLM
	 l/9poZOx++YsYuohKdCKYwTknJkEJOnqmSfCi/2tl0v33UThSk6PSu0nAXIzsi8OEx
	 J5XeQtPjy+no2kVySs4te1hmzF0SU0CGtiCvCFp1UXtGq6TxQEJA3UlAzq4C3akoAT
	 tkT49lAvFSSpsIkF1sKi/mOk5xsO9UU6Z+Np4soEfvujt2poX8qBVL3jA9IDHisfMp
	 AH8tdMni00v4Gvusxg4BrzSvTeu8YO0PdmqesBknOjeKp44AFDifKjXhNfJqRhqD17
	 4umxZoe5KxuaA==
Subject:
 Re: [PATCH net-next v7 13/15] ice: represent RSS LUTs as devlink resources
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
Date: Tue, 24 Nov 2026 21:57:43 +0000
Message-ID: <179555746365.3135.16915597788151062216@kernel.org>
In-Reply-To: <20261121230123.316391-14-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-14-przemyslaw.kitszel@intel.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Possible ABBA deadlock between the per-PF devlink instance lock
  and rtnl.
- [Low] The per-PF runtime devlink resource "rss_lut" is registered once
  at probe (ice_devl_pf_resources_register() in ice_probe()) and…
- [Low] In ice_setup_tc_mqprio_qdisc()
  (drivers/net/ethernet/intel/ice/ice_main.c), the new rejection "RSS…
- [Low] Cleanup guideline violation (mixing goto and guards).
- [Low] The commit body does not mention a change to existing ADQ error
  handling.

--

ice: represent RSS LUTs as devlink resources

This patch exposes the E800 RSS LUTs as devlink resources. Each PF gets a
runtime rss_lut resource to switch between its 2048-entry PF LUT and a
512-entry global LUT, and the whole-device instance reports read-only
rss_lut_512 and rss_lut_2048 counters. The user indirection table is kept
across LUT changes and resets, and ADQ and LUT reassignment are made
mutually exclusive.

> diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.c b/drivers/net/ethernet/intel/ice/devlink/resource.c
> new file mode 100644
> index 0000000000000..c07f61acdaedc
> --- /dev/null
> +++ b/drivers/net/ethernet/intel/ice/devlink/resource.c
> @@ -0,0 +1,643 @@

[ ... ]

> +/* ethtool core sizes RSS buffers by rss_table_size under rtnl, and the new
> + * LUT is filled based on NETIF_F_RXHASH, which is also changed under rtnl
> + */
> +static int ice_rss_lut_pf_size_set(u64 size, struct netlink_ext_ack *extack,
> +				   void *priv)
> +{
> +	struct ice_pf *pf = priv;
> +	int err;
> +
> +	rtnl_lock();
> +	scoped_guard(ice_adapter_devl, pf->adapter)
> +		err = ice_rss_lut_set(pf, pf, size, extack);
> +	rtnl_unlock();

[Severity: High]
Can this deadlock against rtnl?

The devlink core calls the runtime size_set callback with the PF devlink
instance lock held. The devl_resource_runtime_register() kernel-doc says
"Both callbacks are called with the instance lock held". So the order
here is PF devl -> rtnl.

ice_tear_down_devlink_rate_tree() takes the same PF devlink lock:

drivers/net/ethernet/intel/ice/devlink/devlink.c:ice_tear_down_devlink_rate_tree() {
	devlink = priv_to_devlink(pf);

	devl_lock(devlink);
	mutex_lock(&pf->vfs.table_lock);
    ...
}

Its callers already hold rtnl, so the order there is rtnl -> PF devl:

- ice_setup_tc_mqprio_qdisc(), via ndo_setup_tc from tc_modify_qdisc
- ice_pf_dcb_cfg(), via dcbnl, and via the LLDP MIB change path after
  rtnl_lock()

For example:

CPU0: devlink resource set pci/X path rss_lut size 512
  devlink core holds PF devl
  ice_rss_lut_pf_size_set()
    rtnl_lock()              <- waits for CPU1

CPU1: tc qdisc add dev ethX root mqprio ... hw 1 mode channel
  rtnl held
  ice_setup_tc_mqprio_qdisc()
    ice_tear_down_devlink_rate_tree()   (before the new ADQ check)
      devl_lock(PF)          <- waits for CPU0

The rtnl -> devl order in ice_tear_down_devlink_rate_tree() is older.
ice_devlink_reinit_down() and ice_devlink_reinit_up() already take rtnl
under devl during reload. This patch adds a devl -> rtnl edge that any
runtime devlink resource set can reach.

Could rtnl be avoided here, or could the lock order in
ice_tear_down_devlink_rate_tree() be fixed?

> +
> +	return err;
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
> index 57425683c0d4f..a65dd342246cd 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_lib.c

[ ... ]

> @@ -2471,8 +2501,15 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
>  	vsi->vsw = pf->first_sw;
>  
>  	if (vsi->flags & ICE_VSI_FLAG_INIT) {
> -		scoped_guard(mutex, &pf->rss_lut_lock)
> +		scoped_guard(mutex, &pf->rss_lut_lock) {
> +			u16 lut_size = vsi->rss_table_size;
> +
>  			ice_vsi_set_dflt_rss_lut_type(vsi);
> +			if (vsi->rss_table_size != lut_size) {
> +				devm_kfree(dev, vsi->rss_lut_user);
> +				vsi->rss_lut_user = NULL;
> +			}
> +		}
>  	}

[ ... ]

> @@ -2615,6 +2660,9 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
>  	ice_vsi_free_q_vectors(vsi);
>  unroll_vsi_init:
>  	ice_vsi_delete_from_hw(vsi);
> +unroll_pf_rss_lut:
> +	if ((vsi->flags & ICE_VSI_FLAG_INIT) && vsi->type == ICE_VSI_PF)
> +		ice_release_rss_lut_pf(pf);
>  unroll_get_qs:
>  	ice_vsi_put_qs(vsi);
>  unroll_vsi_alloc_stat:

[Severity: Low]
This isn't a bug, but this adds a new goto unwind label to
ice_vsi_cfg_def(). That function also uses
scoped_guard(mutex, &pf->rss_lut_lock), and this patch makes that guarded
block larger.

ice_setup_tc_mqprio_qdisc() has the same mix. It gains
scoped_guard(ice_adapter_devl, pf->adapter) below, and it already uses
goto config_tcf and goto exit.

include/linux/cleanup.h says goto-based cleanup and guard helpers should
not be mixed in one function. Could each of these functions use only one
of the two styles?

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 3e8cf1c5f0e81..5f0de7cf0a8e5 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c

[ ... ]

> @@ -3873,6 +3876,8 @@ void ice_deinit_pf(struct ice_pf *pf)
>  {
>  	/* note that we unroll also on ice_init_pf() failure here */
>  
> +	/* ice_vsi_decfg() skips it if the last VSI rebuild was NO_INIT */
> +	ice_free_rss_lut_flr(pf);
>  	mutex_destroy(&pf->rss_lut_lock);

[Severity: Low]
Can the rss_lut size_set callback still run after this?

ice_probe() registers the per-PF rss_lut resource once, through
ice_devl_pf_resources_register(). ice_deinit_devlink() unregisters it,
but only on remove.

Devlink reload goes through ice_devlink_reinit_down() -> ice_deinit_pf().
That destroys pf->rss_lut_lock and drops the PF LUT ownership here. If
ice_devlink_reinit_up() then fails, its error path ends in
ice_deinit_pf() again:

err_load:
	rtnl_lock();
	ice_vsi_decfg(vsi);
	rtnl_unlock();
unroll_pf_init:
	ice_deinit_pf(pf);

The resource stays registered with priv == pf. Take a later
"devlink resource set ... path rss_lut size 2048":

ice_rss_lut_pf_size_set()
  ice_rss_lut_set()
    ice_change_rss_lut()

ICE_FLAG_RSS_ENA is still set. ice_rss_lut_type() returns ICE_LUT_VSI
because the owner slot was cleared, so the request counts as a change.

ice_change_rss_lut() then calls mutex_lock(&pf->rss_lut_lock) on the
destroyed mutex, and ice_aq_set_rss_lut() sends a command to a control
queue that has been shut down. With size 512, ice_alloc_rss_global_lut()
sends an AQ command to the dead queue in the same way.

Should the rss_lut resource follow the reload down/up lifetime, or should
the callbacks check that the PF is loaded?

[ ... ]

> @@ -9194,8 +9211,14 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
>  				   ret);
>  			return ret;
>  		}
> +		scoped_guard(ice_adapter_devl, pf->adapter) {
> +			if (ice_rss_lut_is_reassigned(pf)) {
> +				dev_err(dev, "RSS LUTs reassigned via devlink, can't configure ADQ\n");
> +				return -EOPNOTSUPP;
> +			}

[Severity: Low]
Is this rejection meant to run after the devlink-rate tree has already
been torn down? Earlier in the same case:

		if (pf->hw.port_info->is_custom_tx_enabled) {
			dev_err(dev, "Custom Tx scheduler feature enabled, can't configure ADQ\n");
			return -EBUSY;
		}
		ice_tear_down_devlink_rate_tree(pf);

		ret = ice_validate_mqprio_qopt(vsi, mqprio_qopt);

Suppose the PF was moved to a global LUT with devlink resource set, and
"tc qdisc add ... mqprio hw 1 mode channel" is tried next. The request
fails with -EOPNOTSUPP. By then devl_rate_leaf_destroy() and
devl_rate_nodes_destroy() have already removed the VF rate leaves and
rate nodes. ice_devlink_rate_init_tx_topology() only exports them again
when the representors are recreated.

What gets lost is the default exported topology. Any rate change sets
is_custom_tx_enabled, and that case returns -EBUSY before the teardown.
A failed ice_validate_mqprio_qopt() already has the same side effect, but
this adds a new rejection reason after the teardown.

The new check depends only on the RSS LUT state. Could it go next to the
is_custom_tx_enabled check, before ice_tear_down_devlink_rate_tree()?

> +			set_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
> +		}
>  		memcpy(&vsi->mqprio_qopt, mqprio_qopt, sizeof(*mqprio_qopt));
> -		set_bit(ICE_FLAG_TC_MQPRIO, pf->flags);

[ ... ]

> @@ -9263,6 +9286,7 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
>  		clear_bit(ICE_RESET_FAILED, pf->state);
>  		if (ice_vsi_rebuild(vsi, ICE_VSI_FLAG_NO_INIT)) {
>  			dev_err(dev, "Rebuild of main VSI failed again\n");
> +			clear_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
>  			return ret;
>  		}
>  	}

[ ... ]

> @@ -9315,6 +9339,7 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
>  	if (ret) {
>  		vsi->all_numtc = 0;
>  		vsi->all_enatc = 0;
> +		clear_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
>  	}

[Severity: Low]
This isn't a bug, but these two clear_bit(ICE_FLAG_TC_MQPRIO, ...) calls
change the existing ADQ error handling.

Before this patch, a failed channel-mode setup left ICE_FLAG_TC_MQPRIO
set. That covers the second VSI rebuild failure, and ice_vsi_cfg_tc(),
ice_set_bw_limit() or ice_create_q_channels() failing.
ice_prepare_for_reset() and other code check that flag.

The commit message only says:

    RSS LUTs can't be changed while ADQ is configured, or with RSS disabled,
    e.g. in safe mode. ADQ can't be configured while the RSS LUTs of the PF
    are reassigned.

The reason only appears in the v7 changelog below the --- line ("clear
ICE_FLAG_TC_MQPRIO when the ADQ setup fails, it blocked RSS LUT changes
until mqprio was reconfigured"), which won't be kept in git history.

Could the commit message describe this change?

>  	/* resume VSI */
>  	ice_ena_vsi(vsi, true);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121230123.316391-1-przemyslaw.kitszel%40intel.com
