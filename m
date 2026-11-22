Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389222;
	b=q6Idk9WZADbYZv2RFwWPGnnGWX42FhPuZPvPfrlljHAL7v1W8DeZLzqzOKIlIQ+i6HE8
	 b1qepIVYSc4vAZ6lBPRlrBvD2vem+veAJ2ETokrQhNwEkJOEDuUplPlXH+9OjavqYOLdb
	 hudwYCBE8JnLWYwy81tCf8gMRMTbis851UXq5mjSgfDFPRmXU1f9l523NYetdrZ0Hwzs9
	 AiA0YMpGry41GuwlkDx2o2SsVh3Ar7zCmzqzs8ii4PPRHBSr1TD6fo/D8xBpUhHsPpAxV
	 VamgO0Xlw7zqERztw6IbvWyb85lGdzGYLKOq0Y/LI/LpZaptxsjXjHLmfhCYlibjrUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389222;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wRY6v2OvQk/1pSzjcfoOBiwTn/+YrhAaM9qXn3kcZqs=;
	b=tXB2W4ru00eRSaAjoRLXMOvJ3FXzh1oGM2nar/o63UmKmdzywNi+tx91jd9SaL3UpCxi
	 4qiSRW1RaLTy0n0+vV8gzY7B74ZygozuCCxeTy8oqDSRGMzoi8kU4mxCBqPo+ZfxSVt6m
	 OumLLQHPSkhx2TAk9MEeV5tW4T0WbyoKoS7+BdTPO9SLAb1ReXtBoeOMjN6P/oIw/yjKf
	 U0XvSjwrFzRQTfYcQILgEPuQcay/+2JI27y2VekN74Sb8qsbBoFDi0as7SIKV/l1mOAZh
	 39xJzWBi3dx6VsGgVuNG7hluW8f/0VfZ5bPJEpk000lCPwuq0EviVaKp93YAypGkBCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=jaSUaFJr;
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66E3606A31D;
	Sun, 22 Nov 2026 23:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=jaSUaFJr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1795389217; bh=wRY6v2OvQk/1pSzjcfoOBiwTn/+YrhAaM9qXn3kcZqs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jaSUaFJrwdqkGSQj/rs0PCwM0CxVNVhS3XcsJwIQ55OGBMgbWmTAtE0kI72eHyi72
	 EW5+jYxCr6txkK9Xz97OfoZ2+rnSoU2HKaRwzUwUN8E01BKAk80VRfsamhvcVUmH0u
	 585/b8Lw7mpMI8KCkuIZjGhPvA+OHokKNjZJrheULqspmsNyhONW1JckSUn6P77oWR
	 ZTBh36gHD3/SNdpkN4iyQI0A9VvzFvIAvJkXVfKC4gu7ln0nb+pn1YVozKx1CyuAU4
	 gyirVpmq4EuiDyh+Ivh9kUN4cbCbufvBhOpf4zCCeKx9naIdyXY1sRAZ35/C3VaX+k
	 dV3qrJx+P947Q==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id 323B427A3620;
	Mon, 23 Nov 2026 01:13:37 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Mason Chang <mason-cw.chang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 3/3] net: ethernet: mtk_eth_soc: add 9K jumbo
Date: Mon, 23 Nov 2026 01:13:31 +0200
Message-Id: <patch-33f903552b0fbd7330e1165ec70bbb39@loljews.com>
In-Reply-To: <patch-51fa5ed3bc801edb3f29b61ca7888382@loljews.com>
References: <patch-51fa5ed3bc801edb3f29b61ca7888382@loljews.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The driver caps max_mtu at 2030 bytes and programs the MAC max-rx
field for at most 2048-byte frames, so MTU > 2K is rejected and 9K
jumbo frames are not usable on the 10G XGMII MACs.

Add a MTK_NETSYS_RX_9K capability for MT7988 and:
- advertise a 9194-byte max_mtu on the XGMII MACs, from the DT
  phy_mode at probe time, so DSA can raise the conduit MTU before the
  netdev is opened.  The four bytes below the 9216-byte MAC and ring
  cap keep room for the 802.1Q tag of a maximum-size frame;
- derive the shared RX buffer length from the largest MTU of any MAC,
  with a 2K floor checked first and the 802.1Q headroom added before
  the 1 KiB round-up, and size the RX rings from it.  The floor keeps
  the 2030-byte MTU of the non-XGMII MACs on 2K buffers, as before.
  The QDMA RX ring is never polled or refilled by the CPU, so it keeps
  its 2K buffers;
- program ADMA_RX_CFG[31:16] from that length on netsys v3+.  The
  MT7988A reference manual names the field "ADMA LRO free buffer SDL",
  the capacity of the buffer the ADMA is handed, and it is encoded the
  way the MediaTek downstream driver does it (MTK_PDMA_LRO_SDL plus the
  frame area).  It is not the RX frame-length limit; that is the
  per-descriptor PLEN0 together with the MAC limit;
- program XMAC_RX_CFG2 from the same length on the XGMII MACs, keeping
  the bits outside the length field, so a tagged maximum-size frame
  fits from the first 3K class up.  GMAC1 (the built-in switch port,
  phy-mode internal) keeps
  its MCR programming instead: the XMAC register is not used for it,
  and the MCR max-rx field gets the jumbo field (bits 31:28, in
  1024-byte units, the encoding of the MediaTek downstream driver),
  so the same shared length can be programmed for GMAC1 as for the
  XGMII MACs.  The reference manual defines only 4'h2 (2 Kbytes) for
  that field and marks the other encodings reserved; the vendor driver
  programs the length there and jumbo passes on its reference
  hardware, so the vendor encoding is kept for the internal switch
  port.  The write runs after the XGMII setup of
  mtk_mac_config(), whose MAC_MCR_FORCE_LINK_DOWN write is a
  full-register write that would otherwise reset the field to the
  1518 bucket.  Whether the internal switch path enforces the MCR
  field for switch-side frames at all is a hardware property: the
  downstream reference programs no limit for GMAC1 and jumbo frames
  pass the switch on the reference hardware, which suggests the field
  is not enforced there;
- drop a descriptor whose PLEN0 exceeds the posted buffer and count it
  in rx_length_errors, which mtk_get_stats64() now merges into the
  exported counter, so an over-long descriptor cannot hand the
  unwritten remainder of the buffer up the stack and the drop is
  visible to userspace;
- rewrite the MAC limits on every successful mtk_mac_config(), on
  mtk_hw_init() and whenever the MTU changes, on the SoCs with the
  capability, so no MAC accepts a frame the rings cannot hold, not
  even after a reopen with a smaller MTU.  The limits are a property
  of the shared rings, so changing one device reprograms every MAC,
  and the XMAC limit is written again after the XMAC logic reset that
  mtk_xgdm_mac_link_up() pulses: RX_CFG2 resets to 0x800 (2048 bytes),
  so a reset would otherwise cap the MAC at 2K.  The other SoCs
  keep their per-device limits: they never grow their rings, and
  their MCR programming is left exactly as before this patch;
- reject a runtime MTU change that would need larger buffers while
  DMA is running (-EBUSY).  Shrinking is allowed: the rings keep the
  buffers they already have.  The rings are shared by every MAC, so
  raising a DSA user port MTU on a live system fails while any MAC is
  up; the runtime reallocation that lifts this is a separate series.

XDP runs only on rings that have a page_pool, and the pool cannot back
buffers larger than MTK_PP_MAX_BUF_SIZE, so an MTU that needs a larger
buffer cannot be combined with XDP; attaching a program is rejected in
that case.  The check uses eth->rx_buf_len, the length the live rings
were actually built with; when the rings are not live, or the attach
itself tears them down, the next open re-derives the length from the
current MTUs and that value is checked instead.  A program can
therefore never attach and silently not run, and an attach on a
closed device is never rejected over a stale ring length.  Detaching
is always allowed: it does not need a page_pool.

With the 1 KiB rounding, the buffer length is order-1 (8 KiB) for
rx_buf_len 4096..7168 (MTU about 3051..7146) and order-2 (16 KiB)
from rx_buf_len 8192 (MTU 7147) up: once any MAC's MTU reaches 7147,
every RX buffer is a 16 KiB compound page, which pins 2048 x 16 KiB
(about 32 MiB) in the single CPU-polled ring on MT7988 while DMA is up
and turns the refill into a high-order GFP_ATOMIC allocation.
skb->truesize reports the size that was actually allocated for those
buffers, not the smaller frag_size.  That correction also covers the
HW-LRO rings on mt2701, mt7622, mt7623 and mt7629, whose ~12.4 KiB
buffers now report 16 KiB.

This is a forward-port of the MediaTek downstream jumbo work: Mason
Chang's "change default rx buffer length" and "add 9k jumbo frame
support" (MediaTek OpenWrt feed 999-eth-30/31, carried in
frank-w/BPI-Router-Linux), plus Frank Wunderlich's "try to fix crash
the right way".  The runtime reallocation of Mason's "dynamic rx
buffer adjustment" (feed 999-eth-33) is not included; it will be sent
separately.

Link: https://github.com/frank-w/BPI-Router-Linux/commit/b4c6cb1d5532
Link: https://github.com/mediatek/mtk-openwrt-feeds
Signed-off-by: Sandeep Haemoon <sandeeph@loljews.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 384 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  16 +-
 2 files changed, 343 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b3a6e57035..bc0295f952 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -170,6 +170,7 @@ static const struct mtk_reg_map mt7988_reg_map = {
 		.pcrx_ptr	= 0x6908,
 		.glo_cfg	= 0x6a04,
 		.rst_idx	= 0x6a08,
+		.rx_cfg		= 0x6a10,
 		.delay_irq	= 0x6a0c,
 		.irq_status	= 0x6a20,
 		.irq_mask	= 0x6a28,
@@ -554,6 +555,98 @@ static int mtk_mac_prepare(struct phylink_config *config, unsigned int mode,
 	return 0;
 }
 
+/* The MACs are fed from the shared RX rings, so the maximum frame they may
+ * accept is a property of the ring buffer length.  GMAC1 on netsys v3+ is
+ * the built-in switch port: it has no XMAC_RX_CFG2 limit register, so it
+ * keeps the MCR programming the other SoCs use, extended with the MCR
+ * jumbo field so its limit can grow with the rings like the XGMII MACs'.
+ */
+static void mtk_set_mcr_max_rx(struct mtk_mac *mac, u32 val)
+{
+	struct mtk_eth *eth = mac->hw;
+	u32 mcr_cur, mcr_new;
+
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
+		return;
+
+	if (!mtk_interface_mode_is_xgmii(eth, mac->interface) ||
+	    mac->id == MTK_GMAC1_ID) {
+		mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
+		mcr_new = mcr_cur & ~MAC_MCR_MAX_RX_MASK;
+
+		if (val <= 1518)
+			mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_1518);
+		else if (val <= 1536)
+			mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_1536);
+		else if (val <= 1552)
+			mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_1552);
+		else
+			mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_2048);
+
+		/* The bucket encodes at most 2048; the SoCs with the 9K
+		 * capability need the jumbo field, in 1024-byte units, for
+		 * anything larger.  The MT7988A reference manual defines
+		 * only 4'h2 (2 Kbytes) for that field and marks the rest
+		 * reserved, while the MediaTek downstream driver programs
+		 * the length there and jumbo passes on its reference
+		 * hardware; the vendor encoding is kept for the internal
+		 * switch port.  Clearing it together with the bucket keeps
+		 * a later MTU shrink from leaving a stale larger limit
+		 * behind.
+		 */
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K)) {
+			u32 jumbo = DIV_ROUND_UP(val, MTK_MAX_RX_LENGTH_UNIT);
+
+			mcr_new &= ~MAC_MCR_MAX_RX_JUMBO_MASK;
+
+			if (val > 1552)
+				mcr_new |= MAC_MCR_MAX_RX_JUMBO(jumbo);
+		}
+
+		if (mcr_new != mcr_cur)
+			mtk_w32(mac->hw, mcr_new, MTK_MAC_MCR(mac->id));
+	} else {
+		mcr_cur = mtk_r32(mac->hw, MTK_XMAC_RX_CFG2(mac->id));
+		mcr_new = mcr_cur & ~MTK_XMAC_MAX_RX_MASK;
+		mcr_new |= FIELD_PREP(MTK_XMAC_MAX_RX_MASK,
+				      min_t(u32, val, MTK_MAX_RX_LENGTH_9K));
+
+		if (mcr_new != mcr_cur)
+			mtk_w32(mac->hw, mcr_new, MTK_XMAC_RX_CFG2(mac->id));
+	}
+}
+
+/* The RX rings are shared by every MAC, so all of them have to accept at
+ * most the length the buffers can hold.  The XGMII MACs have a per-MAC
+ * register and GMAC1 uses the MCR buckets, so walk all of them.
+ */
+static void mtk_set_all_macs_max_rx(struct mtk_eth *eth)
+{
+	int i;
+
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
+		return;
+
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		struct mtk_mac *mac;
+
+		if (!eth->netdev[i])
+			continue;
+
+		mac = netdev_priv(eth->netdev[i]);
+
+		/* Before the first mac_config() the interface mode is not
+		 * known and the limit would be written to the MCR register
+		 * of an XGMII MAC.  That open programs every MAC from its
+		 * own mac_config() anyway.
+		 */
+		if (mac->interface == PHY_INTERFACE_MODE_NA)
+			continue;
+
+		mtk_set_mcr_max_rx(mac, eth->rx_buf_len);
+	}
+}
+
 static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 			   const struct phylink_link_state *state)
 {
@@ -678,6 +771,18 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 			mtk_setup_bridge_switch(eth);
 	}
 
+	/* On the SoCs with the 9K capability the rings grow with the MTU, so
+	 * rewrite the MAC limit on every successful mac_config, not only
+	 * when the interface mode changes: a reopen after an MTU change
+	 * must narrow the MACs that still carry the previous, larger
+	 * limit.  This must run after the XGMII setup above: its
+	 * MAC_MCR_FORCE_LINK_DOWN write is a full-register write that
+	 * would otherwise reset GMAC1's max-rx field (its limit lives in
+	 * the MCR register, not in XMAC_RX_CFG2) back to the 1518 bucket.
+	 */
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
+		mtk_set_mcr_max_rx(mac, eth->rx_buf_len);
+
 	return;
 
 err_phy:
@@ -877,6 +982,12 @@ static void mtk_xgdm_mac_link_up(struct mtk_mac *mac,
 		mcr |= XMAC_MCR_FORCE_RX_FC;
 
 	mtk_w32(mac->hw, mcr, MTK_XMAC_MCR(mac->id));
+
+	/* The logic reset above can clear the RX size limit programmed from
+	 * mtk_mac_config(), so set it again now that the logic is out of
+	 * reset and the interface mode is known.
+	 */
+	mtk_set_mcr_max_rx(mac, mac->hw->rx_buf_len);
 }
 
 static void mtk_mac_link_up(struct phylink_config *config,
@@ -1239,29 +1350,40 @@ static void mtk_get_stats64(struct net_device *dev,
 
 	storage->tx_errors = dev->stats.tx_errors;
 	storage->rx_dropped = dev->stats.rx_dropped;
+	storage->rx_length_errors += dev->stats.rx_length_errors;
 	storage->tx_dropped = dev->stats.tx_dropped;
 }
 
-static inline int mtk_max_frag_size(int mtu)
+static inline int mtk_max_frag_size(u32 rx_buf_len, int mtu)
 {
-	/* make sure buf_size will be at least MTK_MAX_RX_LENGTH */
-	if (mtu + MTK_RX_ETH_HLEN < MTK_MAX_RX_LENGTH_2K)
-		mtu = MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
+	/* make sure buf_size will be at least the rx buffer length */
+	if (mtu + MTK_RX_ETH_HLEN < rx_buf_len)
+		mtu = rx_buf_len - MTK_RX_ETH_HLEN;
 
 	return SKB_DATA_ALIGN(MTK_RX_HLEN + mtu) +
 		SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
 }
 
-static inline int mtk_max_buf_size(int frag_size)
+static inline int mtk_max_buf_size(u32 rx_buf_len, int frag_size)
 {
 	int buf_size = frag_size - NET_SKB_PAD - NET_IP_ALIGN -
 		       SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
 
-	WARN_ON(buf_size < MTK_MAX_RX_LENGTH_2K);
+	WARN_ON(buf_size < rx_buf_len);
 
 	return buf_size;
 }
 
+/* The descriptor length a normal RX ring gets for a given shared buffer
+ * length.  The page_pool gate in mtk_rx_alloc() uses the same value, so the
+ * XDP admission checks test exactly what the pool can back.
+ */
+static u32 mtk_rx_ring_buf_size(u32 rx_buf_len)
+{
+	return mtk_max_buf_size(rx_buf_len,
+				mtk_max_frag_size(rx_buf_len, ETH_DATA_LEN));
+}
+
 static bool mtk_rx_get_desc(struct mtk_eth *eth, struct mtk_rx_dma_v2 *rxd,
 			    struct mtk_rx_dma_v2 *dma_rxd)
 {
@@ -1280,9 +1402,17 @@ static bool mtk_rx_get_desc(struct mtk_eth *eth, struct mtk_rx_dma_v2 *rxd,
 	return true;
 }
 
-static void *mtk_max_lro_buf_alloc(gfp_t gfp_mask)
+/* mtk_max_buf_alloc() rounds the buffer up to a whole page order, so
+ * report the size it actually allocated, not the smaller frag_size, in
+ * skb->truesize.
+ */
+static unsigned int mtk_buf_alloc_size(unsigned int size)
+{
+	return PAGE_SIZE << get_order(size);
+}
+
+static void *mtk_max_buf_alloc(unsigned int size, gfp_t gfp_mask)
 {
-	unsigned int size = mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH);
 	unsigned long data;
 
 	data = __get_free_pages(gfp_mask | __GFP_COMP | __GFP_NOWARN,
@@ -2268,6 +2398,15 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 
 		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
 
+		/* The engine can report a length larger than the posted
+		 * buffer; never pass the unwritten remainder of the buffer
+		 * up the stack.
+		 */
+		if (unlikely(pktlen > ring->buf_size)) {
+			netdev->stats.rx_length_errors++;
+			goto release_desc;
+		}
+
 		/* alloc new buffer */
 		if (ring->page_pool) {
 			struct page *page = virt_to_head_page(data);
@@ -2313,10 +2452,15 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 				skb_metadata_set(skb, metasize);
 			skb_mark_for_recycle(skb);
 		} else {
+			unsigned int alloc_size = ring->frag_size > PAGE_SIZE ?
+				mtk_buf_alloc_size(ring->frag_size) :
+				ring->frag_size;
+
 			if (ring->frag_size <= PAGE_SIZE)
 				new_data = napi_alloc_frag(ring->frag_size);
 			else
-				new_data = mtk_max_lro_buf_alloc(GFP_ATOMIC);
+				new_data = mtk_max_buf_alloc(ring->frag_size,
+							     GFP_ATOMIC);
 
 			if (unlikely(!new_data)) {
 				netdev->stats.rx_dropped++;
@@ -2339,7 +2483,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
 					 ring->buf_size, DMA_FROM_DEVICE);
 
-			skb = build_skb(data, ring->frag_size);
+			skb = build_skb(data, alloc_size);
 			if (unlikely(!skb)) {
 				netdev->stats.rx_dropped++;
 				skb_free_frag(data);
@@ -2800,6 +2944,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	const struct mtk_soc_data *soc = eth->soc;
 	struct mtk_rx_ring *ring;
 	int rx_data_len, rx_dma_size;
+	u32 buf_len;
 	int i;
 
 	if (rx_flag == MTK_RX_FLAGS_QDMA) {
@@ -2818,8 +2963,19 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 		rx_dma_size = soc->rx.dma_size;
 	}
 
-	ring->frag_size = mtk_max_frag_size(rx_data_len);
-	ring->buf_size = mtk_max_buf_size(ring->frag_size);
+	/* The QDMA RX ring is only ever scratch memory for the engine: the
+	 * CPU neither polls nor refills it, so it keeps its 2K buffers
+	 * even when the polled rings grow.
+	 */
+	if (rx_flag == MTK_RX_FLAGS_QDMA)
+		buf_len = MTK_MAX_RX_LENGTH_2K;
+	else if (rx_flag == MTK_RX_FLAGS_HWLRO)
+		buf_len = max_t(u32, eth->rx_buf_len, MTK_MAX_LRO_RX_LENGTH);
+	else
+		buf_len = eth->rx_buf_len;
+
+	ring->frag_size = mtk_max_frag_size(buf_len, rx_data_len);
+	ring->buf_size  = mtk_max_buf_size(buf_len, ring->frag_size);
 	ring->data = kzalloc_objs(*ring->data, rx_dma_size);
 	if (!ring->data)
 		return -ENOMEM;
@@ -2827,7 +2983,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	/* A page_pool hands out order-0 pages and is created with
 	 * MTK_PP_MAX_BUF_SIZE, so it can only back a ring whose descriptor
 	 * length fits.  Larger rings use the netdev_alloc_frag()/
-	 * mtk_max_lro_buf_alloc() path below instead.
+	 * mtk_max_buf_alloc() path below instead.
 	 */
 	if (mtk_page_pool_enabled(eth) &&
 	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {
@@ -2863,7 +3019,8 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 			if (ring->frag_size <= PAGE_SIZE)
 				data = netdev_alloc_frag(ring->frag_size);
 			else
-				data = mtk_max_lro_buf_alloc(GFP_KERNEL);
+				data = mtk_max_buf_alloc(ring->frag_size,
+							 GFP_KERNEL);
 
 			if (!data)
 				return -ENOMEM;
@@ -3259,6 +3416,71 @@ static int mtk_dma_busy_wait(struct mtk_eth *eth)
 	return ret;
 }
 
+static int mtk_max_gmac_mtu(struct mtk_eth *eth)
+{
+	int i, max_mtu = ETH_DATA_LEN;
+
+	for (i = 0; i < ARRAY_SIZE(eth->netdev); i++)
+		if (eth->netdev[i] && eth->netdev[i]->mtu > max_mtu)
+			max_mtu = eth->netdev[i]->mtu;
+
+	return max_mtu;
+}
+
+static u32 mtk_rx_buf_len_from_mtu(struct mtk_eth *eth, int max_mtu)
+{
+	int length;
+
+	/* Only the SoCs with the 9K capability grow the shared rings with
+	 * the MTU.  Everywhere else the buffers stay at 2K, so the largest
+	 * MTU those SoCs advertise keeps working at runtime and the -EBUSY
+	 * rule below never applies to them.
+	 */
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
+		return MTK_MAX_RX_LENGTH_2K;
+
+	/* Keep everything the 2K buffers already cover on the 2K floor.
+	 * Adding the VLAN headroom first would round the largest MTU the
+	 * non-XGMII MACs advertise (2030) up to 3072 and make a runtime MTU
+	 * change fail with -EBUSY.
+	 */
+	if (max_mtu + MTK_RX_ETH_HLEN <= MTK_MAX_RX_LENGTH_2K)
+		return MTK_MAX_RX_LENGTH_2K;
+
+	length = max_mtu + MTK_RX_ETH_HLEN + VLAN_HLEN;
+
+	return DIV_ROUND_UP(length, 1024) * 1024;
+}
+
+/* The rx rings are shared by every MAC, so their buffers are sized for
+ * the largest MTU configured on any of them.
+ */
+static u32 mtk_rx_buf_len(struct mtk_eth *eth)
+{
+	return mtk_rx_buf_len_from_mtu(eth, mtk_max_gmac_mtu(eth));
+}
+
+/* Program ADMA_RX_CFG[31:16], "ADMA LRO free buffer SDL" in the MT7988A
+ * reference manual: the capacity of the buffer the ADMA is handed,
+ * encoded the way the MediaTek downstream driver does it
+ * (MTK_PDMA_LRO_SDL plus the frame area).  It is not the RX frame-length
+ * limit; that is the per-descriptor PLEN0 together with the MAC limit.
+ */
+static void mtk_pdma_set_sdl(struct mtk_eth *eth)
+{
+	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
+	u32 val;
+
+	if (!mtk_is_netsys_v3_or_greater(eth))
+		return;
+
+	val = mtk_r32(eth, reg_map->pdma.rx_cfg);
+	val &= ~MTK_RX_CFG_SDL_MASK;
+	val |= FIELD_PREP(MTK_RX_CFG_SDL_MASK,
+			  MTK_PDMA_LRO_SDL + eth->rx_buf_len);
+	mtk_w32(eth, val, reg_map->pdma.rx_cfg);
+}
+
 static int mtk_dma_init(struct mtk_eth *eth)
 {
 	int err;
@@ -3267,6 +3489,15 @@ static int mtk_dma_init(struct mtk_eth *eth)
 	if (mtk_dma_busy_wait(eth))
 		return -EBUSY;
 
+	/* Derived here, at ring allocation, so eth->rx_buf_len always
+	 * describes the buffers the rings actually hold; mtk_change_mtu()
+	 * updates it while DMA is down so it describes the rings-to-be,
+	 * and mtk_mac_config() then never lets a MAC accept a frame the
+	 * rings cannot take.
+	 */
+	eth->rx_buf_len = mtk_rx_buf_len(eth);
+	mtk_set_all_macs_max_rx(eth);
+
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		/* QDMA needs scratch memory for internal reordering of the
 		 * descriptors
@@ -3310,6 +3541,8 @@ static int mtk_dma_init(struct mtk_eth *eth)
 		mtk_w32(eth, 0x0, eth->soc->reg_map->qdma.hred);
 	}
 
+	mtk_pdma_set_sdl(eth);
+
 	return 0;
 }
 
@@ -3600,17 +3833,6 @@ static int mtk_device_event(struct notifier_block *n, unsigned long event, void
 	return NOTIFY_DONE;
 }
 
-static int mtk_max_gmac_mtu(struct mtk_eth *eth)
-{
-	int i, max_mtu = ETH_DATA_LEN;
-
-	for (i = 0; i < ARRAY_SIZE(eth->netdev); i++)
-		if (eth->netdev[i] && eth->netdev[i]->mtu > max_mtu)
-			max_mtu = eth->netdev[i]->mtu;
-
-	return max_mtu;
-}
-
 static int mtk_open(struct net_device *dev)
 {
 	struct mtk_mac *mac = netdev_priv(dev);
@@ -3780,6 +4002,7 @@ static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
 	struct bpf_prog *old_prog;
+	u32 rx_buf_len;
 	bool need_update;
 
 	if (eth->hwlro) {
@@ -3787,12 +4010,28 @@ static int mtk_xdp_setup(struct net_device *dev, struct bpf_prog *prog,
 		return -EOPNOTSUPP;
 	}
 
-	if (dev->mtu > MTK_PP_MAX_BUF_SIZE) {
+	need_update = !!eth->prog != !!prog;
+
+	/* XDP only runs on rings that have a page_pool, and the pool is
+	 * only created when the shared RX buffer length fits
+	 * MTK_PP_MAX_BUF_SIZE.  eth->rx_buf_len describes the live rings;
+	 * when the rings are not live, or this attach tears them down,
+	 * the next open re-derives it from the current MTUs, so check
+	 * that value instead.  A detach never needs a pool, so it is not
+	 * checked at all.
+	 */
+	rx_buf_len = eth->rx_buf_len;
+	if (prog &&
+	    (!refcount_read(&eth->dma_refcnt) ||
+	     (netif_running(dev) && need_update &&
+	      refcount_read(&eth->dma_refcnt) == 1)))
+		rx_buf_len = mtk_rx_buf_len(eth);
+
+	if (prog && mtk_rx_ring_buf_size(rx_buf_len) > MTK_PP_MAX_BUF_SIZE) {
 		NL_SET_ERR_MSG_MOD(extack, "MTU too large for XDP");
 		return -EOPNOTSUPP;
 	}
 
-	need_update = !!eth->prog != !!prog;
 	if (netif_running(dev) && need_update)
 		mtk_stop(dev);
 
@@ -3927,30 +4166,6 @@ static void mtk_dim_tx(struct work_struct *work)
 	dim->state = DIM_START_MEASURE;
 }
 
-static void mtk_set_mcr_max_rx(struct mtk_mac *mac, u32 val)
-{
-	struct mtk_eth *eth = mac->hw;
-	u32 mcr_cur, mcr_new;
-
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
-		return;
-
-	mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
-	mcr_new = mcr_cur & ~MAC_MCR_MAX_RX_MASK;
-
-	if (val <= 1518)
-		mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_1518);
-	else if (val <= 1536)
-		mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_1536);
-	else if (val <= 1552)
-		mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_1552);
-	else
-		mcr_new |= MAC_MCR_MAX_RX(MAC_MCR_MAX_RX_2048);
-
-	if (mcr_new != mcr_cur)
-		mtk_w32(mac->hw, mcr_new, MTK_MAC_MCR(mac->id));
-}
-
 static void mtk_hw_reset(struct mtk_eth *eth)
 {
 	u32 val;
@@ -4213,13 +4428,23 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	 */
 	for (i = 0; i < MTK_MAX_DEVS; i++) {
 		struct net_device *dev = eth->netdev[i];
+		struct mtk_mac *mac;
 
 		if (!dev)
 			continue;
 
+		mac = netdev_priv(dev);
 		mtk_w32(eth, MAC_MCR_FORCE_LINK_DOWN, MTK_MAC_MCR(i));
-		mtk_set_mcr_max_rx(netdev_priv(dev),
-				   dev->mtu + MTK_RX_ETH_HLEN);
+		if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K)) {
+			mtk_set_mcr_max_rx(mac, dev->mtu + MTK_RX_ETH_HLEN);
+		} else if (mac->interface != PHY_INTERFACE_MODE_NA) {
+			/* Before the first mac_config() the interface mode
+			 * is unknown and the limit would land in the MCR
+			 * register of an XGMII MAC; that open programs each
+			 * MAC from its own mac_config() anyway.
+			 */
+			mtk_set_mcr_max_rx(mac, eth->rx_buf_len);
+		}
 	}
 
 	/* Indicates CDM to parse the MTK special tag from CPU
@@ -4360,15 +4585,53 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)
 	int length = new_mtu + MTK_RX_ETH_HLEN;
 	struct mtk_mac *mac = netdev_priv(dev);
 	struct mtk_eth *eth = mac->hw;
+	u32 rx_buf_len;
+	bool running;
 	int max_mtu, i;
 
+	/* The RX rings are shared by every MAC, so the buffer length
+	 * follows the largest MTU of all of them, the new one included.
+	 */
+	max_mtu = new_mtu;
+	for (i = 0; i < MTK_MAX_DEVS; i++) {
+		if (eth->netdev[i] && eth->netdev[i] != dev &&
+		    eth->netdev[i]->mtu > max_mtu)
+			max_mtu = eth->netdev[i]->mtu;
+	}
+	rx_buf_len = mtk_rx_buf_len_from_mtu(eth, max_mtu);
+
 	if (rcu_access_pointer(eth->prog) &&
-	    length > MTK_PP_MAX_BUF_SIZE) {
+	    mtk_rx_ring_buf_size(rx_buf_len) > MTK_PP_MAX_BUF_SIZE) {
 		netdev_err(dev, "Invalid MTU for XDP mode\n");
 		return -EINVAL;
 	}
 
-	mtk_set_mcr_max_rx(mac, length);
+	/* The rings cannot be resized in place while DMA is running: a
+	 * larger buffer can only come from the reallocation at the next
+	 * open, so reject it.  A smaller one is fine, the buffers the
+	 * rings already hold are big enough for it.
+	 */
+	running = refcount_read(&eth->dma_refcnt);
+	if (running && rx_buf_len > eth->rx_buf_len)
+		return -EBUSY;
+
+	/* While DMA is up the rings keep the buffers they were built with;
+	 * update eth->rx_buf_len only when DMA is down so it always
+	 * describes the buffers the rings hold, or will hold at the next
+	 * open.
+	 */
+	if (!running)
+		eth->rx_buf_len = rx_buf_len;
+
+	/* On the SoCs whose rings grow with the MTU every MAC has to be
+	 * narrowed or widened together, because they share the buffers;
+	 * the other SoCs keep the per-device limit they always had.
+	 */
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
+		mtk_set_all_macs_max_rx(eth);
+	else
+		mtk_set_mcr_max_rx(mac, length);
+
 	WRITE_ONCE(dev->mtu, new_mtu);
 
 	max_mtu = mtk_max_gmac_mtu(eth);
@@ -5018,8 +5281,17 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	eth->netdev[id]->irq = eth->irq[MTK_FE_IRQ_SHARED];
 	eth->netdev[id]->dev.of_node = np;
 
+	/* DSA sets the conduit MTU (user MTU + tag) before the netdev is
+	 * opened, so max_mtu must already be final here.  Deriving it only
+	 * in mtk_open() leaves the conduit at its 1504 default and blocks
+	 * 9K frames on the DSA user ports.
+	 */
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
 		eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
+	else if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K) &&
+		 mtk_interface_mode_is_xgmii(eth, phy_mode))
+		eth->netdev[id]->max_mtu =
+			MTK_MAX_RX_LENGTH_9K - MTK_RX_ETH_HLEN - VLAN_HLEN;
 	else
 		eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH_2K - MTK_RX_ETH_HLEN;
 
@@ -5160,6 +5432,8 @@ static int mtk_probe(struct platform_device *pdev)
 	spin_lock_init(&eth->rx_irq_lock);
 	spin_lock_init(&eth->dim_lock);
 
+	eth->rx_buf_len = MTK_MAX_RX_LENGTH_2K;
+
 	eth->rx_dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
 	INIT_WORK(&eth->rx_dim.work, mtk_dim_rx);
 	INIT_DELAYED_WORK(&eth->reset.monitor_work, mtk_hw_reset_monitor_work);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 88a9b3b23b..738f42d220 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -28,7 +28,9 @@
 #define MTK_QDMA_NUM_QUEUES	16
 #define MTK_QDMA_PAGE_SIZE	2048
 #define MTK_MAX_RX_LENGTH	1536
+#define MTK_MAX_RX_LENGTH_UNIT	1024
 #define MTK_MAX_RX_LENGTH_2K	2048
+#define MTK_MAX_RX_LENGTH_9K	9216
 #define MTK_TX_DMA_BUF_LEN	0x3fff
 #define MTK_TX_DMA_BUF_LEN_V2	0xffff
 #define MTK_QDMA_RING_SIZE	2048
@@ -198,9 +200,10 @@
 #define MTK_MULTI_EN		BIT(10)
 #define MTK_PDMA_SIZE_8DWORDS	(1 << 4)
 
-/* PDMA Global Configuration Register */
+/* PDMA RX Configuration Register */
 #define MTK_PDMA_LRO_SDL	0x3000
 #define MTK_RX_CFG_SDL_OFFSET	16
+#define MTK_RX_CFG_SDL_MASK	GENMASK(31, MTK_RX_CFG_SDL_OFFSET)
 
 /* PDMA Reset Index Register */
 #define MTK_PST_DRX_IDX0	BIT(16)
@@ -451,6 +454,9 @@
 
 /* Mac control registers */
 #define MTK_MAC_MCR(x)		(0x10100 + (x * 0x100))
+#define MAC_MCR_MAX_RX_JUMBO_MASK	GENMASK(31, 28)
+#define MAC_MCR_MAX_RX_JUMBO(x)		\
+	FIELD_PREP(MAC_MCR_MAX_RX_JUMBO_MASK, (x))
 #define MAC_MCR_MAX_RX_MASK	GENMASK(25, 24)
 #define MAC_MCR_MAX_RX(_x)	(MAC_MCR_MAX_RX_MASK & ((_x) << 24))
 #define MAC_MCR_MAX_RX_1518	0x0
@@ -530,6 +536,8 @@
 /* XFI Mac control registers */
 #define MTK_XMAC_BASE(x)	(0x12000 + (((x) - 1) * 0x1000))
 #define MTK_XMAC_MCR(x)		(MTK_XMAC_BASE(x))
+#define MTK_XMAC_RX_CFG2(x)	(MTK_XMAC_MCR(x) + 0xd0)
+#define MTK_XMAC_MAX_RX_MASK	GENMASK(13, 0)
 #define XMAC_MCR_TRX_DISABLE	0xf
 #define XMAC_MCR_FORCE_TX_FC	BIT(5)
 #define XMAC_MCR_FORCE_RX_FC	BIT(4)
@@ -985,6 +993,7 @@ enum mkt_eth_capabilities {
 	MTK_INFRA_BIT,
 	MTK_SHARED_SGMII_BIT,
 	MTK_HWLRO_BIT,
+	MTK_NETSYS_RX_9K_BIT,
 	MTK_SHARED_INT_BIT,
 	MTK_TRGMII_MT7621_CLK_BIT,
 	MTK_QDMA_BIT,
@@ -1026,6 +1035,7 @@ enum mkt_eth_capabilities {
 #define MTK_INFRA		BIT_ULL(MTK_INFRA_BIT)
 #define MTK_SHARED_SGMII	BIT_ULL(MTK_SHARED_SGMII_BIT)
 #define MTK_HWLRO		BIT_ULL(MTK_HWLRO_BIT)
+#define MTK_NETSYS_RX_9K	BIT_ULL(MTK_NETSYS_RX_9K_BIT)
 #define MTK_SHARED_INT		BIT_ULL(MTK_SHARED_INT_BIT)
 #define MTK_TRGMII_MT7621_CLK	BIT_ULL(MTK_TRGMII_MT7621_CLK_BIT)
 #define MTK_QDMA		BIT_ULL(MTK_QDMA_BIT)
@@ -1127,7 +1137,7 @@ enum mkt_eth_capabilities {
 
 #define MT7988_CAPS  (MTK_36BIT_DMA | MTK_GDM1_ESW | MTK_GMAC2_2P5GPHY | \
 		      MTK_MUX_GMAC2_TO_2P5GPHY | MTK_QDMA | MTK_RSTCTRL_PPE1 | \
-		      MTK_RSTCTRL_PPE2 | MTK_SRAM)
+		      MTK_RSTCTRL_PPE2 | MTK_SRAM | MTK_NETSYS_RX_9K)
 
 struct mtk_tx_dma_desc_info {
 	dma_addr_t	addr;
@@ -1150,6 +1160,7 @@ struct mtk_reg_map {
 		u32	pcrx_ptr;	/* rx cpu pointer */
 		u32	glo_cfg;	/* global configuration */
 		u32	rst_idx;	/* reset index */
+		u32	rx_cfg;		/* rx dma configuration */
 		u32	delay_irq;	/* delay interrupt */
 		u32	irq_status;	/* interrupt status */
 		u32	irq_mask;	/* interrupt mask */
@@ -1314,6 +1325,7 @@ struct mtk_eth {
 	struct mtk_tx_ring		tx_ring;
 	struct mtk_rx_ring		rx_ring[MTK_MAX_RX_RING_NUM];
 	struct mtk_rx_ring		rx_ring_qdma;
+	u32				rx_buf_len;
 	struct napi_struct		tx_napi;
 	struct napi_struct		rx_napi;
 	void				*scratch_ring;
-- 
2.53.0

