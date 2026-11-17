Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959677;
	b=vYN+p55eMzKFhSMlQNPY/jWFOwn4I2XHVUNurCRwPqqyyKrRPARWE+8aKABR3IAY04zh
	 xdA2WTDAo+9ph9CHDJ1NPoullTUGxt/OkeUlMHV8seTFBAmXcsu5yhc5WeMKp7rVEbTQT
	 UCBDQP70Bh4a+I9EAQoyz9yaNoBbYg8aXyetIUCoM59YVbE4f2xEzpej9N8jYi+dxJMz6
	 +MJ8qiVdLoO3iN0LcY9OahQfqFTDtIPWanqgJvqp0mz1h92wlWvPtthWpsAoY+5ohrLjt
	 sGgQAg1vb5P3gXXBDpOvRyFwUt21xTHJnv0R37ZqhJITtOOBBFX9QSjuII9RjTSc++w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959677;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/u/EKDBrcBS9hc0fY/XugsyBSnZ5UbYHTDhUrcUBzbU=;
	b=Yl1boJy/50D6Wjq3SOAlL/o0+XvMPqcfrilr6fV0biK2IcHtz799eHvNmW1iwIhAhKX6
	 SDQx40zGDFtbcJNtjFoi60COFjV4yPGgBcwC2TaWGvVppUnFQ+at32YiOYhiN3xAOBO+H
	 8GWa2xVOh1aNx8Sau7RFC4G1A42E80SPPdc73IludwyspTq4/BavuGPJClrEiGIacUqLb
	 CchrWECp0SZfwn5JCHC9guhZuCbZj9zhyb6dtjW8BWSGEmxxMMgx9BB2RUX0mSJAgOzyR
	 tGDq16jr6h5LU0Ay3xixbovmxx5mS50EXHDfUUD+X0aWthRrNIOvQNpqkKFROFkMGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THb+1w0C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7478606A881
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THb+1w0C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9531F000CA;
	Tue, 17 Nov 2026 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959677;
	bh=/u/EKDBrcBS9hc0fY/XugsyBSnZ5UbYHTDhUrcUBzbU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=THb+1w0Ck3+BAW/MUzywWlus4fWVx+Te4znT4TxuffQbAtNA8GdgubC8Z65lI6ead
	 jsXZTjXA6GAk2kPXISmuktmBwRxtGZSy6aFvPGXQZdSLcHD+YoLRDSgK4ItlCooxbJ
	 /+iePiJVRwWa3CRKKPIphFkjiHPtE3kS2nIGCkECOKn5eY/3IYEh5qBW1twTnJ7vbT
	 PkPjy5hqHPBkhYUOKAHxri4M8O5ieUiy+7PA68jaZUiFfsmmI+3llXWQCTAApAMQX/
	 f0m7UwsgW9NXSD4qHliXjUM2ejzhftg12Pl3w4+15ayCJjK9xXhnG/nHV8iFwWVHyk
	 faDa2V85NJUkQ==
Subject: Re: [PATCH net 5/6] ice: propagate ETH56G deskew poll failures
From: netdev-bot+sashiko@kernel.org
To: anthony.l.nguyen@intel.com
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 michal.swiatkowski@linux.intel.com, poros@redhat.com,
 david.m.ertman@intel.com, pengpeng@iscas.ac.cn, przemyslaw.kitszel@intel.com,
 vinicius.gomes@intel.com, sridhar.samudrala@intel.com,
 aleksandr.loktionov@intel.com, horms@kernel.org, alexander.nowlin@intel.com
Date: Tue, 17 Nov 2026 23:54:36 +0000
Message-ID: <179495967625.3136.6756400467139907257@kernel.org>
In-Reply-To: <20261113231225.1864810-6-anthony.l.nguyen@intel.com>
References: <20261113231225.1864810-6-anthony.l.nguyen@intel.com>
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

- [Medium] This patch makes a DESKEW_0.VALID poll timeout in
  ice_ptp_calc_deskew_eth56g() a hard failure (-ETIMEDOUT).
- [Low] The patch adds new error returns to ice_phy_set_offsets_eth56g():
  a PHY_REG_DESKEW_0 sideband read error, and -ETIMEDOUT when…

--

ice: propagate ETH56G deskew poll failures

This changes ice_ptp_calc_deskew_eth56g() to return an error code and
pass the deskew value back through an output parameter. The poll now
stops on a register read error. Both read errors and poll timeouts are
propagated, and ice_phy_set_offsets_eth56g() returns early when the
deskew calculation fails.

> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> index 3a41c711e751b..da48d3adf94f5 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
> @@ -1736,24 +1736,30 @@ static u32 ice_ptp_calc_bitslip_eth56g(struct ice_hw *hw, u8 port, u32 bs,

[ ... ]

> -	read_poll_timeout(ice_read_ptp_reg_eth56g, err,
> -			  FIELD_GET(PHY_REG_DESKEW_0_VALID, deskew_i), 500,
> -			  50 * USEC_PER_MSEC, false, hw, port, PHY_REG_DESKEW_0,
> -			  &deskew_i);
> +	ret = read_poll_timeout(ice_read_ptp_reg_eth56g, err,
> +				err || FIELD_GET(PHY_REG_DESKEW_0_VALID, deskew_i),
> +				500, 50 * USEC_PER_MSEC, false, hw, port,
> +				PHY_REG_DESKEW_0, &deskew_i);
>  	if (err)
>  		return err;
> +	if (ret)
> +		return ret;

[ ... ]

> @@ -1805,11 +1814,16 @@ static int ice_phy_set_offsets_eth56g(struct ice_hw *hw, u8 port,
>  	if (sfd)
>  		rx_offset = add_u32_u32_fx(rx_offset, cfg->rx_offset.sfd);
>  
> -	if (spd < ICE_ETH56G_LNK_SPD_40G)
> +	if (spd < ICE_ETH56G_LNK_SPD_40G) {
>  		bs_ds = ice_ptp_calc_bitslip_eth56g(hw, port, bs_ds, fc, rs,
>  						    spd);
> -	else
> -		bs_ds = ice_ptp_calc_deskew_eth56g(hw, port, bs_ds, rs, spd);
> +	} else {
> +		err = ice_ptp_calc_deskew_eth56g(hw, port, bs_ds, rs, spd,
> +						 &bs_ds);
> +		if (err)
> +			return err;

[Severity: Medium]
Is it intended that a DESKEW_0.VALID timeout now aborts the whole PHY
timer start?

Before this patch, a timeout could only leave the Rx deskew wrong. The Tx
offset was still written and the PHY timer was still synced.

With this early return, a -ETIMEDOUT from ice_ptp_calc_deskew_eth56g() on
a 40G/50G2/100G port skips the PHY_MAC_RX_OFFSET write. It also skips the
PHY_MAC_TX_OFFSET write, which doesn't depend on deskew. The error then
unwinds through:

ice_ptp_port_phy_restart()
  ice_start_phy_timer_eth56g()
    ice_phy_cfg_mac_eth56g()
      ice_phy_set_offsets_eth56g()
        ice_ptp_calc_deskew_eth56g()

ice_phy_cfg_mac_eth56g() returns without writing PHY_MAC_MARKERTIME.
RX/TX_MODULO, TSU_CONFIG and BLOCKTIME have already been programmed for
the new speed at that point.

ice_start_phy_timer_eth56g() has already called
ice_stop_phy_timer_eth56g(), which cleared TX/RX_OFFSET_READY. It now
returns without loading INCVAL into PHY_REG_TIMETUS, issuing
ICE_PTP_INIT_INCVAL, calling ice_sync_phy_timer_eth56g() or setting
OFFSET_READY back to 1.

Can anything recover the port after this? In ice_ptp_port_phy_restart()
the E825 branch only logs the error:

	case ICE_MAC_GENERIC_3K_E825:
		err = ice_start_phy_timer_eth56g(hw, port);
		break;
	...
	if (err)
		dev_err(ice_pf_to_dev(pf), "PTP failed to set PHY port %d up, err %d\n",
			port, err);

The ICE_MAC_GENERIC branch sets ptp_port->tx.disabled, but this branch
does not, so Tx timestamp requests are still accepted. Nothing retries
either, so Rx and Tx timestamping on the port appear to stay down until
the next link event.

This patch carries a Fixes: tag. Should the commit message mention that
a deskew poll timeout now turns degraded Rx accuracy into a total loss
of timestamping on the port?

> +	}

[Severity: Low]
This isn't a bug, but the kernel-doc for ice_phy_set_offsets_eth56g()
still says:

 * Return:
 * * %0     - success
 * * %other - failed to write to PHY

With this change it can also return a PHY_REG_DESKEW_0 read error, or
-ETIMEDOUT from the poll.

ice_phy_cfg_mac_eth56g() ("%other - failed to write to PHY") and
ice_start_phy_timer_eth56g() ("%other - PHY read/write failed") pass
these errors up unchanged, and their comments don't mention them either.

Should these comments be updated along with the one for
ice_ptp_calc_deskew_eth56g()?

> +
>  	rx_offset = add_u32_u32_fx(rx_offset, bs_ds);
>  	rx_offset &= ICE_ETH56G_MAC_CFG_RX_OFFSET_INT |
>  		     ICE_ETH56G_MAC_CFG_RX_OFFSET_FRAC;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113231225.1864810-1-anthony.l.nguyen%40intel.com
