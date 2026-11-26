Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704042;
	b=n+GyqKP5ed6KlU5rLWk9aU9zNTS35YhhMMfpNVsGnyYJ0oAmcPaB6OA+yD6+o2UkXFZP
	 /8mOHXznc148MkFYo/v6ND14fM7T69z7lFyw7PpWGtjj9ExK1soPvZ7EgDIOOUn0ETGlo
	 WJb8H32m5EXZEzOIIA9Yg2ulFd69stA7j/P6Dsem4F7i76fcdn4yOKS7qa9S59duHogAv
	 qSe3yKASO+xWUTdihkp7YyqQD+fNGHTBZ445euYxXCDaM6wrDUoX82XEVsh0KjQZyQAGR
	 cPd3BWgOSbT0MoXpqfUvN6fIir6aHd2NDPtv+WNd1Ur6NipNZnnozGqiV9avzzvtbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704042;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/2qPKL+7KZnDNSN4QH7Uai6RQNsqaTfhlTadJVfJFiI=;
	b=l9gr90VymphuyTr/j4HAlc8vIrV/jmRUG/GHFlWnJKd6i+mwd1jDX4vmVUYku9X78knL
	 manj2NCYh9GA4+Y8ibiGZkYpkEzgXog4vYwZjG61SsVcd37vRE2YTa49EBrYA8VNmSxrp
	 UHvRrXFYGaQFCgQJssBjvFfDS2H9M8/7vLHjqYqHBVYe6Ap3U1e0HkaPR/gIDIR6lLdQv
	 MoBQkQZR9jqjbGmiIINtL5oeXBNInU1wKbHM2LEfsSM9QcM8siVwoqws8C6hJT53+UPO8
	 5BuIx/i4U49XySfh6crxzxG4pZkbH87mhfaENyM3i0pDZx2izSj8LzKGz+Cle2GeWkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODzrDAtF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D950606A336
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODzrDAtF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3800D1F000D2;
	Thu, 26 Nov 2026 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704042;
	bh=/2qPKL+7KZnDNSN4QH7Uai6RQNsqaTfhlTadJVfJFiI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ODzrDAtFsB00mtHW37Rf6IOSA4r6fTQldz0yKzIa8QnRsUQVfmoq7uIzOddC0N90d
	 15TImb2q1XndvdKsCE5qodbeeyNriPGntuWPi/+0bBwEplkry5CBUWskOv8ZMFGz1R
	 Zm+e/EVShuPxaCQLTD4QXajOLIStOpqmxAwIhV2j+wiIE58wmtoeLH4EkyjDsMTUe0
	 FZ61sRE1OyzKcp21DUP6Vz6gS1cvABBIBgSBXXFlfgi8JR7W8LaAuu1GYgPOOb29KX
	 PMHc9zbK1OhSebQAninkRXm+ivkPKDNfcXVw1t+Aw5tT76lhFu/WL2G1BUQtK8JUIM
	 i4aV2SfFa58cg==
Subject: Re: [PATCH net-next v12 6/8] hsr: Assign a socket for cloned skbs
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Thu, 26 Nov 2026 14:40:40 +0000
Message-ID: <179570404077.3135.7555640745657662716@kernel.org>
In-Reply-To: <20261125-hsr_ptp-v12-6-9ddd2a73cb90@linutronix.de>
References: <20261125-hsr_ptp-v12-6-9ddd2a73cb90@linutronix.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch adds TX timestamp delivery to HSR only, and it relies
  on a uAPI that does not enforce that limit.

--

hsr: Assign a socket for cloned skbs

This patch assigns the original skb's socket to the cloned skbs in the HSR
forward path. With the socket set, skb_tstamp_tx() can deliver the TX
timestamp to the sender. The commit message says PRP is not covered.

> diff --git a/net/hsr/hsr_forward.c b/net/hsr/hsr_forward.c
> index 1d1d75ed8cd06..9cb3297a8640a 100644
> --- a/net/hsr/hsr_forward.c
> +++ b/net/hsr/hsr_forward.c

[ ... ]

> @@ -347,6 +348,9 @@ struct sk_buff *hsr_create_tagged_frame(struct hsr_frame_info *frame,
>  	if (!skb)
>  		return NULL;
>  
> +	if (frame->req_tx_port != HSR_PT_NONE && frame->skb_std->sk)
> +		skb_set_owner_w(skb, frame->skb_std->sk);
> +
>  	if (port->dev->features & NETIF_F_HW_HSR_TAG_INS)
>  		return skb;
>  
> @@ -582,6 +586,8 @@ static void hsr_forward_do(struct hsr_frame_info *frame)
>  		 */
>  		if (frame->has_hsr_header && frame->skb_std) {
>  			skb = skb_clone(frame->skb_std, GFP_ATOMIC);
> +			if (skb && frame->skb_std->sk)
> +				skb_set_owner_w(skb, frame->skb_std->sk);
>  			goto inject_into_stack;
>  		}

[Severity: Low]
The commit message says:

  "This does not consider PRP part of the stack."

Is the PTP inline header actually rejected on PRP devices, though?

hsr_ptp_parse_header() in net/hsr/hsr_device.c does not check
hsr->prot_version before it accepts the inline header. A PRP master
therefore still accepts req_tx_port and has_hsr_header.

On PRP with has_hsr_header=0, prp_fill_frame_info()->handle_std_frame()
sets skb_std. hsr_forward_do() then calls prp_create_tagged_frame(),
which this patch does not change:

net/hsr/hsr_forward.c:prp_create_tagged_frame() {
    ...
	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
		return skb_clone(frame->skb_std, GFP_ATOMIC);
	}

	skb = skb_copy_expand(frame->skb_std, skb_headroom(frame->skb_std),
			      skb_tailroom(frame->skb_std) + HSR_HLEN,
			      GFP_ATOMIC);
	return prp_fill_rct(skb, frame, port);
}

Neither of these copies has a socket, so the requested TX timestamp is
silently lost.

On PRP with has_hsr_header=1, skb_std is still set. The new
skb_set_owner_w() in the has_hsr_header branch of hsr_forward_do() then
runs, and the timestamp is delivered.

So on a PRP device, the HSR-only has_hsr_header flag decides whether a
timestamp comes back. Should hsr_ptp_parse_header() reject the inline
header when the device is in PRP mode? Or should
prp_create_tagged_frame() also assign the socket, so that both cases
behave the same?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125-hsr_ptp-v12-0-9ddd2a73cb90%40linutronix.de
