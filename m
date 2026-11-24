Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510670;
	b=gJ1eAgA49Ob1I2rnhHbqIXueczcwKJC/GVa5rSe3Y55vY3WyBhf2iZW52yTvhmOf761l
	 H79RNJWOCogGr42BsKpezLZVNk0puZyY2ha7n666YJsnsFhTcgzNPkCXtBlsSsl+WSjvU
	 QznvJ815pZtOaQsTmGTCydeeD1pwcGQ5LSUDv1tOutEbGm9Ox3e64ExpbKsUX7fjnEKtq
	 +AGN3AtxT0CJDWbGmju1C060rWm1KDyGMmaw/KLVgPIzDP4ZfiG5Bxq/6QdC97HgcVTc5
	 PKZpn+BdkGF7usHSpFB53XH15ZQ2sHWDa0XiDxm6QI0V48kKm53MQbG3Um6OWX9X1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510670;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=fNOe15mKTrnRw+eIOsPnhzi/WOM197cVj7nMAKCPBuc=;
	b=fVcypjAj50aRsk0QU813wdnShNLgg+lw8pquIKwuDdnssp3y87CvhcjekMPXZcVxL6ww
	 /brUvd/WCWFpMHuW4wN7kCd/keD+Fd7dHEkR5ZyDM59JYs/1opn7JasxzHj4QJDzbk+al
	 c0EFcfviLK26ZyebOAucAmsBWGWDiaScgzqqOXropa5K6l3XlC7ds8BzMtnOd9qfow4A4
	 N0Ja326IFDAZ7v5h7+7bBksmx2GyYgr4SVNrI+zMSUTFCm01rR9eQABQ9qVxEgS0moeIl
	 MeN3eH9UJJyD/wmh3Ss1OpUm3LpnXxgXEGXeH5s+TkPI91W7cbEpaGMXgt7dWtYLiNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=RmB5WJQK;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C44606A682;
	Tue, 24 Nov 2026 08:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C44606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=RmB5WJQK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795510666; x=1827046666;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=uCiZHbFs2hmRN4crXTmgz+1DWdsz5idSj2dIrv7sRuI=;
  b=RmB5WJQKJubfR4bvpkgP4gKthzoSfF3O/M6HMNib5y8OWg9BotGCBPzk
   TVtW5wp3VkHBNMPefqNCSutea9EpXyAQLCmSfABiZ/14bJMPZoXpB0LLe
   3D/8yAeT0HAZP8kJvEJ+OrYvDIC9cGNP6jIQLJZ1RyaF88L84LKl0UYz0
   ilsfHiphNB6VtX0s7W179/zlkWkq+uS96Fp5CLlgN9e33WG4puRmDo5IX
   vEAxa1vsBbjmrN8DqPnYl49Pe15365MUR7I4fGd+ffe1Z4+G5fYkmXwpP
   JWVnjgoj8JqMkIgdCrp6AtUFJvfvzdFnynwQHskpQFH32tU0xCp/4emw6
   Q==;
X-CSE-ConnectionGUID: 7Qec9wR8RoC03yTFrKIyMg==
X-CSE-MsgGUID: L3Xe4r7MSXWDZHCedTb5XA==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="67202056"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 01:57:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Tue, 24 Nov 2026 01:57:45 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 01:57:43 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Tue, 24 Nov 2026 09:57:07 +0100
Subject: [PATCH net-next 1/5] net: dsa: lan9645x: add the analyzer event
 register
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-1-b930a1dae700@microchip.com>
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700@microchip.com>
In-Reply-To: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew@lunn.ch>, "Vladimir
 Oltean" <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

Add ANA_ANEVENTS to the autogenerated register macros. The MAC table
code uses its CPU_LEARN_FAILED sticky bit to detect a CPU learn that
did not find a free bucket in the hashed row.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h | 196 +++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h b/drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h
index 0414c7239103..531dfb789a02 100644
--- a/drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h
+++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h
@@ -83,6 +83,202 @@ enum lan9645x_target {
 #define ANA_ANAGEFIL_VID_VAL_GET(x)\
 	FIELD_GET(ANA_ANAGEFIL_VID_VAL, x)
 
+/*      ANA:ANA:ANEVENTS */
+#define ANA_ANEVENTS              __REG(TARGET_ANA,\
+					0, 1, 27136, 0, 1, 284, 20, 0, 1, 4)
+
+#define ANA_ANEVENTS_CHANGE2SW                   BIT(31)
+#define ANA_ANEVENTS_CHANGE2SW_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_CHANGE2SW, x)
+#define ANA_ANEVENTS_CHANGE2SW_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_CHANGE2SW, x)
+
+#define ANA_ANEVENTS_LLCT_PORT_ERR               BIT(30)
+#define ANA_ANEVENTS_LLCT_PORT_ERR_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_LLCT_PORT_ERR, x)
+#define ANA_ANEVENTS_LLCT_PORT_ERR_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_LLCT_PORT_ERR, x)
+
+#define ANA_ANEVENTS_RT_FWD                      BIT(29)
+#define ANA_ANEVENTS_RT_FWD_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_RT_FWD, x)
+#define ANA_ANEVENTS_RT_FWD_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_RT_FWD, x)
+
+#define ANA_ANEVENTS_FLOOD_DISCARD               BIT(28)
+#define ANA_ANEVENTS_FLOOD_DISCARD_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_FLOOD_DISCARD, x)
+#define ANA_ANEVENTS_FLOOD_DISCARD_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_FLOOD_DISCARD, x)
+
+#define ANA_ANEVENTS_MSTI_DROP                   BIT(27)
+#define ANA_ANEVENTS_MSTI_DROP_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_MSTI_DROP, x)
+#define ANA_ANEVENTS_MSTI_DROP_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_MSTI_DROP, x)
+
+#define ANA_ANEVENTS_ACLKILL                     BIT(26)
+#define ANA_ANEVENTS_ACLKILL_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_ACLKILL, x)
+#define ANA_ANEVENTS_ACLKILL_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_ACLKILL, x)
+
+#define ANA_ANEVENTS_ACLUSED                     BIT(25)
+#define ANA_ANEVENTS_ACLUSED_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_ACLUSED, x)
+#define ANA_ANEVENTS_ACLUSED_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_ACLUSED, x)
+
+#define ANA_ANEVENTS_AUTOAGE                     BIT(24)
+#define ANA_ANEVENTS_AUTOAGE_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_AUTOAGE, x)
+#define ANA_ANEVENTS_AUTOAGE_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_AUTOAGE, x)
+
+#define ANA_ANEVENTS_LEARN_DROP                  BIT(23)
+#define ANA_ANEVENTS_LEARN_DROP_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_LEARN_DROP, x)
+#define ANA_ANEVENTS_LEARN_DROP_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_LEARN_DROP, x)
+
+#define ANA_ANEVENTS_AGED_ENTRY                  BIT(22)
+#define ANA_ANEVENTS_AGED_ENTRY_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_AGED_ENTRY, x)
+#define ANA_ANEVENTS_AGED_ENTRY_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_AGED_ENTRY, x)
+
+#define ANA_ANEVENTS_CPU_LEARN_FAILED            BIT(21)
+#define ANA_ANEVENTS_CPU_LEARN_FAILED_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_CPU_LEARN_FAILED, x)
+#define ANA_ANEVENTS_CPU_LEARN_FAILED_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_CPU_LEARN_FAILED, x)
+
+#define ANA_ANEVENTS_AUTO_LEARN_FAILED           BIT(20)
+#define ANA_ANEVENTS_AUTO_LEARN_FAILED_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_AUTO_LEARN_FAILED, x)
+#define ANA_ANEVENTS_AUTO_LEARN_FAILED_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_AUTO_LEARN_FAILED, x)
+
+#define ANA_ANEVENTS_LEARN_REMOVE                BIT(19)
+#define ANA_ANEVENTS_LEARN_REMOVE_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_LEARN_REMOVE, x)
+#define ANA_ANEVENTS_LEARN_REMOVE_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_LEARN_REMOVE, x)
+
+#define ANA_ANEVENTS_AUTO_LEARNED                BIT(18)
+#define ANA_ANEVENTS_AUTO_LEARNED_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_AUTO_LEARNED, x)
+#define ANA_ANEVENTS_AUTO_LEARNED_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_AUTO_LEARNED, x)
+
+#define ANA_ANEVENTS_AUTO_MOVED                  BIT(17)
+#define ANA_ANEVENTS_AUTO_MOVED_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_AUTO_MOVED, x)
+#define ANA_ANEVENTS_AUTO_MOVED_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_AUTO_MOVED, x)
+
+#define ANA_ANEVENTS_DROPPED                     BIT(16)
+#define ANA_ANEVENTS_DROPPED_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_DROPPED, x)
+#define ANA_ANEVENTS_DROPPED_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_DROPPED, x)
+
+#define ANA_ANEVENTS_CLASSIFIED_DROP             BIT(15)
+#define ANA_ANEVENTS_CLASSIFIED_DROP_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_CLASSIFIED_DROP, x)
+#define ANA_ANEVENTS_CLASSIFIED_DROP_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_CLASSIFIED_DROP, x)
+
+#define ANA_ANEVENTS_CLASSIFIED_COPY             BIT(14)
+#define ANA_ANEVENTS_CLASSIFIED_COPY_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_CLASSIFIED_COPY, x)
+#define ANA_ANEVENTS_CLASSIFIED_COPY_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_CLASSIFIED_COPY, x)
+
+#define ANA_ANEVENTS_VLAN_DISCARD                BIT(13)
+#define ANA_ANEVENTS_VLAN_DISCARD_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_VLAN_DISCARD, x)
+#define ANA_ANEVENTS_VLAN_DISCARD_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_VLAN_DISCARD, x)
+
+#define ANA_ANEVENTS_FWD_DISCARD                 BIT(12)
+#define ANA_ANEVENTS_FWD_DISCARD_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_FWD_DISCARD, x)
+#define ANA_ANEVENTS_FWD_DISCARD_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_FWD_DISCARD, x)
+
+#define ANA_ANEVENTS_MULTICAST_FLOOD             BIT(11)
+#define ANA_ANEVENTS_MULTICAST_FLOOD_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_MULTICAST_FLOOD, x)
+#define ANA_ANEVENTS_MULTICAST_FLOOD_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_MULTICAST_FLOOD, x)
+
+#define ANA_ANEVENTS_UNICAST_FLOOD               BIT(10)
+#define ANA_ANEVENTS_UNICAST_FLOOD_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_UNICAST_FLOOD, x)
+#define ANA_ANEVENTS_UNICAST_FLOOD_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_UNICAST_FLOOD, x)
+
+#define ANA_ANEVENTS_DEST_KNOWN                  BIT(9)
+#define ANA_ANEVENTS_DEST_KNOWN_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_DEST_KNOWN, x)
+#define ANA_ANEVENTS_DEST_KNOWN_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_DEST_KNOWN, x)
+
+#define ANA_ANEVENTS_BUCKET3_MATCH               BIT(8)
+#define ANA_ANEVENTS_BUCKET3_MATCH_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_BUCKET3_MATCH, x)
+#define ANA_ANEVENTS_BUCKET3_MATCH_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_BUCKET3_MATCH, x)
+
+#define ANA_ANEVENTS_BUCKET2_MATCH               BIT(7)
+#define ANA_ANEVENTS_BUCKET2_MATCH_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_BUCKET2_MATCH, x)
+#define ANA_ANEVENTS_BUCKET2_MATCH_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_BUCKET2_MATCH, x)
+
+#define ANA_ANEVENTS_BUCKET1_MATCH               BIT(6)
+#define ANA_ANEVENTS_BUCKET1_MATCH_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_BUCKET1_MATCH, x)
+#define ANA_ANEVENTS_BUCKET1_MATCH_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_BUCKET1_MATCH, x)
+
+#define ANA_ANEVENTS_BUCKET0_MATCH               BIT(5)
+#define ANA_ANEVENTS_BUCKET0_MATCH_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_BUCKET0_MATCH, x)
+#define ANA_ANEVENTS_BUCKET0_MATCH_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_BUCKET0_MATCH, x)
+
+#define ANA_ANEVENTS_CPU_OPERATION               BIT(4)
+#define ANA_ANEVENTS_CPU_OPERATION_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_CPU_OPERATION, x)
+#define ANA_ANEVENTS_CPU_OPERATION_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_CPU_OPERATION, x)
+
+#define ANA_ANEVENTS_DMAC_LOOKUP                 BIT(3)
+#define ANA_ANEVENTS_DMAC_LOOKUP_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_DMAC_LOOKUP, x)
+#define ANA_ANEVENTS_DMAC_LOOKUP_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_DMAC_LOOKUP, x)
+
+#define ANA_ANEVENTS_SMAC_LOOKUP                 BIT(2)
+#define ANA_ANEVENTS_SMAC_LOOKUP_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_SMAC_LOOKUP, x)
+#define ANA_ANEVENTS_SMAC_LOOKUP_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_SMAC_LOOKUP, x)
+
+#define ANA_ANEVENTS_SEQ_GEN_ERR_0               BIT(1)
+#define ANA_ANEVENTS_SEQ_GEN_ERR_0_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_SEQ_GEN_ERR_0, x)
+#define ANA_ANEVENTS_SEQ_GEN_ERR_0_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_SEQ_GEN_ERR_0, x)
+
+#define ANA_ANEVENTS_SEQ_GEN_ERR_1               BIT(0)
+#define ANA_ANEVENTS_SEQ_GEN_ERR_1_SET(x)\
+	FIELD_PREP(ANA_ANEVENTS_SEQ_GEN_ERR_1, x)
+#define ANA_ANEVENTS_SEQ_GEN_ERR_1_GET(x)\
+	FIELD_GET(ANA_ANEVENTS_SEQ_GEN_ERR_1, x)
+
 /*      ANA:ANA:AUTOAGE */
 #define ANA_AUTOAGE               __REG(TARGET_ANA,\
 					0, 1, 27136, 0, 1, 284, 44, 0, 1, 4)

-- 
2.52.0

