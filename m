Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853229;
	b=Iw6a3rAVfkHsuxbUSBaU0ZlD8D4Z2+Vki+5gAzo08nysAKCFXTcWGgrGh3y5lvODzhOZ
	 hwwWPwrntg23wdF9LeCK9yRdIsCEV6lIiijOUCr2Pg68biHqQBYOCQkpaiVHZPTrkoGAv
	 bwH6WmRm+WDa2VfDuukHJXxAtVw+vexpEmAAWbjSWePTKO2ym1Gky+tQSn6psvVeQ9GAJ
	 F1HZNTPZD436QiXXrnHtTH//VOQ5MFDqeoenSwBTrqcsjkGSBS17UFXMgBgl2C08PtnOO
	 EUK6NmhxsWSE+1PfF3GU/eRkOfupdjE9Hn3QFPOI1LxaUZzdxCJfHO2JO1lvv44Bx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nCdSO5/90oQfz2O7R3byiHpyqZXO2svBPWtgploiJTI=;
	b=fC0XF7yDCnISSaI1vuK/GWfR4J2ZvfxN6zSYjpu64e503jtNdnYUcU7tROnBx3NKpjYt
	 SA0jafMj6oGGXIul/DFHJKuGugwcoTgT17+iHMXNHFiusve5bcJIsnKxFzQdHvKGls0Z8
	 XcvIUazdpSCQfejtGAQ6nhjPIRm+ZmBYIyU7xmrsPf3SZk02djZKUu5eL/QE5Ht7q41J1
	 uBHSaBMWRY74EGEr9RKtdErFEENb7qwXX6fywwKVEjd15ZHGFQKL0T+o6Pe19lgWJPdwW
	 R8E03AYmhjYs31edglYavhNXD+uPaE1eonEgFSp9xeQUrkHdMqhPC2K+jqcOYgMteIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cg8I1yiw;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96987606A335
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96987606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cg8I1yiw
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso6435106a91.3
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853228; x=1796458028; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCdSO5/90oQfz2O7R3byiHpyqZXO2svBPWtgploiJTI=;
        b=cg8I1yiwjcpSVt9ImikLTJLStF93Eyo9XQa0pLI2mCgC4eeqLJiXotF63dRiwhnq6o
         PaDfsZXs6hHtBYrNfAp5wPZhUEcluuKi7vhPRFboeiSspMWeYP3ZnQ8hYC/pfWNA+3ew
         P1xtoA0pNxg6u5ogyBTGh0pwJHUbBcLd4iuP/WZPADRPjAcUZU8roHendPQtTCSYLg0m
         ZVAJeTb+lFTdbm9oKNTep9yGTIG5DcldK3bHsT2hMa+Q7PAcKB2sBIdqafTtsa1IXoUi
         gjj/FJHY+uNuVSN3/KlYEkypIh8QcoUCuQXZvLRTWA1TVHAmHB4cAZJWkTB8U3Ob75QI
         igWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853228; x=1796458028;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCdSO5/90oQfz2O7R3byiHpyqZXO2svBPWtgploiJTI=;
        b=GDLQjJ/r3md1QrU1XezQGPlRWvxcjFbD5wBZIvEGMkOiITZDLS4dgomGYvGpdk1K5E
         26aqkISZBYb+++LgUWPY4Hf/G6GjdZdT6mEXGrk5DY9Zbd544EwxwJaaUEzcuWCIDeqk
         weRQyJYpVpvj3e21KwRLcV02lekP2qXXImS7T92ow6rfFxRwkZv7EnJTpQZhZjZdRgZw
         7dvpJvuDUSgnNn19RXCpFTNz31X7uNWLRNGEbtbKij8idr5k4g16CG1jYY1+YAIaOtPf
         c7ld+nOFOtLy/KQ2teeO5e9lS37utpbtPmwNzUDrd/80RO9uWmW4g5/IC9ey5FxlrTp6
         A8Xg==
X-Forwarded-Encrypted: i=1; AL+hErGiOyM63xOcp+x9pW4W7LcUsfZTuWiXCOE5IPtu1halU8391+Zn9S2Rvb+NCq1b/VgbDCbDajM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TpnaERw69FWY/mbibWizb3qpm0sc2z8ioVbFLDe0wZyoDg01i
	+xGc025ZIyz26HxfA+xRrq4bnRpsExpDoFwqsJLurq78tosDCEbJXwTQbHGmpHlxobYI+6FeJDA
	9tDYENA==
X-Received: from pja7.prod.google.com ([2002:a17:90b:5487:b0:3b0:994b:db90])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a48:b0:3b1:2d60:66cc
 with SMTP id 98e67ed59e1d1-3b41c7b56bemr24775523a91.8.1795853227523; Sat, 28
 Nov 2026 00:07:07 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:18 +0000
In-Reply-To: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128080700.3828378-7-kuniyu@google.com>
Subject: [PATCH v2 net 6/8] selftest: net: packetdrill: Add ICMP and ICMPv6 tests.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

tcp_icmp_ipv4.pkt and tcp_icmp_ipv6.pkt cover the scenarios
fixed by the preceding patches.

tcp_v6_err() already checks the outer hop limit and
ip6_sk_accept_pmtu(), so Test 1 and 4 in tcp_icmp_ipv6.pkt
pass without the series.

ICMP and ICMPv6 behaviour are unlikely to change, so splitting
into multiple files per test case is not worth it.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
v2:
  * Remove tests for v1's patch 1
  * Cover more ICMP errors
  * Use IP_TTL symbol w/ a new packetdrill (NIPA already
    support this : https://github.com/linux-netdev/nipa/pull/143
---
 .../net/packetdrill/tcp_icmp_ipv4.pkt         | 124 ++++++++++++++++++
 .../net/packetdrill/tcp_icmp_ipv6.pkt         | 124 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
new file mode 100644
index 000000000000..0e98f713a451
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+--ip_version=ipv4
+
+`./defaults.sh`
+
+// Test 1: Client with IP_MINTTL checks outer IP TTL in tcp_v4_err()
+// An ICMP with outer TTL < min_ttl (250) must be dropped, while outer TTL >= min_ttl
+// must be accepted even though the quoted inner IP header has lower TTL (64).
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_IP, IP_MINTTL, [250], 4) = 0
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
+// Test 2: Listener with IP_MINTTL checks TTL before reqsk handling
+// An incoming ICMP or 3rd ACK with outer TTL < min_ttl (255) must not abort or
+// complete TCP_NEW_SYN_RECV, while outer TTL >= min_ttl (255) must be accepted.
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_IP, IP_MINTTL, [255], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer TTL 10 < min_ttl (255) on ICMP: dropped in tcp_v4_err(), reqsk survives
+   +0 < (ttl 10) icmp unreachable port_unreachable [0:0(0)]
+   +1 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer TTL 10 < min_ttl (255) on 3rd ACK: dropped in tcp_v4_rcv(), reqsk survives
+   +0 < (ttl 10) . 1:1(0) ack 1 win 65535
+   +2 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer TTL 255 >= min_ttl (255): accepted, ICMP aborts reqsk
+   +0 < (ttl 255) icmp unreachable port_unreachable [0:0(0)]
+   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 3: Server in TCP_NEW_SYN_RECV ignores ICMP_FRAG_NEEDED, but aborts on
+// other ICMP_DEST_UNREACH codes, ICMP_TIME_EXCEEDED, and ICMP_PARAMETERPROB.
+   // 3a: ICMP_FRAG_NEEDED must not abort reqsk, ICMP_HOST_UNREACH must abort
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp unreachable frag_needed mtu 1200 [0:0(0)]
+   +1 > S. 0:0(0) ack 1 <...>
+   +0 < icmp unreachable host_unreachable [0:0(0)]
+   // Remote sends 3rd ACK: listener responds with RST because reqsk was aborted
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3b: ICMP_NET_UNREACH must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp unreachable net_unreachable [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3c: ICMP_TIME_EXCEEDED must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp time_exceeded [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3d: ICMP_PARAMETERPROB must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp parameter_problem [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3e: ICMP_PORT_UNREACH must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp unreachable port_unreachable [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 4: Socket with IP_PMTUDISC_INTERFACE ignores ICMP_FRAG_NEEDED
+// Socket configured with IP_PMTUDISC_INTERFACE must not overwrite MTU
+// upon receiving ICMP_DEST_UNREACH with code ICMP_FRAG_NEEDED.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+   +0 < S 0:0(0) win 65535 <mss 1460,sackOK,nop,nop,nop,wscale 8>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < . 1:1(0) ack 1 win 257
+   +0 accept(3, ..., ...) = 4
+   +0 setsockopt(4, SOL_IP, IP_MTU_DISCOVER, [IP_PMTUDISC_INTERFACE], 4) = 0
+   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) = 0
+   +0 write(4, ..., 1000) = 1000
+   +0 > P. 1:1001(1000) ack 1 <...>
+   +0 < icmp unreachable frag_needed mtu 1200 [1:1001(1000)]
+   +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) = 0
+   +0 close(4) = 0
+   +0 close(3) = 0
diff --git a/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt
new file mode 100644
index 000000000000..d1a44af7297b
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0
+--ip_version=ipv6
+
+`./defaults.sh`
+
+// Test 1: Client with IPV6_MINHOPCOUNT checks outer IPv6 hop_limit in tcp_v6_err()
+// An ICMPv6 with outer hop_limit < min_hopcount (250) must be dropped, while outer
+// hop_limit >= min_hopcount must be accepted even though the quoted inner hop_limit is 64.
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_IPV6, IPV6_MINHOPCOUNT, [250], 4) = 0
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
+// Test 2: Listener with IPV6_MINHOPCOUNT checks hop_limit before reqsk handling
+// An incoming ICMPv6 or 3rd ACK with outer hop_limit < min_hopcount (255) must not abort or
+// complete TCP_NEW_SYN_RECV, while outer hop_limit >= min_hopcount (255) must be accepted.
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_IPV6, IPV6_MINHOPCOUNT, [255], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < (ttl 255) S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer hop_limit 10 < min_hopcount (255) on ICMPv6: dropped in tcp_v6_err(), reqsk survives
+   +0 < (ttl 10) icmp unreachable port_unreachable [0:0(0)]
+   +1 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer hop_limit 10 < min_hopcount (255) on 3rd ACK: dropped in tcp_v6_rcv(), reqsk survives
+   +0 < (ttl 10) . 1:1(0) ack 1 win 65535
+   +2 > (ttl 64) S. 0:0(0) ack 1 <...>
+   // Outer hop_limit 255 >= min_hopcount (255): accepted, ICMPv6 aborts reqsk
+   +0 < (ttl 255) icmp unreachable port_unreachable [0:0(0)]
+   +0 < (ttl 255) . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+
+// Test 3: Server in TCP_NEW_SYN_RECV ignores ICMPV6_PKT_TOOBIG, but aborts on
+// ICMPV6_DEST_UNREACH, ICMPV6_TIME_EXCEED, and ICMPV6_PARAMPROB.
+   // 3a: ICMPV6_PKT_TOOBIG must not abort reqsk, ICMPV6_ADDR_UNREACH must abort
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp packet_too_big mtu 1280 [0:0(0)]
+   +1 > S. 0:0(0) ack 1 <...>
+   +0 < icmp unreachable address_unreachable [0:0(0)]
+   // Remote sends 3rd ACK: listener responds with RST because reqsk was aborted
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3b: ICMPV6_TIME_EXCEED must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp time_exceeded [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3c: ICMPV6_HDR_FIELD parameter problem must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp parameter_problem header_field [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3d: ICMPV6_UNK_NEXTHDR parameter problem must abort reqsk
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 10) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < icmp parameter_problem unknown_next_header [0:0(0)]
+   +0 < . 1:1(0) ack 1 win 65535
+   +0 > R 1:1(0)
+   +0 close(3) = 0
+   // 3e: ICMPV6_PORT_UNREACH must abort reqsk
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
+// Test 4: Socket with IPV6_PMTUDISC_INTERFACE ignores ICMPV6_PKT_TOOBIG
+// Socket configured with IPV6_PMTUDISC_INTERFACE must not overwrite MTU
+// upon receiving ICMPV6_PKT_TOOBIG.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+   +0 < S 0:0(0) win 65535 <mss 1440,sackOK,nop,nop,nop,wscale 8>
+   +0 > S. 0:0(0) ack 1 <...>
+   +0 < . 1:1(0) ack 1 win 257
+   +0 accept(3, ..., ...) = 4
+   +0 setsockopt(4, SOL_IPV6, IPV6_MTU_DISCOVER, [IPV6_PMTUDISC_INTERFACE], 4) = 0
+   +0 getsockopt(4, SOL_IPV6, IPV6_MTU, [1520], [4]) = 0
+   +0 write(4, ..., 1000) = 1000
+   +0 > P. 1:1001(1000) ack 1 <...>
+   +0 < icmp packet_too_big mtu 1280 [1:1001(1000)]
+   +0 getsockopt(4, SOL_IPV6, IPV6_MTU, [1520], [4]) = 0
+   +0 close(4) = 0
+   +0 close(3) = 0
-- 
2.56.1.839.g22a8290db9-goog

