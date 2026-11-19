Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075153;
	b=rNUB9RQzMUEPZu6PZ2hZV6WQvVco7E7+NyPbCu7iFte5xvFC/QlM0OcHLqFwDpYACwo/
	 LOVbA4oWGPQMEGComlBmews3cnREV2I64tMnGDO01GhkEw9Tc3/l+esfSBsrsdmd+NUSx
	 Gl098kyGZiUFfGnp3Hqcyc8s4axds756lo2ED0XmQgzcPRFMvw/4LeYwlZSrvcWgmVkEi
	 c18g2aN0CGh0Hqif615G+tGLSq6szdrSumflPNqC4HaA2NwPJ/ehdPAb3t2jZarKzWqMu
	 AjAnAb1fw8N33+k+FOTwR2IsFpDvp+iQHEcgXWtAhy5jC+QHC3lfSnr5wd+BBcndDZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075153;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=JkzZ+/LzqSu9eJ8rN1zudTbo5cBOm4V3ktgf/z3HvLg=;
	b=jblOZs5gRpo1qqzz6ckcKt2F+y9iBefpS211d5M7mdfOKWdQJrRbNmNpLYogTdAaIV8g
	 FDN0JS+LllpSKxTrW7Zn6Gb7FdS+OgCJIdJY2qHXhNkhKOYwS6uDIF6Ys+h8LtV6j39wv
	 fuJrVBXLl2eZ9HJWZpn7OPi5oy0lXTfkvgGq9WOLq7+dr+A5X81qnwzfL/DXDqFORCpwJ
	 T1GPPfS16r11HDgFWsKurEMiNTyTx+1w/KmCS1YBQ/udNa2B7C3Y9ruuf2di9OGRIgW15
	 vbpWX1FQi8ui7ZRDyQWkxH8lAcJFlx67nyCQwkXj3ssaAyEuhgk+KBiIKh85VBnfjMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cT1d9bAO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C202606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cT1d9bAO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C915F1F000D3
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795075152;
	bh=JkzZ+/LzqSu9eJ8rN1zudTbo5cBOm4V3ktgf/z3HvLg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cT1d9bAOKHMxpj+whA++2fdRttofOMvSLcKHSEOdyt/Fgip0BdEiPrxLporpSGVw4
	 0AdIjQum156h4D3EPbGFu+GTMNX7BE0wjF2P4XJ0J1Wx7MZY9iGOwroeTTXB5jl4uC
	 Df+G39DGeSU7CH2a9nwL3o1x1uEvD/yc5pcCHnxn35tPb2LuwH9GNJ4IVS7Ag7j8hs
	 7+XGxVYAF+JA+7YgHGzxInzEmdljCH2+XVgPoU54miYoeCphdtlUBPELRsJu3DdFQD
	 ZOZpFc46llKHhS7PI+9lncIKoiUJleIhZY/OuKFl6YJKLYZSnf9FVFzSxxzFS/uOoF
	 2IO4NYosvTDEg==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71ac798b8bbso1219877eaf.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:59:12 -0800 (PST)
X-Gm-Message-State: APuU4Z+Xp1k0yS8GFC08G/KIB9l68teOYWIrPLE0QYEfTxZniYBPcDXH
	OUmBEkrVzBY58uee8exl3YOzaSiTQD8Xc5cR4ayEh77nMjoCzA+OISUFeYH1FJ3liSFLx7IEwAh
	cY3eqw0noLDZoCItbpoHm3RTwkoXXDwI=
X-Received: by 2002:a05:6820:1517:b0:716:d827:9ecb with SMTP id
 006d021491bc7-71b1842dcd8mr3683424eaf.30.1795075152056; Wed, 18 Nov 2026
 23:59:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117052200.1507847-1-llleigoing@outlook.com> <20261117052200.1507847-4-llleigoing@outlook.com>
In-Reply-To: <20261117052200.1507847-4-llleigoing@outlook.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 08:59:01 +0100
X-Gmail-Original-Message-ID: <CAL4WiioFmJXhfGSY7rs7aR3FA_xC_f0sjuArBo7CBjV_tXTbTw@mail.gmail.com>
X-Gm-Features: AclHuK8OqGGNm4LBhCnEZgVIY5TwLI8xRaYoD8FYFVRWho5XxXLqAQY5a9U59Mw
Message-ID: <CAL4WiioFmJXhfGSY7rs7aR3FA_xC_f0sjuArBo7CBjV_tXTbTw@mail.gmail.com>
Subject: Re: [PATCH net 3/3] mptcp: exclude MSG_PEEK from receive buffer autotuning
To: lei lei <llleigoing@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>, 
	"ncardwell@google.com" <ncardwell@google.com>, "kuniyu@google.com" <kuniyu@google.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org" <horms@kernel.org>, 
	"matttbe@kernel.org" <matttbe@kernel.org>, "martineau@kernel.org" <martineau@kernel.org>, 
	"geliang@kernel.org" <geliang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:22, lei lei <llleigoing@outlook.com> a =C3=
=A9crit :
>
> __mptcp_recvmsg_mskq() passes bytes copied by MSG_PEEK to
> mptcp_rcv_space_adjust(), although those bytes remain in the receive
> queue. Repeated peeks count the same data as new application
> consumption and can inflate the receive-memory budget. Subtracting the
> unread queue at a measurement boundary cannot undo that repeated count.
>
> The receive path originally skipped this adjustment for MSG_PEEK.
> Commit 581302298524 ("mptcp: error out earlier on disconnect") moved
> the adjustment calls without preserving that check.
>
> Only adjust receive space for non-peeking reads. Keep the returned
> byte count unchanged.

This one looks good to me.

mptcp_rcv_space_adjust() accumulates @copied in msk->rcvq_space.copied,
and mptcp_inq_hint() is subtracted once per measurement, so N peeks
of the same bytes are indeed counted N times.

(TCP also calls tcp_rcv_space_adjust() for MSG_PEEK, but it uses
tp->copied_seq, which is not changed by a peek, so it has no such
issue.)

The Fixes: tag is correct, commit 581302298524 removed the
"if (!(flags & MSG_PEEK))" test.

>
> A loopback test leaves a fixed 32 KiB queue unread and peeks 4096 times.
> Before this change, sk_rcvbuf grows to the configured 8 MiB limit.
> Afterwards, both the budget and the queue remain unchanged, and a
> subsequent consuming read returns the original data intact.

It would be nice to have this test in
tools/testing/selftests/net/mptcp/ (or as a packetdrill test),
MPTCP maintainers can tell you what they prefer.

>
> Fixes: 581302298524 ("mptcp: error out earlier on disconnect")
> Signed-off-by: lllei <llleigoing@outlook.com>

Given my comments on patches 1 and 2, I suggest you send this
patch alone, it does not depend on them.

With the Signed-off-by: fixed:

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks.
