Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401833;
	b=pKUDFRII+E3ZUyW4Y6UoJdOJfT4he/SB48rBMZgyFa5dGpI3RkBPI3pZnSfrhyHBuGDj
	 iWMu4O5+1WKUtAu8euMCgOXL4gFw28ssL81f6tcItyCT8l6fPSqFKLwj7G4G3uUwoz9aG
	 emk1xgwVzEe+0e4fRVDiILvml2M6JpLceNtcGry2om06MRxDK+rhOXgw5C0c4BSBp3j6t
	 crf2Ig81tWZUyuWtlaYEb32KuUvnNnzOoj4jZf2CwBeEeEeE5JqJHrTZec6qAPNdFXrIH
	 Hy0yCRVuppQgr2Mlz2Rctgt/cvWnUALTjhZDUZd+hBRMlFaHOKugUamee24G/RGHZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401833;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7h4fa7fAeNHm0gLiDYWKbggl8GPtg/qRasIhvm+V054=;
	b=mY63A20GP3WDObgqAiMDMZfdzeA/5yhPrL5DP1jUabKCegQG4alsuWiGX96YSuFc078H
	 JRyc7o8rLkiN1HWcYtzmn51xVXe44Erx+kEKSc4qBK+CVqrjGWoF035lLw7MtGvHNZqWu
	 fB2i9IW550lfJP7KiLt6WlGt/JfHbG2pD7OjYrKg8QHlTtW4Jw3ruMXH/pkhYZfiKe5xD
	 z2lcHb6w3b4kYJuty66UFxuz6qDHbR67h6EadeZRE/kzu1EsrTLC4jZbcAXHj7s7p5pLQ
	 lPsQvkXtjs8FIhv3sPcWV2iZEca+L/HGw5UTmX/aX2F6R3CMLV8VM1wZy3B3gmkk/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14719606A31A;
	Mon, 23 Nov 2026 02:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14719606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpsz3t1795401778tb72fd3fb
X-QQ-Originating-IP: 0onMsQogQ/rLZXByQ9cnSDQaNbHDKF7EkBi9epid8h4=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 10:42:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15827168950631735144
EX-QQ-RecipientCnt: 10
Date: Mon, 23 Nov 2026 10:42:56 +0800
From: Yibo Dong <dong100@mucse.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 3/5] net: rnpgbe: Support copper link
 configuration
Message-ID: <AB584A545F47EE64+20261123024256.GB35839@nic-Precision-5820-Tower>
References: <E783BBD6D9CACAEF+20261116031032.1330270-1-dong100@mucse.com>
 <179510098578.3136.17685116330600350297@kernel.org>
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
In-Reply-To: <179510098578.3136.17685116330600350297@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: OLyh31NAacGWvAILHPZyW4Nks+fdaoNZ9Q6dK8pr4Y7zJ7WapdSAEv7S
	PnlkABDceCHnN3vqG549Q1JPAtv8t4Oc4F4afj1VsqCj9uGyJv428dKFL69DW5UgwEvFCJz
	eyPxUOC6bTrJK9QEEWDePoyuIPiooCpHtSuNT7Em+77OQoGtvaGY4ycP3Iof0ASv2QKje8e
	U9E8jQ1y8DgFUDUEV54XPGlTbpdmUX5xZqahWV0IH7HppTCzuhZvSq0Eoz3zPnHT4ujFkxs
	aJ/qIVJ3OYPN/nGKQPesSXFwXsEDthrQY3nVlBu8UW19sGG5NKoO/o+dHQ4R6vqONsRm/sz
	/eiobmq3Ars9w9cAVA1NXy2GhwMp8dFMHm7ND6eRJPxU7HbMI92PAW0eQVI5JF5A0Ss3elT
	lxwU30E2D3IL2RJzyEHLplroI8duv6AafcsyEVD8qXb1KvktGnaPg1XtOBHGLKwZP/+Fwgo
	bS+4l/IQSiI2pQQliDcpx0+3SMk2Lhgb6kDhBstNVkEqN991Js01+k6TeYNI/Zu8r0aD45S
	wYpIkl0BIzkTn5iK+H67ma9phJHHQLqpGyEoSivEpjFyHWfD44HaW0sN/fbGTaUdPvTkkIN
	+opfI+bTW+BiWkz+D5iT9HpngeSCGfmwRzDz8QG3jdVbeEpiXv7DGEMtOkkW5ujLNjunsEI
	ZYwrUSNYlgo8dr3pgFTII/pIki5h47TuPUSkzuopQ+SJkWY9D4VMVPl+VeRJEOY9YpmzDBB
	KTf7ExwmR6mEIpPF9Xl7CCDD+Xr7WFVglo64grIpQG71z7giyr5h7vUi2kpYKt/6vQU1X8D
	GqLMiGp929JDw6mvim+yNtXKzCBTeWjurgygaSKYnGJ0oEtga1vAAA7yc7pnGUgk6dHlioF
	eZIU0bHRziTtwMweYj+AtKQmiCVibyf73WsA34XhbcKlRYe2u/sm0H/UoWXfvV+zRMccPV4
	YZ3sOFe67ZswvjSkk3oMsPzXDywV/JCMsRA4mbtyBi/HtAB0Men+8O78vZKXlKQiCbGpI6b
	GJJZHCLOitGiUWCJ/8EwZNJLKWVSUW+LWmoFkjdlCF19MujY7/jgVtbADz209iZsGLraZQr
	wLcp8xjngPlsbYXslHPWrjUkulbsKSMtv8IR/Mvc/ea
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Thu, Nov 19, 2026 at 03:09:45PM +0000, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] rnpgbe_set_link_ksettings()
>   (drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c) only updates its…
> 
> --
> 
> net: rnpgbe: Support copper link configuration
> 
> This adds set_link_ksettings support for copper ports, covering
> autonegotiation, advertised link modes, forced 10/100 speed/duplex and
> MDI/MDI-X selection. Requests to change the firmware-reported port type
> are rejected. PHY_LINK_SET is also switched to the event-coalescing
> mailbox transport.
> 
> > diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
> > index 0afeda19f4ea9..d856b970e5a50 100644
> > --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
> > +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
> 
> [ ... ]
> 
> > +static int rnpgbe_set_link_ksettings(struct net_device *netdev,
> > +				     const struct ethtool_link_ksettings *cmd)
> > +{
> 
> [ ... ]
> 
> > +	if (!mdix)
> > +		mdix = mucse->hw.mdix_ctrl;
> > +	if (mdix != ETH_TP_MDI && mdix != ETH_TP_MDI_X &&
> > +	    mdix != ETH_TP_MDI_AUTO)
> > +		return -EINVAL;
> 
> [ ... ]
> 
> > +	err = mucse_mbx_set_link(&mucse->hw, advertising, autoneg,
> > +				 autoneg ? 0 : cmd->base.speed,
> > +				 autoneg ? 0 : cmd->base.duplex, mdix);
> > +	if (!err) {
> > +		mucse->hw.mdix_ctrl = mdix;
> > +		mucse->hw.link_config.advertising = advertising;
> > +		mucse->hw.link_config.speed = autoneg ?
> > +			SPEED_UNKNOWN : cmd->base.speed;
> > +		mucse->hw.link_config.duplex = autoneg ?
> > +			DUPLEX_UNKNOWN : cmd->base.duplex;
> > +		if (autoneg)
> > +			mucse->hw.link_config.status |= MUCSE_LINK_AUTONEG;
> > +		else
> > +			mucse->hw.link_config.status &= ~MUCSE_LINK_AUTONEG;
> > +	}
> > +
> > +	return err;
> > +}
> 
> [Severity: Medium]
> What happens to the cached link settings if mucse_mbx_set_link() fails
> only because the ack poll timed out?
> 
> By the time the poll starts, the PHY_LINK_SET request has already been
> written to shared memory and the doorbell rung:
> 
> mucse_write_mbx_pf_coalesce_event() {
>     ...
> 	for (int i = 0; i < size_in_words; i++)
> 		mbx_data_wr32(mbx, MUCSE_MBX_FWPF_SHM + i * 4,
> 			      le32_to_cpu(msg[i]));
> 
> 	hw->mbx.fw_ack = mucse_mbx_get_fwack(mbx);
> 	mucse_mbx_inc_pf_req(hw);
> 	mucse_release_mbx_lock_pf(hw, true);
>     ...
> }
> 
> After that, mucse_write_mbx_coalesce_event() calls mucse_poll_for_ack(),
> which can time out after mbx->timeout_us. The error goes straight back to
> the ethtool caller.
> 
> If firmware still applies the request late, the driver keeps the old
> hw.mdix_ctrl, link_config.advertising/speed/duplex and the
> MUCSE_LINK_AUTONEG bit. Would rnpgbe_get_link_ksettings() then report
> settings that differ from what the PHY is running?
> 
> A later set call that leaves eth_tp_mdix_ctrl at ETH_TP_MDI_INVALID falls
> back to the cached value:
> 
> 	if (!mdix)
> 		mdix = mucse->hw.mdix_ctrl;
> 
> Could that send the stale MDI/MDI-X setting back to firmware?
> 
> Before this patch, mucse_mbx_set_link() was only called during probe,
> where a failure aborts probe. This patch makes it a runtime ethtool
> operation, so the mismatch can now be reached.
> 
> Would it make sense to invalidate or re-sync the cached configuration
> when the command was sent but no ack came back?
> 
Firmware acknowledges the mailbox request when it consumes it, before
applying the link settings. If the ACK wait times out, firmware has not
consumed the request and will not process it later. The previous link
settings therefore remain in effect, so the driver keeps the cached
configuration.
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BD205A7832D36E7D%2B20261116030917.1329989-1-dong100%40mucse.com
> 
