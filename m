Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120265;
	b=365rKDIvTycjPjCW8/zssIuS36mzwWZ16NZo8hQS1UQHsBfPzcE1X8DuB4CYbTgbgysS
	 aFM/+C401FgSXneX5Qbi7FkGNWsyaCzoDeTCVyYYVmmBdODUx0ZHunSnhqE3nx2gK7S+L
	 /ydrW9YYLkg2x9gYIWVwFBR7lL4ibmGzgFc11Zv/kTYZB+B8zAYt3cD0Hc6hWL47gbKVP
	 uQSqzgVUa1fwLMN+nLQl5OpO+Jcrwed5pAEhvaKyM48vpRYD7qi54zuY/n+15QkWgu3aY
	 DDErnKrH25qMDjwMHxg7t0OM9+FfhVzUKBWZ2swN4Iy4Fayq8JG2FwrbGKKsVf3F9zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120265;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TrkuMtIGWoLDi5y84LycG4g5aCQNBBu4YbeTaQti2KU=;
	b=1MSehl9xg2ffUql24ETtb94sFdnkql2kpBtP06kHesAqKXWcdmbGkSvxI9tUY+egUmaH
	 G3jMHrV/UpO7F3igCjzFWZqK+Mmn7a0QbnyIXLElek+yqx4KwGlIynvs/r/Xc0GBQtHlw
	 hDZVvBP9nAO72QbKPjinVrysgpzJKUvzYE+RamGRv7Csg6J1nHXZQWONiD4LFO4uHGRqT
	 eGVbum9IHIF027aSFaHgZOdSsblj4X2d9R1h2w5gotRvnmoFOY0ODc/Dc/OjUxWtNgFKf
	 HSMdU1fQOeawnexGbn7tSXsG4jgz7EoS6SiL7E0E42r5vBlyla7Jj3uN9KUTV8AJfxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PrDKLUuX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F03C606A335;
	Thu, 19 Nov 2026 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PrDKLUuX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C411F000D1;
	Thu, 19 Nov 2026 20:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795120265;
	bh=TrkuMtIGWoLDi5y84LycG4g5aCQNBBu4YbeTaQti2KU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PrDKLUuXhFB0V6Pz+4UpSzGjF+5O8G/CiDVJDDuII81R+m2R9gzkbSpL0gaNxBiPj
	 hlMBfpmGSDknIBdY1auprou4UbKDmKHfkO1i2+7naAsCNvWOCFrAyRvgKUCLG2AAtM
	 SrtiZAArddKUtwZ+vBbT6cWuLm2esgux2P9XHWWYytGHE4slZXrm+yKgYWf4ZOzZVJ
	 qb9xJ/Zl+jzPuCCtjsOupIQKG+W79sK/B9nlnNGUvH3Sv+Wrdfzgf2b9LbHRAYdfID
	 gDTKIuAGiqoQhQU43tgsdgWkigAlJ+O8owCXr5qxddPfJv3+dakIjKzVpAUA0jQ2u+
	 PRv+uyiULnXSg==
Subject: Re: [PATCH net 2/4] net: bcmgenet: restart DIM from the default
 profile on ring init
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 justin.chen@broadcom.com, pgynther@google.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com
Date: Thu, 19 Nov 2026 20:31:04 +0000
Message-ID: <179512026414.3136.5512333445190926749@kernel.org>
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
References: <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch fixes the 'cancelled profile work leaves DIM stuck in
  DIM_APPLY_NEW_PROFILE' bug only for close/open.

--

net: bcmgenet: restart DIM from the default profile on ring init

The patch clears struct dim in bcmgenet_init_dim() and sets profile_ix to
NET_DIM_DEF_PROFILE_EQE. A close that cancels the pending DIM profile
work can leave the state machine in DIM_APPLY_NEW_PROFILE, and this reset
keeps it from staying stuck after the next open.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 70c6a6465c81e..96620d2986777 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -2702,8 +2702,11 @@ static void bcmgenet_init_dim(struct bcmgenet_rx_ring *ring,
>  {
>  	struct bcmgenet_net_dim *dim = &ring->dim;
>  
> +	memset(&dim->dim, 0, sizeof(dim->dim));
>  	INIT_WORK(&dim->dim.work, cb);
>  	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
> +	/* Match the profile bcmgenet_init_rx_coalesce() programs */
> +	dim->dim.profile_ix = NET_DIM_DEF_PROFILE_EQE;

[Severity: High]
Can the same stuck DIM state still happen through Wake-on-LAN
suspend/resume?

The reset only runs from bcmgenet_init_dim(). Its only caller is
bcmgenet_init_rx_ring(), which is reached through bcmgenet_init_dma().

The WoL branch of bcmgenet_suspend() goes through the same cancel that
the commit message describes for close:

bcmgenet_suspend()
    if (device_may_wakeup(d) && priv->wolopts) {
        ...
        bcmgenet_disable_rx_napi(priv);
        disable_irq(priv->irq1);
        ...
    }

bcmgenet_disable_rx_napi()
    napi_disable(&ring->napi);
    cancel_work_sync(&ring->dim.dim.work);

Suppose the last net_dim() call set dim->state = DIM_APPLY_NEW_PROFILE
and scheduled the work just before this point. The work is cancelled,
and bcmgenet_dim_work() never runs. It is the only place that moves the
state back to DIM_START_MEASURE.

On resume, the fast path in bcmgenet_resume() re-enables RX NAPI without
reinitializing the rings:

bcmgenet_resume()
    if (priv->tx_cbs && (reg & CMD_RX_EN)) {
        /* Successfully exited WoL, just resume data flows */
        ...
        bcmgenet_enable_rx_napi(priv);

That means bcmgenet_init_dim() is not called, so the new memset and
profile_ix reset never run. After that, every net_dim() call hits:

    case DIM_APPLY_NEW_PROFILE:
        break;

Adaptive RX coalescing stays frozen until the next ifdown/ifup. Also,
profile_ix already points at the new profile, while the
DMA_MBUF_DONE_THRESH and DMA_RING0_TIMEOUT registers still hold the old
values.

Toggling adaptive coalescing through ethtool doesn't seem to recover
from this, since bcmgenet_set_ring_rx_coalesce() never touches
dim.state.

Would it work better to reset ring->dim.dim.state, and re-sync
profile_ix, in bcmgenet_disable_rx_napi() right after
cancel_work_sync()? That would cover both close and WoL suspend.

The later patches in this series ("net: bcmgenet: reset the Rx discard
count with the ring" and "net: systemport: accumulate the DIM packet and
byte counters") don't touch this path, so the gap is still there at the
end of the series.

>  	dim->event_ctr = 0;
>  	dim->packets = 0;
>  	dim->bytes = 0;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088%40tipi-net.de
