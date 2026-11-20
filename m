Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132953;
	b=XJmhG4lFliEjhQ3EhzNsGhNqMmPCiWhL+8CivBioU1AyR0gK+BI3ZPseQU3kR+0+lcPu
	 ZDlCkrFHEz0GGXmE5eZ+dDo0WcOdL26qjbq75pSF4atT+F0PWo84ISsDFC5uh2voCSWhS
	 wQCxc6IUZZhRigxB79F2nmWuWm4prO7x4jyem4AObgZdR0d/DBds68tFXpw9EmYpf+aqw
	 bzkJ6ZdSqD1GYRbAtaDUHqJlGsiAKSA9yOPSg54gyULpnwbKLHGOZAtqpTdsogxIxd4uK
	 1GMeRd38Rlk27Xuaxrg6tghynJq0LqliTs74kslT1u4t76BK5aUH38geBBtms31GaBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132953;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=LDs4ZWSZZaVvpm+FtIy+QgQQuJ9i4RroyfKG1OJCpu0=;
	b=wJSx+8/dmn3NIz9L+PTM9LVjD2rioLZ4Gop9Ma7kBraIkEhPv1rmXJm/VYq4y1LmoIMo
	 FHRsOftKqdkha8Lvh5IH/s7ZSPHmw4N5Wb+4m8w0u8JT3tYoO6YX1oHx6BrfFV+H7MkcF
	 F3H0GcXPSNIEOVu4k1w0IfHgUQIBwykPk7HH5ajqRs5xGv8N4FVmFYR+zXdwKMtp7vO4+
	 F91prRqpxKP9aPHd84CIa0ZQNxOOsPIQ9R6gkuft1iYYGKHQ50RUe9Hht02IQxEzkfQ8r
	 x4jIw6JKeC0isQaqapCalwsUHRdwYb5JfLgqAWZQJDI4cLA3JDGnlqNkhYG/LNVf4ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cqn26IJ3;
	arc=none smtp.remote-ip=66.163.186.148
Received: from sonic302-22.consmr.mail.ne1.yahoo.com (sonic302-22.consmr.mail.ne1.yahoo.com [66.163.186.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46F606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA46F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cqn26IJ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132951; bh=LDs4ZWSZZaVvpm+FtIy+QgQQuJ9i4RroyfKG1OJCpu0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=cqn26IJ3NL0q98PNoSoUmRyJAh07ym6XLYgf/MtHje34ye2yWL4Onv9Od/o8gYsf3pToB9h1EOErD2GyGOQrdz31qhEktT4TJRimxAvvVTysR1EiYErt/F3zDiNN6yUlROMZWMvEERFGwtTWtKM9QATqknpohnaIOM9wQVN0+3eXCwwhz2XH6tAe8zHwtwv7RZRERuliEstKl0YmybOubIZcZEbf6YFXNx6Um3EW1V6EX2yPvcxnIqCcE6cwje+XkcjsZyFkZ2Mn8pFIkRBoax7YMG685umCUn2Wn0M+2zxGrvbJfEIDVVJb4scg45G+567GQJDhfo+y8hQ2ec4qeQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132951; bh=pjbS6qVUVTXM9+gdscHEt3by8cvGjQ31nDjiGb5clnO=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=YjMYyinIDCE874vo+JQN/Th9X3GUZvYLITSWpngA2SYT8caT+8HqOrIgLLulWVDcaycKlmMQ61BGJW3HXRA+elsQ0Q0KOVCTcOCmJq8szVcgaCZRPFOjRzAf+OgbGzbWwLaIDXmdLCxwDSWkpKaCX46/+zLYpFJqF5mtv/S1qjjPdGHhC1z1mTXpdOegDfukDHNqrf4Ichd5ILoI4o6j+tGBSFSn5EtU+aUiNdMIJJmn1nZOLOLLckgfAEv3bYe9KILtzyg1+1OnWNgfSjdP76fv9nGzPTWF6jsKYcOYDaAQpuW89AZUjayB+oe/ypxsDYWPmqeha9IK++7g9jWSdA==
X-YMail-OSG: dZWgRcIVM1k9YQtXPtOrxtW0zjCD_..mIA0QWy6hJP93bF0GEeoilTh.pJMfvDQ
 0BWO6TZ3t0yPy_YrqPzYe5qsGks52munclZil69vfaD_EfAjojEnDQrhRRQkO.giauUwZ55uRKPv
 B5fsVIAb_Eb7mbLZ6IoBSCJjqJ4GbJaN00XfKiULdymrPuHSYx5WZKvLNF9QfABfsTKZ8jYuhUM3
 kNAWVFDoswp4stqw1rVUdC00LvbQwF9g4N6qkVrzFJVItblVFpbKskNHVaNPpV9HQphfgCsxNxZO
 w6fEGsB4CbdxgN33mNJsAo0UDTwyh32jsrWAAhimv9GAGbdpi7dZODZp0Sm01TRtXQbeFYZ15UuA
 kpJK1G6oWHrslpfVtu6pngF7c.3Tk9TfgzZ4n9uyiyktnkryz8PyURXmtbzdRTQs.ESp59l71qYp
 .ZoB6mAKqFxcX_3ahrb23JjMuhe5qfFHWnQhn0VrPDgAWEP8V5ftkapTjWHbglf6hr2nAzXDTC7R
 FnJrFjV8tlgqXTBunscBFH11lR_wPdpClpfCJpvMxeaf3pb4yTP6GnFFaa_yHhIdV9NFyF1Kb9hk
 m1cLafYS.K56UPWEc_ydR9RBlSSh06w1IH8I.i3qnkXzv7wDKbZO2WCgslWPt0GN3tiCQ5J4bfl2
 zGqWoeGCBef4enOk2_xCqrBAeyc4s58nTWzZfuxnemFPLKN8u7d5LT79rUHNOaQbEL7oVtf.voXp
 NH0ZP_aC4DRl0evaSYsT90bsrF0Vi7t6IjkGUhmvJq1.DeS0eRynXi3OsCGbYn6b31xKjDSF3yFN
 gobQdOyjTQLA1n7uaZ065P8t7ElZZzKtofbOLua9ueCAfwYGY8Z5EQll2bacxMCmyJ3p9NQLLDSg
 jsbYV0RYDrMAdXhBM7TPOLM6qfjBuXs1ywMsfa0ZUn.fHngw8F1QWAtxJI_ZyUFhlAWz3FGXsRM6
 qfWVnEMulKWiW_w.1DmSsvnMEopMnhPuCBLfpQPXzReRQuatoCKDwS7BVOpsCbHEr8mPoEZjWtMX
 vF7sy3n0xk.UuOJwWSvyRld05fAHyrNQWAS8B0YfvF8bNHrSRaHqC4vJPBzyqMHMo2COC0AuB6_D
 BVEZ5bl2ErnB3m85HUsdy54aDvAHbC0lFOMBDGVy7wXIZ4O.fKJCmVrLZKGdE1wAINbzwoxWgyz2
 PHhbcfzLCnSq22ykkxUuwTWbuUrw4oYA_KQodxha659pNShDeqIz30I952ApvPc0Su.7xAaKkwlr
 ih.g6kvF.4eOLil4R0VEahjRvPzJvgxegU6POtn4DK.gSrbxNWr_b.m1EtBoB0lWwdC1o_dM4y4N
 rtSjcxnACUl2gxHlFaxJ.XT3SG.lFEDVjNHHQv7m6sjfC0PFkSVT6y9hlwKUEgq08.z7.D6uiTcf
 Ahup0Wdm7RZKFMDJaug781mBiB91AinCrS.ta3J7laa_7w.5kEpcvsarA.rG_ApzreQZj5fWB__k
 a_1s5xgL5sm7Q_WuufPOLy31j3RBEU2.3DJ0sF98d_2s9Oq7zope9j1G1PXLGEeelwekrZgwRwGy
 rhI5tS.QurQaRkmIqfUpit8G_54ADmqESMr7Zh4nsTbd.9TWPxYJoboUMB.l.e0r_anE1kojlWi5
 AihdmWmJrA9h4UQ0czEq3W_T8v0D7qbXqnevWDXqeptD4gzAXWtfuaD8MpfLD3Emg1RBvwQWqdOu
 UCkMSnMWRhKJjgrKLeI2w5XpN.tZTCkVGMG5wv.CqZI2sB9KnRfPBGDckIk9SGyfQCtwRssErgY5
 aD_eVqpDnJj6OgJnViApWKQ2Zyyjq26EM4HRDpSsr5KbGaOd0o.auIIlki4gGpcxBYSouofIY5yo
 DBcl2A8Eqs21u2Vftz4Iy4ufCcqX9Q9yyt3WbuBJd0zNq2aUqizat.ZeLZQP6xSCwYW6lqbIUyuQ
 39MNmQwtv.BFzuGcC1PKmMXnUZgZ23dx84d3AN20IyprNW31Tnw3GZBE6BEhyvORTOACmMwd9OZI
 lgd39wV_x.RD_6rP8kGvBIiWIbEVLeJkG_aQzn8c1g9V.44UisdSskRy8gcNDFcfeBKOp_1Alryx
 .ir.I27A09YNXBVOVHL.acYcKeUEnRZwgpDmn9iroViolJ_eHOYWoCXv0EVfrP50Cc9qC9deKilZ
 oBCQcTJpjaY0BlmgiB0gLZGc207cCrgGn4SQfRC.bwbOZSx5KExo8D_4SESogf09RTW3MCGF2FTh
 Amz4NQOSJgwId5QBPab9930_Hce5IqwShkM07Xz4b0SBjQ8oZAh4S0skTZzkk4ncwa5KQvgH20Zc
 lwAJkfEkIteF50Yer5bjtLZADQIWSnVvm8qJr3XLfVw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: c13af66f-5ada-4dcc-a690-da135340c310
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:02:31 +0000
Received: by hermes--production-ir2-7c4859dc89-7fxqz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b1f1908292a8a88f8218d94c03b10c57;
          Fri, 20 Nov 2026 00:02:26 +0000 (UTC)
Message-ID: <d19e6f0e-a87e-4c71-b446-84d8457aba2a@yahoo.com>
Date: Fri, 20 Nov 2026 01:02:23 +0100
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
Subject: [PATCH net-next v12 05/13] net: dsa: realtek: rtl8365mb: set RGMII
 mode for family D
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

On family D, RGMII on extension interface 1 needs three things that
the other families do not: the EXT1 RGMII TX clock delay field in
EXT_TXC_DLY (0x13f9, bits [5:3]) must be cleared, the pin mux in the
top-level configuration register must be set up, and SerDes 1, which
shares the pins, must be disabled.

The vendor RGMII setup for EXT1 clears the RGMII field of EXT_TXC_DLY
(0x13f9, bits [5:3]) in addition to programming TXDELAY in RGMXF.
Do the same. The init jam table writes 0x0090 to this register, which
leaves the field at 2, so without the clear an extra TX delay would be
applied on top of tx-internal-delay-ps. Clearing it makes
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
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 70 +++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 05db3dd..d59f15c 100644
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
@@ -466,6 +472,20 @@
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
+#define RTL8365MB_D_REG_TOP_CON0				0x1d70
+#define   RTL8365MB_D_MAC7_SEL_EXT1_MASK			BIT(13)
+#define   RTL8365MB_D_MAC4_SEL_EXT1_MASK			BIT(12)
+
+#define RTL8365MB_D_REG_SDS1_MISC0				0x1d78
+
 /**
  * enum rtl8365mb_vlan_egress_mode - port VLAN egress mode
  * @RTL8365MB_VLAN_EGRESS_MODE_ORIGINAL: follow untag mask in VLAN4k table entry
@@ -1283,6 +1303,32 @@ static int rtl8365mb_ext_config_rgmii(struct realtek_priv *priv, int port,
 	if (ret)
 		return ret;
 
+	if (rtl8365mb_is_d(priv) && extint->id == 1) {
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
@@ -1850,6 +1896,8 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 		rtl8365mb_get_port_extint(ds->priv, port);
 	struct realtek_priv *priv = ds->priv;
 	struct rtl8365mb *mb = priv->chip_data;
+	u32 data;
+	int ret;
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
@@ -1879,8 +1927,26 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
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

