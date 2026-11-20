Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133004;
	b=uhqHuaYB8tb6+ElGTmhYq2LYX0cVhS6y2DI6jN43FMt6p/NkYO0zAbClmvYotHw8EiF0
	 uLp+HvWe2vl9LmiGODqbFIXER9jx0dGrooZL2LIxcVTv6MpsSzn5/h0BqVEYqxNtY4req
	 Mimvm0DELUDUuSVu5Il/QMTxbe32QkhUNt9Z5tZykCkGOaeqKVg2bwhxRZBuSEu3C5XMD
	 OD/TWXpaEE0CQb7Y8EyuNkKnIYEX4b7zUOkXLeBYJEBsLRd/sDJRDXP/aY7F9cWwxO3Cy
	 9Cf4msoIfe+tXgxO42n7hrbLtmGuu1cbAUgIYAK/1dlPzM24gJ6Psjnu0qfERuNoq1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133004;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=wuFYAqMFIHPd1hwTyymqcslxKmJuI6m5bbi1sHkUZCw=;
	b=eDvBwZHvy8CudZd1o65dvvocLdT2RyYNhm5nipTNDS7nXVz1zfPvimJHQJodp6Y7zdnQ
	 EUw8f9ZDfaiMkhJgmZnx5ELkinA0+CNbc0ZYHjRbiBeQrJHDDxS+qlVuZo53uxbhcfsMG
	 M3nF9nn/onb1JG0R+vi7sagBn9N+wF3jSxBomjjxuP1gNT4UqdKo3aGhCn5W6Xc4ciMe5
	 o14G1UZO7BlyqM66FrxYYpBbP8DG6qKjGsooYCQXAgxTOsv9xONtplqA1e1ycBJsInO+A
	 IshunKWu5OyEQ3s7eFyLqJgPbJYu3D8UTz/w8KS5DWIaQ2Mj+bykQ67h2yhS3oEId7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=RJGRXxjk;
	arc=none smtp.remote-ip=66.163.184.199
Received: from sonic301-30.consmr.mail.ne1.yahoo.com (sonic301-30.consmr.mail.ne1.yahoo.com [66.163.184.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED50606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=RJGRXxjk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133003; bh=wuFYAqMFIHPd1hwTyymqcslxKmJuI6m5bbi1sHkUZCw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=RJGRXxjkDDew8IJ+M/KtuvzkmMnJszrQXnviQTQz1I8Wlh1pXNoyuhC8gX7D0t1Iq8T+zaGIhHyMSPfiVJ8moJnjElleXoYA3Nf2KvVvZLEylNZXncoiEB6qz65j+X8YvZNGuu2ZXd1/Su4odMI1RLlIsImBKEHO/OoMu1kPMeOrKUPxw4yvjpDz8moHl9AVMq0g5fFPgKJOy/MPKPQYkGGmohIuysrNOgwNkSxb09wF/bOXCsfDtkmEvF5kby9QzqJzrvLrPy/2fMKwdtLxt78SY4rMaRnhUy11Oayfy98pJPaXaCXnGQRSDNWZDmeq2gfWDfxDEw68su4l1fOicg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133003; bh=OGU18fQBgwfGJnSsfQG7mHcYxG3iFaDRTmx6tIxoxdP=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=YPOchR6wkPcj5QAxirWgrI8/+GIqP4ccRiI+GYo1L/n94jVOtRz4KMAi1NvketsKrHUw/q+hWAKH0Gmti4DjDUbdiWuzjETWFAM7Aib5qiupdGKYuQEaVFSeXm+WZC1f6DxWXuWRttABY1TG7Q/FCe7BpUmiU+m+f4SQdZqBSbsyFdO7n6jZ45D/RjVRkpHL8BSKm0G8CxSSXDq4h+fMN4FIrVBnnPlOvkzGIn3pcxIna7suY6b2K3P2xZGS5aWIJDT3QWVebTsPtJy6V+MD8uFT0btvlUc8sKXW8507ezQYMRTtbGi5ollss9HPYGkWi/05osYu9F0bw5HCY1wlYA==
X-YMail-OSG: L3hzCwcVM1ls7l7hhzIUfEoFCju7YDRgQVpblDGrYTY_LcEMkMVj8x3D7HVGgct
 vzYWhRJOsT2ekiVwiBzUtsZLWFupCVDfYi3.VXiFdr9qRY243T1DwYt.VpolAA0upStIzhRvdUFk
 SCqKlGMhOHwhAz3dBQD7SjEP_BjjmD8l9RCKGSyAjZRRhjRVEOsNZGCGJM0t4nZDEgXJ98AvF_x3
 q8icCrbaQRZae1N3IIzt.up7C1Rn6Y9eChU3ZqHJoK7Bz3oWNE4QTknRi.MmG3oH0BffXKSPHAo0
 CvccQLr2vfGioww1k7rC7RhOhs7VQujw_t_5ohZJkWR_z9r4AFaT3CiXwnMIkiVbQmuwKv1zx6Nf
 .8J2JD13xQ8N9bK.qgkOcAe9zGcqVy_YuqU12D9abG3s1piKxlin2DEN0Sp8rZlBZSPAweK6YoYP
 OecUqOrPVkpdGX3NGDO0nSEVAPcHVcAPFG5Zz0vtVJcwsUrMpgjWKEWl51KT2jbzQGuGOQjez7.B
 7O7XYZj1d8mEPEbb39pviF2dXRZL25Sk2_3Z_JONzbY1wjs8DOq.HpQRR_q0Dm37aFPiQ3qQ7dZn
 EqFWXj4sCLR1Ezw4bG8e76U33s1N4ykzasak5K5A05wXcREl93VuFOIO.R9Po9qt4gGegVL1ZrPa
 ekE.DzKvOGxoGPTHvKcih69OaWt1nZEeIg_ZLreHPTdJD2G_.ewWLgBO7Gz0EB0KG2jsIbEHOhPb
 7MFO2uSEj.ROdeM7C6ltA9iaYU3YxAu8ipW1gzlr1WdoPQzxkHwNcWkHZcVF8VbdN0lzEi_yt.Ti
 X_51POT0zgZkUk4Kxf4B6IblSV1iRbcjh6x3aXogySpYz45BdnWx7Sgn1wrkRSBM.8Ip5hbqUFHp
 tJ1BpBL8Wx_jTNbJc.zKZpWo9jEe3aX4FNUfrBzlzXZG.fdIxk0sOv7DYF_qR2Gsc7A2UNHcTn._
 Wm9V3ygL.QyBWqEAN3puR2mYLduv8wLETJssNKA.wK96iODOIg4ToVw6hGttf.Vf.gapiJtNHILJ
 XTxbz5kezgBlifPOcyKjxyy2XB9w81NkYidfho8KCAjyKDJpbTrRYfme1t_1KMeoirerG0x7GE41
 OkMoqkuSP8agnudJc3cizlw5q3c3lKlPE7XaOoKn3LmhV3m2XNYEZ44adoNHhb8rceNVd393MyKP
 itKjc9AmA6RhBvHVQyEPpQYHSdCRe291W44cEgEMpeiCejVmgZxR0VgvPG9.1fR9ZDYe1LyR2fXv
 JC9NNStQqRCyI9fpZYseiSF3tcpG.KCnkqMiDJ9aJQvItICmY6XW3XbkOeRpom1tpLKraca6Z_hU
 NMJ1Cxe0EFUkdlkggtwkeMjB2j60QLBoa6TPeurtwc.Gg_4toZsOsz7l7Sq2.sHu28OjiylGpoLe
 FYvpooCDaAzjBnqiI3yvvk9GpbLjZYD7LJgHHNPB3YS2PYR4HVZ9jEtM7hmwtozZjtaHlfUXwOHQ
 oBejhlndQzDFbRME4veH0wkZG9iFJATIcR_CTxo_baHp2q_m1SWbBZ5tz.AvENITffluEqo5qQvn
 hOfZJUsxMdm4UE6ycRJuF7zINs5yqqNWFrnfi0ZP6VpevJI8CNsTxJ3tHWj7acA3HjaWdz_1pJXT
 YP4sOocZvH3i0V6aWNAWwAOiNCAspAXBP0pIdF6uu2U02qVcEG0JW5MMgMwHK.c9B0W7pDtNALNK
 N0HNnYHXiM_wsRXsQXyZh8CB8wVLey9FJo1n7XptW.6GfmoGSuo.9oJzN3C27oPVhstv6kFsr65Y
 3yig69ESEHC4MfO6nJWd8o4mJyB.wL8HPu2vaRNdR3lcXSq47LUYQ.7q5yszb7XpspUir72YkcPf
 0CxTODmqS9PjWj_wMlnZk1Xwxt7gFYXzk3tI8m8Po1d66dDikyp6ps9lE_aPX7KPlAojwym_SkOP
 uJ86jIuWGWBN9c1dUchVSBrpvbgvEbHBS0ZAqGACbmnrXdSdMhL462vA_90f8JcC2A.SSsArb5cA
 jsRUevMx9Keo0Fh5jRLwdIjQ4eSD6ZnLv6oPmXnTacOIFdZpY6cgO7syYB4iXcvABJ_nNaHtz_kG
 WRnJ12kpwEnWZ0xDSkF8vLKOBBEOoFfZjM2Wo8bsYNBxug3zVwzrIOhfGNaA4kYIP.hPC0Z7VF35
 lqJXR5xI5Qy87NTij_UPzBP9Kd1.z1HbC0l24cKdRvAiBHrU9NMvGHFdlGGXYmlaNQxyRMq6Bp0c
 cUM7hA47jaftguJVNv_ed7jLzkyAdk4fQr0r.ImUf4RJogopLTu2S83BrtF.S9R5dvvmyEJXkEgH
 JUs72T8GQNiBGkAXifDAKp_p.AiWYJig__.vdrZwX.7FFFg--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 5845e7fb-6e1f-4d76-b195-a54d4e647736
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:03:23 +0000
Received: by hermes--production-ir2-7c4859dc89-hgxcv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 593bf2bae9bfde17a013aac51d1a9d38;
          Fri, 20 Nov 2026 00:03:18 +0000 (UTC)
Message-ID: <327a4005-9e2f-4df8-bf08-a344eae345db@yahoo.com>
Date: Fri, 20 Nov 2026 01:03:15 +0100
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
Subject: [PATCH net-next v12 06/13] net: dsa: realtek: rtl8365mb: refactor
 VLAN 4k handling
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
index d59f15c..ed7078e 100644
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

