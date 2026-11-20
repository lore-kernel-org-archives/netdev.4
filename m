Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.190.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132905;
	b=QXrw8f6/mj/aly7UCjocFY5u7LxkYL1kFLco/4Skpe0SnuW1GADnVl0kJw2ie0D3OBdR
	 OnrFi8rwdx+kKKSEeZLgZVRFhNQ34Mq5mHFiuWvUwv8VEB/jmlrzoFF6n6tiftB8Q+xOT
	 8fVuRZ8/XjPR5LS3sJyZWujlK1kbksDnIuT0T3uy8ba1+ZElacF3XVEn9f0DUNFpUmnTA
	 1r7P5PX3K4NkE6hD4hqqymLfBvYlAxEc2h7Y+6KE57cKXtE2IbR9bk8AeChsgj6zFfzeQ
	 FZ4o31wNW/GKWT/1RUQMWqbhkklK2YtwWmRrlGmxU7ar6aTvyoudq5+EDIkzkk9vqwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132905;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=6/HVcooRKimsr1B3zu2/RYwE+H54hE0OAuaV4V17dQA=;
	b=npNOWIGmtxp10mkWOaB9DS0IZZbrsl2g/UoCy+zlhJPy0pQB1kQO5Z6ppSm5lF473XI2
	 gMM3euhnAGLl5+Lg89+htm5GMoGXApC3Es2PIeei5upWLmGQNvivmg3IulCs5UMULeNBq
	 73Bm173s3YBM+WN/a4vX6ntGJ30M0Li6vqGoVaF+WqwcNu7dU+Ah1goDmSLRtrVtB74sc
	 dTG1/UOLs/Mh1RR8jR6VRPZYltLWoUj3VTMxBuU55Kc45V2crJ2jZVXZanvewazEVdi0Q
	 U3yMqgZVThcA7xjtEOi7FyB/mT/hM9QOjvSmozYJHk6R55NYHlGrLW76/htDRYQ+YEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rvlRtS+i;
	arc=none smtp.remote-ip=66.163.190.33
Received: from sonic307-10.consmr.mail.ne1.yahoo.com (sonic307-10.consmr.mail.ne1.yahoo.com [66.163.190.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B05E606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B05E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rvlRtS+i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132903; bh=6/HVcooRKimsr1B3zu2/RYwE+H54hE0OAuaV4V17dQA=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=rvlRtS+ix87U3Cbq9l24PeTKUYgPrmmIXR678Zhh8u2so1bOagfbY1NCh4zo8N5qtY+7L05WxI/9MPbcRYqZpcnvVRhjVGaPEFZ0sIPatFM8OhqwViIxGpBuhfra+2/R3to+931Xaq4wspYGOFGHkOQ3mbeeqyzqHH/+C1BH76XaemcEFDeiFGgwRgX2vneC8wzxHpfyob8fNBMa2eKdRC408y+JIcDS2qRjRUy08luayv3Jkeg/pN64NCsnIgxp9cpMoGnTgRgxCjqv97REh53tCHwPyRDAGr6VR+NVxXMilK6PRjhxRd0+i4lG24UN4ci4OuAv7M/1s1sSd40CEA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132903; bh=+IYV8gqiRsjVnHRaBIrCkoE/gWebp6DhtpqSdMwwHoP=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=XgMMV6/o4HEeIdvgbyCJnw5g8qycHkdx0VOIwil+6KgDNe0OqhkHa1aEEX1aFnzUuVgO7Yt36QMwwP+iCAaGLE4IIWK3eu488mmwJMdEPnO8WtwYRJjwcDUNHlrVP8a1J0xCu9r444Hce0n7SeJC5/Zxbah0WLBnEdwarWOTIHsFDurjFlhrhjPv7NTfgO2sItJxktzIq6vAtIB1GtL1UHztjETPshKMXEsHe1CrCjwJuqjBXTT0HkQ8+nvYhyDmIaU+n2bmJWGjYrBdF14eYlWAwjsiREAWcVL5RUpvhLg/t5WT21K+Ci/JFIg3o9wUSEsOnmlsTBlIESNatYctGQ==
X-YMail-OSG: ECXCy1AVM1mX4vfu7AnTuMDMHJs52a.DTRMf5OF0ILsOQRa2Zn2nP1wQpwZfA3o
 QPKmd0I56PKwcLMbeGM9_wWK7lxPbeaqYe0Y2XT0ibudCwBFUrjiEtYX3rt8IuoVnCqcd9FmBaCe
 jJI6qUSWHkb6NvIRzSTJSwTu8EM8oKLbE3tBXFdHe1t7lDa.kbOEcAqVjxHRQW_BpIQKFsttd6IO
 UbvpmmJDOinzZT1sq7xTYgzU9OjBEV7zrTtngNK0ox_Vqnpj_yRk_PmNBo0fqNZWKRpoCoT1PG0T
 zRdFXDgSxWA0ExO3O99X3lUOl1T6XHf7b3Td8z6xDRIJPqSu34qSzTSQMQhClbibt.1J72hUyo9x
 ZpYBB74PSeMZOIwIWpBvZ.pA17Rq_kPra7LINc4OLtU6CrnHL4ztKnG.YplQoOiEH1z7UBq9ALZh
 Aryi_sKDG7J61nO9kEOV7YjIeSOfQjwGSf4S4O5hbhFAL3rcVfhM_MW862QJaLTvh5ecJ2U8n6jI
 Ycrb47pFQJa.jZW3IpAUkXAIKiIJlYGtTk.q2LXvS7lcUJvaXpXtwzisQsHOKj20hln3ABHxa5fj
 iHiHXAE1hWW6xMsoUdkTovGOT9TDJRsvgrXOxHEgrJYTsV1pc7xDbMs52dnP9WANVWW_kght9.j4
 P8rfcRsOezkSsPBnSvwpV_aqmOIecjuoLYB6dvjpy_jfiNZI25nWcWTzbpurm.5znHn42mx1AeVb
 3dl70jauiXO2FRB0c3xdZtpw3I6CTHBDhODJh0WM.26j39cNuzzJC245gf8t44UAPXSFC1509xgd
 .77K_jSOvvL1hrTFJzIAknloSzBsfmyVaQ3oPXui1uHd5Vqq5_APixQX_IN4MpNeMaVdtGM7_kzQ
 IZyo8IIG3R5nj2IUDoDG6CiysCFKgJ2ToHKOQCLmE3xs8P8ZQ8VPWivq2FgjbnQQNZa37hvahnSE
 IWLtIvmObZpWTkOkyGijzHSbE.Jj9IVwN7Zg3FVbKUW6n1A6WzdLVHs2q_F4giyKlIGEK7sJtCMk
 koi1dMZvXNHsog0GwNzyrGY15ecibvNk5tCKqnmzUky8yXQ0CN40wfO8mHQ.XHCu_hhfqy4q_4jt
 kDUjC9HCA.STSg08V.qg7Ti0KYGjx08jGSGnE2UJ5qPShiO_EQ0WFBz_p5dfabeCH.S9nR.mvaJG
 BADJPwLkkD8lhCHKmH1jBPjVULZHXmZlMwO_pBO2NmSAjbS4dAc0OFeFVUqafpvjCaIhgHYk9MtJ
 Sjvibv0II51of4JQIQ7hNu0VNKZyQzPAC.dX.TM3.w.xz0y4SN6OSs7gLluzw4vOIIPAYFov75gu
 Il1o9V9IXvvyWDIF7ZjaZLgt8w0xe4S8FV8w2H2ZVUeNTNxj8TvrF_i.NmCT3H_EJArBlyJzNeLl
 OS2u_MWE2b_c6_8W3X9uk8Y1IYru5tzcybU_c71frDGrsPxsQL4ifB2YaXV6R8EXU4zPvCQicDkN
 .DNZJwSUdxOZ_GrQKo_unCUHb4Ww6yTCzFV.nNs2ek7Z6uXqLz9v8CW2fBM99p5g.pblJk82oD7o
 BB.P5hGjhQT6FQbIxzgxuP_DsrKyvghjOIKN2IwyFlXlTmuI_AQFmCR5PZuZz4mECw_gMExbffj9
 aPNdL_ImWfF5Knu.gBoFSUfQWDyKj1Q9EhDVpEMyvlJXOT_OlB1VJuxvs0wLiS2UC_0pfYWpkc0H
 6O.I_RD4Qezlrf7UsABqpSLVnnBYdgMixTDKtQGSJE.gK9xPSVI_8h3ZaTqvMtqVlZVY9NTGlR2J
 ng77DZPJSAtNWT0zV2TXCswWttHEbyRbj3VXljHUVeS.SXJ2iZaOhMzUz9lwOIVi62EikfRSpeR6
 3Uq5zOhq7tHB40Z6nnDxFtPhGRVyXxc7G5V0CPBlT_gzZaC7BJ6F_W.jIpIFSVyj27fWmqwVeD5b
 gVuq_LrhoMMOstIhXnmIdOL9ovszEfWZu3eUlmPTbNw.SdjfDxDXE68cHsL0HMj7nHACOoIhPfU6
 Uzkcrnv4wE0VZod8yHdE3UmslJ9OrxZO.EHEr1vTaTKIwz_fN27kzElE8E5y8panu_7JmTDgfkZJ
 MPl45Hq7AcwAX0GQYWnUa14pOBkuJjXfFhl4volBDP8wrIZIY3eKrXdBG_9k.w.wJ.h_HVrU1Yvj
 AzotIB0wac.XGtLgxNjBQ.3janccWWxhTPgcH9FK2EZiJW3gD9wJqI02tkG6IKwywGX.yWR2WMp0
 PLKcXEfqcpSVdQDKjroIuh4j1D4WeydUy6CVFDmO6DsUBA_IaGygcZl68S1RQZnV4QzYeIdAqTxh
 7Jww_Q4AuN7S85evIQD7bLDom123_IQBaYYmVSZAs6g--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 4cdea3ef-1573-471e-bd41-ac1eb1c95b2c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:01:43 +0000
Received: by hermes--production-ir2-7c4859dc89-4mhg8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7e20e268a9ecdb98361e9bff89e4fb6f;
          Fri, 20 Nov 2026 00:01:40 +0000 (UTC)
Message-ID: <d216314d-01d9-42df-9844-859b7ad3c140@yahoo.com>
Date: Fri, 20 Nov 2026 01:01:37 +0100
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
Subject: [PATCH net-next v12 04/13] net: dsa: realtek: rtl8365mb: set speed
 for family D
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

On family C hardware, forcing a 2.5 Gbps link speed requires relying
strictly on the HSGMII SerDes configuration block, while forcing a dummy
1 Gbps value inside the standard digital interface register. Family D
introduces a dedicated hardware link speed value (5) for 2500M. The speed
bitfield width has been expanded to 3 bits, splitting the most significant
bit into a new separate register field (FORCE_SPEED2), which maps directly
to a distinct per-port digital interface force layout.

On family D the forced-mode configuration (link, duplex, pause, speed)
is written to a per-port register at 0x12c0 + port instead of the
per-extint register. The bit positions of TXPAUSE, RXPAUSE, LINK, DUPLEX
and the low two speed bits are the same as on family C; the upper speed
bits go to bits 13:12 (FORCE_SPEED2), so FORCE_EN (bit 12 on family C)
is not set. A second per-port register at 0x12c8 + port enables the
forced mode: the vendor RTL8367D API writes 0xFFFF there when the MAC
is forced and 0 otherwise. This driver always forces the MAC, as on
family C, so it writes 0xFFFF on every call, including link down.

Add the family D implementation as rtl8365mb_d_ext_config_forcemode().
The shared code reaches it through the ext_config_forcemode pointer in
struct rtl8365mb_family_info, so it needs no is_d() check.

Nothing points to it until the family D info is added together with the
chip table entry in the last patch. Until then it is not static and is
declared in rtl8365mb.h, so that the build does not warn about an unused
function.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   4 +
 drivers/net/dsa/realtek/rtl8365mb_main.c | 110 +++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 390ff0a..a9bf4f2 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -23,6 +23,10 @@ struct rtl8365mb_family_info {
 const struct rtl8365mb_family_info *
 rtl8365mb_get_family_info(struct realtek_priv *priv);
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause);
+
 static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
 {
 	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 0457f84..05db3dd 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -346,6 +346,8 @@
 #define RTL8365MB_PORT_SPEED_10M	0
 #define RTL8365MB_PORT_SPEED_100M	1
 #define RTL8365MB_PORT_SPEED_1000M	2
+#define RTL8365MB_D_PORT_SPEED_2500M	5
+#define RTL8365MB_D_PORT_SPEED_MSB_MASK	BIT(2)
 
 /* External interface force configuration registers 0~2 */
 #define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
@@ -364,6 +366,26 @@
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK		BIT(2)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK		GENMASK(1, 0)
 
+/* bits[13:12]; bit 13 reserved, no defined speed value uses it yet */
+#define   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK	GENMASK(13, 12)
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE		0x12c0
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE + (_port))
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE		0x12c8
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE + (_port))
+
+/* Per-port force-mode enable. The vendor RTL8367D API
+ * (dal_rtl8367d_port_macForceLink_set()) treats it as an on/off switch for
+ * the whole forced configuration: all bits set when the MAC is forced, zero
+ * when it is not. The meaning of the individual bits is not documented.
+ * This driver always forces the MAC, as on family C, so all bits are set
+ * on every call, including link down.
+ */
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK	GENMASK(15, 0)
+
 /* CPU port mask register - controls which ports are treated as CPU ports */
 #define RTL8365MB_CPU_PORT_MASK_REG	0x1219
 #define   RTL8365MB_CPU_PORT_MASK_MASK	RTL8365MB_PORT_MASK
@@ -1733,6 +1755,94 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause)
+{
+	const struct rtl8365mb_extint *extint =
+		rtl8365mb_get_port_extint(priv, port);
+	u32 r_tx_pause;
+	u32 r_rx_pause;
+	u32 r_duplex;
+	u32 r_speed;
+	u32 r_link;
+	int val;
+	int ret;
+
+	if (!extint)
+		return -ENODEV;
+
+	if (link) {
+		/* Force the link up with the desired configuration */
+		r_link = 1;
+		r_rx_pause = rx_pause ? 1 : 0;
+		r_tx_pause = tx_pause ? 1 : 0;
+
+		if (speed == SPEED_2500) {
+			r_speed = RTL8365MB_D_PORT_SPEED_2500M;
+		} else if (speed == SPEED_1000) {
+			r_speed = RTL8365MB_PORT_SPEED_1000M;
+		} else if (speed == SPEED_100) {
+			r_speed = RTL8365MB_PORT_SPEED_100M;
+		} else if (speed == SPEED_10) {
+			r_speed = RTL8365MB_PORT_SPEED_10M;
+		} else {
+			dev_err(priv->dev, "unsupported port speed %s\n",
+				phy_speed_to_str(speed));
+			return -EINVAL;
+		}
+
+		if (duplex == DUPLEX_FULL) {
+			r_duplex = 1;
+		} else if (duplex == DUPLEX_HALF) {
+			r_duplex = 0;
+		} else {
+			dev_err(priv->dev, "unsupported duplex %s\n",
+				phy_duplex_to_str(duplex));
+			return -EINVAL;
+		}
+	} else {
+		/* Force the link down and reset any programmed configuration */
+		r_link = 0;
+		r_tx_pause = 0;
+		r_rx_pause = 0;
+		r_speed = 0;
+		r_duplex = 0;
+	}
+
+	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
+			 r_tx_pause) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
+			 r_rx_pause) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK, r_link) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK,
+			 r_duplex) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK,
+			 r_speed &
+			 RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK);
+
+	/* Speed is 3 bits on family D: bits[1:0] go into FORCE_SPEED,
+	 * bit[2] goes into FORCE_SPEED2 (register bit 12); only 2500M
+	 * sets it. Register bit 13 is reserved.
+	 */
+	val |= FIELD_PREP(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK,
+			  FIELD_GET(RTL8365MB_D_PORT_SPEED_MSB_MASK,
+				    r_speed));
+	ret = regmap_write(priv->map,
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(port),
+			   val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->map,
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(port),
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 				       struct phylink_config *config)
 {
-- 
2.53.0

