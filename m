Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524591;
	b=KqxygeB5PDKK28Z7IL0a7QP40Cj2HFT+0p1TcoJUkX/hIE5cj6jKmzTXaxq7RX5ynViv
	 FkELy6ReS71n+cnzLjgxGZAkIuAP2AuwgtzNqUglkAH5Ik6zU5fFB2rLq2Q7lRCPfCb1L
	 lbvc+Lx+IAT7zUBrVplrx5G5Xy1nXaVnwK/070n++gSvyOaNvCCmAkpJYN7OEBMGpWZku
	 kDaJ3gEkAgtIidgU06UBiSa+HCUp5jXDwA4CJNG9uUDL3OW4jY/zxcloylN5hn6QNFs7N
	 U+R6+eQ2wlmHBUspj63Im1I85pFl0OnEzioWINxblJ+oPbWWaHF4zu3W7kpeTcFfU/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524591;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=VAvbovJaBlrj+TiHcaxbxo+jaddKGJDdxnhliS93PJw=;
	b=5MThOYuXh0Td44lzu9RArXSq2aAcpbEWF7uGiMsv5tER7Cq3uVVTnQPDMUme+pTkz4N0
	 /NYOXJ2MiJbLR0v/BsCGt2HCIOAE5JRPkIaOxaUZuh/xhECE3RAuU7XTOORvtmOOEzzkR
	 EcW/ZR/x70vVRUxsKeS4m6tZ4PvxBq52eR3rvHsqabuCqzPffdbt3hvs9XuOzMLXAjGaI
	 ymjTaic1WadqlNaZC0QBJ7rRxORqnYLy49S2fEgWQRk9bbLenCFOvl4TBQGbI1X/XnF+H
	 PYc4+wCi8thJYqtfn0XFfO845/DmPvc6M09M0ukazXt5duu/ubi9D8776WrDL7wGIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ytUH88PJ;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E16606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E16606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ytUH88PJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795524590; x=1827060590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KBdcRu6bXqRV3qC/NZuJ9Jr6xLWUrd9Zd6knAY+oMGY=;
  b=ytUH88PJh5sbhitJGD44dFuMBNIYvL/f7TMT6yLjOL5s7yFOvloXFV5J
   0QjKsNUdyUWMZI7hMAkV2BnmfngyTKIJralKtT0OJDyO0gSIuuhJHLchM
   Bgd4+WZFNnrBbA2+rfKZ66N9VX7u58lUayqgR3L6uD3as3KvpNI/1WD1J
   liJ/tfFiqtbxhUvbMAVA/86UbvgEoxsiuRN0NO3AKZbKlyaVAn6FGTgm0
   nipTQJo6nfbycIi6yK9eEGtxSLwD59/rZqiBusxC1EdNMNAlzig6mdAdE
   fRudmebh44pniRs2eD9lRDsPyGspJ6PnuM9sKNXCg/hi2DF1BvPgvrcyE
   A==;
X-CSE-ConnectionGUID: pyNLyBZuQsmWAy7zWPX5wA==
X-CSE-MsgGUID: A90fBiTSQeaqFORIo9Ojlw==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="67209829"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 05:49:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Nov 2026 05:49:49 -0700
Received: from che-ll-i17164.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Nov 2026 05:49:46 -0700
From: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>
Subject: [PATCH net-next RESEND v4 3/4] microchip: lan865x: enable PHY interrupt via virtual IRQ
Date: Tue, 24 Nov 2026 18:19:29 +0530
Message-ID: <20261124124930.485323-4-parthiban.veerasooran@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
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
Content-Type: text/plain

The LAN865X integrates the PHY directly into the MAC-PHY SPI device.
The PHY has no dedicated interrupt line; its interrupt is always
delivered as the PHYINT bit in STATUS0.

Pass the OA_TC6_PHY_INT quirk flag to oa_tc6_init() to enable the
virtual IRQ infrastructure. This lets phylib operate in interrupt mode
and drives the PHY driver's config_intr/handle_interrupt callbacks for
the LAN865X internal PHY.

This completes the collision-detection fix started in "net: phy:
microchip_t1s: fix collision detection on PLCA status change"; without
this patch (and its prerequisite, "net: ethernet: oa_tc6: deliver the
PHY interrupt to phylib"), LAN865X stays on that commit's polling-based
CDEN synchronization/fallback instead of tracking PLCA transitions
dynamically.

CDEN is synchronized to the live PLCA status when lan86xx_config_intr()
runs during phy_enable_interrupts(), then tracked on each subsequent
PLCA transition via lan86xx_handle_interrupt(). This PHY interrupt path
is critical for keeping CDEN correct across PLCA transitions.

Fixes: 78341049fbcd ("net: phy: microchip_t1s: configure collision detection based on PLCA mode")
Signed-off-by: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
---
 drivers/net/ethernet/microchip/lan865x/lan865x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/net/ethernet/microchip/lan865x/lan865x.c
index d7e5dfc22396..bd670c1c5d47 100644
--- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
+++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c
@@ -332,6 +332,7 @@ static const struct net_device_ops lan865x_netdev_ops = {
 
 static int lan865x_probe(struct spi_device *spi)
 {
+	struct oa_tc6_quirks tc6_quirks = {};
 	struct net_device *netdev;
 	struct lan865x_priv *priv;
 	int ret;
@@ -348,7 +349,8 @@ static int lan865x_probe(struct spi_device *spi)
 
 	netdev->netdev_ops = &lan865x_netdev_ops;
 
-	priv->tc6 = oa_tc6_init(spi, netdev, NULL);
+	tc6_quirks.quirk_flags = OA_TC6_PHY_INT;
+	priv->tc6 = oa_tc6_init(spi, netdev, &tc6_quirks);
 	if (IS_ERR(priv->tc6)) {
 		ret = PTR_ERR(priv->tc6);
 		goto free_netdev;
-- 
2.43.0

