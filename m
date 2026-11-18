Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014422;
	b=IXWyXp5uoL0dkT5bAJbWHMT5/zAs7MMrEPQNSa2tlPws5eWPRzqm2pJXzZOXcKzbKl7b
	 FiVtIGTlqwBosDDJG79vx21gZTATBQYUmYAuF14bAfeTBc+MC/5horWj7JHLF6eK3XIkR
	 yY2zbSxcI9UfWJ05m9V1XOon5I9WCvpcIy7xUOAJ2qcPqAS/53T82G7KGV99hiExcjUys
	 fyq8mqW14WaUTEW7XyW28f1uZF8opOqwlsjfHEyUZGpaGQMRzmU/riJs6chemwu7WF3dn
	 bUiCmTy8PhQUdetmN3qGQ+tkBkeP+EogWfZaU9AUGxkd82PezJUGC+XOKvSqjDAFeXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014422;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FLLgoY4vzpl3VeoTzJ1Eki0KKKvfGT0/D/rtdudkmNU=;
	b=5cSUMrv2KERwDEcdHvwl0BShHipKqfuyPPkscjnuEC9YHYg5Gvifiylk89KaRoprFwK6
	 Q0IvxSH6V7Rmp3sItdGwIwD3Ai1QRGkCQv5o6A85vOG9b3s66OPH9i39sgnc52md69nOZ
	 3oH8CQHT9HhWzvVY8yOGXNRh0codb/xD5LZ1XADTW1ck0cTNZ/ccWe5kIZh7nuGnp9g64
	 dUzm4l9SGGi7KM+i4zuoW8mGMWrCL7LEi69RoE2qZKbubpNxOT2L2z5kaP5lIjPJjtlkC
	 woLjrbWCTASF72+BxhJyBfs0muIQbYxWdXDv5lcWyIDb3qogKeVCU3mlbIUXaI/SknQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiyeB1Fu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AD5606A335
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiyeB1Fu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0A61F000C9
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795014421;
	bh=FLLgoY4vzpl3VeoTzJ1Eki0KKKvfGT0/D/rtdudkmNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KiyeB1FuKANKheiwNKWWrLntCZ1zpria8hiMsmm6kDNS1SSSoDwX8H7ZHpxspvan8
	 7tcL9t3gHcQ2p/hrpQ+hcKKFPT2WUTZH/R6clrP2VI4RALEBLzPNRDXVfM/ioqTbe9
	 hEhRZRLOmSqhCO4neP4vqxMuiEvv0h9lWsFlp8fMJmgyK8+9M2DL6JAJ/p3AIM16r9
	 f1ypW/wBmu8svD0Uhd2ZXj9gaMSqZUuzTYsvFQ4T4139tVjq35t9lUocitpHogmrLp
	 7JyLLQ19e8Lvx7d2unhqZi7zrFIYYV6z5VvE8uU5deD3J624LQbFsP7teaeDnVZYen
	 bUuWX8uVFCu4w==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71aea92f666so685917eaf.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:07:01 -0800 (PST)
X-Gm-Message-State: APuU4Z8TZq0TtFensaLhkAnJPYxWrBUue5GM5FxKJd0H8RI8LoHaDHfr
	n/K734BLGUCpn8bZVofrx648/tHOcOBlcijrEKrYsjmyA9iGiC/NTuE6QXAcKkB9HKW8AnSck23
	m5/rWZ9TH/dv2F4N6LtjtFf6rEVyhfmw=
X-Received: by 2002:a05:6820:7095:10b0:6f8:fcce:a410 with SMTP id
 006d021491bc7-71b18552c41mr1594981eaf.55.1795014421167; Wed, 18 Nov 2026
 07:07:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118144249.358481-1-jiayuan.chen@linux.dev> <20261118144249.358481-2-jiayuan.chen@linux.dev>
In-Reply-To: <20261118144249.358481-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 16:06:50 +0100
X-Gmail-Original-Message-ID: <CAL4WiipSzUmvGxRM5PMBugXJ0qjAnobT6+pNuEJhUqTVrVR1Uw@mail.gmail.com>
X-Gm-Features: AclHuK915aJOXi82aBAcq1O_eeNA6-6Devxm-s0eHQNf5wtCOhOKeEZz0_kjdHc
Message-ID: <CAL4WiipSzUmvGxRM5PMBugXJ0qjAnobT6+pNuEJhUqTVrVR1Uw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Kyuwon Cho <kyuwoncho18@gmail.com>, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 15:43, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> icsk_backoff is used as a shift amount in inet_csk_rto_backoff():
>
>         u64 when =3D (u64)icsk->icsk_rto << icsk->icsk_backoff;
>
> It can go past 63 on the paths of both callers:
>
>  - RTO: tcp_retransmit_timer() increments it on every backed-off RTO
>    with no cap of its own, then an ICMP unreachable goes through
>    tcp_ld_RTO_revert().
>  - zero window probe: tcp_send_probe0() increments it up to
>    tcp_retries2, and tcp_probe_timer() calls the helper in its orphan
>    check. commit 6d4634d1b091 ("net: Limit logical shift left of TCP
>    probe0 timeout") clamped tcp_probe0_when() but not this one.
>
> Seen on the RTO path with tcp_retries2=3D255 and a silent peer:
>

Nit: tcp_retries2 does not need to be changed for the RTO path.
TCP_USER_TIMEOUT and TCP_RTO_MAX_MS on the socket are enough, since
retransmits_timed_out() then only looks at the elapsed time.

No need to respin only for this.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
