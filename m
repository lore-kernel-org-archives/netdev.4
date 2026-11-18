Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017110;
	b=1y4G6AjpSoAIe9Jbb9QO6qt+z3gO+Vn7vl0pI7veD+wIbu10/u/6lPQkmowWkMQPZG8W
	 0cFT8DXMMUdEqOkL89zaG+EelvkLaNXZfjL3VCJRRjl24MiIJWZlbAXUQfdOnCgR4kTgo
	 FB3+hUeqPqD1VWB+TlCcJLpRrx60d2zf/nkP0zMJifMAHc/ZbBw4EOHRcNlJ0tp0SvIYU
	 /bVc8AMMbeBLzn2viQtjaNcUC/sqFF9dy8NiONBOKoFBSffeT8uSJxfOoPdRzBBOY7oWR
	 JUfVA8PsmuROd8TqjRrZMO+qOc8m8DeWBNiNWaTqi/B1PbNdOiNiIR8Mj/BqU4lP2Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017110;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZzTxHOsUWDby8PmSKvHwmpqNnmBVOU0OgC6D9KMbh0M=;
	b=JaWo10ykWy3mxYjs41ceoezzucUqkoAw8En22PIAlX1Mdi4hkfhvNZ10HD6xas4FaIsR
	 FJH3x84ZJfj0aan/ilwoUDa/9oeH0ziC7YhOx4OoZ5kzMeFa31Ztr3NCgo2zqrYUaUfOn
	 xI8LPD7sn/HpKRqJRhiapn2QXaJ2BwSLnCvWSExQ/ebIK/nqE41ZmjBIMtBiLVl0MtX7U
	 ewGCCtRDBjEov87Qar/GSul+c4rTJCjuLLkMiQMY4efz5OtY1OX/ypnpfT/zMBbJj90HT
	 5s0O5ueEf1lR7MJ99qau/6MZPZjhPEUpOeEtRBfkgpWEa9I+BwWYuG7yqGPkFK/UbUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ed2vMZhz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC08606A333
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ed2vMZhz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19371F000CB;
	Wed, 18 Nov 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017109;
	bh=ZzTxHOsUWDby8PmSKvHwmpqNnmBVOU0OgC6D9KMbh0M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ed2vMZhzcDHskO17SzCdga0gBT2exwyR3rxataaLtKcH65ItNpW3nLOoYG7Vnf+mU
	 uXFD44Lm0JcsrocP9vZC0cFB1WWuYoLoxbtr2TE6rakkrLsKnadNf5eR1GoEfleRAQ
	 ri/mzOy0E7DEdL39mnHAjdYr++ILfi76bWIOvsS4ePQq5fpra/IeyPOK62vbXIY+X5
	 P4N6mZ6VRdqBs2PLspDwVMdnPruhWIRlyzAp5nG5bnX5uXSP7CR12K2pOq+BdIXY8u
	 1czzw7r5cqSk0F99fh12ruDgqWYiHRvzedDY5XlnaldDzZPf0urO7hpIZ1AP5zwfyJ
	 VL8Jhiyrg1y7Q==
From: Chris Mason <mason@kernel.org>
To: mason@kernel.org,
	edumazet@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	josef@toxicpanda.com,
	netdev@vger.kernel.org
Subject: [PATCH net v2 2/5] tcp: clamp RTT samples in tcp_rtt_estimator()
Date: Wed, 18 Nov 2026 10:51:46 -0500
Message-ID: <20261118155144.18393-3-mason@kernel.org>
In-Reply-To: <20261118155144.18393-1-mason@kernel.org>
References: <20261118155144.18393-1-mason@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tcp_rtt_estimator() keeps its state in u32 fields, in microseconds.
srtt_us holds 8 times the smoothed RTT, so it wraps at an RTT of
536.9 s. Samples can be larger than that:

- For an ACK of retransmitted data, the sample is the timestamp clock
  minus TSecr, and tcp_rtt_tsopt_us() accepts a sample of up to 2,147 s.

- For a SACK of a segment that was never retransmitted, the sample is
  the age of that segment.

Samples from TSecr could wrap these fields when they still held jiffies.
The age of a segment can wrap them since commit 740b0f1841f6 ("tcp:
switch rtt estimations to usec resolution"), which took the wrap of the
smoothed RTT from 2^29 jiffies to 2^29 us.

The fix used here is to clamp each sample to 120 s, the largest possible
RTO, in tcp_rtt_estimator(), where the samples of all sources meet.

The smoothed RTT now saturates at 120 s. A path with a larger real RTT
sees that in TCP_INFO, in the pacing rate and in the metrics cache. BPF
programs on the RTT callback get the clamped sample too.

Found by code inspection (Eric Dumazet), and confirmed with LLM
generated reproducers on an unmodified kernel. Fixed by LLM, and
tested with the reproducers and existing kernel selftests.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 740b0f1841f6 ("tcp: switch rtt estimations to usec resolution")
Signed-off-by: Chris Mason <mason@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---

Notes:
    v1->v2: clamp mrtt_us itself, so BPF gets the clamped sample (Eric)

 include/net/tcp.h    | 7 +++++++
 net/ipv4/tcp_input.c | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 6a714189bcc7..a617a72ee2c6 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -164,6 +164,13 @@ static_assert((1 << ATO_BITS) > TCP_DELACK_MAX);
 
 #define TCP_TIMEOUT_MIN_US (2*USEC_PER_MSEC) /* Min TCP timeout in microsecs */
 
+/* Max RTT sample for tcp_rtt_estimator(). srtt_us holds 8 times the RTT, and
+ * mdev_us and rttvar_us up to 4 times its deviation, all in u32, like the sum
+ * in __tcp_set_rto(). A larger sample could not raise the RTO, which
+ * TCP_RTO_MAX bounds.
+ */
+#define TCP_RTT_MAX_US	(TCP_RTO_MAX_SEC * USEC_PER_SEC)
+
 #define TCP_TIMEOUT_INIT ((unsigned)(1*HZ))	/* RFC6298 2.1 initial RTO value	*/
 #define TCP_TIMEOUT_FALLBACK ((unsigned)(3*HZ))	/* RFC 1122 initial RTO value, now
 						 * used as a fallback RTO for the
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index f65697bc96c9..e796497b84be 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -1098,8 +1098,11 @@ static void tcp_event_data_recv(struct sock *sk, struct sk_buff *skb)
 static void tcp_rtt_estimator(struct sock *sk, long mrtt_us)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
-	long m = mrtt_us; /* RTT */
 	u32 srtt = tp->srtt_us;
+	long m; /* RTT */
+
+	mrtt_us = min(mrtt_us, TCP_RTT_MAX_US);
+	m = mrtt_us;
 
 	/*	The following amusing code comes from Jacobson's
 	 *	article in SIGCOMM '88.  Note that rtt and mdev
-- 
2.55.0

