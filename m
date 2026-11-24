Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795479292;
	b=glmEfsNNU/4NGzJRad0I6uIBcsbSEhE5Gk6HzXytOGiJ0RRxHjYrXE7KG7Ck7U5L1t7A
	 vhOZqm0Vn43PkxfAVmvXIBO3G5sKAoDuHBL7SgA7soMBbHHcFyHsZjl4d8G7yLzrjc9gv
	 393zDNM50gJXLW2fOpY/oRDIcV+wU2D4A9A/62nMwyNRvTzCGp2kzfLuex1kXWx1lzWCv
	 G/d2+o70NSmy53LvkluyJQ6Uv92EeGq8xVdC8EaumN84QyCHC4pNtmnICF34RRPJeABWh
	 rpTEtgICXiNszQDwsAM0PYsYeIGo60r6+oB2HzcRTyDz6777B0+LQcTuEmS+lP4ROpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
	b=hN/DOa8+m2TZQ7h1wS/kuKWO9/Tstu/kW+axP/Gk9ao0aHJBDAUl/slYvq7MZCQq4nqv
	 xvmnFj8R5Ma/YOJn+HA1kfXK3mK3foB+RUqajGZRvqChmM0XuC1FHOc5vagGYvi7djoT1
	 zZ83TKGD3nPwzrerKSCwedQ3oJLKdLrFpLnxtbW/rjeP6ovUY0dYs2oX2Jh9wBpDw/F7a
	 g516FqzssCf33pm01XGy9A6KIZG2NHyaQ2btOfJbZQlm9z8S4sx2B3P3RsOKGoXcoyGoM
	 uSlVHQMiTAALXJC3l2QQxTh0iTk9fzwDu++DyUtdHf35qxZc0/pgZvAf12lir+0MATg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A4QlAUdg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC72A606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC72A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A4QlAUdg
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso55304686d6.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:14:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795479291; cv=none;
        d=google.com; s=arc-20260327;
        b=fnXHnsEVPNLyEOu3jIghalNDe72zIIHTc4+Z+4c1qpx2B2kpw8Jbl6CJ2pVOJgss+f
         0enI0vIGZtSFdvZhwhty9gdDOBi21Nxjh6W8D49oGcbBh+RsNgRtQH8Ba7ZkiaFBT1ic
         lWbU8qaIoa2RVtd/n9SDaefEx/aCSwB/tfTiT9cPrMqYD5e0KPrXpLmNontS+VK1MGyt
         JqwmnUga/DZWbdRNCyPExCdXSXn5emit+ucNaSVX1yChXlJ7UStEn9/TugNwu0ratRW/
         0qriW+C6mso+mJ31yyIbWXfL43rm0iwrQ6kqb3r1suMY/GQZ3JwzJk5sf5K7+Im50if5
         ZG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
        fh=mwXzGv9uGBgAaVGGlAP3fLINw6Z3Cx8g4QbK6y2Ygwg=;
        b=FH0zmO+Cfv9ty/wzrj8OmuoJgVU1J+j6VH0tMWsUWjluh3OeKGogNbA6GYiQOMVKh6
         UBfyYiXhGBsZ2zifCqazLPpR3Tl9M4tVQia5STSR5RaUSNtdm6TZ9K5/89+6jo6Wdr4u
         ibg+7b9dFX3JAk5h5HkAffMxsWykH7Kd7D3i/xjZXkVVTJbcfC5H6rz11QcnV9VZQVOf
         jlSKhF1+5/tKbwH1Z7RLxHSsuYcbdFFE+hJ/BlNCA36kuo4QCsH1O1w4Wu4XacjvGvXU
         lDFNECh0K/0wtY/OxrkhwvjntZi1f7OhH5p3d1XJy6Olph6CPGQsp9+592agqwEgojJf
         /DlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795479291; x=1796084091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
        b=A4QlAUdgzcP4QQMusPEGIU7gYufXHiTJ8so/+IqtSIsFx9qdWKy+wWPDSyd2xBim7O
         em9Hzsbp4eF2QgZ4E/ZOCukj+tpJjX+cmpgVdlWHIUjhj1jAlb1OeGkCeyVNS4DDCAX/
         BYFeDw8AXnCxqpICZ+V6oLllWqiAs5S/z5inSGFNlLzh11DcYuyxugkaJJCXppU809jS
         Eva34bxzf2Ia5lO7ZiS8JMaQuPY3f6nhf4Vcby57ik8Usmh4IlaDvHJ9FU5rTZ4sczsN
         C37xoJWsTpyn/8InYUPjfzMV3kamioT6+DwmuyZ0CLYB8W4zZfAq5/uvoamQOrjYcfV4
         c0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479291; x=1796084091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6XVZ2NiwhlknfYaEdDrlA5ehy0/PYDAe60GW8QDF+Jg=;
        b=Hdh90smEyroZkLU04Ivmma4HT67q9u8mtDX+U00zXfIYb2xJxyNepmOqUiJaUr5nab
         P5EhwJS3sW76xH3jHdyzUHicI0uM+tldKuOD0qGQgNrwrx5lvmxSoiC3Utj+FPYPNinN
         I1KNCD3IuojyTmV+6hgBm+ZKGRpALm5htYHjHYIknvwqAN4ob1jovPe5qXF3u7IdZ85M
         JxiWsTJoDAELxojhllStvAEQEt9wkGUAmzBmkoyYYwQAIY6aB4sxZEjd1QuXc3991sW2
         Q83Mauc18aBPqViOV6y4eGWrYVz0Wegi1glF1lYl7hCxV9oVqqH0NDkqH2Lm6/L6sYTt
         7WKw==
X-Forwarded-Encrypted: i=1; AL+hErGkIXfAVywbkBEu6gL2byp+0rECa0AdvFpWXltcqo7BR/oM3iqvpawBubcToHQcwPu7aA26IRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+yhA4qqKTeYN07O0gZVgypGpxJEEHph4C3jENZaBS7HmUDLhp
	fJ31QVD3easZxfm9J365SlXErEvqfYGgg+oTm3ZnrUotTp6WAbZJ635o0JuMkcX/m7V9lthPtAm
	uO1B/bJhfr6IRKTxMmaSIPbfvWekeJck=
X-Gm-Gg: AZFdTZemOfO4NtDWxVeA8usAkZrqxVJqdq6yTbUlz1VuvjSHIzM2hLN4s4D9+yFgtyy
	TrEQ+4zYCB4mTew/mZpFs+74mlXTXjubfIWx56ImsZmMs2SUs8Bdv8uHxUgRlGeKxRHpt8/E/el
	qvTq/wvQ8jU3RXIzxX/ie65Fh1aXp5LOKV6HV1A1cmas5lWH2RjUOACXhJEKMwEc994RQlJK4NV
	N6e3XwPmCuTbVpXO1lxRe5W4gHVIDGoEm2qbC1omUeWKiruQ/ypXaNrKlmKsw6zYDSAp65IhRV+
	6rlwf6uvPoKZLkTh7aBBKfGzTU8/NUVeDFIALWHVgN0XoRuHtfSGo9F0bwdl+tyKlnefyzocdhC
	BuNuZXcbjvOB2HdxzDNoYSN8J5tfYQPdG0wO2WTOsHPgFR5Is7IazC2LNLVgpqzHXyAJc5WXCQW
	WeQD7Nwirri9IvG5mqaSS4tEOg3tZZkJ5VuSvoAio/BkGHO7DVWoW98QPnQVlNe7F4SIu2rqLm9
	xH/p1WBNMKmavelUQ==
X-Received: by 2002:a05:6214:85d4:10b0:921:2397:15c0 with SMTP id
 6a1803df08f44-92134aae88amr174798896d6.9.1795479290741; Mon, 23 Nov 2026
 16:14:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122233958.10462-1-astellman@stellman-greene.com> <179547862919.3135.6087887655063297728@kernel.org>
In-Reply-To: <179547862919.3135.6087887655063297728@kernel.org>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Mon, 23 Nov 2026 19:14:39 -0500
X-Gm-Features: Aa3M54r8LqYwCwZHSInNPFAsZl3pmCroukwtjzOFoNnEUp-H2sQ6lvQOIHcivKs
Message-ID: <CAChPuV88P4Uf8BBxAhrM044ozX21ZCiPqn4J3-vLc-x_Gz_wiA@mail.gmail.com>
Subject: Re: [PATCH net] tipc: free the tunnel packets when failover
 tunnelling stops early
To: netdev-bot+sashiko@kernel.org
Cc: jmaloy@redhat.com, tung.quang.nguyen@est.tech, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	tuong.t.lien@dektech.com.au, ying.xue@windriver.com, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed: that return also skips the FAILOVER_MSG hand-over, and goto
out is safe there since tnlq is already initialised and empty. I'll
include it in v2.

pw-bot: cr

On Mon, Nov 23, 2026 at 7:03=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
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
> - [Medium] The patch leaves one early exit in tipc_link_tnl_prepare()
>   (net/tipc/link.c) that still skips the FAILOVER_MSG receive-side hand-=
=E2=80=A6
>
> --
>
> tipc: free the tunnel packets when failover tunnelling stops early
>
> The three early returns inside the tunnelling loop of
> tipc_link_tnl_prepare() now jump to a new out: label. That label purges
> any tunnel packets left on tnlq. It then runs the FAILOVER_MSG receive
> side hand-over (drop_point, failover_reasm_skb, deferdq).
>
> > diff --git a/net/tipc/link.c b/net/tipc/link.c
> > index 6427c69f89294..2fead2f4ed0fa 100644
> > --- a/net/tipc/link.c
> > +++ b/net/tipc/link.c
>
> [ ... ]
>
> > @@ -2073,6 +2073,9 @@ void tipc_link_tnl_prepare(struct tipc_link *l, s=
truct tipc_link *tnl,
> >               }
> >
> >       tipc_link_xmit(tnl, &tnlq, xmitq);
> > +out:
> > +     /* Empty unless tunnelling stopped early */
> > +     __skb_queue_purge(&tnlq);
> >
> >       if (mtyp =3D=3D FAILOVER_MSG) {
> >               struct sk_buff_head *fdefq =3D &tnl->failover_deferdq;
>
> [Severity: Medium]
> The commit message says the fix is to "go on with the hand-over" when
> tunnelling stops early. Should the earlier exit, taken when the dummy
> packet can't be allocated, also jump to out?
>
> That path in tipc_link_tnl_prepare() still returns directly:
>
> net/tipc/link.c:tipc_link_tnl_prepare() {
>     ...
>         skb =3D tipc_msg_create(TIPC_LOW_IMPORTANCE, TIPC_DIRECT_MSG,
>                               BASIC_H_SIZE, 0, l->addr, tipc_own_addr(l->=
net),
>                               0, 0, TIPC_ERR_NO_PORT);
>         if (!skb) {
>                 pr_warn("%sunable to create tunnel packet\n", link_co_err=
);
>                 return;
>         }
>     ...
> }
>
> tipc_msg_create() allocates with tipc_buf_acquire(..., GFP_ATOMIC), so it
> can fail under memory pressure. If it fails for FAILOVER_MSG, this code
> never runs:
>
>     tnl->drop_point =3D l->rcv_nxt;
>     tnl->failover_reasm_skb =3D l->reasm_buf;
>     skb_queue_splice_init(&l->deferdq, fdefq);
>
> The caller goes into failover anyway:
>
> __tipc_node_link_down()
>     tipc_link_tnl_prepare(l, tnl, FAILOVER_MSG, xmitq);
>     tipc_link_reset(l);    <- frees l->reasm_buf, purges l->deferdq
>     tipc_link_fsm_evt(l, LINK_RESET_EVT);
>     tipc_link_fsm_evt(l, LINK_FAILOVER_BEGIN_EVT);
>     tipc_node_fsm_evt(n, NODE_FAILOVER_BEGIN_EVT);
>
> tnl->drop_point then keeps a stale value. That is 0 from link creation,
> 1 from tipc_link_failover_prepare(), or whatever an earlier failover left=
.
> tipc_link_failover_rcv() then does this:
>
>         if (unlikely(less(seqno, l->drop_point))) {
>                 kfree_skb(iskb);
>                 continue;
>         }
>         if (unlikely(seqno !=3D l->drop_point)) {
>                 __tipc_skb_queue_sorted(fdefq, seqno, iskb);
>                 continue;
>         }
>
> Could this drop the peer's tunnelled messages? Could it also leave them
> in failover_deferdq for good, since drop_point only moves forward on an
> exact match?
>
> tnlq is already initialised and empty at that point, and the out: block
> only touches tnlq, l and tnl. So changing that return to goto out looks
> safe.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261122233958.10462-1-astellman%40stellman-greene.com
