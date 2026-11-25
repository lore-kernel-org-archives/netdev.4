Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605580;
	b=BSsy06bBJcc5sheCt0TUTXfoTexgU44YOlRkGAe8oO2hKi03MFVpvaYfkscfsBu/0UGr
	 DLKkFy2gRJpVZhhOopkY3SCPxei4tu0I+/HH0kgwt2Wf+3EhLL/fBJc7g5WNduhpQUyjn
	 SkZHCoR6ff2eNJ3TF0+dh8jkUF4aKzJ8WWPkB2DWFtTP1LJbn2pz+oFMOkRl9f0EXipJY
	 bWdaxKhGjJj1/l5vHUXe+uUtJEQUQRxQL2VuytskOkScRRSAnrO1tXtN2NkDQlTR7Ldrm
	 rAm6/tvNCBPN0WY+cJ5/n76p81QTyssD1ubBz8+cSK0YgzbVuAEuVlDwSdWRL5VUqfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=54Q8WEaghzr0x5dXE2Tr0PsueUBDI7m/C/zlZIA9lFU=;
	b=O0FakQ89/daO2f/iwTQJiGuZix+9YOJJKmc0/OW5Vgfhg2kLVDqAETvxbunyKV8Q5aXM
	 beOfxof1sHvH9RGVOCFZ8KpAdipuQajd24d/64ZzxycYqtsfqiFABn/d9i6dUxtzNXyn0
	 q0AYR6QxsIARyYymDnU/2uR+bVoPeP/mQvS07wBtvhZzfQPyy7Lf/duQuxiH5/AmfS+Gv
	 2y9yOMVuuMy3gXJwa/OM30NIJMH/9+uGGN4GRQOFxmKtunvxt04EHQbDe9fJoUCC3gVfQ
	 83FEgAQTkJlyoS4KcDGY572kgsGIcjH/7b0lmggtuHeN6joVpQeJcHXBdZkR7SJ8Ztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5oITjnn;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBA606A680
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEBA606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t5oITjnn
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04bea9a93so49232195ad.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605579; x=1796210379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=54Q8WEaghzr0x5dXE2Tr0PsueUBDI7m/C/zlZIA9lFU=;
        b=t5oITjnnX9qtgECrpjY/bpguD6DiwHWoCS7H40UKV+HiK1Rib1R9JZR2c54mnL1cry
         2u2bCTlGztukDP0+zSg+jXnw339Q+PUONlOhbKKWFHqLaS5VT56QRsg0R5VzmcNJXMvX
         xfRxq9bYes+oC7OVmA0I5LusMBFw+S+9LP8FmnhRg66N6Yh4Ymh2aqX2xFqPc9DrzYbI
         OQzyF0h4tS/lTOvB3wqUZtchk3cDHHt+tIruCM+/TbS6SNOXeCBFOjtLfCl4TkFvQs4/
         J2GJ8p6c94fVtLiwIfzvZPSBzsI3kOFE7vjItmIXwVS75U9hG4P9AhESxRztQuRKRc0m
         VtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605579; x=1796210379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54Q8WEaghzr0x5dXE2Tr0PsueUBDI7m/C/zlZIA9lFU=;
        b=J7chNygLfOyM3ixcCQh0SntOrNZnAcLQD5KCb6SEjkMk5T49nwjtx0F/jqxYo1Wi/v
         p2N8bNp1XGYDqjINAshdvWXKG9cfN+dkC+5oV1ry6mccfe2CX4TwQtnBbBX19/kZdKfX
         g5ywZVyzefWP3lOkOXI5BX9QP7zkAJj8HFGcmdRp02OfQCI8FlEYdCRDYSZZ87bZvJGL
         BtG/MsVTrD896WH1grRthNCFamDSSJ5sbg6ud4KeZnaJhfb+uDTpZetV9ur6Udy/k1DM
         4A655aj5eYAMIhbcggbuY4VJzLhVvSeqTWDI0w+R9f1zYbTTLGgV59fCFvWZRjhFxC4b
         +gDA==
X-Gm-Message-State: APuU4Z8ylEuUUZJPifCe692aa8GvcxHF+IXM+aV5QL3QQH1dPgWBMOGf
	2PydFq2wOVfIQlS1bcijtcomLXvJaFzlHsEteS9LMNXBp+oZyIHsiBfD
X-Gm-Gg: AZFdTZcj+h/8v6Dt0LaTV9wVEAamg+ULgfHXpCyya3uMQB4JkcDWhOiafjACGV1i7DI
	lKPk5X4Fovi8KgZHqBv4mjSGUrfC8udXvIftDaagf8G6Dk0dAHrgxDLcPwtmc7n5KsONz9b6QAU
	YBAX6tu/J4lH9sdwIQzHCPBTdWSrV+Vt3CpfVcjhf1n4/HVQ/3ktrPUK26HyHr0UMmIxABkCVPO
	0ld6SgqipoN0pHm84AH+SDaj0L/taJTzdwbzei0+s0Acxbe2eH3/t6Tv72yBxIn2C1jxyim8kOL
	WroWmB02LpiBnEtrJBkhKA172sffOspgx/GS6/ixsfj1xtaNG4GL0Gt+9nss7kTWIKWsuOzOYCU
	Yep1smhF2d5W3seT+DzUIP/E6KrsWczZCBtOgXc7vxX8oXp48DhaPT/JRPjAiyu9qrfU4QhJETO
	LPSDna+OTs/IffMsfUDqKQluboLqjH6gxt2oeX8eAOVQ5iF52AuFxmKI3NCcWxNTZ/tmHtlEAQo
	5Zovnsy9dwudza60fznoxMfmVeNls7aLwDPV/zJyqwRO/pu7DLeV8KvlbigpQeDWayW5YkU15PY
	kfXt9NZUlO9dmGu9soHHVAxP6+kP
X-Received: by 2002:a17:903:2a86:b0:2f0:4168:fb28 with SMTP id d9443c01a7336-2f04168fde0mr207349275ad.27.1795605578936;
        Wed, 25 Nov 2026 03:19:38 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm60973245ad.8.2026.11.25.03.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:19:38 -0800 (PST)
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
Subject: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
Date: Wed, 25 Nov 2026 19:19:29 +0800
Message-Id: <20261125111929.3395740-1-zxyan0222@gmail.com>
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
---
v5:
- Make the dwxgmac3 timer write unconditional, matching the unconditional
  XGMAC_TMOUTEN set, so NULL-config XGMAC platforms program it too.
- Bump the hardcoded timeout from 1s to 4s to cover a 10 Mb/s PAUSE stall
  (up to ~3.36s).

v4: https://lore.kernel.org/netdev/20261118025528.2703790-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20261116114923.1157920-1-zxyan0222@gmail.com/
v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@gmail.com/
v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@gmail.com/

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c   | 17 ++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  3 +++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    | 18 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     |  3 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  |  8 +++++++-
 include/linux/stmmac.h                         | 12 ++++++++++++
 7 files changed, 62 insertions(+), 5 deletions(-)

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
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..659f5db528d3 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
 	u32 tmouten;
 };
 
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
 /* Addresses that may be customized by a platform */
 struct dwmac4_addrs {
 	u32 dma_chan;
-- 
2.34.1

