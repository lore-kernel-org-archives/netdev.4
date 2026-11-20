Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132850;
	b=NjClAf2KDRFqoMR6hTgSFWxJekP6vviUOWr6ihKZ96nY8G4Z68Cs90xMX0P8YpHAaKc1
	 zG0R6HKN9c29wBgY1uBdJqE30YiqJPYAsZThWtudnRJQV533R6rYHQDbTQcHkwl7R+Mr6
	 l9QvkrgkH8RSc4OV6f0xOyQvo7hYPkKMpViq4qyJsEFuCPkkTK0w6RUCrdHN7mZl2R4dl
	 wUCgEEPdmjDexSPY+kjvlm4Knu9hWceK6uGkeQpbwjXvgAPFTA/NWRn9dW6iN+MZuSRuR
	 baXzE8PrO1OsNzVwuWv1+SjnsIqwP6DbLA9z+gJ3TAOHm8OD62Yl1QI3wbPyC1z1jXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132850;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=pT6L8t7OBfjsaxsDp8IFjUH71pjXA4VhDY9ITS9295M=;
	b=eTCgTCF210OoUo8ikvABX/HWqXXemOwc3qqGsLOI2sgjSNSP+QgxYRTDjJ+bUYwiT6v0
	 X2uq6YQfEYpFJ62V4qiFYhfMlVX5ecpqrgpJ/FK4RfEnjF2hp9UOSlt3nt7D5C6atiOmt
	 +Yj9nOQCjqeJBDnUU9SD5HoNUgyBYVfoozPOyNV4RXeIB0ni7HqjujKyn3ZvQn/JPmkGf
	 TC+v+/NnQ7c0V4GZ9+1NJ6nLKK/rvnzR/mEcZPjDuu1dg+OqLywZBk/FI5X16R25AahJE
	 f62dKbvmeecWUbSlcNtsXstPcMjk1GkB4wTfy5MtaDwKlPOK3pM2YuGE0b8F2UpZEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=VgFYDSlo;
	arc=none smtp.remote-ip=66.163.191.206
Received: from sonic312-25.consmr.mail.ne1.yahoo.com (sonic312-25.consmr.mail.ne1.yahoo.com [66.163.191.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DD606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=VgFYDSlo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132849; bh=pT6L8t7OBfjsaxsDp8IFjUH71pjXA4VhDY9ITS9295M=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=VgFYDSloT96fphELmH8ofT2tEHTBT/gPL+U00NcUexGNmoc602o+Nh7WMnrTJQoRcY7mUOl6uhnxYr2PHiN3n3vAGljM172awF5QKgN07EouUl5vtqg5PLpGNeVByVNKmYYzSAMLXQZsh4QQw3YHzTAk4qRyzCKPfypIqYq/aKgzPZeO55FnxhUEy5Ecax6JDEm6G4LD6a7pvyJ+dD6i9eIFpLtlDLbuAtWCZKHyo29EIuuhQvcgxk5hWARCp3IGxSYY+oTIs+Et70PVs++btasfS+UQxmYcIKD3yN64ay3OykGumuKDntVobLXN/acQzkraT/G7gG9rBPIL3hHdNw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132849; bh=6+xmyvgXq8YBFWc0CsYizh2SrwJTSD3VHUu1eoNtblV=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=Tbi/po0pZIxOchuQT39qC36/2dWvtiDj0eXBV59qkO4gThYCjfwvDRM8flBMVg2SaXWK9f/8samj3QziBA5nCa3yr2GJpFScrj9PJrXtuh6w9YBfoi0IveNtMRRvmY0bAZe5u3tist5b4S09KCXYKzrB8pGx9ApO+lNF94hr6lfLjxEm8ulCIi18QnyVEEUGl3uoVuQZ6U5X1JTKqCiL9pV8goPewwvPYMgdY7lpiwq27GeAGyx07iXlBajEWtRuqqjt7jnAUnThuiKwJ+z0b7JHJiRPBxNS8ZJG3p/c5mXm6N3dH6rUK0Lc1mdWPy3R9AQeGJa3G5u4Y/V2HKh39A==
X-YMail-OSG: XMgeIZgVM1kVrr04BkD755OGkmjbrYUUVw6Fdfr.2E6l8CsnFkcsTQwaOGHPVol
 C8MwkntD94tGWNk4RnnuOwL1s4bLcQ6mlk9L_.XIVB0DreFuZYNbyjTJz.PpQr_4eAwrV.0bkU.z
 obgKcgGZg_mfwuZpPsFPEqhyBb_Y422NOA7ViJPysHq9OS7Mi0g7h_YTzX0DQBTjCwGaaZAa7P5Q
 16j2lxxG_csaIJh9yFmBt9puOdTWuRIG3xc3k_erxPZpYtHrTujLOHkQCQ.HD5zBPbesREXhwSeR
 yg.PDtuSM0VvBSek28NpokJlX0ABhmwoj52q14WWf7CGb39Ei_oPhrC8InQHaUaKesGpB2J1e0uv
 8mQe5dh.xD99A9ZE1WeTKpm3MupkJH9JBmNTwBaCxNPcbirOjxBtlgFUS0ZdUFfmRTj20q4jcY_6
 2zWEPYflukOlMnMOKkZM8MuU2TzL1.8___6Jru39OuE1EeEfPlxxLF9bhpLYjX2OwZd1qFflLGBN
 d5giIxgEa.DIFkz0IpdACMEvl2Zt_JWa2.4l9jPwB9rh5C__usG0Cc1PZVqlCJRgByyPM79NRVmX
 _lBW.p40HUSK_F9NTU9YZcPAZ.PfFIOn3HnOEwiOWDZME2brHvx4qKtl67eMwHYzdNZkB430WPyn
 aBf9N2ShsTGnedQ8m1e98jSGw0xbc.c2kIONkbG8oKFZPZfdoallONUXc36gTAU0kZdECgyJRRR2
 wwDiNsfPJtMNmWvNLegmfChT9fp2pwK43CJl.Ov..4929YKMLCAxxkylc4ATApR84myfEuCHzi0o
 C68ADpLeec8i4raf_wDGfp.WNSN9FsKGoNazdSs.pmH3cvAe62yi2IECAg6Bv587tbcNpxBCjoln
 oPdRV6Ys6nXi6V3NsF7AxizpWlfmyBuM73LiclJwMp6eOl1irZIv37OeRvDT7WO9EDwJzhIy5fib
 3fmujSbOHukUZa10XNcQHYmApXcapgJa1TlD_5jrhQc4g3tmqunSF_beyCDv.N8gFW.lcft0rqie
 4yb7lFHEapThoHGjLMkTItjiZwPLADkXeRUcjzrodHR_Kv_WTuLJfV4.tqD1Ihvscwbnye7jgX9V
 ozvZc25dhWnVXOU4CV7oruBmCr24aiqAWXj.g767Ioc6AokwpEvr732HauGbJhuDZWduuvPkI5M8
 JDuazcA.Rc0uYOhLr9f4rhm_BjM4QBIU77lmoxLgKw1uY33reUZwgvTJlEzVxoJ.bjYT_wFgEuWP
 QiIkI4mfd_xBt9twCFHkOxp1IIEoC3uLaTAXk1uaC7R34yr0dHWR2VcdhSvASeAtgLB.hfn6MrTX
 uzHGgE3kxgpoz8yYic5UwDHEqTOXVOcE9CtIkGMrNP89wtxRnuCuHOZZz1DzsA1zdJgp7q02bJSe
 mFx0DBq2J.7SQDNDtk60On23vAhoHqm2a7p7UQqz.LRs1XQVFJ8i3AVzcsRj2rCPEXvttCJRrd52
 sXRaAD5EiUkKfUjAa_kS91jbQlCmtwlfEkxzu3tWhg_Cx3b3kC7afaCZqsTRhXd1R8b0fEF0c49q
 aEoQxJo.3teKujaNn14V9oWc3bOffTyuguod5o0tfk3xWWAMWMdpO3IUwGOFxwM0WYFoJSrHnZN2
 OKLqdCvzwg9J2o.Jq14pHIM7FfyX00wpko2HcduaDtUnWXrcbdVjhXUVhLBfqowz08.VTWAXvOpi
 CptuM4.DAPWKWkaSxqJDnmaODKZap.RwOHJWg.C_nbpIIKBY.xoPL72CPooyLHGaQOf6xkCkZ0Q2
 .2r31t9XtItg5qJdAFh66AF6fKSw0eFGGXap0Vjjpetd5NifXu6uPyFt0olLcsY8V9icLrm06vIo
 N7JM.OF1i.uI8R5aV_amXf1.CCJwFy9t1zkuLHzAe2hX0RIIjXR1UPV5VjpXqFArnz2G7RDuR96Y
 84.wlT9.YCpS92SLrnFKKe2G4eHaTX8aCN9.o.._lQMCc0iWuldkrA04zOJuwzcQyV2Hs_38H8_e
 QrsJCT26N9r1raJwdfZ2Fer8IIJ3GCK12rQ4wRv2iGmxe86T8bBDdq0qxFl8Blt4Kya33mZyMNQ2
 BnpsGMPwJAaHuIZ5CHJT5MFlVwSRHOJoYXnMxdHa2QiaJN2Bgyh44w1vFJgrqLyNQALUhBMxbT8P
 WxZQ1QnR.ke94HIAsidAiwk2.9ELqjg52Q5z_AZZU2FUxBpdnchPyUJCurJwS2oG8MjQ98DMoX8O
 ikfQFGlNgS591jqxYa4kBxlFuME1kXY37rCdMsTTSkc5t3PxnIuR776AB4YRslO.E3wB4Ev7lpRy
 bdWH5yRVs3U8f61toIaqZKaNnuN16ObwxOFfthGzCog--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 3f19dcb7-22d5-41a3-9d9a-5fb35a8ff628
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:00:49 +0000
Received: by hermes--production-ir2-7c4859dc89-l8wgb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 32abac15188d57fd7b228b13b5d3458b;
          Fri, 20 Nov 2026 00:00:46 +0000 (UTC)
Message-ID: <b226871b-bb5a-4223-8f70-fe5392790175@yahoo.com>
Date: Fri, 20 Nov 2026 01:00:42 +0100
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
Subject: [PATCH net-next v12 03/13] net: dsa: realtek: rtl8365mb: refactor
 forcemode handling
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Language: pl
In-Reply-To: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27079 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

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

