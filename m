Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100986;
	b=rOk/34SbdQfFh3OMzWScWrW1QB8oTbYCZWsLEXO5YU4tNTET1+t+0lXVgZv4gVlvKD5g
	 zAPaJMMQ/J5CifAXPyzLuYskWV4TJ1QIIELupSsRCsm52LdAcAgCLrp/F3MSxx/MBszd4
	 PT4AjSJSV+uvuxSh/P14UA5C3sfMBYYVG2pQGTLDyJnp9Ibpt0jeESzfv9NZ0YNpw3iwA
	 llJo/0A4kSTpKtIkVtySLYiQ0hCYxWMuvyZ1wFEa4PsqlEO1mZjw1UPL+GKJRLgQxtlU1
	 aWHG5+rIkGQgx0Mwgs4B06rwm0hQ9pYCLFdmRJWHFgcwwuYp1d3okEzTbDyvnq0Eatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100986;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fg/OAV5AB1rFdpJcKcYXiG6ZJ65kTDQBEGv77gialfM=;
	b=iaqmcaAINj8Mi0YFTx86iek0w0FCJ/gX2C4hJ2a3Ulp5z1BTd7J99F8FJ6pH7ggMKNRQ
	 HFouDVu5PtON6TQp4CBF5I4YXzlvMagOZYkAfMpZ9QuOEpt85u3BIuZplFTL0ChLWexYa
	 wZ5+QFRQgBVKDXJoR8yCijxbWNzpEmy1scjRx2K83WEoVhksw0F1L9BM77acGdndcombi
	 S5474VK9QqtzuZUH92CUBr/RmsmN5KXDFc7eUVG9J75A/lEvPCHMmw6YUuBrMD7DVvc8B
	 zlt78El2g9MG4YaIcMzfMrRva0qQpMOYuisTLQWDP34n/Ue1GWt12TXVwi38xFPWdBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CLFsDw/a";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A56606A324;
	Thu, 19 Nov 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CLFsDw/a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1370B1F000C4;
	Thu, 19 Nov 2026 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100985;
	bh=fg/OAV5AB1rFdpJcKcYXiG6ZJ65kTDQBEGv77gialfM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CLFsDw/a5D272p5oELT7ATmd2y7ajmUssdW+4V9eqwVsZhsRxh9Xv/KSHgqQMKRY8
	 EL5H3i5x04qJJI0D2KBScjUAC0kyt9HAr2dKnaZ5ORKE0Hc9k/rW4e0/gN2LK4QZcP
	 RRRiQln2fxpnr1NlsaD5OVCliplrOEW7oDZihNRWn49DC2wpOeO+dIXQsGvB8HZORS
	 PQMTYZZ0AS8k/XWvF3goFpURR3N4HC00cWzDL8I/89N1rJLus37ybdcE45yjVpy2qj
	 GEMthiKZEDOp3hmMjgWh2CVSsMEqNtb0mMYH4li/gyRXSJqiqQH8zlPDNi1iOu293o
	 x0qoo0eTbxzyA==
Subject:
 Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings through ethtool
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Thu, 19 Nov 2026 15:09:44 +0000
Message-ID: <179510098459.3136.6099142715168518439@kernel.org>
In-Reply-To: <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
References: <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In rnpgbe_setup_default_link()
  (drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c), the probe-time link…

--

net: rnpgbe: Report link settings through ethtool

This adds get_link_ksettings support. It reports supported and advertised
link modes, autoneg, port type and PHY address, using firmware data that
is queried with GET_LANE_STATUS at probe. It also changes the probe-time
default link setup: TP ports use autoneg, and fibre and backplane ports
use fixed 1000/full.

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> index dcc8233e024e1..a6ab94bd1578a 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> @@ -68,8 +68,32 @@ int rnpgbe_reset_hw(struct mucse_hw *hw)
>   **/
>  int rnpgbe_setup_default_link(struct mucse_hw *hw)
>  {
> -	return mucse_mbx_set_link(hw, RNPGBE_DEFAULT_ADV, true, 0, 0,
> -				  ETH_TP_MDI_AUTO);
> +	u32 advertising = hw->link_config.supported & RNPGBE_DEFAULT_ADV;
> +	bool autoneg = hw->link_config.status & MUCSE_LINK_TP;
> +	u8 duplex = DUPLEX_UNKNOWN;
> +	u32 speed = SPEED_UNKNOWN;
> +	int err;
> +
> +	if (!autoneg) {
> +		advertising &= RNPGBE_FW_ADV_1000_FULL;
> +		speed = SPEED_1000;
> +		duplex = DUPLEX_FULL;
> +	}
> +
> +	err = mucse_mbx_set_link(hw, advertising, autoneg,
> +				 autoneg ? 0 : speed, autoneg ? 0 : duplex,
> +				 ETH_TP_MDI_AUTO);

[Severity: Medium]
What happens here if advertising ends up as 0?

Before this patch, probe always sent the fixed, non-empty
RNPGBE_DEFAULT_ADV. Now hw->link_config.supported narrows the mask.
rnpgbe_init_link_config() copies that value from the GET_LANE_STATUS
reply without any check:

    hw->link_config.supported = le32_to_cpu(info.supported);

Take a TP port whose supported mask has none of the RNPGBE_DEFAULT_ADV
bits. This sends PHY_LINK_SET with autoneg enabled and an empty
advertisement. Firmware only acks the message, so err is 0. The driver
then caches advertising = 0 with MUCSE_LINK_AUTONEG set.

Wouldn't the PHY then autonegotiate with nothing advertised, so the link
never comes up?

Later in the series, "net: rnpgbe: Support copper link configuration"
adds rnpgbe_set_link_ksettings(), which rejects this exact configuration:

	if (autoneg) {
		if (!advertising)
			return -EINVAL;

Ethtool can't recover from this state either. The requested
advertisement has to be a subset of the same empty supported set, and
forced 10/100 needs supported & mode. Both paths return -EINVAL. This
probe path is still the same at the end of the series.

On a fibre or backplane port, the code forces 1000/full without checking
that supported contains RNPGBE_FW_ADV_1000_FULL.
rnpgbe_get_link_ksettings() in this same patch seems to expect that bit
can be missing:

	if (supported & RNPGBE_FW_ADV_1000_FULL)
		linkmode_set_bit(mode, cmd->link_modes.supported);

However, its AUTONEG_DISABLE block always reports the cached SPEED_1000
and DUPLEX_FULL. Ethtool would then show a forced speed that matches
nothing in link_modes.supported.

Elsewhere this driver checks firmware data and falls back: a random MAC
when is_valid_ether_addr() fails, and ST_VALID_MAGIC and
mucse_link_speed_valid() for link events.

Could rnpgbe_setup_default_link() or rnpgbe_init_link_config() also
check for an empty mask here? On an empty mask it could either fall back
to RNPGBE_DEFAULT_ADV or fail the probe.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BD205A7832D36E7D%2B20261116030917.1329989-1-dong100%40mucse.com
