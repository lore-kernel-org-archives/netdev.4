Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711525;
	b=S6WxdS5pCr21bGmkuMOigciIER2cWKuVfZCNXlbRkIZaBiLIOCyX9YJCdUQJhd174+dG
	 psdAujgqf9PqiBZGDT+ZzCCVDH5iwStsLqJQRNZvDw4aSMHTBA34IOQ44W/y1mAi3oBTb
	 47hg3nyEuKe81PNdcaRioLa+aCHqoJKHKc3N7FCZazo4KqIwpzdootcByEaq4nH4zK6ez
	 qI7wbtYumuZ8uv+gyalg5q1Op9oCnrDHYvC58yYot1E/li2e0jKTid0VKDhmmap6djyZl
	 ph9V3iP9hstWwdt1QifSZXJSfRKvofQ6ZU6DYsfVauTsZHKI68k5aR0eEtF3Nq1/cJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711525;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UHhBZ5Uxp8/lUbBSy2xJRw/vE4j4zkIMEJqynNMt8sM=;
	b=jOqjZXSt4uKiJJaoES0+shWlcP2j5pOyWkOxSBaqoxW/+0AGfr0IHVl+V/XvCY2oPdE9
	 VArNLeCDegzgriJlCPV2mH0XZSE2peMUHP73ZYh4sW0aVM96G1v39HJuv0vsTuDoEIzOK
	 deRTdIa5TrhTjfzgykV5xFsX6FT8IQ9NoFUY0tj0BBOfOBzMA6El2NWAecaBUtuvL1jbV
	 6aIdTb7rFGgDo+1hgygRFKAe2wYYT5Rl8TtqxxJB4Q1UdZl8jvycp/3ITb8KZns95v2zQ
	 63TPSGy8Yi3A7tkoQIUu4dk8fzUV3mauyOQusq52UPI82t8yQnzwjHq2ZYAKoIW/C1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B19D+lQx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C46606A31C;
	Thu, 26 Nov 2026 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B19D+lQx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0191F000D0;
	Thu, 26 Nov 2026 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711524;
	bh=UHhBZ5Uxp8/lUbBSy2xJRw/vE4j4zkIMEJqynNMt8sM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B19D+lQxF/1G68HXkUW5LKi6A9FfsicKZeuwVabLs/u9mJz1Z6Df/Mj44/mkYMHWS
	 0szjGrViOgksZnk0m0Y7/Pr7LQo0YqbPwL7q6/5pgCyuxXRX5Zr+OCArL6EqiDwDs4
	 VJ9W7eAwEve69wJbEG3c6+vVyqmKvxPh84aNVOlBGfUiIoeX3NpWOAz+TU39bUiF7B
	 aTa8HKWXAkpZG8Mywftn3xgs/t48PmtlSUN8Ev9ea/h8GYZescFitZEt2lO6ZdbVFH
	 6lW1QwcevBw63MgcGKJ8MQWVDX31/4f7aPX3Twf9t/XkkxOzZpHJDA6y5jGtjVbTfn
	 m2bv55b8DGo8Q==
Subject:
 Re: [PATCH net-next v8 1/3] net: macb: cache ENST config across link down/up
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com,
 vineeth.karumanchi@amd.com
Date: Thu, 26 Nov 2026 16:45:23 +0000
Message-ID: <179571152363.3135.15940503307792785015@kernel.org>
In-Reply-To: <20261124-macb-set-channels-v8-1-770cf8e50e6d@bootlin.com>
References: <20261124-macb-set-channels-v8-1-770cf8e50e6d@bootlin.com>
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

- [Medium] In macb_mac_link_up()
  (drivers/net/ethernet/cadence/macb_main.c), when the link comes back…

--

net: macb: cache ENST config across link down/up

The macb driver now keeps the ENST (taprio offload) config in bp->enst
and writes it again on every link-up. If the link speed has changed, the
cached config is dropped with a warning. The commit also caches the link
speed in bp->speed_mbps, serialises the taprio paths with
bp->mac_cfg_lock, and removes the pm_runtime_suspended() check.

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
After the link comes back at a different speed, the cache is zeroed.
macb_apply_enst_config() then sets the disable bits for every queue and
writes 0 to the per-queue timing registers. ENST_CONTROL is not enabled
again, because of this check:

	if (bp->enst.queue_mask)
		gem_writel(bp, ENST_CONTROL, bp->enst.queue_mask);

>From then on the MAC applies no gate control at all. Only a netdev_warn()
reports this.

Does the taprio qdisc still report a fully offloaded schedule in this
state? netdev->num_tc and tc_to_txq are left as they were, since only
macb_taprio_destroy() calls netdev_reset_tc(). In offload mode the taprio
core does not call ndo_setup_tc again on link changes, so nothing
reprograms the hardware.

Can the schedule ever come back without the user reinstalling the qdisc?
struct macb_enst stores only on/off times already converted to bytes for
one speed:

	config.queues[queue_id].on_time_bytes =
		enst_ns_to_hw_units(entry->interval, bp->speed_mbps);
	config.queues[queue_id].off_time_bytes =
		enst_ns_to_hw_units(off, bp->speed_mbps);

macb_taprio_setup_replace() discards the nanosecond intervals from
tc_taprio_qopt_offload. Because of that, macb_mac_link_up() cannot
recompute or re-check the schedule for the new speed. It also cannot
restore it if the link later comes back at the original speed, for
example after a temporary PHY downshift or a cable swap.

Would it work to keep the ns intervals in bp->enst, then re-validate and
recompute the byte values on each link-up? The schedule would then
survive whenever it still fits the new speed.

>  	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
>  		macb_set_tx_clk(bp, speed);
>  		gem_shuffle_tx_rings(bp);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-macb-set-channels-v8-0-770cf8e50e6d%40bootlin.com
