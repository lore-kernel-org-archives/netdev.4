Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022819;
	b=fOSnU5GPtyLtzJfZ8mWGcVgtDz/mXB45WsLK4VB0n7ZgiB+XGJjZDwMc2jr/ZXmsy26j
	 9WEgw6fSQMhATrYq+MWjwFsaeFp9svsVSBkadjExn4WRbD10gciFzEg+La0lbTINkpQBw
	 /oJwGNCTFzSTkVtayfAlGh6o8Fal6UvqlFi5z3EntTar/a159xrnjvokzpDsjzuonsMyf
	 /j8p/+2Hv4JQsb06aRQFqCVZs8gwdLLKp9xGM/kZPoMkD5VH3TehNiHrx2Tfaq/rncBNf
	 ws+ejqgiogw219lq25826l93XBSE17J1QgigMa90MFukBWrJZMeF7LS+iMXl2FlwK4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022819;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xxMfggoPYOZsvrqs/DnZJ0Ca0arTz4tv2zxwkY/pNtc=;
	b=Nc84TQ8XMYsrsIsqnE+sFqP4f3qDbWEsRDzV1KoToXPUVfMVGDIWpXFDqy325VpjxXr6
	 bBSBSH5LeQ84nxtPkFiHlkrvFudJzkTf4CtWalZCWWOmewu0aFq9gE0J/2/bN8QmtIBDn
	 syR2nPxPPjfLnG3/SfnqGSDCEgMkNq559OM6DUIlaJn5HfzCXSejP0QRbh3/7C7Ttmufl
	 QPPPWFLM4yZLtsElsogGQBcLaf90GvaFy5a6VjOxTUOQOqYxRYmsJ01E+b/eOWzfViTu7
	 6jCZSCG7vZEEajIiJn89k9KdIUtp7UN/RRGZ4Tt9imZXEMf+SuR5j8Q1ACbvdyCJFPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/5udYW0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69413606A75C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/5udYW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C781F000C7;
	Wed, 18 Nov 2026 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022819;
	bh=xxMfggoPYOZsvrqs/DnZJ0Ca0arTz4tv2zxwkY/pNtc=;
	h=From:To:Cc:Subject:Date;
	b=W/5udYW020ti05qYIdTK3aX2rSA9uJMtpmXbpRu+qyuZcWu0GT/Av7mGREsjmh453
	 Fj5ryoPt5rlyYFGTLEHTwCRoDi90IBJVtnGs2/MSq3Og8KHztKMaw/rmtb2cCcqMZn
	 kvr3ED8ERYjEB0C/PK0Q4o7u1Bf+xaDzAQyE5NTNq7sVPybIEymOD3ZEEFRCeyDzNJ
	 9mkO2Pz7PJe35/WONEAt/nrLUSFYlCUb1BZ/EntoVRLc48hdO/Uu4MbP3PuZyDwTrh
	 kdtj22e/LJdPjnaFoketccL+eaf6KAhx0k9QhuDeoTiBPOtGIxWUdfXD9iAv4ic1A9
	 uMHXXLO8frSUg==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Flavius-Romeo Mazilu <flavius.mazilu@stud.acs.upb.ro>,
	Michael Tuexen <tuexen@fh-muenster.de>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 0/2] tcp: do not accept ACK of our ISS on active opens
Date: Wed, 18 Nov 2026 18:26:52 +0100
Message-ID: <20261118172654.1267071-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Michael Tuexen asked on the tcpm list whether, after a completed
handshake, a segment with SEG.ACK == ISS is a duplicate ACK or a ghost
ACK [1]. Flavius-Romeo Mazilu noted that Linux gives a different answer
on each side of the connection [2]: passive opens send a challenge ACK,
active opens silently accept the segment.

The first patch makes active opens (including Fast Open and
simultaneous opens) behave like passive ones, without changing
the value of tcpi_bytes_acked seen by user space and BPF.

The second patch adds packetdrill tests for the four ways
a socket can be established.

This closes one extra acceptable ACK value on active opens,
so this is targeting net-next.

[1] https://mailarchive.ietf.org/arch/msg/tcpm/ZbjDTFQSHeKSVHAToyAnKBr3TpU/
[2] https://mailarchive.ietf.org/arch/msg/tcpm/ym6lb-UkrW2298LRnTLxCysoo0g/

Eric Dumazet (2):
  tcp: do not accept ACK of our ISS on active opens
  selftests/net: packetdrill: add tests for ACK of ISS

 .../networking/net_cachelines/tcp_sock.rst    |  1 +
 include/linux/tcp.h                           |  3 +-
 net/ipv4/tcp.c                                |  1 +
 net/ipv4/tcp_input.c                          | 10 +++-
 .../tcp_rfc5961_ack-iss-client.pkt            | 46 +++++++++++++++++++
 .../tcp_rfc5961_ack-iss-fastopen-client.pkt   | 40 ++++++++++++++++
 .../tcp_rfc5961_ack-iss-server.pkt            | 45 ++++++++++++++++++
 .../tcp_rfc5961_ack-iss-simultaneous-open.pkt | 42 +++++++++++++++++
 8 files changed, 185 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-client.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-fastopen-client.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-server.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-simultaneous-open.pkt


base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
-- 
2.53.0

