Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319661;
	b=Q+u9ipGvjgt1nC4/d3RBnOTy6SVrh9W2YFRhOQse9bYBx0UWcptJrm7rGRv2EB81XLTd
	 Zg3GauS0lP1PEh/mzPhAGxzBpSy0K/fk7O3U3h+Vz0XQu5jXJNs23MY/mq06gs3qXBIYd
	 87TrNgRWOhqHU4B1aBnZD1l9zyQWh5TtOnl0GIAop4jsQ0MnFXoosL6tjKTZZd0G4GwNL
	 xf0BvFr4v27EJl25P50wJNbV9IjEZnvEoC9cKNEOXR+AlVJODu9evFXfEDW2vDTUcIkdu
	 dND5vDc6kuFrzitGqopaff5moySiccazFjT66PmGyGceNbUV0l2YIVr5SZSDanCL+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319661;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fQMcubyEGLJDkcZ4DTTyA3Id5oJxjLW06dRC7LXqSD8=;
	b=ijKi+I/tJczaljxE7+eaxLiR7RFUOK8hrGMm3iEhNMXqIfVo3aLcQcD8oU0KMZ83fSxL
	 csI4sRrxJF/sOoDt7S4drWTMue/8utEy93FOKjZplqwfTXxf2IYatAioEAJPXJIIiPd8R
	 qqP7BqH9MVzKEmKAUROzbuy4xhMUQ6bzV3gTJ1yHtV8D+rvK6Afr735IvKqFO5Fgv1UJu
	 ct2EalAXUSIigY5oCFywajsIh4lWEeMOJmNykwP6XMQTwdesuKMhPsF7SDe800n+i966h
	 7HWw4ypGX8mdNk/KTEsPF272YMubaIphugdIvEdm8wV7KFvjk7W1OokwujyszqyVs9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxXEN2wD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154A606A320;
	Sun, 22 Nov 2026 03:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxXEN2wD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A4C1F000C0;
	Sun, 22 Nov 2026 03:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795319661;
	bh=fQMcubyEGLJDkcZ4DTTyA3Id5oJxjLW06dRC7LXqSD8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PxXEN2wDc6p5i8Oq29JkzmrQ127/499ioh0oRAdUIOdTh5Y9eoHqd36eBSM7czt8a
	 lgaYPCl24VbcfHdXXJgYqCy/ZVqlGOpR4d2nv4zutDBPnRuuEjraTpc/Rn5rsmK9BF
	 d0mmNxIkbkCL2M6H9/Q/ROzWZzlJAL6sMxpcU+eC5E/yk0gOpoq5946mJZ/Jt8w8UI
	 kGZpxkhuGaC4q+jHOtN2IyWH0LwlkeIZS70pBenXcgKv+6zvP7jzXm7GgjC0OBiEfN
	 jQkseteln6dlqaELg/HokrXVlt9k8rfZOf6MWQyBSXoAoOzYtPIayiG6KeJ2iwFfl8
	 BSThVr8jwSlLQ==
Subject:
 Re: [PATCH net-next v2] net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
From: netdev-bot+sashiko@kernel.org
To: github@bumblecito.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Sun, 22 Nov 2026 03:54:20 +0000
Message-ID: <179531966042.3135.7432680981389421641@kernel.org>
In-Reply-To: <20261118034510.434732-1-github@bumblecito.com>
References: <20261118034510.434732-1-github@bumblecito.com>
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

- [Medium] The new sfp_quirks[] entry SFP_QUIRK_S("ODI", "DFP-34X-2C3",
  sfp_quirk_2500basex) in drivers/net/phy/sfp.c (lines 617-618) has a…
- [Low] The new ODI DFP-34X-2C3 entry uses only sfp_quirk_2500basex
  (drivers/net/phy/sfp.c:485-491).

--

net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3

This adds an sfp_quirks[] entry for the ODI DFP-34X-2C3 XPON SFP module so
that sfp_quirk_2500basex() advertises 2500base-X for it. It was tested on
a Horaco ZX-SWTGW2C8F switch with speed and duplex forced and
autonegotiation disabled.

> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 915156743701b..960ac89cc2a0b 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -614,6 +614,9 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	SFP_QUIRK("Lantech", "8330-265D", sfp_quirk_2500basex,
>  		  sfp_fixup_ignore_los),
>  
> +	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
> +	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),

[Severity: Medium]
Should this entry also use sfp_fixup_ignore_tx_fault_and_los()?

SFP_QUIRK_S() sets .fixup to NULL. The SFP state machine therefore still
acts on this module's TX_FAULT and LOS signals. The other Realtek RTL960x
GPON/XPON ONT sticks in sfp_quirks[] ignore both signals:

	SFP_QUIRK("HSGQ", "HSGQ-XPON-Stick", sfp_quirk_2500basex,
		  sfp_fixup_ignore_tx_fault_and_los),

HUAWEI MA5671A, Hisense-Leox LXT-010S-H and Hisense ZNID-GPON-2311NA do
the same.

Commit 95aca8602ef70ffd ("net: sfp: add quirks for Hisense and HSGQ GPON
ONT SFP modules") says TX_FAULT must be ignored "during the module's ~40s
Linux boot time".

Commit 0fd5dfa99cfc75 ("net: sfp: ignore LOS also on Hisense GPON
modules") added LOS ignoring. This keeps the module reachable for
configuration when no fiber is connected.

The HSGQ stick is often said to be a rebranded ODI, but I could not
confirm that from the tree. If the ODI stick behaves the same way, can a
cold plug use up all the retries in sfp_sm_fault()? It gets N_FAULT_INIT
retries spaced T_FAULT_RECOVER apart, which is about 5 seconds in total.
Then it does:

drivers/net/phy/sfp.c:sfp_sm_fault() {
	if (sfp->sm_fault_retries && !--sfp->sm_fault_retries) {
		dev_err(sfp->dev,
			"module persistently indicates fault, disabling\n");
		sfp_sm_next(sfp, SFP_S_TX_DISABLE, 0);
    ...
}

Also, with no fiber connected, would an asserted LOS keep the link down?
That would leave the stick's management interface unreachable.

The commit message does not say how this module drives TX_FAULT and LOS,
or whether fiber was connected during the test. Could that be added? Or,
if the module does not need these fixups, could the message say why it
differs from its siblings?

[Severity: Low]
The commit message says the 2500 Mb/s link came up "with speed and
duplex forced and autonegotiation disabled". However,
sfp_quirk_2500basex() does not clear ETHTOOL_LINK_MODE_Autoneg_BIT:

static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
				struct sfp_module_caps *caps)
{
	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
			 caps->link_modes);
	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
}

phylink_get_inband_type() maps PHY_INTERFACE_MODE_2500BASEX to
INBAND_BASEX. Consider a Base-X SFP with no PHY, on a PCS that supports
both in-band modes (pcs-mtk-lynxi, for example). Because Autoneg is still
advertised, phylink_pcs_neg_mode() picks PHYLINK_PCS_NEG_INBAND_ENABLED.
The default configuration from this quirk therefore runs in-band AN,
which is not the configuration that was tested.

If the module can't do in-band AN at 2500base-X, does it also need
sfp_quirk_disable_autoneg()? sfp_quirk_oem_2_5g() already calls it.
Without it, users would have to run "ethtool -s ... autoneg off" by hand.

On the other hand, commit 95aca8602ef70ffd reports a 2.5Gbps link with the
sibling HSGQ stick on a Banana Pi R3 (MT7986) using the default quirk. So
the need to disable AN may come from the host's PCS, not the module.

Could the commit message say which kernel and PCS driver the Horaco
switch was running?

Separately, this isn't a bug, but the comments on the other
sfp_quirk_2500basex entries say what the EEPROM misreports, for example
"1000BASE-LX / 1300MBd" or "1.2GBd NRZ". Could the new comment say the
same for this module?

>  	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
>  
>  	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118034510.434732-1-github%40bumblecito.com
