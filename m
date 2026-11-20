Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195784;
	b=5EgD/sTEO2z7pEfIrdVKm2WOr9p7NvA7Pu8y95HNukHNVZ4+E05ip4NVVPKCfYQ4M4uO
	 vB6icasJ0HSbDy0EErf8zJpjgwQcWxgR7MRcqE73LuD2i3CVRt5EhRvcOs03Hi0q6aJIo
	 CdZyMDY+LKFKZOAgywSo/LxMBSvXcugbMdeVS4TviJAXI+VMNNIeHQ7gnSPVbr44Ak9Gc
	 X3X3Lw51ykn5HiXE5KYGNOS60siRPaeKfufxBX81qtjEujD9K3rxMtohHQcXQnKiMT82N
	 14/k7xt+eJaV1Ts9WmVbo99AaBNKITzK7VsSVgmTmvT57TOPFh9bi2zBBM0B0WEJCPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195784;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=bqrGnmj0r0O9VcnQQWr/AlRBMQf2jlG70xjlsBKgSDw=;
	b=sA0uh8v//1T0w6cfPJPOd0tu0+d1iw5WzcrCfHBvFeVyYk06uQd2s8F2Ux4bk1Ytigdy
	 b/cRkRnpFyMq0Y4fe39uRq6jT5RUNEiWx8kgMkH/6iR0zosqzBhon+pj9D5FRipDG2gOh
	 mF99HWPavSDATTamEpLso1rKdAGrsZn1SoDpov1tINdpDTAKavl0416FvFvUeRm1lSw5s
	 POsvRZDhuVVDyDDNfvjDXDOQMruRpGdcAGR/6OdAfis7sKLCzfJ2dSuaDjn/40SiXZZPQ
	 3OJs0Y/5ldql8BlTR1dgKy1p4X9lUmzgjH/AaswOv2uWz2LQEZ8Ou9wxmiGe3CjkxdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTGzyA3I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2E60A260D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTGzyA3I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A338A1F000CA;
	Fri, 20 Nov 2026 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195783;
	bh=bqrGnmj0r0O9VcnQQWr/AlRBMQf2jlG70xjlsBKgSDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nTGzyA3IeTkM44uUqtWsLEf2l2gMcdlJo7E3fjGZN1sek2biSD5/mAVbaCcUGaqqe
	 7PJH72VBhGHdA2WQtVmxGW3zXz1FIJs6wvevuk8Dfc2dsQq4oz79NeSlV2jwgAxGxI
	 Fh7p69KrQLWjZZTm0dzgEo9EgOtXsViXFCvZlLF+EKmR4rF/h4CMsg03kaaxk9sc5A
	 xuTKJT4Wo8fibPY5AIhrJo6oHYgJdw7bla+tsqWKZLXI3FSoU7ELJEB4JFn7or7WHg
	 5EGsjq4bQooIs5LCaUkDf7iuCooYnMDT9/gGkcAVaNedxrYzVXWhPzObgdaxt0cV9l
	 mnQFexInZjmKw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:23 +0100
Subject: [PATCH net-next v9 04/14] net: ethernet: cortina: Normalize free
 queue pointers on rebuild
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
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-4-298671d799d5@kernel.org>
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

The free queue read pointer is owned by hardware and can retain a
position from the previous ring when the queue is rebuilt at a smaller
order. Using an unmasked pointer to index the replacement page table can
then access it out of bounds. A replacement ring which does not contain
the raw retained pointer can also let hardware address past the new
allocation.

Mask software page indices to the active queue order. Keep the
replacement ring large enough for the retained hardware pointer and
initialize the software-owned write pointer from it before filling the
ring. This represents an empty queue without relying on a read-pointer
reset.

Testing on a D-Link DIR-685 with both ports stopped and the free queue
disabled showed that neither a 16-bit zero write to rptr nor a 32-bit
zero write to the pointer register resets rptr. The latter clears only
wptr. Clearing the queue base also leaves rptr unchanged. Networking
recovered after each rebuild, with all ten ping replies received.

A retained pointer can prevent shrinking the descriptor allocation. At
order 15 this is a 512 KiB ring. Buffer allocation initially follows that
order too, approaching 64 MiB; a following patch decouples the RX buffer
budget from descriptor geometry. If allocation fails, retries see the
same floor while DMA is stopped. Keep the queue disabled rather than use
a descriptor ring that cannot contain the retained pointer. Removing
this restriction requires verified pointer-reset or truncation behaviour.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 5e9dd2aea407..66984c78a7cd 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -920,6 +920,7 @@ static unsigned int geth_fill_freeq(struct gemini_ethernet *geth, bool refill)
 
 	rw.bits32 = readl(geth->base + GLOBAL_SWFQ_RWPTR_REG);
 	pn = (refill ? rw.bits.wptr : rw.bits.rptr) >> fpp_order;
+	pn &= m_pn;
 	epn = (rw.bits.rptr >> fpp_order) - 1;
 	epn &= m_pn;
 
@@ -969,6 +970,7 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 	union dma_skb_size skbsz;
 	unsigned int filled;
 	unsigned int pn;
+	u16 rptr;
 
 	geth->freeq_ring = dma_alloc_coherent(geth->dev,
 		sizeof(*geth->freeq_ring) << geth->freeq_order,
@@ -991,6 +993,10 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 		if (!geth_freeq_alloc_map_page(geth, pn))
 			goto err_freeq_alloc;
 
+	/* Match the software pointer to the retained hardware pointer. */
+	rptr = GET_RPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG);
+	SET_WPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG, rptr & (len - 1));
+
 	filled = geth_fill_freeq(geth, false);
 	if (!filled)
 		goto err_freeq_alloc;
@@ -1101,6 +1107,7 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
 	struct net_device *other_netdev;
 	unsigned int new_size = 0;
 	unsigned int new_order;
+	u16 rptr;
 	int ret;
 
 	ASSERT_RTNL();
@@ -1132,6 +1139,10 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
 	}
 
 	new_order = min(15, ilog2(new_size - 1) + 1);
+	rptr = GET_RPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG);
+	if (rptr >= BIT(15))
+		return -EIO;
+	new_order = max_t(unsigned int, new_order, fls(rptr));
 	dev_dbg(geth->dev, "set shared queue to size %d order %d\n",
 		new_size, new_order);
 	if (geth->freeq_ring && geth->freeq_order == new_order)

-- 
2.56.1

