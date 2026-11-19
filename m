Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114801;
	b=mQ1WWhawL3Zee52GMkrTlUF6RMeNYGHf4SpQH2A5MXEcQlKCJqDU4XPVTC5gGgaliwf6
	 SoyNgHTwaH3iwIfzgDmEPGsgm2/xV06xY/Xfp9aVQOJ259NmYcV02S9uch5X3D2dotoOr
	 w9A6oFHDNFTdPTDfyMkRn8wwvsC5YBw2WN95KUu3XcG7WmfPvczdIN75efo+7S9VD7KEy
	 dAW1wbQ0OEaCF8fs9gHXG/EtTVGQAr4Q1T7ATf4wUndolUcr6Ds2PGzbXFT0zzIebNRaD
	 YRRLg87R8bkIsOWTSxrnA3XVCQN6gyGjSwo0UvHgM4vw54I+Jqqugb8fiVYDWvdXAVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114801;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rc3Y1zAg/nSiG5dvIx58BgnYoMQ372vHx7okRL2qhjE=;
	b=cYbeQh9MWmKrnV6jdpiCmw+jHCO+zLyBn8JoAgG2cXYYLUh8411abC+y9gmZA98EFElJ
	 wCdS9ya8pC4i9srkjPzHcaF3WVbIZ4ZkKxLFCgz9jIxmxBuFyRaNv8xx9LDiBpOwU/5rm
	 AUU9npkrLcgRYlNeQC7WdjYsMY30HKPL9qWzhdYmCIH9XaormKJufH6QbzetEa7XY/gnT
	 dVdo/Wy+7HtBrZ7d2KAJpxRadxHACW7IKhvKxk9NfOSEcbv306dkXcsM2rsDfZHqUuhVQ
	 FQKVVteZfof32f7jqX8Xn6R+G+2+aJCbyum92MRVRi/R7wR9Okbb1+hJuJU4ue7kdBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6ZLywbI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221C606A33C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6ZLywbI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F76F1F000C4
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114801;
	bh=Rc3Y1zAg/nSiG5dvIx58BgnYoMQ372vHx7okRL2qhjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X6ZLywbI0i82S0QHqex9fxprVdpeGcA9KdylXNFR4xXsD0/GFrMyjwjzn6+IfQhOC
	 oYybgn7wNP6PK1gCC+uVvGx7unnko3w886I5K5u4DX/UAJDqKGB2bCC1JVIFVrDRP2
	 qs/bbHFr2WFZQLDtEUf5RvUPUOVniTtZubxQf5DozquXaR5QxPl0czRl0k004I5w8O
	 +dv4Wn0b6VwmS4AnzSJyprMO/Q31vqWHTIfqjperhynwfdxilUwKksXoxSjwHjZp3n
	 hVykgBi6cVM1f3RALwvgRuR32SuBaVEJUrAbh2+JFHNvu448Ub2SXIMOvapd68gCJL
	 WhGbnH27eu9lA==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6d68de53053so59845eaf.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:00:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGefxNFfJvUoHfgSVwq9SJQLdKPCRH8+eQOYdKP1VeomYTe5h3F8BiGGQn1B98v/xqVVGxZZs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TUBBofcnWkhcOZqK85emTs7xjHyYkASIRiYKwCxAnclbkAiul
	6fogxANZqQY7MQmxEtesWl73kiv9I7gzo2tcn+bHh3g4Q0YeqZ90JrK9Ml3LUKgPDJbJGqxoIXq
	KZaJD5pl8SQyUYGjjZ0a3ptAMEJ69JjE=
X-Received: by 2002:a05:6820:6703:b0:71a:fe11:aa36 with SMTP id
 006d021491bc7-71b3953f6b9mr422997eaf.63.1795114800358; Thu, 19 Nov 2026
 11:00:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180143.2912138-1-chia-yu.chang@nokia-bell-labs.com> <20261119180143.2912138-3-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20261119180143.2912138-3-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 19:59:49 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqgAmakzRozSD8RvieAyriXJQSJ57kpD35ja6Tz5BB8BQ@mail.gmail.com>
X-Gm-Features: AclHuK8alF_Zi8-LdHVyoUThH9UYxh9ZHTwY_58OAO9Dp6AN7IPwd1H37_FgiNw
Message-ID: <CAL4WiiqgAmakzRozSD8RvieAyriXJQSJ57kpD35ja6Tz5BB8BQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/4] tcp: rename ECN transmit helper function
To: chia-yu.chang@nokia-bell-labs.com
Cc: linux-kernel@vger.kernel.org, kuba@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, davem@davemloft.net, kuniyu@google.com, ij@kernel.org, 
	ncardwell@google.com, koen0607@gmail.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Mike_Rudolph@comcast.com, Jeff_Howe@comcast.com, 
	srichard@netapp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 19:01, <chia-yu.chang@nokia-bell-labs.com> a =
=C3=A9crit :
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Rename INET_ECN_xmit_ect_1_negotiation() to
> INET_ECN_xmit_negotiation_ect(). The previous name suggests that the
> helper always uses ECT(1), while it actually chooses the ECT codepoint
> to be used during the ECN negotiation.
>
> This renaming also prepares for the introduction of a similarly named
> helper function for established connections in the followup patch.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> --
> v3:
> - Rename helper to better reflect its behavior
> ---
>  include/net/tcp_ecn.h | 6 +++---
>  net/ipv4/tcp_cong.c   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 865d5c5a7718..9ca016d98972 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -33,7 +33,7 @@ enum tcp_accecn_option {
>  };
>
>  /* Apply either ECT(0) or ECT(1) based on TCP_CONG_ECT_1_NEGOTIATION fla=
g */

While you are renaming it, please expand this comment, it is rather
cryptic. Something like :

/**
 * INET_ECN_xmit_negotiation_ect - set the ECT codepoint used before CA ini=
t
 * @sk: TCP socket
 *
 * Mark the socket ECN-capable for the packets sent while ECN is still bein=
g
 * negotiated (SYN, SYN-ACK), i.e. before tcp_init_congestion_control() run=
s.
 *
 * The codepoint is chosen by the congestion control module:
 * ECT(1) if it sets TCP_CONG_ECT_1_NEGOTIATION, ECT(0) otherwise.
 *
 * This does not decide whether ECT should be sent at all: callers only use
 * it when the module (TCP_CONG_NEEDS_ECN) or a BPF program asked for ECT
 * on these packets.
 *
 * This changes the socket TOS/tclass, not a single packet, so the codepoin=
t
 * stays in effect until tcp_init_congestion_control() or tcp_ecn_send()
 * selects the one used for the established flow.
 */

The helper added in patch 3 (INET_ECN_xmit_established_ect()) would
deserve the same treatment, so that the split between the two is clear.


> -static inline void INET_ECN_xmit_ect_1_negotiation(struct sock *sk)
> +static inline void INET_ECN_xmit_negotiation_ect(struct sock *sk)
>  {
>         __INET_ECN_xmit(sk, tcp_ca_ect_1_negotiation(sk));
>  }
> @@ -583,7 +583,7 @@ static inline void tcp_ecn_send_synack(struct sock *s=
k, struct sk_buff *skb)
>                 TCP_SKB_CB(skb)->tcp_flags &=3D ~TCPHDR_ECE;
>         else if (tcp_ca_needs_ecn(sk) ||
>                  tcp_bpf_ca_needs_ecn(sk))
> -               INET_ECN_xmit_ect_1_negotiation(sk);
> +               INET_ECN_xmit_negotiation_ect(sk);
>
>         if (tp->ecn_flags & TCP_ECN_MODE_ACCECN) {
>                 TCP_SKB_CB(skb)->tcp_flags &=3D ~TCPHDR_ACE;
> @@ -618,7 +618,7 @@ static inline void tcp_ecn_send_syn(struct sock *sk, =
struct sk_buff *skb)
>
>         if (use_ecn) {
>                 if (tcp_ca_needs_ecn(sk) || bpf_needs_ecn)
> -                       INET_ECN_xmit_ect_1_negotiation(sk);
> +                       INET_ECN_xmit_negotiation_ect(sk);
>
>                 TCP_SKB_CB(skb)->tcp_flags |=3D TCPHDR_ECE | TCPHDR_CWR;
>                 if (use_accecn) {
> diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
> index e3f462f161dd..3331679c81d7 100644
> --- a/net/ipv4/tcp_cong.c
> +++ b/net/ipv4/tcp_cong.c
> @@ -228,7 +228,7 @@ void tcp_assign_congestion_control(struct sock *sk)
>
>         memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
>         if (ca->flags & TCP_CONG_NEEDS_ECN)
> -               INET_ECN_xmit_ect_1_negotiation(sk);
> +               INET_ECN_xmit_negotiation_ect(sk);
>         else
>                 INET_ECN_dontxmit(sk);
>  }
> @@ -258,7 +258,7 @@ static void tcp_reinit_congestion_control(struct sock=
 *sk,
>         memset(icsk->icsk_ca_priv, 0, sizeof(icsk->icsk_ca_priv));
>
>         if (ca->flags & TCP_CONG_NEEDS_ECN)
> -               INET_ECN_xmit_ect_1_negotiation(sk);
> +               INET_ECN_xmit_negotiation_ect(sk);
>         else
>                 INET_ECN_dontxmit(sk);
>
> --
> 2.34.1
>
