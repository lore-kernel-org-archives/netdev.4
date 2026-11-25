Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594878;
	b=w5GRlwMjKqjneG/yHxFHw3azImMKdsWo+ltSC+RB0ecCV0nMGQo8F1KYdYnTVA3G+uw8
	 jIu2hgLzTLet92uwDzkGxIbgnW50NB8OrmNZaG+8abyD+RSizqqEJezBCWNTYISG5asMj
	 nW/mPIw6eTcYUACDL9Seh4phlo0W8j3pklJjFf+a19KzkHZDBJmOiDfsTwvbI2aY8p6jv
	 K4KJ8I8/aVUIQLykALJlHusnmDsH4lDNfc/UBT9x0TYMxFMeWjluYdIooolksRSjfCBzV
	 AVRMQJQcRLUw5yp29wwCmzz+BB7fNHIFAZCEu1o6KaUxHIQOkhQKVj5J5esNI/xYqbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594878;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DChWMTWskQrq4nMoKDRGDtL8ofOHXaOQWchMYtMSm2s=;
	b=XRr4tazT1051ePvjGsZlDcIUzHnYTPJih0bySzNJUyOHBX+d+lxusHFFWA0bX7xfFpYF
	 v1lS4JPIniMP58h+PuH2+WzvnnSPIw+Ww2Gfwv7i1Or6NYcRHN2yJORTMQKPNQF4wIbP5
	 pjYCRR0hZ63QVeO+bFdD4W5ychz+RMcvp1rc7uVSS9bmLtxKZqncwUK0vNrFt0x/V7+/c
	 DoBYobj3sjruc6KpQCzmmsBsW4IPefjwc0RSvxk0pu7JJ4+lCSkKcgGZhtp2V9sxJzhwi
	 j05r7al9Wp40YfuYdekY2Mh2ZuND6p+8NK4T5zrkNA4SOnfvoWbAs/4BIR78cKpZq4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekew5X5v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC56E606A686;
	Wed, 25 Nov 2026 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekew5X5v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A582E1F0093E;
	Wed, 25 Nov 2026 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594878;
	bh=DChWMTWskQrq4nMoKDRGDtL8ofOHXaOQWchMYtMSm2s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ekew5X5v4n5TYWAkWvrq72KJ904DowD8IO+Z/AMOGspwHIV9sGd0LYm9E5hE4uaP4
	 p4WW9bjpITB7/flT4nrGs8oKomjs4a06nqMMgyiRqt8DkUdApVgaK528NruWpvam99
	 VfXfQcDsQWAFj6F7765tq0wNvdCpUpvpRIPd6Zhpg3RCdf5ZQvoyYLjPKd0Ce4GqEp
	 fAgR1rBhy9xh4kCpdJUhwPEHJ5XLtlbCkIe//uG392q+kKjvg1BSgHRajDqZBDoK/t
	 W3Xgq16JgUf5dCR7y3WvbJUeZ5+irtwt8jphhAw1HJZSml0gpqToe8QtHZRV8obidm
	 4c1Wx9E6wPrYQ==
Subject: Re: [PATCH net] tipc: drop discovery messages shorter than the fields
 they carry
From: netdev-bot+sashiko@kernel.org
To: kyuwoncho18@gmail.com
Cc: jmaloy@redhat.com, tung.quang.nguyen@est.tech, ying.xue@windriver.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 08:21:17 +0000
Message-ID: <179559487720.3135.14203110625179342726@kernel.org>
In-Reply-To: <179550610427.774194.2378040347436778640@gmail.com>
References: <179550610427.774194.2378040347436778640@gmail.com>
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

- [Medium] The new check in tipc_disc_rcv() (`msg_hdr_sz(hdr) <
  MAX_H_SIZE`) silently drops every LINK_CONFIG message with a header…
- [Low] In net/tipc/discover.c, tipc_disc_rcv() still reads words 13 and
  14 of the header before the new length check runs.

--

tipc: drop discovery messages shorter than the fields they carry

This adds a length check to tipc_disc_rcv() in net/tipc/discover.c. It
drops LINK_CONFIG messages whose declared header is shorter than
MAX_H_SIZE, and also those whose data is shorter than NODE_ID_LEN when
TIPC_NODE_ID128 is set. The aim is to stop the media address, words 13
and 14, and the node identity being read from beyond the end of the
message.

> diff --git a/net/tipc/discover.c b/net/tipc/discover.c
> index b9d06595b0673..0f99e4af1cfa9 100644
> --- a/net/tipc/discover.c
> +++ b/net/tipc/discover.c
> @@ -219,6 +219,12 @@ void tipc_disc_rcv(struct net *net, struct sk_buff *skb,
>  	}
>  	hdr = buf_msg(skb);
>
> +	if (msg_hdr_sz(hdr) < MAX_H_SIZE ||
> +	    ((caps & TIPC_NODE_ID128) && msg_data_sz(hdr) < NODE_ID_LEN)) {
> +		kfree_skb(skb);
> +		return;
> +	}

[Severity: Medium]
Will this also drop discovery messages from older peers that send a
40-byte INT_H_SIZE header?

Before commit 948fa2d115c5 ("tipc: increase size of tipc discovery
messages"), tipc_disc_init_msg() built discovery messages with an
INT_H_SIZE header. That commit's message says 40 bytes "was enough for
Ethernet/IB/IPv4".

tipc_msg_validate() accepts any hsz from MIN_H_SIZE to MAX_H_SIZE, so
these messages still reach tipc_disc_rcv() via tipc_rcv():

    if (unlikely(usr == LINK_CONFIG))
        return tipc_disc_rcv(net, skb, b);

The Ethernet and InfiniBand decoders only read bytes inside a 40-byte
header:

  - tipc_eth_msg2addr() reads header bytes 24 to 29.
  - tipc_ib_msg2addr() reads 20 bytes starting at byte 20, so it stops
    at byte 40.

The receiver also still handles peers without TIPC_NODE_ID128:

    else
        sprintf(peer_id, "%x", src);

Before this patch, discovery with these peers over Ethernet or IB could
still complete, although words 13 and 14 held garbage. After it, the
messages are freed without the "Rcv corrupt discovery message" warning,
and neighbour discovery with those peers stops.

Is dropping interop with these peers intended? If so, could the commit
message say so? The Fixes: tag points at the initial merge, so this
change would go to every stable tree.

Or could the minimum length depend on what each media and the words
13/14 consumers actually need, so that 40-byte Ethernet/IB discovery
keeps working?

[Severity: Low]
This isn't a bug, but words 13 and 14 are still read before this new
check runs. At the top of tipc_disc_rcv():

    struct tipc_msg *hdr = buf_msg(skb);
    u32 pnet_hash = msg_peer_net_hash(hdr);
    u16 caps = msg_node_capabilities(hdr);
    bool legacy = tn->legacy_addr_format;
    u32 sugg = msg_sugg_node_addr(hdr);

msg_peer_net_hash() returns msg_word(m, 13), and msg_sugg_node_addr()
returns msg_word(m, 14). Both run before skb_linearize() and before the
msg_hdr_sz(hdr) < MAX_H_SIZE test. With a 24-byte header, both words
are still loaded from past the validated header.

The short message is dropped before pnet_hash reaches
tipc_node_check_dest() or sugg reaches tipc_disc_addr_trial_msg(), so
those values are never used.

Could these two reads, or the check, be reordered so the check comes
first? That would match the commit message, which says these fields
"are then read from past the end of the message".

>
>  	if (caps & TIPC_NODE_ID128)
>  		memcpy(peer_id, msg_node_id(hdr), NODE_ID_LEN);
>  	else

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179550610427.774194.2378040347436778640%40gmail.com
