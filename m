Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402144;
	b=i+sePi8x9c3G9lUN/0NcdNClouJ9akP/8QpFxe/YVYpOj5XubnyiiUD6k8cJUzskPPfS
	 RCED1ogRx85M3CT6c+TQOkHN2f4e3xcyZNHNLcv2Tx+gd5GKPViagwErmkO/Txcr54WER
	 JGQFBWzQm+efm6+ivCmu3i6n+P14AN6uXZRh/Sn8qZTK81NsK/sKuGoQknHNeXEUMge3x
	 6SopN36k0CjQQKm/Se8kGakvBgGgn1U0qrc4RtlpJR/+ZwWligh9VZqNDYhcU8yuwywaA
	 yiLe5NIhqrmyKywh7m0u5f75PxINWhKFeh3Aezb5iwr8yp5X+6wcWLkNHh+ABqIrlvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402144;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=VfMIDRBajaw6YLETwjyTTpbILnXPlm5eaXjJBJ2siyg=;
	b=oORj5AP7m/DVWOE1LRtivrjVPVYKklQr1zwh/2ZgkCWZaRrcPnGxQfHU6eFPwYAZeO80
	 riiULe7nme6eUV7hMKUcTOAEz/DkU8/Ujbj5YG5QMY/i2H1ZiEVRD5n95TdYgIO6H+lDa
	 WoR5HqI26g0f1UoOVwr/EMHm/vndtG+pggii1xhXEe1ouwU5Mjk2IWZZjGkT6nau2l4Xe
	 LXmAD9gVz92jxInVxOpAWAuh0R4JAORM62c6hemGJGmL7Kvv+WnPq366tpGvWiuSyH229
	 o5J3bi9w0DGEiLA/YAt7OJnNfKXfl080b/edh/Ncgr4BUaitEAlOZhGDiIsxUD13fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE2606A330;
	Mon, 23 Nov 2026 02:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBE2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz20t1795402086t08d1b59b
X-QQ-Originating-IP: pVf7nvjY2YZo46HzFvvvCi+kSjU3AWEKbpqwBL1NV9U=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 10:48:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3612839150560736065
EX-QQ-RecipientCnt: 10
Date: Mon, 23 Nov 2026 10:48:04 +0800
From: Yibo Dong <dong100@mucse.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <3B9BA8241EE72A75+20261123024804.GC35839@nic-Precision-5820-Tower>
References: <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <179510098459.3136.6099142715168518439@kernel.org>
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
In-Reply-To: <179510098459.3136.6099142715168518439@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MtwKLoEcyZa/UoSI8ukvdXHAXLapKjK0cOBUAij+o6ylx+NupeQUwV41
	xknqhSZ1UjjAe9UkAhOaEmnGlNjfsSERrKHTWuCDTXcAK4Cw/sD+8dDJ0oUjN0dh2CsMum3
	9EDZ/zQKcFho+vrDctL19Kl4toSWiHhgMTa1thfmnaU0M5Rf8+XssYluryw710zpARteFxU
	h9HJcloRiAJ19ddtL1t5LeqZkiIoK9sUT6g0SZ/Li8PZQxXKAVCbvPqqOKTMDvRnZAOH3RN
	7n4sFBMXrW8AWFzfUojC17Znl6D7u/zh4fmlqLSz3SbjXP4REhD7tusxCgDKiYc0Zl41khL
	9qrEqa4UgMxIT8eyFtfa3ogqx2aHBBiz+z0vlHzRouPU7lpqz3ebSdBsAMZqULn3Sbt8quT
	LyotJpFs5GvhL+CW/31KLAPhr7lEwf2orWoygMeX/UfTjuiIiCIOPAadVfK1WPetr1IpW47
	N3fD2ewOnM7rABA9Hdufj8XxdbhEB6ZtBkVJiTdmpUdDJkM5GMXRwx1gwZojepku52YVTXe
	m9Pvtmv5i/l2L6YmqA5Ol7B/uVrpt8/KXUCOQMH7RHDQ/mbh/mVzV/Ubu+PkK//qUM7f1I8
	9UDk8IgB+adK2uxNkHqXADaJsLzcgwJsc1lCyOhAFgw9ztPIBNttL+Hvs1CGPNo52aJc1Ee
	V3Vax9vuxO2tn+lEAWDQ3Dd3Excg1ycpd6pCjB6ysfwfrIMq06C1OkEaPYIN7AH0iAgjrUm
	xQin31QMqxcZmQo7HkgjmmWwuoeFg053mYLx90jyfEqFDJodULt5yxNugkFQjRvpmrJ9Q5k
	WEY6OTMsDKB8Q1T/O7kjnVT26BSfdBRq0YjSmg7axWWT39PYHYj1e1cOY/o55KsZaRp06+J
	wLDjBtg43u4EvOwDZaYJUMW6c24GO/DsSe37Bd9VDMC2RoF4Dm+KADg2vsVjaeNTTx1Jtco
	JI/cYv/ROTs3BD4fERdBiTMTyG2w1RfwbLuLBx4WTZJzZHYmBDzKidKVcnp260byFlTByx+
	qLTX/f4qadLoAkWMFxm81Qg5Skdh5csEkm8P/UYTQX6AlfV5wmcleK8s8UXSNHAydkC3yjY
	ODAV0S9UP0zxmZV1r8ySSPMR35EU8ew2vJ35a3Xk4PveVpKLfv6hNQ=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Thu, Nov 19, 2026 at 03:09:44PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In rnpgbe_setup_default_link()
>   (drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c), the probe-time link…
> 
> --
> 
> net: rnpgbe: Report link settings through ethtool
> 
> This adds get_link_ksettings support. It reports supported and advertised
> link modes, autoneg, port type and PHY address, using firmware data that
> is queried with GET_LANE_STATUS at probe. It also changes the probe-time
> default link setup: TP ports use autoneg, and fibre and backplane ports
> use fixed 1000/full.
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> > index dcc8233e024e1..a6ab94bd1578a 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> > @@ -68,8 +68,32 @@ int rnpgbe_reset_hw(struct mucse_hw *hw)
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
> What happens here if advertising ends up as 0?
> 
> Before this patch, probe always sent the fixed, non-empty
> RNPGBE_DEFAULT_ADV. Now hw->link_config.supported narrows the mask.
> rnpgbe_init_link_config() copies that value from the GET_LANE_STATUS
> reply without any check:
> 
>     hw->link_config.supported = le32_to_cpu(info.supported);
> 
> Take a TP port whose supported mask has none of the RNPGBE_DEFAULT_ADV
> bits. This sends PHY_LINK_SET with autoneg enabled and an empty
> advertisement. Firmware only acks the message, so err is 0. The driver
> then caches advertising = 0 with MUCSE_LINK_AUTONEG set.
> 
> Wouldn't the PHY then autonegotiate with nothing advertised, so the link
> never comes up?
> 
> Later in the series, "net: rnpgbe: Support copper link configuration"
> adds rnpgbe_set_link_ksettings(), which rejects this exact configuration:
> 
> 	if (autoneg) {
> 		if (!advertising)
> 			return -EINVAL;
> 
> Ethtool can't recover from this state either. The requested
> advertisement has to be a subset of the same empty supported set, and
> forced 10/100 needs supported & mode. Both paths return -EINVAL. This
> probe path is still the same at the end of the series.
> 
> On a fibre or backplane port, the code forces 1000/full without checking
> that supported contains RNPGBE_FW_ADV_1000_FULL.
> rnpgbe_get_link_ksettings() in this same patch seems to expect that bit
> can be missing:
> 
> 	if (supported & RNPGBE_FW_ADV_1000_FULL)
> 		linkmode_set_bit(mode, cmd->link_modes.supported);
> 
> However, its AUTONEG_DISABLE block always reports the cached SPEED_1000
> and DUPLEX_FULL. Ethtool would then show a forced speed that matches
> nothing in link_modes.supported.
> 
> Elsewhere this driver checks firmware data and falls back: a random MAC
> when is_valid_ether_addr() fails, and ST_VALID_MAGIC and
> mucse_link_speed_valid() for link events.
> 
> Could rnpgbe_setup_default_link() or rnpgbe_init_link_config() also
> check for an empty mask here? On an empty mask it could either fall back
> to RNPGBE_DEFAULT_ADV or fail the probe.
> 
The driver relies on the capabilities reported by GET_LANE_STATUS
for the devices it supports:

- TP ports support 10/100 Mb/s half/full duplex and 1000 Mb/s full
  duplex. The reported supported mask contains at least one mode
  in RNPGBE_DEFAULT_ADV.
- Fibre and backplane ports support fixed 1000 Mb/s full duplex,
  and their supported mask contains RNPGBE_FW_ADV_1000_FULL.

With this firmware contract, the TP default advertisement is
non-empty, and the fixed 1000/full configuration on fibre and
backplane ports is supported.
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BD205A7832D36E7D%2B20261116030917.1329989-1-dong100%40mucse.com
> 
