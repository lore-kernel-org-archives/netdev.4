Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906232;
	b=LtABbgg5WNVUx5iQSCi9fKwx07uAaZa/8lcIqa+rB51YGZbth46Dz4qSt0zqPpSZ5pjR
	 oetUWes8Gyl5bHowXbzfSp0TD0WMe9I1QXu6QtwllA1GbnTLryffm4XTu+79f+LYwRBk2
	 iCywtbBWoMFeDESC4LnlgMH+oCUDtvyOPZshkmRkqGZx0W+LMJhfFj0iXF8e7FIXAngSo
	 wyLa0DrJRtGBbZKicpOqO+F5eEigJS5P4cpaAMl069XvQZdnHNQVyq+1PQJxm2YPB5rbW
	 1j0IitXByDtXXQbY4BpXkKDnh6iDwxph1RYwYmUlvUXcharaF7PnQk6yJtaU0UMhrwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906232;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1vCDKG3/eVpcl8iwJXntDMyR/AUu8eFv37zY32xxLQw=;
	b=Gs0hgEQSZ2yTmXYrSbtFYWtfoUM6seudrpYO2lX4GqqXhlEfHX4W3Mw22vgonnri7oCb
	 8BVimTKu4kL0Rltf4rJV5FlSdYatfedHbyiG3hf0eFi6S+1MFl6GopfqsW7/XBBxf3fDA
	 gnWF8MCodnIyZTnHmct5/XFLfiS1ajQia7+uH38rIyrtweEDBWpbzj6dkawc2XKMwFCOi
	 H5r0c1xHwbmGeZC3sEcFsZNR5jsovi+IsbWoCyFIS51jkNEs7AVQH1sOy7acaD9spdP4a
	 8ziA1Pnemcp98wPh+t3GUBBt2kKbD7V7EkExJSldDtenYxr84Xlc/OnWVeONUHQwXZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W8C/oUHF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E71606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8C/oUHF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF931F000C8
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906232;
	bh=1vCDKG3/eVpcl8iwJXntDMyR/AUu8eFv37zY32xxLQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W8C/oUHFJd0NY22bHaVq505IsvTuQW2g0jq6qmE/8vqQpsekWoslijKopTrhkS84J
	 PB2Rck6qMtZYlhnYOWLeuofsBedGi35A8ekZUlL32JGJAW8hVnob3cvohyx3oWjpwn
	 M6UhLwIpWpgQoNFLf8Axyz9l3v71Gp2lDwl93tHKepRF7QsMEVmJH+73GD2ufLjbuE
	 zkBTDablnDR9z/GXr2wq4BQucCVBu8MOv5nr9VL6nDvxDh7iqCXlFqSN4IowBzUMGg
	 w/NavTdVi0aqUBjLa/BYk9nfSez1nI+lSIcA9k1z0FlTJT7sfOIuCt2TuwzzgAK0SF
	 heyyrDnci+YmQ==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df7f544919so3185908eaf.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:03:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFt1/8PVtNkR920Uf2r8EwNtQX5cavvsjGRpItc4hkSS2GxJClTDeLUZglq/XLSSDThpU/RelY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fkU55K+ONCB3iAci1jyGe6O0ABcmTDT2oK1sP2A9m5+N/uW8E
	hPUcuvZK/uVzedkcMdSN6XmRbalJbdyVV1kDlC2tCB/1hlnnVz47lFtGa84EdFYAdP74JfjEMkx
	5JGhB493MR8YGWO93mvAanqRjwF7z97E=
X-Received: by 2002:a05:6820:169f:b0:71a:d8a5:4d1b with SMTP id
 006d021491bc7-71ad8a551abmr5801118eaf.36.1794906231676; Tue, 17 Nov 2026
 01:03:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-9-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-9-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 10:03:39 +0100
X-Gmail-Original-Message-ID: <CAL4WiioNcgo6sS1ULk6TG0dWeM01Xt8yE7vMg-53YT52gXXOfA@mail.gmail.com>
X-Gm-Features: Aa3M54oMTqtGnr71fQcKsEqCExpfYVLAe8jPzWIfu2Ho68fK1pc0aSENO5LMZsg
Message-ID: <CAL4WiioNcgo6sS1ULk6TG0dWeM01Xt8yE7vMg-53YT52gXXOfA@mail.gmail.com>
Subject: Re: [PATCH v1 net 8/8] tcp: Pass inet6_iif() to __inet6_lookup_established()
 in tcp_v6_err().
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_v6_err() passes skb->dev->ifindex to __inet6_lookup_established().
>
> When ICMP is sent to a local address not on loopback device,
> ip6_rt_get_dev_rcu() sets dst->dev to lo and ip6_rt_copy_init()
> sets rt6i_idev to the actual device.
>
> In ip6_rcv_core(), skb->dev is still lo, but IP6CB(skb)->iif
> is set to ip6_dst_idev(skb_dst(skb))->dev->ifindex.
>
> So skb->dev->ifindex is 1 while inet6_iif(skb) points to the
> actual device.
>
> Since tcp_v6_err() passes the wrong ifindex, such an ICMP error
> is not delivered.
>
> For example, this script creates a socket bound to tun0 and
> generates ICMPv6 Port Unreachable to it, but the socket cannot
> receive it and getsockopt() fails:
>
>   --ip_version=3Dipv6
>    0 `ip link set lo up`
>   +0 `ip6tables -A OUTPUT -p tcp -j REJECT`
>   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
>   +0 setsockopt(3, SOL_SOCKET, SO_BINDTODEVICE, "tun0", 4) =3D 0
>   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress)
>   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) =3D 0
>
> Let's pass inet6_iif() to __inet6_lookup_established().
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

I wonder if you could send (maybe later in net-next) packetdrill tests
for 7 and 8 ?

Thanks.
