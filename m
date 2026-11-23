Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448836;
	b=v/AsnIGeEfYmmGoRsc2hF+4wh6NTN5EGxkD5P2NJxQzjVkYlp8ICBUK5vE0OZW7P/PTh
	 kGgcfqV48yEhflP1L1QwFuOF1TwqJqjHYnR5k+O7EfCxemTwQ+luWCOHPrOBdsTovRgC0
	 vnqhJGNqi3ykvh0SxyIyCLzOF/RiJRt7ALVFloIzgfr6g8anM8G7nhM3+fd7J/S5CTis3
	 /LFO6X9R4dOd4sVKkIvWVvTnAukIkNOPDvKUZ083lSTFbzCQc/agWtDq18+OjullutKQT
	 NgomxSPgXYBXXh+1M0ajoYny312eoMxb9S0ah5O6/nDOOugetPEhth7+7szJ7me0eSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448836;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2RRGa+6xAqYwGcrdChLln3M+CJbvF/ihltQfYAefwKY=;
	b=Ersamjq6HMNaC4l9//g+0ft8KeoX/tcDkGp4OeFSMVi6WyTKC3LD8jkOhcCuvjYWGWcD
	 DrLRo9aK4+htHz+veG9xh5Y/gbJC8cEKuFZnmDG87JNBwgKvBKgl3DVeXOpUQETQMn4qB
	 waJUe7wlFzQCoo5woMpEq7/zGg200Cb+nn65NskHA73olg/+1v6ncTIeMyfPPLaouvUPx
	 33zms11A0ZXjKCFLKVxeA/2ADwVBDjg8FtJ0o8/UDRsNKqo2FJHbvhz9PTdnyVD4Pr5bq
	 7Hir/3DGe85UjzMIkAd23TBg/XUblQkz46W5IKlBK8cX+D+H2NtxuLeuRzFdURWkuJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Kai04/5i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D9606A330
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kai04/5i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6721F000E6;
	Mon, 23 Nov 2026 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448836;
	bh=2RRGa+6xAqYwGcrdChLln3M+CJbvF/ihltQfYAefwKY=;
	h=From:To:Cc:Subject:Date;
	b=Kai04/5idHNmf//X4Fd73Bp2azWGMqBNhmiH1CpLbg+gNt/j2d+fvbzjo9H4UKTb6
	 6JCoYeQk+RKWHN34gJF5d533By0d6Nh4PDxDY9fTxH0ps+OCsoq96DD09cb3O7GHrB
	 FyfDDCfl3WUWfMrBPQ0L/GyoMzUdxr440VyYcEA8LjaOFZlgX3jENDiXsv1O5JwVRm
	 0BNfl/v+u8rAutETY+JhQoB1rJ5m8M6LeKzY5hi/mK+LdKfom9ThEiJw5bb1Uwhpcw
	 i+9y1cNim2nsiMlYVXKYbEqJx8yCnW8yjWs/ZumSI6qMNNvsADm8/WeCU0UsudOwhz
	 F1ljdzcI6tcCA==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next] tcp: use order-0 page frags in tcp_collapse()
Date: Mon, 23 Nov 2026 16:47:08 +0100
Message-ID: <20261123154708.360226-1-edumazet@kernel.org>
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

tcp_collapse() copies payload into linear skbs of SKB_MAX_ORDER(0, 0)
bytes (3776 bytes on x86_64), each of them with its own sk_buff and
its own skb_shared_info.

The truesize of such an skb is 4352 bytes: 13% of the memory is
overhead, and a collapsed range can not be denser than that.

Store the payload in order-0 page frags instead. One sk_buff can
hold up to MAX_SKB_FRAGS pages, and the overhead of a collapsed
range is now about one sk_buff and its small head.

What does not fill a page is stored in the linear part of the first
new skb, if this is not bigger than SKB_MAX_ORDER(0, 0) bytes: this
is never more expensive than a partially used page. Otherwise, the
last page frag is partially used.

A range of up to SKB_MAX_ORDER(0, 0) bytes is still collapsed into
a linear skb.

All the pages are allocated before the copy, like skbs were, so
that tcp_collapse() can still give up without side effect if an
allocation fails. The truesize of the new skbs is still known
before they are allocated, to skip the ranges that would not
shrink.

In tcp_rcv_collapse_bloated.pkt, the 30 skbs of 1000 bytes
(truesize 69120) were collapsed into 8 skbs (truesize 34816).
They are now collapsed into a single skb with 7 pages
(truesize 30976).

Other benefits:

- Fewer skbs in the receive queue and in the out-of-order rbtree.

- Collapsed data is stored in page frags which are full pages,
  except possibly the last one: they can be used by
  TCP_ZEROCOPY_RECEIVE.

TCP_COLLAPSE_SCALING_RATIO is not changed: skbs with a density
above 86% are still not collapsed.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp_input.c                          | 109 ++++++++++++++----
 .../packetdrill/tcp_rcv_collapse_bloated.pkt  |   2 +-
 2 files changed, 90 insertions(+), 21 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 801c76744ed8..975e6501aef8 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5837,7 +5837,7 @@ static struct sk_buff *tcp_skb_next(struct sk_buff *skb, struct sk_buff_head *li
 #define TCP_COLLAPSE_SCALING_RATIO				\
 	((TCP_COLLAPSE_MAX_SIZE << TCP_RMEM_TO_WIN_SCALE) /	\
 	 (SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE)))
-/* Cap pool preallocation per sub-range to at most 16 skbs in seq
+/* Cap pool preallocation per sub-range to about 15 pages in seq
  * space.  A single first skb exceeding this is still collapsed,
  * whereas an exceeding overlapping ofo range is skipped.
  */
@@ -5886,6 +5886,57 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
 	return next;
 }
 
+/* Allocate an skb with @linear bytes in its head, and @size bytes
+ * in order-0 page frags. All frags are full pages, but possibly the last one.
+ */
+static struct sk_buff *tcp_collapse_alloc_skb(int linear, int size)
+{
+	struct sk_buff *nskb = alloc_skb(linear, GFP_ATOMIC);
+
+	if (!nskb)
+		return NULL;
+
+	__skb_put(nskb, linear);
+
+	while (size > 0) {
+		int len = min_t(int, size, PAGE_SIZE);
+		struct page *page;
+
+		/* No __GFP_HIGHMEM: the page is directly mapped. */
+		page = alloc_page(GFP_ATOMIC | __GFP_NOMEMALLOC | __GFP_NOWARN);
+		if (!page) {
+			__kfree_skb(nskb);
+			return NULL;
+		}
+		skb_add_rx_frag(nskb, skb_shinfo(nskb)->nr_frags, page, 0, len,
+				PAGE_SIZE);
+		size -= len;
+	}
+
+	return nskb;
+}
+
+/* Return the address of the byte at @offset in nskb, and the room
+ * left in the linear part or in the page frag containing this byte.
+ */
+static void *tcp_collapse_dst(const struct sk_buff *nskb, int offset, int *room)
+{
+	int hlen = skb_headlen(nskb);
+	const skb_frag_t *frag;
+
+	if (offset < hlen) {
+		*room = hlen - offset;
+		return nskb->data + offset;
+	}
+
+	offset -= hlen;
+	frag = &skb_shinfo(nskb)->frags[offset >> PAGE_SHIFT];
+	offset &= ~PAGE_MASK;
+	*room = skb_frag_size(frag) - offset;
+
+	return skb_frag_address(frag) + offset;
+}
+
 /* Collapse bloated sub-ranges in contiguous sequence of skbs
  * head..tail starting from sequence number start.
  *
@@ -5901,7 +5952,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	unsigned int old_truesize, new_truesize;
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp, pool;
-	int remainder, nskbs;
+	int size, linear, npages;
 	struct sk_buff *nskb;
 	u8 scaling_ratio;
 	int released = 0;
@@ -5983,34 +6034,47 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	    sub_end - start >= TCP_COLLAPSE_MAX_TOTAL_SIZE)
 		goto skip;
 
-	/* Third, check if the new skbs have high density. */
-	nskbs = (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
-	new_truesize = nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
-
-	remainder = (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
-	if (remainder) {
-		nskbs++;
-		new_truesize += skb_head_truesize(remainder, GFP_ATOMIC);
-	} else {
-		remainder = TCP_COLLAPSE_MAX_SIZE;
-	}
+	/* Third, check if the new skbs have high density.
+	 *
+	 * Payload is stored in order-0 page frags: one sk_buff can hold
+	 * up to MAX_SKB_FRAGS pages, and truesize stays close to the
+	 * payload size.
+	 *
+	 * What does not fill a page is stored in the linear part of
+	 * the first new skb, unless a page is cheaper.
+	 */
+	size = sub_end - start;
+	linear = size & ~PAGE_MASK;
+	if (linear > TCP_COLLAPSE_MAX_SIZE)
+		linear = 0;
+
+	npages = DIV_ROUND_UP(size - linear, PAGE_SIZE);
+	new_truesize = skb_head_truesize(linear, GFP_ATOMIC) +
+		       npages * PAGE_SIZE;
+	if (npages > MAX_SKB_FRAGS)
+		new_truesize += (DIV_ROUND_UP(npages, MAX_SKB_FRAGS) - 1) *
+				skb_head_truesize(0, GFP_ATOMIC);
 
 	if (old_truesize <= new_truesize)
 		goto skip;
 
-	while (nskbs--) {
-		nskb = alloc_skb(nskbs ? TCP_COLLAPSE_MAX_SIZE : remainder,
-				 GFP_ATOMIC);
+	while (size > 0) {
+		int len = min_t(int, size - linear, MAX_SKB_FRAGS * PAGE_SIZE);
+
+		nskb = tcp_collapse_alloc_skb(linear, len);
 		if (!nskb)
 			goto end;
 
 		__skb_queue_tail(&pool, nskb);
+		size -= linear + len;
+		linear = 0;
 	}
 
 	while (before(start, sub_end)) {
-		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
+		int copy;
 
 		nskb = __skb_dequeue(&pool);
+		copy = nskb->len;
 		memcpy(nskb->cb, skb->cb, sizeof(skb->cb));
 		TCP_SKB_CB(nskb)->has_rxtstamp = false;
 		skb_copy_decrypted(nskb, skb);
@@ -6026,12 +6090,17 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		/* Copy data, releasing collapsed skbs. */
 		while (copy > 0) {
 			int offset = start - TCP_SKB_CB(skb)->seq;
-			int size = TCP_SKB_CB(skb)->end_seq - start;
+			int room;
+			void *dst;
+
+			size = TCP_SKB_CB(skb)->end_seq - start;
 
 			BUG_ON(offset < 0);
 			if (size > 0) {
-				size = min(copy, size);
-				if (skb_copy_bits(skb, offset, skb_put(nskb, size), size))
+				dst = tcp_collapse_dst(nskb, nskb->len - copy,
+						       &room);
+				size = min3(copy, size, room);
+				if (skb_copy_bits(skb, offset, dst, size))
 					BUG();
 				TCP_SKB_CB(nskb)->end_seq += size;
 				if (TCP_SKB_CB(skb)->has_rxtstamp) {
diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_bloated.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_bloated.pkt
index 90e8be86968f..486a33bcddd3 100644
--- a/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_bloated.pkt
+++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_bloated.pkt
@@ -113,7 +113,7 @@
 
 // Shrink SO_RCVBUF so sk_rcvbuf (320,000) is smaller than current
 // sk_rmem_alloc (334,592 on x86_64 default), but larger than sk_rmem_alloc
-// after collapsing the 30 bloated skbs (300,288 on x86_64 default).
+// after collapsing the 30 bloated skbs (296,448 on x86_64 default).
    +0 setsockopt(4, SOL_SOCKET, SO_RCVBUF, [160000], 4) = 0
 
 // Inject the next 1,000 B segment with a changed window to bypass
-- 
2.53.0

