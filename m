Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823964;
	b=tYcujwdyHd/JTdjcHBPaItNmukcPURggk5dhcuKckQyzbkPUV8Zt+MOU88wLvUw8D5Kv
	 eOayPgnupOx8yPJ3jpzb+nVpQLVJAL26+brOaDW5Z8HoJhIiFweLZ9xD3JTvdTh9xlatA
	 TzdSVPQNtGi5nt51wZdNxEkFtN1/9Wz8khzFTJWvhXeH60/vo4DLthmnGTor/Ypfo1mrm
	 OjsmmXD95I1qvT0TIfzzDsaqo9nLIFSPY9aSazvvdEy8kS4E4vpcGk06rdh8lalP3zCEX
	 J4Jx3AKm6uMEuZr265FADUY6yTPg4CqoLKr9s1z7i5larcQ966mOhu2Yx0XJcHHygPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823964;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=ylbahu7Qs7qrreHuGEl3s7gWFY2Z3JlH3laCfR0hizg=;
	b=XyQC3OxmBAPUB0g2lD/SzDlqwPPqnAurCYTErAH0AsjAwUh0e3Sw2Gs9ypYAm5vgQUSF
	 XJvE0bVQZ+ncSd4YjeRHK5uk4qKdsxFqnd/8epNs3GHgCUhv7KnfLlGmuWg57zhGzfk0n
	 wMEaUtMRgZtH9SjOtHPNqbMdmCYebTyfPKrt/cPhIIu5nb/U32aqi+TW6SKl5dFKqU35E
	 UteH1QhHNIUFGPsD1o3UhSKP5RgJ4KnLLimoKJ4ZxkpVDS8w6VS4fDuRFJxk+KIjc7kKB
	 8NgzEdOJWNFGv6gMew2ToPcXPmaHGSAqTM0MFMAUHgzbgTtWCCy/Y7LNJsAxSLCDp0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CjxPGzXW;
	arc=none smtp.remote-ip=66.163.191.205
Received: from sonic312-24.consmr.mail.ne1.yahoo.com (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBD0606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CjxPGzXW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795823963; bh=ylbahu7Qs7qrreHuGEl3s7gWFY2Z3JlH3laCfR0hizg=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=CjxPGzXWxdfQ3e13eUvsE0TY8Zn3bcEll4MsFpzyXhKwz+FA+l8tZ7+ZnyoaG4gQ1SdzK5i86Mk9Dj+PR54QEn73wahjK8/A0SAn88Xk4pzOI4Bh9uaU6MxpxqPkzoQGXUXg3/xr/toI19K0+WnThQF+t0NQbNwj4NTaxlT/YGs8v18NZu6w18ynblgdlDcRLYKmej5vSzvoLV9fdGq095lqFc+zd4ZmTXi1BtePpTqlIst/N90jfYm4uwezgLvxaqQAc6zqWsZq5nIUbOFWDTjaBMtIkRQo5b13J9r3RUO5rrVOP56g5VCxsM5OPDHpjtbgiwzUIUxv+/+x+cazTg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795823963; bh=K83ba0J7irkK+SAeHRyXdyccJ4z5ClpiMnmE3uWxFsW=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=PCrtUUxRRkh6e2rezOSE4HbvaFmGpzJccUZ+x+SsGUAyrGp2c4RfQpr6EXyTy45gjo11y4fn0s5MYDtgNWQrspQlBtsXWJxnvQEvSajI6m8yTGHjtINFzj9JVyNeZ6aOHppQc7pAnfgjn0G6Y2JA+r489Rr8xNBsp0s6DvzZQBu/fqaHndSr2Hp6s4lNvwaE3OBxx3qtC3WOV1YPDLs1Ubdz9ybn7YIB5e8l4ruFN0ixeh/Zronksl+JhrQahgwvwyZDRp1JXFB4kw+/n7s0djHE7RXv4RbejfaXDgHDfuNnqnGY9zpU6OIIAtzqh3cEWHkcjdH8MYuNSaW9myzADg==
X-YMail-OSG: 3yBy9LIVM1k00isrS6lOFnLgxWsfy_Hfxto8y4glCdABdm4RbIWNY9Dty6CnmFa
 _naXSXC8nmfClt7JN6_5e2MNd69gXNQDovRM_8MEUbPlHnO4HndDyMvvmvqDpsc.ZyCyCm_rveuv
 7E8Irq.DzMNlQGyFUntNNQqadZV6KbH7oR9u18Ceebn3V.u_GIOHVuLdJsnb7SPojdT1yp4MqtB0
 U9Y7bbo6CHRBsiooLE.tGlcfrKhDcFZonIi1Li8a52MvabHj79Al6kAi65ZcAychzz1H6a9Yyp.B
 1FKcbhI_1hvUV2r0.CxTiMYMztvC1MQfnNIeSAhQP8taCtEFrGiIUVQ6useOVm02Nxcjyg6nzIIY
 Liz1kcMypg89NBYdTHUcA3ORCVki5rLKLCJu.XpctG93PhLLduaHt9Li7qXgeCFkrN4uW2.aeKpB
 A5do9jpYkoftZAFv4Jwy.wI_Ip4myVGWOuMAz9IyuJ9lJhNMXuBHUWyvqBoRiDcA420f8_jsUU2l
 ZzpoyVqxvBfYICpPx2kthjSZghu2rIhekiy355B5YS_nFYKomv.UnsdtSjdk7uFH65D4yQFmj8gr
 5DETLMYzGUL2haNYGI3tQde7lY_11MJd11oDP.hpKrPLqVmbSLUL6v1Fz4LrveR_dFTA9PTxcYmg
 JctRRttbDYVRB3QZH2fvP8Tijq_lDPLwY99LrzuFK0sQ3EitJTseDsgt8XQYELeENNd0boUWmDwD
 Ca3ppa9RXy9bV_EVTYyP2eqP9gddD0qe8IMtPdcxsJqYFphj1LfMznsFVUkCBdGiXVr1SH7mp8E8
 Idyhv2ZA3Wl3oPmbveHqgIdpw2HCNFhHjy789NNfmD1LR2K2orEAIRpzBLIA0MCoM3LLLgisbPkW
 p48ZN4fEKufbiDrJNqcPLRMV0eyuUMlT3qUx_7_NkEBidCkkbJeMpwkNdkTeyHGsRvfk6jFAVEef
 IkJCXSlBQG.P1.PODeCcjc_LfXJgCidxEuV0KqotrW0.tEqPDp3JdnM3QoLPFX.aU1gpOoZqB9Pt
 J75F_99J1DGhnGgl1FRy1WVZIRdZHFkH5qLLRAOnvsODKwrA2X6Ereuj6T.MtLSOYto.jNUigHwi
 ef.iduG5ZwqMi7j5GKYKvv66HIwC5ggpazREWHdUepiRwOe4sl8W7dcuXdtrh64qFAbm9RPFb43R
 gq0uGcw7cyIwU5Pt1bgwZ3TgBVsyxH9nj9AJHdgBpER4XnDoHaGuC9OVcFOHwbXJLtvhFjCPXcNL
 RObbyrA63UhHdsx4tPanleeXoPw7QJn1wCQtiN7tVg1WXHq0NIX2ljIceWmLmmonbpdsGzXl_T6K
 AbO_k0WgwhCvfRX2o1aNqSGHRYUWDRXNJIwJgs5jPRA1v0RkmY31kNHeY4F98kdVYyCsn3MCSV0_
 vQBKcpDiErtwhFA8zJtEJdbjaPQxiwGY2OH7Zm0FsnHXLZx4DrKP.eC8R4zlJe4qWyxW42IOsLv2
 0YaAeoALjiwdNMrHl1evs0UUie2sDKrcsJJMhP05V2tR_5hF.OgBn.wKShDgt8K99DBStenBVVZ6
 KzdsQssSPm8eTudAc9ueVjB0AtJEqEEjQuZfBUvcX8N6J6T5IFXvyQV7A_89q0hQ_CjDYqB8RJZQ
 _GHRc.VCAW1F0b9qV.amtSpiWH6F2qV.DIfnnHunofAPODTt.qJNfkbS8HZPeh.YEEzJEsSFIVDq
 cqAoLU2ZZjOgDyRjfK2AVVQTRqHcgJoUHeEOxC5lb6EVUaRJw4vMIV53t3q9nXfnJFzXUKcpjeVV
 ajqJ0Z8gVOzuMz095sPII9LvaSteUHj.ZbTri9jMqYllmqEfstse1_dJHWPBFrIVPuYrkak5e9TP
 BlyHGExHLRLnJtL_fCz_DRCqaBOJE2tmpSSXQuA0rE.xbsk2i7R56xouNh2dKtNNb48A_F2uEw7_
 mXISUfuO9_yDJazie4xWCBUZBgJLHY.qpGqUl40rdXiNbO_XGzwv4w9s.IkR8PYJJM9z3Mmjc8ao
 GzzFi36Rbk15wwaJV8Aarm85KK1Do2mYrZnka8KaV0PId3DS48cUJcAae_4I6p9vr6VGWzEk8_74
 7wrqvCVRZV9ZtmLeHXACmkc13CitwXvq_upXxoAX0mPqX3a955WdScDaPO9Koel7WoKKM5dHCGX2
 CbPQYyTlGVfzmPKpfaB6tZjrwu9CE9Y6UrtDKZ5DAKDqQrolVcWXCJQSXtrEiksqOxyAVxxQ3OBr
 IyXeeS0epauQ.22bGZbL3TPM8yy6F8B3c9.gjK3RrRKnPJQcxgMRX5C0CoT7hzPENPzMHD2lWAfg
 4cz36A_7PdWTUxQa2DjLSs7zDT4FLmyQBP1yuW30-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 891945ab-9f90-4cd1-8da9-e5dfb847b13e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 27 Nov 2026 23:59:23 +0000
Received: by hermes--production-ir2-7c4859dc89-2g7rg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4632231787eccb94e01573e271c94401;
          Fri, 27 Nov 2026 23:59:16 +0000 (UTC)
Message-ID: <d67ca8c6-884d-4394-b81a-ecca6de44fb6@yahoo.com>
Date: Sat, 28 Nov 2026 00:59:14 +0100
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
Subject: [PATCH net-next v15 03/15] net: dsa: realtek: rtl8365mb: refactor
 forcemode handling
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
References: <790b9ea4-09d9-4a57-a393-cf10d58ed8cf@yahoo.com>
Content-Language: pl
In-Reply-To: <790b9ea4-09d9-4a57-a393-cf10d58ed8cf@yahoo.com>
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
index 19bba90..05b84a5 100644
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
@@ -701,10 +701,15 @@ struct rtl8365mb_extint {
 	unsigned int supported_interfaces;
 };
 
+static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.jam_table = rtl8365mb_c_init_jam,
 	.jam_size = ARRAY_SIZE(rtl8365mb_c_init_jam),
+	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
 };
 
 /**
@@ -1649,9 +1654,9 @@ static const struct phylink_pcs_ops rtl8365mb_pcs_ops = {
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
@@ -1706,7 +1711,7 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 		r_duplex = 0;
 	}
 
-	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
+	val = FIELD_PREP(RTL8365MB_C_DIGITAL_INTERFACE_FORCE_EN_MASK, 1) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
 			 r_tx_pause) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
@@ -1716,7 +1721,7 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
 			 r_duplex) |
 	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK, r_speed);
 	ret = regmap_write(priv->map,
-			   RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(extint->id),
+			   RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG(extint->id),
 			   val);
 	if (ret)
 		return ret;
@@ -1832,12 +1837,14 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
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
 
@@ -1848,8 +1855,8 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
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
@@ -1868,12 +1875,14 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
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
 
@@ -1883,9 +1892,8 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
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

