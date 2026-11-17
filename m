Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904553;
	b=mrOuxfn2JHO6IwCCzx2PHaUnhHVopePaNgULrUw1NDC2Ok8bwzFXfIH13/L6L1xZqbIZ
	 GdLWDPMtAXcHA6DoPLuvUxqqFcwXTKQNfZZp4DwN3PwmgJjy61PWXvLM7K3Qf+UWzwQwX
	 d3mrIPkIo1trxFjgAf53MHSnb9IbrdgVgCYnrAF0IHwOziBg225Moqhl/H75e0GElchWO
	 WuXfu6DTnOlW/SPS15u2fBv8J45UyHyW1RbnVAvTb2Y7b7B2s0a9nJ30UvmuO7Sdjp36I
	 IuIZVXcbM/FoR3BceIQV/EPdeUz62+mqc2juzlWkvPFfU5yAq/n9znIVnRoa7uurTyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904553;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LRv3zYGXHNmAePcX/d3rvOHEvwC7ucCmh+YJOWicdz8=;
	b=0v95uwJoPMMuQgpbWk59zv8IB7eD45gqZ1OQO5etOgJSl7YbsKGA/dDMJhl7ZuEqtGEp
	 +mzXMiqsvw27DgFtU0LH0H6YeB4uxtogo/1HYVZCaRO+2AM311MnO1Z8AE5c89eqKxOOZ
	 tEgbCjgzuKnH99OLl5JqnnkQZ6t8mt297FTnTORk1anPCBXj97gs57J5cZD1YtFor0fDK
	 8QQKWDX1etDOJktPW5X5DzNmWpQCxSFGJH8LrJS7hktQ1e5AAiSsvLtFZHBqmKHK0F2n9
	 JPdvAF7/o1rd203tA0UqaLoCrkDP4QKgFEIWpTECKR52IhL4eWJ3qkstXV2tB61rFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RK4YuSFs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDA8606A891
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RK4YuSFs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41FF1F000C5
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904552;
	bh=LRv3zYGXHNmAePcX/d3rvOHEvwC7ucCmh+YJOWicdz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RK4YuSFst31MAgOk5OktcchAACUUSnz6Xl5Oh7lvSxk1rPBJjp8+hGHNmBpyjB1sL
	 roigEGjcododccS0bww8LLFt5k3wTlzDXh2V1RY11EJe/TWGv4aNmxFsS+dldkAA0Z
	 xcY3POdTwRyPxSm4lSZkA1IJ1XLJuSIYulxHd6caSw7WBQiqGfucYNf1lhV1IZ5BWf
	 9Xxk1Pghd6eQcQRRjsvPGmjOtV6NZmQIri+TdPr7Qh8U4lY4PNCVxL3pRM5gofL5k6
	 sp7R+2+qWFb2gIRDRBadlaCj+DKeg5D7lWDFvtJ4E4blbBkuuxuydsIDDvkZSqcbZ5
	 raAjlBb0Cz15g==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-71b0d330acfso53529eaf.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:35:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHqk9VThW/Vk9jBDGtKhQj/iox/zgeO80rZYzkyqAx8giMPZkyPmhUt76NLYD9HDmB//lzCcMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rRNnSsEs+CmRiDUPdqA+JYNW36RboJy1pfigVJT+8MX3hJMaA
	npB6N7boFS01VibkdaXz2MQ17kc7IqLMPCaKNMY+DEIm2pVnR0tsQOBHLJLOG1L8gpLDO6prmKN
	x6cH8OMdPt7XZtOcEMl63Smgw6hTa4hs=
X-Received: by 2002:a05:6820:16a0:b0:71a:fa6f:7465 with SMTP id
 006d021491bc7-71b029c0bbdmr1379445eaf.47.1794904552032; Tue, 17 Nov 2026
 00:35:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-2-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-2-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:35:41 +0100
X-Gmail-Original-Message-ID: <CAL4WiioDbGpSGexQGczb84dc2wLy=qjhF38xQ_S1YaRZsM30bA@mail.gmail.com>
X-Gm-Features: AclHuK_JxO7vkCyw0PsO5E2OM4KdaY8favGnqxm448dBys9BKcMyhVxYg_PT_DI
Message-ID: <CAL4WiioDbGpSGexQGczb84dc2wLy=qjhF38xQ_S1YaRZsM30bA@mail.gmail.com>
Subject: Re: [PATCH v1 net 1/8] tcp: Don't accept ICMP for SND.NXT in TCP_SYN_SENT.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> RFC 5927 states that the acceptable ICMP has seq in
> SND.UNA =3D< SEG.SEQ < SND.NXT:
>
>   These implementations check that the TCP sequence number
>   contained in the payload of the ICMP error message is within
>   the range SND.UNA =3D< SEG.SEQ < SND.NXT.
>
> tcp_v4_err() and tcp_v6_err() accept packets if seq meets
>
>   between(seq, snd_una, tp->snd_nxt)
>   -> tp->snd_nxt - snd_una >=3D seq - snd_una
>
> , which includes both ends.
>
> This is fine once connection is established because
> tcp_acceptable_seq() uses SND_NXT for ACK and RST.
>
> However, we should not accept ICMP to SND_NXT for SYN_SENT.
>
> The minimal repro is:
>
>    --ip_version=3Dipv4
>     0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
>    +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
>    +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress)
>    +0 > S 0:0(0) <...>
>    +0 < icmp unreachable host_unreachable [1:1(0)]
>    +0 %{assert tcpi_state =3D=3D TCP_SYN_SENT}%
>
> Let's fix off-by-one.
>
> Note that we need to check seq !=3D snd_una because tp->snd_nxt
> is only advanced to tp->write_seq after tcp_transmit_skb().
> Otherwise, ICMP for SYN could be dropped before tcp_connect()
> advances tp->snd_nxt.

This hints at a separate issue.

An ICMP can only be processed in this window if it was generated
locally and looped back while tcp_transmit_skb() is running
(netfilter REJECT in OUTPUT for instance).

At this point connect() owns the socket, so we end up in :

        if (!sock_owned_by_user(sk))
                tcp_done_with_error(sk, err);
        else
                WRITE_ONCE(sk->sk_err_soft, err);

The socket stays in TCP_SYN_SENT, SYN is retransmitted until
tcp_write_err(), and a non blocking user gets no EPOLLERR.

I think the repro in patch 8 only passes because SO_ERROR falls back
to sk_err_soft. Could you check tcpi_state there ?

Also, given an attacker has to guess the ISN anyway, I am not sure
this one is net material.

>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
>  net/ipv4/tcp_ipv4.c | 9 ++++++---
>  net/ipv6/tcp_ipv6.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index 2fc92a7884fc..7d58f522068d 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -499,8 +499,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>         const int type =3D icmp_hdr(skb)->type;
>         const int code =3D icmp_hdr(skb)->code;
>         struct request_sock *fastopen;
> +       u32 seq, snd_una, snd_nxt;
>         struct tcp_sock *tp;
> -       u32 seq, snd_una;
>         struct sock *sk;
>         int err;
>
> @@ -555,9 +555,12 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>         tp =3D tcp_sk(sk);
>         /* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_chil=
d() */
>         fastopen =3D rcu_dereference(tp->fastopen_rsk);
> -       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una;
> +       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : READ_ONCE(tp-=
>snd_una);
> +       snd_nxt =3D READ_ONCE(tp->snd_nxt);
>         if (sk->sk_state !=3D TCP_LISTEN &&
> -           !between(seq, snd_una, tp->snd_nxt)) {
> +           (!between(seq, snd_una, snd_nxt) ||
> +            (sk->sk_state =3D=3D TCP_SYN_SENT &&
> +             seq !=3D snd_una && seq =3D=3D snd_nxt))) {


In TCP_SYN_SENT the only sequence we ever put on the wire is the ISN,
including the Fast Open case (SYN+data is sent with seq =3D=3D ISN, and the
RTO retransmits the bare SYN).

So this could simply be :

        if (sk->sk_state !=3D TCP_LISTEN &&
            (!between(seq, snd_una, snd_nxt) ||
             (sk->sk_state =3D=3D TCP_SYN_SENT && seq !=3D snd_una))) {

This mirrors the (seq !=3D tcp_rsk(req)->snt_isn) test in tcp_req_err(),
and does not need the special case for the window where snd_nxt has
not been advanced yet.

>                 __NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
>                 goto out;
>         }
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index 5c7ed38f1f56..8691d220cf94 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -410,9 +410,9 @@ static int tcp_v6_err(struct sk_buff *skb, struct ine=
t6_skb_parm *opt,
>         const struct tcphdr *th =3D (struct tcphdr *)(skb->data+offset);
>         struct net *net =3D dev_net_rcu(skb->dev);
>         struct request_sock *fastopen;
> +       __u32 seq, snd_una, snd_nxt;
>         struct ipv6_pinfo *np;
>         struct tcp_sock *tp;
> -       __u32 seq, snd_una;
>         struct sock *sk;
>         bool fatal;
>         int err;
> @@ -463,9 +463,12 @@ static int tcp_v6_err(struct sk_buff *skb, struct in=
et6_skb_parm *opt,
>         tp =3D tcp_sk(sk);
>         /* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_chil=
d() */
>         fastopen =3D rcu_dereference(tp->fastopen_rsk);
> -       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una;
> +       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : READ_ONCE(tp-=
>snd_una);
> +       snd_nxt =3D READ_ONCE(tp->snd_nxt);
>         if (sk->sk_state !=3D TCP_LISTEN &&
> -           !between(seq, snd_una, tp->snd_nxt)) {
> +           (!between(seq, snd_una, snd_nxt) ||
> +            (sk->sk_state =3D=3D TCP_SYN_SENT &&
> +             seq !=3D snd_una && seq =3D=3D snd_nxt))) {
>                 __NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
>                 goto out;
>         }
> --
> 2.56.0.679.gc527c65306-goog
>
