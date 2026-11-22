Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340790;
	b=ffe/oqdxzo1XM5INBrrZO0quZ4NOZQtQkIeHXirH00DdnVRuQRXYVvEc4jzoCDuFsc5l
	 GXAzPAHrZr7YpMyhBJPPNJd/54Ys/Msve7P/5Fp5wyvcq5b+vLT9QL1om+dkI6/AfNLrI
	 MgzkxzILB+Bhp3q5U60qcTNL14L5rKVtkX48MCOK8WxIrxs5dai71oXUJMyuuOGbev2Tx
	 N4/5yl6/JZT8Fbp0JthJOZfNwSV/JcHamJwpJEnTtX43F1nt8xd2h5jBbMAZXzGv7D+mT
	 hVgS3GR6Mlu26bGRtBJWFaWbjOrUD5GO2vBdF7r/jMpWjABQx7h+tJZn4ODTE2twIug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340790;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=fRFc4Av2XL9era6FkWlYNZGiT0SYhlRK9nPBdwc06B8=;
	b=b9shCmwhMGekfenLGIKRqOmOVyh7xOyLqpMxfPMnMr4ce+9fvkwnvJcH+/Ss0JN4fqeo
	 rPkLmmmM6NzMiNd9Auty27vVUSBqiuV9vnMKbOvKmUjbn3OkIzoejWEeQ7inIrLBm8zkS
	 KqJZb5ykxvlm7Wu4LAu0+54K1Yzd3qhTLr87ADBqcmcRv7ezJXcB8SMpjRaT3yzFyi2oU
	 3c+03AVvSib/aEUrETAgnpcpqGpTFMobIgAZ+E0RjwqDX4oYR69tPJnH1VaZKnjQddjOF
	 wIYYi3gE/VW6afHaKEtLrVjc+4VlKF37GWdj3w/zHua3s8vytyq5H4bf2XyY80daCPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ZMaR2Xo+;
	arc=none smtp.remote-ip=66.163.185.31
Received: from sonic313-56.consmr.mail.ne1.yahoo.com (sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5FD606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE5FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ZMaR2Xo+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340788; bh=fRFc4Av2XL9era6FkWlYNZGiT0SYhlRK9nPBdwc06B8=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ZMaR2Xo+jOGkLBWMsJ9dH9L/rwq0US2RQgxI7ZNDMaSXEp6lbi/JXyGNamlhBmJ18dlCZQhRNbwkrP4fGAIqwwF9nE5wUPtxMMdcGHZuhhKKIdejNxhjzllPFUANMYRA7p3nEz2H8SGpzr8emsnoichkVAlCmWBWnf4HSZPoj8ENHxd/LpU5svgJA41MCxv/TjAjIJaNm4Xqulsrip+ghaMo0sZ/VjB5nypaBhJU989kBZbKwHwFNij7GT9JPAt9fKIOyNQfkBg4ZYHgKQ06W8N3/IvGpWzkVQvYiNGC2cW8Cgafr/CwunD7dLNC8E9oonyFZM6W/dU92lOaf91aPA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340788; bh=pUEysNqgEh2FGnmltJ1d2hdUDlWNoHWGmDGaNjyyqBQ=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=UxUHkMVWySpzkLwk7EIbb2eXpfNpf6KZLclRz6tjnazNQmKxfXqG0vI4GpMpnCt2PgiXbX+/23zSfed/QU5kbJZ+++5bo/bo1Lqi0TXnvuRJ9NTYCpgkxJBnWBEk5htKx23K2nzWLy/atvZVCZ2cu2BaGCwnY5AdNmQtpRGbSjpKWvkmE4lrHh6I563wS47OBC/ryvckpuTRnmCkkgvMPi6ScPL+gJi/UFwTGcOURnjHbCh6vbWuhHwJHPCzc6IFHYT4jOPND4NVl5zydzdnGdoHmgGUcKQSQNa8tHNd1xSLmXkzWFPxPGdx/9PEsnlxwBleo0ccR0OblYjGu4k4hg==
X-YMail-OSG: CYbQKnoVM1koH9Nqozo6xnDYrwEKN3vmt_1k6uCzlBEp4bOeDB5xrYYsKUT0IQM
 n8ISTM0xPfS7tjoFEMCtxq6hoFIPWmr4.7rW2hidNuHf3cHi0d74upTjikNiTPMTIzVt.92MS1VK
 lGGQPp7TZwipvFhUNxQumTH5M01mJq.Oz94ROp9u3EjhlqOG6vocE3mISwiRVk1uwOlqfGx3aLb4
 .mfmzh1flepN4s8FXQSnoq56.99u60xTtUxV7lzfhdfV24ib1ot9KGA0Kc.z6hasobJxWDDgTvTC
 ueGZtD2kUS7ZZykTt.wiAFGeTL8jrj3ipP3WwHNARC_2bzNhLkKkYjMc.j.LpxcVP2WWTV2VLRpw
 BSCNiczRiKD8CC6dGPyrDiSvzgN2QNSmrXxQO30hTaMzlfgEZwQ5n03RPglB2U1SmyC6EQTbScGm
 cx4V380d.hpjyK7.dZftAFNrWUQuPgleP5Al3YZKhQ9a9Px1zn3uolYZSzzQ215VLiW.8W2X.deM
 .eQ1OPoSzzOW4ThdUU5h_kA4zTs6Br04nqLStwcJrlyrLggl0tS2Fb2MGVLRNuCVYCHn90fRKG6g
 VzE5rI7u4dyhe.d6cOsgmpvivMr4b3D0_TSdUTDPXdBaI0Uw_mFCnR_t9yhZKfk6lGclwhU4uMr6
 1T3t3QLvhZ_DMzb_J_xXsqidHQ6hsHtC04Ju0obaausGE.oQk9o9YfrM8VqzvkeqpMTKqkGM_uKK
 7.VSGhRG_wEtsc3iK3i.hLcrnKIOXaSg5kQt87Mn3JuMCSi9qDonuf3_FCXR7wrxPpDmx2rLhWQ7
 OKlWQRlwkMxa_wF84eD7j1K8DK0d1ybJLTO_tQV9pVd9fVlWsQMVeWByiCcUigMyVOCeXJQMvPi7
 1mhlqmeLLzDhoKaOqAc4qD561YILjEwHFWuCQHr98_LsIbieZbUQuJKjCP9_NKJeLQUzHV8_Sda5
 .j4WxRsr3h77haVjJHmketD5MT_LMf2YIoisnbAe8yBrO2httW5Lrr.jvbe2F6fb_8QrdUNWCgtG
 aJRchji.P9NhvsCciD1DhapoFfB02bCq7IK4SX7sLxY5YL1nK.pAhLE7eXq1T94NHFQb3x1rLkup
 kEeJ2L0vS8ra4rlQ_kXJvnh6H1cxPtprasoaphjju909Y_C_YVH8FLHwg6.EyypQucKxtDD7k6iO
 avNOJRuMP0w4bjUoM.QN0hc3YkShioTpsxXsT95RtvVZ8UeRqu6.EUjHjGUjP2p6oWKJbffZ.s6p
 oEHkquRj.riLlwmuH4XoAKQF.qmmkN_eKRLMi_DLUaaR29NBVLEVa6EaykYoFHLQmcOZG4FsnTeF
 rvBEzw_1P.gtC2N8U9rZdne4noKMqxP9vnex9yNinLTf5Dt0ZItTSIRkwXEPIs2TD6ht.90yucJz
 pYHC5at3uXmw4Szt3b.LfeDu99267_p3revfGeC209N4uFF.DOELmI_YQBzpM8Daq370Wi3bedwG
 HH.Fljqe9BXyPkQlfI.Sd_bpgmTjQ60xo5lfdSzSC_e8_tlWLCjBwiv9BWTuzhJ7IaPlm7EWZwzs
 0yWcgclPwVbjOC_SeySuVNKWIA.ZIj1aymwgr5JXiFR4TGBL3Mbd9MFRU9Th0RHCzyr8L_zFIO1U
 bEvB0FpAeCaEKhk4jcH2fvyXXziiFGH2._jnIb8qXyEtPWKXHYr97K4RwiiQzKTZD5HhufEqokgZ
 22Ba288tPfRfUiGKhKsoi2yclXdwXcDekKH_gjs5EYR4yH46oP31DaUcLZJabMJnJENKO_DCs3Wi
 lvsxY1yvxknvk1XdeeS818CByseN1vK0zKcSeOwZKYEiEQTxUR.9h6wFXafoupn22EU.hF7aU5Qr
 sEKan_25dQ2pFXo4K8i0usd.yOcASqoKCBZRVoxVymO8220gzfrF4bef8LM6yv2XQ4O.yz4qcqss
 2Dp27T36kD_VpMhYJjO_7JRvgdEoGhisMmbn9iqiaRpTYoVurHdU.pf9.s7tiYx.81YLELuyD39B
 bADAA71oHmVbF7.5MBRpzUgHzEk7AeT3D8IHen07Dmv5TGCBFND5r5BG5adiooDhOApAtm10MRwO
 zgLB2fpKCM_s.qqMB4O3bviJTlNt9LVVOt9Penz.On3NzfOlNaWtIkrv42G5HYNdtzmXt.PnPPNB
 BWRFTXY09iYPYUIgmRAhURB9lX7iZpKY8laXnbIukSgUSJQnVkuGkJpTLhe7x3wbpwX7VXzq40zH
 NHHmg8XyKCmm.qbJF2R0fr81jNlEoQ.dT3K1ZQITY.cG5tppFzK07GA4mT1SBVnr2iz4KPyqbVy_
 LaI7e6GKx1HRsuM0uLgCTbU5p329ADeZtndp.DmmlN3Lc3sLdzg--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 01f875ab-ba95-47d0-a85c-eb3861109eb3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:46:28 +0000
Received: by hermes--production-ir2-7c4859dc89-8w8b5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 66456b3718d6b71464d4a038766c6b8a;
          Sun, 22 Nov 2026 09:46:24 +0000 (UTC)
Message-ID: <04f43ce3-74af-4688-9235-458d21545cc8@yahoo.com>
Date: Sun, 22 Nov 2026 10:46:21 +0100
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
Subject: [PATCH net-next v13 10/14] net: dsa: realtek: rtl8365mb: add family D
 SDS13 PCS support
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

