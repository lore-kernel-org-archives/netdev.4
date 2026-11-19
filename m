Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127950;
	b=5eSPiY1jBDrZM51ZWa9N9nPMO9zQHhVnYsGOuusG0ib3prWCbNMgpEh37i1LqmCJOOJd
	 KmtMy73P0YfXNciMPZK17UjBZAAgYlbKbEX+7JgPxU/PXPdwyyNl0zK4fOEqYxAzM/Mrc
	 2ch8w9rkJHlbgBTMnWT+otObdPdDHLDZOKxt/1M6lIOXJxTiLgioiY+Kyo/CLMwNUDEkB
	 hrO5JzpGkoE0GOiGO6zukXDPa6HntR77BN3vYmeyTigS746cKBd7pkwN7ExO35wUXCMdg
	 0uF3YOCCKS5wpYPwmqphkBy6Pv800CpFh3gn5DZQehb9iG/XGmlKJ7xh90P+EyVWIZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nqqO++vFC9aDHUzutfBX+HKI8o2EgIgvD6KzC9ZnVmg=;
	b=1x8UBLkTOPXblTJlnfHiQNPkpcaiUwxrNfYtFcP2FVSehxAbWtCrAkg1Wxalok6hr3F5
	 tQDrZh5A0XMQpkl+ejIRCDPg5QTkJ3yC6etNac5Y/JWV5T4zcg4PQ7K8yU2jBtlYo7YeB
	 brSfbBYwwy56hHFUj7S5XL1Xsud4SonHSFNOL6TvPCxJhLRAw7PyW5r12z6EJMhf3PlSe
	 e6RjswhCF0CnJK+aEZt5lgGLGEREV76s/mEgF9aGS6YJOo4REttHp72yzJ7tLod636702
	 nObN0Cp3Kx7GyUEe2oN902LrFJC5QuK1iUcM4Q19Rq/mS7SEAyTJyQcg8+X/SIM1whg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XG6lBdbY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A459E606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A459E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XG6lBdbY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382f4710a17so368033eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795127949; x=1795732749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqqO++vFC9aDHUzutfBX+HKI8o2EgIgvD6KzC9ZnVmg=;
        b=XG6lBdbYuIqEZo3h0QS84mXaT/XGGX0vQMI45CSZR8RMtXo8K+rXt7AYPjPUnzA+py
         /Gm4AQIa6g18zC05E/ZRZzfExhpKELtjg+CWJqMs9kYyDa1tfJPxbQCF16sHuSxjVz9L
         Zqtf8Oy99iP5yQk6SCtQuNzv+aM4OmB8GgGpl/nvFI0e6ZP4Pjhu/9RbD26C3ssWTauU
         HD3kTLTprMMu1UROEIjLiedYTektDZVr9o3YGdZDLPwy8d7GXgv3YQIeKU5Rz4tOausW
         308kOjMpZp7yl5OLAqOj9R5SSPQiWuSD8M8VPHwyuVhNmvoBodkM1yUJ3fdCusINxDj7
         dSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127949; x=1795732749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqqO++vFC9aDHUzutfBX+HKI8o2EgIgvD6KzC9ZnVmg=;
        b=LHp7EaPqkL4yfy9qis1JCcVdO5p6sr4SVN+SrKgts0qSXFumI94zegJAcBy+KO7AJH
         6qp5Dy9LGQok6wPwRH85GJaA7QvNtGKL0IXNX1YxLa3Sj6cVMQwzryCH2cSO1EeIavch
         l5a/yGABqKQ0zBJ9XCsBhqAbTFYlar7u486rBqzetUvJkIyEEbnwSXkEfd9ruuLFHtg8
         2xk94qJea00XP21hW4I/MGmVQgLX3F1/5qMwDkDKupF8arjkgmaq3yXVwwDnyvcf0pay
         uPzyeULiyO5WgtOrNATMfalRouZSYPsrKl20btQ9myfyvBBcLSqRnJnqrSKQKBGMeqec
         NdOA==
X-Gm-Message-State: APuU4Z/RPX45kfxV+tt33dH/SjoIuWwBmFlNw0h7LPWBJwRqU3uDFvMK
	MqgvqPYfOK0Qe/vbL4jqbR/uCbzUimGp+Ze1DnBCcq1Nat5OOoE+cgwm
X-Gm-Gg: AZFdTZdATioHYoG0jkswEk7hY/zDanCCnOprWVaPvces5r4LFo2doZPjhozI4e31QUd
	pTVezWaVLWZD2w6h2saOnuikHgC0ZmFK1ABdYh1uqq3pYc95ggjURxgH1/P2pPDA8WeinZB1JcB
	MNocCSwXDHRcc4kxr1nVQCCQK7Im49yW0JguhPklFOKdT+aEsWV0C6DbytL7e4UL5cVTFQ5Iowk
	E3y7IsM9rR2vX1bu59bq1QranZj4B1vUEbKyjn80EQu0gsYnnBg30shsolwkQhoY5ZeMHgLc+oe
	eFUsPVAHfskhGj0vxXxq0ZIBqpGWgtn29Xnfl1XWRPhlQux95BANqyJ1nxmvAJfTKbiUryeO+to
	gcik+46jf3lB1OfQc6osYhoMUOogWI+i0yDvJpe7vYxExk/ZJ70WXTUl+gLwCT7a/VubeZ9j/I+
	py2gVUBiKUHs2bjU1nk3l6EjsW4/BbHaKdYpZf0FOfxHdj5Kvztn1mXdLEXheDrJw4ZBZv1HhPe
	ph7+ZSdzHlNOQei30d4i3+Dz19GOEljD/1ZLgZev5U4sNaoasGsvUyO3vhxIVEiQxxdbXF/HkB5
	D1GLbTYclaH4t/PS1yIVz9cAMiACGxxsZ1QNNGT4jmQQhCt6PGdQRcws1suRX0dQOA==
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr618891eec.23.1795127948487;
        Thu, 19 Nov 2026 14:39:08 -0800 (PST)
Received: from narcisav-mac.corp.tfbnw.net ([2620:10d:c090:500::4:d73f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm1713379eec.12.2026.11.19.14.39.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 14:39:08 -0800 (PST)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Coco Li <lixiaoyan@google.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org,
	Narcisa Vasile <narcisav.kernel@gmail.com>
Subject: [PATCH net] eth: bnxt: split TX buffers that don't fit in a single BD
Date: Thu, 19 Nov 2026 14:38:54 -0800
Message-ID: <20261119223854.3050-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.53.1
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

The TX BD length field is 16 bits wide. Since BIG TCP raised
tso_max_size to GSO_MAX_SIZE, skbs can exceed 64KB.
A single frag can be 64KB or larger, e.g. with MSG_ZEROCOPY from a huge
page or in the case of a frag filling a whole 64KB page on arm64.

The driver silently truncates the length of these oversized buffers.
For example, a 65536 byte frag becomes a zero length BD, so the NIC sends
malformed LSO packets or stalls the TX queue.

Split these buffers over multiple BDs, at the largest 4KB multiple that
fits a BD (0xF000), so that a 64KB frag (e.g. a full page on 64KB-page
systems) becomes 60KB + 4KB rather than ending with a 1-byte BD.

Splitting can add up to 8 BDs to a GSO_MAX_SIZE skb. Raise the minimum
TX ring size (BNXT_MIN_TX_DESC_CNT) and the point at which the TX queue
is stopped, so that a packet of the largest size always fits. With
MAX_SKB_FRAGS at 17, the minimum TX ring size grows from 19 to 27 BDs.

With CONFIG_MAX_SKB_FRAGS raised above the default, an skb can need more
data BDs than a packet can have, either because splitting added BDs or
because it has more than TX_MAX_FRAGS frags. Clear the GSO features of
such skbs in bnxt_features_check() so the stack segments them, instead
of dropping or linearizing them in bnxt_start_xmit().

Found by enabling BIG TCP on a Broadcom NIC host.
Tested on x86_64 with the tso.py selftest and with tcp_mmap sending
MSG_ZEROCOPY BIG TCP traffic with frags larger than 64KB.

Fixes: b6488b161ab2 ("bnxt: Use generic HBH removal helper in tx path")
Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
Tested with the TX HW GSO queue stats patch applied, since tso.py skips
on bnxt without it:
https://lore.kernel.org/netdev/20261116204313.23023-1-narcisav.kernel@gmail.com/

# Interface: eth0, driver: bnxt_en
# Detected qstat for LSO super-packets
# Detected qstat for LSO wire-packets
TAP version 13
1..4
ok 1 tso.ipv4
ok 2 tso.big_tcp_ipv4
ok 3 tso.ipv6
ok 4 tso.big_tcp_ipv6
# Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 127 ++++++++++++++++++----
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  21 +++-
 2 files changed, 121 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 6846a27bfef4c..dfd9136e9cc72 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -478,6 +478,64 @@ static void bnxt_txr_db_kick(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 	txr->kick_pending = 0;
 }
 
+static unsigned int bnxt_tx_buf_extra_bds(unsigned int len)
+{
+	return len > BNXT_TX_MAX_BD_LEN ?
+	       DIV_ROUND_UP(len, BNXT_TX_SPLIT_BD_LEN) - 1 : 0;
+}
+
+static unsigned int bnxt_tx_buf_first_bd_len(unsigned int len)
+{
+	return len > BNXT_TX_MAX_BD_LEN ? BNXT_TX_SPLIT_BD_LEN : len;
+}
+
+static unsigned int bnxt_tx_nr_data_bds(const struct sk_buff *skb)
+{
+	const struct skb_shared_info *shinfo = skb_shinfo(skb);
+	unsigned int i, bds;
+
+	if (likely(skb->len <= BNXT_TX_MAX_BD_LEN))
+		return shinfo->nr_frags;
+
+	/* Count data BDs, excluding the first head BD and the extended BD. */
+	bds = shinfo->nr_frags + bnxt_tx_buf_extra_bds(skb_headlen(skb));
+	for (i = 0; i < shinfo->nr_frags; i++)
+		bds += bnxt_tx_buf_extra_bds(skb_frag_size(&shinfo->frags[i]));
+
+	return bds;
+}
+
+/* Fill the BDs for the tail of a mapped buffer that didn't fit in its
+ * first BD.  Only the first BD of the buffer holds the DMA unmap info.
+ * Returns the last BD filled.
+ */
+static struct tx_bd *bnxt_tx_split_buf(struct bnxt *bp,
+				       struct bnxt_tx_ring_info *txr,
+				       u16 *prod, dma_addr_t mapping,
+				       unsigned int len)
+{
+	struct bnxt_sw_tx_bd *tx_buf;
+	unsigned int bd_len;
+	struct tx_bd *txbd;
+
+	do {
+		*prod = NEXT_TX(*prod);
+		txbd = &txr->tx_desc_ring[TX_RING(bp, *prod)][TX_IDX(*prod)];
+		tx_buf = &txr->tx_buf_ring[RING_TX(bp, *prod)];
+		dma_unmap_len_set(tx_buf, len, 0);
+
+		bd_len = min(len, BNXT_TX_SPLIT_BD_LEN);
+		txbd->tx_bd_haddr = cpu_to_le64(mapping);
+		txbd->tx_bd_len_flags_type =
+			cpu_to_le32(bd_len << TX_BD_LEN_SHIFT);
+
+		mapping += bd_len;
+		len -= bd_len;
+	} while (len);
+
+	return txbd;
+}
+
 static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct bnxt *bp = netdev_priv(dev);
@@ -489,8 +547,8 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	unsigned int length;
 	u32 len, free_size, vlan_tag_flags, cfa_action, flags;
 	struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
+	u16 prod, last_frag, nr_bds, txts_prod;
 	struct pci_dev *pdev = bp->pdev;
-	u16 prod, last_frag, txts_prod;
 	struct bnxt_tx_ring_info *txr;
 	struct bnxt_sw_tx_bd *tx_buf;
 	__le32 lflags = 0;
@@ -546,8 +604,17 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto tx_kick_pending;
 	}
 
+	/* Data BDs after the long BD and the extended BD */
+	nr_bds = bnxt_tx_nr_data_bds(skb);
+	if (unlikely(nr_bds > TX_MAX_FRAGS)) {
+		/* bnxt_features_check() makes the stack segment these */
+		netdev_warn_once(dev, "SKB needs too many (%d) TX BDs, max supported is %d\n",
+				 nr_bds, TX_MAX_FRAGS);
+		goto tx_free;
+	}
+
 	free_size = bnxt_tx_avail(bp, txr);
-	if (unlikely(free_size < skb_shinfo(skb)->nr_frags + 2)) {
+	if (unlikely(free_size < nr_bds + 2)) {
 		/* We must have raced with NAPI cleanup */
 		if (net_ratelimit() && txr->kick_pending)
 			netif_warn(bp, tx_err, dev,
@@ -565,7 +632,7 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
 	tx_buf->skb = skb;
-	tx_buf->nr_frags = last_frag;
+	tx_buf->nr_frags = nr_bds;
 
 	vlan_tag_flags = 0;
 	cfa_action = bnxt_xmit_get_cfa_action(skb);
@@ -689,11 +756,11 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	dma_unmap_addr_set(tx_buf, mapping, mapping);
 	dma_unmap_len_set(tx_buf, len, len);
-	flags = (len << TX_BD_LEN_SHIFT) | TX_BD_TYPE_LONG_TX_BD |
-		TX_BD_CNT(last_frag + 2);
+	flags = (bnxt_tx_buf_first_bd_len(len) << TX_BD_LEN_SHIFT) |
+		TX_BD_TYPE_LONG_TX_BD | TX_BD_CNT(nr_bds + 2);
 
 	txbd->tx_bd_haddr = cpu_to_le64(mapping);
-	txbd->tx_bd_opaque = SET_TX_OPAQUE(bp, txr, prod, 2 + last_frag);
+	txbd->tx_bd_opaque = SET_TX_OPAQUE(bp, txr, prod, 2 + nr_bds);
 
 	prod = NEXT_TX(prod);
 	txbd1 = bnxt_init_ext_bd(bp, txr, prod, lflags, vlan_tag_flags,
@@ -731,13 +798,17 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (unlikely(length >= ARRAY_SIZE(bnxt_lhint_arr))) {
 		dev_warn_ratelimited(&pdev->dev, "Dropped oversize %d bytes TX packet.\n",
 				     skb->len);
-		i = 0;
-		goto tx_dma_error;
+		goto tx_unmap_head;
 	}
 	flags |= bnxt_lhint_arr[length];
 	txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
 
 	txbd0 = txbd;
+	if (unlikely(len > BNXT_TX_MAX_BD_LEN))
+		txbd = bnxt_tx_split_buf(bp, txr, &prod,
+					 mapping + BNXT_TX_SPLIT_BD_LEN,
+					 len - BNXT_TX_SPLIT_BD_LEN);
+
 	for (i = 0; i < last_frag; i++) {
 		frag = &skb_shinfo(skb)->frags[i];
 		prod = NEXT_TX(prod);
@@ -757,8 +828,13 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		txbd->tx_bd_haddr = cpu_to_le64(mapping);
 
-		flags = len << TX_BD_LEN_SHIFT;
+		flags = bnxt_tx_buf_first_bd_len(len) << TX_BD_LEN_SHIFT;
 		txbd->tx_bd_len_flags_type = cpu_to_le32(flags);
+
+		if (unlikely(len > BNXT_TX_MAX_BD_LEN))
+			txbd = bnxt_tx_split_buf(bp, txr, &prod,
+						 mapping + BNXT_TX_SPLIT_BD_LEN,
+						 len - BNXT_TX_SPLIT_BD_LEN);
 	}
 
 	txbd->tx_bd_len_flags_type |= cpu_to_le32(TX_BD_FLAGS_PACKET_END);
@@ -784,7 +860,7 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 tx_done:
 
-	if (unlikely(bnxt_tx_avail(bp, txr) <= MAX_SKB_FRAGS + 1)) {
+	if (unlikely(bnxt_tx_avail(bp, txr) < BNXT_TX_MAX_SKB_BDS)) {
 		if (txr->kick_pending)
 			bnxt_txr_db_kick(bp, txr, prod);
 
@@ -794,26 +870,25 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 
 tx_dma_error:
-	last_frag = i;
-
-	/* start back at beginning and unmap skb */
-	prod = txr->tx_prod;
-	tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
-	dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
-			 skb_headlen(skb), DMA_TO_DEVICE);
-	prod = NEXT_TX(prod);
-
-	/* unmap remaining mapped pages */
-	for (i = 0; i < last_frag; i++) {
+	/* unmap the BDs between the extended BD and the failed one */
+	nr_bds = prod - txr->tx_prod - 2;
+	prod = NEXT_TX(txr->tx_prod);
+	for (i = 0; i < nr_bds; i++) {
 		prod = NEXT_TX(prod);
 		tx_buf = &txr->tx_buf_ring[RING_TX(bp, prod)];
-		frag = &skb_shinfo(skb)->frags[i];
+		if (!dma_unmap_len(tx_buf, len))
+			continue;
 		netmem_dma_unmap_page_attrs(&pdev->dev,
 					    dma_unmap_addr(tx_buf, mapping),
-					    skb_frag_size(frag),
+					    dma_unmap_len(tx_buf, len),
 					    DMA_TO_DEVICE, 0);
 	}
 
+tx_unmap_head:
+	tx_buf = &txr->tx_buf_ring[RING_TX(bp, txr->tx_prod)];
+	dma_unmap_single(&pdev->dev, dma_unmap_addr(tx_buf, mapping),
+			 skb_headlen(skb), DMA_TO_DEVICE);
+
 tx_free:
 	dev_kfree_skb_any(skb);
 tx_kick_pending:
@@ -14308,6 +14383,12 @@ static netdev_features_t bnxt_features_check(struct sk_buff *skb,
 
 	features = vlan_features_check(skb, features);
 
+#if (BNXT_TX_MAX_SKB_BDS > TX_MAX_BD_CNT)
+	/* Let the stack segment skbs that exceed the TX BD limit per packet. */
+	if (unlikely(bnxt_tx_nr_data_bds(skb) > TX_MAX_FRAGS))
+		features &= ~NETIF_F_GSO_MASK;
+#endif
+
 	/* SW USO pads at most the last segment; let the stack segment skbs
 	 * where every segment would be shorter than BNXT_MIN_PKT_SIZE.
 	 */
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307a..14948b7800dcf 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/rhashtable.h>
 #include <linux/crash_dump.h>
+#include <linux/sizes.h>
 #include <net/devlink.h>
 #include <net/dst_metadata.h>
 #include <net/xdp.h>
@@ -90,6 +91,20 @@ struct tx_bd {
 
 #define TX_MAX_FRAGS		(TX_MAX_BD_CNT - 2)
 
+/* Largest length that fits in TX_BD_LEN. */
+#define BNXT_TX_MAX_BD_LEN	0xffff
+
+/* BD length for split buffers, a multiple of 4K so that 64K frags don't
+ * end with a 1-byte BD.
+ */
+#define BNXT_TX_SPLIT_BD_LEN	(BNXT_TX_MAX_BD_LEN & ~(SZ_4K - 1))
+
+/* Most BDs one skb can need: one per frag, extra BDs from splitting,
+ * plus the long BD and the extended BD.
+ */
+#define BNXT_TX_MAX_SKB_BDS	\
+	(MAX_SKB_FRAGS + GSO_MAX_SIZE / BNXT_TX_SPLIT_BD_LEN + 2)
+
 struct tx_bd_ext {
 	__le32 tx_bd_hsize_lflags;
 	#define TX_BD_FLAGS_TCP_UDP_CHKSUM			(1 << 0)
@@ -824,10 +839,8 @@ struct nqe_cn {
 #define BNXT_MAX_RX_JUM_DESC_CNT	(RX_DESC_CNT * MAX_RX_AGG_PAGES - 1)
 #define BNXT_MAX_TX_DESC_CNT		(TX_DESC_CNT * MAX_TX_PAGES - 1)
 
-/* Minimum TX BDs for a TX packet with MAX_SKB_FRAGS + 1.  We need one extra
- * BD because the first TX BD is always a long BD.
- */
-#define BNXT_MIN_TX_DESC_CNT		(MAX_SKB_FRAGS + 2)
+/* Minimum TX BDs to fit the largest TX packet. */
+#define BNXT_MIN_TX_DESC_CNT		BNXT_TX_MAX_SKB_BDS
 
 #define RX_RING(bp, x)	(((x) & (bp)->rx_ring_mask) >> (BNXT_PAGE_SHIFT - 4))
 #define RX_AGG_RING(bp, x)	(((x) & (bp)->rx_agg_ring_mask) >>	\
-- 
2.53.1-Meta

