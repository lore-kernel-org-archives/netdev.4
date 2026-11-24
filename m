Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519548;
	b=fCdKKDBgp+YvQJS1B9n0U1XmTyfqbs5dicMRIW5pOfL7bBFr+MOBdwflT45IILmdQvGY
	 X9ZLQwOdn1YzBib4efXcROTnxFAdDu8H/hhhiMtVF1bM4M7PLScg1qsVTArF6sFzxMUs6
	 JuhHoKvsQp0RToD0ceA/omif1KixjCuS5O0CCw6jXYT/+KT6POUAJ7Ms9fUUIFG7a8gPl
	 GfReIPfCSANbza5Z+ZiRXUNGi8d38dHOTUwJv45XCmmgxUJpv6rIxOBuss4X6JMnx7Fg3
	 uSvY1TFtRz53P1Ufb2lm9jkvPDvxumUYsvHfnKOrzjtX5dRqStCeZ5TYhxWRNTPvKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519548;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XDAKh+D0XmIxEFYmIESn8fAn/tPHI1EioV1RjonpdrQ=;
	b=rpCZNMjRrFLhRpM6c9YTgngrWnE1wO9eRhawAFAhgiT/1qJIKtCZYaLBEp73DNzQw/Kc
	 B53/k0cp/whuNPBGdZ7ZxBZvc8UVyg+rvUa4wmW8Ce1BhSk58ufd0JymbHCSPRzUaqvTQ
	 GSiEDkGnDY7q4HWdn5OgQkCQvwv0BMP50lfP8jF9rKxeoE6hl2N67YKe6pVdBe17+ax9F
	 vrogI68V0s9BxhvU8DgQ1LxFYBhVSkX2j9+/3+cITAxRu9A/C0OxIM5gXsa3Lr7zrIk/B
	 FOezVKiJuJy0E6SqfNmZlkY+C2ao9H0P5KYVf9byxvu9HQrkP2T/iC3n5ubpYGS6Tag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYTWMvUk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C55606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYTWMvUk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C550D1F000D1;
	Tue, 24 Nov 2026 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519547;
	bh=XDAKh+D0XmIxEFYmIESn8fAn/tPHI1EioV1RjonpdrQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PYTWMvUksvuPtgOdfusYDpn7aU45WB+cD4BmXPND8pHasKaKmnowq9QdXQ0YHbG1X
	 I1wbc+BC+HQdJUCIYn9icyskzVRdrtIXNH4tVdfm3pg2aEuNBbbSxYBRCXIoSW9MyH
	 v4vZc+pkFMrdnzOXV+uE4ef48cUj17+/wkvala/WVVStuzxDVReseTRE4pKJeI3Tu6
	 jJdroJkYs1blYWZAkCKdr0wn3dUBnGkCKSBCbJfo16Yo19Y/fQgiTEcsGRcCYb4vhd
	 jOBCtWdZ5ng5VwfVKT3pIqnARSNlO3u+aODs94d1Bs2lVPFvM5MyqCyxsOljXYlFrh
	 6Aw5G6ZcSkmQA==
Subject: Re: [PATCH net-next v11 6/8] hsr: Assign a socket for cloned skbs
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Tue, 24 Nov 2026 11:25:46 +0000
Message-ID: <179551954638.3135.17764236163562432199@kernel.org>
In-Reply-To: <20261120-hsr_ptp-v11-6-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-6-264c88f4f1d0@linutronix.de>
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

- [Low] The commit message does not say how narrow the change is.
- [Low] The patch fixes socket ownership in only one of the two
  implementations of proto_ops->create_tagged_frame.

--

hsr: Assign a socket for cloned skbs

This patch assigns the original skb's socket to the clones built in
hsr_create_tagged_frame() and in the has_hsr_header path of
hsr_forward_do(), using skb_set_owner_w(). Without it, skb_tstamp_tx()
cannot return the requested TX timestamp to the sender, because
skb_clone() clears skb->sk and hsr_forward_skb() frees the original skb.

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

[Severity: Low]

This isn't a bug, but the subject is "hsr: Assign a socket for cloned
skbs" and the body says:

  Assign the socket of the original skb to the clone so the timestamp is
  forwarded to the user.

Should the commit message say that this only covers frames that carry the
PTP inline header?

The new skb_set_owner_w() only runs when frame->req_tx_port !=
HSR_PT_NONE. req_tx_port and has_hsr_header are only set in
hsr_ptp_parse_header(), and only for ETH_P_1588 frames that carry the
HSR_INLINE_HDR magic:

net/hsr/hsr_device.c:hsr_ptp_parse_header() {
    ...
	*has_hsr_header = hsr_inline_hdr->has_hsr_header;
	*req_tx_port = hsr_inline_hdr->req_tx_port;
	if (*req_tx_port != HSR_PT_SLAVE_A && *req_tx_port != HSR_PT_SLAVE_B)
		return -EINVAL;
    ...
}

Every other caller of hsr_forward_skb() passes HSR_PT_NONE and false.
So a normal socket that uses SO_TIMESTAMPING on hsr0 still gets clones
with skb->sk == NULL.

The restriction looks deliberate. Without the guard, both slave clones
share skb_shinfo()->tx_flags, so each would report a timestamp and each
would charge sk_wmem_alloc. Could the message state the restriction and
the reason for it?

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

HSR and PRP devices both use this branch. On a PRP device, does a
timestamped inline-header frame get the socket only when has_hsr_header
is set?

hsr_dev_xmit() and hsr_ptp_parse_header() accept the inline header
without checking hsr->prot_version. On a PRP master with
has_hsr_header=0, the frame takes this path:

hsr_dev_xmit()
  hsr_forward_skb()
    prp_fill_frame_info()
      handle_std_frame()
    hsr_forward_do()
      prp_create_tagged_frame()

prp_create_tagged_frame() never sets skb->sk again:

	} else if (port->dev->features & NETIF_F_HW_HSR_TAG_INS) {
		return skb_clone(frame->skb_std, GFP_ATOMIC);
	}

	skb = skb_copy_expand(frame->skb_std, skb_headroom(frame->skb_std),
			      skb_tailroom(frame->skb_std) + HSR_HLEN,
			      GFP_ATOMIC);
	return prp_fill_rct(skb, frame, port);

hsr_forward_skb() then frees the original skb_std. skb_tstamp_tx() has
no socket to report to, so the TX timestamp is silently dropped.

With has_hsr_header=1 on the same PRP device, prp_fill_frame_info()
ignores the flag and skb_std is set. That frame takes this patched
branch and does get the socket.

The commit message says "This does not consider PRP part of the stack".
The kernel still accepts the inline header on PRP masters, though. Since
"hsr: Add a magic header for sending PTP packets" it also requires the
header for ETH_P_1588.

Would it be better to reject the inline header on PRP devices in
hsr_ptp_parse_header()? Another option is to apply the same ownership
rule in prp_create_tagged_frame().

The frame->skb_hsr branch at the top of hsr_create_tagged_frame() has a
similar gap:

	if (frame->skb_hsr) {
		...
		return skb_clone(frame->skb_hsr, GFP_ATOMIC);
	}

This returns a clone without the socket even when req_tx_port !=
HSR_PT_NONE. One example is an inline-header frame with has_hsr_header=0
that carries ETH_P_HSR, or ETH_P_PRP on HSRv0.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-hsr_ptp-v11-0-264c88f4f1d0%40linutronix.de
