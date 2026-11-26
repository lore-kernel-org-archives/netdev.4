Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795724842;
	b=egz7f8eQr70tu0yi6E29hlm05X03zgjfrcfcrZVikOAvwMVR4YVTcNl8EN6gL4u6566+
	 DY3jReKWj3QZdhtxeZ+9rDVWhOW2saJYtH/CAoslQJw+yTtUfK1TCXXVfMFmEyaVsmcsT
	 Menp0p8v5mmwX5HudfJvxoOQV5gVv/1Rvu4Lks1k4fhUHi0QJbUVNQ1wXm9qtUxNEzR9J
	 9ffqpectGLkskNK16hu8U2ng8LmPFOfLYwTFDavkUSW18cU7jLYMNn1hxlkrin3RUO4LX
	 53HtGQavj1t5WMvkrmRX6P6iC8HdK42Am50Jg6yUNAD/v6WEAQEk0plpt76b3u8RE2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=CdPL09V6vjBqFmHjF95aST+4s9bV78AjAx0jSltOIgA=;
	b=UGwSxoOpp6frvc9WI1pE+SHiIiXIUB/1i9Yr5LIeJw9j8c/GlzhHArIrVog3enErq2wb
	 T7s3FBXP7Ha6fQ0fcgXxbgF/QKXa9Hoi05Czlij4rQgrutKMtq6Ze6Bfs7eW8rTqCe8Jz
	 x0zPk984X7xbBhMYLsHJs5ObmrinnKVLDwdabTihSknMwcKjH26Vm/LJavGCww0lN2Xxk
	 gIyRFqsWqi1Fd71nFbm3BtUmrnnoeDbr++IoX6o94Ti+3PszYnEjUwrnuiktWaZEVhbg6
	 vE+iLrZdMLJGm7zwly+xR+p7CO5S/3KvHgS99fIlx1ETGMnw3Av7EUBCqbPP1i0iFeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BAcHC/Fv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9297D606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9297D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAcHC/Fv
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so2561703b3a.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795724842; cv=none;
        d=google.com; s=arc-20260327;
        b=jOW1D2Oh9eooQnqtb9gsbN4F+nk4RZs3OoeC6gsxv8kj+mxsUurieT+TUdCkIjDPx8
         3Uhiz14EOVCDPcBuzegFEPEAocDDBNO+j0hsUP7jNdSoVaAwXdiEIGuLON4PQriNHtqZ
         /YmKhywKxOydHcGON1B+Ym4AD9amg6YSyy+ddnLeSkfjutkbFzntQ3ZvlxBuwzq4nZOI
         Tuu7PXB7sHHg4xFOXVYrigWaT95QJ3WOk68n1C0Pg7vQGY6bQWjcC2K0oLq6MAgLV8Ut
         e27Ju70qgz+3XaxiteF5+A3Zb8SwQr00sBuhRAC8eoU4K9Rm5yUUv3TK32HjSau+Sid/
         QAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdPL09V6vjBqFmHjF95aST+4s9bV78AjAx0jSltOIgA=;
        fh=hmXngdu0Xr0aCzuWtPuWhRZej2OQgztQTyz38XdXv0I=;
        b=DYWG9Rhxx/aCK9M6ObNubBqiuYJs8lQJSFmEHm+T4oU1PAgqUyq5sQNv16QHBV7Mns
         cXThn9bp5Dv2ZkiQ94CUIueFDdL8pP2JqJ1hrm0+H/qtemDFyqlryulQN+3AbrFflCua
         IdAknt/ROZLxDAWfeVJiZkf8EPnQ8T9kG5OJW0FkJpPc3ddAZtAovs+eyq8TsoxM1wEM
         Ucl6c8HlGFM2kD3F3Ss6C8GsV2F2f1HtZJ/oYCgqvzARyo+mxqy9KQohzHHZlH0unern
         /kvarg9uYoYvxAjUsdQNCY1rk0nOfDgFY7QiwsiSFp9veQvkK7pA+/zZ+GHYYxUPv2FZ
         0wfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724842; x=1796329642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdPL09V6vjBqFmHjF95aST+4s9bV78AjAx0jSltOIgA=;
        b=BAcHC/Fv91N4U9IimHPu6YSa9DJluh9hbeQxL4i/FBDbAWH0lPf/w7G85ZSvkykggH
         4m+uvhUK9/oVI2vniWITFMAssbexoIugs2XW0WTYIUSYikIurJ0O9JjAoYfyzjyGWQIH
         pur2+M8pL8Q5z5kwBDJ2Dv3m30CQSWZrmvCyUrYh2CIDOKzlDon7vQsl7GmvIqvHxDh8
         nJ0u3bBrE7Ivk2gm9XjIFTBwdRf3iQ5ORZFi0fgiSQJwdrLJPSm0rfRxIlERbDdAvhBR
         peTNErAAXWEjxCPYg0qIStxbElTbpQdnSoJSo214JfmGskX1RVQnIzuw3t9jV+aOcgqv
         GsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724842; x=1796329642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdPL09V6vjBqFmHjF95aST+4s9bV78AjAx0jSltOIgA=;
        b=IQwCPMdRqNKdzrireShzZAPSbZby1RpGaUeblE36SvUh15KDl4BSnBl2/7IPl2EC9B
         0vJdDa1u715lXBe8jOif0B3b7EZIbW2upZZLcc77Yj/uv99PxjOtUTW8W7myjrPY8ivI
         8vSTsfHQ6thIxR/dW7BIR/OMHhZ5/e3Erh5RbC1wN394t2yKfH/sPVuXRzFN1nPHIkeD
         mMxeVqBaOqqZrjZjHe7UTlEODaZdUXtFFbUVyRW9Vu3/wF7cfWWBMVJFUYS/ccw0rBdY
         iNpclA3Fwc+OUA9yM8lU5DGCYPHiz+hk7H+igRg6uD1EZAhzbHus51u+hQQ2nCyVqPt/
         GKWA==
X-Gm-Message-State: APuU4Z+A9zJBgq9j0GqxeimgCgRMbhIA5kZlQRYjF+H0XA4NxVDLLtm5
	go/dQY3Ec4fq7M9Kp8spMjt3z1r3wChNckskE9b+ZrV8NSSks+JEUh4LtSHabDZiz/6d7xZfZ38
	qwOLTWfVKWIEKHw2RLZhFnxN2XNW6iXjkFqNp
X-Gm-Gg: AZFdTZfGcD+ymzbAfUwJIaa3EnbJAS8dJBrY716bqlhJa7QRkJTlvdC3CrjKE/DHOdH
	9WWPgkQUb9Kzuy1gN3BsY2kamPb4DDbvfYI7UYlVBtljgvz+eiMURpbjP4tzAYVLZwuY8zSwSsz
	worhP4sXz7X/K6vRQyqSsgqcFpYCJrKfM7XhwbTCNFDvV5Qcdo/ZKJ+KnMLXWPa4x93uVRNybfx
	k3uOW44VSnAaVCU+rN4+F/0rsXy/zqpWvdYSB6ofYOdPiy4rjeAbNDo8a8ptqVSJBUbTLMvjLAk
	FeR8Fqn+DivzxG1I8TQQ1inO8nJRjTrnmgGCsAr7uoBm89fg+vkdhw05Mrb+sBUTuQpAVSmrCif
	u2JqkximcEbFRUwfvwb6BNIMOFQclBco+OCY7/P1X53PTbGXjSsncQJq197DxU6ufmRblpXSRX4
	qqOfPdYK7cDXfLr7AQ8m5CQqUvpZd2/goiKSg=
X-Received: by 2002:a05:6a00:2e9d:b0:880:849d:c07c with SMTP id
 d2e1a72fcca58-8c87c29172cmr19318850b3a.25.1795724841902; Thu, 26 Nov 2026
 12:27:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7cc69548f249ff63527a663c22d9dc918d3c3e84.1795621751.git.lucien.xin@gmail.com>
 <179570816138.3135.14968815049241245107@kernel.org>
In-Reply-To: <179570816138.3135.14968815049241245107@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Thu, 26 Nov 2026 15:27:09 -0500
X-Gm-Features: Aa3M54r5B4wx34siMoGYdu5QqFcDcda8LErzfVJMrQldUnf9MssTYfgWQDCRNDQ
Message-ID: <CADvbK_fMso1BKZrdX54zph5ZbCgsmiecCm7HS88gA_PePPwRSw@mail.gmail.com>
Subject: Re: [PATCH net v2] sctp: diag: fix stack garbage in IPv6 scope_id
 during dump_one lookup
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-sctp@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	marcelo.leitner@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:49=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message justifies the wildcard scope_id with: "The
>   dif check in sctp_addrs_lookup_transport() already filters by=E2=80=A6
>
> --
>
> sctp: diag: fix stack garbage in IPv6 scope_id during dump_one lookup
>
> This commit zero-initializes the laddr and paddr lookup addresses in
> sctp_diag_dump_one(). As a result, sin6_scope_id and sin6_flowinfo no
> longer hold stack garbage. A zero sin6_scope_id then acts as a wildcard i=
n
> __sctp_v6_cmp_addr(), and idiag_if is used only as a dif filter.
>
> > diff --git a/net/sctp/diag.c b/net/sctp/diag.c
> > index c2a0de2adf6fd..564a5b51e6ce3 100644
> > --- a/net/sctp/diag.c
> > +++ b/net/sctp/diag.c
> > @@ -433,7 +433,7 @@ static int sctp_diag_dump_one(struct netlink_callba=
ck *cb,
> >       struct sk_buff *skb =3D cb->skb;
> >       struct net *net =3D sock_net(skb->sk);
> >       const struct nlmsghdr *nlh =3D cb->nlh;
> > -     union sctp_addr laddr, paddr;
> > +     union sctp_addr laddr =3D {}, paddr =3D {};
> >       int dif =3D req->id.idiag_if;
>
> [Severity: Medium]
>
> The commit message says:
>
>   The dif check in sctp_addrs_lookup_transport() already filters by
>   sk_bound_dev_if, so scope_id on the lookup addresses is unnecessary.
>
> Does this hold for SCTP the way it does for TCP and UDP?
>
> For TCP, connect() to a link-local peer binds the socket to the scope
> interface, so a dif filter on sk_bound_dev_if is enough. SCTP does not
> seem to set sk_bound_dev_if from the peer's scope. The scope is kept only
> in the transport address:
>
> net/sctp/ipv6.c:sctp_v6_get_dst() {
>     ...
>         if (ipv6_addr_type(&daddr->v6.sin6_addr) & IPV6_ADDR_LINKLOCAL)
>                 fl6->flowi6_oif =3D daddr->v6.sin6_scope_id;
>         else if (asoc)
>                 fl6->flowi6_oif =3D asoc->base.sk->sk_bound_dev_if;
>     ...
> }
>
> On the dump side, idiag_if also reports something other than
> sk_bound_dev_if:
>
> net/sctp/diag.c:inet_diag_msg_sctpasoc_fill() {
>     ...
>         r->id.idiag_if =3D dst ? dst->dev->ifindex : 0;
>     ...
> }
>
> For a link-local peer, this is in effect the peer's scope interface.
>
> On the lookup side, the call chain
> sctp_transport_lookup_process()->sctp_addrs_lookup_transport() passes dif
> to sctp_sk_bound_dev_eq(). For an unbound socket (bound_dev_if =3D=3D 0),
> inet_bound_dev_eq() returns !sdif || l3mdev_accept. That is true by
> default, so any dif passes.
>
> With sin6_scope_id now always 0, __sctp_v6_cmp_addr() matches link-local
> transports on every interface. sctp_hash_transport() treats two different
> non-zero scope_ids as distinct. So an unbound socket can hold association=
s
> to fe80::X%ethA and fe80::X%ethB on the same port at the same time.
This is very uncommon.

I would rather NOT set sin6_scope_id from req->id.idiag_if to support this =
case.

Even if we want to support it, it should go to a separate patch in the futu=
re.

Thanks.

>
> Suppose a dump_one request echoes back a dumped tuple (addresses, ports
> and the reported idiag_if). Can it pick the wrong association in that
> case? sctp_addrs_lookup_transport() returns the first matching rhlist
> entry:
>
> - With INET_DIAG_NOCOOKIE, that entry could be a different association,
>   possibly on another socket.
> - With a cookie set, the lookup could return -ESTALE even though the
>   requested association exists.
>
> The same ambiguity existed before whenever the stack garbage happened to
> be 0. This patch makes the wildcard the intended behaviour.
>
> Would it make sense to keep the zero-init and, for link-local addresses,
> also set sin6_scope_id from req->id.idiag_if? The commit message could
> then be updated to match.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/7cc69548f249ff63527a663c22d9dc918d3c3e84.1795621751.git.lucien.xin%40gm=
ail.com
