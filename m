Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340845;
	b=YO6EkEoKVJIduRIAczaof0hkXZD7raKWTQ+cYUcAzjeJ0etCWA3pHu7hZuMNXwF8nU5h
	 C+GKYNeDd7jXqgnvKwxL/buvtv8nntCnq6kvG2ZtiDKsdF2+wHkKafjOb6brT2zlZxqWh
	 oAFdGCXdC6u2t00UDYoGac9AihMCbhkPzkexpoK/dK8Z4IHPzYIePSVQkGuMt/lRYAvIn
	 c6V4U25NVR27F+k4xDSLTTG+qd5I1QjRTfiD/h1WRlSw1UwoWBW5HpG/QcGbfVmQ/J0AK
	 8gNZVtPaxGirJxjOJPpn2toifqum8B1pa2AoLp0oSpuszWCPLWDHUYImFfVtQLAUXfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340845;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=JuTA66QgZyDcdKSFBeixhG8AoG8bhepLvtAusJLTtBo=;
	b=ZCwtcIWC8v1VOEB9NpEFIlY/raMrZz7ZQ2ldm7Du2tf+yNjRN4QlyDmpTik9OlRFJBmK
	 ++fERfqoYd6D9mCeCSHDP93pwjV7zcstwbTfqNxgDtZ2eZU+D+DEn6LfAxoAaC+e2k2Ab
	 ustPb6uH0dZnftJa8u+lHzoW4BLJ2ye3I+C+QFQcCI+lGf/ecYUuUZ2ZsJFfmBwWWoGhX
	 akH8oh66SVSaxwN3RfvERSkbsvVlvBgE7ydPcXuy4Y1yH0KTVaJlcXOpVZcJV5tqQDNqM
	 Jo5o2t1sONhj3pSkXzNjTAWzs0K26PsB3XPq//3hlPpYyPieJH52GM0mlefTLcN8ewQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=QCyaR+Z2;
	arc=none smtp.remote-ip=66.163.185.31
Received: from sonic313-56.consmr.mail.ne1.yahoo.com (sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6072606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6072606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=QCyaR+Z2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340843; bh=JuTA66QgZyDcdKSFBeixhG8AoG8bhepLvtAusJLTtBo=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=QCyaR+Z2oJo8tGmrO8NLyqIn52xxPBzhIqNSNmvc+7F42SEYYEuw66tRA8QcS+Q59sAorl1ejC8t8Ggrc/KpFu/4sQPS8zZU6Q8u6UWsCOnGdUeSkQgc8GmtQ9I/6iEC40HMCmJKthiSY3BSxMf+aztS5WKdPL3lM3Uyjes0ka752WsBWKZZDvdz+TitsdtuCs+mI222ET2WOe/8NHI/D5zadCn49YAUOpqWmslWXJP3tVu5g+0v4dnNjsMKaJDg0aaMFMnM0vX5sGkZjTUgDJWajDyJyU/L9ueeSWs/3pd+AID8TVmfQCYKnjrus3WrJEdlIjWKSYt0XK7jAT6Ndw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340843; bh=mZpcrYSsFdHadjS8Re1LP6Xhnaxjf6tarTEJJ7izaCc=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=YU/Yq1WV+arTX2YShPVhwPEJ9CMmvFLy3PEmjRJ//JqnSSVz418RNn55u7f8/o2xctekUQNx9X7N7AdCas9+pAiqWSkKMOtA3CtlGsAwzRWbFnNJlGQIiiyoXbo0CdWG/fNYmMxNBNG2kPdYQKR61v09mSAb1Yy8Sa26OkmnAOVOzMDWsuKkc04UYWgZhdmAX3phUj7MYChoqi9s414BuJRRDfMtdZrpbjIAojW1hQeP84iPdoBnkcaEORgQs0qzGcnrYCGgVzONuvmyElw07oqb3o1YeyDzShXU9qrWA2H3ZNtGbJyl14H0QDtSZN0j5nBywLrFxxed7nLLGxyRVg==
X-YMail-OSG: tUqUM_YVM1nvuuyVNGaffvvuakxdDwkYFzrcvqRuiYV34lB91qjjgH573GhsKIm
 fcOnc6Q3ADTz7oyGkA9bZyEC_g9QF9zTgwMpbenNGOm8tfCPsMXCDLmA6_2x98gk0A0hB2n3rHTx
 hVjnJJWq.itkC7BGoDVR3RGTJn2bPzTb78frd4fzi_LYPyCECXpRgxB3CIPYcuWr0lkDX02.nRhm
 jpiBH4rIN5GuQCyxtWiPtf9WBerLKCurGnwXjlQMewR6jpv2THcwtZgFJgCaXh6AGfLuGlChPppl
 vJY09YMKYXMjstiUxOs_110H3AtLY8OYiz7zye7T5D5r6cuXtXghEmTTVyg6Kb37cWsgJ.i0X4y4
 joW3yhsknYpGkZIuE.8LKlG9kAA.nVyXg04ulPA3V4z1yLT4QlNHrCZMfoRmBtUFRti1Gr.q82dw
 HH7rHbNeAQNDb6sPY5hQwubTkkR9Huq_9sFH2hErhVtZlD6MjiJ4PdDkMND3gMSnAT_dSdnxY9fy
 Ibc0bzXgbO.CCecD.vjPL1yo0JOZshgvOeQRCVCedLWzDT3sTO6UKaXWreah0wRgNqmloDg0EFyp
 .afxZ.aHNi3RGAmrpspJngHjiGkcyOArXKbxg2tSGnoYVeRjoGqeif.d7xJ9G.JvgU1idaGZSaCK
 QFs4d372fkEQM4Xw4TYHfVF2R2DSFC6waLvOKvfwqzcrMp59nIaUDo2ZE.b9imbsxr5RurQgSYQB
 BMkzuhS3sPljFoOHbbWmimhFh.qHcPUOwDoeX7qTZ5AkU8xItEF3Hmmrl9rC8O71j9mc9mEtT2sK
 ZaFJR95SWtpHjb9rTd6i_pwOIIYCwnSudBrxKCdLE3071pq82AsyB4s_WPCTPF0U0xM67SjMUvtZ
 zcxM_ek3VIxEOwyo1GHW6sa.filTcTwo5gmROupsyAmlzP0CfQu9zvi9VOtkMrAauxuNGGEyK5BI
 HyPKtDYnz5ve5MW2ZS8Pql_1TEw1bufigN9LxvgnVX47plPgJustAiikX11LaoHsep_bOENXvGUM
 UilZ3YQ3qrFVFeeNZNaUCpt2uRsGHswLEVZ5Grl_M4UP9N3ac0sbxl7WjSJaLFMQ4kyKCyno6fug
 v78CQmXqI1wzkFaX1HpU95vl.pr.zrPcjSPAqARrhCBvcrv5Yhz2LOGTK5ooHImz79ENMFttEqtg
 yajzsaHBh3Gy9n3YqiLLikHmFhQBtQwUkZO2o0DS0IOV_HarknWhiTg8sfk1PU4Qli2IkjKmJ_RD
 bltO4I_0MpqN8sdFOzsUgKi.rcXEV6IQP_BjHPZotSNgD4ZSVLjhvje08DCCtD7cR2Qlo29NBKam
 mQ9s8CZiz8fPgERNFjiBxDAt283gZdPFGv5SbIfS2zmDHjteSjyOGyLrFJdnakfvMb9cUJc17zku
 zuU1Xsgg7V6Ys5UBf0LhJeL0lK5uCj1ywpixpp9uUuBPlNeQrUVMR4qri4IkS.T7p4m0nLSsZNsd
 X3lc71PIgJYFziIlbwKWcBREfaJN4b6Ki_i4fEUK2i5c3pagFvyT.sqV4EyJuA5wfM_zKIyl9X5h
 ri0sb9IGAtgr6svnI9Uchb3RkYn950NjqT9Kx4ta.JceYhwjB4Zhj2Gi0VYSMhI4GZm4ORUXMdoW
 HoAIKxWsth4QqSay46d.u25lySbMepSAcvO3w.1GurVxZ61X8dOT3qkcteJz5L2FXzwgjPYyOtil
 ij6T6HatabZ6siBh_dKys8E_dKEI7.m2AVDyeCY5OFFTvCb0EgqxTqsQCJ0AHLasp3plrMgdklVZ
 .XNEPGY3eL7lT123CsZg3roJcx1dSic6Z43lE7cwxzGh5fLe9nQESm9.g1cpNfAYBVGXIXGZK.w0
 oANPnujY3Vd9FJCmn2k258iXlS4AC7RdHqctMYhw7aRc3TLMO8UlnD5g36sWbHkDv_Z8qiW5codB
 nnJkkmi76N5xItI9jcaCPLhfn82okHP9aqxA9QhUBAzHW0r0wPDz5c6RFxrQokeydDTSCvnk77FF
 DyDHPFmZMKXpTNOObihgEnn0q.aGFbPsSuylmgBbwuOZ4BSEs9O8GLBdezDVWXRy5uRBC2nhBj_1
 tDGXxkJuLPh0_NOQgJMgpkEcizKSXfaYXMeeWV8GAzXppA.8_MRxGJGTXiLGx1QHPdPGfEjFjb.l
 XQH2wcra6Q2bDTwY8bNja62oZPyr5JYO_x_aiN2MyjgUbYLfv1_lybP8PJmLWyWCoPRjbBWjeABT
 nmYvD1yjvNnb7F1cFeZJllu6fwBR8dXCfz9TJHjcg0YWdWfpeMLz8KkAJOOGIc8liIlPFrC0TBNG
 _ygKCTmNMLWV6.n0T9Wh_aYMb_O1qImiuUf5mcYbbPpueWFnCmw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 1ece3574-160b-48da-a93d-e0fbd1763c71
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:47:23 +0000
Received: by hermes--production-ir2-7c4859dc89-4mhg8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8bc291e1ebcbce1da0b8eb478b9cabd9;
          Sun, 22 Nov 2026 09:47:17 +0000 (UTC)
Message-ID: <2572b8b0-a066-496d-8cb9-e70a45456a6c@yahoo.com>
Date: Sun, 22 Nov 2026 10:47:14 +0100
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
Subject: [PATCH net-next v13 11/14] net: dsa: realtek: rtl8365mb: refactor L2
 MAC handling
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
index 50ba2fa..b83e393 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -798,6 +798,11 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
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

