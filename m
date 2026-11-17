Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905939;
	b=z1aIOb5LN9mRXGvG0kpkzgE0vSZUbmj9l0NPHYqPpKxIxdWdTfgDck6TP729/fKHuISY
	 9Y60sj9hMHZOoBHnwCWESgTlMD/dDrv93XLVIXqNchKgmnCd7P6QWNWmaVKGepIgtYPKr
	 RhtvDy19igaxzhpqWozQB5SeumJ7lzvTw8KaovsRrIUJuOK37eV5ZP7F6mFNeG6VwmjKB
	 vyovz2eON1uc32oSDwDHdh9cTYPpnOAS30I8FPASVqYbvfuXZByC30rEkN5fO1ms1ZF2Y
	 OmJvmthR17P4HdF59NzdNTM/hPbLqkc18BIGLniCDoiNMWOs3pfgYfpDbm7xpdqDPiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905939;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j20jUeo2D8tXCYG3h9U3B9iHcEOwmU6u4Am/bMgyyxY=;
	b=LU3W1Z7WyEUhSn+JM2orh0Bp/0mCHchGYdQ9iOpAL68ND3xxBijP6un5kIbN57AIZQcL
	 oL2z6wT06mTm0LDmuOMLtn16sTHXpdfLh2Voh0RREX8e1jtVAljFlgGlIZFrwwYTUwOx3
	 QXaFTI6NcXRKJJeGnD9CK3rlucnfrRdF1ebADqfTaBG6r2Up2hcuSGOBHrG/qJ/QA6Nwr
	 SDL2AHlXlEGTu918uiAq/1L/bEhaPeePaKSNcjEr1ptVhvmcXmK5BLt6VhYmEB9HJrW6B
	 PeTH2ZTYjgFPFkf0vcT5jqFEduS58E96X7K3Co7I61biSX1VKQv63Q1skGR6B4ZlBoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiOjIsgf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58D606A8BB
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiOjIsgf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFC11F00923
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794905939;
	bh=j20jUeo2D8tXCYG3h9U3B9iHcEOwmU6u4Am/bMgyyxY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KiOjIsgfkFbVZvZt7uEGEPSP0XCkj8WDD/sF7RivL/AitiIFtQlIv2pmQnbj7aQVM
	 pJKNlryBMC0Y0LHoXddu3dEuY5aKTSqnIefnN4vHYfKHM+U0vS77uPVJhtgC2ZDePI
	 hdL45Q6OP+gTA+BjS+0t2knu8QNvPTRxVnxV/9H+WDuONZeOhrG9a+5OTEznG42ZzZ
	 vEAUMwuFqWd9l2mFUrz2bmsHU2TAytQW67uRbIXf/HTTKgu2QjPjxIHWb9p57hEvi6
	 A8YMB0rJZqoRyFS6xqDI11af+m+B5OHrJvIa70QVM0sm/4UVhpdegmJNXeF8xu0SBW
	 iro0DQj9RJSDQ==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-475920b9ca2so1383311fac.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:58:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErELmGRdeTzYXzdbKhc+fq+5RpWauuX28EguMj3hPjp/J/Bdf4k/jK57dE2yJH9fSJXmjvdes5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zRmRURqWvpposIKXwJ8vWqv/704zPf5pIyE03IeZBw0J65K3u
	pax56OBSk85wvs3gXrx8m/T0DJrVbmkoYC2bxatA19HNxvUv1sjIEwFlNEHUS/XfrHakuGNGTgc
	B82IlrDFKqSYCT6YQaywAeQ4hzYdsxdM=
X-Received: by 2002:a05:6870:e997:b0:49e:d4c:e6f0 with SMTP id
 586e51a60fabf-4afdf792c6bmr9942751fac.46.1794905938329; Tue, 17 Nov 2026
 00:58:58 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-7-kuniyu@google.com>
In-Reply-To: <20261117053543.84032-7-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:58:46 +0100
X-Gmail-Original-Message-ID: <CAL4Wiiq3VFrjakaHqaBB74yTgZbb8MBvtzSMiTr778CY7MdggQ@mail.gmail.com>
X-Gm-Features: AclHuK8QBxdQgTxju2kl0Z3J7UIkc8Vsg-o4oWW9_KVf2CH80SFEaEcG5XebJqM
Message-ID: <CAL4Wiiq3VFrjakaHqaBB74yTgZbb8MBvtzSMiTr778CY7MdggQ@mail.gmail.com>
Subject: Re: [PATCH v1 net 6/8] selftest: net: packetdrill: Add ICMP and
 ICMPv6 tests.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> tcp_icmp_ipv4.pkt and tcp_icmp_ipv6.pkt cover the scenarios
> fixed by the preceding patches.
>
> tcp_v6_err() already checks the outer hop limit and
> ip6_sk_accept_pmtu(), so Test 2 and 5 in tcp_icmp_ipv6.pkt
> pass without the series.
>
> ICMP and ICMPv6 behaviour are unlikely to change, so splitting
> into multiple files per test case is not worth it.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
>  .../net/packetdrill/tcp_icmp_ipv4.pkt         |  98 ++++++++++++++++
>  .../net/packetdrill/tcp_icmp_ipv6.pkt         | 111 ++++++++++++++++++
>  2 files changed, 209 insertions(+)
>  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4=
.pkt
>  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6=
.pkt
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt b/=
tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
> new file mode 100644
> index 000000000000..122bf9a14862
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +--ip_version=3Dipv4
> +
> +`./defaults.sh`
> +
> +// Test 1: Client in TCP_SYN_SENT rejects ICMP quoting seq =3D=3D snd_nx=
t (RFC 5927 4.1)
> +// In SYN_SENT, SND.UNA =3D ISN, SND.NXT =3D ISN + 1.
> +// The sequence number in ICMP must satisfy SND.UNA <=3D SEG.SEQ < SND.N=
XT.
> +// An ICMP message quoting seq =3D=3D 1 (snd_nxt) must be dropped, while=
 seq =3D=3D 0 (snd_una) aborts.
> +    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> +   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress=
)
> +   +0 > S 0:0(0) <...>
> +   // Out-of-window ICMP quoting seq =3D=3D 1 (snd_nxt) must be dropped
> +   +0 < icmp unreachable host_unreachable [1:1(0)]
> +   // Socket stays in TCP_SYN_SENT, so SYN retransmission occurs after 1=
s
> +   +1 > S 0:0(0) <...>
> +   // In-window ICMP quoting seq =3D=3D 0 (snd_una) is accepted and abor=
ts connection
> +   +0 < icmp unreachable host_unreachable [0:0(0)]
> +   +0 %{ assert tcpi_state =3D=3D TCP_CLOSE }%
> +   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) =3D 0
> +   +0 close(3) =3D 0
> +
> +// Test 2: Client with IP_MINTTL (21) checks outer IP TTL in tcp_v4_err(=
)
> +// An ICMP with outer TTL < min_ttl (250) must be dropped, while outer T=
TL >=3D min_ttl
> +// must be accepted even though the quoted inner IP header has lower TTL=
 (64).
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_IP, 21, [250], 4) =3D 0

Ah.... could we instead update packedrill, adding IP_MINTTL ?

Same for IPV6_MINHOPCOUNT

> +   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> +   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress=
)
> +   +0 > S 0:0(0) <...>
> +   // Outer TTL 10 < min_ttl (250): dropped, socket stays in TCP_SYN_SEN=
T
> +   +0 < (ttl 10) icmp unreachable host_unreachable [0:0(0)]
> +   +1 > S 0:0(0) <...>
> +   // Outer TTL 255 >=3D min_ttl (250): accepted, socket aborts
> +   +0 < (ttl 255) icmp unreachable host_unreachable [0:0(0)]
> +   +0 %{ assert tcpi_state =3D=3D TCP_CLOSE }%
> +   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) =3D 0
> +   +0 close(3) =3D 0
> +
> +// Test 3: Listener with IP_MINTTL (21) checks TTL before reqsk handling
> +// An incoming fatal ICMP with outer TTL < min_ttl (255) must not abort =
TCP_NEW_SYN_RECV,
> +// while outer TTL >=3D min_ttl (255) must abort it.
> +   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 setsockopt(3, SOL_IP, 21, [255], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 10) =3D 0
> +   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
> +   +0 > (ttl 64) S. 0:0(0) ack 1 <...>
> +   // Outer TTL 10 < min_ttl (255): dropped, reqsk survives
> +   +0 < (ttl 10) icmp unreachable port_unreachable [0:0(0)]
> +   +1 > (ttl 64) S. 0:0(0) ack 1 <...>
> +   // Outer TTL 255 >=3D min_ttl (255): accepted, fatal ICMP aborts reqs=
k
> +   +0 < (ttl 255) icmp unreachable port_unreachable [0:0(0)]
> +   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
> +   +0 > R 1:1(0)
> +   +0 close(3) =3D 0
> +
> +// Test 4: Server in TCP_NEW_SYN_RECV does not abort on soft errors but =
aborts on fatal error
> +   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 10) =3D 0
> +   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
> +   +0 > S. 0:0(0) ack 1 <...>
> +   // 4a: Soft errors must not abort reqsk
> +   +0 < icmp unreachable host_unreachable [0:0(0)]
> +   +0 < icmp unreachable net_unreachable [0:0(0)]
> +   +0 < icmp time_exceeded [0:0(0)]
> +   +0 < icmp parameter_problem [0:0(0)]
> +   +1 > S. 0:0(0) ack 1 <...>
> +   // 4b: Fatal error (port_unreachable) must abort reqsk
> +   +0 < icmp unreachable port_unreachable [0:0(0)]
> +   // Remote sends 3rd ACK: listener responds with RST because reqsk was=
 aborted
> +   +0 < . 1:1(0) ack 1 win 65535
> +   +0 > R 1:1(0)
> +   +0 close(3) =3D 0
> +
> +// Test 5: Socket with IP_PMTUDISC_INTERFACE ignores ICMP_FRAG_NEEDED
> +// Socket configured with IP_PMTUDISC_INTERFACE (4) must not overwrite M=
TU
> +// upon receiving ICMP_DEST_UNREACH with code ICMP_FRAG_NEEDED.
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 1) =3D 0
> +   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,nop,nop,nop,wscale 8>
> +   +0 > S. 0:0(0) ack 1 <...>
> +   +0 < . 1:1(0) ack 1 win 257
> +   +0 accept(3, ..., ...) =3D 4
> +   +0 setsockopt(4, SOL_IP, IP_MTU_DISCOVER, [4], 4) =3D 0
> +   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) =3D 0
> +   +0 write(4, ..., 1000) =3D 1000
> +   +0 > P. 1:1001(1000) ack 1 <...>
> +   +0 < icmp unreachable frag_needed mtu 1200 [1:1001(1000)]
> +   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) =3D 0
> +   +0 close(4) =3D 0
> +   +0 close(3) =3D 0
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt b/=
tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt
> new file mode 100644
> index 000000000000..bd0cc365a088
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +--ip_version=3Dipv6
> +
> +`./defaults.sh`
> +
> +// Test 1: Client in TCP_SYN_SENT rejects ICMPv6 quoting seq =3D=3D snd_=
nxt (RFC 5927 4.1)
> +// In SYN_SENT, SND.UNA =3D ISN, SND.NXT =3D ISN + 1.
> +// The sequence number in ICMP must satisfy SND.UNA <=3D SEG.SEQ < SND.N=
XT.
> +// An ICMP message quoting seq =3D=3D 1 (snd_nxt) must be dropped, while=
 seq =3D=3D 0 (snd_una) aborts.
> +    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> +   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress=
)
> +   +0 > S 0:0(0) <...>
> +   // Out-of-window ICMPv6 quoting seq =3D=3D 1 (snd_nxt) must be droppe=
d
> +   +0 < icmp unreachable address_unreachable [1:1(0)]
> +   // Socket stays in TCP_SYN_SENT, so SYN retransmission occurs after 1=
s
> +   +1 > S 0:0(0) <...>
> +   // In-window ICMPv6 quoting seq =3D=3D 0 (snd_una) is accepted and ab=
orts connection
> +   +0 < icmp unreachable address_unreachable [0:0(0)]
> +   +0 %{ assert tcpi_state =3D=3D TCP_CLOSE }%
> +   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) =3D 0
> +   +0 close(3) =3D 0
> +
> +// Test 2: Client with IPV6_MINHOPCOUNT (73) checks outer IPv6 hop_limit=
 in tcp_v6_err()
> +// An ICMPv6 with outer hop_limit < min_hopcount (250) must be dropped, =
while outer
> +// hop_limit >=3D min_hopcount must be accepted even though the quoted i=
nner hop_limit is 64.
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_IPV6, 73, [250], 4) =3D 0
> +   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> +   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progress=
)
> +   +0 > S 0:0(0) <...>
> +   // Outer hop_limit 10 < min_hopcount (250): dropped, socket stays in =
TCP_SYN_SENT
> +   +0 < (ttl 10) icmp unreachable address_unreachable [0:0(0)]
> +   +1 > S 0:0(0) <...>
> +   // Outer hop_limit 255 >=3D min_hopcount (250): accepted, socket abor=
ts
> +   +0 < (ttl 255) icmp unreachable address_unreachable [0:0(0)]
> +   +0 %{ assert tcpi_state =3D=3D TCP_CLOSE }%
> +   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) =3D 0
> +   +0 close(3) =3D 0
> +
> +// Test 3: Listener with IPV6_MINHOPCOUNT (73) checks hop_limit before r=
eqsk handling
> +// An incoming fatal ICMPv6 with outer hop_limit < min_hopcount (255) mu=
st not abort
> +// TCP_NEW_SYN_RECV, while outer hop_limit >=3D min_hopcount (255) must =
abort it.
> +   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 setsockopt(3, SOL_IPV6, 73, [255], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 10) =3D 0
> +   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
> +   +0 > (ttl 64) S. 0:0(0) ack 1 <...>
> +   // Outer hop_limit 10 < min_hopcount (255): dropped, reqsk survives
> +   +0 < (ttl 10) icmp unreachable port_unreachable [0:0(0)]
> +   +1 > (ttl 64) S. 0:0(0) ack 1 <...>
> +   // Outer hop_limit 255 >=3D min_hopcount (255): accepted, fatal ICMPv=
6 aborts reqsk
> +   +0 < (ttl 255) icmp unreachable port_unreachable [0:0(0)]
> +   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
> +   +0 > R 1:1(0)
> +   +0 close(3) =3D 0
> +
> +// Test 4: Server in TCP_NEW_SYN_RECV does not abort on soft error or
> +// non-UNK_NEXTHDR ICMPV6_PARAMPROB, but aborts on fatal error or
> +// ICMPV6_UNK_NEXTHDR.
> +   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 10) =3D 0
> +   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
> +   +0 > S. 0:0(0) ack 1 <...>
> +   // 4a: Soft error (address_unreachable) must not abort reqsk
> +   +0 < icmp unreachable address_unreachable [0:0(0)]
> +   +1 > S. 0:0(0) ack 1 <...>
> +   // 4b: Non-UNK_NEXTHDR parameter problem (header_field) must not abor=
t reqsk
> +   +0 < icmp parameter_problem header_field [0:0(0)]
> +   +2 > S. 0:0(0) ack 1 <...>
> +   // 4c: ICMPV6_UNK_NEXTHDR parameter problem (unknown_next_header) mus=
t abort reqsk
> +   +0 < icmp parameter_problem unknown_next_header [0:0(0)]
> +   // Remote sends 3rd ACK: listener responds with RST because reqsk was=
 aborted
> +   +0 < . 1:1(0) ack 1 win 65535
> +   +0 > R 1:1(0)
> +   +0 close(3) =3D 0
> +   // 4d: Fatal unreachable error (port_unreachable) must abort reqsk
> +   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 10) =3D 0
> +   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
> +   +0 > S. 0:0(0) ack 1 <...>
> +   +0 < icmp unreachable port_unreachable [0:0(0)]
> +   +0 < . 1:1(0) ack 1 win 65535
> +   +0 > R 1:1(0)
> +   +0 close(3) =3D 0
> +
> +// Test 5: Socket with IPV6_PMTUDISC_INTERFACE ignores ICMPV6_PKT_TOOBIG
> +// Socket configured with IPV6_PMTUDISC_INTERFACE (4) must not overwrite=
 MTU
> +// upon receiving ICMPV6_PKT_TOOBIG.
> +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +   +0 bind(3, ..., ...) =3D 0
> +   +0 listen(3, 1) =3D 0
> +   +0 < S 0:0(0) win 65535 <mss 1440,sackOK,nop,nop,nop,wscale 8>
> +   +0 > S. 0:0(0) ack 1 <...>
> +   +0 < . 1:1(0) ack 1 win 257
> +   +0 accept(3, ..., ...) =3D 4
> +   +0 setsockopt(4, SOL_IPV6, IPV6_MTU_DISCOVER, [4], 4) =3D 0
> +   +0 getsockopt(4, SOL_IPV6, IPV6_MTU, [1520], [4]) =3D 0
> +   +0 write(4, ..., 1000) =3D 1000
> +   +0 > P. 1:1001(1000) ack 1 <...>
> +   +0 < icmp packet_too_big mtu 1280 [1:1001(1000)]
> +   +0 getsockopt(4, SOL_IPV6, IPV6_MTU, [1520], [4]) =3D 0
> +   +0 close(4) =3D 0
> +   +0 close(3) =3D 0
> --
> 2.56.0.679.gc527c65306-goog
>
