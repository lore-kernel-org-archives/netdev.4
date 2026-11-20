Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133241;
	b=QuCoUrFr1YB2tOATdQAen43iTz2RIrbKZ38unEMnmTys/oLXJePPy0bio4sRtk2WO1t7
	 RR4HfQT1P2g04KdiTQxYzg1aGNdGeNQ4iwly0tPTjxGzmQsG13KJv5zVqrpl0KBigBVhc
	 weXx/RvEecPpimJRApA+8hoS/WqJmsDkoTv22P/Bw1thm9DcPrrag3V5GkW6gt9Wi8prf
	 bYErGb30Xw1RvetpeRysHOmBJFKjgbzeGcWcvdSLsG4SHIICeKsw2ABXYVEEc0kj8E4pB
	 Q+ynXP//8j/0Ur4ErFjRS8oeKiZLyZkhOJOJruN06ExBzcI2PqtVRZOgsbTfOFnHxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133241;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=fRFc4Av2XL9era6FkWlYNZGiT0SYhlRK9nPBdwc06B8=;
	b=S0pyYoCULlw7NAYdksQrR4TFMj/yIst7JbbFLkBj9NmKCYh6xck1shgkEcMXACrlTkfw
	 JBSRGwnJ84Ox9LwfIP7F/nPOKhcQzIWedfPPkh8n1/81m6QDQGas2lIcdWGs6SJ7WJbpI
	 dEmM1nGyZXOM4pQ8LBLXF4ydaCdub65mavo2vpB4GQWYn8Cr2T7d8XCcMomBssF0XFoBR
	 +ZmvPsrj5KnywiohEr+I/Fl9BIEFODPZEbhOvtukLm2Dp0BNg4royvthGX7FEXFRMgTEI
	 TC+onaEOphyVkxLXDQB2QC6uurbNSq/QuQBUUR/jfSvlH0tdUs2BKayWrjxY9QWh9lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TC4UVjSI;
	arc=none smtp.remote-ip=66.163.189.84
Received: from sonic306-22.consmr.mail.ne1.yahoo.com (sonic306-22.consmr.mail.ne1.yahoo.com [66.163.189.84])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E863E60A2619
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E863E60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TC4UVjSI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133237; bh=fRFc4Av2XL9era6FkWlYNZGiT0SYhlRK9nPBdwc06B8=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=TC4UVjSI0O+3ZQxoAlc6uFlceqtuG3vE8KTUls4vgWPLpx21AhncWzTdYbJKzKOFQ2ueJrN99sGfcR24eCEQYKotw7M8XswSvQvko/PrcUiV8910jQ19ybciB/IoYjA7ZWadWd2C5123DLWZ6Qwq/0W6FTxE4lgr+YZib+MZv85dE8MQvY8HEcwH9UVGMBTTZTyvQLrqVg8xIVz323KLySIaeZDGu5HX6AIQsG9Jzy2i11MMPnzvEMKLC3to9zlF0ZWChGBxLb0MWTuct/ani/IW+o61FzLDNHh5HNGTDp48bLV7hG7XCuYkkxTnzK3r9AYO5iA6LJxWCyIJzIgWyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133237; bh=pj/cffRy5kkC9RWAwHDdwEK6mdYKMhqft7CO6Vh5BP9=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=gRnqeRKkYwY7irit9AJgeHTT3BVDsRJH3zqEhR527/fG3aGQOISYljyYQO8loZznObxSVRxgu27+YyQttpBTMz585XHaC0a7zVERwacOolFfcFCJF3WARALFSX74oGYwNxovrl5NbJR2CLlzb1rFbhB+hORYBaXrNYoeAm8/9hACwBSQVCjY3J+1fH54tOY0QlpIdXjzjNOueN8O8BBse+bDURij/xWQ+/VkkprDeh0jBtRAHI4Z0YXnwA4oD5ZLnf20nwC9fz9wDMe10Zo147IYepR6egi1bzKeRceksD/bib0GLKCDSZarb4oVvE8tX2x6W5n+ct1s3KH0w9658A==
X-YMail-OSG: EoqzcKsVM1mvMyJSbh6vw.vAPa50OKyZ8nQceB0R2JsM5GiwfFWk8W4pMU8dCVT
 .iNuwkz5JUMW5HUKy5s.fN7OBVuF_9NWpkFkgi8LZJsvDaJS8T7YzZNQrHXbjWzuLYjYHbkTE19r
 _JVK.dS_JSug.NefUbTRNnQADZxuucnnGuzryZvYF1S_xiDdG3RkHdMrs6tZ_wlDcHFlOQlX.FcN
 Ku.PeiT8KRd1oVkzs6jFLWv.BThoJXpLpvd6oHmxU5ZlLxwwMzZIxMeyX.UJlqYBog3asN3sHspZ
 k7TaA5tkwbvLwInj7emWjlnFth0LaomtT0L12rgeGev_Y8Hu1_HOix9NoxVjQP0OHetv_mybGg9a
 9FA3ZlySwL8Nx2XmN12MFwT0l0cvDJeGevbE7bT2uh6T6Yy5pgSUhLW.2CDrcZ.2aG5YJK195vX6
 KTMToMHsaWJJSzxDTie45stcD0BntXyveTRIZZv47A32dK72l7PMChrMQFxuv7vXPetXij64V3ac
 XrtAjNaJQHvsZJYNmGa1frhdWgfajt_tCZOlcTmJ78hu6zbyKiZSp87lm.xG.XGF4LyuObYkZRPg
 DOZb6MKagdwO23J_pI4gLdbXlPj98JEEc66gY9DQypgFodsxsilnS2ZHtgLnvS63Mp.RhPZnz.QR
 K.8jqgsUBSZ8PiHa62GHe2viyiSb6fcBuiiEutO4X2tuscjTWOjjCcDp0Px3ehxAuJg56nOkiTc1
 SEfBAyTWsmA2bBnm9qXZKPWeH8AldFoNi6HACJkzg1oA5q9EDwPI28U543anAcB_wKhEA5WQspZt
 l0ZZeiOP.9JuGxNZszlH5Qlm.Ppb20rqpXkLzeJgAAWZrQvLd8bj2udowiNbNwuY0XO..i2oovMX
 rVaKZrZb1i4YuBOaXT.gFRoEZPsEMPbdlulcVaXC7r7yTeRRgG9w1U_g9SV3PJHildWXomne2n4g
 XuZZtKhcdpxTsThVNG35Xe8jvhXZNcTXQN3BmPL7P.PfvnfW_w1haLwGrv7izkJLNPnEHTf22rl5
 4kVDmjgEJ3CA95H7Ya9ddpde_SCyLWmkMMaR5X1QM6iO5iPo6UBQD96.suFt.H7j3RIt5sK0HXCN
 1nO_yc6Jhi8LTKAtEKmKuD9_vPPi6F1REn.NsIF.QxrCgdhDVgeN4MneaY8UaMjDkIJZWRMQLRMN
 d0olTXMj0mDz249DWn1wafMoayA1aKXevtvQArvO63.kKl.yFo2mx6Ff4GE953HnHq30jZcmhxas
 rDDzU3uol90CDltvnaes4g.QqKP_nsCsSwHZiDIJazcAOgqy4EFw1x_f9uK4v_qTfWL6DiizZmCn
 mubF_XWoVWUIo3cFqxesQG6bdAGNVQkDtcFfW4b_WaLIZ._M7JJmjiO18K1NrnsLfS50ubeur1Ev
 0OjKv9b0CoI1G6T02va868PRBLkkzw3sl2JOa8xjnrcsdOa5O1s0R.8AEt2PUQudNyKIQGDrLdWH
 ojmiRWjcpNVjO_OOowSYbrAf.Bc4cGIQVLAWup8.nHEYm4K7foraU1Q6.Fg6TmwSJy74.Xn6iPOa
 D2odPplkQrjTPBN90AAgOaHddHAP.8dEnK7HVBAMj0l6O1DE8MpGw.hkFRKi1xPwtfCykt00FTLA
 VSvQeV_1jx0Tz9YgsjpHuVpWWPGztkrDcUvDev_bIVtuIx__BrVL9WKuZJxvGOrwlhwjXzvdY8y0
 PzQk0wcSbSEEvY73F9gNeOFY402wyWbRPbUn9IINVFZWNffOushfKCDoGxl382H4WmrzenkM9lFN
 kwsNvCHmi2ZvDiJw0qmJVyTq13YcnKAgiG.UYIsIEFkWwdQtID0ys47EGdsL9eaRulTT1JHx1gSC
 1isaIePBb98_ujFHuserZrrQS36uZeqi1rHEl8GRytGmhMtyo9Xix39S4obJFSaAeFypzF7uMpRi
 VMvBv2dozMBUMoZVvU0Toyjzd4qr21DrU5Mr8QEy.VKKahOAJzxKrWBFyT5DjqdbXq.ECkCohpPH
 8JQvsLuSvGDFAA7QJWpoYy97n3PL4vDTD6Cd8hTuIOU_.br8QNPHS1XLH4CoxlpKHQpz0q6O7KuY
 AhzoT_k3sj.tuSba_YJCz5odT5wFkDXZ8S9dRs4AoRNZm2Sskx6_0kjC2p0jtu.EHcJHmSC11nol
 50xMbSeCSbwQEcoqHzRm4Wkh7xCaa471K.HNWazWiyYyU6XPuhDXbaqF0iXraAMUNhO70a71Rua7
 QmC4FxgZwhzb4do1DUy57m531jvVM19.2LIJNkNa_C2_fCt6gVxrD55pBwDgBFLAkNMthKnuxpQJ
 9qJl0UWACP.9oHRtW_xcF5pgYrJCtscoZqbrHfP.ilIILG9Ld17s-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 68a50435-bb1d-45f3-bd1d-9fb27991becf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:07:17 +0000
Received: by hermes--production-ir2-7c4859dc89-4b5bc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8aa8913692fa5d77fc0ca93c0e728084;
          Fri, 20 Nov 2026 00:07:14 +0000 (UTC)
Message-ID: <87c2a0f9-bf6f-408f-b711-c566769b40d3@yahoo.com>
Date: Fri, 20 Nov 2026 01:07:11 +0100
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
Subject: [PATCH net-next v12 10/13] net: dsa: realtek: rtl8365mb: add family D
 SDS13 PCS support
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

Extend the existing RTL8367S SGMII/HSGMII PCS implementation in this
driver for family D switches, whose CPU SerDes is reached through the
indexed SDS13 window and whose SDS_MISC fields differ from family C.

The register sequence and tuning tables are derived from the GPL-licensed
Realtek RTL8367D port API distributed in the Mercusys MR80X GPL release.
Keep the existing family C path unchanged and select the new behavior from
the driver's chip-family metadata, making the implementation reusable by
other family D boards.

The SerDes line rate bypass register (RTL8365MB_BYPASS_LINE_RATE_REG,
0x03f7) is laid out the same way in the RTL8367D port API as for
family C: one bit per port, with bit 0 being port 5 (the
RTL8367D_BYPASS_PORTn_CONSTRAINT_* definitions cover ports 5 to 7). The
existing mask for port 6 therefore applies to family D as well.

This patch only prepares the family D paths; they become reachable
when the RTL8367S-VB chip entry is added in the last patch.

On family D rtl8365mb_sds_probe_option() does not read the family C
option register and always sets sds_supported, so the port 6 rate limits
are raised for every family D chip. The only family D chip in this
series, the RTL8367S-VB, has a SerDes interface on port 6.

Nothing on family D programs a SerDes rate for 10 and 100 Mbit/s:
pcs_link_up() does nothing and the MAC force register only sets the MAC
side. It is not known whether the SerDes follows that register, and only
1G SGMII and 2500base-x were tested, so do not advertise 10 and 100 Mbit/s
on the SerDes port of family D.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Co-developed-by: Fabiano Tassotti <fabianotassotti@gmail.com>
Signed-off-by: Fabiano Tassotti <fabianotassotti@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 263 ++++++++++++++++++-----
 1 file changed, 205 insertions(+), 58 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 7ad9ef1..50ba2fa 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -264,7 +264,10 @@
  * interface, indexed by the external port number with port 5 (the first
  * external port) as the base. Other RTL8367 families index this register
  * differently (e.g. the RTL8367R uses (id + 1) % 2), so this mapping only
- * holds for the RTL8367C-style parts this driver supports.
+ * holds for the RTL8367C-style parts and for family D, where it is the same
+ * (one bit per port, bit 0 being port 5), as in the vendor RTL8367D API.
+ * Port 5 is not an external port on the RTL8367S-VB, whose external ports
+ * are 6 and 7.
  */
 #define RTL8365MB_BYPASS_LINE_RATE_REG		0x03F7
 #define RTL8365MB_BYPASS_LINE_RATE_MASK(_port)	BIT((_port) - 5)
@@ -286,6 +289,7 @@
 #define   RTL8365MB_SDS_INDACS_CMD_BUSY_MASK	BIT(8)
 #define   RTL8365MB_SDS_INDACS_CMD_RUN_MASK	BIT(7)
 #define   RTL8365MB_SDS_INDACS_CMD_WR_MASK	BIT(6)
+#define   RTL8365MB_SDS_INDACS_CMD_INDEX_MASK	GENMASK(5, 0)
 #define RTL8365MB_SDS_INDACS_ADR_REG		0x6601
 #define RTL8365MB_SDS_INDACS_DATA_REG		0x6602
 
@@ -315,8 +319,10 @@
 #define RTL8365MB_SDS_REG_LINK_STATUS		0x003d
 #define   RTL8365MB_SDS_LINK_STATUS_LINK_MASK	BIT(4)
 
-/* The embedded SerDes can only be muxed to external interface 1 (MAC8),
- * which is port 6.
+/* On family C the embedded SerDes can only be muxed to external interface
+ * 1 (MAC8), which is port 6. Family D has it on external interface 0
+ * (MAC6), see RTL8365MB_D_SDS_EXT0_INDEX. RTL8365MB_SDS_EXT_INTERFACE_ID
+ * below is the family C id; the SerDes port is 6 on both families.
  */
 #define RTL8365MB_SDS_EXT_INTERFACE_ID		1
 #define RTL8365MB_SDS_EXT_INTERFACE_PORT	6
@@ -334,7 +340,22 @@
 #define   RTL8365MB_SDS_OPTION_ARM_KEY		0x0249
 #define RTL8365MB_SDS_OPTION_REG		0x13C1
 
+/* Family D uses the SDS13 indirect window for its MAC6 SerDes. */
+#define RTL8365MB_D_SDS_EXT0_INDEX			13
+#define RTL8365MB_D_FIBER_CFG2_REG			0x13E8
+#define   RTL8365MB_D_FIBER_CFG2_RX_DISABLE_MASK	GENMASK(7, 6)
+#define   RTL8365MB_D_FIBER_CFG2_RX_DISABLE_SDS0	BIT(6)
+#define RTL8365MB_D_SDS_MISC_PA33PC_EN			BIT(11)
+#define RTL8365MB_D_SDS_MISC_PA12PC_EN			BIT(10)
+#define RTL8365MB_D_SDS_MISC_MAC6_SEL_SDS0		BIT(9)
 #define RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK		GENMASK(4, 0)
+#define RTL8365MB_D_SDS_MISC_MODE_SGMII			0x02
+#define RTL8365MB_D_SDS_MISC_MODE_HSGMII		0x12
+#define RTL8365MB_D_SDS_MISC_CFG_MASK			\
+	(RTL8365MB_D_SDS_MISC_PA33PC_EN |		\
+	 RTL8365MB_D_SDS_MISC_PA12PC_EN |		\
+	 RTL8365MB_D_SDS_MISC_MAC6_SEL_SDS0 |		\
+	 RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK)
 /* Shared "disable" encoding for both SDS_MISC's and SDS1_MISC0's
  * 5-bit mode fields.
  */
@@ -721,6 +742,21 @@ static const struct rtl8365mb_jam_tbl_entry rtl8365mb_sds_jam_hsgmii[] = {
 	{ 0x0424, 0xD810 }, { 0x0001, 0x0F80 }, { 0x002E, 0x83F2 },
 };
 
+/* Family D tuning tables from the Realtek vendor port API. */
+static const struct rtl8365mb_jam_tbl_entry rtl8365mb_d_sds_jam_sgmii[] = {
+	{ 0x0427, 0x4E0C }, { 0x0428, 0xAA00 }, { 0x0425, 0x5189 },
+	{ 0x0424, 0x8414 }, { 0x0423, 0x1020 }, { 0x0410, 0x0002 },
+	{ 0x0484, 0x011B }, { 0x0421, 0x8E13 }, { 0x0422, 0x1140 },
+	{ 0x0004, 0x074F },
+};
+
+static const struct rtl8365mb_jam_tbl_entry rtl8365mb_d_sds_jam_hsgmii[] = {
+	{ 0x0427, 0x4E0C }, { 0x0428, 0xAA00 }, { 0x0425, 0x5189 },
+	{ 0x0424, 0x8414 }, { 0x0423, 0x1020 }, { 0x0410, 0x0002 },
+	{ 0x0504, 0x051B }, { 0x0421, 0x8E13 }, { 0x0422, 0x1140 },
+	{ 0x0004, 0x074F },
+};
+
 enum rtl8365mb_phy_interface_mode {
 	RTL8365MB_PHY_INTERFACE_MODE_INVAL = 0,
 	RTL8365MB_PHY_INTERFACE_MODE_INTERNAL = BIT(0),
@@ -933,8 +969,9 @@ struct rtl8365mb_port {
  * @mib_lock: prevent concurrent reads of MIB counters
  * @ports: per-port data
  * @pcs: PCS for the SerDes external interface
- * @sds_supported: SerDes tuning parameters match the chip option, so the
- *                 SerDes interface modes can be advertised
+ * @sds_supported: SerDes interface modes can be advertised: the tuning
+ *                 parameters match the chip option (family C), or the chip
+ *                 is family D, which does not use the option
  *
  * Private data for this driver.
  */
@@ -1347,7 +1384,8 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	return 0;
 }
 
-static int rtl8365mb_sds_write(struct realtek_priv *priv, u16 addr, u16 data)
+static int rtl8365mb_sds_write(struct realtek_priv *priv, u8 index,
+			       u16 addr, u16 data)
 {
 	int ret;
 
@@ -1365,10 +1403,13 @@ static int rtl8365mb_sds_write(struct realtek_priv *priv, u16 addr, u16 data)
 	 */
 	return regmap_write(priv->map, RTL8365MB_SDS_INDACS_CMD_REG,
 			    RTL8365MB_SDS_INDACS_CMD_RUN_MASK |
-			    RTL8365MB_SDS_INDACS_CMD_WR_MASK);
+			    RTL8365MB_SDS_INDACS_CMD_WR_MASK |
+			    FIELD_PREP(RTL8365MB_SDS_INDACS_CMD_INDEX_MASK,
+				       index));
 }
 
-static int rtl8365mb_sds_read(struct realtek_priv *priv, u16 addr, u16 *data)
+static int rtl8365mb_sds_read(struct realtek_priv *priv, u8 index,
+			      u16 addr, u16 *data)
 {
 	u32 val;
 	int ret;
@@ -1378,7 +1419,9 @@ static int rtl8365mb_sds_read(struct realtek_priv *priv, u16 addr, u16 *data)
 		return ret;
 
 	ret = regmap_write(priv->map, RTL8365MB_SDS_INDACS_CMD_REG,
-			   RTL8365MB_SDS_INDACS_CMD_RUN_MASK);
+			   RTL8365MB_SDS_INDACS_CMD_RUN_MASK |
+			   FIELD_PREP(RTL8365MB_SDS_INDACS_CMD_INDEX_MASK,
+				      index));
 	if (ret)
 		return ret;
 
@@ -1418,6 +1461,14 @@ static int rtl8365mb_sds_probe_option(struct realtek_priv *priv)
 	int ret;
 	int i;
 
+	/* Family D has a fixed SDS13 programming model and does not use the
+	 * family C option register to select its tuning table.
+	 */
+	if (rtl8365mb_is_d(priv)) {
+		mb->sds_supported = true;
+		return 0;
+	}
+
 	/* Nothing to probe if no external interface is wired to the SerDes */
 	for (i = 0; i < RTL8365MB_MAX_NUM_EXTINTS; i++) {
 		extint = &mb->chip_info->extints[i];
@@ -1499,31 +1550,54 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 	const struct rtl8365mb_jam_tbl_entry *sds_jam;
 	const int id = RTL8365MB_SDS_EXT_INTERFACE_ID;
 	struct rtl8365mb *mb = pcs_to_rtl8365mb(pcs);
-	struct realtek_priv *priv;
+	struct realtek_priv *priv = mb->priv;
 	size_t sds_jam_size;
-	u32 mode;
+	u32 misc_mask;
+	u32 misc_val;
+	u32 sds_mode;
+	u8 sds_index;
+	bool is_d;
 	u16 val;
 	int ret;
 	int i;
 
-	priv = mb->priv;
+	is_d = rtl8365mb_is_d(priv);
 
+	/* Select the appropriate tuning table and SDS mode */
 	if (interface == PHY_INTERFACE_MODE_2500BASEX) {
-		sds_jam = rtl8365mb_sds_jam_hsgmii;
-		sds_jam_size = ARRAY_SIZE(rtl8365mb_sds_jam_hsgmii);
-		mode = RTL8365MB_EXT_PORT_MODE_HSGMII;
+		if (is_d) {
+			sds_jam = rtl8365mb_d_sds_jam_hsgmii;
+			sds_jam_size = ARRAY_SIZE(rtl8365mb_d_sds_jam_hsgmii);
+			sds_mode = RTL8365MB_D_SDS_MISC_MODE_HSGMII;
+		} else {
+			sds_jam = rtl8365mb_sds_jam_hsgmii;
+			sds_jam_size = ARRAY_SIZE(rtl8365mb_sds_jam_hsgmii);
+			sds_mode = RTL8365MB_EXT_PORT_MODE_HSGMII;
+		}
 	} else {
-		sds_jam = rtl8365mb_sds_jam_sgmii;
-		sds_jam_size = ARRAY_SIZE(rtl8365mb_sds_jam_sgmii);
-		mode = RTL8365MB_EXT_PORT_MODE_SGMII;
+		if (is_d) {
+			sds_jam = rtl8365mb_d_sds_jam_sgmii;
+			sds_jam_size = ARRAY_SIZE(rtl8365mb_d_sds_jam_sgmii);
+			sds_mode = RTL8365MB_D_SDS_MISC_MODE_SGMII;
+		} else {
+			sds_jam = rtl8365mb_sds_jam_sgmii;
+			sds_jam_size = ARRAY_SIZE(rtl8365mb_sds_jam_sgmii);
+			sds_mode = RTL8365MB_EXT_PORT_MODE_SGMII;
+		}
 	}
 
+	sds_index = is_d ? RTL8365MB_D_SDS_EXT0_INDEX : 0;
+
 	/* Hold the embedded DW8051 microcontroller in reset and keep it
 	 * disabled. The vendor driver loads firmware into it to manage the
 	 * SerDes link, but the firmware only duplicates work that phylink
 	 * already does: it polls the port status and forces the external
 	 * interface configuration in the very registers this driver manages.
 	 * Letting it run would race with phylink.
+	 *
+	 * The CHIP_RESET (bit 4) and MISC_CFG0 (bit 5) bit definitions
+	 * for the DW8051 reset and enable controls are identical on both
+	 * family C and family D switches in the vendor SDK.
 	 */
 	ret = regmap_update_bits(priv->map, RTL8365MB_CHIP_RESET_REG,
 				 RTL8365MB_CHIP_RESET_DW8051_MASK,
@@ -1546,34 +1620,58 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 
 	/* Tune the SerDes with vendor-prescribed parameters */
 	for (i = 0; i < sds_jam_size; i++) {
-		ret = rtl8365mb_sds_write(priv, sds_jam[i].reg,
-					  sds_jam[i].val);
+		ret = rtl8365mb_sds_write(priv, sds_index,
+					  sds_jam[i].reg, sds_jam[i].val);
 		if (ret)
 			return ret;
 	}
 
-	/* Mux the SerDes to MAC8 in the requested mode */
+	/* Family-specific post-tuning configuration */
+	if (is_d) {
+		/* The register and field names follow the vendor RTL8367D API,
+		 * whose SDS numbering differs from the SDS13 window used
+		 * here. As in the vendor sequence the whole 2-bit field
+		 * (bits 7:6) is written, so bit 7 is cleared as well.
+		 */
+		ret = regmap_update_bits(priv->map, RTL8365MB_D_FIBER_CFG2_REG,
+					 RTL8365MB_D_FIBER_CFG2_RX_DISABLE_MASK,
+					 RTL8365MB_D_FIBER_CFG2_RX_DISABLE_SDS0);
+		if (ret)
+			return ret;
+
+		misc_mask = RTL8365MB_D_SDS_MISC_CFG_MASK;
+		misc_val  = RTL8365MB_D_SDS_MISC_PA33PC_EN |
+			    RTL8365MB_D_SDS_MISC_PA12PC_EN |
+			    RTL8365MB_D_SDS_MISC_MAC6_SEL_SDS0 | sds_mode;
+	} else {
+		/* Mux the SerDes to MAC8 in the requested mode */
+		misc_mask = RTL8365MB_SDS_MISC_MAC8_SEL_SGMII_MASK |
+			    RTL8365MB_SDS_MISC_MAC8_SEL_HSGMII_MASK;
+		misc_val  = (sds_mode == RTL8365MB_EXT_PORT_MODE_SGMII) ?
+			    RTL8365MB_SDS_MISC_MAC8_SEL_SGMII_MASK :
+			    RTL8365MB_SDS_MISC_MAC8_SEL_HSGMII_MASK;
+	}
+
 	ret = regmap_update_bits(priv->map, RTL8365MB_SDS_MISC_REG,
-				 RTL8365MB_SDS_MISC_MAC8_SEL_SGMII_MASK |
-					 RTL8365MB_SDS_MISC_MAC8_SEL_HSGMII_MASK,
-				 mode == RTL8365MB_EXT_PORT_MODE_SGMII ?
-					 RTL8365MB_SDS_MISC_MAC8_SEL_SGMII_MASK :
-					 RTL8365MB_SDS_MISC_MAC8_SEL_HSGMII_MASK);
+				 misc_mask, misc_val);
 	if (ret)
 		return ret;
 
-	val = mode << RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_OFFSET(id);
-	ret = regmap_update_bits(priv->map,
-				 RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(id),
-				 RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(id),
-				 val);
-	if (ret)
-		return ret;
+	if (!is_d) {
+		val = sds_mode << RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_OFFSET(id);
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(id),
+					 RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(id),
+					 val);
+		if (ret)
+			return ret;
+	}
 
 	/* Take the SerDes out of reset. The vendor driver does this only
 	 * after the SerDes mux and the interface mode are configured.
 	 */
-	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_RESET,
+	ret = rtl8365mb_sds_write(priv, sds_index,
+				  RTL8365MB_SDS_REG_RESET,
 				  RTL8365MB_SDS_RESET_DEASSERT);
 	if (ret)
 		return ret;
@@ -1583,27 +1681,32 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 	 * This flushes the FIFOs and ensures a clean state for the link,
 	 * preventing silent drops and CRC errors.
 	 */
-	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_BMCR,
+	ret = rtl8365mb_sds_write(priv, sds_index,
+				  RTL8365MB_SDS_REG_BMCR,
 				  RTL8365MB_SDS_BMCR_DPRST_PHASE1);
 	if (ret)
 		return ret;
 
-	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_BMCR,
+	ret = rtl8365mb_sds_write(priv, sds_index,
+				  RTL8365MB_SDS_REG_BMCR,
 				  RTL8365MB_SDS_BMCR_DPRST_PHASE2);
 	if (ret)
 		return ret;
 
 	/* Keep SGMII in-band autonegotiation disabled: the link parameters are
-	 * forced from rtl8365mb_pcs_link_up() instead.
+	 * forced from rtl8365mb_pcs_link_up() instead (family C), or from
+	 * mac_link_up() (family D).
 	 */
-	ret = rtl8365mb_sds_read(priv, RTL8365MB_SDS_REG_NWAY, &val);
+	ret = rtl8365mb_sds_read(priv, sds_index,
+				 RTL8365MB_SDS_REG_NWAY, &val);
 	if (ret)
 		return ret;
 
 	val &= ~RTL8365MB_SDS_NWAY_EN_MASK;
 	val |= RTL8365MB_SDS_NWAY_RESTART_MASK;
 
-	return rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_NWAY, val);
+	return rtl8365mb_sds_write(priv, sds_index,
+				   RTL8365MB_SDS_REG_NWAY, val);
 }
 
 static bool rtl8365mb_interface_is_serdes(phy_interface_t interface)
@@ -1628,18 +1731,27 @@ static void rtl8365mb_pcs_get_state(struct phylink_pcs *pcs,
 {
 	struct rtl8365mb *mb = pcs_to_rtl8365mb(pcs);
 	struct realtek_priv *priv = mb->priv;
+	u8 sds_index = 0;
 	u16 status;
+	bool is_d;
 	u32 val;
 	int ret;
 
-	/* In-band autonegotiation is not implemented, so the link parameters are
-	 * forced from rtl8365mb_pcs_link_up(). The real link state must still be
-	 * read from the SerDes itself: the embedded DW8051 microcontroller that
+	is_d = rtl8365mb_is_d(priv);
+
+	/* In-band autonegotiation is not implemented, so the link parameters
+	 * are forced from rtl8365mb_pcs_link_up() on family C, and from
+	 * mac_link_up() on family D. The real link state must still be read
+	 * from the SerDes itself: the embedded DW8051 microcontroller that
 	 * the vendor firmware uses to poll the SerDes is kept disabled (see
 	 * rtl8365mb_pcs_config()), so the link status register can be read
 	 * directly through the SDS_INDACS window without racing the auto-poll.
 	 */
-	ret = rtl8365mb_sds_read(priv, RTL8365MB_SDS_REG_LINK_STATUS, &status);
+	if (is_d)
+		sds_index = RTL8365MB_D_SDS_EXT0_INDEX;
+
+	ret = rtl8365mb_sds_read(priv, sds_index,
+				 RTL8365MB_SDS_REG_LINK_STATUS, &status);
 	if (ret) {
 		state->link = false;
 		return;
@@ -1650,6 +1762,23 @@ static void rtl8365mb_pcs_get_state(struct phylink_pcs *pcs,
 	if (!state->link)
 		return;
 
+	if (is_d) {
+		if (state->interface == PHY_INTERFACE_MODE_2500BASEX) {
+			state->duplex = DUPLEX_FULL;
+			state->speed = SPEED_2500;
+		} else {
+			/* Keep what phylink passed in, but never report the
+			 * link up with an unknown speed: mac_link_up() cannot
+			 * force the port with it.
+			 */
+			if (state->speed == SPEED_UNKNOWN)
+				state->speed = SPEED_1000;
+			if (state->duplex == DUPLEX_UNKNOWN)
+				state->duplex = DUPLEX_FULL;
+		}
+		return;
+	}
+
 	/* The speed and duplex are forced; read them back from the values
 	 * programmed into the SerDes MISC register.
 	 */
@@ -1691,6 +1820,12 @@ static void rtl8365mb_pcs_link_up(struct phylink_pcs *pcs,
 	u32 r_speed;
 	int ret;
 
+	/* Family D forces the external MAC ability from mac_link_up(); its
+	 * SDS_MISC fields do not share the family C link-force layout.
+	 */
+	if (rtl8365mb_is_d(priv))
+		return;
+
 	/* The speed field has no value for 2.5 Gbps: the rate is determined by
 	 * the HSGMII SerDes configuration, and the vendor driver programs the
 	 * 1 Gbps value here.
@@ -1955,10 +2090,17 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 	}
 
 	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_SGMII &&
-	    mb->sds_supported)
+	    mb->sds_supported) {
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 
+		/* The SerDes rate is not programmed for 10 and 100 Mbit/s on
+		 * family D, see rtl8365mb_pcs_link_up().
+		 */
+		if (rtl8365mb_is_d(priv))
+			config->mac_capabilities &= ~(MAC_10 | MAC_100);
+	}
+
 	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_HSGMII &&
 	    mb->sds_supported) {
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
@@ -2037,7 +2179,7 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
 	/* phylink has no pcs_link_down callback, so on the SerDes path only the
 	 * MAC external interface force is reset here. Clearing the MAC force is
 	 * enough to bring the link down; the SerDes keeps presenting its last
-	 * forced state until the next pcs_link_up() reprograms it.
+	 * forced state (family C) until the next pcs_link_up() reprograms it.
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
@@ -2072,9 +2214,11 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
 	p = &mb->ports[port];
 	schedule_delayed_work(&p->mib_work, 0);
 
-	/* The SerDes forced link state is programmed by the PCS in
+	/* On family C the SerDes forced link state is programmed by the PCS in
 	 * rtl8365mb_pcs_link_up(); here only the MAC external interface force
-	 * is configured, for both RGMII and SerDes.
+	 * is configured. On family D pcs_link_up() does nothing, and the MAC
+	 * external interface force is the only forced link state, for both
+	 * RGMII and SerDes.
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
@@ -2087,18 +2231,21 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
 			return;
 		}
 
-		/* The SerDes has its own pause enables; program them from
-		 * the resolved pause modes, as the vendor driver does when
-		 * forcing the link on a SerDes external interface. These
-		 * bits, not the MAC force pause bits, gate pause on the
-		 * SerDes external interface: flow control testing shows
-		 * that pause frames are only emitted with the SerDes TXFC
-		 * bit set, while the MAC force pause bits alone have no
-		 * effect on this port. This is done here rather than in
-		 * rtl8365mb_pcs_link_up() because pcs_link_up() carries no
-		 * pause information.
+		/* Family C: the SerDes has its own pause enables; program
+		 * them from the resolved pause modes, as the vendor driver
+		 * does when forcing the link on a SerDes external
+		 * interface. These bits, not the MAC force pause bits, gate
+		 * pause on the SerDes external interface: flow control
+		 * testing shows that pause frames are only emitted with the
+		 * SerDes TXFC bit set, while the MAC force pause bits alone
+		 * have no effect on this port. This is done here rather
+		 * than in rtl8365mb_pcs_link_up() because pcs_link_up()
+		 * carries no pause information. Family D does not use this
+		 * path: its pause bits are set in the forced-mode register
+		 * by rtl8365mb_d_ext_config_forcemode().
 		 */
-		if (rtl8365mb_interface_is_serdes(interface)) {
+		if (rtl8365mb_interface_is_serdes(interface) &&
+		    !rtl8365mb_is_d(priv)) {
 			u32 val = 0;
 
 			if (tx_pause)
-- 
2.53.0

