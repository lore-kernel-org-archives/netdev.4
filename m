Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436083;
	b=JX3htGIhZv9nlEcaoEd/3kp+alyX+8pZ+BRF2IR6+8rwx3ilr2f29oHDGC0OL/vHzzyM
	 BjJZCYqUqqchg4+6nutDYffLCkFZHYg4U0wrSa53ZoixhHAfFBVhihDSCjP2XKV+W6S2f
	 II3gq/23JXedVhVH/0kosM+IM1wVWFauHw0eu6BUK68CFWEJICXtw7thRvJw8edwSTf78
	 2bas4+VByPauulOEGogEPyHHkFcxPr5sYKnPfgrdV1PIDdnsyqEQNmR5LxehTKm417UkX
	 g3fpobQly7yppdpwIeitIGrjk2MsRY3+Ju1qtP/larIlMVyCmoTN1AUqqgQve/5r5WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
	b=y0h4vdOuNq5ovmsOgXlk/80BLik7O/J/im2nzxPws0RMoWnAcxcXa90rhHQq0QdxfLYV
	 rvS+4QEnBjdS4JBO5OnO/X0sFd6s6+pHTbpTy700ZYAwsxsQ/ZJpf9y3kv0ZoGcttIh5r
	 d2H7scypGqmN6KFPwYndx89NmYFwbxvAEoKU1FcbqFJ/iVt5tLIB5soz0flRvmoqwjvUT
	 nEfCeZQLgm2N4Xm4bqm2rELTBNsm137NTgPDCj18pr2+k59tu3uxk52xZbOT76hN/ETpV
	 Pefxz+QWQKr8RnQzHLGEoSaDeZPKsavd3qShxyuS7EstrAkPnxqSNtIFmkioKu2xkmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyE4p50q;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A40606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zyE4p50q
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-384d0550c71so1914301eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436082; x=1796040882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=zyE4p50qKfzKw/03LnpAPaTgaY/AGG/KVpRD+FjYDC3bCNx7HgM3etTF3DtB3mkPec
         YWyGc6lxWXgMraGzsskmxphV9yy2xI3P8MVLaJ59IU10LkMUKyVDzUsgNb47+OjMs1Yu
         Qhq6uFJIDVpiQIKcnWAA+oXxJlNBlg1JhbyN7ZbAaWK52mz2a0BzFU4ZQPqvNth3lVcp
         ypEjiYc79l5hAt3mXqmt36kJllBCrCAUjqaHPyY4krWkhb+2ZR8f9tEoInLy13LACXHj
         ijZP6uhUX3zF4DaLE8GP3sUCu6K7jnZ51bO+TJeJV1BRWz1xUx7TUdqHU6nmcl7SZP/H
         AXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436082; x=1796040882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjlxH4l0PpU/A+nrxn7qK+PVufEbeMAD3+j2srfN4gw=;
        b=zp2qlhtCsF3MoD7yZqryIl+xfy5ArD0U73ZN8kb/atc2BPr6/rwgzYotcwJ6j1xlKc
         zoSoWs1ZC8+I1h5UEdzCvcjfmLdfXVpp0fmyLewh/2M58d5+/f2+LQYYRtjw/4anfx1C
         Z5uqRvjdfoXegZwIdxxUpd5sqjqb3uAeBwOAbZtl/fqs3fzR29fLXwEFaEw9xk4uw71y
         hju3oYtdlMaWPK0Ne0fkKOlhDFVk5NGhe3aG4L1Kctlze4WOwEv9npev8mlPs5gzrset
         T9MEvho+EyPp2UF4YWpJxKyDwZ7CivHYFKBgJfmHSnuOZzNcEdfRg/avLn14o70vlGNN
         wAtw==
X-Gm-Message-State: APuU4Z/AnML6wFhhEAzVSIrCw/U5jeAgyH5/6E8+V/UaGR0FtO6O9Noh
	zdEZ5E6xp76hNrMlcbeJyDR0PqOMV2EPdydP/2ThJZVt6+CRR5Tv8PIs9DNF75zcZG7lVYR8
X-Gm-Gg: AZFdTZcX1x17qnMee4KJTnrLC4iiqK0Ql8D5v5eMdwVV0gGvXmowSRDvYwXRqeGt1DI
	FZg3a1Kt/Bw3/G605J7svSj3YRuW3XQK7wLV1pw/xrYmu/AYZ9WMZKkHKnRaPkhyyioAoeo3q39
	0VwuCski7wxOpPin1UF8UckMg/YL6FFgo24KhIe1qEFYkH31K8yaZd26zMJM8kpWcgbtlxIPlXl
	lnDKjhaI5yiV4wRU4UPg60wVXQXqY12jDrx182dqcZeGUoT7E+w5yIpuwZY4LXO6UOpwvSWLw2z
	EMgglKJVzlKVbXmST5NsQ7lZKcrRffp5Vxdo6KRISLN3B7oYmCsJNMInJ3B+/JQa+qMb+xhCPkk
	Ps5mlIq4Tb1IjdfxcXy+yzdbhNsq99Hc3DxAt3oWmdMpQPsBED7zLU/z4HaXLBlf0sAUElvpE0x
	0pW95aNFcE6Rr8HEYmuxEhZuMJhbp8qXwPxPkWAuM6u8DmBjZI3a4MvlPRGm4z5HiaTeUQXoFgJ
	DH9KzxLGqf01bUPxH1qkJG2+3pkA8ZYgtEBFpQnXIZ4nCkSgIoNeAWr7w3drCngZlJyVKdjVq0A
	CCBzw+t7hAyDPNNoxSyBGOdkYnJ3JAyfL6SR1EIO41nsSjAJ9Wg2M4hSpDc=
X-Received: by 2002:a05:7301:1a08:b0:386:9f4c:e07f with SMTP id 5a478bee46e88-3869f4ce1d9mr7893703eec.14.1795436081674;
        Mon, 23 Nov 2026 04:14:41 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32691038eec.13.2026.11.23.04.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:14:41 -0800 (PST)
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
Date: Mon, 23 Nov 2026 20:14:36 +0800
Message-ID: <20261123121436.564486-1-coiaprant@gmail.com>
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

