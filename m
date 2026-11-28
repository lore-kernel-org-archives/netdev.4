Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824076;
	b=AQ8gfUlfp3THu6BhtigEA2zwPzKpKPfE5qEnukLfQSNCISA6s849LPR+sIzw52E5Dal/
	 TFlEcqsFWNlo9Fq2KsuSDdI4y2JdncQpTFl9L30MDhRfOci7n/nPVaqQr9iCtxWdsjWBV
	 Y3pwNkB5+TKiySxnpYcFioLEpe6iaQGafzIfQC6oo5ZffWSAwmb2HNDyumRYpMsZ/FToS
	 OQQ7nUTsr5UhqF4wfmd1noQatVusMNNeKTk/P15S0iVGjyMkzJgkNM8/dlRqcwOGD4OF/
	 TxFZToP8K9B5RaehSjwZd6VOVtQO5hzws1kcqnhwrQgcZXAAIN3L5RNCHiz8/gKPhRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824076;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=b/MXF+zAQs6ALPyCX5tnlGrF0haVlMvKQpxihXMzk50=;
	b=NX7RuI6RJ/5APloG47My16p+r5WZWrFnQkSLKOAP8TCZ/nM2R1L+et4Ss0sSk7AtEGkU
	 0JiqUYcTS+SJ7RVoI3V2mjO6eb6xUvrKd0+cy4ojk/lYCBtm4KFYXjdqmG8IvMelzXNE9
	 pTIEbLvxbIxZZng7uUj5g1jrqc1nzmHduieO4+QFuu6j4Chwf+Q1l89PsE8dER8IfnTIG
	 LtBlMlRERgC6AmOjbsZ9QAsMtoGw0uog9sfb1TMAA35Wy505kvh/FqvD16UIrV4B9ZO/G
	 MGI5ZauTBTnvmnz6d5mEhgeCtnebrYlMBvh5mSrzckOUGX84sYdtsZz6nyUYvLXzjNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ZGTjcdpT;
	arc=none smtp.remote-ip=66.163.184.44
Received: from sonic317-33.consmr.mail.ne1.yahoo.com (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDD606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFDD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ZGTjcdpT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824074; bh=b/MXF+zAQs6ALPyCX5tnlGrF0haVlMvKQpxihXMzk50=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ZGTjcdpTc3/SKqlxeyjueFCu6e+6NyyOWat1vaf0gGEPInna1xLW5xoA/a1KYAMM/5W1CZCZHwOFxkORdOr4T1yvSR/nM2tEYzNkV1Z/DNwoyf5/DFmbKAAtcgj/kAO7j7Ibct3GdvSiKk1ciO6Tptx/eJXKHAJ2XtNpgwSAxylmPoe5Bp6KACkuULkizRba3JFMLMrFGe51ecJ+OV8HuG2MgwfyUy8enH0FG/vfJYFghQam1HewTw11ilIj5cuyQQ7wAKadwc9I/vLJPDmR3aJytjlTzZI/FIP0KpPfg6wYwQt9ehlSUe/BJe4HW2d5w9n325sW009hS574w1tMZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824074; bh=olqmz71woI8OBek66kVE61bTWjLrQMfN+Z7RKNSjcNV=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=rY+Q7+NcEr0ketyOjssoxXTBNns447PlyuQTP2f3neSK6UcVVrf95X6yWZwMshPPtMaHmai466ArPHSgV/IAvHGN7bhHyYqCZB19G3xem9q8+SAOgWiTGEUQzEOp0oRmvdjOnY9C2bSN1dt0ZPkeHcIz2hdAlW2ZagTXCBZt039YtZAZka3tiRihVj7rBUqtKp7RmDX7udvYvcu5XHjXBiF1aLeNHNFu6oGbE3JAyw3go9I2fWJs3BvyPRLap05MxyXW7euylQkmCoF5JHYAKbOOoGd6vv4RoMoxp7Knw4hr6VR3ZHygfwMujX5drWa0fSLNg4nEIbWbeK3KU1ZW1A==
X-YMail-OSG: fflDsqIVM1nfWa67Npi4jm6q5bzkQerOhvpcNRqVDbu7J1y40aPq9C623_7M2CW
 DQTt0vyRgiAQBX.0Yjul27GjE0gbrWe9mCbb2yCzUoGq3yNxicLVC0dNEZHo076C7hL3YnMbdRYs
 CluGTMa4YPjHnxF8eHbudWqIC3V1LEkb8LVGIKRiAcO0sknPYQZWLrpRivOq06szlcGuQ2YZgzxP
 X0sZjelH1PniVcdpTo2lOl3Lrop.KE6UxBWGQK4rhQiVWjn.si6KYqhcyyt6mAgx1o6Zg7ncqhHF
 iZxiew.MOqd2oI8UQR7EG1xo9Rw5Zaw128_KqeeAlYstypJdxgrxPD3VXUkeGMzdFOdmyfC2V4wE
 DmtHnUpdbkQelsx4ckYrK5AXQxRwcTjMKFQ62ufP.sOzz3RW6i3.K93UwpEnZagMv1gYoUzWznbP
 sCEEOpLI8iseVl3PYJu2xiyYeAcGk1_gqLPfxx3cDZsaxZWGrI.aidf39M2TUfHLG19BPqnpg5no
 eaEjatjutF19k2pFzzcmWtCgYiJiGBZEWK0gkddVYWq83D3R16w2TcRpN7thiP2RaEO1B2eB0kaI
 rb35LvHAaqDCHkVP8JdzSDTfhErIdrWyjLvdmYwPWSNo5zc8GI8mbO.rkpUSlQBv3PIMnTWm5h1G
 lKrcri.sEbENGgXp4jch21AzLtKgrGM5p.ilJF_PgBU7e9CJkbl.ZSvweef.CzXbmrpObHuo9bUb
 TskQxUeONZTz3dZ.vq2OcFXVVmiMOE_ZNVK6LrEJ5IHX8kYOCzxCj70m40VY7nPuWEICuyhSnBrY
 sQFbK1qKKfns.AF17oi3YbCaU_KGWMY3WqnZ7QLvTZXEYI9_RPL.f_FC3DkMe7LfcCIYtF_Aud4j
 XVq13lQCX.C3T1DJj7sW4Jw53AvpwMTbgow8Iv8cxTlg2QN34ENYfHnASdM.fnWvomg70TEyVflM
 JMSLP9omYL9RjE1zep.MVRPBesxRRlAJbsN0KRYTFfbFEQuQ4WyOTkBtheaVmW6S3WB52wpdLEhP
 FsD82JOUR0Qvk0VOsbpMKUMGj3xH_99xKi7pfdcRZT0QLRdQ.44zAxT0xrFXp6XdhodUtQWrTT7p
 K3mHaZsVr96ZPnHJeEKSe3rcpTt5k2rD7sKt_9gkt59QmCb1kBMR.DZRowlK.AXNJUh.gDCIq3Qn
 ZgylyGAeL1HGerbJ5LFAcQKi6ow_1Ek.BOeWOxGYm051DOD46sjCssv0ed5za8vD0qidh9pN9k1e
 biYJR7NicuwupaPHK_ldf0P62wCuFJYZgarqmnQK4ja7EA2haTsybcE_7Qb9O9XujNUoXKDEWT9p
 pGN8BC_rPMS12QfluZAjjc8dTsXhZQ7hinFDNCW5dXrhT6vJTrzbeDX7.boEUdSJaveHk0B0zkjB
 IDCMFW_FMrTypzN1mXxrVCZcohA4_0rx8y5dI5.kA2ZKkochVWe.zFTi02av0ZMS8uPpp1aQOAHu
 .u19ireYLgYFuRRM2AiRb3aqAa983DGM8mE.Q1fLtMC71n8p5aS6.WAb2OuDP5keQ_B2n5ujO_Fz
 es2GO8FYzzFfHlODvYH4EH9vPUXH1zZxVEyEgy..XSSeANtluQVPZBvfEOvrXUmIU8Po8Mah1J1z
 Mtpr4YMjBRqmZ6tXn0ruwaXpPFQGQWiHXG150rtGEGg7.MuKU4KCO7d1BNNhKY34Lj5O08zcRaqD
 hHe7aUJm5uMBAzX_jJ93dyEFN8_QQ.YEYgRJ1lOkCJZAYKAvmPH7nSKqAVnDQ7SoPEVvoEtAESdg
 g51gBZCPZRopvBZrO0UN8QQ5a5HbcxzH6.KSLw7PlUU6JWDz49LK9gc7FyB4E0uEoSFwuaPh6vq4
 WDaUiYGsNcpsfda4wjN.Cj61g3OdPh9ZGTqFXPAVZQRk3.EPbpQUNkE5PJMCDQMHxDcA0M..JIw8
 o4BnQ_dejWKftUqliFXEZ4gTP2lI9vnELlDHdjiM_D9DciD9ERkqMGpnSK.WNlH2iH5r1mmilhDi
 rd.dXARxH41z2zUl0jSAUHuaWgUSwvqiced.94gjF7cUJsElCs_dfRWBCEdzLan2YFCq1uSEqORW
 GrMvqgUmH0pQgUBGy9b3Xh2fKM93oddA2fqtfU1abuqEnGxoIJvizqyLmCiL2u_cbdvQd0lpyR80
 KuyYO5pFPWYHGCyPmKpHwuhHns87.us1Msvl8EOHfGGcg6xAg8AWhC4uWqEU2YQpxiCxhBg1Jx6j
 lAA5dODfHpeI2a46TJI7K6UBU7NQDXPlTCaRy8_TgX0dZpC.PLjEov28ABsH9YIiRti3hsLEKpfO
 Dqr2smxUzu4bVccT9Dcgo66i0GYMwdGB_j2z3_u55acs-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 26991075-4492-467a-ad99-50044a8a26d5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:01:14 +0000
Received: by hermes--production-ir2-7c4859dc89-fxzr8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3ba1133812256b8431f9af775aa8ad90;
          Sat, 28 Nov 2026 00:01:10 +0000 (UTC)
Message-ID: <87250ce2-a1d1-43b0-b7f4-411317d6a848@yahoo.com>
Date: Sat, 28 Nov 2026 01:01:08 +0100
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
Subject: [PATCH net-next v15 05/15] net: dsa: realtek: rtl8365mb: set RGMII
 mode for family D
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

On family D, RGMII on extension interface 1 needs additional pin drive
and slew controls, the EXT1 RGMII TX clock delay field in EXT_TXC_DLY
(0x13f9, bits [5:3]) must be cleared, the pin mux in the top-level
configuration register must be set up, and SerDes 1, which shares the
pins, must be disabled.

Program the EXT1 pin controls explicitly when selecting RGMII instead
of relying on values inherited from the family C initialization table.
Set the RG1 DN and DP fields to 7 and 5 respectively, as prescribed by
the RTL8367D port API, while preserving unrelated register fields.

The vendor RGMII setup for EXT1 clears the RGMII field of EXT_TXC_DLY
(0x13f9, bits [5:3]) in addition to programming TXDELAY in RGMXF.
Do the same so that any non-zero reset or bootloader value in that field
cannot add an extra TX delay on top of tx-internal-delay-ps, making
tx-internal-delay-ps the only source of TX delay.

If the internal MAC4 block occupies extension 1, do not advertise RGMII
for port 7 in phylink_get_caps(), so the configuration is refused before
any EXT1 register is touched. This mirrors the vendor RTL8367D API, which
returns an error for RGMII on port 7 when UTP port 4 uses the RGMII
interface. The driver logs an error naming the conflict. RGMII is the
only interface of port 7 this driver implements, so port 7 then has no
supported interface: phylink_create() fails for it, and if it is a CPU
port the switch does not probe.

When MAC4 does not own the pins, bind the RGMII/MII pins to MAC7 and
disable SerDes 1, which shares them. The TX delay field, the pin mux and
the SerDes 1 disable are all programmed before RGMII is selected, so the
shared pins are never driven by RGMII and SerDes 1 at the same time.

The family D branch is not reachable until the chip table entry is
added in the last patch.

Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 103 ++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 7e88aff..f929db2 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -334,6 +334,12 @@
 #define   RTL8365MB_SDS_OPTION_ARM_KEY		0x0249
 #define RTL8365MB_SDS_OPTION_REG		0x13C1
 
+#define RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK		GENMASK(4, 0)
+/* Shared "disable" encoding for both SDS_MISC's and SDS1_MISC0's
+ * 5-bit mode fields.
+ */
+#define RTL8365MB_D_PORT_SDS_MODE_DISABLE		0x1f
+
 /* Embedded DW8051 microcontroller control registers. The microcontroller
  * can run firmware to manage the SerDes link, but this driver keeps it in
  * reset and disabled: phylink already performs the link management that
@@ -466,6 +472,31 @@
 #define   RTL8365MB_PORT_MISC_CFG_VLAN_EGRESS_MODE_MASK		GENMASK(5, 4)
 #define   RTL8365MB_PORT_MISC_CFG_CONGESTION_SUSTAIN_TIME_MASK	GENMASK(3, 0)
 
+/* EXT_TXC_DLY holds a 3-bit TX clock delay per external interface, for
+ * RGMII ([2:0] EXT0, [5:3] EXT1, [8:6] EXT2) and separately for GMII.
+ * Only the EXT1 RGMII field is used here, and it is cleared in RGMII
+ * mode so that tx-internal-delay-ps is the only TX delay applied.
+ */
+#define RTL8365MB_D_REG_EXT_TXC_DLY				0x13f9
+#define   RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK			GENMASK(5, 3)
+
+/* EXT1 pad controls used by the vendor RGMII configuration sequence. */
+#define RTL8365MB_D_REG_CHIP_DEBUG0				0x1303
+#define   RTL8365MB_D_SEL33_EXT1_MASK				BIT(9)
+#define   RTL8365MB_D_DRI_EXT1_RG_MASK				BIT(6)
+#define   RTL8365MB_D_DRI_EXT1_MASK				BIT(4)
+#define   RTL8365MB_D_SLR_EXT1_MASK				BIT(1)
+
+#define RTL8365MB_D_REG_CHIP_DEBUG1				0x1304
+#define   RTL8365MB_D_RG1_DN_MASK				GENMASK(14, 12)
+#define   RTL8365MB_D_RG1_DP_MASK				GENMASK(10, 8)
+
+#define RTL8365MB_D_REG_TOP_CON0				0x1d70
+#define   RTL8365MB_D_MAC7_SEL_EXT1_MASK			BIT(13)
+#define   RTL8365MB_D_MAC4_SEL_EXT1_MASK			BIT(12)
+
+#define RTL8365MB_D_REG_SDS1_MISC0				0x1d78
+
 /**
  * enum rtl8365mb_vlan_egress_mode - port VLAN egress mode
  * @RTL8365MB_VLAN_EGRESS_MODE_ORIGINAL: follow untag mask in VLAN4k table entry
@@ -1279,6 +1310,54 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	if (ret)
 		return ret;
 
+	if (rtl8365mb_is_d(priv) && extint->id == 1) {
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_CHIP_DEBUG0,
+					 RTL8365MB_D_SEL33_EXT1_MASK |
+					 RTL8365MB_D_DRI_EXT1_RG_MASK |
+					 RTL8365MB_D_DRI_EXT1_MASK |
+					 RTL8365MB_D_SLR_EXT1_MASK,
+					 RTL8365MB_D_SEL33_EXT1_MASK |
+					 RTL8365MB_D_DRI_EXT1_RG_MASK |
+					 RTL8365MB_D_DRI_EXT1_MASK |
+					 RTL8365MB_D_SLR_EXT1_MASK);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_CHIP_DEBUG1,
+					 RTL8365MB_D_RG1_DN_MASK |
+					 RTL8365MB_D_RG1_DP_MASK,
+					 FIELD_PREP(RTL8365MB_D_RG1_DN_MASK, 7) |
+					 FIELD_PREP(RTL8365MB_D_RG1_DP_MASK, 5));
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_EXT_TXC_DLY,
+					 RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK, 0);
+		if (ret)
+			return ret;
+
+		/* Bind the RGMII/MII pins to MAC7. MAC4 does not own them:
+		 * RGMII is not advertised otherwise, see
+		 * rtl8365mb_phylink_get_caps().
+		 */
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_TOP_CON0,
+					 RTL8365MB_D_MAC7_SEL_EXT1_MASK,
+					 RTL8365MB_D_MAC7_SEL_EXT1_MASK);
+		if (ret)
+			return ret;
+
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_REG_SDS1_MISC0,
+					 RTL8365MB_D_SDS_MISC_MODE_FIELD_MASK,
+					 RTL8365MB_D_PORT_SDS_MODE_DISABLE);
+		if (ret)
+			return ret;
+	}
+
 	ret = regmap_update_bits(
 		priv->map, RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(extint->id),
 		RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(extint->id),
@@ -1844,6 +1923,8 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 		rtl8365mb_get_port_extint(ds->priv, port);
 	struct realtek_priv *priv = ds->priv;
 	struct rtl8365mb *mb = priv->chip_data;
+	u32 data;
+	int ret;
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
@@ -1873,8 +1954,26 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 	 * which remain unimplemented.
 	 */
 
-	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_RGMII)
-		phy_interface_set_rgmii(config->supported_interfaces);
+	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_RGMII) {
+		/* On family D the EXT1 pins are shared with MAC4 (UTP port 4).
+		 * If MAC4 owns them, RGMII on this port cannot work.
+		 */
+		if (rtl8365mb_is_d(priv) && extint->id == 1) {
+			ret = regmap_read(priv->map, RTL8365MB_D_REG_TOP_CON0, &data);
+			if (ret)
+				dev_err(priv->dev,
+					"failed to read TOP_CON0, RGMII on port %d disabled: %pe\n",
+					port, ERR_PTR(ret));
+			else if (data & RTL8365MB_D_MAC4_SEL_EXT1_MASK)
+				dev_err(priv->dev,
+					"port %d: EXT1 is owned by MAC4, RGMII cannot be used\n",
+					port);
+			else
+				phy_interface_set_rgmii(config->supported_interfaces);
+		} else {
+			phy_interface_set_rgmii(config->supported_interfaces);
+		}
+	}
 
 	if (extint->supported_interfaces & RTL8365MB_PHY_INTERFACE_MODE_SGMII &&
 	    mb->sds_supported)
-- 
2.53.0

