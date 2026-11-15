Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747523;
	b=Fts3fXEuEGrRyYbQSgaQ2ZAy+UKn3RCSBGgmsNRrzMKxj8N1WX+GI6A4a3TFBJMs61iq
	 YEKh3qINlWi6rCqtjBfFc85UnMNeAeBkG1/vPGQgPZG3oBg3aCH0RGw9rra0lL2YSkxr/
	 kgl9oFEE8PAO+wLywEU64LoytOPsuFUL78ZWloJbKwAr6N4+mc4etPRsHHGf1Cc7yV9wR
	 smgW6oLsT66W8sqwBt6b+Ji9Pv9z+mTiophnRGThRfzVrqLobFzhhDiV6sP0DNYfeNIoZ
	 tRXtgUr5a6a7i1IFkZlaTOOBwNjthUr2nSrGNn+w/6hSfG2GOGTpfI0Z9HTAuPlh9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747523;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=R1LBefYw6pp3k9OMIlREqlnnnc7IHJT38Apio1SkC6E=;
	b=A6KNRgAokAWnQ6jvE/1qWjKADtE9oRA2eXSc3hvwto699uP372vYnu6Jxxnf5DBcOHu9
	 +UHURpW7dNNhCANpP/arWKc45pTyzIq9nsRng9lI4l4WC0wq9dWMTNsvkcZeKdeGUnJJu
	 cfMXAUphW58mLDAACzj3RqofwolDeB8olxmsHp0LtPgSxUMUPwzBM3WDCG4Nhzrc02YjB
	 +ve4ZZoeVag6KSz0ydJIKjffBHyt5yUAKkPJjjWNyyUqoAd7t1Qsr8sB1/qpuxnmSBHXP
	 XYSTHp3VWDrvfp+xeDUmEsshzXFDg+CGt85ymh2rFQG65C29/+UJ5uV/hT4FUMjMcOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rk3xz81z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE8606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rk3xz81z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9C41F000C4;
	Sun, 15 Nov 2026 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747522;
	bh=R1LBefYw6pp3k9OMIlREqlnnnc7IHJT38Apio1SkC6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Rk3xz81zYCWjPxEX2WOJFuVDU64iiLAHM+cFIYnktClzHMPtKuCwi70UWYuQLkY9j
	 sqz9oLQWVWbO3Q9DVPrIpOaPMJ7WZzfgbBNDiBAW+RnenQ2zBnMZw3hc1mS9mYY0g8
	 FrROc9c5rPUFUkpSM281ehR2lZAgYt4WSds6bGwkSuojS0kvHyKIN1yU3idfpCBNjg
	 HQcoj1syRI9HDvQasO/6649HvgDxkjTtg67sF7JGtsZpaXt5i6mDJyM0WTYVsxI5hv
	 hwHtGSV1OO2losuwW1pfcXjTi/js4rP5ggMOhrm8Jkt8MmfqEeJohmXeyfsRV8SG/g
	 788Se2ifl6sdQ==
Subject:
 Re: [PATCH net v2 2/4] tg3: Select PLL clock when preparing for shutdown
From: netdev-bot+sashiko@kernel.org
To: pavan.chebbi@broadcom.com
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com,
 vishvambar.panth-s@broadcom.com
Date: Sun, 15 Nov 2026 12:58:41 +0000
Message-ID: <179474752179.2199510.16313103373279878088@kernel.org>
In-Reply-To: <20261111123917.910416-3-pavan.chebbi@broadcom.com>
References: <20261111123917.910416-3-pavan.chebbi@broadcom.com>
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

- [High] The workaround is skipped on system suspend when the interface
  is administratively down but Wake-on-LAN is armed.
- [Low] Claim: the commit message says the bit is set 'On system suspend
  or power off', but tg3_power_down() is also reached from…
- [Low] The clear in tg3_resume() (line 18277) sits behind `if
  (!netif_running(dev)) goto unlock;`.
- [Low] In tg3_resume(), the new tg3_ncsi_pll_tlp_clk(tp, false) (line
  18277) does a BAR0 read-modify-write of TG3_CPMU_PLL_CTRL_STAT.
- [Low] tg3_ncsi_pll_tlp_clk() returns silently if tg3_ape_lock(tp,
  TG3_APE_LOCK_GPIO) fails.

--

tg3: Select PLL clock when preparing for shutdown

This commit works around a 5720 hardware issue where the device may fail
to wake on a single magic packet after being linked at 1G. It sets
CPMU_PLL_TLP_CLCK_SRC_NCSI_PLL in TG3_CPMU_PLL_CTRL_STAT on suspend or
power off when Wake-on-LAN is enabled and the last link speed was 1G. The
bit is cleared on resume and at probe.

> diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
> index 2cf9d2ea069b5..98338c0792e84 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -4267,8 +4267,38 @@ static void tg3_power_down_prepare(struct tg3 *tp)
>  	return;
>  }
>  
> +static void tg3_ncsi_pll_tlp_clk(struct tg3 *tp, bool enable)
> +{
> +	u32 val;
> +
> +	if (tg3_asic_rev(tp) != ASIC_REV_5720)
> +		return;
> +
> +	/* The register is shared by both functions of the device. */
> +	if (tg3_ape_lock(tp, TG3_APE_LOCK_GPIO))
> +		return;

[Severity: Low]
If the lock can't be taken, should this failure be reported somewhere?

On 5720 ENABLE_APE is set, so tg3_ape_lock() busy-waits for about 1ms and
then returns -EBUSY. If that happens, the workaround is silently skipped
on the power-down path. On the probe and resume paths, the bit silently
stays set. Nothing retries and nothing is logged.

On the suspend, resume and shutdown paths, rtnl_lock keeps the two PCI
functions from competing for the lock. tg3_frob_aux_power_5717() also
returns silently when this lock fails. But contention from the APE/NCSI
firmware, or from peer paths during probe that don't hold rtnl, isn't
ruled out.

Would a netdev_warn() or a bounded retry make an intermittent WoL failure
from this easier to diagnose?

> +
> +	val = tr32(TG3_CPMU_PLL_CTRL_STAT);

[ ... ]

>  static void tg3_power_down(struct tg3 *tp)
>  {
> +	tg3_wol_select_pll_clk(tp);
>  	pci_wake_from_d3(tp->pdev, tg3_flag(tp, WOL_ENABLE));
>  	pci_set_power_state(tp->pdev, PCI_D3hot);
>  }

[Severity: Low]
This probably isn't a bug, but the commit message says "On system suspend
or power off". tg3_power_down() is also reached from tg3_shutdown() on
restart, halt and kexec on any system not listed in
tg3_restart_snp_quirk_table:

tg3_shutdown()
	if (!dmi_first_match(tg3_restart_snp_quirk_table) ||
	    system_state == SYSTEM_POWER_OFF) {
		tg3_power_down(tp);

So the non-default TLP clock source can stay set across a warm reboot
until tg3 probes the device again.

The subject line says "shutdown", which covers every .shutdown reason, and
the bit can already stay set the same way after power off followed by a
WoL wake. This may only be a wording issue.

Could the commit message mention the reboot case too?

[ ... ]

> @@ -18222,6 +18254,7 @@ static int tg3_suspend(struct device *device)
>  	tg3_full_unlock(tp);
>  
>  	tg3_power_down_prepare(tp);
> +	tg3_wol_select_pll_clk(tp);

[Severity: High]
Is the workaround missed when the interface is down but Wake-on-LAN is
armed?

tg3_suspend() exits before it gets here:

	if (!netif_running(dev))
		goto unlock;

However, tg3_close() has already armed WoL for the closed interface:

tg3_close()
	tg3_stop(tp);

	if (pci_device_is_present(tp->pdev)) {
		tg3_power_down_prepare(tp);
		...

That sets MAC_MODE_MAGIC_PKT_ENABLE and puts the PHY into WoL mode.
link_config.active_speed keeps the speed recorded by the tg3_setup_phy()
call in that path. On 5720, if TG3_PHYFLG_KEEP_LINK_ON_PWRDN is set,
tg3_phy_copper_begin() leaves the link untouched, so the PHY can stay
linked at 1G.

The PCI core then puts the WoL-armed 5720 into D3hot with PME enabled.
This happens on S3 suspend, and also on platform-mode hibernation, where
.poweroff is tg3_suspend through SIMPLE_DEV_PM_OPS.
CPMU_PLL_TLP_CLCK_SRC_NCSI_PLL is never set on that path.

Isn't this the case the commit message describes: "On system suspend or
power off with Wake-on-LAN enabled, if the last link speed recorded before
power down was 1G"?

The two paths are also inconsistent. tg3_shutdown() calls tg3_power_down()
after dev_close() whether or not the interface was running. So a closed
interface gets the workaround on power off but not on suspend.

If the closed case gets handled, it would also need a matching clear in
tg3_open() or tg3_power_up(). tg3_resume() returns early for a closed
interface, and tg3_open() never clears the bit.

>  
>  unlock:
>  	rtnl_unlock();
> @@ -18241,6 +18274,8 @@ static int tg3_resume(struct device *device)
>  
>  	netif_device_attach(dev);
>  
> +	tg3_ncsi_pll_tlp_clk(tp, false);

[Severity: Low]
Can the bit stay set after hibernation restore?

This clear sits after the same netif_running() early exit as the set in
tg3_suspend(). During restore, though, the set and the clear run in
different kernels.

The restore (boot) kernel runs .freeze, which is tg3_suspend(). If the
5720 interface is up there at 1G with WoL enabled, the bit gets set in
hardware. WOL_ENABLE can come from NVRAM at probe.

The image kernel then runs .restore, which is tg3_resume(). If the
interface was down in the image kernel, this clear is skipped. Neither
tg3_open() nor tg3_power_up() clears the bit, and probe does not run
again.

That would leave the bit set during normal operation, which doesn't match
"The setting is cleared on resume and at probe". Would clearing it
unconditionally before the netif_running() check, or in tg3_open(), avoid
this?

[Severity: Low]
This read-modify-write of a BAR0 register now runs before
tg3_restart_hw()->tg3_init_hw(). tg3_init_hw() first does this:

tg3_init_hw()
	/* Chip may have been just powered on. If so, the boot code may still
	 * be running initialization. Wait for it to finish to avoid races in
	 * accessing the hardware.
	 */
	tg3_enable_register_access(tp);
	tg3_poll_fw(tp);

pci_restore_state() does not restore TG3PCI_MISC_HOST_CTRL, and its swap
settings affect how register data is presented.

If MISC_HOST_CTRL was reset across the D3 to D0 transition, could
tr32()/tw32() here act on the wrong bits? And if bootcode is still
initializing, could the read-modify-write race with it?

Before this patch, tg3_resume() only touched APE (BAR2) registers before
tg3_restart_hw(). Would it be safer to move the clear after
tg3_restart_hw(), or to call tg3_enable_register_access() and
tg3_poll_fw() first?

>  
>  	netdev_lock(dev);
>  	tg3_full_lock(tp, 0);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111123917.910416-1-pavan.chebbi%40broadcom.com
