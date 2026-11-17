Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893751;
	b=PrHwSCp03bDzwukq9BAJiZlcbllSBP1YzsYlQ2Id79ttsmCKFHsWOFzjXDvP1iaPK1cU
	 KyoLetlZE4dLMJkYZdDECf1Ts2fFJ+Q3TyZ7RJzE66qCsiYCzQcQAjc8Z+wW3/7pkFN/S
	 BLsUALirBDxG9KI9gsUa1OTbh8+GNIix52ZLHeibl4x5gjLRGhlZUmGz9dS9Ysu6LaSwr
	 jaNmW6HpHorBkPYexh/dAXeJccR36dCevnkhfBD2NsdK66CzIobUtPGWaz55/Q4z/tP8o
	 0uJSfpMZE0A3l1FZtujhku/2ewk44aCeTIHHrPsN3Pgcw6APr73kymHgXnogSBp6gBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lcMtk5XFqDVXe6pyv2zAxMdekmJ9Nrd362l60pTMZog=;
	b=ps5flxo5zMK1P4jse6gVO5wLz8mPuRkD089eA7CKJflgCuyjDe38p538X++16/JExXTn
	 akA1hZLjmIB/xJn3rAxaXYzd3Bs7XtxcrZFhjxlagBnWxoUpqnDte1z+T70WZ5zgZzjKB
	 i0pe8QejUjr6iULxhwZWPWfOWZ3zr3qWhaj+bAVHtWVS4WyUFx7uk85puu9uqZ9tL0FyP
	 MaUlVM7kycGgA90JXWZtGl/Vofj8mf+x12pMSHHkVaQuWw0R2346aDeLw5fqJr60YQyeD
	 IQppTYxMKT+rPLOXiWjnkIKJuqSTRQK5c3KusdfGABpeb3vS+Wxl4jTrpnyb4uOeKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R3cJtuA0;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D29606A89A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D29606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R3cJtuA0
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2439061a12.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893751; x=1795498551; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcMtk5XFqDVXe6pyv2zAxMdekmJ9Nrd362l60pTMZog=;
        b=R3cJtuA04mlrw3F9uULiBkS1TIDQCjDBHW/VpXnhDHVnQKEiWHsRmnRBlPofLaMgQs
         EA271nHeqicisVEmyPlFbciWU5rI7Xm6EuMKWYAs19OM8+FurQcazvxAAxjH6IJSyYqL
         cfm5z/2WERNXxbRqxmkox4OavnTsJuRYFGXJa8v8TzBtW086qoeEPLLKjFUUpCkF/1kk
         GTgaE3AFVmjb989b2hEAoYfLZRhcQW6ZCYNLDyvspPavY3pHpaYezwS7jX0Qd6QVxFqy
         Uxc3xfwkzK9FIpFmT5GUpDMHCKWP4KVMy+E2cQgTC6eyEXQaSvklW2FpaqMUstgzmi4z
         6Xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893751; x=1795498551;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcMtk5XFqDVXe6pyv2zAxMdekmJ9Nrd362l60pTMZog=;
        b=rRSCb28owR4MLe+tsjyGJQNRpZpGQaKtyUme7MXas3NFsc5FZXrCFBpv7ZBj3DWq3l
         LXaFyqG6wNWHACW64J1u8VFEp1UBTrqDWZLb2QM03uXbeec9fHHvI1Ed+Aid5qqJrby7
         CqHosKrfWnjnoBVoYJ2YXavwQOJpIdynIgVxq5pP7Frk1CKIIPLC51FOUHWbFbJ8W4WP
         9P99kqc9pDt0Dj9e3pJxTJrEA5KGm0usdcc0yG/gqagPt552/eQvkwpRsP+xvcETdfmG
         ePLQ4hj8wffXu5Q71YbveB7zgZaHvgIQhwvOK67sni58/jrictJRbKXxPnhTrHtqr3YP
         vroA==
X-Forwarded-Encrypted: i=1; AL+hErFOgofE0PGPbVEQwMDK/OGe9dM7rWzFcfHp5AvVK5qAWcPk66xa8tTxxbBlM+e+ZonUuxnxhJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ZPBuMyUAUXIp3toawpiDX05p1Ny0l8H4jyI5NHPPVLrewlAi
	RwoIQoGdLreaOMPXRR6gV4loHPAheOefNT6vCb2OE8h+/C4Wh9fGRpJCZU2uZ1nv5+ZUoSm6Jhh
	gT2SIDw==
X-Received: from pjer15.prod.google.com ([2002:a17:90a:acf:b0:3b3:b733:4d9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:49:b0:3ac:bfa7:b079
 with SMTP id 98e67ed59e1d1-3b1b081bbd8mr11814730a91.7.1794893750666; Mon, 16
 Nov 2026 21:35:50 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:24 +0000
In-Reply-To: <20261117053543.84032-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117053543.84032-7-kuniyu@google.com>
Subject: [PATCH v1 net 6/8] selftest: net: packetdrill: Add ICMP and ICMPv6 tests.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

tcp_icmp_ipv4.pkt and tcp_icmp_ipv6.pkt cover the scenarios
fixed by the preceding patches.

tcp_v6_err() already checks the outer hop limit and
ip6_sk_accept_pmtu(), so Test 2 and 5 in tcp_icmp_ipv6.pkt
pass without the series.

ICMP and ICMPv6 behaviour are unlikely to change, so splitting
into multiple files per test case is not worth it.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 .../net/packetdrill/tcp_icmp_ipv4.pkt         |  98 ++++++++++++++++
 .../net/packetdrill/tcp_icmp_ipv6.pkt         | 111 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
new file mode 100644
index 000000000000..122bf9a14862
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+--ip_version=ipv4
+
+`./defaults.sh`
+
+// Test 1: Client in TCP_SYN_SENT rejects ICMP quoting seq == snd_nxt (RFC 5927 4.1)
+// In SYN_SENT, SND.UNA = ISN, SND.NXT = ISN + 1.
+// The sequence number in ICMP must satisfy SND.UNA <= SEG.SEQ < SND.NXT.
+// An ICMP message quoting seq == 1 (snd_nxt) must be dropped, while seq == 0 (snd_una) aborts.
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+   +0 > S 0:0(0) <...>
+   // Out-of-window ICMP quoting seq == 1 (snd_nxt) must be dropped
+   +0 < icmp unreachable host_unreachable [1:1(0)]
+   // Socket stays in TCP_SYN_SENT, so SYN retransmission occurs after 1s
+   +1 > S 0:0(0) <...>
+   // In-window ICMP quoting seq == 0 (snd_una) is accepted and aborts connection
+   +0 < icmp unreachable host_unreachable [0:0(0)]
+   +0 %{ assert tcpi_state == TCP_CLOSE }%
+   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) = 0
+   +0 close(3) = 0
+
+// Test 2: Client with IP_MINTTL (21) checks outer IP TTL in tcp_v4_err()
+// An ICMP with outer TTL < min_ttl (250) must be dropped, while outer TTL >= min_ttl
+// must be accepted even though the quoted inner IP header has lower TTL (64).
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_IP, 21, [250], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+   +0 > S 0:0(0) <...>
+   // Outer TTL 10 < min_ttl (250): dropped, socket stays in TCP_SYN_SENT
+   +0 < (ttl 10) icmp unreachable host_unreachable [0:0(0)]
+   +1 > S 0:0(0) <...>
+   // Outer TTL 255 >= min_ttl (250): accepted, socket aborts
+   +0 < (ttl 255) icmp unreachable host_unreachable [0:0(0)]
+   +0 %{ assert tcpi_state == TCP_CLOSE }%
+   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) = 0
+   +0 close(3) = 0
+
+// Test 3: Listener with IP_MINTTL (21) checks TTL before reqsk handling
+// An incoming fatal ICMP with outer TTL < min_ttl (255) must not abort TCP_NEW_SYN_RECV,
+// while outer TTL >= min_ttl (255) must abort it.
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_IP, 21, [255], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer TTL 10 < min_ttl (255): dropped, reqsk survives
+   +0 < (ttl 10) icmp unreachable port_unreachable [0:0(0)]
+   +1 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer TTL 255 >= min_ttl (255): accepted, fatal ICMP aborts reqsk
+   +0 < (ttl 255) icmp unreachable port_unreachable [0:0(0)]
+   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 4: Server in TCP_NEW_SYN_RECV does not abort on soft errors but aborts on fatal error
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   // 4a: Soft errors must not abort reqsk
+   +0 < icmp unreachable host_unreachable [0:0(0)]
+   +0 < icmp unreachable net_unreachable [0:0(0)]
+   +0 < icmp time_exceeded [0:0(0)]
+   +0 < icmp parameter_problem [0:0(0)]
+   +1 > S. 0:0(0) ack 1 <...>
+   // 4b: Fatal error (port_unreachable) must abort reqsk
+   +0 < icmp unreachable port_unreachable [0:0(0)]
+   // Remote sends 3rd ACK: listener responds with RST because reqsk was aborted
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 5: Socket with IP_PMTUDISC_INTERFACE ignores ICMP_FRAG_NEEDED
+// Socket configured with IP_PMTUDISC_INTERFACE (4) must not overwrite MTU
+// upon receiving ICMP_DEST_UNREACH with code ICMP_FRAG_NEEDED.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,nop,nop,nop,wscale 8>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < . 1:1(0) ack 1 win 257
+   +0 accept(3, ..., ...) = 4
+   +0 setsockopt(4, SOL_IP, IP_MTU_DISCOVER, [4], 4) = 0
+   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) = 0
+   +0 write(4, ..., 1000) = 1000
+   +0 > P. 1:1001(1000) ack 1 <...>
+   +0 < icmp unreachable frag_needed mtu 1200 [1:1001(1000)]
+   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) = 0
+   +0 close(4) = 0
+   +0 close(3) = 0
diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt
new file mode 100644
index 000000000000..bd0cc365a088
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+--ip_version=ipv6
+
+`./defaults.sh`
+
+// Test 1: Client in TCP_SYN_SENT rejects ICMPv6 quoting seq == snd_nxt (RFC 5927 4.1)
+// In SYN_SENT, SND.UNA = ISN, SND.NXT = ISN + 1.
+// The sequence number in ICMP must satisfy SND.UNA <= SEG.SEQ < SND.NXT.
+// An ICMP message quoting seq == 1 (snd_nxt) must be dropped, while seq == 0 (snd_una) aborts.
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+   +0 > S 0:0(0) <...>
+   // Out-of-window ICMPv6 quoting seq == 1 (snd_nxt) must be dropped
+   +0 < icmp unreachable address_unreachable [1:1(0)]
+   // Socket stays in TCP_SYN_SENT, so SYN retransmission occurs after 1s
+   +1 > S 0:0(0) <...>
+   // In-window ICMPv6 quoting seq == 0 (snd_una) is accepted and aborts connection
+   +0 < icmp unreachable address_unreachable [0:0(0)]
+   +0 %{ assert tcpi_state == TCP_CLOSE }%
+   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) = 0
+   +0 close(3) = 0
+
+// Test 2: Client with IPV6_MINHOPCOUNT (73) checks outer IPv6 hop_limit in tcp_v6_err()
+// An ICMPv6 with outer hop_limit < min_hopcount (250) must be dropped, while outer
+// hop_limit >= min_hopcount must be accepted even though the quoted inner hop_limit is 64.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_IPV6, 73, [250], 4) = 0
+   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+   +0 > S 0:0(0) <...>
+   // Outer hop_limit 10 < min_hopcount (250): dropped, socket stays in TCP_SYN_SENT
+   +0 < (ttl 10) icmp unreachable address_unreachable [0:0(0)]
+   +1 > S 0:0(0) <...>
+   // Outer hop_limit 255 >= min_hopcount (250): accepted, socket aborts
+   +0 < (ttl 255) icmp unreachable address_unreachable [0:0(0)]
+   +0 %{ assert tcpi_state == TCP_CLOSE }%
+   +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [EHOSTUNREACH], [4]) = 0
+   +0 close(3) = 0
+
+// Test 3: Listener with IPV6_MINHOPCOUNT (73) checks hop_limit before reqsk handling
+// An incoming fatal ICMPv6 with outer hop_limit < min_hopcount (255) must not abort
+// TCP_NEW_SYN_RECV, while outer hop_limit >= min_hopcount (255) must abort it.
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_IPV6, 73, [255], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer hop_limit 10 < min_hopcount (255): dropped, reqsk survives
+   +0 < (ttl 10) icmp unreachable port_unreachable [0:0(0)]
+   +1 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer hop_limit 255 >= min_hopcount (255): accepted, fatal ICMPv6 aborts reqsk
+   +0 < (ttl 255) icmp unreachable port_unreachable [0:0(0)]
+   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 4: Server in TCP_NEW_SYN_RECV does not abort on soft error or
+// non-UNK_NEXTHDR ICMPV6_PARAMPROB, but aborts on fatal error or
+// ICMPV6_UNK_NEXTHDR.
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   // 4a: Soft error (address_unreachable) must not abort reqsk
+   +0 < icmp unreachable address_unreachable [0:0(0)]
+   +1 > S. 0:0(0) ack 1 <...>
+   // 4b: Non-UNK_NEXTHDR parameter problem (header_field) must not abort reqsk
+   +0 < icmp parameter_problem header_field [0:0(0)]
+   +2 > S. 0:0(0) ack 1 <...>
+   // 4c: ICMPV6_UNK_NEXTHDR parameter problem (unknown_next_header) must abort reqsk
+   +0 < icmp parameter_problem unknown_next_header [0:0(0)]
+   // Remote sends 3rd ACK: listener responds with RST because reqsk was aborted
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 4d: Fatal unreachable error (port_unreachable) must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp unreachable port_unreachable [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 5: Socket with IPV6_PMTUDISC_INTERFACE ignores ICMPV6_PKT_TOOBIG
+// Socket configured with IPV6_PMTUDISC_INTERFACE (4) must not overwrite MTU
+// upon receiving ICMPV6_PKT_TOOBIG.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,sackOK,nop,nop,nop,wscale 8>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < . 1:1(0) ack 1 win 257
+   +0 accept(3, ..., ...) = 4
+   +0 setsockopt(4, SOL_IPV6, IPV6_MTU_DISCOVER, [4], 4) = 0
+   +0 getsockopt(4, SOL_IPV6, IPV6_MTU, [1520], [4]) = 0
+   +0 write(4, ..., 1000) = 1000
+   +0 > P. 1:1001(1000) ack 1 <...>
+   +0 < icmp packet_too_big mtu 1280 [1:1001(1000)]
+   +0 getsockopt(4, SOL_IPV6, IPV6_MTU, [1520], [4]) = 0
+   +0 close(4) = 0
+   +0 close(3) = 0
-- 
2.56.0.679.gc527c65306-goog

