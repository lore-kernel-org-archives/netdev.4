Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824129;
	b=ItwCY+eRkp1SO0suVAYqUFu5oaUfLBO7gv8UI9A2lB3VGYmtODv+YObNtAGFPRtZLNVx
	 QIPn4w1vzshbanAYruG8cpioXqAYb8tqkU/t6Yvkwc6+9jyCEdFNbXK9oA8baq6immP+A
	 RcxMBpMZ8rpV+Z4LSmD0nlSOWSadaMmgkNoqQzYBJeGvfiSlb4BAlZuZwonTjNcyxqX3S
	 SyxTF8MNh+bbXkgnYRwIRyGNnG+oWZs+rC/38uhWuEBprtKsgqWlkYIWAIP32JyDmGuEV
	 S4s2hPUSqyOR4E9BaudG/ui/U/g4nKe9EqD0NyLOysx8C1KB24APLuTLk525w7eJ/XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824129;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=cvrInw78+CDHSHc1paSIUH1VXJKkxmu0HPrMgUg5vA0=;
	b=d6QYKbH7Nfnp3uFEt9cxJyDJLKFdjXzygUS3YypIh1IyK1/GXWI0PDYNRuZ1Z0KidqmI
	 wsSddGWFLwt3dhP12HI8ARzbcFNx/aj8sZS0HYOMOScmvyFLi+lJepWfZYx1edDfucrp3
	 Z/QlqzO09DmW2If3dgoW1id8SlFn1pWe2ZIxA5IH8i4k+h2WF9c2jQbeY4CddGXAA2nur
	 mdA3vj3NDTSH0vRbMEgjC1E8PYu1Lcx11GELUEmWzhhZpiqcuGPN5Jv+gtnk6HbBET//i
	 HDbjSvSZSlXcpSM1gtAJaa/kIVvGXD9qHu9aQuvUpnbC2DN21zYWMK39rU4OxhQlSCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TgP8eUC3;
	arc=none smtp.remote-ip=66.163.188.206
Received: from sonic311-25.consmr.mail.ne1.yahoo.com (sonic311-25.consmr.mail.ne1.yahoo.com [66.163.188.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED069606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED069606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=TgP8eUC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824128; bh=cvrInw78+CDHSHc1paSIUH1VXJKkxmu0HPrMgUg5vA0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=TgP8eUC3zrcRLgY4gvag5cOWUsuWqKZ+13zseRIwi6xJePRWfR9Ysym7BZbW/Mtv39AXd3glQKiega86o0n9zYu9PLqLbXFXqSIVrFWaClF6KSxBgI/gmyEtVDDeIrIxOHUQO7X8y4L9qo04PVWX+WM6gVt82Lltn9v2er14eKqIhlKnhjjC/rGC3aGgAcCbwPDQ4RxNSKS03O/YsJ5wm+22zoUalo0ZkIJfjNEmpipDAHd5VppVsR5N9pYh81+Ls6HB8NMKVWc+1Cg5de5TKRnsDJY6XahJDZCPgRVv2Jr2rqlW7wu8gh19GxNZm244N489GiL7daDhVOmMbJ4UFg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824128; bh=M4FU5958MpD4ReX3v4kzL9d9f871nKhaNIfo9enGcop=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=WBqENENNsbttB60nHxpxZdUmaMDxFruA6c9DJDhhIh2DODUTQY/wNO0ZD4Tj8arbXFntBlNzMVwGfLuPho9DC3gKkbtDjqu3+hdHChgxht0xaJ9ctQrq3YksjNeqc+qw+TgQd5ErbE+VFSA1gtDofQG5hLka/XuMkeDtUCyE0+hKTCInjvDDf16EKMnVbcncV45cwJagE2vS3iJss1tY3ChfNcMVuvwGulKTuzp25AeT6uqius+Pr8sgym8v7Wx++i2qUpIBRD7SKwF3kEFb+VSSkhhcR+hUxbCJFSRE65do6JbfG9eqqNx3ajyR6JsY2KRmDY7VJ2Day3AFW8dCDw==
X-YMail-OSG: wgc1pc4VM1kH71TqpQF4GDBbsRTq1E6sBY_P0elBa4Uer5BNAduAQDidA0XlbET
 4DUj3Y6Mh9hV4VXrZErGAAV7Jeps2HUk2.11BX_ZqUEmsEq8Wbgh0EjTktUbpN_Xwvw6G_Z8EVSN
 vQRWI6QCfi1n5NSkeEFe.N4549mPXtEu7ioG8.hSLdR.j6v2l_K.oDTv6QAXs6MkcU8ZJpYXNX8C
 SkT_oVvlQ6BlIPcI3lxZDcPMpsbOE12t8B5uDxiuPQPNjOexrtwDQJ8u6.KBipTR1XflLu2Is845
 Bxn1RTQ.oC6cxCuSWPoLo0HD0lIogkMsUH4brBpzci0I47CjrPPkMdvCXPbhFf4UIgkxgJ7P4Tg6
 2ZWBNf0cf3Vh8TJD8WRVINjMZjKdkl1IF_Tfiq.87t77UTnIsHYCsmK0POOwmktuXxeYHVSDU5Jn
 ScjNYW2eYCyKdKNu24xUhoStOv3ZIkYbb.hmBmKqlbaDPylStoBGNALUOPXICB.mxuHnNfKT0x8R
 t15aSTujbTW34T_AcFMub5DA5qXCNV9S3v6bFd0B.PPRWsE5x5vlvL9rGY89YnM9A4hfRQQtt0QW
 dn0SNX26QXMXmWtWendw9Zg4nBKcYFlAPPmX6c9Rz_V0.J4QzFF3PKGhfXI4VsmfSYNb.ocYLX60
 9v4cSMJVVVSUreJj1krw062gMGVtGFgs9KVEJyBPFGD9zir0Bnxu.xFoDOt4jZW1dBbaL55fWt2i
 DSekPE7HUc7CzLUStiyQdPkYZMjWhUXhkMOaZne7xzG0TBmZZOLk7NM04txTTZQ8kJIWDiQfedHE
 8lhs2kly9wp42BoGL0ECA6Yw1bFCGqChCDwozflv0PmwFtBc2_iAQI5p5u.k9XRHNiDdgrtAY3Cn
 hN1xH28YBTVkiiGRAmQjHZrXgiuRBVe157EiA0FOdai66qNd9XkrTeM.QGX0Ywb6gXrM4_EqZXyT
 V25ynfdU92sdFwTZwtcRXOpQct3145wv4sbQnOsFeztsEmSijjdT3cqiz.RdRfQ.0X21k14HHDbT
 KmOOOiKJlYR4P7gkKHx.8TO1jrsB4cpDyP1IhaFGVlgxQ6uAG1YW3ZF6Bwm1rX7WUSupn6PAf6My
 YBn48jxEqCYaX9hECcScHypu55FOMJuh1LZCWoteo0Nf4.1zUxulh18W._14EzL2eg40sv.XG0rt
 l9Ew0whd.ylJFsSdgC37f57qWGWI0ULJGqMy4uU2ooOafHZKsT_NHCmQ33Xm22Xl_Si0BPA6C.ih
 aXsy9HC5LV2_WBivnOmPHqtVk7ZU6mdJMBxzdAXsPpeJGbGHDCoMdGauO4hv8qucxSsV.tyRMteK
 nTopB9lRIgoWkHW1Wc55Ga8O2hNNCp6ykqWBIYiZ_rfHHw7EUJVsw2Pzl.Z_JOElwS1RcDHID0kK
 rnevxEtXwHc8irdVDA9BD81XA5x2b0iZETAke_FXd04tGhe7oxaMAax2DG_iySP95.0CoS8od9Ew
 Gj983EULudf58yC7lOIiScQLwlWaWyuo2fAZssk6BeCX_H_cs08AhFrqgvCYjBvGRWY1AtlZUx_X
 vGFC_Vma.uilSCq0rAC5Xv3TRi2JvnhsxavGFqYL6Lpcp_9QWWFCwzgF_p50tZ.TgQoyYGK3Ua1B
 .TEJnJJB4bMqOejOlq8X1b7woVIt3QKyO.X0lhx5tSxYtGIuLNuDgFSciMLwxg1dVX8OHIePo_zv
 1rqsA72wAHGzLVuvrs1gUqpNokx76OrkUDP7beuRYYF5ee5p0wth0qcbGjTE0bHRLSbx.udaR6LZ
 F.oaebCrLSeznMAuLEZiL7OM1RgbWX_MhdrFErio3bOSSxswKOAciQdup6X59.LWiIeunOMmjLwI
 _beMX_u_ZuPaJVjLEwln1.QifisZVy_WlyBXmZGLvnq1zR1bIVhBdTf.azinzYmkuJf7bz7oKnqv
 U.7_WYLSA_KeZ7mOoCHmlPnIIvx0oBy0Coj.7y7QoI3hZfi04MAFKGFbJ50Y1GWL4sJ1oOrUHHvJ
 PfqAqNzS9NEiQX0.Uledxvu70kw.eUt2l5jYojxnS78GYJvffQtbgGWJXDbR4RHOs5EoBJTfHDCg
 umzCaq5LgFdMbZmuilwUmQmmD8nayn3s6B8qIwGarBNLikOKvMl.FTuIde1oyOKlCfDHV_E2NOTu
 mIMEYMN.yd.EiMPIK6N5iL2UvNt6a6V.dNrPAhTJejS6qLB62EstmsN_YimNNocnqfCM5WpVVoTn
 Uj4XA7YVIPb9W_KSDQgLRE5lbXWJGFxFKLXjcjL8WK33rB4EUb.JSrc.DadDATzAGHAH9BEdYNld
 4O9AYmsrZHYJSIG_4METg5BnlKClBKYsnsVejEAU4Y44-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: a9943c89-cd7a-4b64-89fc-5e6c0bacbbea
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:02:08 +0000
Received: by hermes--production-ir2-7c4859dc89-526xz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1862f5120b138914d5d90cf142b3795e;
          Sat, 28 Nov 2026 00:02:04 +0000 (UTC)
Message-ID: <a80de770-f84e-4660-867b-27152c36c45c@yahoo.com>
Date: Sat, 28 Nov 2026 01:02:02 +0100
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
Subject: [PATCH net-next v15 06/15] net: dsa: realtek: rtl8365mb: refactor
 VLAN 4k handling
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
index f929db2..919bcec 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -763,6 +763,8 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.jam_table = rtl8365mb_c_init_jam,
 	.jam_size = ARRAY_SIZE(rtl8365mb_c_init_jam),
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

