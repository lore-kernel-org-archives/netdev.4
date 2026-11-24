Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551660;
	b=x/UHJxMUcrp+4GG9pQbgnnUP4BVQqbHBAZSKnIBRG5VecYhm0QUNyJWmq0fabA6gnqHl
	 +4t/5iTO/CMxR7irdBRWvVEeQ5Qsaa8beboJDWFdGUSccQcu/zzSerZ+kHvPUSB2vA4cN
	 tO7uCQRRy0H3jBzrFNpRqWcJRzcZjmGTsVXE/IMaTlKqrtjY6R+X0Z1JfK5eDlXDmvHFq
	 MYTkhUkS3C9CMZBBxJW0o85o5dvpCZXWi2Plj2c0AMI3+zPqcch0JbTc/Un759Agje4Op
	 1r/aLcHFNATnSfgEQtuqHdHcSLF4DyOFP/n8qGOt2QgXPxMZmq2AzSKPm4wUdIfdfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-WP-DKIM-Status:X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=LngivN6bGM3oqMrJFfOdunk1LzoqXr0HRbY0lCFpZQM=;
	b=tRfOK/OKgEujgNplAHg+pdstoQxc7q7vwhzbbkztrdR8yjj1ocUB1SC6r7Wz0HlRJqsb
	 qe9WlTYnO3OB9DQ7vqe3Ly94flvfvlO7l29WKEZARW+hV2Lw9C4VsftP1qdPbwJJMDV0l
	 vGyWMV2Cl4rw7VPt+IJ+JTK490NohgzEJ15QH8sy/6K4/DSUCdZ9/skhNllf+pnFD5MRI
	 JNQWZjduAAnWgyqRHwvlIdL0rplOo2yaXUgwmr2gIjGEZAofP58JS4o5coXcG/UIudVIG
	 OGroeyvau1ylFJXDZwzsMrvnMctWJfcsKSMNIqoq1ZhxqpV0aShYK2bRScV2HmYhYmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=FViQ53Ie;
	arc=none smtp.remote-ip=212.77.101.11
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66304606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66304606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=FViQ53Ie
Received: (wp-smtpd smtp.wp.pl 28417 invoked from network); 24 Nov 2026 21:20:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1795551656; bh=LngivN6bGM3oqMrJFfOdunk1LzoqXr0HRbY0lCFpZQM=;
          h=From:To:Cc:Subject;
          b=FViQ53IeyEkusi1JVRrD8BH4anQ24EQpRJsriJqYH/Mzy3amVYh7yWxAsTetcLevt
           sfaePQyZ37Bq667t5YYqasOiRCHFQbDhMwzzA5QorSuXpNVYtQfTJHLapn0fkMsSen
           5ZMp0j4hc6mcHxxMPL7AMPFts0/5VnzcXNPX8z2s8Y95LqitIHxvYY7JiVLfHi8+2r
           Mgt+ous7BK2mR6YNlkgJFiAcyr0wVAnIpea7kCv+WcINjIqM/u2LqvE7hq3yE3jG3w
           zlR0kdZgBaLky1+HyMyFihV/I5Wkpp/N7CBIMLEO0kUvXjPByHqKjY6g8VT+PyHQtY
           I6SMMgVkfpHGw==
Received: from abajkowski.home (83.5.167.37.ipv4.supernova.orange.pl [83.5.167.37])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <skyline@mail.ru>; 24 Nov 2026 21:20:56 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: skyline@mail.ru,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH net-next v4] net: phy: marvell: add support for PHY LEDs polarity modes
Date: Tue, 24 Nov 2026 19:11:35 +0100
Message-ID: <20261124202054.1070702-1-olek2@wp.pl>
X-Mailer: git-send-email 2.55.0
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
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: baaecd49899a60453421d37e01a1a4f7
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [UUPc]                               

Add the led_polarity_set callback for setting LED polarity. Implement
this callback for the 88E1116R, 88E1318 and 88E1510 PHYs. This should
also work on other Marvell PHYs, but I don't have access to the TRM or
the hardware.

Tested on Adapteva Paralella board with Marvell 88E1318 PHY.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
Changes in v4:
 - Throw out restiring polarity setting after hardware reset
Changes in v3:
 - Restore polarity settings after hardware reset
 - Enable polarity control on 88E1116R
Changes in v2:
 - Add support for PHY_LED_INACTIVE_HIGH_IMPEDANCE mode
---
 drivers/net/phy/marvell.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 87f66dfa92dd..00ce215bb71b 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -146,6 +146,9 @@
 #define MII_88E1318S_PHY_LED_FUNC_ON		(0x9)
 #define MII_88E1318S_PHY_LED_FUNC_HI_Z		(0xa)
 #define MII_88E1318S_PHY_LED_FUNC_BLINK		(0xb)
+#define MII_88E1318S_PHY_LED_POL		0x11
+#define MII_88E1318S_PHY_LED_POL_ACT_HIGH(idx)	BIT(2 * (idx))
+#define MII_88E1318S_PHY_LED_POL_HIGH_IMP(idx)	BIT(2 * (idx) + 1)
 #define MII_88E1318S_PHY_LED_TCR		0x12
 #define MII_88E1318S_PHY_LED_TCR_FORCE_INT	BIT(15)
 #define MII_88E1318S_PHY_LED_TCR_INTn_ENABLE	BIT(7)
@@ -301,6 +304,8 @@
 #define NB_FIBER_STATS	1
 #define NB_STAT_MAX	3
 
+#define M88E1318S_MAX_LEDS	3
+
 MODULE_DESCRIPTION("Marvell PHY driver");
 MODULE_AUTHOR("Andy Fleming");
 MODULE_LICENSE("GPL");
@@ -3625,7 +3630,7 @@ static int m88e1318_led_hw_control_get(struct phy_device *phydev, u8 index,
 {
 	int mode, reg;
 
-	if (index > 2)
+	if (index >= M88E1318S_MAX_LEDS)
 		return -EINVAL;
 
 	reg = phy_read_paged(phydev, MII_MARVELL_LED_PAGE,
@@ -3638,6 +3643,36 @@ static int m88e1318_led_hw_control_get(struct phy_device *phydev, u8 index,
 	return marvell_get_led_rules(index, rules, mode);
 }
 
+static int m88e1318_led_polarity_set(struct phy_device *phydev, int index,
+				     unsigned long modes)
+{
+	u16 val = 0;
+	u32 mode;
+
+	if (index >= M88E1318S_MAX_LEDS)
+		return -EINVAL;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			break;
+		case PHY_LED_ACTIVE_HIGH:
+			val |= MII_88E1318S_PHY_LED_POL_ACT_HIGH(index);
+			break;
+		case PHY_LED_INACTIVE_HIGH_IMPEDANCE:
+			val |= MII_88E1318S_PHY_LED_POL_HIGH_IMP(index);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
+				MII_88E1318S_PHY_LED_POL,
+				MII_88E1318S_PHY_LED_POL_ACT_HIGH(index) |
+				MII_88E1318S_PHY_LED_POL_HIGH_IMP(index), val);
+}
+
 static int marvell_probe(struct phy_device *phydev)
 {
 	struct marvell_priv *priv;
@@ -3886,6 +3921,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.led_polarity_set = m88e1318_led_polarity_set,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1145,
@@ -3971,6 +4007,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.led_polarity_set = m88e1318_led_polarity_set,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1510,
@@ -4005,6 +4042,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.led_polarity_set = m88e1318_led_polarity_set,
 		.attach_mii_port = m88e1510_attach_mii_port,
 	},
 	{
-- 
2.55.0

