Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340323;
	b=YrHmArr6BXdkpEZlXsEaiXpi3xLE55QJdSFgvVaBK7RdyJKIFsQRjNl6Nur3n44xMhW2
	 OGxc/L7UD4jAsq1LASCBpXQ9AX9H66fUxOAjoxCx4WmpFkYbVCjKbmg5snA5Zd92kWg/5
	 uyhC/kq9bE84kPDbgP/o+hJmson/ZaggVq42bukA0tgZ20arIfB+5i6w8dfP812l8QT1i
	 5YhXS7+M9uCPpeRYvuVlXEkdo2HlSXWNL4FUTeIgg2ryKGs9/W20sECLPI9v2HHjKVt8b
	 3w4tLz70IifoP+p0vcRyLjdsVW8HdNKkJhFHfpYaiBusJ44Xxe3FkmN5fAzZo3VxmoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340323;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=pT6L8t7OBfjsaxsDp8IFjUH71pjXA4VhDY9ITS9295M=;
	b=ZF/I/+EadoMSP4VWycgAPy+d7WZPXLGfRKPCrPxa1xzkrABglLCQNAhCeycsu46Q0ho3
	 NTghX7tyQoUalEgZ1nbqDJKA1eEobPQNA5H7vsfEB2d1CGlKXFYF1yK+PFdgp6xjYuhrL
	 m7a/4yJG6ha9GQXyLKPNR5qxKbgwKHkmcTpJolYuv64o4NTQe5uv5QircgD8UpWoEqvcM
	 RMVVMxcPuIyaJAXqrmEt2fnZhJftb20XV6dsOKfhe7Bahef4ynDAXaoAWh6niPFUcUbM8
	 3gw+vDKvlA9T902R0TCeEZrjmBm+YIolGVMuOLXKl0BTUke6+OOXVKVKAX1/Cg/6ESA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=UIJRNxXu;
	arc=none smtp.remote-ip=66.163.187.31
Received: from sonic308-56.consmr.mail.ne1.yahoo.com (sonic308-56.consmr.mail.ne1.yahoo.com [66.163.187.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485D606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5485D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=UIJRNxXu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340321; bh=pT6L8t7OBfjsaxsDp8IFjUH71pjXA4VhDY9ITS9295M=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=UIJRNxXuxnD30H1jwUUT0/yvOZqksC64xYFfwn/G+Gb1ffeq+QMSl4lKEGRfISLrffkUKz4JFUWxwuiiVLIOml/d/ZomxIMwrYedMj35PcAWE+NnX6347t+GMValeU/zWWRZjIzm7lvbKVjRV7Il4T2I8GqMZpK5lnRFTk17Dx9JgjzhGDU/2Qox5c053bp2JxFnuWvF7dIEz/TSWEIon2W+5A/zNNgK9/2d+2WoUVvcIEmtfzr12wiDtKNgEmCSUSocymQpTXCzLmSxb9YbtrOvxXBID8AXo55VXvpDQgrgYECYwscKkabO1hmrzLrmG6KhcpJoCiDL6qd9VnwbOQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340321; bh=OMBhtgNGmJezi09SYAOSr9wLU6tR/yfPjtYJp8elRXj=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=m2cPeXsrNdYag2IstuQ0Xbfes12OLbbblohB3zZxm35U0V3B1pEB3clCeX7DJEaYntaFsMrlZjEGDEjWujEq0vJDzPQ06PikPOfZFPwYmxrTw5fbRSMJKQTlJmNbrihIyToSPknJqfEvUVKKEiRe8OJECyUnFqh0389Kzv2VFN7C7VP8nk7d3aNxsg96As6wnO0juOWGoKvteGshBbONiLChN2QDY4X0KjPadJL2s+pEE/U9meM2yjAEfTiK8vLNTOfuwtjYje7LpUjBtAniaV3cL22wji05XIijyx78SGdjElhGZGmiREZ9vmZxrWFMzFnMyETy8L5oKrmKwV2v9g==
X-YMail-OSG: DIYjFTMVM1k2AJ35Q3EfK1jtiQ1Yc7Ywfuv8_KkPcxQWXkkTwdgC6MDpSniGkhu
 E8Wq9AhzCnSJtmPpNhtX5cRkVDqzItuvhKxsspGs0UvCmeNDwSNXP.6B1Ai4YNC.2Fk3meoHOmCx
 M2uv_gJf.LO2fctCAfqvveHS9DGkQZXTPzyjD9z0R00Yevp2bMeVjDIsqeUoY3JhxhAI2oQlnJVV
 gihEOM_lEXe2u2XbWH.0v.7ucHRkYgrVv1ODHtICbqj7JGAyukFekquMLNiMw0.uV2igHTSsTRNA
 WirxxtTzrsC.tcGnl98TGToxH4UuJ1CoFTeym.7oKP8JcuUCyvN9LcWTETdv7SiSk6p6Pjn8vB0t
 4Xly7L5quf4Sh2Ye6oUJQ.EvICVAFZnU..FxYLXaktafEcM2taZb0vCJBUPvZGdpsN_M6yeZzSl5
 j4ZifMAt3nI6QmT4YHPDQnBcvzQ1cPAYotPFH_njS4b.wdawNr0nOB4axqHSqTuttUKbVEijPPZX
 u7ImJzfYYiKiqILbS_P16rJlh5dJ0SLL2re6z_tYDabvbIndAgRK4er6g5OvA.ctmSAvD5wQhOpC
 Zr1nLf7IuOfKb4uEPnpmrbeS_UW7Cu0gJpDbtoXTUpp3UVU.aHTRrhzp7eEqwGpjX6_c9Aj8teYQ
 UN7RdFuXxVfcE_ckuZ1xcr5D1nfs2wReHaBTReYZMCuH5Lu_8ZOclRLgjxKYmlCaKLNZ3ohaQKTe
 Xiyiu6y8HeT321r7OOr6RyjI277vpdBDKR4u5IovzEDfYpw1ri3oHd29MCWTmAuU2Z9sPI2grVoI
 J9EjtMCeAciFghGBJ736o2dWhevvBmk9_9xiN60B87uTztsVHPPQ47SrzHh.xKNzfs1Cinc4jYM8
 wgrGWuDNSB96gixd1_.hhUZlSnN7JDuTnM2KZO8AlkEU2N4mdAt7HnuyIczPtHiBxaj1n6hED1fZ
 WudIacJrRnYEyOt0Pll34agsMDmkGBX1d1ocyqbqyQq.LMO4gDw1cSOtEYSj4KPCTLbedT2NnF0W
 QuRa1qrHqbbobNyYlBy2s0g.FbBmXUI9XvUVhS7rXZq7HCI1XnwJ1SOr6mFTpHvL9D38YQMq3geo
 CKnQ2Qjns2jsmMIzgGnm2UbbGxu3N3SDIppDMGgltlOyrWl2S3mP5Wdb3OazeM7Iuez4cbpzaGRK
 wMmTbXrkwYvr5zNZYojwJOCG_Oy5E.jf4N9xAcKqIOV2vRpCR_Maz2SnWS7oKnnAKWgIP7jEC21I
 udOCJeMOuWJR8zCs6.gPYKZYXOIq8rk3BXHKcRmP9xNu5L3PwvBtCoGzfJCaNS_hdUjQ17SHrG6m
 Cyze0wqrvWs5mvRP5A80RlG6COeihDhYXRiBUwHQIbc261wX729UIHbpX90Gj8teTBK5rDCB_Zbh
 zlzhKDH8FFW60ajmx5.6ezG6KK0WSlpOlYqmE65DdDNXFU9_CdLK.tlBdWTmptGd738nWIJHcxZ1
 Pz7MAacMxZAnP4nSQ9g9M7ri5veB3MsfwmVSJAYYHCNb1swcTWf8rKtv5zhNv95mEgJFmV0Kdtu9
 FaZlPGyxOi986FHGVEAMybhi7JSZd3qidwh4aIzYrJ1hJ4pOflv6cJrDNo39_8kg6OMt.Z2.ZGHw
 LVGuXLdalmoWyJoxtVigqnzpSGpnJFT7r4SWmn4Cgx5Y3DV.AkgX2MeVxhExi8Rmo3Ho97rpaHEN
 2PT8HMjB1MtFRgfJq.5jrZP4xzkqoz8zuMmtG3A8WcLDaRh8MmYUaK5RyeDKoe13Chz3Bz2ZD.2S
 gUV7MlRi11TowFmAHsPHp_Db2OGZK3hhmmV_3s5i33xYn1p30J7AfOXqKFWHM1QCabHaV7pm3e_c
 sZ5Vr5kakSX6GXxTqj3sZW5ms4GWWCzva_V7iUb3eE5MQq.x.IjZYUukaCoPI4l5GI2JqW9KYLLf
 PgQ5ZilhH.7o8yTAc9lGI91VFIqLDqrFcBQaGV3wplH7.bZZc4BKhNi1HAK8bbYpYHIR7g5ciUDN
 lnzFGrbWWWS2_fxbKE0G5nSLHfXRLhv7eRGb2XgKnHpbDeWurhMRixYQJmhpzc1TsL3_2hs_KzmW
 Ng._uiogmHnLuYrueZK.Q9KqITqVFz6QXQIKFfdu_4gBZTbVtbVq2NSOs0H3g9aZAgfaqKquDDVD
 4yzZpFIeg6tAhzITMip4YuXV8XtmTisjveulWANQSPJVbn7M5z_oi.hIYWBszKGWHhP_uIXSugr3
 IUOTgXEilPdZy8ZvW7oSmhfACuKzn.8NVAVGzpojQF5i2vOVBFT5lJm6cxDHak.uS0QPuq4OK.j5
 gvbX5QXbD.Ue3x5BeDhl9X1KWIZ4sDveQB57rRiA-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 718012d7-1ff0-4e94-8843-1323725d70f4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:38:41 +0000
Received: by hermes--production-ir2-7c4859dc89-jz229 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID db412c073769945d14e1548ac88ed4c0;
          Sun, 22 Nov 2026 09:38:36 +0000 (UTC)
Message-ID: <71d657da-b94c-468b-867f-96f626a7c098@yahoo.com>
Date: Sun, 22 Nov 2026 10:38:33 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v13 03/14] net: dsa: realtek: rtl8365mb: refactor
 forcemode handling
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com>
Content-Language: pl
In-Reply-To: <3f1826f8-3096-40dd-a278-c70fce4852c8@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Move the external interface force-mode configuration behind struct
rtl8365mb_family_info, so that family D can provide its own versions
without is_d() checks in the shared code. The existing code becomes
the family C implementation and is otherwise unchanged. The
mac_link_up() and mac_link_down() callbacks call it through the family
info.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |  3 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c | 44 ++++++++++++++----------
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 7b0c710..390ff0a 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -15,6 +15,9 @@ struct rtl8365mb_family_info {
 	enum rtl8365mb_family family;
 	const struct rtl8365mb_jam_tbl_entry *jam_table;
 	size_t jam_size;
+	int (*ext_config_forcemode)(struct realtek_priv *priv, int port,
+				    bool link, int speed, int duplex,
+				    bool tx_pause, bool rx_pause);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index e101d15..0457f84 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -348,15 +348,15 @@
 #define RTL8365MB_PORT_SPEED_1000M	2
 
 /* External interface force configuration registers 0~2 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG1		0x1311 /* EXT1 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG2		0x13C4 /* EXT2 */
-#define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(_extint) \
-		((_extint) == 0 ? RTL8365MB_DIGITAL_INTERFACE_FORCE_REG0 : \
-		 (_extint) == 1 ? RTL8365MB_DIGITAL_INTERFACE_FORCE_REG1 : \
-		 (_extint) == 2 ? RTL8365MB_DIGITAL_INTERFACE_FORCE_REG2 : \
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG1		0x1311 /* EXT1 */
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG2		0x13C4 /* EXT2 */
+#define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG(_extint) \
+		((_extint) == 0 ? RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0 : \
+		 (_extint) == 1 ? RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG1 : \
+		 (_extint) == 2 ? RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG2 : \
 		 0x0)
-#define   RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK		BIT(12)
+#define   RTL8365MB_C_DIGITAL_INTERFACE_FORCE_EN_MASK		BIT(12)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_NWAY_MASK		BIT(7)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK	BIT(6)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK	BIT(5)
@@ -705,10 +705,15 @@ struct rtl8365mb_extint {
 	unsigned int supported_interfaces;
 };
 
+static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.jam_table = rtl8365mb_init_jam_8365mb_vc,
 	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
 };
 
 /**
@@ -1653,9 +1658,9 @@ static const struct phylink_pcs_ops rtl8365mb_pcs_ops = {
 	.pcs_link_up = rtl8365mb_pcs_link_up,
 };
 
-static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
-					  bool link, int speed, int duplex,
-					  bool tx_pause, bool rx_pause)
+static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause)
 {
 	const struct rtl8365mb_extint *extint =
 		rtl8365mb_get_port_extint(priv, port);
@@ -1710,7 +1715,7 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 		r_duplex = 0;
 	}
 
-	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
+	val = FIELD_PREP(RTL8365MB_C_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
 			 r_tx_pause) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
@@ -1720,7 +1725,7 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 			 r_duplex) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK, r_speed);
 	ret = regmap_write(priv->map,
-			   RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(extint->id),
+			   RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG(extint->id),
 			   val);
 	if (ret)
 		return ret;
@@ -1836,12 +1841,14 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct realtek_priv *priv = dp->ds->priv;
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_port *p;
 	struct rtl8365mb *mb;
 	u8 port = dp->index;
 	int ret;
 
 	mb = priv->chip_data;
+	fi = rtl8365mb_get_family_info(priv);
 	p = &mb->ports[port];
 	cancel_delayed_work_sync(&p->mib_work);
 
@@ -1852,8 +1859,8 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
-		ret = rtl8365mb_ext_config_forcemode(priv, port, false, 0, 0,
-						     false, false);
+		ret = fi->ext_config_forcemode(priv, port, false, 0, 0,
+					       false, false);
 		if (ret)
 			dev_err(priv->dev,
 				"failed to reset forced mode on port %d: %pe\n",
@@ -1872,12 +1879,14 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
 {
 	struct dsa_port *dp = dsa_phylink_to_port(config);
 	struct realtek_priv *priv = dp->ds->priv;
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_port *p;
 	struct rtl8365mb *mb;
 	u8 port = dp->index;
 	int ret;
 
 	mb = priv->chip_data;
+	fi = rtl8365mb_get_family_info(priv);
 	p = &mb->ports[port];
 	schedule_delayed_work(&p->mib_work, 0);
 
@@ -1887,9 +1896,8 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
-		ret = rtl8365mb_ext_config_forcemode(priv, port, true, speed,
-						     duplex, tx_pause,
-						     rx_pause);
+		ret = fi->ext_config_forcemode(priv, port, true, speed,
+					       duplex, tx_pause, rx_pause);
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to force mode on port %d: %pe\n", port,
-- 
2.53.0

