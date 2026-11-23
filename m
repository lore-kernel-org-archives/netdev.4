Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424481;
	b=UOogoUw85CykiWpdwvCnnjhbzDVvNqP11nyY6BEWzpS5KlO7Rne0Apdn+p6+GOAtcMAb
	 TxiVconk3N5ARgJllMYR2ymCNXW3bvDOyVEnRHW2DgSvbIsIGAkAR0l+nvOY/idpwPLYH
	 /xfV3DYQbMHPl1WK2kMm7QosuMtROI5ArtNqu1LT/AS+je2IWiepzyDbk/eQKdENaZtO9
	 tx42Ufp6OosXQHzuPPKKrz9ZUviBS8Z98dWeD3IHC0j+EkPnAQu6sej2TithjgW7ys4dC
	 BCAsViYKqe2vCpbhmafCsEbHdAbXl2cxTDZOXfQtvQyvc7S5tZaUm85Ityi6urdPY8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
	b=LPISRpfnwAvkvw7pAv05pfN3563XAhoL9uXx5Vrz8R4LT0iDAP1/5e9INe4rmd6JBf0g
	 Jgop+hQNBishL16edvRsJLBt9ZDb7InD6XeY/8lBZ0uSoXEnobjd2JXV9GfgZB7wbSyjn
	 o5d4Ig4NiBK3MikOws9B7/7f64qYvD3iRu9YWJNZP+8s7ydsVyMLNg1KCkbLr4d5ZTGzW
	 3B0wTVv+cWxzv0O03CItTm1DgQrUs6XXYbLqwGDPi0OyWT+l6jT4ZPnODDoGiJtjz0o9N
	 g8Il29OMHiZo/tAjLN5BW6kpMmuyLpkVahLECkMQYxSNgqCiRYl0kWHWyHna8jvd4tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDIypQYt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F20606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F20606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDIypQYt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb606491faso16417885e9.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795424478; cv=none;
        d=google.com; s=arc-20260327;
        b=gp9CtOJlRRZuirnCCtgeA52ztahl0z86vhojhnrJIJQ5UxP/tvOjIqSfiSh2l+/pnI
         Kr78ujcHYn4lGFK5R8NiM5X2BHgUKcL6VkhA6vuY7KXDpoXlRrqKX6Bn4KgQXaGC4PGi
         FrDw56UhALCQqMokyabCXgUR55DEeGxz+JnizSUbb/Hb1al1dSS9jHAKhf88LRMLG/NR
         XsMy8Xe3innvjazTs/aXdiSCRrtCE9Jqsu31cevKcBAUK3tYmOuly+UoXB6XS6SOWFID
         4kinA9lrQ4dA1w0Bx9Y9y5+4k5xk0fFByBAPBV8H570RnleifNlUQFUOtcPbtuHPoqCz
         jVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
        fh=o4vLDoKorC7FboZR9E4blYFPpIlqRoZMPOzXKeSSfJ0=;
        b=Gy4uET2gXB6SX9/mzMQjc8rPvCvYw+w59Q6hIiGPCtxdM8F2nzlbukEmN7+deBmhts
         H1PbvlBAGIvetcG8KLxHjsOwbI9jnKfYImr0JxKn4btQBy7vAp5hmyZB0YNNAXZ+HGBO
         zyonJfjsfQhQ7d9cjPSv6jB8+qonT6JW0rrAtaRMajADJKinoPNKcSNfNRVkcPOWi1j8
         F+StI7MK7MkH5HW+LLOcAD6mRfL4kkpBs+1HmsHxClRL/wzuxzfo3dl125nq/hUcqMID
         puPvn7Loi2XA7eTj26Vuy/ZFCAZcwVBOY/KT6Aj9mz6UdTlPXuuHrbzHbJfQn2cIkOx2
         /drg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424478; x=1796029278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
        b=lDIypQYtGMYSsqoisCS9ORWetWNwzyhWYxVQjJILGn0axWWQ3SroGPgW/kiaaKX9yG
         IDFdSR7frhwRDZe0FYTtuKwTlxCAHC/tcedkQTP5aOAzjXzH2GcJldQHAWllOsckAvYR
         zDkYGaVfrnIMRO3xlCAmV1PaDQBHVz8RWtdrhw2Gpcr2aJjaUyLx8Ob8gXCVW8Z2g5+x
         +Oav7XOBannXpEVHxIt3Yg03EFHtiE/K2Erb55vcNC3+Ck9FIBFIBpjwYjjb1uYq4Hp/
         JYfdu/A90MLfXAg8s5WFsy5AUpbuaGnENgRq7SXuJYE9ikITVnGenNGD/kGqAHGInVZ8
         FkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424478; x=1796029278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEL2+JCwPEIGLNb/94dwdFv8o2SffeGDTCEHWPlYg78=;
        b=tqtFzwIP52SrGcpjgLwhpFWyeX7MPBjXiD02RV5/RbaOm6LQAUtwiTyqlQ9nJYfd9s
         wE4ZGaSjOMgLYbS8S/cqzHWxWOjAXGZUhFEYhQPQY3161IZmOoKmndv/L2kP5dsNkIsI
         VmT6ZIl946vWwJvbyKn1YPFJs64lULElmTDKRR15KiD5mwoMyGo5AblZsc68HCXJCgGQ
         TD8FjOne736g9+3G6gp0Dql9m+fFppbYK+R+N1W1gHU1YYeGdqZv8IZRYHTbmVBPmZ23
         ZCmrrNI6/Q02rEQb6Gfec4Qb5f5Gyr35QZxWNtA3EaA/v9ryRScYijtEAzUKaznO4gQM
         yCHA==
X-Forwarded-Encrypted: i=1; AL+hErFpwo21X/8+jKLMR68IzTjHJY/KbD84PFl0BdMgD1m2oRZRojGKM7josgRfh6Yves6a3iSAV2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K8OOwLUkWMNv/kO2mWojtPJvJVHjxns5xez4KFMPhbJDFJuRX
	DM90yTDFz/GnauFzzeC0gSJsezeFO1VqMtrjrMVo44j15AUa+7hgP5tgja+Ng8ZTN2TU+r9Ck1t
	07y3bmuYBmMlWG6TGV50RhHymgdLF7+A=
X-Gm-Gg: AZFdTZde64kJUppYcN83ztcucR1/kJYmAYMLUkOe+SXXmjBIExihLZizfcEWMKE89to
	//5s7jRVVOaHdZZjaS6VfVlknM6a+P4DY0VQV1760DE8hSdrPXSdzOCpK5RZrbQ7BeSg7A63LBq
	BaIKWX8+5gssnwxrcrbdBNqrNuh5259yALv7AUxUcwK+UQaOjorWZcnN3yPF0v4aB9U/5g/O2s/
	co98GWtXBmurAmsEo6YmS4dvcXg/utireYdX+NJLqp609cti4LptzS5jrWQZMzAO81my9YKkHqe
	VU7bNA5clNXTQNdOB5xdNBi8AVyOgSOc5XRGzgSTbHxAo2vBtvoben1hWLvbEgRwjZ+nuE5uRqQ
	qNygEpj0wzi0O/xzNk+vBIGDzxXNWDaiVWIV42Pg8M75tr+c3gvsTALhhgYPIqEtbYYBZgLwIZK
	oa2Isn+5PQLID829xGfL7GS5VUInOzDWK7+UzxjvonOJcfLflaqPdY
X-Received: by 2002:a05:600c:8b11:b0:4bb:6871:8f21 with SMTP id
 5b1f17b1804b1-4bb88822346mr226556425e9.23.1795424477763; Mon, 23 Nov 2026
 01:01:17 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-reuseport-lock-filter-v1-1-a3e5324c8d55@gmail.com> <179542364209.3135.6346728453187808939@kernel.org>
In-Reply-To: <179542364209.3135.6346728453187808939@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 17:01:06 +0800
X-Gm-Features: Aa3M54p7sikU-xuQj6GlI0jXC-7c2SJPbhZVFn909Hn6R_I22BVip8-BRA2UoiM
Message-ID: <CA+X8Sdi2zLn8ZUOWXQww1DOFkOqkPWFwrF9t5LnHxn==3s+8ZQ@mail.gmail.com>
Subject: Re: [PATCH net] net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
To: netdev-bot+sashiko@kernel.org
Cc: pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, kuniyu@google.com, willemb@google.com, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, 
	linux-kernel@vger.kernel.org, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
>   path.

Thanks for the review. Right, the patch only covers the setsockopt
path, and that is on purpose. The disconnect and re-listen case is
different: the socket leaves its group, and when it was the only member
the group itself is freed, together with the program that belongs to
it. The program is not removed from a group that keeps running. Making
that path honour SO_LOCK_FILTER would mean keeping the group alive
across a disconnect, which is a larger change than this one.

If you prefer, I can send a v2 that says in the commit message that
only SO_DETACH_REUSEPORT_BPF is covered.

Thanks,
Suyuan

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=80 16:47=E5=86=99=E9=81=93=EF=BC=9A
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
> - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
>   path.
>
> --
>
> net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
>
> This commit makes reuseport_detach_prog() return -EPERM when
> SOCK_FILTER_LOCKED is set. Without it, an unprivileged process that is
> handed a locked socket can remove the reuseport program with
> SO_DETACH_REUSEPORT_BPF. This matches what sk_detach_filter() already
> does.
>
> > diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> > index b9e5648fa4c51..cdff61161a70a 100644
> > --- a/net/core/sock_reuseport.c
> > +++ b/net/core/sock_reuseport.c
> > @@ -727,6 +727,9 @@ int reuseport_detach_prog(struct sock *sk)
> >       struct sock_reuseport *reuse;
> >       struct bpf_prog *old_prog;
> >
> > +     if (sock_flag(sk, SOCK_FILTER_LOCKED))
> > +             return -EPERM;
> > +
>
> [Severity: Medium]
> This closes the setsockopt(SO_DETACH_REUSEPORT_BPF) path. Can the holder
> of a locked TCP SO_REUSEPORT listener still drop the program by
> disconnecting the listener and then calling listen() again?
>
> connect(fd, AF_UNSPEC) or shutdown(fd, SHUT_RD) on a listener goes
> through this chain, and none of these functions check SOCK_FILTER_LOCKED:
>
> tcp_disconnect()
>   tcp_set_state(sk, TCP_CLOSE)
>     sk->sk_prot->unhash(sk)
>       inet_unhash()
>         reuseport_stop_listen_sock()
>           reuseport_detach_sock()
>
> With net.ipv4.tcp_migrate_req at its default of 0, and a program that is
> not BPF_SK_REUSEPORT_SELECT_OR_MIGRATE, reuseport_stop_listen_sock()
> reaches the immediate detach:
>
> net/core/sock_reuseport.c:reuseport_stop_listen_sock() {
>     ...
>         /* Not capable to do migration, detach immediately */
>         reuseport_detach_sock(sk);
>     ...
> }
>
> reuseport_detach_sock() clears sk->sk_reuseport_cb. If this socket was
> the only member, it also frees the group:
>
>         if (reuse->num_socks + reuse->num_closed_socks =3D=3D 0)
>                 call_rcu(&reuse->rcu, reuseport_free_rcu);
>
> reuseport_free_rcu() then releases the locked program:
>
>         sk_reuseport_prog_free(rcu_dereference_protected(reuse->prog, 1))=
;
>
> tcp_set_state() keeps the port bound when SOCK_BINDPORT_LOCK is set, so
> listen() can be called again on the same port:
>
>                 sk->sk_prot->unhash(sk);
>                 if (inet_csk(sk)->icsk_bind_hash &&
>                     !(sk->sk_userlocks & SOCK_BINDPORT_LOCK))
>                         inet_put_port(sk);
>
> On the second listen(), inet_reuseport_add_sock() finds no sibling and
> calls reuseport_alloc(). Because sk_reuseport_cb is now NULL, this
> creates a new group with prog =3D=3D NULL. The socket keeps listening on
> the same port, but the program is gone.
>
> Documentation/networking/filter.rst says that once SO_LOCK_FILTER is
> set, "a filter cannot be removed or changed" and that the filter "will
> be kept until the socket is closed".
>
> This only happens when the locked socket is the only member of its
> group. If it has siblings, re-listen puts it back into the existing
> group through reuseport_add_sock(). With migration enabled, the socket
> moves to the closed section and keeps the program.
>
> In a one-socket group, the program matters mostly when an SK_REUSEPORT
> eBPF program uses SK_DROP to decide which connections are admitted. The
> group-wide load-balancing change described in the commit message cannot
> happen through this path.
>
> Should the disconnect and re-listen path also respect
> SOCK_FILTER_LOCKED, or should the commit message say that only the
> setsockopt detach path is covered?
>
> >       old_prog =3D NULL;
> >       spin_lock_bh(&reuseport_lock);
> >       reuse =3D rcu_dereference_protected(sk->sk_reuseport_cb,
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261122-reuseport-lock-filter-v1-1-a3e5324c8d55%40gmail.com
