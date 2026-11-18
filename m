Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017113;
	b=ymXIbVtdSsAsFipbFsJEUW6btwuaLsoQCf8Ky9E96lSqUTfb23xDiOEx283rlxhwZgAJ
	 xbZ8hnWtCT9rODALZV93PVauT2VGKfqGfaigQuqrHROASghetnrDT+swBkaJaYXxNs/vQ
	 FCqsbmXjb2h6KMw8C6U2krHC4Refa/85CemffPtk3PGUC1Cs0O642XIIhvoKg0SrjDYlE
	 5th77XlGzkZYTYNwLyLDoZqnvtczgqS8ZvTsORJNzovHnDJtl97ya8W2nTFm9QlN9P3qj
	 vs/kCGyEUCOeoeVt1o1njfpLxBc/YbJCvWtJoBltWe2lRjL9C5BRFooB6cB5DfJDvZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017113;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8Y1HCpFZlaidrgWFpk/K5x/UrGFMGKpcw+uVLtGpXCg=;
	b=rJr+1ScRhkwxaFgmhXOEjbuMEvJ4hAr4ERkaOWnJlmW65rh3tuW3NXF6qM00LPPgQYXH
	 EMGoGooKRYQOcQiygRXaALelyYzJ4/ctKqdoCvIdjWHKMdNd9tFLT+/Bihor21zi7xzwq
	 s6RaCwwJLcOsEI7XyTBLY/Nz0JBJF/reX+cBtU6fD+liVGUS5Xo3T8dhczDJ3pGfpLprK
	 WIn/saubaHTCmTDV7c8dU7f7KynJixz7KfSLzhMMy+iU0U16SHI7yGx9k3UBCqq3Uy0PY
	 CE+cmPrmAG66Mzy6eFUWY3qImhnU3IV7dcadz3Sbl7OT0dgQ5VrhIzqElR466stSeww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wf9Oy45A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD2606A33A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wf9Oy45A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934CD1F000CD;
	Wed, 18 Nov 2026 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017112;
	bh=8Y1HCpFZlaidrgWFpk/K5x/UrGFMGKpcw+uVLtGpXCg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Wf9Oy45Aw4cHUKyPIap1a/y68VC5ka1j7e82zd40sBQvxJ8R/9479tpmQPMj/90XK
	 CwVeiEd3aE+BbZu9kwXaAK0H+yNuDsFj0RhUAWYvNV3mmtBp+fGVGCNsib1FwBuJ1M
	 zYjeuUrh6JVjSOYCmUNBixLztaE7P6QkZfeB8Of4cEAVc2ZPFpWv2yX529r6sp5Qjk
	 frpmhswVdjCPW+FtUOQNgB2+KgBg75CxXdZfJHpf77no9l/kLsHUGK2vuVNQswzavl
	 0igrIspmuuR6qU9y7sIu4Tk6KSzTt1jc5f+cOXWgDqaTj7FR9H6/x64Oi0pAPBU4Oz
	 3Up6U+gBcKz+w==
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
Subject: [PATCH net v2 4/5] tcp: clamp the samples in tcp_rcv_rtt_update()
Date: Wed, 18 Nov 2026 10:51:48 -0500
Message-ID: <20261118155144.18393-5-mason@kernel.org>
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

tcp_rcv_rtt_update() starts with sample << 3 in u32 arithmetic, so a
sample of 536.9 s or more wraps.

tcp_rcv_rtt_measure() can hand it one. Its sample is the time the sender
took to fill one receive window, and a low rate flow can take longer
than that. This caller only looks for a minimum, so the wrapped value is
kept whenever it is below the current estimate. A 540 s sample ends up
as an estimate of about 3.1 s.

Clamp the sample to TCP_RTT_MAX_US in tcp_rcv_rtt_update(), like
tcp_rtt_estimator() does on the send side. That covers both callers, and
the smoothed estimate now tops out at 8 * 120 s, which fits in a u32.

Found by code inspection (Eric Dumazet), who also suggested the fix.
Confirmed with an LLM generated reproducer on an unmodified kernel, and
tested with the reproducer and existing kernel selftests.

Fixes: 645f4c6f2ebd ("tcp: switch rcv_rtt_est and rcvq_space to high resolution timestamps")
Suggested-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Chris Mason <mason@kernel.org>
---

Notes:
    v1->v2: new patch (Eric), with min() instead of min_t() (David)

 net/ipv4/tcp_input.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 69e038b9389a..d9a66a1342ef 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
 static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, int win_dep)
 {
 	u32 new_sample, old_sample = tp->rcv_rtt_est.rtt_us;
-	long m = sample << 3;
+	long m;
+
+	/* Keep sample << 3 and the smoothed estimate within u32. */
+	sample = min(sample, TCP_RTT_MAX_US);
+	m = sample << 3;
 
 	if (old_sample == 0 || m < old_sample) {
 		new_sample = m;
-- 
2.55.0

