Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671516;
	b=gsgHqLj10oItL9ujY2tzG0EvvF6z1SlFkqPR6n8+Mb2DDCWfBge/Rf0pj1Ecxi7byoMi
	 QAnEkeZyhPSRv0zUQcfoCZXnu8Nrm0MA/sS04qNqNbxUR+MiZ4+gLFE3imdjdFXeJx5QD
	 EeWXwQ8OZNz1mw/qq4ihRtXaKT7O3kcE0qs84Bi6wpu7n2F1YKETz0lEFceDOWa4QDszL
	 gecFlP1IVRfExe6uPuKIRlsamIcitTxJBwcTDRXx6yVdi20R2XjtWeQiReQHk6e4Cb8FJ
	 AOtoOEha46dNm/xT2iwj0I0HziLekHuzZibnuFLuXVMXLoA3rSsn00f40YEgoO58W1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671516;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Esh3mCRQ6Hawt8OVn8zEQDrtOsUfPqr901OBn9+X8bc=;
	b=Osp63NOQ+ZlZ6OTY9NCNAE4zCnF5XUk6JKuZgNmuCFdPEhJxGfp6UMi/8FQlR8pK8wLM
	 qKg9VbQHSby+IWubwC9Ph7l734EGnob0ddtazoqZjlGxtShDEHDUUahgrdIKCqni+TlPM
	 HOL7eKmVCPdMXQ5l43tceQFYfkc75f196nGzLvEZ9Nw3iKIwjFVESp4+yasvCn0S9kQPt
	 gKWnUT2uX11ZlFLcuaYoyygo+VyxwOV5WG5E2pH2kF83FPouk6GevBckRKZN2LojvO/fp
	 L6sAkVi5XU1RGfvwHbHqOUadsttMZ/jQNoNKrtRjcXRf+ivPl8ClTeC7VlNg0n+teWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8GywdhQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C7606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8GywdhQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18FC81F000C4;
	Sat, 14 Nov 2026 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671515;
	bh=Esh3mCRQ6Hawt8OVn8zEQDrtOsUfPqr901OBn9+X8bc=;
	h=From:To:Cc:Subject:Date;
	b=K8GywdhQhmczFnRE9/FqcRawF5wD0p/gVZFE60jKHArFx+N5bS0njdo2mcfuZJz58
	 dJf41a0TVkJ/28HA0f7+kRGKMdmlKVs6mURVMwjm3pHUsnxvEFJXBjDhxjIFAc3ee5
	 uGwj4VELP1ik27MlOWlMR+awqhBdHnqgv9m4E9kDaZBSlq+uXg4vRN8TRydM0GFUJg
	 piWGEFwzreULApK+8bYK87vCNgGm24RI3bmqKGxQMeXe8SzyKsetuUiqqB7tkNOY6S
	 2hORUVE1JkSxZN8MOT05zy9nydzNHJx+BypLwrLl7FlZux68xU0UhJ7ajhD4mqYf4P
	 g05TW1x9ZdIog==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 0/5] tcp: better visibility when receive queues are full
Date: Sat, 14 Nov 2026 16:51:45 +0100
Message-ID: <20261114155150.235743-1-edumazet@kernel.org>
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

When a TCP socket can not queue an incoming packet, it is currently
hard to tell why, and how often the stack had to work to make room.

Patch 1 adds TcpExtTCPRcvCollapseSkipped, counting the collapses
skipped by the rate limit added in commit c2213d9b61c1 ("tcp: rate
limit receive queue collapsing"). Patch 2 is the packetdrill test
for this rate limit.

Patch 3 reports SKB_DROP_REASON_SOCKET_RCVBUFF instead of
SKB_DROP_REASON_PROTO_MEM when the socket is over sk_rcvbuf.

Patch 4 adds SKB_DROP_REASON_MEMCG, to tell memory cgroup charge
failures from protocol memory limits.

Patch 5 adds a packetdrill test exercising tcp_collapse() on both
the out-of-order queue and the receive queue: no existing test
was reaching its copy loop.

Eric Dumazet (5):
  tcp: add TCPRcvCollapseSkipped counter
  selftests/net: packetdrill: add tcp_rcv_collapse_ratelimit.pkt
  tcp: use SKB_DROP_REASON_SOCKET_RCVBUFF when over sk_rcvbuf
  net: add SKB_DROP_REASON_MEMCG
  selftests/net: packetdrill: add tcp_rcv_collapse.pkt

 Documentation/networking/snmp_counter.rst     |   7 +
 include/net/dropreason-core.h                 |   6 +
 include/net/sock.h                            |  33 ++-
 include/uapi/linux/snmp.h                     |   1 +
 net/core/sock.c                               |  62 +++--
 net/ipv4/proc.c                               |   1 +
 net/ipv4/tcp_input.c                          |  42 ++--
 .../net/packetdrill/tcp_rcv_collapse.pkt      | 230 ++++++++++++++++++
 .../tcp_rcv_collapse_ratelimit.pkt            |  96 ++++++++
 9 files changed, 439 insertions(+), 39 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_collapse.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_ratelimit.pkt

-- 
2.53.0

