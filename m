Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445901;
	b=1M/25s49FYdqVmpl9AI1Oro6oPLfu+YN/N9FmrbxvBfEMELmueXsnLPoU9dq7IoEv+MF
	 RNXNzGYcDAZGEIe9JrDWp7AvvaRicQ1hGLwsR+YUhoVsTqP9+d1CiTqhxEMZAZkF04752
	 c8ZG8mFStzVHnQH6hcAcbVz10581EGhpwpb7UwF2TeJdGBu96tQ8+/duQW0tAZ9FfnlHy
	 s7NZIVOl0QPcBG5/5AM0LmKV2zgAuOFNDQN+QjRmPm34bTxCcM+y5qL7uzfZsv5d3+zwJ
	 /YbPA3+twJW2SzYeooyOQdBj4t3z+OYtgLfnN6Ti+qBiZvtqN8o7l0Wz/8Gtczz/lMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445901;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=os7fOfDtBzM5fGsJLR1+t01eUnVG/fiCJOyHPbpqHtA=;
	b=r5dkZLs3g10L6SYpp3D0WFOyUEmoSBej8rE2lVV7fOEEu+7v9EJFTpRIdp9Ocb4JCcq/
	 szK28Wyj7mYDK7DdeKc/U3Gx0q2jWw1Q7Ufm8S0U73JY8epHEPm9jCeY4hhmSOlz0qIUV
	 cV4ruQEsVoGHmMasjbjPjyuNjA+P675XOx1dbGMSOa5VKcomspLtCWqpCiLwgCDwbhoQB
	 rHhLcJf9dHVK7uygzFdHHR5xGfpKFSmyv18KU4oMmqrUpIqAZ432cIDF5qWrV//0r7jao
	 WhtGgaaaUC/rw+xs74Ie3aVTrdzN8mEHmsIh9W7g8OMwYdhjgEc0x7p5ag1m3XCIi7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1IgZrU4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A32606A33D;
	Mon, 23 Nov 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1IgZrU4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F3A1F0093C;
	Mon, 23 Nov 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445900;
	bh=os7fOfDtBzM5fGsJLR1+t01eUnVG/fiCJOyHPbpqHtA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I1IgZrU4sHU6197FiWiR9wAOGTGkqGbGOkkKlT4A6/zM+YQKtl20VeNQWcBUnwts5
	 9L2gGgMlXq+pO0NPy3p4/YZ/zZHqGRNn9TEZDM9+Z2cKQdjM/hh0aoK21vz6gRxOjY
	 yKo8hdw0HZ4zS09xyfVUZ3trjRM+dtYD8TfPM3ZU+PrX0/R2XGPTmBkJASy6zZAg1B
	 pOt17DwFnrw10CSuwy8qaesl8dg4sLC6FuNxWuE2NdAdkm0H4IuiMsoQZSlXuSZnqv
	 qAo/cm4Yd64/HgTwP+2tS0onlHps1ync7FBvOLX+1WgHTwIF9KwX59ulkDZw5K2yuc
	 Ra989EHZ0io4w==
Subject: Re: [PATCH net-next v3 7/9] net: sparx5/lan969x: scale the queue
 watermarks with the MTU
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:19 +0000
Message-ID: <179544589953.3135.16152141389643791611@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-7-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-7-55c272fe1acc@microchip.com>
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

- [Medium] At this commit (and at the next one, "scale the TAS guard band
  with the MTU"), sparx5_port_wm_set() in…
- [Low] This commit adds sparx5_port_wm_update() (sparx5_port.c:717) as a
  non-static function with a prototype in sparx5_port.h:94, but nothing…

--

net: sparx5/lan969x: scale the queue watermarks with the MTU

The commit now computes the QSYS PAUSE_START, PAUSE_STOP and ATOP
watermarks from the port MTU, plus the Ethernet header, FCS and two VLAN
tags, rounded up to whole buffer cells. Before, they were fixed multiples
of a 1518 byte frame. The watermarks are programmed at port init and when
pause is resolved. The commit also adds sparx5_port_wm_update() for MTU
changes and a per-port wm_lock.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> index 701d310df0ba6..87aa0b7841359 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c

[ ... ]

> @@ -676,24 +679,53 @@ int sparx5_port_fwd_urg(struct sparx5 *sparx5, u32 speed)

[ ... ]

> +/* Pause start/stop and tail drop at 6/4/20 frames of the port MTU */
> +static void sparx5_port_wm_set(struct sparx5 *sparx5, struct sparx5_port *port,
> +			       u8 pause)
> +{
> +	u32 len = SPX5_HW_MTU(READ_ONCE(port->ndev->mtu)) + 2 * VLAN_HLEN;
> +	u32 cells = DIV_ROUND_UP(len, SPX5_BUFFER_CELL_SZ);

[Severity: Medium]
At this commit, can port->ndev->mtu drift away from the MAC max frame
length?

sparx5_port_init() still programs a fixed max length:

	sparx5_port_max_len_set(sparx5, port, ETH_MAXLEN);

sparx5_port_netdev_ops has no .ndo_change_mtu. With the ether_setup()
defaults (min_mtu 68, max_mtu 1500), the core writes dev->mtu directly
and no hardware gets reconfigured.

Suppose the MTU is lowered to 68 with ip link. The next link-up then runs:

  sparx5_port_config()->sparx5_port_fc_setup()->sparx5_port_wm_set()

That gives len = 94 and cells = 1. PAUSE_START becomes 6 cells,
PAUSE_STOP 4 cells and ATOP 20 cells.

The MAC still accepts 1518-byte frames, which take 9 cells each. With TX
pause enabled, wouldn't one full-size frame go past PAUSE_START, so that
a pause frame is sent for every received frame? ATOP would also drop to
about two full-size frames, which means heavy tail drop. That is the
problem the commit message describes, only triggered by a smaller MTU
instead of a larger one.

The problem is also present at the next patch, "scale the TAS guard band
with the MTU". The final patch of the series, "net: sparx5/lan969x: add
support for changing the MTU", fixes it. It adds
sparx5_port_change_mtu(), which returns -EOPNOTSUPP when FDMA is not in
use. Otherwise it calls sparx5_port_max_len_set() with
SPX5_HW_MTU(new_mtu) and then sparx5_port_wm_update(). So this only
affects the intermediate bisection points.

Could the series be ordered so that the watermarks and the MAC max length
stay in sync at every commit?

> +	u32 pause_stop = 0xFFF - 1; /* FC gen disabled */
> +

[ ... ]

> +}
> +
> +void sparx5_port_wm_update(struct sparx5 *sparx5, struct sparx5_port *port)
> +{
> +	mutex_lock(&port->wm_lock);
> +	sparx5_port_wm_set(sparx5, port, port->wm_pause);
> +	mutex_unlock(&port->wm_lock);
> +}

[Severity: Low]
This isn't a bug, but sparx5_port_wm_update() is non-static and has a
prototype in sparx5_port.h, yet nothing calls it at this commit.
sparx5_port_netdev_ops has no .ndo_change_mtu yet, so the MTU-change part
of this patch is not connected to anything.

This comment in sparx5_port_disable() also refers to an MTU-change path
that does not exist yet:

	/* 5: Disable Flowcontrol, and keep an MTU change from re-enabling it */

The first caller is sparx5_port_change_mtu(), added by the final patch of
the series, "net: sparx5/lan969x: add support for changing the MTU". It
calls sparx5_port_wm_update() after WRITE_ONCE(dev->mtu, new_mtu), so the
READ_ONCE() in sparx5_port_wm_set() picks up the new MTU.

Could the helper be added in the same patch as its caller?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com
