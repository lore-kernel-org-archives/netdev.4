Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340494;
	b=aGW63VuQ+ly9Fzlp2plXEvzfWYYZnWEL5CH+4lzxSViUXk8d9BYK+w7VeT3yoEk5Cmcc
	 p37n0rloeLbevn7eYnZ1K/Vcj+U8xylZwY+R6iKybIYGpRhnxR9HGTz2bi51L3m3XI7FM
	 XbgjK8L4k1iro2zGXXbcHCvuV+q7VqcbtebK+YdlMHeJaAKxYR0e09Y/CQk7Tf2xn5nQT
	 Cy3kpEhP4Uo3s2Ybm7EkmX3mFOuop5cXN4euyippIQa0Hcli/OSj+IoFksf3acHYX2d/C
	 gWLZY5VHojHLwbE009Z0X+ZoYPPdUVaxfEQvGKnBAw65gsY5oLXL/rSVDMMRvYI7YEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340494;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=LDs4ZWSZZaVvpm+FtIy+QgQQuJ9i4RroyfKG1OJCpu0=;
	b=R7nhRqdcPqGcb3naENx9ZA54PmwMIZIcqa0CDOojSonZdgDNtig9YmcvLDlWAR7EAOc+
	 YsonZ0azBlK1OlrPfLJl7+2qyGR/mKDQMscLeKigT+1ULy3W+nxm5SNho3DEQYiGnd2R6
	 w/7dbI8z6K/7z1M6D1IDoa5kU8BK0sFnDKhTGOn29U8eAc5PfYubUS/tso2bUnhDpLyLJ
	 GNCQlWKL19Q7NQOw9nnVqz/DNA8Y/hskIgQwHXou9MdfBj0GhYsA4dkPdX6ayF6+yoA2G
	 GrQXc1GwzCrrl4j/IM4ttgGP5CBjW9afg/VElbWB50aT+anOcRtkUTffBvGIN3KVV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ChgFgxTw;
	arc=none smtp.remote-ip=66.163.191.204
Received: from sonic312-23.consmr.mail.ne1.yahoo.com (sonic312-23.consmr.mail.ne1.yahoo.com [66.163.191.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACEB606A32C
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ChgFgxTw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340493; bh=LDs4ZWSZZaVvpm+FtIy+QgQQuJ9i4RroyfKG1OJCpu0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ChgFgxTwKIk1Fr3ft3F6fcXqj9yvsxTlctpiRbCXv//X68cBx7ZxzlFFFpbB02eSD10dpH1bWpOS8Wn40AQdejbm6ykHJ+AFJaaaObkb72WL2LXX4cmhHef6hMOY/pKQY1xRkpkPA4q5pnjDkmfrjh9xDrynVItpXfPvuNfDYWS6OBfjpeZiWJI1kpJ30AKfvtYHpjLocZP0/sk4JkKQTKB7zSF20+gE6YUe8UlKYq5DP3jkvI9XnLZaAj3JHb6csaepMGpisuyQlQHfKzsOQt/Yh4brIXxyx0tEVUO32SVAHMOC/TkenITEmT7UQxVnRdM0wy+d2sgm/2emYLz7oA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340493; bh=S9SYwEOrc7b75Oeq+9xIQVPa3OObMA9CC+UzRLSAUL8=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=a1jJ8TD80T1MmWKcfp6nStGUTC8o70GeUw9xRM5/ptn9qO4aksC9A+IRpiMtEXTnAIO0MU+l/PtA4y2xj2vh7V+MRv6tYP7yBODT96trIHU/sYDCSBqeI2zh8V9ev0pMS/dQVr5JSBeuF2oDLJyWWckeYzgrmAXCr5IYE+gXQW5NQZxWvbSCo+kgaGAf8GUaGKpYQrMqZ9p7b5UtBlhb6SW9QK43vp9dhA8yd7dsFygQcbVrDnx8EaBCvqEOCLUbcP5BeSaV9/p5XF5BBdfNidBVM93VF4/IP/aK1Vl4852IuhmkcjmrLDuHFJRWzEBC5TZ7iN10vyDaQrhF3XcysA==
X-YMail-OSG: 5fygQzwVM1lBZlOW8pcY1WaYypdmQA05QvQwpNaKNWokhzYsJD7LuHD1bvkDHX_
 g3uXPyFZAw2_1Op3Fzl5pB1IR_0YUX6Lae7cgzGpW8.Zdq8Yr3qXxy.fUQrYk0oxvJMvIUX344._
 wmwPfiN2PA09VTraNBHAzq4oymKVqLaM0Xn.tszNwCDfICZ16HkkQR11qr6dK3_8eupcgRWn5wtL
 ahKp1DWBl6o_shLkJTe4amZnsGHLqVBWBcc84lU8aX_.6ODqP7aBdBd5qIJRmRfbHYajocvE9tMk
 Jb8foDs3n3SS7JyUsgJ2RDtciCV3WDyVp3C5I_WkVy9rVaHhxs_UKovWBnJBBjmF2z_DlIfZfnj4
 L0T_eZMO9TiCsIm9d7tMrmgTsQZzVsE5zxyXhT54nZ4tDtR4fAhRtZ8LbYwRXvzBiNWuC.c4ttdH
 whz._0K5ABVQesEqbtUGiSgu0q_s5GnKIP1n3z0.FyNf8UDnSfhVS.tk3H23Lp7JtWsEMAQfIvn0
 bkXY13Id7DRlYj4ZXm.aPt96u6dk_JUU2WW2fkep7tM2Dhdk3Me8cyK36Ljtulx3GPxEsFRd26Vo
 IfcPllcO6lsVO9Tp8Wicx4eDzATrvayppO0nrTU_JHJ273oMs_mzqrBSG5VJAnoC9nKjrYCscjKz
 qoH_An6o63IJuwda0sRassUzGZwIqyJ8RtcXcB6A1trZUNwhqHFvMNO29UOKreLgKLeTaCqDCDrs
 qP.w8f9Q6B7n.YoI6ziI83yCO58WhyCKCTqxbjbta9DaPVsd7ZkJexhh9SruS8vKHnQrDc8lzljw
 H7mcAcfBpu73iaH3jKzyuGabrJNR8aUlk84e9VSC565LvXv_t4USZYGQ61uBWMICiV9j3r2yy3ZP
 5MQee9C80WHOeBrq7zaGC.TrgkjLJ58_WJTHcGqimDTZrdBSAM_bxtzwd4q3Q1HO9HE3jsBSNkbR
 NUSnDBd3W_u35IBUO3mW3.cPY6_i7IHszXqRoHshvh93_WJ6_oSL2cUdvembZ5RfjQw2aK3Jk58M
 1wwGB4O6p2gZ7LZQ1dX9LEtdZ7ouzvwmwYxOsVmmGMLS_82fAUA2ZBpekU8sMfvrKz2V_6l_ll_L
 jUVYhFS8aHL12846cXh9N8fXf4I1AwDVZ_q8QEiqcobE7YcTQe0.wdCw1mylAg6yhLPzAbhrdeWh
 c30c67m60F8OOT_hrcbItcPP.2ZndutaQnc4xtuNvOPPBBrj_NGvrhiCW1U2s2w7KTHgpKM32oYv
 6oiifdeUV2ORLGV89mi1grLqIigrn1lp3VMbZTaGrDVW0E4OhQ41oP4xaES7.hixh3GS17WWRcoW
 1XGLnbP9ftF0HnE.B0GpWTk9n_Sv5370WZh7nCtmFCSlfn_7lIhuvC9Fe3fSYk0o2mtViaiY1mi9
 j6kDgmvi6e4lGiL7y14P3mL2Em9zVUyAlezh9BU6h8ipfzWOvH1.Lfxp2nZrP8q6rMQ1G35OoB9G
 .UbE0iQACJlYY6tO8isL1F7Mkhj3RAM_cFUbr6dpKhjlFLBatK5Qdfahkqyia69FFIFd2OVzu9C9
 bk1Y4UKgUwavgMUFvVxcKY8JFTS190lf0yJTiqjwd1nQDTAbnUTusmL33ge3p3rqVEiDXHQ8pEL1
 zjD55gxg5QEh4BWKIip1Lco5pVG0.31.i5N5Bv6jPG8LKl0m4PdCkYfmdMg5PA4M5S_nIEyPNfqk
 JWQNCyTFhnECm_m03.hTMg2HAxG.6K2Z16jwZB_GvGQ.o0aKYt1tklOEbJ8y90vn7KKyJFOP7LzY
 .lvefwaKF75xAK__5BhyLz9UghOmxzqnnOvPB6PbML7QLy4d2cDVeYsGCEimHDCjE_OGL4V7RDYq
 MHfo3Qs4FbJIbFMlngv4W.mF97Le_QPqxSrHIFCybBLzhwDYAgbN5DrZwrNjRHJp55HA0mTafL_I
 _5FhAlxVJNqmRBjonTljLDdTDeopgNmuM0Ft0fp2EnFzwnB6PuI_.q211Shk.AaJe9B.kbhlG4Br
 KqO3X8qaNRruFFksHtmkH96VSKEOgfCYaFfx7VKjsLdJlslmIQ1vLkQZy9tm8H3f_Kqb5TaWjcBN
 H6jKNZBYYVpLH4XUjNY7S_XVprh0UgJnVHLPsrQTo46vP3qlq4kzmjPsA9WN9UIcT37Lw0TF3QnK
 N3pV.nYmjXsTCNNS2qGviKLYGjtvW3NDZHdhq7ISNTBykHp9xFMpCcGmjevVMTzyDQt4aCkIpDFr
 Q3QiMU.I2LEHp8YHQeZEtJNLKZftNZbyieYT4rIMARvt_IyP85PXu9Jk63mk7qDcZbbMy.4l6BeA
 X5ApoMhCk1jyFiY3QfgDNLtmVCNc2iJ5HD3hQL.E-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 525d82e9-87a6-4f31-9071-2a180f762e78
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:41:33 +0000
Received: by hermes--production-ir2-7c4859dc89-l8wgb (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e1034e45dad834235fce1a8da348e997;
          Sun, 22 Nov 2026 09:41:30 +0000 (UTC)
Message-ID: <22ad7cff-1d1d-4d54-97d2-aec0241e544a@yahoo.com>
Date: Sun, 22 Nov 2026 10:41:28 +0100
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
Subject: [PATCH net-next v13 05/14] net: dsa: realtek: rtl8365mb: set RGMII
 mode for family D
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

