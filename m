Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588563;
	b=OENIhmkDY+xk+N18mvaHdkIvj8zMd0BNp3fVf1m6Jo5UyA8cIRJ/jpOEwFYeLW5ySViG
	 KjCH/EpPRn26LSaExkmTFGiAXuzZQrhKyiRFOoG266paPFIkvycsIHBETgg65G/MfiU6u
	 d4xdtULyEcA4JgyM+ULFQ9pbhHaBY0LGzuExwLw+mGNiy45MTh+LP/1QNCMtGJWwkZHWI
	 X424WHl3ugAwtM2eJTPj9VXclrbC7uQ36gj6dfciIexlQBOOTvYPsguVkfCVj3Dj/2kCN
	 MQ/uiVfD45zCLflP+K4LKYS3uaX6umxmvWESZ5hSViYKk97/6ljqmWDu9NMSg3bGoDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588563;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gqIokuDmw+C8EIieLfWo36U5fTUYAqRMChwxSzD8YUE=;
	b=jQtr1/WV5HviToL4tjvW8sR0drESP88WTehWvPf0OlJrxmCcRZItIJFA1Zb1SB3berp/
	 72mnydPodcVaOcz5Ql7fzBHpLOVHaacCY8EhbL6FxpCn4JTJ67wa4+jEwnty0JdNWPXsd
	 X0F/214iOJHwocJ1O99p4RNlpmLEhq4g+7gN22/T3LzAqv6lCQBAZQgSwTsZ4aKEV4tUF
	 LthISxVbPav1IvmPwhEYJcP7nLjw9FpHlQrqfI2T8Noi2KZgm7ebZWCgWs2WganV0RO2y
	 90M8enMLalE8F1jmkM3e502R45jL+hMwyelaM6RzxAPh7mKPVoB6rSfnD1b+TI6u6cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iT7hMpxv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8CF606A31E;
	Wed, 25 Nov 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iT7hMpxv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7811F000C4;
	Wed, 25 Nov 2026 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795588563;
	bh=gqIokuDmw+C8EIieLfWo36U5fTUYAqRMChwxSzD8YUE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iT7hMpxvyQHNG7u0z2j+8h+4bj1jxjA64zMwxYfkddD2kNCZx6Wq9hzuVpOEAbhts
	 o9yEe8Vjqpur94e1fAvtJgVIcGg7/VBzZ+Cqz3yjkuRn0fGdPzW8dHomvwGIKIdc5G
	 XftwFU5RgeY4b0jsbOoagi+dbIAlOrPOgB5jNyWugdGsXjYpotovf77Q3XL6K8wuYB
	 dDEpu4o9R1PHlT+PgkAl+96UU0jeCZfNPugdkYjqIq8daTY+IVlKY2kfpsQB2O2nch
	 KjJcHJwSKDl+zqn/NA+0jn5lEE7PyEi8bZdx8revJi88NmHd7o/hIUPHYht3ZmS89j
	 yPKb/fqzOddbA==
Subject:
 Re: [PATCH net-next v3 2/5] net: rnpgbe: Report link settings through ethtool
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Wed, 25 Nov 2026 06:36:01 +0000
Message-ID: <179558856190.3135.8838947348700309121@kernel.org>
In-Reply-To: <32E4A50B05876D23+20261124060546.411262-1-dong100@mucse.com>
References: <32E4A50B05876D23+20261124060546.411262-1-dong100@mucse.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rnpgbe_setup_default_link() builds the PHY_LINK_SET
  advertisement as hw->link_config.supported & RNPGBE_DEFAULT_ADV, where…
- [Medium] rnpgbe_add_adapter() now calls rnpgbe_init_link_config(),
  which sends GET_LANE_STATUS (0x0610) through mucse_mbx_get_link() and…
- [Low] The commit message leaves out some changes in the patch.
- [Low] ST_STATUS_MDIX_MASK is GENMASK(11, 10), a 2-bit field that can
  hold 0-3.

--

net: rnpgbe: Report link settings through ethtool

This commit adds get_link_ksettings support. It reports supported and
advertised link modes, autoneg, port type and PHY address, all taken
from a new GET_LANE_STATUS firmware query made at probe time. It also
changes the default link setup: TP ports now autonegotiate, and fibre
and backplane ports are forced to 1 Gb/s full duplex.

> Add get_link_ksettings support to report supported and advertised
> link modes, autonegotiation, port type and PHY address. Report copper,
> fibre and backplane link modes from firmware, with autonegotiation
> support on copper ports.

[Severity: Low]
This isn't a bug, but could the commit message also mention a few
changes it doesn't describe?

Probe now sends the new GET_LANE_STATUS command, and probe fails if that
command returns an error.

mucse_mbx_fw_req_handler() now decodes ST_STATUS_MDIX_MASK from
LINK_CHANGE_EVT. get_link_ksettings reports eth_tp_mdix and
eth_tp_mdix_ctrl.

In rnpgbe_setup_default_link(), the TP default advertisement is no
longer the fixed RNPGBE_DEFAULT_ADV mask. It is now
supported & RNPGBE_DEFAULT_ADV.

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> index dcc8233e024e1..3a2f62f0630da 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> @@ -64,12 +64,42 @@ int rnpgbe_reset_hw(struct mucse_hw *hw)
>   * rnpgbe_setup_default_link - Configure the default link settings
>   * @hw: hardware information structure
>   *
> + * The default configuration relies on GET_LANE_STATUS reporting at least
> + * one mode in RNPGBE_DEFAULT_ADV for TP ports and RNPGBE_FW_ADV_1000_FULL
> + * for fibre and backplane ports. TP ports use the supported subset of the
> + * default mask for autonegotiation. Fibre and backplane use fixed 1 Gb/s
> + * full duplex.
> + *
>   * Return: 0 on success, negative errno on failure
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
What happens if advertising is 0 at this point?

The kernel-doc above states the assumption, but nothing checks it. Take
a TP port where firmware reports none of the RNPGBE_DEFAULT_ADV modes.
Autoneg is requested with advertising == 0. On ACK,
MUCSE_LINK_AUTONEG and advertising = 0 are cached, and probe still
succeeds.

Could the link then stay down forever, with nothing logged?

Now take a fibre or backplane port whose supported mask lacks
RNPGBE_FW_ADV_1000_FULL. 1000/Full is still forced and cached. Then in
rnpgbe_get_link_ksettings():

	if (supported & RNPGBE_FW_ADV_1000_FULL)
		linkmode_set_bit(mode, cmd->link_modes.supported);
	...
	if (cmd->base.autoneg == AUTONEG_DISABLE) {
		cmd->base.speed = hw->link_config.speed;
		cmd->base.duplex = hw->link_config.duplex;
	}

Would ethtool then show speed 1000 without listing 1000baseX or
1000baseKX as a supported mode?

The old code always advertised the full RNPGBE_DEFAULT_ADV mask,
whatever firmware reported. The later patch "net: rnpgbe: Support copper
link configuration" rejects an empty autoneg advertisement in
set_link_ksettings. This default path still has no such check.

[ ... ]

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
> index 46981ef2542ad..31871b244882d 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c

[ ... ]

> @@ -258,6 +260,11 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
>  		dev_err(&pdev->dev, "Hw reset failed %d\n", err);
>  		goto err_powerdown;
>  	}
> +	err = rnpgbe_init_link_config(hw);
> +	if (err) {
> +		dev_err(&pdev->dev, "Get link capabilities failed %d\n", err);
> +		goto err_powerdown;
> +	}

[Severity: Medium]
Will the device still probe if its firmware doesn't implement
GET_LANE_STATUS (0x0610), or rejects it?

The call chain is:

rnpgbe_init_link_config()
  mucse_mbx_get_link()
    mucse_fw_send_cmd_wait_resp()

This returns -ETIMEDOUT if no reply with a matching opcode arrives. It
returns -EIO if the reply has a non-zero error_code. Either error jumps
to err_powerdown, so no netdev is registered.

There is no fallback to the old defaults, and the commit message doesn't
give a minimum firmware version.

Does every firmware version this driver binds to support
GET_LANE_STATUS?

[ ... ]

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> index 4a18937927514..469818b83d70f 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c

[ ... ]

> @@ -435,6 +462,8 @@ static void mucse_mbx_fw_req_handler(struct mucse_hw *hw,
>  
>  		hw->speed = le16_to_cpu(req->link_stat.st.speed);
>  		hw->duplex = req->link_stat.st.flags & DUPLEX_BIT;
> +		hw->mdix = FIELD_GET(ST_STATUS_MDIX_MASK,
> +				     le16_to_cpu(req->link_stat.st.status));

[Severity: Low]
ST_STATUS_MDIX_MASK is GENMASK(11, 10), so the field can hold 0 to 3.
The comment in rnpgbe_mbx_fw.h lists only three values:

/* MDI-X status uses ETH_TP_MDI_* encoding: 0 on link down, 1 MDI, 2 MDI-X. */

The raw value is stored here without a range check.
rnpgbe_get_link_ksettings() then copies it into cmd->base.eth_tp_mdix:

		if (status & MUCSE_LINK_TP)
			cmd->base.eth_tp_mdix = hw->mdix;

If firmware ever reported 3, ETH_TP_MDI_AUTO would show up in the
resolved MDI-X status field. That value is only meant for
eth_tp_mdix_ctrl.

Should values other than ETH_TP_MDI and ETH_TP_MDI_X be reported as
ETH_TP_MDI_INVALID instead?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
