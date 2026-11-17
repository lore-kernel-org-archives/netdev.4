Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906117;
	b=pFGvzwuUE3ypRxTooj4SeJuEZLeVYa6aDukPX9DV8L8x3lus3D5KWpDfEcJYVXd6LI3u
	 N88IhmxkdchhtvGT6Ua1n48Nh8iepaQgdzw5gIrGliItAbjdKSY3VBgbZZDz5ZRjpoaQq
	 0RH3NdL0FbkShezzbAyo9NKfDbwN/tLSfl53Sk+RFG1YbM8z97iZV34rKLfg16Wwsqtos
	 Q2VPgShLTs2mV/SW0zVvf5EJNEmQvH74GeKCyW2oWnwaPJdIcGpbRUrM8t0k7e+oIaXkk
	 oapFsuL3jsvBQX6c8L/2KTlafT5xjvpjVn85oCeGM+K1v3QGu8eNvtVpScFBPW0QsQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906117;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BpUqBOHF6TGszsQFATJaoLltzcdcC/QzJ7Q8LQGe8Lg=;
	b=vRcq/5UZWJULb+sVnqSGfq5o7hkM2+yPaNAUqbExM65pgIKi1SUPYyJEAhkOKJZUXkmS
	 pm0V13ZeADh66FirKa54NsmDg8Gvv1FqPuXb7BO8huotqftiUzxPV+S2Ftl8WTmRP0nCo
	 IhaLrhWtPG5451YfypLJBBaIO2R43HpH4FA3j8Dz0jFecT436qapkqvBC0yqh7UBQagkO
	 NT9wCf4vV7iHcNwzCqlWLwZzYkxJR7AKAY3TGtVh9Tfb7GvABqmjb8mCqzR8Xrx7DbrEJ
	 TgwcJvpvqqtaHl/1+9KyU6XUru4nF8iPzGj8jo7YtacyWXJCCspzixr3ZCpRibUikoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLXwgYFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877A606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DLXwgYFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF1B1F000C5
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906117;
	bh=BpUqBOHF6TGszsQFATJaoLltzcdcC/QzJ7Q8LQGe8Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DLXwgYFcR9TXe1BtDpeLwiX4mnw4zKfpkJVPnC5041DbQBazHWCBNE+PhyrptJCgI
	 6b2wuZSvrJlkvHEYBJSG6S4WjrbRpK7G0pdXPY2oaOUdHz4eJSoIstw72mGrAa98sv
	 u564tYa5zhFIZ/Q8FmVMIOtWp/IkIO5sFJ4xxu+gcfNL4MHK43C3tcBFerohbK8j2L
	 S/4LpJxNAQjr+IN9EiMZVWEr5oIl6jEqV9qfxVsRj+k8wie0zWY1PSzV9u2Dyg05Be
	 La+T4lX0vxA6MCP3sTK/JJSYiB4QDn5lJCtK7UfiR03wR4mRIk0WzJE8X/6lzdmRBc
	 9zL7s5tWno9ww==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6ceebaso4543248eaf.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:01:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGiZidve5ntR7V4qAwDC09w6cBeDwPQ5t6+N7toWAQ3zcmTQNVnI/lzXYT4/3Ud76HunNHh2pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T4yZJ7ijMkGjUf0UQaCptkHBr0GgGANBx4+DxH5xG++ZPQtLU
	3sGI5d3Y0ZSNApwDgeBfCFdOEvQGhTUO5Xy5/31IZ8CTI+FubCEWfFlzZjgRRq4c2mJKmOMOnmc
	Z47kU6ZR19zSKJsG9XVSq3kpwmttkQdo=
X-Received: by 2002:a05:6820:151a:b0:71a:fc24:cdad with SMTP id
 006d021491bc7-71afc24d442mr2828590eaf.17.1794906116331; Tue, 17 Nov 2026
 01:01:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-8-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-8-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 10:01:45 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqjiQfxcKTr82UXee_zhzoX-5im=OrEFwtMMSaLLHmVBg@mail.gmail.com>
X-Gm-Features: AclHuK93PLlQrLNunIkWha2EN7H9XuICM3_ilAak0FEfyXgKjY6TtIVx30dMyPY
Message-ID: <CAL4WiiqjiQfxcKTr82UXee_zhzoX-5im=OrEFwtMMSaLLHmVBg@mail.gmail.com>
Subject: Re: [PATCH v1 net 7/8] tcp: Pass inet_sdif() to __inet_lookup_established()
 in tcp_v4_err().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	David Ahern <dsahern@kernel.org>, David Ahern <dsahern@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_v4_err() passes 0 sdif to __inet_lookup_established().
>
> So, ICMP error coming from VRF can be leaked to a socket not
> bound to the device.
>
> For example, this test fails at the last assert because the
> socket receives ICMP error:
>
>   --ip_version=3Dipv4
>    0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
>   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress)
>   +0 > S 0:0(0) <...>
>   +0 `ip link add vrf0 type vrf table 10`
>   +0 `ip link set vrf0 up`
>   +0 `ip link set dev tun0 master vrf0`
>   +0 `ip route add 192.0.2.0/24 dev tun0 table 10`
>   +0 < icmp unreachable port_unreachable [0:0(0)]
>   +0 %{ assert tcpi_state =3D=3D TCP_SYN_SENT, tcpi_state }%
>
> Let's pass inet_sdif() to __inet_lookup_established().
>
> Fixes: 3fa6f616a7a4 ("net: ipv4: add second dif to inet socket lookups")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
