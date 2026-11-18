Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017108;
	b=nniNFHMPV/l5JheoVRNpr2lhzB21yZoyaPt65sZmf5hnGPjnSHEuoxIwn5NUTVxMoTdZ
	 8zY4LBDTs8SoD6DNIsvuptEFw1j6Gtf3X+rioVtqskjj6DneAD9cRJMZAlEmTp/GUl3bE
	 eVazh6GwXbLUTnHMUdjkLvpE+LBJch+nZe9fED5MdTnFYlZEivNiRGgYIYaoXjVEpng8I
	 kZh0xDTKPR50A910xAM+0kymA7Z391zYMiMBdYCczE6gEdWb/rzerhfLjKrLPCjoyZBU/
	 /ekQeweAc99XDCepuABe7aEpfYRtPyok6UxMo4fZQNiP4CCIqYSGOuH/wp+08v90mlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017108;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=K7WYcp9i4/hNiVZxll8EIyz/JFSKfhGuhldKZnIWRsE=;
	b=PfStOB/NXenh5cUWVusQTwJNKXWENaCIz/vqjhLgGyf8XFufxOXzaRmsVT9CYd8bCVSz
	 wETT3Q8JID2VlTnQhyn8Qlyt2FIVNvsjqfLWpvTtU8ict2WS9eeFL8WzZt7RBomIdFJfx
	 J6mM5/OHO8gOQICPUvU2DC1G4BSJGdCpYaSAXSH5MX3t4MCOfjd2NxJ4ZrXdOZyVwqeSv
	 30vwSha73isE6RaTzRhi3L9aLZQ0V04nkF4O2aDGcpLcKlDlYayPk/XBFu96ipwpwAPoP
	 XeFwvQDOsM60cFexgKxIcAuipVGWtexvXpVGTOzohHsIS24dnEfa2HEYDdp2LUi+MZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRwRH10F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE846606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRwRH10F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C511F000C5;
	Wed, 18 Nov 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017108;
	bh=K7WYcp9i4/hNiVZxll8EIyz/JFSKfhGuhldKZnIWRsE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DRwRH10FeM3PjVmIXug32gumQ7bqwpPecQuF/MSalUhnqMYBCy+M49ikkDyAnNmGp
	 y39Vjn8un1FTlHtMt9KIMndkojM2oqDr/UotqmHhtzSc6ssdgDoXhIbmeiurhsBQNz
	 K+56p+Me5eweyXciEtI8nld+585HH09emp6C6LOON0YBSg48M3F4xyVZfW7dyzalqu
	 6kDJATLSP/0jLop0kQybi9cXWGLm+95SLNk3wT7VvIcm0uWXd3VqVcem/NlACVlu3C
	 bbgQ56v0V7YVe7078+kvSoMoS7Vuca4LyaN2oQ583jGfXmP5QXP17jUa8wIaUzfM3A
	 MEdnI3pknt84g==
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
Subject: [PATCH net v2 1/5] tcp: don't let __tcp_set_rto() return 0
Date: Wed, 18 Nov 2026 10:51:45 -0500
Message-ID: <20261118155144.18393-2-mason@kernel.org>
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

tcp_retransmit_timer() backs off by doubling icsk_rto, so the backoff
only works if icsk_rto is nonzero.

__tcp_set_rto() adds srtt_us >> 3 and rttvar_us with no lower bound, and
relies on tcp_rtt_estimator() to keep rttvar_us at tcp_rto_min() or
above. But tcp_rto_min() returns 0 for a route with a locked
RTAX_RTO_MIN of 0. A first RTT sample of 0 usec, which usec TS allows,
then gives:

    srtt_us   = max(1U, 0 << 3)                      = 1
    rttvar_us = max(mdev_us, tcp_rto_min_us(sk))     = 0
    __tcp_set_rto() = usecs_to_jiffies((1 >> 3) + 0) = 0

Keep the result from 0, so that the backoff recovers from any state of
the RTT estimator.

Do it in __tcp_set_rto() and not in tcp_set_rto(), since
tcp_ld_RTO_revert() uses the same sum. The third caller, the linear
timeouts of thin streams in tcp_retransmit_timer(), already clamps the
result to tcp_rto_min().

Found by code inspection (Eric Dumazet), not reproduced. Fixed by LLM,
and tested with existing kernel selftests.

Fixes: 05bb1fad1cde ("[TCP]: Allow minimum RTO to be configurable via routing metrics.")
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Chris Mason <mason@kernel.org>
---

Notes:
    v1->v2: no code change, new Fixes: tag (Eric), changelog updates

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

