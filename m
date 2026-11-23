Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438325;
	b=r43dWV8lgK4BI6JTG695Wad0QJTVMogu8RVfqYrjETSXn8bB7A8hsPj8hCGtwlfpsgKA
	 Y5hqytM8QDfBWK+eqvbzwwJ8ekmgVbMUZz0TKlctd/0S0gld5QWKovmiRjJwZEpUKlAMi
	 YwnS63ZfL1j3y4Ioqx3kkBGJuz911LKO7XdlKWOJtpI6CTbUgo+lXOKuSvDCu7/s0CjMz
	 KeNStDhw1rxWSz8csz4ZdtBAPhVsgzqcqmaWVk2HFDKiL4JfrTRaax9xEDq8MKANqwPMt
	 u7V8lR2ktByK+wTszyzbxiytBDZzL7xKthVahnNqAnEb00bMdvCooLcyEkJO/9oOYcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438325;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4t3BMk6nZPH9oNukSjMFpY9HNBcHA8DW3WzyFPKl0p4=;
	b=NRHIQh+0UeWEiuIUmImeyATff+ucJHdXUM2W5HewyyDT99d+TnHsgxk61V/zkstDEYAJ
	 2FJpAaUUbTKVc1Saxnvkn1rM4wOrelykodvKVF5FOoNMsr9g8AJD7sn81eCwaDCmQn9G6
	 fgWUbISw9PSswAW5s3IM4ELs1yHF4dAlwUQyZSA6MNyeEMkg9so2Su2U4mPF2ETWLdK9r
	 bVy/7rAwpscK/wtK+anBYInLIZLPhu8WDpJ/xWOfDm0jQ49rvrUk9rO8YDI5TBJN4TkJJ
	 gN2Lbe7ACntu6Sq5HHmlgYAz7BMyttBzAHAqxy+oHNUpe/cveLMlQI6MBW9tmbrcZaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T+gbT6/z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F705606A68F;
	Mon, 23 Nov 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+gbT6/z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA05C1F000EE;
	Mon, 23 Nov 2026 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438325;
	bh=4t3BMk6nZPH9oNukSjMFpY9HNBcHA8DW3WzyFPKl0p4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T+gbT6/z8mM7WUjs+b9xo4ZnmnxbA3RvZoVHJGR6LPQBQC8Y20HQ2xzTx+fcsyeck
	 RO5l2mnuR9Edgi+KrIJNe8jtP4fBs9Wi5WraT9GjfRPojn3UwKePmnZhWgAbALwos7
	 kHcU7NbYq+cKMnSwxS9Fx12UxCMUlDu7irDZ/vBsRCPJqRevae9ZrUYfMCyqYJSQCl
	 t6CD8mMgXoGYUpQg8mLQ7pQl0Hr0IwDsATaRvBPL0asE9dFJGFHEJRi6w0RHmn3TBa
	 OcLpSf79pzUXcDI0cjMu7n8eWai6slTV7XKSUMzqsDKjaoR0LDPCh5uK/7HE27pvP2
	 bk5RT9ooAndhg==
Subject: Re: [PATCH v35 net-next 4/8] net/nebula-matrix: add chip-wide
 hardware init/deinit implementation
From: netdev-bot+sashiko@kernel.org
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org, kuba@kernel.org,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 12:52:04 +0000
Message-ID: <179543832427.3135.13247955812022339887@kernel.org>
In-Reply-To: <20261119113530.32107-5-illusion.wang@nebula-matrix.com>
References: <20261119113530.32107-5-illusion.wang@nebula-matrix.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When nbl_hw_clear_stale_status() finds bit 16 of
  NBL_DRIVER_STATUS_REG already set (after kexec, or after a previous…
- [Low] The commit message says: "The two hooks are only checked for non-
  NULL by nbl_hw_setup_ops() and nbl_res_setup_ops() at this point".
- [Low] The comment in nbl_hw_get_quirks() describes a fallback that can
  never run, and it contradicts itself.
- [Low] The WARN_ON(eth_num != 1 && eth_num != 2 && eth_num != 4) in
  nbl_ustore_init() can never fire, so its comment is wrong to say it…

--

net/nebula-matrix: add chip-wide hardware init/deinit implementation

This adds the Leonis chip-wide init_module() and deinit_module() hooks in
the hw and resource layers. On the control PF they program the DPED, UPED,
SHAPING, DSCH, USTORE, DSTORE, DVN, UVN, UQM and PADPT datapath registers.
The commit also adds a firmware quirk word read at mailbox offset 0x140,
and a probe-time clear of a stale driver_status bit before any per-PF
state is programmed.

> The two hooks are only checked for non-NULL by nbl_hw_setup_ops() and
> nbl_res_setup_ops() at this point; nothing calls them yet.  They gain
> callers later in the series, from the dispatch init_module()/
> deinit_module() and from nbl_dev_setup_ctrl_dev()/
> nbl_dev_remove_ctrl_dev().

[Severity: Low]
Is this description accurate? nbl_hw_setup_ops() in nbl_hw_leonis.c only
allocates the table and assigns the pointers:

	hw_ops_tbl = devm_kzalloc(dev, sizeof(*hw_ops_tbl), GFP_KERNEL);
	if (!hw_ops_tbl)
		return ERR_PTR(-ENOMEM);
	hw_ops_tbl->ops = &hw_ops;
	hw_ops_tbl->priv = hw_mgt;

It never checks ops->init_module or ops->deinit_module.

nbl_res_setup_ops() doesn't appear to exist anywhere under
drivers/net/ethernet/nebula-matrix/, either at this commit or at the end
of the series.

The rest of the paragraph holds up. "net/nebula-matrix: dispatch: add
control-level routing core infrastructure" wires
nbl_disp_init_module()/nbl_disp_deinit_module() to nbl_res_chip_*().
"net/nebula-matrix: add common/ctrl dev init/remove operation" adds the
calls from nbl_dev_setup_ctrl_dev()/nbl_dev_remove_ctrl_dev().

The nbl_hw_deinit_module() precondition also holds by the end of the
series, because nbl_dev_remove() calls nbl_dev_remove_common_dev() before
nbl_dev_remove_ctrl_dev().

Could the NULL-check sentence be corrected?

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> index f7cdb0fecf442..dafac13916739 100644
> --- a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_hw_leonis.c

[ ... ]

> @@ -150,6 +175,756 @@ static void nbl_hw_get_fw_eth_map(struct nbl_hw_mgt *hw_mgt, u32 *eth_map)
>  	*eth_map = FIELD_GET(NBL_FW_BOARD_DW6_ETH_BITMAP_MASK, data);
>  }
>  
> +static u32 nbl_hw_get_quirks(struct nbl_hw_mgt *hw_mgt)
> +{
> +	u32 quirks = 0;
> +
> +	/*
> +	 * Read quirk bits from mailbox register.
> +	 * All supported firmware implement the quirk ABI,
> +	 * firmware always populates NBL_LEONIS_QUIRKS_OFFSET.
> +	 * Value ~0U indicates no active quirks.
> +	 *
> +	 * There is no firmware version field in this ABI to gate the read
> +	 * on: the quirk word itself is the capability advertisement.  A
> +	 * word firmware never populated reads as zero (or is rejected by
> +	 * the mailbox-bar bounds check, leaving the zero initialiser), and
> +	 * zero selects the same sel=1 prefetch default as ~0U, which is
> +	 * what firmware predating the quirk needs.
> +	 */
> +	nbl_hw_read_mbx_regs(hw_mgt, NBL_LEONIS_QUIRKS_OFFSET, &quirks,
> +			     sizeof(u32));

[Severity: Low]
Can the bounds-check fallback in this comment ever run? nbl_hw_init_leonis()
fails probe when the mailbox BAR is shorter than NBL_BAR2_MAX_LEN (0x300),
and then sets mailbox_bar_size = bar_len:

	if (bar_len < NBL_BAR2_MAX_LEN) {
		dev_err(&pdev->dev, "MAILBOX BAR length %pa too small\n",
			&bar_len);
		ret = -EINVAL;
		return ret;
	}

This read covers 0x140..0x143, so the reg + len > mailbox_bar_size check
in nbl_hw_read_mbx_regs() can't reject it.

The comment also contradicts itself. It first says all supported firmware
always populates the word, then relies on firmware predating the quirk
leaving it as zero. Which one is intended?

The ABI note for NBL_QUIRK_UVN_PREFETCH_ALIGN in nbl_include.h defines only
~0U and BIT(1). It doesn't say that 0 means no quirks, so older firmware
works only if mailbox offset 0x140 reads as zero.

If such firmware leaves BIT(1) set at that offset, would UVN prefetch
silently switch to sel=0?

[ ... ]

> +static int nbl_ustore_init(struct nbl_hw_mgt *hw_mgt, u8 eth_num)
> +{
> +	u32 eth_bitmap = 0;
> +	u32 drop_th = 0;
> +	u32 pkt_len = 0;
> +	u32 reg_val = 0;
> +	int i;
> +
> +	/*
> +	 * eth_num is validated in the resource layer:
> +	 * nbl_res_init_pf_num() requires 1/2/4 PFs, and
> +	 * nbl_res_ctrl_dev_setup_eth_info() requires max_pf == eth_num.
> +	 * This is a defensive check only; if it triggers, the resource
> +	 * layer validation was bypassed, which is a bug.
> +	 */
> +	if (WARN_ON(eth_num != 1 && eth_num != 2 && eth_num != 4))
> +		return -EINVAL;

[Severity: Low]
Can this WARN_ON() ever fire? nbl_ustore_init() is static and is only
reached through nbl_hw_init_module()->nbl_dp_init(). nbl_hw_init_module()
already rejects the same values before it calls nbl_dp_init():

	if (!nbl_hw_eth_num_valid(eth_num)) {
		dev_err(hw_mgt->common->dev, "Invalid eth_num %u\n", eth_num);
		return -EINVAL;
	}

If the resource-layer validation were bypassed, that dev_err() path would
catch it first, so the warning this comment promises would never appear.

The same check now exists in three places, but the comment names only two.
Could the duplicate check be removed, or the comment updated?

[ ... ]

> +static void nbl_hw_clear_stale_status(struct nbl_hw_mgt *hw_mgt)
> +{

[ ... ]

> +	status = nbl_hw_rd32(hw_mgt, NBL_DRIVER_STATUS_REG);
> +	if (!(status & BIT(NBL_DRIVER_STATUS_BIT)))
> +		return;
> +
> +	dev_warn(hw_mgt->common->dev,
> +		 "driver_status already set, stale cleanup forced\n");
> +	nbl_hw_set_driver_status(hw_mgt, false);
> +	nbl_flush_writes(hw_mgt);
> +	usleep_range(NBL_FW_CLEANUP_SYNC_MIN_US, NBL_FW_CLEANUP_SYNC_MAX_US);
> +}

[Severity: Medium]
What happens on this stale path if the firmware reclaim pass takes longer
than the 2-3 ms window? Probe goes on regardless:

nbl_hw_init_leonis()
  nbl_hw_clear_stale_status()
    usleep_range(2000, 3000)
nbl_core_init()
  nbl_dev_init()
    nbl_dev_setup_chan_qinfo()
    mailbox queue setup

A pass that is still running could wipe the QINFO routing and qinfo
QUEUE_EN state this probe has just programmed. The control PF would report
no error. The inter-PF mailbox would stop working, though, and sibling PFs
would later fail with RPC timeouts in nbl_dev_start() until the control
PF is rebound.

The commit message names this case ("an ECPU still busy right after
kexec") as the one most likely to overrun the window.

The comments justify the fixed sleep by saying "the reclaimed entries read
back the same before and after the pass, so there is no observable side
effect to wait on". Does that hold here? The comment above this function
says the pass "wipes those registers".

After kexec or an unclean unload, the previous instance has programmed
NBL_MAILBOX_QINFO_MAP_REG_ARR (BDF, MSIX_IDX, MSIX_IDX_VALID) and set
NBL_MAILBOX_QINFO_CFG_QUEUE_EN_MASK through config_mailbox_rxq/txq. No
.shutdown callback undoes that before kexec. Those entries should
therefore hold non-reset values before the pass and change once it runs.

Would a bounded poll on those entries work here instead of the fixed
sleep? Another option is a read-back check after
nbl_dev_setup_chan_qinfo().

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119113530.32107-1-illusion.wang%40nebula-matrix.com
