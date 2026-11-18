Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017111;
	b=Bi+Xr/PB956Bru27QnZOAI6A5q3VRgp3JUEBpWfudS4WvP7M7sWivtErGOXLtT47G44G
	 te3+ZTOW9QNAG+yrDXG0BWxRm92IZnbkUkkR9dacRc5/NlShZByK2ZvAuhpLajGIRngE7
	 CGR4uyNo9V70ww9+MFez5m6uVxcyIZA7YCJCXfKYlVBmjOh+le4gkPLzBXyRcs/m5VkFs
	 QsxqeDmUGUWeQtAo3Xb8XZ747vk6guvA1vOTyBDPvoEbx5QU2NpIOhTlYsecwR6jRVWes
	 08k4LTvxNM2s7Nkh86HWpQNeQYQF0DsKw7m3k9LkvyeZaDC0OShuVxnu7iQUZzcPiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017111;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GIUKxKU5296/hoHFETGwRSH2Q9641S/3fH/nBn1LyGE=;
	b=RJsjnar6I+jlxMLcEoCehPShRCvRQmqr4gW9dcUgy+Fpa4Q+VnBgqqwbYMoAOahhwV20
	 Rz73kwdVN6558dmNh8Cg0G0sQPgPdjw+6EZkM6HsU3OV9o5WzFoaXBbhFufAKLBhFTZLY
	 ay7pViwbVPi1ht/pU8b76OLF0y8TrrpRIQGQ4/3Ge67RDnP2hlyoNpQ/FtTCVEBMTWCSp
	 fZ0dtQTsipNLl0gswY5cS8TZ/0g8Oo7/e25T3qUBOn1LLbwdO2HD3N8pJV8DoVvqxqhvf
	 MZbzVcJgzl2XLSIa/tJw809kpoxHe9eq64fNWlPNXeJ/Eqg8JbTWTTV6h1oEoBWUUDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctVnjbZK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F3606A33B
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctVnjbZK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEA01F000CA;
	Wed, 18 Nov 2026 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017111;
	bh=GIUKxKU5296/hoHFETGwRSH2Q9641S/3fH/nBn1LyGE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ctVnjbZK6fRsgI6d+5faLDSJUFS8YRQS0hEVMnGNSnnYA+uBNtVJQ5VnQlHOurBK8
	 hPumJDJeDGxEgc271msYWcQzGpmB4gn+DDQkUWatnVW1jfZbAS6uVoTTXwodSHOdMz
	 KkFxYsHdOOA/9DRF9DjBWGxhYmegyOr1u1iISwD/tGyQgm7jGm5BSaq0VJkf2AzAN6
	 bCedNMV1WP85DRwQy5PF2OzEF5xiQNKy8RNDCS5FiS4cHZio9Y/A6JlyV76RvVYJLp
	 zaP+8xFICneXJ6jGPnJ8n6Fd9IhYkRHMxT4RBuEARN0esTsSWc/psBDEtowild3PdB
	 gTYYIbB+sOY/Q==
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
Subject: [PATCH net v2 3/5] tcp: reject RTT samples from TSecr above 120 s
Date: Wed, 18 Nov 2026 10:51:47 -0500
Message-ID: <20261118155144.18393-4-mason@kernel.org>
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

tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
the sample is the age of that timestamp, not an RTT.

tcp_ack_update_rtt() takes this sample for an ACK of retransmitted data.
tcp_rtt_estimator() clamps it to 120 s. The congestion control gets the
sample unclamped, in rs->rtt_us.

tcp_rcv_rtt_measure_ts() takes the same sample for the RTT estimate of
the receive side.

The fix used here is to reject a sample from TSecr above 120 s, for both
callers of tcp_rtt_tsopt_us().

An ACK of retransmitted data whose TSecr is more than 120 s old now
gives no RTT sample. So it no longer resets the backoff, as on a
connection without timestamps.

Found by LLM code inspection, and confirmed with LLM generated
reproducers on an unmodified kernel. Fixed by LLM, and tested with
the reproducers and existing kernel selftests.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Chris Mason <mason@kernel.org>
---

Notes:
    v1->v2: no code change, the part on sample << 3 moved to patch 4

 net/ipv4/tcp_input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e796497b84be..69e038b9389a 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -901,15 +901,16 @@ static inline void tcp_rcv_rtt_measure(struct tcp_sock *tp)
 	tp->rcv_rtt_est.time = tp->tcp_mstamp;
 }
 
+/* A sample from TSecr above TCP_RTT_MAX_US is bogus, not large. */
 static s32 tcp_rtt_tsopt_us(const struct tcp_sock *tp, u32 min_delta)
 {
 	u32 delta, delta_us;
 
 	delta = tcp_time_stamp_ts(tp) - tp->rx_opt.rcv_tsecr;
 	if (tp->tcp_usec_ts)
-		return delta;
+		return delta <= TCP_RTT_MAX_US ? delta : -1;
 
-	if (likely(delta < INT_MAX / (USEC_PER_SEC / TCP_TS_HZ))) {
+	if (likely(delta <= TCP_RTT_MAX_US / (USEC_PER_SEC / TCP_TS_HZ))) {
 		if (!delta)
 			delta = min_delta;
 		delta_us = delta * (USEC_PER_SEC / TCP_TS_HZ);
-- 
2.55.0

