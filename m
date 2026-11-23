Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437072;
	b=Io/fjXxLstXpI+i53+SK9g6ycKjd6vyMCjckvjwE8tAUXEwQgHUKOrrUTkiYcKS2laTY
	 Ta/C0ymcGklHrKDXW9HHxR//yfsoIeSfY8II3gMwIDV6X2Vq9zihwpNv4SZbp0HoFxMJv
	 A2G+oUVzihVz478nJ6XN5luWSVoeRqeDDYjj+IF6dJuGpLE9JbVFK68ok3Ig+eCMkiuRv
	 3Qhc7erhfG0OrotoweFsXVWkHYSIdPOuo+r07wz0XihWPvaB7Cw5uF+TQScfyrK8aaacl
	 g7eYCVu6ChjBGAq9NcSNMVCw4fUpdIOHnT3boN570Rvy5tKymQy8b5JqIloetwIPFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
	b=IYY2T/HqJB+RA0GqkzLm4HHN16o4SyFiiOnESZEi4SRjNi8V7Pxk6H7/+O84R3jt72Ms
	 xZg4fKaIHyw3EbpLb6SoVovtezeBM5rXO3CRC0dFy5wvWF0g4uFfKHHkgISULQ6p1dx2o
	 mVEIUGepWVspeoyyQ5TwMeuQepJdsQlf54aLcrSo83kTg4mzRZhJ4SFRN10iWn5sA7GrS
	 DAv9UBSChCzuRkgsdJaPj2PYlHvRZoiWiJUjbULUDt19IquIehKLZLgUy7EaixZ/av3zP
	 C1K5PrskeYeAGPHCP3yIlhcFbr1vj2E817gc/e+40wxwMsguYjSdR0wmO/+y5P+nBpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEqyL0mC;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15F3606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B15F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEqyL0mC
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-386a9c93b4eso363117eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437071; x=1796041871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=oEqyL0mCJ0EauOtd3T55gctZLMM/2a0lzeL88aHfhClX7/m1iWrq+gd637ExPxmkWB
         Scp06VpUBayhT4Y8+Aeh9kKnUnUSyzYei8Ok0EPV6sFzX8w4SW7gqMjpOcj/AIJFvzz3
         rBNJeNB7jZ2fGI/wgSSOSj6OoR68uqVOhjx16rApoj824IfR0oeRLxG65mOsnghcWNNt
         apfg0wNbZZcr7EtSFRSD3R9mIH0KspY8TgNfz4GKPSUxg7SZAxaPGfKPc0JChFSHPVEi
         D35ms+VIdpbz+nKxcZpVBZpIRgDo4n6WNoV3WY6yuKik5BUmDfdHYfzuJMmgEk1gMJCj
         SyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437071; x=1796041871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=e+PdYwLS+cdpMnP7j6OsGnMcAfCb1npNyG4Z602GdtoXKdJkmn6vHzjYfyUpy5UhCU
         nEpYilwY//yiWdMdOZ/gxqNU+u3mzjNvKtT6QYvwYEKbb31fIp6GctnTOVlJFfP8mJf5
         HJVpBMkONL7VFIewR/+TGO53kWs2nCHZeuwwBCsPI1dbZ4rXvIaiNMwZpowfyTb1uqoj
         mMzpXxxq7VtclYoMTICpDDJ79tC5Jg/JI6KrS6k21mRtOAwERteMQSYYY4JpIrDCAA2W
         Lu3z8XLR2o3Z8F+AJetBWhBix7i1y87S+vytMN/+7d3fIVKXKMaIAQYtN17kFDvp/0Z9
         NxLg==
X-Gm-Message-State: APuU4Z+hhnYRYpEY5jcX4j/Uf9GScSMddOVQav2AnLkS/GoKv2DZ5f3o
	L3YdZYuoEKt7cXEMgJ5u8lh1Li+LwC6zKBTREXUKcFu+8bb03Wj+WFB5LJCR4UX+GpNpXza5
X-Gm-Gg: AZFdTZfGP/cYOoOaTFwY1ilVHtg0dncSwhv9akLrrg8aC5fOV+EFelb9fbF/MFQSMHY
	rfEnpXXQIIagNzK0eIEzNFhUIX9U76ZrpRsQyZkGI3QzNuI40zzHBTL55oQCR+m+80spKBd3+j4
	u7XY3ApSsAAHeUkriwj02xQyWjWSoA3m+iYqj3eZ22HDD/lkhPplJQnET3yFJMsR/nDENiIxA1i
	mtA/+U7iIGteN0Z4yI2Pr6to9oym/58aAI5Oa/nKNqOrv2GWBiKINmOlEecAjxcG+RQeEMx6SBO
	9C979Jre7SgSIKvrJ4OVK0OxyHnRAq97c3rEFy2qAfpw155NSKJRDDZXIUkwpS+6VoYej4ez1GA
	yCTjwmztAqM9c9dvPY8ozWf9JPWMSsuJd5f1exNYRhxipdKYdm5GV8nykOrGLXEs3TT0JRQYZJi
	mPbitbybsrCQKI0ZRbzjC415CvvghqaeLPkMgfIsqJQtVovlDZBTuKhoja7mM3EzK/2IpNdLZCP
	oYiXJAbfiQxmJ+FlD2k0lLFy4gXU9lAjwWK9OEQDSk6U5G4HxIYMDC9/auXi2gcL0qIDuZYakTj
	v4fdsHp6M7eSzCGTaM7/PE/Gpm3zbk5ol5k07yj4/sBzcYqPU/adufDl/yA=
X-Received: by 2002:a05:7300:b597:b0:386:9e36:df0a with SMTP id 5a478bee46e88-3869e36e011mr11381586eec.13.1795437070741;
        Mon, 23 Nov 2026 04:31:10 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm2590969eec.9.2026.11.23.04.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:31:10 -0800 (PST)
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
Subject: [PATCH net-next] net: pcs: xpcs-rk: use cleanup.h for platform_device reference
Date: Mon, 23 Nov 2026 20:30:53 +0800
Message-ID: <20261123123052.578956-2-coiaprant@gmail.com>
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

