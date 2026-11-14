Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671523;
	b=bruGTlvAUoDe8ekV9zW+lxBB9J672pjTUDxBbErTIFjSQMi9w3HjmfogfZ26KrszPO/A
	 crqFFo0q6RNKq9/TBC5JuME7UdOJ5vke3mwOkRS50Kv6slVK9mNgAHkwUsDUbA40C8yJv
	 ic4RkzxURWi/728ID/llTmNOgPuaFt+qFEZtZfdKGCyDhBfS9nIBXG7H8BWkFMHlej5vA
	 gvR+u83jeNTOKHlj8/XYyZ/xvUzvArSFXKT3K4tvBZ5tW1+SpiBio1iqVckD19DufS5pE
	 sX6K82WzPlmdTguYx6kO0alTiAs7nZS74SW5deaSvTWFZBYa9DyHgOXrSdbpHLalYTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671523;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=hjeZLY4+8pi8pRR3HBLpMmhoRtxVL3dGUHa51pWMs4g=;
	b=32ciog6Mo7KyQndLu7GnSlVu9aWGsyZsgvVBa74QZ4IcV23iulhK9o35siE+4KdQk2dF
	 S/68btFzkmFMD4XiCmU0XIKwPaOGeeVKBI3CETplNc3uZW92eBp8Yugn+e8VWm77m2RGX
	 1uBP3TqJhucHZwcCReISQFlYNIJ3r905HSnLpbqYGt9OllOAF1Df1ntmCrvewhu5IoJp8
	 90+eKBm/HA1vy6kIbz+bRgbitLspBC6LQ1VSGEIAxY19a2BptKqhvwD5NkloLXJMctA1S
	 X18wE21GfoB5Zev3dWAqwqACIfGZVfzuiITUSBAuWDgTyAWvYCLnps+CiWdF8LyIU4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKXa16QQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138AB606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKXa16QQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843301F000C6;
	Sat, 14 Nov 2026 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671522;
	bh=hjeZLY4+8pi8pRR3HBLpMmhoRtxVL3dGUHa51pWMs4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FKXa16QQ4OBgbe4bsN9Xyk4hv7NJMGN55ba+FYBXdo2r04jPsUzeE8lRED1wqe/co
	 Rh1xlgP3T/7y7eROR84vpQRUv4bIRDbxqJh8UBpCOtfxQ/4gnsHAAqyfsvjQJm+3WG
	 4MrX5Wq5dIJzQb8HprvKS8GEXiRwvb+11Xl7E5EXPxO0wpncrRo8W6F2StDX6Nn6Ih
	 391sxM/cW4B9N0yxeNSVumqp/lRSGIpNRiSlMetggByXY1akr+nYNljKzV54YDlzCU
	 tUE41f6gfD/QBYfjOgMd8+2ECAahyH0rp8GEuiEOdPRzNT4OhoiPZdQ+PlyJYUKrIH
	 K8rIxjc2Ksjvw==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 2/5] selftests/net: packetdrill: add tcp_rcv_collapse_ratelimit.pkt
Date: Sat, 14 Nov 2026 16:51:47 +0100
Message-ID: <20261114155150.235743-3-edumazet@kernel.org>
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

Fill the out-of-order queue of a socket with a small locked receive
buffer, then send 10 times a new segment landing last in the
out-of-order queue. Check that no collapse is attempted for these
segments (TcpExtTCPRcvCollapseSkipped), and that filling the hole
still lets the application read data.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 .../tcp_rcv_collapse_ratelimit.pkt            | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_ratelimit.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_ratelimit.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_ratelimit.pkt
new file mode 100644
index 000000000000..498ac753e715
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_ratelimit.pkt
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// A peer can repeatedly send an out-of-order segment that can not be
+// queued because the socket is over its receive buffer limit. Check that
+// tcp_prune_queue() does not collapse the queues for every such segment
+// (TcpExtTCPRcvCollapseSkipped), and that filling the hole still works.
+
+--mss=1000
+
+`./defaults.sh`
+
+// Small locked receive buffer: sk_rcvbuf = 20000, can not grow.
+   +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 setsockopt(3, SOL_SOCKET, SO_RCVBUF, [10000], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,wscale 0>
+  +.1 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+// Leave a hole at 1:201, then send small non-contiguous out-of-order
+// segments until the socket goes over its limit. Exactly when this
+// happens depends on skb->truesize, so ACKs are not checked here.
+   +0 < . 201:301(100) ack 1 win 257
+   +0 < . 401:501(100) ack 1 win 257
+   +0 < . 601:701(100) ack 1 win 257
+   +0 < . 801:901(100) ack 1 win 257
+   +0 < . 1001:1101(100) ack 1 win 257
+   +0 < . 1201:1301(100) ack 1 win 257
+   +0 < . 1401:1501(100) ack 1 win 257
+   +0 < . 1601:1701(100) ack 1 win 257
+   +0 < . 1801:1901(100) ack 1 win 257
+   +0 < . 2001:2101(100) ack 1 win 257
+   +0 < . 2201:2301(100) ack 1 win 257
+   +0 < . 2401:2501(100) ack 1 win 257
+   +0 < . 2601:2701(100) ack 1 win 257
+   +0 < . 2801:2901(100) ack 1 win 257
+   +0 < . 3001:3101(100) ack 1 win 257
+   +0 < . 3201:3301(100) ack 1 win 257
+   +0 < . 3401:3501(100) ack 1 win 257
+   +0 < . 3601:3701(100) ack 1 win 257
+   +0 < . 3801:3901(100) ack 1 win 257
+   +0 < . 4001:4101(100) ack 1 win 257
+   +0 < . 4201:4301(100) ack 1 win 257
+   +0 < . 4401:4501(100) ack 1 win 257
+   +0 < . 4601:4701(100) ack 1 win 257
+   +0 < . 4801:4901(100) ack 1 win 257
+   +0 < . 5001:5101(100) ack 1 win 257
+   +0 < . 5201:5301(100) ack 1 win 257
+   +0 < . 5401:5501(100) ack 1 win 257
+   +0 < . 5601:5701(100) ack 1 win 257
+   +0 < . 5801:5901(100) ack 1 win 257
+   +0 < . 6001:6101(100) ack 1 win 257
+   +0 < . 6201:6301(100) ack 1 win 257
+   +0 < . 6401:6501(100) ack 1 win 257
+   +0 < . 6601:6701(100) ack 1 win 257
+   +0 < . 6801:6901(100) ack 1 win 257
+   +0 < . 7001:7101(100) ack 1 win 257
+   +0 < . 7201:7301(100) ack 1 win 257
+   +0 < . 7401:7501(100) ack 1 win 257
+   +0 < . 7601:7701(100) ack 1 win 257
+   +0 < . 7801:7901(100) ack 1 win 257
+   +0 < . 8001:8101(100) ack 1 win 257
+
+   +0 `nstat -n`
+
+// A segment beyond all the previous ones, sent 10 times. It lands last
+// in the out-of-order queue, can not be queued, and must not trigger
+// a collapse: no new memory was added to the out-of-order queue.
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+   +0 < . 8201:8301(100) ack 1 win 257
+
+   +0 `nstat -sz | grep -q "TcpExtPruneCalled  *10 "`
+   +0 `nstat -sz | grep -q "TcpExtTCPRcvCollapseSkipped  *10 "`
+
+// Fill the hole: in-order segments are rate limited too, so the collapse
+// is skipped again. tcp_prune_ofo_queue() frees room from the tail of the
+// out-of-order queue, and 201:301 is moved to the receive queue.
+   +0 < . 1:201(200) ack 1 win 257
+   +0 read(4, ..., 1000) = 300
+
+   +0 `nstat -sz | grep -q "TcpExtPruneCalled  *11 "`
+   +0 `nstat -sz | grep -q "TcpExtTCPRcvCollapseSkipped  *11 "`
+   +0 `nstat -sz | grep -q "TcpExtOfoPruned  *1 "`
-- 
2.53.0

