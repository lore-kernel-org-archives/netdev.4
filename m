Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905388;
	b=p6zUyseDVWT4a84X0hfIBWAdik+0xlq7F90mIIqSXpg76FjhAdCQbKBik37C1gZgWgQR
	 rFPN2t+z2x27RWc2I+sAo78XpodYkw7dRumO3/ONRrCv5pMRLN0PSsZffuzdtp6KXnYak
	 8eXhUnheDf6W/brrb3v3qFebEuDkK4OFG9GwBYsnhddiKLIToZE/ir/uN0tkS1upPcYKZ
	 zFyyEQqFGvigbtafcEWWeWLSdTGbZsJ490YiSApdj+PkpJpD9M8KiD+KnEcFJgvaV01hF
	 m4xZibeOouwfzZIZQWZFd8zPGQXzVu2qFENEF4FHiiGI2Nz+IgfNsuPzwXekm+3AoDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905388;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fyhBKlpPcQyT2myiX0EScmV8WklZyGW831jALJF8TyM=;
	b=vpv9jZibQnl2Re+7LuA/RT3jz4AOgU3fSY685g1YN52n4JrcbjDdVVql4SJe7B4IudMn
	 aC7rj0Y94PDXvJMOWebLiBdrykVoXfd7VUTi0L5A2P+Fp8QxM03ZYhSx9gVa+pvMjSvjm
	 1bWgUqUkc3ICj8xTB92z40Bwj/i0o/ync0dyQ4wyhZdU7fMrpcVcnmnp62P4NumIy/oVw
	 +ASEq7um6O+rXRgeWiorcxhe6mwyN9vKc8ufU4kZqLoudVCKdKASqiwhbQ/ips6DRxnqx
	 5VLl8/yLw/WYf+QuLA1ohuaYVveCADwlYaFwwI+I0lmlLpEibfDeEGbf2cqONGdoROg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D4fZO33/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946F606A884
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D4fZO33/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89411F000C8
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905387;
	bh=fyhBKlpPcQyT2myiX0EScmV8WklZyGW831jALJF8TyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D4fZO33/jlfiiS09+9aSgBnyctBrFN7jmdl2Tqp1CiIAKXofBGQYD34rDw6RoUX0k
	 JxsZMIOVWcJYnLfg3HQWKcKqAiyr0FtQBXe7eWgMkIMi860DUSDDYc9I2o7bkI67Ne
	 UrkR8SJN7zbidu6iKqIcpC1UtmvRdcb+AThG5Q/CKZGquKCBNB9Jk37C3KIVqHGZfH
	 kgerzsnuresXhl+7DkZxy4GgrrH2wapBfMStFZcVhocCq3Y0iy/LsFWwXUjCzkvlXH
	 4pKPAvyE1jAq65raTvC+MgaP24mk9b5V2W6ak8UNqP7741XIQCIclAGYb90WO8tQd1
	 Av6AEfO0x2FQg==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71af0656bedso1096986eaf.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:49:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvspG4r0lZa3mNmFOzQ6Rrf7Q6ouGeWLpaPvLKdha6iV8E6jxOsAfjyXhOZNQMrCtSw2chziw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZJ3s2kH867S4ancBrpaNEdHAk3X/o4HZQGZ1qshXpaWGU1R4X
	A8OAkLtWWfQc7x3tXfWC0EYJrwJ+Q3wE/+xzJ81oMzdjyEd/BR/rFhE+9cgP+h1M50Q7CIzmzaH
	E8dDDSbD+iA6tJOboQtI5HKY/WpA7smA=
X-Received: by 2002:a05:6820:f00d:b0:71a:f4ed:7013 with SMTP id
 006d021491bc7-71af4ed9b17mr3862417eaf.87.1794905385929; Tue, 17 Nov 2026
 00:49:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-5-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-5-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:49:35 +0100
X-Gmail-Original-Message-ID: <CAL4WiipmG_J4ASJ3LRhhvS7X+pFMdvq1CM_UnXRYH2M0ajZahQ@mail.gmail.com>
X-Gm-Features: AclHuK-MB_hicykrnPahJRX4E3k4bFWtUvkPGORfWT_7RkYK8C4v0tNFSGCQvfM
Message-ID: <CAL4WiipmG_J4ASJ3LRhhvS7X+pFMdvq1CM_UnXRYH2M0ajZahQ@mail.gmail.com>
Subject: Re: [PATCH v1 net 4/8] tcp: Fix reqsk abort condition on ICMP errors.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> RFC 1122 Section 4.2.3.9 states the following soft errors
> must not abort connections:
>

Linux has never followed this for non-synchronized states.

tcp_v4_err() and tcp_v6_err() call tcp_done_with_error() for any error
in TCP_SYN_SENT and TCP_SYN_RECV, soft or hard. RFC 5461 section 4.1
documents this, and names Linux.

Tests 1 and 2 in patch 6 actually depend on it : host_unreachable
aborts the TCP_SYN_SENT socket.


>   o    Destination Unreachable -- codes 0, 1, 5
>
>        Since these Unreachable messages indicate soft error
>        conditions, TCP MUST NOT abort the connection, and it
>        SHOULD make the information available to the
>        application.
>
>   o    Time Exceeded -- codes 0, 1
>   o    Parameter Problem
>
>        This should be handled the same way as Destination
>        Unreachable codes 0, 1, 5 (see above).
>
> Commit 9cf7490360bf ("tcp: do not drop syn_recv on all icmp
> reports") introduced the abort arg to tcp_req_err() to avoid
> aborting connection on ICMP_REDIRECT.
>
> However, tcp_v4_err() still abort on soft errors (ICMP_NET_UNREACH
> (0), ICMP_HOST_UNREACH (1)) and ignore hard errors.
>
> For example, we can see SYN+ACK retransmitted after receiving
> hard error:
>
>   --ip_version=3Dipv4
>    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
>   +0 bind(3, ..., ...) =3D 0
>   +0 listen(3, 10) =3D 0
>
>   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
>   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>
>   +0 < icmp unreachable port_unreachable [0:0(0)]
>   +1 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>
>
> Also, tcp_v6_err() uses icmpv6_err_convert(), which handles
> ICMPV6_PARAMPROB messages as hard error while RFC 5461 defines
> as soft error.
>
> But we should handle ICMPV6_UNK_NEXTHDR as hard error because
> it is used as IPv6 version ICMP_PROT_UNREACH.
>
> Let's correct the abort condition in tcp_v4_err() and
> tcp_v6_err().
>
> Note that icmpv6_err_convert() is used by other protocols.
>
> Fixes: 9cf7490360bf ("tcp: do not drop syn_recv on all icmp reports")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
>  net/ipv4/tcp_ipv4.c | 7 ++-----
>  net/ipv6/tcp_ipv6.c | 3 ++-
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index fd9588bba967..f11e090d04fb 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -529,11 +529,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
>
>         seq =3D ntohl(th->seq);
>         if (sk->sk_state =3D=3D TCP_NEW_SYN_RECV) {
> -               tcp_req_err(sk, seq, type =3D=3D ICMP_PARAMETERPROB ||
> -                                    type =3D=3D ICMP_TIME_EXCEEDED ||
> -                                    (type =3D=3D ICMP_DEST_UNREACH &&
> -                                     (code =3D=3D ICMP_NET_UNREACH ||
> -                                      code =3D=3D ICMP_HOST_UNREACH)));
> +               tcp_req_err(sk, seq, (type =3D=3D ICMP_DEST_UNREACH &&
> +                                     icmp_err_convert[code].fatal));


After this patch, a TCP_SYN_SENT socket and a Fast Open TCP_SYN_RECV
child abort on net/host unreachable, but a request socket does not.

We also lose the ability to get rid of a request for an unreachable
client, and keep retransmitting SYNACK instead.

If the problem is that hard errors are ignored for IPv4 request
sockets, I would rather add them than remove the soft ones :

        abort =3D type =3D=3D ICMP_PARAMETERPROB ||
                type =3D=3D ICMP_TIME_EXCEEDED ||
                (type =3D=3D ICMP_DEST_UNREACH && code !=3D ICMP_FRAG_NEEDE=
D);

This matches what we do for TCP_SYN_SENT. The IPv6 side would then
need the same treatment instead of using 'fatal'.

>                 return 0;
>         }
>
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index 0f1523fff939..29fd0a084c91 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -447,7 +447,8 @@ static int tcp_v6_err(struct sk_buff *skb, struct ine=
t6_skb_parm *opt,
>         seq =3D ntohl(th->seq);
>         fatal =3D icmpv6_err_convert(type, code, &err);
>         if (sk->sk_state =3D=3D TCP_NEW_SYN_RECV) {
> -               tcp_req_err(sk, seq, fatal);
> +               tcp_req_err(sk, seq, type =3D=3D ICMPV6_PARAMPROB ?
> +                           code =3D=3D ICMPV6_UNK_NEXTHDR : fatal);
>                 return 0;
>         }
>
> --
> 2.56.0.679.gc527c65306-goog
>
