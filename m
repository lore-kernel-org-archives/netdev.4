Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184225;
	b=M0JomWNkQJDCsmr5R/OdUvCIU4owgRjney+qcTCsQPDnHlkBTQHgakfPJeVRmqGlwfps
	 1FZkvlYkUNCZf9839Wtf1B9sjKPTTyXXMe4z+GbB1NnJd+m0UKq5GB4vnNeYoOqRiTw/t
	 FZTWb+f6CgtodJMwIKhIXt8cGiHfER5i2BFI+4PyaJJN+nIETN1JDGRiCoVrph3N4IiyM
	 sbgl++GgNUZlcREfvziF1RnFwGrST7/AGP+cqiU33qxUNQRV2u7zVTI2PAqZchB/43EhR
	 IyZR23bqY79lzNiVs/X7HsWCEQ7sDPPCAS6AgcIs0y7OBfnqAM0nHrHl9DAPBm9eImg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YenrZl3hmSAY7ejSkR12CtlW5G70ME9GdBpP9A17E5o=;
	b=yY/Hhj/IYkX+hlLAtWZn+Ebzhb68JIiB2LnG+hg5yEiypOEIOclo0kyFqI+JpSt59HPH
	 gwKr+l9IeLRVBfZ+GlKuvCWTYSJeR40bZyRx7N7bqxLfan95OX2g2DRL//eIUYGiiTtWK
	 XOhCFVrh8M+uWCIOsm4noNuD9f58QzHqOAPG+SqHyzIyVECLIgMA8rQ2OjuBsX3CIDbZJ
	 hoPMWhgZl/0j7iBUh6xNUTBZkIMSr/qqCeAMOHlgksPmenp1/vMflkdQ0m3kuqu4Wv9Ms
	 J0QLdGK1aBTExIZIrU1zG76h3ylTuubur97BarPhInx1X+BQmc0Q7vvsg3yAgSWlAUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qc9HoNv2;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C56606A332
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C56606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qc9HoNv2
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso8587065e9.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795184224; x=1795789024; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YenrZl3hmSAY7ejSkR12CtlW5G70ME9GdBpP9A17E5o=;
        b=Qc9HoNv2oURrd5VrCJoEq20sFl1dkUzBlIJRBbkEBCfGar4kXSPfVUPiRsrZ0qdBnl
         75ah39+akzTGvUSLJPXkKrs2cHnPSzfbIeMRx/9TwiK5l2Kn1XAziazSULRbwG4vlaAg
         vPbT02lQLrmgJhtVgY1HJHpI7VHzz+BR3kqheSOn1z5LUSQrGERg9yXFEVaVVt32m/0j
         /ssy2x7kDjo2TsNusD/UxEDOmiBJ/jm0Fzv1rgStUt3YzLCflJ6aF8lOeVpXGc26wlk1
         249TodtPckU/k6C343ZNt9sh+FaCX7V4fzXkMppZolXDyQ7YfBbidhZPL28wJL9/d2zd
         ICdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184224; x=1795789024;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YenrZl3hmSAY7ejSkR12CtlW5G70ME9GdBpP9A17E5o=;
        b=vxvj03idzaB+GbPic7Nfrki5CDro2GzYPjqvO0MZrg4dvMm4nTdJy7AAl1UYqYMelu
         NIbMWRzrh6ab/8QWSlZeWo3AbTWFTLjmPPBe16vWZzBqyVoN8Motkxp/3pgzEJIUp+j7
         biWRR1frl0rII68rJDRPKaYHYJ85p1fE22LksQM/QPhiO0NpJvAXbHtNmFPFCNkbf/tB
         Pzwg3asuXTCo5YuKgm+eOXmMZtv90fcYyTdXaWDJ1upvtRj7Sx9ZvEIBlueQX3VmcIr2
         yiEOk/oWqnV1IYQYo0EF9Yx8PTV4VCgYG0V22C4bKCDPEtqMxpQAX/CCE4EhVyJry1e6
         q9eg==
X-Gm-Message-State: APuU4Z9/fkyd6aAGElmYswe/3nAHlKC+es8F7f0mof9cxQ2iFI72c7e5
	YJU/EY2+D/G15JJ/PVOy+7otwtjSQqvpM0pnA5Zght5p/Gni0qGHS9X0
X-Gm-Gg: AYBFou2CCvjPYSvC9Dn63Ez2HXZcHFXBgZTKA2odOiEL09OZMN+2Bno5TSwfA5QzrRb
	nKVXbyLXSbmshM185VUkRrZ/agQVkO/RDxhoVXNvWKp/oP3sIagLsJoVLoVc897gYkmXMHApOBf
	aocjS3vUGrUC42ebrzYAgf80szX829WaeqpwjhnP2iGeyOUdnIu3OEHcbkXgN0PRSiisgHBWgBk
	lsZw4IRjdr9nWbsdOt9lw/NOI+zlx2sXXrBaCZDji+Yiv9R/e/4N/v1oXMnmUxQRPh2sls6pxua
	UY3NjlcV+X6tJUHopW7FaS527r+PF/W66oubtUFgHCjfGhY/+H/AZjBPb7VMk/EfP/QVmGB0ZmA
	C5Tn8ezwVUoKTW/I63MSVZEbnnzlmJSx4vO0YhDiSRdhBEBaQPrlln4NeFi0hk7hI25Kepgpp9D
	TT16Y8wgSDrzMUUR8TyBNJ9hbgMYDN5qDAar9W2grl7ln6iJl7iZyHixwX0gZMoXP9QFZ0lzs1V
	lDUomRGW0QS68GJ9cYEqcE9oWPWzgoYxYQL1pgmY7Un6qm46IN06gbWRqLiF4v6sWJ2hMSs+eM8
	NeUH4FzB0a4G16U0Ew4MnrLl411wK6gSppcmqNxe8XM9R+9hDkoanOG2g1jL57QwFM7v0E2ZO97
	TiEk/z2nSDg==
X-Received: by 2002:a05:600c:1548:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb88800013mr79322935e9.6.1795184223724;
        Fri, 20 Nov 2026 06:17:03 -0800 (PST)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm6303181f8f.11.2026.11.20.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:17:03 -0800 (PST)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Fri, 20 Nov 2026 15:16:47 +0100
Subject: [PATCH] net: stmmac: reset the DMA on a fatal bus error
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
Message-Id: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
X-B4-Tracking: v=1; b=H4sIAE5WAGsC/yXMQQrCMBBA0auUWRtIIrTFq4iEMZm2I6aVmSiF0
 rs36vIt/t9ASZgULs0GQh9WXuYKd2ogTjiPZDhVg7e+dc5boyVnjCFlDAMWfAYSWcQk36bOoT3
 bHqHGL6GB19/4evtb3/cHxfK9wb4fbqA76HoAAAA=
X-Change-ID: 20261120-stmmac_dma_fatal_error-d26d71a0308a
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 jakob.unterwurzacher@cherry.de
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795184222; l=6954;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=3uMSgXMdRbOFX8wu5fHoR/8jADm3lm8qiqodLAVFHcA=;
 b=fYNBYLOp6/xaagslBSZ3O+L9wekUNbY2QeMUTj7tFArTwMYhU0aO++SgEIuCdWyAjdfu5ylVo
 EBHmKPcxMNtAHYYf3pNlFP1wJNvxDh2UItPsufLBGeAr5tVLqOdY0Ga
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

A fatal bus error (FBE) stops both the TX and the RX DMA engine of the
channel. The DMA interrupt handlers report it as tx_hard_error, so
stmmac_tx_err() reinitializes and restarts the TX side only. The RX DMA
stays stopped: the RX descriptors remain owned by the DMA, the MAC
drops every received frame (mmc_rx_fifo_overflow grows) and nothing is
logged. The only trace is the fatal_bus_error_irq counter in
ethtool -S. The interface needs a manual down/up to recover.

This happens on RK3588 (dwmac4) after resume from suspend-to-RAM,
roughly once in 300-500 resumes: DMA_DEBUG_STATUS0 shows the RX process
of channel 0 stopped (RPS0 = 0), DMA_CH0_RX_CONTROL has SR cleared,
while TX keeps running.

Report a fatal bus error as a separate dma_fatal_error status and
handle it like other fatal errors with stmmac_global_err(), which
resets the adapter from the service task. Do so in the shared and in
the per-channel MSI interrupt paths, and for all DMA cores that report
the error (dwmac100/1000, dwmac4, dwxgmac2, loongson).

Tested on RK3588-Tiger where it catches and recovers the observed
hangs after resume.

Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 29 +++++++++++++++++++++-
 6 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index c74bc7c9750e9..1f74cb451215f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -376,6 +376,7 @@ enum dma_irq_status {
 	tx_hard_error_bump_tc = 0x2,
 	handle_rx = 0x4,
 	handle_tx = 0x8,
+	dma_fatal_error = 0x10,
 };
 
 enum dma_irq_dir {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index a42d80ead9d40..0a15f5565106c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -268,7 +268,7 @@ static int loongson_dwmac_dma_interrupt(struct stmmac_priv *priv,
 		}
 		if (unlikely(fb_intr_status)) {
 			x->fatal_bus_error_irq++;
-			ret = tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 	/* TX/RX NORMAL interrupts */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index a0249715fafaf..2147403629892 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -165,7 +165,7 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 		}
 		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
 			x->fatal_bus_error_irq++;
-			ret = tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index a0383f9486c2d..3f3f2f623bd3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -204,7 +204,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 		}
 		if (unlikely(intr_status & DMA_STATUS_FBI)) {
 			x->fatal_bus_error_irq++;
-			ret = tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 	/* TX/RX NORMAL interrupts */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 0a6e82a155c0e..bc06076410dc7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -335,7 +335,7 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 		}
 		if (unlikely(intr_status & XGMAC_FBE)) {
 			x->fatal_bus_error_irq++;
-			ret |= tx_hard_error;
+			ret |= dma_fatal_error;
 		}
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9f..16ba83db34546 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -349,6 +349,24 @@ static void stmmac_global_err(struct stmmac_priv *priv)
 	stmmac_service_event_schedule(priv);
 }
 
+/* A fatal bus error stops both the TX and the RX DMA of the channel. Only a
+ * reset of the DMA brings them back, so restarting the TX side alone is not
+ * enough: RX would stay stopped without any further error.
+ */
+static bool stmmac_dma_fatal_error(struct stmmac_priv *priv, int status,
+				   u32 chan)
+{
+	if (likely(!(status & dma_fatal_error)))
+		return false;
+
+	if (net_ratelimit())
+		netdev_err(priv->dev, "DMA fatal bus error on channel %u\n",
+			   chan);
+	stmmac_global_err(priv);
+
+	return true;
+}
+
 static void print_pkt(unsigned char *buf, int len)
 {
 	pr_debug("len = %d byte, buf addr: 0x%p\n", len, buf);
@@ -3169,6 +3187,10 @@ static void stmmac_dma_interrupt(struct stmmac_priv *priv)
 		status[chan] = stmmac_napi_check(priv, chan,
 						 DMA_DIR_RXTX);
 
+	for (chan = 0; chan < channels_to_check; chan++)
+		if (stmmac_dma_fatal_error(priv, status[chan], chan))
+			return;
+
 	for (chan = 0; chan < tx_channel_count; chan++) {
 		if (unlikely(status[chan] & tx_hard_error_bump_tc)) {
 			/* Try to bump up the dma threshold on this failure */
@@ -6533,6 +6555,9 @@ static irqreturn_t stmmac_msi_intr_tx(int irq, void *data)
 
 	status = stmmac_napi_check(priv, chan, DMA_DIR_TX);
 
+	if (stmmac_dma_fatal_error(priv, status, chan))
+		return IRQ_HANDLED;
+
 	if (unlikely(status & tx_hard_error_bump_tc)) {
 		/* Try to bump up the dma threshold on this failure */
 		stmmac_bump_dma_threshold(priv, chan);
@@ -6549,6 +6574,7 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
 	struct stmmac_dma_conf *dma_conf;
 	int chan = rx_q->queue_index;
 	struct stmmac_priv *priv;
+	int status;
 
 	dma_conf = container_of(rx_q, struct stmmac_dma_conf, rx_queue[chan]);
 	priv = container_of(dma_conf, struct stmmac_priv, dma_conf);
@@ -6557,7 +6583,8 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
 	if (test_bit(STMMAC_DOWN, &priv->state))
 		return IRQ_HANDLED;
 
-	stmmac_napi_check(priv, chan, DMA_DIR_RX);
+	status = stmmac_napi_check(priv, chan, DMA_DIR_RX);
+	stmmac_dma_fatal_error(priv, status, chan);
 
 	return IRQ_HANDLED;
 }

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261120-stmmac_dma_fatal_error-d26d71a0308a

Best regards,
--  
Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

