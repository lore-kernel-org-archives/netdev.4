Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734004;
	b=EZdvv65gE0jTDi9BYeMFbjb4xPWnMbEaz4aVnpSWSiG6GgKZAyaLTK81Lm1zSiY3+vdX
	 P0VOgKbu7XEsbBhVv/saLHJh9OXNJ/y2V4/0xdacfSaBXcIZ0v21EvhtruAhFFsznlmmy
	 FoRWsH81HXpHJ7ibW+E9d/CBW8lkDTRI0AlQXXo4XNx/GEttDH88h6jpjioZk8522v+zJ
	 Ox+ppmVne/v3Lch+h/tOMesxT2HzWre3hK+pQbq2c2owrgeD7U77bt5GsUSseEFU6eukd
	 sZSnKRcNH/CcJNcLfyaVAaxOAAuPw7uhvZsMd0F2/ZPZOlmKMvuJhZ5041YzzWYZdoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734004;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xHDIm93NMQq0pQjl7NC/e4nwNCO8xnvieNOWg5koPF0=;
	b=eQitPvo9MEkjmC/QmN8TFzkdSYhMhwsyaDwNkVtqZYajXOrLgoWETl357sl/GW1CU2py
	 v3NtRpecQaRzWr3OtU5YSObqXTPOL09fLSZAQHuS+whi1w4OVpfTn+1+iOypuXY10XaC1
	 xpDYEo2XwHU+FqE0PsNh3210jqsj4xpWr/qj/YcEaKKfeKTxfoi7AJfD3Cn/o26FlixjU
	 5YAZTIHraXjY7OeckzFrboNDmd3MvwdkBmZ1A88agpplFAqYInNkkHBnSyXkL0Jvm/lus
	 KLpJxXjAMFVR0XSLMG56JV199+JLxVR7IhO1KZeZO0dkEw2yweEDlMHl0H0vgVZHejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+zEjEXw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC679606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+zEjEXw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCF21F00893;
	Thu, 26 Nov 2026 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795734004;
	bh=xHDIm93NMQq0pQjl7NC/e4nwNCO8xnvieNOWg5koPF0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y+zEjEXwehouGnbykVu/tlj8JG5avommYYnrIFFOoiBDWhC9K3VknTXNh/QwxCx+e
	 2XHhJN3ezNq0G+5/j7shpHeHgaiowGtKtrD62bVfg9A2OzPfi3/DhNdZ6gBrKkRJCZ
	 sQEgT4N+0ClZYFWeiUfhjFs4D424746ZMHieiAbayuSRsg1dJbXXJxEnlPCN9bcgxv
	 OLbhzBvURGcvrS66/uL2EmRb65p4/pG2F21hQ/zSsKv1kgzVi+E0M0bpzZ8q5UFzLb
	 2zMtzI190iJ8vkwZSPaTa8zpBCDNJKF/sdK4uHokr6SHQxYX/Q5poClT8hx3JnvPR4
	 HEeR3f+4TgWuQ==
Subject: Re: [PATCH net 1/5] ice: restore DDP state during PFR recovery
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
Date: Thu, 26 Nov 2026 23:00:02 +0000
Message-ID: <179573400258.3135.12405084770076028462@kernel.org>
In-Reply-To: <20261125224428.4126195-2-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-2-anthony.l.nguyen@intel.com>
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Every PF reset (PFR) now throws away the driver's record of
  offloaded UDP tunnel ports.
- [High] The fix for 'in-flight rebuild dereferences pf->adapter after
  ice_adapter_put()' covers only ice_remove(); the probe error-unwind…
- [Medium] The adapter-wide rebuild_lock covers the whole of
  ice_rebuild() for every reset type.
- [Medium] The new PFR step replays only ice_dvm_update_dflt_recipes()
  (ice_main.c:7703-7712).
- [Low] The new PFR branch of ice_rebuild() (ice_main.c:7691-7697) calls
  ice_log_pkg_init() after a failed ice_init_pkg() and then jumps to…
- [Low] ice_init_pkg_hints() (ice_ddp.c:2098-2145) resets hw->tnl before
  rescanning package labels but never resets hw->dvm_upd.
- [Low] rebuild_lock serializes only the two ice_rebuild() call sites.
- [Low] ice_remove() now calls ice_service_task_stop(pf)
  (ice_main.c:5389) before devl_lock(), ice_free_vfs() and the rest of…

--

ice: restore DDP state during PFR recovery

This commit adds an adapter-wide rebuild_lock that serializes
ice_rebuild() across PFs of the same adapter. On PFR it reloads the DDP
package from the cached copy and restores the default DVM recipes. It
also stops the service task early in ice_remove().

> diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
> index 47c6798c97e8f..f858473f6f532 100644
> --- a/drivers/net/ethernet/intel/ice/ice_main.c
> +++ b/drivers/net/ethernet/intel/ice/ice_main.c
> @@ -659,7 +659,9 @@ static void ice_do_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
>  	 */
>  	if (reset_type == ICE_RESET_PFR) {
>  		pf->pfr_count++;
> +		mutex_lock(&pf->adapter->rebuild_lock);
>  		ice_rebuild(pf, reset_type);
> +		mutex_unlock(&pf->adapter->rebuild_lock);

[Severity: Low]
Does this lock cover every path that touches the shared package and
recipe state? Probe still downloads the DDP package and updates the
default recipes without rebuild_lock:

ice_probe()
  ice_init_dev()
    ice_init_ddp_config()
      ice_load_pkg()
        ice_copy_and_init_pkg()
          ice_init_pkg()
            ice_download_pkg()
              ice_post_dwnld_pkg_actions()
                ice_set_vlan_mode()
                  ice_set_dvm()
                    ice_dvm_update_dflt_recipes()

A probe or rebind of one PF can still interleave its package and recipe
AQ sequences with another PF's PFR rebuild. That is the interleaving the
commit message describes. The new ice_dvm_update_dflt_recipes() call in
ice_rebuild() also runs outside the firmware global config lock.

The firmware global config lock already arbitrates the actual downloads.
A second PF normally gets ICE_DDP_PKG_ALREADY_LOADED and skips
ice_set_dvm(), so the remaining window is narrow.

>  		clear_bit(ICE_PREPARED_FOR_RESET, pf->state);
>  		clear_bit(ICE_PFR_REQ, pf->state);
>  		wake_up(&pf->reset_wait_queue);
> @@ -704,7 +706,9 @@ static void ice_reset_subtask(struct ice_pf *pf)
>  		} else {
>  			/* done with reset. start rebuild */
>  			pf->hw.reset_ongoing = false;
> +			mutex_lock(&pf->adapter->rebuild_lock);
>  			ice_rebuild(pf, reset_type);
> +			mutex_unlock(&pf->adapter->rebuild_lock);

[Severity: Medium]
Is it intended that this lock also covers CORER, GLOBR and EMPR
rebuilds? The kernel-doc in ice_adapter.h only mentions PFR:

 * @rebuild_lock: serialize PFR recovery across PFs of the same adapter

For EMPR, ice_rebuild() sleeps first, and now does so with the lock held:

	if (reset_type == ICE_RESET_EMPR) {
		...
		msleep(ICE_EMP_RESET_SLEEP_MS);
	}

All PFs get the global reset OICR, finish ice_check_reset() and then
queue on this mutex. Their 5 second sleeps and full rebuilds now run one
after another. With N PFs, the last one finishes after roughly
N * (5s + rebuild time).

Can this push fixed waits past their timeout? For example,
ice_devlink_reload_empr_finish() calls ice_wait_for_reset(pf, 60 * HZ).
It could then report "Device still resetting after 1 minute" while
recovery is still in progress.

>  			/* clear bit to resume normal operations, but
>  			 * ICE_NEEDS_RESTART bit is set in case rebuild failed
>  			 */
> @@ -5382,6 +5386,8 @@ static void ice_remove(struct pci_dev *pdev)
>  		return;
>  	}
>  
> +	ice_service_task_stop(pf);
> +

[Severity: High]
This covers ice_remove(), but can the same use-after-free still happen
on the ice_probe() error path?

Once ice_init() succeeds, ICE_SERVICE_DIS is cleared and serv_tmr is
armed. If ice_load() or ice_init_devlink() fails after that, the unwind
does:

unroll_init:
	devl_unlock(priv_to_devlink(pf));
	ice_deinit(pf);
unroll_dev_init:
	need_dev_deinit = true;
unroll_adapter:
	ice_adapter_put(pdev);
unroll_hw_init:
	ice_deinit_hw(hw);
	if (need_dev_deinit)
		ice_deinit_dev(pf);

ice_deinit() only sets ICE_SERVICE_DIS and ICE_DOWN. The service task is
not sync-cancelled until ice_deinit_dev(), which runs after
ice_adapter_put().

A service work item that is already running may be in
ice_reset_subtask() on the ICE_RESET_OICR_RECV path. There it polls
ice_check_reset() for several seconds. That path does not check
ICE_DOWN, and it then reaches the new:

	mutex_lock(&pf->adapter->rebuild_lock);

ice_rebuild() only checks ICE_DOWN after the lock is taken. If this PF
held the last adapter reference, the adapter has already been kfree()d
at that point.

Should the probe unwind also stop the service task before
ice_adapter_put()?

[Severity: Low]
Is it safe to stop the service task this early? Through
ice_clean_adminq_subtask(), it is the only thing that drains the ARQ and
completes ice_aq_wait_for_event() waiters.

A devlink flash update runs under the devlink instance lock and blocks
in ice_aq_wait_for_event(), for example in ice_write_one_nvm_block():

	err = ice_aq_wait_for_event(pf, &task, 15 * HZ);

If the device is unbound while a flash is in progress, ice_remove() now
sets ICE_SERVICE_DIS and then waits in devl_lock(). The flash no longer
gets its completions and fails with "Timed out waiting for firmware"
once the timeout expires, which also delays removal.

Before this patch the service task stayed alive until ice_deinit_dev().
Would stopping it just before ice_adapter_put() be enough for the
problem described in the commit message?

>  	if (test_bit(ICE_FLAG_SRIOV_ENA, pf->flags)) {
>  		set_bit(ICE_VF_RESETS_DISABLED, pf->state);
>  		ice_free_vfs(pf);
> @@ -7682,14 +7688,27 @@ static void ice_rebuild(struct ice_pf *pf, enum ice_reset_req reset_type)
>  		goto err_init_ctrlq;
>  	}
>  
> -	/* if DDP was previously loaded successfully */
> -	if (!ice_is_safe_mode(pf)) {
> -		/* reload the SW DB of filter tables */
> -		if (reset_type == ICE_RESET_PFR)
> -			ice_fill_blk_tbls(hw);
> -		else
> -			/* Reload DDP Package after CORER/GLOBR reset */
> -			ice_load_pkg(NULL, pf);
> +	if (!ice_is_safe_mode(pf) && reset_type == ICE_RESET_PFR) {
> +		enum ice_ddp_state state;
> +
> +		state = ice_init_pkg(hw, hw->pkg_copy, hw->pkg_size);

[Severity: High]
Before this patch, a PFR only called ice_fill_blk_tbls(). Now
ice_init_pkg() also calls ice_init_pkg_hints(), which does:

	memset(&hw->tnl, 0, sizeof(hw->tnl));

and then rebuilds the table through ice_add_tunnel_hint() with port = 0.
Does this throw away the driver's record of offloaded VXLAN/GENEVE ports
on every PFR?

Nothing in ice replays the tunnel ports afterwards, and there is no
udp_tunnel_nic_reset_ntf() call. The udp_tunnel_nic core therefore still
thinks the ports are offloaded. When firmware reports the package as
already loaded, the parser boost TCAM also keeps matching the old port.

First, ice_get_open_tunnel_port() returns false. ice_fill_adv_packet_tun()
then fails tunnel switch rules with -EIO, and the ntuple and FDIR tunnel
paths stop handling tunnels.

Second, when the vxlan/geneve device is removed later,
ice_udp_tunnel_unset_port()->ice_destroy_tunnel() hits:

	if (WARN_ON(!hw->tnl.tbl[index].valid ||
		    hw->tnl.tbl[index].type != type ||
		    hw->tnl.tbl[index].port != port)) {
		status = -EIO;
		goto ice_destroy_tunnel_end;
	}

It returns before the original boost entry is restored, so the parser
keeps classifying that UDP port as a tunnel.

Third, the memset runs without hw->tnl_lock and without rtnl, while
udp_tunnel_nic calls set_port/unset_port under rtnl. Can a concurrent
ice_create_tunnel() memcpy() from hw->tnl.tbl[index].boost_entry while
it is NULL?

CORER/GLOBR already reset this table. PFR is much more frequent,
though: tx timeout recovery, resume, PCI error resume.

[Severity: Low]
ice_init_pkg_hints() clears hw->tnl but not hw->dvm_upd.
ice_add_dvm_hint() appends at the current count:

	if (hw->dvm_upd.count < ICE_DVM_MAX_ENTRIES) {
		hw->dvm_upd.tbl[hw->dvm_upd.count].boost_addr = val;
		hw->dvm_upd.tbl[hw->dvm_upd.count].enable = enable;
		hw->dvm_upd.count++;
	}

Nothing ever resets dvm_upd.count. Does each PFR now append another
duplicate set of DVM/SVM boost hints until the 48-entry table is full?

ice_set_dvm_boost_entries() would then issue a package update for every
accumulated entry on each later real download, while holding the global
config lock. The final hardware state should not change. The cost is
redundant firmware updates and longer lock hold times.

> +		ice_log_pkg_init(hw, state);
> +		if (!ice_is_init_pkg_successful(state))
> +			goto err_init_ctrlq;

[Severity: Low]
For most failure states, ice_log_pkg_init() prints a message ending in
"Entering Safe Mode.", for example:

	dev_err(dev, "The DDP package file is invalid. Entering Safe Mode.\n");

This path does not clear ICE_FLAG_ADV_FEATURES the way ice_load_pkg()
does. It jumps to err_init_ctrlq and then logs "Rebuild failed, unload
and reload driver". The log ends up with two contradictory messages.

Should this either fall back to safe mode like the CORER/GLOBR path, or
avoid the safe mode wording here?

> +	} else if (!ice_is_safe_mode(pf)) {
> +		/* Reload DDP Package after CORER/GLOBR reset */
> +		ice_load_pkg(NULL, pf);
> +	}
> +
> +	/* PFR can lose DVM recipes after system suspend. */
> +	if (!ice_is_safe_mode(pf) && reset_type == ICE_RESET_PFR &&
> +	    ice_is_dvm_ena(hw)) {
> +		err = ice_dvm_update_dflt_recipes(hw);

[Severity: Medium]
Is replaying only the default recipes enough here? ice_set_dvm()
programs DVM in four steps:

	status = ice_aq_set_vlan_mode(hw, &params);
	...
	status = ice_dvm_update_dflt_recipes(hw);
	...
	status = ice_aq_set_port_params(hw->port_info, true, NULL);
	...
	status = ice_set_dvm_boost_entries(hw);

On the usual ICE_DDP_PKG_ALREADY_LOADED path,
ice_post_dwnld_pkg_actions() is skipped, so only the recipe update is
replayed. Port params are reprogrammed later in ice_rebuild(), but the
DVM/SVM parser boost TCAM entries are not.

The commit message says PFR clears package-derived firmware state. If
so, wouldn't the boost entries be lost as well, leaving the recipes
without matching parser state?

ice_update_recipe_lkup_idx() also does a get/modify/add read-modify-write
on default recipes that the whole adapter shares. Before this patch that
happened only at package download time. Now every PFR does it while
other PFs may have live rules on those recipes, and rebuild_lock only
serializes against other rebuilds.

Can firmware reject this update on an in-use recipe? If it does, the
whole PFR rebuild now fails.

> +		if (err) {
> +			dev_err(dev, "failed to restore default DVM recipes: %d\n",
> +				err);
> +			goto err_init_ctrlq;
> +		}
>  	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125224428.4126195-2-anthony.l.nguyen%40intel.com
