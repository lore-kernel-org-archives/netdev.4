Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.190.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795823905;
	b=cj/9YxQZ/GkiK2Wxks07nuBaQhSsbg4bIrkWrrZcPxtjMbO0CJyC2vFFCIETeIcvG98t
	 0AGHTLQ7qxkjn8ubjJsYTdGQnbZJUZeL2FO3YxkE+Uarm5HUNJx6F6+vqrZEXpg4TjCSq
	 eCK6zHW9cGQdoemTxSnKAK7pnhz5BBExlecGkUCtx+7/VR66CouL9lTQgrSMmNcApbqfL
	 3jVWrPCS5FGzwV1XqjwTho3mdJlzdXB8EEapq4sjoZKpokquqdBxjmG24R2b1cvCaKDyE
	 MhfmEDlFYc47sK+NuvF8L/hys9mBoSBA1llV0/ntBV7h81kx2Asndfs4STZvrLSQIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795823905;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=aHoPlxDQ2KQOcGwD+U3S0px8rOWSg4R/hZU7Rn6fMl8=;
	b=1wq+rt7Nj5k4nPm4K4gPJeWdH4QSClFUKALNC7k6j2il29COU/psmJ0zS+6iGwhCKeMW
	 B7iehAW92EVduxe3m5Nm0N62gCwVApi0/r/tNB1G45hle8ldd2VUUUYO/H1Yh8qZkLSp0
	 LuxZIX2syHiOnLwVwJgKhnSfKfNMxvHlGBR0Oa1CEp46U7SH0hLs7CU5ilvl9MgkLu+GK
	 CiQFQLbgo4dsbQNDAgXod2C8CXpFMNAEJ4q0ebXWykSIZLPz7EEi5uQg+Amex1NGnuQqP
	 TjUPFa5zn6CVyWSuumOkBotYpanjuCCE94caq0gsbP4/mn19qC5rZ6pRmuqf9WtfcFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rX1RMnBI;
	arc=none smtp.remote-ip=66.163.190.33
Received: from sonic307-10.consmr.mail.ne1.yahoo.com (sonic307-10.consmr.mail.ne1.yahoo.com [66.163.190.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8551606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 23:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8551606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rX1RMnBI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795823904; bh=aHoPlxDQ2KQOcGwD+U3S0px8rOWSg4R/hZU7Rn6fMl8=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=rX1RMnBIMBds7Ow5SZKIurjrbHcPr6qyxJn+hQINwpTD6qhVUtkte83Q4gX2xip6spXuaDQVZ0pUPhzmc8VDOMp4u/R7Wpa9E3rytXULhJUkNCqkOqwMoHuSkCQVpR0pRVaMeAMqNkZXsruFJoFQ67hXCdudHrQrrhkUEZPL7c1xEcQDLRGJoROkuUgYtGBUHWygucW83PZpRdJQM4nREdXof9TM4nxC1yPHLj5ti3QRi6ihZMwwjaFDMVTXFArivKDLfhTQa6eB1kaKxlNHu0CaKnSTHBbYcZEbgPeN963pdduAcFDR00crR/1L+vy9FbyYtB99olvtJnO9QTuXqQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795823904; bh=SwHAtgZCAR1j3U2KhwGXozA1ZvXYgEigqiBEVlVPSMs=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=KN0WaBftg2FOFLsd/Y7qeXV56JSjxLPRrXNtiY9S5ciRJCOlwU8bnDQnkKNaOkUr5uid9j96HF0iZb8ZHJfRmtRU67c5lwIbXLjHoaxqM46xmMxyZGbE7MYSwUg1zB+HxACgmj/7g/HpUGBgQkU3p68B2kO3trcJ36+CVuaHoI2ecKLaRq2HWBU4Lz66DHkKfnrtYiIrXLUS3IQiOPLVWw0ZZYMXTQek28qzdnwjh2KpIOsZ6WyXpMsyduNxGQdIzskiW4cqCY6KMVm33LqHMKwgFz1NmjtWVYgoNWMl1SpeOWnonmTK/awpCmu43lW7YI84VjMzEeTjBo9EZ0uzCw==
X-YMail-OSG: 1a80VnUVM1l289vwTDoIH4MtoftmHV5Mv7PJNo84XxIA97po4wAXhz176.x1xHL
 eztV2A1YdmkFpIB5m_0eaaFS8OwDFsk1_hDV48bPNcgpE.RtJfovk9J7MtbWOyA.pi7x0vsADk6t
 tzYix..mFqP4Rjx_zN6hU25pfPTqYTUXy2Ir8yOxmUZ6eArmDStZ_zcyPJlIEXUOeV4ug7r8_2BJ
 qZYcNMGG7khRCO7Z7rNVa8GVNR70C1IXXyl9Ny771es1HZhcbr92hHi8avKQXpLPN3nAOvegF8W6
 gJLIrs3xaW.qFssvXx9Elcs4qnmQcPnVy9Lu3ewytewLCMpQA4lYnWHt_99wvLYANoCmno80DByk
 ggFWbH3XCi2cuyIKiyojb4pM5GvpHdYVfFepOe41V2Ky.p8gLb7JYKWuvENWSxM7sEnoo0kAcWhJ
 pspaPectPFS35v5mH3VK6i.271gLYw1eOnfL78zeIqvcxqT33vNo3wb00NPAOC3NiWRBhg8NMUmB
 ho27W8qqUg.IgPn2rd6dcPJaKp03JZFn1R.sY0cduS2SP8zK8ql_gEWhaUr6DZ1aKOH3d1qjH3AR
 I4L0IOFypUftC_lnNs.DjBcpNKyR4SC0SEkrk1kgWTE2tkiw47ufI7uCn2ePfQ9rRyh2tzVGXimc
 .WBnp9bHdEPqzQyAp1w8VY19Uew3q4qMQdelv.SDv66mshL8fKi9niHJpMcTG.EDz30U.jNzMtq2
 XX0mXg8.92Up2T2ZlnIqWHR_orGg8qviHRyAAtnUdYVJcZVZYHw7FNMlb7PZ4Ajl55mtj3qKcMh6
 vwzMmwEURklcHEgfVWgjhAUPr5yovE84vS4Tl9s9bwIHoO9N4oV6hvSUxrnXpLVipI1zDSvVT3tj
 RDd0Kh.mGBbuBD.6Q70.T2YWLmXgXjOouVU3.02TVigtSn0ul4EHVjGvm2obFfktz_jpFzvLCbcM
 8Azm_GIiBL40PKQuHVUwEYbChR_.QYQMKeE.9ggtyX_V_.HghujPxWXmBAaUuOv0VyTpLsHcLmK6
 mi1JsBZyMEas3CiKPKPGlNy3S1gjZHuRmEG7Qa_VV6IVFuGZi2NYe3iIRESil9LmmqkeEx5VH3h6
 bqgI95w7cd4VCgu.XcFMAm6eN0NG5J5x0DGsAnhvUDQ2peCJjgrKmvdFYKJZFDX9Z1V3oLQkKO1a
 DL2H0RRz_pjNJTXOyUf_pZXnme9V0c4GWclELlHy4bRp30CtFTRhIMHDD_utwex8re0OTR6xPehz
 RqFNWMWk_teGUaKenSo4Xqk51JFyzfh6GJPkKe7YWtlFkIri8QGq6QJBrqGIWNZGnHM3p4KGYI_P
 pCKPcCNHuD8Avy2Mgw2J7nhdZBbZOSttAQbQWfJzFB69VKZHElP3C4exdL1I2jdUO3Uvui74uNDM
 6gfVJojqz8aIsdiH.oTrMdqIXEsdYmTdeUDQPRjSzYniQo1qVcnJ19G84WoBU_H4RJF7s4WZaVmY
 mDztOXEnC663v4T1sIc3sA7wVqlRf4APy8hySDQ4nf2.zUUfguq7940Z30ehbhnfYPhCK7E2k1D3
 _hWdT6ZeCwL4MOqMXn4z__u75rkuD.2t8vQucaxidRF6relOqu3NgEm.OniIwplReiQTKoWzXawv
 4PeJKVA2lINL4gZZqErLW1xPxXig.NQWIZk0YcCHIU5.lfs4ggeRTL8cNsDyVhc457WSC4R3f_qi
 bUk72nJjtIFM76uZps3Whbe12tP_NDxqlblvxAQirI5qwxverSsxBvt7woZ9r8TZwElkADA2gQto
 Aaa3kHrkv4kqc8zs5Lkyn5fbWCd1N66SKXDYCvpU0NBCrj7N9QGOWrb63cLHZ7vV6VSF9UGrbtDs
 LM8_m4_zOhOvDDU9ZxzFB4Ind55u8LE404H9CDykTFcCnxOWTTuPR8T640q.bT1dPLcj4NB7JT5J
 v4idD8Ctrag0L1FgjPlpqb.tW6vKPP36jD_OESFgJIj27qRlRTNLzmGL2Apjg.Zf3hGUdzn25mWP
 EvwYlwnc49buS8b_rrfLy30oThW9qegyEV.YwfvrjgpqH4wGmp8csrrKDMhgMLNkzFzwZ7YnXyXR
 t09T_KG9UJDMICmRGOzlimkM99AJDyUEZWbtTpvIzZbnVx3kCkiniEenVv1f.82bh8FYYzqXuYuX
 UrCgOgtoIKggCW9Td10wkyg4acsoZlH3bLJih_FUbsgMQ1tgKoT331K4kwQM9mV.G0qKaztn9ivu
 FGVSEWEh8k545vtR7Fx9G6iTlYBm0NNZYdHhF5bmygO3AbmDlDMbD.zP8KaOpUDGDubeEXS2t0E4
 7NrIXcJj7TWJ5OhJ73dk_0Ue3wkK5JamVrSXrB78-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: a7e9313e-7944-452a-a0c1-a47a9e08586c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 27 Nov 2026 23:58:24 +0000
Received: by hermes--production-ir2-7c4859dc89-622bg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c8b0324656d9d685bb8d112232ab0382;
          Fri, 27 Nov 2026 23:58:17 +0000 (UTC)
Message-ID: <148b1b89-08ab-4e17-8352-7975f1e1e46d@yahoo.com>
Date: Sat, 28 Nov 2026 00:58:15 +0100
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
Subject: [PATCH net-next v15 02/15] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
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

Add enum rtl8365mb_family and struct rtl8365mb_family_info, which holds
the data shared by all chips of one family: the family id and the init
jam table. Fold rtl8365mb_init_jam_common into the family C init jam
table (renamed to rtl8365mb_c_init_jam) and drop the separate common
jam loop from rtl8365mb_switch_init(), as family D does not use these
writes. struct rtl8365mb_chip_info now points to the family info through
a family_info member, and all existing chips use the RTL8365MB_FAMILY_C
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
 drivers/net/dsa/realtek/rtl8365mb.h      | 28 ++++++++++
 drivers/net/dsa/realtek/rtl8365mb_main.c | 69 ++++++++++++------------
 2 files changed, 61 insertions(+), 36 deletions(-)
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
index 6c11c36..19bba90 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -112,6 +112,7 @@
 #include "rtl8365mb_qos.h"
 #include "rtl8365mb_l2.h"
 #include "rtl8365mb_vlan.h"
+#include "rtl8365mb.h"
 
 /* Family-specific data and limits */
 #define RTL8365MB_PHYADDRMAX		7
@@ -638,20 +639,16 @@ struct rtl8365mb_jam_tbl_entry {
 };
 
 /* Lifted from the vendor driver sources */
-static const struct rtl8365mb_jam_tbl_entry rtl8365mb_init_jam_8365mb_vc[] = {
+static const struct rtl8365mb_jam_tbl_entry rtl8365mb_c_init_jam[] = {
 	{ 0x13EB, 0x15BB }, { 0x1303, 0x06D6 }, { 0x1304, 0x0700 },
 	{ 0x13E2, 0x003F }, { 0x13F9, 0x0090 }, { 0x121E, 0x03CA },
 	{ 0x1233, 0x0352 }, { 0x1237, 0x00A0 }, { 0x123A, 0x0030 },
 	{ 0x1239, 0x0084 }, { 0x0301, 0x1000 }, { 0x1349, 0x001F },
 	{ 0x18E0, 0x4004 }, { 0x122B, 0x241C }, { 0x1305, 0xC000 },
-	{ 0x13F0, 0x0000 },
-};
-
-static const struct rtl8365mb_jam_tbl_entry rtl8365mb_init_jam_common[] = {
-	{ 0x1200, 0x7FCB }, { 0x0884, 0x0003 }, { 0x06EB, 0x0001 },
-	{ 0x03Fa, 0x0007 }, { 0x08C8, 0x00C0 }, { 0x0A30, 0x020E },
-	{ 0x0800, 0x0000 }, { 0x0802, 0x0000 }, { 0x09DA, 0x0013 },
-	{ 0x1D32, 0x0002 },
+	{ 0x13F0, 0x0000 }, { 0x1200, 0x7FCB }, { 0x0884, 0x0003 },
+	{ 0x06EB, 0x0001 }, { 0x03Fa, 0x0007 }, { 0x08C8, 0x00C0 },
+	{ 0x0A30, 0x020E }, { 0x0800, 0x0000 }, { 0x0802, 0x0000 },
+	{ 0x09DA, 0x0013 }, { 0x1D32, 0x0002 },
 };
 
 /* SGMII SerDes tuning parameters, lifted from the vendor driver sources. The
@@ -704,15 +701,20 @@ struct rtl8365mb_extint {
 	unsigned int supported_interfaces;
 };
 
+static const struct rtl8365mb_family_info rtl8365mb_family_c = {
+	.family = RTL8365MB_FAMILY_C,
+	.jam_table = rtl8365mb_c_init_jam,
+	.jam_size = ARRAY_SIZE(rtl8365mb_c_init_jam),
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
@@ -724,9 +726,8 @@ struct rtl8365mb_chip_info {
 	u32 chip_id;
 	u32 chip_ver;
 	u32 port_mask;
+	const struct rtl8365mb_family_info *family_info;
 	const struct rtl8365mb_extint extints[RTL8365MB_MAX_NUM_EXTINTS];
-	const struct rtl8365mb_jam_tbl_entry *jam_table;
-	size_t jam_size;
 	unsigned int num_tx_queues;
 };
 
@@ -746,33 +747,32 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
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
@@ -781,14 +781,13 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
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
@@ -796,8 +795,6 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 			{ 7, 2, PHY_INTF(MII) | PHY_INTF(TMII) |
 				PHY_INTF(RMII) | PHY_INTF(RGMII) },
 		},
-		.jam_table = rtl8365mb_init_jam_8365mb_vc,
-		.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 		.num_tx_queues = 8,
 	},
 };
@@ -897,6 +894,14 @@ struct rtl8365mb {
 
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
@@ -3059,30 +3064,22 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
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
+	/* Do any family-specific init jam */
+	if (fi->jam_table) {
+		for (i = 0; i < fi->jam_size; i++) {
+			ret = regmap_write(priv->map, fi->jam_table[i].reg,
+					   fi->jam_table[i].val);
 			if (ret)
 				return ret;
 		}
 	}
 
-	/* Common init jam */
-	for (i = 0; i < ARRAY_SIZE(rtl8365mb_init_jam_common); i++) {
-		ret = regmap_write(priv->map, rtl8365mb_init_jam_common[i].reg,
-				   rtl8365mb_init_jam_common[i].val);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 
-- 
2.53.0

