Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870362;
	b=0zgaTwfe44NElK24fIfLZLHWMAA6n2OSakk4rzoS/LtocTuAu2PDQiS6AAM8GYni0142
	 t4pi9i/wr8yT7GpxGzkrcJw8Z/t3Jai4J//KMwT1xDQQFevf5iCbeQMUE0PyleU9NbfkL
	 HGRxAgJB74qw4GN82V5PqQ9+dWfcYf6yI+JY4ZiabLq33t+9tqU2XCJkvS+vy9HODuo5b
	 X14g00ph+FbmMW3RItL38gONlyLWC/93jYZl4P+27dDzHvChcuISSXhwXposMjENKheu2
	 iAtk9rcY6bwM1cke9TCMTdYUYtkMqF/dI+EIM71cNqpUxvDwOxSQDZJj1/kds0X4eow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=z4fBymZZSSUULWGJNGl+cnaSscVLy1TLb572Nad7Hrk=;
	b=ynziJkA3xjIu5KwxISPXwOiBoPEqpj819SbX/aFZXmgDJV0mJ3XS0f6VOgF/CkT/U1Yj
	 k5yD5DlIFVk1OB+XHHHZ1Qw/RbZmlstoBisgOVo5CA4yhT1AFwDlhqohCQWzPbtHrluWV
	 ahaA6Sk/yjwgaPZirSuRNSW1Zb+VJ6rOb8t30dma7GfVsPFa27o+lvGtRGDd5hxwSOTDz
	 P0bnr5Bb0c9oYaug01D1wcywDKkxTQj6bT7AL7UnKuPBjn3fqEjP3e3zbUNsVnYJerbvl
	 jhOvp8w2DoPdevX51jDt5dBmTyTMrswsS+CH2NZXRhpCXcp6pXVhSaG1epVZDEPlM0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lhyQrRU1;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01330606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01330606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lhyQrRU1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efda3affc2so1686685ad.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870361; x=1795475161; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4fBymZZSSUULWGJNGl+cnaSscVLy1TLb572Nad7Hrk=;
        b=lhyQrRU1LZnZBiSaNO7eQb4o/s1ngy5D9hBYN6Y9Yd4s9XzZqXlB1wzJSCn3fKrsgV
         F6DQ7gjTteH7F06TvK1sYWUdx8hkBTtwfbiFXtVgg6xXRAHISGbAWWrGWFflDOAMXFBA
         L38+2ZXiMvEuoTiqpLOrxZJyX/YCDkhp7DRE9COhTzFqiNlIPStmYDQ1Sg2EEXLF1klY
         9wCOMJEFngH7s4lJbc5V9JUyZL5MYcusOFtE3kKSCgNdd78rhM/k3yygBOLOIcJ8vw0Q
         tue/ysyekQCwQbvRnEcOIpQH5qGoN2VcTsrHIUw+MRczgDqIDiHAKu80vIMpTFtnFJoo
         JK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870361; x=1795475161;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4fBymZZSSUULWGJNGl+cnaSscVLy1TLb572Nad7Hrk=;
        b=qEwFO7aQD3L1q9Vir202NGMWfFlvSFhdZlSnIBtXqpq8FWJwa6Z9sLnpGnJL/xUOF1
         noP3ffe0T4KQaC4T5+q2gOiuoj5wwf1r2puDMa60X/XoIwk8WIDt7YpP76EhXBrKoSgN
         WJBDL9Z560jhriHIryGgDGgWm9NuRJlDZbSYzPn9FeeXMAxXmg77NH5aBvydVjPs1XjL
         OyoYVCRooZ7cWXOd1NpqWuWljy6WbxnXjWb95u5nxwVH9tiNSVkfAPxhtzePFW6mo2M4
         ldslUxQr07UsrSPh1GXiGzhdXZ/Q/CjZ3vHAMAp1vuDzRV86GSfq9g77DkdQX8b2bitX
         4q1g==
X-Forwarded-Encrypted: i=1; AL+hErH+LpRjS4jvmfJvQq6YmpWqrUHddSfUjSwG2dtRKPbKWSIutKukurzpmGPlPW+0kBE22yj/Gis=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4nPh3kFT6/Ws3HuAx0GkxPAoBgn4OYAC/r4FZPDYvD/xLHTLG
	3bZZC/9UxZ9W4dGcVyTdbwIUo1jNUv8B83j8kBn0Rk+wz5C4oJigUrGxNOcbBiQ8Jzhdw15PQ2+
	E1ZICog==
X-Received: from pllh8.prod.google.com ([2002:a17:902:7488:b0:2ee:192c:eed2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4686:b0:2df:90d4:7758
 with SMTP id d9443c01a7336-2ee0dc93c50mr104420135ad.23.1794870360916; Mon, 16
 Nov 2026 15:06:00 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:28 +0000
In-Reply-To: <20261116230555.2305867-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116230555.2305867-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116230555.2305867-5-kuniyu@google.com>
Subject: [PATCH v2 net-next 4/7] tcp: Skip collapsing if collapsed skb is less-dense.
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
v2: Add compute_skb_truesize() instead of macro
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 26 +++++++++++++++++++++++---
 net/ipv4/tcp_input.c   | 24 +++++++++++++++++++++++-
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 1d6832878930..310e4881045b 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -274,6 +274,8 @@
 			 SKB_DATA_ALIGN(sizeof(struct sk_buff)) +	\
 			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
 
+unsigned int compute_skb_truesize(unsigned int size, gfp_t flags);
+
 struct net_device;
 struct scatterlist;
 struct pipe_inode_info;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 2e81aacc998b..a89eaadc729f 100644
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
@@ -651,6 +661,16 @@ static void *kmalloc_reserve(unsigned int *size, gfp_t flags, int node,
 	return obj;
 }
 
+unsigned int compute_skb_truesize(unsigned int size, gfp_t flags)
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
index 5bd42a74c6f5..0815e1891fba 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5850,8 +5850,10 @@ static void
 tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	     struct sk_buff *head, struct sk_buff *tail, u32 start)
 {
+	int old_truesize, new_truesize;
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp;
+	int remainder, nskbs;
 	u8 scaling_ratio;
 	u32 sub_end;
 
@@ -5891,6 +5893,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 	/* Second, find consecutive collapsible skb. */
 	sub_end = TCP_SKB_CB(skb)->end_seq;
+	old_truesize = skb->truesize;
 
 	for (n = tcp_skb_next(skb, list); n && n != tail; n = tcp_skb_next(n, list)) {
 		if (!skb_frags_readable(n) ||
@@ -5898,8 +5901,10 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		    !tcp_skb_can_collapse_rx(skb, n))
 			break;
 
-		if (!after(TCP_SKB_CB(n)->end_seq, sub_end))
+		if (!after(TCP_SKB_CB(n)->end_seq, sub_end)) {
+			old_truesize += n->truesize;
 			continue;
+		}
 
 		/* seq and end_seq must increase monotonically for rbtree. */
 		if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
@@ -5908,6 +5913,23 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			break;
 
 		sub_end = TCP_SKB_CB(n)->end_seq;
+		old_truesize += n->truesize;
+	}
+
+	/* Third, check if the new skbs have high density. */
+	nskbs = (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
+	new_truesize = nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
+
+	remainder = (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
+	if (remainder) {
+		nskbs++;
+		new_truesize += compute_skb_truesize(remainder, GFP_ATOMIC);
+	}
+
+	if (old_truesize <= new_truesize) {
+		start = sub_end;
+		skb = n;
+		goto restart;
 	}
 
 	while (before(start, sub_end)) {
-- 
2.56.0.679.gc527c65306-goog

