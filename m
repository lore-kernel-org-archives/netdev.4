Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170763;
	b=Z4Q9kCpZi/6DVa6whpTJmSUXi0wFR0ULlsHu+kC+iz+Fd7KuiEU12J7qO1BZTZ0cZhCm
	 Z4oBYiPzbxv4isMEPuxPWrPPWa6wrRDdE7k6Z3zIAsymdWTHoAtPSPCaFFj3EnOtGPJEs
	 O2xjlBJC6Y78mV3jBiC7eNpAbUwQpQNJ3WFHY2MJpI0AMgn38kEZAhUeIBtQbpYGoZV7M
	 QTJKX61bhtorFhQ+BjFGfTHv96OBVL1wham2jL6NmnoS/sAwTYpQH+dBbkxqKFevnXr9L
	 Re9XTc32EsQwP8b/nIyE7eFhuasQKVaVJ7+yDgMuuiut70/sw+THZldFuIhju1/1ufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170763;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3Bzon3iWvUaUY96e3SA5cgJ7L9dQgMChALNIrIrFeCA=;
	b=gaB5kC6RNpwHym9+PN+Fjgb/T8VGEA16AJhjQphl7g2C5tDApC/ltRoOhI3SFgRWgHWk
	 JYJGv9vKJ043mKVgOOb+vMJC7FpbUITd3udK+0OenT6DGHAHCxIKvp5sQuMO7K/HVu4v7
	 Ch/zg5QkqzmLqwTgR2aLE416Szk8XnneWQoHmgGpaae+RTvple9PtyiCJk6ay4lfS7cmB
	 1yuQVUSMSheHJiMf1AQoICz1h7K792ZorzdFQgz0ajHmU5F10eL+tz2rYwuMoiXMOcdHP
	 CzWLMWV8jmV7psJ00Pzfg4b6CU+EaWulWVgI8fBSL3cJx7dipCRy5L4zHjhoLoJS1Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d769vmyH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D860A262E;
	Fri, 20 Nov 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d769vmyH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE321F00A36;
	Fri, 20 Nov 2026 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170763;
	bh=3Bzon3iWvUaUY96e3SA5cgJ7L9dQgMChALNIrIrFeCA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d769vmyH+YXDYqXQIiDJyzrv96P2247yEvThlIwBs3NCaKJwM/vDydEZG41mPGDsZ
	 YrsygRu5d770zzC6z5bh9+cBGwZPAec1sg6u5VWvSPztLGygHIuTcvns9MD6llHnx3
	 XeK/nlnI1aIQt2m51g77dCR+hdgJB3tleJcUKpmGeVVlDVjj+8nE3jVC+P5opFqAOA
	 l+Cktg7FI/FTWxCYfI8RJg34ByGRZ0WaWA07xsUs4dchK8dVPoHKm4zxRFt1AiE93S
	 shgV9ywey/cSDRMtHN8h5kCZg8Eb6kvTpymp4QSq26IXN58wEzh+VkoUV3BuqS/+J4
	 zgJrbkSKuu1KA==
Subject: Re: [PATCH net v3 09/10] net: au1000: keep the MAC stopped until the
 PHY link is ready
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Fri, 20 Nov 2026 10:32:41 +0000
Message-ID: <179517076197.3136.575167773294560465@kernel.org>
In-Reply-To: <20261117193223.2795612-10-f.fainelli@gmail.com>
References: <20261117193223.2795612-10-f.fainelli@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix stops MAC RX/TX in only one place: the link-down branch
  of au1000_adjust_link()…
- [Low] The new au1000_hard_stop(dev) call in the link-down branch of
  au1000_adjust_link() (au1000_eth.c:460) runs inside…

--

net: au1000: keep the MAC stopped until the PHY link is ready

This patch stops MAC RX/TX in the link-down branch of
au1000_adjust_link(). In au1000_open() it resumes the PHY synchronously
before au1000_init(). It also changes au1000_init() to leave RX/TX
disabled until au1000_adjust_link() has acknowledged a link.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index cb2f3333ba9fd..98a75aba92e1a 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> @@ -456,7 +456,8 @@ au1000_adjust_link(struct net_device *dev)
>  		/* link state changed */
>  
>  		if (!phydev->link) {
> -			/* link went down */
> +			/* Stop the MAC before the PHY can remove its clocks. */
> +			au1000_hard_stop(dev);

[Severity: High]
This covers phy_stop() on close. Is there a path that powers the PHY down
without ever calling adjust_link, though?

During system sleep, mdio_bus_phy_suspend() only skips the PHY when
mac_managed_pm is set, and au1000_eth never sets it:

drivers/net/phy/phy_device.c:mdio_bus_phy_suspend() {
    ...
	if (phydev->mac_managed_pm)
		return 0;
    ...
	if (phy_uses_state_machine(phydev))
		phy_stop_machine(phydev);
    ...
	return phy_suspend(phydev);
}

phy_stop_machine() only cancels the work and moves the state to PHY_UP,
so it never reaches the PHY_HALTED path that calls phy_link_down():

drivers/net/phy/phy.c:phy_stop_machine() {
	cancel_delayed_work_sync(&phydev->state_queue);
	mutex_lock(&phydev->lock);
	if (phy_is_started(phydev))
		phydev->state = PHY_UP;
    ...
}

On MTX-1 the LAN83C183 then gets genphy_suspend(), which sets BMCR_PDOWN.
au1000_eth_driver has no .driver.pm callbacks. With the interface up and
the link up, the MAC appears to keep MAC_RX_ENABLE | MAC_TX_ENABLE set for
the whole sleep.

On resume, mdio_bus_phy_resume()->lan83c183_resume() waits 500 ms, and
the MAC is still running during that wait.

Those are the two conditions the commit message describes: "MTX-1 can
hang when the MAC runs while its MII clocks are absent or still
recovering."

This looks reachable on MTX-1 itself through s2idle, because
pm_states_init() always offers "freeze" even without platform
suspend_ops. Alchemy db1x boards can also reach it through suspend-to-mem,
via the db1x_pm_ops registered in arch/mips/alchemy/devboards/pm.c.

The last patch in the series ("net: au1000: reject frames larger than the
TX bounce buffer") only touches au1000_tx(), so this gap is still there
at the end of the series.

Would it make sense to add MAC-side suspend/resume handling here? Another
option is to set mac_managed_pm and stop and start the MAC explicitly.

[Severity: Low]
This call runs inside the spin_lock_irqsave(&aup->lock, flags) region of
au1000_adjust_link(), and au1000_hard_stop() ends with a busy-wait:

au1000_hard_stop() {
    ...
	writel(reg, &aup->mac->control);
	wmb(); /* drain writebuffer */
	mdelay(10);
}

Doesn't this mean every link-down event now spins for 10 ms with local
interrupts disabled? Before this change the link-down branch did no MMIO
and had no delay.

On close the wait also seems to happen twice. phy_stop() leads to
phy_link_down()->au1000_adjust_link(), which does the first hard stop.

au1000_close() then takes aup->lock with irqsave and calls
au1000_reset_mac_unlocked(). Since MDIO accesses have re-enabled the MAC,
mac_enabled is still 1, so au1000_hard_stop() runs again with RX/TX
already cleared:

au1000_reset_mac_unlocked() {
    ...
	if (aup->mac_enabled) {
		au1000_hard_stop(dev);
    ...
}

The delay is only there so the MAC can quiesce before phylib suspends the
PHY, and that suspend happens after adjust_link returns.

Could the register write stay under the lock, with the mdelay() moved
after spin_unlock_irqrestore()?

>  			aup->old_speed = 0;
>  			aup->old_duplex = -1;
>  		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193223.2795612-1-f.fainelli%40gmail.com
