Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959676;
	b=K1S40L/XfVdu0ovhyCRnxd5HJHhM+5Q5QqtswjmlgaNrj2CKr4XEHo3U84KntcJZXfVK
	 0SkHZuQ+IGe1i9YqFmJ/BiZhnvF0z8FZIu9UolR/pVbWoZAz36hj3YnL9+2/uqO05SoL+
	 vvxNd+JiqbAu8z+o0JtMRm/SuhoHbCsvcHT1yfkY3WqBizLQx0MVxL65BZJl7JFgL5wTh
	 E/18giijNSoey+jPU+LNVr2TtCaAqL2UhwaWZVr7XhSZIFkSX94XcuNd5dGqsS2+58Pkl
	 175T0a18f3cR5G29Drkzlfb8dTymGP9ZEuOJMITVxmuqHWHNIO4OWV8uOC/3d9iJBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959676;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pP2Sf6/RgKiFX/tZtgXs/3GSaj0GvFn07e0+OAhDV9o=;
	b=IOaynTLfdWuhR9X5D+4hRh4VsoIlQj9F5Wb4mNDFvnsID1ZQGLKJaJ3tnG58IxQPGHLy
	 OS6SSXi8W68EHb/YgckPri/T9GNBl35V4ALSEx1pOxRdkWg5HW/KIZF4+8CpOQeuvzKzU
	 uqCwvA/w7+K7ALx+ptOkxugxRhy/RQ3kWXEA+4t10DvrEQ02dnUZpNIZPmX9HTa0q+vdW
	 FzpnRRR576VeSnlGm1V76B15xqVpLyPlc6+THXd3yeTgnAiS3wurcO6cmJlxMDE1ArrtN
	 QBHd+Gy9kWwzwrYbAwVV5h/8VHxakJ2NyZuvVGoadrUWYIF/qEolkpkqTM2ykIFqXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSIX3f8f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3F3606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSIX3f8f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134AB1F000C9;
	Tue, 17 Nov 2026 23:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959676;
	bh=pP2Sf6/RgKiFX/tZtgXs/3GSaj0GvFn07e0+OAhDV9o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QSIX3f8fDRl0PvqiKjnNLHdg+dJSE5A7aZc8PJhSU/Y0UdM0wgrOaieGoYexiCXmq
	 gLFcyUjA2NahW+LOEd51j3BVcPgrsGbGLz2kpEU1S63xN+6F7goEk7XAiQUwZzALvs
	 aYuLLeH0BFSY1ml1Q8lxRPXQ8HhgeKOOLc6oUFeOLxK7H7lawrp9czIiVnoTUnNV2T
	 p0dU/njyT2SynvUZQIvvHX0J+T5S1Yh14hZ05oImp6aWgW4ui/qzKXrw+JNIPX+l9E
	 9zbX9Kc93u9muW7rkN8ad0B0CO0s6H6O5ytqd9XoblaqaNRHDZVW9SbARm9b93loJS
	 yPrpzY4uZ/+gw==
Subject: Re: [PATCH net 4/6] ice: Fix incorrect LLDP filter assumptions
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, poros@redhat.com,
 david.m.ertman@intel.com, pengpeng@iscas.ac.cn, przemyslaw.kitszel@intel.com,
 vinicius.gomes@intel.com, sridhar.samudrala@intel.com,
 aleksandr.loktionov@intel.com, horms@kernel.org, alexander.nowlin@intel.com
Date: Tue, 17 Nov 2026 23:54:34 +0000
Message-ID: <179495967458.3136.6619318461381806067@kernel.org>
In-Reply-To: <20261113231225.1864810-5-anthony.l.nguyen@intel.com>
References: <20261113231225.1864810-5-anthony.l.nguyen@intel.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ice_vsi_cfg_sw_lldp()
  (drivers/net/ethernet/intel/ice/ice_lib.c:2182) now sends the Rx LLDP…
- [Low] The commit message for ice_vsi_cfg_sw_lldp() (ice_lib.c) never
  names a user-visible symptom or failing configuration for a…
- [Low] The patch removes ICE_FLAG_LLDP_AQ_FLTR (ice.h), the only record
  of which mechanism installed the Rx LLDP rule.

--

ice: Fix incorrect LLDP filter assumptions

This patch changes ice_vsi_cfg_sw_lldp() to always try the
LLDP_FILTER_CONTROL AQ command first for the Rx LLDP rule. It falls back
to the ethertype rule only when the AQ command returns -EOPNOTSUPP. The
ICE_FLAG_LLDP_AQ_FLTR PF flag is removed.

> This is an incorrect assumption, they are both meant to add a filter to
> handle LLDP packets and only varied in the actual AQ call made.

[Severity: Low]

Is this description accurate? ice_fltr_add_eth() adds an ethertype rule
that is tracked in hw->switch_info. That rule is replayed after a reset
and removed by ice_fltr_remove_all(). The filter added by
ice_lldp_fltr_add_remove() is not tracked by the driver (see the VF reset
question below).

The commit message also does not give a user-visible symptom for a
Fixes: tagged fix. The old flow already fell back to the AQ command when
adding the ethertype rule failed. That seems to cover the case of an NVM
with an existing LLDP filter, which is the case described here.

The defect that is visible in the baseline is not mentioned.
ICE_FLAG_LLDP_AQ_FLTR was a sticky PF-wide flag. A fallback on one VSI
could switch the remove path of every other VSI to AQ and leak their
ethertype rules. Should the commit message describe this?

Two behaviour changes are also left out:

- AQ failures other than -EOPNOTSUPP (for example -EIO from
  ice_sq_send_cmd()) no longer retry with the ethertype rule.
- The dev_info() fallback message is removed. Commit eef33aa44935 ("ice:
  fix adding AQ LLDP filter for VF") kept that message on purpose because
  it "proved to be useful".

Using the AQ path for VF VSIs is only correct because eef33aa44935
removed the vsi->type != ICE_VSI_PF check from
ice_lldp_fltr_add_remove(). Would it help to mention that dependency?

> diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
> index 432da05c48c08..dded9f7c173e9 100644
> --- a/drivers/net/ethernet/intel/ice/ice.h
> +++ b/drivers/net/ethernet/intel/ice/ice.h
> @@ -525,7 +525,6 @@ enum ice_pf_flags {
>  	ICE_FLAG_MTU_CHANGED,
>  	ICE_FLAG_GNSS,			/* GNSS successfully initialized */
>  	ICE_FLAG_DPLL,			/* SyncE/PTP dplls initialized */
> -	ICE_FLAG_LLDP_AQ_FLTR,

[Severity: Low]

Without this flag, the add and remove paths in ice_vsi_cfg_sw_lldp() each
choose AQ or ethertype from the current ice_fw_supports_lldp_fltr_ctrl()
result. They no longer depend on how the rule was actually installed. Can
the two paths disagree after a FW update?

ice_rebuild() calls ice_init_all_ctrlq() again, which re-reads the FW API
version. ice_vsi_rebuild_by_type() then replays tracked filters through
ice_replay_vsi().

Consider FW moving from below API 1.7.1 to 1.7.1 or later (devlink flash
plus EMPR). The ethertype ETH_P_LLDP FWD_TO_VSI rule added before the
update is replayed into HW. A later remove sends an AQ DELETE instead.
That remove can come from ice_cfg_sw_rx_lldp(pf, false) when
fw-lldp-agent is re-enabled through ethtool, or from ice_vsi_release():

ice_vsi_cfg_sw_lldp(vsi, false, false)
    ice_lldp_fltr_add_remove(&pf->hw, vsi, false)   /* AQ DELETE */

Would that leave the replayed ethertype rule in HW, so LLDP keeps being
forwarded to the PF VSI? The opposite direction (a downgrade) probably
only gives a failed ethertype remove and a dev_warn(), because EMPR
clears FW state.

>  	ICE_PF_FLAGS_NBITS		/* must be last */
>  };
>  
> diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
> index 977cd8dd6e31b..2836f7d8a4753 100644
> --- a/drivers/net/ethernet/intel/ice/ice_lib.c
> +++ b/drivers/net/ethernet/intel/ice/ice_lib.c
> @@ -2179,24 +2179,16 @@ void ice_vsi_cfg_sw_lldp(struct ice_vsi *vsi, bool tx, bool create)
>  		status = eth_fltr(vsi, ETH_P_LLDP, ICE_FLTR_TX,
>  				  ICE_DROP_PACKET);
>  	} else {
> -		if (!test_bit(ICE_FLAG_LLDP_AQ_FLTR, pf->flags)) {
> +		status = ice_lldp_fltr_add_remove(&pf->hw, vsi, create);
> +		if (status == -EOPNOTSUPP) {

[Severity: Medium]

With this change, PF and VF VSIs get the Rx LLDP rule from the AQ filter
whenever FW supports LLDP_FILTER_CONTROL, not from the tracked ethertype
rule. Since the driver does not track the AQ filter, is it still removed
when a VF is reset?

Consider a trusted VF with the FW LLDP agent disabled. The VF adds the
LLDP multicast MAC:

ice_vc_add_mac_addr()
    ice_vf_update_mac_lldp_num()
        ice_vsi_cfg_sw_lldp(vsi, false, true)
            ice_lldp_fltr_add_remove(..., true)   /* AQ ADD for vsi_num */

Then the VF is reset through VIRTCHNL_OP_RESET_VF, VFLR or a host config
change:

ice_reset_vf()
    ice_vf_pre_vsi_rebuild()
        ice_vf_clear_counters()
            vf->num_mac_lldp = 0;
    ice_vf_reconfig_vsi()
        vsi->flags = ICE_VSI_FLAG_NO_INIT;
        ice_vsi_decfg(vsi);
        ice_fltr_remove_all(vsi);

ICE_VSI_FLAG_NO_INIT keeps the HW VSI and its vsi_num.
ice_fltr_remove_all() only removes tracked MAC, VLAN, promisc, default and
ethertype rules. Nothing on this path sends
ICE_AQC_LLDP_FILTER_ACTION_DELETE.

The driver code shows that no DELETE is sent. That FW keeps forwarding
LLDP to the VSI is an inference: switch rules survive a VF reset, which
is why ice_vf_reconfig_vsi() calls ice_fltr_remove_all() at all.

After the reset, ice_set_vf_trust() removes the rule only if the counter
is non-zero:

	if (!trusted &&
	    (vf->num_mac_lldp > 0 ||
	     test_bit(ICE_VF_STATE_UC_PROMISC, vf->vf_states) ||
	     test_bit(ICE_VF_STATE_MC_PROMISC, vf->vf_states))) {

Could a VF whose trust was revoked keep receiving port LLDP frames this
way? ice_vc_can_add_mac() is meant to block exactly that for untrusted
VFs.

ice_vsi_release() also skips the Rx LLDP delete for a VF VSI when
ice_vf_is_lldp_ena() returns false. Can the FW filter then outlive the
VSI and still refer to a released VSI number?

If the VF adds the LLDP MAC again after the reset, a second AQ ADD would
go out for a VSI that is already in the filter.

In the baseline the ethertype rule was the default path. It is tracked,
so ice_fltr_remove_all() removed it during the reset and HW matched the
zeroed counter.

> +			/* If fltr_ctrl not supported, use legacy
> +			 * add/remove command
> +			 */
>  			status = eth_fltr(vsi, ETH_P_LLDP, ICE_FLTR_RX,
>  					  ICE_FWD_TO_VSI);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113231225.1864810-1-anthony.l.nguyen%40intel.com
