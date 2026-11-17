Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953834;
	b=Hur+kFu+xuBdFp9LHM5fFaHJnhG1OQPywsx3QUn2HOheqNEyTu0zHdCU3JBQ6Z37LkDw
	 uO1GzrZU5DApQyE0NSaky93YeEn0oXSZfJlVXoxwa/Tl9jY7qR/uLhQNhSM/vOfKnxe4Z
	 svbTF7F2tPPaRdjrvhB+9wFX/yBLM4vi/5ovOPUrGHz+7r7ogv7aGuPpeW52cGDcHLnQx
	 GFID6dXQx7j38q+nprnoiPGxQW/i7XXIAapJ2PZjSjw89dCyd34JOjOiKgjh1dclqxry5
	 t0jgKt0j5D84feuBKRuIfge0Vir/LyCCYmF3MGvLU5mPH0IzHaBN+n/FIm9NEMxry5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953834;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uxDbfAtxsihW1uNOfx4K6cvOBz6mE1gl4C/JUuE5JYE=;
	b=3GbF5ijlwBbnxO/wAx+0/L5f8vpfPokw82hwRXGJxTnpDG5g8Q+ascN0kTVHMUeo9veG
	 F1mxk+M75bnMG7xiJU9f7DrIvJf/PEdXraMr7U71oqaOAfRU6/zwuGgp0wCGx8zw9T0rC
	 o8AZqLSIGNCcUsNcm3sAV3zcZ+ilhy2FINzubnKvL8K9PIMGpEOTBEzIe6rU/m145F/Oy
	 p77aHHjZ0ufmtjkp8MRKAzqNQMBu+8NKrPYCXbF/eNGXFg3YMYu5+byOEI3CnGi13kaex
	 9/04IFwUIWIL7udY8jBVEAZIFNyFdhvB869k1I5myU0qKn76EC3YA4DVJWaj6hV1XOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T10+kn3j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D035606A330;
	Tue, 17 Nov 2026 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T10+kn3j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506761F000C7;
	Tue, 17 Nov 2026 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794953833;
	bh=uxDbfAtxsihW1uNOfx4K6cvOBz6mE1gl4C/JUuE5JYE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T10+kn3jLW2dwegfZ02GTw8EvaDVU1KFXq60fSGFP1WPLZLDtCpLinNyfeATNlGYk
	 FqAaYkdAKQPXEva0AANtdci7vmZmu9KIJ2wJGO8bQbHVHa9w3Nub1zoC/SHUrcEVLf
	 sLSTUZ7YmW9r5OWG171XIVkUa81WmRl3elvfPM34Fgv6MUaEQaXEOMEnT9qvCHdb+y
	 VxYmJpbm1tI3RtS4O2rYMiXtKOGioejFAJ22zqq9Hyd1QCk1RgX7jOU6NgXSji66MF
	 SXHnTdWM5G0dooJlPBBL4ukXcAtUsY0Wobs4xKLt/RL97RRaTHydHOGSt4xZ6RP1mL
	 /8S+T9XCNU5PA==
Subject: Re: [PATCH net-next v1] net: pcs: xpcs: add 10000baseCR_Full to
 10GBASE-R link modes
From: netdev-bot+sashiko@kernel.org
To: francesco@dolcini.it
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 francesco.dolcini@toradex.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 22:17:12 +0000
Message-ID: <179495383285.3136.3739586857677062012@kernel.org>
In-Reply-To: <20261116101644.83097-1-francesco@dolcini.it>
References: <20261116101644.83097-1-francesco@dolcini.it>
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

- [Medium] The commit message names the mechanism: a link mode the SFP
  layer reports for 10GBASE-R is missing from the XPCS 10GBASE-R list,…
- [Low] The patch fixes a user-visible functional bug but has no Fixes:
  tag and no stable Cc.

--

net: pcs: xpcs: add 10000baseCR_Full to 10GBASE-R link modes

This commit adds ETHTOOL_LINK_MODE_10000baseCR_Full_BIT to the
xpcs_10gbaser_features[] list. The SFP layer reports SFP+ direct attach
cables as 10000baseCR_Full, and with this change xpcs_validate() no longer
masks that mode away on the 10GBASE-R interface.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 6466e0ff2a98b..3378528e57f05 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -114,6 +114,7 @@ static const int xpcs_100gbasep_features[] = {
>  static const int xpcs_10gbaser_features[] = {
>  	ETHTOOL_LINK_MODE_Pause_BIT,
>  	ETHTOOL_LINK_MODE_Asym_Pause_BIT,
> +	ETHTOOL_LINK_MODE_10000baseCR_Full_BIT,

[Severity: Low]
Should this patch have a Fixes: tag and a stable Cc?

This commit added the xpcs_10gbaser_features[] array without
10000baseCR_Full:

  af8de1e307bf ("net: pcs: Add 10GBASE-R mode for Synopsys Designware XPCS")

Before this patch, a DAC module is rejected through this path:

phylink_sfp_config_optical()
  phylink_validate_mask()
    ...
      xpcs_validate()
        linkmode_and(supported, supported, xpcs_supported);

Only Autoneg, Pause and Asym_Pause are left after that. So
phylink_is_empty_linkmode() returns true, and phylink reports:

  "unsupported SFP module: validation with support %*pb failed\n"

Every kernel since af8de1e307bf seems to have this problem, including the
current stable and LTS trees.

>  	ETHTOOL_LINK_MODE_10000baseSR_Full_BIT,
>  	ETHTOOL_LINK_MODE_10000baseLR_Full_BIT,
>  	ETHTOOL_LINK_MODE_10000baseLRM_Full_BIT,

[Severity: Medium]
Is 10000baseT_Full also missing from this list?

sfp_select_interface() in drivers/net/phy/sfp-bus.c maps six link modes to
10GBASE-R:

	if (phylink_test(link_modes, 10000baseCR_Full) ||
	    phylink_test(link_modes, 10000baseSR_Full) ||
	    phylink_test(link_modes, 10000baseLR_Full) ||
	    phylink_test(link_modes, 10000baseLRM_Full) ||
	    phylink_test(link_modes, 10000baseER_Full) ||
	    phylink_test(link_modes, 10000baseT_Full))
		return PHY_INTERFACE_MODE_10GBASER;

After this patch, xpcs_10gbaser_features[] has the first five of these but
not 10000baseT_Full.

For a 10GBASE-T SFP+ module, sfp_parse_support() sets only 10000baseT_Full,
together with 10GBASER:

	case SFF8024_ECC_10GBASE_T_SFI:
	case SFF8024_ECC_10GBASE_T_SR:
		phylink_set(modes, 10000baseT_Full);
		__set_bit(PHY_INTERFACE_MODE_10GBASER, interfaces);
		break;

Suppose no PHY can be accessed on the module. Then
phylink_sfp_config_optical() validates that mask against 10GBASER, and the
linkmode_and() in xpcs_validate() clears 10000baseT_Full.

Wouldn't that reject the module the same way DAC cables were rejected before
this patch?

If a PHY is detected, phylink_sfp_config_phy() calls phylink_validate() with
PHY_INTERFACE_MODE_NA. The 10GBASER pass would again drop all the 10G copper
modes, so the module couldn't run at 10G over 10GBASE-R either.

The existing comment in xpcs_validate() also hints that this kind of masking
may not be the right approach:

	/* Populate the supported link modes for this PHY interface type.
	 * FIXME: what about the port modes and autoneg bit? This masks
	 * all those away.
	 */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116101644.83097-1-francesco%40dolcini.it
