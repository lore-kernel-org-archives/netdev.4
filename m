Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340267;
	b=yhignuQTtcvW1aWto8cnwtmJd1mtqlBYKH8JRBHsVTlqauUWbVKDw/NWzjaQmnuJM6lV
	 OE0KccAu8TGCi//oXG28rn+f9CAKJ+6n20sY6FoByURgjs9YuVU5fnbytevrYo8zY9Jbg
	 ZDT51zIDgLLgdkCwC8+tkbuvcRcOFPvR4uO4NMI67Q877DQZJnyrEkeC5MrSWyc15/IHI
	 y5pc6JF4yhGbvLJlpuS0NuN7IVcz2G/waJw9UIBGR4IaE9N0KSazKGj9cgscfSyJWi3Lk
	 /rGhhXMlnWuRJjcUVgRLnwXNBdWkUnrqYWl+lIR7QiMLQhjlm4fEcqLaYa5ngEy4jQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340267;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=bn/mC1HOVXSFtgzkREaBpg5iOOizmI53HlgnLEi9ubY=;
	b=41qKFXbnNOSAgEMA7qDh0Ae/JjOSgSX9CmkJkualqCrNha/ZQxVScvQvsI7espLEJG4X
	 2TzUgimprOmrtqZ7Ocix2PGaxpBnTsETn9DPhAawU0v4togyO48P7r+9JuEP/jsR8r2xU
	 QISL18yEnpSXdp5NcNeq2iGSgCf/XUgED8ah7QNvqP01o5SZwTe7EmqL/46O1oaNIf+tf
	 iijt/ciIlo5UwiCQeIRxMHUoe11kwwP1gwENeGkXCtXQBidM3OAjbIepX7G/taIfVvrzL
	 bP5hNzWdqat91o5YU7rLewNgcpyXKWkVeil4d7UVMReAzTeBx/j5RlrrGBWA+PEzvyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=HUiv+Xnt;
	arc=none smtp.remote-ip=66.163.188.204
Received: from sonic311-23.consmr.mail.ne1.yahoo.com (sonic311-23.consmr.mail.ne1.yahoo.com [66.163.188.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06B606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE06B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=HUiv+Xnt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340265; bh=bn/mC1HOVXSFtgzkREaBpg5iOOizmI53HlgnLEi9ubY=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=HUiv+Xnt1JyZ3KS4rb0+JDXGrUCYuau8OPk3y8GUeqPLt0lqoFZfBho/WqrmjPYKwXvU15+ozInGrZzeRTVWKGUAy2XqyLnbgYW8vYf7tjrj47GdKn0FmI9/pd2Ev15lXY3KfOc2wvyI9AQMH5tYjOz2PSPc/v8kDtuZ6p3LPZyBZoM0Phgr0XdSe/9ReS+YsEKUeW2RGLzPw0VFh03+kOx7oRB9F+VQvFKZ4pPHcpfzsbinylNvLce8U3O9fGT5L6A0P7HZ/dlevrPXfesPPws9eFJY/1oST4iXPdGnKZsgoJYRw+P5c1jc7ZR8Dywg7gp8pTFCm2pwsPtuQAQ2GA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340265; bh=HpDE4P9+2cYLI7LNUSIaphEuwYB5vEypwtnsc2klIMg=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=fdaykhr9776Ax3aKO6jm9oaOm7LoITFdUzslZZtnyAIlw0tyg7ZuU/zP9ajuEBNNa/jAyEwOGlsIAeFA+o2uZpOUEggUXUgzrwO+CjPTiGPOgpzFVbo2S+MhBjeinwKCpD/ppkGT440s1EEf8JukDIyX7zf1LfbGSITH0wv26G0rioPCCZiVtstl8vfP83tQ1r9lQ+Up+0LexUgRaxhoNrVehzHm+tlp6FQbJLp7+7YZxEsfuMsR3PKvDEyss4T68vI5YVAXcZl0P0bXSZfmWdM64PNc1kwW/Zlb6xcC4AQkBRtzQz8KFd4qIQHDEHocHGhLMwQVTglFXmlW/Wb/cw==
X-YMail-OSG: 1Ks.V9cVM1mJ98A_F1NhAj0hESA1PdCElqAfakB0MabOxjXTxuGjyCXX22oUKRc
 Bub5spPE0I4fbj3TFNBvvcnxLe2bG9H_SC43nCNRswB6PE2soFWSo4gRmDvgvXOFsPcbN0ZqmHt7
 35oiscksV2ucjY9Zcq3GwYeF6._tZnspzCrBSj3q8_PNlBj4UJ4MUAG1O0Qtv5sfi2V5QX39lT2x
 QFMyYH35brIKWRLPvw22_I4boGlV5WI3rtNAeVd9PNk610wAqgN4dRb0rDZzNtdxzRXcneBSewHg
 oA1SJytLKSNwxGDGUTl0Jh50ERmDDt4tKa3qkEPQZg4QQJs.OaZabbY_Q1r3XKLZ4eBjkq.mMM0x
 wJTQK1H2MtUymCbm.JwvjzPA9aO9HVFgawDub83OQvTO6po7D6BzNUL1ni6TdxwNUs6usOOsSfkG
 SlgWGLLwnLjkeXlENktRTogMJ6yH4F2f_N0CHbn5t9Dmx8ULOyvlopK9SsBqFYiwNtVbCp3vGgVR
 a2.HPgFxa2BeYn7ju7jtBAp0Bkg7vdRlrSlZHOc_BBlFUJpzcz4vpgWqAcZTcZs0cXotx_7_3u2U
 pAcEHV29YK7TWE._8Vd_i9OBh8i.82fbxyyMyqZvB2NODY05Bk7QB82Uj9jZow467WnCBH7fAcdP
 CI3qdzxBFRaImybvDq2kPv36ftaFhEqqJvWmMNHr_.MF2aVmI4D1bg6x8ewQM5nk0oKJf50rmrjA
 fTmPPOfpDNy10qy5wdXqwHzobPZGPe1kVebRZ1rCA4gWZ1qnK8xb9iiF_sINAmJzHeE3Uf_.8nPD
 RtAG2Dr7_6FYw6i0EZJlVCB8ILNNyIsEouje0kKbCy4J_8CAg6kcYlWKlNvWF4aiaoXFS0e1WQWZ
 DvO5UiefDJ1t8n.mXAixGBdSey6JqP8GuWeypeswbBzM8slA0PkfYXGvDxxP_mQKaRzqWznJpoJz
 jFabKj6vzG8v7DAjOG5SbGvMzXgHwnJtNglvnrPc7bNeryHjNX6_.bxwBu3swkccQNR3PKl9i8r9
 _rt9qJUr5J.tStNsCPjcrc_wexQv48yNwpcpsC1awD5Bhe2JDcr3GKcKTE3An0.ki.ErlheU0ffn
 SMan2KsIuKC6mZYZzqx2DSU8A4pXnbJcxhYJVU1eEV0V0mchyRTPbIZ906W.b0uc_jITFv58ksWO
 BVYo5wCb8_jnvwu4WTUDffVE3hFAi.E_uTbOGqo8zT1SJp_z_D1.R_euocOiuwZ3xZYBvTIpAnJ9
 _qGUaCdpqGEyaQFi4D91oP2UWn_jT7B_Fjhe3cAmxx2ClpwWy9eMnRKJ21uDq.p8f5H_JJmGmmAj
 V7lBgFJsr7.6k.m5RhV1FgaHWaB7of.EcXeQkzK6g8K3XEbmvWUuvfWqcQlufD9PSNTvCqqx4x.I
 5ko9LHgcvha89og8XhRy0gDpMvKqQHnyk27NaE8XiB9Z0.7OJ0H0U2r4Sq25QMsbUYTYku7WtoJ_
 mST1FzR1wGB4Bc5oSHZPL4CpjN.r.OkRyEtvpH0_W_mat4k7_W4v3zEmfSEmtC0ekb5XBGLJ37EA
 aE0T2F.KKNeqUVVOVIvcPy_0pgQ9suVOz.Lto9XTFqJQnwNlnn00h9eiHtHnSfolRYJxsL0waPNv
 OfneaVvw9Af6NSopUQVc_ZVLB75OSVoDpMg_R8A911Ze.mrfaM.kTR2zKXYSS3g0sr3bnOZ9Fjsz
 3kVjHtqqBQHl7uSLYFM.N4VsR5AC3nKses5Do_TJffbw3Rn3y2NQ8GjFFGNAaZmS.am1XiEeXcTk
 n4gZRE_i5oSSyugiNFBh1YETAiiojlc_B51ilKxz0jbbhHoZEaes0mqoq4LWAWXTVRhOW5de58YR
 FmuJRRMrwAB87gSExjuxyVkDLAgH_HUfTgfRdaKWHJUBIf3uq6DYjV9yuIKzl.hG4VGjJZ6KExDT
 OifRwMIMGZU.A.unFITR6RvovKbAawSCWY_fiVGC5buThSc8V4ixpDwq2bjSREKRRH.hzEqVp2Rg
 458SMdVRGLJK4cXRP.Gb70VIwdZAssIZu7gQmIzHTH8pzRVNo5H.YBpmyfxBjbdH4Dx9PigA8j9d
 253ZZfkplJTAalpg0S.ygOSSIJpNn7SQo72CaJ64TX8Z_ZE7QP2XG3qA4l4vdKjwfjljwU7ROBS.
 l_gGfYFgS5WtePUHjdIIECnZJk2lOZb_Y2VDk0JrGOc3lxlE.eWBppwkoFMVmo.JjPxyHPX2ZrJr
 TnY0HpUO3eeOLbuA3nVmocL27DA2tLEdhCqHjBSdJModIeYEeNmZhXhVcU5NXZu.9oy2rVa8dfGY
 xLtW7Vu8HWd5ojGXpnwA69v.Jb9mM07YMXbR17i0-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 56345462-da1d-42b8-9730-1ca0230fed01
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:37:45 +0000
Received: by hermes--production-ir2-7c4859dc89-jbbfn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a7e0bb68380abc3e47e2cf88c6050710;
          Sun, 22 Nov 2026 09:37:41 +0000 (UTC)
Message-ID: <eeb6574a-7d78-4f88-a5b7-43dc92ad1601@yahoo.com>
Date: Sun, 22 Nov 2026 10:37:38 +0100
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
Subject: [PATCH net-next v13 02/14] net: dsa: realtek: rtl8365mb: add chip
 family infrastructure
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

