Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014014;
	b=stlW5csZTucYrki/GrupIlgRFJ8Zhzd72BJMUabYPmOMwMzvmewtQGBemSQM0xTYadSG
	 o8QokMfkTdXhqTJAExSxP5RjanXooMhUP4t36G5fiFx7EAeOAj247gPAEhG+7wZ+IEOke
	 shT6pjrmVy8mIRYv/vtDggLPWf9p+4OUeaYRV52xmADNLJdh/iO7l8hRnrB14qP+55MgY
	 exnLxvjLlJCwiFDmzO9Tle+69R5WZ+olZEmwilMeQHarxZY4k4dl4/2w0zJQmRP6GFx8b
	 BAOpvNbI4H0uRE3SoX1l2wT34on7LjQnV5WHI9raLOc5Vlq1JTHtVRijmAwC/e6fRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014014;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=XlAV/hqrW5p9nPGYpRn1iBgoiJOYeDSYBvQqMDaDr0o=;
	b=4aA7gvQ7BF7dO8/8aqdNssSnaCto59UqR91MsLZnbruhosusqbkRSgnK6EUvq82uFoOr
	 vpzbbGEASydWWil6QQFu6jny19fctTCvTF51W9vWzNUKsMSso556Nqsuu/OQkoIRzXur2
	 dbsceCL7Xrrcl9GrTgeaK7ij38jkApT48A3onqIUS93FvUHPQbDvv7S7wmiElngCuefu9
	 TuCIPe8pJNnPUGFqNpraRhrEp+3NwKL/Hjr+u+FzHYn9ybrLCpu+3n/5OrOFe0mizk0t7
	 r+pN0VJeLo+0LSEpQAD0cxMaFpQYukrgk2ApQGdmQeL2S1PeQYPMIs5Iyae9ZapF4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e46tK6tm;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B8606A339
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276B8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e46tK6tm
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so698001a91.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014013; x=1795618813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XlAV/hqrW5p9nPGYpRn1iBgoiJOYeDSYBvQqMDaDr0o=;
        b=OKGX96jQ5uqbeDigMR8zONKerKcKCcv2E1uQShOSKRHYjIOu3z/VFUVlMWBtHKvwt/
         78sMAccx9gnCemaDd4ZD+HJVsonzy35uWR1l1FNx4X2fu2f/ZgQt8GINx2LFpE/69lkx
         ORjAASf66+mHsGG5RlgNtebJRwg5/A6IsP5eASCEWdDhzLU0gWYSsCaE9/ZBG9l+4ien
         QuseAYpfvdqV/Gf/ZNy8Uyb4jxybWBFqxjO5ZUj0ieLAwDHOkupB1E0luJ3YS0TUs7aV
         pcmDLkMcKQ+su3vw1ePuLyYoHwd/U1NuXplOYRuIAiY8Nq65U9tPczIk0aaI9eKpOeAZ
         w9YA==
X-Forwarded-Encrypted: i=1; AL+hErF0vn6c641PtBzViMtH6MckDdJ8Lx6t+PK71ilZ7ME+FmFdVnYxRitkdwSFNz144LZPno0ZdEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h3Ac00zMsZDWZjfb+L/SPMgl3MUYT2Sd978kjMeDmZ1RgS5uN
	NxHn4VTL+RmsghthLLLNn8acOrY1BnkEDhFTuWGO6MxulFvYxPLm55MbDl22ysIOyN6iQNpsoTb
	DjswSQJMLEkJjT1TK5pWV0ijReFXwK2PvF/xlirVXSYb1/GtSQ746WEgH9psZAlU6iwMCEugt20
	rGlsYiZtGC798KMc4/v4qOHDKR7DxpqezPPnS2ZMx6bfchQnE5o2QJ2J3Z1DgADtdFvVoX6mT5z
	FyF68NGNFQ=
X-Gm-Gg: AZFdTZcMnadS60wvqH3a7Tfz5S61pZeQDL/3sF8uulJC3AQQ3SDQdytA472EUxLZ31l
	UU5BUPKJ1zmoOyjyKafF/5+bCH2Os3IWDoZEDtOk5s4d8FixSBtNETA452tRkldg7uSyCjZfrKQ
	AI5SK9IAlchcW1ORs2Z0MRD81qQqIZsumicZGDO+8DXezRHjnybjsyd240MwX/XJnK2J37vdyNE
	iAUZsc4GFhy0FlCCEaNULupXdjwE4KuXJ15HzKbMurcES9gNRW6UTn8wwo4SbIqDt+5dd70EB0P
	IWWA+gd5iABU/0NfSxrlVFGRiSnt/xKX+x6J9LhavOjT7mEedScPTIwbB64jkw/fbkm3dTimrCW
	AltMpEucr2F4POBMIvLwF3sGxYLckaL2vAxTz8fDT+omK1qVq+IdmwwYKzPgdxh9W/CUuR+ivja
	NnZd0LCHu+QVAwISEYWdvxcW6OZFQq12S2VfmfKg==
X-Received: by 2002:a17:90b:5848:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b3d07d81demr2649531a91.47.1795014012930;
        Wed, 18 Nov 2026 07:00:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac02cce6sm4125117a91.7.2026.11.18.07.00.12
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:00:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1992808c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795014011; x=1795618811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlAV/hqrW5p9nPGYpRn1iBgoiJOYeDSYBvQqMDaDr0o=;
        b=e46tK6tm3prl7lw3gg5xHZkIPHhaGAeM1LzlBIk02RJfwNI3tFmsPPopZNamp0+ApZ
         fES5sjHee6YIwU8WroB8Dp9brZQ3hZxrayavZmi125O/8gpDEGsWMHzYrcXWEbZJiyWp
         46dMPRegKzq184vySW3oLgVETVL0gddWbsczo=
X-Forwarded-Encrypted: i=1; AL+hErFq1ovnLciww4EeVzQ1pA/IX/esGR4/jxs+j+NDmfAjKkZ1Scj8UwRegyw6kZgrhwMeQE1reRw=@vger.kernel.org
X-Received: by 2002:a05:7022:2219:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1b543c2571dmr3544196c88.28.1795014010678;
        Wed, 18 Nov 2026 07:00:10 -0800 (PST)
X-Received: by 2002:a05:7022:2219:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1b543c2571dmr3544132c88.28.1795014009697;
        Wed, 18 Nov 2026 07:00:09 -0800 (PST)
Received: from pc-hpe-top-git-sendmail-server.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f589esm8211742c88.1.2026.11.18.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:00:09 -0800 (PST)
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: michael.chan@broadcom.com,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: [PATCH net-next] tg3: Add support for boards integrated with security SoCs
Date: Wed, 18 Nov 2026 20:32:47 +0530
Message-ID: <20261118150247.1145764-1-pavan.chebbi@broadcom.com>
X-Mailer: git-send-email 2.52.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add support for Broadcom NetXtreme NX1 network interface controllers
integrated with security SoCs. This enables proper driver recognition
and initialization for these hardware Root of Trust enabled network
adapters.

The boards are identified by their PCI subsystem IDs. Add the new
subsystem device IDs and a helper that matches them.

These boards need the following deviations from the default behavior:

- Never drive GPIO1. These boards use GPIO1 for mailbox communication
  between SoC and the NIC, internal to the board, so it must not
  be driven externally and is always kept cleared. Skip it when
  switching to Vaux or Vmain power, and do not set it in
  tp->grc_local_ctrl.

- Do not enable EEPROM write protection, even if the NIC config in
  SRAM requests it.

- Do not enable Wake-on-LAN. These boards reuse the GPIO that
  Wake-on-LAN depends on for other purposes, so Wake-on-LAN cannot
  work on these devices. Clear WOL_CAP so that it is not advertised.

Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 52 ++++++++++++++++++++++++++++-
 drivers/net/ethernet/broadcom/tg3.h | 13 ++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..9c431f76d4a5 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2840,6 +2840,9 @@ static void tg3_pwrsrc_die_with_vmain(struct tg3 *tp)
 	    tg3_asic_rev(tp) == ASIC_REV_5701)
 		return;
 
+	if (tg3_flag(tp, CITADEL))
+		return;
+
 	grc_local_ctrl = tp->grc_local_ctrl | GRC_LCLCTRL_GPIO_OE1;
 
 	tw32_wait_f(GRC_LOCAL_CTRL,
@@ -2913,6 +2916,9 @@ static void tg3_pwrsrc_switch_to_vaux(struct tg3 *tp)
 			grc_local_ctrl &= ~(GRC_LCLCTRL_GPIO_OE2 |
 					    GRC_LCLCTRL_GPIO_OUTPUT2);
 		}
+		if (tg3_flag(tp, CITADEL))
+			grc_local_ctrl &= ~(GRC_LCLCTRL_GPIO_OE1 |
+					    GRC_LCLCTRL_GPIO_OUTPUT1);
 		tw32_wait_f(GRC_LOCAL_CTRL,
 			    tp->grc_local_ctrl | grc_local_ctrl,
 			    TG3_GRC_LCLCTL_PWRSW_DELAY);
@@ -10537,7 +10543,10 @@ static int tg3_reset_hw(struct tg3 *tp, bool reset_phy)
 		tp->grc_local_ctrl |= tr32(GRC_LOCAL_CTRL) & gpio_mask;
 
 		/* GPIO1 must be driven high for eeprom write protect */
-		if (tg3_flag(tp, EEPROM_WRITE_PROT))
+		if (tg3_flag(tp, CITADEL))
+			tp->grc_local_ctrl &= ~(GRC_LCLCTRL_GPIO_OE1 |
+						GRC_LCLCTRL_GPIO_OUTPUT1);
+		else if (tg3_flag(tp, EEPROM_WRITE_PROT))
 			tp->grc_local_ctrl |= (GRC_LCLCTRL_GPIO_OE1 |
 					       GRC_LCLCTRL_GPIO_OUTPUT1);
 	}
@@ -15220,6 +15229,38 @@ static struct subsys_tbl_ent *tg3_lookup_by_subsys(struct tg3 *tp)
 	return NULL;
 }
 
+static bool tg3_is_citadel(struct tg3 *tp)
+{
+	if (tp->pdev->subsystem_vendor == TG3PCI_SUBVENDOR_ID_BROADCOM) {
+		switch (tp->pdev->subsystem_device) {
+		case TG3PCI_SUBDEVICE_ID_CITADEL_BEVERLYWOOD:
+		case TG3PCI_SUBDEVICE_ID_CITADEL_BEL_AIR:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_2908:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_2909:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_2906:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_E14A:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_E34A:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_2904:
+		case TG3PCI_SUBDEVICE_ID_CHANNEL_2905:
+			return true;
+		default:
+			return false;
+		}
+	}
+
+	if (tp->pdev->subsystem_vendor == TG3PCI_SUBVENDOR_ID_DELL) {
+		switch (tp->pdev->subsystem_device) {
+		case TG3PCI_SUBDEVICE_ID_DELL_5720_L21T00:
+		case TG3PCI_SUBDEVICE_ID_DELL_5720_XE9880L:
+			return true;
+		default:
+			return false;
+		}
+	}
+
+	return false;
+}
+
 static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
 {
 	u32 val;
@@ -15231,6 +15272,9 @@ static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
 	tg3_flag_set(tp, EEPROM_WRITE_PROT);
 	tg3_flag_set(tp, WOL_CAP);
 
+	if (tg3_is_citadel(tp))
+		tg3_flag_set(tp, CITADEL);
+
 	if (tg3_asic_rev(tp) == ASIC_REV_5906) {
 		if (!(tr32(PCIE_TRANSACTION_CFG) & PCIE_TRANS_CFG_LOM)) {
 			tg3_flag_clear(tp, EEPROM_WRITE_PROT);
@@ -15430,6 +15474,12 @@ static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
 			tp->phy_flags |= TG3_PHYFLG_DISABLE_1G_HD_ADV;
 	}
 done:
+	if (tg3_flag(tp, CITADEL)) {
+		tg3_flag_clear(tp, EEPROM_WRITE_PROT);
+		tg3_flag_clear(tp, WOL_CAP);
+		tg3_flag_clear(tp, WOL_ENABLE);
+	}
+
 	if (tg3_flag(tp, WOL_CAP))
 		device_set_wakeup_enable(&tp->pdev->dev,
 					 tg3_flag(tp, WOL_ENABLE));
diff --git a/drivers/net/ethernet/broadcom/tg3.h b/drivers/net/ethernet/broadcom/tg3.h
index a9e7f88fa26d..713fe9c821e2 100644
--- a/drivers/net/ethernet/broadcom/tg3.h
+++ b/drivers/net/ethernet/broadcom/tg3.h
@@ -100,6 +100,8 @@
 #define TG3PCI_SUBDEVICE_ID_DELL_MERLOT		0x0109
 #define TG3PCI_SUBDEVICE_ID_DELL_SLIM_MERLOT	0x010a
 #define TG3PCI_SUBDEVICE_ID_DELL_5762		0x07f0
+#define TG3PCI_SUBDEVICE_ID_DELL_5720_L21T00	0x0e19
+#define TG3PCI_SUBDEVICE_ID_DELL_5720_XE9880L	0x0ea1
 #define TG3PCI_SUBVENDOR_ID_COMPAQ		PCI_VENDOR_ID_COMPAQ
 #define TG3PCI_SUBDEVICE_ID_COMPAQ_BANSHEE	0x007c
 #define TG3PCI_SUBDEVICE_ID_COMPAQ_BANSHEE_2	0x009a
@@ -111,6 +113,16 @@
 #define TG3PCI_SUBDEVICE_ID_ACER_57780_A	0x0601
 #define TG3PCI_SUBDEVICE_ID_ACER_57780_B	0x0612
 #define TG3PCI_SUBDEVICE_ID_LENOVO_5787M	0x3056
+/* NetXtreme NX1 boards integrated with Citadel security SoCs */
+#define TG3PCI_SUBDEVICE_ID_CITADEL_BEVERLYWOOD	0xd346
+#define TG3PCI_SUBDEVICE_ID_CITADEL_BEL_AIR	0xd146
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_2908	0x2908
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_2909	0x2909
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_2906	0x2906
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_E14A	0xe14a
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_E34A	0xe34a
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_2904	0x2904
+#define TG3PCI_SUBDEVICE_ID_CHANNEL_2905	0x2905
 
 /* 0x30 --> 0x64 unused */
 #define TG3PCI_MSI_DATA			0x00000064
@@ -3122,6 +3134,7 @@ enum TG3_FLAGS {
 	TG3_FLAG_ROBOSWITCH,
 	TG3_FLAG_ONE_DMA_AT_ONCE,
 	TG3_FLAG_RGMII_MODE,
+	TG3_FLAG_CITADEL,
 
 	/* Add new flags before this comment and TG3_FLAG_NUMBER_OF_FLAGS */
 	TG3_FLAG_NUMBER_OF_FLAGS,	/* Last entry in enum TG3_FLAGS */
-- 
2.52.0

