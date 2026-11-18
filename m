Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026304;
	b=0+JKh/rNOyZ3IuX8LKd1Y0EP6E/5UNfvkCEqGYwDhiQ4+y6FYUyS8Ce6lYM7kVt293AV
	 +wXXVU3jZudMSG+bYu9OIGI9Jm9rMRAQytjMwWwmDNBYJ2hfQILPmIOFIrMQCg7kqzGBx
	 nXoi4pEkeDv5svXncdgqU8//u/+MpQ9wcOLRo1KjFw+iCXFfSlCN8+3KNeNTKBjP79TTy
	 idQdGqEH7LI7JRshZNSl2RryBERrN5GmXobRE3+KLSNRytaEDjFZsFC1IqI3ZrbZiPSeF
	 aXYpYwHbKmfCLNII7zpNQ1xhbWc7Wa5dDSeoO0Imy5VJUjQr0xqLPByCWQOmojX+VPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aPm8bMtN0XCic6a8OKv6xXRC+l+0XGJs8lRtJHx2mLw=;
	b=AqtS0+CAT3oHsAAkzBcLtJfzveSN887pRHexe5Cu/TvHfJ7tZBJiHuBnTzkFIv3EajGQ
	 ez6HUfCL7hyWdV0a/El7SXyABakJnFF+zbeGzuARaWTp81OPM6upbnc89fzs0tlSOHSrc
	 ANaLK0ezSLbvLjX4W3E64hAIT46BtiLBacwJDfmdq47E/BlNFBUOxs9kbBBIuVlEDcerb
	 fZUXk0tdrwr6fxmag1ManhmLxKYGiT7FT4XdPZYNqa2ZoYhd0PqAERTnhuPtaym+xXKNY
	 rr+8jmIEggkHksBydsueExOa7doHMTx09+8x/U2zc2/8WR7mjXyxuSilOIr/13W64FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDukXne6;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F081606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F081606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDukXne6
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso692189b3a.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026304; x=1795631104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPm8bMtN0XCic6a8OKv6xXRC+l+0XGJs8lRtJHx2mLw=;
        b=aDukXne6qZLB4OGhduaO1ZScJ6sh787QT/POYB0Kof2Bza+lT4qRtqvmYVraMMR82f
         2ullkMEbpOLOz4Ut2lnHlnuFATEz3nLbHMsG7enezp0W/zkZANczH+MT5CArnBUBCZ0J
         gHA6SXt3R81BrFARYotuK8H7q40DRrajh/ILSQB5IwVhOl4lqFt5y3lukw2i0AXM5fgz
         mVXGSFOQ9sxcSy3d2sIovYHGx2BvyXKIC1YUZ2iLIG1UweT21F2f+72VI9cu0yig8WO5
         WSiE6SoKBgcYBWY9EoNclQz+Fp6pTHbsJPn5fVWjQjglPoxx01PtK0V58rKf+FGPh76+
         LO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026304; x=1795631104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPm8bMtN0XCic6a8OKv6xXRC+l+0XGJs8lRtJHx2mLw=;
        b=P8Y2lCQ73Y3hYpCMUFrfmGrrbrFbk0+EHnTkwo+tl4W++r23hVZOhhaPeMjAXvkQ9j
         YO5m3+GQ4o6jQBm9uWttxD6WVCPPgb2Pvjt24XKTU0jMbE/uc3PpTo2N7xGUMlFfog08
         zKezsnVRZRTknwL1K4v7NFQJ3HUpWDEeGCun5s0DUwRMJMjaqH+qFA/8T+VhBGoPAeER
         td0cp2VQFS7XYmhrTIUrMc4xXxhZ5xtSvdXKo05DFKNk/lLwz6QAfMS7rZ1ue0O8V33R
         NTwFyhJ6LGn9BkYAzG4N9kGclg4MHdL6NS/mEp8IXUDwhaWJCXcXINkSNffS0zcxCByh
         dM+g==
X-Forwarded-Encrypted: i=1; AL+hErF3DY5cWptQXNf1mdxp5HZ6VTPS9nywEcTXDMl7LV0D0ty8iIfjC1VkVIyJn77fw8cYfb/N1vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EuR/2gO0hELMd8Y+Yv0hxaN43MNmLjiY5i3CYR+xaUk2IKhN0
	LH/wdKzN0B9VYNLsQ3AIiUgkLSgRnO+dX+uAG/QJy146ovTtI2dCXFHN
X-Gm-Gg: AYBFou1H965qVRRuUW53mbhYxaRIXdsjGGD3gRwRPpCN0Dw0dNOgM44cY2rp6+Jwt2X
	fRXuO5li08vCOtPSYKBFUMEhTbPDx+uOEql/+WtXamx/5HfQdIb6pPZX7DJr3fxRYxCyWb2YvMn
	AMFiIkOwFbgPFpDzTBizbYBDBCw2dBpsRL7hjwMnokfaSKQiuRyPgBwAnLPXnCsouZ8q2UsekhX
	lwRb6jk6vN1k4UTzK6NNv/YaF2zkIs40x58ddxDLUpJhx8csKNkXuqzhWKZo6Ml7B0Oe49eUOPn
	rmjlcJW7Z3wqH4su+EK/Y3vTKn5HyIK/b1l2pSDMSoPvKz988FhomiHVNK+0cyEukxngYBY1+Hl
	nJ4b+EoNZjCOZ+vFByi9ld7xlsemjiRueV5Fg0x+mXeh8X0gkFHwepdkQdVimGIjFuzhgQ3FAfg
	7QZJaiEokeoujWokGG4FPu5WOzALC9tNvkS3RRT41MtbtGgLBydu5nw0ukX4AntK7bJP4gpY0at
	VGui6VmyOk00l3AJVWhvzgwvS2tEymWnzTiQD9807elFYyWcGUl7j89ChZ/NyJpcMIUUQF39Mt6
	6NdWdMWkclg/gksuDqoQC58CV0NVYAH6JKp8ov9wmWwuKtCjlyWJAVUCf7LGtKq7y84BRdla7U3
	i1mTf
X-Received: by 2002:a05:6a00:230c:b0:8ba:f51a:1bc1 with SMTP id d2e1a72fcca58-8c5d3639dadmr3086650b3a.24.1795026303092;
        Wed, 18 Nov 2026 10:25:03 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8ffe6sm1669954b3a.23.2026.11.18.10.24.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:25:02 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH net] net: phy: air_en8811h: check PBUS register read errors
Date: Thu, 19 Nov 2026 02:24:36 +0800
Message-ID: <20261118182436.32455-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

an8811hb_check_crc() ignores the return value of its PBUS reads. When
the status read fails, the loop tests a stale or uninitialized
pbus_value and can stop waiting before the check has finished. When the
result read fails, the PASS or FAIL message tests the status value.

en8811h_print_fw_version() also ignores a failed read, which leaves
priv->firmware_version at 0 on the first firmware load.
en8811h_read_status() then handles it as firmware older than 24011202
and guesses the link partner's 2.5GBASE-T ability from the link speed.

Return the error from each of these reads. A failed version read now
fails the firmware load or the probe, as the other PBUS errors there
do.

Found by an AI code review agent; not triggered. Compile-tested with W=1.

Fixes: 71e79430117d ("net: phy: air_en8811h: Add the Airoha EN8811H PHY driver")
Fixes: 5afda1d734ed ("net: phy: air_en8811h: add Airoha AN8811HB support")
Cc: stable@vger.kernel.org # needs adjustments for <= 7.1
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

 drivers/net/phy/air_en8811h.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 81aa9df08dee..da9a5deccdac 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -378,18 +378,25 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 					  AN8811HB_CRC_RD_EN);
 	if (ret < 0)
 		return ret;
-	air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
+	ret = air_phy_buckpbus_reg_read(phydev, set1, &pbus_value);
+	if (ret < 0)
+		return ret;
 
 	do {
 		msleep(300);
-		air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		ret = air_phy_buckpbus_reg_read(phydev, mon2, &pbus_value);
+		if (ret < 0)
+			return ret;
 
 		/* We do not know what errors this check is supposed
 		 * catch or what to do about a failure. So print the
 		 * result and continue like the vendor driver does.
 		 */
 		if (pbus_value & AN8811HB_CRC_ST) {
-			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
+			ret = air_phy_buckpbus_reg_read(phydev, mon3,
+							&pbus_value);
+			if (ret < 0)
+				return ret;
 			phydev_dbg(phydev, "CRC Check %s!\n",
 				   pbus_value & AN8811HB_CRC_CHECK_PASS ?
 					"PASS" : "FAIL");
@@ -403,14 +410,20 @@ static int an8811hb_check_crc(struct phy_device *phydev, u32 set1,
 	return -ENODEV;
 }
 
-static void en8811h_print_fw_version(struct phy_device *phydev)
+static int en8811h_print_fw_version(struct phy_device *phydev)
 {
 	struct en8811h_priv *priv = phydev->priv;
+	int ret;
+
+	ret = air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
+					&priv->firmware_version);
+	if (ret < 0)
+		return ret;
 
-	air_phy_buckpbus_reg_read(phydev, EN8811H_FW_VERSION,
-				  &priv->firmware_version);
 	phydev_info(phydev, "MD32 firmware version: %08x\n",
 		    priv->firmware_version);
+
+	return 0;
 }
 
 static int an8811hb_load_file(struct phy_device *phydev, const char *name,
@@ -560,7 +573,7 @@ static int en8811h_load_firmware(struct phy_device *phydev)
 	if (ret < 0)
 		goto en8811h_load_firmware_out;
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
 
 en8811h_load_firmware_out:
 	release_firmware(fw2);
@@ -1164,7 +1177,9 @@ static int an8811hb_probe(struct phy_device *phydev)
 		goto err_dev_create;
 	}
 
-	en8811h_print_fw_version(phydev);
+	ret = en8811h_print_fw_version(phydev);
+	if (ret < 0)
+		goto err_dev_create;
 
 	/* mcu has just restarted after firmware load */
 	priv->mcu_needs_restart = false;

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.56.1

