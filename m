Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550651;
	b=az3PoEIFYpSuj39TvsdJLkmf6YNHafCcy2KFWqjo1rka1dJdECgVYOfRQi4S6mWDeXok
	 IhGsPPodzjJazRgLT7psmfuaESjAv0spMM0pw96PEXiFagHkgmy92i9QvI/whf6crDFOi
	 8tmPtbKYo/7wBdkK2ZuQp9cYkEIoHNvxdnNh324TH9J+qYqkEODsA7yP71niVDNjbpBKp
	 kJjkq1QpHSmbbo5jaHoUvGMXrUgwJtFUDg6fIaKzGE7FQS8noR0H3B4uH+Fyvx0aIn0Ly
	 mVXCqUL1Z2rifXXTfIV1x9KeVafAXieVvEloYC4E7mWPAbf0pUj7oKvFsfe3lGluKOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550651;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NJgrCbYf5ZnAx28JrKUhZHLhXQt7+fhD6OiPtOw/Y6M=;
	b=TSFZgyMmu3Bhqciv9u9ytSi8ZYMQ7xggwYVFGidorSNRSfTktVnR4dbnzHTh58mt5o00
	 hvuSts5qPJaj1NrmsgRmduYVmbWySXkDc8IsbsFpD2NQO+eX6NKn3m2ddDicqbu2ZQdg4
	 CM4OAKqY9IiLx7OhlXyMzje4DEXtVnSrEVWry2LR61URN03nr/i8aBL+IFOy29mMqryHI
	 uod2RRx0zjR+4nW5H3XLMqz4rjDthHojzX1g1xykA1iN9JXOEb9JPh3oMbXnlB+5DrAqb
	 v3cDzuVc9Qn6o7FJdPJIsXI3VB9aqWXtYFDm4xPPfMcevImG0zEVeHaxUII81SvlviQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ba7D17X9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A0606A31E;
	Tue, 24 Nov 2026 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ba7D17X9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0373C1F000D3;
	Tue, 24 Nov 2026 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550650;
	bh=NJgrCbYf5ZnAx28JrKUhZHLhXQt7+fhD6OiPtOw/Y6M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ba7D17X9KKc/O6jWOYNnrJadNorAyllIAwp1xUCI7rB2M6T3YxSy8vv6aVC1uwAHt
	 YQwUmv2MHN89o6oSInMqKhhr99fFdjLGwx8Hu9CISwqqhOvnN8GDpb0Al1LOmP8NLf
	 zsYrEUAMEeK1vCcRKthT2HGjO98j0KcXyLLlh+L+CZhP24+HZoLGEOV18AyKzne0O+
	 152AuayfzngfdBBvRL8qdRcwOxtuOcFZCSd6MoQqCEO8rshFcYt3+/H59c4fVTHK1j
	 YiCk5ANIjuywYqntqORwLaWg2r+8oQvZ5ePO/QdK1R97KFWfAynmMBcXmZJCmNy1Z7
	 /vRFkumQwy1oA==
Subject: Re: [PATCH net-next v5 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, nb@tipi-net.de,
 carlos.soto@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Tue, 24 Nov 2026 20:04:09 +0000
Message-ID: <179555064950.3135.13167713470470981003@kernel.org>
In-Reply-To: <20261120194318.3952487-2-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-2-florian.fainelli@broadcom.com>
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

- [Medium] In get_phy_c45_ids() (drivers/net/phy/phy_device.c), a
  devices-in-package read that fails with -EIO or -ENODEV during the MMD…
- [Low] phy_get_c45_ids() now returns -ENODEV when the devices-in-package
  read (and then the MMD 0 read) fails with -EIO or -ENODEV.

--

net: phy: Map C45 probe read errors to -ENODEV during bus scan

This commit maps -EIO and -ENODEV from the C45 devices in package reads in
get_phy_c45_ids() to -ENODEV, the same way get_phy_c22_id() does. The goal
is that mdiobus_scan_bus_c45() moves on to the next address when nothing
answers, instead of failing the whole bus registration. When an MMD read
fails this way inside the MMD search loop, the loop stops and only the
MMD 0 fallback is tried.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..2f17c9d4a2b9f 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -844,8 +859,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  				continue;
>  		}
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
> -		if (phy_reg < 0)
> -			return -EIO;
> +		if (phy_reg < 0) {
> +			ret = get_phy_c45_probe_err(phy_reg);
> +			if (ret != -ENODEV)
> +				return ret;
> +
> +			/* The MMD did not answer: treat it like a read of all
> +			 * Fs, which is what controllers that do not check the
> +			 * turnaround return, and go straight to the MMD 0
> +			 * probe below. Do not probe the remaining MMDs, each
> +			 * one costs two bus reads on a slow bus.
> +			 */
> +			devs_in_pkg = 0xffffffff;
> +			break;
> +		}

[Severity: Medium]
The comment says a failed MMD is treated like a read of all Fs. With the
break, doesn't it behave differently from a real all-Fs read?

On a real all-Fs read, the loop condition in get_phy_c45_ids() keeps
searching the later MMDs:

	for (i = 1; i < MDIO_MMD_NUM && (devs_in_pkg == 0 ||
	     (devs_in_pkg & 0x1fffffff) == 0x1fffffff); i++) {

Commit bba238ed037c ("continue searching for C45 MMDs even if first
returned ffff:ffff") added that on purpose, so that a device without a
PMA/PMD MMD is still found. One example is the Lynx PCS, which only answers
on MMD 3 (DEVS1=0x008a).

After the break, MMD 0 is the only probe left. If that read fails too,
get_phy_c45_probe_err() returns -ENODEV. mdiobus_scan_bus_c45() or
fwnode_mdiobus_register_phy() then skips the device without printing
anything.

Controllers report the same missing turnaround on an unimplemented MMD in
different ways. enetc_mdio_read_c45() returns all Fs:

	/* return all Fs if nothing was there */
	if (enetc_mdio_rd(mdio_priv, ENETC_MDIO_CFG) & MDIO_CFG_RD_ER) {
		...
		return 0xffff;

UniMAC with read_c45 (MDIO_READ_FAIL -> -EIO, added later in this series)
and mvmdio XSMI (!READ_VALID -> -ENODEV) return an error instead.

Could the same PHY or PCS be found behind ENETC but missed behind UniMAC or
mvmdio?

There is a second case. MMD 1 answers (for example, it reads 0), so the
loop goes on, and then MMD 2 fails the turnaround. If MMD 0 also fails,
isn't a device that has already answered skipped silently? That seems to
conflict with this part of the commit message:

  "so a PHY that fails midway is not silently skipped"

The commit message says the remaining MMDs are not probed. Would using
continue with devs_in_pkg = 0xffffffff instead of break keep the detection
rules from bba238ed037c, at the cost of the extra bus reads?

>  	}
>  
>  	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
> @@ -855,7 +882,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  		 */
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
>  		if (phy_reg < 0)
> -			return -EIO;
> +			/* returning -ENODEV doesn't stop bus scanning */
> +			return get_phy_c45_probe_err(phy_reg);

[Severity: Low]
phy_get_c45_ids() also takes this path. Its only caller is gpy_probe() in
drivers/net/phy/mxl-gpy.c, and it calls it for a PHY that has already been
found over C22 and matched to the driver:

	if (!phydev->is_c45) {
		ret = phy_get_c45_ids(phydev);
		if (ret < 0)
			return ret;
	}

If the C45 devices in package reads on MMD 1 and MMD 0 fail with -EIO,
gpy_probe() now returns -ENODEV. call_driver_probe() in drivers/base/dd.c
logs that only at debug level:

	case -ENODEV:
	case -ENXIO:
		dev_dbg(dev, "probe with driver %s rejects match %d\n",
			drv->name, ret);

Before this patch, -EIO was logged with dev_err() as "probe with driver %s
failed with error %d".

The commit message mentions this change. Is -ENODEV the right code for a
device that has already been identified, though? "No MMD responds" makes
sense during a bus scan. Here it turns a C45 access failure on a known PHY
into a silent match rejection. The binding ends up the same either way, so
what changes is how easy the fault is to diagnose.

>  
>  		/* no device there, let's get out of here */
>  		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120194318.3952487-1-florian.fainelli%40broadcom.com
