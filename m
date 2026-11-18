Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005426;
	b=M8Iq/cldUwScuLznp+HI+OU+FPt7/6S5u/x4RqVzLuOPnXZD016yFYuMmnM/Xz5EGUVG
	 DvXe7C+xOVUj56uDhhwWCGNI6L0jqiqmSE2dylLt9MAXRgpvHGtgCk7ebIbEFXCc6jb3a
	 3X14ZDYqxRUy4pS0N24X+ZlhJG7LacnNMVu39uk2vIc2D9d5XcQH6dqqOaR+NY0JbFRnY
	 LqnJyPlwUafCcjIfPwAQD8zP/id/EdOoqI/iPmKFFMmBqUMUqGiobOtWIC8WdamKGe/c6
	 A18mKE12zQACeNIBOdbyGEiJTAqlIj0RMrg4bYjTU8FtJIV9u53kDP+asqmHMHzd1UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005426;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MqSbvyRvQnUWLbN3NLan1HITKTpE6yvpgn21FdSc3Xw=;
	b=Zah/31ntGjzAkP0ucjlhvEHcN9FtLsziQh1bjt766cpS1xlQ4Y179bFUfLtDUPM8C+5a
	 Zi6fXBO9A6HLExNKf3sJflWf8YwYl7lTQX0DoNAEaD7wb/+LQX/48NwzKYgjO5sz3Po4j
	 zkRugg5Sg/wqg5WwKJUugHwCifxH4/IeqWvGcYEMTdBTl2xnkV89DKuOq4gIiTxtLmpa0
	 6aPWpkzkGVYcIT8rPRsfyXsthrCSRD5Nq7jLlqpkDF9tybXtnpe42mbxjXD4alp/Hh1go
	 gGRoJ17popbjJLkStdr9NvfDzmr6rGxQlpbgeDIwZFQ6I7KaznzSsvDw735ZiYk6Qkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbNbUK9b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B452606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbNbUK9b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988D71F000C4;
	Wed, 18 Nov 2026 12:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005426;
	bh=MqSbvyRvQnUWLbN3NLan1HITKTpE6yvpgn21FdSc3Xw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hbNbUK9bSMPxDETsn0n3IPi5Dt0EpFjvb5YFnx13HFVzJI5ej6VBFYV1646S8WbWy
	 fxPAb+G+WOySPH8fi80RU4+0+6mjzT0HKzPNxEd1uCa1bS6PfhtuNKeoLWXpZB+tSJ
	 SU8M1gOPZJQC0MCQ1hEZPzSQZzcQifSGLEFOlhxKd2mVJfU1X3I4/oDThCeGrf0v1M
	 DleEn33cPat4H5tKz5PHeL8IlHIFm/OsJ6f3vsZIpr9stXTCwgWDbp82YteAmOfIUk
	 2FThTlACAJLAuT74owqH15vVddKAVisfQQbpYgTHSXdyHfRXsaJqbSen7U0uxXd7fV
	 GSEuZ2PmsjPZA==
Subject: Re: [PATCH net-next] net: sfp: skip PHY probe on bridge-less OEM
 SFP-10G-T revisions A and B
From: netdev-bot+sashiko@kernel.org
To: pawlik.dan@gmail.com
Cc: linux@armlinux.org.uk, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 petr.wozniak@gmail.com, maxime.chevallier@bootlin.com, olek2@wp.pl
Date: Wed, 18 Nov 2026 12:37:05 +0000
Message-ID: <179500542517.3136.17245388104642383487@kernel.org>
In-Reply-To: <20261116093605.294365-1-pawlik.dan@gmail.com>
References: <20261116093605.294365-1-pawlik.dan@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new rev "B" branch in sfp_fixup_oem_10gt()
  (drivers/net/phy/sfp.c:494-495) is justified by an RTL8261BE module,…
- [Low] The revision check in sfp_fixup_oem_10gt()
  (drivers/net/phy/sfp.c:494-495) uses a raw 4-byte memcmp() against the…
- [Low] The patch fixes a user-visible problem: link-up takes over nine
  minutes, rtnl_lock is held for ~21 s per attempt and stalls other SFP…

--

net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and B

This patch gives the "OEM"/"SFP-10G-T" quirk entry its own fixup,
sfp_fixup_oem_10gt(). For vendor revisions "A" and "B" it sets
MDIO_I2C_NONE and still forces the 10GBASE-T SFI extended compliance
code; other revisions keep using sfp_fixup_rollball_cc(). This avoids a
RollBall PHY probe retry loop that runs for several minutes under
rtnl_lock on modules that have no I2C-to-MDIO bridge.

Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/

> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 915156743701b..066f11241afcc 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -482,6 +482,28 @@ static void sfp_fixup_rollball_cc(struct sfp *sfp)
>  	sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
>  }
>  
> +static void sfp_fixup_oem_10gt(struct sfp *sfp)
> +{

[ ... ]

> +	if (!memcmp(sfp->id.base.vendor_rev, "A   ", 4) ||
> +	    !memcmp(sfp->id.base.vendor_rev, "B   ", 4)) {

[Severity: Low]

Should this revision check accept NUL padding, the way the quirk lookup
does?

sfp_lookup_quirk() trims vendor_name and vendor_pn with sfp_strlen(),
which treats both ' ' and '\0' as trailing padding:

drivers/net/phy/sfp.c:sfp_strlen() {
    ...
	/* Trailing characters should be filled with space chars, but
	 * some manufacturers can't read SFF-8472 and use NUL.
	 */
    ...
}

Take an "OEM"/"SFP-10G-T" module with vendor_rev "A\0\0\0" or
"B\0\0\0". It would match the quirk entry, fail both memcmp() checks
here, and fall through to sfp_fixup_rollball_cc(). That brings back the
RollBall retry loop under rtnl_lock that this patch is meant to avoid.

One option is to check that sfp_strlen(sfp->id.base.vendor_rev, 4)
returns 1 and then test vendor_rev[0]. That would use the same padding
rule as the rest of the file.

[Severity: Medium]

Can the rev "B" match reach the module it is meant for?

The commit message bases it on an RTL8261BE module from the OpenWrt
report. Commit 8fe125892f40 ("net: phy: sfp: probe for RollBall
I2C-to-MDIO bridge in mdio-i2c") describes the same RTL8261BE module
like this:

    Its EEPROM reports vendor="OEM", part="SFP-10G-T-I", and -- critically --
    Vendor OUI 00:00:00 ...

That commit also added a separate SFP_QUIRK_F("OEM", "SFP-10G-T-I",
sfp_fixup_rollball) entry so the module would enter the probe path.
Revert b521003c27eb removed that entry again.

The SFP_QUIRK_F() entry here is matched by sfp_match() with
prefix=false, so the length has to match exactly:

drivers/net/phy/sfp.c:sfp_match() {
    ...
	if (prefix ? qs_len > len : qs_len != len)
		return false;
    ...
}

So "SFP-10G-T" never matches a PN of "SFP-10G-T-I". Such a module never
reaches sfp_fixup_oem_10gt(). In the current tree it matches no quirk at
all, so RollBall is not forced on it.

That means the rev B branch only affects modules whose PN is exactly
"SFP-10G-T" and whose vendor_rev is "B   ". The commit message says no
rev B module was tested. The rev 02 (AQR113C) module shows that bridged
versions of this PN do exist. If a bridged rev B "SFP-10G-T" exists, it
would now get MDIO_I2C_NONE and lose its PHY. Today it works with the
PHY attached.

Is there an EEPROM dump showing vendor_pn "SFP-10G-T" and vendor_rev "B"
for the bridge-less RTL8261BE unit? If not, would it be safer to drop
the rev B match?

> +		dev_info(sfp->dev,
> +			 "rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
> +			 sfp->id.base.vendor_rev[0]);
> +		sfp->mdio_protocol = MDIO_I2C_NONE;
> +		sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
> +		return;
> +	}
> +
> +	sfp_fixup_rollball_cc(sfp);
> +}

[ ... ]

> @@ -629,7 +651,7 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
>  	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
>  
> -	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
> +	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_oem_10gt),

[Severity: Low]

This isn't a bug, but should this patch have a Fixes: tag?

The entry that always forces RollBall here came from commit
324e88cbe3b7 ("net: sfp: add support for multigig RollBall
transceivers"). The commit message describes problems users can see:
over nine minutes to link up, rtnl_lock stalls that hold up other SFP
cages, and a WARN from phy_error_precise(). There is no Fixes: tag or
stable note to mark this for backporting.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116093605.294365-1-pawlik.dan%40gmail.com
