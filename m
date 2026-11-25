Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.190.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564967;
	b=cnd1Z/CqUmIGkhJraUTEoJVGcyD7936ztmCm5h6VqLVxq2EjMcPmkj+/Bp272f93a9Yx
	 59LpZZMxL+WWlvqCMaBOLvfQCPXJR6L5ZonEOkqhHqAmkIKQN2pgpy9aqu3CtQOAGEV43
	 VRQ9Esr/3S7/HWdNoxBU0hu5dkRyrFt2Ow38RyEibQlJ0TE6Rz9N3qBAB6Fl7F2DyMRDE
	 T9KvxYJkT73pBB8He2DjcpdSuAxIepDK4HKxuVtFEuVPVcd6p300Qr7NSLIt4zVxLowEp
	 JaMnGSnptDfSYlF9SYM9BnILUTfFaYH5The6wtHFhz+fLooCcSTKkD3DaO+VbnSpY1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564967;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=pT6L8t7OBfjsaxsDp8IFjUH71pjXA4VhDY9ITS9295M=;
	b=ODbLEUhfWUZ1yISdXSA2knLedU/RO96ncEJ2glhc2dsdWEumpqRKWfDkknbDwj656/OH
	 Nc1/cnyHrcNGtVlhv8FijFZBQawvyHyPL0kdg77PCllkO1J1xTUCjChqBgvAzIkTSkgx2
	 uoYDjO7S1zj/3lgVEyh8jbocw1OFg/YCwWsZJb5HxIKmD/UiESY5JjETQujtTj000lFVk
	 rMSw/yRQiUtcEy8XWV+CX1BnJzl3QGZAvBku+CKISOMKNcIDUIa4mCOvZcDRThGvpKJHb
	 hNKInAXc+Iq5AwMnnPHHFfWpJFzH5izRfuFQfN6GVh5c+d52M7bubkLSmuLQRW4FjSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=K0Kss8BT;
	arc=none smtp.remote-ip=66.163.190.33
Received: from sonic307-10.consmr.mail.ne1.yahoo.com (sonic307-10.consmr.mail.ne1.yahoo.com [66.163.190.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4193606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4193606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=K0Kss8BT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564965; bh=pT6L8t7OBfjsaxsDp8IFjUH71pjXA4VhDY9ITS9295M=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=K0Kss8BTrLGPgAxBZsJTZTPooA+qPJGzS7VRs47JrV/IjVwbF7FTK0bCCXsd+RMU1wE0WUzMWFDep00B2+MpoduP0gY1ujlY2FANFOUvcMGkUwgDe9/BSlO+sx6PthRZrL+pCgCLGmhkJMsMg5o0zVnISJaJLr+CwzlzuABr53t53IpA3CEPg58I11hUmsJE8wiAoutzM1JImJDEjgffH040csz5zoEA8q5zrkW7GvlgyOfUOuIOKW2gN0M4TSsHcUMTbyV8Zf0QemElthTxmACTHCE1p9xdZ6jAoB9zHqcItkKnz+pHl3UuNZN2vKbSzS4oUNOqqboUaQNuz/n6vg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564965; bh=ip3nsjhwUoJha8LAg6e9X6QAoZDmPxKoTjHUGmg6akK=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=HfNnvqlWN8QiDhCgWt3C2UtfmauIDjR7S6up6CEB1k8VtEvoPynpIVrWXdzgQsM5D6CbxTZAhmDKZhlhYkuuNAeZzV7A0bgd8DlYKpX8EkEz+lnQPwussUg/bYKqa3PtddpEc7028bCUvZ/c29dHNNED7BQe6Xm35AoZQgaVgzluLGJGaqjf381S0UQeARhSJEi2dcuqDemw5LfZBkT1xQ0vzDTHR9P0CxtjRnSenWixMDNb5fayTsHrVIsen18s0uwl8TBj3O9TcxtBW1nNQM6RMDOlnzL+PdvhkUYAT9M0blmsAkg6h8nMYRDazzFd9+8ezLlGmqOaykdSERvP4g==
X-YMail-OSG: 1qGgYKYVM1kB3rhFspXKuvfC5_7VeguVq18QC_7u9OjkDGe8mDhR7hyxkKgxx4b
 9gu_x7ACHqb35UcwmWGthpPYrlG0qboX00ADX3YZaDGGcxe_vJZAOyD62309masy.ZzbA223Akp5
 Hb5y5AePYX6K_fKuRkCTGB.QQoeMYD20xjhr._z5wjuQcH0NHVbXlSvjFMkCMaHTLAa0SwwP11tr
 tCyzWjS.lCgzERaAGzl1329hqjpHy_bHYLUwFAX1Antve7EGzMDGK13CE7RZZvVfYE2b0q9UlAEN
 EMeY7HxwLSn7YW_Z65gWK31BzEgyC3BMGDbxUTU7qhd3IahuKnyjgl8L5LIxN8zAXo6J_OlOGb0_
 Gk3LQTm3uR.0avXWe75Ibc.tUYpUnTufr9peSWOETXXgibZxE9omejHaOp1jF8H9pHT5PkmTNrWx
 RVtIb2Y70EMBt.4dJqMrtjO.KE1d2B1wHgpahPB9pYMpuMRtPmmHcyXoU0Px0CV8ZYYim9P2m6uP
 MzXIf0ri5aT3CdmrXl6kktulJzhVilFmOB5nNZYyh5zqRUW297Dxl9bMcoZjub_DwOrMnZDYzGYz
 Elyalf4oBglDU1EL1P90bvYQNavhYb_NR9xTv3wppdDMuMFwyyuAO47hIWA4sI6DywKZaJlgv06R
 G7zJRi41DDCT74d7G00hLLZsm1KCAV.FiI4QU3cZ0tmUnLw7yhF.4eJ82s0tfki05l1piZpBSkK.
 XUJ7L2wnC5_Onah_wRHEDccS5vMcKnpcLOpmB6E9fhLzpCUbyOUTb27SDRfi6.X8tUZidAPddpiX
 v03iqsLSARZOQVfISt6RZYu1zX02NIe61WA7iYRPJQQHMkMJCtWV1Ykxe5vkwTgxuXGuNHZLUJ3m
 KPDG51HfXhi9a3QsYy85Z8Fdv4hdU40JZC2HEZT_SpOLU0NcZ0ua1UtO2UOzKXVM.3RR0AP0zWzA
 2kuEjpJaHspizpRP6bC0midhOOyALn5BpxbWXoM8Ujsohb.U2xjyCEXdr_XSQiNGE6vu9EjSG2uH
 vCP87ajqqUd6dvfz5GuYPm1ePdpRnAYPMDgNHchx0fJ0sISYyp5r6RytFNTvkv.L_PTaDH60Y6p7
 2ViQChjO_Jz17qGVt6EBnbAgtnn867FZl0YgcWAKhbYlrZLr6XUSFQcSK6rNBpanjXZmbxWQAQ69
 0M7G79vVZ86IMZGLKKMPjM8clcX5musYBmLejhJC6g3ZDurmGQPRWDHA1lnHpusziNoBbygQoeWu
 ygrCbQqK4SNCNy1uNrGSyO8HhJ65FeuFmlnqXDlUgPXo3vhMZOOUeVs.a9ETqc0pYySUW1qVbdDh
 bnuqSL4zUoZd3qNKbp4pr_0CBgYTvnuj36vbBxQM4DcK9wgx_cYwgQrU3.w7aViejm4uYl7iMC3n
 sAUhbFkU92T.HJvEdSDXJn6wS.UMaWwEaRpWjeZri649tBL7p3XxI2bN7czknP57HoLGJ9UBQoW2
 Aq_cZnpfkOlCdDRDzjVyWR_NJ4_eTlY3b0eqny5gDr2.VkZKc7uGqHu5WGBpPJGNf5ymNBKM30qF
 YYBl.4Y7whGzVXqYpac6lOGMoRiM8IewqUqZDToB_xnyT4slfNImEGZbPllsEF6NJJ9f2iVbeXn6
 xfQ5sgmAadZFtfZ2ch6K7zozNV.3YU0dzcyQsk.uN6kA4m9bNPtXybnpEdtUpzvcSRcUsCVS1KyD
 5MYcx4msMOjRzp7cC1qW51VZkbPbGoRzoWUsywf1.heiPLjO6YDEgqVHZMfhdeecrX9Idm82XOO4
 G3DNj4.QNUFJK9y9lJ1LZ5mAzCOZ7_wPSLBfwsdL7icX9CMEqnDaaXSkepjHTIqfr_N3OLCP_Hvx
 5xGCx8y9F6lM8_kbFThzQ0._6p1Q1mlOGzIkoIZbHwkmTuKfxeWxU60vuiK9YL_uoxsyv375uwn0
 hvPmRXe.AR0mT_gmmCuOEd6hlMRGiMBsIA1Z4pIXQpF05D0AO4pzloghCHCuMCJNvMCJuJT5h69z
 DLfvt1nc2h4BwRtu0e_ttUYW6z7pqJWzVckaiRbmr_.uBCv6FCVlJ60gHE2WOShFVH8jM7rkUtst
 0fdDkKx0vYVDjy7b9ErbDUcA2XbJ1E1EOtQ4BTGyW.pzG6T8EvLECB_MELZu_L9hoQs9DRmbDTZz
 ZcPmPU_pB.52PW.PMF7h5RrJi_Lj2GbBwHjepyIVva1L_GVeW_h5E9XcfrjB56IhBRBsipzAWfuS
 dwKobDQeOQgkEoIe3vIEfHyqR54KVWhYJfEKDU2Gvumv1b2LsIRizGzuOoRpiTP8Pn7ucv4B39rX
 etmu0mCNMvSKZDwEUp50trCmkuVu_jxpgb8t43w6V
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: ea6eb6d9-1c08-4ddf-9e60-1c7ddecbe3b7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:02:45 +0000
Received: by hermes--production-ir2-7c4859dc89-9kgzz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3675b3de39ca4d8c0d8de77bf0351fca;
          Wed, 25 Nov 2026 00:02:43 +0000 (UTC)
Message-ID: <929e1669-f051-4ae3-abb5-40f58e4701f7@yahoo.com>
Date: Wed, 25 Nov 2026 01:02:40 +0100
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
Subject: [PATCH net-next v14 03/15] net: dsa: realtek: rtl8365mb: refactor
 forcemode handling
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

