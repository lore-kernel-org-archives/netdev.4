Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905662;
	b=O+McFpVFgIJpGLabH9+JlgwjwLimBBHGanG+DKUA5cJuYfWoDw7KzCzyszpdz4pHHokQ
	 UXNMHs99hWUBzFLHJQuGIbE0vUFGpwVheNYC51ZgSCK01kcsNKyit0/2kadH8gFu36W3l
	 wCr4lcebLd3tzgWtk5dRD8pc0NNcfjwjdt0yIX8R3UqWwCSMheqYzHcVDchZCxQNPmDdR
	 W7L7mpY993G6/dIG3jUWRaOnYXi1/ogWXNF2Ps/ijvPIc33E3N1FbY1nKawIHhnQc5lyv
	 OJQstW2Sd98m2YAh6hqzdPXGdsM5VB1N5zlzn75034YukjMV0Vrhal6LQSIPT+FZ5Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905662;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qDCM8YQVZ4z08HfPVX5XegVIT+m8U5Rl7Geg9hTRak8=;
	b=sxpMBqJpWkFz7121UCJeNKqgbwCAIvLGX572HNojwHXOq46PepWlKVkxvEL0oudDFOXw
	 RDq5zXcYkQig8A24y6qZThiMH2FgNGRfVfqQLtZtGwcw8kUrndJ+Gs0NxBdoBUvlGHLFf
	 GD7eGKnTL7WTyhuCECo+f+uxlr7EOTIKka4HmT7eC4xSOYdlFo+FqWpaQ7tY1NuFsF2y6
	 JGIJv/SWn+DXww7qqWXuwI252nAvECOqxWGXTdv/G+fNLkG7sVnK/zaNYwvZD4y78HlAc
	 pCnWd0iqlkUAmQu9+iZZb6GxkTSrWEayJTWrOUuG1DUD7SF4LnI6gZ5lf+OqdysY1bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j27IUXuZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED1606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j27IUXuZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B97051F000CB
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905661;
	bh=qDCM8YQVZ4z08HfPVX5XegVIT+m8U5Rl7Geg9hTRak8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j27IUXuZIQGmoiQCw27806cb3DL1HXSX+nHTQZItfq9DE5e2tmu72ByKxtNxCyFYB
	 oG/J1tamdgxGp/UYwqDOE3Znwqkfqjjqc5p2tjPRFV1qq67ZkCwFK38rLtyCjYpRl5
	 LgmvwjK2OrnB539/9fol9L3//p+eT2M/a5e8Dt7FNr8jDHpSvJHhKMthhIXsA8rj5v
	 B1fFwL/26y4ifPxBXcWNF024pampo8NaejfO8VsUmw0th6IaAaSjRqapomdPOqyT1e
	 z6bYIf7GtzhjwDRGeBEuue1Yr2jKj/dXX3RKWEVH1e/4gd9of+epM48PGXBy60Ycct
	 HKMNUjid7I0wQ==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso3568863eaf.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:54:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFA1+sethvFrPHXEnW5hdjFlvYT8Px7we8Q8bg9vOqDxrlZubHanSJgXHrP0p+sBxE/Vb4JEhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B1sfV+j3gETMDmeiDWOud01pixI0ePT8KKlajf2fz0PsuQFlQ
	0ZfOZFTrnBpzAiZXoo2RQ2z7Hz7r8sazrANyECvoBmxoqi1J5lIg4+OeDqdKRpLxh5vONrFZXMy
	eCaY/2CUqDZPZTSiSUXL4xnOtp+nBPWE=
X-Received: by 2002:a05:6820:1caa:b0:716:df91:60fe with SMTP id
 006d021491bc7-71ab515e3f4mr9537421eaf.59.1794905661004; Tue, 17 Nov 2026
 00:54:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-6-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-6-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:54:08 +0100
X-Gmail-Original-Message-ID: <CAL4WiioFo3LUpeQcZMVLVkW0H=fEoYmx8=EgDWGJtMecZrNydQ@mail.gmail.com>
X-Gm-Features: AclHuK-vw8wBGD7e6b-klomRRj0LDpGZdputnmt8G9heF9VGPYljrVLVlLQFBPs
Message-ID: <CAL4WiioFo3LUpeQcZMVLVkW0H=fEoYmx8=EgDWGJtMecZrNydQ@mail.gmail.com>
Subject: Re: [PATCH v1 net 5/8] tcp: Check ip_sk_accept_pmtu() in tcp_v4_err().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> Currently, tcp_v4_mtu_reduced() checks ip_sk_accept_pmtu()
> after calling inet_csk_update_pmtu(), which is too late.
>
> Even if we configure a socket not to perform Path MTU
> Discovery with IP_PMTUDISC_INTERFACE, ICMP_FRAG_NEEDED
> can overwrite MTU.
>
> The last getsockopt() returns 1200 MTU:
>
>   --ip_version=3Dipv4
>    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
>   +0 bind(3, ..., ...) =3D 0
>   +0 listen(3, 1) =3D 0
>   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,nop,nop,nop,wscale 8>
>   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 9>
>   +0 < . 1:1(0) ack 1 win 257
>   +0 accept(3, ..., ...) =3D 4
>   +0 setsockopt(4, SOL_IP, IP_MTU_DISCOVER, [4], 4) =3D 0
>   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) =3D 0
>   +0 write(4, ..., 1000) =3D 1000
>   +0 > P. 1:1001(1000) ack 1
>   +0 < icmp unreachable frag_needed mtu 1200 [1:1001(1000)]
>   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) =3D 0
>
> Let's check ip_sk_accept_pmtu() in tcp_v4_err() as done
> in tcp_v6_err().
>
> Note that inet_sk(sk)->pmtudisc is configured locklessly,
> so we do not recheck it in tcp_v4_mtu_reduced().  This is
> same with tcp_v6_mtu_reduced() too.
>
> Fixes: 482fc6094afa ("ipv4: introduce new IP_MTU_DISCOVER mode IP_PMTUDIS=
C_INTERFACE")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
