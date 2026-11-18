Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019065;
	b=PYlkYVc/07Hc9zy4tXcHnL2hxsCnnIrCtOeujBm5eIDF/BUVxAEZ72NROfgsWbLDvqbS
	 3RZlKLs5qSM3SUCiPyadrNOVnWoIuekofLtnpfoouVD4FrA0dXb3NrDXpc6mZ453IJ65m
	 cYo/EDbTFa1Wb/oHt85zoa/CeMZNZybHSO+D5PGgVxpc4OMZ6dxP9mFiysDuAG2J8/OLy
	 WrW6kaIwsjj5V4dQmhPTsOrIdc7g2E4gtALnKaph55cHBr8pgBe+3Ke9sNtPsRp5bszwV
	 7+rjmey7jqzYmoJZxovZAJn0Pit0FX+5U+tXZBdrrESTm6K9IJsDk3NnxhqsO23CS3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019065;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=qxGoztvwPd53oxXWJ4zhA1LfAUTegswU0wgNrnxAQtQ=;
	b=Bo4onuF2T344QR+zxejtYEJ7wSarPpa2ZhcNoc7uVkNsFv3CjqfVuzK2lHW1cmD/+Sz/
	 yHBHpPVAr4lOPbu8y0P5LenWT/41Z/o+rBiA/hujdhXU70kAytKpk9hVd9LISeI/GBFLC
	 6vMp7Y/ga6iSs0gTCK2pbuqsd9pzgZKWtHRX1AcOqnkv+lNll6ELn+x1SBZpDtkkQM7lz
	 wk06ErJqLnMwDP63VSWhCIeG45voGEXd3bwPxS1Pim7pHMA2ZN1mI5xKHc67VhtcL1DPW
	 ASr8COSceJ3JNgXq76VO4CiXLEP0lIFtxqh+K7vAxm6GQYIRwYiaIWHzLviBsNfs27A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=WshAhmpH;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=PTy5XpFy;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004860A2608
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E004860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=WshAhmpH;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=PTy5XpFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1795019963; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=qxGoztvwPd53oxXWJ4zhA1LfAUTegswU0wgNrnxAQtQ=; b=WshAhmpHseE81l3HLDjbF6GBbP
	XHiSG6qWF9XLt8ZGf5iAaDjoueDsWG61/sa7d+U3GasfDsDmQN+/zEo6gfWHKY0EDGr4m92UUJDqZ
	ZdPfbeeC1cocOq8Vkdd3P0oyPy22J6t5g5W8teSnmlTJge2V5X/7S1z9wJL9qtrTnCMSYp0HHd5Dj
	0uZXCcnlowyRJEVy+83EiCqAvwma6my/Uhbs2Tkse+siwug8Rzcv/29czM9N4LJ//5lNJV/dCF5JK
	r/PwxILdGP9KUZxDu3T5AFVysmdoDdIsLJZkqfAfAMLsJhYHdCyV3fWw1/cQEJNNgyrqhd/S74Cmt
	+j/kmiNQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1795019063; h=from : 
 subject : to : message-id : date; 
 bh=qxGoztvwPd53oxXWJ4zhA1LfAUTegswU0wgNrnxAQtQ=; 
 b=PTy5XpFyFzRJ8462Cmf4DEZR/vTBkEDzAA7OzWTmm0rgEt7b/Fqbs0AI2GF8dCIgYJYBoH
 pjHy+Hnz/UW8PWUnx4YV/vnizb26xlJdQRe/QU8fgyH/1K5T+Ms/BkXI4wMOYdZfKFgfRnqz
 8cnVPMIc8xQzntuCEpjwc/17yFxAojjlokk5Odu/cV5/TpYZROJ8XsduQxsTZZ67h+Vnzzwa
 8dSLoplBl4t8852XoDn8tc72cF/duwBEbF1+1fVO3JNK5M0suziIfWWN2DdgNApWRu0K5/P9
 YXApGmQT0Ry5LR+K6KLib3LRP4lml7uBZ2oUP0kcJviJbNV4i6l0X2JA==
Received: from [10.143.42.182] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTiRw-ED4xvI-2P; Wed, 18 Nov 2026 16:23:56 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTiRv-FnQW0hPuZuh-iDkW; Wed, 18 Nov 2026 16:23:55 +0000
From: github@bumblecito.com
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 2/2] net: sfp: sort OEM and Turris SFP quirks
Date: Wed, 18 Nov 2026 16:23:23 +0000
Message-Id: <20261118162323.436219-3-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118162323.436219-1-github@bumblecito.com>
References: <20261118162323.436219-1-github@bumblecito.com>
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
X-Smtpcorp-Track: LHSJIE2n4kvC.yxmqRjD3q7OU.Dwk8FAY-8wL
Feedback-ID: 1130875m:1130875aWStQz3:1130875s0erM8GP3B
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

Keep OEM entries together in the vendor table's alphabetical order
and sort the OEM and Turris entries by part number.

This is a table-ordering cleanup only; preserve all existing quirk
matches and fixup functions.

Signed-off-by: Israel Cueto <github@bumblecito.com>
---
 drivers/net/phy/sfp.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 960ac89cc..33349c355 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -617,33 +617,24 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
 	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
 
-	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
-
-	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
-	// Rollball protocol to talk to the PHY.
-	SFP_QUIRK_F("Walsun", "HXSX-ATRC-1", sfp_fixup_fs_10gt),
-	SFP_QUIRK_F("Walsun", "HXSX-ATRI-1", sfp_fixup_fs_10gt),
-
-	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
-
 	// HORACO HC-10GE-113C uses Rollball protocol to talk to the PHY.
 	SFP_QUIRK_F("OEM", "HC-10GE-113C", sfp_fixup_rollball),
+	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
+	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),
 
-	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
-	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
+	// OEM SFP+ONU-XGSPON is a XGS-PON ONT stick with broken TX_FAULT and
+	// LOS indicators and slow startup, just like potron.
+	SFP_QUIRK_F("OEM", "SFP+ONU-XGSPON", sfp_fixup_potron),
 
 	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
-	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-LH03-B", sfp_quirk_2500basex),
 	SFP_QUIRK_S("OEM", "SFP-2.5G-LH20-A", sfp_quirk_2500basex),
-	SFP_QUIRK_F("OEM", "RTSFP-10", sfp_fixup_rollball_cc),
-	SFP_QUIRK_F("OEM", "RTSFP-10G", sfp_fixup_rollball_cc),
+	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
 
-	// OEM SFP+ONU-XGSPON is a XGS-PON ONT stick with broken TX_FAULT and
-	// LOS indicators and slow startup, just like potron.
-	SFP_QUIRK_F("OEM", "SFP+ONU-XGSPON", sfp_fixup_potron),
+	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
+	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
 
 	// OEM XGSPONST2001 is an XGS-PON ONT stick with broken TX_FAULT and
 	// LOS indicators and slow startup, just like potron. On cold
@@ -652,11 +643,20 @@ static const struct sfp_quirk sfp_quirks[] = {
 	// match the part as a prefix.
 	SFP_QUIRK_F_PREFIX("OEM", "XGSPONST2001", sfp_fixup_potron),
 
+	SFP_QUIRK_S("UBNT", "UF-INSTANT", sfp_quirk_ubnt_uf_instant),
+
+	// Walsun HXSX-ATR[CI]-1 don't identify as copper, and use the
+	// Rollball protocol to talk to the PHY.
+	SFP_QUIRK_F("Walsun", "HXSX-ATRC-1", sfp_fixup_fs_10gt),
+	SFP_QUIRK_F("Walsun", "HXSX-ATRI-1", sfp_fixup_fs_10gt),
+
+	SFP_QUIRK_F("YV", "SFP+ONU-XGSPON", sfp_fixup_potron),
+
 	SFP_QUIRK_S("TP-LINK", "TL-SM410U", sfp_quirk_oem_2_5g),
 
-	SFP_QUIRK_F("Turris", "RTSFP-2.5G", sfp_fixup_rollball),
 	SFP_QUIRK_F("Turris", "RTSFP-10", sfp_fixup_rollball),
 	SFP_QUIRK_F("Turris", "RTSFP-10G", sfp_fixup_rollball),
+	SFP_QUIRK_F("Turris", "RTSFP-2.5G", sfp_fixup_rollball),
 
 	SFP_QUIRK_F("XikeStor", "SKT-2.5G-100M", sfp_fixup_xikestor_2_5g),
 
-- 
2.34.1

