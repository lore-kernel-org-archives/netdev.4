Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824020;
	b=z5itB+Xii9FuShes/gX1oB4Leq8kScNx8YZXuVS7xSfHM1JJxTBc98t9Ee+L7VmSiZw+
	 6xsgERv4T3OiWgLvmj6BybhtPk5JR9599Y4uEDRcXVmmhDWU790vwmowovvtZcKj7zs+2
	 hFkioMN3hO05mPTlJvvMZjsmex9V2mn7rtmOq21Y6CFH0nVwKITFoDffU9EalqxbQKPOX
	 bfcTaczwOckmwu5Y+CaPuZv2nTgaGmURVMfUBcSqdoL5/L+AfJNRSRGrk7asJFZW8Z2JT
	 00oDoc7dSwO/FghjyJDfHmTuokU4Sr6WnA8JXe122p1M1hWyfFHMdHITkMSvK5HqIlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824020;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=mljEtBKcl5jD36BIfOox4eZgZjlmsef+g8KWrqRMBSE=;
	b=cnp9ujzXhzYMIC0qcQ3oa+dK+GR9m9ALENdm4v8BM7+sz+S+YC2thKQ9XnEapVbDwgNb
	 Uu/t07e3gmnAY/ABWH6T92YwyHNsgzhb5Q1sQXGmwM7exdfpChccl+F5FL+rtKcYbVk4w
	 eUgXj1hWKYXMRI1gJNrnkJTyY7kG/od7+E0nMKcEj1UXCXwPmf2xxJP9XnTUA4vJsU4Mu
	 MD9jPx1nR61TnuEVs5UKDhkOB1w3IRax8SgO+OjpWmCfdIvbS5UC3p13SqhyjMbI7bz6L
	 U0IVDYO8n9HwVD/+ZSveTY7vYLZldS46rMyYcP59XGgvT8Heix+rND2nH83Pd0h+iUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="VLWfP/Zx";
	arc=none smtp.remote-ip=66.163.185.32
Received: from sonic313-9.consmr.mail.ne1.yahoo.com (sonic313-9.consmr.mail.ne1.yahoo.com [66.163.185.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A22606A31F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A22606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=VLWfP/Zx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824019; bh=mljEtBKcl5jD36BIfOox4eZgZjlmsef+g8KWrqRMBSE=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=VLWfP/ZxOOnDxmvHz5sq8lBYVGL7NHg1OLJWxEgp+lvc5HX1wRcJijKuzz6WF9qatYthyC1taSPt74Hsp4eASvFX3QGD0eW/Nwb11bSCLHxT/FhGhKN0M0/56CTZeJd+1zhw7eD+OyQIokZl5uDCxjk8dR86xkhewl7vFSOWR1Hdycm8Gptb+Puq35oQ7wr/ayrbICNJ931yWIAPgL93H84FFhRbJE5ZxhncO+Zq3IQ9hRYQ5caJQa7W2v67q1qwFHr1Hz9ePsFnmpKuYpKPu1GbDyA+X3aPAmZlMTQpE5MDwaRfAuHl8xYlnRv3XkCUYidhbIav++krjWRO/Xi8Ew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824019; bh=MuO37WPXfr/h+o4zW7qghnVfh9d/TQi7U5kuvDrU3OJ=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=OtfHbtEXONhnF6sMRWEkxgquwPoxfk0S9BszOqWyHXDeC7d19sIqwloKt+KPF54B+13gYFlgavJ4Fe05F4y2hsNFTdcM+9+382sLIL79Q7UX58OW+6vCp+OO8zcx/euU5yJ8N/hDy+JjYIEsmuK7AN7ZbrxTJ4OfPM0eh8Y48IyH1wB9jeGEr/8HIC6y0syYTppeOWEuNEjXNwZ0DgUN7kxM0yetbMRC4TOl/VJIHRnuAf9LzhPcu8e0vpM9ePmvI+shPiYz3RpXsloe+Df78SR33fJkKC98PrL7aox84WS+Vxvc6OcWI2s+r4kx2uyNNDqILovyRRexgSGDaVqKpA==
X-YMail-OSG: 2D0XyL0VM1kp9PL9o9sHdSuZgcuFxbe5j6JNfm2zI2K0nNHkDMLf5KmeXs7S1Iv
 XmekUEJ.IhJaeFIg0qfOqHFAeADuB.2HK3poVm1nOBeYw1vapjn3hAanAaBQEGqbeA3ZqUc43C3K
 Hdh2YxCzwMJFjXjgzG3M2DrUuCuqJr0srJKN1q.Fl.Rk1dQlRXjoDKW3Slh7eq2vRdIC2MAoacgT
 dmc230nxJRe0fTglJCVmMRkRWi2SZ5UNC7XUXFIlNa7K9EUJ8Dnod.grFPHIgMPDGTmTgGuOitYt
 JUcaD62nUp2ku3mc6gLV976xYKXSWZVvCC6pCWYVgP2nVPVl0F7C0Bl56BRTamVd1F.M59VOGISR
 oQ0XoY6VhTJcV39sLFrrC7aW4LVVYw.WyRn6F51kX1y6OqP.cGE2_s5fc6cbk0CVKqMQIOS_abDS
 leiLTFWAv8xb0CGPNM_vDlOS1WmwMy0zlNNnIZhau.eyo0QLZxP.TR6nMwhMi_s3VbqErv2Sus8S
 zdWWj17CuoMdU6ifCBdllP9dN6HEHRScqbxboG2DSpPLLO.SqykHoVe62wFSg9cOTZlFWJVDArD6
 BgvgAhO6fKYelq6vUyviiQ6von.BUonJBpLj_dhLe1cy8qJTOCiAR1s751P4VE2wxCXjn4uhKlKR
 6.mYNycn2ZAjlFVikff4vXYxHe7fkcj3yfS7RTJr6zSdv8_qAH6BzFBjSda7oDWnjazmUyzi.AF.
 zyWJoSPo5TN.0AfndLkzxCRODYiiWSIt6keXF3hWIGq8QQDW7DaOaJyVInGlsz38iTDz_wtcbfOP
 kSAKXoWOND8qziKxjymQeRsfeu4lfk9KlMPjxKJK_GMrqRZXD69nk4rhgCKqn6GeSPjPDmVcXGLl
 yj30xHpTdkeS5lIDh3GmbUTEI1WZHaaG73zyBN8xd148ZUDWGl9p1JXTNXipxynQB.gXYs07DVd8
 cl4vwXGIWMIz6N2bQ969tW3oXSauLoJ3x5CW.aftqlw75YnkC2w1k4k49MxKbrvbCqw3.E0cAU7S
 NrZQqH9xBS2j9pLiFYikEtN_xel5GXAp3JRNr9DXD1o1b4ivb_306YIOeoCaaaKNDMWOswGMBW5t
 0a75B6RVSIY4hBsCQW_UOITOm9PTl46UPsRqZW4XU7o81x61TKlcVfRFKmPcEZzStASrqdNupvjA
 sRcE6kZ0klSNvZRpcaJTGrTtuP9GegltFg1.9Pk5UWluC604rDMRzRi7OacXekSVry6NLDOBBZIA
 UWWVv1hATY0lSZrVHeZr3Ighvk940.qoNEJD9mp89gmLy9GUYmvAzC7dsAIACmoY2rmm8fqtij.7
 EynU2NHWTm7b4G98as1m.3IuGHXMcUkHjuohux506FMVhUd2tB4XN3xgBk.IwJsP54KD9BEEmB48
 pG63Gng6E7eX9olAN.0_2YxOQgo6iTZuOjPoQAvmCqNTSZ_qrsLDJ.SP69mm0sCWSARBqjAkPNTb
 XCvPROsNggh5hHrI1uD0d1m0e2NOixdtjXyM71omElLXiM4jcOo8_plNWRV68pnPM45vKaYB0pB2
 s1CwWoH6akGUaoffTuag4mwumOcQ6X57rr9_rbnXbX1EevqCVIo6_MN_BN.ZnBc2n0IESSVbDHiT
 vx9uq6rsQ8_UflIVF6quJ_j2RxGG0WDAN9dIiGZT1rsHj0nXdmkI3T5zNalv_tDRnHSvsfya74Dc
 FLu9l5JZxQ4J8z1B0LdBkuiRzj.R0FxncnE9mR1aicodXWCDp12w0F.nuefsaIm45j4JS1ZzzPrR
 wg5o5sbt2F.PQnYdGHiReZiz08Jy3rqumGmONRscHfdViqXooR8AxtKofPF9XfX64ASHNTbIjcyf
 e2TANRQkXXyYCluotKnSAzd8HBMn7rSeC_5hSmPYI4pyZQ.zCR32iDDAXSG94PUOOzdsz3mPz8aS
 4fJ_qodXbCiL745gc_U7PPf7kgmDYXjMhxCJY9kRTqxiX0S4dR0gkk4hPjJH1dVHWKvhcnns.LR3
 bGjdQFmS9QgBvKSpBb9PfBVfJuJEgGmc4bWYXYmCWJybhpgqRR9ZHfGYZJH1XrbCtsPpn0HLrgz6
 plb_fOKvssJ7FDIECQEr6_A.K2JePFrIXwENLaXlycmbBjG5uBrhi.YTDTqQfsQOaTFJm8rOz15Y
 1a6glKAWFNYLfVu68e45aV4PojqQ0L0Lo_LWZ0ApNgIQGNJiA0DnPAEbKd6t4MWdOtcqmYw2U61T
 ejDWhmy.aFafIpysjcljSxcSmllHZXM6vAX0ePXE6_gQIH4PKHA7e5VjLvCaOHSLDsRCm29OrPmH
 KAi_SeFR314.CKEKYlALiMk3uj8T7VynExTIm.Fw-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: a961acf7-c741-4127-a91f-ae2b69f1ebc5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:00:19 +0000
Received: by hermes--production-ir2-7c4859dc89-2g7rg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 38c30dc6a8d57a8594f4d9c7bc406e50;
          Sat, 28 Nov 2026 00:00:17 +0000 (UTC)
Message-ID: <10af6ecf-1a84-4419-8f4f-f020e15584f5@yahoo.com>
Date: Sat, 28 Nov 2026 01:00:15 +0100
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
Subject: [PATCH net-next v15 04/15] net: dsa: realtek: rtl8365mb: set speed
 for family D
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
index 05b84a5..7e88aff 100644
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
@@ -1729,6 +1751,92 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
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

