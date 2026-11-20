Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134656;
	b=RA0Aluai7QUWBNolEo9Zizq+qyeeZm8hJvjNw+59yIvGy071FmsEDlXHTNaAQn+mj7Ie
	 1nVxQaOx+/MdR2XZed1ovxIZmmNKTScwosjA6DIpn0tYDP3YLfqVupFy54Ogj5PUEu3M/
	 zFU0EWp7fxncLGXMNBpTwxqhWr3i4ItXLnlF1jZN3WaJwjlzbzDkjvFEbkBA3vZj0ixGl
	 mheHdwEX2Yglcn5OzOZ7ziOFbjJyLxx9fosf2Ilnn/Pg/LLi/BeZ0hHoBtx3HAjhrfith
	 gvM4bOwxWLADbFvjEa3+lyMnP12t9Hwh2LMZ8kLWMsl/5Sjoaakyp9AJ0WhkjKwPwRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134656;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=hPlycAUHIGpsb7zDfAw9s4lP79BdcT6PyzBpqKrDoxI=;
	b=Nf+0oBdOdPOnSp6D824I1gpRxLIKiwCfytq0C5D2MVhBCxtSbqzV3N9jS/GpjEyopWaE
	 1flJjppcEZMNd3bEYBGcV1H/RsJlb8CH/TJz9cs1mhtQoBxESXxjJYyTsZX6LkaBeg+rY
	 R2XUAR5NXScmoVYfCK6Z7qnC+qYxfSEaLQFMG0QhsGFE4kWOeobbySoi3235+LtZVfDuY
	 cIobkTeHUurHjDDfxLQr41npftuvfDfOCnMvH6LYgrWW6dfKWQSZ7FQGzN9OgoXKjsTGh
	 Qlpg9D8Y9zD+pCx/O0SLzZ1wHp6LMcuEk8uo1VHEG7/DLrwtsB5cRtYAf3hzMDo6E6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QV9Knicy;
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BEE606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BEE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QV9Knicy
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-372bdb942dbso398714eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134650; x=1795739450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hPlycAUHIGpsb7zDfAw9s4lP79BdcT6PyzBpqKrDoxI=;
        b=UCW6bWALw0RCD3KBE8VVuLL7HxXahth+8jUT/5b2dZVTfjOT/Szae+SwG2Kwi6qJkQ
         ZZCr/E/ztyAbF33AqnriwcfXsqDkU166oU49wGsmsdWBiBL1Mon/M1u1iHljdiOH0Cy3
         1m0cmRPxivjKEpiY0B2GBnz9AxK/uth7DBBRSYRJQiMHqQjB/4AwR0s62Lp4xxf4o6I/
         K/kuunIQDHO1BK5VvHoHOEXUAZohs4TgJ8xVmxCmhzR8Se3zjD9xkoji25pY+BJnhpOl
         IxPobgh1qgusuMiop5CJS3rdQxqKevYkUrkZwewTo5xi5zR5SgjdvepN+OoReEz/aCpj
         qG1g==
X-Gm-Message-State: APuU4Z9yO3FdDrzD40S3B0TuDnL9NFYYVu7iwQzpRkFKA/ilCfhIE6w2
	xHUNT3Wb+8iKQjEyFCKbwoLzbBkL32iqngCilGmBJqcEBHx+A/4GBNMeeMvwGfBV6lQyogopdaO
	Tyk1tClA+IRtpDh8BOlpp0DjiA01xLyRmfbK0VC6MYYyvPil1+nPUJKkkD/j+5dbj2aae6rvifq
	Y58ibaxoa8H1xa8JENCL7nljWQkPi/SkK3pmiIFkzXiRIAGYrkZp053r4cbN4C8uRlPJUIFdQB1
	JBNZ2MHJZug/KSG
X-Gm-Gg: AZFdTZc1tpgYlUDTde6Gc9cIP3Xv9ggZks2jA9V+PIsXCaCuKRsrIGgZK4cbgAjCD1H
	D/yhwxv/WgEfsVN7MocYK6Fmobgv+MskmYPMENj5Vmew9yxZaYpOAh6hiS9zSk67frBv+BNb/fg
	uq1513e7vHpi+pcwMfgd4zm/GbBhd7YzzvnfqydHb7pYFoBIozPeILui6fx9Q9Nt3uHKgG0jQQ2
	T+/g+QgG+2DKhKnmqSdPnU4yFDbBOErvJBoYVrnc9vZ8wiIXWJDRXzbkm5h2qcV1xdbn6XdhqE4
	rCFPN6B7Xsl7S7LBmvLeEXyHI+QyFXX8apOZ55i1/uQf7CVP9ncx/dfZ57oy8YNlg117RlBFT7f
	7Ts8RsCEl5MYVaLeMaHLPTqJiA2vZ3uVs5Iw3CEyHbkZmDsK6xDFFzSRyxWhxkTqJ3Bj3r/P9N4
	zbmiK/IlTiRG8eYwqDAbFrac0VrHuF/BgXJxehZ4Xqx5g=
X-Received: by 2002:a05:7301:170c:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-38570847a6emr886211eec.37.1795134649948;
        Thu, 19 Nov 2026 16:30:49 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385673c6e98sm93013eec.16.2026.11.19.16.30.49
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:30:49 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so319468a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795134648; x=1795739448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPlycAUHIGpsb7zDfAw9s4lP79BdcT6PyzBpqKrDoxI=;
        b=QV9KnicyEfaQj76sJnxi2YQzpcTwpyJUm/TCluleXgKshsJQF0IwK3BSAmPbfOzARD
         hiLltTC4mbV0DUAdqNC3OILem1qR024965aDhT0DQsOnD/+vkXbXIWAXRVnhDqLV2oG2
         GZen+XuXhbgME5F9n/O7cZR/mJhWGtrJ42pY4=
X-Received: by 2002:a17:90b:4ccb:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b41c7b6038mr1046180a91.9.1795134647979;
        Thu, 19 Nov 2026 16:30:47 -0800 (PST)
X-Received: by 2002:a17:90b:4ccb:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b41c7b6038mr1046147a91.9.1795134647328;
        Thu, 19 Nov 2026 16:30:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm4008003a91.11.2026.11.19.16.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:30:46 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: rosenp@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: bgmac: unregister the fixed PHY on probe failure and removal
Date: Thu, 19 Nov 2026 16:30:44 -0800
Message-ID: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

bgmac registers a fixed PHY, either for a chip without a PHY with
bgmac_phy_connect_direct(), or through a fixed-link device tree node with
of_phy_get_and_connect(). The error path of bgmac_enet_probe() and
bgmac_enet_remove() only call phy_disconnect(), and
bgmac_phy_connect_direct() does not release the PHY when connecting to
it fails. The phy_device is leaked, along with one of the limited number of
fixed PHY ids, which can make a later probe fail after repeated rebinds.

Unregister the fixed PHY after disconnecting from it, in the same way
as other drivers do, and when connecting to the PHY fails.

Fixes: c25b23b8a387 ("bgmac: register fixed PHY for ARM BCM470X / BCM5301X chipsets")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef7307edd41..54092bfacd18 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -15,6 +15,7 @@
 #include <linux/bcm47xx_nvram.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
+#include <linux/of_mdio.h>
 #include <net/dsa.h>
 #include "bgmac.h"
 
@@ -1475,6 +1476,7 @@ int bgmac_phy_connect_direct(struct bgmac *bgmac)
 				 PHY_INTERFACE_MODE_MII);
 	if (err) {
 		dev_err(bgmac->dev, "Connecting PHY failed\n");
+		fixed_phy_unregister(phy_dev);
 		return err;
 	}
 
@@ -1482,6 +1484,22 @@ int bgmac_phy_connect_direct(struct bgmac *bgmac)
 }
 EXPORT_SYMBOL_GPL(bgmac_phy_connect_direct);
 
+/* Disconnect the PHY and release a fixed PHY registered for the connection. */
+static void bgmac_phy_disconnect(struct bgmac *bgmac)
+{
+	struct device_node *np = bgmac->dev->of_node;
+	struct phy_device *phydev = bgmac->net_dev->phydev;
+
+	if (!phydev)
+		return;
+
+	phy_disconnect(phydev);
+	if (np && of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
+	else if (phy_is_pseudo_fixed_link(phydev))
+		fixed_phy_unregister(phydev);
+}
+
 struct bgmac *bgmac_alloc(struct device *dev)
 {
 	struct net_device *net_dev;
@@ -1575,7 +1593,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 	return 0;
 
 err_phy_disconnect:
-	phy_disconnect(net_dev->phydev);
+	bgmac_phy_disconnect(bgmac);
 err_dma_free:
 	bgmac_dma_free(bgmac);
 err_out:
@@ -1587,7 +1605,7 @@ EXPORT_SYMBOL_GPL(bgmac_enet_probe);
 void bgmac_enet_remove(struct bgmac *bgmac)
 {
 	unregister_netdev(bgmac->net_dev);
-	phy_disconnect(bgmac->net_dev->phydev);
+	bgmac_phy_disconnect(bgmac);
 	netif_napi_del(&bgmac->napi);
 	bgmac_dma_free(bgmac);
 }
-- 
2.53.0

