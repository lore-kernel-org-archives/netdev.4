Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958552;
	b=A0vjDt2qX0/nPL1i30GeBFeY/2e88NvUmMS+gtgGhnTa0mN2K9Bg0pmfTnGKtJFYOXy+
	 HqVrQM8uhSQoRv6+4wozZC8Nr0MwHV4JCKBEvzxXekvTVQKl9KIVaSpXzsDH+lNErsgVD
	 YMwgNhbGz1zvQAGYWbbqjsARCgnzC0bFdFmDS31htyHqmt22yNpKdje6+/ETb33tOZgOB
	 Oubo/UJpNTfNt2qqYw3hAAKjNE2UPuja0mfJNvIJgStf9ijyzI7o799JwIW1vP4cwwUaG
	 niSqdn0occRP+01oDSTQurYKmWQtx222BrqtzxtZ4lrl0kMx5ieBunPDYfigtVHU4bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=K9Xm/mkfCb8KDLYsa02YJC1gTh3n5d9n9MZR4fV9Grk=;
	b=2QkWTuvblmL0lClSPImcnzOiF9IBRu98CNOatlmdngN8aPcU4po/nSN/q6z2vb+FjCn9
	 YnSleiLRd8ZQyy6IOIzQkksN4wfbo4EiaqZ2dpgjhHG+e8yW6yCMNUlZVThJ8UJaIYYZF
	 Lw7gwYgP5juFjLk4RkEtATDroocuvEiJR1eczRGBYnbEc5PPB9A7vIpoq52ipVwfBl66z
	 oAJ33p1BWv4Ljma2YtW7kWERSW3XG4tC9H8ySTDjORBbsKWEJhEiVSSD3F0Bl7iNSFkbl
	 mv1tnHtbJaA+MSpOhvPo/ns31xkY6GAThLDzVDxlwqDQNkjT+GyfAAA0IOPgbvft1dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bhON0x+w;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FDC606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FDC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bhON0x+w
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd48746a49so237749a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958551; x=1795563351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K9Xm/mkfCb8KDLYsa02YJC1gTh3n5d9n9MZR4fV9Grk=;
        b=bhON0x+wFFMRKBJpMix16J5yN7f8at0UlS/N/oXxUy/mBn9EgeeAt0Q9jA/X3xPQKD
         SXYyN8t7EPkFoZkl+mkUWvRgsI5hXAIAArg5Fledl4+7osoCYbIF+zyB1Zr7ZAaFy+w8
         VHmSvWtrSksinlpV5/oCd1GQtue3FKV82HeuseKLxON5qt6IuNphRwG9cwKXeDA6Mzyf
         RjsOn9bI5qgOQcvH9ZKYT3Ll/SJN0yifK+XhBVdYl1ZlQYSMctaahVlLmz8LGwrR3kKS
         pmxsOQg3aHbQhJohz1xKCwbY+4uyCGXkbDkYsW8aChKx7/2sHz8TJiKkcQtFQq876+4H
         itdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958551; x=1795563351;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9Xm/mkfCb8KDLYsa02YJC1gTh3n5d9n9MZR4fV9Grk=;
        b=mSImBy05nog9WdSBJG5mfBrOALTCLEeCN4b2RKKNIIHKaVLSDVhpT1WihINe7LJUaP
         BTdayCOkxUqlsZGQCSBfiwPZcdqDPVqP9nAS/0OpxDKFcSB14MjifqJ/ec+UcaRuNQaS
         Eo08zdddvstZW80VTh5+Hpx37AWHsGclY7StZ6gtYmGShTICJcLsAyBBdUhbRZJY8WZc
         JoxKRh341Ypi5xeEaBR+w2o4kzuX6FGCbVXbez73VGdi5qFwrzHOovXmQSsC5uIdcsMI
         9rhJWTXIZpD0rHCjZMdtQh0uAAW0vVrkSR2TEDohPKzIhIZ3KnYBlG7W7Yl5l2lpQ7pX
         ot7g==
X-Forwarded-Encrypted: i=1; AL+hErE4FuNRE9TjAuQNwmy1mcO1Np0deH418NcU/RBpfDKCQ6zOqOVBUcsuMKEzosGHgQ0ywabgcRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ei1WzKDljwbrLZp0qYjJzHSGr1AzLv1yBRjnNBf/e6/bbzD2R
	AmKTphp9nwVK9HBTB9HvUwq0OoiYsv2jlxnoz+yiB6fSSc+epfVjH4NZEwraDDouqD1pSqgKLKV
	T3Jn4GA==
X-Received: from pjbpq6.prod.google.com ([2002:a17:90b:3d86:b0:3ac:75d5:7398])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5390:b0:3ad:b8c8:4a84
 with SMTP id 98e67ed59e1d1-3b3d07b9133mr917647a91.26.1794958551030; Tue, 17
 Nov 2026 15:35:51 -0800 (PST)
Date: Tue, 17 Nov 2026 23:35:50 +0000
In-Reply-To: <CAL4WiiqEnTF0RCv4+Vp_WXG8jrwhsAakbXTzU+vfLq+d4WTAqw@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-3-kuniyu@google.com>
 <CAL4WiiqEnTF0RCv4+Vp_WXG8jrwhsAakbXTzU+vfLq+d4WTAqw@mail.gmail.com>
Message-ID: <avzjoLDBf-bkj6J5@google.com>
Subject: Re: [PATCH v1 net 2/8] tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	Stephen Hemminger <stephen@networkplumber.org>, stephen hemminger <shemminger@vyatta.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 09:42:02 +0100, Eric Dumazet wrote:
> Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > RFC 5082 introduced Generalized TTL Security Mechanism (GTSM),
> > and IP_MINTTL and IPV6_MINHOPCOUNT follow that.
> >
> > If an incoming IPv4 packet has TTL less than inet_sk(sk)->min_ttl
> > configured via IP_MINTTL, the packet is dropped.
> >
> > However, tcp_v4_err() checks the TTL extracted from the ICMP
> > payload, not the one in the outer IP header.
> >
> > The minimal repro is:
> >
> >   --ip_version=3Dipv4
> >    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> >   +0 setsockopt(3, SOL_IP, 21, [250], 4) =3D 0
> >   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> >   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress=
)
> >   +0 > S 0:0(0) <...>
> >   +0 < (ttl 10) icmp unreachable host_unreachable [0:0(0)]
> >   +0 %{assert tcpi_state =3D=3D TCP_SYN_SENT}%
> >
> > Let's check ip_hdr(skb)->ttl.
> >
> > Now GTSM is applied to locally generated ICMP errors, but this
> > behaviour matches tcp_v6_err().
> >
> > Note that tcp_v6_err() properly checks ipv6_hdr(skb)->hop_limit.
> >
> > Fixes: 97e3ecd112ba ("TCP: check min TTL on received ICMP packets")
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
> > Cc: Stephen Hemminger <stephen@networkplumber.org>
> > Cc: stephen hemminger <shemminger@vyatta.com>
> > ---
> >  net/ipv4/tcp_ipv4.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> > index 7d58f522068d..bf8542368032 100644
> > --- a/net/ipv4/tcp_ipv4.c
> > +++ b/net/ipv4/tcp_ipv4.c
> > @@ -546,7 +546,7 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
> >
> >         if (static_branch_unlikely(&ip4_min_ttl)) {
> >                 /* min_ttl can be changed concurrently from do_ip_setso=
ckopt() */
> > -               if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl)=
)) {
> > +               if (unlikely(ip_hdr(skb)->ttl < READ_ONCE(inet_sk(sk)->=
min_ttl))) {
> >                         __NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
> >                         goto out;
> >                 }
>=20
> Linux sends ICMP errors with the default TTL (64), so locally
> generated errors are now dropped for any min_ttl above 64.
>=20
> For the strict GTSM case (min_ttl =3D=3D 255) there is no router between
> the peers, so nothing else changes.
>=20
> But IP_MINTTL is also used with lower values for multi-hop sessions
> ("ttl-security hops N"). There, an ICMP from an intermediate router
> using an initial TTL of 64 was accepted before this patch (the quoted
> TTL is the one we sent, minus the hops to that router), and is dropped
> after.
>=20
> I think this is the right thing to do, since the inner TTL is under
> the sender's control, but I would mention this in the changelog.

Will add it to changelog.

Thanks !
