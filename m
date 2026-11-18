Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963052;
	b=ocgFjb7kTsIMmxwh1EfEAv+8k27FqQW7vs9oGs9IAOj9zMaXK8TwM57XKla79yMJ6EJ+
	 hdX6epSRj9pY56bC4G+shpXUEOS/VDmOgLdKIeEF15Kafg+Rpg7o2vhycOojHMrh7SEWE
	 F/1H6YUmfVPJGJ8WEDCF/SC+Wj4XrCUpMKVeH23jcTg9k5xP2mtKHtchgVgLjnEAlOApE
	 Zl5nH6KAlsyhPnLP0JjJvQkRhiGCwC+ZYzsbClNzXVzkJlLcsY9UKMGM9mIQmuonhPCma
	 RQmeGKZkB/KLYRHEWkJAaOtyzxF4t9LNY977B13kDS6un/dXGVSR+ofPb+jb8sbVUNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963052;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=96Z4tbayucuLlpWHOziwBs4gc/Rk8fuDbtEuxO5NcME=;
	b=ZntNIlPfBXPhdkoDVZhD2wFwOcHH7Ispdex6z7Hfpreq2LU2codhdAaWz5s1aULw3l6J
	 VGOU5XRS7cvOURvliq8BqYqAeWAfkYz05ASZGtOoRelrp1VXAhh7PfaqvAsat5e5LuTQV
	 senPmOiUhNC+riIpp6DZa9Ns0o/OnU0ZB5tCEQQKZlATin1t9iJwbLX3pv/nMxFGB5hT8
	 MWegX0glOX1YjPyG4a7In8aNdpTm8MfUFL+2bv8Q11gK1rV2mWJ3rL34DtFcQsQsd84gf
	 lVZjnOadGIgI1wsbzUwKio5deE6L2Svrg+5/iZludgLKw7nW2b3BKmKFXWIrAGm22KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Yx/yw7CW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B39606A336
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yx/yw7CW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE13F1F000C5;
	Wed, 18 Nov 2026 00:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963052;
	bh=96Z4tbayucuLlpWHOziwBs4gc/Rk8fuDbtEuxO5NcME=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Yx/yw7CW+PyY2HVbXpJJQPFkKoj5n3VT6hCOIZW5PkCw7szM97oQzrhZquUD/tZu6
	 2mNsvPOJYcMXF1VOpVT2Frkjlkbz0qVIeg44S3pcSR1joAB7Ju70Y6lCkbxswsTsVu
	 gqnxvCbR0XMo0QkZX5xf+h7oDI3o7Jpy6MduOwVXgeowtZZwiKlECTS/JLWS541e2P
	 TgIpfEgdNyiiPMbc5XOyOUS1PJHASVr5xTZlGK6rCulu+t1hBvg3l3TBocWScGAa6G
	 bqh9xFen42rhka//y+93gNjHVGJEK7hlb5Bi3B7RMSbMpAWbEZG8kEwFNYErix7gN7
	 mCx3+62Ua9ScA==
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
Subject: [PATCH net 1/3] tcp: don't let __tcp_set_rto() return 0
Date: Tue, 17 Nov 2026 19:50:49 -0500
Message-ID: <20261118005048.53393-2-mason@kernel.org>
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

__tcp_set_rto() computes the RTO as (srtt_us >> 3) + rttvar_us, in u32
arithmetic and with no lower bound. A comment in tcp_set_rto() says that
the algorithm guarantees an RTO above TCP_RTO_MIN. But tcp_rto_min() is
only applied to rttvar_us, so that guarantee is lost if the sum wraps.

tcp_retransmit_timer() backs off by doubling icsk_rto, so the backoff
only works if icsk_rto is nonzero.

Of the three callers, only the thin-stream branch of
tcp_retransmit_timer() clamps the result. tcp_set_rto() and
tcp_ld_RTO_revert() store it in icsk_rto with an upper bound only.

The fix used here is to keep the result of __tcp_set_rto() from 0, for
all of its callers, so that the backoff recovers from any state of the
RTT estimator.

Found by LLM code inspection, and confirmed with LLM generated
reproducers on an unmodified kernel. Fixed by LLM, and tested with
the reproducers and existing kernel selftests.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Chris Mason <mason@kernel.org>
---
 include/net/tcp.h    | 4 +++-
 net/ipv4/tcp_input.c | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index 5c9203aae834..6a714189bcc7 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -910,7 +910,9 @@ static inline void tcp_bound_rto(struct sock *sk)
 
 static inline u32 __tcp_set_rto(const struct tcp_sock *tp)
 {
-	return usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
+	u32 rto = usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
+
+	return max(rto, 1U);
 }
 
 static inline unsigned long tcp_reqsk_timeout(struct request_sock *req)
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index a2074a1af422..f65697bc96c9 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -1221,8 +1221,9 @@ void tcp_set_rto(struct sock *sk)
 	 *    with correct one. It is exactly, which we pretend to do.
 	 */
 
-	/* NOTE: clamping at TCP_RTO_MIN is not required, current algo
-	 * guarantees that rto is higher.
+	/* NOTE: clamping at tcp_rto_min() is not required, tcp_rtt_estimator()
+	 * applies it to rttvar_us. But rto must never be 0, which exponential
+	 * backoff could not leave: __tcp_set_rto() takes care of that.
 	 */
 	tcp_bound_rto(sk);
 }
-- 
2.55.0

