Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425122;
	b=EMTcG2NZ8F/p79gGCfOQHDae8QbITm+ANAbAAkWWsZ5wnK8iP4n3TKRXElio1kNtolqZ
	 aiH90jq4GD0Rcnf81WbEPVheq17VZK+jBk2cmInbePqA/Lo1OtuAG5LqcFpgcg5sZSBGZ
	 F8f7sqjcW2H9vDFgvZDLJ16CWJGB5S+fevF/zHcpnXqNogbzdWaxk/zEMwPr/5ngqkslv
	 cA/1GTvQyF4TxQs5DFSlxTqUXP05VAwrxGCjeo9JviRQLEFJzqGzTmJIiW82clwxJqVe6
	 07gb0Ij1zece8rqz4NlPaKx1K+Jb2EYmexh5Q3Ysyzjkw4QC5HmtTtt7EuIouwZYiXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425122;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JT67XamkzVTn8b/hiIPYLs/+m+YwJdMP360HsG0DU78=;
	b=AqxKJ6GlGiHSwn2k7w0rG97uHAD0F3fQz5S9lgXguhvt5Y0eVXfHNHayRHqhWuILxlEs
	 sBsq0NUcsosobma3r6UNOLhbKqxCqWnNYtgQQ0hUGw3cLQ1grOqp+mtDIqu9ba0aHjk1v
	 G7xH7kdfhUlX0mYdMfps0p8Nm0g8lDqFM7VJEZSsRoylwxcFLFWGeIHT+vG4OTO1qXhx9
	 +l25X24QFMauLfm1mXHujf3rsg+s2mpuiz0s+rLxRMlxaoudtjaXhE2MwBCPuKD9wxnLh
	 OGgYsVC+79KgfPjJZDNTpG0Irkf2QN1f+N6yaNgJJjBsePlLoIJ1eHY70Ei3OoozPNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtK6CaaW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B13C606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtK6CaaW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC8F1F000C6;
	Mon, 23 Nov 2026 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425121;
	bh=JT67XamkzVTn8b/hiIPYLs/+m+YwJdMP360HsG0DU78=;
	h=From:To:Cc:Subject:Date;
	b=ZtK6CaaWAhNb9sRXzaxBQ4PFhTAoNJKgroaBbvgPmLBbBvsv5J81oM4nANIQCDtnH
	 N28GDLu+GWAYcvpxoH4LEXA01jL40Mv6MshD1C+pyCG52V50GsFdeaBg7d8JMUOF0u
	 m7urr3fH0qYeb5tknn+3tgYmoDJ1snqC2/yE5LwtZCB3v7ZtMwnaiDWq8PdAnqTO8A
	 LaLqSAo95J596pmwFPucZhZXfxyCEF/WFWsz+pPfb7EDxnFZgMylXpvVFFKDm6CjQ5
	 vJqehFKyrRietHzeOm+LXXkLBfVw1OmAmsGGIAHphRfSF8W0lVXVA3a7GeYzZm951W
	 QnFzqNz6cRURw==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>
Subject: [PATCH v2 net-next] net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()
Date: Mon, 23 Nov 2026 10:11:56 +0100
Message-ID: <20261123091156.58359-1-edumazet@kernel.org>
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

zerocopy_fill_skb_from_iter() adds PAGE_ALIGN(copied + start) to
skb->truesize for each iov_iter_get_pages2() call.

Since commit 394fcd8a8134 ("net: zerocopy: combine pages in
zerocopy_sg_from_iter()"), a chunk that directly follows the last frag
in the same page is merged into this frag, and the extra page reference
is released. The page is still accounted again in skb->truesize.

With iovecs describing small contiguous chunks of the same page, each
iovec charges a full page while a single page is pinned. For TCP,
1024 one-byte iovecs sent with MSG_ZEROCOPY add 4 MB to sk_wmem_queued
and charge 4 MB to the socket, for 1024 bytes of payload sitting in
one page. Appending to the skb at the tail of the write queue does not
check sk_sndbuf, so a single sendmsg() can get sk_wmem_queued above it.

Account pages while building the frags instead:

- A new frag accounts one page, as before.
- A chunk merged into the last frag accounts one page if it starts
  a new page of a compound page, and its bytes otherwise.

A merged chunk can not be free, even if it lands in a page the last
frag already covers: this frag might not have been built by this
function. TCP can append to a tail skb whose last frag was charged
per byte, either by skb_splice_from_iter() (MSG_SPLICE_PAGES) or
by tso_fragment(). skb->truesize must not get smaller than skb->len.

The accounting is unchanged when no chunk is merged in the middle
of a page.

This was found with an AI coding assistant, while reviewing
the patch in the Link below, which mentions 8 one-byte iovecs being
charged 32768 bytes.

It was validated with a userspace reproducer, on an unmodified kernel,
without special privileges:

- TCP connection over loopback, SO_ZEROCOPY and TCP_CORK set
- send() of one byte, so that the tail skb is not a pure zerocopy one
- sendmsg(MSG_ZEROCOPY) of 1024 bytes of a single page, either
  in one iovec or in 1024 one-byte iovecs
- compare SK_MEMINFO_WMEM_QUEUED (SO_MEMINFO) before and after

  1 iovec        sk_wmem_queued += 4096
  1024 iovecs    sk_wmem_queued += 4194304

With this patch, the 1024 iovecs case adds 5119 bytes (one page, then
1023 merged bytes).

A second reproducer covers the per byte charged frag: sendfile() of
the first half of a memfd page on a corked socket, then
sendmsg(MSG_ZEROCOPY) of the second half of the same page, from
a shared mapping. With this patch, each half adds 2048 bytes to
sk_wmem_queued, and the skb is received over loopback without
a warning in skb_try_coalesce().

Both reproducers were run in a VM (virtme-ng), as well as
msg_zerocopy.sh, io_uring_zerocopy_tx.sh, udpgso.sh, udpgso_bench.sh,
txtimestamp.sh and the packetdrill tcp_zerocopy tests, which all pass.

Fixes: 394fcd8a8134 ("net: zerocopy: combine pages in zerocopy_sg_from_iter()")
Link: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
v2: charge the bytes of a chunk merged in the middle of a page, since
    the last frag might have been charged per byte (Sashiko AI review)
    Dropped Kuniyuki's Reviewed-by, the accounting changed.
v1: https://lore.kernel.org/netdev/20261119101538.3229466-1-edumazet@kernel.org/

 net/core/datagram.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index 489d92fe6dae8952da08bc5cb2a58f9863938fe0..731a4e6c6b82d5e6a4b50a28c88061294abb0f35 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -659,7 +659,6 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
 
 		skb->data_len += copied;
 		skb->len += copied;
-		skb->truesize += PAGE_ALIGN(copied + start);
 
 		head = compound_head(pages[n]);
 		order = compound_order(head);
@@ -680,6 +679,13 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
 
 				if (head == skb_frag_page(last) &&
 				    start == skb_frag_off(last) + skb_frag_size(last)) {
+					/* A chunk starting a page accounts it.
+					 * Otherwise account the bytes only: the
+					 * frag might not have been built here,
+					 * and might not have paid for the page.
+					 */
+					skb->truesize += offset_in_page(start) ?
+							 size : PAGE_SIZE;
 					skb_frag_size_add(last, size);
 					/* We combined this page, we need to release
 					 * a reference. Since compound pages refcount
@@ -695,6 +701,7 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
 				page_ref_sub(last_head, refs);
 				refs = 0;
 			}
+			skb->truesize += PAGE_SIZE;
 			skb_fill_page_desc_noacc(skb, frag++, head, start, size);
 		}
 		if (refs)
-- 
2.53.0

