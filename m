Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904941;
	b=c0JnJnhRFa0bn1O9A0k9lqpmKnvRs3ieepkP1ExIlB5ptxrOPeot6G2WijMaOxLOznuI
	 Yq5FXVTlUE33OnAjJCKtP/Dz1rNRSD8l4rGEn1cYBMWa78Xar0078yThkyf4BLwaDkwth
	 dI/nG7TvFQzJgsr/Uoz7y10Mm64iZL8IRKYrmqWMVsQE7PGFyiXGcyDkvirB5h/TF7voo
	 67vZgA8+mJFe6fnyUjaYgwDwQUUsM6tlPmr03MMQvvAlVhnZRMEJAYqjAYlR6lwhiclLk
	 hVEomSyuVqbgad+fkydBsz9AM0WByh6C9tw6+YQccp1Ds6pQhwbnuLF8Wl2/3pq4pZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904941;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gmdkkh8gDfEPErj63kJWoJNjdLpvycU+X9vGjZzQ0x4=;
	b=zA0ggFdxZod15AoSTGf+6arFbF35Ycs0npI4qIrumITmIWh3VBECs3bI8G8Yt+0LQrlb
	 lLbD9e6aZFIJaK74CKLgbxQ7oicwb75zocy7UCgigfiSeJ3u4kFGWnN8LmvYHnjbHsevn
	 3dEgf91mfGnWdCL0KZZ7A1NUFgSnNBeDCxJTt0ktI9jO0aidG/1yaEcGO7kfWfdvD0sE7
	 v3qXu8Ju1iE5bDsASkzKkIDNz1ra7+G6t+mhsbPCZeAJ2rRO+A4yfgvNPx7TdOVgcTeE4
	 2ItK2nsD9UyasFCR3MuSuPcIzVKdUTP1Ap2KxvULQEBKuez5bLVdGP7KQtqLZM4apsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gh2D1W3C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B26606A33F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gh2D1W3C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B641F000C7
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904941;
	bh=gmdkkh8gDfEPErj63kJWoJNjdLpvycU+X9vGjZzQ0x4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gh2D1W3Cz8HowJ2wbpQ3CQ+f5tVgkLMBFmNw+LoupgdmN7hT6JqbibQHy730KIYh0
	 a07NoC8Keh3ef1vqDDcDZIPOYG3fg4i1h0DbpJOrBvBZYT68KDR4fCvPt7tkBmbx7K
	 a3IHkyHpQ1o+EwS562bsO+jSfj6s9T9jQLoRU/aQ6dJLeDqzvVaXgsnPpCtgOMlivT
	 W0DgwqCfI1timDiAbex1FqnMQMlWkP3zrS/QMqtPjOxXIJudWdd3huQz7d5e+APv/K
	 UgVUwkdyGGOSZG2F9QUFn2hBHAqCFWMRwoqUdDUEmZMxJMGKjBqQiRV9i2ZdW1Wr4u
	 iBE3IE44zXlZg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-48e94879f02so1309578fac.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFDp9T21X8/e/f/t1dkrV20y4Hqa71uFRqdLoOYfzHGRDc/uq0WsnodDKuINRHTttQV1WeDsqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bESVDc0VbJYfwVV0n0YQjxK3pLKGakfV4aDHv7p8UTKgbn7VS
	CqvJZjZkj3c/Ms0Hpv31VsEhicgeHqG6j1/ZuT86YXXtDfdiIrGCuYK20w5/gR1fAQRnf7SvmZ2
	dByfv06sYT2IO+WaLQ9ZRxWseiQpL5jI=
X-Received: by 2002:a05:6870:8a2b:b0:48f:e0f6:c45c with SMTP id
 586e51a60fabf-4afdf460eb3mr10813874fac.42.1794904935511; Tue, 17 Nov 2026
 00:42:15 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-3-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-3-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:42:02 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqEnTF0RCv4+Vp_WXG8jrwhsAakbXTzU+vfLq+d4WTAqw@mail.gmail.com>
X-Gm-Features: AclHuK-eXCKxOt8y1BtCP2agpNWIsk4gbc5ohJX4sB1awgl7GI0KsCP1Ck7CnkE
Message-ID: <CAL4WiiqEnTF0RCv4+Vp_WXG8jrwhsAakbXTzU+vfLq+d4WTAqw@mail.gmail.com>
Subject: Re: [PATCH v1 net 2/8] tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	Stephen Hemminger <stephen@networkplumber.org>, stephen hemminger <shemminger@vyatta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> RFC 5082 introduced Generalized TTL Security Mechanism (GTSM),
> and IP_MINTTL and IPV6_MINHOPCOUNT follow that.
>
> If an incoming IPv4 packet has TTL less than inet_sk(sk)->min_ttl
> configured via IP_MINTTL, the packet is dropped.
>
> However, tcp_v4_err() checks the TTL extracted from the ICMP
> payload, not the one in the outer IP header.
>
> The minimal repro is:
>
>   --ip_version=3Dipv4
>    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
>   +0 setsockopt(3, SOL_IP, 21, [250], 4) =3D 0
>   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
>   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress)
>   +0 > S 0:0(0) <...>
>   +0 < (ttl 10) icmp unreachable host_unreachable [0:0(0)]
>   +0 %{assert tcpi_state =3D=3D TCP_SYN_SENT}%
>
> Let's check ip_hdr(skb)->ttl.
>
> Now GTSM is applied to locally generated ICMP errors, but this
> behaviour matches tcp_v6_err().
>
> Note that tcp_v6_err() properly checks ipv6_hdr(skb)->hop_limit.
>
> Fixes: 97e3ecd112ba ("TCP: check min TTL on received ICMP packets")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
> Cc: Stephen Hemminger <stephen@networkplumber.org>
> Cc: stephen hemminger <shemminger@vyatta.com>
> ---
>  net/ipv4/tcp_ipv4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index 7d58f522068d..bf8542368032 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -546,7 +546,7 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>
>         if (static_branch_unlikely(&ip4_min_ttl)) {
>                 /* min_ttl can be changed concurrently from do_ip_setsock=
opt() */
> -               if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl)))=
 {
> +               if (unlikely(ip_hdr(skb)->ttl < READ_ONCE(inet_sk(sk)->mi=
n_ttl))) {
>                         __NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
>                         goto out;
>                 }

Linux sends ICMP errors with the default TTL (64), so locally
generated errors are now dropped for any min_ttl above 64.

For the strict GTSM case (min_ttl =3D=3D 255) there is no router between
the peers, so nothing else changes.

But IP_MINTTL is also used with lower values for multi-hop sessions
("ttl-security hops N"). There, an ICMP from an intermediate router
using an initial TTL of 64 was accepted before this patch (the quoted
TTL is the one we sent, minus the hops to that router), and is dropped
after.

I think this is the right thing to do, since the inner TTL is under
the sender's control, but I would mention this in the changelog.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
