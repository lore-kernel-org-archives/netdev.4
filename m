Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206249;
	b=f1Uo/Z4p4mPFBBCBmUdWn1asBMr/exGpIOSVLIIPEk6UgFts8koEpubAupozV9CaseXd
	 mhbE1Ih9I7fWOH1NU6t/R5sM4wyIUTffjHGFfasaLOn4Tti83VxL0Dz7aWo8nqIbpP0Wd
	 ggi35VgJvZtoMn0abywcj3ScLWJ41yeH2IIRVb28qeaBpKJDvb6dpW4FYSSb2KYvjEqkX
	 vByJ6P3+bUQ6HwCbELI+UFW5lpRUNIk6S4QsveSzbgpq7q6hmQJs0aRqV2eH0v7nL+sYQ
	 HmzK4i144Ir7XpL2pVrVKh0NS7MVi6cKmpl1MG5Y9BiutdhVG8+WCdEDgBvNOAhQJrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206249;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8sGPwxDcWxVjAGsmOZOEmODTRujm9ilPC0+3rwHfGMc=;
	b=B6KTLx8lyRkIcbsAUcwnnbHg3d47Aizi6txMGIblzD27dYxCi+dDMc2FJzg2PD1i8Fcr
	 ofyeK445ccKRMyMvTVP9lN1PiQziK3lf091zrgVqMIxEJpA/Vv+UBvctSCDPCmXleQ2hT
	 HPQPoaB/zONwKQyUJb1LBf+D5zQelqlNrRfcDFgNg/bFbXGYGRulsdVCFQGmHkUkX6HlD
	 Ev+wQyEAYU+3rbDRSaRQpefDp8BGE/dNvMOUBZdc8pqW/jXKsy2sjXRLy2n1MPAJmpcPv
	 Fe6gLVeJKX/3Q9ru1W7nmPdleam7hQnmhfQI+iZGuUntPWKHAnVnliyYqHZFi1bDFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="LiECJw/0";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6418606A6E8;
	Fri, 20 Nov 2026 20:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6418606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=LiECJw/0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10056A0956;
	Fri, 20 Nov 2026 21:23:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795206241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8sGPwxDcWxVjAGsmOZOEmODTRujm9ilPC0+3rwHfGMc=;
	b=LiECJw/0qrTDqlAgTkAJyeA7xJGd9iOQPTtiGpP/d9r/xFJmDTl+xSZSMM2IA9CMKaevXe
	i9HypoliVQAkWWIu9VGQuNzr17xIc+pUUc/+prrjsLSKtxv4Ek4wxU5R6tkpi2mcKIdFmG
	0SZPmQjyIrsiClqbXI3jsCFfurYfVoDIM+zCjQGcZhIB7WQhjzDqSUdN38iXk5U/VWLRLD
	+WBQuqBqp9GDZS4txAbLphXCBd1/ESTlaLANVNpcnlBRrSPvZ1lexwiDn3N9z3729I/uhm
	EDlLxl385xTvGrLg57toLhO/VkvxT0ZgXuOxTi8xkrzbtJmvKkFjqB4sI0n+HA==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 21:23:59 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>, Justin
 Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v5 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
In-Reply-To: <20261120194318.3952487-5-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
 <20261120194318.3952487-5-florian.fainelli@broadcom.com>
Message-ID: <f99d99bfb3e3a4dce182cad801c05be8@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 20.11.2026 20:43, Florian Fainelli wrote:
> Add Clause 45 read/write support to the UniMAC MDIO bus controller 
> driver
> by implementing the read_c45/write_c45 bus callbacks. Each access 
> performs
> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
> under
> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
> MDIO_CFG is only written when the mode actually changes.
> 
> Since MDIO_CFG also holds the clock divider, unimac_mdio_resume() now 
> takes
> the bus lock around unimac_mdio_clk_set() so that it cannot race with 
> the
> read-modify-write done by the accessors. Resume may therefore wait for 
> an
> MDIO access that is in flight.
> 
> Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0 
> even
> when the controller is still busy. For C45 this would let the data 
> cycle
> or the next access's MDIO_CFG switch start while a frame is in flight, 
> and
> return the command bits instead of the read data. Check that the 
> controller
> is idle after every cycle, C22 ones included, and report a timeout 
> instead.
> 
> Also skip the BMSR workaround read in unimac_mdio_reset() for children
> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
> expected to respond to C22 accesses.
> 
> Note that providing read_c45/write_c45 also makes the MDIO core scan 
> for
> C45 PHYs at registration time, on addresses that are not masked and do 
> not
> already have a C22 device. This is not the case when the bus is 
> registered
> from a Device Tree node, which masks all addresses.
> 
> The platform device that GENET instantiates when it is probed without a
> Device Tree node (e.g.: ACPI) does not mask any address, so it is 
> scanned
> too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a 
> timeout
> per frame since GENET's interrupt is not registered yet when the bus is
> registered. That makes the scan slower at probe time on such systems, 
> the
> same way the C22 scan already is.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
>  drivers/net/mdio/mdio-bcm-unimac.c | 136 ++++++++++++++++++++++++++---
>  1 file changed, 126 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c 
> b/drivers/net/mdio/mdio-bcm-unimac.c
> index f8e5c1811d96..b01e99327b56 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c
> @@ -24,10 +24,16 @@
>  #define  MDIO_OP_SHIFT		26
>  #define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
>  #define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
> +#define  MDIO_ADDR_C45		(0 << MDIO_OP_SHIFT)
> +#define  MDIO_WR_C45		(1 << MDIO_OP_SHIFT)
> +#define  MDIO_RD_C45		(3 << MDIO_OP_SHIFT)
>  #define  MDIO_PMD_SHIFT		21
>  #define  MDIO_PMD_MASK		0x1F
>  #define  MDIO_REG_SHIFT		16
>  #define  MDIO_REG_MASK		0x1F
> +#define  MDIO_DEVAD_SHIFT	16
> +#define  MDIO_DEVAD_MASK	GENMASK(20, 16)
> +#define  MDIO_C45_REG_MASK	GENMASK(15, 0)
> 
>  #define MDIO_CFG		0x04
>  #define  MDIO_C22		(1 << 0)
> @@ -97,7 +103,60 @@ static int unimac_mdio_poll(void *wait_func_data)
>  					MDIO_CMD);
>  }
> 
> -static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
> +/* Wait for a cycle to complete. Some wait_func implementations (e.g.:
> + * bcmgenet_mii_wait()) return 0 even when they timed out with the 
> controller
> + * still busy, in which case MDIO_CMD[15:0] holds the command rather 
> than the
> + * data, and MDIO_CFG or MDIO_CMD must not be touched before the frame 
> is
> + * over. Make sure the controller is idle after every cycle.
> + */
> +static int unimac_mdio_wait(struct unimac_mdio_priv *priv)
> +{
> +	int ret;
> +
> +	ret = priv->wait_func(priv->wait_func_data);
> +	if (ret)
> +		return ret;
> +
> +	return unimac_mdio_poll(priv);
> +}
> +
> +static u32 unimac_mdio_c45_devad(int devad)
> +{
> +	return ((u32)devad << MDIO_DEVAD_SHIFT) & MDIO_DEVAD_MASK;
> +}
> +
> +static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
> +				int phy_id, int devad, int reg)
> +{
> +	u32 cmd;
> +
> +	/* Prepare the addr c45 operation */
> +	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
> +	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
> +	unimac_mdio_writel(priv, cmd, MDIO_CMD);
> +
> +	/* Start MDIO transaction */
> +	unimac_mdio_start(priv);
> +
> +	return unimac_mdio_wait(priv);
> +}
> +
> +static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool 
> is_c45)
> +{
> +	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
> +	u32 new_cfg = cfg;
> +
> +	if (is_c45)
> +		new_cfg &= ~MDIO_C22;
> +	else
> +		new_cfg |= MDIO_C22;
> +
> +	if (new_cfg != cfg)
> +		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
> +}
> +
> +static int unimac_mdio_do_read(struct mii_bus *bus, int phy_id, int 
> devad,
> +			       int reg, bool is_c45)
>  {
>  	struct unimac_mdio_priv *priv = bus->priv;
>  	int ret;
> @@ -108,14 +167,25 @@ static int unimac_mdio_read(struct mii_bus *bus, 
> int phy_id, int reg)
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
> +	} else {
> +		cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
> +			(reg << MDIO_REG_SHIFT);
> +	}
>  	unimac_mdio_writel(priv, cmd, MDIO_CMD);
> 
>  	/* Start MDIO transaction */
>  	unimac_mdio_start(priv);
> 
> -	ret = priv->wait_func(priv->wait_func_data);
> +	ret = unimac_mdio_wait(priv);
>  	if (ret)
>  		goto out;
> 
> @@ -137,8 +207,8 @@ static int unimac_mdio_read(struct mii_bus *bus, 
> int phy_id, int reg)
>  	return ret;
>  }
> 
> -static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
> -			     int reg, u16 val)
> +static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int 
> devad,
> +				int reg, u16 val, bool is_c45)
>  {
>  	struct unimac_mdio_priv *priv = bus->priv;
>  	u32 cmd;
> @@ -149,18 +219,50 @@ static int unimac_mdio_write(struct mii_bus *bus, 
> int phy_id,
>  		return ret;
> 
>  	/* Prepare the write operation */
> -	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
> -		(reg << MDIO_REG_SHIFT) | (0xffff & val);
> +	unimac_mdio_set_clause(priv, is_c45);
> +	if (is_c45) {
> +		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
> +		if (ret)
> +			goto out;
> +
> +		cmd = MDIO_WR_C45 | (phy_id << MDIO_PMD_SHIFT) |
> +			unimac_mdio_c45_devad(devad) | (0xffff & val);
> +	} else {
> +		cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
> +			(reg << MDIO_REG_SHIFT) | (0xffff & val);
> +	}
>  	unimac_mdio_writel(priv, cmd, MDIO_CMD);
> 
>  	unimac_mdio_start(priv);
> 
> -	ret = priv->wait_func(priv->wait_func_data);
> +	ret = unimac_mdio_wait(priv);
> +out:
>  	clk_disable_unprepare(priv->clk);
> 
>  	return ret;
>  }
> 
> +static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
> +{
> +	return unimac_mdio_do_read(bus, phy_id, 0, reg, false);
> +}
> +
> +static int unimac_mdio_write(struct mii_bus *bus, int phy_id, int reg, 
> u16 val)
> +{
> +	return unimac_mdio_do_write(bus, phy_id, 0, reg, val, false);
> +}
> +
> +static int unimac_mdio_read_c45(struct mii_bus *bus, int addr, int 
> dev, int reg)
> +{
> +	return unimac_mdio_do_read(bus, addr, dev, reg, true);
> +}
> +
> +static int unimac_mdio_write_c45(struct mii_bus *bus, int addr, int 
> dev,
> +				 int reg, u16 val)
> +{
> +	return unimac_mdio_do_write(bus, addr, dev, reg, val, true);
> +}
> +
>  /* Workaround for integrated BCM7xxx Gigabit PHYs which have a problem 
> with
>   * their internal MDIO management controller making them fail to 
> successfully
>   * be read from or written to for the first transaction.  We insert a 
> dummy
> @@ -191,6 +293,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
>  			if (addr < 0)
>  				continue;
> 
> +			if (of_device_is_compatible(child,
> +						    "ethernet-phy-ieee802.3-c45"))
> +				continue;
> +
>  			read_mask |= 1 << addr;
>  		}
>  	}
> @@ -302,6 +408,8 @@ static int unimac_mdio_probe(struct platform_device 
> *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;
>  	bus->reset = unimac_mdio_reset;
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
> 
> @@ -337,8 +445,16 @@ static void unimac_mdio_remove(struct 
> platform_device *pdev)
>  static int __maybe_unused unimac_mdio_resume(struct device *d)
>  {
>  	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
> +	int ret;
> 
> -	return unimac_mdio_clk_set(priv);
> +	/* MDIO_CFG is also modified by the MDIO accessors to switch between
> +	 * Clause 22 and Clause 45, which run under the bus lock.
> +	 */
> +	mutex_lock(&priv->mii_bus->mdio_lock);
> +	ret = unimac_mdio_clk_set(priv);
> +	mutex_unlock(&priv->mii_bus->mdio_lock);
> +
> +	return ret;
>  }
> 
>  static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
