Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503319;
	b=Ov+AqJKHHgURZ0vs0ACy4qgIRA0mk7sf2f1wKyZvv+/I4iFrCEVt9GHVyg640/8AtpYg
	 8uTLd8Pf+O6O91WJnP9+a47iQkSzUIVItpmMXB23a65A2tgEtKiTK76DwaWalez7sXeQ9
	 QHdkIEDOqYxUMwQ6kyLadr+BbQYp+eQo1Ky38wDaTLN6YKQAuEanvuarxfMoKK2+2zJPA
	 zCvRVqR/0NuSxR/gbKrRzY04CUF1EfYVSbR6617LRk7iEUFrJkNWSP9jYiNdks1BaECQ5
	 8SwvyQpQuakj6HaOh4z2P4Yfp6kkqW09GscrxwhjPSrG9dA4zGOi3dbDKmgZR1M0hfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503319;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4JZqLIRnYWUd+Os5N6g0nlJ9NBRY1lNzkMywnkqK/F4=;
	b=h9Eeyx9+Z0QwcVMowv/6dTAD8+klUtMAqfqqN9Rt3+t7z2QXWueHL1tc+eB0SwQiJWzr
	 KeZP6ONuEAaRgRZ2cQpcJ6ijI/sbXAJPm/Jy0myMMHhvajbO4Ogo2c9TtUMhaZC43gkKk
	 aYMiXm+miZHuVr70Zp9tHniijUuf9ir0Gz3frPKbccNaxybN3HY15Ftq408EEO0BYh/wq
	 cSYPcH5QiJGu1FngFJScBRaF758T3cP5cmEOu+8kr2KyRVQzsAfGidkjwrn6l9XZp7Cbo
	 JpQLhn5zim6x24V42NCnv6TXMK6CQlKawpT3pf+lZwosb52nlA+3fBLwmu7OAWrSQ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB9nImTe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B066606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB9nImTe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3351F000C6;
	Tue, 24 Nov 2026 06:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795503319;
	bh=4JZqLIRnYWUd+Os5N6g0nlJ9NBRY1lNzkMywnkqK/F4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BB9nImTe/Rw9Sif2SzHXvX7YurSYXXKNACLsIgA5r1quAEU5Yw2FUrBZjH2vweOMH
	 xmAHs61o26JuVFbB9Q1KZZm8lah0sbRCarogs4GGY805aDvfDhUZOzgSGxJpmJhRcT
	 PWxWjQl9YqDLhvXNX1kMDoYSZRbLWHoAlXWPE3x81OPfNOsG1F5A+u3ExYpgqPLHfa
	 1HQzyXU2t3escBxLGi8mHqE2uK9M26bJCHsY9im9s+CYwMq9miBZch5Eau7QHrOjBs
	 P9/iG59VHnaX/0r6oodhJax+U7Jy4KEm3WDe3jdUbtTTL6ojSjmza7eEGPINQ/tFx/
	 MkX0pqXXdRLTQ==
Subject: Re: [PATCH net-next v3 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
From: netdev-bot+sashiko@kernel.org
To: pawlik.dan@gmail.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kabel@kernel.org, petr.wozniak@gmail.com, maxime.chevallier@bootlin.com,
 olek2@wp.pl
Date: Tue, 24 Nov 2026 06:55:17 +0000
Message-ID: <179550331780.3135.5558299951406593344@kernel.org>
In-Reply-To: <20261120063756.3677554-3-pawlik.dan@gmail.com>
References: <20261120063756.3677554-3-pawlik.dan@gmail.com>
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

- [Medium] This is speculative.
- [Low] Missing Fixes: tag.

--

net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and B

This patch gives the "OEM"/"SFP-10G-T" quirk entry its own fixup. For a
single-character vendor revision of "A" or "B", the fixup sets
MDIO_I2C_NONE and forces the 10GBASE-T SFI extended compliance code, so the
module comes up in 10GBASE-R inband mode and skips the RollBall PHY probe
retries, which can take over nine minutes. All other revisions still get
sfp_fixup_rollball_cc().

Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/

> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 8406ad8ee786f..431c0f773d357 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -496,6 +496,30 @@ static size_t sfp_strlen(const char *str, size_t maxlen)
>  	return size;
>  }
>
> +static void sfp_fixup_oem_10gt(struct sfp *sfp)
> +{
> +	char rev = sfp->id.base.vendor_rev[0];
> +

[ ... ]

> +	if (sfp_strlen(sfp->id.base.vendor_rev, 4) == 1 &&
> +	    (rev == 'A' || rev == 'B')) {
> +		dev_info(sfp->dev,
> +			 "rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
> +			 rev);
> +		sfp->mdio_protocol = MDIO_I2C_NONE;

[Severity: Medium]
This concern is speculative. Is a one-character vendor_rev, together with
the vendor string "OEM", enough to conclude that a module has no RollBall
bridge?

"OEM" is a placeholder vendor name that many unrelated manufacturers use,
and "A" and "B" are very common revision values. With MDIO_I2C_NONE set
here, sfp_sm_add_mdio_bus() creates no MDIO bus, and sfp_sm_probe_for_phy()
takes this path:

    case MDIO_I2C_NONE:
        break;

So no PHY is ever probed or attached.

Commit 324e88cbe3b7, which added the original OEM/SFP-10G-T RollBall
quirk for RollBall/Hilink modules, does not record which revision it was
tested with. The rev B match is based only on the OpenWrt report, since no
rev B module was available for testing.

If an OEM/SFP-10G-T rev A or rev B module with a working RollBall bridge
does exist, it had its PHY attached before this patch, and after it the
PHY is never probed. On a module that does not rate-adapt, could a copper
link below 10G then come up with a host interface that does not match the
PHY's system-side mode?

The patch does narrow the match compared with the old quirk. The earlier
runtime bridge probe from commit 8fe125892f40 was also reverted.

Could the match use something more specific than the revision letter, or
could a missing bridge be detected some other way?

> +		sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
> +		return;
> +	}
> +
> +	sfp_fixup_rollball_cc(sfp);
> +}

[ ... ]

> @@ -643,7 +667,7 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
>  	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
>
> -	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
> +	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_oem_10gt),

[Severity: Low]
Should this patch carry a Fixes: tag?

The stall comes from this quirk entry, which forces MDIO_I2C_ROLLBALL with
a 1 second phy_t_retry on every OEM SFP-10G-T module. SFP_S_INIT sets
sm_phy_retries to R_PHY_RETRY (25), and SFP_S_INIT_PHY keeps retrying
sfp_sm_probe_for_phy() while it returns -ENODEV.

The quirk line was added by commit 324e88cbe3b7. Something like this
might work:

Fixes: 324e88cbe3b7 ("net: sfp: add support for multigig RollBall transceivers")

>  	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120063756.3677554-1-pawlik.dan%40gmail.com
