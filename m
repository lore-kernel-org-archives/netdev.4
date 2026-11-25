Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565083;
	b=Ea7yuAlx+qmBoYBeS0SXd1eivVS9UOnefinmmUhNQHoLe9Ij8SYrFkFysLZpHAm268kd
	 v5A4Ia7AZGp7SLxkLdiUQhTBO81ZbbQ5xlNr2b5FQZxfiaydNmsvDvI1dyckdtiJGUi8t
	 sQlJtX/tKqe9DVhJ8G74kK3zVWlbhSwpuzbIPeAGW4MdiY5wEw3xY6tntitHhcqqtprpd
	 D+K6a5pNZa3XogcYbeOSkL5ONFRde11uWUsXFe54XObcR6uLwfWqIgpZiZ4swahLKENGV
	 bhMSgZ5FpjzXJ/76pinqExdKQ29w+rozXkQE9yxMPvpzbmEf1/uz+lxS9D5jHPEY/nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565083;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=tgtKrOzf9/zztEZ/mArgDl7fGdK2wbVH3+5KHXGMxhA=;
	b=Mc5Np8V54tcrX+UXRaOW1Aohgxj8Gad5T3klY4jpgllyiV8AJ3LH4V604mMsldJEGRxw
	 oynRqg59uxaU7qV9M/7xrfjfXJj90KnZul0ofPnStnKQ3ifC6jBxmQs8zedLA8YgBkhbO
	 cilcdQtyy6AoN4Rv0GdAFB3X/GblzHGT/nU31Q/HVhmbUrh8WIpZjW9DsLO7DjHcJqyg8
	 xim8EtiGhldtD6X/5157NO0L4b1b62WMOMZQbk5nYinYpTmLfTDK5bczi5T5k1ghtNP+i
	 Rtc5EwOpiurNEteusK1IN555gbUDKGm0xnmRScvksWF92BbS+ubbQverBt2O5I8gCyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=qi+HN739;
	arc=none smtp.remote-ip=66.163.186.148
Received: from sonic302-22.consmr.mail.ne1.yahoo.com (sonic302-22.consmr.mail.ne1.yahoo.com [66.163.186.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D8B606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D8B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=qi+HN739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565081; bh=tgtKrOzf9/zztEZ/mArgDl7fGdK2wbVH3+5KHXGMxhA=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=qi+HN739xT5hAqyNx6iUCEjwD4QwWXG49hTxS9ilfol7bdWtE7f6sDJh5Vd47d5bHlntW5rM/ses/f//Ms6TBrla4bkcWidbmSZJK2acm1mNtXXZXdci5h7jy9l1lJ6lpDJth9gJnzSbBselqt2N+CPjifCQpR7XynsBam67r7855Tp8drchl6P/gMHuyzpqB2a/NW/mTk42yDo6crrYz32VZ5OVgFJMKMD0tUJQNK1qNtgp28ThMpy7kBesCLLgBp5j1JfC2dxkgQ9VSPGsIucHf60tWSxhGm7TYwRLJQcGj3Y5rxtr8fYO5Jbin34oqg5rCvgB1zuYhnuRcVWMNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565081; bh=0mb1Vm/8DAb9NLo4wvRWjQDWS0M9RHVbZnz1C7cUvJ4=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=OMUIbvyaZ92Ua3V7yhba+t3yxH9unZcotQq/rU9dtcHBjqDYgio7lNA8Qoy3o+SOp/69CoKLii5LxALAFtAzT4fwP8LldXJZ+O7gYBvq/GznrAsMnmgeZiqlnE1EhgOh9fESltV/ttWrJMYKw/zuA/KXVl2KrNrk4Bd2swkLNXHOZA5ih8hYJK/54K8YIFDBbRZmgn4/XJympUD9t7kqxK1VDxW7V0XiMGIwzyuxEl7H4/zfl+HmrWNkJo71M1chK6thXEbK86k447E8p97RD0iXolfWvyyhvf7QFtWXEFn0N5mxV6am/thXAQaTOH0swx4GzTdW+nd0BOLPbMaxgw==
X-YMail-OSG: RLYdB.MVM1mhFmJ_NfextfNFev8uoj53_rkPez01lnOXUjm2pqB7EQkwMOPQvKh
 bGCNiOK9q303CRpSWojWWB7rl2tijnOTuCQAFwrxuaGOMPBvzXrtPsn706YmwZSsAcQK3LBN4Jrc
 IBUqB8pEsphdgAWtJC6Bblf_nhxTor6wqtzwG0oxEUx4TcOq_0vSc9xnftptS11HbHpPLrVM9xx1
 P12rW8l5A1WlVbH6BngssyseIYd7TtvcFOVieAWydw3dBX7kfr0BONiAjc6HyvIfsbSWdHf4iCaX
 nZKKd.ZefYXXBAFzLa7eknILCii8ka.ABXM6ziesA9ZzcQSGoYNTcVEbTHHvPw30bK0_2uGGV_oP
 _1nbRQIAntTjcJ6QLVbf25SVKZvVMdK_jhpkrH89eIo3vR7Bl3cn_h2xjplEM4XUAo71IjdyOFgY
 bu9XqbuIqS4L_a9FnTN6U5uygcxDVH3XxGjMGwISLa8aeLqlt7Ffi9prOa5V_dzpB.DLURGh71Aq
 KneNB3pDl4OPWqute9TMwC1nEUscLGsefa_6GclDQhD6xL30Eu8l29SxsT3N1_TN6jmgfrScJaRo
 sk5ngxrx3LpOxetU0I2g95.5weLkyijah15_gPwXN9ImttSank_3.lBhx9wnI6m3AMQCYlDH.ksO
 HlKpQdzdw_3sT2N8vKfxsbeFc3.wooOiUaGsQL17BmQNcvSeEBIjtqQQI5HIqmDAaBppOG2QkiAK
 W75UKhnyfJd_HX5.8YMgKkd79_UD.Jw1TC6JBEf2mm3Gm6WGygn1NbYdgIhA3LKDW85.VWdHCGnE
 re_.x4QijWHkJGtNtloDdggEMJ8_cVSLr4cQFREWlvWTg2_2Ue52rciTNLUhP_ntIfptZTlYAATN
 ylVVqZzMxXOaxjof0YJ355457SgQNYZdDUdAW3J5OoNrzwS2JtHYIkqymdsrkJlnN9mpjboArgtj
 UjBvm_aqC7SJ_1qJLvKRxbbBKlLyplRz4S6hy4FfIAcuK9PKCQ_7YCMlsjDoZ_NLvMmf1rOklQRn
 1qw1bm9HZvHMYDShOeUHRyZKk9uQw.aEn0yBRPGSq_7twDzhWYbcBB7NFz1UNU91wsbP3s4r2DiZ
 7LdEXS6Qv7vjZbefnqtBespaV5TfeOxI_s38ZAeZUCN3p89Ck45cVJgr1y3lDTD6SsJRRTEZ18rK
 CrfmmigvSB8mXKCxmYIAluQlRN02SNQ4AIvInT88fn0i5EiGjRoP5ujb4o3YyuafESA76Axo7m6z
 4y_P0xXGY5iADZKIxgCyKG8SypsZwFoPF5.UV4XWxEatINmwvIrRh1Nj1ktNgvmWscLWRdGFCj7S
 2lIOQPMjhTBUyzlHXOyCxAMpdrlLq3JIGqHwHUjuHCmVvRspkGlJZmxTAbOGxAnGUG0f5BZ_7qEo
 4VZ9h0nX4OeolxVRwiTPkYk6oqfEr9HonoOdZY8aVONnhBKeZyerYd6tiYDwy1u2uVAuHIWHqatr
 jhmZiCGHlvJA9W1zZTGYPYbFUy7_Q.zLT37b0B3VITaCryo9E0GXiG32gTYAvZOiAh17wlnM.GKM
 mZfo56n_Gy53RvFwUXFxk7jeDL_UjhBm9NP9pqMlzazB.KL4yPMsgliOftoRvTiJobemoKC4voFo
 yL1F11rbYpC.yLfmhp1GmYXA3fwSs.HTe.NAEww2brphwfGmFqTb8Z5V8mSv_lh7m5OhN.qCsdB9
 PAdsp3SvHONhNvbNEaYiSmi1Ya_abHP09Sg1d76gSjEQ08ZnaJjXuMv9nNkwLyXORqKZSGdEUE4M
 oPMpC59CfVNFf9ZVR.L.qITwLgkr9IBtCTfUXUCvYMhwyL6yrth1.q5ah1fuheA72OilVxUnCO7f
 Zi4ytlRtrlY3CrYQyFzxpQpfQQtT3H4YL1bCLw2NewdobokvwKUOD.0bQjgox43qg64B44DRDcEM
 NqghUNS.SpciOdeWDDxKi2UAemnwiALFxFbfsCUfl1m08h9TRuBrCDGMfBhMGWpqoEm2J.u2Xnpq
 mGbX3Ye6zh6Oau1ekLloGCDL0M83SFkxWV4kbeUMmZZM83B_Y_4z7c6rroXqfBbko5JDnFRdW8BN
 .9BdV3ov_1zl4SNog8w..wdkbpZznaajUVIM1Gqn81ZkQhN9xEGmGoLljCCJmaXNRbHt4sH5Pqxb
 G42sh55aWRhW_UUiDP.psd.qLoC6oC17ZgvhnLJzOKOf7hhsW3mx3UBDAlcv6sItTSifiHvxtcHY
 7ivCU7SiOzWC3H5AgneTmte8z6gr_Q1qw0g3jH0GsZVQZTKxnm7MtHD8TuvEi5AR5FKOU65B0fsl
 UBMnPAncdD5CcAXlKGIcv32CTHK3boakxb337A79c1A--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 592a8d9e-fd07-4e1d-97f6-8ae80dfbffdd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:04:41 +0000
Received: by hermes--production-ir2-7c4859dc89-lptdq (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 12f54e3aa784591ea8f46d5df6c3d02d;
          Wed, 25 Nov 2026 00:04:35 +0000 (UTC)
Message-ID: <ecd99aec-5daf-48c5-be7f-e7de4320248b@yahoo.com>
Date: Wed, 25 Nov 2026 01:04:32 +0100
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
Subject: [PATCH net-next v14 05/15] net: dsa: realtek: rtl8365mb: set RGMII
 mode for family D
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
index c932493..ae01cd4 100644
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
@@ -1848,6 +1894,8 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 		rtl8365mb_get_port_extint(ds->priv, port);
 	struct realtek_priv *priv = ds->priv;
 	struct rtl8365mb *mb = priv->chip_data;
+	u32 data;
+	int ret;
 
 	config->mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
 				   MAC_10 | MAC_100 | MAC_1000FD;
@@ -1877,8 +1925,26 @@ static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
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

