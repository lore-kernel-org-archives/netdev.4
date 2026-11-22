Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795358986;
	b=FjA8t3j+HnI2gTVXAe2E/x/3wGoPLuvhuGv2cjvGP3wZsCHUufCnbvPYk8hlxk5FmxHu
	 M/esQUXInALuIMe6tVoSb4SP0D44GqPgivB8tOPgMQVII5igIO+S2tWvN3udOzvJXN4kp
	 9vLYjPdzpT70TCpoAqkGQREbub+LXFUFW/1B6/5uIAVGtnFPM25UIqhDczOokggtQSe+M
	 lfpTXi7xQTYZgzv4pZ/H3CiPy0sOUOT9SKGN0tYBOzeIf+s0pY4/cDlz6W7/Z9pi3hUIH
	 S5SuGmQZn/YYNftr3X+hW3MirZqWBDLED7oIK6JgRbMDHGg/pEfQREakJqrMGa9RSYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795358986;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=utK4M7GE/JevjSpCvIwudXzUWEsfoW3c/fssQAD0hxo=;
	b=UmKHN0iXjgNx1VLa6StpkW0kKq9xLzSshHv5FCTi7Y+1/verU7atpyH6yxS8qpfFnsxb
	 Sb9OF3SflhgAzlj9Bf/ZyIOEig05bUdUq6DkIycd4KQ7r7mWMnMRydy8i9FRLXKKYJnqg
	 8779cJ+iVcpHDokGhl/3/SnCTxORI/k54pxY31+HCsi04P6megRXiEkaIRgL66G8YiPYL
	 m+USwbBdH94Mc3LEweLuOvchkxGPcPGFaGaCdL4BInuGhCpi7F2xm1BRnTydeEU8Tckoh
	 A4qjnIkYn4GQKD3XCPPBbi/e+p79VOJYK7+25U7VC1NmpjUf1HjOoN7jSqA/nwpRHIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pf3fP81J;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E7606A33A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627E7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pf3fP81J
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0C34E1A1783;
	Sun, 22 Nov 2026 14:49:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC9A460512;
	Sun, 22 Nov 2026 14:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58F5711E623B4;
	Sun, 22 Nov 2026 15:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358982; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=utK4M7GE/JevjSpCvIwudXzUWEsfoW3c/fssQAD0hxo=;
	b=Pf3fP81JIlkMcHt1EYgMaHvhSnQSV9lrWuFWvJMp7dZTp0VfwGfllF4N9Hj79xMB6L2zN1
	SMNsmjRvsaWV503SF2L2pGr+0HHSMdm9nFztbXy0R+glKThJ3cpRr9LeNxaF07M/Rxiagm
	xABKvek67OsW7AwDZZyrvbQ4HhvTSvd8DtshhFpaPk6KZafsikDiZSyk5MPPtY5akAL3dx
	w7lBD278dFg11+ppOGQKTWF4hTk/Xwh2yH6jQJsAG8gTJvW5PmBdrt9y8s3YyxrHLMEYPf
	fISLAOhRSL8tUxkUfMeVEPPxtVr6jI+zIWv8uzlBmHFmaRjSWNBTlSLsx/l1/A==
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
Subject: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control separately
Date: Sun, 22 Nov 2026 15:49:23 +0100
Message-ID: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
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

Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
is FLOW_RX | FLOW_TX), and enables RX/TX based on that.

Allow enabling RX/TX flow control directions separately.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..c63f4d87de50 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -760,14 +760,14 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	if (fc == FLOW_AUTO)
+	if (fc & FLOW_RX)
 		v |= EMAC_RX_FLOW_CTL_EN;
 	else
 		v &= ~EMAC_RX_FLOW_CTL_EN;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	v = readl(ioaddr + EMAC_TX_FLOW_CTL);
-	if (fc == FLOW_AUTO)
+	if (fc & FLOW_TX)
 		v |= EMAC_TX_FLOW_CTL_EN;
 	else
 		v &= ~EMAC_TX_FLOW_CTL_EN;
-- 
2.56.1

