Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694361;
	b=RZ//Sp/O6+FlwR0NaqSgrLaSuaKHRTroMThfIH3v4svwxzvP6UMZs6DmMTn1/TqN93fk
	 KJeyZb03qe+ky4SA0JYwCMhNFqilQsh91Nku+M6rKcx+mOAvg7cngoejpmofQnC6xaERa
	 B//4NZA/YCB4b8PfBlypCgZQxQNK8xSp1tH17ZHZxls4DmheVJgBIuFEQyyUg5PrNCCtB
	 gQEV1onzSBNsGMshWdPEKARejdrHkco5Grh2bikW4Bv2c6gqJ6EqRd5B5+1o+MZLQM070
	 kPnIuoIAfl8dGlkTwe7UOxh1x5FN4OrFEqwb+g0aFYClV8Z/pbZgy3yzScSfbsTsQbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iw5DmtVmR75qQzOUUrXqOsqyPHxhpZ76b2+0SQwU8h4=;
	b=PVjBN3247U1F1QDwSc5ow+p/D70gmHLag9axl9UDc2lOL6N/9ex2iYz+OJZXjm0/EinX
	 7qx/s1Q3If+6sE+Ge6132MGO++tzsBI1DKchtg1F8zPi4A+LOkEsOnyiRCoI34QRhXrc/
	 h7aVx7BEQxN/MKAVBT8DZUVlSqPjbhh7fZdUAFb1RD5jP+/sLpNIiSA0ip1pKES3Nf3PW
	 DY5pa5KyOf1tMxxL3hADjVNNO2c013fdPbD+RvSxHf7ZHVqcFyInndqwH+E8QosgNsktv
	 Drapc6a9DMExcvjuSy/ZUs6JLpgJA2ifXOMJClrI9oS/vxXt0F8y2hbP6bPmhSiOljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkZLq28j;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18A606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D18A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OkZLq28j
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2815079a12.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795694360; x=1796299160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw5DmtVmR75qQzOUUrXqOsqyPHxhpZ76b2+0SQwU8h4=;
        b=OkZLq28jO195oP9F1BkuCoZZJpus0qwmPLc528K+TXEWeQi+sPm6mLA4MRZ8DksRfW
         Id9wsgO77VH/Ni2AYG+MM+tVFfDsFlBbEDNsZNEGBgTzDApWkbic7z+5zxXpr/Pei5lW
         08swZYubmAmuQBKWfTQFRadVHJzM/hCPammWMyol4P4Eq6garC6VfJVV2tC7SfjrI4El
         rQsC139a3jan0SuVROSIG/XfLAd8fkFIBgpF4912v6Vc8yzeu7HqskE2WqJ4A01B8ufT
         D7JdgluRQmbJlU/GEbW00NQviCzOVvoGrCdl5AhiZhbwjYf2xAaxGVdQZe7i+B21UuRO
         AiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694360; x=1796299160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw5DmtVmR75qQzOUUrXqOsqyPHxhpZ76b2+0SQwU8h4=;
        b=HQCDcxiJu+GoIOlQo8Z4v1yMTVSapF6XpEc89D+BP8uh2Z9ml6H+epU3o437p3sbR5
         EiPDEwPZGj+tWVlUfikO+euu+iPYfpcccJU2jMgfNNwjp7TqofJ3sCCF7lqh0HipBs37
         pTSdgV6fCL41D0bQADU/5CCXCnXRnB3G028wFVwgwFPsuWLITfFv4MdL5mEMNLLTgVd1
         9OaNlPtYj5oKkP77OT7MfSivKVFOZbuj/TmiS+XzGwHXRUyqR5UieQHetr6vpM2VVk6U
         9RA+zjrVZGQ6lQ0rqcOjVlbxomESRljFUZyoQ0cG9FQ4GgUCEh/ds6RlpMEkRXPPpZpU
         jwXA==
X-Gm-Message-State: APuU4Z8AadcptaePZhNKpApHX3Afs8aQQJZumxeB1aPLmQ4xo59pl6ri
	mHTWHUe+O7ue8IvHfZjxmKMxbjn0Sve6HR3G3E5CGt22Ad8zqnqWhbXp
X-Gm-Gg: AZFdTZeYVV11T22WzC2FtyGTYCVY5pWs2CCg6Bb1OIDziMA6ckPllpQi7yz9XtfvVhh
	3D2CE1nTghsJEGPVytAQk1WBGiybSDIW4vfIneq/w+0tCXYRqWr3b4xJ3DqgceQYW8XOg9d5wp1
	0tte+47UnhhuSw3BGoxQ2kBWxAvbcMR6kOe1hGctOi/AVFW5+11FvpEQbD0ox6+G127pFmyKcPF
	LptWR9Q92m5Y6f35FRSXTbQrDV9UCxd79S3HJurIf7swh5/bb0wVEs0CyrtPU2gBsfhUhnc/M+Y
	wImSszTEEkd0uM8yLarQnUZy0y9VkdD5XdtCesJLVLhH05dGUzaBhRhbX6VK/2LIa19o08MdwQd
	dsuo5y4cy6U7qDrQ0mmeuhoA+54Zoxewt5iuNyE+tBPz9DappIRt6Oa63R/GCGGBRCFC2ycmsyo
	Ot/hLCOo4C1M9JYcxpPvEkc9yZ2p4bxS/fDHZXt+4/KfzysNOo8ckNJzYfGfSP6Ni2kvCp4jJDN
	i5V1g/Vq0HJDlwXpj72FOmjcstK2SfTGlIyvZo/ywWn1ug4IU23CvXJY7gRVIZMx8mWRDq/+hGV
	7OLJ89h3XvRWj1vp3s6eJ0wAqU/2
X-Received: by 2002:a17:90a:d2c7:b0:3b4:1a5f:8664 with SMTP id 98e67ed59e1d1-3b41c97aaa0mr18247870a91.65.1795694359616;
        Thu, 26 Nov 2026 03:59:19 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm15666484a91.1.2026.11.26.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:59:19 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH net-next v6] net: stmmac: program the FSM timeout timer
Date: Thu, 26 Nov 2026 19:59:12 +0800
Message-Id: <20261126115912.3145086-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
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

stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
MAC_FSM_ACT_Timer register.  Per the databook the checker only fires once
NTMRMD is programmed with a non-zero duration; NTMRMD == 0 disables the
timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
never reported and the advertised timeout protection is ineffective.

Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
timeout could wrongly report a flow-control stall as a stuck FSM.

The NTMRMD field holds a power-of-two microsecond timeout per the
databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).

The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
not reported through the safety interrupt despite TMOUTEN being set.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v6:
- Move the STMMAC_NTMRMD_* encodings from include/linux/stmmac.h to the
  driver's common.h, and add Maxime's Reviewed-by.

v5: https://lore.kernel.org/netdev/20261125111929.3395740-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20261118025528.2703790-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20261116114923.1157920-1-zxyan0222@gmail.com/
v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@gmail.com/
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/

 drivers/net/ethernet/stmicro/stmmac/common.h   | 12 ++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c   | 17 ++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    | 18 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++++++-
 7 files changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a972bee66504..17cc0dc7e79d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -268,6 +268,18 @@ struct stmmac_safety_stats {
 
 #define	MAC_CSR_H_FRQ_MASK	0x20
 
+/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
+#define STMMAC_NTMRMD_1US		0x1
+#define STMMAC_NTMRMD_1MS		0x2
+#define STMMAC_NTMRMD_16MS		0x3
+#define STMMAC_NTMRMD_64MS		0x4
+#define STMMAC_NTMRMD_256MS		0x5
+#define STMMAC_NTMRMD_1SEC		0x6
+#define STMMAC_NTMRMD_4SEC		0x7
+#define STMMAC_NTMRMD_16SEC		0x8
+#define STMMAC_NTMRMD_32SEC		0x9
+#define STMMAC_NTMRMD_64SEC		0xa
+
 #define HASH_TABLE_SIZE 64
 #define PAUSE_TIME 0xffff
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index f1bb981cab7c..37e70b82c8b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
 // stmmac Support for 5.xx Ethernet QoS cores
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/iopoll.h>
 #include "common.h"
@@ -184,7 +185,8 @@ static void dwmac5_handle_dma_err(struct net_device *ndev,
 }
 
 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			      struct stmmac_safety_feature_cfg *safety_feat_cfg)
+			      struct stmmac_safety_feature_cfg *safety_feat_cfg,
+			      unsigned int csr_clk_mhz)
 {
 	struct stmmac_safety_feature_cfg all_safety_feats = {
 		.tsoee = 1,
@@ -245,6 +247,19 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 		value |= TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + MAC_FSM_CONTROL);
 
+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Use a 4s timeout.
+	 */
+	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
+		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
+		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD,
+				    STMMAC_NTMRMD_4SEC) |
+			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
+	}
+
 	/* 4. Enable Data Parity Protection */
 	value = readl(ioaddr + MTL_DPP_CONTROL);
 	if (safety_feat_cfg->edpp)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 00b151b3b688..734e7630f28d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -8,8 +8,11 @@
 #define MAC_DPP_FSM_INT_STATUS		0x00000140
 #define MAC_AXI_SLV_DPE_ADDR_STATUS	0x00000144
 #define MAC_FSM_CONTROL			0x00000148
+#define MAC_FSM_ACT_TIMER		0x0000014C
 #define PRTYEN				BIT(1)
 #define TMOUTEN				BIT(0)
+#define MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
+#define MAC_FSM_ACT_TIMER_NTMRMD	GENMASK(19, 16)
 
 #define MAC_PPS_CONTROL			0x00000b70
 #define PPS_MAXIDX(x)			((((x) + 1) * 8) - 1)
@@ -82,7 +85,8 @@
 #define GMAC_INT_FPE_EN			BIT(17)
 
 int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			      struct stmmac_safety_feature_cfg *safety_cfg);
+			      struct stmmac_safety_feature_cfg *safety_cfg,
+			      unsigned int csr_clk_mhz);
 int dwmac5_safety_feat_irq_status(struct net_device *ndev,
 		void __iomem *ioaddr, unsigned int asp,
 		struct stmmac_safety_stats *stats);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..1fd501728b18 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -169,8 +169,11 @@
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
+#define XGMAC_MAC_FSM_ACT_TIMER		0x0000015C
 #define XGMAC_PRTYEN			BIT(1)
 #define XGMAC_TMOUTEN			BIT(0)
+#define XGMAC_MAC_FSM_ACT_TIMER_TMR		GENMASK(9, 0)
+#define XGMAC_MAC_FSM_ACT_TIMER_NTMRMD		GENMASK(19, 16)
 #define XGMAC_MDIO_ADDR			0x00000200
 #define XGMAC_MDIO_DATA			0x00000204
 #define XGMAC_MDIO_C22P			0x00000220
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 09194b9d8322..d5bcbd6dfadf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -4,6 +4,7 @@
  * stmmac XGMAC support.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitrev.h>
 #include <linux/crc32.h>
 #include <linux/iopoll.h>
@@ -837,7 +838,8 @@ static void dwxgmac3_handle_dma_err(struct net_device *ndev,
 
 static int
 dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
-			    struct stmmac_safety_feature_cfg *safety_cfg)
+			    struct stmmac_safety_feature_cfg *safety_cfg,
+			    unsigned int csr_clk_mhz)
 {
 	u32 value;
 
@@ -873,6 +875,20 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
 	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
 
+	/* Program the FSM active timer so the timeout checker actually fires.
+	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
+	 * Use a 4s timeout.
+	 */
+	if (csr_clk_mhz) {
+		value = readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+		value &= ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
+			   XGMAC_MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD,
+				    STMMAC_NTMRMD_4SEC) |
+			 FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+	}
+
 	/* 5. Enable Data Path Parity Protection */
 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
 	/* already enabled by default, explicit enable it again */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 047bda5cbd92..6895ae21f918 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -380,7 +380,8 @@ struct stmmac_ops {
 			     bool srgmi_ral);
 	/* Safety Features */
 	int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
-				  struct stmmac_safety_feature_cfg *safety_cfg);
+				  struct stmmac_safety_feature_cfg *safety_cfg,
+				  unsigned int csr_clk_mhz);
 	int (*safety_feat_irq_status)(struct net_device *ndev,
 			void __iomem *ioaddr, unsigned int asp,
 			struct stmmac_safety_stats *stats);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca4c7fb11b73..4ee4952a1427 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3707,10 +3707,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 
 static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 {
+	unsigned int csr_clk_mhz = 0;
+
 	if (priv->dma_cap.asp) {
 		netdev_info(priv->dev, "Enabling Safety Features\n");
+		if (priv->plat->stmmac_clk)
+			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
+				      1000000;
 		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
-					  priv->plat->safety_feat_cfg);
+					  priv->plat->safety_feat_cfg,
+					  csr_clk_mhz);
 	} else {
 		netdev_info(priv->dev, "No Safety Features support found\n");
 	}
-- 
2.34.1

