Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142083;
	b=X01ntDRQ1qtAiiipgWgcaRq1Hcb2nqHVqNioczT7l8w88QoKMxZ3povWezLEfNXQXlQG
	 C/qd/4DvBf0OFp9OKw3/i+axw7x/9ESJWCyGI9qjQJVRASmjQCkXU9N4AVNbYBW1WsPux
	 Zey5i0H1cSHIrljYYBZ5K2RZ4nfkRBayCtmncP+7knWT533fjZGqMNkQ14U6HrNEk0thZ
	 /X9WgxKtToncbNgGbsXsHT7Qox7YoNQXBZ4KePeFcrkgB/MZRBGmGE/pFnkGrPTPLO1tB
	 x4DaWE9QrAjAUYezpdq0sTTYJR5bJTMIzZUp5hNa+RU6/BaaMvrh1jjFqXX4OsgXi/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142083;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=bsyFVMK9dFqWOkB43a1AxHjsuAULzPU/rFR5mzwJ39Y=;
	b=iU9bSsZtG9GDIX6I3LfUeVItDPU9T5mZR/q5viChQGJE/ZMbg/gwTfIgksaqIMuKzA5I
	 3RkuNeiBm37y3chIVZAuYolfK/nod3xE3UFPOW1Rhi7uOGlzzjNrZtz3cx1eg67cirrvs
	 YB7DLJyKIRFD4S8LJwlOzKLrT/fGF42ZugcEJUrHwS2wRT4iwnJc0gNhAnYOTO9WDnajn
	 /tupmFgZB1k/KkBN4gngOJBqjeeuudFMKSbNClTtSo7x1/SJ2E+x4tFVe4YXprwHp9Xun
	 W8H+OUDA4y5Mk6xqPZUyid4eDS62n55w1Ygv5hlA24pyVGxtX6tG+cxLp2nrE/WZdhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cD/djRuj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D435760A262E;
	Fri, 20 Nov 2026 02:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cD/djRuj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3931F000CA;
	Fri, 20 Nov 2026 02:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142083;
	bh=bsyFVMK9dFqWOkB43a1AxHjsuAULzPU/rFR5mzwJ39Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cD/djRujLwBRg/D6dSNumVPRZnbX4TLQniZaSZ2Aut94V39Zkm0A2n7Y1Sgeep/YJ
	 U2O3Lvj2mgiQqSiwlfxUVaJwjh54QfHlJRMTtvd24Jr52E22x2IEBUTXrd0FbI0b5C
	 V2ZsLmXoPf6YFp4ExBwIie1L6+zsmYYJr7CP0Dyxhd0z8nJ2c6X+2Tt3LlCIPWtJPL
	 +/22JAHsHHD6ZHBkL8eOXoz8t+/tghIxWH8J8OF3hIwwHUuwfp47+0qZZZv1J+DjOB
	 1J5AzZtuj3V2PLKC8972MKhWSiYNBDXGtQpB4RmCBMAFbgPhmtCoY2J8RY7A5sLwHy
	 2ZMocnvoPW4Iw==
Subject:
 Re: [PATCH net-next v3 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, nb@tipi-net.de, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Fri, 20 Nov 2026 02:34:42 +0000
Message-ID: <179514208239.3136.3516165434506848044@kernel.org>
In-Reply-To: <20261117233149.1693881-5-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-5-florian.fainelli@broadcom.com>
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

- [Medium] In drivers/net/mdio/mdio-bcm-unimac.c, the patch's own comment
  in unimac_mdio_addr_c45() says some wait_func implementations…
- [Low] The commit message does not mention the change to
  unimac_mdio_resume() in drivers/net/mdio/mdio-bcm-unimac.c.

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This adds Clause 45 read and write callbacks to the UniMAC MDIO driver.
Each access does an ADDR cycle followed by a READ or WRITE cycle, and
MDIO_CFG is switched between C22 and C45 mode as needed. It also skips the
BMSR workaround read for children compatible with
"ethernet-phy-ieee802.3-c45".

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index df267bb826966..ec0f2e8070eeb 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -96,7 +102,53 @@ static int unimac_mdio_poll(void *wait_func_data)

[ ... ]

> +	/* Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0
> +	 * even when they timed out with the controller still busy. The data
> +	 * cycle must not be started before the ADDR cycle has completed, so
> +	 * make sure the controller is idle.
> +	 */
> +	return unimac_mdio_poll(priv);
> +}

[ ... ]

> @@ -107,8 +159,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
>  		return ret;
>  
>  	/* Prepare the read operation */
> -	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
> -		(reg << MDIO_REG_SHIFT);
> +	unimac_mdio_set_clause(priv, is_c45);
> +	if (is_c45) {
> +		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
> +		if (ret)
> +			goto out;
> +
> +		cmd = MDIO_RD_C45 | (phy_id << MDIO_PMD_SHIFT) |
> +			unimac_mdio_c45_devad(devad) |
> +			(reg & MDIO_C45_REG_MASK);

[Severity: Medium]
The comment in unimac_mdio_addr_c45() says bcmgenet_mii_wait() can return
0 while MDIO_START_BUSY is still set. The extra unimac_mdio_poll() runs
only after the ADDR cycle. Can the same early return happen on the C45
READ data cycle?

bcmgenet_mii_wait() returns 0 every time:

drivers/net/ethernet/broadcom/genet/bcmmii.c:bcmgenet_mii_wait() {
	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);
	return 0;
}

At probe time, the GENET ISR that calls wake_up(&priv->wq) is not
installed yet, because request_irq() happens later in bcmgenet_open().
On v1/v2, UMAC_IRQ_MDIO_EVENT is not enabled at all. In both cases these
waits depend only on the timeout. With HZ=100 the timeout is one jiffy,
which can expire at the next tick.

The RD_C45 command places reg in MDIO_CMD[15:0]. After wait_func(),
unimac_mdio_do_read() does this without checking MDIO_START_BUSY:

	cmd = unimac_mdio_readl(priv, MDIO_CMD);
	...
	ret = cmd & 0xffff;

If MDIO_CMD[15:0] still holds reg until the hardware writes the read
data, could an early return give the caller reg as the PHY data? This
would also happen before MDIO_READ_FAIL is latched. For example, a read
of MDIO_DEVS2 would return 6 and a read of MDIO_DEVS1 would return 5.
get_phy_c45_devs_in_pkg() could accept that as a plausible devs_in_pkg.

read_c45 is now set, and the non-DT GENET path leaves bus->phy_mask at 0.
So __mdiobus_register()->mdiobus_scan_bus_c45() issues these reads on
every address that has no C22 device. Could get_phy_c45_ids() then
register a bogus C45 PHY?

The write side looks similar. unimac_mdio_do_write() returns 0 after
wait_func() even if the C45 WRITE is still in flight. Could the next
access's unimac_mdio_set_clause() then flip the MDIO_C22 bit in MDIO_CFG,
or write its ADDR command to MDIO_CMD, while the previous frame is still
going out?

The C22 data cycle already returned early in the same way before this
patch. The reg-as-data result and the MDIO_CFG switch mid-frame are new,
though.

Would it make sense to have bcmgenet_mii_wait() return -ETIMEDOUT on
timeout, or to run the idle poll after every cycle and not only between
ADDR and DATA?

[ ... ]

> @@ -336,8 +437,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
>  static int __maybe_unused unimac_mdio_resume(struct device *d)
>  {
>  	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
> +	int ret;
> +
> +	/* MDIO_CFG is also modified by the MDIO accessors to switch between
> +	 * Clause 22 and Clause 45, which run under the bus lock.
> +	 */
> +	mutex_lock(&priv->mii_bus->mdio_lock);
> +	ret = unimac_mdio_clk_set(priv);
> +	mutex_unlock(&priv->mii_bus->mdio_lock);

[Severity: Low]
This isn't a bug, but the commit message doesn't mention this change to
unimac_mdio_resume(). The resume callback now holds
priv->mii_bus->mdio_lock around unimac_mdio_clk_set(), because
unimac_mdio_set_clause() does a read-modify-write of MDIO_CFG, the same
register that holds the clock divider.

The message covers the C45 accessors, the BMSR workaround skip and the
C45 scan. Could it also describe this locking change in the resume path?

>  
> -	return unimac_mdio_clk_set(priv);
> +	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117233149.1693881-1-florian.fainelli%40broadcom.com
