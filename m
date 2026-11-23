Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473883;
	b=syh36eDRDvRlqn12MJTvg3CGYiNy/GZmbvR+b9pM7LR7eJeIaphlPQZuqs5uBg9be3Q1
	 w6Ra65SCo9r5XZobHwLPYwgAJFs0sCgoQmoTZnHstcPcqx9XhssJJ2xQ65Yil+TMUm/fF
	 LEHu2lqaVRAEbHBcupZUwjs6CVCuHKosmjvWS1zav444sW8RZGPiZCWyJcujujRwDo6tz
	 dcjMZpUO5BVRQ3IC8DiX/7V3aa0M+Gv8Ao9iAo0ZSvBmQ8KocojprFStpzN1D3jvrQQjw
	 5OucxVWx2hS3gttWCogn+jwEhCbdrDFYuf4UGYOCMBIxfaHuoeP8ilI4gFvRQfiO1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473883;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=c+0Ma9X2QkRN49uznkQtF/yuoBfodJySs+FWYvD0gu0=;
	b=fo4a2p9RMTZyP7RlH7x6G+fsrcdWXAgJyTnzgvxDwmZHIyWsvxLsECUJgkzTaWzC5z6s
	 95JiFDIIi+CsBeqwSkzcjK7D+lVtK9aauc9K2cvL6Axl8yVNxpAl5mYQPKeyl0GIY1tIf
	 S8Nu83ulQLsam889lr2jR9/rRtYEYwNRivEmfgJHUo7aIi3uRzs405P7cWF6d9b6gWsKt
	 ID2uuAGdmgAPubANgfmCBz17JMKuuKRCsf/4nE27ig7l+A/hltFM0liiFeQ4pcMZ4YPLv
	 xbbDesTeEuWceluwWN8HGB0kPjI1PcAdIVWfx/OcbZQDJEn0wfaNxp+5DPfQ/b503KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mq3cIE7P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C004606A31E;
	Mon, 23 Nov 2026 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mq3cIE7P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC52B1F000C0;
	Mon, 23 Nov 2026 22:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795473883;
	bh=c+0Ma9X2QkRN49uznkQtF/yuoBfodJySs+FWYvD0gu0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mq3cIE7PCEjhH331bS5NNxyABLMWSJtCf2wfgetyCLwuxYfE8ft2z6jPLU8N5nFaj
	 tDwnaQf9H2Hf36JzjYKAYbD8V6sG98G2K4e8mAZ31BdY+Sbw/FTOjXdzqdHzs1XJJi
	 dJXOnNaTnT8bz18xrCMP3b39KP45pEXLILiYDjjAxV9zBHzSpurw4HiKYjmIBm4vQD
	 UUvNtzr8Kj+gfihq8oXQtLqHcSKLBjKVxuNQ6LuUeFY6QBjxedY3y/h9zbOjyMfSSE
	 YIivlmk98BflO9hKhkYRAvJv+Hi5fU57jLo2YNW1gaU4Jh2pT36bVDjHIa764yRUW0
	 zIzZrLMJ06ZSQ==
Subject: Re: [PATCH net v2 1/5] net: bcmgenet: keep DIM from getting stuck
 after close or suspend
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 justin.chen@broadcom.com, pgynther@google.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 22:44:42 +0000
Message-ID: <179547388219.3135.3983701344870558554@kernel.org>
In-Reply-To: <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
References: <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
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

- [Medium] The patch fixes the profile-index/hardware mismatch only in
  bcmgenet_init_dim().

--

net: bcmgenet: keep DIM from getting stuck after close or suspend

The patch moves net_dim() so it runs before napi_complete_done() in the
RX poll, and it flushes the DIM work on close/suspend instead of
cancelling it. It also resets the DIM state in bcmgenet_init_dim() and
starts profile_ix from the default profile, so that it matches what
bcmgenet_init_rx_coalesce() programs into the hardware.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 4d2be2a21ed1b..f702916e7bfaf 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -2702,8 +2703,11 @@ static void bcmgenet_init_dim(struct bcmgenet_rx_ring *ring,
>  {
>  	struct bcmgenet_net_dim *dim = &ring->dim;
>  
> +	memset(&dim->dim, 0, sizeof(dim->dim));
>  	INIT_WORK(&dim->dim.work, cb);
>  	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
> +	/* Match the profile bcmgenet_init_rx_coalesce() programs */
> +	dim->dim.profile_ix = NET_DIM_DEF_PROFILE_EQE;

[Severity: Medium]
Does the same profile index mismatch still happen through the ethtool
path?

bcmgenet_init_dim() only runs from bcmgenet_init_rx_ring(), which means
on open or resume. The default profile is also written to the hardware
at runtime by bcmgenet_set_ring_rx_coalesce(), and that path does not
touch ring->dim.dim:

drivers/net/ethernet/broadcom/genet/bcmgenet.c:bcmgenet_set_ring_rx_coalesce() {
    ...
	if (ec->use_adaptive_rx_coalesce && !ring->dim.use_dim) {
		moder = net_dim_get_def_rx_moderation(ring->dim.dim.mode);
		usecs = moder.usec;
		pkts = moder.pkts;
	}

	ring->dim.use_dim = ec->use_adaptive_rx_coalesce;
	bcmgenet_set_rx_coalesce(ring, usecs, pkts);
}

Here is one sequence on a running interface. DIM moves to profile 3.
Then the user runs "ethtool -C ethX adaptive-rx off" followed by
"ethtool -C ethX adaptive-rx on". The hardware now has the default EQE
profile, but profile_ix, tune_state, steps, prev_stats and start_sample
still hold the values from before adaptive-rx was turned off.

On the next net_dim(), net_dim_decision() steps from the stale
profile_ix. bcmgenet_dim_work() then programs a profile that is a
neighbour of 3 instead of a neighbour of the default.

If tune_state is DIM_PARKING_ON_TOP and traffic is steady, no work gets
queued at all. The hardware then stays on the default profile while DIM
believes another profile is active.

This looks like the "profile index no longer matches the hardware"
state the commit message describes, reached here without any close or
suspend. Would it make sense to reset ring->dim.dim (state and
profile_ix) in bcmgenet_set_ring_rx_coalesce() whenever the default
profile is programmed?

A related case: when adaptive-rx is already on, any "ethtool -C" call
skips the default-profile branch. It writes the static
rx_coalesce_usecs/rx_max_coalesced_frames into every RX ring, while DIM
keeps its old profile_ix.

bcmgenet_get_coalesce() reports ring 0's hardware values. So in that
case, could rings other than ring 0 end up with ring 0's DIM-chosen
values while their own DIM state points somewhere else?

>  	dim->event_ctr = 0;
>  	dim->packets = 0;
>  	dim->bytes = 0;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a%40tipi-net.de
