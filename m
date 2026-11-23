Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424656;
	b=BZg43ZGE86cOy6F5v2XNgzM2Kq+KIu1KBWYWUpYtICH0HotQwB8cFV4TjSelQf7yfOPw
	 U11BzrxmGRk0UTw9LpRnSzXim/ZPrbI3M/7vJdkZH9iFl+PKWGtEqO2N2WqMYHd7yvAm8
	 KLlaskxGhtMCIANJksnumqcj0iJcrddfUNdpGRakqve5tqJG4agWtO4hVcnjcOrZ4Cx54
	 APieXaqqkvKjqkYRZM/dSCuYwWETnHhEt/ZQ0CfqiSaUE1wVFT0z/xYHMOGI/PyqUjKjj
	 fJB02gayClV8c/ucymFafUglAFgEq0nWe3YTogrMhr9NWMBRg4cmTQM4XHk7ngfyaXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
	b=OFZFSD8EfhABXBA4j9id5ea6mL4689+BSleFvhNw3Lx28uF/t43zv+ZXwElbkVo8CzKP
	 W81j8J13vcXRtWdH5k6WV+T4U0kehvw304YkOBs2lgpm5GvCaFTan3ojE39J7t52OTcqw
	 odFjossFFLzagY2IY3uBOQDXNZbhAzmH0AiTWfk5d1w0ErdH1Ia8xQG3vph/Mclj9fS1y
	 LpbpOYPnIvW9GDkrYrnt1rNYJZ/ZoySnXTZ9nU4oaD5pNRm0VsbE5O1wkNBP5gfWi0Zjj
	 s0xKj4cbX2z2o5W3o/ozeo9jkUB4WdIPfwtoKaFQiXHy+Ey+CVSZrXAipyjD8dN/2Ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xzh59vly;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81704606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81704606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xzh59vly
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so30148725e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795424654; cv=none;
        d=google.com; s=arc-20260327;
        b=Hi/cxviFIr9Ip0prt8ZMeLzPWGdBF3Hh6qxskWMctnh9Q0tDvf+qAvdH5lVFsoKIzI
         vQNiaLBY0E7GsBEsDSAVqqsCzaOMieytQmdtVRSMJjbOrhDvLbxFvp0fEvXSvqBuz8xe
         OYD8D2ieyAont7DG7nfy8hClqIU3GoDY+z8Sb628fb+NZCQhMJLzOxCLFND4ccYHlMJT
         +smMU1yP8XvmEfiDXllzu1u4dhYk9yrIM6fsjG06VwHOypabwUknxW10EMb0skcsrDeH
         RyX+VtOBq+PEMeJbuCe3KBIdk/C904wDljHOA6+oL+20iWVay2QT4PnNPNJsuy7TYhX3
         jliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
        fh=3bnKZ+Z+6jPdfUWRMIGPoDBRwMg0aDRRWJ8LbWr2anA=;
        b=XWlKv1WeYU9fXtzAnkZzBfUeVPNsflM9RjMiBTgTfKlM8GXAndib08FX7PpYIeUhd1
         SFl78rFiIp/LYaWp77ydIFxOq6lQgckprVSbT4yPzfDygewj3odQIvKOSHkItlb9wHME
         SQcA0Q+1gG6KERiaNfRq2fjrUhUZV3L9mvk5RAJ4Ci6+r/rxhAT1Xq4WTTJnrP6FZnIn
         9EIONyYyow6q/cT+MogT1y2gE13CVWABNtqQR4WaqOzT+10ToGAYkSvYnmHcSp39ODk1
         VQ5zQijyhWHDsR2TCIN4HXE+yDZy29z3r98jU6htGVNilQsRNxHHF9y6wESUIn1AwpU2
         Bl7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424654; x=1796029454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
        b=Xzh59vlyxu25A0YX5r65mvsWDOc7XnpsInyTaQSA322zS/gqRwLLodre9BTAwe61up
         9TLw4fgjPWEgu24JYmDKvdu0t2qSd01actNwTe587I9D2Ev+sOBJ5l0LdhzYaVlwNaJT
         /T07I+HG006abWBnJfK9TtfN3nhs+oEbysVTpFNh0ICl1H3KUyB108N9dJZp8e4H7AzY
         +tQ0MfhWJBPVkoCB36+0w4FVAXHd/RccLsn51AClZK8EW2IKiz9wLQ/D5kEdPX969m7u
         T5o/AHlvDK4/CB802NxBBKkFVC0JiIrcX7+XJgRrr68xWLqpxyKCoEqlX9d3OZ0S+4mW
         oQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424654; x=1796029454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iahu//YmpmZyg0DhyYrw87fZlA1aEgZxAw+wZWOdpsM=;
        b=XGN2dZLClqLXAeaADeriw4vPpyITu8j81Y3BTVewa9M9+pt90C7OI0q/aHb2J7FJwN
         OljISjMezmzzgFyatQThUIfcdQ6h1fSrNER9Qayzr3aoNAbo7BgMjUMAYH8/qBHrz9jA
         /CffD//KY/PzbANGR7emTabfj5JdKPoivjc3cABhV3VeRpI47Cd3wq+kHJlXfCg7zrLr
         OUtnjoWAltjq4AuVg/Nn6IA8tsWmBKxSWAip9nMAhm6glQ1z77QaD6MQ/kLcl/7ZeEaa
         uzBXkd0QN8vFzv087MdB4MGB/uT/cWHbFODIx3SJJGxQ1zLPEe4oK/PW4egOP+pcKZxp
         brDg==
X-Forwarded-Encrypted: i=1; AL+hErEeYM7d5YJ/uBeSPqIHA5JwmIx5izqu1cI6PwSJU0Lq5OsoLAIsw8+s9nTOt6BGuAoSgOPygws=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PczKe0Vyp2bsN4pDesTqgTSXKS7Zrn0ijwfEld9CAJnUDOQXO
	NqVaxNJ6MNq5pBHbDoSlQqAbcyXtGF9RWWyeZrlRjgRdgjbijoYZmUGpV979tn4Zj0N+2dyHWJJ
	amHvrIiDVmeCXewkB0buzc6QpOcdPwMk=
X-Gm-Gg: AZFdTZc+3aoUCUu3M5UrMJPNHqKivSLoEOo3Sf6MLWntgDLXezFs+gkaornCoMUbvsD
	5V5q6LW11KAlNN6rT+HfZb0Qmh+kDRDKVelWPlNV+3RadRh1beh0j4W8gCegZY7w+lpjlLy7rSW
	cTGdCltkpcjfRQogyG+ZSEuI/0ppsTHYYnu66sgr30Dej/rVoJCcinPzmbCl6fYtC60nsw4iJQ8
	VT4TtTwqesPz3eAGGvsUCPS5mmMyqNNc4R8ZsD7KzjOLpIPBplu9aeUaxm/fWzIRgeJi775h4xU
	5FqBHKpNHtIMXWEKeOlbRxVu8kxi+BLa7Zx+sIhBb8pgc7wd/UsDiCBZUjTcJLIrN4kA0nIHQwo
	+EQINspTr0NFlveAHKngv1HBSkHn6Libtviz+0XGc+SnsR2m3VJVyXaY1qUr48luX0G36r/L+X1
	38UPBQv7KpYRF4meI3yzyQKBX9YUtXSVZOL1BR1MfkYDhJ0w0pDMNv
X-Received: by 2002:a05:600c:2319:b0:4bb:752e:991c with SMTP id
 5b1f17b1804b1-4bb86160370mr174614835e9.15.1795424653574; Mon, 23 Nov 2026
 01:04:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-reuseport-lock-filter-v1-1-a3e5324c8d55@gmail.com>
 <179542364209.3135.6346728453187808939@kernel.org> <CA+X8Sdi2zLn8ZUOWXQww1DOFkOqkPWFwrF9t5LnHxn==3s+8ZQ@mail.gmail.com>
In-Reply-To: <CA+X8Sdi2zLn8ZUOWXQww1DOFkOqkPWFwrF9t5LnHxn==3s+8ZQ@mail.gmail.com>
From: Wong Steve <shyckless@gmail.com>
Date: Mon, 23 Nov 2026 17:04:02 +0800
X-Gm-Features: Aa3M54q0kY5NXfFKpwRMPNQElPAV1wS6zgYhFbHOo44WAbFtAZw8Id81pwRjkew
Message-ID: <CA+X8Sdhn8u=QFkuFOzTQf-rdCRLLd_uBsQ83pJNb4jWsKuFriA@mail.gmail.com>
Subject: Re: [PATCH net] net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
To: netdev-bot+sashiko@kernel.org
Cc: pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, kuniyu@google.com, willemb@google.com, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, martin.lau@linux.dev, 
	linux-kernel@vger.kernel.org, horms@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Severity: Critical]
> This problem wasn't introduced by this patch, but can reuseport_attach_pr=
og()
> right above hit a NULL pointer dereference on reuse->prog [1]?

I don't think this can happen. setsockopt() holds the socket lock for
the whole SO_ATTACH_REUSEPORT_* call, and a listener can only move to
the closed section through shutdown(), connect(AF_UNSPEC) or close() on
that same socket, which all take the socket lock first. So the socket
cannot be shut down and evicted by reuseport_grow() between the check
and the reuseport_lock. I also tried it with a delay added between the
two: shutdown() waits for the attach to finish.

Thanks,
Suyuan

Wong Steve <shyckless@gmail.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=80 17:01=E5=86=99=E9=81=93=EF=BC=9A
>
> > - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
> >   path.
>
> Thanks for the review. Right, the patch only covers the setsockopt
> path, and that is on purpose. The disconnect and re-listen case is
> different: the socket leaves its group, and when it was the only member
> the group itself is freed, together with the program that belongs to
> it. The program is not removed from a group that keeps running. Making
> that path honour SO_LOCK_FILTER would mean keeping the group alive
> across a disconnect, which is a larger change than this one.
>
> If you prefer, I can send a v2 that says in the commit message that
> only SO_DETACH_REUSEPORT_BPF is covered.
>
> Thanks,
> Suyuan
>
> <netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=B8=80 16:47=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The fix only covers the setsockopt(SO_DETACH_REUSEPORT_BPF)
> >   path.
> >
> > --
> >
> > net: reuseport: honour SO_LOCK_FILTER in SO_DETACH_REUSEPORT_BPF
> >
> > This commit makes reuseport_detach_prog() return -EPERM when
> > SOCK_FILTER_LOCKED is set. Without it, an unprivileged process that is
> > handed a locked socket can remove the reuseport program with
> > SO_DETACH_REUSEPORT_BPF. This matches what sk_detach_filter() already
> > does.
> >
> > > diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> > > index b9e5648fa4c51..cdff61161a70a 100644
> > > --- a/net/core/sock_reuseport.c
> > > +++ b/net/core/sock_reuseport.c
> > > @@ -727,6 +727,9 @@ int reuseport_detach_prog(struct sock *sk)
> > >       struct sock_reuseport *reuse;
> > >       struct bpf_prog *old_prog;
> > >
> > > +     if (sock_flag(sk, SOCK_FILTER_LOCKED))
> > > +             return -EPERM;
> > > +
> >
> > [Severity: Medium]
> > This closes the setsockopt(SO_DETACH_REUSEPORT_BPF) path. Can the holde=
r
> > of a locked TCP SO_REUSEPORT listener still drop the program by
> > disconnecting the listener and then calling listen() again?
> >
> > connect(fd, AF_UNSPEC) or shutdown(fd, SHUT_RD) on a listener goes
> > through this chain, and none of these functions check SOCK_FILTER_LOCKE=
D:
> >
> > tcp_disconnect()
> >   tcp_set_state(sk, TCP_CLOSE)
> >     sk->sk_prot->unhash(sk)
> >       inet_unhash()
> >         reuseport_stop_listen_sock()
> >           reuseport_detach_sock()
> >
> > With net.ipv4.tcp_migrate_req at its default of 0, and a program that i=
s
> > not BPF_SK_REUSEPORT_SELECT_OR_MIGRATE, reuseport_stop_listen_sock()
> > reaches the immediate detach:
> >
> > net/core/sock_reuseport.c:reuseport_stop_listen_sock() {
> >     ...
> >         /* Not capable to do migration, detach immediately */
> >         reuseport_detach_sock(sk);
> >     ...
> > }
> >
> > reuseport_detach_sock() clears sk->sk_reuseport_cb. If this socket was
> > the only member, it also frees the group:
> >
> >         if (reuse->num_socks + reuse->num_closed_socks =3D=3D 0)
> >                 call_rcu(&reuse->rcu, reuseport_free_rcu);
> >
> > reuseport_free_rcu() then releases the locked program:
> >
> >         sk_reuseport_prog_free(rcu_dereference_protected(reuse->prog, 1=
));
> >
> > tcp_set_state() keeps the port bound when SOCK_BINDPORT_LOCK is set, so
> > listen() can be called again on the same port:
> >
> >                 sk->sk_prot->unhash(sk);
> >                 if (inet_csk(sk)->icsk_bind_hash &&
> >                     !(sk->sk_userlocks & SOCK_BINDPORT_LOCK))
> >                         inet_put_port(sk);
> >
> > On the second listen(), inet_reuseport_add_sock() finds no sibling and
> > calls reuseport_alloc(). Because sk_reuseport_cb is now NULL, this
> > creates a new group with prog =3D=3D NULL. The socket keeps listening o=
n
> > the same port, but the program is gone.
> >
> > Documentation/networking/filter.rst says that once SO_LOCK_FILTER is
> > set, "a filter cannot be removed or changed" and that the filter "will
> > be kept until the socket is closed".
> >
> > This only happens when the locked socket is the only member of its
> > group. If it has siblings, re-listen puts it back into the existing
> > group through reuseport_add_sock(). With migration enabled, the socket
> > moves to the closed section and keeps the program.
> >
> > In a one-socket group, the program matters mostly when an SK_REUSEPORT
> > eBPF program uses SK_DROP to decide which connections are admitted. The
> > group-wide load-balancing change described in the commit message cannot
> > happen through this path.
> >
> > Should the disconnect and re-listen path also respect
> > SOCK_FILTER_LOCKED, or should the commit message say that only the
> > setsockopt detach path is covered?
> >
> > >       old_prog =3D NULL;
> > >       spin_lock_bh(&reuseport_lock);
> > >       reuse =3D rcu_dereference_protected(sk->sk_reuseport_cb,
> >
> > --
> > Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/pat=
chset/20261122-reuseport-lock-filter-v1-1-a3e5324c8d55%40gmail.com
