Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100986;
	b=TS/XfK0722+2BLvgnIqYYJD22ZEaBIQU2aIspDw/jyso8iYS9BnfHP1aLbm3Odf0snsQ
	 Nmc7nZLmA+1q+rTZtC8U6EyBo2HN/n05GLXBgnNY/F1mEdKqdhmRPGIuvw6RdyjA3Kohw
	 +9fj0DnGGHINtsS/sdVa0LwgzRLm/I+suzLp2FBs9H/BCZuat7I8417ghh2O0L42ib8HW
	 9XVRederWdfsANaOPF77vpIIH8cT2FSeoCqhJgICirRciBClBttjZt0cN51r3S+B2ShKE
	 W1qLhQdrda3qcxrKQ4N6N1Yhk5dCxKggenlN0nBJLFLNpgkDL15vg+5l423EoN06MGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100986;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=itmh28cvNAL6dJYtrjYa4fc1UlzlKqtHtZSTzw5oYKA=;
	b=GffyX4yhFwO455CFglEnEMMbZvFl1k0TeQHoQzLbJ2PsFrI33Fh+snUfTC+bJpKhkITD
	 ltUmuoZ0DheZwIjBXXwKwcoySMnqvJoxNf+yn1wXr9WYBRhGQOM+SsNRmI60WbeUjlFyT
	 YADGd4PCe9Mu7Qn8asr06ht4p/6b4aFgCbfSR6trsWgs7caqf6bIKwDLDQgxCYGX0FkNI
	 +RhndAqellfP1cAPiJVMU1aPJQQ5OUymLUv4gcRnOL4LI127LY+fA4HfRBf91/Cdq3Qo8
	 bXNAT1CzLmE1yliJo3j4raUGOcx9Z2w+d4ju1JzdCSLV5oDmNDhVJyd9Xam9/ntyYcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ri4qu/Oq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3846606A337;
	Thu, 19 Nov 2026 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ri4qu/Oq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3257D1F000C4;
	Thu, 19 Nov 2026 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100986;
	bh=itmh28cvNAL6dJYtrjYa4fc1UlzlKqtHtZSTzw5oYKA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ri4qu/OqG5PS5v8xCg8IgrW60M+8TSO+n53JCNqUalLCP80H9gEIBcsMYf5y56OKL
	 NwkQpvmXKh9nb3x7qBEdJ8zBTpILVOExiphKWVaEm3AbinP4om8Ap2Mx4yOTNREyg7
	 6hqptaVoJLyUbN6zHY3bMQneJ64tWdwFMZV3+7AQ8PQy49b3IGN8w99bUgymk3FJ3Y
	 c7Vi8QtqN8cD9hlnODR+DeZttk+huNKeSa/x+3xKEcJRIZYLhi8+EEU13J1w43VDSq
	 n5NUQJ5oSgS+05imrTmaiB9nnjJCebsuQrc4JjixFsvtM8uHbihM+yqv5VR0xCENo9
	 dPapHp/4SpuYw==
Subject:
 Re: [PATCH net-next v2 3/5] net: rnpgbe: Support copper link configuration
From: netdev-bot+sashiko@kernel.org
To: dong100@mucse.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, yaojun@mucse.com
Date: Thu, 19 Nov 2026 15:09:45 +0000
Message-ID: <179510098578.3136.17685116330600350297@kernel.org>
In-Reply-To: <E783BBD6D9CACAEF+20261116031032.1330270-1-dong100@mucse.com>
References: <E783BBD6D9CACAEF+20261116031032.1330270-1-dong100@mucse.com>
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

- [Medium] rnpgbe_set_link_ksettings()
  (drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c) only updates its…

--

net: rnpgbe: Support copper link configuration

This adds set_link_ksettings support for copper ports, covering
autonegotiation, advertised link modes, forced 10/100 speed/duplex and
MDI/MDI-X selection. Requests to change the firmware-reported port type
are rejected. PHY_LINK_SET is also switched to the event-coalescing
mailbox transport.

> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
> index 0afeda19f4ea9..d856b970e5a50 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c

[ ... ]

> +static int rnpgbe_set_link_ksettings(struct net_device *netdev,
> +				     const struct ethtool_link_ksettings *cmd)
> +{

[ ... ]

> +	if (!mdix)
> +		mdix = mucse->hw.mdix_ctrl;
> +	if (mdix != ETH_TP_MDI && mdix != ETH_TP_MDI_X &&
> +	    mdix != ETH_TP_MDI_AUTO)
> +		return -EINVAL;

[ ... ]

> +	err = mucse_mbx_set_link(&mucse->hw, advertising, autoneg,
> +				 autoneg ? 0 : cmd->base.speed,
> +				 autoneg ? 0 : cmd->base.duplex, mdix);
> +	if (!err) {
> +		mucse->hw.mdix_ctrl = mdix;
> +		mucse->hw.link_config.advertising = advertising;
> +		mucse->hw.link_config.speed = autoneg ?
> +			SPEED_UNKNOWN : cmd->base.speed;
> +		mucse->hw.link_config.duplex = autoneg ?
> +			DUPLEX_UNKNOWN : cmd->base.duplex;
> +		if (autoneg)
> +			mucse->hw.link_config.status |= MUCSE_LINK_AUTONEG;
> +		else
> +			mucse->hw.link_config.status &= ~MUCSE_LINK_AUTONEG;
> +	}
> +
> +	return err;
> +}

[Severity: Medium]
What happens to the cached link settings if mucse_mbx_set_link() fails
only because the ack poll timed out?

By the time the poll starts, the PHY_LINK_SET request has already been
written to shared memory and the doorbell rung:

mucse_write_mbx_pf_coalesce_event() {
    ...
	for (int i = 0; i < size_in_words; i++)
		mbx_data_wr32(mbx, MUCSE_MBX_FWPF_SHM + i * 4,
			      le32_to_cpu(msg[i]));

	hw->mbx.fw_ack = mucse_mbx_get_fwack(mbx);
	mucse_mbx_inc_pf_req(hw);
	mucse_release_mbx_lock_pf(hw, true);
    ...
}

After that, mucse_write_mbx_coalesce_event() calls mucse_poll_for_ack(),
which can time out after mbx->timeout_us. The error goes straight back to
the ethtool caller.

If firmware still applies the request late, the driver keeps the old
hw.mdix_ctrl, link_config.advertising/speed/duplex and the
MUCSE_LINK_AUTONEG bit. Would rnpgbe_get_link_ksettings() then report
settings that differ from what the PHY is running?

A later set call that leaves eth_tp_mdix_ctrl at ETH_TP_MDI_INVALID falls
back to the cached value:

	if (!mdix)
		mdix = mucse->hw.mdix_ctrl;

Could that send the stale MDI/MDI-X setting back to firmware?

Before this patch, mucse_mbx_set_link() was only called during probe,
where a failure aborts probe. This patch makes it a runtime ethtool
operation, so the mismatch can now be reached.

Would it make sense to invalidate or re-sync the cached configuration
when the command was sent but no ack came back?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BD205A7832D36E7D%2B20261116030917.1329989-1-dong100%40mucse.com
