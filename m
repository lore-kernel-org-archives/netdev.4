Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771619;
	b=hPi/MNV73aHc5fqXqTwWDkLh4voD7VPi2j4SCO7y7+598jnrPCBEEuNhrxXc5wRBk0Im
	 qyta+Lk9TubQf1JOi+0+zmQuE0sdOwdBn10lzmHSQtxvUmXVIrSFgf43nea0dOvZOdOAG
	 QiZm5S7pjzvgqmYx5Rx4PcwKormuRWIfir3TSEhEeJWMOdUMzU454hM0RGVqcRLMF3LGT
	 wLYcPOl38TSLjvLO3sVHG0Ets4aeIjQPZ16NW83fj1SLG8Jo/uWUdH26xVqdKJBbs9B7Z
	 yZDHpEOh8VNBTj/sUGq3Cw1urvOSWxnDzoUYPxS+YlOBlJVhszHMLXNt/UP9xM+ANoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771619;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=fNOe15mKTrnRw+eIOsPnhzi/WOM197cVj7nMAKCPBuc=;
	b=uiHFY+6rpgWI/ANAvt6X0acqSJz9d0JGHs4fv3UU+C1FZEQnWSiLF2dd7UzjDObDU2gT
	 mbwodvu1RQhiI2iZ/IRpOsEEvcP18hIWNwFgizfafLluirduF1WqDmF1mawOEISkC/axn
	 BKHzyL5/3K0QcNxiPU1MvNbFNl6OV7/sOcF5F2vjZ+juPb899zaAi/rnfuoKuJDgoJGJQ
	 otvfkcbXbVp7YJre9GOBWWuaIF8QzGVwAuhq8IGnjCzAsqt+vUUfA0BlBqNVnQHmpdm88
	 b78RY5Rv0Im7a31XagH411+LqQR+n+SZKhdXWpDeqoPoE6JqFDIOIBjMTmH0N7M2vBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=md6vIVeo;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C452A606A32A;
	Fri, 27 Nov 2026 09:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C452A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=md6vIVeo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795771619; x=1827307619;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=uCiZHbFs2hmRN4crXTmgz+1DWdsz5idSj2dIrv7sRuI=;
  b=md6vIVeos9Qv5LM48a22mQHQx1+s/obGV/BamuhajAMnQK0kc15kPbhl
   HSI91Z6ZhSoTPALlqPOLhpCX2sDK8Ew0lg4wDSsBtIsVSYJ1+alMI3/Az
   ImPmkSkvr5bjqgSFTY/X9t0Xk//VVne5vV+IW7n+iJBXgSFfccA3pkJed
   muujEx5bOw0FRpQ68zI3qDP4kBQUr322oo3RpTIjyxX3MzdjcR+h4ddQy
   izHg9bGkJp3eHoJckiFLlde6Xh8El74ObIRgEbz3piUzd50YtXrQnNxQK
   2nUvUyuaW0NRzS8URa7wWq/g8APzBY4YnBImE5KAorRaNfLaZwE6PTa3m
   g==;
X-CSE-ConnectionGUID: lBD0S+2GSwSie0gVyCd8uQ==
X-CSE-MsgGUID: sqYqgTtcRXCvfO43K3HHbA==
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="298532965"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2026 02:26:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Nov 2026 02:26:57 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 27 Nov 2026 02:26:55 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Fri, 27 Nov 2026 10:24:49 +0100
Subject: [PATCH net-next v2 1/5] net: dsa: lan9645x: add the analyzer event
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
Message-ID: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-1-84adcd919dac@microchip.com>
References: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-0-84adcd919dac@microchip.com>
In-Reply-To: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-0-84adcd919dac@microchip.com>
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

