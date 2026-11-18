Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018922;
	b=NVD0F3JYKNtGp84cMK8dJHaHPcy99tIuW1jIUbJ90+drEh7YAkAdRELlgKb/ISeI2kio
	 CQgHjUUr6emWac+V72WreFjwg1KGkvQdhIZX/TbeQDqS0W6cSiDt245B8YCpRwGkEGbPZ
	 M84olaXwQ+YLCW0hKospZIAtP+lRyrSaG3HnfKS8QCplB2VzFC1QeGDHuQceM2oJ1n0yZ
	 y1Zf3PPdYbaIVcBP4r1qM6A6bZKyMnU3mkVSqWCcnvKNQMsIhDjN3jM5zJrNP/ESJqvV8
	 UnxvyHD+ksdAqUy7T7+WQvWDicY3CQ7rOmxVUCCLjDgaJdSX95YcW0Wb50V30E2TE+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018922;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=o4IhjYnsAkS+A/M5yq5qkGtMA6PWttIKEDUvGkvU2eY=;
	b=tWckFlBeASUKFv/NPDBBIooal98rHmKV7q2Z0ZzY1w4Tos0qKAS0Yr/3Rj3JCNCYoXdZ
	 cmYHkQ50cpWgxAj0G2VeQaMi5XRLhyYL+hK9YcVVGXBU4DTFjiiAb9X7UtWnyoNVRbks1
	 +Fuo6tyEnQJjHFpzSNCPoqIIuYi2MvNbioMQgR4nL4G1neV2fdC9gyrvyST3zQdgnMqX5
	 EhTZBUY+NNCjh+6s6slXwSSIg5rJFDDLeXjqU2upMxyu7uMfZJ3nEcvPa3b5A09SkU1ph
	 bRwiMrerpcjl13W+4kaGv30/0jb4QypEgSEd2+syPvvCgfOJQUmpmqm2O0n5RZqS22g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2R2b9+uz;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9218E606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9218E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2R2b9+uz
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9DEDCC4CBDA;
	Wed, 18 Nov 2026 16:22:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B705A5FE9B;
	Wed, 18 Nov 2026 16:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D84B11BC26F9;
	Wed, 18 Nov 2026 17:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795018913; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=o4IhjYnsAkS+A/M5yq5qkGtMA6PWttIKEDUvGkvU2eY=;
	b=2R2b9+uzpz1RycSQMmA4zCkWe9M65VvGUkYqRX+1u1KTtAl8zxLwkxnHPQzqR+VdJ/ZVor
	kIofdG4xnPPGBNUYwJiaLMXaKsZtgpxvBcUqKZXh3hBPGL34QX4TXjMYE9262PDctTHfdN
	psc7w4JRcm9gz7pc71uccgTshjFCV7MnvBpCPCLx2Gh/nICOzHtu/mkuKYWWjWymqsNveU
	EIgpPrgO6h6OTH742MiFpMRc/gtna3bfUhXufygoUb+nXK9z44VYKSjveYMc5XnXJLWOsY
	oXqrEyeMqo8GJbHfCGUwPznZERl8pzdjVyTMumDJ+1vKnscB9D6tqz2fPoUSJw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Joseph Steel <recv.jo@gmail.com>,
	Muhammad Nazim Amirul Nazle Asmade <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type from the descriptor
Date: Wed, 18 Nov 2026 17:21:34 +0100
Message-ID: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
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

Stmmac's double VLAN handling hasn't been working great for a while,
it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
it was found that the tag stripping hardcodes the 8021Q tag type for
XGMAC while stripping the tag, while the IP actually reports the outer
tag type in the descriptor.

The tag type can be one of 6 different values (note inner/outer is
reversed in the macro names):

 - XGMAC_ET_LT_VLAN_STAG       single S-tag
 - XGMAC_ET_LT_VLAN_CTAG       single C-tag
 - XGMAC_ET_LT_DVLAN_CTAG_CTAG outer C-tag, inner C-tag
 - XGMAC_ET_LT_DVLAN_STAG_STAG outer S-tag, inner S-tag
 - XGMAC_ET_LT_DVLAN_CTAG_STAG outer S-tag, inner C-tag
 - XGMAC_ET_LT_DVLAN_STAG_CTAG outer C-tag, inner S-tag

Report that tag type through a dedicated desc ops and report it to the
stack.

We keep the 8021Q fallback when we don't have the ops, as we don't
set NETIF_F_HW_VLAN_STAG_FILTER on the cores that don't support that.

This has been tested on AgileX5 with the vlan.py selftest.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c    | 13 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c   |  6 +++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..71ce2bc9b5e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -76,6 +76,18 @@ static bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)
 	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
 }
 
+static u16 dwxgmac2_wrback_get_rx_vlan_proto(struct dma_desc *p)
+{
+	switch (FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3))) {
+	case XGMAC_ET_LT_VLAN_STAG:
+	case XGMAC_ET_LT_DVLAN_STAG_STAG:
+	case XGMAC_ET_LT_DVLAN_CTAG_STAG:
+		return ETH_P_8021AD;
+	default:
+		return ETH_P_8021Q;
+	}
+}
+
 static int dwxgmac2_get_rx_frame_len(struct dma_desc *p, int rx_coe)
 {
 	return (le32_to_cpu(p->des3) & XGMAC_RDES3_PL);
@@ -352,6 +364,7 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_rx_owner = dwxgmac2_set_rx_owner,
 	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
+	.get_rx_vlan_proto = dwxgmac2_wrback_get_rx_vlan_proto,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
 	.enable_tx_timestamp = dwxgmac2_enable_tx_timestamp,
 	.get_tx_timestamp_status = dwxgmac2_get_tx_timestamp_status,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..047bda5cbd92 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -60,6 +60,8 @@ struct stmmac_desc_ops {
 	u16 (*get_rx_vlan_tci)(struct dma_desc *p);
 	/* Get the valid status of descriptor */
 	bool (*get_rx_vlan_valid)(struct dma_desc *p);
+	/* Get the vlan tag proto from the descriptor */
+	u16 (*get_rx_vlan_proto)(struct dma_desc *p);
 	/* Return the transmit status looking at the TDES1 */
 	int (*tx_status)(struct stmmac_extra_stats *x,
 			 struct dma_desc *p, void __iomem *ioaddr);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
index fb9aad748cb3..bf23d82e9f38 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
@@ -209,8 +209,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
 {
 	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
 		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
+		u16 proto = ETH_P_8021Q;
 
-		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
+		if (hw->desc->get_rx_vlan_proto)
+			proto = hw->desc->get_rx_vlan_proto(rx_desc);
+
+		__vlan_hwaccel_put_tag(skb, htons(proto), vid);
 	}
 }
 
-- 
2.56.1

