Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017114;
	b=RLgEEEQRV3D0CVeMjQjk/nap4AsYxzKWtbYkDC387h6tvOO6ErtuoxRheAjmAD3YRJ5f
	 5y74P/BOYayMDjUP5mq5gBW0b0hFVCpnjgLG3LjUkX2F+8UEc6xrSOqHsy3cPPSQgZImS
	 67Ht9zZOj68Wlzb/0PiIOh2G2MwlWOhiokCYQIuADVwSBpNnS3dXpqG2Rgx+9h6XDzRtY
	 BDtZ8+L6IcWSsM1s1kv4+k4w/WJBtAHToONmB9Hxb1cXwPhuFK3RLISyhjupHSZR777V+
	 Sm+If9GZYtib5ofgIhEgHPPcF0sFTBKmNeyP5rkv6ga/zvg+OyoBTVHGezrKT4BKJAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017114;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OJBDrN2zdJBfY626xTCxR6O6ZovLR6W8RrDx3Z8o96g=;
	b=nNclGIraxNXpnHREr0ANQ0Cjr6NKkU0iVqqBdXZLKokuEkfRscPACPyZyjQmOB9uNwY/
	 mWXN2NF3dRngeOXCO4CtDdK1w180aPv3SOPYHnbFWdA5caD8ZpzaeoaNsjTz/DDzNqqd5
	 wUGm4dETpgHz2LdSj0nqCjWyFMYkj2ISSpx1ItMbL8DMy6SbUBErC5sjHw0XZU3+brwqk
	 m/IK7jWRv1BIdOZi3bJ+0kW5oUTinS8Un5T29xX0/nVUfyqejNhuDOf9Puo3enHw+FpWy
	 tZfYOFR1XixCDUrOIHxVYV8lcdbXatBgExFjolFsLeNDJU+mLwbQUVhEsM1LiiZ8H/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0Yq7MFT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D59E60A2600
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0Yq7MFT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32D21F000D1;
	Wed, 18 Nov 2026 15:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017114;
	bh=OJBDrN2zdJBfY626xTCxR6O6ZovLR6W8RrDx3Z8o96g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=f0Yq7MFT2oHU1V7CE4fCVRPuZJFcayIDxQpp3STCl5KemFO3hEDzZRpKkTcoSudo/
	 x3eYZwWeiiBq1yrLYzAXmcNRXaROhTCm8PEyTyOX5PhEpWLlzSyhRAOfONK49CPG9M
	 Uxc0s8SkDRpo/+PavEojWg3R/cc++VVVzSErLOFHWlRmFp+X142TLGtRTE9nqwSn/S
	 PwfcWcI1XO9qmch/ORSUdPh5PFUrBU11JANiksrfeEgt4PHlmMZ41JaqQyV4zn+emR
	 NdEIALwSdbbd81BxXGdOkbFpqpvWWw2OAQ1KfVVTNb0Bn+VjugesK0ZrAA5hjA1JIv
	 Scdj++DE5cCrA==
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
Subject: [PATCH net v2 5/5] tcp: bound the rto_min of a route in tcp_rto_min()
Date: Wed, 18 Nov 2026 10:51:49 -0500
Message-ID: <20261118155144.18393-6-mason@kernel.org>
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

For a route with a locked RTAX_RTO_MIN, tcp_rto_min() returns the metric
as it is, and that can be any 32-bit number of milliseconds. All other
ways to set the minimum RTO have a nonzero floor: the tcp_rto_min_us
sysctl, TCP_RTO_MIN_US and TCP_BPF_RTO_MIN.

Both ends of that range give us trouble.

With an rto_min of 0, tcp_init_metrics() can start a connection with an
RTO of 0, if the cached RTT is below one jiffy:

    icsk_rto = crtt + max(2 * crtt, tcp_rto_min(sk)) = 0

It sets icsk_rto itself, so the lower bound in __tcp_set_rto() does not
help here.

At the other end, tcp_rto_min_us() and the sum in __tcp_set_rto() are
u32 values in usec, so an rto_min of more than about 71 minutes does not
fit.

Clamp a locked rto_min to the range from one jiffy to TCP_RTO_MAX in
tcp_rto_min().

ip_metrics_convert() could reject these values instead, as it does for a
locked cwnd of 0. But a route with "rto_min lock 0" is accepted today
and mostly works, so that would break existing setups.

A route still shows the rto_min that it was given, while TCP uses one
jiffy or 120 s.

Found by LLM code inspection, and confirmed with LLM generated
reproducers on an unmodified kernel. Fixed by LLM, and tested with
the reproducers and existing kernel selftests.

Fixes: 05bb1fad1cde ("[TCP]: Allow minimum RTO to be configurable via routing metrics.")
Signed-off-by: Chris Mason <mason@kernel.org>
---

Notes:
    v1->v2: new patch

 include/net/tcp.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/net/tcp.h b/include/net/tcp.h
index a617a72ee2c6..27de546dc802 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -939,7 +939,8 @@ static inline u32 tcp_rto_min(const struct sock *sk)
 	u32 rto_min = READ_ONCE(inet_csk(sk)->icsk_rto_min);
 
 	if (dst && dst_metric_locked(dst, RTAX_RTO_MIN))
-		rto_min = dst_metric_rtt(dst, RTAX_RTO_MIN);
+		rto_min = clamp(dst_metric_rtt(dst, RTAX_RTO_MIN),
+				1, TCP_RTO_MAX);
 	return rto_min;
 }
 
-- 
2.55.0

