Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209464;
	b=Uxrhyp0c+XqxmJnTelO6RYu6D7kSDHZcjnSCCHC7vYPA4DFKoqWBhjGnYLWRdjA2ZXO3
	 NIVTXiZXbQDTZg7APWJQt1hV3TJTr6wbghBhZ+6NIK1ghfar+FNGteuJvjV9ZW5a7kcMx
	 bQIjjHANF/dbRPSVxBMaCoktNuZNlx+LMpgOw2wMXOGveGc+IyquaPrgJhcXxIZAhKEH9
	 giaR6qFo60mUTdMYF8YIkio0av1TV/ptsVFlV40sweOO3rmjRxzhew0URNktLRV05vsu1
	 ZRzouvN5Gd4Dh/smTfzVFsqO/49FkysFKoNfSzkri6ZMwukM/cwei12dfq/rRnlmf2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209464;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aruSc4nOT7OxSafy72XKe9N+IixJMjlArgP/iv4iezA=;
	b=WdCr5j238JbXttqD9MiuVw8Srn0In5X3UfJKkPeYkyJ1bbNC7NsTPikXN2Qy338fYGSu
	 V2aXMDZ6QCSUitRKbplsjYGDt9BREHVZC+1DXTmKEo59JW+mcOEhaYVDMNnrsiTwQ7qN6
	 wWlCVH3Quld5QiO8O9jFGyF8ebjyr2xpw4FowvUCPV4o6HxRtocvl/0Fi0mDkR6HJNlup
	 2Kd5H9aR5f0w10WxveoZ86qC/3fvbxe5hpiDkfEnTltMUVTikMsp1Xmlxr+shG7oDn/JB
	 dhMwGvAePIPafrEXO91goWSrPdB92WPRd/CTvo1NIwT26G36hGObmexYl2IfPijhgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iH4DPGTk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7060A2601;
	Fri, 20 Nov 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iH4DPGTk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7911F00A36;
	Fri, 20 Nov 2026 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209463;
	bh=aruSc4nOT7OxSafy72XKe9N+IixJMjlArgP/iv4iezA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iH4DPGTk4uHDfZWYu5WCjHeuYKjyjkkSleD2C9+KXVyUlsT1Z53/FP+sq18hGXALG
	 LnwloQrJvmDTixp2TbCdc+GOKnFKfzkLbXLbvx57hMcri+PX9EwB9E+ZXxAexi53Za
	 O4muY+kzxbfYfQH3OgE1vXXvgdb2hduC1HpRJ6VRHTNHH9cvRNfKXLWeJd2vy8bpPF
	 AQjTbwdSvBnIOx83lP9eGEKygx4GAIw4oZATp2NeXc7HsWUnXfZ5ZJqyjqvKjqZTD5
	 HcZ0RvnGghClKy+Ia7lb1JPTWoPs3wGJdEXtS/ud6edMmgxWv8gooZ36AMFvvfci+s
	 sYX3WfU7L2wXA==
Subject: Re: [PATCH net-next v3 2/2] net: sfp: sort OEM and Turris SFP quirks
From: netdev-bot+sashiko@kernel.org
To: github@bumblecito.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 21:17:42 +0000
Message-ID: <179520946280.3135.6308725941538199399@kernel.org>
In-Reply-To: <20261118162323.436219-3-github@bumblecito.com>
References: <20261118162323.436219-3-github@bumblecito.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message says the patch keeps the OEM entries "in the
  vendor table's alphabetical order", but the resulting sfp_quirks[]…
- [Low] After the reordering, the comment "// HORACO HC-10GE-113C uses
  Rollball protocol to talk to the PHY." (sfp.c:620) heads a block with…

--

net: sfp: sort OEM and Turris SFP quirks

This commit reorders the sfp_quirks[] table in drivers/net/phy/sfp.c. It
moves the UBNT, Walsun and YV entries to after the OEM block, and sorts
the OEM and Turris entries by part number. No quirk matches or fixups are
changed.

> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 960ac89cc2a0b..33349c3556b31 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -617,33 +617,24 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
>  	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
>  
> -	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
> -
> -	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
> -	// Rollball protocol to talk to the PHY.
> -	SFP_QUIRK_F("Walsun", "HXSX-ATRC-1", sfp_fixup_fs_10gt),
> -	SFP_QUIRK_F("Walsun", "HXSX-ATRI-1", sfp_fixup_fs_10gt),
> -
> -	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
> -
>  	// HORACO HC-10GE-113C uses Rollball protocol to talk to the PHY.
>  	SFP_QUIRK_F("OEM", "HC-10GE-113C", sfp_fixup_rollball),
> +	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
> +	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),

[Severity: Low]
Should there be a blank line after the HC-10GE-113C entry?

In the rest of sfp_quirks[], a comment applies to every entry up to the
next blank line. The Walsun, Fiberstore SFP-2.5G-T/SFP-10GM-T and Lantech
comments each cover two entries this way.

Because RTSFP-10 and RTSFP-10G now sit directly under it, the HORACO
comment reads as if it also describes those modules. They are different
modules, and they use sfp_fixup_rollball_cc, not sfp_fixup_rollball.

Before this patch, the HORACO comment covered one entry and was followed
by a blank line. The RTSFP entries were in the uncommented SFP-10G-T /
SFP-2.5G-* block. Could a blank line or a separate comment be added for
the RTSFP entries?

[ ... ]

> @@ -652,11 +643,20 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	// match the part as a prefix.
>  	SFP_QUIRK_F_PREFIX("OEM", "XGSPONST2001", sfp_fixup_potron),
>  
> +	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
> +
> +	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
> +	// Rollball protocol to talk to the PHY.
> +	SFP_QUIRK_F("Walsun", "HXSX-ATRC-1", sfp_fixup_fs_10gt),
> +	SFP_QUIRK_F("Walsun", "HXSX-ATRI-1", sfp_fixup_fs_10gt),
> +
> +	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
> +
>  	SFP_QUIRK_S("TP-LINK", "TL-SM410U", sfp_quirk_oem_2_5g),

[Severity: Low]
The commit message says:

    Keep OEM entries together in the vendor table's alphabetical order

Is the vendor order alphabetical after this move? The UBNT, Walsun and YV
block now sits between OEM and TP-LINK, which gives this vendor order:

    ODI, OEM, UBNT, Walsun, YV, TP-LINK, Turris, XikeStor, ZOERAX

In alphabetical order it would be:

    ODI, OEM, TP-LINK, Turris, UBNT, Walsun, XikeStor, YV, ZOERAX

These are the only lines that this patch moves between vendors, and they
are still out of order. Would it make sense to put UBNT and Walsun after
Turris, and YV after XikeStor? Then a later patch would not need to move
the same lines again.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118162323.436219-1-github%40bumblecito.com
