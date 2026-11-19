Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083344;
	b=11nXj5vJyVG52kw+2qz9TlBxqDNJzCyhlr2tFt2yNYM4VD6dHUyHfLoeTZIg1OV8n1NJ
	 CSt2wFpih4Dd+iiZO5LuIVDRNEAMBGxmbe4HThUzYsPr/TusnpBF7ks09kpd/MHF8NBJr
	 shNZUeWI2aoE3XnSBppqH8qhCuvIFRDOd0q11ev69TKTIBeFrLthClnjy6I7CDWQoXzdJ
	 d/I8hV35me9/Ptt2x6trko00pUeTKJkROvk5gOmhP8XgO9YkkppUFaU8IVQYgoSqwai5V
	 HK4EYcIBO2x0vOjl/lTxqNd2pEBYhvXyrVQ/JYNb8EPl0Nvm049zM7GaiZFfxMGCvbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083344;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VMbM0n0fGOb5WRoEQogOfM6SY5XoKlXZke9k2tIlH4c=;
	b=2lAlzA17eR4XVoI+v9aswraWYO6w55aXp4705gD6uCbC3PgFxhpFOadGix2uVhmeWBNh
	 KoIpICNuRx1A9noBFf65fxnnrdeJvWl4mib/1z+s0mV/DzCenQe9b4WIz5F4oAeNE+WA8
	 /arkwVmioOW2ZxtAcDZ6BtvPyswTzlWrqrP0cnLsLRle7ljXJjWWjhwKBBXwNyx8BUA/b
	 n6uPE8Y8G8QWPSk56jBTqL5JNNlnYrmCOElPhvwGammzj2Pr12as5fSKDsg1Jho5PWywt
	 YPhaoOuX39GkzQ4Rspwtfp6LsfSeHZkSl9N3DcqdeTyiIv0diKS226sNxY6IrbezwLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvmMBpyC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86957606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvmMBpyC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C391F000C6;
	Thu, 19 Nov 2026 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083344;
	bh=VMbM0n0fGOb5WRoEQogOfM6SY5XoKlXZke9k2tIlH4c=;
	h=From:To:Cc:Subject:Date;
	b=OvmMBpyCVARurStHfKKF3MGmg/2z9XlnSvsHrN40mucddEki76LCWkijCoBZzsUoS
	 B36Y4B9fIgHjiDzP9JEnu1lLPR/RmeOoLwmB+v/NtfczB3Z3w79hzC/9uvJRB0ZgAY
	 Kt1O2a7oFh4zWAoEz+u2daADPM7jWSGM/vUpxdC3az3sxYA+lHkAxd5vrQYCpPq2sR
	 dHItFKUVuSHbPGpUYIrJbA9fjUoYkuqrMt/gKpLPaioj1fmFwn4orh71/J8SL2FD5u
	 yJo3qGxtiANU8xF1IuFMuUj04YKhHB5C7ybYJoiq1r5LfhMFgAYLMnXVpXDdU0MQXV
	 KsHmlG99A51+A==
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
Subject: [PATCH net-next] net: do not over-estimate truesize in zerocopy_fill_skb_from_iter()
Date: Thu, 19 Nov 2026 11:15:38 +0100
Message-ID: <20261119101538.3229466-1-edumazet@kernel.org>
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
- A chunk merged into the last frag only accounts the pages this frag
  did not already cover.

The accounting is unchanged when no chunk is merged in the middle
of a page.

Fixes: 394fcd8a8134 ("net: zerocopy: combine pages in zerocopy_sg_from_iter()")
Link: https://lore.kernel.org/netdev/20261119090828.343748-1-jiayuan.chen@linux.dev/
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
This was found with an AI coding assistant, while reviewing
the patch in the Link above, which mentions 8 one-byte iovecs being
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

With this patch, both cases add 4096 bytes. Kernel selftests were
not run.

 net/core/datagram.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index 489d92fe6dae8952da08bc5cb2a58f9863938fe0..8c418c3adf1c97b41ee7999146d09aacd8cf29d4 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -659,7 +659,6 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
 
 		skb->data_len += copied;
 		skb->len += copied;
-		skb->truesize += PAGE_ALIGN(copied + start);
 
 		head = compound_head(pages[n]);
 		order = compound_order(head);
@@ -680,6 +679,11 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
 
 				if (head == skb_frag_page(last) &&
 				    start == skb_frag_off(last) + skb_frag_size(last)) {
+					/* Only account the pages this frag
+					 * did not already cover.
+					 */
+					skb->truesize += PAGE_ALIGN(start + size) -
+							 PAGE_ALIGN(start);
 					skb_frag_size_add(last, size);
 					/* We combined this page, we need to release
 					 * a reference. Since compound pages refcount
@@ -695,6 +699,7 @@ int zerocopy_fill_skb_from_iter(struct sk_buff *skb,
 				page_ref_sub(last_head, refs);
 				refs = 0;
 			}
+			skb->truesize += PAGE_SIZE;
 			skb_fill_page_desc_noacc(skb, frag++, head, start, size);
 		}
 		if (refs)
-- 
2.53.0

