Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704034;
	b=pJbXJ79nls9eKIevKZL27/CoNEBv40fl8fBYjV+X9TXz4PEsZx1PY42k0BY8nJAOm8zi
	 WfDfBJMZj5hxTH61i+HLFkuBN33BRNUy1kzwcALPSZritt6A3Lzmv1xRlkBVe5fDlv1M4
	 SkeIVfgY807G//VqnZq/nYAVplY4SET6Tsp7/dvP14GvW5FmPcMzkrAaxZL/xRz5nxp14
	 ZnQZm7WcadbHnqEf6wf1xUMsXgXkK8yxGGycqdH7QhBH29/4eoF4zxQdH6E1u/ULHGdXx
	 Hv6SuTe09PGLTgmkjTU0a5Tfs9/w1LHm0LGEYacvEJgIQ6ObqnP31bH0L7K3ZgED67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704034;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8bOqKt6i/mjU9uh6a3IWh+earNmPV7TkjMheMbMzmdc=;
	b=l8dRJe1g0z9L2eOOHprjI5n2QB98Sj6b9VSWIQktiCvZAmBr7Zoq71zXTVNm4ct5pFGV
	 /x9greBz0apTmbR4tscvu1tTIGsfes/s7AUGyOg0RAsqPHkZHxeetDntaUCYMxQj0tqLu
	 UQso87cqcCtEuaI0XwXdI8i2gTpfCV2XHtKPKuld3GHnb22dJYqxK+RLhed0vxn9oMoyt
	 AcFSXQYEU4n/dblRfvNkfZYHb0jMJH65ExWN+Qjfword46I9Oh8oL6C13jpXFG+xo4us7
	 1B537jxZwItpTZzNJ/Baca5hb66CE5zt6ndR+ZDRbQ/RJjU09TiqqD3DEH5yTLC39Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vtqcsh9+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A8D606A331
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vtqcsh9+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBA61F000C4;
	Thu, 26 Nov 2026 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704033;
	bh=8bOqKt6i/mjU9uh6a3IWh+earNmPV7TkjMheMbMzmdc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vtqcsh9+oRBIa2XRSKKtC4Jy5zfNpb6OXEc77LMH0lLHxyEgeLe8AuUTyKDiy4sc0
	 1LSfrFM1nrYQVoVCFNT1t3xFs+gO3kQjnnlcmQKHc4Jo/OLC87phf9ACxE6yUQ9N+J
	 dNFT2Jx1aONfOPHJjNqJM8jlzAHu/RDitLVoZydUkqsQUSxN9W9N5Q8gVDV2QLWSS8
	 baykV/tJ6GO+x4fF290iISIyBRPYUizeZ+nzoV0zzOjlGy978DWipn6SYqwaEMe0f/
	 UQwF8jXysSGjoETgMTd4LbZm1gr6+DJrHYc355aWUlBtiM/TCVgXOW4HDWzGfHyj1Q
	 rkBVoS7QtaTHA==
Subject:
 Re: [PATCH net-next v12 2/8] hsr: Use skb_clone() while adding the HSR header
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Thu, 26 Nov 2026 14:40:32 +0000
Message-ID: <179570403216.3135.10008194988280246872@kernel.org>
In-Reply-To: <20261125-hsr_ptp-v12-2-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-2-9ddd2a73cb90@linutronix.de>
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

- [Medium] In hsr_create_tagged_frame() (net/hsr/hsr_forward.c), the
  clone made with skb_clone() keeps the original skb's timestamp request…
- [Low] hsr_create_tagged_frame() in net/hsr/hsr_forward.c now calls
  skb_set_network_header(skb, HSR_HLEN + movelen) and…

--

hsr: Use skb_clone() while adding the HSR header

This patch changes hsr_create_tagged_frame() to use skb_clone() followed
by skb_cow_head() instead of __pskb_copy(). The goal is to keep the
original skb_shared_info, and with it any timestamp request. It also
merges the NETIF_F_HW_HSR_TAG_INS early return into the clone path, uses
skb_postpush_data_move() so metadata moves with the header, and resets
the network header and mac_len after the push.

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 44f6d9c83180a..b183358207506 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c

[ ... ]

> @@ -342,33 +341,40 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
>  		/* set the lane id properly */
>  		hsr_set_path_id(frame, hsr_ethhdr, port);
>  		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
> -	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
> -		return skb_clone(frame->skb_std, GFP_ATOMIC);
>  	}
>  
> -	/* Create the new skb with enough headroom to fit the HSR tag */
> -	skb = __pskb_copy(frame->skb_std,
> -			  skb_headroom(frame->skb_std) + HSR_HLEN, GFP_ATOMIC);
> +	skb = skb_clone(frame->skb_std, GFP_ATOMIC);
>  	if (!skb)
>  		return NULL;
> -	skb_reset_mac_header(skb);
>  
> -	if (skb->ip_summed == CHECKSUM_PARTIAL)
> -		skb->csum_start += HSR_HLEN;
> +	if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
> +		return skb;
> +
> +	/* Ensure the cloned skb has enough headroom to fit the HSR tag */
> +	if (skb_cow_head(skb, skb_metadata_len(skb) + HSR_HLEN))
> +		goto err;

[Severity: Medium]
After skb_clone() and skb_cow_head(), the frame for each slave port has
the original tx_flags (SKBTX_HW_TSTAMP / SKBTX_SW_TSTAMP) and tskey.
pskb_expand_head() copies them into the clone's private shinfo. But
__skb_clone() leaves the clone's sk NULL. Can a timestamp generated for
this clone ever reach anyone?

Before this patch, __pskb_copy() allocated a new shinfo with tx_flags
zeroed. On this path, slave drivers never saw a timestamp request.

Now both SLAVE_A and SLAVE_B get the request:

hsr_dev_xmit()->hsr_forward_skb()->hsr_forward_do()->
  hsr_create_tagged_frame()->hsr_xmit()->dev_queue_xmit()

A slave driver with HW timestamping enabled (for example igb with
HWTSTAMP_TX_ON) can take its TX timestamp slot and set
SKBTX_IN_PROGRESS. Later it calls skb_tstamp_tx(), which ends up here:

net/core/skbuff.c:__skb_tstamp_tx() {
    ...
	if (!sk)
		return;
    ...
}

So the timestamp is dropped. Drivers with a single slot may then skip or
time out timestamps. Could this break TX timestamping for a real PTP
user, such as ptp4l, on the same slave port?

The commit message says keeping shinfo is enough to preserve the request.
It does not mention that the request cannot complete without a socket.

A later commit in this series, "hsr: Assign a socket for cloned skbs",
adds:

	if (frame->req_tx_port != HSR_PT_NONE && frame->skb_std->sk)
		skb_set_owner_w(skb, frame->skb_std->sk);

That only covers ETH_P_1588 frames with the inline header. At the end of
the series, ordinary traffic sent through hsr0 from a socket with
SOF_TIMESTAMPING_TX_HARDWARE or SOF_TIMESTAMPING_TX_SOFTWARE
(req_tx_port == HSR_PT_NONE) still reaches both slave drivers with
tx_flags set and no socket. Should the timestamp flags be cleared for
those clones, or the socket attached in that case too?

>  
>  	movelen = ETH_HLEN;
>  	if (frame->is_vlan)
>  		movelen += VLAN_HLEN;
>  
> -	src = skb_mac_header(skb);
> -	dst = skb_push(skb, HSR_HLEN);
> -	memmove(dst, src, movelen);
> +	/* The entire header area needs to be linear */
> +	if (!pskb_may_pull(skb, movelen))
> +		goto err;
> +
> +	skb_push(skb, HSR_HLEN);
> +	skb_postpush_data_move(skb, HSR_HLEN, movelen);
> +	skb_set_network_header(skb, HSR_HLEN + movelen);
>  	skb_reset_mac_header(skb);
> +	skb_reset_mac_len(skb);

[Severity: Low]
This isn't a bug, but the commit message doesn't say that these lines
change the network and transport header offsets of software-tagged
frames.

In the old __pskb_copy() path, skb_copy_header() copied the
head-relative offsets, and skb_headers_offset_update() never rebased
them. Only mac_header and csum_start were fixed by hand. After the push
and memmove:

- network_header pointed at the HSR tag.
- transport_header was HSR_HLEN bytes before the real L4 header.
- mac_len stayed at 14.

With this patch, network_header points past the HSR tag (and the VLAN
tag, if present), and transport_header is correct. mac_len becomes
ETH_HLEN + HSR_HLEN (+ VLAN_HLEN). This matches hsr_init_skb(), which
uses skb_set_network_header(skb, ETH_HLEN + HSR_HLEN).

Slave egress hooks, taps and drivers now get different values from
skb_network_header() and skb_transport_offset(). Could the commit message
mention this next to the csum_start explanation?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-hsr_ptp-v12-0-9ddd2a73cb90%40linutronix.de
