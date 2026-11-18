Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022822;
	b=2GleQL5GxIXm8q0VFQPUtPbdBRBWyIS59A28kS2KNl6SdpsWm25ao8I0h1cl9b87D+vr
	 ONH/f4o3vBp1gArvj3946oJ+8Gi9ju+Tvq+ro/jZqOb/UlbWT/9YxZy/7FjEhMmKTwXCp
	 lSYk3eVfNx+i3QQkuYGz08i1hisY21xud856i/x3Mg6TSrGl0MgDB0ZlViFqWm4XSTbao
	 Kz++OJ8pAvrGMZimAXPqriDf+iutAZrgpv6f1s57ElOtuQlYgO1MXzFeuMzBFWD/ii4gE
	 qAC1drrEMcpWnD4zNsUWinwavydFiJCL1ldNh7OpaaBQAvRId8nbpKnzsCiIsMqkJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022822;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GGhYkGebGexfGExsMQfltWE8JbYR5fBAohiVWSo1Fhk=;
	b=AWGqRlVriES/wjdi/HJbRxiD6rNHBUK8N0UQf4hTh5byfjk/L1faz1kCqcNX+g8SIJ2W
	 y0CeFquQwgHEbu8P5nU7vSGvsemwAVI+0Tccz9eUXuLAHfTc+PxioY1ylQayN5PfRdHV3
	 1odyMFTW8kOu9Jb7Vbwxa9DrxrBvjl7vikYJamMTUtdtOpZzgu5oz8wjv/HLbo9FnkxZz
	 732FF94/XwKEwPkeY+OWNwISnOEfautWngn1Q6ztWyzX0PoEdbInyCt/7Bn1TIBCpRKMP
	 thlrf2jdXjrL+aYiLH0Kdab6hcsUrs3XcJsL+elHyUVpMyhrkoa1ZI41XIY6w8G+5Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHELRVvR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC30606A76D
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHELRVvR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1DE1F000C4;
	Wed, 18 Nov 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022822;
	bh=GGhYkGebGexfGExsMQfltWE8JbYR5fBAohiVWSo1Fhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fHELRVvReToQfCU9wVfxnSZjVjwAg0qwC7egXwtHFFz+CFACnYx+udxlmCi3YRBKx
	 jMrihPHbShQyXJId5QwIvTsOCI2xKlfYKrOaXuPELI7mUjIBzwPfrBrxy+TwzpM1qL
	 4cR7VIlfDrXkKwzrmV7EV9ZKNrF4+FTgKBLqyw3ND81K4FSzcosbAIfO9MmMtI2rOV
	 Ardk7kKWIIxf8lc/YQvER0px3JH7HSTY7ZNq3VXw2c2PaeQDU7RVD3Ak5uhVjRo5xx
	 QHNFFKKNutw1DF57DPvF4yyyU6BBxy4S1RR6Myv3pebCkMidTa2HTPF7+sWe0uoBtY
	 hy6ZAQINFiXwA==
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
Subject: [PATCH net-next 1/2] tcp: do not accept ACK of our ISS on active opens
Date: Wed, 18 Nov 2026 18:26:53 +0100
Message-ID: <20261118172654.1267071-2-edumazet@kernel.org>
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

Michael Tuexen asked on the tcpm list [1] whether, after a completed
handshake, a segment with SEG.ACK == ISS is a duplicate ACK or a ghost
ACK. Flavius-Romeo Mazilu answered that Linux behaves differently
depending on which side opened the connection:

- passive opens drop it and send a challenge ACK,
- active opens accept it as an old duplicate ACK.

This comes from commit 3d501dd326fb ("tcp: do not accept ACK of bytes
we never sent"), which bounds the range of acceptable old ACKs
by tp->bytes_acked.

On active opens (including Fast Open and simultaneous opens),
tp->snd_una starts at ISS and the ACK of our SYN goes through
tcp_snd_una_update(), so tp->bytes_acked counts the SYN.
On passive opens, tp->snd_una starts at ISS + 1 and the SYN-ACK
is not counted.

The SYN is not a payload byte, and no valid ACK ever carried ISS:
the lowest ACK a peer can send on a synchronized connection is ISS + 1.

Counting the SYN widens the acceptable range by one sequence number.

tp->bytes_acked is exported to user space (tcpi_bytes_acked,
bpf_tcp_sock, bpf_sock_ops) and tools/testing/selftests/bpf expects
the SYN to be counted, so leave it unchanged.

Instead, remember in a new bit that our SYN was counted,
and subtract it in the tcp_ack() check.

Mazilu's observation was confirmed by code inspection and with
packetdrill on an unmodified kernel: after an active open, a segment
with SEG.ACK == ISS is silently accepted, where a passive open
answers with a challenge ACK.

Tested with the packetdrill tests added in the following patch,
which fail on the active side before this patch, and with the other
tests in tools/testing/selftests/net/packetdrill.

[1] https://mailarchive.ietf.org/arch/msg/tcpm/ZbjDTFQSHeKSVHAToyAnKBr3TpU/

Fixes: 3d501dd326fb ("tcp: do not accept ACK of bytes we never sent")
Reported-by: Flavius-Romeo Mazilu <flavius.mazilu@stud.acs.upb.ro>
Closes: https://mailarchive.ietf.org/arch/msg/tcpm/ym6lb-UkrW2298LRnTLxCysoo0g/
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 Documentation/networking/net_cachelines/tcp_sock.rst |  1 +
 include/linux/tcp.h                                  |  3 ++-
 net/ipv4/tcp.c                                       |  1 +
 net/ipv4/tcp_input.c                                 | 10 ++++++++--
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/net_cachelines/tcp_sock.rst b/Documentation/networking/net_cachelines/tcp_sock.rst
index 554e8c14a401f27ec5a6c109877bb122942bade9..78f74eb7699063022adc5d4524a82466c82e4758 100644
--- a/Documentation/networking/net_cachelines/tcp_sock.rst
+++ b/Documentation/networking/net_cachelines/tcp_sock.rst
@@ -59,6 +59,7 @@ u8:2                          fastopen_client_fail
 u8:4                          nonagle                 read_write                              tcp_skb_entail,tcp_push_pending_frames
 u8:1                          thin_lto
 u8:1                          recvmsg_inq                                 read_mostly         tcp_recvmsg
+u8:1                          bytes_acked_syn                             read_mostly         tcp_ack
 u8:1                          repair                  read_mostly                             tcp_write_xmit
 u8:1                          frto
 u8                            repair_queue
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index e6b79cf4798f497ea43bb987431da2c797ee3086..13a192cc3c62e219235e0610924fe460148be19c 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -235,7 +235,8 @@ struct tcp_sock {
 		tcp_usec_ts : 1, /* TSval values in usec */
 		is_sack_reneg:1,    /* in recovery from loss with SACK reneg? */
 		is_cwnd_limited:1,/* forward progress limited by snd_cwnd? */
-		recvmsg_inq : 1;/* Indicate # of bytes in queue upon recvmsg */
+		recvmsg_inq : 1,/* Indicate # of bytes in queue upon recvmsg */
+		bytes_acked_syn:1;/* bytes_acked includes our SYN */
 #ifdef CONFIG_BPF
 	u32	bpf_tcp_ops_flags;
 #define BPF_TCP_OPS_TEST_FLAG(TP, ARG) \
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index d510e982dcea9830442d4c7afedb67deb3c28115..498889efe2e3323484b9d30842d9f16475165e4a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -3472,6 +3472,7 @@ int tcp_disconnect(struct sock *sk, int flags)
 	tp->segs_out = 0;
 	tp->bytes_sent = 0;
 	tp->bytes_acked = 0;
+	tp->bytes_acked_syn = 0;
 	tp->bytes_received = 0;
 	tp->bytes_retrans = 0;
 	tp->data_segs_in = 0;
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index d35048c363be5cb985ba1efb9dab24c9aaab4fda..6cf6cb3336b23b065b93d747e0565475ce4c3d0c 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -3712,6 +3712,8 @@ static int tcp_clean_rtx_queue(struct sock *sk, const struct sk_buff *ack_skb,
 		} else {
 			flag |= FLAG_SYN_ACKED;
 			tp->retrans_stamp = 0;
+			/* tcp_snd_una_update() counted our SYN. */
+			tp->bytes_acked_syn = 1;
 		}
 
 		if (!fully_acked)
@@ -4333,8 +4335,12 @@ static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
 	if (before(ack, prior_snd_una)) {
 		u32 max_window;
 
-		/* do not accept ACK for bytes we never sent. */
-		max_window = min_t(u64, tp->max_window, tp->bytes_acked);
+		/* Do not accept ACK for bytes we never sent.
+		 * Our SYN, if counted in bytes_acked, is not one of them:
+		 * no valid ACK ever carried ISS.
+		 */
+		max_window = min_t(u64, tp->max_window,
+				   tp->bytes_acked - tp->bytes_acked_syn);
 		/* RFC 5961 5.2 [Blind Data Injection Attack].[Mitigation] */
 		if (before(ack, prior_snd_una - max_window)) {
 			if (!(flag & FLAG_NO_CHALLENGE_ACK))
-- 
2.53.0

