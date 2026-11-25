Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590622;
	b=eBEL/rwSgDe5CWnTJ4bKpmPb8minGSkDEShGVe29lemNxO+7GOSAoSg5qoKiweTyYJGI
	 AJM0WLeq+BR5fLEBeoTKn4Q/xAv4aLY4H36n3wmoonBeLOWmLDo73moRuC+A4WjwNpu0m
	 Svb1ciIYmnsP32IlrNx8ZP6A6neo0SUmIrY414zxkWxhRFxdTHoYylmGqDLs7om/0FNkA
	 8hVWut+kq0HDYwZpaWuGNDwZDV2wHAQhJ2BME1JtsCAs1yX0daqvFoiJCdqTjpDHv4m8W
	 MLNmnoUo8WKFcq5GH97bceA+ZNZIwKkY81mYV9Q3MNbp9qDbY727lpcMUSQtTkKM7cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590622;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=57eU++s1Zc1LNJTTX7oA3GpgYaPKwVTViPoFYxLudKE=;
	b=1dVDDoGEM5lBFibedTMqnuD3/D5BCizp8piTgpS+qMToBchVeSvmEtPeS2EIF6LNeXQJ
	 Oi9gjO40Gbov4TKl4gvlXga6y+seethd2vOuiWz78dA9brDS04tNeS+6d++UglqGMH+Up
	 C5oYRMG9lXzD/LQ5C53fKi06Nw3rNLYvBsb6PmN7jt+OOfRAjCSbcdgIzUlqEejlLnqSA
	 PxPupPsIh2LGDMbssR7RQFYszlgOVK2KgRUfq2xxxP6oWt7eS5Q6f2RUplmZ5mvmUKbs6
	 9teLGQ62KHpIJ+NKBx9iKtbXVwVZa+Dr0jtRo/N6I4jEjrHOp9H2YB6mtSdYyjY/X7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8079A606A6A9;
	Wed, 25 Nov 2026 07:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8079A606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz3t1795590563t9fca723d
X-QQ-Originating-IP: N4DRq9rhFGiwKy3DeQ3eB5ukbvLcOUjmAT0waaSE3iQ=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 15:09:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5348563464092667721
EX-QQ-RecipientCnt: 10
Date: Wed, 25 Nov 2026 15:09:20 +0800
From: Yibo Dong <dong100@mucse.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v3 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <EFD2CC62756603D7+20261125070920.GA752553@nic-Precision-5820-Tower>
References: <32E4A50B05876D23+20261124060546.411262-1-dong100@mucse.com>
 <179558856190.3135.8838947348700309121@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179558856190.3135.8838947348700309121@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NP3iUBCWMtGbdwSNcvJpfBeeuPILOJ0v1m3HWn2bHbzHKWC+HAhdQjdr
	KtOZT3pB7b3347rE0BQ45vggMe506kRf8trCsLYVx2/sLJvV4+J3GG3Oq8vN/AZeAqY4mIS
	yyk0DdtUBQPuK6w4cC2be93qB/rag3v4qqXH4oTgh9Yv6tqxK3lGkeosttG+obIfEAjgAo9
	JA7MPa6iTOgoQyezkVbYhe/EmxkcOvyldnbOnKTUHHVDNNvgvkGctWVYMmeNrJdkDWEv3vo
	snethxOzkDqJT+5mDNegUbqMBEIaOpH5LJ8BHk1Zm1N2z67K58GY4rTD0BolEcWXYctv8oG
	sIXecupwZqHjTX07tpyji9eVLqN3i44O9InTOK3gdPuisgBVqtlzpx/03AwYu9ETuDVQN0/
	id3WOw7+5yVwzufIp5EEfrBkqj2e0EbQ5Oqw3GjKRsTuUO3j6ijBEha2LvgjbjShDWc5Eb0
	kcfMWZTkNDAKQJsU5VcEjvPosoXeFMhRSJQxR59nU3RCQZ168M+CNA71k/6qEfbN3LwTH8R
	8+CFZkyVoTi0hBd/0oO+mqSpGj86PO+OuUIfNA/IWjOMLJ7Y8tndtFEzBTroP823TLf3hQg
	trLElpF+YRN+HHLCKsLZhwUiCZzn6zYKcinIHDD+3Tpt1trUJcggcMr+aqfD4KzA3tOniTj
	czeTL/wUCmnBPzkVv+68PQCHsL+DdT7Oont572DGQu8wzwgijvnC3P+AzGmfIIKdYegoqLe
	b1DXN8IiUb3dLN2gC6IMtB4A+F8Yaz9nmRfXBwd1y5AjXMmValTb9x78aGaTxyKzodvgWvd
	/8hFg7uqMvOz5DcJmHavhexUCPgiFKN7G0qXxjbnz0sRKNIuY+SKLh6TEWPklR77+vzahKm
	QUJCacqY/zMF/L42s2pUKsnotqYgo4IujDjOuExO5X85Il+1wQx8v0Roi9n81pJYLMStW7r
	F7pQasvwLYKP9bmx0fEJAImtcoK1xcgtR0wRszSb5ZF3DS/EXZD9XvqaTw0Izr77Wi9PSKJ
	cjKkXbU4gyIxT/mI8uk3VqgLhJkypiFB8H7A2IAb6hxnYMmE3B4voGfg/4DF2v7h2JaMWuy
	mQWoeo0aWepM/YELJiBuZLVytoBgz/+cw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Wed, Nov 25, 2026 at 06:36:01AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] rnpgbe_setup_default_link() builds the PHY_LINK_SET
>   advertisement as hw->link_config.supported & RNPGBE_DEFAULT_ADV, where…
> - [Medium] rnpgbe_add_adapter() now calls rnpgbe_init_link_config(),
>   which sends GET_LANE_STATUS (0x0610) through mucse_mbx_get_link() and…
> - [Low] The commit message leaves out some changes in the patch.
> - [Low] ST_STATUS_MDIX_MASK is GENMASK(11, 10), a 2-bit field that can
>   hold 0-3.
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> > index dcc8233e024e1..3a2f62f0630da 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> > @@ -64,12 +64,42 @@ int rnpgbe_reset_hw(struct mucse_hw *hw)
> >   * rnpgbe_setup_default_link - Configure the default link settings
> >   * @hw: hardware information structure
> >   *
> > + * The default configuration relies on GET_LANE_STATUS reporting at least
> > + * one mode in RNPGBE_DEFAULT_ADV for TP ports and RNPGBE_FW_ADV_1000_FULL
> > + * for fibre and backplane ports. TP ports use the supported subset of the
> > + * default mask for autonegotiation. Fibre and backplane use fixed 1 Gb/s
> > + * full duplex.
> > + *
> >   * Return: 0 on success, negative errno on failure
> >   **/
> >  int rnpgbe_setup_default_link(struct mucse_hw *hw)
> >  {
> > -	return mucse_mbx_set_link(hw, RNPGBE_DEFAULT_ADV, true, 0, 0,
> > -				  ETH_TP_MDI_AUTO);
> > +	u32 advertising = hw->link_config.supported & RNPGBE_DEFAULT_ADV;
> > +	bool autoneg = hw->link_config.status & MUCSE_LINK_TP;
> > +	u8 duplex = DUPLEX_UNKNOWN;
> > +	u32 speed = SPEED_UNKNOWN;
> > +	int err;
> > +
> > +	if (!autoneg) {
> > +		advertising &= RNPGBE_FW_ADV_1000_FULL;
> > +		speed = SPEED_1000;
> > +		duplex = DUPLEX_FULL;
> > +	}
> > +
> > +	err = mucse_mbx_set_link(hw, advertising, autoneg,
> > +				 autoneg ? 0 : speed, autoneg ? 0 : duplex,
> > +				 ETH_TP_MDI_AUTO);
> 
> [Severity: Medium]
> What happens if advertising is 0 at this point?
> 
> The kernel-doc above states the assumption, but nothing checks it. Take
> a TP port where firmware reports none of the RNPGBE_DEFAULT_ADV modes.
> Autoneg is requested with advertising == 0. On ACK,
> MUCSE_LINK_AUTONEG and advertising = 0 are cached, and probe still
> succeeds.
> 
> Could the link then stay down forever, with nothing logged?
> 
> Now take a fibre or backplane port whose supported mask lacks
> RNPGBE_FW_ADV_1000_FULL. 1000/Full is still forced and cached. Then in
> rnpgbe_get_link_ksettings():
> 
> 	if (supported & RNPGBE_FW_ADV_1000_FULL)
> 		linkmode_set_bit(mode, cmd->link_modes.supported);
> 	...
> 	if (cmd->base.autoneg == AUTONEG_DISABLE) {
> 		cmd->base.speed = hw->link_config.speed;
> 		cmd->base.duplex = hw->link_config.duplex;
> 	}
> 
> Would ethtool then show speed 1000 without listing 1000baseX or
> 1000baseKX as a supported mode?
> 
> The old code always advertised the full RNPGBE_DEFAULT_ADV mask,
> whatever firmware reported. The later patch "net: rnpgbe: Support copper
> link configuration" rejects an empty autoneg advertisement in
> set_link_ksettings. This default path still has no such check.
> 
> [ ... ]
> 
The firmware interface guarantees at least one usable TP mode, or
1 Gb/s full duplex for fibre and backplane ports, as documented above
the function.

An empty usable capability mask would violate this firmware contract.
Given that guarantee, I think it is reasonable for the driver to rely
on it without adding an explicit check here.
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
> > index 46981ef2542ad..31871b244882d 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
> 
> [ ... ]
> 
> > @@ -258,6 +260,11 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
> >  		dev_err(&pdev->dev, "Hw reset failed %d\n", err);
> >  		goto err_powerdown;
> >  	}
> > +	err = rnpgbe_init_link_config(hw);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Get link capabilities failed %d\n", err);
> > +		goto err_powerdown;
> > +	}
> 
> [Severity: Medium]
> Will the device still probe if its firmware doesn't implement
> GET_LANE_STATUS (0x0610), or rejects it?
> 
> The call chain is:
> 
> rnpgbe_init_link_config()
>   mucse_mbx_get_link()
>     mucse_fw_send_cmd_wait_resp()
> 
> This returns -ETIMEDOUT if no reply with a matching opcode arrives. It
> returns -EIO if the reply has a non-zero error_code. Either error jumps
> to err_powerdown, so no netdev is registered.
> 
> There is no fallback to the old defaults, and the commit message doesn't
> give a minimum firmware version.
> 
> Does every firmware version this driver binds to support
> GET_LANE_STATUS?
> 
Yes. GET_LANE_STATUS is part of the baseline firmware interface and is
supported by all firmware versions for these devices.

The previous driver sent a common default advertisement mask without
first querying the port capabilities. Firmware handles settings that do
not apply to the port. For example, on fibre ports it ignores the
autonegotiation request and the 10/100 Mb/s advertisement bits, and uses
fixed 1 Gb/s full duplex.

This patch queries GET_LANE_STATUS to obtain the actual port type and
capabilities, select the corresponding defaults explicitly, and report
them through ethtool. The command is supported by all firmware versions
for these devices; its absence from the previous driver was not due to
a firmware compatibility limitation.
> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> > index 4a18937927514..469818b83d70f 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
> 
> [ ... ]
> 
> > @@ -435,6 +462,8 @@ static void mucse_mbx_fw_req_handler(struct mucse_hw *hw,
> >  
> >  		hw->speed = le16_to_cpu(req->link_stat.st.speed);
> >  		hw->duplex = req->link_stat.st.flags & DUPLEX_BIT;
> > +		hw->mdix = FIELD_GET(ST_STATUS_MDIX_MASK,
> > +				     le16_to_cpu(req->link_stat.st.status));
> 
> [Severity: Low]
> ST_STATUS_MDIX_MASK is GENMASK(11, 10), so the field can hold 0 to 3.
> The comment in rnpgbe_mbx_fw.h lists only three values:
> 
> /* MDI-X status uses ETH_TP_MDI_* encoding: 0 on link down, 1 MDI, 2 MDI-X. */
> 
> The raw value is stored here without a range check.
> rnpgbe_get_link_ksettings() then copies it into cmd->base.eth_tp_mdix:
> 
> 		if (status & MUCSE_LINK_TP)
> 			cmd->base.eth_tp_mdix = hw->mdix;
> 
> If firmware ever reported 3, ETH_TP_MDI_AUTO would show up in the
> resolved MDI-X status field. That value is only meant for
> eth_tp_mdix_ctrl.
> 
> Should values other than ETH_TP_MDI and ETH_TP_MDI_X be reported as
> ETH_TP_MDI_INVALID instead?
The direct assignment therefore follows the firmware protocol.
0 when the link is down, 1 for MDI, and 2 for MDI-X. It does not Report
3 as a resolved MDI-X status.
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/6C54E9FB2E95869E%2B20261124060436.410989-1-dong100%40mucse.com
> 
