Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671531;
	b=e9JklawinxO1qYMT59EUp4emq83cGjSbChP20KdKl02VGHGO385V13IZ/PLkyPU7xjur
	 11AUGg7kr60xBbTANUjyaH6W+mGJz9Sp6yrjBUqlL/4GT3yOZUF2zQd+Ehr+PpOMtLz4U
	 a6GRhNkd5BLInA5e3HXXXu884zDE7w6oDbStWCfoyzpbZKZPH17CsPAaV1M/uIM0JXLLd
	 Y+MS9H4ZAyA/6YApJYgl+timju4D+WmTwHxXfFooP+QIsJPzLLImS8PE6AuyZ6/z9HvZ3
	 xM4JY3IVOM6KH03kq0s1D5OQv2fGU5+eQJI7+TrVVZtEY0qCGy9ANnNOykC3FZSKprg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671531;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lBuIVxj0Gsrtpg9paCJ8LZ48yxcqNNcJoX4yMYdF2+s=;
	b=LsY2gRV5oLK7sVqc3TNA6Q6Q06L68xSX56fXieH1RsMZwFRIAsf/5RPlIOPr4oEnea06
	 bQMR/6WkfgIwYZfNQWrV9ESpWPU2S+6WjC06JqRfg0/7i5570n7nOTZhHZVVspZ8hfAQt
	 9OeVJuIHNR+H9K78t5aWSqcBhXIhJKbDYTEeEWjQw4RvyTvV8oZkGUrU6nmZ+ZPyJk8cX
	 b0PLqorgZ1orBMzpIPtmrEkQZg5TLx+Sfv3NL0mGpLCq2CzVjJNRovYWcU86ZVezN+puA
	 zNp/wmY2cUiUL7IBy+KL972GNvdYGRNuJ2utEbKcEo9MHgd87kIrpqE4IpJWT8hrrKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLtXrcDP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2CB606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLtXrcDP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D651F000C4;
	Sat, 14 Nov 2026 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671530;
	bh=lBuIVxj0Gsrtpg9paCJ8LZ48yxcqNNcJoX4yMYdF2+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZLtXrcDPgM6r8qAMwV/RuHrXFD1E7h+i69zCFe8xRbxFqEYVujRxUNmwKIj6DTRxC
	 1ZCOgVqEPAzzD/qfimFri+aI4lQDI34D2hZZVkdP3CEXPWNLmBjalQuDgZGU++Cg5F
	 3Rld8XFZAjcBf33eNDgLGPsy3fWvZQ4DTxNyrEqHmJr4oIcYM2hPL1cwHzdKGw3YO8
	 S5dCCc7CtewwGDcxxLVIdUGEKdbYeszpbkZon/Jvd7vqEGYfvtkqLT6ueb+8/hvXSD
	 QdZ7t2BHWnc1u40PaJbYp99cq27LDs4VzEOLQplcMEl3d1T09p6snoYRxkxC/O8vjo
	 0O+bTffRDfb7A==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 5/5] selftests/net: packetdrill: add tcp_rcv_collapse.pkt
Date: Sat, 14 Nov 2026 16:51:50 +0100
Message-ID: <20261114155150.235743-6-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114155150.235743-1-edumazet@kernel.org>
References: <20261114155150.235743-1-edumazet@kernel.org>
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

No packetdrill test was reaching the copy loop of tcp_collapse():
TcpExtTCPRcvCollapsed stays at zero for the whole TCP suite.

Add a test using a small locked SO_RCVBUF and out-of-order segments
sent in decreasing sequence order, so that they can not be coalesced
when they are queued. Their truesize exceeds sk_rcvbuf several times,
thus all of them can only be queued if tcp_prune_queue() collapses
them.

The test covers:

- A small out-of-order range made of two skbs.

- A big out-of-order range, bigger than one page.

- The receive queue, starting with a partially read skb.

It checks that TcpExtTCPRcvCollapsed is not zero, that nothing had
to be pruned, and that all the payload can be read.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 .../net/packetdrill/tcp_rcv_collapse.pkt      | 230 ++++++++++++++++++
 1 file changed, 230 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_collapse.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse.pkt
new file mode 100644
index 000000000000..5650c5138231
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse.pkt
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Exercise tcp_collapse() on the out-of-order queue and on the receive
+// queue, for small ranges and for ranges bigger than one page, and check
+// that no payload is lost.
+//
+// Out-of-order segments are sent in decreasing sequence order, so that
+// they can not be coalesced when they are queued: only tcp_collapse()
+// can merge them.
+
+--mss=1000
+
+`./defaults.sh`
+
+// Small locked receive buffer: sk_rcvbuf = 40000, can not grow.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [20000], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,wscale 0>
+  +.1 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+   +0 `nstat -n`
+
+// A small isolated range (12401:12601) made of two skbs.
+// Holes are left at 1:201 and 12301:12401.
+   +0 < . 12501:12601(100) ack 1 win 257
+   +0 < . 12401:12501(100) ack 1 win 257
+
+// A big range (201:12301) made of 121 skbs: their truesize is far bigger
+// than sk_rcvbuf, the out-of-order queue must be collapsed to queue them
+// all. Exactly when this happens depends on skb->truesize, so ACKs are
+// not checked here.
+   +0 < . 12201:12301(100) ack 1 win 257
+   +0 < . 12101:12201(100) ack 1 win 257
+   +0 < . 12001:12101(100) ack 1 win 257
+   +0 < . 11901:12001(100) ack 1 win 257
+   +0 < . 11801:11901(100) ack 1 win 257
+   +0 < . 11701:11801(100) ack 1 win 257
+   +0 < . 11601:11701(100) ack 1 win 257
+   +0 < . 11501:11601(100) ack 1 win 257
+   +0 < . 11401:11501(100) ack 1 win 257
+   +0 < . 11301:11401(100) ack 1 win 257
+   +0 < . 11201:11301(100) ack 1 win 257
+   +0 < . 11101:11201(100) ack 1 win 257
+   +0 < . 11001:11101(100) ack 1 win 257
+   +0 < . 10901:11001(100) ack 1 win 257
+   +0 < . 10801:10901(100) ack 1 win 257
+   +0 < . 10701:10801(100) ack 1 win 257
+   +0 < . 10601:10701(100) ack 1 win 257
+   +0 < . 10501:10601(100) ack 1 win 257
+   +0 < . 10401:10501(100) ack 1 win 257
+   +0 < . 10301:10401(100) ack 1 win 257
+   +0 < . 10201:10301(100) ack 1 win 257
+   +0 < . 10101:10201(100) ack 1 win 257
+   +0 < . 10001:10101(100) ack 1 win 257
+   +0 < . 9901:10001(100) ack 1 win 257
+   +0 < . 9801:9901(100) ack 1 win 257
+   +0 < . 9701:9801(100) ack 1 win 257
+   +0 < . 9601:9701(100) ack 1 win 257
+   +0 < . 9501:9601(100) ack 1 win 257
+   +0 < . 9401:9501(100) ack 1 win 257
+   +0 < . 9301:9401(100) ack 1 win 257
+   +0 < . 9201:9301(100) ack 1 win 257
+   +0 < . 9101:9201(100) ack 1 win 257
+   +0 < . 9001:9101(100) ack 1 win 257
+   +0 < . 8901:9001(100) ack 1 win 257
+   +0 < . 8801:8901(100) ack 1 win 257
+   +0 < . 8701:8801(100) ack 1 win 257
+   +0 < . 8601:8701(100) ack 1 win 257
+   +0 < . 8501:8601(100) ack 1 win 257
+   +0 < . 8401:8501(100) ack 1 win 257
+   +0 < . 8301:8401(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8101:8201(100) ack 1 win 257
+   +0 < . 8001:8101(100) ack 1 win 257
+   +0 < . 7901:8001(100) ack 1 win 257
+   +0 < . 7801:7901(100) ack 1 win 257
+   +0 < . 7701:7801(100) ack 1 win 257
+   +0 < . 7601:7701(100) ack 1 win 257
+   +0 < . 7501:7601(100) ack 1 win 257
+   +0 < . 7401:7501(100) ack 1 win 257
+   +0 < . 7301:7401(100) ack 1 win 257
+   +0 < . 7201:7301(100) ack 1 win 257
+   +0 < . 7101:7201(100) ack 1 win 257
+   +0 < . 7001:7101(100) ack 1 win 257
+   +0 < . 6901:7001(100) ack 1 win 257
+   +0 < . 6801:6901(100) ack 1 win 257
+   +0 < . 6701:6801(100) ack 1 win 257
+   +0 < . 6601:6701(100) ack 1 win 257
+   +0 < . 6501:6601(100) ack 1 win 257
+   +0 < . 6401:6501(100) ack 1 win 257
+   +0 < . 6301:6401(100) ack 1 win 257
+   +0 < . 6201:6301(100) ack 1 win 257
+   +0 < . 6101:6201(100) ack 1 win 257
+   +0 < . 6001:6101(100) ack 1 win 257
+   +0 < . 5901:6001(100) ack 1 win 257
+   +0 < . 5801:5901(100) ack 1 win 257
+   +0 < . 5701:5801(100) ack 1 win 257
+   +0 < . 5601:5701(100) ack 1 win 257
+   +0 < . 5501:5601(100) ack 1 win 257
+   +0 < . 5401:5501(100) ack 1 win 257
+   +0 < . 5301:5401(100) ack 1 win 257
+   +0 < . 5201:5301(100) ack 1 win 257
+   +0 < . 5101:5201(100) ack 1 win 257
+   +0 < . 5001:5101(100) ack 1 win 257
+   +0 < . 4901:5001(100) ack 1 win 257
+   +0 < . 4801:4901(100) ack 1 win 257
+   +0 < . 4701:4801(100) ack 1 win 257
+   +0 < . 4601:4701(100) ack 1 win 257
+   +0 < . 4501:4601(100) ack 1 win 257
+   +0 < . 4401:4501(100) ack 1 win 257
+   +0 < . 4301:4401(100) ack 1 win 257
+   +0 < . 4201:4301(100) ack 1 win 257
+   +0 < . 4101:4201(100) ack 1 win 257
+   +0 < . 4001:4101(100) ack 1 win 257
+   +0 < . 3901:4001(100) ack 1 win 257
+   +0 < . 3801:3901(100) ack 1 win 257
+   +0 < . 3701:3801(100) ack 1 win 257
+   +0 < . 3601:3701(100) ack 1 win 257
+   +0 < . 3501:3601(100) ack 1 win 257
+   +0 < . 3401:3501(100) ack 1 win 257
+   +0 < . 3301:3401(100) ack 1 win 257
+   +0 < . 3201:3301(100) ack 1 win 257
+   +0 < . 3101:3201(100) ack 1 win 257
+   +0 < . 3001:3101(100) ack 1 win 257
+   +0 < . 2901:3001(100) ack 1 win 257
+   +0 < . 2801:2901(100) ack 1 win 257
+   +0 < . 2701:2801(100) ack 1 win 257
+   +0 < . 2601:2701(100) ack 1 win 257
+   +0 < . 2501:2601(100) ack 1 win 257
+   +0 < . 2401:2501(100) ack 1 win 257
+   +0 < . 2301:2401(100) ack 1 win 257
+   +0 < . 2201:2301(100) ack 1 win 257
+   +0 < . 2101:2201(100) ack 1 win 257
+   +0 < . 2001:2101(100) ack 1 win 257
+   +0 < . 1901:2001(100) ack 1 win 257
+   +0 < . 1801:1901(100) ack 1 win 257
+   +0 < . 1701:1801(100) ack 1 win 257
+   +0 < . 1601:1701(100) ack 1 win 257
+   +0 < . 1501:1601(100) ack 1 win 257
+   +0 < . 1401:1501(100) ack 1 win 257
+   +0 < . 1301:1401(100) ack 1 win 257
+   +0 < . 1201:1301(100) ack 1 win 257
+   +0 < . 1101:1201(100) ack 1 win 257
+   +0 < . 1001:1101(100) ack 1 win 257
+   +0 < . 901:1001(100) ack 1 win 257
+   +0 < . 801:901(100) ack 1 win 257
+   +0 < . 701:801(100) ack 1 win 257
+   +0 < . 601:701(100) ack 1 win 257
+   +0 < . 501:601(100) ack 1 win 257
+   +0 < . 401:501(100) ack 1 win 257
+   +0 < . 301:401(100) ack 1 win 257
+   +0 < . 201:301(100) ack 1 win 257
+
+   +0 `nstat -sz | grep -q "^TcpExtTCPRcvCollapsed  *[1-9]"`
+   +0 `nstat -sz | grep -q "^TcpExtOfoPruned  *0 "`
+
+// Fill the first hole: 1:12301 is moved to the receive queue.
+// A partial read leaves a partially consumed skb at the head of the
+// receive queue.
+   +0 < . 1:201(200) ack 1 win 257
+   +0 read(4, ..., 100) = 100
+
+// More out-of-order segments (12601:17601), following the small range:
+// the receive queue has to be collapsed as well.
+   +0 < . 17501:17601(100) ack 1 win 257
+   +0 < . 17401:17501(100) ack 1 win 257
+   +0 < . 17301:17401(100) ack 1 win 257
+   +0 < . 17201:17301(100) ack 1 win 257
+   +0 < . 17101:17201(100) ack 1 win 257
+   +0 < . 17001:17101(100) ack 1 win 257
+   +0 < . 16901:17001(100) ack 1 win 257
+   +0 < . 16801:16901(100) ack 1 win 257
+   +0 < . 16701:16801(100) ack 1 win 257
+   +0 < . 16601:16701(100) ack 1 win 257
+   +0 < . 16501:16601(100) ack 1 win 257
+   +0 < . 16401:16501(100) ack 1 win 257
+   +0 < . 16301:16401(100) ack 1 win 257
+   +0 < . 16201:16301(100) ack 1 win 257
+   +0 < . 16101:16201(100) ack 1 win 257
+   +0 < . 16001:16101(100) ack 1 win 257
+   +0 < . 15901:16001(100) ack 1 win 257
+   +0 < . 15801:15901(100) ack 1 win 257
+   +0 < . 15701:15801(100) ack 1 win 257
+   +0 < . 15601:15701(100) ack 1 win 257
+   +0 < . 15501:15601(100) ack 1 win 257
+   +0 < . 15401:15501(100) ack 1 win 257
+   +0 < . 15301:15401(100) ack 1 win 257
+   +0 < . 15201:15301(100) ack 1 win 257
+   +0 < . 15101:15201(100) ack 1 win 257
+   +0 < . 15001:15101(100) ack 1 win 257
+   +0 < . 14901:15001(100) ack 1 win 257
+   +0 < . 14801:14901(100) ack 1 win 257
+   +0 < . 14701:14801(100) ack 1 win 257
+   +0 < . 14601:14701(100) ack 1 win 257
+   +0 < . 14501:14601(100) ack 1 win 257
+   +0 < . 14401:14501(100) ack 1 win 257
+   +0 < . 14301:14401(100) ack 1 win 257
+   +0 < . 14201:14301(100) ack 1 win 257
+   +0 < . 14101:14201(100) ack 1 win 257
+   +0 < . 14001:14101(100) ack 1 win 257
+   +0 < . 13901:14001(100) ack 1 win 257
+   +0 < . 13801:13901(100) ack 1 win 257
+   +0 < . 13701:13801(100) ack 1 win 257
+   +0 < . 13601:13701(100) ack 1 win 257
+   +0 < . 13501:13601(100) ack 1 win 257
+   +0 < . 13401:13501(100) ack 1 win 257
+   +0 < . 13301:13401(100) ack 1 win 257
+   +0 < . 13201:13301(100) ack 1 win 257
+   +0 < . 13101:13201(100) ack 1 win 257
+   +0 < . 13001:13101(100) ack 1 win 257
+   +0 < . 12901:13001(100) ack 1 win 257
+   +0 < . 12801:12901(100) ack 1 win 257
+   +0 < . 12701:12801(100) ack 1 win 257
+   +0 < . 12601:12701(100) ack 1 win 257
+
+// Fill the second hole and check that all the payload can be read:
+// nothing was dropped to make room.
+   +0 < . 12301:12401(100) ack 1 win 257
+   +0 read(4, ..., 30000) = 17500
+
+   +0 `nstat -sz | grep -q "^TcpExtOfoPruned  *0 "`
+   +0 `nstat -sz | grep -q "^TcpExtRcvPruned  *0 "`
+   +0 `nstat -sz | grep -q "^TcpExtTCPRcvCollapseSkipped  *0 "`
-- 
2.53.0

