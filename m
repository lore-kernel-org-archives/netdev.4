Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.191.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565420;
	b=tkONQxkkqU8W9IiTuo+xeJq1mesHULidVkPY4iwEMfJ86EycJK5zDCzze3Z3ULOhnA7J
	 zZh98AChgYmhFr/UBS8BflTcD8KPorSUwzFK8jZf516BVqJ2t979mocZAkFrrhq/oEAvr
	 OQ8WkwGJQ9bH71vbdVnXwtlWpuPYSrgaiWCkYEdOjzZVUwTi/7VIeD89PuNajg1/DrMD+
	 TQ5n9DTI4iGw4yoRSlrMCccZFRSbgxWAqLRJSm5bVyMOLtYp2BuJd0T1Ilf3uSE8P/o5l
	 DJetpVYDI3A2MKtw9fdDNDcqBDDQ4ppZo9x5KwbAnR/0g0S+8/IaHh4vum0+qmqz+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565420;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=iy+CKyTf+w/+TVdtHLDzLg8KtSclg+nZgzII2bfYoDw=;
	b=1jBFD4DHEoqE54yXOPBvHNgL8o0mymDqO0rl8VsrbS9AdXPimeTNNeZ5EfkMVBQybDIK
	 +ESTZag5Iy66RB0p/4f5lYXee6UVPsytIq2jTu/mlauUFnNduAAUFQs2h1FLJv1iaGKvj
	 zrMueeNSMcUDP/Dc998J68bK/OS5wQ29ENRCfTfRzotFbJLjw5YkqLgiRJEbVeGCPMkvQ
	 ISN5DvimttqKi5goxffX1L+kUtKDqZ++vaA8pP4T4/DlzzzwRWPY0ZFUcbwVa6NDUJLet
	 HvnxgFBYLsGx0SiPT+PBRAGfDJ3d31CRqQm1T6RZR4XXUG8U7V9rhH1cmTqHn7pKvSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=lk1jLwIu;
	arc=none smtp.remote-ip=66.163.191.206
Received: from sonic312-25.consmr.mail.ne1.yahoo.com (sonic312-25.consmr.mail.ne1.yahoo.com [66.163.191.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85016606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85016606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=lk1jLwIu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565418; bh=iy+CKyTf+w/+TVdtHLDzLg8KtSclg+nZgzII2bfYoDw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=lk1jLwIuoiLeB1JS3vMMhM47VdyH75jxbN6G1Q4Xv/tHrCryQyi0tD6Mlk2r4XWr0EOymHerlkprTD5aTIi47xDIdJGsdN9yqid3LFwtQMg5y4bbQjpKg6snUD7G+JoTsx0t6gqWX3yxHsRxjQkFT+juykV7XRNX9qaQeNO2YEvOjSAqyEikwkXSWHvYA0pXh/nxPsRxwmQqhgHzNs965r0xHXn1YWlcfh/9nCFWM6vK5W50FHPs06C/7NG0HEkb3JveRnU2EF5n/RZ914Dbh6yVLFfP7t9bX/t4x1oLxBUstgY7jLPFLAaEezVcfuQh9KA27kFO/ammnSK/NZDPIA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565418; bh=sKTWNG7jvSH+bVagDJLcweKLZlCa5tr27X2YAvne3Ii=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=I0BN0Y3+zXtLTn4ZHntPQy1gf4TwQJEy0XCeop941CxuooNIxjbtbofrRktbSPmCgFNGnEs2zTo8LG9iKXIOMoqtRqxq2tI0Hn8XwZJAC0DGedK8iq9PKPFLmB7xEBkpJVcskYop7QKocVbmZ2N/6oCY9InCe2PrUa/vIIoVc/fxD2PuAGdOrZCqwJQlUE5bYnfoRrXFk9gwJHLvZdFsRQWjB5uFTnKLbX04XJrHyoRD9UANLWagQ43I3a6gK8hGA6leI8p/BqlmA/FXzreJggeLQwqDlzg5kVZSW8+8wkX9MRhGqoYuaTIAzzHM2hhFHtrcTxTgj99RP2apJgpo2Q==
X-YMail-OSG: 28BVyLgVM1lWsets_Sr.7hPiQOzoj4YEmkYNV7z0ggRpykkbF5N.9flvBaIuPmI
 dM0spqPh3oVxrzpiJxZCqMFWVS.1WJYGpo9tXlHxfJ3g4IkLcZYIgPbOXnjKa52vaN7My4tWlHpQ
 wsvCU.3.Q5LteWkmd6O3EKmufBL0f0yDVuvNEIGuZF3_uBtVOMCzmYWZw47zP09a7Q6iitMcA3sj
 tH1LOIPf03b08mEeL8sWoRCRTm09w.DQDdaXUl2tEWf_4imRV1HOOzCUCmB007sBDORCqEEBj1vs
 N0zMY0ndewElLuCDlPzh.dzptA0RhQbDgkMQsEz6nzPlWefnVt3iFd5YzcDLYW_JuyP24AP.WvWb
 Wyrpd7TCF1s6h5Shph5ISpXnu17bfLwBWCiKsqohHKgH7g3jeeoGANS9aAaqPlyrLsiZegqDNcK2
 p_VAafKTx1a3azqvqVYSCjqMu95A63SU5XQqBaXc169g_tmrwYlRjEMrmXZx3zz8Lyl8mQGVyP_c
 fFj_tCEBNS59ejqMuQ0urhnfa4RwR3gaMfHrPHAqajQJmuJR2JTV5bJXlWqD8BFHC9K6R1zKSSVF
 DKtFXcYM0Gi_gCuHTOgeFFz.NWgaWv.J7XMNu.nKlkSo5a_Wz8EGkcstg0OlBwRRNMQc4GyQpVci
 q4Fr9p3EjPXtYSx_MHabFjI.PhYAMIrOgWWoskCbfl9L3vboXVIxlR6eFjHQnd9D2.vBNM7i1Egn
 s..iT5jvu39pph8DZNdj16P1cxmlkUxqIkowIroMyJgl72vZU84cSeosEE7Bn.jVexONPfV5KsLt
 fMmum4Nt8DAPL5bRouLBRqaLUsBSZZPvA.F8cWIi9zJOv_jFGLX3V43LKLRN85MRMvY0hya8okAl
 hicYcSyelRteEsmADqZ6Vw0X4hiOX_c1SlqR7LsbKvHpfWALDEwb06uFBRkIKnKddm8we5Dd88Fu
 nORtq.C4x6tcYEzL9MsROIf.8pmiFi5BZOsmjgH6cDioUezCqrD8lqA7zZamjszcAJA7lnSgNpp1
 lJmnDTeW2LXcU97plqkAfDgEwcz.8cS4TV2z6FEp0rInCehq8KE0vFQWdaQ9V2uqCke9gTZ3hkeT
 z.77fd4oq.9kbogX4tc9jzE_cUpl5knlZvWtsqNGfOQbkkHLsrUgKVf5GJExspxCGEBU.LesJAKt
 4szVM9E828NAsAzKCWZQZYmeMhJqxFthQ3n6FDCB2dfP8a7VLL2zNdcYgndnLJRLIpPLTobq9omn
 H.17Fx4LSz.c8osNH35OBOvRv5.XdZ_acvW5DcVT31xowqRaH9JUgCur4NqHOjCzNE1ZMsje9vRx
 vcfWohEEkUnfhEtjpPpUwuFCElOiCEJd7HD.YtMMTCmXduekNZrbY0RMey.ZHCPQm_F9CDvrFg4l
 KgZwrTuWZ_jEwSRkAMG0FndBoCoH4Gkn0DPfvMWpas6wWsXVHpWEVOrv5n3_N6e6m2supTVswKo2
 sl9Tg5vgIdR5kan30n_y1EYSDKODt0Pdi4SUUWW.VFg2OHolfXiaLnj24usaWrnfiw4j6Q6BqAso
 lPGLmoBQd9qWZmOhb2kax8mzY35DWOQj8WOD5QpNaX2KNXObmYA8LNbsBZQs8rekw1jw5gIzCMEs
 4l04VkV_rO8g5t5PpQ34Gp4wxjzlqDoueU2l.hdEIZ73ojsX21n6mqJYgbsnJNs3OYj5l134XE9i
 6plbhxdiKoKN948tWHu8clczqp9FCSxqS3kriXoLjKtMtJNQYIpQcJ9ABC_sbnpMXenM3AkKfiH0
 5dKu8qdh0GePjyJmmCsnNIuH.QwNBRv4IiOqcdnfJXkXHvC.43mOBcap8d1_TTfYZHTaiq7ZG3SO
 g954hWCvPj06EXia4u8cDeF3GR8WNAmLgyKb4GDtMMbe.yy2.lqnRFjYAViii2jEz2rqnVn5S1f3
 GKDmAdiqY56uX5k9vD8rsCDy15h66LwMscqgOGajpNzdJ5RxRs0YQXPNtXfEucKvObPfvJpNQ6vg
 .lELdSVe6J7qFDyUqJA4CA2xl4H6Ib_quKVJ1kDdgYGthlXTPegxSv8A3AEDDRo2FLC25gKEWcQQ
 mhD7ccQIOhUU7uOr3Qud68EBvOF0YO7aPXrc0VpNBDXqW.OAUCe5xhHpsPry1K.hBFPEhiFFvpfD
 afELGj1QzxM8Wsf2DhjCrpqG9LYbsHOCwtLur.zpLO_rghzB0qIICaBKLckyBMEpay2TQjSkaQzF
 u7THqHkHpHapWyVdvuWacKUlqjN9Tu4eq8PdKVvoD3rlhTyAWb2UXgGRTqNfmMF7SltvpuwpVFnF
 nxD.QzgivFjHj2kFCZkwIP4ADRMDCpvO2FJFNtIzrQcVnePjidwUE
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: f6f35346-d0a3-45d5-9e48-1e8d4d9fe7aa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:10:18 +0000
Received: by hermes--production-ir2-7c4859dc89-hgxcv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7292ceb15c26d2b0faac5a280d57d0b7;
          Wed, 25 Nov 2026 00:10:12 +0000 (UTC)
Message-ID: <4e956122-ae94-4046-aff3-48b7c21ff412@yahoo.com>
Date: Wed, 25 Nov 2026 01:10:09 +0100
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
Subject: [PATCH net-next v14 11/15] net: dsa: realtek: rtl8365mb: refactor L2
 MAC handling
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
index cfb8d4b..cf06bc9 100644
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

