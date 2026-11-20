Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188743;
	b=bBQD13+3QoRCTV3fc2hrvXI02It+yecUKt0PbB/J56RpaY1HkrGPBc0a7OWVZPozOn16
	 RvLAGMp5BLEbOigjmo5IScU5Nbca3hDxChzag576CTscQR/9T0tYJTM+/BAFv7vdRwPmF
	 UVIoEqO/RZeI8XuC7LVxOdzHJnSZAi7hAe97J9vFr/N01+IPSUS95Gh/Les1TU0ml48ja
	 QkrWcVK8tOVJWQbgUHHDUuoeNg9xZT9SFCUO8nd8DCnm0T+MCCHqjzvwoU2X7+eVHQmXD
	 5nyQ2pvlEQXpfYTw4tBxSewNdb33KF1aiXeImsWtxrd7oyalc2r+GDZGZLGVVYY8NsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wt5LWMmbRJFmiS12kIE0gT6JGLRxJ/2kkyK9TiUM9LI=;
	b=p9LSEmP2PWfNU+hxVlzuE5oC69hl9f5DV4q5REKCVxo+4sZ42JBuHBrHevclhF99ZgSh
	 EWBP1R3Im2t6/4VQbH28TxuPfpUOGdvGKfToWFlL57uKJzftJB9fLIQNCI7oAPsNf+FFO
	 BRbmGaiH+t+wmn7JVCnbrWHDPGagiXJyWLjqeJpY+y+S9tHkvbLsmqj0MLdv3p8txEzxq
	 SsIZWMUg1g1JJhbHqgr3O47lnr7q7FHVqjiZOsDefHBt2drpPMZKHMtceiQrLT8vfoZtQ
	 IJNUqHnudMWtE/ELIuZo//ML9iqm9AufKgkivt2XQDv5ml/BXuMVGNs9SV1fQsc/zEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5V+pptT;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BF60A2601
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2BF60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5V+pptT
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71ad099391dso502465eaf.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188742; x=1795793542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt5LWMmbRJFmiS12kIE0gT6JGLRxJ/2kkyK9TiUM9LI=;
        b=C5V+pptTV8+yvdDmrSf15z1pzOhglT35A4e+C2ceQsKnx6oCuRm3IdSyRuu7MyYue0
         G7gUpdl5Ck+3yQN6eZ6LRwqbxSPu0xtk/I1c5wHBD5S0va/olVEr3XPUbD9Ukb62ElUB
         hGddCDMWCyOCtjQ2aWhdZ0FVBLBVDr9sd8raNlEnwOnchZSmdGUZlapIDcu8whrsu2Cg
         e3q/I0k1x0FJ4d1DLrVv+9bWm/LlWkfQruImnlOxcxCXZPhoiQpLoHL1uBrpPUGiFP72
         PV6bOQt4gJ4wYgh+c6Na9tZeAQrrpqV81Mcls+kGykE8n0Cao1c91TszM0h9cTffDFfh
         2ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188742; x=1795793542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wt5LWMmbRJFmiS12kIE0gT6JGLRxJ/2kkyK9TiUM9LI=;
        b=f8RGurw9tDMsZhYq2tzBl95sT7JgJ9UQY7yhpaNHcusyvcNOEsWG7vaw8qNrktPCpx
         CgnMpyCuYeuKFkyNJaey5t1bNTmlT7QPNz5aNSZ+uMi9NQBlrRb1HKh4csw4zbtNu95x
         xtvmTnnfOKTjtwlh7iMV6mmesZzqW0zgF0R8HM203KuXClnT8qsswXClojlL8D0zK9bo
         zW4C/WGRJWp6wTrEsDiyb56pwD5VTIabMF1npDHRS806Z5niKTQ8hmV30ScitSWfPUzj
         /pkhU+D21Qcbm1ysuDon6nmtRzuUHk2xRb6+c7FK1JkVyG6nO3N7lqXx2eA+AV0xeZ2x
         Dh+A==
X-Gm-Message-State: APuU4Z/2linYgDX6jZvdqVfST33yW/JmljxrIEmKfCYKeXjnV8FC4lbE
	i+Tr9G5If2ES45Ys5RwEJZw4lTgFocAwuTD8f9nDqDqrP6eZQrbiblrI
X-Gm-Gg: AYBFou0X0j5v1LnGXTnVFEiQecZHHl8pnzUcPuknR0o8K2o01LYjfLW9LUtnC5S+vQv
	ECbRgbDvW+ylZOBGTXLyQ2IySPNOQSCtmcqMPbfFm7SugzMaiIOL8bT5K/66cGi7GyjFVVTdbnB
	5kSs2aFEkNwuMO/WNmFwluomNYIvOsjKmEGfW03FxBpnWltfauaXR4RK3oH3PsibeT/ijuGJ1UA
	xyUPxt7j1ZAnt3PZLJHXKkfCpYmkqyVrdCe8FJXTljm/6dmCWnWVLuVhBTcNtoKbWXnVsy8BlCf
	dPuN5a8k+S230T1gOATks0uromhSyNChXgrVmmBcPCOX7xtw9ij40PQDgSpequb8OMx2I2zkCch
	o1VjV1TBJDeWMtyxa2SdKoThk+n6B1iNM8jmeRQWNYKBxBsy+pDyaiZZMnWUxqWWFygMcJZeCz4
	2/QZW/EjdOAiFjcnjbLvd4VbKX2+mcGumnIAsveSgSV7hqHTRy19Q5O8CHPVoYjRHV4SVzmRxzV
	hZ0s+LUM5fq2EJ2oMtLXGz39ju5AH1a/SFbJcBzGifhMagCDEj4zj0Mh1HZUF7IKd1wqpdGBgCS
	G0IIY9svIHmt+Il+VpL1lA+E7OSoEgME4WaZhf1/g5WIYhZgfqb5FnCOy3cSon0Md4cbCGbeUTO
	pxgLWZu2fT3oDiaCb/dFL4FOcH7Rsik62e199YDRbj3aL3xIyuP429BtDiu0yS+COff6eFdiV3j
	dhfHP9nPbcrfbTOMaV7m8zYFwNT9x4qMmauRmU+04SZwnhFwt670mcLCo6ITYQl7bmPA9gMhy7
X-Received: by 2002:a05:6820:8582:20b0:71a:de33:9236 with SMTP id 006d021491bc7-71b395ad565mr1859091eaf.87.1795188742194;
        Fri, 20 Nov 2026 07:32:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 08:32:05 -0700
Subject: [PATCH net-next 1/2] net: stmmac: dwmac-sun8i: deliver RX checksum
 errors to the stack
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
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-1-5058fecba6b3@gmail.com>
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

The sun8i MAC drops packets with a bad IP or transport checksum before
packet sockets or the protocol stack can see them, even with RX checksum
offload disabled. Its error-forwarding bit controls Ethernet and IP
errors together.

Enable error forwarding and decode the sun8i RX status in both receive
paths. Give checksum failures and unchecked packets to the stack with
CHECKSUM_NONE. Continue to discard Ethernet errors, incomplete frames
and lengths that cannot fit in the receive buffer. Address filter and
VLAN indications are not checksum errors.

Keep the hardware checker running whenever the receiver is enabled.
Turning RX checksum reporting back on can then use the result already
recorded in queued descriptors without flushing the ring.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 98 ++++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 +-
 4 files changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a972bee66504..706feb7bcbed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -615,6 +615,8 @@ struct mii_regs {
 struct mac_device_info {
 	const struct stmmac_ops *mac;
 	const struct stmmac_desc_ops *desc;
+	/* Defaults to the descriptor format's decoder unless the MAC overrides it. */
+	int (*rx_status)(struct stmmac_extra_stats *x, struct dma_desc *p);
 	const struct stmmac_dma_ops *dma;
 	const struct stmmac_mode_ops *mode;
 	const struct stmmac_hwtimestamp *ptp;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..0ad2203f76c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2017 Corentin Labbe <clabbe.montjoie@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -197,6 +198,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in RX_CTL1*/
 #define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0
 #define EMAC_RX_TH_64		(0x1 << 4)
@@ -644,6 +646,9 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
 
 	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
 	writel(v, ioaddr + EMAC_BASIC_CTL1);
+
+	/* Forward checksum failures to software before starting RX. */
+	writel(EMAC_RX_ERR_FRM, ioaddr + EMAC_RX_CTL1);
 }
 
 static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
@@ -654,7 +659,7 @@ static void sun8i_dwmac_set_mac(void __iomem *ioaddr, bool enable)
 	r = readl(ioaddr + EMAC_RX_CTL0);
 	if (enable) {
 		t |= EMAC_TX_TRANSMITTER_EN;
-		r |= EMAC_RX_RECEIVER_EN;
+		r |= EMAC_RX_RECEIVER_EN | EMAC_RX_DO_CRC;
 	} else {
 		t &= ~EMAC_TX_TRANSMITTER_EN;
 		r &= ~EMAC_RX_RECEIVER_EN;
@@ -698,16 +703,9 @@ static void sun8i_dwmac_get_umac_addr(struct mac_device_info *hw,
 			    EMAC_MACADDR_LO(reg_n));
 }
 
-/* caution this function must return non 0 to work */
-static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
+static int sun8i_dwmac_rx_ipc(struct mac_device_info *hw)
 {
-	void __iomem *ioaddr = hw->pcsr;
-	u32 v;
-
-	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
-	writel(v, ioaddr + EMAC_RX_CTL0);
-
+	/* The receiver always records the checksum result, even with RXCSUM off. */
 	return 1;
 }
 
@@ -1053,7 +1051,7 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.core_init = sun8i_dwmac_core_init,
 	.set_mac = sun8i_dwmac_set_mac,
 	.dump_regs = sun8i_dwmac_dump_mac_regs,
-	.rx_ipc = sun8i_dwmac_rx_ipc_enable,
+	.rx_ipc = sun8i_dwmac_rx_ipc,
 	.set_filter = sun8i_dwmac_set_filter,
 	.flow_ctrl = sun8i_dwmac_flow_ctrl,
 	.set_umac_addr = sun8i_dwmac_set_umac_addr,
@@ -1061,6 +1059,83 @@ static const struct stmmac_ops sun8i_dwmac_ops = {
 	.set_mac_loopback = sun8i_dwmac_set_mac_loopback,
 };
 
+static void sun8i_dwmac_rx_error_stats(struct stmmac_extra_stats *x, u32 status)
+{
+	if (status & RDES0_DESCRIPTOR_ERROR)
+		x->rx_desc++;
+	if (status & RDES0_OVERFLOW_ERROR)
+		x->overflow_error++;
+	if (status & RDES0_RECEIVE_WATCHDOG)
+		x->rx_watchdog++;
+	if (status & RDES0_SA_FILTER_FAIL)
+		x->sa_filter_fail++;
+	if ((status & RDES0_FRAME_TYPE) && (status & RDES0_IPC_CSUM_ERROR))
+		x->ipc_csum_error++;
+	if (status & RDES0_COLLISION)
+		x->rx_collision++;
+	if (status & RDES0_CRC_ERROR)
+		x->rx_crc_errors++;
+	if (status & RDES0_MII_ERROR)
+		x->rx_mii++;
+	if (status & RDES0_LENGTH_ERROR)
+		x->rx_length++;
+}
+
+static int sun8i_dwmac_rx_status(struct stmmac_extra_stats *x, struct dma_desc *p)
+{
+	const u32 csum_mask = RDES0_IPC_CSUM_ERROR | RDES0_PAYLOAD_CSUM_ERR;
+	const u32 dma_errors = RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR;
+	const u32 wire_errors = RDES0_CRC_ERROR | RDES0_MII_ERROR |
+				RDES0_RECEIVE_WATCHDOG | RDES0_COLLISION |
+				RDES0_LENGTH_ERROR;
+	u32 status = le32_to_cpu(READ_ONCE(p->des0));
+	u32 len = FIELD_GET(RDES0_FRAME_LEN_MASK, status);
+	bool runt = len < ETH_ZLEN + ETH_FCS_LEN;
+
+	if (unlikely(status & RDES0_OWN))
+		return dma_own;
+	if (unlikely(!(status & RDES0_LAST_DESCRIPTOR)))
+		return discard_frame | rx_not_ls;
+	if (unlikely(!(status & RDES0_FIRST_DESCRIPTOR))) {
+		x->rx_length++;
+		return discard_frame;
+	}
+
+#ifdef STMMAC_VLAN_TAG_USED
+	if (status & RDES0_VLAN_TAG)
+		x->vlan_tag++;
+#endif
+	if (unlikely(status & RDES0_DRIBBLING))
+		x->dribbling_bit++;
+	if (unlikely(status & (RDES0_ERROR_SUMMARY | wire_errors | dma_errors))) {
+		sun8i_dwmac_rx_error_stats(x, status);
+		if (status & dma_errors)
+			return discard_frame;
+		/* An unexplained error summary is not a checksum verdict. */
+		if (!(status & wire_errors) &&
+		    (!(status & RDES0_FRAME_TYPE) || !(status & csum_mask)))
+			return discard_frame;
+	}
+
+	/* One buffer per chain descriptor; the reported length includes FCS. */
+	if (unlikely(len < ETH_HLEN + ETH_FCS_LEN ||
+		     len > FIELD_GET(RDES1_BUFFER1_SIZE_MASK, le32_to_cpu(p->des1)))) {
+		x->rx_desc++;
+		return discard_frame;
+	}
+	if (unlikely(runt || (status & wire_errors))) {
+		if (runt && !(status & RDES0_LENGTH_ERROR))
+			x->rx_length++;
+		return discard_frame;
+	}
+
+	/* Only a checked IP frame is eligible for CHECKSUM_UNNECESSARY. */
+	if (!(status & RDES0_FRAME_TYPE) || (status & (csum_mask | RDES0_DRIBBLING)))
+		return csum_none;
+
+	return good_frame;
+}
+
 static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 {
 	struct stmmac_priv *priv = ppriv;
@@ -1068,6 +1143,7 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->pcsr = priv->ioaddr;
 	mac->mac = &sun8i_dwmac_ops;
 	mac->dma = &sun8i_dwmac_dma_ops;
+	mac->rx_status = sun8i_dwmac_rx_status;
 
 	priv->dev->priv_flags |= IFF_UNICAST_FLT;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..047d809b8b88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -125,8 +125,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
 #define stmmac_get_rx_frame_len(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, get_rx_frame_len, __args)
-#define stmmac_rx_status(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, rx_status, __args)
 #define stmmac_rx_extended_status(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, rx_extended_status, __args)
 #define stmmac_enable_tx_timestamp(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f256244ce0d1..2f33fc0126b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5775,7 +5775,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -5978,7 +5978,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		p = stmmac_get_rx_desc(priv, rx_q, entry);
 
 		/* read the status of the incoming frame */
-		status = stmmac_rx_status(priv, &priv->xstats, p);
+		status = priv->hw->rx_status(&priv->xstats, p);
 		/* check if managed by the DMA otherwise go ahead */
 		if (unlikely(status & dma_own))
 			break;
@@ -7809,6 +7809,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			return ret;
 	}
 
+	if (!priv->hw->rx_status)
+		priv->hw->rx_status = priv->hw->desc->rx_status;
+
 	/* Set alternate descriptor size (which tells the hardware that
 	 * descriptors are 8 32-bit words) when using extended descriptors
 	 * with ring mode. Only applicable for pre-v4.0 cores. Platform glue

-- 
2.53.0

