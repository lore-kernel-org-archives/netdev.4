Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963055;
	b=TLALIVhTbFBb7jCKSD9WKuEu0Hqb29VgLcwEV0nUFb1mZRGM4iRCzpQxcB9vb0O+S0SU
	 TG7/dP3PknSHiUxkQBYHCh1RCyx06JOFxRekJPpYKUUg2+SLIwYCG9R1Zfu7yclug9Mrb
	 UL8p1gpklnNCnAx/WpPT4AoDSAQ9snIyGwIMTP+3bPMfHSpc+KuOIrF5k3GZT8CHW8YUD
	 1eXLlkpK1fTdcaV84iplV8gfXIv6FAybIWUTvfRfjU4ie8Z4lsVA5og+qlyixRt40NsGy
	 iXblGJCjMKFCV3fZwix1y/DTIP/mcimOWVlvsX2rjWJaOpDMoDRf6bK/Pebce1N46ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963055;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PhPJEJghdDWbERy/q3n4Hzr9Rm9mUGxMcJTwgKd0XyA=;
	b=n/wRfhQSb9Bm0phmBtKlRAIb619FeRioyW9xzvid7s7urgbtoTMpvcigGA6zexZuY05/
	 jgo6QhBIJDJad3YnviKjMpCdmPLeYS5mio+/zM8odnYcnEev7OmM6/OQB4ETkHTtp1EXM
	 HC/l7EQxb5gCr9hFrMGz3wWa/dqAjGOIwdWeBEtqPcBLYi4APuNilQQl4bRBPFxrbSpoY
	 gBy973dC5EzvNee1PKoqaUMkahEP6tnQoMyw0UY3CUJd3tAC21/5o9rXMSkVAC+/VpuaI
	 iVi55h/oLX7RUchjWiLxpGMCms/E8EinZ6wGjQkNwwUAwGqG95x4jH8ZkWTCybK0HXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhrETlcu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B7606A334
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhrETlcu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3BA1F000C5;
	Wed, 18 Nov 2026 00:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963054;
	bh=PhPJEJghdDWbERy/q3n4Hzr9Rm9mUGxMcJTwgKd0XyA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DhrETlcurKYwscaNgyVqczZ615lsfJKIuMTiYe6qyuL/KJbmGpypdZeOc7d9qYv6Z
	 m2/7yrMrq2ppviaQRFz9rsjVHqtu/0xc/l1XJrVdBUU67NBtT32L97uXlAkKy9IPcy
	 6iqBy1rxe2XAg9B4F21rX5Qy5Id5DGblfVg16iISpzdlQKYgtLetVcQ1DYL2fFOOqM
	 F56Mb14VEhYC+Pr5l/AYQWP4cx6UHhB6inhlXmSqgCOl5gdwPLW+25xZYLbgsCvDBE
	 HgTvj1kngmwyQuxFE1wiT5BaEfHCuQnPYD2USgd4N1TiSqXnaPLIM4jyapkeUtIcB3
	 v/Zgpl3YwwgiQ==
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
Subject: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
Date: Tue, 17 Nov 2026 19:50:51 -0500
Message-ID: <20261118005048.53393-4-mason@kernel.org>
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

tcp_rtt_tsopt_us() returns the timestamp clock minus TSecr as an RTT
sample, and accepts up to 2,147 s. If TSecr echoes an old timestamp,
the sample is the age of that timestamp, not an RTT.

tcp_ack_update_rtt() takes this sample for an ACK of retransmitted data.
tcp_rtt_estimator() clamps it to 120 s. The congestion control gets the
sample unclamped, in rs->rtt_us.

tcp_rcv_rtt_measure_ts() passes the sample to tcp_rcv_rtt_update(),
which computes sample << 3 in u32 arithmetic. That wraps from 536.9 s
on.

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
 net/ipv4/tcp_input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 10a23ee20e61..8de54d9804e1 100644
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

