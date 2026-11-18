Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970536;
	b=bsHD3sDO5cbL/rb5J8rPTupxyPocDaM3czIb63DJ6RrD6uX/4EyVQBcDD+qp82llHxYm
	 IgI8Nceo6UyHTmNhP3C02tA6U54KA+mI3oVXmRzKpkGhVC6Bb/v2TOLHB80StAU5apGyg
	 XCYepztwQgo7L0hHjS3mOyQ0NU8QvvOqCB8JvfndW9E+jqFIBWvpMDODT0S2jJUq0oQ/B
	 OADEHKFULMO/QLsHtSjfiVDn50IiI7TwowI6vBnmSZQTTC+9yBPH1/rHq5uBswk+gCfho
	 amZ7Kzb7gYM9YYd5FlNO8XLvjxOTr/y7o81UFN6rXdkegZ9Rs0BrQPlXGMqvbRqcESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Cc1CenNSOFeQKanbwZUmn2fS8ubg1Oyl3pgDvfLoRhU=;
	b=jikm74KbdPorp4cteqoHmuk6SsLUNClG9xbjzaTfHw68f3tFgc1FMxl+iLV3RpC6dBGV
	 6NRGCXSDNs8MUPXOwNmNhPZTu2ZWpCRK0QjBfl7FB4ImwZ01gOvehH2BWn5an0hSpcYZV
	 RdD9W+yChSa/2/U48rdf1R1oITBb/2rrsddoX8F01a4cYc/tQo+2zgWu4jjWJeqN2DUiU
	 PqME8PElTePGKTZuqTiwXXzjo9SJ/dnua/gCwRaUEMvHxGe/H446QNx7FSoHNJEhUtzXD
	 Ib7TK4/qbQMInpT4fN2bKmx45ErQXl1xNScG4S2ks+w/hcg5/zoaTjEKkjC0bEjoDPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNWJx1vt;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0CD606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA0CD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KNWJx1vt
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so287845a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794970535; x=1795575335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc1CenNSOFeQKanbwZUmn2fS8ubg1Oyl3pgDvfLoRhU=;
        b=KNWJx1vtty5adSQWncXc2jvEYw8BgOiCGQJuKPijpgJDXNdPsWSZ80sT6Cx46FSVJC
         Z06qICAMn8sCtamXfYZ14PskbVqTHDGBlSVpQCIvMURVitJNH+jDGidgGM5r+S7T5gAg
         FWFP3Y2z+enDNnZNY65XrUcBgJnFKLorS13DdoVcNxvOsRdnw1u2W75Ot2GmsaxgYI9j
         nvmlUiGhJjjHp/rGaKljAX+Tu8vRPkLj1XI9Y7DJIX+s7Cdba1s7WL0/0+OPitCI85Vd
         hGdcmoJJW7Dk+4ln9vhx7vQXLP7/R78TI8r0yNLcDcDHK8z/iBOjp5rQn6zxY2/Yadmr
         9Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970535; x=1795575335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc1CenNSOFeQKanbwZUmn2fS8ubg1Oyl3pgDvfLoRhU=;
        b=ksUW0ma8o5PkCjUzDfd51fyQpylpWID5nsNiBx/L+n01nMToQ1t4/+UmrMxouam0+o
         L1tdfFgdgevNI7MFlZiTgoWsP3DzfsuGqLt3MUkbQc2xGoC+asHHYXnDRQlrmavd3VMi
         tijs9GL+kctawhG4JM1R+F29v8QP8hlUMqCHSNeIkagvktYILNcOz5FeIGW6e8JjA15O
         DsBRdHt/lLOZx5x+A3Zf8UcUVYQDyK4IcXSo+Uzx2RQl6mHklRsQU9dlNb0nfJzHpYG9
         GL13bxi98qVY7TiSKPOSPCD9GE1rNmR8GG4qyTyFTYsizCFFzOSncl0hnMdTsZNkKuXk
         kGOw==
X-Gm-Message-State: APuU4Z/iplBfquNfLk4B1OW5Afutz2VU2cWSiNb9MRHVjhPJPOxHmS9e
	BbGyl+tKFrfWdYVkYCoJleIJP7GdS2KuVKRDx1vCTguwCdTdd2z35nNT
X-Gm-Gg: AYBFou0vLznl0KNaNTFSCgk+7u9YLdOLjcm0qC0Wt8dUEFNeW4qhf0/Bu918+oToLXH
	86Q3hIKbSEIvJPvPVCoEKsPCuwVeHvMaJtiI3aWESMT5mrbz7W7dKz3YrDqKob3gh3rH3xbjV6L
	+pixkXZNOaH6+VNtwpmoISR9ZKyD332e2dzQONYcraYfOJ1O+rSc4lzolmEOtYEWjlarHqgFeap
	vLX4pWqo4kwA8pkNRmQssoibSOWqh1BKuhe1tKKSjP6bE/iGBagddmM/fVuzSdQfj4r8D5uHMO3
	9pQi6A4DcfZzaEaLB/og8NPVzcdMSbAMSdnQ2HxbOAxfkBQX4hf5Qgy+BIkTiyKfEsvPtkGpDVI
	x+CZLnfFPT6BaEQuzoT0uN7cNojq6WoLpx3mEYJJyTkeYChXXi8LH2P3glJbvjfNeNwK5MOtrR/
	QX/3hVU8/GSgk+eptdFSwaZzbhJRF3xMxG0IHt6SvWe1Qf5WbmdFxry5DVBsfCaS7BCpqCqsm8f
	dZ8Yao0q4X4iR/uZ37pjMFBQ3qsVaQjXu6VHFj9KYMO9MAQUKPcZ/5yX51RHPlMVBclyjd9sm0S
	E75zk2cZoPJPGNLjamgxnvKfjKb0
X-Received: by 2002:a05:6a21:880a:b0:3fb:6e73:ce48 with SMTP id adf61e73a8af0-3fe980f7b76mr958069637.48.1794970534917;
        Tue, 17 Nov 2026 18:55:34 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3af30db8sm304885a12.1.2026.11.17.18.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:34 -0800 (PST)
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
Subject: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
Date: Wed, 18 Nov 2026 10:55:28 +0800
Message-Id: <20261118025528.2703790-1-zxyan0222@gmail.com>
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
1s timeout.

The NTMRMD field holds a power-of-two microsecond timeout per the
databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).

The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
not reported through the safety interrupt despite TMOUTEN being set.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
v4:
- Drop the warning on a missing CSR clock.
- Drop the ntmrmd field and hardcode the 1s timeout (NTMRMD = 0x6).

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
index f1bb981cab7c..5cf5139f442a 100644
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
+	 * Use a 1s timeout.
+	 */
+	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
+		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
+		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD,
+				    STMMAC_NTMRMD_1SEC) |
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
index 7ad08651675e..3caab23527a1 100644
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
+	 * Use a 1s timeout.
+	 */
+	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {
+		value = readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+		value &= ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
+			   XGMAC_MAC_FSM_ACT_TIMER_TMR);
+		value |= FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD,
+				    STMMAC_NTMRMD_1SEC) |
+			 FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
+		writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
+	}
+
 	/* 5. Enable Data Path Parity Protection */
 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
 	/* already enabled by default, explicit enable it again */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 8ae95e91a36a..395655b01ea8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -378,7 +378,8 @@ struct stmmac_ops {
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
index 4da728962638..5e5c54b58bee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3691,10 +3691,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
 
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

