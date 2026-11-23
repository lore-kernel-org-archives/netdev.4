Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406074;
	b=qxAol42CMwINo0BCQsagdzMmanGy9kCAaa02p8ruAm2nyPR1fHrKHd58A7Qq4Dwew8Do
	 1YLcGu+tjTUKx1OLBPzPJK89sNHCN4LlQwgTCbsFvuXyQeKrew3maFTYpyg2xuMfquvGc
	 dWvI9dpyPUISSTgmX4ce4XizSSj0Mlf3n6XOmEjQOMbIVvC1Xj8QPT9HIVB/ymQXgBcBB
	 /cNSM9FjfYoU6UU87TU+0eLmjIdTqOyQWurWpfE/Ovc1QRvhh3FjyFv/SQC0hCZ4Tp10p
	 L9Gstc7oFmRG1omNdZg/XYMyCmPgQcijdWEPvOGcQO9fUlorQJXCLRlhPT+SqxCL0Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406074;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=26k3z18tg1ygvhI1VjK6YpvSE+G8SMGlXe8jtBkjhz0=;
	b=vdLBrzAomoi9Azw7Nu/O2MDGzxb2qpoEow98aGkMhkNoTLxXPhFJbaCisy7VtlNW/hJi
	 5OAXdtpnxGIObbPA6rk8nzEu3Cchg5vW1cbWxQzUuO2Xb5Jq2OJf0Su7ZdXUvcXQuHgUH
	 94W8kcaHX9aCVy+Bm/7BrQqIw6B1uDxSkAzM5Wqc381wiDL/5ArR2xRzs9pbSkL2izhvf
	 wYByD2rv564wt1nfvQEwGeIVqdOp/6aK9ZvVLQHc5EooV+rMU9buQvEZsGs4VGLdhwBl5
	 Nx/jqOKFtu7A4KB0Fynmg2CrbFwYfvEOcbG0SPrAIhAuJAJeYKRHT+ohEgm3x4LNRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UhYIX+xe;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9585606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9585606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UhYIX+xe
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1437615a12.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406073; x=1796010873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=26k3z18tg1ygvhI1VjK6YpvSE+G8SMGlXe8jtBkjhz0=;
        b=NDsiNdlHkneOefNnKHTnSaeuf3CTji2q6l4B+cBGH96gGj+xbClO7eABUFmDxIIZVW
         NUS5ou9hIgYtzwixWcM9XZpMS2C667y2gILOAAtsyT7yLIfLC5kw55j3iy4r3oChXgI8
         DviFCBp43h9Z3l0B6ajygpbm7Yd8GK7sIiG914bEtmr2JdgFm7i4u8NQwCH4wOVtQ+Py
         5FRnbIPXecpV8pV0bIiop3B+F2i7EFYpVoF1fY6t9LagR2OAqSbmlcaTKcKjvQzN4bp6
         tS+DbILafyxPP+7WOMyKOxKK6Y4ADSPn2+pcRlKonB6cd+3ff8txt3Wz91NgUpb5qpzK
         XTRw==
X-Forwarded-Encrypted: i=1; AL+hErFf8AgeEAtIYLpvOsxkygjbDFSGeqRUsGHcUTXwJFfodGgDU3n8FEsBv6o6qUpaSTEejaKuGT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IJEhZ1H1l4rPupyUYtiXMXKO2jq2z7sax7swrYs0nP91hz31J
	QkZ4lo4DLeTEAdDaOyevH8dU+5StXTE6U/VgNsxfM9PZJoy3gJvOu6HaMwgbLflsp9scTzKboKV
	ExXqfKc4UtWBofWHWlEZT/stMH6bpMgvnZ73mjgOu6vCJ2KrNjuMBEbeo++v1FRFm6GIyw4Q8O5
	RZfcDqgVYpO7ASf0NmWql3PRWROlBcqlGRMe8WN62jm0Vrf1BbK2sxDCOa4gnEaMm834yXU1adF
	ncsJeq+OBY=
X-Gm-Gg: AZFdTZdRot+d2B9Tmkxs87I4lJzk/n3O2j/zYTzz140E0VVMXaYDaq5cleiJuBcEC4E
	B79Bv5amqGaNFqMBOuhfrGXi5dTJ8lthzt+jgHosDLuIBwMbAtPbhtIW86xN+2dMn/uAlvMk/vf
	e8bq/jNFzWE59LmM5ErOdKJs7Q5512xNqyr+LKBWy2T6F0hWwpBAOk1BzrYxWXqvIW4TpJ2zdj9
	Rd5D2K7CZbTc3Cgcnl04rZ3tYRwGo6/xcPeRNBfKOR/ANkgnOCKCh4fVlqHsR8gngmEKV+JZGbY
	w6Lb3OV55YKUnUJns21lFDrlBwtdBIHfBgXStGkJsDQ5fVlt+Z2l12LzxXF/VSxPo0W4Vj7ugJs
	j43NljgZ2efyEqPHFIkyK066f8BV9vA1C+sfSTjs6LJ30nt1fieD5BZuIPnmi7wFvbpA5pA64RF
	3DezamQ+/gsnlXRe6OUsDuRXRiET2qBzln5Yc=
X-Received: by 2002:a17:90b:2f8f:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b41c938926mr6243580a91.25.1795406072963;
        Sun, 22 Nov 2026 19:54:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23cb9dsm3450296a91.1.2026.11.22.19.54.32
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 19:54:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so3296180eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795406071; x=1796010871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=26k3z18tg1ygvhI1VjK6YpvSE+G8SMGlXe8jtBkjhz0=;
        b=UhYIX+xe0SH0Rha59WjQL2RiR8y+RT87JH7TQShkHUEQRf+5wqjxRq+uo4XpnskCbK
         GjdvRNUuYFflOBn7xwUmcoAhmi98L4IZ+aNQlj+5KxSTxvRK18x9WeuA6OXRqnf14tKp
         T2MJ3a+1OtG5iq3mcCvrg4NACuwASW1qCYTxI=
X-Forwarded-Encrypted: i=1; AL+hErHhqWteOZrDh4M77nt/9pjC2jRdLNcsyangLC2x5u26mHXraeE5p/V2xb2N6By/uE+nUQEIdgU=@vger.kernel.org
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr10124367eec.0.1795406071279;
        Sun, 22 Nov 2026 19:54:31 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:10b0:385:ab26:f3ad with SMTP id 5a478bee46e88-385ab26f492mr10124349eec.0.1795406070582;
        Sun, 22 Nov 2026 19:54:30 -0800 (PST)
Received: from pc-hpe-top-git-sendmail-server.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm3513127eec.27.2026.11.22.19.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:54:30 -0800 (PST)
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
Subject: [PATCH net-next v2] tg3: Add support for boards integrated with security SoCs
Date: Mon, 23 Nov 2026 09:27:21 +0530
Message-ID: <20261123035721.1207175-1-pavan.chebbi@broadcom.com>
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
v2:
 - Move the "GPIO1 must be driven high" comment to the EEPROM_WRITE_PROT
   branch in tg3_reset_hw().
 - Clear WOL_CAP where CITADEL is set so that the wakeup source is never
   registered on these boards.
---
 drivers/net/ethernet/broadcom/tg3.c | 51 ++++++++++++++++++++++++++++-
 drivers/net/ethernet/broadcom/tg3.h | 13 ++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..9b96959d51bb 100644
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
@@ -10536,8 +10542,11 @@ static int tg3_reset_hw(struct tg3 *tp, bool reset_phy)
 		tp->grc_local_ctrl &= ~gpio_mask;
 		tp->grc_local_ctrl |= tr32(GRC_LOCAL_CTRL) & gpio_mask;
 
+		if (tg3_flag(tp, CITADEL))
+			tp->grc_local_ctrl &= ~(GRC_LCLCTRL_GPIO_OE1 |
+						GRC_LCLCTRL_GPIO_OUTPUT1);
 		/* GPIO1 must be driven high for eeprom write protect */
-		if (tg3_flag(tp, EEPROM_WRITE_PROT))
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
@@ -15231,6 +15272,11 @@ static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
 	tg3_flag_set(tp, EEPROM_WRITE_PROT);
 	tg3_flag_set(tp, WOL_CAP);
 
+	if (tg3_is_citadel(tp)) {
+		tg3_flag_set(tp, CITADEL);
+		tg3_flag_clear(tp, WOL_CAP);
+	}
+
 	if (tg3_asic_rev(tp) == ASIC_REV_5906) {
 		if (!(tr32(PCIE_TRANSACTION_CFG) & PCIE_TRANS_CFG_LOM)) {
 			tg3_flag_clear(tp, EEPROM_WRITE_PROT);
@@ -15430,6 +15476,9 @@ static void tg3_get_eeprom_hw_cfg(struct tg3 *tp)
 			tp->phy_flags |= TG3_PHYFLG_DISABLE_1G_HD_ADV;
 	}
 done:
+	if (tg3_flag(tp, CITADEL))
+		tg3_flag_clear(tp, EEPROM_WRITE_PROT);
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

