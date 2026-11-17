Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794959104;
	b=uw0ze64VlV+cxgRoE+Exn0el7kSixY1iTGhprtTDKZ/eedyqgiNVDgftzzHmmh0B/uS3
	 8EPze3WTPEzWw3sXz2VqXiRR0f1lSyXxvniBPuKHq+BNL3T0YrMbZCHR5YZ0S/dMPG6XX
	 33i7hb5hDUVGGjHn9S3a1ngQM6chYHP4QCeoGL6K190qAJ7d5y0BaiwFImz27EQ2viRLU
	 E1TKdlKrxT2WBaseRdpY5T62h1EffVb4nB3KyoyGY3FMOQTjt9zo7i2cnfll00dxAoV1P
	 28tmYl24XebKAKXOpZ5KKdO6uducpRI9qyAB2UTctdkbja8Xy07ZMuk6NM6ken3se7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=DxlhdeI1qCLHeJmtB59YIWMolbMWXBQeNaroZy29Yxo=;
	b=JazUCQX05zQCHzGLu8DCf14cP6Pefc30YBuKTho7Z+941nUdHVsSD/+jqz9rVXZtEapK
	 lJZj2Wc1VSBk9oWxGZFCWX0Dk22NPIiUMH+sjEOH+QphYoVLA7JAk8XT1MgXgzBELjbMW
	 fp7apyo/bNlA+ca8QyYXQYTre2/HCuLeUDo17o371zMHiDBEQ2jmfPDeemICrQMi5KyJZ
	 dvgz2OnydW6Zli/pC4GPz0knKnmZv3GfpnVMreYErRi1Xdr917Bzz91RmOci1onj0/R3d
	 fo/c5VPYNawBw7ifpawS0PINH2F7NW7CXvUFM4AD5jXPjPJyG8WZ0QcMHbxMIct3YYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T04WkYaM;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E739606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E739606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T04WkYaM
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso383046a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794959103; x=1795563903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DxlhdeI1qCLHeJmtB59YIWMolbMWXBQeNaroZy29Yxo=;
        b=T04WkYaMuo1WcpzLNdaODIvxF1s5YItJ2Dgd17m71SamrhmNqndsqBork2W4ISBFon
         qzJHs/ac3Ms5MqXj2HD0TiQtE2VPpvX4AnKHGcHCzDPWngh4BM/2sVTD1jgRtm/vXc7b
         et7+ojIgSgdkxe5UoFbQKL4IAxMdJ0ymntnHmF0HDUmNTp62s6Ar3CznIoAlG6TGrKb8
         CPNZpaXuW1dqAnR9ysXs/XlDDx9uCIR+sFWWLLjWfQ/u68NFdIz9WV87510va2kvEXt1
         MsT+rEs3WgjQ0sXjJMSmbjlo3o27IOUZXxKZtLeQ0HTxqZVuQ7Th5zjbZgKhbhu4v6et
         Hvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959103; x=1795563903;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxlhdeI1qCLHeJmtB59YIWMolbMWXBQeNaroZy29Yxo=;
        b=kMHjSNcvyWe/iRlpIoZhh+EY3x2mAUF+12JJzAFPMO2IpeKAvcvOrEfehFn5AfJvWe
         +khlRXMgnTnLlbyBAMnf83p4NaTd6vJCK0UM9GGHsjSUote48ei9q9LoEl/8TupyhUi6
         aXarnv2YgTw5jzu1HJho/8VDAvtSqllsS4S/gotkFoch9eWnvsW/+jz+OTV8aSfmwveF
         HdjcBLfKB8Qwo2zPLXuWdMk0H6H+Q4zaib4NT7V6sHCx7RdAjHZPi8YOekG6dyTvW4if
         KlAiOOfLhoEnN0Y+ydUAi0uY+QDu+3uGcj7R9z0Yjx70cfjoK2R33kkr+ythnDsuU8gm
         OE3w==
X-Forwarded-Encrypted: i=1; AL+hErHWM/Eegv5xJ1mpEoSyEfXUEVMA8tK7xoJ3MLV3TkKiyAxilN6qCNcsYIXx5A0aXJ7orkGIY2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KBRVjvDODnpjJ4x/8SMCuFmwGmsMBCsBgJtNR1XRXFiX6Hcg8
	XxleQVpYtKiiN0aFOe0kRmmOb5QbUaf7UpTp+zb1RSMWVBCDJ0EuhJHjR0RLkqEXCHuR/5U9Kgn
	3NX3Reg==
X-Received: from plbkd3.prod.google.com ([2002:a17:903:13c3:b0:2ef:ddd8:6fa9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e541:b0:2ed:1f17:65ad
 with SMTP id d9443c01a7336-2eff754e56emr7445995ad.60.1794959102534; Tue, 17
 Nov 2026 15:45:02 -0800 (PST)
Date: Tue, 17 Nov 2026 23:45:02 +0000
In-Reply-To: <CAL4Wiiq3VFrjakaHqaBB74yTgZbb8MBvtzSMiTr778CY7MdggQ@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com> <20261117053543.84032-7-kuniyu@google.com>
 <CAL4Wiiq3VFrjakaHqaBB74yTgZbb8MBvtzSMiTr778CY7MdggQ@mail.gmail.com>
Message-ID: <avzm6dKfqvyPgTC_@google.com>
Subject: Re: [PATCH v1 net 6/8] selftest: net: packetdrill: Add ICMP and
 ICMPv6 tests.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 09:58:46 +0100, Eric Dumazet wrote:
> Le mar. 17 nov. 2026 =C3=A0 06:35, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > tcp_icmp_ipv4.pkt and tcp_icmp_ipv6.pkt cover the scenarios
> > fixed by the preceding patches.
> >
> > tcp_v6_err() already checks the outer hop limit and
> > ip6_sk_accept_pmtu(), so Test 2 and 5 in tcp_icmp_ipv6.pkt
> > pass without the series.
> >
> > ICMP and ICMPv6 behaviour are unlikely to change, so splitting
> > into multiple files per test case is not worth it.
> >
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
> >  .../net/packetdrill/tcp_icmp_ipv4.pkt         |  98 ++++++++++++++++
> >  .../net/packetdrill/tcp_icmp_ipv6.pkt         | 111 ++++++++++++++++++
> >  2 files changed, 209 insertions(+)
> >  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ip=
v4.pkt
> >  create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ip=
v6.pkt
> >
> > diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt =
b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
> > new file mode 100644
> > index 000000000000..122bf9a14862
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +--ip_version=3Dipv4
> > +
> > +`./defaults.sh`
> > +
> > +// Test 1: Client in TCP_SYN_SENT rejects ICMP quoting seq =3D=3D snd_=
nxt (RFC 5927 4.1)
> > +// In SYN_SENT, SND.UNA =3D ISN, SND.NXT =3D ISN + 1.
> > +// The sequence number in ICMP must satisfy SND.UNA <=3D SEG.SEQ < SND=
.NXT.
> > +// An ICMP message quoting seq =3D=3D 1 (snd_nxt) must be dropped, whi=
le seq =3D=3D 0 (snd_una) aborts.
> > +    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> > +   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) =3D 0
> > +   +0 connect(3, ..., ...) =3D -1 EINPROGRESS (Operation now in progre=
ss)
> > +   +0 > S 0:0(0) <...>
> > +   // Out-of-window ICMP quoting seq =3D=3D 1 (snd_nxt) must be droppe=
d
> > +   +0 < icmp unreachable host_unreachable [1:1(0)]
> > +   // Socket stays in TCP_SYN_SENT, so SYN retransmission occurs after=
 1s
> > +   +1 > S 0:0(0) <...>
> > +   // In-window ICMP quoting seq =3D=3D 0 (snd_una) is accepted and ab=
orts connection
> > +   +0 < icmp unreachable host_unreachable [0:0(0)]
> > +   +0 %{ assert tcpi_state =3D=3D TCP_CLOSE }%
> > +   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) =3D 0
> > +   +0 close(3) =3D 0
> > +
> > +// Test 2: Client with IP_MINTTL (21) checks outer IP TTL in tcp_v4_er=
r()
> > +// An ICMP with outer TTL < min_ttl (250) must be dropped, while outer=
 TTL >=3D min_ttl
> > +// must be accepted even though the quoted inner IP header has lower T=
TL (64).
> > +   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> > +   +0 setsockopt(3, SOL_IP, 21, [250], 4) =3D 0
>=20
> Ah.... could we instead update packedrill, adding IP_MINTTL ?
>=20
> Same for IPV6_MINHOPCOUNT

Will do.
