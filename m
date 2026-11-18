Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962933;
	b=ZMQ+oDiMqsC6M5By/s1xjxAWPv3ozIj8kz8+l+jKe/GwfSIR4gy7uGYLiY9+HxO2irCe
	 7utjVxajwTTBX81bP0MIHR2SbYXT00S7ANlX3OIvLBImZtWW0UM1XIVw66KrnhTkDzvhO
	 +8btcCKR8DRbzTwxfT7w82k3b47SmIS2uI0dJGoR/fP6mwASkOYYNACeP/jbl41Gcz/ml
	 4mkisdOsegS64Q0cZe5OiQ2zpS4eaXFZIYtDTfij4g/7NQBadOBQn4sEbBT52vpTskd4s
	 F5x15S5HBdjsPrjmZEul5IRdx8DWI6HH12YpNI0Scyf7N1BsfTgaO4MNgGa2JuZ6Pqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962933;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=M+o3XGA+ZVeQwU3F3oDZDSpaFvjG+cSYymZrG+icHTg=;
	b=LEyyYoHwZAInl8r2tDNUhr7qGwLSWHiFl19yNzyGAuQSDIyyOwXTYeArq4djzI64n0I8
	 7BxanIYrjepI60uOgpDglUvV9RVFxKsWTxSb+Y0eGrk3w88NCka2SN0MuqUDqPYue6t/p
	 B/ZzC1jd+VqpOnZWFIy1Q8lxhdqiYKlyyQ5JCeB35YXIEcznWzmOQVWaAaJwDLUEkmTBM
	 e7wcj10EZ4wnnE0KIb0GlRGMqHFjOXfDgX8vjQ3YyJa/pLKdhd0EwvUpVWJcyaGkMhc5s
	 zhf6SNWSfYZyAhgfeo5L1gHKk7G2wXYxDVzYqqYtT7Ak2Ai+3yr25Xa9jrP74mFKGHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeX1FwkO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5CF606A880
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeX1FwkO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBB81F000C4;
	Wed, 18 Nov 2026 00:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794962932;
	bh=M+o3XGA+ZVeQwU3F3oDZDSpaFvjG+cSYymZrG+icHTg=;
	h=From:To:Subject:Date;
	b=LeX1FwkOUexPyXihUG1we8e/75Rvc67d3zP5hQUVC7wcjUCRHze6OgfRQJsdUsiSM
	 6EXhRqtG05pDRYtzIUThE1HdrPtLEihwSRZGWnclJ/QXwkUNFMzCMmSdjmHS3VrdMg
	 sGaCSueNNj46AbEGG/Pvciwzld/ob8CNtPVIuOXcxNfpjgrvWKUhNG5UehI+xvDdsO
	 Agmw7orAhM5/mgh5CgFcu4RmNumOohQeHy+OG3gohql/vzhqAJgy6WNxk5moL4ar6N
	 NRb7lhK7bmff0ISlmzCZFwa4Vgr/NYEK9FvEs33u9UNGtJm6tEkA/3UH6UU8qxpzmh
	 YUV8qd0/m/q/A==
From: Chris Mason <mason@kernel.org>
To: mason@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	kuniyu@google.com,
	netdev@vger.kernel.org,
	josef@toxicpanda.com
Subject: [PATCH net] ipv4: don't let the transport header offset wrap
Date: Tue, 17 Nov 2026 19:48:50 -0500
Message-ID: <20261118004850.52808-1-mason@kernel.org>
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

From: Josef Bacik <josef@toxicpanda.com>

skb->network_header and skb->transport_header are 16-bit offsets from
skb->head. ip_rcv_core() computes transport_header as
network_header + ihl * 4.

These offsets are normally small. But a tunnel pulls its outer headers
and hands the same skb back to the stack. skb->head stays where it is,
so skb->data moves further away from it with each decapsulation. After
nested decapsulations the end of the inner IP header can lie beyond what
16 bits can hold.

The fix used here is to set the offset with
skb_set_transport_header_careful(), and to drop the packet if the offset
does not fit.

The helper computes the offset from skb->data, which points to the IP
header in ip_rcv_core(). It does not use network_header. So it also
catches a packet whose network_header was already truncated, where
network_header + ihl * 4 would look valid.

Found by LLM code inspection, and confirmed with LLM generated
reproducers on an unmodified kernel. Fixed by LLM, and tested with
the reproducers and existing kernel selftests.

Fixes: 21d1196a35f5 ("ipv4: set transport header earlier")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Chris Mason <mason@kernel.org>
---
 net/ipv4/ip_input.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ip_input.c b/net/ipv4/ip_input.c
index 9860178752b8..397043893376 100644
--- a/net/ipv4/ip_input.c
+++ b/net/ipv4/ip_input.c
@@ -572,7 +572,11 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
 	}
 
 	iph = ip_hdr(skb);
-	skb->transport_header = skb->network_header + iph->ihl*4;
+	if (!skb_set_transport_header_careful(skb, iph->ihl * 4)) {
+		drop_reason = SKB_DROP_REASON_PKT_TOO_BIG;
+		__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
+		goto drop;
+	}
 
 	/* Remove any debris in the socket control block */
 	memset(IPCB(skb), 0, sizeof(struct inet_skb_parm));
-- 
2.55.0

