Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565132;
	b=rz7rLxag61hHxqc7/65g5fU8SuZFPIcnda4Hg+QDPjBgi8lZ44kdPPbVV2PaZh1OOXzh
	 9WOazXDU7zhLir3T7SXyG24xDWKuG8edWDmZksoKAGhsObDyPaqk+s+rHVnMQtqdgqX9j
	 5MPFuB5p/a27jf6URWFLwPNwNw5X84Wz3+kvjQ2ijw2MpBxksmPhG3FrOEtF840DHCFwp
	 bawOImYoFbOIUwT7ZF9CjiYvwvdtt1X45UwRlTtgcqVOJFpYI2v59yeu8kOpICPfrW2wA
	 QJDNx+e/DZMfrvVPQzctvLQmplWbSnZKXm4ryCqT7UsC2eqqh55SckdfaVPA02bcqrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565132;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=b/B7CS5EpngxzTNkwgvNydEkfpSf+yi23gB/QC/0obU=;
	b=XqW4ztnJ7d5nZitEmS2aWhsuooAAys1dx+AeoX9RO4nSEvjgCMudK+WfWxZW0Mgyk/tl
	 0zaN3S93Y5ORArfuLUoVem5gcfBwFuhZQbKkBLLiW8LWoXZkE/ws6B7Ig/nMR5q0Sp6qU
	 FJ2UmU3qiJbwsy3qbIBaBxNnQ7pUgU+oEYXdC24AMw4bgmfRjpwDuxfFvTV7+yUw9Yi8k
	 E7vfPavnX+3JRzdvqn7J+b1ThPSzCD9xi92Ft8V5+gvZkQTht57OyDMr4phAz+sLN2bva
	 TEZAljs5yyBhUzip38Xi386YypyHw+DHtrGVfXXqaHUI98w/Y+DfFFO/LYVfSBvBbQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FdDRBdiY;
	arc=none smtp.remote-ip=66.163.184.199
Received: from sonic301-30.consmr.mail.ne1.yahoo.com (sonic301-30.consmr.mail.ne1.yahoo.com [66.163.184.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E905606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E905606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FdDRBdiY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565130; bh=b/B7CS5EpngxzTNkwgvNydEkfpSf+yi23gB/QC/0obU=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=FdDRBdiY8hrMfXMO0hb+EBrtSXeE7s+1RhAraTwkF6+Ck70wkoHq/JUNJtu/c9DJvBBmUq7ah589Hl3PXtMO2Q2rWkJGlHHVVjbMhHF+ZfeJOyyJdE1A04Mxgxa7CTAHEhbWwdINTTGFSkXuN9rsZrbsfzs1stfunq41kfD19e+6g2bVG2HPzLWvhw9x7u2itrbawmDmIlaaoOnuwsvwDbwFrHUNS1P9f/AYBhya4wYbX5ldd9WOdiea0J9ATRO7vVd2+XNaEU4IGYMGXDizd851vvQBlWLPPhO1tvbEOIuC87OzDlNiv25wB8wm0tnCivg3KYZdJ0G8pFzT08NpPQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565130; bh=vCMXI/Nai7lt7jzs5+EcDh/h6ksvKBntn5Me9BgZawz=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=gI+jxWKRD0NluvbLWsH5nc6o2U0UbBCyclf+Y11qsvLglWpiz9IbnBcYnbxfkiuy7MhYTWxxvaIQUWSHEVfZymnvm6EJwm7+F5IHiDiKQpCTkdGMdwkeRxLs7Y9Sdz6Fb3eh10zdGb+NZlTiqj9J8xmd1+k05G7KS6EL7tbergEmSFkoBLtc4mVQIcCqYLnpsfPciLm+clOE/1I990wbGLBtH1T4x4/D4WRaHOUHRYmMe8Y6E/mvbYdOenRORMDB3CKZBBOC/RXKHSUSeu7x77o7r8BVLqsqvuzjPZ8MTpM4Jqb+ZHdKIwbp2gW0D+rajDJHOi00MTNxzNjfmybOVQ==
X-YMail-OSG: 3.PsBjcVM1me6UoS.frMBLtproG.2gFXfRyHe6_yhoRqI0Ia.BmabDdDu_Fpcqx
 T4DZnu03oMatR4H.mRcXkqbAkU8TcBDGdSOa2D477G3av91pXhfeWNPOg.4r4BnBpUfpsr6fY7aB
 QcTC_.QOiyb9GcwPrC9ieEhhBlsKPQ8STAyXSspUXTSpsZU.0tC5KOHFAVo66Il4pWgP8mBXYe4o
 uXZAbNlLkGei3fAtMKe4xCjZlmy5EhziNSSGTEfflGzj5YM6YivWvriuiyhQIVIJVdigMS1UKvv4
 2iGWFttDCGQjb6fD70ySwI9yN8hMuwudGArQz4qm0vBrFJPoJ9Tautiv0EztTruzKMBec2kDTRyu
 3muuK2ZYN2ZX2HzGyIi8ALicktjV1GWhSDj1vv_strvev2c9uB6gnUkKYupVY3ZzNgQUUL1Ib6Ul
 dItnx0xU.cyYDRzBVKdbBxX1N_uOumppGkB_wTTQ21IPjPXa.0SRgZWu2eGQJtCKhgsQuEzABGjR
 VNPgp7cL.aSeOHlJPNY3WUzA7RL3kX6tLYDc17kDBLsBReDUhyt9urNA2NzmbWR18B_IB34rAqgz
 YdKaoFLZxGhj8ugAvcWlYt7w_ZnSYsbLbiEhNTNCt8qNID2r5lwplhosNEXtxv.GUtu3ZbK2322F
 0yAfmr5r27a5A_8uQkOBmvxdHNjZB8wKqakJjJJHR5IYK6NzsVj8lsWMuQ7WdkAlgeJDWxQTMRVP
 qsxDa9VbJI0DEIrcDtMC2fhbgMtOONI58ac1l8GiKdvpWw.HWgYV0O5yddcDvS8Azc28sa1XrYRU
 oX4zhqg5deKz8lzq9WuT_aMGokLAH37B4IsHhsjfeKhesDxobVElX3eYixKO6sXOaOFb4JK6oQYs
 iSSfvx7bGccvJzZYoE4LGXyCsCiSsfh0mQCIGBYytuJMxld1CJVBJyhYk6Jk7Eoe042RlOozt7bK
 hI7Nw91dqVPPOQu.1WElRYY_HCaPi9111wpRJhXDim2WO0U5nCCImPhdqcbnfBejocjsQf6dtlPs
 rqmNStilXRws9kMD.gJPMGUuqA8JBthaAeJWegK5fLQGzAzqzgGoLGY5ENA8pABG998HlYP1TSDV
 3YzmDJG6pr8heYrsH3mEzLBnI8GAJwZg1Ydb.t3rqyc5BQ.ej23JfcF2S.G4xPkt0uVcpv6AlM36
 NzHL0WKVbB0k80bsKp41ZkLC0fMsCb.rS3oqOaExjmVmFHEEh3XvpKThDrX57V5OP7bL2ceVBMCf
 xj2OsAx0O7ljmLlWerulREbIgTE6QAFAiv66sPysB4hCZVeM2U8LZcT3wdc0u0br7.tFaL7PoXBD
 JBUZ5grJHUDLuY6XmBUqPDFkXeeap84b4Bzx0OKXvXSyrdi_5pi5m4cgVfir9GqClF2bqbjCKXlA
 DnLPb2NkrVjAkWUafEJz5Z_JtEkb.bjjgqeEl0ZQoM5UNeFiccaGaVuHIZwo28wE6Q8AqpT5qhzT
 6NQNvYvijQr02XvxQYBT83M5YUBoKbMc9cWedZTN7g1to4qdcw848eXqEP52hQ_UmwGimpUAf3Vb
 qrnfo.AAmG9sHw.v.4yBjb.jElZ9kOsx8korGhUQIqQvqHCH0w2yvOyF_e5.pWmKxIjNDfGRPapb
 KXOHcnFcCki8U.WMpCYaFk7nRZgzD23ajWOWq05z6Zza3ChxOrGzsoXun927uV5Q4dqvDCE3COQQ
 XuIZUzGv8pg9uDYuR.9UIU39bNbx_fsc6TCZ529EWYJlBpq.twDQUcvGMCF2gkhQe7OZ2Fwthbpj
 C1xk_mIOWdPixZrIjfnOJSUTYx6_7fsJId8jF9FEkQ.tilqa_VkvkhXHoOq_joLL_u5Cetr8yF.5
 dvSGR_8azw3U2AOummZP_u0NNCRRvi18xnouspnzrVK5X5qzr3DrxIw.nCs9A6Ri.W_qhhPNe51J
 UsxE8XgRhggFzryEx2IF49U96D1vaZxg1t2VvhdC4i6CuhN4h_mkcxUTyfHJMvJDuiE0LQT0cX69
 MwgEZppHF7YyVQ4pWWPcoZPwiLMXn0ar9Zl.NeNc.Uyu5QsuM3FiJINrY4xvnD2I2nMWS0V.7uB6
 LSNP6qOH3tcnWnvgtN440bNEL3XFn5wnf7SffIrY_gM64uXWGFihsErRkfhESHii634mHYt3QSut
 zUvJfstGJiWbqNqDlgkvRlmFJElnq0GMcP41BuIDgLEFaNOT39prWSNBJg15eZymdxr5Tp.DvkOZ
 S5i_uZhbn9.gHIqvH18qcoh7lCxJCULm4mJ9wbPyB0waqxNGTRmbrpxtCqm2DUarq.mBYXXsX3tO
 7vu76nxb1FrZtys2d6pUfc2L7XB.kX0rDHLLfRvMHAwFI.34-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 21eb3a7d-cd6b-478a-8a16-6dda61d3d88b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:05:30 +0000
Received: by hermes--production-ir2-7c4859dc89-4mhg8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 037f254a0c7d866f3cfd5fe02622389d;
          Wed, 25 Nov 2026 00:05:26 +0000 (UTC)
Message-ID: <5e2275c1-5bb8-473d-a000-5454817a50a9@yahoo.com>
Date: Wed, 25 Nov 2026 01:05:23 +0100
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
Subject: [PATCH net-next v14 06/15] net: dsa: realtek: rtl8365mb: refactor
 VLAN 4k handling
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

Move the family-specific VLAN 4k table accessors behind struct
rtl8365mb_family_info, so that family D can provide its own versions
without is_d() checks in the shared code. The existing code becomes the
family C implementation and is otherwise unchanged: rename the
functions to rtl8365mb_c_vlan_4k_read() and rtl8365mb_c_vlan_4k_write(),
export them and call them through the family info.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |  5 +++++
 drivers/net/dsa/realtek/rtl8365mb_main.c |  2 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 21 ++++++++++++---------
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |  7 +++++++
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index a9bf4f2..be0f49e 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -10,6 +10,7 @@ enum rtl8365mb_family {
 };
 
 struct rtl8365mb_jam_tbl_entry;
+struct rtl8365mb_vlan4k;
 
 struct rtl8365mb_family_info {
 	enum rtl8365mb_family family;
@@ -18,6 +19,10 @@ struct rtl8365mb_family_info {
 	int (*ext_config_forcemode)(struct realtek_priv *priv, int port,
 				    bool link, int speed, int duplex,
 				    bool tx_pause, bool rx_pause);
+	int (*vlan_4k_read)(struct realtek_priv *priv, u16 vid,
+			    struct rtl8365mb_vlan4k *vlan4k);
+	int (*vlan_4k_write)(struct realtek_priv *priv,
+			     const struct rtl8365mb_vlan4k *vlan4k);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index ae01cd4..687939d 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -756,6 +756,8 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.jam_table = rtl8365mb_init_jam_8365mb_vc,
 	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
 	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
+	.vlan_4k_read = rtl8365mb_c_vlan_4k_read,
+	.vlan_4k_write = rtl8365mb_c_vlan_4k_write,
 };
 
 /**
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 8d49ffa..566c6bc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -48,12 +48,13 @@
 
 #include "rtl8365mb_vlan.h"
 #include "rtl8365mb_table.h"
+#include "rtl8365mb.h"
 #include <linux/if_bridge.h>
 #include <linux/lockdep.h>
 #include <linux/regmap.h>
 
 /* CVLAN (i.e. VLAN4k) table entry layout, u16[3] */
-#define RTL8365MB_CVLAN_ENTRY_SIZE			3 /* 48-bits */
+#define RTL8365MB_C_CVLAN_ENTRY_SIZE			3 /* 48-bits */
 #define RTL8365MB_CVLAN_ENTRY_D0_MBR_MASK		GENMASK(7, 0)
 #define   RTL8365MB_CVLAN_MBR_LO_MASK			GENMASK(7, 0)
 #define RTL8365MB_CVLAN_ENTRY_D0_UNTAG_MASK		GENMASK(15, 8)
@@ -182,10 +183,10 @@ struct rtl8365mb_vlanmc {
 	u8 meteridx : 6;
 };
 
-static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
-				  struct rtl8365mb_vlan4k *vlan4k)
+int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k)
 {
-	u16 data[RTL8365MB_CVLAN_ENTRY_SIZE];
+	u16 data[RTL8365MB_C_CVLAN_ENTRY_SIZE];
 	int val;
 	int ret;
 
@@ -230,10 +231,10 @@ static int rtl8365mb_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 	return 0;
 }
 
-static int rtl8365mb_vlan_4k_write(struct realtek_priv *priv,
-				   const struct rtl8365mb_vlan4k *vlan4k)
+int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k)
 {
-	u16 data[RTL8365MB_CVLAN_ENTRY_SIZE] = { 0 };
+	u16 data[RTL8365MB_C_CVLAN_ENTRY_SIZE] = { 0 };
 	u16 vid;
 	int val;
 
@@ -282,6 +283,7 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 			   struct netlink_ext_ack *extack,
 			   bool include)
 {
+	const struct rtl8365mb_family_info *fi;
 	struct realtek_priv *priv = ds->priv;
 	struct rtl8365mb_vlan4k vlan4k = {0};
 	int ret;
@@ -296,7 +298,8 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		return -EINVAL;
 	}
 
-	ret = rtl8365mb_vlan_4k_read(priv, vlan->vid, &vlan4k);
+	fi = rtl8365mb_get_family_info(priv);
+	ret = fi->vlan_4k_read(priv, vlan->vid, &vlan4k);
 	if (ret) {
 		dev_err(priv->dev, "Failed to read VLAN 4k table\n");
 		return ret;
@@ -313,7 +316,7 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 		vlan4k.untag &= ~BIT(port);
 	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
 
-	ret = rtl8365mb_vlan_4k_write(priv, &vlan4k);
+	ret = fi->vlan_4k_write(priv, &vlan4k);
 	if (ret) {
 		dev_err(priv->dev, "Failed to write VLAN 4k table\n");
 		return ret;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 27a526b..009b127 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -18,6 +18,13 @@ enum rtl8365mb_frame_ingress {
 	RTL8365MB_FRAME_TYPE_UNTAGGED_ONLY,
 };
 
+struct rtl8365mb_vlan4k;
+
+int rtl8365mb_c_vlan_4k_read(struct realtek_priv *priv, u16 vid,
+			     struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
+			      const struct rtl8365mb_vlan4k *vlan4k);
+
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
 int
-- 
2.53.0

