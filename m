Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168815;
	b=0T07poaD5RQSmm1CkQ4GZHtukD7AypCmT8wz3hQV9nWCmK/P/uy+0T+GDftkldZXSdAy
	 YhIh88NryX/kDJq9/xG99NNRpgT77L6yLHe364u8B9Cc6a8ZugntoHHqwJ9ZIdEZdSx+q
	 NV9dkrPnDexqFiKex/NTasE5ruL3XTFXOGQKiSTXtvLAOOO5j160tv6BMo5BRAVKdIi9z
	 9LYe5ZIq+bTkfdCkJdNQuGkPeybWxVFUYrcLrqrFnNvKTu+fcSKH9r4tLU2YILKMAXuqB
	 pSASEQIpPHiOctb3isxFKVq4JhEbUP2fw2CIsEb9LGUfDeXujgYqzam70/v6zbo1e0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168815;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status;
	bh=H2+4IjpS3NjrBbbUM/IZKDZ9xgrxFpc2MbH90tTp3lU=;
	b=wtnUuf4FJ8Ke5gvZhiHG0ky1TwMbnRcSMk53uNSYbQZZ9jaxRTwmj8V6eMjR8tIs+OR+
	 +JEHQVuuYJ7UAJobrp3huQ2myN/lzOsc2agH6vN8K11uXR70dgCorixewOGEKdCEG6Rcy
	 UUbtfwnDP93jFfAXSCb1j8s2A+wdY4C8XfqTO089Ji1gOFCkq/YFfllB21g2a8E8LIKI1
	 qTEF2SEzDdubcHMtLc1aipip3wh8yzEtq2MCYvMfrRjjGVXV3VsVSt5Di94A+jPnVChGe
	 6wUJZrZiFve0oUUkDgs9BGeOx3cC1vMA71LqLvulfvrQsEB0ptZbpt1ApwSchkV4S2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9D606A32A;
	Fri, 20 Nov 2026 10:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C9D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [14.220.232.40])
	by smtp.qiye.163.com (Hmail) with ESMTP id 556ad0d2e;
	Fri, 20 Nov 2026 18:00:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Frank <Frank.Sae@motor-comm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/2] net: phy: motorcomm: add led_brightness_set for YT8521
Date: Fri, 20 Nov 2026 18:00:00 +0800
Message-Id: <20261120100001.1568757-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa1f866296d03a2kunm70899e361e148d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTh4fVk0dH0MaTExPH0xOTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVU9LWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+

Add support for manual brightness setting on YT8521/YT8531 PHY.
Testing with on/off and heartbeat on the Radxa E20C (YT8531).

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
Changes in v2:
  Fix macro definition location
  Add missing checks for using ytphy_read_ext()
  Clear force led status in led_hw_control_set()
---
 drivers/net/phy/motorcomm.c | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index a87e83fdf590..5a0cd4d7d633 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -271,6 +271,10 @@
  */
 #define YTPHY_WCR_TYPE_PULSE			BIT(0)
 
+#define YTPHY_LED_GENERAL_CFG_REG		0xA00B
+#define YTPHY_LED_FORCE_MODE(x)			BIT((x) * 3)
+#define YTPHY_LED_FORCE_EN(x)			BIT((x) * 3 + 2)
+
 #define YTPHY_PAD_DRIVE_STRENGTH_REG		0xA010
 #define YT8531_RGMII_RXC_DS_MASK		GENMASK(15, 13)
 #define YT8531_RGMII_RXD_DS_HI_MASK		BIT(12)		/* Bit 2 of rxd_ds */
@@ -1775,6 +1779,43 @@ static int yt8531s_config_init(struct phy_device *phydev)
 	return phy_restore_page(phydev, old_page, ret);
 }
 
+static int yt8521_hw_led_on_set(struct phy_device *phydev, u8 index,
+				bool value)
+{
+	int mask, reg, val;
+
+	val = ytphy_read_ext(phydev, YTPHY_LED_GENERAL_CFG_REG);
+	if (val < 0)
+		return val;
+
+	mask = YTPHY_LED_FORCE_EN(index) | YTPHY_LED_FORCE_MODE(index);
+	if (value)
+		reg = val | mask;
+	else
+		reg = val & ~mask;
+
+	if (reg == val)
+		return 0;
+
+	return ytphy_write_ext(phydev, YTPHY_LED_GENERAL_CFG_REG, reg);
+}
+
+static int yt8521_led_brightness_set(struct phy_device *phydev, u8 index,
+				     enum led_brightness value)
+{
+	int ret;
+
+	if (index >= YT8521_MAX_LEDS)
+		return -EINVAL;
+
+	/* clear HW LED setup */
+	ret = ytphy_write_ext(phydev, YT8521_LED0_CFG_REG + index, 0);
+	if (ret < 0)
+		return ret;
+
+	return yt8521_hw_led_on_set(phydev, index, (value != LED_OFF));
+}
+
 static const unsigned long supported_trgs = (BIT(TRIGGER_NETDEV_FULL_DUPLEX) |
 					     BIT(TRIGGER_NETDEV_HALF_DUPLEX) |
 					     BIT(TRIGGER_NETDEV_LINK)        |
@@ -1801,10 +1842,15 @@ static int yt8521_led_hw_control_set(struct phy_device *phydev, u8 index,
 				     unsigned long rules)
 {
 	u16 val = 0;
+	int ret;
 
 	if (index >= YT8521_MAX_LEDS)
 		return -EINVAL;
 
+	ret = yt8521_hw_led_on_set(phydev, index, false);
+	if (ret < 0)
+		return ret;
+
 	if (test_bit(TRIGGER_NETDEV_LINK, &rules)) {
 		val |= YT8521_LED_10_ON_EN;
 		val |= YT8521_LED_100_ON_EN;
@@ -3266,6 +3312,7 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.soft_reset	= yt8521_soft_reset,
 		.suspend	= yt8521_suspend,
 		.resume		= yt8521_resume,
+		.led_brightness_set = yt8521_led_brightness_set,
 		.led_hw_is_supported = yt8521_led_hw_is_supported,
 		.led_hw_control_set = yt8521_led_hw_control_set,
 		.led_hw_control_get = yt8521_led_hw_control_get,
@@ -3288,6 +3335,7 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.get_wol	= ytphy_get_wol,
 		.set_wol	= yt8531_set_wol,
 		.link_change_notify = yt8531_link_change_notify,
+		.led_brightness_set = yt8521_led_brightness_set,
 		.led_hw_is_supported = yt8521_led_hw_is_supported,
 		.led_hw_control_set = yt8521_led_hw_control_set,
 		.led_hw_control_get = yt8521_led_hw_control_get,
-- 
2.34.1

