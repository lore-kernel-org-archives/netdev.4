Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436034;
	b=YinarlpR128YBWOsCts+ciNb3J6duDroLb4gHckzQHJ7P0zMGM6fHbHNJAr8p8G7pQzD
	 ZyNTvmiG/OGdsiTJuTEE/FsEpa1aGwNWwemeReS63pL1JAkqQ8JN9QKgY8V2YnI3GA16Q
	 PXYUkN4/W/VZvsc5q+vvcnaS5x6A8dgdAWoVsKNvVs4DipGW8hDKXTUDS0g1vp8jv7y9s
	 l1dZ3AWvIcJ2o4H1GJSRMHrZdaKurSpoaOEozh2BwA2i55Sck7Rqcnn1r3DHIefekgLjB
	 nivk/Iu/306Nzzt8BTmCsiX7mlyiVQsIlpkYZnS1Lfa2669SWFVPKGftTDH+MfoYfRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
	b=33483TI2kdJaNcMZs59q/yagxQSGxv4LOb/YrgMDFQVCLxMVDw2s/s3Ob0h5DLapnLAY
	 gGLytI2YTaScQk9OEWK+4FW9XZ/iWNF/AQtY6i6GIKNrWrB64n9cMhMeqjR72wiavV94W
	 4aMi5IOdyWoLV0u33v9mU5PlGX90iAznGDS1PVwuPn5PLF6huSU/AF0ZYECxk3bWEtbif
	 kgK076EuGFg37KAsaxEZI+/HGu1hXvxki5VKTZ1PdWKYUtx7R406vxo9KUDZhEZzHwbhU
	 Q1ERBWKC6QTewDHeTd1KyxS1PjIlUku/gbjm1hMBN6RurZ9V5fwdt/KZj2ZJmaNeGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O6gAPhCk;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449E6606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O6gAPhCk
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-386a9c93b4eso349199eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436033; x=1796040833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=O6gAPhCkaNT/eMVHJ7JOx5fiCqoI30/yQqoq72HohvBTmH1HwtY3rGXOMG20aoOhmE
         xib/dRwSkWdaUWWwsNIce9Cwke8U2h/R5fpWaqm5eGvI1H64zuATJ7R4rZdI29JVZr9W
         HU/zHTaM0lZ9Sk2YaWJ+1b9SXyhUqM2kpKvC16+c/zq6GWBrbSU/Gr9i238nOR2ZKi5O
         dbFqXs1cfhdD0PZxFyP3Waj/VoP8xeZ6AKCjWKkQSjy7+P+TqnGv56KWCPr9MfnNMkOO
         EZYUyR6UuJlpiy0nas7kRDDNJ6xsgIgXMCeYU9vcpGl4TP6yVbDj6UwGQd3tmLvCF5Af
         T4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436033; x=1796040833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=LxbLO5aifjxi9STYCqCHuUNCaNSpVYZT1vyriZ4OnxmBQVgmSm14NVYF7Kzsn4VPvT
         E7NHzMSqdvnNDsl+bZ63JdyLjXfgIhZlJEqhUFfwY3fFipArXHRVK5LPNK6VEEkHv4jR
         CepEMf6xxGeHctYetiJQw0IwVhsM3vesv4RSRvnOKXG6gFJsuJ5ccNNyIr0Br8cUcmtJ
         8GWeCntoygVpOiPA5kjgwCKPjQJ5PlDSujV23oivaSFl+4CHoHhfY/RbBo3dbDBRQ9BI
         SHrBukkLZHDSDTC9deNDQqVTnY85Kyl+P13iCVAGgp936eXmQV1lqLy0P5EIBb4HZbxF
         Y62Q==
X-Gm-Message-State: APuU4Z/wjdWV+xWWsbx4zd62U3vHdDWSOcOv7yGkcaE2VzwN3N6RAq9R
	ZFFVwcVP0oTcPv3gHt6fvL5zUXDMq/ScXzLpIoBOqpU1t4EpJRRes0hmRQ8rnFj+goAd3oMz
X-Gm-Gg: AZFdTZevdauStu2xiXaeyR+SbmxANh5KrtlSWWAuzq9K2O+pmmAaAme3jYefTC+CRCH
	oyZdIxYTnxg2XkIvxge7w7InXThKFsoWY/hs4Jqz0HCapvmrrY4DqxWzJJm702xZnRigJFqTr3a
	5bt/bSvgN34mVGlDELb71h0w08ZhdH0kluaZ/zJ64EXGM7LdPT3mofTWoqmnUpn/AWXpKNbs8GA
	xSNiyhLRLyLoUKEa3zF78dbViEkGuWMbo2qXTn8lFuLvEW/RKchSxeff3JQwCwIFGcsZ605ZHrh
	aIECPTzF7SPS2BKphIZD6t37WuQ5x7Pp2/SYetQ8b8K+0UVxMaOTik+bIzNJzaxByvP1IvqOzyA
	m2AN3vKZypljyYMYmimGHqWLPCB4UOCnHc4vpYdl7vek40Oh/er8to1H/Cb2dBV/6sLDNKMuiq/
	DAv6UVOuQJJpdp5XblJA4/uSI+gkaC4awLt7h5Jtw3D7A0xyQ6F7NHYCSeHAMGHUj9HYoHCwERG
	coel4SA4EDg2Rn/ve5bqdA1s0KfKogdtt95eLDgg9ThnqVV7GK3h1ojagfL3ytdpCSDoyrZwyfx
	EufVDRenPBc499Matj1ox8991seO8xysw0Kfo7KGbXhzu9o8zRbD0D44AgY=
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr4107662eec.11.1795436033404;
        Mon, 23 Nov 2026 04:13:53 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm37751721eec.28.2026.11.23.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:13:52 -0800 (PST)
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
Date: Mon, 23 Nov 2026 20:13:47 +0800
Message-ID: <20261123121347.563739-1-coiaprant@gmail.com>
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

