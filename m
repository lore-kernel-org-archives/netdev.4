Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966391;
	b=RD1syHM2JlxtHs3wrzQ+k4IztrKUpZKQMsfCUtEDu201jNAo74MRMJAjTMsKA9tDE820
	 Zc+XpbR5GWI8wW8QrVSAIU3jq0t5rM+EgOO4DlPJciuUVB3wxbFRdWI3xaDjQ9fi2TpXN
	 fnm4brRETjJTFnOm52mQMsdrkfecCLdx9k3wkyfoBS4a9tdwYJFTPNFqg5sWKL9X6rULC
	 8/Vn9ybPo8xvjA5arZkRAHqTpleonDXz7vBZ685H4oINQN/rpbvTBKTtyI2+DfUyAscVO
	 vwaU1m/xM/hpmbIzEKgWpELcnaZJeyEHOC/HO8XX7m2oUJrjer6rBXuvnGpEJvVTobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=LGCXafnQ8oDda3RKpoSeBhOyYxuk4lPSR3Xcp94dIsI=;
	b=RpmsZIx4PG3AlaKbK14yNJuKe1d8CXasPHDmOApGXse3wdvl1fqpbj5YYVFIYDmvQbeW
	 weGPm0RKxuIkmoR8cscp8gsG0duUtzqezwCJ1sumgjBH0FPEgGTU3BQA9WjEgtr70Cx6H
	 mXocSWZbMmf6ztAQa7qc/hpwYvaB7+OOsD4BqgKF6n5XzwQiNX3kfdpH/j5/xmIPcHxiQ
	 TFs5nW2iyGcjWdkLve2kCMTYCYzsCS9M3Wk60jEssolIL4WlEHPewW2cGDaGrjfWjXqLU
	 jhneXyx/HmQPMwt0yLl1GtEjN4M+pRWKGT3P2v+aeajOZMZyiz4yxjhWC8lbdch4AFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iVDhBSTu;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3BB606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iVDhBSTu
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso280119a91.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794966391; x=1795571191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LGCXafnQ8oDda3RKpoSeBhOyYxuk4lPSR3Xcp94dIsI=;
        b=iVDhBSTusT//Q7C+mWRYkmwS65jlVuTeTsPfRVY0HsvX31QksO5gyA2EVfK4q4eTHe
         O4/uCAxMFxncoBDRhtouAs3jHyz0I6s8+gp/mRkXRb40Y8rSZ/HUYYvu6H5J7Nav5fTR
         3M0w1QeV/yf8a1dmsnKnH6gw7sBp8VCJ04vd4UjWBrhqttQm6XIbyPP/w63BcWfSMlC+
         tzlaDRCYcLT8IpgSZqkO216dC2Czs48DQl37roa10WiXmSTlsTj8WT7bws9eZDdJzPxb
         pe7gONaz8U211mw5s8qShqg8XtJ0O17uW1niqPVlea8azF6dTKS8qyLpVcTLnW9dOMOf
         T8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966391; x=1795571191;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGCXafnQ8oDda3RKpoSeBhOyYxuk4lPSR3Xcp94dIsI=;
        b=uSvS52kMcRWLOpiuSN8hTYNY3GLwpyKZ9CZ6wYTeYHjiXE1gnxxp4BIwHaWCR5c+1X
         3qx8STG0EAbyaNLCJo4qR/qBkyGx5WPKINWy8P+h92L+iIoiTQPbYWV6YdPmupNQqWDT
         8ehtgeIEIqUdxAAXfgX4+mM2MPaWlYhRuIsKHXLy0RovACu+hwUzp2YQBt9eSIHqFmOx
         6jCRlSapa5uP9rowMcXh7Ls2G8S0QOVefrFiVzwWKBtaR4pLbNfqojccMrZjzb12ZTV8
         MVaw2SfceSL0u9pHtf4qV+FgWUeCBmnwnksB8HzX+XEfJ07caMF10urxbGOVQlr8N1W+
         1sLg==
X-Forwarded-Encrypted: i=1; AL+hErET2w2k8lVeluhe+04IcMuRTsCekfVBasgxsMFKz7CqR8007c1ZBBf3BHGif9lEZAu0zvZM6jU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vGGB11uVauDMKncztvFxnuEg4kRIjEp2wcg5lLGRPXVGsgZu0
	pWP1UappJX+7vLaweO3EmXY1O4uXoU56g8suehX/KgwVWCXjRRMTOZ7ZhaXJ5trMIYXa3PCOqyE
	HjTyUDg==
X-Received: from pgjk11-n2.prod.google.com ([2002:a05:6a02:81cb:20b0:cd6:1fc4:6199])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:528a:b0:3a8:495b:d64b
 with SMTP id 98e67ed59e1d1-3b3d0640f50mr1129057a91.4.1794966390309; Tue, 17
 Nov 2026 17:46:30 -0800 (PST)
Date: Wed, 18 Nov 2026 01:46:29 +0000
In-Reply-To: <179493597266.3136.6471867064840750751@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116021845.2533130-5-kuniyu@google.com> <179493597266.3136.6471867064840750751@kernel.org>
Message-ID: <av0C4kzZ-7hSOgTs@google.com>
Subject: Re: [PATCH v1 net-next 4/4] af_unix: Remove MSG_OOB.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 17:19:32 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>=20
> - [Medium] This patch removes a userspace-visible AF_UNIX feature with no
>   deprecation step and no evidence that nobody uses it.
>=20
> --
>=20
> af_unix: Remove MSG_OOB.
>=20
> This patch removes MSG_OOB support from AF_UNIX stream sockets. It also
> removes the CONFIG_AF_UNIX_OOB option, the oob_skb field in struct
> unix_sock and the SKB_DROP_REASON_UNIX_SKIP_OOB drop reason. After it,
> ioctl(SIOCATMARK), EPOLLPRI and SIGURG on AF_UNIX behave as if
> CONFIG_AF_UNIX_OOB=3Dn.
>=20
> > diff --git a/net/unix/Kconfig b/net/unix/Kconfig
> > index 6f1783c1659b8..d378726d5eb92 100644
> > --- a/net/unix/Kconfig
> > +++ b/net/unix/Kconfig
> > @@ -16,13 +16,6 @@ config UNIX
> > =20
> >  	  Say Y unless you know what you are doing.
> > =20
> > -config	AF_UNIX_OOB
> > -	bool "UNIX: out-of-bound messages"
> > -	depends on UNIX
> > -	default y
> > -	help
> > -	  Support for MSG_OOB in UNIX domain sockets. If unsure, say Y.
> > -
> >  config UNIX_DIAG
> >  	tristate "UNIX: socket monitoring interface"
> >  	depends on UNIX
> > diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> > index 96c13682938e1..cc5c7fa40b4d4 100644
> > --- a/net/unix/af_unix.c
> > +++ b/net/unix/af_unix.c
>=20
> [ ... ]
>=20
> > @@ -2403,12 +2334,7 @@ static int unix_stream_sendmsg(struct socket *so=
ck, struct msghdr *msg,
> > =20
> >  	if (msg->msg_flags & MSG_OOB) {
> >  		err =3D -EOPNOTSUPP;
> > -#if IS_ENABLED(CONFIG_AF_UNIX_OOB)
> > -		if (len)
> > -			len--;
> > -		else
> > -#endif
> > -			goto out_err;
> > +		goto out_err;
> >  	}
>=20
> [Severity: Medium]
> Could this break existing userspace on kernels built with the default
> config?

Only if there is a user, but I don't think so.  If there were
real users, they would have comlained about many uAPI changes.
It's only security researchers who actually "use" MSG_OOB.


>=20
> The removed AF_UNIX_OOB option was default y, and its help text said "If
> unsure, say Y". So most kernels since v5.15 have shipped MSG_OOB support
> for AF_UNIX SOCK_STREAM sockets. On those kernels:
>=20
>   send(MSG_OOB) queued a 1-byte OOB skb and raised SIGURG on the peer
>   through sk_send_sigurg() in queue_oob()
>=20
>   recv(MSG_OOB) read the byte back through unix_stream_recv_urg()
>=20
>   ioctl(SIOCATMARK) reported the mark
>=20
>   unix_poll() returned EPOLLPRI
>=20
> After this patch, an unprivileged process that calls send() or recv()
> with MSG_OOB on a connected AF_UNIX SOCK_STREAM socket always gets
> -EOPNOTSUPP. The send side fails in unix_stream_sendmsg() and the recv
> side fails in unix_stream_read_generic(). SIOCATMARK now falls through
> to -ENOIOCTLCMD in unix_ioctl(), and EPOLLPRI and SIGURG are never
> generated.
>=20
> The commit message says plainly that these features go away. Its only
> argument that nobody depends on them is "there is no clear use case". Is
> there evidence that no userspace relies on this behaviour?
>=20
> Would it be safer to first switch AF_UNIX_OOB to default n, or to warn on
> use, for a few releases before deleting the symbol? With the option
> removed outright, anyone who hits a regression has no way to turn the
> feature back on.
>=20
> Inside the tree, the series looks consistent. Earlier patches remove or
> rewrite the selftests that used MSG_OOB: af_unix msg_oob.c and
> scm_rights.c, the bpf sockmap_redir case, and the landlock
> scoped_signal_test. No references to AF_UNIX_OOB, UNIX_SKIP_OOB or
> oob_skb remain.
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261116021845.2533130-1-kuniyu%40google.com
