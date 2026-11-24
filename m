Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533725;
	b=qDjygwhb1Xd0FDhk+f+ArMfRZYtss69HrHZEyy8a1TUe9hly5btKSPUhG2jV94QAODx5
	 zkCLDAMKjgYpshD0WjymkqJtLSVpBM+X7V97wPTma0be8PLx1Sb/SOsNa8iB67KrfEGx/
	 xjXftlrj6IaTGbGJmtPl3Qjwx5pa62zrMhNTll3HqDdQpilrhklU+8N5h0cjl+yYNuhGm
	 OtD5jC9d0U/E2+SWJb1QR+NwKclvwhk2kDLrOffakX/TDgsW5J6biLET0GJogviQxvTVo
	 CUR5bdSmlZRc3x9KrdQQEJFiZX9+Qd50mLQHGBo3Cm+qngJiwnSY+E3tOe3btzNp5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533725;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uxyciXMxH0bTMNJV4EPthVww46cAkYziyxYSA313rWY=;
	b=R5llkq+MBI6N+A8sG5IJ0frmUd/Kl0tTpN3jOINRrmI29y1KOoU+2BsPF3nDICRouy2/
	 uSPnkEkl/ToocNI81b0uxqhgoqfuORCn2gFbYnuRcaUIzzw5TrS/e4EpPPZWyx3XiV2ab
	 qf6Zobj8dPrWGSe0hb3O3VH6ymtWmqbAcYPcC7VMkWV00KGDODsV+QQ6rpb9PRAci9UgU
	 vFiQuxoOL0wVkR/a9a1vKvM7xN4KdbBPHYxxo4twdERZFBlld9JSfH/Jz0dUQSkREFH77
	 4wmmX22Kqey8rBSNrpkZhW6uQcytLgAtIvGpvzwIbuRndWAGxctcGhR0LNGUkbsXbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKdj8jzQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C3606A31E;
	Tue, 24 Nov 2026 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKdj8jzQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7799E1F000D4;
	Tue, 24 Nov 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533724;
	bh=uxyciXMxH0bTMNJV4EPthVww46cAkYziyxYSA313rWY=;
	h=From:To:Cc:Subject:Date;
	b=WKdj8jzQmCBC24JLo+G90apuiKpN807k7os1v9Bul5WBYH5JXyCZCK2FIItF7Wa1q
	 DLYnPBFJSqgmtJB7nLSN+8nHozkG8r8TfZhZORPwov91A3S8ocKcy6qt7bczUaDHP/
	 ZmdMTB2InQX0Kb1z9MRlBIHo/bG1WSj2wLT3sT+nDcNKDo8mSzBl4ZS8I5r9RCIe4q
	 whgKmmIQYEsF0IbVEGfzB5yfpqSos635oOWEry2XVyd3IXlf2LDfxw4putBtYt5tcC
	 4WXWss88E5bqO1WzmeP33H8YHZ5SKvpxl6e/W6J3vMeq+hiJy26v93vAVbxalW8qpo
	 EyMOOZqMRhAGA==
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
Subject: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
Date: Tue, 24 Nov 2026 23:01:44 +0800
Message-ID: <20261124150144.7505-1-jszhang@kernel.org>
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

If platform doesn't provide "snps,blen" property, the axi_blen[] array
will contain random value from stack, then the array will be converted
to mask which will be written to DMA_AXI_BUS_MODE reg later. Fix it by
initializing the array.

Fixes: efd3c8cc52bb ("net: stmmac: remove axi_blen array")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
since v1:
 - fix subject title

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

