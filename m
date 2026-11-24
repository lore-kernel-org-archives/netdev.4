Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512844;
	b=deLV5qXflpT8Ob0I+cRe5EBSox1JVlq5MITM958svMgOFwXeOUE414JmaXLM2zfpLFHw
	 w+LJ1eNa5BkTrWxM/d1idpm8pS5DT2eWThPycguFxWjaeAjVUQn7N7Mj0tWGUAAcILcDo
	 Y0mh9RpS3MG7bvz8tEQIrQunoetSwDGzQ+knZx8dT1s494JQS14XYEW9wqychgRgbeyBK
	 ZOTdYLFUuITn/63mZJC4WlOEMlMa6SHSU4QcF77mZF6GziM9DmwA+Zflogr4HqjYd219S
	 5Wbvm61aeYKKJjV3JZumHBI+R+GeSx6yK6xhmTnD6f1eUabnl1MwitrKGT1cOH1qjHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512844;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JmZNKyGNzoJnbzxEBlYVfscQifvkDBMRaWGqmZLCDec=;
	b=Yv6ukjNzX+JDmgErLBQxpm3Csasna58nDy8kWl7tJ5msaprkf37iMLJmGqqBbA/W+njo
	 AF0wnQZPyeHCKvf5LV5zjYUlbHnyx3Vqf4QvKRrc4/0raA31pY/BjbzwSY59MJwdg7ziU
	 ++/Hv4aFxuauyX68u0vmEU9qCSEggHjtAuq6DRIRC9xbGAkmKKLhChpshmaVJro3SArI/
	 jUfm7js7mdep0D9CRie9TnmQKTPgsuYYwDeaNfAWCINaRzodcIq6miJ4ooRKoGM9p4+Fy
	 SRnSAJuk07u5lEN5TGICEUEYuShi4Z6Tu4IuWsFWk2B5CaeaD3qK3UwvdaETRfNMvDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqZxKgDg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BF2606A68E;
	Tue, 24 Nov 2026 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AqZxKgDg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDA31F000E6;
	Tue, 24 Nov 2026 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795512843;
	bh=JmZNKyGNzoJnbzxEBlYVfscQifvkDBMRaWGqmZLCDec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AqZxKgDgJNdsFBu4VJkX+2UmaSNWbhKaQpYn8aM9KrMOqmiF3X7E+XlFta/RpUXs5
	 J89yL9ORqBl2lZjYigehLi/3Ifj823RSDcd5FeGTBL67SKheEdD8QXtdqC05Psb7Pa
	 GhWeTMKyhWrrdX9cwjizzhNv/R3g1uwEyfMMzpPtppFXjBhlPXd5lBlY/62QK5poJ4
	 pk3efWed2JcTsMExdjBc8UQ/3g6kfGcqTwD2ohBDVhG3ep3qWV4aJMF0FpXxxhNfsG
	 SUoJITkbrkuwI1tCRbrcga83Clv5jmMWyWATXBMOkCm0ewXiCauxuKCocZzPAHV3C8
	 3E60pkTgK/haA==
Subject: Re: [PATCH net v2 2/2] net: ibm: emac: read the fixed-link status
 before adjusting the link
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, rosenp@gmail.com,
 jacob.e.keller@intel.com, daniel.machon@microchip.com, chunkeey@gmail.com,
 kees+treewide@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
Date: Tue, 24 Nov 2026 09:34:02 +0000
Message-ID: <179551284212.3135.10573123366533276098@kernel.org>
In-Reply-To: <20261123093201.770552-3-xiaolinkui@126.com>
References: <20261123093201.770552-3-xiaolinkui@126.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix does not cover 10 Mbit/s full-duplex fixed links.

--

net: ibm: emac: read the fixed-link status before adjusting the link

For a fixed link, emac_init_phy() never starts the PHY state machine, so
after d99b408ed8e5 emac_adjust_link() copied SPEED_UNKNOWN/DUPLEX_UNKNOWN
into dev->phy. This patch calls phy_read_status() once after
of_phy_connect(), so the emulated swphy registers fill in speed, duplex
and pause. It also disconnects the PHY if the read fails.

> diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
> index ba02cf878a124..8b9ffbcd2ff42 100644
> --- a/drivers/net/ethernet/ibm/emac/core.c
> +++ b/drivers/net/ethernet/ibm/emac/core.c
> @@ -2677,9 +2677,16 @@ static int emac_init_phy(struct emac_instance *dev)
>  				return res;
>  
>  			if (!of_phy_connect(ndev, np, &emac_adjust_link, 0,
> -					    dev->phy_mode)) {
> +					    dev->phy_mode))
> +				res = -EINVAL;
> +			else
> +				res = phy_read_status(ndev->phydev);

[Severity: High]
Does this resolve a 10 Mbit/s full duplex fixed link? The commit message
says:

  The PHY is emulated, so genphy_read_status() resolves speed, duplex
  and pause from the registers swphy generates out of the device tree
  status.

For 10 Mbit the swphy tables in drivers/net/phy/swphy.c never set the
10 Mbit BMSR ability bits. Only the LPA register gets them:

static const struct swmii_regs speed[] = {
	[SWMII_SPEED_10] = {
		.lpa   = LPA_10FULL | LPA_10HALF,
	},
	...

static const struct swmii_regs duplex[] = {
	[SWMII_DUPLEX_HALF] = {
		.bmsr  = BMSR_ESTATEN | BMSR_100HALF,
	...
	[SWMII_DUPLEX_FULL] = {
		.bmsr  = BMSR_ESTATEN | BMSR_100FULL,
	...

genphy_read_abilities() builds phydev->supported from BMSR only, so no
10baseT mode ends up in supported or advertising. Then, in
phy_read_status()->genphy_read_status():

  genphy_read_lpa()
    lp_advertising gets 10baseT_Full plus the pause bits
  phy_resolve_aneg_linkmode()
    lp_advertising & advertising has no speed mode, so
    phy_caps_lookup_by_linkmode() returns NULL and speed/duplex
    stay SPEED_UNKNOWN/DUPLEX_UNKNOWN
  phy_resolve_aneg_pause()
    only runs for DUPLEX_FULL, so pause stays 0

phy_read_status() still returns 0, so the error path is skipped, and
emac_adjust_link() copies DUPLEX_UNKNOWN and pause = 0 into dev->phy.

emac_configure() only sets full duplex and flow control when duplex is
DUPLEX_FULL:

	else if (dev->phy.duplex == DUPLEX_FULL)
		mr1 |= EMAC_MR1_FDE | EMAC_MR1_MWSW_001;
	...
	if (!emac_has_feature(dev, EMAC_FTR_NO_FLOW_CONTROL_40x) &&
	    dev->phy.duplex == DUPLEX_FULL) {
		if (dev->phy.pause)
			mr1 |= EMAC_MR1_EIFC | EMAC_MR1_APP;

So for a fixed-link node with speed 10 and full-duplex, wouldn't the MAC
still be programmed half duplex with flow control off? That is the
symptom the commit message describes, and it worked before d99b408ed8e5.
100 and 1000 Mbit links resolve correctly. 10 Mbit half duplex only comes
out right because the unknown values fall back to 10/half.

Could swphy report the 10 Mbit abilities in BMSR? Alternatively, could
the PHY-less path take speed, duplex and pause directly from the
fixed-link status, or at least check that phydev->speed and
phydev->duplex were resolved before using them?

> +
> +			if (res) {
> +				if (ndev->phydev)
> +					phy_disconnect(ndev->phydev);
>  				of_phy_deregister_fixed_link(np);
> -				return -EINVAL;
> +				return res;
>  			}
>  
>  			emac_adjust_link(ndev);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123093201.770552-1-xiaolinkui%40126.com
