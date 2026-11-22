Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795377692;
	b=v302Ck64Ep1UctBLqruN63WlzURPONZbEiEWvgz/3ri896Usj9Nz2kYDFjtHoJOPlsdP
	 eaKsB8Yg4CkYYqXfNY4vBU0XIKbFBY7O1BHjtEHticDKzoCeCERRUKV+ywslkD8EImUPb
	 yQ6Aa0klm2pXBejGqMLnwkodn0jhFe792hhrkMjmC7/mz734cFVjz2ogzY3Ci67N1z26D
	 klEROa5c7Bjitsbq8rl0vYexreawTxt5GCHFajAJLRwVkwUN1HFhskxmzEYPKjlw2z3hh
	 ojsrYoPjn3G7QvIfrEeqJs7cNnV2KmDM1Ku1CWtAO+5tS249FZZebgMOBjNgDkbOkaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377692;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZmXFmGYYUTSy92iO1DLvq3rahLhGYek7nLjORxdp2X4=;
	b=t3xOa321qPveuM8nJ1iSSxQrPBGzdGSfsbhVAzNpwkm+ALSLLapho4Tkg68PZNSngkci
	 /QRksm4xgDi4iDWFe6Ky1IOLPyl+5sXzlR50OllkZayVoArYkcUU6bs+suEz52WDRPZUp
	 hgKBv09modLLUoCPfQ8c9a2ZGQZW7wwwlNLUGMWQ7BbHZIf49T5LZ150hrRYZEIKQVB1a
	 RqrXwuC9DBOBFNe3aVZ+ocn/MUQfLZF3FduaQrMY28xBbXx2ub6xK/yT0sbDrayyA3zY6
	 f2mmn0XcPolq1o6PJ9zr7Z1L9xMiXTnXShxZInM30eOqcK92+SaJKVwPyHAINUOj5Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I5/QcWRt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B3606A333;
	Sun, 22 Nov 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I5/QcWRt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49FE1F000CF;
	Sun, 22 Nov 2026 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795377692;
	bh=ZmXFmGYYUTSy92iO1DLvq3rahLhGYek7nLjORxdp2X4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I5/QcWRtvAIlbtNNwyaCrQcxPiuUdxYhJ5PzoWCTqcSS8+2yTpq3bNv9rPMGpUwL9
	 zxMkW5eb1OlI/ovfmiqKxzGHc57vD1AEu666RNZS0DT1clSaLGNu/ZAZDnkKuEgkPU
	 F2t0G//YZSWVkSS/px+PeBGLACO4GpjYCBP6naZ5AQBm2Ar4ODIzL9h066YYtJEkVg
	 LZthX6SvXwKp7k28AkpsdUcRCKI9SFrMqoIxQHHiwJMLx+Jd7ZkkiMcq669RzLPWNI
	 3vCcK5HZ3IsClYB18R4bIcnH3hDzWwYW8KWcy3SFZUYxVSN+HTLN5odYDu1r4gmUAb
	 SINbg/XJdy3Jg==
Subject:
 Re: [PATCH net-next v7 1/3] net: macb: cache ENST config across link down/up
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com
Date: Sun, 22 Nov 2026 20:01:31 +0000
Message-ID: <179537769127.3135.3406600332849226108@kernel.org>
In-Reply-To: <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
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

- [Medium] In macb_mac_link_up()
  (drivers/net/ethernet/cadence/macb_main.c:1051), if the link comes…
- [Low] The commit message describes a user-visible defect in the
  existing TAPRIO offload, but the patch has no Fixes: tag.

--

net: macb: cache ENST config across link down/up

This patch caches the TAPRIO/ENST schedule in bp->enst and writes it
again from macb_mac_link_up(). If the link speed has changed, the cached
schedule is dropped instead. It also caches the link speed in
bp->speed_mbps, serialises taprio replace/destroy with bp->mac_cfg_lock,
moves the per-queue config from kmalloc to the stack, and removes the
pm_runtime_suspended() check.

> This causes trouble if the config is not compatible with the new open
> and link-up. The two issues that can occur are a link speed change (as
> all timings are configured in a unit relative to the link speed) or a
> change in the # of queues.

[Severity: Low]
Should this patch have a Fixes: tag?

The behaviour described here goes back to commit 89934dbf169e ("net:
macb: Add TAPRIO traffic scheduling support"). In that code, the ENST
registers are written only from macb_taprio_setup_replace(), using the
link speed at the time of the tc command. Nothing rewrites them on
link-up.

So after the link renegotiates to a different speed, the byte-unit
ON/OFF timings stay in hardware unchanged. The gate windows are then
off by the speed ratio, for example 10x for 1000 -> 100. If register
state is lost across close/open, the schedule silently stops being
enforced.

This patch depends on newer infrastructure (bp->mac_cfg_lock,
bp->link_up), so it may not backport as-is. Even so, would a Fixes: tag,
or a note on why this is net-next only, help record that released
kernels have this problem?

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 9f6111661b40d..1e06666921160 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c

[ ... ]

> @@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_config *config,
>  
>  	spin_unlock_irqrestore(&bp->lock, flags);
>  
> +	if (bp->enst.speed_mbps && speed != bp->enst.speed_mbps) {
> +		netdev_warn(bp->netdev,
> +			    "TAPRIO dropped because link speed changed\n");
> +
> +		memset(&bp->enst, 0, sizeof(bp->enst));
> +	}
> +
> +	macb_apply_enst_config(bp);
> +

[Severity: Medium]
What happens to the installed taprio qdisc when this branch is taken?

If the link comes back up at a speed other than bp->enst.speed_mbps,
the cache is zeroed. macb_apply_enst_config() then writes the disable
bits for every queue into ENST_CONTROL and zeroes each queue's
ENST_START_TIME, ENST_ON_TIME and ENST_OFF_TIME.

The taprio layer is not told about this. The qdisc stays installed in
full offload mode, so tc keeps reporting a hardware-enforced gate
schedule that the MAC no longer applies.

The schedule also does not come back if the link returns to its
original speed. Take 1000 -> 100 -> 1000: after the first change,
bp->enst.speed_mbps is 0, so this check is skipped and the zeroed cache
is applied again. Gating stays off until the user reinstalls the qdisc.

Nothing can recompute the schedule later, because struct macb_enst only
stores byte units. macb_taprio_setup_replace() converts the nanosecond
values and then throws them away:

    config.queues[queue_id].on_time_bytes =
        enst_ns_to_hw_units(entry->interval, bp->speed_mbps);
    config.queues[queue_id].off_time_bytes =
        enst_ns_to_hw_units(off, bp->speed_mbps);

Could entry->interval and off be cached in nanoseconds instead? Link-up
could then recompute the byte values for the new speed with
enst_ns_to_hw_units() and check them again against
enst_max_hw_interval(). A lower speed only raises the hardware limit,
so the schedule would only have to be dropped when it really no longer
fits.

The later patches in this series that add set_channels and the Tx SRAM
segment distribution do not change this path.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-macb-set-channels-v7-0-2dbc00f686af%40bootlin.com
