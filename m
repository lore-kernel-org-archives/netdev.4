Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734006;
	b=13um0fBm6B2sZB2Htfs3deMSnmlgDbyz3w3iAlkuvVmcO8eT9po0arNFg+SVUpxttfti
	 1Jt9XfTmvvdjpYQ9nhqrjPH3eIKBEIJW0aiE5nlAUCpJ9LQ4r7teXrdMWDI/5erbXpg3i
	 v1dfjCBSgCFiSU+xkf3qc6ggUwG15JMOOcE5fOheNqheR+ld/pUbIwW9r5wuCYn6hMM+8
	 L1as/XXuTmEWwk3cYn8ZiFS7Ix+SSvoXerkWd9dYtX6nq23s4nQpwbterI0M/Gu/msnmG
	 pp8cJCOmI5uMiNDuKMbBvuF9PIqlTKsApksIKrIJ9grTmt895elOX5Nzea2HvDBCAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734006;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=92vgyNPrH++jcWuR0VMUywQ7eHqaJpZ7EPqphaUh+zc=;
	b=QbNYAOOdQgJMYURVTCm0zIAYQ22u917EWP1KN8MgN1S+U07GQuA5cuLxMz6JegC8QLKW
	 sLyD92gJaPUCTtNtRINqV4Xg63m9kbJcMQTmGcfRPlcxYHt3ImeGIc1ABqXV0DiVeHn0e
	 +lu89MYS6h8CNNF2pKj1+NJHlMCAUmB01U/KZy4xqsCHv94OrhYBNw7UR58GzGgUN0Ep5
	 jaXlk+fZpo6wZm5JekFkzR3glomWOMczEyQOz5PJwuOTejz1PIzgLuBP/Drxx9RedxMBz
	 HFvXGC4fxQAqJ2/k7qe+COSx4fuPHip3zP6PzVHsd7IxURSW4RgS42P37kXU9yoP6NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG6QqPnb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EEE606A329
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oG6QqPnb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B0C1F000C1;
	Thu, 26 Nov 2026 23:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795734005;
	bh=92vgyNPrH++jcWuR0VMUywQ7eHqaJpZ7EPqphaUh+zc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oG6QqPnbkjcadYUvQLB+oyLqNX5DtPhOOV05mN8rE0mMxl9PhIdiYMUyKNHEBt/x2
	 H6D8b8Hi4MttNEKI0a4OUomcqHueMqjqOsMbLXRBZm0jqIa57oApudS0RIwigQh/QV
	 jMN9tfj6zcZ3AwZuAenOnmJVBMSTq+qjT5H16/fDpNuba02n/4J6bTbEt3V7JHloaC
	 C8ehX2rcAiQtFNgJGuO074EP5SgJOeCscS4lzke9h5ktCqTrY5yjG6qN0wmGzs7Pml
	 +HUQ5ih44+7cb+9yx0Wzu70N580CTLbXkcLq5fC+NCJttMbwQb+MHH1dGy8Y5B4QVB
	 ydFKbhzs7zQdg==
Subject:
 Re: [PATCH net 2/5] ice: clear Flow Director entries before reset cleanup
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, willemb@google.com,
 netdev@vger.kernel.org, grzegorz.nitka@intel.com,
 przemyslaw.kitszel@intel.com, aaron.ma@canonical.com,
 maciej.machnikowski@intel.com, jacob.e.keller@intel.com,
 richardcochran@gmail.com, sergey.temerkhanov@intel.com,
 milena.olech@intel.com, horms@kernel.org, aleksandr.loktionov@intel.com,
 ayush1x.singh@intel.com
Date: Thu, 26 Nov 2026 23:00:04 +0000
Message-ID: <179573400458.3135.13972640700220102761@kernel.org>
In-Reply-To: <20261125224428.4126195-3-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-3-anthony.l.nguyen@intel.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: it clears the PF's Flow Director handles
  but leaves the VF Flow Director handles stale.
- [Medium] Holding hw->fdir_fltr_lock in ice_fdir_clear_flow_handles()
  does not stop concurrent writers of entry_h.
- [Low] ice_prepare_for_reset() now calls mutex_lock(&hw->fdir_fltr_lock)
  on every reset whenever hw->fdir_prof is non-NULL.

Pre-existing issues:
- [High] ice_fdir_replay_flows() ignores the return value of
  ice_flow_add_prof() and then always uses hw_prof->id.

--

ice: clear Flow Director entries before reset cleanup

This patch adds ice_fdir_clear_flow_handles(). The new helper zeroes the
PF Flow Director entry_h[][] handles under hw->fdir_fltr_lock.
ice_prepare_for_reset() calls it before ice_clear_hw_tbls() frees the
flow entries, so that a failed rebuild followed by driver removal does not
follow stale handles into ice_flow_rem_entry().

> diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c b/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c
> index 8805f0efe9773..3b77a3cf6c645 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c
> @@ -415,6 +415,32 @@ void ice_fdir_release_flows(struct ice_hw *hw)
>  		ice_fdir_erase_flow_from_hw(hw, ICE_BLK_FD, flow);
>  }
>  
> +/**
> + * ice_fdir_clear_flow_handles - clear handles freed during reset
> + * @hw: pointer to HW instance
> + */
> +void ice_fdir_clear_flow_handles(struct ice_hw *hw)
> +{
> +	int flow;
> +
> +	if (!hw->fdir_prof)
> +		return;
> +
> +	mutex_lock(&hw->fdir_fltr_lock);
> +	for (flow = 0; flow < ICE_FLTR_PTYPE_MAX; flow++) {
> +		struct ice_fd_hw_prof *prof = hw->fdir_prof[flow];
> +		int tun, i;
> +
> +		if (!prof)
> +			continue;
> +
> +		for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++)
> +			for (i = 0; i < prof->cnt; i++)
> +				prof->entry_h[i][tun] = 0;
> +	}

[Severity: High]
Should this also clear the VF Flow Director handles?

This loop only walks hw->fdir_prof[]. The VF profiles in
vf->fdir.fdir_prof[flow] are also struct ice_fd_hw_prof. Their entry_h[][]
values are handles to ICE_BLK_FD entries that
ice_vc_fdir_write_flow_prof() creates on hw->fl_profs[ICE_BLK_FD].

ice_clear_hw_tbls()->ice_free_flow_profs(hw, ICE_BLK_FD) frees every entry
on that list, VF entries included. Nothing resets the VF entry_h[][] or
prof_entry_cnt[][], and VF FDIR profiles are not replayed.

After the rebuild, ice_reset_all_vfs() calls
ice_vf_fdir_exit()->ice_vc_fdir_rem_prof_all()->ice_vc_fdir_rem_prof().
That function still sees the stale handles:

drivers/net/ethernet/intel/ice/virt/fdir.c:ice_vc_fdir_rem_prof() {
    ...
	for (i = 0; i < fdir->prof_entry_cnt[flow][tun]; i++)
		if (vf_prof->entry_h[i][tun]) {
			...
			ice_flow_rem_entry(hw, ICE_BLK_FD,
					   vf_prof->entry_h[i][tun]);
    ...
}

ice_flow_rem_entry() then reads entry->prof from the freed entry and runs
mutex_lock() and list_del() on it. Isn't this the same use-after-free that
the KASAN trace in the commit message shows?

If ice_check_reset() fails and ice_reset_all_vfs() is skipped, the stale
VF handles are followed later from
ice_free_vfs()->ice_free_vf_res()->ice_vf_fdir_exit(). That is the
rebuild-fails-then-remove case this patch is meant to fix.

The VF code predates this patch. Could the fix also invalidate the
vf->fdir.fdir_prof[] handles (or prof_entry_cnt) for each VF?

> +	mutex_unlock(&hw->fdir_fltr_lock);
> +}

[Severity: Medium]
Does holding hw->fdir_fltr_lock here serialize against the code that
writes entry_h[][]?

The main writer is ice_fdir_set_hw_fltr_rule(), reached through
ice_add_ntuple_ethtool()->ice_cfg_fdir_xtrct_seq(). That path runs after
a lockless reset check and before fdir_fltr_lock is taken:

drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c:ice_add_ntuple_ethtool() {
    ...
	if (ice_is_reset_in_progress(pf->state)) {
    ...
	ret = ice_cfg_fdir_xtrct_seq(pf, fsp, &userdata);
    ...
	mutex_lock(&hw->fdir_fltr_lock);
    ...
}

The stores themselves are not under the lock:

ice_fdir_set_hw_fltr_rule() {
    ...
	hw_prof->entry_h[0][tun] = entry1_h;
	hw_prof->entry_h[1][tun] = entry2_h;
    ...
}

The lock is also dropped here, before ice_prepare_for_reset() calls
ice_clear_hw_tbls() to free the entries. ice_reset_subtask() holds neither
rtnl nor any lock that the ethtool path shares.

Suppose an ethtool -N add gets a handle from ice_flow_add_entry() before
ice_free_flow_profs() runs, but stores it into entry_h[][] after this
function unlocks. If the rebuild then fails before ice_fdir_replay_flows(),
ice_deinit_fdir()->ice_fdir_rem_flow()->ice_fdir_erase_flow_from_hw()->
ice_flow_rem_entry() would follow that stale handle.

The race between ethtool and reset predates this patch. The commit message
reads as if the lock makes the clear safe, though:

  Clear the Flow Director handles while holding hw->fdir_fltr_lock before
  the hardware tables free their entries.

> +
>  /**
>   * ice_fdir_replay_flows - replay HW Flow Director filter info
>   * @hw: pointer to HW instance

[Severity: High]
This isn't a bug introduced by this patch, but the commit relies on
replay to install new handles. Is ice_fdir_replay_flows() safe when
ice_flow_add_prof() fails?

ice_fdir_replay_flows() {
    ...
			struct ice_flow_prof *hw_prof;
    ...
			ice_flow_add_prof(hw, ICE_BLK_FD, ICE_FLOW_RX,
					  prof->fdir_seg[tun], TNL_SEG_CNT(tun),
					  false, &hw_prof);
			for (j = 0; j < prof->cnt; j++) {
    ...
				err = ice_flow_add_entry(hw, ICE_BLK_FD,
							 hw_prof->id,
    ...
				prof->prof_id[tun] = hw_prof->id;
    ...
}

The return value is ignored, and hw_prof has no initializer.
ice_flow_add_prof() only sets *prof on success.

ice_cfg_fdir_xtrct_seq() treats a failed tunnel rule as a soft failure. It
frees tun_seg while the non-tunnel rule stays installed, which leaves
prof->cnt != 0 with prof->fdir_seg[ICE_FD_HW_SEG_TUN] == NULL. On the next
reset, replay calls ice_flow_add_prof() with segs == NULL, gets -EINVAL,
and then uses hw_prof->id anyway.

Can this oops in the rebuild path? With CONFIG_INIT_STACK_ALL_ZERO it would
be a NULL dereference. Otherwise it could reuse a stale pointer from the
previous tun iteration and record the wrong prof_id and entry_h values,
leading to later double frees.

-ENOSPC, -ENOMEM and AQ failures from ice_flow_add_prof() would reach the
same code.

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index f858473f6f532..706172e149b94 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -601,6 +601,8 @@ ice_prepare_for_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
>  		netif_device_detach(vsi->netdev);
>  skip:
>  
> +	if (hw->fdir_prof)
> +		ice_fdir_clear_flow_handles(hw);

[Severity: Low]
With this change, ice_prepare_for_reset() takes hw->fdir_fltr_lock on
every reset once hw->fdir_prof is allocated. Can it end up locking a mutex
that has already been destroyed?

hw->fdir_prof is devm allocated, and ice_deinit_fdir() never clears it.
ice_deinit_fdir() does destroy the lock, though:

	mutex_destroy(&(&pf->hw)->fdir_fltr_lock);

During devlink reload, ice_devlink_reinit_down() calls ice_unload(), which
reaches ice_deinit_fdir() through ice_deinit_features(). Only after that
does ice_deinit_dev() stop the service task:

ice_devlink_reinit_down() {
	ice_unload(pf);
	...
	ice_deinit_dev(pf);
}

If a CORER, GLOBR or EMPR is handled in that window, the path is
ice_reset_subtask()->ice_prepare_for_reset()->ice_fdir_clear_flow_handles(),
which calls mutex_lock() on the destroyed lock. With CONFIG_DEBUG_MUTEXES
that triggers DEBUG_LOCKS_WARN_ON().

The same can happen if, on a later load, ice_init_fdir() fails before its
mutex_init() while hw->fdir_prof is still set.

Before this patch, the reset path only took this lock through
ice_remove_q_channels(), for non-PFR resets with TC_MQPRIO.

>  	/* clear SW filtering DB */
>  	ice_clear_hw_tbls(hw);
>  	/* disable the VSIs and their queues that are not already DOWN */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125224428.4126195-2-anthony.l.nguyen%40intel.com
