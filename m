Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740359;
	b=0rcChv9kLKKSV9e+VXYrq8jj+ujzAjoFzMISIJTebnsMTG04bFFMrz3gmUs5/KfClz5k
	 hI8wsBwfkbtZRXq9koe5S1rV52OC/nYJmIQqGzZywyfsKb2q/+Z9h2COVUsZdgLsTmjvr
	 LIdT8Bu/nV0yPo07Xp6V0FUJSH9NUVx7g5/2Zuv6c4aciDg8axgAEnpvbtQQHh+gGhrkU
	 ls4Wc+mrx+uMaYuBIWcmB1J5z4mw9uAztK/kIJPpnEHZH9erl8H85LaCi+e6MbI3TaC78
	 Pd7uCWrp3gHymy0LInC4rba3qEHq68ScQqJQ4GT5CJQUprLKrkJSzyCq5c5mxrnjuhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740359;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tFdKLz54iQrlkDZ48SxnuazP3NJxOYp76VY6rsImWhM=;
	b=QrLbNsA+Fg3zI8UT9osgjFpTF9M3fgfCKOstN4FnxC7K+3sYjM2Skjov7sNBr68TkU9O
	 pcvW3tHi+MiTTaulAIue/hpcNUBCzmh/iCxdIjJXC0aQycNsdawnHX/f8YT5qkatzZNzm
	 fYYmlpl7UKT1hJdGNzc2MNO2umx8ziMr/doLWKPFAtu+D4UNxJ0hRK0VgWB1JJF2zD4/z
	 grlW/3s7ZneVkDPV8QsAN18vnSXBKl/LwoLHpxJtJcGZ+04V2fo3syQzz2opUrEgwAR+m
	 Yt1SGszzKEJMHH6UX/J14UloVxbipxtrYUTk/dpW5fxNDcx98Mp08YHb7dc9CWGIcmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNiRF1yX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E76606A31E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNiRF1yX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1141F000C4;
	Sun, 15 Nov 2026 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740359;
	bh=tFdKLz54iQrlkDZ48SxnuazP3NJxOYp76VY6rsImWhM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cNiRF1yXd/UJuGrrFP2iL9Z24h3Vy6MEfwXRhCaYsw1nq3Y9y9sTjp0K+xq2h6zL+
	 k+wqEi+EirbkeGMxfUeK+CbZO1E0wOeqJsTBQ2nDUUAIRLaVXK9EwX9BmtXRlx3HJa
	 DzfsEKbRVmdjurbMC1zVAxQnxp63rt1CxkMQqDDsNG4+MMrHfyUVJ5STO6xyeLmxrQ
	 5+LL/PVmEWiF+2f32yMslvzqHgDIj7lsR4NRyozsUaUc4ynYyxj+EeeSXBl0WSo3zM
	 fzKIS+b8TONVimH8TAGWwCddiNvDAWE+zMAyhAVKhI+8ARi+yBm+IEkrx86KHEf+2N
	 BA/VZsgdHR8jw==
Subject: Re: [PATCH net] net: marvell: prestera: disable port before changing
 its MAC mode
From: netdev-bot+sashiko@kernel.org
To: kaloz@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 enachman@marvell.com, oleksandr.mazur@plvision.eu
Date: Sun, 15 Nov 2026 10:59:18 +0000
Message-ID: <179474035815.2199510.3439417604844193452@kernel.org>
In-Reply-To: <20261111101521.9878-1-kaloz@kernel.org>
References: <20261111101521.9878-1-kaloz@kernel.org>
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

- [Medium] The new disable/re-enable step in prestera_pcs_config()
  (drivers/net/ethernet/marvell/prestera/prestera_main.c) only runs when…

--

net: marvell: prestera: disable port before changing its MAC mode

This commit makes prestera_pcs_config() disable an already enabled port
before it writes a new MAC mode or inband setting. Without this, the
firmware can report link down and never report link up again.

> diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
> index a82e7a8029851..39ebd1944be55 100644
> --- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
> +++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c

[ ... ]

> @@ -339,6 +340,17 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>  		break;
>  	}
>  
> +	/* Firmware may not report link up after the mode or inband setting of
> +	 * an enabled port changes until the port is disabled and re-enabled.
> +	 */
> +	if (old.admin && (old.mode != cfg_mac.mode ||
> +			  old.inband != cfg_mac.inband)) {

[Severity: Medium]
Does this check catch a change between 2500BASE-X and SGMII?

The PRESTERA_MAC_MODE_* values in prestera_hw.h include no 2500BASE-X
mode. Both interfaces map to the same firmware mode earlier in
prestera_pcs_config():

	case PHY_INTERFACE_MODE_2500BASEX:
		cfg_mac.speed = SPEED_2500;
		cfg_mac.duplex = DUPLEX_FULL;
		cfg_mac.mode = PRESTERA_MAC_MODE_SGMII;
		break;
	case PHY_INTERFACE_MODE_SGMII:
		cfg_mac.mode = PRESTERA_MAC_MODE_SGMII;
		break;

The only field that tells them apart is the speed value that
prestera_hw_port_mac_mode_set() sends to the firmware.

Say phylink moves an enabled port between these two interfaces and the
inband value stays the same, for example when a 2.5G SFP is swapped for
an SGMII copper module. Then old.mode == cfg_mac.mode and
old.inband == cfg_mac.inband. The disable step is skipped and the
SerDes rate changes on a live port.

This looks reachable for two reasons:

- port->cfg_mac.admin stays true across module swaps.
  prestera_mac_link_down() only clears state_mac, and there is no
  pcs_disable op.

- prestera has no pcs_inband_caps op, so phylink_pcs_neg_mode() can pick
  PHYLINK_PCS_NEG_INBAND_ENABLED for both 2500BASE-X and SGMII. That
  makes old.inband == cfg_mac.inband == 1 possible.

There is a second gap. The SGMII case never sets cfg_mac.speed, so after
2500BASE-X the port keeps speed == SPEED_2500. Adding speed to this
comparison alone would still miss a 2500BASE-X to SGMII change. Would
SGMII also need to set its own speed here?

The source doesn't show whether the firmware needs a disable and enable
for a speed-only change within PRESTERA_MAC_MODE_SGMII. The commit
message only mentions the "mode or inband setting". Should the bounce
cover this case too?

> +		old.admin = false;
> +		err = prestera_port_cfg_mac_write(port, &old);
> +		if (err)
> +			return err;
> +	}
> +
>  	err = prestera_port_cfg_mac_write(port, &cfg_mac);
>  	if (err)
>  		return err;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111101521.9878-1-kaloz%40kernel.org
