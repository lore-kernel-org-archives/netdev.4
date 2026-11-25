Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564918;
	b=1mT+gXUeAXGubIvjXIzDvBNvcUVXynxF9NJWGUhoYsg7rfztSoussnQUMyB5BA69ZdcK
	 2Q3k+u+7QVMDn/JI5blg6rQq0Mk/wxsTcltuFLRDXg+3bq/E/sL/FvT2drtD08N57rwKq
	 BqIXCxwoBJThOoIAicyQFjhdfZOGELZoDvq29Bi5xbVsQOBYXk6jCmjnB28cM+vvnNL98
	 dyi0QaL7ZW6+r3IzesmtSG577FOJq+EVFJ1jPSm49dl3t8IbDWW92qJtEsFLyGu7TMWfZ
	 ZdculOKUZaZtS+BAGxR5PdY2Ftxq0VWHfY6cHzxcN4m4m3ItLFqpvN8CaUQPhEgcdug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564918;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=bn/mC1HOVXSFtgzkREaBpg5iOOizmI53HlgnLEi9ubY=;
	b=jzwKXSd4z/BgG4PSodLxlXpJ7lNyHnsraFbEtM/FY/P8GWwzI1rSLuKRWfOXm2qLJ9+Y
	 2nnzBj8iYDLuQkxmg1H1ycNj2E8J9RlT1t5eMYNq/hRFMHhHhihVlY3wDLtENleQziyyH
	 gtit/ODLwfdxK5HEo1kYEciHhLwEPfLjofLoSSq8lpaNvirBWyLzL6yb+KFMKq5JxEH6A
	 faviX0wwYPTNCfOSt820+/hSvlzLs5YqZQrIfwNE5xrmabFVgizM8LLYplXplKDAYp7Oc
	 BHXYKwry9Agr2jBKPykDsoaaEpU5hvLMgM2Ho0F6pJjjAWnPaCDmKqGY5TsHy/sE8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=piKdtcdD;
	arc=none smtp.remote-ip=66.163.186.148
Received: from sonic302-22.consmr.mail.ne1.yahoo.com (sonic302-22.consmr.mail.ne1.yahoo.com [66.163.186.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B76606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=piKdtcdD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564916; bh=bn/mC1HOVXSFtgzkREaBpg5iOOizmI53HlgnLEi9ubY=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=piKdtcdD3A/PfBJX4vklui4ThbyEkUkij3OUrzpqXkqtW3GScMDMviB1wUMkSO/criT+EfsTQPRn4o8ZNYwJwyz4FF6G6JOPK6FPuHQR1SggVluEkgmsBua1EaEHO/0QL2VKSsudD94izDQ4NIAH937nG0F1ZbwHFREE3U8UwVI7GDv4qz8rwv1UtguKHHH7X0FahxlUQu5lvpSnBoWPCXNrA3Q7E593wocsT63y7/TenNzLEQkgS494dEbAEJuTCuYhR4u28DNBhuLV/tLPA1vATsZo9nsVg0y6Qq1Y8WIgNqjMJAiWo3AkydqLSeajpSmIcNEA+g0UOLa3GMPRCg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795564916; bh=nImLabkDdszIE+Th4BYVflkeCA6ZuJVgkqAmAitpQVl=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=dvCOJQjzdE3AcwHl1T3k8IK8VStTpJLl4Ql5WPLPvx/pH2RCfxFiSP2J6ZLpma0mcUNpcANWFOjyWXE46fKpUblbWYLbDbJ0jI0ls3Kgg6MAHlVV0zBXDbcVYZ4sgXVKCoBgm4yrg1KGOIyGB06gHuB1huiA4dcCREiae+BL1wbSv2NRAomS58lX8jZe8/kZG4lmUe2TqeZiT9t3/fM0E4sZHOrVspEhZ918tz/EJvpkRpDsBzAbVsTIET2lsXIqSlGzIDODjoiT1dpNJuthAO7mrn/9XlGDH6QMh3uHcYVKkl2uCwQuEy3KgymqufEBFtikXkX2lKChAZSRnU3tLw==
X-YMail-OSG: 3ZAaYIgVM1mvd1IEDLvyMW4GjwiHovSRrOHw0As0pQmCVdTF_adKcBs4.Pklos9
 Jf3Wx1c7UKTkGSEyopOncPXdw56FPtQg5itfR0tHR7Krt0GmdOq7GA8J8cQNcdRx9NrQ2BD_2Y2.
 K4fsTFWL.VMTK3jbsI2nj789CHlYVcJgBDb8HI5CqvfO4A8Vs1MHdyaMAxpYKmU3OToF6JAjg.De
 6F28bdFK3yu4OpqMpmRzV39HSH8RPNL.F7.mmVZ5DsuQZR4dnrR3z6uPPeNWYuGrDBy8Q.VxJOii
 Pz2ZJ.RuTwmbIK_qJQ7i_6ARedfgh83t2qTxvb5.E1SsUWVBp2Glr0Scwin0lKnb2eUw1swmb9GY
 MxaAZ42u0veSj5uVxcqUG_KElWQ5Jezg4p0E.cDRSSyEguPVOJFlbtgymE9boCF4Unqw6KqkmD6N
 zNFPSqRAI5OiDfIUjfuZzT6AKI7ys_be.8RbX9LHRBQ3LuQsSd0odKY0AQ3YXKqU.0xGzM3UL_PB
 PIsY7F_fKBF2ANrwBBZkKyeCD8mjX4r33OsT_gspKT.L4JrMKGAg2.1luEXovQqeGTFrSYBjYAAT
 7UvAK.797CV0SqkVTlKXhLD.RVYKi42iJHoBi34AeAlfwsxp29aBN1jmMJKJqn1KTfx9MHrJlvn9
 jADScBYhdTQC2coqNILbiGxwa1m_q0s8ZUxAimk24UIkEGTgf0uWLMnWxqh2qIDleDrnpZgTFXup
 4z4p3lSIr0Kkx59Oe7bzvFR0Bvq576aHC6ERGEIR33pL9t8zQP9TDC20t8gYZp1FiAAAycPUblfV
 eKNXTNrdlBDapr5RbqxAtvmM1z_i4uhazodcQH785UH3651LLmilx7f4qmkPbra2Ci9EJMN3CvhY
 56DfaQPxyMvNr1.nRWw3.ZTyZKGWfMwaszrDhYwD0wv5BaUHtSgWBOHoTSElZ.e5FoK1yKcXKPI_
 bIFVzL4cSV1Rd2E3NJBzgm088yM_4JhDDbZ9mkzu5hXfjepspEBjXvgsuyc8n5SWIqULsTW2j2oj
 We3Wf2rniImLaQvCRRk1LIkr24d6QCqQLIdnLjH8Ovf3f15qLvGFIHtDSxyc2KbfGtnpAL1ImL7c
 Sst6eZFyFNVhF5f3If1v1.irL9qeXEJFJTn9dvBGWIiGhQ3NwGFI90VPhKdE0BxDu_YpkISNRqg_
 OpdAXDDZby8yLtHtTPvDs4j6g3uRSM3EBwd9xFnGnps83DtY_PNxPDW7QPw1vh5TRe_UPlcf6Ntd
 VFp0Wi746rRsEdUoQBB9saoln7t1ZDiDjVAHg3nrLrfeGp2b56wdvku3eCpHMsHjg0_UsTkwtSxb
 y5XJKdBX_aJtc1FBRSHGj_ehklnCjKwBbCo0_9IRUaFKF7UvVCO8X1hZSZol2wF9TfdGQeuQy9c3
 yef8Hz4_TAAjnikoRxdGNasBLwSybEGBA71oejQWkO29ZPrWpMQ03V3ilzkJk0IR8qDzNGZlVcUD
 YRulCw3RtRSfDsMLVTC45WHjiBJMH7WPcBkVRlbX4EDIR0MzGK0R9PGg6iEwmiNaaYOkTvFEJT0Y
 LMh23SvSghgTD3Jb5teX9VOEip_RShcuT2rFmE6sg8U5dCr2ZzyBk1hOWxGfh04YczCtV2Da9CHW
 uP3Vc2RdWprpLKXR6Fx3XXZFxjfAvtZog6GYtXuX_XDvs21UFO1UVhigl0glsWobX66mIoW9RAua
 3.3GGIIsGD7TC6GpILWp0CyzF1e5LROaPTfN5oK0Otdm9vNOSGmEEKI6TLni2RmZ.MFQ0aVo4gCK
 cIGOIk36MwcCANtnKUXLT5x.C7.CLBa4SlrY.qj6fzM2pSJTWwIPlx_miyzVQacGYzxUaUSYgLyF
 VHa.OQz4WR6PtFUvTnNRZmKyyVB.EHBhqS.7VgGm3_FyNqf2BPpheUcW5z6C9II9lvXS1tn.Mu9j
 O47bAb9yxYJwZdGT1p2Rb5nzuK1coVBgzQ2X.DiqPo.d4BYo2Dx7o1Q90JvXh_uPSQ6OqqyxDl3u
 bJsIxMyD_Ca6vfpH5.5jJPsIeKhkZbKw8ZKStiEPNeHZeYbLjFM39qhRkO.kUAcpU6QQm4dBKCr7
 CW7FIvjGnbHpV7F8_ByIc722DAU6lCg3GMAzNgk_FqE6GjfTwJ.PSgtJqpxZ5vHVCvEBBbinj3a4
 BgLaNhPKlUMm6uSsrgjaA5Qk.UZGQe_m58Nd1Euoo_I0o31lZ5RSLoYZ7hXKIA3K6bSCLF..BRHP
 qMYS.tHBxdgzHske7m9WKwtf9lTsCclKSKv4YMk9QWk5B8mVabzdQAYm4hgOjm8MFmbhV1soE010
 51cCPZhak20UMmRp9Uwb1qDs5zWnW0e2W6AopTzcvlw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 2ede1c8c-b930-43aa-917f-40fb361a30a6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:01:56 +0000
Received: by hermes--production-ir2-7c4859dc89-zw6f7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d6de7bd3dd9ceb01e9a8f5a05ba81c32;
          Wed, 25 Nov 2026 00:01:51 +0000 (UTC)
Message-ID: <b2f42e59-b629-47dc-a61a-d87580516fdc@yahoo.com>
Date: Wed, 25 Nov 2026 01:01:48 +0100
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
Subject: [PATCH net-next v14 02/15] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
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

