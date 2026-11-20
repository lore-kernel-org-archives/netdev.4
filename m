Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175850;
	b=gEgqWjKee2tMKVfiZ8WQ5rdBLfxjcQuo7VKTRc9IHdG7mVa2eTPOJzeRAMPb+sMFAHan
	 hdIdJ1tYgDzyzg6HuOqiDW5FF3lkiqhixB9nqs82QeW+taHAGxSjUHhkdRACeBl0AsUHI
	 ggtEarHnl6hagtd5npGac9x0JZ2OV32mRckKfPcwkuULEYmoIPw5tmx44VDfkf+JzfEfF
	 YdEPY2YSr9iDbT3/vZaexmX+bD5Y5iX/A7DwRxEKOYf1J9x+nt1xWZD3djAG0fK1HqMXx
	 auXOCugTk6ibnmLiMs6ujNy68Ka5EEzsJS/pAzR9x37lSnXU/DvVNuWaX+xFTwnW3tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175850;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=UTsaTVy6Znwqrpu6amokY/711od3CYJ0JXSNJZpcBCs=;
	b=FrdVP8l5YJik2v3WSLCmEtxluKjaPr6htS2xTxYqTGUxe3sgEjVS5b02gTrRTDjtPVx+
	 0r8Ytqe+jo3FBxHiPODZ1tXcoWrqo0bZcK+qCnLHqZ+ssHdh2Svwt39TmDKIAHzgSicAA
	 ZxsSLLBbL97uE8mgmqqPckH2qtdQ6UKfeiaf/1i9/X5rghb3+zc+zTNAcMxyvTjGXIQfT
	 lZjPzC7yHc2+xiWLjv4B4gPN015749Usn1KvOqfU377VXwTsvo2JmWZgl8vDzGeO3QiNt
	 dEE6vW9BmBDhcrF/p7Q019YQ3x+oH+nM0AYptqfgJfxD12PdrWXw24H27tKlj3mqHkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="L+YKA5t/";
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5760A2639;
	Fri, 20 Nov 2026 11:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF5760A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=L+YKA5t/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795175857; x=1826711857;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=YQTzjtTFISf3bVMJCxj70AaBgMxiYJkh1zBBvoFf8RA=;
  b=L+YKA5t/kcFYAPHPyBapywmdrq3EZw84Uj+WQaN3MK9+VZh2mj6frdHB
   13DPHCcaT0qskqPnoI4NKbWVXcka6rZIZz9Q8KCDmCjQyGLiZemSTN57l
   1IvtmoW61IKHqj6aIHBKAkcvOBJV5aPbQezdsBb2pd1+0Y7mxQDqG9azp
   RnnOhufV5vB7v5uQIjnDZRYlipOaxpTyiDFW+goxzyZ4zgHI63c34Wh+v
   tn9jpblwaelTkalKaRESPnawtneg+7r2NPcj4fHi/zo9/Jnsdigl++8UN
   41k673X36fBjQPEz+s6VoySjMmr68OcdsdwF73aR/GnaLqvwr5a3Sy6jW
   w==;
X-CSE-ConnectionGUID: wdUgcmnnQEekdkHVVAaP3A==
X-CSE-MsgGUID: bsXRf8jQT+maa9cJA+j8pQ==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="77589754"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:57:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 04:57:28 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 04:57:25 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Nov 2026 12:57:02 +0100
Subject: [PATCH net-next v3 5/9] net: sparx5/lan969x: size the FDMA buffers
 from the port MTUs
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
Message-ID: <20261120-sparx5-mtu-change-v3-5-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
In-Reply-To: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3

The FDMA buffers must hold the largest frame that can be received by the
CPU, including the IFH, and on Sparx5 also the largest frame that is
transmitted, as Sparx5 copies the frames into its TX buffers. On Sparx5,
the RX buffers are skbs, and the TX buffers are a contiguous area. On
lan969x, the RX buffers are page_pool pages, which are turned into skbs
with build_skb(), and TX frames are mapped directly from the skbs. The
buffers are currently fixed to a single page, which is not large enough
to hold jumbo frames.

Instead, size the buffers from the largest MTU of the ports, plus the
Ethernet header, FCS, IFH and two VLAN tags. On Sparx5, use this length,
rounded up to the 128 byte granularity required by the FDMA, as the RX
and TX buffer size. As the TX buffers can now be smaller than a page,
make sparx5_fdma_xmit() drop frames that do not fit. On lan969x, use the
page order needed to hold the frame and the skb_shared_info, as lan966x
does, and limit the RX buffer size so that the FDMA never writes into
the skb_shared_info at the end of the page.

With the default MTU of 1500, the Sparx5 buffers become smaller, and the
lan969x pages are unchanged.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 21 +++++++++----
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 35 ++++++++++++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  2 ++
 3 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index 3036d6b6f043c..1f7856d067b94 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -131,7 +131,7 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 		goto free_page;
 	}
 
-	skb = build_skb(page_address(page), fdma->db_size);
+	skb = build_skb(page_address(page), PAGE_SIZE << rx->page_order);
 	if (unlikely(!skb))
 		goto free_page;
 
@@ -161,21 +161,27 @@ static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 	return NULL;
 }
 
+/* Get the page order needed for a page to hold the largest frame */
+static u8 lan969x_fdma_get_page_order(struct sparx5 *sparx5)
+{
+	return get_order(ALIGN(sparx5_fdma_get_max_frame(sparx5), 128) +
+			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)));
+}
+
 static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5, struct sparx5_rx *rx)
 {
 	struct fdma *fdma = &rx->fdma;
 	int err;
 
 	struct page_pool_params pp_params = {
-		.order = 0,
+		.order = rx->page_order,
 		.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
 		.pool_size = fdma->n_dcbs * fdma->n_dbs,
 		.nid = NUMA_NO_NODE,
 		.dev = sparx5->dev,
 		.dma_dir = DMA_FROM_DEVICE,
 		.offset = 0,
-		.max_len = fdma->db_size -
-			   SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
+		.max_len = fdma->db_size,
 	};
 
 	rx->page_pool = page_pool_create(&pp_params);
@@ -267,7 +273,11 @@ static void lan969x_fdma_rx_init(struct sparx5 *sparx5, struct sparx5_rx *rx)
 	fdma->n_dbs = 1;
 	fdma->priv = sparx5;
 	fdma->size = fdma_get_size(fdma);
-	fdma->db_size = PAGE_SIZE;
+	/* Keep the FDMA from writing into the skb_shared_info at the end of
+	 * the page. The DB size must be a multiple of 128 bytes.
+	 */
+	fdma->db_size = SKB_WITH_OVERHEAD(PAGE_SIZE << rx->page_order);
+	fdma->db_size = ALIGN_DOWN(fdma->db_size, 128);
 	fdma->ops.dataptr_cb = &lan969x_fdma_rx_dataptr_cb;
 	fdma->ops.nextptr_cb = &fdma_nextptr_cb;
 
@@ -411,6 +421,7 @@ int lan969x_fdma_init(struct sparx5 *sparx5)
 	struct sparx5_rx *rx = &sparx5->rx;
 	int err;
 
+	rx->page_order = lan969x_fdma_get_page_order(sparx5);
 	lan969x_fdma_rx_init(sparx5, rx);
 	lan969x_fdma_tx_init(sparx5);
 	sparx5_fdma_injection_mode(sparx5);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index 537c945409bba..b92d249777f0b 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -18,7 +18,6 @@
 #include "sparx5_main.h"
 #include "sparx5_port.h"
 
-#define FDMA_XTR_BUFFER_SIZE		2048
 #define FDMA_WEIGHT			4
 #define SPX5_FDMA_STOP_SLEEP_US		500
 #define SPX5_FDMA_STOP_TIMEOUT_US	10000
@@ -224,6 +223,10 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 	struct fdma *fdma = &tx->fdma;
 	void *virt_addr;
 
+	/* Drop frames that do not fit in the TX buffers */
+	if (unlikely(IFH_LEN * 4 + skb->len + ETH_FCS_LEN > fdma->db_size))
+		return -EMSGSIZE;
+
 	if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)))
 		return -EINVAL;
 
@@ -295,6 +298,33 @@ static int sparx5_fdma_tx_alloc(struct sparx5_tx *tx)
 	return 0;
 }
 
+/* Get the size of the largest frame, including IFH and VLAN tags, that can be
+ * received on any of the ports.
+ */
+u32 sparx5_fdma_get_max_frame(struct sparx5 *sparx5)
+{
+	u32 max_mtu = 0;
+
+	for (int i = 0; i < sparx5->data->consts->n_ports; i++) {
+		struct sparx5_port *port = sparx5->ports[i];
+
+		if (!port)
+			continue;
+
+		max_mtu = max(max_mtu, READ_ONCE(port->ndev->mtu));
+	}
+
+	return SPX5_HW_MTU(max_mtu) + IFH_LEN * sizeof(u32) + VLAN_HLEN * 2;
+}
+
+/* Get the DB size needed to hold the largest frame. The DB size must be a
+ * multiple of 128 bytes.
+ */
+static u32 sparx5_fdma_get_db_size(struct sparx5 *sparx5)
+{
+	return ALIGN(sparx5_fdma_get_max_frame(sparx5), 128);
+}
+
 static void sparx5_fdma_rx_init(struct sparx5 *sparx5,
 				struct sparx5_rx *rx, int channel, u32 db_size)
 {
@@ -424,7 +454,7 @@ void sparx5_fdma_injection_mode(struct sparx5 *sparx5)
 
 int sparx5_fdma_init(struct sparx5 *sparx5)
 {
-	u32 db_size = ALIGN(FDMA_XTR_BUFFER_SIZE, PAGE_SIZE);
+	u32 db_size;
 	int err;
 
 	/* Reset FDMA state */
@@ -441,6 +471,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5)
 		 sparx5, CPU_PROC_CTRL);
 
 	sparx5_fdma_injection_mode(sparx5);
+	db_size = sparx5_fdma_get_db_size(sparx5);
 	sparx5_fdma_rx_init(sparx5, &sparx5->rx, FDMA_XTR_CHANNEL, db_size);
 	sparx5_fdma_tx_init(sparx5, &sparx5->tx, FDMA_INJ_CHANNEL, db_size);
 	err = sparx5_fdma_rx_alloc(&sparx5->rx);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 19b38922823ec..af2a81cdfeb66 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -110,6 +110,7 @@ enum sparx5_feature {
 #define SPX5_BUFFER_CELL_SZ    184   /* Cell size  */
 #define SPX5_BUFFER_MEMORY     4194280 /* 22795 words * 184 bytes */
 #define SPX5_TAS_ENTRIES_PER_PORT 2 /* TAS lists per port */
+#define SPX5_HW_MTU(mtu)       ((mtu) + ETH_HLEN + ETH_FCS_LEN)
 
 #define XTR_QUEUE     0
 #define INJ_QUEUE     0
@@ -515,6 +516,7 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 irqreturn_t sparx5_fdma_handler(int irq, void *args);
 void sparx5_fdma_reload(struct sparx5 *sparx5, struct fdma *fdma);
 void sparx5_fdma_injection_mode(struct sparx5 *sparx5);
+u32 sparx5_fdma_get_max_frame(struct sparx5 *sparx5);
 
 /* sparx5_mactable.c */
 int sparx5_mact_learn(struct sparx5 *sparx5, int port,

-- 
2.34.1

