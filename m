Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893747;
	b=NFxUogY4el3OwVkDUafuBUN+nbDDVsAk0P34GJgV+duylwm0LYdAhs/OKPSVxz9Bbx4z
	 XxJvupGo1QWDIEqSw6pdgE0YGqlUx5AIBiQ6dCfouBpzNpLUH1FGxiZhMOrLNykf8/NBZ
	 yA5T0Ge4w0UgMFtjc0vOT3BQapmpBb0GM0OAR4gDe2qsaajCOXC9JyNAQnoGQork72VJD
	 Qoh6c7aFzgYE2PWaFzQnpay5i4l0cidcqc+MogO3JGTbLdKTuLKPnr79I+9FyxPySVuN7
	 nF5gZMsg8l0YLaSjwk39acOyT4HimJOzjjg3GrRvf8Fuf/wnEZsTHYahOl+xBYG3EjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yMSGXssLFnvdz1IHHicNeu+zjWAu8h8mAqhZ7ftDqt8=;
	b=u3wgCLSG1oX5H+g83houjLBCFp4lW/eNizvV3bLUAGKzCWo8BJGGicDBImc0pe/SpoZ1
	 mG2XSWVZodQtZxhoVdo0xWuoannhwMnVvkj0fhZ4RTDVCozMMVOHyDRPsBHUCE4J/pmVf
	 KYVzxNXWORoPP87EPoR6VfZRMoHOol+24V8La6c576rQBislw9js0PhAiXh7BlxtYocAA
	 sokZE61S9gN3bRqyIIw3eLwDMVpjG/p16IJ504I1telF0+b4l+EP6Y1AJm/feGJvYlRSN
	 WCuEXktNoPtcFNpkCT9qlCB6wzUTBCPz+fn2rk9D/+iE1XQOEICR7eAMSwfgasgRoaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SW1+jwCX;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A9606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SW1+jwCX
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3427302a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893746; x=1795498546; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMSGXssLFnvdz1IHHicNeu+zjWAu8h8mAqhZ7ftDqt8=;
        b=SW1+jwCXgM42wgBnYydjjrPNctQlsTiCRq1JMNQIFWwZMClCufI6jo328p1ZSo0056
         7oBCM6v3kitcV1T2T7iit3eNw+tB+Sp0xtRdwc5fUb6gR9grktvQVBwwCOjTaq3HXiux
         ulS7jlMylZcRjmjnhe71TBF8lgoaPUNgmNVPuLHnQbMZj3UcUKBAkBITpL+Q0hLSSwpv
         gT8sL+zEvkP5RJf1zhsj61rDPIhTobvtxYCbz2xYH/JlxrZ1vxFcvkas9LKnonoUlP5z
         xj7eMF9QZBJZJLthMhUMO/XFEzptHciVNpcud6/2st1S7j2co+98hVPi9M7xqic9OVoR
         JrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893746; x=1795498546;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMSGXssLFnvdz1IHHicNeu+zjWAu8h8mAqhZ7ftDqt8=;
        b=xl6X4P/4RmfcEP2OM/fb71p29Rj5TxWcs+OyqcaG+Y/ZZf+YtA5l/0KZ6UjqzqaMBi
         MnaqsQ0yD/GQKxBqoc9cGbmzdoNSVeoAh3fZQXhv7QGhshkCZ4FMfDGTsWl6WDBwCwn9
         eNh8uOzQv6783Mo0gqfjIXclL/+5D1ujGM8CLvFftdWJTaf66Ybzp/sRi/TlnkHw+sf8
         2qAkQh40DXoSV76zqx/nqrqeRrJ/Ip1qL+GoDVlTo+RP6HVxnlw3nPZQaM6XDthdLOJ2
         f5ytHUDF2sPr2dMsmMRdewRwEDNyHt7B7Vuga9dZKXRw6zh8Fh9vZVU2Gm1/RWAXkiYw
         SQqQ==
X-Forwarded-Encrypted: i=1; AL+hErEV5/P2K7Ei4BQa1NeNioYKZxsVY3YmaTxAWFuliz88PcEJ3avEKfe2q3uk/nujm4tkdYxGTd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nxde8ab98GoCyxjP0+xybIJ8CIyGr+IsZZ1rXaUv251mghRor
	zfqGDG5UoZCmAZuBJ2F7BhyeFvQf7M1GPwqfuKASEb63HAvDiAIpuX91ZFPY2sHdywpolhgydjp
	Wyv82Mg==
X-Received: from pjbmd4.prod.google.com ([2002:a17:90b:23c4:b0:3a7:9348:7f04])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5608:b0:3ac:adce:60a9
 with SMTP id 98e67ed59e1d1-3b1b07ef0camr12053244a91.9.1794893745512; Mon, 16
 Nov 2026 21:35:45 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:18 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117053543.84032-1-kuniyu@google.com>
Subject: [PATCH v1 net 0/8] tcp: Misc fixes for tcp_v[46]_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A packetdrill-equipped LLM found a bunch of bugs with repro.

This is the first series fixing bugs in tcp_v4_err() and
tcp_v6_err().

Patches 1-5, 7, and 8 are fixes, and Patch 6 is a selftest
for the bugs fixed by Patches 1-5.


Kuniyuki Iwashima (8):
  tcp: Don't accept ICMP for SND.NXT in TCP_SYN_SENT.
  tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().
  tcp: Don't bypass GTSM check for reqsk.
  tcp: Fix reqsk abort condition on ICMP errors.
  tcp: Check ip_sk_accept_pmtu() in tcp_v4_err().
  selftest: net: packetdrill: Add ICMP and ICMPv6 tests.
  tcp: Pass inet_sdif() to __inet_lookup_established() in tcp_v4_err().
  tcp: Pass inet6_iif() to __inet6_lookup_established() in tcp_v6_err().

 net/ipv4/tcp_ipv4.c                           |  42 ++++---
 net/ipv6/tcp_ipv6.c                           |  33 ++++--
 .../net/packetdrill/tcp_icmp_ipv4.pkt         |  98 ++++++++++++++++
 .../net/packetdrill/tcp_icmp_ipv6.pkt         | 111 ++++++++++++++++++
 4 files changed, 253 insertions(+), 31 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt

-- 
2.56.0.679.gc527c65306-goog

