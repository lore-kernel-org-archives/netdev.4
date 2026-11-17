Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958229;
	b=QaQgsmh7pGIa+lWdB83TFubdNsrkxihHZCjcP484RpVIk0/EbMk9+VaBDPZ653zC2HcM
	 b43JkRPa//MSpr7Tn+C+KuJXHBXVytrU2d1UAARdktcowasb0j33vRtAGUSmRek5znKYk
	 7xptHQmwIsJ80qpQRqF15kmh9lOiGVM5BnF3sQVvK4kzct1WnRoyvlmUoIkS6bEhmSl+m
	 pq//7wVcWy/u9PUKAKQJgRubZtHnZcBpJDXoLD6BMvg34X0viU4eXro73QulwLbSlVqsX
	 J2sknp3n2cQUmC1BRCGOn3G2QUW9pbXQ8G5YsFk+owtnCaAW7DDYPJs0F2MPK3H8NKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=CgTVOc0/z7s69wLANvHAAZ1qGOYz2NRWno942PxlDFk=;
	b=WBL2z99xyS3HTjmESYU+MEV/NEEJfHZ8rPZe7ih1bkG4UIcP0T4svuBM2LXAIiYI03cv
	 ejv8mtUNR4U7oRFOXuoWn3dtT0i0YvkI81EuYO4D5F3JoD68bjb+PUUOs54ePfzYqUpYH
	 RwvlLu0qciN7oyYvF7/jEXacqh6Nm4tT69BeBTzwzIjy0Zii69Yne6KGknOX6o4EUuerS
	 1aLXDFHYTtpgJLobZc9dkB8OP849s7uVRR6bnRpeh/rpVgMEnKG8NYonzJKmb3Qgt28SE
	 Jqpez5ZWYeKEJf2pSeIPNhfR4rUDKcI3RRoqhgGZ4Gg/w1HFPlhHqJUajFGLDB4pIig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+mNgXi7;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F5606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 702F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K+mNgXi7
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed276af91dso4641355ad.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958229; x=1795563029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CgTVOc0/z7s69wLANvHAAZ1qGOYz2NRWno942PxlDFk=;
        b=K+mNgXi79LbTnzsARueGHMu0UoW10pfSh+mTfzSc/LgriCRuzWf1Rk7l+1j69a22Ea
         uCSuGV/7X6Bo4tK/mLnupK9f33tjDhpwwVbWR18JI/rO8KGGfcQwUvbOI/VN4+vJRvwW
         oJaTqeiHbucPLog9kroW3+bXZlfkso0GQGBG5eGVSPBnjklXYVXItUbory8mBG3YNfnF
         GwwJjlWp0VmlvDvdUPYSKALl46qL2YAoxbzJ3XcF/plm/kNuLq+RngD/Fek+lOwaXQ8l
         zYSGNvKhWoYUBAjzMLwqKnb4ZkP31DQ2RiNJe9FkjmGppDyYHxzZEyiPbtDBLRex6nLx
         N1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958229; x=1795563029;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgTVOc0/z7s69wLANvHAAZ1qGOYz2NRWno942PxlDFk=;
        b=xmvMnMUPNTJupaLl7UYuH4BKInImWjz/bqRyCp6oNiK7W+omI8v0OMKYIxLI3pdeom
         OXmBA9PWxxmgXGxFlz0oJNvoGLkqf5OTuOFv9EGZzaASA6sA2vvKb1xMg1vuYZo8qOWZ
         OFQItePz3ThEfaNfXq0Liz+IewM9IISBAF7hu/GObc9kJAh885E1mW+Rc64DDvB4+w00
         7ZuIqHGSC3ox5y9+42/RqimFZ/gNsofzlzIJj5mlTnMwrKx4s/FUvc0Hp8RUumouAl9i
         OPrHqRblUWqcVD3QtjU2Ty2KPThS47oV49tRZ9f+3mbRdky5XHeqwdxs8NXMhLMAyvlI
         7+rg==
X-Forwarded-Encrypted: i=1; AL+hErE0kMdycoUG000dBldLt2yNoWnv73SLVEIzRUVuGLP3SJn4E4sG2LCY8SvWcvg58gRS4SdsQu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QQfrrsBMscFU6V+8RynqOuj1lLOfuYSWDn/fD2ELHjllRRBKd
	xi9H3rfj9xBTDme2ryRpQDjVS0tHYU2BFsn/p2g0NWzG5DkPPqDLXNsJno1ee5GNDxaClcJZvWF
	R2NTEpg==
X-Received: from plma3.prod.google.com ([2002:a17:902:7d83:b0:2e9:4bb7:2719])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c412:b0:2ed:1b5:8443
 with SMTP id d9443c01a7336-2eff7580599mr7162485ad.59.1794958228533; Tue, 17
 Nov 2026 15:30:28 -0800 (PST)
Date: Tue, 17 Nov 2026 23:30:28 +0000
In-Reply-To: <CAL4WiioDbGpSGexQGczb84dc2wLy=qjhF38xQ_S1YaRZsM30bA@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-2-kuniyu@google.com>
 <CAL4WiioDbGpSGexQGczb84dc2wLy=qjhF38xQ_S1YaRZsM30bA@mail.gmail.com>
Message-ID: <avzfabq_y7Y-5Kwi@google.com>
Subject: Re: [PATCH v1 net 1/8] tcp: Don't accept ICMP for SND.NXT in TCP_SYN_SENT.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 09:35:41 +0100, Eric Dumazet wrote:
> Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > RFC 5927 states that the acceptable ICMP has seq in
> > SND.UNA =3D< SEG.SEQ < SND.NXT:
> >
> >   These implementations check that the TCP sequence number
> >   contained in the payload of the ICMP error message is within
> >   the range SND.UNA =3D< SEG.SEQ < SND.NXT.
> >
> > tcp_v4_err() and tcp_v6_err() accept packets if seq meets
> >
> >   between(seq, snd_una, tp->snd_nxt)
> >   -> tp->snd_nxt - snd_una >=3D seq - snd_una
> >
> > , which includes both ends.
> >
> > This is fine once connection is established because
> > tcp_acceptable_seq() uses SND_NXT for ACK and RST.
> >
> > However, we should not accept ICMP to SND_NXT for SYN_SENT.
> >
> > The minimal repro is:
> >
> >    --ip_version=3Dipv4
> >     0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> >    +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> >    +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progres=
s)
> >    +0 > S 0:0(0) <...>
> >    +0 < icmp unreachable host_unreachable [1:1(0)]
> >    +0 %{assert tcpi_state =3D=3D TCP_SYN_SENT}%
> >
> > Let's fix off-by-one.
> >
> > Note that we need to check seq !=3D snd_una because tp->snd_nxt
> > is only advanced to tp->write_seq after tcp_transmit_skb().
> > Otherwise, ICMP for SYN could be dropped before tcp_connect()
> > advances tp->snd_nxt.
>=20
> This hints at a separate issue.
>=20
> An ICMP can only be processed in this window if it was generated
> locally and looped back while tcp_transmit_skb() is running
> (netfilter REJECT in OUTPUT for instance).
>=20
> At this point connect() owns the socket, so we end up in :
>=20
>         if (!sock_owned_by_user(sk))
>                 tcp_done_with_error(sk, err);
>         else
>                 WRITE_ONCE(sk->sk_err_soft, err);
>=20
> The socket stays in TCP_SYN_SENT, SYN is retransmitted until
> tcp_write_err(), and a non blocking user gets no EPOLLERR.
>=20
> I think the repro in patch 8 only passes because SO_ERROR falls back
> to sk_err_soft. Could you check tcpi_state there ?

Ah yes, just after checking SO_ERROR, sk->sk_state is still at
TCP_SYN_SENT and it transitions to TCP_CLOSE only at SYN retrans.

  --ip_version=3Dipv6

   0 `ip link set lo up`
  +0 `ip6tables -A OUTPUT -p tcp -j REJECT`
  +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
  +0 setsockopt(3, SOL_SOCKET, SO_BINDTODEVICE, "tun0", 4) =3D 0
  +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress)
  +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) =3D 0
  +0 %{ assert tcpi_state =3D=3D TCP_SYN_SENT, tcpi_state }%
+1.2 %{ assert tcpi_state =3D=3D TCP_CLOSE, tcpi_state }%


Maybe we could change TCP_MTU_REDUCED_DEFERRED to TCP_ICMP_DEFERRED
and have a new flag set for mtu etc in a hole in cold cache line ?


>=20
> Also, given an attacker has to guess the ISN anyway, I am not sure
> this one is net material.

Fair, I'll post this to net-next later.


>=20
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
> >  net/ipv4/tcp_ipv4.c | 9 ++++++---
> >  net/ipv6/tcp_ipv6.c | 9 ++++++---
> >  2 files changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> > index 2fc92a7884fc..7d58f522068d 100644
> > --- a/net/ipv4/tcp_ipv4.c
> > +++ b/net/ipv4/tcp_ipv4.c
> > @@ -499,8 +499,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
> >         const int type =3D icmp_hdr(skb)->type;
> >         const int code =3D icmp_hdr(skb)->code;
> >         struct request_sock *fastopen;
> > +       u32 seq, snd_una, snd_nxt;
> >         struct tcp_sock *tp;
> > -       u32 seq, snd_una;
> >         struct sock *sk;
> >         int err;
> >
> > @@ -555,9 +555,12 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
> >         tp =3D tcp_sk(sk);
> >         /* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_ch=
ild() */
> >         fastopen =3D rcu_dereference(tp->fastopen_rsk);
> > -       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una=
;
> > +       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : READ_ONCE(t=
p->snd_una);
> > +       snd_nxt =3D READ_ONCE(tp->snd_nxt);
> >         if (sk->sk_state !=3D TCP_LISTEN &&
> > -           !between(seq, snd_una, tp->snd_nxt)) {
> > +           (!between(seq, snd_una, snd_nxt) ||
> > +            (sk->sk_state =3D=3D TCP_SYN_SENT &&
> > +             seq !=3D snd_una && seq =3D=3D snd_nxt))) {
>=20
>=20
> In TCP_SYN_SENT the only sequence we ever put on the wire is the ISN,
> including the Fast Open case (SYN+data is sent with seq =3D=3D ISN, and t=
he
> RTO retransmits the bare SYN).
>=20
> So this could simply be :
>=20
>         if (sk->sk_state !=3D TCP_LISTEN &&
>             (!between(seq, snd_una, snd_nxt) ||
>              (sk->sk_state =3D=3D TCP_SYN_SENT && seq !=3D snd_una))) {
>=20
> This mirrors the (seq !=3D tcp_rsk(req)->snt_isn) test in tcp_req_err(),
> and does not need the special case for the window where snd_nxt has
> not been advanced yet.

Looks much better, I'll use it.

Thank you !


>=20
> >                 __NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
> >                 goto out;
> >         }
> > diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> > index 5c7ed38f1f56..8691d220cf94 100644
> > --- a/net/ipv6/tcp_ipv6.c
> > +++ b/net/ipv6/tcp_ipv6.c
> > @@ -410,9 +410,9 @@ static int tcp_v6_err(struct sk_buff *skb, struct i=
net6_skb_parm *opt,
> >         const struct tcphdr *th =3D (struct tcphdr *)(skb->data+offset)=
;
> >         struct net *net =3D dev_net_rcu(skb->dev);
> >         struct request_sock *fastopen;
> > +       __u32 seq, snd_una, snd_nxt;
> >         struct ipv6_pinfo *np;
> >         struct tcp_sock *tp;
> > -       __u32 seq, snd_una;
> >         struct sock *sk;
> >         bool fatal;
> >         int err;
> > @@ -463,9 +463,12 @@ static int tcp_v6_err(struct sk_buff *skb, struct =
inet6_skb_parm *opt,
> >         tp =3D tcp_sk(sk);
> >         /* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_ch=
ild() */
> >         fastopen =3D rcu_dereference(tp->fastopen_rsk);
> > -       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una=
;
> > +       snd_una =3D fastopen ? tcp_rsk(fastopen)->snt_isn : READ_ONCE(t=
p->snd_una);
> > +       snd_nxt =3D READ_ONCE(tp->snd_nxt);
> >         if (sk->sk_state !=3D TCP_LISTEN &&
> > -           !between(seq, snd_una, tp->snd_nxt)) {
> > +           (!between(seq, snd_una, snd_nxt) ||
> > +            (sk->sk_state =3D=3D TCP_SYN_SENT &&
> > +             seq !=3D snd_una && seq =3D=3D snd_nxt))) {
> >                 __NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
> >                 goto out;
> >         }
> > --
> > 2.56.0.679.gc527c65306-goog
> >
