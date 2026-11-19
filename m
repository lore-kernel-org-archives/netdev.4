Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077665;
	b=Kwpq0SCW8u1CL1cHCUrpBhwCtKXCe8DGJyLR3vYOVr4PPeYHMBzwDbLduiTA+00et3bq
	 3GJY1alq8m2xeHn0VUFlXC2MNumgR1h9G2iY3HEajLcX6STGzWLm/QCn2FVYIYQTmzIsg
	 eRgmL1cuYx2Mk+lX56kcHNMCEM/C55PeehR7YsULolKyqScwnYvLaufCKdR6/B9aWDBu1
	 ZGtD+PBr8UcFFhu4x2f4QL+HIOOeDP2ax+08F8ObTKUmnRqz4f2Bnte8ZzehLCTG9BIQH
	 FQ7XFu6WtsS9pm7LE2aaxQ+Jg+twOFcae4KGP0nL2itq35xIZFrRSs1fKHHV54qdABg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077665;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MSIaEuELRiH+S3myamjUIMtorBRRO9sM9NWx4rnIGEo=;
	b=cn4hxl3f0q2t+ceoxmR+tU7OcWHyuHvdXrQ7xPi94lxADQBd0ugj7/451Inq3MLkdH32
	 zuM5VzHgVzSK5z0RZ9o9W7GpMJ+8m/jV7R7z4UkSo0tbGfmI6uqmQTrNop/L3rzTbWATJ
	 6bjwqkDShtWpc1vdQwurs+kF6X1g5W8WEGk3vw595mZkqAxC6QDwMSUykmcKnBC5UFvKt
	 tyX2orbtVS9Ku5RcaLuhk2hKGvP1RooGFrhzG1FVnWf11UgNydj/D7cgiqVdqLUei68Dv
	 RgBQrbc3MJl3xH3/OWJV1igz9n+lmoXoOGJRiws58KunaJIQyTwNKq6s/+4HPHTV/Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4Wh0fuh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88ED606A33D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4Wh0fuh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4091F000CB
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795077665;
	bh=MSIaEuELRiH+S3myamjUIMtorBRRO9sM9NWx4rnIGEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q4Wh0fuhuzMIMViH3iDcjIJJwJV04+ugZYadwbnuzOHU49RbjcmwA20EoKFGxmvee
	 tpDPdBda69EPg6XXdDV7eVc3k4R5TL/rAZMmC4SuxoNb9S7EG6f2jzlY1Myk8LWOs4
	 ne55Y/J/N/eeFgUcJ1dnXWDJDj5VoqYyR4+DkT0x+Di75TWYiXJrUsTmGYWKCA7O+e
	 cXLjh4+CYt/WVCu5u4m1C+1/nNfIm2Pb+/JiaJqS7a9W5Dyk3EEVr6YKHXgfa2hSfg
	 /qOMYM8SakCL7nOXkolqhZdggxNjaI5YxU+mBy44D5GC+Xj7gv+Ro1hh49wwmLyBi1
	 ZRsm0DRB94gng==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-705cb6ceebaso1582663eaf.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzfdYsIkwScJ9O+Tw+h+5x8O69GbTijBgpw37E+TZ0UJ3TUizfldxDEiL06CqQ9pgA85vnA+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yi9v2giVv0hCAef9mJ7MqmpWLx61J81ighaCt5tY8fqQch/Nn
	WKuZBl3zBnXsbnYKUp0LCx7lW2/uHnDhhpepjB2rYD4Tyfp5qddXBuvcDnCwZzhJ+Kw6seWKQsM
	N8fbSvB/jQ44NTSpAGtoulKH7I/X769g=
X-Received: by 2002:a05:6820:1629:b0:71a:e95a:34dd with SMTP id
 006d021491bc7-71b1861857cmr4385383eaf.78.1795077664746; Thu, 19 Nov 2026
 00:41:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119061751.222641-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261119061751.222641-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 09:40:53 +0100
X-Gmail-Original-Message-ID: <CAL4Wiioj+Lg8=PyAqLVRLG+uhewDWjaDbk1F=a3woEB+BETkmw@mail.gmail.com>
X-Gm-Features: AclHuK84Tlqn_D5G8EbCdTmP6ADJEOzBwkNsjW_K1nwUiwhMO48xsSGQSKnvvjg
Message-ID: <CAL4Wiioj+Lg8=PyAqLVRLG+uhewDWjaDbk1F=a3woEB+BETkmw@mail.gmail.com>
Subject: Re: [PATCH nf] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, pablo@netfilter.org, fw@strlen.de, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Patrick McHardy <kaber@trash.net>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 07:18, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> q.max_size and max_df_size are used by ip_frag_reasm() to set
> IPCB(skb)->frag_max_size and the DF bit of the reassembled packet.
>
> ip_frag_reinit() reuses the queue for a new datagram but does not
> reset them, so the new datagram inherits them from the old one.
>
> On a router with conntrack defrag, if the largest fragment of the old
> datagram had DF set and was larger than the egress MTU, a new datagram
> without DF gets DF set after reassembly and is rejected with
> ICMP_FRAG_NEEDED, even though all its fragments fit.
>
> Reset both fields.
>
> Fixes: 5f2d04f1f9b5 ("ipv4: fix path MTU discovery with connection tracki=
ng")
> Fixes: d6b915e29f4a ("ip_fragment: don't forward defragmented DF packet")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

This only touches net/ipv4/ip_fragment.c, so this should target
the net tree ([PATCH net]), not nf.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
