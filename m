Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436229;
	b=tlEcEYHNaGd0NycJ2E1vuHVs1VtWnb9jdOKcGbnjWVu1i939Vx62GJv+oSba16cv7ksV
	 Jmwev0hnypy4nk/VcWFCBTk/9Dnd+DeJV6W2gKQkKlpqbg5c3UA3zurwt6rPUeTzvIZT9
	 woLiDTzbO982ojU6OPZKycKllmIHxJztzMzokF7zp2zv2fXcAZtViaE31GkkzzF51wPNf
	 Qh18GyRjY5HlWDxGw54bGP1IXupn/BKU8Ckhrkgwg6/0NhXK0RGe+OKXXFHC9p2YRzwYy
	 eqOwhgw4jAavwjQ2QgMqRfcjtuoKQaTEmB/SUbDzmsCqFubvsldgDuUWwR38sAqnLgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
	b=MEhHL3bn5o/6U9HIyIv9D1/uV2NI1t+IErFMsxdTsZxJv5JetSPXmYu2HvItUevgz1Ow
	 cyJ3P0S7VffW7+7C/+VeH9lzQyhDpYDorsWFaadPnXIWwUT+Ej6llL4Y+L+d7MnvpqKYb
	 +DSUl9KfQ4xKQ/lMRwY6sfjdtWuDx2yji3z0vwTZDOD4NW2VBZsXvUzBk/6qc0EXSUK46
	 0gYbRzOM6lGEG7cdaFFAanC8pvGBeLdjIoB7o3szkj0W5XZQZteGyGQH7grgFBumepEk9
	 3UyFlGZFdmptsDGGgQLLZZuS3Rkg1d5/t9HqCNZqF9ARvVIh+v3/2hvErDb4T/t1WFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOhbIkxu;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F76606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOhbIkxu
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so1294673eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436228; x=1796041028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=OOhbIkxuZWULzYkzmOloeifJsnlfe8SiV+l6zoK/D5xXpEWAHRcXbBIen7jcGkpKCs
         1yN9lr0S83/5m/K/6c6/IhXPDXAwuck0QXoO2HFXA4of9lFze+Rqal/iPtzpTujzEDqI
         R6oAEJIbFJR+TEqD2GJQP8qFoNkRiGOLJufpiUVOKxz2VndU5RudHZlf566tLX5PqfEl
         u7fcooeWYd2rbugiyuN4cy7qOnSUW6A12ahPdXynYs0W/qkhne3y4qtT7AuoRm97mhKM
         ZRoo0qA6hcuoVtslVSo/diZFNH8KAP70fN6P96NEIaixEfwjhmMdg4fQ2fBIGl4MvGMm
         nbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436228; x=1796041028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=OwwU8ri8bX3wZfrmxSza7n8iTJcylnKTnvuz8AEfvgjt9r6Nad2k6QRafD2fpGPD5H
         TJC+tIzsWnQSp+gCKNzudDa++EEJ0VZjW8odGEZXk3LVorqFwfb81H3L9GmNaotBwC0u
         7Yi7VIe1lx8MGPb6Pl5pACXiCQMdA55zeL0/lP9Q0ceAPROgjcpn2MUmAznWYB/FKgiV
         9MIGqrtp9CuYfafUlJimXgHOlqbG2V8ez2cvk0IMkGLdOgMC4Y48+5YcQNvw6j2MEVIz
         481QuiZCr30wMCYSIU4pZsN9HIOKwZnUcP8XXoPsrHLVlcfp/V0LICtf4jWXdsrp+rlg
         AJAg==
X-Gm-Message-State: APuU4Z+P8MmOMpdhoyALbdaYl9cLurrh1FNiWv37U2riHlq8gVTNdeAl
	bT2oBTLW1jFLRVnC14ID0ILUaZNtUklcEiWnC4+oS3O7F2maFSg4YNGxxMexBnRx73XBWeOf
X-Gm-Gg: AZFdTZfZZZMjaIg1Uxpit+6hiqNbPV17IlfbHESfE4kDjYgCTg+hS9RpgrxRSJBsyc7
	R+J75CPNIbTl0Ui2eotX5qabARjwF8E/vcKQT1aGkM3bAWPXVRfulZ54hfIb3upEdy5jU/JsdfM
	qpZ5ISYPhYKCKgAAYW8bJBMf1f3uMZBdGtW301Tu3dP2uSGQKbGcD7WmRYtS/zKgsEjzP2Af1n6
	H3z/lNhAmpYRzdBUP2Kjvgzc5OhzTiFL/mrIVHDqBaXpwpXBG//qvDtllfjaWjegnLc6XnLzyfy
	GdUtDc3IwkLvZyiBKmV0kjzJMkhd/ircNQRkDrkgZVVpyMR/Tckg4aLyM35K0PhAPWP0MM4hs95
	ERbdMT9v2wJ8GipYLD55lh3PP/CJLcAMli0XEj5qJM2ELgTueN81Pxnmxrmc2gzWg2KbMGxLndU
	2DtnyP+N8gzx24yRSXGJIqQIdkWjGqqx66UMpjqG1NFge2NO86PTLLZXaDSBVP10i1ULiQ4NLW3
	9PUaqLB4m3J4y6WOOHxtgNxUk452SLHjhlNea8mmrMIkucZWXweg8d1v+ub54AEn5v52sm3i3bw
	wdIfMHG4LXfQtAR3OT43x3R6BaG6HILrxk/adM+9PY2yjsHKOzV7blFWWPey
X-Received: by 2002:a05:693c:8211:b0:36f:202c:48 with SMTP id 5a478bee46e88-3857045092emr12450139eec.14.1795436227745;
        Mon, 23 Nov 2026 04:17:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm31743053eec.20.2026.11.23.04.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:17:07 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH] net: pcs: xpcs-rk: use cleanup.h for platform_device reference
Date: Mon, 23 Nov 2026 20:15:48 +0800
Message-ID: <20261123121548.565580-1-coiaprant@gmail.com>
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

