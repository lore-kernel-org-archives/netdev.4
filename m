Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243153;
	b=QSNsiyQ2sg0u7Fdfb3d1Tg4+HeYlzeRJegE1hkfHnAxPQUH+QRFiB5J8jIV9O4Gm/Bvg
	 NAw090gPThAOt0V06YqVmiCB6Z0fCUQDfiARCt58MD/CTNJJ6dFiZgYQCWepR3i8bBTe+
	 ctNSVTn2nXW0r/ICaNjQzO8bzUt2wa7SFHo0N9zZHEHacUd2e1PmZSoeezJJuc/1+Aofr
	 chmKGTHceZpdxYX3e8vc887pcbZi7fPg0fbuXETxfkDlpEM5jUiEUkcA1uAdGJu1RhGwf
	 qjvGKprasf7intCm4FRjZnivC5TXDAIXyblNNvQziPYD/RDtmkVE6Y5MGcCUA/Khs5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243153;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=v+j65x4gbDESHhyNH4RkXTanWCtZ2LOAR4vwS7YDc54=;
	b=lvU9+Vyy6Q2/y77BHtlrmlHEj8vlj9ayFIerLhK2hoJgcnyTP/C6bMozLBl3/1xh7K3z
	 lP8DgDGuvS1yJBG8yD8kJ0zBD1UcxY70OBXi8I/EmNDGQBLhwknLkk4HdXUVvgWLguhQc
	 0kzNI4e54S154CTgCMRR5XpLkMfvfGBGjZztosZGwGT8e6Z86iGiWqOLAWv8itBLTbsay
	 Ro1dqZpnKKB7fBnuzuDeJKAb5npbHRcDW1WfLbSm1SNzNu43F/S7aPD/J6Wow3ftVZj/C
	 KgD/tMe/reLWoW59PQpKPQ0+rI5dQLTGceZCZ1JS5SuJB/0S73IG6jFfrV/42SCMmIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UR2bALAe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1282606A336;
	Sat, 21 Nov 2026 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UR2bALAe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12C31F000CA;
	Sat, 21 Nov 2026 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795243152;
	bh=v+j65x4gbDESHhyNH4RkXTanWCtZ2LOAR4vwS7YDc54=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UR2bALAeyomwejY0t3EwfQZY234g4AjUYEBvTbWVZ7YUfjsUi15urUJyU+CbmUy7U
	 lDhhw8NiYqoR0xzW4BAT6ESqKqUqxJbQK/7REmbdu1I/8lFif9FBCBqkeBWKGXTVp+
	 VQgsbQQR6CnecCoY79ixfeJ2jDqEUKXuv9mGIvyhlL8IhXbMgyvWqFno4689oZSFFc
	 Pp/rCnsmoGF4/AOQEv9lP83eDob0I9Q2X+Zw0fSPmbeVdb7gvdvqUolDgLW19MLnjV
	 My0quYTjo2xFE37PwV6Gei4M/E9qv8g5/0oCf4IRakKBCg+Fqbpqz0EyKFs5UWDUwO
	 GquTVe2atdbnA==
Subject: Re: [PATCH net-next v3 2/3] net: phy: realtek: add PTP clock support
 for RTL8127a
From: netdev-bot+sashiko@kernel.org
To: javen_xu@realsil.com.cn
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nb@tipi-net.de, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel@makrotopia.org, vladimir.oltean@nxp.com
Date: Sat, 21 Nov 2026 06:39:11 +0000
Message-ID: <179524315156.3135.8784098981517637477@kernel.org>
In-Reply-To: <20261117060120.1175-3-javen_xu@realsil.com.cn>
References: <20261117060120.1175-3-javen_xu@realsil.com.cn>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the clock 'is started from the system
  time unless it is already running', and the comment in…
- [Medium] The PHC is registered at PHY probe and stays available through
  /dev/ptpN at all times, but none of its callbacks (gettimex64,…
- [Low] The commit message only says a PTP hardware clock is registered.
- [Low] The Kconfig help calls the PTP clock 'optional', but a failure in
  the PTP block now breaks basic PHY operation.
- [Low] rtl8127a_ptp_config_init() assumes that nothing after the PHY
  driver's config_init resets the PTP counter.
- [Low] rtl8127a_ptp_hwtstamp_enable() ends by setting BIT(15) of VEND2
  0xa640, which the patch defines as RTL8127A_PHY_RST (lines 234-235).
- [Low] The driver never sets the hardware rate-adjust state to a known
  value.

--

net: phy: realtek: add PTP clock support for RTL8127a

This adds a PTP hardware clock for the PTP block in the RTL8127A internal
PHY (RTL8261C). The clock is read, set, stepped and frequency adjusted
through vendor MMD registers, and the patch hooks into the internal NBASE-T
PHY driver's probe, remove and config_init. The clock is seeded from the
system time in config_init when the counter looks like it has been reset.

> diff --git a/drivers/net/phy/realtek/realtek_main.c b/drivers/net/phy/realtek/realtek_main.c
> index ca2d515b77b36..e21d10e57a130 100644
> --- a/drivers/net/phy/realtek/realtek_main.c
> +++ b/drivers/net/phy/realtek/realtek_main.c

[ ... ]

> @@ -3413,7 +3428,9 @@ static struct phy_driver realtek_drvs[] = {
>  		.match_phy_device = rtl_internal_nbaset_match_phy_device,
>  		.name		= "Realtek Internal NBASE-T PHY",
>  		.flags		= PHY_IS_INTERNAL,
> -		.probe		= rtl822x_probe,
> +		.probe		= rtl_internal_nbaset_probe,
> +		.remove		= rtl8127a_ptp_remove,
> +		.config_init	= rtl8127a_ptp_config_init,

[Severity: Low]
This driver entry had no config_init before. After this change, the only
way config_init can fail is an error from the PTP block. The Kconfig help
calls the PTP clock optional, but rtl8127a_ptp_config_init() returns any
error from rtl8127a_ptp_gettimex64() or rtl8127a_ptp_settime(). That
includes -ETIMEDOUT from rtl8127a_ptp_poll(), which gives
RTL8127A_PTP_CLK_CFG_EXEC only 1ms to clear.

config_init is reached through phy_init_hw() on attach:

rtl_open()
  r8169_phy_connect()
    phylink_connect_phy()
      phy_attach_direct()
        phy_init_hw()
          rtl8127a_ptp_config_init()
            rtl8127a_ptp_gettimex64()
              rtl8127a_ptp_clkadj_sts()
                rtl8127a_ptp_poll()

It is also reached on resume, through mdio_bus_phy_resume() -> phy_init_hw().

Would a transient PTP block failure then stop the interface from being
opened or resumed?

In the same way, rtl_internal_nbaset_probe() returns the error from
rtl8127a_ptp_probe() as is. So an MDIO error in the disable sequence, or a
ptp_clock_register() failure, fails the whole PHY probe. Other PHY drivers
commonly fail probe when PTP registration fails, so the config_init path is
the bigger concern.

Could these paths warn and continue without a usable PHC instead?

>  		.get_features	= rtl822x_get_features,
>  		.config_aneg	= rtl822x_config_aneg,
>  		.read_status	= rtl822x_read_status,
> diff --git a/drivers/net/phy/realtek/realtek_ptp.c b/drivers/net/phy/realtek/realtek_ptp.c
> new file mode 100644
> index 0000000000000..9622571249f45
> --- /dev/null
> +++ b/drivers/net/phy/realtek/realtek_ptp.c
> @@ -0,0 +1,401 @@

[ ... ]

> +static int rtl8127a_ptp_clkadj_sts(struct rtl8127a_ptp *ptp,
> +				   enum rtl8127a_ptp_clkadj_mode mode,
> +				   struct ptp_system_timestamp *sts)
> +{
> +	int val, ret;
> +
> +	val = rtl8127a_ptp_read(ptp, RTL8127A_PTP_CLK_CFG);

[Severity: Medium]
Can this run while the RTL8127A PCI function is runtime suspended?

The PHC is registered at PHY probe and stays reachable through /dev/ptpN.
None of gettimex64, settime64, adjtime or adjfine make sure the MAC is
powered first. The register accesses end up as plain MMIO:

phy_read_mmd()
  rtl822x_read_mmd()
    rtlgen_read_vend2()
      __mdiobus_c45_read()
        r8169_mdio_read_reg_c45()
          r8168_phy_ocp_read()

r8169 runtime suspends the function 10 seconds after the interface goes down
or loses carrier:

drivers/net/ethernet/realtek/r8169_main.c:rtl8169_runtime_idle() {
    ...
	if (!netif_running(tp->dev) || !netif_carrier_ok(tp->dev))
		pm_schedule_suspend(device, 10000);
    ...
}

In D3hot, r8168_phy_ocp_read() would return 0xffff as data.
r8168_phy_ocp_write() is void, so after logging a timeout it drops the write
and the caller sees success. The EXEC poll below then times out on
CLK_CFG == 0xffff. Every PHC operation would fail with -ETIMEDOUT and add log
noise while the NIC is idle.

The device_link that phy_attach_direct() creates makes the PCI device the
consumer and the PHY the supplier, so PHC accesses do not resume the PCI
function. For comparison, r8169's own LED accessors wrap their MMIO in
pm_runtime_resume_and_get().

This needs runtime PM to be allowed for the device (power/control=auto, as
TLP or powertop --auto-tune set it). The existing realtek hwmon support for
this PHY has the same exposure, but the PTP path is new in this patch.

> +	if (val < 0)
> +		return val;
> +
> +	val &= ~RTL8127A_PTP_CLK_CFG_MODE;
> +	val |= RTL8127A_PTP_CLK_CFG_EXEC | mode;

[ ... ]

> +static int rtl8127a_ptp_hwtstamp_enable(struct rtl8127a_ptp *ptp, bool enable)
> +{
> +	int ret;
> +
> +	mutex_lock(&ptp->lock);
> +
> +	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_SYNCE_CTL,
> +				  RTL8127A_PTP_SYNCE_EN, 0);
> +	if (ret)
> +		goto out;

[ ... ]

> +	} else {
> +		ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_INER,
> +					  RTL8127A_PTP_INT_RX_TS |
> +					  RTL8127A_PTP_INT_TX_TS, 0);
> +		if (ret)
> +			goto out;
> +
> +		ret = rtl8127a_ptp_modify(ptp, RTL8127A_PTP_CTL,
> +					  RTL8127A_PTP_CTL_EN, 0);
> +	}
> +	if (ret)
> +		goto out;
> +
> +	ret = rtl8127a_ptp_modify(ptp, RTL8127A_PHY_RST_CTL, 0,
> +				  RTL8127A_PHY_RST);

[Severity: Low]
rtl8127a_ptp_probe() and rtl8127a_ptp_remove() both call
rtl8127a_ptp_hwtstamp_enable(ptp, false). That path clears
RTL8127A_PTP_SYNCE_EN, the INER RX/TX bits and RTL8127A_PTP_CTL_EN, and then
sets RTL8127A_PHY_RST here.

So every bind and unbind of the RTL8127A internal PHY now resets the PHY and
turns off SyncE. Is that intended?

The commit message only talks about registering a PTP clock. The v3
changelog only mentions adding defines for the PHY reset register.

If firmware or a PXE/UEFI environment brought the link up or enabled SyncE,
that state would now be lost at PHY probe rather than at ifup.

The follow-up patch "net: phy: realtek: add hardware timestamping for
RTL8127a" keeps this sequence and also runs it whenever timestamping is
toggled. Its commit message doesn't mention the reset either.

Could the commit message describe and justify the PHY reset and the SyncE
disable?

[Severity: Low]
The reset is asserted with a single read-modify-write of
RTL8127A_PHY_RST_CTL, and the function then returns. Nothing deasserts
RTL8127A_PHY_RST or waits for it to self-clear, the way genphy_soft_reset()
polls BMCR_RESET.

In rtl8127a_ptp_probe(), ptp_clock_register() comes right after this call
and exposes the PTP registers to userspace. r8169 also keeps accessing PHY
registers after PHY probe.

If the bit self-clears but takes a noticeable amount of time, could accesses
made during the reset be lost or see the pre-reset counter? That covers PHC
operations and the counter read in rtl8127a_ptp_config_init().

If the bit is level-sensitive, what releases it?

> +out:
> +	mutex_unlock(&ptp->lock);
> +
> +	return ret;
> +}

[ ... ]

> +int rtl8127a_ptp_config_init(struct phy_device *phydev)
> +{
> +	struct rtl8127a_ptp *ptp = phydev->priv;
> +	struct timespec64 ts;
> +	int ret;
> +
> +	if (!ptp)
> +		return 0;
> +
> +	/* Keep the clock running across a PHY re-init, a running PTP
> +	 * client would otherwise see it jump. Only start it from the
> +	 * system time if the counter has been reset.
> +	 */
> +	ret = rtl8127a_ptp_gettimex64(&ptp->info, &ts, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (ts.tv_sec >= RTL8127A_PTP_RESET_SEC)
> +		return 0;

[Severity: Medium]
Does this check do what the commit message says? The commit message says:

  The clock is started from the system tinme unless it is already running

The comment above says the clock is only started from the system time if the
counter has been reset.

The check tests neither of those. It tests whether the free-running counter
has been running for less than 10 seconds since its last reset.

config_init first runs from phy_init_hw() at ifup:

rtl_open()
  r8169_phy_connect()
    phylink_connect_phy()
      ...
        phy_init_hw()
          rtl8127a_ptp_config_init()

The counter starts at power-on, or at the PHY reset that
rtl8127a_ptp_probe() triggers during r8169 probe. More than 10 seconds
before the first ifup is normal after boot, and with a delayed or manual
ifup. In that case, wouldn't the PHC never be set and keep reporting
seconds since reset, close to 1970?

Also, rtl8169_init_phy() calls phy_init_hw() before r8169_hw_phy_config()
and genphy_soft_reset():

drivers/net/ethernet/realtek/r8169_main.c:rtl8169_init_phy() {
	phy_init_hw(tp->phydev);
	phy_resume(tp->phydev);
	r8169_hw_phy_config(tp, tp->phydev, tp->mac_version);
    ...
	genphy_soft_reset(tp->phydev);
}

Any counter reset caused by those later steps happens after this check, so
it would go unnoticed unless another config_init follows within 10 seconds.

The heuristic can also overwrite a clock that a user deliberately set below
10 seconds.

Is there a more reliable way to tell that the counter was reset than its
current value?

> +
> +	ktime_get_real_ts64(&ts);
> +
> +	return rtl8127a_ptp_settime(ptp, &ts);

[Severity: Low]
This seeds the PHC on the assumption that nothing after the PHY driver's
config_init resets the PTP counter. Does that hold with r8169?

As shown above, rtl8169_init_phy() runs phy_init_hw() before
r8169_hw_phy_config(). For RTL8127A, r8169_hw_phy_config() calls
rtl8127a_1_hw_phy_config(), which starts by loading the PHY MCU firmware:

drivers/net/ethernet/realtek/r8169_phy_config.c:rtl8127a_1_hw_phy_config() {
	r8169_apply_firmware(tp);
	rtl8168g_enable_gphy_10m(phydev);
    ...
}

genphy_soft_reset() runs after that, in rtl8169_init_phy().

Suppose either the firmware load or the BMCR soft reset clears the PTP
block. Then the value written here would be wiped on every open. The PHC
would run from about 0 until some later re-init happens to see tv_sec < 10.

Whether either step resets the counter depends on the hardware and can't be
confirmed from the code. The ordering between the two drivers isn't
documented, and the PHY driver has no hook that runs after the MAC driver's
PHY setup.

> +}
> +
> +int rtl8127a_ptp_probe(struct phy_device *phydev)
> +{

[ ... ]

> +	ptp->phydev = phydev;
> +	ptp->info = rtl8127a_ptp_info;
> +
> +	ret = rtl8127a_ptp_hwtstamp_enable(ptp, false);
> +	if (ret)
> +		return ret;
> +
> +	ptp->clock = ptp_clock_register(&ptp->info, dev);

[Severity: Low]
Should the rate-adjust registers be set to a known value before the clock is
registered?

rtl8127a_ptp_adjfine() is the only code that writes the rate (CFG_TIME
NS_LO/NS_HI, latched with RTL8127A_PTP_RATE_WRITE). Probe doesn't write a
zero rate before ptp_clock_register(), and rtl8127a_ptp_remove() doesn't
clear it.

The driver already assumes that PTP block state survives a PHY re-init. If
the latched rate also survives the probe-time reset, a rebind leaves the
hardware running at the last offset the servo applied. Examples are rmmod
and modprobe of realtek with the interface down, or a kexec or warm reboot.
That offset can be up to max_adj, about 488 ppm. The new ptp_clock would
meanwhile report a dialed frequency of 0.

Whether the rate register survives the PHY reset isn't verified. linuxptp
writes the frequency it reads back at startup, which hides most of the
effect. Writing a zero rate at probe would avoid the mismatch.

> +	if (IS_ERR(ptp->clock))
> +		return PTR_ERR(ptp->clock);
> +
> +	phydev->priv = ptp;
> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117060120.1175-1-javen_xu%40realsil.com.cn
