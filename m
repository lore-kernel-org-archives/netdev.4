Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333590;
	b=NMKHhIgE5FA3wZx/qskZ9LBuvKzgpJsuUMoJLMcdUqWY2f2IzaA98Nio4AMKfmEdt4su
	 glySC2sqbnYw4WPrOFhKCfnEjRmVGSriUM/TD+3nnfZWRnyADcoTgE9MA7e1WP4OPUFVw
	 zq991kjyJwIrGyi/ezh1BrqsemrmtxnY5rV7QG+2ffnjKmpec9Sdy/kYTfQvIg/RolFTm
	 n+1+dwiKleR/s8kLmA7KRzxAKtqZGI7N+RDHySVZCfHRsFKC8qtDKmuFFM7WaD9dYkmvK
	 1znkZIli0uTqtX/5Mz2iqmg89XQ4zL+4YfrN9xTa4cuXvXTxB8oSn6PS2ETcjyxfiKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
	b=k/Y7SWNCs9SRwVyAIgSl5Cr88SUK49BGiF2KQzKsHsgYuAeJMdNk/NwsqKvdAH6COxcR
	 7UBK19fX1XJojFbxIfitevH2vWAbIfcrI7tinQQXjrcv+QYK0TS2bTHGGp7TqWFK5lNK9
	 MLN5wAKSaVgVP8G6cWj3V5f336ffh4BbyQQ9BQ7A+KWcKhX0OCOwj0TX2hj0U37MfyK+D
	 1X16I6iMpGQAsMzhJrnCh58SW8jE/YTdAGrSDD+PQFbU110/5sQH+BYvR45HbOwYGj2oU
	 SHVIZTtL1+xIgui29G6YHj6LDTfh7riD6PzFQaeFX4YRClJn2AhK/+Xt7WqA4VaTldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YiRKuGtb;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF66606A335
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 07:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF66606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YiRKuGtb
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8253bc5a613so1492694a34.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333589; x=1795938389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
        b=YiRKuGtbo5OVEuUsFKXFYqYP8/V0lE1HxX/LJj20OJaOJigRFPumRoh7jYcM4H3U5Q
         V4bW69+mnUZigexgricU0jtMKPVXqQIr/qAdPeJs94MgL5ENUoHk1AnOTE5MFJvQdFg0
         0ih/t6ifg2HbC7tLlKAEeYM817QgaF+EEE4TD7PbZtrsiB72kpMYo5Xyt8LlPzivDnre
         92QhKs59tmz9U03HHP2hUlVj4AwVaP1LYjgqiOqISc52L+5jdN/2p7pl3JBaG4cjhvKC
         y97vcY5A6MzgkBgiC9Y6ksXsDe0twTc+/zU+K69Pk9rAf/XKInneolxfBniQGOjdbQIz
         3keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333589; x=1795938389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaSZyM5wetB09LUbusDUB+0HrVaGOCOOtEk3uKZfB+I=;
        b=taB5ZTkGi0NnavX4dDaCvc2HHGLahq5Kb4V8Vhcg3UstCFZsKrBabrmbYoKCJENOIy
         ILTN7+H7EJBTbbO4GBLrzgNIBvI8hYq6Nxv7h6yR2YmDULT0tt7CxNipU9K413a23wlj
         v2p29SGISeHbKS14+3rd7L8Lmgay/j+f9fBsgRjlo/L1NvWImJT8/p8OX8PCTw7ywO86
         sRZ5wrjae/X+GCDqbkr+btDiTz5ERUoij4y2lMbDr8Tdt0CYUahcdap9sXFfCmwAcF5b
         pquo1LSdpwdeI5ZcNxCEu3J9gZ6al/Je6heLTsT+7IpQBgdrh7EJY2RyF/BcmRltqq6O
         AboQ==
X-Gm-Message-State: APuU4Z/VikzJSULY2dEbptcXgUqffJsHiqKFb1Pb4hAa9DFynnvo2ooZ
	6km+8HaoxlwjTuV3EwJWCRvofIIqNkcyJLxc9aYoWiR3ewwOQLIPRgih
X-Gm-Gg: AZFdTZdG22ViQu2K56E4j+fl9MpOy9yeone6s06G294s0Fqbq22vcpIe52wHuR6DtRT
	RjGgv0fgIB9NZS2BXlbWuHEiMdmGUGyMhn4y0oe2pQkohz1CP9oV6EBbj8PcLAmSSZYRjL8Hh+h
	ZR7RfKTqUp86OQtCnDSwadj0bTPdYH+OSqlIBFW5hdPwCJf1WDCi9T9R4jSSH+WQ4q4YE1RX2ns
	iMB0+3tbkILf7C4NZ3YHgt5cuesRx1nq6O4RdN6YY4z1i4N5AInIb/4vqsBp8bNpxPjS7h8Qhlr
	DHcNLEwjmcYvH0jzZg1qldllQZ/yiXY/dLoVV+0nFZImGIIhw4255OgffDusv8uYV9i9g/oDdXr
	TvwrFq93kzmJ+WcCqfu6ACL4YTlKOX739NYEHVydZhacDkPW6OYsLXXjrRogKf7gqrTD1cETMy3
	UxtRI3/S1B4gl4PjE6G5E1jkxUB6E6M83TuWV5NxZ+uFhuqpX8x8yAm6+J56D3V7WdjYQo6YFt6
	uMICI9T9SLgwo8HZx59JQEdadIOnVUn0FaLzpui2wuisSyFmwRLU3/gnfhMznUPPS2bJvyyOeCU
	/jZPMgZatHYt1Gr+P8PBzhxpjtB5YxG9FFPEwTx2YlT7A//f/7+DOwaP0okbM/f3s3boq04OzHJ
	f3hvo0ju9U5qABPUAcPRXIxBF8eXofnyy7mGY1//HhPnB/g6VAm6dydVyIOwp3aGWAuGNo1YHND
	V1xUAW7dk8djNHGHXm0w9ZfpKaH/4vvrnXp0+niW07RHW0ZLe9Mb2a
X-Received: by 2002:a05:6808:1387:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-57a0a937f43mr9425803b6e.33.1795333589314;
        Sat, 21 Nov 2026 23:46:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:45:47 -0700
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
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Enable packet captures of complete frames with wire errors on sun8i.
Report these frames to the core with an unverified checksum so it
can deliver them when rx-all is enabled. DMA and incomplete-frame
errors still require dropping the frame.

Program runt forwarding at initialization and when rx-all changes.
Serialize live updates of RX_CTL1 so changing the receive mode cannot
overwrite a concurrent DMA start, stop or threshold update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 73 +++++++++++++----------
 1 file changed, 41 insertions(+), 32 deletions(-)

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

-- 
2.53.0

