Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425460;
	b=VZf8KxBATMn2DTp/e1gbn8PGm6a0vbuqZ9Tm2Z/kivpjwY9opkga3dfCSGrVJJ5/2QGH
	 18byaodkxlbAPF67FQ7ZjiNpaFsf/kN8fw+uT/sNYcAhS6HJf2N/mbzxXH/Wf0+NsgZPi
	 qX6N9p96TZfh1dOY6rmonD2e29cVrQSdnqaOvC0t2D5GLCknTH5qNH1KqweSM9y2PUCWI
	 vTkArS+jeAqy4DD4pYF+HrzpwEJ4BS0/2UfELg/fO26QAa8lLEjbSXN1TfVJAdgrSd4ER
	 6ZjzICN4PJaMnoC0zEzrBjKbvhDwAr1AtAKgs5r1e2Hrmcgl1TA8AK5u0OFdGk+XURw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425460;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=JQUYCkB366SxBfPGtuA4byxlG9aEEXGd8G/yHMo4qGI=;
	b=oMrraTIxlxCtqVh5vw10bPW0wKVPhEyZ3AwokTKerbYqWWM9ZuU9pTiD/jDb7dYZ73ZJ
	 Jjc1UKE8lT+dCNqjCxcdakloCbQ6e9LSB1/zSkCRksl7NcbY3IRFvGFnxX4KM7FWTjbQ3
	 tuj1376jtuNHy4/8tVzwfGX1CC2O11nrD7E2tj14DJGDQsffEJ8Bbrl1j02F20NByiJSP
	 qS6zGpo4ku7qzFf7Xi/cWKfGAbKzbJK5V5TX8PrpgFyYpsD7J/Lgd2vNF63pQg0e+yyjZ
	 XZQ1Gs9RZ0bK4n+YAd+xRdLPKEiCCVgaWNe2c8thONejmF/wAixkp3yPDhenB1bEdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="xkaC/xYX";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC76860A383B;
	Mon, 23 Nov 2026 09:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC76860A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=xkaC/xYX
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF8C3A933A;
	Mon, 23 Nov 2026 10:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795425458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JQUYCkB366SxBfPGtuA4byxlG9aEEXGd8G/yHMo4qGI=;
	b=xkaC/xYXkiudmfJug/61JgZCA6+NZUq6CSU4cQP07RakW4k/cXLpjgLp30CaMhiikFnfqU
	ssVadYyXdkl038g/TltjSor0t/+3j3NMVxVXZ9wIhJOgFixh1T43ggNUT1mdT82ChxctSY
	CIBfV8XW9oyueFkLI6fmxdOi7IugWLA5wDUc/iofJLlTu6UcHb5BmD0O3Bd0q2RJrgeriJ
	2FoSlwVEHntwgA+sfpCPDMI0ZtWjmMy/tH+xDVS2/tyrWslx9KCUo1koWUV7Jw9V7wZTf9
	vjF0lXSzIfMirmpY9eAW+yA9pmwLnooUEgMJaDkyMNe8RG9LfSFavdmisZrHmQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Mon, 23 Nov 2026 10:17:16 +0100
Subject: [PATCH net-next v9 8/8] net: bcmgenet: reassemble jumbo frames
 from status block fragments
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
Message-Id: <20261123-nb-genet-mtu-nn-v2-v9-8-4f93ded19bbb@tipi-net.de>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
In-Reply-To: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Justin Chen <justin.chen@broadcom.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The hardware does not truncate a frame longer than the packet ready
threshold. It splits the frame across descriptors and writes a status block
at the start of each one. The first fragment then arrives with SOP and no
EOP and is dropped as fragmented. This caps the MTU.

Strip the status blocks and reassemble the fragments. Only the last block
holds the checksum of the whole frame. Broadcom confirmed from the RTL that
every GENET revision splits long frames this way, not just the v5 this was
tested on.

On transmit the MAC only checksums a frame it holds in full, so anything
longer than the threshold falls back to software. At jumbo sizes the larger
frame saves more per packet overhead than the checksum costs.

UMAC_MAX_FRAME_LEN is 14 bit and counts the FCS. That puts the maximum MTU
at 16347.

The TX descriptor length field is wider than DMA_BUFLENGTH_MASK suggests,
that mask only extracts the length from the RX status word. A frame of
16361 bytes, the largest untagged frame that MTU allows, came back byte
exact 200 times over UMAC loopback.

Suggested-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 133 +++++++++++++++++++++----
 drivers/net/ethernet/broadcom/genet/bcmgenet.h |   4 +-
 2 files changed, 114 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 8dcee6951be3..b4e3fe21a5d6 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -91,11 +91,8 @@
 				      ENET_THLD_MAX * ENET_THLD_UNIT, \
 				      ENET_THLD_PAGE_LEN)
 
-/* Largest MTU that fits one descriptor, with room for a VLAN tag so a VLAN
- * interface can use the parent MTU.
- */
-#define ENET_MAX_MTU		(ENET_THLD_MAX_LEN - GENET_RBUF_ALIGN - \
-				 ETH_HLEN - VLAN_HLEN)
+/* UMAC_MAX_FRAME_LEN is 14 bits wide and counts the FCS */
+#define ENET_MAX_MTU		(GENMASK(13, 0) - ENET_FRAME_OVERHEAD)
 
 /* Tx/Rx DMA register offset, skip 256 descriptors */
 #define WORDS_PER_BD(p)		(p->hw_params->words_per_bd)
@@ -2437,6 +2434,52 @@ static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
 	return 0;
 }
 
+/* The rest of the frame carries no SOP. Drop it and do not count it again
+ * until the next SOP, unless this descriptor already ended the frame.
+ */
+static void bcmgenet_discard_frags(struct bcmgenet_rx_ring *ring, bool eop)
+{
+	ring->frag_drop = !eop;
+
+	if (!ring->frag_head)
+		return;
+
+	dev_kfree_skb_any(ring->frag_head);
+	ring->frag_head = NULL;
+}
+
+/* A frame longer than the threshold arrives in several descriptors, each with
+ * its own status block. Returns the frame once EOP is in. NULL means either
+ * more descriptors are coming or the frame is gone.
+ */
+static struct sk_buff *bcmgenet_add_frag(struct bcmgenet_rx_ring *ring,
+					 struct page *page,
+					 unsigned int offset,
+					 unsigned int size,
+					 unsigned int dma_flag,
+					 unsigned int len)
+{
+	struct sk_buff *head = ring->frag_head;
+
+	if (unlikely(skb_shinfo(head)->nr_frags >= MAX_SKB_FRAGS)) {
+		BCMGENET_STATS64_INC((&ring->stats64), fragmented_errors);
+		bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
+		page_pool_put_full_page(ring->page_pool, page, true);
+		return NULL;
+	}
+
+	skb_add_rx_frag(head, skb_shinfo(head)->nr_frags, page,
+			offset + sizeof(struct status_64),
+			len - sizeof(struct status_64), size);
+
+	if (!(dma_flag & DMA_EOP))
+		return NULL;
+
+	ring->frag_head = NULL;
+
+	return head;
+}
+
 /* bcmgenet_desc_rx - descriptor based rx process.
  * this could be called from bottom half, or from NAPI polling method.
  */
@@ -2454,6 +2497,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 	unsigned int rxpktprocessed = 0, rxpkttoprocess;
 	unsigned int bytes_processed = 0;
 	unsigned int p_index, mask;
+	unsigned int rxframes = 0;
 	unsigned int discards;
 
 	/* Clear status before servicing to reduce spurious interrupts */
@@ -2501,6 +2545,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 
 		if (bcmgenet_rx_refill(ring, cb)) {
 			BCMGENET_STATS64_INC(stats, dropped);
+			bcmgenet_discard_frags(ring, false);
 			goto next;
 		}
 
@@ -2525,24 +2570,43 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 			  __func__, p_index, ring->c_index,
 			  ring->read_ptr, dma_length_status);
 
-		/* Only the first descriptor carries the alignment pad */
-		min_len = dma_flag & DMA_SOP ? GENET_RSB_PAD
-					     : sizeof(struct status_64);
+		/* Only the first descriptor carries the alignment pad. A head
+		 * with more to come needs the Ethernet header in it, a
+		 * continuation needs at least one payload byte.
+		 */
+		if (dma_flag & DMA_SOP) {
+			min_len = GENET_RSB_PAD;
+			if (!(dma_flag & DMA_EOP))
+				min_len += ETH_HLEN;
+		} else {
+			min_len = sizeof(struct status_64) + 1;
+		}
 
 		/* Reject lengths that would underflow the SKB build path. */
 		if (unlikely(len > priv->rx_buf_len || len < min_len)) {
 			netif_err(priv, rx_status, dev,
 				  "invalid packet length %d\n", len);
 			BCMGENET_STATS64_INC(stats, length_errors);
+			if ((dma_flag & DMA_SOP) && ring->frag_head)
+				BCMGENET_STATS64_INC(stats, fragmented_errors);
+			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
 			page_pool_put_full_page(ring->page_pool, rx_page,
 						true);
 			goto next;
 		}
 
-		if (unlikely(!(dma_flag & DMA_EOP) || !(dma_flag & DMA_SOP))) {
-			netif_err(priv, rx_status, dev,
-				  "dropping fragmented packet!\n");
-			BCMGENET_STATS64_INC(stats, fragmented_errors);
+		/* A new SOP picks up again after an incomplete frame */
+		if (dma_flag & DMA_SOP) {
+			if (ring->frag_head) {
+				BCMGENET_STATS64_INC(stats, fragmented_errors);
+				bcmgenet_discard_frags(ring, false);
+			}
+			ring->frag_drop = false;
+		} else if (unlikely(!ring->frag_head)) {
+			/* Rest of a dropped frame, or no SOP seen yet */
+			if (!ring->frag_drop)
+				BCMGENET_STATS64_INC(stats, fragmented_errors);
+			ring->frag_drop = !(dma_flag & DMA_EOP);
 			page_pool_put_full_page(ring->page_pool, rx_page,
 						true);
 			goto next;
@@ -2572,17 +2636,27 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 						DMA_RX_RXER)) == DMA_RX_RXER)
 				u64_stats_inc(&stats->errors);
 			u64_stats_update_end(&stats->syncp);
+			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
 			page_pool_put_full_page(ring->page_pool, rx_page,
 						true);
 			goto next;
 		} /* error packet */
 
+		if (!(dma_flag & DMA_SOP)) {
+			skb = bcmgenet_add_frag(ring, rx_page, rx_offset,
+						rx_size, dma_flag, len);
+			if (!skb)
+				goto next;
+			goto deliver;
+		}
+
 		/* Build SKB from the page - data starts at hard_start,
 		 * frame begins after RSB(64) + pad(2) = 66 bytes.
 		 */
 		skb = napi_build_skb(hard_start, rx_size);
 		if (unlikely(!skb)) {
 			BCMGENET_STATS64_INC(stats, dropped);
+			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
 			page_pool_put_full_page(ring->page_pool, rx_page,
 						true);
 			goto next;
@@ -2594,17 +2668,26 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 		skb_reserve(skb, GENET_RSB_PAD);
 		__skb_put(skb, len - GENET_RSB_PAD);
 
-		if (priv->crc_fwd_en) {
-			skb_trim(skb, skb->len - ETH_FCS_LEN);
+		if (unlikely(!(dma_flag & DMA_EOP))) {
+			ring->frag_head = skb;
+			goto next;
+		}
+
+deliver:
+		/* The FCS trim may release the page with the last status block */
+		rx_csum = (__force __be16)(status->rx_csum & 0xffff);
+
+		if (priv->crc_fwd_en &&
+		    unlikely(pskb_trim(skb, skb->len - ETH_FCS_LEN))) {
+			BCMGENET_STATS64_INC(stats, dropped);
+			dev_kfree_skb_any(skb);
+			goto next;
 		}
 
 		/* Set up checksum offload */
-		if (dev->features & NETIF_F_RXCSUM) {
-			rx_csum = (__force __be16)(status->rx_csum & 0xffff);
-			if (rx_csum) {
-				skb->csum = (__force __wsum)ntohs(rx_csum);
-				skb->ip_summed = CHECKSUM_COMPLETE;
-			}
+		if ((dev->features & NETIF_F_RXCSUM) && rx_csum) {
+			skb->csum = (__force __wsum)ntohs(rx_csum);
+			skb->ip_summed = CHECKSUM_COMPLETE;
 		}
 
 		len = skb->len;
@@ -2612,6 +2695,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 
 		/*Finish setting up the received SKB and send it to the kernel*/
 		skb->protocol = eth_type_trans(skb, priv->dev);
+		rxframes++;
 
 		u64_stats_update_begin(&stats->syncp);
 		u64_stats_inc(&stats->packets);
@@ -2638,7 +2722,8 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 	}
 
 	ring->dim.bytes = bytes_processed;
-	ring->dim.packets = rxpktprocessed;
+	/* A long frame spans several descriptors but is one packet */
+	ring->dim.packets = rxframes;
 
 	return rxpktprocessed;
 }
@@ -2705,6 +2790,8 @@ static void bcmgenet_free_rx_buffers(struct bcmgenet_priv *priv)
 			cb = ring->cbs + i;
 			bcmgenet_free_rx_cb(cb, ring->page_pool);
 		}
+		/* A partial frame still holds pages of this pool */
+		bcmgenet_discard_frags(ring, true);
 	}
 }
 
@@ -2775,7 +2862,9 @@ static void bcmgenet_link_intr_enable(struct bcmgenet_priv *priv)
 }
 
 /* Receive threshold in register units. Covers the alignment bytes and the
- * frame, but not the status block, which the hardware adds on top.
+ * frame, but not the status block, which the hardware adds on top. The
+ * usable maximum is whichever of register and page is smaller. A longer
+ * frame arrives in several descriptors.
  */
 static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
 {
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
index 1f48a67c5c01..8f432a830a5a 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
@@ -446,7 +446,7 @@ struct bcmgenet_rx_stats64 {
 #define DMA_RATE_ADJ_MASK		0xFF
 
 /* Tx/Rx Dma Descriptor common bits*/
-#define DMA_BUFLENGTH_MASK		0x0fff
+#define DMA_BUFLENGTH_MASK		0x0fff	/* RX status word only */
 #define DMA_BUFLENGTH_SHIFT		16
 #define DMA_OWN				0x8000
 #define DMA_EOP				0x4000
@@ -598,6 +598,8 @@ struct bcmgenet_rx_ring {
 	unsigned int	cb_ptr;		/* Rx ring initial CB ptr */
 	unsigned int	end_ptr;	/* Rx ring end CB ptr */
 	unsigned int	old_discards;
+	struct sk_buff	*frag_head;	/* frame being reassembled */
+	bool		frag_drop;	/* discarding until the next SOP */
 	struct bcmgenet_net_dim dim;
 	u32		rx_max_coalesced_frames;
 	u32		rx_coalesce_usecs;

-- 
2.53.0

