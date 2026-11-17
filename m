Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905169;
	b=GHVlal3cBneNXfUsu/Zkrs8nK7IGBAlDGSmN6truCaTgtLMImcAuUrL4trw7CldHqeit
	 VtlQw4EIMo68PlBqjpAMLniXCGkZ/2XkpwIKXpLhB8UOMUpSfzXEAZLTowAG6pY+aItwu
	 j7kJNZ3lEr3iI/QJSsR9A9ZXzDpcxGZ/PZenzbyox8YQp+etAxJtyF9EuzcGNRwYPX70K
	 nyNiU5iuIu1GA/siMCodt1vKDDDmQtvgS1a2Kd1uKDNHv6DaRi3+L1SH3Ep98xb5dDyzc
	 tBv1j1KJEFdICrd6oHHt64DHvkccsXj+mbcSVUroN9uiOrjIvjO1ouz7eyKwq7O6hBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905169;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xawi7Uuq6+vTz3RvKq975aO5+cbyf6BPdw9TlVQbPDI=;
	b=4nKGKCKH7MS3kqJjJBnDCEViaF7k4Ukv3wHJX5UjVLNfeguBoQEOsCbNhZ5TWAd0+VgU
	 s59fC8H5xNGLsQxXr7TihsZESnbGYyJixGL3Yz5X6DO6rEis5u86F73YAupJzQnac7PNF
	 mKh1/75kRhEIZCSPk8jYNe3ShZTt/4a5zcEJS6CRxRxX9XHQ5CaGAaDor0OQSAn6KUzca
	 Y1uBG5+1h1HZogJl/azwSfoGT34G1X0RdGjJcW2fxb9e0QYGrk7ZQtUpCrhnshI7Dwwsp
	 F3Txn4b8rqSUARLOSFFcw2hrRyQpt2fLpk/sJ/pcHxyT+3n1YKOdReEAtAcNIWcJwUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8p4H3PH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C26606A884
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8p4H3PH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333BE1F000C6
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905169;
	bh=xawi7Uuq6+vTz3RvKq975aO5+cbyf6BPdw9TlVQbPDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n8p4H3PHuVgGtFMbFSHbHLe1KJkTIZ3V5DwN2DDo/yZE4kOLRNhvYvoz/9qqJGoXF
	 Ti2rjiD+tTB0v2GSHhoSQlzA0ifg6swQ8sbZe2B9bbrkr8q4COg5XnU8QhU8awsGL7
	 Jrz6zrwST+zUkKEg7NXcegXEzjQLGK8cfNhlxUf1sg4eophmZ8mtgdKclAfHmL9TFQ
	 Zb4YahlbUZgCIfNe67coa40+Dr2Qrqn4M0dg9GH7v8xUWhFGrTmRaRemc4VQ1Mm3K/
	 Kujx/J6n70qSwGnLgL0MyjjftQn7JE6Pvn2MRciZ/dULnIniOynEBKE+WRlnKtO/x8
	 Cqx4NNYHnoI1w==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48e2d5a69c4so2641035fac.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:46:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErErFjqHzQBJEl3W05RRMz6bt1wV5GbLI+81Do2sNGb6CrM454kX4163xQCHS9IJRFu2GwD2oho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/80Qf2r6CJGfMx2RUF6Gkir1M/tC3Q8wTQ+lnh1tCe7/TkSe+r
	4hv8blRCilMQEc9MRsZPoTRJuFANbxPqlQ5XtdYyv0+/l1ApQbYCCAyY7HvvLtBX3wRIWwXx11d
	EBdZ05O1Sa+CpS4Ui1La6nXw5NG9HFY0=
X-Received: by 2002:a05:6870:3341:b0:475:e2e9:4f4c with SMTP id
 586e51a60fabf-4afdf5e94admr11398602fac.26.1794905168531; Tue, 17 Nov 2026
 00:46:08 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-4-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-4-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:45:57 +0100
X-Gmail-Original-Message-ID: <CAL4WiipiADQzec6YVP6H0rQSzAXZCFdtZb2SemKTSAz0pzHs4Q@mail.gmail.com>
X-Gm-Features: AclHuK97_lixUCY7LKxL9xHTxxQIOhkcBpVdtCxkJXTvAIiWxzqrGVi0RZW36AA
Message-ID: <CAL4WiipiADQzec6YVP6H0rQSzAXZCFdtZb2SemKTSAz0pzHs4Q@mail.gmail.com>
Subject: Re: [PATCH v1 net 3/8] tcp: Don't bypass GTSM check for reqsk.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> Since cited commits moved up TCP_NEW_SYN_RECV handling in
> tcp_v4_err() and tcp_v6_err(), ICMP messages bypass IP_MINTTL
> and IPV6_MINHOPCOUNT checks.
>
> The minimal repro is:
>
>   --ip_version=3Dipv6
>    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
>   +0 setsockopt(3, SOL_IPV6, 73, [255], 4) =3D 0
>   +0 bind(3, ..., ...) =3D 0
>   +0 listen(3, 10) =3D 0
>   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
>   +0 > S. 0:0(0) ack 1 <mss 1440,nop,nop,sackOK>
>   +0 < (ttl 1) icmp unreachable port_unreachable [0:0(0)]
>   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
>   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
>   +0 accept(3, ..., ...) =3D 4
>   +0 %{assert tcpi_state =3D=3D TCP_ESTABLISHED}%
>
> Let's restore IP_MINTTL/IPV6_MINHOPCOUNT for reqsk.
>
> Fixes: 26e3736090e1 ("ipv4: tcp: handle ICMP messages on TCP_NEW_SYN_RECV=
 request sockets")
> Fixes: 2215089b2244 ("ipv6: tcp: handle ICMP messages on TCP_NEW_SYN_RECV=
 request sockets")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---

Note the same bypass exists in the receive path : in tcp_v4_rcv() and
tcp_v6_rcv(), the TCP_NEW_SYN_RECV branch calls tcp_check_req() /
tcp_child_process() and returns before reaching the min_ttl /
min_hopcount check done after the process: label.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
