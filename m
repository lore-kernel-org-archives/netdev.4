Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459567;
	b=QVp3Am5ikI8u9/SPfUP9AXEMq6LJ3ZxHglI4Ga2hKDUUkpfXt+kFV/q4i5Tmv+pS/psj
	 XUsXklGCZT/AyOSi4LF0AaJeAzcb8O3teGUtORX+6qNM4kK0o9O3c3GIHSQpndw0KgoOr
	 VA4VAMlqa7PAiTHjOH/vYw0Qv3RgZEtPElA8qbFXnENCaRMzFKNYhSBhobMKbs/SU2qQH
	 SRggZgBSyR87/7Oad5T6Q/WTDgmuBWqrVQVHB2o5qubl5MvnMv1oe6PZTLAlYisxL4liV
	 lSuDGbeHyI2/Gt7CPERAVCJ6JYMbL77YrnbTwF/8VleW9akYZsaYpQVHg2Gh4tCqanw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459567;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=enKWbkX9yJ0O1ZaXJxad94EUJe6VeeY5Q68gceVmBhA=;
	b=cdpkAVce4+0ZfCEKCP878sXDDo4QcxgQOMO5PCbcbezLWKAOHh7n4bAzrCsG/4NMs0zV
	 mLojYvdhyjPxrmkp9Rlp491ufNo6vR3cjvh0n/BIzi1TCs7ZQ/CHDilzmqhcZfpPG6fDZ
	 73mHgM1r590ePHHFiQXhGbTesohkuyX+NCResPh4JVPtf46tFDbF6USsj0qyMbdPPjXMC
	 /tc1P5LHbLmWLSQNNYXkmpAet5FDrnFk0r1hbqhJ9JumYwrGPEyD8mjVMAJ8NSC6KIiAg
	 VOdmBsOb496LLx+xB64IWibVHJEgnGXe7CmvvMDx+2YsQPpIu+DxBhqSugMbW6L/qxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aNgx8iy0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE5606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aNgx8iy0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BC11F000CA;
	Mon, 23 Nov 2026 18:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459566;
	bh=enKWbkX9yJ0O1ZaXJxad94EUJe6VeeY5Q68gceVmBhA=;
	h=From:To:Cc:Subject:Date;
	b=aNgx8iy01lqkrCLSop5IArl2F1mk++N6p/NfCjOaHE2gOlA+Dc3XJlYsJr/McmlTN
	 9z6HwjMSJz2HOM21pSUSSh8dmevM261Y13OGR3nusvFPr5UlJTp5KnEz2s8t+aiFNr
	 QT9cDuAK5l/85twQhGmUS2+ul1YHXt4gfifXZCVFOQQ2Ri812B6zsK0fJdKnmwutwl
	 kqnvS9RuZeOFgiY5F7rDSbNaYr22+AwWsPJZqBtJxQB2fqLp3ifY5IEeKc9mUV+ABW
	 CFhm2zrKv7lVKwy+VXf6iT1MGDK7zYkQLcgHeGGAl8ebii6buZ7B27YRKGqO54/2sj
	 ZQaJdyelEjH8A==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	edumazet@kernel.org,
	Jamal Hadi Salim <jhs@mojatatu.com>
Subject: [PATCH net] net/sched: fq_pie: clear memory_usage and flow backlog in fq_pie_reset()
Date: Mon, 23 Nov 2026 19:46:02 +0100
Message-ID: <20261123184602.386372-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
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

fq_pie_reset() frees all queued packets but does not update
q->memory_usage, which is only decremented in fq_pie_qdisc_dequeue().

After each reset of a non-empty qdisc (dev_deactivate(), parent purge),
the memory_usage reported in tc statistics is too high, and once it
exceeds memory_limit the overmemory counter is incremented for every
enqueued packet.

Clear q->memory_usage like fq_codel_reset() does.

Also clear flow->backlog, as fq_pie_timer() keeps feeding it to
pie_calculate_probability() for flows that no longer hold packets.

Found by code inspection (AI review) while looking at an unrelated
syzbot KCSAN report in fq_pie_reset(), not reproduced.

Fixes: ec97ecf1ebe4 ("net: sched: add Flow Queue PIE packet scheduler")
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 net/sched/sch_fq_pie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..a5e2a83efb67 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -547,10 +547,12 @@ static void fq_pie_reset(struct Qdisc *sch)
 		/* Removes all packets from flow */
 		rtnl_kfree_skbs(flow->head, flow->tail);
 		flow->head = NULL;
+		flow->backlog = 0;
 
 		INIT_LIST_HEAD(&flow->flowchain);
 		pie_vars_init(&flow->vars);
 	}
+	q->memory_usage = 0;
 }
 
 static void fq_pie_destroy(struct Qdisc *sch)
-- 
2.53.0

