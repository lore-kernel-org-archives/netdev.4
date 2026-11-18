Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022825;
	b=P7f7r+bP06pb9y/gfCnDozvwbvppDJthjKrtxIy4xwzlUI8dJYLyO6gr86vRkGPpCtRf
	 qR7RnzkKzQ1+KqJURcy1LDUngWCbKf9vr02wy8A0I+DPC8FtlIvecRvTM2sA38/fauxhm
	 eBisg8PeFd4FL0W3EvZFGr4iDyGhABoQjjNMq+LrSvcTLVZZo59+zMw3awbdScZVQQQGr
	 v3kQSoNHTHUoy7WukXNytzZllnTalcVLVg8o2ccP7CPszL7YiFJvcsIHGgIs+rvCRByn4
	 2ZQD5VVDJjLbe+8ZwHs1xmE9MnDrMcNSF4UiOFySnmKDJPMbbMyXHRIK5eFeNWkUZkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022825;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KFFn/WCEGPLX6zwthexMeWkVLi7QjqutGiq+pXgO3pc=;
	b=Zyd8GxA9vMT4t8rUw1ZhvGwLi+OAzqBPhQva3shwbMInE875d7qq5WB1nkWOeqc+hMf5
	 H2ScZpQUtDoWLeYr80ChrKvJpnvHm376xOUgui/pL01yTulDzSMG8vxd8NG5hRDDBNIB8
	 YTaAVwyJRJla6K5IVyphEcLdFPh09/qXbYxVDO5yUS6LYYYwhTl+iSCQmRzo37ybIURC/
	 XahCEqoATx5B+FfpqxauyK+zNspw6SdS+4VXAaqAw7lVu5fn6IfXNi35vACu90vqOpAJB
	 Iu35v8nnrC8fHWGcHkpj1a1kDk/7nX+LV23FyeLZ4e5C5fFxIO6wnx6gm5FxyfONFuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5VDV5fO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD7606A775
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l5VDV5fO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661531F000C4;
	Wed, 18 Nov 2026 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022825;
	bh=KFFn/WCEGPLX6zwthexMeWkVLi7QjqutGiq+pXgO3pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l5VDV5fO45qojyRgIEqYuXgZARP8DVJhVRnf2ZM1NTq/i8bbOWlSwEZt5cd2q8zsc
	 6VOOS0lva/ude0Df1CD/ky3nwNE9cGEWwYrZ8xsnD5Hy0hSQcC61/TmmciF4ET9wQp
	 wJ0lJJwE/7J319B/LWKG834DATbXql3LcR8l9FoDTcQeYX4TnFO1NlGwRPs3bIPhLm
	 JGMG4U1BUbnbkgNyJXnmxynxeF9OzjWWVWWKFbXYnPjsaU0UfRNE/pS8f6fpOdqV25
	 gpWPuB+aYzeJB4UNmTJh6V2kEgHmyQLbUHnGiKjXdkf516+fC0vPpJIPC3/1Tbl570
	 ZR4yG6Vmzc17Q==
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
Subject: [PATCH net-next 2/2] selftests/net: packetdrill: add tests for ACK of ISS
Date: Wed, 18 Nov 2026 18:26:54 +0100
Message-ID: <20261118172654.1267071-3-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118172654.1267071-1-edumazet@kernel.org>
References: <20261118172654.1267071-1-edumazet@kernel.org>
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

Once a connection is established, a segment with SEG.ACK == ISS
acknowledges bytes we never sent. It must be dropped and a challenge
ACK sent back (RFC 5961 Section 5.2), regardless of which side
opened the connection.

Add four tests covering the ways a socket can be established:

- tcp_rfc5961_ack-iss-server.pkt: passive open
- tcp_rfc5961_ack-iss-client.pkt: active open
- tcp_rfc5961_ack-iss-fastopen-client.pkt: active open, data in SYN
- tcp_rfc5961_ack-iss-simultaneous-open.pkt: crossed SYNs

Each test also checks that SEG.ACK == ISS + 1 is still silently
accepted as a genuine old ACK.

Only the passive open test passes without the previous patch.

Link: https://mailarchive.ietf.org/arch/msg/tcpm/ym6lb-UkrW2298LRnTLxCysoo0g/
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 .../tcp_rfc5961_ack-iss-client.pkt            | 46 +++++++++++++++++++
 .../tcp_rfc5961_ack-iss-fastopen-client.pkt   | 40 ++++++++++++++++
 .../tcp_rfc5961_ack-iss-server.pkt            | 45 ++++++++++++++++++
 .../tcp_rfc5961_ack-iss-simultaneous-open.pkt | 42 +++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-client.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-fastopen-client.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-server.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-simultaneous-open.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-client.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-client.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..50c0638a5219d8389ab433765f9f65fa0f0a8ffc
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-client.pkt
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Active open: once the connection is established, SND.UNA is at least
+// ISS + 1.  A segment with SEG.ACK = ISS acknowledges nothing we ever
+// sent past the SYN, and the SYN itself can not be acked "again" as a
+// stale duplicate: no ACK carrying ISS was ever valid on this
+// connection.  It must be treated like any other ACK for bytes we never
+// sent (RFC 5961 Section 5.2): dropped, and a challenge ACK sent back.
+//
+// The SYN consumes one sequence number but is not a payload byte, so it
+// must not widen the range of acceptable old ACKs.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_invalid_ratelimit=0
+`
+
+   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+  +0 fcntl(3, F_GETFL) = 0x2 (flags O_RDWR)
+  +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
+  +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+  +0 > S 0:0(0) <...>
++.01 < S. 0:0(0) ack 1 win 10000 <mss 1000,nop,nop,sackOK,nop,wscale 0>
+  +0 > . 1:1(0) ack 1
+
+// SND.UNA = SND.NXT = ISS + 1, no payload acked yet.
+// SEG.ACK = ISS must trigger a challenge ACK.
++.01 < . 1:1(0) ack 0 win 10000
+  +0 > . 1:1(0) ack 1
+
+// Get 1000 bytes of payload acked.
+  +0 write(3, ..., 1000) = 1000
+  +0 > P. 1:1001(1000) ack 1
++.01 < . 1:1(0) ack 1001 win 10000
+
+// SND.UNA = ISS + 1001.  Old ACKs in [ISS + 1, ISS + 1001] are valid
+// duplicates, but SEG.ACK = ISS is still below anything the peer could
+// have legitimately sent.
++.01 < . 1:1(0) ack 0 win 10000
+  +0 > . 1001:1001(0) ack 1
+
+// SEG.ACK = ISS + 1 is a genuine old ACK: silently accepted, no
+// challenge ACK.  The next packet on the wire must be our new data.
++.01 < . 1:1(0) ack 1 win 10000
++.01 write(3, ..., 1000) = 1000
+  +0 > P. 1001:2001(1000) ack 1
++.01 < . 1:1(0) ack 2001 win 10000
diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-fastopen-client.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-fastopen-client.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..5e8c7f8ee7ddb812761dd5dbc72e2f01ff46c644
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-fastopen-client.pkt
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Fast Open variant of tcp_rfc5961_ack-iss-client.pkt.
+//
+// The SYN carries data, and the SYN-ACK acks both the SYN and its
+// payload.  SEG.ACK = ISS must still trigger a challenge ACK, while
+// SEG.ACK = ISS + 1 (SYN acked, payload not yet) is a valid old ACK.
+
+`./defaults.sh
+ ./set_sysctls.py /proc/sys/net/ipv4/tcp_timestamps=0 \
+		  /proc/sys/net/ipv4/tcp_invalid_ratelimit=0`
+
+// Cache warmup: send a Fast Open cookie request
+    0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+   +0 sendto(3, ..., 0, MSG_FASTOPEN, ..., ...) = -1 EINPROGRESS (Operation is now in progress)
+   +0 > S 0:0(0) <mss 1460,nop,nop,sackOK,nop,wscale 8,FO,nop,nop>
+   +0 < S. 123:123(0) ack 1 win 14600 <mss 1460,nop,nop,sackOK,nop,wscale 6,FO abcd1234,nop,nop>
+   +0 > . 1:1(0) ack 1
+   +0 close(3) = 0
+   +0 > F. 1:1(0) ack 1
+   +0 < F. 1:1(0) ack 2 win 92
+   +0 > . 2:2(0) ack 2
+
+// SYN + 500 bytes of payload, all acked by the SYN-ACK.
+   +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 4
+   +0 sendto(4, ..., 500, MSG_FASTOPEN, ..., ...) = 500
+   +0 > S 0:500(500) <mss 1460,nop,nop,sackOK,nop,wscale 8,FO abcd1234,nop,nop>
+ +.01 < S. 0:0(0) ack 501 win 14600 <mss 1460,nop,nop,sackOK,nop,wscale 6>
+   +0 > . 501:501(0) ack 1
+
+// SND.UNA = ISS + 501.  SEG.ACK = ISS must trigger a challenge ACK.
+ +.01 < . 1:1(0) ack 0 win 1000
+   +0 > . 501:501(0) ack 1
+
+// SEG.ACK = ISS + 1 is a genuine old ACK: silently accepted, no
+// challenge ACK.  The next packet on the wire must be our new data.
+ +.01 < . 1:1(0) ack 1 win 1000
+ +.01 write(4, ..., 100) = 100
+   +0 > P. 501:601(100) ack 1
+ +.01 < . 1:1(0) ack 601 win 1000
diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-server.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-server.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..508380ff1e72d2a31b13471989f0cb0f5377011a
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-server.pkt
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Passive open counterpart of tcp_rfc5961_ack-iss-client.pkt.
+//
+// Once the connection is established, a segment with SEG.ACK = ISS
+// acknowledges bytes we never sent.  It must be dropped and a challenge
+// ACK sent back (RFC 5961 Section 5.2), whatever amount of payload was
+// acked so far.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_invalid_ratelimit=0
+`
+
+   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+  +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+  +0 bind(3, ..., ...) = 0
+  +0 listen(3, 1) = 0
+
+  +0 < S 0:0(0) win 10000 <mss 1000,nop,nop,sackOK,nop,wscale 0>
+  +0 > S. 0:0(0) ack 1 <...>
++.01 < . 1:1(0) ack 1 win 10000
+  +0 accept(3, ..., ...) = 4
+
+// SND.UNA = SND.NXT = ISS + 1, no payload acked yet.
+// SEG.ACK = ISS must trigger a challenge ACK.
++.01 < . 1:1(0) ack 0 win 10000
+  +0 > . 1:1(0) ack 1
+
+// Get 1000 bytes of payload acked.
+  +0 write(4, ..., 1000) = 1000
+  +0 > P. 1:1001(1000) ack 1
++.01 < . 1:1(0) ack 1001 win 10000
+
+// SND.UNA = ISS + 1001.  Old ACKs in [ISS + 1, ISS + 1001] are valid
+// duplicates, but SEG.ACK = ISS is still below anything the peer could
+// have legitimately sent.
++.01 < . 1:1(0) ack 0 win 10000
+  +0 > . 1001:1001(0) ack 1
+
+// SEG.ACK = ISS + 1 is a genuine old ACK: silently accepted, no
+// challenge ACK.  The next packet on the wire must be our new data.
++.01 < . 1:1(0) ack 1 win 10000
++.01 write(4, ..., 1000) = 1000
+  +0 > P. 1001:2001(1000) ack 1
++.01 < . 1:1(0) ack 2001 win 10000
diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-simultaneous-open.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-simultaneous-open.pkt
new file mode 100644
index 0000000000000000000000000000000000000000..17a545712a929760332a0cbceabb00ef1a38f234
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_ack-iss-simultaneous-open.pkt
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Simultaneous open variant of tcp_rfc5961_ack-iss-client.pkt.
+//
+// Our SYN is acked by the SYN-ACK of the peer while we are in SYN-RECV
+// state.  Once established, SEG.ACK = ISS must trigger a challenge ACK.
+
+`./defaults.sh
+sysctl -q net.ipv4.tcp_invalid_ratelimit=0
+`
+
+   0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
+  +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
+  +0 > S 0:0(0) <...>
+
+// Crossed SYN.
++.01 < S 0:0(0) win 10000 <mss 1000,nop,nop,sackOK,nop,wscale 0>
+  +0 > S. 0:0(0) ack 1 <...>
++.01 < S. 0:0(0) ack 1 win 10000 <mss 1000,nop,nop,sackOK,nop,wscale 0>
+// The SYN part of this SYN-ACK is a duplicate, and is DSACKed.
+  +0 > . 1:1(0) ack 1 <nop,nop,sack 0:1>
+  +0 %{ assert tcpi_state == TCP_ESTABLISHED, tcpi_state }%
+
+// SND.UNA = SND.NXT = ISS + 1, no payload acked yet.
+// SEG.ACK = ISS must trigger a challenge ACK.
++.01 < . 1:1(0) ack 0 win 10000
+  +0 > . 1:1(0) ack 1
+
+// Get 1000 bytes of payload acked.
+  +0 write(3, ..., 1000) = 1000
+  +0 > P. 1:1001(1000) ack 1
++.01 < . 1:1(0) ack 1001 win 10000
+
++.01 < . 1:1(0) ack 0 win 10000
+  +0 > . 1001:1001(0) ack 1
+
+// SEG.ACK = ISS + 1 is a genuine old ACK: silently accepted, no
+// challenge ACK.  The next packet on the wire must be our new data.
++.01 < . 1:1(0) ack 1 win 10000
++.01 write(3, ..., 1000) = 1000
+  +0 > P. 1001:2001(1000) ack 1
++.01 < . 1:1(0) ack 2001 win 10000
-- 
2.53.0

