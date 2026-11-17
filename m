Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943964;
	b=HPdPWEZB8HGEM4b1uirOmk2VUc47uRVcv/JJf53Gbuo6dg8pskU+ccs96U6E+gxhFExR
	 mJtifxW5HLAh5YY0FnNKbSJMQWpKYYCDO0Hsr4EzEScy8N/C6XSG7RqAjX5NpF1IYl2ad
	 QugebeeCZUDvskFxlpPbAkFZb/oTmhzQ8icMg5NafePg4bS3zZDiYMxl91I2dZxKG1hnb
	 umY8Ic45+igy3HvqwwtzOJLktMG+3f1jNugCN3oJsP49iQMj4J7Wtt2trZTYaJnP3WXsS
	 kjv+9o1qv1LAYbOaMflvlYDTF4NYwlxt6ibKhmXa6sbhWJWQAm2+OdUYf6vmsHzlIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/5+p2rnF588etP0Jtaw3ycL18YAh2Wt/hXx8hoIhIps=;
	b=3cQTCS90tUTsXd32D4ri1MM8YhunZTCoPyMELDVjAzlg9zY46lm3Qc9GymPvNDx+MGdm
	 lwnj/mzvy/kRRxTsIhU56OZdI+MGuErBMkPN+FTYsGYX/VEVsIm2lKcoGqBxCusDXeyqW
	 BmpcPjlKkiTMZgcT9L7GVGDvidAW/RLs7oMOtDYilO2iEryHTLKHayLoXv1/JbfB843f6
	 FyWEBamAw/eY2AJEbafw35nGd+hxpDdVBAvsG/P6t9IsxBuvkp9qpP8FaPnftY7E7yGMm
	 ux33hxyW58tkBaFuRa6XJOIcfvgmuqdQCkzTCrhT9BYOR0+kTmDcY6QELIpOlSRaJdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpMi3DOy;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B460A5BE5
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055B460A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpMi3DOy
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so704591eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943962; x=1795548762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5+p2rnF588etP0Jtaw3ycL18YAh2Wt/hXx8hoIhIps=;
        b=cpMi3DOyqly2nRoAF3bnLpBfyYrhArv/hWW3B+nY2lRPZ14bO/XdINHlpbdxEUuk2t
         c6wPfLvY8ykv4mtBNWKMwAjqdlGd65tzzDdyiUgLXtoj9t9MnUfJNgoLid+bwB5lIpDD
         ZIVaoJBAY0m04oMFBa+VrI6qa9cc3LDiJ8/y3l0qfkGCpwfP9eI4ZR9nUUJM6yCXOlcn
         4HV5Ar+qBj3O7TZZNnn3Ds4FwUyl8PmOABzlyFb5o245hcoXJJeui7NqeHW5r2ZneLyP
         3jc+EBjVf6c9asH7RbCuHGJqD1zQ+1TUMum/8Bf3beo1T3g+DAmqbuWAKmedeub3OmnJ
         FCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943962; x=1795548762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5+p2rnF588etP0Jtaw3ycL18YAh2Wt/hXx8hoIhIps=;
        b=UnHUepuPNWLfWhuKbyEACubVvA55sSDMgOi1Y9QLeycwFygLIBzeFVRQMF4gXo+QKo
         1Yr+kdAArU35k0SJU+ckbZpHvwIIbaMjlGEsrMU6GRdMLqDcEyOsBb+dJ6R3lxI4ayjs
         Ewbdq8Ngv1+3UNjofuTwbu9YZlJewCRb2zDLYt5tEzFD3Nw0h4l9KoDaR4KDt0zMmkx9
         PjTHCnEaePRyix849C8spXQk0BIdeg7I+BtZQkPbrZm//vv/j0t0mSjWUYQQmRDTFx9h
         QOmm3TZFN20IZzgfCVnHzkCAYpnaMBghPPP/Wo8lPx8G8sXCGpWybdZf1yetKiFU1T44
         56UA==
X-Gm-Message-State: APuU4Z+SsotiW8tAIrHJ2Be7BAFgQkGzJJz8BvX6aJUyw185btzfONRE
	EHwqvdELbLBlOLn+Zi7NaKK6PpYqbvG94MSYNYu0uQqf0v8DMTGl6S3o3pWISA==
X-Gm-Gg: AZFdTZe1r2p8uETPwZoOUvBAUI51woYuXh9Qu7yd0Cqh8v/4aYjgsy9PiYp2ZGmsT7o
	Bdv1elSelPr4y8MulXDq/7Zin/h5/FS/fbAf/pPiwUnJPVqla5QFJx8TQua61I5L/oZ03J4XsBt
	3xzP+U673FkwYXU1Fre/o5OB/wVMsb1g7kSMHyncJdzfKPnHSa5Qv6JgUax1OGXcDALppyVI4zS
	xOHo1v6XgXizfiqQZ7TP4M5d/BL2R8fnEl0cSqDfh0toxlhrLh+AQx13PKjYziETJ38d2HHdlLu
	jwiStMT/ccOTeffvKFK8lQZOmcEdNgLDuu4cnwUve+Ne/PsDbkhc4izk5Dq5V09jt9fP1zXZu7L
	paZqoe+A7c2dlWW0HbWMm1VZzUzXVxUf2hQTJWt2EmXA1SRa/q4vLytdnJ6xSNX100zJvlFqcLT
	7nL3OgQjFlsKDj230V3c7OezG2X+HO+ot6w3KtFG/HzqwdFz0BfXUJIHDeGZtvXnaYPc6PJdfZT
	xDkfUZFIF4Adbex1Mb1UZv+av6jNAwkpaY0khT9/Sf3kqNH22uukVWUSIDBTXuK4eDfQW/0a3rR
	o60z2ZRB9OVGYEWPdphfbuKkxyCkRQ==
X-Received: by 2002:a05:7301:6787:b0:381:ccd2:f6be with SMTP id 5a478bee46e88-38280a40c72mr551616eec.21.1794943962112;
        Tue, 17 Nov 2026 11:32:42 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:40 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 08/10] net: phy: smsc: wait for LAN83C183 power-down recovery
Date: Tue, 17 Nov 2026 11:32:21 -0800
Message-ID: <20261117193223.2795612-9-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

The LAN83C183 uses the generic PHY driver, which returns immediately
after clearing BMCR_PDOWN. Section 1.11 of the datasheet allows 500 ms
before normal operation is restored. Starting the Au1000 MAC before the
MII clocks recover can hang the MTX-1 when reopening its interface.

Add a LAN83C183 driver entry and resume callback. Wait for recovery only
when BMCR_PDOWN was actually cleared, and propagate MDIO errors without
waiting. Resuming an already awake PHY does not incur the delay.

This supplies the PHY recovery delay; it does not by itself fix the
Au1000 MAC/PHY ordering on reopen. The companion patch, "net: au1000:
keep the MAC stopped until the PHY link is ready", resumes the PHY
synchronously before MAC initialization and stops the MAC before PHY
suspend. Both changes are needed to address the MTX-1 reopen hang.
Keep this PHY change first so the recovery delay is available when the
MAC sequencing fix is applied.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/phy/Kconfig |  2 +-
 drivers/net/phy/smsc.c  | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 30e9d22c8d1a..10466b2574eb 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -421,7 +421,7 @@ config SMSC_PHY
 	tristate "SMSC PHYs"
 	select CRC16
 	help
-	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
+	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs
 
 config STE10XP
 	tristate "STMicroelectronics STe10Xp PHYs"
diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index 48487149c225..c3b51afd4b1e 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mii.h>
@@ -684,8 +685,32 @@ int smsc_phy_probe(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(smsc_phy_probe);
 
+static int lan83c183_resume(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
+	if (ret < 0)
+		return ret;
+
+	/* The PHY needs up to 500 ms to restore operation after power-down. */
+	if (ret)
+		msleep(500);
+
+	return 0;
+}
+
 static struct phy_driver smsc_phy_driver[] = {
 {
+	.phy_id		= 0x0016f840,
+	.phy_id_mask	= 0xfffffff0,
+	.name		= "SMSC LAN83C183",
+
+	.get_features	= genphy_read_abilities,
+	.suspend	= genphy_suspend,
+	.resume		= lan83c183_resume,
+	.set_loopback	= genphy_loopback,
+}, {
 	.phy_id		= 0x0007c0a0, /* OUI=0x00800f, Model#=0x0a */
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "SMSC LAN83C185",
@@ -887,6 +912,7 @@ MODULE_AUTHOR("Herbert Valerio Riedel");
 MODULE_LICENSE("GPL");
 
 static const struct mdio_device_id __maybe_unused smsc_tbl[] = {
+	{ 0x0016f840, 0xfffffff0 },
 	{ 0x0007c0a0, 0xfffffff0 },
 	{ 0x0007c0b0, 0xfffffff0 },
 	{ 0x0007c0c0, 0xfffffff0 },
-- 
2.53.0

