Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188745;
	b=s7xqTtGw9YEBxYw+jUAI8vwA54NJEsqTLSLwlRO1C0LWQLiil+tYJeDM0x2M1p7LT/Q4
	 UDfp7kE9y0P7hmxkr+dgkv4mLlXwYB56ojrpQolVRIH/VaB9nYeCxNxnCjDKMLjEvm05Z
	 cdRfOzdJ63CNVW0r/+aq6UhTogmw+mQ6OeAcjSHXIkYsEuZOcW34JfjgRqquq1dqSubzy
	 P1fMkyidMQnMu4dQD+WH5mY+dWZ3+lYlsQEyJXNLqJcjA2wfXEMCqz0keY6uDULOyHeen
	 irBpFin2P6jAuV1BMQoU9cYQ1N/KNjBuzvhmOa/9XuYL8gpvBUf6pt96lOwc/luCErw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=uMWKgHAVOfub5jjRo9ldebeazJBCcLFSXcOXSTNu7Rk=;
	b=Jiu7vt0LyuRJY/xVM181SnM/yUwZ+kFDYghAxQwSdtBPFMayZSP0DWmP47Bvldzxux6d
	 rpVmYzzKYbxc24pJjpbZnkp/78w/eTrS1YR8HK7xHYDwnNcCAN1UJkwsQrb4ItZIv+sR+
	 PlnqmQwyayRvJFvQsMUxV/d6lc0ubj7lbGqfENX6l/BxvGp5cMJJBLeZdPbVrnwGu5+b7
	 1JMEMSCzoMpldpeS9x0+PVT4QAbrAcwlU73HekK5AT4uJ+cvsrviQBtge5Htm5i1+Emfy
	 FjcNiKvWFwut3o4FBq7UzL+HUlMjEilU//mYmpwpzsZ2alUpyFV8FcOSpFfa+kveYrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CRvbcd6/";
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B060A260A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563B060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRvbcd6/
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ad5f20016so714831eaf.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188743; x=1795793543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMWKgHAVOfub5jjRo9ldebeazJBCcLFSXcOXSTNu7Rk=;
        b=CRvbcd6/zXsDODfcPJYi0gnEkS3I41jeDXe0l4Ag6W7jy8s0Wylv1rSNqp08LJfzBH
         uNhSUy2yxDKb6CMRBQHNBPwCrwU4gC16FbpbBZAeoaN1c2AlxZ2lAVb6vcz6pTga0o/7
         q1dlDKv2Igqs65zNLoYr1+Hpev8wasyM6SzIK0V8Y9HEQfVIg432P3isFc0QGsGPlAcY
         yKw7Yps07xMkRI34OUW7Tse/+tCsoafhB0Qq+fUXj4X6M47Xv8pqAaHXiNCioddpMrLh
         IO2WRKLI+B5ChCsxv44uVvm2aw3hw8tKOzrnniap1oNQJqvzhAt/qzXM5qrNUcGH9HUj
         Noag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188743; x=1795793543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMWKgHAVOfub5jjRo9ldebeazJBCcLFSXcOXSTNu7Rk=;
        b=qHhEHXozAPD44EBtG0aVYXE5O+xo+TVOjMOwh3MD0PbYkRaluDfJkuEH+q1NcS8POT
         axVIn+lESMz/GWLnqK4BLp4tfZCynqnTe9cAMRpMnqQiIfN+4LgvbMjODk4EMgdM+Qpc
         Z7pXZG9+4ONauK5ijRV7qIKHcVMh6ScoJk6Pu/pl1atF7L4a7Wn0jadGlm8l7we3nLvj
         sm+ZwTbOAFXwFsP3+Xge1nXNTLVPu719W9CSJY2RTC1lMoAaM6LICRYAHRhYHagnbu/V
         aMLi2lnZNpsVBX2ytUVci/6dRN1fR37CjKW7dsn47Hqn/+OhgTjUGUi9iFTlB8ggfJSh
         +i6g==
X-Gm-Message-State: APuU4Z9IXUAxEPMrQjRY8TJp9gTgzBs600JCgjO2+2zVX68Cqft2fJjA
	qIFNlB5h5fV/lxF5WaLrSlnfOe3meqabzSxkCAowpNdbVATIeF8TR95U
X-Gm-Gg: AYBFou14OhxSzZB2Jazjo3qMI9B723yaYWdYQhsc0rI/qfjBJSDn+G8Hy2LKeJmfZ4P
	nALn/c8iyfUShauvSA69gYfdBz6EZL43WmLxx/243F/myA6fm/uDFORguNvyKBLgkcvFWhZ1wJF
	hEuPOgDx1FAqHeM9gTdcYg5R11KVbbMBZ66dud8eUNWUchuXjgB1DFPeWz0rujxjoMVOyf7c9+L
	ExF+u4igSZ7HOYblHEvbVUuv7I/zyxCJMqoItZzAK8BrJWMgpMv1EGvt1OR6m4/y5EVXA67mNSb
	8MzXTXzpayIoQn5MJ9FZ5NuYT3mnzkP5geBty1Y4QO9pY1ceZ6Uu2ot3d8euUAJ5nHj5XNPK0T4
	+m05e/PXrQg4F6sJqNNDf2NWhnxwrOCIGBZVb1XEFMKFFC1tolAJT+fEnwEpGOnP1xwdnZFH8T4
	gIRl4eC2qt7ZIpXpFTZENrUgro6Rm7N+V4DTc6GVGg2ZtYXm6guAp9XTdQ9BRscj55ekaO0WeaH
	5UwsHq/P9+7iWGLVP2/rBQKAA561huNF2dATWHjePv0Y0WN4qnxPm+BdtIgqm0ad6geMseX5zC1
	/8Ca1EOHV5gFrDDdBOGJvXamcrghOVy7kgS8c7gRNXsf3m1n7L8aPnjP69qdzYNbpkXOT5Q/bn6
	JCVoWw5smNQxrIY9nOzKq+NB8AW9D0wE01MXApMbOUZLg7x7RCyKRXeT4omLADCig5rFUWUiLpK
	vz3VQ+rIjFTeb5aeFisbklEhVIcNUe3aNBGhMZLt90qDRyQBagIBU=
X-Received: by 2002:a05:6820:f034:b0:71b:3fec:38a6 with SMTP id 006d021491bc7-71b3fec4b36mr1246949eaf.12.1795188743195;
        Fri, 20 Nov 2026 07:32:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 08:32:06 -0700
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
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
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Packet captures on sun8i cannot currently inspect frames the driver
discards for Ethernet errors. Add opt-in rx-all support for complete
frames with a reported wire error and for runts the MAC can forward.

Set the runt-forwarding bit at hardware initialization and when rx-all
changes. Serialize live updates with the DMA controls in the same
register. Deliver these frames without claiming a verified checksum or
including them in the good-packet and good-byte totals. Keep counting
the wire errors even when the frames are delivered.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 +++++++++++-----
 4 files changed, 80 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 706feb7bcbed..ab959ee3a5dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -360,6 +360,8 @@ enum rx_frame_status {
 	llc_snap = 0x4,
 	dma_own = 0x8,
 	rx_not_ls = 0x10,
+	/* Complete frame with a wire error, deliverable only with RXALL. */
+	rx_error_frame = 0x20,
 };
 
 /* Tx status */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..8398788d334e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -21,16 +21,12 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <linux/stmmac.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
 
-/* General notes on dwmac-sun8i:
- * Locking: no locking is necessary in this file because all necessary locking
- *		is done in the "stmmac files"
- */
-
 /* struct emac_variant - Describe dwmac-sun8i hardware variant
  * @syscon_field		reg_field for the syscon's gmac register
  * @soc_has_internal_phy:	Does the MAC embed an internal PHY
@@ -73,6 +69,7 @@ struct sunxi_priv_data {
 	bool internal_phy_powered;
 	bool use_internal_phy;
 	void *mux_handle;
+	spinlock_t rx_ctl1_lock; /* Protects live RX_CTL1 updates */
 };
 
 /* EMAC clock register @ 0x30 in the "system control" address range */
@@ -198,6 +195,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_RUNT_FRM	BIT(2)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
@@ -442,25 +440,32 @@ static void sun8i_dwmac_dma_stop_tx(struct stmmac_priv *priv,
 	writel(v, ioaddr + EMAC_TX_CTL1);
 }
 
-static void sun8i_dwmac_dma_start_rx(struct stmmac_priv *priv,
-				     void __iomem *ioaddr, u32 chan)
+static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 clear, u32 set)
 {
+	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
 	u32 v;
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
-	v |= EMAC_RX_DMA_START;
-	v |= EMAC_RX_DMA_EN;
-	writel(v, ioaddr + EMAC_RX_CTL1);
+	guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
+	v = readl(priv->ioaddr + EMAC_RX_CTL1);
+	writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
+}
+
+static void sun8i_dwmac_dma_start_rx(struct stmmac_priv *priv,
+				     void __iomem *ioaddr, u32 chan)
+{
+	sun8i_dwmac_update_rx_ctl1(priv, 0, EMAC_RX_DMA_START | EMAC_RX_DMA_EN);
 }
 
 static void sun8i_dwmac_dma_stop_rx(struct stmmac_priv *priv,
 				    void __iomem *ioaddr, u32 chan)
 {
-	u32 v;
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_DMA_EN, 0);
+}
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
-	v &= ~EMAC_RX_DMA_EN;
-	writel(v, ioaddr + EMAC_RX_CTL1);
+static void sun8i_dwmac_set_rx_all(struct stmmac_priv *priv, bool enable)
+{
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_RUNT_FRM,
+				   enable ? EMAC_RX_RUNT_FRM : 0);
 }
 
 static int sun8i_dwmac_dma_interrupt(struct stmmac_priv *priv,
@@ -539,24 +544,23 @@ static void sun8i_dwmac_dma_operation_mode_rx(struct stmmac_priv *priv,
 					      void __iomem *ioaddr, int mode,
 					      u32 channel, int fifosz, u8 qmode)
 {
-	u32 v;
+	u32 threshold = 0;
 
-	v = readl(ioaddr + EMAC_RX_CTL1);
 	if (mode == SF_DMA_MODE) {
-		v |= EMAC_RX_MD;
-	} else {
-		v &= ~EMAC_RX_MD;
-		v &= ~EMAC_RX_TH_MASK;
-		if (mode < 32)
-			v |= EMAC_RX_TH_32;
-		else if (mode < 64)
-			v |= EMAC_RX_TH_64;
-		else if (mode < 96)
-			v |= EMAC_RX_TH_96;
-		else if (mode < 128)
-			v |= EMAC_RX_TH_128;
+		sun8i_dwmac_update_rx_ctl1(priv, 0, EMAC_RX_MD);
+		return;
 	}
-	writel(v, ioaddr + EMAC_RX_CTL1);
+
+	if (mode < 32)
+		threshold = EMAC_RX_TH_32;
+	else if (mode < 64)
+		threshold = EMAC_RX_TH_64;
+	else if (mode < 96)
+		threshold = EMAC_RX_TH_96;
+	else if (mode < 128)
+		threshold = EMAC_RX_TH_128;
+
+	sun8i_dwmac_update_rx_ctl1(priv, EMAC_RX_MD | EMAC_RX_TH_MASK, threshold);
 }
 
 static void sun8i_dwmac_dma_operation_mode_tx(struct stmmac_priv *priv,
@@ -648,7 +652,10 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
 
 	/* Forward checksum failures to software before starting RX. */
-	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
+	v = EMAC_RX_ERR_FRM;
+	if (dev->features & NETIF_F_RXALL)
+		v |= EMAC_RX_RUNT_FRM;
+	writel(v, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -1052,6 +1059,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
 	.rx_ipc = sun8i_dwmac_rx_ipc,
+	.set_rx_all = sun8i_dwmac_set_rx_all,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1126,7 +1134,7 @@ static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *
 	if (unlikely(runt || (status & wire_errors))) {
 		if (runt && !(status & RDES0_LENGTH_ERROR))
 			x->rx_length++;
-		return discard_frame;
+		return rx_error_frame | csum_none;
 	}
 
 	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
@@ -1218,6 +1226,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (!gmac)
 		return -ENOMEM;
 
+	spin_lock_init(&gmac->rx_ctl1_lock);
 	gmac->variant = of_device_get_match_data(&pdev->dev);
 	if (!gmac->variant) {
 		dev_err(&pdev->dev, "Missing dwmac-sun8i variant\n");
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 047d809b8b88..2cfadc686104 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -319,6 +319,7 @@ struct stmmac_ops {
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
 	int (*rx_ipc)(struct mac_device_info *hw);
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2f33fc0126b1..0a893c2cea78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5655,10 +5655,12 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	skb_record_rx_queue(skb, queue);
 	napi_gro_receive(&ch->rxtx_napi, skb);
 
-	u64_stats_update_begin(&rxq_stats->napi_syncp);
-	u64_stats_inc(&rxq_stats->napi.rx_packets);
-	u64_stats_add(&rxq_stats->napi.rx_bytes, len);
-	u64_stats_update_end(&rxq_stats->napi_syncp);
+	if (likely(!(status & rx_error_frame))) {
+		u64_stats_update_begin(&rxq_stats->napi_syncp);
+		u64_stats_inc(&rxq_stats->napi.rx_packets);
+		u64_stats_add(&rxq_stats->napi.rx_bytes, len);
+		u64_stats_update_end(&rxq_stats->napi_syncp);
+	}
 }
 
 static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
@@ -5716,6 +5718,21 @@ static struct stmmac_xdp_buff *xsk_buff_to_stmmac_ctx(struct xdp_buff *xdp)
 	return (struct stmmac_xdp_buff *)xdp;
 }
 
+static bool stmmac_rx_discard(struct stmmac_priv *priv, int status, u32 *rx_errors)
+{
+	if (likely(!(status & (discard_frame | rx_error_frame))))
+		return false;
+
+	if (status & discard_frame) {
+		if (!priv->hwts_rx_en)
+			(*rx_errors)++;
+		return true;
+	}
+
+	(*rx_errors)++;
+	return !(READ_ONCE(priv->dev->features) & NETIF_F_RXALL);
+}
+
 static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
@@ -5806,11 +5823,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		if (unlikely(error)) {
 			xsk_buff_free(buf->xdp);
@@ -6004,11 +6018,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		/* We do not support SG in XDP mode */
 		if (unlikely(!error && (status & rx_not_ls) &&
@@ -6170,8 +6181,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		rx_packets++;
-		rx_bytes += len;
+		if (likely(!(status & rx_error_frame))) {
+			rx_packets++;
+			rx_bytes += len;
+		}
 next:
 		in_progress = false;
 		skb = NULL;
@@ -6453,6 +6466,11 @@ static int stmmac_set_features(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	/* Keep the COE Type in case of csum is supporting */
 	if (features & NETIF_F_RXCSUM)
 		priv->hw->rx_csum = priv->plat->rx_coe;
@@ -8285,6 +8303,8 @@ static int __stmmac_dvr_probe(struct device *device,
 	}
 
 	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
+	if (priv->hw->mac->set_rx_all)
+		ndev->hw_features |= NETIF_F_RXALL;
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */

-- 
2.53.0

