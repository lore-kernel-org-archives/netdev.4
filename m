Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795734008;
	b=XCFQOXtTHmX//40IE8wvUsYpkxqeGya+h7MJEA5TNOiTNCxcZN/D6UERXWkP78e1iJ5g
	 /RVombFwkR98GN3kzjh/fM1PJvr4VwgxKHKTrveOJghODY/HE1jejT+lswABeykGSAcj3
	 NdZEIgHb/5LTl9eR2Y+4wvYYBWUmwa3jKtHOd5FZaPZaq6hHrPCLUys2xmahRjbEAOPUM
	 qvhNpmPJj7bLt7rtKki59PSPI/4fwmcjcGaEuCGNEQmdD4a6L6u95/uDI65J5KFT3d/qd
	 NgykdlITSF3sRfCWvMXzpXMucNRKRtVrVTMjDLBvoxzk5Gz5rXgOeTvOFOScg7Vcqlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795734008;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ET6CA/3hcvG1l/nBa4rZu+CNkHEqOV0iUcKI77Rplwc=;
	b=M3edoWNRBR+CQJ3P03p8z3fv1a/NuhbTFWD/pS6PB9cuOzlWOTr+OCNZ4gHfpe2TD1rs
	 VAUruXsJY8z1Y2bGg3TO327rzFHelbzGja582BlS4EpSqmvigbPfy+cf+o7TP81xodagq
	 EUqHYYvW2GFeTN7tU5aZskkU01IEVYw3lQNf86qsxf3Xs1Ap7jvNqvgaR0Z6tWHsRV4h4
	 qIiGzJTz5WceOrlykNGB7BBAneUhtNuEJXntv127e+6KMMRtmTQsjmyR68CnuIj3szX5g
	 7LpZZYPAq4cq9mwyg8snu5z6mYmWfvgKlNVJEBFfygtmpBKHDseRSe3LNjGht7SbOKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8GVZN7H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3F9606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8GVZN7H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAC11F00898;
	Thu, 26 Nov 2026 23:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795734007;
	bh=ET6CA/3hcvG1l/nBa4rZu+CNkHEqOV0iUcKI77Rplwc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g8GVZN7HhgOEXCEGk/IJNSF3V3JFBFk2xOT0Ufm6Ljfvz2Hp6+PLWJwZ6CTTJG3Uh
	 1RPahfrvdkaGd5J3YjonkI7fJn5pnq7TH5r2Qwnd3VQur+gZbfK1K3QkevWErtW4CS
	 BAZnQKG/jaAzQOQDZrPLDCiaxQDOt7vYRyAPZISdmXshX0bX8eFXv41GA4Is1L8hi0
	 AgU4pxoWUTmW3lCYSTEB9LpjG0fXAKT2Quy/HRXPT59Pidew5fojHksXtbFiOVUYAM
	 loEe8MC51z8trgv8rI9qi1Z2PuNocKyPXprFhk/jK8Z2vpGRlW3TaGQWw+hx47UW5v
	 EhyYMiNWKt8+Q==
Subject: Re: [PATCH net 3/5] ice: ptp: serialize E825 PHY timer start with PTP
 lock and incval
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
Date: Thu, 26 Nov 2026 23:00:06 +0000
Message-ID: <179573400611.3135.7939999840565341608@kernel.org>
In-Reply-To: <20261125224428.4126195-4-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-4-anthony.l.nguyen@intel.com>
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

- [Low] The concern says the sentence 'The caller must acquire PTP
  semaphore lock', which the patch adds after the Return: bullet list in…

Pre-existing issues:
- [Medium] At this commit, ice_capture_crosststamp() in
  drivers/net/ethernet/intel/ice/ice_ptp.c writes the shared GLTSYN_CMD…
- [Medium] ice_start_phy_timer_e82x() in
  drivers/net/ethernet/intel/ice/ice_ptp_hw.c repeats the unlocked…
- [Low] The kernel-doc Return list of ice_start_phy_timer_eth56g() in
  drivers/net/ethernet/intel/ice/ice_ptp_hw.c (lines 2134-2136) has only…

--

ice: ptp: serialize E825 PHY timer start with PTP lock and incval

This patch holds the PTP hardware semaphore across the whole of
ice_start_phy_timer_eth56g(). It now covers the first GLTSYN_CMD write,
the incval read, the PHY incval init and the phase sync. The phase-sync
helper becomes ice_sync_phy_timer_eth56g_unlocked(), which expects the
caller to already hold the semaphore.

> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> index 3a41c711e751b..16333d4a34ccf 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c

[ ... ]

> @@ -2041,22 +2041,18 @@ static int ice_read_phy_and_phc_time_eth56g(struct ice_hw *hw, u8 port,
>   *
>   * Return:
>   * * %0     - success
> - * * %-EBUSY- failed to acquire PTP semaphore
>   * * %other - PHY read/write failed
> + *
> + * The caller must acquire PTP semaphore lock
>   */

[Severity: Low]
This is a pre-existing issue, but with the -EBUSY entry dropped here, is
-EBUSY still documented anywhere in this call chain?

The kernel-doc for ice_start_phy_timer_eth56g() only lists:

 * Return:
 * * %0     - success
 * * %other - PHY read/write failed

The function returns -EBUSY directly when ice_ptp_lock() fails, and it did
so before this patch too. Could a %-EBUSY entry be added to the
ice_start_phy_timer_eth56g() kernel-doc?

[ ... ]

> @@ -2155,19 +2149,24 @@ int ice_start_phy_timer_eth56g(struct ice_hw *hw, u8 port)
>  	if (err)
>  		return err;
>  
> +	if (!ice_ptp_lock(hw)) {
> +		dev_err(ice_hw_to_dev(hw), "Failed to acquire PTP semaphore\n");
> +		return -EBUSY;
> +	}
> +
>  	ice_ptp_src_cmd(hw, ICE_PTP_NOP);

[Severity: Medium]
This isn't a bug introduced by this patch, but is the PTP semaphore enough
to keep every other writer off GLTSYN_CMD here?

ice_capture_crosststamp() in ice_ptp.c also writes GLTSYN_CMD. It holds
only the cross-timestamp semaphore (cfg->lock_reg, which is PFHH_SEM on
E82x/E825), not the PFTSYN_SEM semaphore taken by ice_ptp_lock():

drivers/net/ethernet/intel/ice/ice_ptp.c:ice_capture_crosststamp() {
    ...
	/* Program cmd to master timer */
	ice_ptp_src_cmd(hw, ICE_PTP_READ_TIME);
    ...
err_timeout:
	/* Clear the master timer */
	ice_ptp_src_cmd(hw, ICE_PTP_NOP);
    ...
}

On E825, a PTP_SYS_OFFSET_PRECISE request (phc2sys uses it by default)
could overwrite the source command partway through ice_ptp_tmr_cmd()
(adjtime/adjfine). It could do the same partway through
ice_sync_phy_timer_eth56g_unlocked(). Wouldn't that produce the same
PHY/PHC divergence the commit message describes?

This appears to come from commit 88c360e49f51. The next patch in this
series, "ice: remove redundant cross-timestamp PTP command", removes both
ice_ptp_src_cmd() calls from ice_capture_crosststamp(), so the race is gone
by the end of the series.

[ ... ]

> @@ -2193,11 +2187,11 @@ int ice_start_phy_timer_eth56g(struct ice_hw *hw, u8 port)
>  
>  	ice_ptp_exec_tmr_cmd(hw);
>  
> -	ice_ptp_unlock(hw);
> -
> -	err = ice_sync_phy_timer_eth56g(hw, port);
> +	err = ice_sync_phy_timer_eth56g_unlocked(hw, port);
>  	if (err)
> -		return err;
> +		goto err_ptp_unlock;
> +
> +	ice_ptp_unlock(hw);

[Severity: Medium]
This is a pre-existing issue, but does ice_start_phy_timer_e82x() need the
same change?

It is called from the same ice_ptp_port_phy_restart() path, which holds
only the per-port ps_lock. Without the PTP semaphore it still reads the
incval, writes the shared GLTSYN_CMD, and fires GLTSYN_CMD_SYNC three
times:

drivers/net/ethernet/intel/ice/ice_ptp_hw.c:ice_start_phy_timer_e82x() {
    ...
	lo = rd32(hw, GLTSYN_INCVAL_L(tmr_idx));
	hi = rd32(hw, GLTSYN_INCVAL_H(tmr_idx));
	incval = (u64)hi << 32 | lo;
    ...
	err = ice_ptp_one_port_cmd(hw, port, ICE_PTP_INIT_INCVAL);
	if (err)
		return err;

	/* Do not perform any action on the main timer */
	ice_ptp_src_cmd(hw, ICE_PTP_NOP);

	ice_ptp_exec_tmr_cmd(hw);
    ...
	ice_ptp_exec_tmr_cmd(hw);
    ...
	ice_ptp_exec_tmr_cmd(hw);

	err = ice_sync_phy_timer_e82x(hw, port);
    ...
}

The semaphore is only taken later, inside ice_sync_phy_timer_e82x().
ps_lock does not exclude ice_ptp_adjtime() or ice_ptp_adjfine() running
under ice_ptp_lock() on this PF or another one. It also does not exclude
ice_ptp_settime64()->ice_ptp_restart_all_phy().

Can this NOP replace an ADJ_TIME or INIT_INCVAL that ice_ptp_tmr_cmd() has
staged, or can one of these execs latch it early? Either would leave the
E822/E823 PHY timer offset from the PHC.

The commit message limits the fix to E825, so this may belong in a
separate patch.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125224428.4126195-2-anthony.l.nguyen%40intel.com
