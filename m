Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536728;
	b=pU/5D24JHerLTVK5OqiJ6GNIUQJfS9xaEWA0LuA73GulzhDP48L3r2toN38fpQyYeWjk
	 C0aviOXF3teDFbA8PaIv0zBpQ0MdTYHgbg0zSz7tVNTBvOvRq5X2V9/BOotq2UrkfuufA
	 TROH4R+lYND+AUUsmpv2ITcug5WY9aZ2opBd2OoN13n9d5x8RlYa8JijEDW5sDGJ8tXnS
	 AeDDQmjWeX5gDGBrOCy3NHnVoRzvgQlyPg/h6zQWYcPUKTpSriwqPjRKaa0LNen3wwU5R
	 Erk94of/mPnOVcuCCyizllkdkuq3hZ48Kqof8uGKdPTiRYdnv0w0/2+HqRy9AKz3kvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pYLlGY9anwpb2Q0J0H7lZsHuURtjsvjjHUo0v1ukGAk=;
	b=BMwx5TkTukKdztBq/7HabMfmS2dmEW1hvaLmlc8cyAQ+TRmRHVltzAkypaOKF+NZ+V++
	 9uoGIE0UQ11zBDy9tf71cf+gDuAZrvDyUssqyHx5DNhXLx9DsnkwNcjPb7uJLYR36lJ6d
	 yKTS2VMiW2L3fTjrCPhx1szuJ4jCF8/bK1kbWUHcVh/Y1e1tBYY4bxvUcCwFk3Sm6OeIc
	 3awhXomjn43N82dFT0zlIPQxWG+pQpcTmKO/k5SJ3jABclLd98allGapOoPADqEUd3+2P
	 HO3IUUfYOzIZTuzpMEkBGcrZbjJMdoTXkmfp4qXrkKtRjQTDOVkVdh2n1+rvuKz+ZWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXXyVN0x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B3606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXXyVN0x
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so3408801e0c.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795536727; cv=none;
        d=google.com; s=arc-20260327;
        b=ACXK5n/sVrJEtACSFQ5ss2uxmnP+u7CC1NAMMNcYMTLrmHjsQxRIS/xBJoT9UNUlRE
         LvjLS+KLx2k4IL1h7fp9PJPA38DoVtTuZHb4ZNQyhZ+8YU6at+Zt0utNJzP8TXjIwY5B
         aobo8E5P9xMgEpFhOo0mntMODvpzuCLqpc8JeExUo9xC/3xA4nT8M7PO5AlPwbnG/yCs
         xO8QDv4ybamPVidZsPVSta9UJJhyBIHH5EQXnNII9EZ5GOfzns+To58p7kIwhVK+I+cg
         Q/sbZmVNL/57e3FecLN018/ITLRCjvaJhuQV5fruqbivKTh4VO8VlZmDDdyrfMgWjExy
         iSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pYLlGY9anwpb2Q0J0H7lZsHuURtjsvjjHUo0v1ukGAk=;
        fh=hmXngdu0Xr0aCzuWtPuWhRZej2OQgztQTyz38XdXv0I=;
        b=M0TODQzdfNSYKhRlCBiW77HrQcjmf7WDn+Aa6tQNpsYpxjZDazppxe7Lraml4wlrIj
         kXMVSStrnocWqeWelRgKe18295QXChrq0PRAgoDmp3Ch021svEqsC32i3AyZa8mp3sIW
         GaSm6nyTFd+Kgn7gQfJf96Jpwl7VxdphQDWW8zWQnvRzULe7Xu1wP321znF+x+D+OBYV
         /dnqCkn1WLCLN5y9sC1Zu/rNPxczcOTVtHw7xFIsLU4O4Lte7wUU0tWQxRdom+N/M1ge
         6Kbay/4KXbVCdxa+fZe2vJvYfPCmRZKLylKFfzd/sLT1sHyPo3zNN4OVc2SwpbDFwgVR
         OUzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536727; x=1796141527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYLlGY9anwpb2Q0J0H7lZsHuURtjsvjjHUo0v1ukGAk=;
        b=UXXyVN0xytSlIXEW2iQEhjp/MPhYUgJhJJSzv3XuObQgmlaMQ3rEYTC1sXw4cw5ked
         Ny16b3lqpRpeM3YOEa969DFm1S4vDTJiIyiAXW3/iftuvFpgYDi/Nm2MzxLiAr8mlOXE
         Y14IS44LbELxb7kENKfwLCG9YwfeEcwXdHOExDfBHb5lMrlBw+/P5JONWF1DsJBRICNy
         P43uTA19DZOLi1E39omx6Q61Rfc1NnRaxRcpju66qdxBC1pmb0ZbkDYvq4ka1Z34dK6O
         3nAV24GNFShGvRDATuYFvWcxT/aAFxeSskEWGLfeTb7tHzVAVIppd9ahxZeTPNRxZQDI
         J+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536727; x=1796141527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYLlGY9anwpb2Q0J0H7lZsHuURtjsvjjHUo0v1ukGAk=;
        b=e7wQDPTaXVRYvN80Ao/xTsYBtvfS69ePaF3Ij00mBIRR4o8j2U3iZAVL/5kK8Vqg1L
         J5k6X6jtSZnpxnlF6pnmFbfaHU4Oyp7AQjdyDyUUpdV99EImtv84GuzRGgz+7NwDo2T+
         wryTrg+OMOZxB20w4rC4twH5mJntD4Gg6mGkKMSsRlWU73sqqbPz4mJ+13upb4xxMlnw
         nxPuBbmqfX5714fXSYAaNW5w3dhPDVzqCKNgRwXTjS8QNLnIUoUnCAlaRkK4WHWzaP1I
         2+8SMFjei4EQwWEeFMxnLRli7mOTV4ugRWAJHjd3rwevHTfs2E+d+743zr3luSkfMSpF
         cF2w==
X-Gm-Message-State: APuU4Z/zs/iznGUxcCheBZUmG3sNWWoN46tP6oHr+FohMIPHLe84uWmS
	SSEOimQBhTw6tMIVI6ocJImehLPdaCDEXTr4H91KVNoP3y9agXBf3Qu/7ogpX+8/Aq/ynnl6IiY
	CV7hlDONfm9d72cDji4k7kxwz/S/4lQg=
X-Gm-Gg: AZFdTZfS/f1PPajv5JSSGayPU1TsWbwC9/Z0fWUB2g742KHJO1q9JwLhMmTFjfd5kTh
	7+Szz6bThn6jGKH6n7SBpy2oHz3yMjkYR3maDLpM0o4VOcXfiSqJyN5DfREe0PJDhyCN/0V6fwx
	hY2Scbop4ukOw+D1CWSh7tsamS91Ji++7sFkkJKRx0wC7g7wPYvIoj5naTn4tJXE5FmP6XoT7KW
	O5CDPyERhTYNMR0wsaf2p+QpDJ5x4qZD54rPkzfKf8iFoCV66VEVmsSG2zF5bifouUpk4IBpACY
	OvIREvqThA0l2boUXK3ZnxX9Sb1+oa5sqKHjKNFLa12xxhvL4ET8kHOvvlpwGvKwKkyB/6EkgyV
	hbbE64VPjB+u3BzznkLiAQqMCpCXsmKipEqQnzTwybiyLMcyBTClpWL/i/uyOrryL3meHZMvAhs
	ckTh5YBZQ7xfSo11orHlg3nfyQautD6g1u/Q9wJDmJ7AQPF7HaxWKnyc6oxZw=
X-Received: by 2002:a05:6122:d03:b0:5ec:b8f0:774a with SMTP id
 71dfb90a1353d-5ee8adf6c85mr8478872e0c.3.1795536727041; Tue, 24 Nov 2026
 08:12:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <409da01d058fee776791de001ffd222069f06090.1795394936.git.lucien.xin@gmail.com>
 <179548140847.3135.8828188577061386396@kernel.org>
In-Reply-To: <179548140847.3135.8828188577061386396@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 11:11:54 -0500
X-Gm-Features: Aa3M54rqETa2lnqAo-ABIO05wIeeFIjUfvZmi8lF89O6LgYoCp4j7vLsobhJRjY
Message-ID: <CADvbK_eX-86Wh28QBQomBANJ=UpxhzXJe028r99KN5+VA9Urpw@mail.gmail.com>
Subject: Re: [PATCH net-next] sctp: diag: set sin6_scope_id for IPv6
 link-local lookup addresses
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-sctp@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	marcelo.leitner@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 7:50=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] sctp_diag_dump_one() (net/sctp/diag.c:458 and 464) uses the
>   single req->id.idiag_if as the scope id for both laddr and paddr.
> - [Low] The patch fixes a long-standing bug but has no Fixes: tag and no
>   Reported-by: tag.
>
> --
>
> sctp: diag: set sin6_scope_id for IPv6 link-local lookup addresses
>
> This patch sets sin6_scope_id from req->id.idiag_if on the IPv6 laddr
> and paddr lookup addresses built in sctp_diag_dump_one(). The goal is to
> let exact SOCK_DIAG_BY_FAMILY queries match IPv6 link-local associations
> when the caller supplies the correct interface index.
>
> > As gomaja noticed, sctp_diag_dump_one() builds IPv6 lookup addresses on=
 the
> > stack but never sets sin6_scope_id.
>
> [Severity: Low]
> Should this patch have Fixes: and Reported-by: tags?
>
> The laddr and paddr union in sctp_diag_dump_one() has been declared
> without an initializer since commit 8f840e47f190 ("sctp: add the
> sctp_diag.c file"). So on the IPv6 path, sin6_scope_id has been
> uninitialized stack data since that commit.
>
> For link-local peers, the scope of the transport's ipaddr is non-zero.
> Both sctp_v6_from_skb() and sctp_v6_from_addr_param() set it from the
> iif. This means __sctp_v6_cmp_addr() reads the uninitialized value
> through two paths:
>
>   sctp_hash_cmp()->sctp_cmp_addr_exact()
>   sctp_bind_addr_match()->sctp_inet6_cmp_addr()
>
> As a result, whether an exact query matches has depended on leftover
> stack contents, and KMSAN could flag the read.
>
> Would it make sense to add a Fixes: 8f840e47f190 tag, so stable tooling
> picks this up, and a Reported-by: tag for gomaja?
>
> > diff --git a/net/sctp/diag.c b/net/sctp/diag.c
> > index c2a0de2adf6fd..dc199e3e96b1c 100644
> > --- a/net/sctp/diag.c
> > +++ b/net/sctp/diag.c
> > @@ -455,11 +455,13 @@ static int sctp_diag_dump_one(struct netlink_call=
back *cb,
> >               memcpy(&laddr.v6.sin6_addr, req->id.idiag_src,
> >                      sizeof(laddr.v6.sin6_addr));
> >               laddr.v6.sin6_family =3D AF_INET6;
> > +             laddr.v6.sin6_scope_id =3D req->id.idiag_if;
>
> [Severity: Medium]
> Can using idiag_if as the scope for laddr make an exact query fail, even
> when the sockid is copied straight from the kernel's own dump?
>
> On the dump side, inet_diag_msg_sctpasoc_fill() takes idiag_src and
> idiag_if from different places:
>
> net/sctp/diag.c:inet_diag_msg_sctpasoc_fill() {
>     ...
>         laddr =3D list_entry(asoc->base.bind_addr.address_list.next,
>                            struct sctp_sockaddr_entry, list)->a;
>         paddr =3D asoc->peer.primary_path->ipaddr;
>         dst =3D asoc->peer.primary_path->dst;
>     ...
>         r->id.idiag_if =3D dst ? dst->dev->ifindex : 0;
>     ...
> }
>
> So idiag_src comes from the first bind entry, which has its own
> sin6_scope_id. idiag_if comes from the primary path's dst device.
>
> Here is an example. A multi-homed socket calls bindx() with fe80::a%eth0
> and then fe80::b%eth1, and its peer is fe80::p%eth1.
> sctp_inet6_bind_verify() allows these binds without setting
> sk_bound_dev_if.
>
> sctp_add_bind_addr() uses list_add_tail_rcu(), and sctp_bind_addr_copy()
> keeps that order. The dump therefore reports idiag_src=3Dfe80::a,
> idiag_dst=3Dfe80::p and idiag_if=3Deth1.
>
> When that sockid is sent back, laddr.sin6_scope_id is set to eth1. The
> lookup then goes through:
>
> sctp_transport_lookup_process()
>   sctp_addrs_lookup_transport()
>     sctp_bind_addr_match()
>       sctp_inet6_cmp_addr()
>         __sctp_v6_cmp_addr()
>
> __sctp_v6_cmp_addr() rejects the fe80::a entry because both scopes are
> non-zero and differ:
>
>         if ((ipv6_addr_type(&addr1->v6.sin6_addr) & IPV6_ADDR_LINKLOCAL) =
&&
>             addr1->v6.sin6_scope_id && addr2->v6.sin6_scope_id &&
>             addr1->v6.sin6_scope_id !=3D addr2->v6.sin6_scope_id)
>                 return 0;
>
> The other bind entry has a different address, so the query returns
> -ENOENT.
>
> In this case no non-zero idiag_if works for both laddr and paddr. Only
> idiag_if =3D=3D 0 works, and only for sockets not bound to a device.
> Wildcard-bound sockets on hosts with several NICs might hit the same
> problem, depending on the order of local_addr_list.
>
> The transport hash lookup is keyed on paddr, and dif already filters on
> the bound device. Would it be better to set only the scope id on paddr,
> or to leave the laddr scope at 0 so it acts as a wildcard?
>
> >
> >               paddr.v6.sin6_port =3D req->id.idiag_dport;
> >               memcpy(&paddr.v6.sin6_addr, req->id.idiag_dst,
> >                      sizeof(paddr.v6.sin6_addr));
> >               paddr.v6.sin6_family =3D AF_INET6;
> > +             paddr.v6.sin6_scope_id =3D req->id.idiag_if;
> >       }
>
It's better not to set sin6_scope_id for both laddr and paddr, and
leave req->id.idiag_if to match sk->sk_bound_dev_if as it is.

I will just zero-initialize laddr and paddr only and target it as
a fix to net.git instead.

Thanks.

pw-bot: cr
