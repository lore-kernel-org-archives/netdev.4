Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824416;
	b=ZkyafD+9Gv8DxvoVStiACOSKP1gA/Xk1bvJ3Ce6rffw1L7ceRbCwuGLJtq4rZkcVxcO2
	 aDvwUv/Il5Wmg5/xry3v9rBWdIiIZet1PXf/QF+ypnWzgu3dlhX0XDFMIWh4e8KTYIMmD
	 IQQ4IGjwOsUmHVyfWvjhBw39nJ3Mrfht5UqQuSfD8kPhV1kr//sD6MiXzzfF/JjMMNjxu
	 n7LFs4mYTsG6Hsn0SgTdpUGB41g0NkJ3a6LP4CAxlBDJN8W+BIZUAP8PbsWRRH82COqw3
	 AGLXAgb6nOFy2UT8p0CHIYHINU5OA97X9TnhFEvi6eCtetyTtJZCVNGuu6szC5T2vQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824416;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=CAaY3RWs/834CbZpPPeSKf3hmigfapeZWmPUM6FurPc=;
	b=MYl6DUwUsTVh1macAkFt+/VFZ8neVFfg4yHkHhK4/S3hKPiASimGbcvQKsqO77IVES2H
	 OZdr8CSxrGwykzZYyhuL/hVuuJELdzKrdwBuEVwoRYoLs2Q0d1Yd0eJRY0d4eeXB6JVta
	 o7giB2eX2Q/ziBY7FSrNELpSO/750ssfpIIwmQFo+P2TikovxluIoISWNDThAh85TOzDG
	 B1EJ/Rg/YDVMRS6y4UJgSAXviTg9oqutfR+Mm6W4bCmK4vBm00Zh+L6L9ceq7g+DIJ3aE
	 q9wdkKj28cp7IdzuDKaufeKGIyKsDVsuUFFQxIeoUvM9lkBUaCLC6qwFnlxZF/hCMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=pFrgHnHX;
	arc=none smtp.remote-ip=66.163.184.148
Received: from sonic309-22.consmr.mail.ne1.yahoo.com (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C08606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=pFrgHnHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824415; bh=CAaY3RWs/834CbZpPPeSKf3hmigfapeZWmPUM6FurPc=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=pFrgHnHX71KTX3CrtEegDPJm795QXWxzK4xyEAoZZgP3VG/U0eESoBDCWTBGy9Nt1zN4wHnujOGG+H91/AOXzzjNURfaj10hnUbmsGP3G7jcWTO3/de+5zHQxFecizWr7s8hVXAAzaSJ2QIGhtBECQkTk80RKI8wtZgMf8NCJ0civ+ui+6iMw6LoWdWI5Kghp0V2eGEPWzS5n96iJqU3HFuwAzXsJ3Lhw9r+MUqacBCmWf2RNc3EsCIiNsMwOPv9wXS22jBcLS5PKwLkEKO5g2C3p0e5XQjbNMLyuaKcRN5HRfl+ApHzl/8tw6hvc/lJgSO2iAfnw73MMaHGpPfuCQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824415; bh=gRr2LY8Nu40bw/ng3IwdszN2zNe4/qRk2qsn+fbFpKw=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=NmZfsdb4j/f1MoWTzeJmxKvfv1WJ7QXo7m2j9vZtk1VaeUukm2Me/mwwZ+b72+iRWQfWZZYlZHFsn08XI978yBfcqnIeriZiJBqIrS/I37wF8uCaAgxn4CFgLPI9I6rh6GFAzZOLXH1Xm7/b9P4eE37Xonoc6jTH+ILo1qiUGzj9IKi0pJQQWJLAHJNeq4FgYC3m2vHUbypPZtXGk0njiDaN27dFt8NCOixZSna9X5ntGPx/8051RyfkAIJiukGHkaKwUm/bmxNes83Ti2M6dtoZ7/jACybYWB/jBU6JEo2EDI2o8zev6gBo+/NZwf1GVi+SJPSA7DL+yGW0Ihfvjw==
X-YMail-OSG: DhXTwMYVM1neD1xLZAW_yZIlv2BqxuCI9oezEO3SOPdvKhcoLxOF.E4UtU.F3Q.
 jI0zBXf.IkN4bT8AlYwsAyi.F0LLaP7U_rIvlsSvie4x.lK6qszNlHisv04qg1UQmdN9tQNtj45A
 x0ucRe7ovjWhOSUTgWeApvFixyOdxhUt_pokdaP5M.c2CE5mltennxcQQyxjZCMQ6z4C.h_4WuR3
 9fd8kLrkYuyFIiYBv7iINn4ppBrvqOLviUCz6PV.0rACt.B8evxuQQHvrDevTN1q9OavVtMy4wQl
 vMj1PCEFx1lbr0RQSMrYW__KjQyLaNUfhYfDv7YF25LXwVpXgq5SjTJBYWD4jWdKYN7z5uO4fgcG
 myrn0kLlHIozsxswjD_zY2PJMS67uh0guH_3Hl5ERj0lBztM7ld72d9xmPF.U1_lFbz.bgg_wFrS
 3_fkWtnyaHxLnhvBMPn5.2JVO3MjEXzA3KPRX7aLyO3Tr1dzxDw8v5oqZ36kmiYyuerNdxBl20cf
 Vgu9k5RWoTZcUCTKtMd651f84A87Wfxl0_E6KPxZ1eO5fO1cHKPLFGFISHvXcHnj8AbuvuPunqtc
 xK.sLwVwZPvhsfM1Nlk6ESOqHQMt7t6oWRGaj8z.kVdYHyo1yv3aEFhkBwjUUsw24A9wApS0Ca36
 o3CnQJ_WD2YlFu0aXXPGzrPLDCw8rxrm6Iu0DrPYgyQ_WrLnUxvRv8jcD4JkhsxJ5aRKE7ycGEvS
 lR_IvPTSPnxvNJRXSWG2N.DjY6ZTgxBpBO9WzAdZxouuQmVqzkPKvFVi.I3_zKfWcCkbxlwNTE7e
 mYbp5IwdmKHHJ2yNx9gMcwJtVADJOm_h5hqQMozc_h1dxswSGFL94FXBdFzG3hkluYi_JkVKyyBI
 mhWYg9DEkcHRoBQAyjiN0l0XhqzMhGKcobXKjs_toTpsvEoJAJpKYWoeH55JkdYV9y6WFTUtA6mq
 XhNFuiXVXz5YdEgoNFsongJiwXdnQWqZhmVVPLivFdb2gwqI2jRn4w6qhx2UJ0TIWCLcwiLprfvZ
 x.5zLimIzgF5XU9gaWhlTlDTEolfyTD08r4vDyt3HvNiE4PmIsNL_qhCwsLOi_JdaDtrc6X5AL3x
 JyrOijV6heilgA5_0Jp_ACZFOtg6MIcu67QFxi_rIn09CsNdXcRCMngm1x9YQOJ9CazD6ipGwjs3
 0Cq0XRgkpmYCOoF3DjOWoduO1oZ6iqzCb3di9mI9Kcnd3Hr8GUZRCNxigJfKLALsx6YAMa_ISX3i
 md8gk2ncI9efw7sFoHRlykE0PgWcXQ4kR_WX4LZIwJMUvB19WNSc4M9gG48yT5jdjvrWDkppxCBb
 _0zPwdDqZJpUo5wKHBXrFNsw6hiDukrfDcw9duzc7S66lR3XcWj1MLl1PcysxUXj7rtR4GLBk4uZ
 0JulGUHBLjo4xlrCgxC9vFwoUIQvGONlqVvMED2L5zZc48eb39VcPbKiXuRQuj2IrmvybpHvsjB0
 HH0NtLn8Yk.2Gqw2NNDFFOkijFYeiE2PV7mwNSsrKkfm.5XBpFn.DG5ZGUegwLpC9hyT8uxkgxon
 v81rFH6vtc8E9pMimiA1k8vYTnL1AZrdD0C5KJqpw84SO2pWdhs8KFL3dUoqJFatNhPQpJRg_z4u
 XGcbjF8TfepuY4V8UaWxTTOXBsKNXQV0lbVEDtoo.2NySQ9rKZMI6c40uAmQEAHrOxzN7MpwyH8Y
 kfPesz_mQQdQk6RaRB6F9U8JYKeMmzFHHfEKFpJOsMfuLx4VJK4qUPhMCQbLeGwRPeLIPzTM6G3i
 emaSo3QQcSXYA.diAUpS1gdla.jEZLFnmJcr2wWlgvx8ZR.4PUKq5vOQmQPIZEx8ZPNl2DREf4Wu
 dZMR4DKUDvZ1nGdWVWD7y9yQrqShyhP7FIIfj3PdIYMC3BjEg4ZC.O_aAFIeF8ru7XMRWvO_g7a2
 jopCU6f.cP.7kxGE4TIpAaDj_E5NAiNfKw.SXm4G2Rb5O3lPFmmbPv48dfQNHRW5CfEKJz8jPAnr
 vb.4LrWwUqwKRUa3J0HDyo4OzyaBTry9k9PeSEtTqunzBEaQYIOmMMEI.j_wvqDbpXNnfhH9seT_
 uF.rGCXWI0p6QOP7C79uJM_NSQPgIWSS8zEkpsQsFCQyfyJBQEy77.2s.XZqYiyCM5ysAgqBcfTB
 qNseKUzcX7KJzCG9oyqFiEQftjV2UA_9RtVwqv6MYic_aRhhOB81viO8doBIGWmyVuuU0L6aw8mz
 dsQ3UhrQb19IZueFcADPwXzNkS3RzCHPvlosOChhTZJFD3ZnS0koybJbXWT3fx6xTzFc0sQ.vbrN
 LefecoGJBFnWLEpxl4w.2RoPpHJmmc7.J9q4zS56VU9gBd6JWgA--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 1cc36eab-73e6-4964-b97c-3ca54559075f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:06:55 +0000
Received: by hermes--production-ir2-7c4859dc89-4b66q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID dafe22a7dcf1698867df162b60d18832;
          Sat, 28 Nov 2026 00:06:50 +0000 (UTC)
Message-ID: <42192a7e-a65d-4a13-811c-7ca9b6d2e383@yahoo.com>
Date: Sat, 28 Nov 2026 01:06:48 +0100
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
Subject: [PATCH net-next v15 10/15] net: dsa: realtek: rtl8365mb: add family D
 SDS13 PCS support
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
option register. It sets sds_supported only when the chip metadata
describes an SGMII or HSGMII external interface, so family D chips
without a SerDes do not get the port 6 rate-limit setup. The only family
D chip in this series, the RTL8367S-VB, has a SerDes interface on port 6.
Its port 6 rate-limiter register addresses and field masks have been
verified against the vendor RTL8367D API and match family C.

Nothing on family D programs a SerDes rate for 10 and 100 Mbit/s:
pcs_link_up() does nothing and the MAC force register only sets the MAC
side. It is not known whether the SerDes follows that register, and only
1G SGMII and 2500base-x were tested, so do not advertise 10 and 100 Mbit/s
on the SerDes port of family D.

On family D only the MAC force register carries the pause bits; on
family C the SerDes TXFC bit is what gates pause frames. Flow control
on the family D SerDes port has not been tested.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Co-developed-by: Fabiano Tassotti <fabianotassotti@gmail.com>
Signed-off-by: Fabiano Tassotti <fabianotassotti@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 275 ++++++++++++++++++-----
 1 file changed, 217 insertions(+), 58 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index dc5db50..6dda4ca 100644
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
@@ -334,7 +340,25 @@
 #define   RTL8365MB_SDS_OPTION_ARM_KEY		0x0249
 #define RTL8365MB_SDS_OPTION_REG		0x13C1
 
+/* Family D uses the SDS13 indirect window for its MAC6 SerDes.
+ * RTL8365MB_SDS_MISC_REG is at the same register address as on family C
+ * in the vendor RTL8367D API, with the bit layout below.
+ */
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
@@ -728,6 +752,21 @@ static const struct rtl8365mb_jam_tbl_entry rtl8365mb_sds_jam_hsgmii[] = {
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
@@ -940,8 +979,9 @@ struct rtl8365mb_port {
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
@@ -1376,7 +1416,8 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	return 0;
 }
 
-static int rtl8365mb_sds_write(struct realtek_priv *priv, u16 addr, u16 data)
+static int rtl8365mb_sds_write(struct realtek_priv *priv, u8 index,
+			       u16 addr, u16 data)
 {
 	int ret;
 
@@ -1394,10 +1435,13 @@ static int rtl8365mb_sds_write(struct realtek_priv *priv, u16 addr, u16 data)
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
@@ -1407,7 +1451,9 @@ static int rtl8365mb_sds_read(struct realtek_priv *priv, u16 addr, u16 *data)
 		return ret;
 
 	ret = regmap_write(priv->map, RTL8365MB_SDS_INDACS_CMD_REG,
-			   RTL8365MB_SDS_INDACS_CMD_RUN_MASK);
+			   RTL8365MB_SDS_INDACS_CMD_RUN_MASK |
+			   FIELD_PREP(RTL8365MB_SDS_INDACS_CMD_INDEX_MASK,
+				      index));
 	if (ret)
 		return ret;
 
@@ -1447,6 +1493,23 @@ static int rtl8365mb_sds_probe_option(struct realtek_priv *priv)
 	int ret;
 	int i;
 
+	/* Family D has a fixed SDS13 programming model and does not use the
+	 * family C option register to select its tuning table. Still require
+	 * the chip metadata to describe a SerDes external interface.
+	 */
+	if (rtl8365mb_is_d(priv)) {
+		for (i = 0; i < RTL8365MB_MAX_NUM_EXTINTS; i++) {
+			extint = &mb->chip_info->extints[i];
+			if (extint->supported_interfaces &
+			    (RTL8365MB_PHY_INTERFACE_MODE_SGMII |
+			     RTL8365MB_PHY_INTERFACE_MODE_HSGMII)) {
+				mb->sds_supported = true;
+				break;
+			}
+		}
+		return 0;
+	}
+
 	/* Nothing to probe if no external interface is wired to the SerDes */
 	for (i = 0; i < RTL8365MB_MAX_NUM_EXTINTS; i++) {
 		extint = &mb->chip_info->extints[i];
@@ -1528,31 +1591,54 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1575,34 +1661,58 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 
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
@@ -1612,27 +1722,32 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1657,18 +1772,27 @@ static void rtl8365mb_pcs_get_state(struct phylink_pcs *pcs,
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
@@ -1679,6 +1803,23 @@ static void rtl8365mb_pcs_get_state(struct phylink_pcs *pcs,
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
@@ -1720,6 +1861,12 @@ static void rtl8365mb_pcs_link_up(struct phylink_pcs *pcs,
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
@@ -1982,10 +2129,17 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
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
@@ -2064,7 +2218,7 @@ static void rtl8365mb_phylink_mac_link_down(struct phylink_config *config,
 	/* phylink has no pcs_link_down callback, so on the SerDes path only the
 	 * MAC external interface force is reset here. Clearing the MAC force is
 	 * enough to bring the link down; the SerDes keeps presenting its last
-	 * forced state until the next pcs_link_up() reprograms it.
+	 * forced state (family C) until the next pcs_link_up() reprograms it.
 	 */
 	if (phy_interface_mode_is_rgmii(interface) ||
 	    rtl8365mb_interface_is_serdes(interface)) {
@@ -2099,9 +2253,11 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
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
@@ -2114,18 +2270,21 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
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

