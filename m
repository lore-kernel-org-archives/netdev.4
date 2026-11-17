Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937945;
	b=UtkylI1y0eR4zAZ/1/ExBtiSwzEDMj51vcrW06xpfZpoArwbicbnWUEeQXQ4CBj12Egn
	 9Xp9YbmBtBth/O/iX+UXwwdYoGO9+XuZIyUxUmoD23Z4ja2BgNy3DDqX8mQ/9jHN+UCCf
	 tddxATGnLMDQOsaM2k5s7HIJY+GJ+Fa54WaP21MHorLp3AheLsuSwcPXQuHHd2sp4jNNG
	 vz/qvnXghxiwocqpF/+dznRufiUDh1CCk1GsgSR+Hp9mFPDVMm+vFs5piEj6i/Qa2fKbV
	 earSfMnPfJaTaVoO6+dVvHMWY4B5b16R9IrbxNqgWdomTipzNYk+wg/JJfky34gMxWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
	b=toJYS/4WtZpRmL6ungv0pvKsMB5Koa1ygFL5IX18ArRZGKFCtG3JH/unVmrOrtCbYTP6
	 ijhBE+1P+ULF6Js24CM5UcacZBmDHV/JQ5BtDaeDE1DdknII/uq3pml/KeulqRzPDhAbz
	 QiFbiBniTrmrp69UzRAR3wDuaA9TUVot68Qj5BuC+lnZxaymmkvWqkf2rBpiJtMim7E7l
	 A5mhJAVOqSIXl6AdqrKRawz5zRn+vRXigfTb3JpSDol+WnRMFm+irlkztMr8IXRoNpFwc
	 TZdvedZ24OmE+7vXz8Nn4oB5ePOiRwHKaacaQBVQ+GkQuNfC33CC3RhzqfUZ46fr4tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HQNO/0kg";
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EDC606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EDC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQNO/0kg
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1b22fcac215so6090c88.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937945; x=1795542745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
        b=HQNO/0kg8Mm4obDkN2sL14M6PfcX0+FkKur5xhS3eZMqG+kPPnf+gvvMGOD2Qf8qgk
         jqbiizNEPZBV2Sl4cHcACPp0gHQZvhhdHgwi9e8Gr7ZyXnXdFy4JDSDPHJuoOTPWdH0d
         kwMVH8BFecDBoEVa8QXRCI2NY8ohk9IH28LSBSv7IihZgHEjD7YBDrC8vfxkxGGUaXYz
         EpGfRY7fieamVizIU+/hWN+Le2aXswVxGhkpK4BfrQqtAWUbmIGtaiep5Qncy/L5HXAT
         EsaMmLBMoj27hw6uH+ApymeAtuwFguEx0ijt5qWHVgd2kwyqjwfShPZ4AA1I/xFOk/hO
         Y3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937945; x=1795542745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+Ti2XySKByWl6iWYw7n5gpexCdMj20kwqBBEEmSa+Q=;
        b=sAHdWJ2nvA/BxibcEvlv1jCfiqqP/LyAWy9r9//YNeFfsqhsF+J89d0xjklChHvCLg
         AqyLDQUHN68MtHkoXZonwqvBYniUWyLgITcvaWxqsUOKy7b2lQsr2tgm/KfHHs+pst+v
         vKMzIk4EiKtOLoSFLAYhcJw+zOMrO0UNwAytvCnif/Vv1cng/+fY8K9Bw/OtdNfFL47e
         rOLIb82roG6j80g4jb1mtDTBj3i5sIfYNGVYMgtFN6PdEWOwz8xIpT0XK3/GXp00EpzG
         ySnbzsODSfSQepqxaUFJ6H8GB5eL2Cbk+l3HfCVjBilP/e5RKLbPPlZxrRu85I3JciHq
         OSzw==
X-Forwarded-Encrypted: i=1; AL+hErFgX82mGO3a3wAjc4nqwEhgbDU0cDg9CcpVNlSqqMeD3Im1nBaY0l+97SxYudRJgkhj8BbgDG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IswLdS6ZF3D9cW2mf6FaU1IZykxkZv0ywLZQdgBIOdF44gYHG
	iWIJ2IxRZl1aoZdI/bN/gzTsZHeV/0RJmKS+o1W8O0N9ESdAXYUAtqrF
X-Gm-Gg: AYBFou2R2ZxkaKzKjuo0ISbwuLP3zzlvmwJzgrsPv46TgDYGe7eTliKeeWLk9eGc2qH
	BhiDbowWm0hOvjMjQqfJkgcUa0WNGYMQSRiD4lCllhBS0AOBONMw5RjsjjibnibJ15Rxwiel/YQ
	DFMHseUN5uySHOJ2d/SG0pd1pQOByNVfcIskPce6O8J/y2kjkAnAHPBXUpSc1bLpv6AWiZSsig+
	x9IqgfNZ7u1vho5P6wp3ujSrdiSqquuuI2fb/N8/4Tbp6iyQum+AeaiTougyAKPyTV5lNxxU4Fk
	xhNp+jHwh1ofN2pnwxXqObtPiCqyav8WoxzGiQxyp2PM4Dh3uSRsuLths1hQSuj2V27H7VNgz5l
	jkQk83upeSw73CSvHXjnWJLCeH1OywCrgVBVe/EREnjBQ62vuRy9RbmjK1OkasgMBnrpl34pU9C
	rkF05HzKZKNY4RpfuuN1/f4kHutiDAkkjq6YdwW5brgf7027HoA1f8z19DPjRdOWb2zkQ0lrnwB
	JWTblQu6sNMHSaqBKLVZHJsV/0qLTgengklx7SNAifNPgIhOhFeof5XPt8phsaW7p5hHwfcEJ9U
	fMU0j1EUdW7zGa8b1QzVzt0R3T71uXFpb5YDNY6N2pNMqw94Kn21j7nR+jqzNNkBdYQ+jSbkwLX
	ig/HC
X-Received: by 2002:a05:701a:cccb:10b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b543d32f1cmr240596c88.33.1794937944414;
        Tue, 17 Nov 2026 09:52:24 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm38272460c88.13.2026.11.17.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:52:23 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v5] net: pcs: xpcs: make supported_interfaces authoritative
Date: Wed, 18 Nov 2026 01:52:15 +0800
Message-ID: <20261117175215.3015703-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
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

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
SGMII and QSGMII in hardware, but does not implement the C73,
10GBASE-R or 2500BASE-X modes that the Synopsys compat table
advertises.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, build a platform mask with the three modes
  supported by RK3568 (1000BASE-X, SGMII, QSGMII) and intersect it
  with the core's supported_interfaces using phy_interface_and().
  This narrows the mask inherited from the generic compat table so it
  reflects the actual SoC capabilities.

Note that QSGMII is currently filtered out (a no-op) because the core's
compat table does not support it yet, which demonstrates the intended
filtering behavior of this intersection.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
Changes since v4:
- replace DECLARE_PHY_INTERFACE_MASK_ZERO with DECLARE_PHY_INTERFACE_MASK and initialize it to { 0, }.

Links:
- https://lore.kernel.org/all/20261029094916.3127193-2-coiaprant@gmail.com/ (v1)
- https://lore.kernel.org/all/20261029102728.3189359-2-coiaprant@gmail.com/ (v2)
- https://lore.kernel.org/all/20261102212506.3348537-1-coiaprant@gmail.com/ (v3)
- https://lore.kernel.org/all/20261110160554.918652-1-coiaprant@gmail.com/ (v4)

 drivers/net/pcs/pcs-xpcs-rk.c | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index ad187fba4e9d..e0057545329a 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -480,6 +480,7 @@ MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
 
 struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
 {
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces) = { 0, };
 	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
@@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
+	phy_interface_and(xpcs->pcs.supported_interfaces, xpcs->pcs.supported_interfaces,
+			  supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3

