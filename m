Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824469;
	b=Yln1n7sAd2dIKNsOZxGZm7QOKa1RvEUlMq6bwG/BI2hGLD/mSwCJPmsyt5gByEaKyDP0
	 T6SK+rU6QmzgYIj65fW8tXFF4EvdwbtXddHVOao+TI6qax5AbkS0U5w6j59vmKkgM41hF
	 Eg9gYCecMdgeePWn2cgAL+NGZ08+lIz/3UfugYYaVAxu0YNTwDW4tWTBRBfFSjn88KXh2
	 gM6wJ28R45CHam2ZIr8YQboYYCSLpyhGJ6IepbOzr1/iUZCNeAHv+4T9csD0zIQ1VLijh
	 xxpVIYZ8YVC9FTqM5SZMuB6Hkz39WqD6TTRKL6JzzlTzhYc3YcyMnxZcKDHYWEet6hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824469;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Exw3XoBemdB+FbDP9dGJltnNHRHhWrNCWqNvWy5c2qw=;
	b=z59dtjEdKoT4tXOtlGVa+6vYfmZQxCv9GOFRjXXw0yPoaORSmbIt92joq0YcBy0zVNN7
	 +ndz6EHEv1zQKquLtFLi2vPhZmsC7kt7bz8/5ixV9bk7+DRFe1vYmpNsfZKyDMwUgdtE0
	 4MLQcVFMSnpzsf6/Wi/iptexCTWUZsDDSKSKO1tkoGvmpYEqNUiXlkgXyBds9iE+TKvsm
	 +qLGZcFe4uysw7gr4VrWAqJgUId9wJkM+ofiWyHZvyXFzpt2pMFsKkPRRq+dbaBYR64PV
	 yanlyavS7VSOQ9mbWsmUDinfIQvgLMjszQE5phMP4QLOMDnsr8Sf6LVLPl1UCrcmj2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=gYheMxbQ;
	arc=none smtp.remote-ip=66.163.185.148
Received: from sonic305-22.consmr.mail.ne1.yahoo.com (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD5606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AD5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=gYheMxbQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824467; bh=Exw3XoBemdB+FbDP9dGJltnNHRHhWrNCWqNvWy5c2qw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=gYheMxbQ57/Aw9tBAp47WvnAvGkAImv/N+HkpVmjFK+NCJVIrYuElQhf+4kzwckIJgjveukxNVcPWSoqWhG2svps02G32+qjWDgZdBApou8P0fcJa+s0SxqB89ySDewihmWw9wdeDIHz+P0p2E1Se1gpVMS3tX5lQA4syWJ85y2x+gTR04+cRg8OsjbTZKMnXwDyasl1jj7S5N3PBo8EgO2sUBuLuNr4RtJHyVHLLEZIchgMYfwE8CcZs5DhtFCY+ZUDCbHcQkN1JXlk/2GgSaCsKYUL6Jy3DYdcaYo2ho804TGmSi6F/fgJ55flW6ZVcES/VKWBDYLzh6YfBwGl/Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824467; bh=w00rd/04BLPfY+PP3cnkTCkCnv29mmEhBQTnkD1DtQq=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=RaAOiGZNZ4bsIWtJWLFVch5TPzGOhx2WenBGLtXs+QipMW6mC3QabT6vvc7riAYNrEuO9MJD6021A74N1wpc0KM2JO9pOKHO3KG4e3QrROTq2RKOZTR++zXm85lBumhJ92KruCYiiA8PuWHt39NSBEMWhrG3+VyhGiz6Fv6M4enkrV8bGdmzt5qVyGQilESww8MKFG/ZU1aWejPFvucdZGJl+u/xK3v7hom4ielrGmft3qoWXvmGfJHrqqI0XqQghCMEHvWzbjvSFt2gPQKZCXzVdqgzHS+WuZQ9EUPzbRUz33GvnE8oI2HS6JL2xdwkvFQcmDr61VHHWqosH767uw==
X-YMail-OSG: SGnYMPMVM1kao7Esh4BIsvwczEKO3HQ_2jORixFdlO6VCGIWBxdjgAdLAArxmVF
 0GzI1RdPXyX09AuZWpL1csDXeskrbT0QbH3DUr8rzS7LbxbvuqOTInNeKKqWnkJPDnnrTG7oJH2x
 UFuMSlj5R.poom1cwZK.k8f6CpvboFrGJSmaA3BpYg4PPN7oAl2zwMokZCChFp2bYN1jdIXidiFi
 rqnev7IaeNOev9efq_amx_a4YolXsLu.bZM_pv85GihSSywAtpYdEcOa2AHw3gvhhrxmL9HwEvfp
 D72DnFDetq23rOqJr7bn4aHwItl6_Huzb3POLFSWNrrUh7RzGMEqGssXijiSbPCBkp9UXIok5Aus
 6VafogSIupkHrb.sfcJsENbp1wtpGQCvmAVVafamOMPrSpxIr9OcuwODR4tZaKVNKyisCz6SH5b0
 2o07qksJedGqqnuCClvyFEsJQGwdND5_G0tXqexv_28hCmGy3m516BCwfk3qJAukrvkB1dy_TrNr
 2.G.viDCOtHdOFbSaP6W1B6YYjQN.Cz3.MO.LGTTPID6ec6VAhVQBnIy9DQazn5ZLo4vMziZBT.p
 7uR72r9Aawm7qqCz2ZHvknysfEJU_lULSoqCUOEpoHZJIipNWZCXonH4K.frpH6PtROjV6nsO5.A
 sTQS3Od.pBFWq1DeH0GygC3POrzHgekZLHAKRY7QV7MsXCkUtDtiNwMHm6KDwPU1_Eh1LDs3jlfR
 OS6_E1oUfOUhoFJ.tgw8.9ViVOnSfCldFZhwQGnU9tdFlOFY3HwzJYYavxuFQdKVUZDJoUkhQE6r
 BxRnwsLULQErSRbrl9NLzz5xlaFj1oaeHWSrvtvSKdHbxPlxoMH_iqqjc_TywHX.FFLqGazviGXD
 VEayy84uctQH3sCaW4tVs9R_3midZPrQwInWQUbobFo6e4ebnU3A8hr1MV.9USf.7rhSz2TGH_Bd
 ixCZhhFBdrNEz8PQElzJC.pJ_HHXEoBiuqLMzpxFrosMB0nbDqL5CO.7fxY5d01_IrhMScTMs2YS
 oPKuMRWwYxMj3eY32ahcGhwtsoqjdOzTGTCwzQXjoG73fVIhWOAcUFZtCOVKDZUcrrOle2W00GGN
 DC.RjN1NG1ZKfIAUxykJrS1TKTJtu6wr7ddY4KJKmbegeYH1AD.IifJvgSzJRkk1CWQO0xT8qvSM
 ckrZuBwPAgMb8nJEMPW76FVc9wME6LmkdCQOGJQQUIB2nsoFwKsQJzvzuqE1cYgG7j6TMiKX0VYE
 ORloif5lSJ2f2V3adMoPiCcfYkEaASkLpLvQaEezEYjy3sOqCeocXQ6ee4VnO1pkHRw0MPM_JW5u
 9hmg6gYQnUlHVz6K4XkXiEcYUvrLISa2iTjT0qBkY6U3Nid1fov.YpaWW_QX6vzo2343UeeOWE6W
 xnM8BYX_ZD2r7utjkZ67Asb7k0J075UPbHRKt1WBxmZro3sldW48V9hD4NhyL71VEd2CosGdou02
 FNb5R0mxo81b.ppBjBOaX9ODET4vf0lOP6VQEUqA0OMPm5C3bk5RgAv3jh.qKqzVkRjp.dDoEVh2
 a22V8l.mKlYJvWaS7QXbI64qpCo3_qLDkgj0LeG4ZzTTWU.ppO_YSEgFVaCsgEBD19xLgY5lK0hc
 5tZmz9tlrJ25p8a9usnsRlzXJ0lu1vJMlmlYQXHpR4wWEkbLC_NMxVXYcP4SIuVXFm_l3XdYGWJF
 URzB7cCChR47tW6VCiBJKFgbQ5KfmtzgSXxGnCIuDRaq7Z9O8AWGzidRy6fV8o1NcKBEp2PspD1D
 BrtTbWsJyrK_oJQ0r06DO9PnvvvYEV2vctWlSqXK5eupzbnJkzSgAxSK.SgCll.udIK.u1yUUWTT
 rRvCV6Vg3f83S8LQ42y9zf8TiS6NLWxMTrZ5v687FqX2v7baPtmueR2RGxgZDgE7czCMOYHhWohJ
 DtJVNX7X0XhqJ04RISG3O7Avbh7zdQCK4GU6uih4aCChHniFRhqpbXorv.1EndDnDYlO92ogX9Ns
 vgNiLqu5axHqDfv_S8PNus3Mv_Q8cdTh4UEo4TEJMCdaIKxMcTvXS6bTVkCs3IxL.cWw5_XKcuqN
 WC.jPptmY_dhH6rI.g8mYP9B5KAGIDOiJsraUqdUasBRnIgnnaeOVuBla5N3ZDLFxEsPUHwQ9Acd
 9TEOUSIAr2FQ_8fOqIzrkSRK7mHiAVTPg2gq16rySE1Wq2lvCgG6Y4SQrHvp44Nfn4qM75JY1v6g
 vrXzW9Bk67n5u2jpt2MafXxipIdl6xg6I3JAZGvgVa6EAEaiEBxz58iouWDOoT09CnL7WBBaFt_t
 5D2LQgkr83F_UlEVAFy_3LNbA74dv8wLrxWV2i4lL9ZpCKQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 90700932-c0ea-49cd-b1ab-dec0217175bc
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:07:47 +0000
Received: by hermes--production-ir2-7c4859dc89-nqpvs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID be4be7a794c797bd83d0bcdbe9a2651e;
          Sat, 28 Nov 2026 00:07:43 +0000 (UTC)
Message-ID: <87d733b1-56d5-40a6-9119-c6c2405960fb@yahoo.com>
Date: Sat, 28 Nov 2026 01:07:41 +0100
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
Subject: [PATCH net-next v15 11/15] net: dsa: realtek: rtl8365mb: refactor L2
 MAC handling
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

Add L2 MAC pack/unpack helpers and use them in the family C
serializers instead of open-coding the byte packing, since the layout
of the MAC address words is the same for both families. The now unused
per-field MAC masks are dropped.

Rename the family C serializers to rtl8365mb_c_l2_*(), export them and
reach them through function pointers in struct rtl8365mb_family_info,
so that a following patch can add the family D layout without touching
the family C code again.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   7 ++
 drivers/net/dsa/realtek/rtl8365mb_l2.c   | 125 +++++++++++------------
 drivers/net/dsa/realtek/rtl8365mb_l2.h   |  12 +++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   5 +
 4 files changed, 83 insertions(+), 66 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index c59e657..9a69e85 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -13,6 +13,8 @@ struct dsa_switch;
 struct netlink_ext_ack;
 struct rtl8365mb_jam_tbl_entry;
 struct rtl8365mb_vlan4k;
+struct rtl8365mb_l2_uc;
+struct rtl8365mb_l2_mc;
 
 struct rtl8365mb_family_info {
 	enum rtl8365mb_family family;
@@ -31,6 +33,11 @@ struct rtl8365mb_family_info {
 	int (*vlan_pvid_port_set)(struct dsa_switch *ds, int port, u16 vid,
 				  struct netlink_ext_ack *extack);
 	int (*vlan_pvid_port_clear)(struct dsa_switch *ds, int port, u16 vid);
+	size_t l2_entry_size;
+	void (*l2_data_to_uc)(const u16 *data, struct rtl8365mb_l2_uc *uc);
+	void (*l2_uc_to_data)(const struct rtl8365mb_l2_uc *uc, u16 *data);
+	void (*l2_data_to_mc)(const u16 *data, struct rtl8365mb_l2_mc *mc);
+	void (*l2_mc_to_data)(const struct rtl8365mb_l2_mc *mc, u16 *data);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
index 0494d8a..cd5b333 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c
@@ -6,18 +6,11 @@
 
 #include <linux/etherdevice.h>
 
+#include "rtl8365mb.h"
 #include "rtl8365mb_l2.h"
 #include "rtl8365mb_table.h"
 #include <linux/regmap.h>
 
-#define RTL8365MB_L2_ENTRY_SIZE			6
-
-#define RTL8365MB_L2_UC_D0_MAC5_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_UC_D0_MAC4_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_UC_D1_MAC3_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_UC_D1_MAC2_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_UC_D2_MAC1_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_UC_D2_MAC0_MSK		GENMASK(15, 8)
 #define RTL8365MB_L2_UC_D3_VID_MSK		GENMASK(11, 0)
 #define RTL8365MB_L2_UC_D3_IVL_MSK		GENMASK(13, 13)
 #define RTL8365MB_L2_UC_D3_PORT_EXT_MSK	GENMASK(15, 15)
@@ -36,12 +29,6 @@
 #define RTL8365MB_L2_UC_D5_FWD_PRI_MSK		GENMASK(4, 4)
 #define RTL8365MB_L2_UC_D5_STATIC_MSK		GENMASK(5, 5)
 
-#define RTL8365MB_L2_MC_D0_MAC5_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_MC_D0_MAC4_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_MC_D1_MAC3_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_MC_D1_MAC2_MSK		GENMASK(15, 8)
-#define RTL8365MB_L2_MC_D2_MAC1_MSK		GENMASK(7, 0)
-#define RTL8365MB_L2_MC_D2_MAC0_MSK		GENMASK(15, 8)
 #define RTL8365MB_L2_MC_D3_VID_MSK		GENMASK(11, 0)
 #define RTL8365MB_L2_MC_D3_IVL_MSK		GENMASK(13, 13)
 #define RTL8365MB_L2_MC_D3_MBR_HI1_MSK		GENMASK(15, 14)
@@ -131,16 +118,29 @@ struct rtl8365mb_l2_mc {
 	bool igmp_asic;
 };
 
-static void rtl8365mb_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc)
+static void rtl8365mb_l2_mac_to_data(const u8 *m, u16 *data)
+{
+	data[0] = (m[4] << 8) | m[5];
+	data[1] = (m[2] << 8) | m[3];
+	data[2] = (m[0] << 8) | m[1];
+}
+
+static void rtl8365mb_l2_data_to_mac(const u16 *data, u8 *m)
+{
+	m[5] = data[0] & 0xff;
+	m[4] = data[0] >> 8;
+	m[3] = data[1] & 0xff;
+	m[2] = data[1] >> 8;
+	m[1] = data[2] & 0xff;
+	m[0] = data[2] >> 8;
+}
+
+void rtl8365mb_c_l2_data_to_uc(const u16 *data,
+			       struct rtl8365mb_l2_uc *uc)
 {
 	u32 val;
 
-	uc->key.mac_addr[5] = FIELD_GET(RTL8365MB_L2_UC_D0_MAC5_MSK, data[0]);
-	uc->key.mac_addr[4] = FIELD_GET(RTL8365MB_L2_UC_D0_MAC4_MSK, data[0]);
-	uc->key.mac_addr[3] = FIELD_GET(RTL8365MB_L2_UC_D1_MAC3_MSK, data[1]);
-	uc->key.mac_addr[2] = FIELD_GET(RTL8365MB_L2_UC_D1_MAC2_MSK, data[1]);
-	uc->key.mac_addr[1] = FIELD_GET(RTL8365MB_L2_UC_D2_MAC1_MSK, data[2]);
-	uc->key.mac_addr[0] = FIELD_GET(RTL8365MB_L2_UC_D2_MAC0_MSK, data[2]);
+	rtl8365mb_l2_data_to_mac(data, uc->key.mac_addr);
 	uc->key.efid = FIELD_GET(RTL8365MB_L2_UC_D4_EFID_MSK, data[4]);
 	uc->key.vid = FIELD_GET(RTL8365MB_L2_UC_D3_VID_MSK, data[3]);
 	uc->key.ivl = FIELD_GET(RTL8365MB_L2_UC_D3_IVL_MSK, data[3]);
@@ -161,23 +161,13 @@ static void rtl8365mb_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc)
 	uc->is_static = FIELD_GET(RTL8365MB_L2_UC_D5_STATIC_MSK, data[5]);
 }
 
-static void rtl8365mb_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data)
+void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc,
+			       u16 *data)
 {
 	u32 val;
 
-	memset(data, 0, RTL8365MB_L2_ENTRY_SIZE * 2);
-	data[0] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D0_MAC5_MSK, uc->key.mac_addr[5]);
-	data[0] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D0_MAC4_MSK, uc->key.mac_addr[4]);
-	data[1] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D1_MAC3_MSK, uc->key.mac_addr[3]);
-	data[1] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D1_MAC2_MSK, uc->key.mac_addr[2]);
-	data[2] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D2_MAC1_MSK, uc->key.mac_addr[1]);
-	data[2] |=
-		FIELD_PREP(RTL8365MB_L2_UC_D2_MAC0_MSK, uc->key.mac_addr[0]);
+	memset(data, 0, RTL8365MB_C_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(uc->key.mac_addr, data);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_UC_D3_VID_MSK, uc->key.vid);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_UC_D3_IVL_MSK, uc->key.ivl);
 
@@ -200,16 +190,12 @@ static void rtl8365mb_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data)
 	data[5] |= FIELD_PREP(RTL8365MB_L2_UC_D5_STATIC_MSK, uc->is_static);
 }
 
-static void rtl8365mb_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc)
+void rtl8365mb_c_l2_data_to_mc(const u16 *data,
+			       struct rtl8365mb_l2_mc *mc)
 {
 	u32 val;
 
-	mc->key.mac_addr[5] = FIELD_GET(RTL8365MB_L2_MC_D0_MAC5_MSK, data[0]);
-	mc->key.mac_addr[4] = FIELD_GET(RTL8365MB_L2_MC_D0_MAC4_MSK, data[0]);
-	mc->key.mac_addr[3] = FIELD_GET(RTL8365MB_L2_MC_D1_MAC3_MSK, data[1]);
-	mc->key.mac_addr[2] = FIELD_GET(RTL8365MB_L2_MC_D1_MAC2_MSK, data[1]);
-	mc->key.mac_addr[1] = FIELD_GET(RTL8365MB_L2_MC_D2_MAC1_MSK, data[2]);
-	mc->key.mac_addr[0] = FIELD_GET(RTL8365MB_L2_MC_D2_MAC0_MSK, data[2]);
+	rtl8365mb_l2_data_to_mac(data, mc->key.mac_addr);
 	/* key.vid,key.fid shares the same memory space */
 	mc->key.vid = FIELD_GET(RTL8365MB_L2_MC_D3_VID_MSK, data[3]);
 	mc->key.ivl = FIELD_GET(RTL8365MB_L2_MC_D3_IVL_MSK, data[3]);
@@ -228,17 +214,13 @@ static void rtl8365mb_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc)
 	mc->igmp_asic = FIELD_GET(RTL8365MB_L2_MC_D5_IGMP_ASIC_MSK, data[5]);
 }
 
-static void rtl8365mb_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data)
+void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
+			       u16 *data)
 {
 	u32 val;
 
-	memset(data, 0, RTL8365MB_L2_ENTRY_SIZE * 2);
-	data[0] |= FIELD_PREP(RTL8365MB_L2_MC_D0_MAC5_MSK, mc->key.mac_addr[5]);
-	data[0] |= FIELD_PREP(RTL8365MB_L2_MC_D0_MAC4_MSK, mc->key.mac_addr[4]);
-	data[1] |= FIELD_PREP(RTL8365MB_L2_MC_D1_MAC3_MSK, mc->key.mac_addr[3]);
-	data[1] |= FIELD_PREP(RTL8365MB_L2_MC_D1_MAC2_MSK, mc->key.mac_addr[2]);
-	data[2] |= FIELD_PREP(RTL8365MB_L2_MC_D2_MAC1_MSK, mc->key.mac_addr[1]);
-	data[2] |= FIELD_PREP(RTL8365MB_L2_MC_D2_MAC0_MSK, mc->key.mac_addr[0]);
+	memset(data, 0, RTL8365MB_C_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(mc->key.mac_addr, data);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_MC_D3_VID_MSK, mc->key.vid);
 	data[3] |= FIELD_PREP(RTL8365MB_L2_MC_D3_IVL_MSK, mc->key.ivl);
 
@@ -283,17 +265,20 @@ int rtl8365mb_l2_get_next_uc(struct realtek_priv *priv, u16 *addr, int port,
 			     struct realtek_fdb_entry *entry)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_uc uc;
 	int ret;
 
+	fi = rtl8365mb_get_family_info(priv);
+
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_READ, addr,
 				    RTL8365MB_TABLE_L2_METHOD_ADDR_NEXT_UC_PORT,
-				    port, data, RTL8365MB_L2_ENTRY_SIZE);
+				    port, data, fi->l2_entry_size);
 	if (ret)
 		return ret;
 
-	rtl8365mb_l2_data_to_uc(data, &uc);
+	fi->l2_data_to_uc(data, &uc);
 
 	ether_addr_copy(entry->mac_addr, uc.key.mac_addr);
 	entry->vid = uc.key.vid;
@@ -307,6 +292,7 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 			u16 efid, u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_uc uc = { 0 };
 	u16 addr;
 	int ret;
@@ -326,13 +312,14 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 	uc.is_static = true;
 	/* age greater than 0 adds/updates entries */
 	uc.age = 1;
-	rtl8365mb_l2_uc_to_data(&uc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_uc_to_data(&uc, data);
 
 	/* add the new entry or update an existing one */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 
 	/* Assume the missing new entry as the table is full */
 	if (ret == -ENOENT)
@@ -347,6 +334,7 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 			u16 efid, u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_uc uc = { 0 };
 	u16 addr;
 	int ret;
@@ -358,7 +346,8 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 	uc.key.vid = vid;
 	/* age 0 deletes the entry */
 	uc.age = 0;
-	rtl8365mb_l2_uc_to_data(&uc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_uc_to_data(&uc, data);
 
 	/* it looks like the switch will always add/update the entry,
 	 * even when age is 0 or uc.key did not match an existing entry,
@@ -368,7 +357,7 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 
 	if (ret == -ENOENT) {
 		dev_dbg(priv->dev, "%s: %pM vid=%d efid=%d missing\n",
@@ -451,6 +440,7 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 			u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_mc mc = { 0 };
 	u16 addr;
 	int ret;
@@ -463,16 +453,17 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 	 */
 	mc.member |= BIT(port);
 	mc.is_static = 1;
-	rtl8365mb_l2_mc_to_data(&mc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_mc_to_data(&mc, data);
 
 	/* First look for an existing entry (to get existing port members) */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_READ, &addr,
 				    RTL8365MB_TABLE_L2_METHOD_MAC, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 	if (!ret) {
 		/* There is already an entry... */
-		rtl8365mb_l2_data_to_mc(data, &mc);
+		fi->l2_data_to_mc(data, &mc);
 		dev_dbg(priv->dev,
 			"%s: found %pM addr=%d member=0x%x igmpidx=0x%x %s\n",
 			__func__, mac_addr, addr, mc.member, mc.igmpidx,
@@ -487,7 +478,7 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 			mc.is_static = 1;
 		}
 
-		rtl8365mb_l2_mc_to_data(&mc, data);
+		fi->l2_mc_to_data(&mc, data);
 	} else if (ret == -ENOENT) {
 		/* New entry, no need to update data again as it already
 		 * includes the member.
@@ -508,7 +499,7 @@ int rtl8365mb_l2_add_mc(struct realtek_priv *priv, int port,
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 
 	/* Assume the missing new entry as the table is full */
 	if (ret == -ENOENT)
@@ -522,6 +513,7 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 			u16 vid)
 {
 	u16 data[RTL8365MB_L2_ENTRY_SIZE] = { 0 };
+	const struct rtl8365mb_family_info *fi;
 	struct rtl8365mb_l2_mc mc = { 0 };
 	u16 addr;
 	int ret;
@@ -529,13 +521,14 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 	memcpy(mc.key.mac_addr, mac_addr, ETH_ALEN);
 	mc.key.vid = vid;
 	mc.key.ivl = true;
-	rtl8365mb_l2_mc_to_data(&mc, data);
+	fi = rtl8365mb_get_family_info(priv);
+	fi->l2_mc_to_data(&mc, data);
 
 	/* First look for an existing entry (to get existing port members) */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_READ, &addr,
 				    RTL8365MB_TABLE_L2_METHOD_MAC, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 	if (ret == -ENOENT) {
 		dev_dbg(priv->dev, "%s: %pM vid=%d missing\n",
 			__func__, mac_addr, vid);
@@ -547,7 +540,7 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 		/* Return on any other error */
 		return ret;
 
-	rtl8365mb_l2_data_to_mc(data, &mc);
+	fi->l2_data_to_mc(data, &mc);
 	dev_dbg(priv->dev,
 		"%s: found %pM addr=%d member=0x%x igmpidx=0x%x %s\n",
 		__func__, mac_addr, addr, mc.member, mc.igmpidx,
@@ -565,12 +558,12 @@ int rtl8365mb_l2_del_mc(struct realtek_priv *priv, int port,
 		mc.fwd_pri = 0;
 		mc.igmp_asic = 0;
 	}
-	rtl8365mb_l2_mc_to_data(&mc, data);
+	fi->l2_mc_to_data(&mc, data);
 
 	/* update the existing entry. */
 	ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
 				    RTL8365MB_TABLE_OP_WRITE, &addr,
 				    0, 0,
-				    data, RTL8365MB_L2_ENTRY_SIZE);
+				    data, fi->l2_entry_size);
 	return ret;
 }
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.h b/drivers/net/dsa/realtek/rtl8365mb_l2.h
index 9470cf0..a9f9ae4 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.h
@@ -12,6 +12,18 @@
 
 #include "realtek.h"
 
+#define RTL8365MB_C_L2_ENTRY_SIZE		6
+/* Highest L2 entry size of any supported chip, used for sizing */
+#define RTL8365MB_L2_ENTRY_SIZE			RTL8365MB_C_L2_ENTRY_SIZE
+
+struct rtl8365mb_l2_uc;
+struct rtl8365mb_l2_mc;
+
+void rtl8365mb_c_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc);
+void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
+void rtl8365mb_c_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc);
+void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data);
+
 int rtl8365mb_l2_get_next_uc(struct realtek_priv *priv, u16 *addr, int port,
 			     struct realtek_fdb_entry *entry);
 int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 6dda4ca..c81ac17 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -808,6 +808,11 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.vlan_port_reset_pvid = rtl8365mb_c_vlan_port_reset_pvid,
 	.vlan_pvid_port_set = rtl8365mb_c_vlan_pvid_port_set,
 	.vlan_pvid_port_clear = rtl8365mb_c_vlan_pvid_port_clear,
+	.l2_entry_size = RTL8365MB_C_L2_ENTRY_SIZE,
+	.l2_data_to_uc = rtl8365mb_c_l2_data_to_uc,
+	.l2_uc_to_data = rtl8365mb_c_l2_uc_to_data,
+	.l2_data_to_mc = rtl8365mb_c_l2_data_to_mc,
+	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
 };
 
 /**
-- 
2.53.0

