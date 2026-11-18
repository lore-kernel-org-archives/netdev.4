Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963053;
	b=5c+JFzgjxiUZo2f5StcvUvxWgIwdffbO/06VGZhE4vQ0wDV2/lAUBjn9I2HJFfRDHTkc
	 v+6QRELz7cHPhg+QQp45eJ87dVJMOEaJTFXozKmY3mT9W4RvPINM0fLeIepU2ldACzU0g
	 vc/iF4hgIviIx+eyrJz4P/GPUEzL78D3c0B58wGtTp9rNan2RdekFIFiFDFVTvn07cNrL
	 ecYNn+qmF1SSS4IZTqdIL1MWkPNKrjAY1Hgik87DrVcbdKSqrcCicqSZ1QnY0bn4DPqx6
	 gcWwCFxvLSGGHOAVYiv1JxCEh+HsNruvR/zol5I3LrFn+oqE770N5lQsOjERJuLRfxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963053;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1HjDgetzaSV+gGD+4cusZKhiMXtdDcBis/DzzNrElPs=;
	b=Z6B/p0Jpm79RepsvuERCsXCKex+FbfXw7VTVQ3v6eYmj/iFJP7+R9o2ypsRwo62HglbW
	 9KPacY5eKZaH/CiW13LollaWf6eJNLqKk6nqHn3QxkjoaErSzZpXRzzrOB8KBErREVOsn
	 z0NK5Kt94QRUChqaML2imFoHdytUNV6x4nc85mqr+a7oin8/DLwkGWurwOUQMrN7CPY4f
	 utP6uuCQ5fcE6l6yjYwyjaz1TDnqJ8CtxNvtS8KkYUcqbDi7/NvZhs8tDsAlZlj7768Om
	 YZKTNSD8/EV/SSFvjaqUJsgQLx6nIyeh83TmJl/bhnKgZmje1jEt0PtkozHe6mlx2xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iA/s5BRk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DBC606A882
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iA/s5BRk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4815F1F000C6;
	Wed, 18 Nov 2026 00:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963053;
	bh=1HjDgetzaSV+gGD+4cusZKhiMXtdDcBis/DzzNrElPs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=iA/s5BRkO6tx/YlGi0p2X2tWyx4IF5hJIInGGfSwjugbYmQ/7EdtmYboj1rTkbsXh
	 OQCrX23wdjCioDSa6NdsiT5tPGfk4Ztjqhz3yYHtBzyR3PeWQM4GA5r4LL37A+usKi
	 8eU53c6s09QKQb4gm4kr/K2iNM7Y72J5A03rpECdZgcd0iapc52RzPeYL/KQNm0EIN
	 qzlFoTvOhIGVDHkpaabPrEG14FRh9qsnwPuotJJXmY1BixJcHoWCf7HKQH7HtkoDBf
	 QFx3WK/CnCN5rZFK3W1O3ObUlz1umb0IUTjW5CnhPD9VRk+smvFjm/PrivEHilNExL
	 iknHCk4m2Umfg==
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
Subject: [PATCH net 2/3] tcp: clamp RTT samples in tcp_rtt_estimator()
Date: Tue, 17 Nov 2026 19:50:50 -0500
Message-ID: <20261118005048.53393-3-mason@kernel.org>
In-Reply-To: <20261118005048.53393-1-mason@kernel.org>
References: <20261118005048.53393-1-mason@kernel.org>
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
sees that in TCP_INFO, in the pacing rate and in the metrics cache.

Found by code inspection (Eric Dumazet), and confirmed with LLM
generated reproducers on an unmodified kernel. Fixed by LLM, and
tested with the reproducers and existing kernel selftests.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: 740b0f1841f6 ("tcp: switch rtt estimations to usec resolution")
Signed-off-by: Chris Mason <mason@kernel.org>
---
 include/net/tcp.h    | 7 +++++++
 net/ipv4/tcp_input.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index f65697bc96c9..10a23ee20e61 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -1098,7 +1098,7 @@ static void tcp_event_data_recv(struct sock *sk, struct sk_buff *skb)
 static void tcp_rtt_estimator(struct sock *sk, long mrtt_us)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
-	long m = mrtt_us; /* RTT */
+	long m = min(mrtt_us, TCP_RTT_MAX_US); /* RTT */
 	u32 srtt = tp->srtt_us;
 
 	/*	The following amusing code comes from Jacobson's
-- 
2.55.0

