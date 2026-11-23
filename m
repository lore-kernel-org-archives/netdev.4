Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435985;
	b=z7MyCnqEuMVjVLJBO3s+OG5fqVOcabPCVuSIjtyBgZjS4Y2gp54757VzLpnh6Mit1cW/
	 Vu6FT4pZOvi5y0PRcSW+zBt7/mudbkO71j6TrQvVcHCA3MHwhgfMh5U9xEWiglWMWbFDV
	 0ES+zWM8Ydyx57HB9tXkJX1sy2ISqim6ZEmvaV/YlDGKoXI8pw4dM9oIQ/gBt9Y1weO0u
	 HKewDxLWn+A1TW//eqKQJ54XTIDj+QPKQpFKyuilB2vrHFTJJAY/eDvCjgjKXbUj+8ibH
	 klKtZ4OtcOv39xo5CsQIu7BnaRAQE6NQ7aFLkWpi5S4LYEvF6n/+CFkfCKYM7iIu0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
	b=JXcHwrpoLVf5hAtK1wjWVsVr8StMiieMk79SrsH1VApE3H1M8RAracxgv/m+zgPZpGj4
	 n0XQ049BT46VJJonAhdrKvKyeEkGNRpR2+032GeoREjvqZxH/nmlvHkSWQwZVcn6ywGCQ
	 G5vwgIbuhf7/qrV1KwR4RFU7zzyoC7Sky+lmWKAQ20bwZRKWD04Q47NFMPqAZ/s3GxyiQ
	 9u0+UQwdZK5g7v8sX9jaO57Q7zHlK6hFTP2IlHwZya9l5I/yYHLGr7eIQriYLE9biROVh
	 TIV46C/yNisTV6yTLB8wvJrve0JZwSDcnnp5qh9LnO2RGz7L2EIOOZkknahyU0PEjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxd+kOXC;
	arc=none smtp.remote-ip=74.125.229.131
Received: from mail-dl2-f3.google.com (mail-dl2-f3.google.com [74.125.229.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D49606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D49606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxd+kOXC
Received: by mail-dl2-f3.google.com with SMTP id a92af1059eb24-1521c45a248so2934882c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435983; x=1796040783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=zxd+kOXCABfjc2Q94D0jvd2vxNrCZNndqPFPltU8JIC/nkD6k4spB/mzFnAuyqm23J
         a2wzwb4bBTQT9To4vLf9IoUKPtcSBJNQIURP5Xkky7CR6ICEJV+UyBxBKRtu3sqjLVIg
         SHikswJBTQkP0xmp5c+a8DLcwrpDfhSB8JytS95XvRli8k7WdIFSLYjezLDk63XgLE0R
         rTU7pP8LeuPC1cz0a0Tl3gtXWzTEdjNwRkNAD9qPvEU8LlADXOwZVvb7wy5EzFi7plK0
         YKA4kWFqiesCBuV5QvzcGwgr8APMY4RnYJONfh6Fa8JwnGYi970HQIEKAMPpWGcRP4p9
         PbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435983; x=1796040783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=NDoQRKziytgKSTSyxah3OBOA1LnE4TypXOTUwDeph2ar89gDIAZecBKhSyrRWbQ3BL
         Wh5O/w5zG0JNjlc93k7fVGWKrZ7WNLSNT1BrI4HWh9+ra5IPbflwB9fm/aDLwxDSPusp
         RkVKUNLMgWwYHJpl1++q2QWqpDopllngUV4Be2OtdmXWG71XCI0ZcgzoTmDsIt/xuD8L
         W1wjaXVxJxXQB3D+GqoV+ygwZYulBkkU1wBbqFiotHs1s6+PgEjOISinpydBKAZJH+rv
         Jtg1XEMwltzz0s8kMg1mAIBzEbcoROVN27UXeqPJY1D4iC9z3qYIEB7s7zSHO0Tc71ck
         mQwg==
X-Gm-Message-State: APuU4Z+dVlsxrI04aGMsTHF/d2E/achB66xvSFm51iL9muOfGjn2FlYH
	x3xsJnxHVJPaBtwR4h3csB7zJesAV2xumSPpew4+tDxApNgAWn06GmKGSg2thSfxstf6ffqx
X-Gm-Gg: AZFdTZca2rKECY/bmAyDc3aG5tDZcMGJMoeZj3U6/WuUWSqRS29Dhovm0NT8g0ISkWg
	MRncvql3h+nS/zGsv2iNg/wE6hszt8CXyG/vgrWSZXV06QpQFA7grygLj0suGEU2QxWCDL8C3Nw
	RB6wlZZV1Qs8VxbZiwZIn2kDGgWOxRefDak2LM9fVrEitr+yCfiuSkGX9GVu3j7fsTjCKJa6n6Q
	0/PqUBmZzoWxbCSh2qh+y4J/oicmgSMktucgcFU+XOEuqJJY7ePFFVNjQkj2MlBb+p5D/54WZ9g
	z6VCsbQxYikeT6k9XTXAIlINn+6SoE85qMZTQUt9/TWZYJrjk2WabTFOV2yjEGlv4/KfTVpvT2i
	2RXk5qdNRJMllYKnu2zI+UMUDSJ8dhEAPMcsafgetEn1DIPkcX4bVlb9c0COnt0pUomWmh8EjFI
	7vijjDXNiFL57neyr5TnOGOZFeP2gOgpDKzUvfEQjmVm1mST+ZDO7eGosUwfMGfJuWvl0hAKSrr
	SSNwp2HNrR0VVDhJrfuUBlSbOz+Ozp+RsShhNxpZUwh+dpv7zHJB0JvCEo98zsZYZG0k+wk3iEc
	oPSqwLalxYtzr7Ly+Rm54h09HX+udiEEZpbQwN6mAJm+zp7ngh/pustYMjc=
X-Received: by 2002:a05:7022:f50b:b0:1b5:2de3:bcfb with SMTP id a92af1059eb24-1b5568ee8famr12899741c88.25.1795435983509;
        Mon, 23 Nov 2026 04:13:03 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm14611003c88.4.2026.11.23.04.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:13:03 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] net: pcs: xpcs-rk: use cleanup.h for platform_device reference
Date: Mon, 23 Nov 2026 20:12:57 +0800
Message-ID: <20261123121257.562986-1-coiaprant@gmail.com>
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

Use the __free(platform_device_put) cleanup action to manage the
platform_device reference obtained from of_find_device_by_node().

This removes the need for explicit put_device() calls on every failure
path and at the end of the successful path, simplifying the function
and reducing the chance of reference leaks or double puts.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index e0057545329a..8539caff6725 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -481,7 +481,6 @@ MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
 struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
 {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces) = { 0, };
-	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
 
@@ -494,7 +493,7 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 	if (!xpcs_rk_mdio_addr_validate(port))
 		return ERR_PTR(-EINVAL);
 
-	pdev = of_find_device_by_node(pcs);
+	struct platform_device *pdev __free(platform_device_put) = of_find_device_by_node(pcs);
 	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
@@ -515,27 +514,19 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 	 * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), so no explicit
 	 * device_link_remove() is needed on the failure paths.
 	 */
-	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
-		put_device(&pdev->dev);
+	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
 		return ERR_PTR(-EPROBE_DEFER);
-	}
 
-	if (READ_ONCE(pdev->dev.links.status) != DL_DEV_DRIVER_BOUND) {
-		put_device(&pdev->dev);
+	if (READ_ONCE(pdev->dev.links.status) != DL_DEV_DRIVER_BOUND)
 		return ERR_PTR(-EPROBE_DEFER);
-	}
 
 	pxpcs = platform_get_drvdata(pdev);
-	if (!pxpcs || !pxpcs->bus) {
-		put_device(&pdev->dev);
+	if (!pxpcs || !pxpcs->bus)
 		return ERR_PTR(-EPROBE_DEFER);
-	}
 
 	xpcs = xpcs_create_mdiodev(pxpcs->bus, port);
-	if (IS_ERR(xpcs)) {
-		put_device(&pdev->dev);
+	if (IS_ERR(xpcs))
 		return xpcs;
-	}
 
 	/*
 	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
@@ -547,7 +538,6 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 			  supported_interfaces);
 
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
-	put_device(&pdev->dev);
 	return xpcs;
 }
 EXPORT_SYMBOL_GPL(xpcs_rk_create);
-- 
2.47.3

