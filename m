Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565026;
	b=QugnQ5WJ5GE0xFhnvUjXgzMy/m7oUefa0RCbxVy/L2hMhSlIcoZSeoEzZ0EfyNqCOTvp
	 jmMclfm2WWjeDn1hkaXNEXvel5TXoQKMUSJAI7ym6DlTYTat388PIdutmY4CMe3ojNWyj
	 x2p4IOMy7qVSFpbI24s3deOD8jWKQYVHDVYEpmNDL7fsnB33bVIdIMqPG92A7f88dXA8v
	 Ra013NF2khqwzMgEyIUBWTbbdUTIhS19hKibGS2SYvVzuvHfc1lu3u/sC9T8joiU3Uf2i
	 JlZxSDOK1DAxkfPHSYtHJXswogl0jK4EaqmM1zOchvdTc/sTNwvWHzpXoAJFVqqEc+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565026;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=f0Okf0xqXSjYzov9wALBCTi3Z/ecDveM2MLJChLi/Wo=;
	b=IG1HOKosavoc6a7WFn3QmFJ99+P5TwldLK1DlAxrBUuXQVWefGzQ9kJlKBTThCfKkIrA
	 YWT6Xi/NeOKEuGPau7kFKqRKzdKpoRqlLIOxFUr0xFnGJSXouoqBUrGsc7PBii5ukS84s
	 nWQJmb/6ENOpHWOAJZHtiuZssvM+S8sAuGCjYUTT8ILVdxBKy8A79W5UHqLTLzzXIxC3S
	 RhbojkPf1rzqbOsTNIhYgQI9uys+EgiwmdVXdZetoVH4by8RGp6hdqm7yRyamuDtM5V2/
	 axYW/ZcpttX5G5CZvEKnrWJO28kUoKCHkxGv4HI1AVk3rAOTXHJvsxqRAYUJL0SDojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="olulo/BM";
	arc=none smtp.remote-ip=66.163.187.33
Received: from sonic308-10.consmr.mail.ne1.yahoo.com (sonic308-10.consmr.mail.ne1.yahoo.com [66.163.187.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC697606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC697606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=olulo/BM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565025; bh=f0Okf0xqXSjYzov9wALBCTi3Z/ecDveM2MLJChLi/Wo=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=olulo/BMm7U8S/ibpCY0ogZSUlqmLc7AsxFc4n/SnRNNcBDWK/4ZmOfOs7ur6768+O1bYIZYVnoL7jZOXWWmZbcL0YwlXJ1RYxqhLZN7nO+NNf+Sx0UvEc1hnpBnFLCWkYQtj4NtFsuz4gofe9rR8IYMV6wNIXhbx/5/KKWvuNIOnPAQARJL4RJKjijEBeTjmZICpWYjGWedguVzOqOKPv5haFG6SCwQAAzFbQeLAD4INdhAVdUlx6cmZA/EaETS9PcOugEVvIOx+uXsILnz1dVeHHXZ7c1Qp49jNPvKhTMAtPRteYciUk8a3frUGW2S4wbs7o3RDTy61qgp65R9Yg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565025; bh=1f0AjwQe7qjfrUtNitjoyHVKMTD/Tv21qph3yxV59J3=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=mOXYK90jybxwCPjnI/TOmru0WNr+5cuA5/qIf/PVOXpoHjO47Cg9G4075Q2UNqpWnFzhWMlgHphMzcbEEh0ykujbFPmxCD9GU0vK/ps6QyjS3KDoYaexO5kRKQWs62tdfNPUI7jeePwo0MUsdlzASIWnuPUJWctkJn8SvrBt5VEfDEDrnbToR3DRGmGaMMEOGFyx14H81CxfuSlq84y+ZGs8BFYDz9BgZt/W7WnHGR4gU/FZBHNhHDVPzaAWMi1YiYlQqiAD3yOPv0G85u3KJUFqd05D87OWxzPwZNQk/pzvvUaWmBCDJSVqVFaUWJeyQ6h+vPDerY0YgXXvv1uy4g==
X-YMail-OSG: PmzMQY0VM1ltLYAMmMHbTzUgOrgYiVcfOWZpk3_tNAEH1DmC9kJYoUWsEGFQ692
 6v9qx5fv.hb95cVPvW4J1NmzhvkCUjTTyD8O6AnpYOu_Zizkl_awmDt9Za6bSLyoqZNorAM7fKj9
 z2zQKYMVTfpR2PzIQtCBE4FcIEqIMwNbQUrayyTza7LwfRl6nk1dBY7Y3XzhjKTi.xAYR1lXP4t_
 Evtn10mflIQyexv99fIBxm2cEl3Hw3x_stuB3ykSIkJl_2.6n.wDML0qIWfTZ07VdjLqh7tXOxY0
 u6_NUUCoIQhRahWcNnnSECqy7NBewAQLS3T.s.vvtz4lKAwE53uNAJ2p6jW2aoM2epjLJ4X.Nb88
 Fwz1G2ifPvH32VYy70ppZ8Atyf6nwJNMv8jRhmpBDGoU7UEwDP39c6LaBch9vqjhu0LeZIhNyJzE
 SbkQMw8o0jGzgBmonzMqmYUPlWXAEhB420IGK1oDMlq15nURZ6Z69Ln2sZg4NnCE3JpCDWDfqojU
 UWZd.8SJ9ep7MSuVpwOz3i5_AQCjpvcaI89kMfjiWgzD87IyWoc244_2V3onafNYNTgurH0LYIOF
 NJsiD1G9jenv3dcerj42OPdpKBtlwzYeGx7i58JwtR6SOs6VgsTIBr2K1suF6cQ_5UVPvujc6KLx
 OXZqtOFZVRcCFKDzxWOIRmgEUmmh8O3I4oxaeodulTPt1QBqRaAys0TPCZE9GIK49ExRKfuYUGj6
 yomtZ0aRlPUTLfQVE9xkcq17LZH_ivEGgKYjEJDCp44z7rJ0r1NMsfp9UyKhSp7zbM83aP2y044h
 bgHZfgnFNaWjEwS08IVIi9cEA5QjN9UNwu.YFg8Qj15nuw3qzsYHPLV_b64.6lD9KS30c.nhQxDI
 Et5XCfq8j7dR3X8N90q2it.ljpTCeAD3YqUK4WR6crA2T36Q3p9praDq0Yli3ZUqTyLKCqbyakSK
 R.krdpy9kfr_85D5wIK2ekigEOyww24bVC_VuOeqWGFT_iEUdx66qbC35kj49sbwJ3tSR3T5gmtu
 hY58PLU3zpLGLU2V7IP9kfNpoUAmcwGgsVSS2cW8oo8AUNzZTz8c_XL6RkzOHqOaxj64MYTZ7SOy
 nAgLDf0NIDY6jRlty724Ww1Dggwp2Ed6kBiXMhhOZDs2VfAzED1N5ZnB04hKsnAxC_y1SnEA13aJ
 TBqn6BerVWUWNSURqUpPjCv942CXcD4ow_mt06GPvtIX8xi9fBDWLOiJPWW51gCT2tZHqSS.Cdus
 74Da30fVLpg6e043KvhZtXQ7bNiu6rcWQprNDYJC2f6K0flHqWGxA4i.JxBNPKRKcRmXAGThaZL4
 lFbk5uhHZKLr5CEDc9M_yJi8nOaZGYZXy_vtwZKonaf037GQQEMk6hcCU1VOqyzQGWzIagbaIyCr
 3BG20Az9gJv.bGlCsH9CeRR7LP3O.gr_golSNKgOfeMFSyz7AHpLIqmmLxI3_Qn4sXY0pfmold1P
 ENmFTnAY3mPGrkLJ_Hqy6q_JCC9vrFFUg4mN5rx7kwDaeG6nJeIDoM8stplgh55yglHpb4YCivRJ
 3f.mN1FrG1m10vrX0Buj4d7RzIRUxhlkROL01XIAzIyg6qRp_IJ0XP3QxJ28qGsJyJ0fNAn7Fuyn
 blMTxKQzaxjB8bxcKK1GvrS5KcTKPCjxbgXKouIsj.nZiD90r0najsOUW0ixCdqhFKLzuiO1w4sb
 NS04MzoaIgYKA7p0VJtfF77OYvizBoCV1ALYOdzlFXod4GqD0KTEL3rgAGDHNu03I1uKdbfyspAw
 rI7LvUsfMKqOqIHMb4yHdteKWdfR7BFP5sjQUFjjf_3.nWs8nxQhGW1FwHnLIXlkHwPnghTFLeBn
 66n7p1tVc0ckkuR8Gyczqq3JoUaUP0hLSb_Dgu0nmYKgIYeDjhlD.KxwepU5dTddHYJO2N5ZbZO8
 dgBG.Ylejakr8tRcOfaL2JQfaeE9f.27IqotAtVJaVSUZqPBRKmhtYSELH5_I17DQ7NNjWpIAzWK
 7XsbrBmOciXUCKl3AwgV.7ZGgFXpW.zkiugiimDnfXgsgM6NYhmCvUejOFUVx4YgfKV1OPgqvCMX
 bdXzBgCRNGz5OT8fu.bA8hfTgQRALWhAW36W.y8HmQAYMn6F9Oe8cgobSHs3x3zq9lwcwgRj3A3r
 FwHQvL.qTV3O_L122PNOvPUG7asfHrEMzMmgOgbMT0DKhO_gTKDTLBplcVfjy.Q9sNFywI9y870x
 .wTBPoDIqe.xOJ1ObCFniDRF75mJN0qssUYHU2EtjpV5Nih9i0sa1iGRDeZuS6KKLJ9mXTd2BjCK
 vxfBQO9INJl1JT93iBP71EvxaXvi_DaqCoWzqL1O_tg--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: e9159a94-7de7-49d2-a8fc-1e254fce5693
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:03:45 +0000
Received: by hermes--production-ir2-7c4859dc89-w8xzb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 84b12cdb4f7773781fdaa6fa0804ae13;
          Wed, 25 Nov 2026 00:03:38 +0000 (UTC)
Message-ID: <e3cfd266-967f-4e86-b55b-7981c14ea9f3@yahoo.com>
Date: Wed, 25 Nov 2026 01:03:35 +0100
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
Subject: [PATCH net-next v14 04/15] net: dsa: realtek: rtl8365mb: set speed
 for family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
References: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
Content-Language: pl
In-Reply-To: <874b29a3-f47f-4bf2-a0f6-2f9fea712f4c@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

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
 drivers/net/dsa/realtek/rtl8365mb_main.c | 108 +++++++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 0457f84..c932493 100644
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
@@ -1733,6 +1755,92 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause)
+{
+	u32 r_tx_pause;
+	u32 r_rx_pause;
+	u32 r_duplex;
+	u32 r_speed;
+	u32 r_link;
+	int val;
+	int ret;
+
+	if (!rtl8365mb_get_port_extint(priv, port))
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

