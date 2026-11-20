Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195797;
	b=h7KQ88y3ZkbJH+otTIxJ6Ehwy4Oua8rrrnYzI7dCdo6NrfxPO85m7FNQVatAN0X3U91q
	 QYAOSFLSuMl/W2oEu5c/cje4tP/Abm1HtCaz8LJQebcEs39W4hmxHkhZiLycPNfZrzE8j
	 0319L91Is4sptb1O9j3aB0GhzfFZZigIJ20JsQgNOdrNCL/1cFQS2nsiuvGPvP1mHxxsg
	 xU7dwm6UvNow4BOmzp+TcioV+0Rmgm+Wh2pwcEqHf11IO5kLJGOirEwwiqNAIYlmJYpAV
	 ELtKt+XFIyRw4W0T8Y4M0Q1391MC6vJx/1VtDH+HsDmRpUlPdLhrACSFYOft25uo3ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195797;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=lH5d2jRv6fGYl4lYPKiJUuSIjrPrcXDxI7rOKSGGIxc=;
	b=fWMuUNXidAJLTAnQSqQeJ8ajzx5NoqtVfUmdKPKDh9t/dm4cbchCtOP/lISaSAfwRRlS
	 1SmVbTx1CarMIrx355Zr6jtY0u0xQGKgKm0JaYu6QBa7MxKp/Bo4YG/SS+bvXx9fWfGF0
	 VkUfYxePWUWE6iQ12W3LmL5Fof2oyUVQOFrRoh9Wi+mnM8Tg+FC1Xnk/cp2egLf/gHfSu
	 o+sRoFLJaBDmSQHr54MypWzM0HoQnF4jim6rJtK7BKXnBoofDPykbjVzcVHuGkLOg2UKZ
	 EfmqQolHkU70MgLDt7vvvbsHxOhuXBxAk8YdHhv3yBN4KhOBsa3zqO5dpVuQbiw218Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxEIqEft;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A393160A2606
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxEIqEft
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8051F000ED;
	Fri, 20 Nov 2026 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195797;
	bh=lH5d2jRv6fGYl4lYPKiJUuSIjrPrcXDxI7rOKSGGIxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NxEIqEft+zHg+tLHXwFuuPCkOIb3ngZ0F/qIMpm1WhD/pihr+9OhhItznOgNOe3uP
	 nlrtEenkyemfrRnN3oIIRyMNPen0fJMDbEJqpL6rM0VQKgLSfGYXKBnBTV+S4OQIGa
	 asv4SbsOCa4NaH7OvDvUwUKV2NoTbKzYbzA/j5QUc399/FuFRPy0isKTXDlFbSTAow
	 aXU/NPEOaryfQj1K7loSk7eWVpwaqYWQlknZgfi/I3iy+x/xRz8L37yZQN79K3hpID
	 9Qa4XZbNjhKXH/vh7Z8zmXWntb/qSpeXFFIEqty7LEjRtBq5v/GDqzSy82AfjqrKXA
	 MzFlG+ZpZnj7w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:27 +0100
Subject: [PATCH net-next v9 08/14] net: ethernet: cortina: Rotate free
 queue page allocation
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-8-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The free queue metadata bitmap currently searches for a free slot from
zero for every page allocation. Under sustained traffic this repeatedly
scans occupied low-numbered slots.

Remember the position after the most recently allocated slot and wrap the
bitmap search at its end. Reset the cursor when the bitmap is released so
the two remain consistent across failed setup and teardown. This keeps
allocation cost distributed across the metadata table.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 1693a136d734..9323e3d7af6d 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -175,6 +175,7 @@ struct gemini_ethernet {
 	struct xarray	freeq_mappings;
 	unsigned int	num_freeq_pages;
 	unsigned long	*freeq_page_bitmap;
+	unsigned int	freeq_page_cursor;
 	spinlock_t	freeq_lock; /* Locks queue from reentrance */
 };
 
@@ -779,12 +780,20 @@ static int geth_freeq_alloc_slot(struct gemini_ethernet *geth)
 
 	lockdep_assert_held(&geth->freeq_lock);
 
-	slot = find_first_zero_bit(geth->freeq_page_bitmap,
-				   geth->num_freeq_pages);
-	if (slot == geth->num_freeq_pages)
-		return -ENOSPC;
+	slot = find_next_zero_bit(geth->freeq_page_bitmap,
+				  geth->num_freeq_pages,
+				  geth->freeq_page_cursor);
+	if (slot == geth->num_freeq_pages) {
+		slot = find_first_zero_bit(geth->freeq_page_bitmap,
+					   geth->freeq_page_cursor);
+		if (slot == geth->freeq_page_cursor)
+			return -ENOSPC;
+	}
 
 	__set_bit(slot, geth->freeq_page_bitmap);
+	geth->freeq_page_cursor = slot + 1;
+	if (geth->freeq_page_cursor == geth->num_freeq_pages)
+		geth->freeq_page_cursor = 0;
 
 	return slot;
 }
@@ -1147,6 +1156,7 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 	if (!geth->freeq_page_bitmap)
 		goto err_freeq_pages;
 	geth->num_freeq_pages = page_slots;
+	geth->freeq_page_cursor = 0;
 
 	/* Match the software pointer to the retained hardware pointer. */
 	rptr = GET_RPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG);
@@ -1178,6 +1188,7 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 	kfree(geth->freeq_pages);
 	geth->freeq_pages = NULL;
 	geth->num_freeq_pages = 0;
+	geth->freeq_page_cursor = 0;
 err_freeq:
 	dma_free_coherent(geth->dev,
 			  sizeof(*geth->freeq_ring) << geth->freeq_order,
@@ -1206,6 +1217,7 @@ static void geth_cleanup_freeq(struct gemini_ethernet *geth)
 	kfree(geth->freeq_pages);
 	geth->freeq_pages = NULL;
 	geth->num_freeq_pages = 0;
+	geth->freeq_page_cursor = 0;
 
 	dma_free_coherent(geth->dev,
 			  sizeof(*geth->freeq_ring) << geth->freeq_order,

-- 
2.56.1

