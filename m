Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019635;
	b=MLx7XqKR0svoPpUkxo2W6yIWrvL4plXyVaD9XO5wud6K+VxCXTcPAFWylHmxGynVNGN5
	 Uyvw+kus0q9nRpsF3KkteuUKbGIXoZnU5wWQV5ICu3PmDLrhkibiizSNj/NmBILVzbD4t
	 fcDLaUUBaJN1wKanRLrBUhsRwgXV38PhWZUYX12VdjmTiRbte54maYJn6sBYUwQbBdxac
	 qWiG5m/ZkMoaswPhhnMfGi/njmcjsB6yiwWnAvD9mR+qlXCJdTqMIZGMAQR1oa//o9yEl
	 G6Diwi2ZXXfOZHpmIYmcQ13TWyTD/mvPSAyHloFrFed61CSBG8L4HkL+vTGIORIJfhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019635;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YP+R8WLwJ5gMOWgNgp+UjujL64A5cni2cbp56pSez54=;
	b=FxZB/LFkFvRC1wBrEqqy9cJ1WEVZFmXKq+LISAEDb9zQ4EjYIDwpJcQMtuY1GuZ6Qo/W
	 Op1CRUSQ4Xj/i/RctqWBl/vpSoXinb/keuuFbkQxUm9FvadN0XC9pig2tezt5LfFQVwBa
	 n6MuAEeCzwUCeJGt1/6VM2bzGS5vMaPyC9nq+ui1NrL5jz32ZrBAkoeFy8ijVOhO+xxUk
	 WeZd6CaC18dXmElXNSThOkWPWRZKQoNZJz5DDVrP7L4ZbbXPTRdYzthFMeFnaY2cCy0XA
	 SsroMdwIQpcPvZIk7Bp+GZXWV2Qw/Ihu6T6oeTjm1VkAgCo0b6/JggGnphVAsuDZ6aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPXsUEHq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63242606A332
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPXsUEHq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347901F000C5
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019635;
	bh=YP+R8WLwJ5gMOWgNgp+UjujL64A5cni2cbp56pSez54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPXsUEHqNkvcxwsbngoNx8tdbGZNeIp9hfNvdlMxrUKHedVPFFf6HgfbPsA0g0JR2
	 vyEpyNV0MVQKuZ/Ds5jWOhCxVGnGyseaQpGD8Or980E1s6RdKIHYf+BdLvp1LBcSer
	 lZyt1q83cIjJHNXwFcdZ/hGh7Q0CFo/GC+pws+v0Tq+LNeh5F9UF3luKo7nT8HlQzt
	 BsuHVCBzTA5VxqBQwPwKSvWuykxFMdJsZJGg7YWVi0+MEFXbQ6TJ7M6Tus9A0ttcsL
	 1YQs38E5sAjamfeF2E0dQ2ZcDferJwH+lauV6BfaKKfj4AD1zxiEQ9vxy8mM7XvUX9
	 MEFL8p0ATmaIw==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6d68de53053so894122eaf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:33:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQdmWJYcU99a91IRN171va7J/DNVucbIOxGMGgO5YB/yRv0cJUlmLQFNEtvU8wZlnmL9z9bi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B2MJMwaJfI4DQ4iH37BclwR1WpXBlFcgVrDHLuO5bJaER+mKf
	KvPf/XPVPRPAwdTKk8k/sfL/YVyb8D9/0Kp/UBnuoiMhaHQC0kMz/Qscu5EevEv2UjCmkGGheTV
	kKblebO8yqk9BT0jfSMdz5KNWP64D8sM=
X-Received: by 2002:a05:6820:1501:b0:716:e855:5002 with SMTP id
 006d021491bc7-71b296a9e95mr232895eaf.55.1795019634458; Wed, 18 Nov 2026
 08:33:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118155144.18393-1-mason@kernel.org> <20261118155144.18393-6-mason@kernel.org>
In-Reply-To: <20261118155144.18393-6-mason@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 17:33:43 +0100
X-Gmail-Original-Message-ID: <CAL4WiirjhPBCMTPk2Eas4BMX8j7+9oO5wMJFBNspV2yr0KmtEw@mail.gmail.com>
X-Gm-Features: AclHuK9Y1OKOvK1mdydHTZNOY_6g2y2abTuZZFvh0eBNeeZSbsnDTMJK-l8bBqc
Message-ID: <CAL4WiirjhPBCMTPk2Eas4BMX8j7+9oO5wMJFBNspV2yr0KmtEw@mail.gmail.com>
Subject: Re: [PATCH net v2 5/5] tcp: bound the rto_min of a route in tcp_rto_min()
To: Chris Mason <mason@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 16:51, Chris Mason <mason@kernel.org> a =C3=A9c=
rit :
>
> For a route with a locked RTAX_RTO_MIN, tcp_rto_min() returns the metric
> as it is, and that can be any 32-bit number of milliseconds. All other
> ways to set the minimum RTO have a nonzero floor: the tcp_rto_min_us
> sysctl, TCP_RTO_MIN_US and TCP_BPF_RTO_MIN.
>
> Both ends of that range give us trouble.
>
> With an rto_min of 0, tcp_init_metrics() can start a connection with an
> RTO of 0, if the cached RTT is below one jiffy:
>
>     icsk_rto =3D crtt + max(2 * crtt, tcp_rto_min(sk)) =3D 0
>
> It sets icsk_rto itself, so the lower bound in __tcp_set_rto() does not
> help here.
>
> At the other end, tcp_rto_min_us() and the sum in __tcp_set_rto() are
> u32 values in usec, so an rto_min of more than about 71 minutes does not
> fit.
>
> Clamp a locked rto_min to the range from one jiffy to TCP_RTO_MAX in
> tcp_rto_min().
>
> ip_metrics_convert() could reject these values instead, as it does for a
> locked cwnd of 0. But a route with "rto_min lock 0" is accepted today
> and mostly works, so that would break existing setups.
>

I agree, please keep the clamp in tcp_rto_min().

A locked cwnd of 0 makes no sense, but "rto_min lock 0" can be read
as "as low as possible", and we can not start rejecting it now.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

> A route still shows the rto_min that it was given, while TCP uses one
> jiffy or 120 s.
>
> Found by LLM code inspection, and confirmed with LLM generated
> reproducers on an unmodified kernel. Fixed by LLM, and tested with
> the reproducers and existing kernel selftests.
>
> Fixes: 05bb1fad1cde ("[TCP]: Allow minimum RTO to be configurable via rou=
ting metrics.")
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---
>
> Notes:
>     v1->v2: new patch
>
>  include/net/tcp.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index a617a72ee2c6..27de546dc802 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -939,7 +939,8 @@ static inline u32 tcp_rto_min(const struct sock *sk)
>         u32 rto_min =3D READ_ONCE(inet_csk(sk)->icsk_rto_min);
>
>         if (dst && dst_metric_locked(dst, RTAX_RTO_MIN))
> -               rto_min =3D dst_metric_rtt(dst, RTAX_RTO_MIN);
> +               rto_min =3D clamp(dst_metric_rtt(dst, RTAX_RTO_MIN),
> +                               1, TCP_RTO_MAX);
>         return rto_min;
>  }
>
> --
> 2.55.0
>
