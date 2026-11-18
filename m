Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993513;
	b=fQsv2gX8veTrula9gqk2cpE7MovmWiNp1HtYxLzbrhLv3JozDtWgFkBO4ndTKiGCYh08
	 AsribljKXNePHbGlaE/v5NdlBxF1fUXOHmIIIWASKW4i5UnnUbOm96nzHYWWspCkve9+i
	 0IZxtWqBHzbiBHE4biaUZcYhbzosAMI3UenlpDS2U5uEfkdyk0+mRsddw+FTBBN0WqCQz
	 HEhp9OTKs2A86dS3GNC3/A/ak96/3T9rTjNHe51vaNE9UU2Mh5S42C1c9Nhh9bBRWzcX5
	 l03FLdCyl8GpS/PUAfKgJ0JUlRbNBTs0ll3sPtfNXdrwFZpIq78HVoB1YQ2XhxaWrkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993513;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OcVCj+OjH0fCxqPKSIEjyCgO56WOkscvnJIcyF1o2iQ=;
	b=YIVJatIfiFZ6rp5QoUW0agqphnkerivtUttnL69NRBQed3rYNaBvja2iyIOUsTldOhlj
	 OIrDwjjrMzqmv4Bh6XxDsqP9a9rJKbpn9XrynV12mk2QmIcPX8zl8LbvcjZqU4comAWsP
	 Txqx/NXspdP8N9Yt74mLw3wQBqTkXiknvBecoWA7TBr6vafnLqYLZZw+1NWqfC0Ewkc1A
	 am+JERRTE+pZV/24Onswm9pYF8ho8mmtaDG08OKjg23WVPbuohqX/Y0ooNXQmRMf0tq4/
	 7GVKI3y4wJ9UwNHrs1CTT1bTESVvpuUzfjSW7HdGYN4iWigphtKNYPOlFNJkhTM1gYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDVW2E6o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC69606A335;
	Wed, 18 Nov 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDVW2E6o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB0C1F000C4;
	Wed, 18 Nov 2026 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993513;
	bh=OcVCj+OjH0fCxqPKSIEjyCgO56WOkscvnJIcyF1o2iQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GDVW2E6oSsqegKL01nKGZowgo72vhemv4d23XN6kiUB26KYVBuXdfzeJCNBwiPIZk
	 8aYXebN9RhbAHtck33rRzvM2GetFWv7CGUiyuktSz/i/0uDtS7ZMuvc+amRychRGDh
	 ID2iIataHc09C8AFb2rZMzjZGNj2LZtLlTL6eqaAprl6cuyL66rKJ3gq8dkQVR32oT
	 osodKfnv+E2loYw3R6z9ekhbuUgvc0p8+WGTnXByFjBAH0nWQh++PnxroUCrnm3D0h
	 kvZP4hKbq5zs0QRcsBZv7M4JJGOuFr2jYuaLmOf2J4O7rb1UJLwo2lB2zrTXlWF2Pe
	 n37n8qPKjrr4w==
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
From: netdev-bot+sashiko@kernel.org
To: magnusleatti@kernelriot.com
Cc: me@ziyao.cc, maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 g.nespolino@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 09:18:31 +0000
Message-ID: <179499351186.3136.1370230751729152458@kernel.org>
In-Reply-To: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
References: <20261116091757.1656602-3-magnusleatti@kernelriot.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Hibernation in shutdown mode arms OOB WoL, but the restore
  path has no way to disarm it.
- [Low] motorcomm_shutdown() computes `wake` with no lock held, from
  netif_running(ndev), spriv->wolopts and device_may_wakeup(&pdev->dev).

--

net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5

This patch arms the YT6801 to wake the system from S5. It does this in
motorcomm_shutdown() when powering off with Wake-on-LAN set, the
interface up and device wakeup enabled. After stmmac_suspend() it
enables OOB WoL, waits 2 ms, rewrites MAC address filter 0 and sets the
packet wake bit in WOL_CTRL, leaving the function in D0 with PME
enabled.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 1e142ad39e33a..034547ad1e98e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c

[ ... ]

> @@ -204,9 +207,51 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
>  	return 0;
>  }
>  
> +/*
> + * Arm the chip to wake the system from S5. stmmac_suspend() has already
> + * programmed the PMT register of the GMAC. The rest lives in the wrapper.
> + */
> +static void motorcomm_arm_s5_wake(struct net_device *ndev)
> +{
> +	struct stmmac_priv *spriv = netdev_priv(ndev);
> +	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
> +	u32 reg;
> +
> +	/*
> +	 * motorcomm_init() disables OOB WoL right after the chip reset, as
> +	 * normal operation requires. With it disabled the chip ignores wake
> +	 * packets once the system is off. Once it has been enabled, only a
> +	 * chip reset disables it again, so enable it only when powering off.
> +	 */
> +	reg = readl(priv->base + OOB_WOL_CTRL);
> +	reg &= ~OOB_WOL_CTRL_DIS;
> +	writel(reg, priv->base + OOB_WOL_CTRL);

[Severity: Medium]
What happens when the system resumes from a hibernation that powered off
through this path?

The commit message says "Hibernation that powers off through the
shutdown path arms the chip the same way". For HIBERNATION_SHUTDOWN, and
for the platform-mode fallthrough, power_down() in kernel/power/hibernate.c
calls kernel_power_off():

    case HIBERNATION_SHUTDOWN:
            if (kernel_can_power_off()) {
                    entering_platform_hibernation = true;
                    kernel_power_off();

That reaches device_shutdown() with system_state == SYSTEM_POWER_OFF.
motorcomm_shutdown() then computes wake as true and OOB WoL gets enabled
here.

The commit message relies on "the next probe resets the chip", but a
hibernation restore does not probe. The .restore callback in
stmmac_simple_pm_ops runs stmmac_resume() -> motorcomm_resume():

motorcomm_resume() {
    ...
	motorcomm_deassert_mdio_phy_reset(priv);
	motorcomm_init(priv);
    ...
}

Neither of these calls motorcomm_reset(). Only motorcomm_probe() calls
it. The device was left in D0 at shutdown, so restore is not a
D3hot->D0 transition either. The only attempt to disarm OOB WoL is the
plain write in motorcomm_init():

	/*
	 * OOB WOL must be disabled during normal operation, or DMA interrupts
	 * cannot be delivered to the host.
	 */
	writel(OOB_WOL_CTRL_DIS, priv->base + OOB_WOL_CTRL);

The new comment says this write cannot undo OOB WoL once it has been
enabled. Nothing in the driver clears WOL_CTRL_PKT_EN either.

Suppose the boot kernel did not bind dwmac-motorcomm and reset the chip,
for example because the module is not in the initramfs. Could the
restored kernel then run with OOB WoL still enabled and get no DMA
interrupts?

The new comment also says motorcomm_init() runs "right after the chip
reset", but motorcomm_resume() calls it without a reset.

If "only a chip reset disables it again" is accurate, should the restore
path reset the chip, or should arming be skipped for hibernation? If it
is not accurate, should the comment and the commit message be corrected?

[ ... ]

> @@ -215,14 +260,31 @@ static void motorcomm_shutdown(struct pci_dev *pdev)
>  	if (!netif_device_present(ndev))
>  		return;
>  
> -	/* Stop the device before reboot, kexec or power-off */
> +	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
> +	       spriv->wolopts && device_may_wakeup(&pdev->dev);

[Severity: Low]
Can wake become stale before stmmac_suspend() reads the same state and
acts on it?

It is sampled with neither priv->lock nor rtnl held. Two paths can still
run until netif_device_detach() inside stmmac_suspend():

- stmmac_mac_wol_set(), from ethtool set_wol under rtnl
- dev_close() -> stmmac_release()

kernel_shutdown_prepare() does not freeze userspace before
device_shutdown().

In the first case, "ethtool -s ethX wol d" completes after wake was
sampled as true. stmmac_suspend() then calls stmmac_mac_set(false) and
phylink_suspend(false). motorcomm_shutdown() still skips
pci_wake_from_d3(pdev, false) and runs motorcomm_arm_s5_wake(). PME is
probably not enabled, since pci_enable_wake() refuses when
device_may_wakeup() is false. Even so, the chip is armed against the
last WoL setting.

In the second case, dev_close() runs after wake was sampled.
stmmac_suspend() sees the interface down and jumps straight to the bsp
hook:

	if (!ndev || !netif_running(ndev))
		goto suspend_bsp;

There stmmac_pci_plat_suspend() enables PME, because wakeup is still
enabled. Since wake is stale, PME stays on, and OOB WoL is armed on a
closed interface whose PMT was never programmed. Doesn't that conflict
with "If the interface is down at power-off, the system does not wake"?

Would it be more robust to base the arming decision on what
stmmac_suspend() actually did? One option is to check priv->irq_wake
after it returns. It is set only when PMT was armed, and the detach
blocks ethtool by then. Another option is to sample the state under the
same locks.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116091757.1656602-1-magnusleatti%40kernelriot.com
