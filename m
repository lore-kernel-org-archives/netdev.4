Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132797;
	b=3rhuis6dQ//NA+HBDCB+eAw4OkkEj5EVyAvePrImyTpAa5g4eCAz48SrflLJn5COVERA
	 wpQfR06UbezJOjUIsgDJbGqu4FvGkijSCi04Qf7D8P0KOYndvUQ0N45ognC3uOUgNEZ9F
	 heoMPqV3PvSiPNKs2wsomW68UqLYHKNLJhdJ49IQD6QnWaC0pVYkfzwhuAMDHFpRsbk9I
	 7PxZfq3IlyL3Hy4XwEXVnr3YmxFy+AEhV/hB587aEMUojK4SQRnadTxtywPPZfyPo6+OX
	 bXDUST72BbLwn9oPYE/LsWc8JZMivs+lcBVlCchrfjcdYHJlHB/V66mVRWS9GRjElFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132797;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=bn/mC1HOVXSFtgzkREaBpg5iOOizmI53HlgnLEi9ubY=;
	b=08jGrDxT5WY8kgt6/BNvpr4E12Wwiuz1wY08fyMvmMIolscXC1oq+BYclkLFAjv2A46J
	 ZXZ5R7BbWkfeZ40cWpE3PzTPlZSpMijLub4YiETMEiTYA3RsO2/BuWPZGhUYXVlGxoMHF
	 VRgx573mIoezAwH61zhudG2nwRhafSlb9K5BmntR/iX7oNdZd1ycwbdqF0nzA2LwsFDL/
	 NcGc4fjyxIvF4UpNFOuXaZ6KzGYRjLc1jZw5T7N3kF5Qdzh7oOQBH9YA0oW7vqIoIrDw4
	 pn/raJ/zjChD8gLkN9eeWZIkO87kOJLLQC/hGHVWpi0l/YN0i9cuULytirr1EDTAEIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=BWyvN4mp;
	arc=none smtp.remote-ip=66.163.188.148
Received: from sonic303-22.consmr.mail.ne1.yahoo.com (sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B53606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B53606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=BWyvN4mp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132795; bh=bn/mC1HOVXSFtgzkREaBpg5iOOizmI53HlgnLEi9ubY=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=BWyvN4mpE3qhV8EACErMfDlsQO4yaBqTebdaAhoKsCk/cF273VZOgV+TenP+8n9qYOz7vjH0lfcJt03H4pIwXpIXbZiivz/bi4v1zELhRWUwahGKuX/3UB0K/iv5AFQFNa94xeTf/G57U2SFG8kmMi95sJoDOBy/aAEZfEPIPaV3nFnCEoBBu/3Z9TV6oPERORTZw4i26fAv1TaYSMwqBJ9DRNwP1qmina9/CQvynwA764b8iINnqqZEH4DrxbIAA0NtqkHYT1NtOYrR8CuWEZyR2WeE/YxLdCs2ISo19EmEf3l9IYaNTXZuyc5xR1i03kZsisMtuPtfjMHo9z/P2g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795132795; bh=UIuLB8yPRzjjOuz3cemLlb1wlxTu9fnpUo+qBRvYLR0=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=oPML05z8Iws3wKHja3Grq5oQ+nxc1AXYTKlgJ9BRI5aD4/hD9rZ8EJvLaTZ2BDQRnG8JK/Wh5B7AVXIK5KGEdQQr4fgsKnmwo81McAlu86pDvvWtnEosGRf+lPqQNmLyTcr5wMLdlyZ02wVCnYxj0VPqmsm1pxM6Ish3/x+dkDTClo8x2H40q0ByNvGvXiFvqCKG0Dcn/1bd3/GsOuGBKX24egHCCBR6e0PP/fpFObBYNDeroPnmSIcC3CnDsOhf5+fjIHKQy7jDISxzmMVu2O0e8sk7ReiXIyW5YXH2krrHg5cz4Z61IVTCLtVmpLRlRbz6ytCN9cD2Exums/pFNQ==
X-YMail-OSG: iluXvHcVM1kKBgPGe5qKGMTW65Q6NvjcJDCNxD67ke2VX5A8vGKjLorhXz5koSa
 KGSzWJj3UA1k99hGK2BVqOZiCxfOIncqgNYKxJAO4bslaAg25AM1tVZyo7gWn1DrUU8yDpLHbU.D
 qjCuZq76YszJJ83rbjNkHT1NXUUZjeBUhbl0hqFLEbPxUgYmZ5RpHfA0QzD1FIatIrbYHBCo5oyY
 Z5mfHOZTbHkTHZvII53KhpatRu0rPJ3BDejUYlTyiXBVaRuLeMMolD1AeFdI6.O_1MfYhRDiJMy7
 TjZfhSGtn0S77O9R8jf0QwMsc6h2OfFruu_ZfSt5pXPNpPFprY_asTwmgor9eZArMENwe4s5bZUu
 VIBjogeoQD2d.sgSx13qU2U98yLao25OJBRo45eB4sxPGOe2TiM0H2xFQxF1zQgV26JD5byWZT0k
 oOD3z_orwBlGsLi12Pz4M3nKiC0m.LpxrsVUYdEXZk1E.1YfFZj0OsICMWPpCE0IIGbMIhvSgT9L
 smHQm5kg46DiZbTjnO2EbFwW828rEmSU6cNbZM4gmHaKoYGUfFHwTwLV65z4tBGd55IXw49V.RzU
 58I1qpjfqg_NSBQVsiBi7rlNS3ukOGc4tkv6Fc_IIA6LyAmpTp9XLw1lYHC2n_GVdPwnKvrfUIJS
 RKZDI_yjQVP1XkoApxs_84G7jYlnZcnXYpgonwEVDTceYr1G6UJzHbGbi8KbTQ5rqfyDsrFDMm0R
 LbTSdSZc88MdQo1GwTXpvaQ.czyPg3sP1da.XcfN.1ysK_zrC1D4tvqXQeFvi4gRQQLJ2KX.WCse
 oiGKRrhspotdDuaELnrz_soB.aPCg4svTQO2e.Lx9RCGgBFHBOpYe.uireKLPdopc5X10srLAFS9
 gcev_rdWGNoHKARFsgGxLGM6isusuI3gXuhoQ6ub5lfTdUyhme9P9E1mbAbblpyXEzr00mHS003f
 zttMXmmdswoCYVp9CJ0nMAm8hdUd7wShiPJnDf9TLH0y.3EoaX990bNGMBKh0SZjgJXSz7QAjhNj
 1oDllDj8xqrIk8e9DBqHL64Lh6p1WYGI5EThhJPtNj0JPFN0_9.DEJM7OEAeySQitF1SS9Dczoba
 ffdbW4YecEx.J5h85MKV9ifiG8HJbf3Xc7YdfzOgztBbg4fnHhhtWJsjM3OPrXyWJegxX.fGbmB4
 TYjT_EBdizh7XumSERBz7UmRTNifh6_m7m0NFRB5Y5Yws_.TPsKXVMSrCpcBishI._.evPejuxJJ
 zeidhOlunE9avaPZtHcD3mvTrfuqthy90LEV9qNUChFKeQfkxc1tLyoIGQ9CyvONjQzZiLUfh3lA
 aCKgdofZGfFlOtdsk1pv08vZGCnU9rPORjTj2rDBqmBWwGGUlrQX0xuVQXAPGhPs56Ui461DPjPH
 x1_7HIdmsarzIuH60l3Jj1HIrZz40g7IpbfsbjsXAMRzhWOyPrv3af9T0zBuD8WifA.QIE8nCpTu
 m.ZCayA5FeFZX2Z5_VJSjc13zgByJvtrGLnfW_4tLvOOtEtO7D_GnzAAL4i614jFsOS.gbhD9UCa
 2q2yGCYGQx8Bl7NfqtAzSPL9vYgv8ltmJvhXgpLezfHmq3YHTjdZokoVeNSYDDRORNm.heUDID7Y
 nJWTaOQg6DDBn7zGEwY4Ilbnhfvm8E4PaS81.ukHpqUJt797Nf7TV56SAVwiG1LZvIjNV_FkSdeZ
 rGzSY1jdW1AxaP3Oaa6EB80fnwwbCRXHdeUEhkAvOvFg9qE1LSBEC8Gr27rHhgdtosEVJ7heS8gl
 9gyffPCxzjYANjeg0EAnIM82CEcEKisE9_ztxthBA4tEQHMGsi3.JXb.5Oz8UlWKsxeE0FcV4OkS
 rEM4n1CvEoksQu0U.VLdie89r2zzFN85rvUJv9HGqUSuM6j0WBRwbICpuoZnE1caADxSLluQqeHM
 aAwcJI92PGdzIWSHP33KHeUt2OflPgHkSpqhHqH7SDWVHEkmbPw_vtYb6GmB9Gk_Ix4TFR1zI8IF
 0TAnBRT_QvXPL9PixXV7LUBkCYOwRZqFgJpuOEWV5MQqK3dgbrEOwB2QU29k3lb0m8dDnxxk6sb5
 BTU.DKGcIVPcQA8yebPtPdJgPhNqKSTNVdzxihmofeeYNfQdW0LWDF1XgLYp8E4mOc7RTGAjqUs3
 iPQ.o3yzuIvufGXMIX.iA8EungzgVOVO2RigsUckQQKUjrbaj.ywql1.D668T.xdOomp05Wk5DLp
 5lQhzqjAbf44NAB9pHI9Kml6hio74s3C7vv4675wEUY_aNgyMzzWNWxUCL0mdliMIWTooI2v5jG9
 asQBLg2jvOzRnvP9za6fnjZdnCWN6LV8P1eXiRR4P
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 8f41bb1f-7e41-4cff-9a9e-e73e663843e0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Thu, 19 Nov 2026 23:59:55 +0000
Received: by hermes--production-bf1-8768df57c-gf27f (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID fa4efa2da8b38e6089740dddad1fe68d;
          Thu, 19 Nov 2026 23:59:51 +0000 (UTC)
Message-ID: <905fa375-c836-430e-8f43-d7e4629db805@yahoo.com>
Date: Fri, 20 Nov 2026 00:59:46 +0100
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
Subject: [PATCH net-next v12 02/13] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
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

Add enum rtl8365mb_family and struct rtl8365mb_family_info, which holds
the data shared by all chips of one family: the family id and the init
jam table. struct rtl8365mb_chip_info now points to it through a
family_info member, and all existing chips use the RTL8365MB_FAMILY_C
instance. rtl8365mb_get_family_info() and rtl8365mb_is_d() are declared
in a new rtl8365mb.h so that the VLAN code can use them too.

The available ports of a chip are already described by port_mask in
struct rtl8365mb_chip_info, so the family info does not carry a port
count.

RTL8365MB_FAMILY_D is defined here but no chip uses it yet; it is
needed by the following patches, which add family D handling for chips
whose register layout differs from the existing ones.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      | 28 ++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_main.c | 47 ++++++++++++++----------
 2 files changed, 56 insertions(+), 19 deletions(-)
 create mode 100644 drivers/net/dsa/realtek/rtl8365mb.h

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
new file mode 100644
index 0000000..7b0c710
--- /dev/null
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RTL8365MB_H
+#define _RTL8365MB_H
+
+#include "realtek.h"
+
+enum rtl8365mb_family {
+	RTL8365MB_FAMILY_C,
+	RTL8365MB_FAMILY_D,
+};
+
+struct rtl8365mb_jam_tbl_entry;
+
+struct rtl8365mb_family_info {
+	enum rtl8365mb_family family;
+	const struct rtl8365mb_jam_tbl_entry *jam_table;
+	size_t jam_size;
+};
+
+const struct rtl8365mb_family_info *
+rtl8365mb_get_family_info(struct realtek_priv *priv);
+
+static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
+{
+	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
+}
+
+#endif /* _RTL8365MB_H */
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 6c11c36..e101d15 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -112,6 +112,7 @@
 #include "rtl8365mb_qos.h"
 #include "rtl8365mb_l2.h"
 #include "rtl8365mb_vlan.h"
+#include "rtl8365mb.h"
 
 /* Family-specific data and limits */
 #define RTL8365MB_PHYADDRMAX		7
@@ -704,15 +705,20 @@ struct rtl8365mb_extint {
 	unsigned int supported_interfaces;
 };
 
+static const struct rtl8365mb_family_info rtl8365mb_family_c = {
+	.family = RTL8365MB_FAMILY_C,
+	.jam_table = rtl8365mb_init_jam_8365mb_vc,
+	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
+};
+
 /**
  * struct rtl8365mb_chip_info - static chip-specific info
  * @name: human-readable chip name
  * @chip_id: chip identifier
  * @chip_ver: chip silicon revision
  * @port_mask: ports the chip has
+ * @family_info: data shared by all chips of the same family
  * @extints: available external interfaces
- * @jam_table: chip-specific initialization jam table
- * @jam_size: size of the chip's jam table
  * @num_tx_queues: number of egress queues exposed by the chip
  *
  * These data are specific to a given chip in the family of switches supported
@@ -724,9 +730,8 @@ struct rtl8365mb_chip_info {
 	u32 chip_id;
 	u32 chip_ver;
 	u32 port_mask;
+	const struct rtl8365mb_family_info *family_info;
 	const struct rtl8365mb_extint extints[RTL8365MB_MAX_NUM_EXTINTS];
-	const struct rtl8365mb_jam_tbl_entry *jam_table;
-	size_t jam_size;
 	unsigned int num_tx_queues;
 };
 
@@ -746,33 +751,32 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		.name = "RTL8365MB-VC",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0040,
+		.family_info = &rtl8365mb_family_c,
 		.port_mask = PORT_MASK(GENMASK(3, 0) | BIT(6)),
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 		.num_tx_queues = 8,
 	},
 	{
 		.name = "RTL8367S",
 		.chip_id = 0x6367,
 		.chip_ver = 0x00A0,
+		.family_info = &rtl8365mb_family_c,
 		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
 		.extints = {
 			{ 6, 1, PHY_INTF(SGMII) | PHY_INTF(HSGMII) },
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 		.num_tx_queues = 8,
 	},
 	{
 		.name = "RTL8367SB",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0010,
+		.family_info = &rtl8365mb_family_c,
 		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
@@ -781,14 +785,13 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 		.num_tx_queues = 8,
 	},
 	{
 		.name = "RTL8367RB-VB",
 		.chip_id = 0x6367,
 		.chip_ver = 0x0020,
+		.family_info = &rtl8365mb_family_c,
 		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
 		.extints = {
 			{ 6, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
@@ -796,8 +799,6 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 		.num_tx_queues = 8,
 	},
 };
@@ -897,6 +898,14 @@ struct rtl8365mb {
 
 #define pcs_to_rtl8365mb(_pcs) container_of((_pcs), struct rtl8365mb, pcs)
 
+const struct rtl8365mb_family_info *
+rtl8365mb_get_family_info(struct realtek_priv *priv)
+{
+	struct rtl8365mb *mb = priv->chip_data;
+
+	return mb->chip_info->family_info;
+}
+
 static int rtl8365mb_phy_poll_busy(struct realtek_priv *priv)
 {
 	u32 val;
@@ -3059,17 +3068,17 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
 static int rtl8365mb_switch_init(struct realtek_priv *priv)
 {
 	struct rtl8365mb *mb = priv->chip_data;
-	const struct rtl8365mb_chip_info *ci;
+	const struct rtl8365mb_family_info *fi;
 	int ret;
 	int i;
 
-	ci = mb->chip_info;
+	fi = mb->chip_info->family_info;
 
-	/* Do any chip-specific init jam before getting to the common stuff */
-	if (ci->jam_table) {
-		for (i = 0; i < ci->jam_size; i++) {
-			ret = regmap_write(priv->map, ci->jam_table[i].reg,
-					   ci->jam_table[i].val);
+	/* Do any family-specific init jam before getting to the common stuff */
+	if (fi->jam_table) {
+		for (i = 0; i < fi->jam_size; i++) {
+			ret = regmap_write(priv->map, fi->jam_table[i].reg,
+					   fi->jam_table[i].val);
 			if (ret)
 				return ret;
 		}
-- 
2.53.0

