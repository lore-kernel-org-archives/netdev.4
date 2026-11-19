Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072617;
	b=OF13d5Txuq+Bv64QnxHlofODcntVeXtNSSD1KH4LdNr/5yKHbSil9KCruwOjo/aHTGqD
	 gjwK/fnA9cqNP9TgoGN9NSTAMDhISdqNUiSy1ylmFrb3bRmM86tN24hJSA0dKsadyurAL
	 EVHyUiRWcMOHkKF2/FnYcvGnPwGmcyqpE7Nnhqi2vSyXj2N/RzTZ/uJGbnOPdZX5RF9aO
	 9JIBpwbv3dp12Bry/woypBH4fvF3lrSH/G9X9bdWaMPU6WFyVeNDQGrHSdKqvbhttmFUh
	 aP7Ak9bE5PDrZpnD12X0xITjxJpJZ4vmmV1mNsEobh2y9BdXCQ8NOvrITKFPUbNQYwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=U1yPrpaAxnhbLNypl2orgrFOYDzLEgPuRRKNJFexeqI=;
	b=JqQqX6E+V62MyfI7mjSCMPNeS2aJvKvQm4gfJAhcqKv749C1121Obv/zweV3ihtPLs3W
	 0ZNhOJXhZakIB4jJMQXYQZksbYBLR8QJS9scc7wamKJzEoV+u56f9f4O4+JETLsYqIwI5
	 TbXE1KzVu2J5Nx2hcgHDl+VOPaucFpwdtsyWiFJUS/+h6X6XiqvD5ppjQmdH0eVr6YTMS
	 Rwdu2haMZrMksUElZl4rlyw4sHnLXV/2VouxK03A2oU/KQcAzZiUQvRwF2iOvlrHv5i09
	 S1ZclJcvOn9r6mahMLuwJh4BPeY+YGCGbcsqiT/3U4oaNj2AKWXQ7V99boqPMP09ynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIWv+gUy;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E9606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04E9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIWv+gUy
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb86c39250so1214390a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072616; x=1795677416; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1yPrpaAxnhbLNypl2orgrFOYDzLEgPuRRKNJFexeqI=;
        b=dIWv+gUybFQN4XZwYe0xXStFzicOfnzTxHXmiqMcXlwPi00JKLT7fy8ym2Z6HKS9rb
         25QkyMIyW+PbZILCXMMmT6fObpa0Vxk1xi5HjrbtmrCA1gj5xzwotNtAaQvLsJ33I6mL
         BdgE9paO4AfhAqZjy01TsG1h4Cam1+dLZjGsG4lxVqQrE1Fmjhkb+fdHrw3I9KyC21Wy
         59984DWm+EiRwHm6sRmZKYD80xYorRDjwEBBySITq9UBWippVE8ZYi/MwEsoypHtFCqE
         VHa0tzHF1drWuDVlT5lSCGpwU9/v6TGLhoeDHOTsb1QFjZBcrbYbBaSF3IUkHaWwbf8V
         vCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072616; x=1795677416;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1yPrpaAxnhbLNypl2orgrFOYDzLEgPuRRKNJFexeqI=;
        b=GJj4gg50K2N/4s5L35S84/3td1ABHDabVRAdyZcU48qKo4moU/YcI1HZkcuTLzF+7a
         UFkpOEtm5Cb31/eK5w/C6CfCs5Bf5PfUkl5uIAXGsa1ZkIVPlkjg5AC9ZvYVBod0xVrB
         3B/Qhl6ffXJfJnf18XCFlHCmPOXfK7YFnRJAsxBZQCbNBNMgbD03uVOBiFX50wTkXYmI
         UK9SV10LHwUTVkuMah9E4C8MjirgMfzUM0wuBnC3VNsRiuUSfP5LUFiISOL2zv03FMWf
         ylkjBJS7M1Ux4vZb4JjI9xZtuFN2N6V2zgKPjmO+sIspJpNSFX3YQpxCS0IB8EgbuH6/
         TEHg==
X-Forwarded-Encrypted: i=1; AL+hErGBx35iku+wq3rVUOfB4AJocm9ULiHbtqMcONd95cFL21rPDyLU9gjd2by8k4mptZdDCbiDnH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9azL8wfw8rQ8zvkfync8Z6HvQTq9bmJx4gCn3Qc/h1TQc3K+cd
	pJe4IxfZUCG/zuMHthGntUxTsW/jIDo7sMB+phEizWry0KwidqgB7XcPMu9H7/4D99938+rKfsn
	gBHpBOQ==
X-Received: from pgij29.prod.google.com ([2002:a05:6a02:841d:b0:cda:e9be:9294])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7795:b0:3e0:da23:874a
 with SMTP id adf61e73a8af0-3fe96ff5bcbmr4467874637.18.1795072616054; Wed, 18
 Nov 2026 23:16:56 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:56 +0000
In-Reply-To: <20261119071649.374106-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119071649.374106-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119071649.374106-5-kuniyu@google.com>
Subject: [PATCH v3 net-next 4/7] tcp: Skip collapsing if collapsed skb is less-dense.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Once tcp_collapse() finds a collapsible skb, it collapses
consecutive bloated skbs.

However, the end result could be the same or larger than
as is in some cases:

  1. skb is already minimum

     If SKB_HEAD_ALIGN(len) <= SKB_SMALL_HEAD_CACHE_SIZE,
     skb is allocated from skbuff_small_head, and skb->truesize
     never changes.

  2. SKB_HEAD_ALIGN() and kmalloc_size_roundup() in alloc_skb()

     Assume two bloated skbs with len = 1448 B (truesize =
     2304 B, scaling_ratio = 160) and len = 300 B (truesize =
     896 B, scaling_ratio = 85), whose total truesize is
     3200 B.

     Collapsing them calls alloc_skb(1748), which rounds up
     SKB_HEAD_ALIGN(1748) = 2112 B to 4096 B and allocates a
     new skb with truesize = 4352 B (+1152 B!).

Even worse, in case 1, such a skb is reallocated repeatedly
by every tcp_collapse() in vain.

Let's calculate the final collapsed truesize before collapsing
skbs and skip the range if it does not shrink.

We could allocate skbs first and calculate the new truesize,
but given tcp_collapse() is called under memory pressure,
we want to avoid unnecessary allocation.

Note that kmalloc_reserve_size() uses __always_inline so that
this change does not affect non-FDO builds, and returns 0 when
skb_small_head_cache is used, similar to kmalloc_pfmemalloc().

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
v3:
  * Remove redundant kmalloc_size_roundup()
  * Rename helper with skb_ prefix
  * Declare {old,new}_truesize as unsigned int

v2: Add compute_skb_truesize() instead of macro
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 27 +++++++++++++++++++++++----
 net/ipv4/tcp_input.c   | 15 +++++++++++++++
 3 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 1d6832878930..3fa8f140c58e 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -274,6 +274,8 @@
 			 SKB_DATA_ALIGN(sizeof(struct sk_buff)) +	\
 			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
 
+unsigned int skb_head_truesize(unsigned int size, gfp_t flags);
+
 struct net_device;
 struct scatterlist;
 struct pipe_inode_info;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 2e81aacc998b..8616ce0785d0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -589,6 +589,17 @@ struct sk_buff *napi_build_skb(void *data, unsigned int frag_size)
 }
 EXPORT_SYMBOL(napi_build_skb);
 
+static __always_inline size_t kmalloc_reserve_size(unsigned int size, gfp_t flags)
+{
+	size_t obj_size = SKB_HEAD_ALIGN(size);
+
+	if (obj_size <= SKB_SMALL_HEAD_CACHE_SIZE &&
+	    !(flags & KMALLOC_NOT_NORMAL_BITS))
+		return 0;
+
+	return kmalloc_size_roundup(obj_size);
+}
+
 static void *kmalloc_pfmemalloc(size_t obj_size, gfp_t flags, int node)
 {
 	if (!gfp_pfmemalloc_allowed(flags))
@@ -612,9 +623,8 @@ static void *kmalloc_reserve(unsigned int *size, gfp_t flags, int node,
 	size_t obj_size;
 	void *obj;
 
-	obj_size = SKB_HEAD_ALIGN(*size);
-	if (obj_size <= SKB_SMALL_HEAD_CACHE_SIZE &&
-	    !(flags & KMALLOC_NOT_NORMAL_BITS)) {
+	obj_size = kmalloc_reserve_size(*size, flags);
+	if (!obj_size) {
 		obj = kmem_cache_alloc_node(net_hotdata.skb_small_head_cache,
 				flags | __GFP_NOMEMALLOC | __GFP_NOWARN,
 				node);
@@ -627,7 +637,6 @@ static void *kmalloc_reserve(unsigned int *size, gfp_t flags, int node,
 		return kmalloc_pfmemalloc(0, flags, node);
 	}
 
-	obj_size = kmalloc_size_roundup(obj_size);
 	/* The following cast might truncate high-order bits of obj_size, this
 	 * is harmless because kmalloc(obj_size >= 2^32) will fail anyway.
 	 */
@@ -651,6 +660,16 @@ static void *kmalloc_reserve(unsigned int *size, gfp_t flags, int node,
 	return obj;
 }
 
+unsigned int skb_head_truesize(unsigned int size, gfp_t flags)
+{
+	size_t obj_size = kmalloc_reserve_size(size, flags);
+
+	if (!obj_size)
+		obj_size = SKB_SMALL_HEAD_CACHE_SIZE;
+
+	return obj_size + SKB_DATA_ALIGN(sizeof(struct sk_buff));
+}
+
 /* 	Allocate a new skbuff. We do this ourselves so we can fill in a few
  *	'private' fields and also do memory statistics to find all the
  *	[BEEP] leaks.
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 5df60dd35afe..27ed9ba11ec9 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5860,8 +5860,10 @@ static void
 tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	     struct sk_buff *head, struct sk_buff *tail, u32 start)
 {
+	unsigned int old_truesize, new_truesize;
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp;
+	int remainder, nskbs;
 	u8 scaling_ratio;
 	u32 sub_end;
 
@@ -5901,6 +5903,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 	/* Second, find consecutive collapsible skb. */
 	sub_end = TCP_SKB_CB(skb)->end_seq;
+	old_truesize = skb->truesize;
 	n = tcp_skb_next(skb, list);
 
 	while (n && n != tail) {
@@ -5928,9 +5931,21 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			break;
 
 		sub_end = TCP_SKB_CB(n)->end_seq;
+		old_truesize += n->truesize;
 		n = tcp_skb_next(n, list);
 	}
 
+	/* Third, check if the new skbs have high density. */
+	nskbs = (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
+	new_truesize = nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
+
+	remainder = (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
+	if (remainder)
+		new_truesize += skb_head_truesize(remainder, GFP_ATOMIC);
+
+	if (old_truesize <= new_truesize)
+		goto skip;
+
 	while (before(start, sub_end)) {
 		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
 		struct sk_buff *nskb;
-- 
2.56.1.708.g77570a6a1d-goog

