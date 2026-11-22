Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358991;
	b=wloIpDz5NeuPd6bp9cO0wHSdHok5lXQJXlojZ4wUs5ShvKok6ce+250YxbgySI0mhYho
	 5J9m4LwrUgdJFz2VUJxFQjbu+rBFdVj1zCt/RcCu2nr6fgdwbM+H4gyjp/pJtAu1FLGXf
	 aLQ6OYbyMPNJIRGFb1cTQLAHavMK8k89pzKC7lAapaOb9oDhUO6W9Qzh/oyTn3aScd4Xj
	 OAMZ6iNKQHpr/sc4yz+7MUyJuCNnZiicu2uiP5Rr8btXhPipdyKJGhmPIaepyF+kcWa0K
	 pObY/AtbKvHc5QK0d2ah7AmVu9JEsYOBak/YmXVyB0l4yLgS4Odk2nOI16W2YfH9bbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358991;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=D7IyEM1xmU0ttRjHhZmbac+rxu8OBN35sVrm+mJoCRk=;
	b=NClmxcXO8r57yLSQulsKvijLnYWgnZgZl889LI/TxZPDuDNWy4bGVeDDxuLZc7RV3a3Y
	 EnbiB56KioRtZSyxBAbBZtKbZTlk3x72gbYnsLA4h/9R5IbbNH9u09MfYoqLxKv6rPM4s
	 5J7rPTqFzB7hnm2QtgReL0HHqu+X0rcfytW5GmojY9YhbZjNjFltvuO/6OxU/X7pFdZOk
	 WJxtedbdSd9j2yh+1DM3L61PnOe5f/T29OeNdfIrYJEXv7H8i5cuxoWYtEvxjAsinoRf6
	 1O7iGRPzg9GMvvuocLezebT9tRqWgtetxjNVepTMUTCzZHMriTmGE+RjviOIfDjZMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GpGtKWCC;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D5606A681;
	Sun, 22 Nov 2026 14:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10D5606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GpGtKWCC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F2744E416E5;
	Sun, 22 Nov 2026 14:49:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E1D460512;
	Sun, 22 Nov 2026 14:49:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C139A11E60230;
	Sun, 22 Nov 2026 15:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358987; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=D7IyEM1xmU0ttRjHhZmbac+rxu8OBN35sVrm+mJoCRk=;
	b=GpGtKWCCC3MKNfOoI9bnaurUaYqwDrMC0Zhaje4JhlVDcuunKO+frhiuzRN6tbh1rv51QB
	N3cRNRiHcqOzw9JQHYjXb3DFyuZTgKiO2nHJDLD9SuhMH0U0DqDgL0O798PTLbhv5mPiWV
	jxhTtAzYrlDl7Mhuyccnpac5QjlNLP2fyT+r06zaRDRrXga4giDTeLBuuWzGUakrodJpBP
	fj1wUaU5XcRiBFU3oJiDIzptPkQIe9xBnia5O0k7let9FxVAu+fZJAS1uDeKvfO5Gi+20j
	2dmChr5IAJip0AAjdvv0XlTMct7YQSh6+jcoetQjzb3XLj1ltzAMgvkK7uxF5Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net-next 3/3] net: stmmac: dwmac-sun8i: configure the pause time for TX flow control
Date: Sun, 22 Nov 2026 15:49:25 +0100
Message-ID: <20261122144926.284857-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

When sending pause frames for flow control, we need to indicate the
number of quantums the peer should wait before sending more frames.

This is maintained in stmmac's "pause_time" global variable (it's a
module param).

Let's program the pause time value, and also allow sending the
zero-quanta pause frame when the peer can resume sending traffic.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 75c743dfe348..613199da57c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -232,6 +232,8 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 
 /* Used in EMAC_TX_FLOW_CTL */
 #define EMAC_TX_FLOW_CTL_EN             BIT(0)
+#define EMAC_TX_FLOW_CTL_ZQP_FRM_EN	BIT(1)
+#define EMAC_TX_FLOW_CTL_PAUSE_TIME	GENMASK(19, 4)
 
 /* Used in EMAC_INT_STA */
 #define EMAC_TX_INT             BIT(0)
@@ -784,10 +786,11 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_RX_CTL1);
 
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
+	v &= ~(EMAC_TX_FLOW_CTL_EN | EMAC_TX_FLOW_CTL_ZQP_FRM_EN |
+	       EMAC_TX_FLOW_CTL_PAUSE_TIME);
 	if (fc & FLOW_TX)
-		v |= EMAC_TX_FLOW_CTL_EN;
-	else
-		v &= ~EMAC_TX_FLOW_CTL_EN;
+		v |= EMAC_TX_FLOW_CTL_EN | EMAC_TX_FLOW_CTL_ZQP_FRM_EN |
+		     FIELD_PREP(EMAC_TX_FLOW_CTL_PAUSE_TIME, pause_time);
 	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
 }
 
-- 
2.56.1

