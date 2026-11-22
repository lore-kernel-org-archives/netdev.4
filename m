Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340559;
	b=uhwINp8swy4NkNYJu3b2hnEPGXfR0UXFC3aa/hFXvZc9qqvtnBuGkEfd3jkM3uhc0ol7
	 EzGt15k/OwOhx7FwuAeYkxYqiZdSaWkTyxPEBda/Ph8JzWeEBVuKIslXMrbpY+2r+qT8z
	 apjVIGAiH5benMKaTfRZnXAt2ykZKouL4qM5EXWuHk6NIZYCBtlYH6JycihHyerwCZ9zb
	 X2gmBTYSUFfql5R3j9VBeYDVxy78+EjJOOkBlC6bipXzAwqGrh8gEtsrdM0X3auZ8h+zR
	 vLkXPtNMKodVExhOLrcZj5Go8WPatDJRNDg9T9TnuXqVSPRVZDquDlaDMkhiKPfrRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340559;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=wuFYAqMFIHPd1hwTyymqcslxKmJuI6m5bbi1sHkUZCw=;
	b=SKgLGWcPFxXhx7Behg7DjpsBxlTbthC/d6M3z2n0o5yRhbfv6tcBb62UVGKM73QY3ltW
	 fRPpcMixXQSElM+A+71ybVkXMUDd3qLb2U1F8p2Jh275F92CUSB4MThTmTmxKOQvSLp4d
	 q0sqmhwQKnhuaz+J284HVNsab+GLihZG80V6ENU+R1tkFTmPw4/W5MB62chn1n6AWfztn
	 V7WQFCXkTg2QOxazDtjMY8nzRz6E7MenkSv18VJ2wIw4lyjDFsy0WyY+qsOoBnli51Z7b
	 3QhzaTcxJ6Fd99SCUVfwrb1J7ibSVtO8CMLkXH984E59k3hInMEwHgQn7dRmQhXB4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FbLYCZYB;
	arc=none smtp.remote-ip=66.163.184.45
Received: from sonic317-34.consmr.mail.ne1.yahoo.com (sonic317-34.consmr.mail.ne1.yahoo.com [66.163.184.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F7606A336
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9F7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FbLYCZYB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340557; bh=wuFYAqMFIHPd1hwTyymqcslxKmJuI6m5bbi1sHkUZCw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=FbLYCZYBftEM5XaJe3GThMZHZvmUURtma4bcy8bhpXLGWTJAfJSRc5WipTu7zVSeXhT6ny/vo1lj+SUPTyimEt9gw/iGorHOZkUqLHYQHWzLwIq/tWvdpZneTzO2BkSEUcsn/GOnbOwfV36daD6MAYHDqvvjTDkidSLhl3wkUS0Jycm329aORy0OCLGaOGc1hL+hyW9lIJ1Y5BD0kD0bCKJ6QfrXAXekCE8ZxHSkM/jZdHhI3EBNGKqkcbD2K322V9c7q+y5dwwq/DtLdn81kDOSWFfqsg4V7eKVT3sBlaO4yqTCYuWAzenaPgX9JWUNYExDcODP3uqPbOhx89xAjg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340557; bh=Lei3hOotiSBp83H8hwOCLtZjJjJbJoBPAmDICI1bK1R=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=V8y7hbIl5+y2u/lnEQIJt80/Yln4ZMso2v0jdlVnWbnWZwRidxNLYBBWIQ2Lz9Miw83Fzca5uUCGOrWoqcF0IMv5pfW+L0iflO3cprRWxt4i9JehynPArnclDWUAIfXgIO2kDEiey1kDg5saaCSP7OY5ipUJ1s/Rq0M3N1IVeJvkM1n6MOc+SfvhsgLLfcSB39CBXdt4mjTMY4WQMi9DqVrpvJkChh8R0TvIoI6OmYhYY3zfGMyviHzrLC06N8Qbnv93L1Rx3YndD7zLPNTLCDomEGLA87gAfquJ60lVrEHY3cbjOazX2xP7BrRNz3USXu4XRMD6U0FaJ+dJmUc8jg==
X-YMail-OSG: k0YhhgIVM1kqPJvtVSLfKcatcixwa2Bv9AR8ae.Y1rNfj5qn.1duRlNPnTQFNbK
 hiICru_7emiRY8Nq6l6LWzp2bmzI_M_L_KhDGMZMTDJKvxOCHTH2E.AyRIHFA_h.8bRwDyw8wv9T
 lR9isjNAgD20SXkUWoANKB_7sBgrkb3OcuEhoMhE2E0g9bKg0OzkeGrKrdzxK01ilZB4Ts8vEndU
 JZKqnVRO4iJl3Q7ZTqluptEa5fENqlB7xaz6UAkdQ87DB4WVRH_JrHVdBFoLIpHzA83E1ES55oQg
 uyjXvf7MH3Dy8GdMGxkZBd20qCpyq1ldK27o3enIugcofqZ9QF0JNT_w4JgU1dfcpl8bz74.trzY
 bf8wOg6O4tAr5gCE1O9k3NQplYIjBKH6KDqUmYuM0wNXyrEVF_Uvye29QefXTbfiMIQHzWCxGzap
 KmHgK9eICgFQIFTODI_AbORCuvuNqTvJPxfKWgVCyCsTczyGeiPf1IysOdJ5QQs8l_Lr7yFQbCzt
 viR9Eu7VWEjuGIk3gDSoP9pnFq_MpndmwUhSp9jVy_.Ofxn.VIm8lmqa0OItA843hTQlbZAkQMEZ
 cdtMo8JHfajaP8MFTKyQYWUzqzpJ7JP_D1zoiym.wRqwSb5.NlWfwRK78mIMMooZBF3MJjL5i6b5
 ChxR7LfgQL1wnUoeDhMJKRULemVV6FRu15v.mn55He1nWTSGf4whoaO8SsNF1KBleYI2Y7mscr9a
 RFridHk1uxahvPEETSmrO9f36sjE0LSF.gf1ncSJxsbNqsXSPPERma3uZLxmFmXhJn1nlc57tAFK
 4xN6qCu2O_U7rxpzd5at_DOTHMzZO7jmqaVzPu_9olhJvfK3WL2a3obPSsAlRztgcFo9qVGuNzIQ
 CO7IxCo9wnPeb9as27kDqBtGsTZNgCaGl0WIUMegyf8m8bJE0HxUKF1kdNHUJJLRQsRCJk4t42DV
 2yDV91rbnW22GIt4Gae.jH9pOaKZ5dfDy8gGLE5XE_365fv9kq4YP7uQ8NOFUbNgEkb_mSiyfrsC
 3kdzvSZtsykV6CV2dzc4lCwB2DSUNda6Y14ZeJ9NVdBZGA7o9_c6roX6FyWPnRs3ezMaRiFc_XzD
 OEtylI.uhg2eMz4IOEgTf_V7e.qZs36pcNrJd_Q2ENoIy.cQTv3nuS.iPCL3KHu0UR7EMuNfu8ku
 jWjGiu7HmOUSLPBHYpZTh2JChBm3bPJATs0Dy0Uxg6aGPZwcg4N5K4Os23sV.S.04GT_m5kuAD1x
 i3vqJYuJYwDJXImoLpoe97FnbsR4Fwjwnx4YgUaxhrzZvV.wNgRhPiPmqA1Q.K3ps.JoaNnKmYeH
 CVTpB8s6XJ9iTab7PhWmfEnMH0tt.aVOE_D6Mg2mvpWW95jvqb7btKy5p8azns8hWZtXws3oC5Qy
 VhlDC0GQ0r400dYEpIqjiS1FS8gLB7Z1_xaHLzPu7NoWABr8mz7hIGuwH9GIkNIH9u5RmLGHD3gn
 2lxsK.Jx_UijN4wI4oIE_C.8TffZPcc22oL23V1BMUu6v4.9okwGZNvr0HKXpSw7TEFQYG_0zKHS
 rxcoTlGlwa7QiCl0ShGKxOdfZFYonu9nagSgX0Vy.SunPM3vvixAuDMXYgZz5Ji9fF85oSuVppWQ
 mNLmx_yPpgKdEPX3hE8A4ewGuJtFV.qi1JHfijHzZjbmG8OuYTZJSsfT8dky5QkHwNtPyb3gC6OQ
 37zqHIT3MzFc7_DcuoBn23MEbJUvmzk5.UNg8gvuS6BOv5ZnQF8qsWAAfEupcc.dmJqR9uW0BL_L
 Wx3KcrqGfk6aJdpOiTpo3YK4SW1f48W3hfAfCutGq1qdgX0lx4hZq98O.riAq_xGUTwBqUvIfFke
 uhNcnD7cm50hWHeoWUL1vVYKSGXQgtqmim0OzU3k95vDQVf3b7GfOQBZMaY9n7QzHyYzZL17sWoM
 1I0QCAF6UvGYofbvfoOvPKbqcJKK_SgMx1BFnbSoH5ry2p42prZZQK_3HHmxU5skRsFeGsZZk6.K
 LzNM88CRXNlARBtlt3rPAQdoV7rqcjVJxOEXw09Yf705P9SeBuyIqso8ZfaZy5eH.0d7candSjLt
 jN0J0Mo3DzxtLo9NYUE4WmkoLdKpDC2gfvj.RgVT7GtNM5oWTEsciOKwCEbxHDeqoUGTAWUTpSKr
 4YlDgrS1C64qAPe784doyURrSZr2UrYYGlGpmdHpRoWrxaElcuiO15sV5rwblLIekShTKhZtsdQA
 cRm.sS2LZGvHnIEaOlz77wg3UeTooZrGq3UugC5gO8R.yVnYbGfXIQHrd_7cGjWmCacV.S5KaKr.
 rN8UZt9cR_Zod0jT1HA1IyBCurF3x3KMFPCNHnKUZFf4-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: e3dcab19-3c74-4f5c-a207-e68cbb66b590
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:42:37 +0000
Received: by hermes--production-bf1-8768df57c-q4hc6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4e9b9496b8044caaa060e07acff793c4;
          Sun, 22 Nov 2026 09:42:35 +0000 (UTC)
Message-ID: <20a88a67-0c13-45a0-8ca6-592d17850674@yahoo.com>
Date: Sun, 22 Nov 2026 10:42:29 +0100
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
Subject: [PATCH net-next v13 06/14] net: dsa: realtek: rtl8365mb: refactor
 VLAN 4k handling
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

