Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815932;
	b=UrN76rUs57nz3eiyjopa1KJP2pSdKOItjs55mjCTjxBYSk265PdhrOVuv8jFoSYABtVG
	 XwdWlVkI1fppxDAcEph2FDYi5aKBe3O2HNuNv+nA+HaZ3DWNRGSZcalVSTPh64OY1Lmp8
	 wlAi6JZtB12leU1wL1s21Iy8lpIrqCaMn7UkbPlrJoLHoPHx3Awr9Jm7p6EAtPa+E+fEP
	 v4Djy/tj0Rf/nA8Ztgt00DMxhjM+QiiopQNcv9XypP5qrN5O4D5D+6xwrYT/lA1O8hcMO
	 peoANIMdJLx6zBChaLW9JKmbyQ58AoYQ6X30P8Z7PLJdILSAp/NrAL9WjWzXZPgsIfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815932;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=BNrifp1kWATWRvaBQ2bytNLRuqg6oOfSlN4TIwDqn4Q=;
	b=efo2pN3uDRw9p4Z7iY7qEY5inpj5to8M1ZPjkjhtTDG3t+NWlLMwZdss9rRhokTCatCX
	 pgpV9sGNRrV+NMQXtfZpw9PghFkQMwaHUGQIwSlJ2QllKO04tl99VEAwNc4BAQjzKjZnt
	 TxGe3ENz1KUblfpAYr5cz140heJO0ULDezao8vpaMOE0J9H3BxQgwFxsaoN0SfCvqiLXt
	 Y2yoFsZsF8BnSTHytwqoznRaKZQErriksfZ7ACF411s58ONFjLE4fNlR5Md870z4sKbiT
	 IN+WFdYtGpRedhA+GLYAJEfeq1cUq79kaDrML0Ngj3b0FQ4/jBn/e0akOKpR92au22A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dfNlnXV1;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A8606A33D
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 21:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719A8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dfNlnXV1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2738B1A1844;
	Fri, 27 Nov 2026 21:45:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F09906049C;
	Fri, 27 Nov 2026 21:45:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0F6411E90F67;
	Fri, 27 Nov 2026 22:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795815925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BNrifp1kWATWRvaBQ2bytNLRuqg6oOfSlN4TIwDqn4Q=;
	b=dfNlnXV1FuxojAdZP8iTP9vhCL2OSj+5gaAOJLuStRgy+JEqirCvl81aLFBJ9GC7h51VOi
	NiisGnatRFOiid1DIRNTF5j+YlNnKZKJ7h+NbHxjr8F5VWxLGxzSEGGyANofMYvt5I92W9
	R/G+aNuZO/0lPIJeIYFbfpIgc3FiXo8ou9vG2p3C9qxqQR7Pw9fk5K7wYBIfoXVAAGdJBT
	P6O2tg1KArkgDV5ObjO35d4Vco5qSDT/l1Imx7O59nJvkz5CFGRlMDB4HFzRMSyrIxvg7q
	TmHjq73jQbi9mdDDzI2xzadSGeJfA6pKAcU59YBJf1eyuUpIvsh3LMH9hr9ZiQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Nov 2026 22:44:43 +0100
Subject: [PATCH net-next v9 3/3] net: macb: distribute evenly Tx SRAM
 segments
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-macb-set-channels-v9-3-0b3addec7886@bootlin.com>
References: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
In-Reply-To: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

GEM has registers to configure the Tx SRAM segments distribution across
active queues. The reset value is appropriate (even spread) but we need
to care if/when number of active queues is modified (or if we inherited
unevenly initialised hardware from bootloader).

To distribute segments, we take as input the number of queues (current
context num_queues) and the number of segments (found inside DCFG6).
Its output is a number of segments for each queue, formatted as
powers-of-two. For example, 2 for queue 0 means it has 2^2=4 segments.

We define register offset GEM_TXQSEGALLOC_UPPER which is never used.
It shall be used when an IP supports >8 number of queues.

Note that the manual mentions explicitly that only active queues are
taken into account. So when we write 0x1 in TXQSEGALLOC and a single
queue is active, this means we assign (1<<1) == 2 segments to the
first (active) queue and none on the others.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---

Special note to Sashiko:

In gem_sram_distribute_segments(), if num_queues > num_segments,
we write 0 to TXQSEGALLOC_LOWER.

This translates to allocating 1<<0 == 1 segment per (active) queue.
Yes, in theory, this is problematic.

In practice, the hardware designers have thought about the # of queues
and # of segments long enough (a few seconds) to never create less
segments than queues, which would make zero sense.
---
 drivers/net/ethernet/cadence/macb.h      | 14 ++++++
 drivers/net/ethernet/cadence/macb_main.c | 73 +++++++++++++++++++++++++++++++-
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index d60b06e41b83..f8335b9fd129 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -194,6 +194,10 @@
 /* Screener Type 2 match registers */
 #define GEM_SCRT2		0x540
 
+/* Tx queue segment allocation */
+#define GEM_TXQSEGALLOC_LOWER	0x05A0
+#define GEM_TXQSEGALLOC_UPPER	0x05A4
+
 /* EtherType registers */
 #define GEM_ETHT		0x06E0
 
@@ -545,6 +549,8 @@
 #define GEM_PBUF_CUTTHRU_SIZE			1
 #define GEM_DAW64_OFFSET			23
 #define GEM_DAW64_SIZE				1
+#define GEM_SEGMENTS_BIT_SIZE_OFFSET		16
+#define GEM_SEGMENTS_BIT_SIZE_SIZE		4
 
 /* Bitfields in DCFG8. */
 #define GEM_T1SCR_OFFSET			24
@@ -657,6 +663,13 @@
 #define GEM_CMPCEN_OFFSET			30 /* Compare C Enable */
 #define GEM_CMPCEN_SIZE				1
 
+/* Bitfields in TXQSEGALLOC (Q0 at 2:0, Q1 at 6:4, etc.) */
+#define GEM_TXQSEGALLOC_MASK(q_) \
+	({ \
+		typeof(q_) q__ = (q_); \
+		GENMASK(4 * (q__) + 2, 4 * (q__)); \
+	})
+
 /* Bitfields in ETHT */
 #define GEM_ETHTCMP_OFFSET			0 /* EtherType compare value */
 #define GEM_ETHTCMP_SIZE			16
@@ -785,6 +798,7 @@
 #define MACB_CAPS_USRIO_HAS_MII			BIT(26)
 #define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(27)
 #define MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE	BIT(28)
+#define MACB_CAPS_TXQSEGALLOC			BIT(29)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 93599cfc43d6..b4963a632884 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3325,6 +3325,69 @@ static u32 macb_dbw(struct macb *bp)
 	}
 }
 
+/*
+ * Distribute evenly available segments across active queues. The computation
+ * is complex because (1) segments are counted in powers of two and (2) a queue
+ * can only use up to 128 segments. There are four types of cases:
+ *  - Sharing all segments equally is doable. Take num_queues=4 and
+ *    num_segments=16. Each queue will get 2^2=4 segments.
+ *  - Sharing all segments is doable. Take num_queues=5 and num_segments=16.
+ *    Three queues will get 2^2=4 segments and two will get 2^1=2 segments.
+ *  - Sharing all segments is not doable because not enough queues are
+ *    available. Take num_queues=1 and num_segments=256; queue 0 can only
+ *    have 128 segments.
+ *  - Sharing all segments is not doable because not enough segments are
+ *    available. Take num_queues=4 and num_segments=2.
+ *
+ * We start by computing the power each queue will have. For num_queues=5 and
+ * num_segments=16, each queue will have at least 2^1 segments. That leaves us
+ * with remaining_segments=6. If we increase the power for a queue, we get a
+ * delta of 2 (2^2-2^1). The first three queues will therefore be advantaged
+ * and each have 2^2 segments. The remaining 2 queues will only have 2^1
+ * segments.
+ */
+static void gem_sram_distribute_segments(struct macb *bp)
+{
+	unsigned int num_segments, pow, remaining_segments, i;
+	unsigned int num_queues = bp->ctx->num_queues;
+	unsigned int num_advantaged_queues = 0;
+	u32 val = 0;
+
+	if (!(bp->caps & MACB_CAPS_TXQSEGALLOC))
+		return;
+
+	num_segments = 1U << GEM_BFEXT(SEGMENTS_BIT_SIZE, gem_readl(bp, DCFG6));
+
+	/* When growing the max # of queues, make sure to write into
+	 * TXQSEGALLOC_UPPER too.
+	 */
+	static_assert(MACB_MAX_QUEUES == 8);
+
+	/* pow=0 for all queues. ilog2(0) is dangerous. */
+	if (num_queues >= num_segments)
+		goto writel;
+
+	pow = min_t(unsigned int, ilog2(num_segments / num_queues), 7);
+	remaining_segments = num_segments - num_queues * (1U << pow);
+
+	/* We can only distribute remaining segments if (1) there are remaining
+	 * segments and (2) we did not reach the max segments per queue (2^7).
+	 */
+	if (remaining_segments != 0 && pow != 7) {
+		unsigned int delta = (1U << (pow + 1)) - (1U << pow);
+
+		num_advantaged_queues = remaining_segments / delta;
+	}
+
+	for (i = 0; i < num_advantaged_queues; i++)
+		val |= field_prep(GEM_TXQSEGALLOC_MASK(i), pow + 1);
+	for (i = num_advantaged_queues; i < num_queues; i++)
+		val |= field_prep(GEM_TXQSEGALLOC_MASK(i), pow);
+
+writel:
+	gem_writel(bp, TXQSEGALLOC_LOWER, val);
+}
+
 /* Configure the receive DMA engine
  * - use the correct receive buffer size
  * - set best burst length for DMA operations
@@ -3458,6 +3521,8 @@ static void macb_context_swap_end(struct macb *bp,
 	/* Re-arm normal interrupt processing before enabling IRQs. */
 	bp->irq_quiesced = false;
 
+	gem_sram_distribute_segments(bp);
+
 	macb_configure_dma(bp);
 
 	if (bp->link_up) {
@@ -3523,6 +3588,8 @@ static void macb_init_hw(struct macb *bp)
 	if (bp->caps & MACB_CAPS_JUMBO)
 		bp->rx_frm_len_mask = MACB_RX_JFRMLEN_MASK;
 
+	gem_sram_distribute_segments(bp);
+
 	macb_configure_dma(bp);
 
 	/* Enable RX partial store and forward and set watermark */
@@ -6241,6 +6308,7 @@ static const struct macb_config zynqmp_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
+		MACB_CAPS_TXQSEGALLOC |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
@@ -6308,7 +6376,7 @@ static const struct macb_config versal_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_BD_RD_PREFETCH |
 		MACB_CAPS_NEED_TSUCLK | MACB_CAPS_QUEUE_DISABLE |
-		MACB_CAPS_QBV |
+		MACB_CAPS_QBV | MACB_CAPS_TXQSEGALLOC |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
@@ -6319,7 +6387,8 @@ static const struct macb_config versal_config = {
 static const struct macb_config eyeq5_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP | MACB_CAPS_QUEUE_DISABLE |
-		MACB_CAPS_NO_LSO | MACB_CAPS_EEE | MACB_CAPS_QBV,
+		MACB_CAPS_NO_LSO | MACB_CAPS_EEE | MACB_CAPS_QBV |
+		MACB_CAPS_TXQSEGALLOC,
 	.dma_burst_length = 16,
 	.init = eyeq5_init,
 	.jumbo_max_len = 10240,

-- 
2.56.1

