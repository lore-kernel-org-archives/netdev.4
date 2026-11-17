Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959076;
	b=rcb0WZ9EGhf1ehvaFpKfMpru56/k1UBSy3/ONf45gxsP71M84A0JtYW18rNBuRo3dKw0
	 t+VmNm83ASz/h9KaoraZfj08oJp2eRIPRXZY03eFvAYSqPLlyNK4+Lx6BTLDO6dKyW3/O
	 zPqFKUD+fmycx0bp//LgrbarPGB4TFZZC7BcIJcPZKM4yJ4XYGFZTy+vufEZvt1PJznop
	 qcHmzM+bikX+W8KWzsTlfkCQmT5YdQB7OZ5wURQJY+wq86f/Aq29qlrdb1Jc58rOF4O1x
	 ljkmgIv0Jc4J1NERree7YrTwn6bI9cYcagaRDrnIOebsOCD5mOdzKftQmoQnvsotYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=PAsluYk9Z+JsPGZr43ACSk4wnv2NKYTkxlXrZqnDYOo=;
	b=QNkldxjYNDrb+nhphCGDkk/tdm+7dxQE/nuBCej4azEciliI0SntkATIZ3HGed05skZk
	 6GAET7L5FT+KBfDneAtyJsm7Trg+c4Y/wSEN2zqbIBQnJOxyzwn+9T8QbrjegkZA1l7Y5
	 R5Xz2M0c0/cvbKQiVmcPY95FitKqWlQA9rrQbju43CWkVOGsOquekRv6W8OUehdPKdMFi
	 B1JJ0ngeyaWAHKO3iUaq91WPVxR+d0O14bUvuHlWShfLLRHruMh2ZQFr1FXTPdAIsUWc1
	 qauqKdHiDe2TfCmoGi3nZlue2wlJpibSwbpjhKRxp4/a0XlRCLH1Tp7mXxGb8+ePzww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lwh5h2uF;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01142606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01142606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Lwh5h2uF
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde2fadb00cso301065a12.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794959075; x=1795563875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PAsluYk9Z+JsPGZr43ACSk4wnv2NKYTkxlXrZqnDYOo=;
        b=Lwh5h2uFpGvjGR6FYANsXlT+7wDXWkLlddhNW+A8OpCJV0B6wnHbG2DAePT5hGfAa5
         rsPCI6ac/aUrYrziXg8pECIzA9+13gVsMM8rRbkYiB39xPI16EB0rbBuQP36mZqaVm1c
         RuvjDXOQ+dVmkS+U4Kynxr9SUr1BlxhVxXXhleFy0WKjIbwzXjj9T28xtP1fZ1WrN8kJ
         pBRjSnnY5F/e/buYbuyaRH1Jt19dQSlC3XbUFFURA2lFp0B7nqVYHCOy1Ho5vLmuiw0X
         ww3ysPnUTHVprdbWdGl6pqoJRhhlID3iH1kPZE7G8CbusWCwG/g/2SjNGRWzvC05HPv4
         jusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959075; x=1795563875;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAsluYk9Z+JsPGZr43ACSk4wnv2NKYTkxlXrZqnDYOo=;
        b=xDwYaxmSQDZUwMsNlmANRA2k/VpWdSp2ySYE9O2bAztWvQFCObR3/Uu/ysPWmweji4
         YesUetyMH9lPXoZkAseFCnMoI1IQizVFo4JuFclebSTzUHL9K8CIYDL7mJaoCXhq2cCB
         dGX/b5FHy4UCBLLnUQ0ZjMVvOGmXUUFGTfJO+wg4wO1+177aDuBjBILTkF9nuWOwjR+j
         KhNtnU6GXeotTdjHmyqaifFzs8O39M5Gbmu9hWeflGjVzQwffdPFrUcpaVBbrUDEazxZ
         ummmzDJwjwr+Z+cz9u8A9ZumMXc+874u+XmEzJVZHR7ulzYC5SQyAV2AinDgqU6ytAlq
         uLbQ==
X-Forwarded-Encrypted: i=1; AL+hErH1lKDI0BP65iMEDZzZhlrSeDX0c1mAcfajItxf85gacrfij0uVPI5qOjW+nI/wiQvWXraNiow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gwsPDWz7B0pYBDK1PWY7LZh72QOLIa7/aKd52Mk4MOZIkpV4+
	JIF/H4fhH0hBvAVisCrDWARhLtYbwdwmLAKBoqrzMNpkhNq8xbJVoDq7LjYhe5QqhqhznhY5/VF
	bbeZ+Fg==
X-Received: from pgfy11.prod.google.com ([2002:a05:6a02:850b:b0:cdd:ce89:40e5])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e38b:b0:3de:463c:7fce
 with SMTP id adf61e73a8af0-3fe970ed2e0mr774820637.12.1794959075163; Tue, 17
 Nov 2026 15:44:35 -0800 (PST)
Date: Tue, 17 Nov 2026 23:44:34 +0000
In-Reply-To: <CAL4WiipmG_J4ASJ3LRhhvS7X+pFMdvq1CM_UnXRYH2M0ajZahQ@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-5-kuniyu@google.com>
 <CAL4WiipmG_J4ASJ3LRhhvS7X+pFMdvq1CM_UnXRYH2M0ajZahQ@mail.gmail.com>
Message-ID: <avzmgUDfPybeinKE@google.com>
Subject: Re: [PATCH v1 net 4/8] tcp: Fix reqsk abort condition on ICMP errors.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 09:49:35 +0100, Eric Dumazet wrote:
> Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > RFC 1122 Section 4.2.3.9 states the following soft errors
> > must not abort connections:
> >
>=20
> Linux has never followed this for non-synchronized states.
>=20
> tcp_v4_err() and tcp_v6_err() call tcp_done_with_error() for any error
> in TCP_SYN_SENT and TCP_SYN_RECV, soft or hard. RFC 5461 section 4.1
> documents this, and names Linux.

Ah interesting, I missed that.

>=20
> Tests 1 and 2 in patch 6 actually depend on it : host_unreachable
> aborts the TCP_SYN_SENT socket.
>=20
>=20
> >   o    Destination Unreachable -- codes 0, 1, 5
> >
> >        Since these Unreachable messages indicate soft error
> >        conditions, TCP MUST NOT abort the connection, and it
> >        SHOULD make the information available to the
> >        application.
> >
> >   o    Time Exceeded -- codes 0, 1
> >   o    Parameter Problem
> >
> >        This should be handled the same way as Destination
> >        Unreachable codes 0, 1, 5 (see above).
> >
> > Commit 9cf7490360bf ("tcp: do not drop syn_recv on all icmp
> > reports") introduced the abort arg to tcp_req_err() to avoid
> > aborting connection on ICMP_REDIRECT.
> >
> > However, tcp_v4_err() still abort on soft errors (ICMP_NET_UNREACH
> > (0), ICMP_HOST_UNREACH (1)) and ignore hard errors.
> >
> > For example, we can see SYN+ACK retransmitted after receiving
> > hard error:
> >
> >   --ip_version=3Dipv4
> >    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> >   +0 bind(3, ..., ...) =3D 0
> >   +0 listen(3, 10) =3D 0
> >
> >   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
> >   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>
> >   +0 < icmp unreachable port_unreachable [0:0(0)]
> >   +1 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>
> >
> > Also, tcp_v6_err() uses icmpv6_err_convert(), which handles
> > ICMPV6_PARAMPROB messages as hard error while RFC 5461 defines
> > as soft error.
> >
> > But we should handle ICMPV6_UNK_NEXTHDR as hard error because
> > it is used as IPv6 version ICMP_PROT_UNREACH.
> >
> > Let's correct the abort condition in tcp_v4_err() and
> > tcp_v6_err().
> >
> > Note that icmpv6_err_convert() is used by other protocols.
> >
> > Fixes: 9cf7490360bf ("tcp: do not drop syn_recv on all icmp reports")
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
> >  net/ipv4/tcp_ipv4.c | 7 ++-----
> >  net/ipv6/tcp_ipv6.c | 3 ++-
> >  2 files changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> > index fd9588bba967..f11e090d04fb 100644
> > --- a/net/ipv4/tcp_ipv4.c
> > +++ b/net/ipv4/tcp_ipv4.c
> > @@ -529,11 +529,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
> >
> >         seq =3D ntohl(th->seq);
> >         if (sk->sk_state =3D=3D TCP_NEW_SYN_RECV) {
> > -               tcp_req_err(sk, seq, type =3D=3D ICMP_PARAMETERPROB ||
> > -                                    type =3D=3D ICMP_TIME_EXCEEDED ||
> > -                                    (type =3D=3D ICMP_DEST_UNREACH &&
> > -                                     (code =3D=3D ICMP_NET_UNREACH ||
> > -                                      code =3D=3D ICMP_HOST_UNREACH)))=
;
> > +               tcp_req_err(sk, seq, (type =3D=3D ICMP_DEST_UNREACH &&
> > +                                     icmp_err_convert[code].fatal));
>=20
>=20
> After this patch, a TCP_SYN_SENT socket and a Fast Open TCP_SYN_RECV
> child abort on net/host unreachable, but a request socket does not.
>=20
> We also lose the ability to get rid of a request for an unreachable
> client, and keep retransmitting SYNACK instead.
>=20
> If the problem is that hard errors are ignored for IPv4 request
> sockets, I would rather add them than remove the soft ones :
>=20
>         abort =3D type =3D=3D ICMP_PARAMETERPROB ||
>                 type =3D=3D ICMP_TIME_EXCEEDED ||
>                 (type =3D=3D ICMP_DEST_UNREACH && code !=3D ICMP_FRAG_NEE=
DED);
>=20
> This matches what we do for TCP_SYN_SENT. The IPv6 side would then
> need the same treatment instead of using 'fatal'.

I'll update both in that way.

Thanks!
