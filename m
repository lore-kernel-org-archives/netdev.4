Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440824;
	b=S+2PWa8E2D0fL5cLnl4akeUpx6/JPNP4EwVgjawREexSZpeiUWEmxK6nU2rmSbGT6OP6
	 Hf2DWZa2Cs+TZfIPSDflsLbr59nq2bJx+5LjysNvn1SugEoxrDJrMxCLuvGqbltyzOs3k
	 2B9kHn4uTGzyY/Ut3YOegr+PeZOeHLgnDhk6DhMEt2GrSINhIa7hJXWqp4Ax4t79LYjyU
	 8qDeDWgVSdoXvjPoJewFTy49MaEl3/ddZQcMYK09DcMnEdAIhAxeI3uDIWQK5NnFOxxfc
	 YX9yoPAwlGg4Mzmb9EYTQj3k3j3gBPRG4YezQAKIEFqvmU+G7naNjB8vNPkRf1L+rug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440824;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Y8yOTbhtoK28NXLx6+AHEKOz4plE0kM1KVQW0HkT0E=;
	b=hzXD+7c5eTT9U8NCPOZvpfe05zGd/yaEyoEkmbHgMuVqfvsml/ox8KCOvOrXCLg22IG1
	 CVJEHFKKPJJ2QEsCAUJ/RcU5Vtx6bUpaQB1Idjq7NYHFnakqh0YHY0B45xnAdKdy0vZpR
	 tc9OBqlvCHw2V+JMHkzmwploIXTq4NcGaavhnpfVOIR+FWR2agqo4Ex432aXT3Hb2zo1f
	 ioMjg6/Za1b3J+QihHUqhiBDPkdwDXhBUzDQANrFBhheZo73pt6TeUGK4MGEGaIl5J031
	 zQ1w87fR8x1M7dJK+wMQ8t3+LoeAs35LHZmtnxVCteZH8HePIWAOdWuJIj/8Hnwcsww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WG78Xect;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1413606A31A;
	Mon, 23 Nov 2026 13:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WG78Xect
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F4A1F000D2;
	Mon, 23 Nov 2026 13:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440824;
	bh=2Y8yOTbhtoK28NXLx6+AHEKOz4plE0kM1KVQW0HkT0E=;
	h=From:To:Cc:Subject:Date;
	b=WG78XectP2FyDqthO37ScnDRMWI+8ex8igW/DoTTOhQMzC3nK+X/oyztCZxCKs7cW
	 SJ8JYe19WT+SzK9KyY8RbsIoKEg4OBOvYk1XG45pA8m7CDeyVoB8Hf+uhg7pzSnNy1
	 5jSJSxvCZQOOkyE/ryVDHK7yrStJZs1Q1Kkm7ZeJjxNH6WUDDWWgN61qhDT3yiz8cA
	 JsyGiC0zGZFtJ89UqMTkpOjO5EEZEpftdeDhihn4SqRMeuTn/R2aLrKvWoPU1FH0SM
	 aLysckbtOMHghFhpab7G+ooTL4pC8h2NWChExh+UL6aOcPQgzhfjcXVlcOIK/qaHma
	 KPAgy7rY2ClPg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: fix uninitialized axi_blen array
Date: Mon, 23 Nov 2026 21:13:26 +0800
Message-ID: <20261123131326.7105-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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

If platform doesn't provide a valid "snps,blen" property, the
axi_blen[] array will contain random value from stack, then the array
will be converted to mask which will be written to DMA_AXI_BUS_MODE
reg later. Fix it by initializing the array.

Fixes: efd3c8cc52bb ("net: stmmac: remove axi_blen array")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b3e06aa58fe5..29ead405f449 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -96,7 +96,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct stmmac_axi *axi;
-	u32 axi_blen[AXI_BLEN];
+	u32 axi_blen[AXI_BLEN] = {};
 
 	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
 	if (!np)
-- 
2.55.0

