Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795243151;
	b=2nCicrDXvajv8YD2P4zMLZiE82DdF1BT6t4czz3lg5IyVgN7B6vYyuQHFwSj/RI5Sk1i
	 8wn7oT9YjifgYlWEUEccAEdxPZ70uYzQiJKQrFuBbHj3blET8dVbtxIYyFJItTMF9u+oB
	 YbAgAu2NYC9ElbWp/ODBqZAw9dEDnDJkpSDRKC74nEQ/XyqAWj5iBSfLIFe53RsZSkvVN
	 wTFXjnZlRL3GywLiRZqNoTBuLh5RPVlfxgwzcnloNkAS6X+bzqEjYdvBi7N7TIu/X5m6Y
	 BkD7b7f7zE2l+eAMwmFm0YaqIyXNG9VwVOiq/lWIoHkRON6pfsFMGgqybwfkdmwAxnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795243151;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1c2Y6DLdeSlq9tmF9TErs1z/CKCH7BIITyy/dFDt3II=;
	b=CWJK60BuL8VVuosxhhE5gM5RbNt47XAxgOPCh6kAbYakWN+jhYZ/kxUziqv19Sttd4eG
	 h5wIbAOqfoSCBloBvXWnT+hBEKBh/VIyaWtiVgsYUsXoWEv3wxrm7V90Jy/wMukPSMqZb
	 XBPdM8eNq1PLz3O4ZXUMz5jhaCDUQI89+cRFtQnc3rtCHFYUkU9VIp/xrClBWGZhBLrIw
	 RNYVQNteAzbtOUXZ6ukEqkkcyrUOyAs6PatInbO9TYlpD5Id95ckSc8IOgPtnPp1YaBKv
	 P7QJoeXT8VEUjgwcw2l3PYEWiuswmCg/USkC9O9aWI1k+CYVMzaQyiWGQ/Zh5daubCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZsaSQ6t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F4606A335;
	Sat, 21 Nov 2026 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZsaSQ6t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0DA1F000C4;
	Sat, 21 Nov 2026 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795243151;
	bh=1c2Y6DLdeSlq9tmF9TErs1z/CKCH7BIITyy/dFDt3II=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AZsaSQ6t1emdwE7mIuZN2eVvxba+/PsajWxmb6M+38yW0cIXiOOEgXn18+mbBplxH
	 CR4gR1F+8jQaAN3uT7nOjIJPepH+JH44IVCJy90SNoaaIcY0PQiMc0GPYpb2i4eENR
	 KuVPVNys0mJSW1AQ2sUorrefQ13UT/SaP0d7LrQvcVsu0S0QJoNY9TsNRYfnmc2J/f
	 eHsxj5tNSAdCOzi6QuE85MmUE7eOUr2cmW7BFnw7CQ2Q4YU9YyfiOFZmb4wwhnlFYl
	 VWx7bAiFuGrJVQvKFpmJswJtnE+d14WdTVzzCQ0+p6coNtBSLC1MWl761FycAeQq7D
	 8Hx3Xr4mgv0yQ==
Subject:
 Re: [PATCH net-next v3 1/3] r8169: hold MDIO bus lock while loading firmware
From: netdev-bot+sashiko@kernel.org
To: javen_xu@realsil.com.cn
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 nb@tipi-net.de, maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel@makrotopia.org, vladimir.oltean@nxp.com
Date: Sat, 21 Nov 2026 06:39:10 +0000
Message-ID: <179524315014.3135.14234749504647866339@kernel.org>
In-Reply-To: <20261117060120.1175-2-javen_xu@realsil.com.cn>
References: <20261117060120.1175-2-javen_xu@realsil.com.cn>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] NULL pointer dereference in r8169_apply_firmware()
  (drivers/net/ethernet/realtek/r8169_main.c) on PHY-less RTL8116AF…
- [Medium] r8169_apply_firmware() drops mdio_lock (line 2692) before it
  restores the PHY page shadow `tp->ocp_base = OCP_STD_PHY_BASE` (line…

--

r8169: hold MDIO bus lock while loading firmware

This patch takes the MDIO bus lock around rtl_fw_write_firmware() in
r8169_apply_firmware(). The firmware sequence accesses PHY registers
directly and bypasses phylib, so the lock is meant to stop other phylib
users from interleaving their accesses with that sequence.

> diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
> index f151ab6813932..34ea4640467cf 100644
> --- a/drivers/net/ethernet/realtek/r8169_main.c
> +++ b/drivers/net/ethernet/realtek/r8169_main.c
> @@ -2686,7 +2686,10 @@ void r8169_apply_firmware(struct rtl8169_private *tp)
>  
>  	/* TODO: release firmware if rtl_fw_write_firmware signals failure. */
>  	if (tp->rtl_fw) {
> +		/* Keep phylib users (hwmon, PTP) off the bus meanwhile. */
> +		phy_lock_mdio_bus(tp->phydev);

[Severity: High]
Can tp->phydev be NULL here?

phy_lock_mdio_bus() dereferences phydev->mdio.bus->mdio_lock and does not
check for NULL. Further down, the same function already guards its phylib
call:

	/* PHY soft reset may still be in progress */
	if (tp->phydev)
		phy_read_poll_timeout(tp->phydev, MII_BMCR, val, ...

That check came in with commit dab515216deff5 ("r8169: add support for
RTL8116af"). It suggests this function is expected to run with rtl_fw set
and phydev NULL on 8116AF.

On an RTL8116AF (RTL_GIGA_MAC_VER_52), rtl_get_sfp_mode() returns
RTL_SFP_8168_AF. rtl_init_one() then skips the MDIO registration:

	if (tp->sfp_mode == RTL_SFP_NONE) {
		rc = r8169_mdio_register(tp);

so tp->phydev is never set.

The VER_52 chip entry has FIRMWARE_8168FP_3 as its firmware name.
rtl_open() calls rtl_request_firmware() whether or not a PHY exists, so
tp->rtl_fw is set whenever that firmware file is installed.

rtl_hw_start_8117() checks tp->phydev before its own PHY access, but it
calls the firmware helper unconditionally:

	/* firmware is for MAC only */
	r8169_apply_firmware(tp);

So interface bring-up appears to reach the new lock call with a NULL
phydev:

rtl_open()
  rtl8169_up()
    rtl_reset_work()
      rtl_hw_start()
        rtl_hw_start_8117()
          r8169_apply_firmware()
            phy_lock_mdio_bus(NULL)

Runtime resume and the rtl_task reset path get there too.

Would it work to take and drop the bus lock only when tp->phydev is
non-NULL? Without a phydev there are no phylib bus users to keep out.

>  		rtl_fw_write_firmware(tp, tp->rtl_fw);
> +		phy_unlock_mdio_bus(tp->phydev);
>  		/* At least one firmware doesn't reset tp->ocp_base. */
>  		tp->ocp_base = OCP_STD_PHY_BASE;

[Severity: Medium]
Should the tp->ocp_base restore move above phy_unlock_mdio_bus()?

Right now the bus lock is released before the page shadow left by the
firmware is reset. That makes the restore an unlocked write to state that
the Clause 22 bus ops depend on.

The firmware can change tp->ocp_base in two ways:

  - r8168g_mdio_write() with reg 0x1f
  - mac_mcu_write() with reg 0x1f after PHY_MDIO_CHG, which leaves a MAC
    OCP base in it

The comment above the restore says at least one firmware doesn't reset
the value.

Every C22 access builds its address from that shadow:

r8168g_mdio_read() {
	...
	if (tp->ocp_base != OCP_STD_PHY_BASE)
		reg -= 0x10;

	return r8168_phy_ocp_read(tp, tp->ocp_base + reg * 2);
}

A C22 phylib user can be blocked on mdio_lock while this runs. One example
is the PHY state machine running read_status after a link change, during
the rtl_task reset or runtime resume. That user can wake as soon as
phy_unlock_mdio_bus() runs and do its BMSR/BMCR access before the restore.
The access would then go to a firmware vendor page or a MAC OCP derived
address.

Paged accesses have a worse case. phy_select_page() reads reg 0x1f and
gets the stale page from the shadow, and phy_restore_page() writes it back
later. If the unlocked restore runs between those two calls, the access
meant for the selected page goes to the standard page instead. The stale
page is then written back, and later C22 accesses keep going to the wrong
place.

This only affects C22 users. The hwmon and PTP users go through C45 with
absolute OCP addressing.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117060120.1175-1-javen_xu%40realsil.com.cn
