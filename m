Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565530;
	b=zmm/2FOkdxfevv5vBh2OpKoV1f+CQC2Xy8EKvQa/qTLKmOkth6/NotH+PQheRcWT4IbI
	 /GFDjsaFRGiz17aMbma5xOtQo35P0pcVy6kOfkPojox/fgzm3nD8pOeBjkYksArT0WfRk
	 T/9i0iZVmgm+xH3WDr2qgADtK4iKCZOmyeveVAVo9pBjKk2AeKSOJmOeUQekiPv5ZhDXt
	 HdPEnuNC0Q3ff05Oi2p5YC45jbk6sCLnG3fcUtGFmc0JIBYkepW1QP8Ywp8t04+9+zrzD
	 nZaKvceKGykFHCGOsAWgIh6ofTFizY4ihAqncJ+Y07/Y0VjUj1ncryKBBCwumE/SqvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565530;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=eF/KIzTFR5L7x6hlNv6UvciXd59fAB1GNCtxWjDJpLU=;
	b=l89SfIFr2WNfG5mlQABgmULw0N02HEOge5bpBleKN2g3GeAtkiGk/GtgTkJmWyMvY7cu
	 erCuy9JRWIfUypdEVI8OTI6/2c+o98MQ3avGT6rtrF0WXreRbMjhs5WeGM0FIPgDJj3z2
	 ZklNxUXASXA3Pu7f+wCTQjlkLccLB3NIKH14MtpDMSahbcvValb4/yckF+ChcZIXRKlaI
	 9uXeEI/T3ynIf/yPdO6zGkqQ3i3GvddTa6/iRlIx0FZf1BIrRyzTkm8x6DnPsb6HKiY3J
	 dZlb/wIZgmD9d5DT/5S99BBEw3+xt0NVZuerly2t3u+NU+SFKfZZLIgKJB9iF51pXRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FVoQaNlW;
	arc=none smtp.remote-ip=66.163.184.148
Received: from sonic309-22.consmr.mail.ne1.yahoo.com (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF88606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FVoQaNlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565528; bh=eF/KIzTFR5L7x6hlNv6UvciXd59fAB1GNCtxWjDJpLU=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=FVoQaNlWyNURwU+G7YMCaI9TBRuual0UKLmmYQlW0+6PXlkYWlYZCyUjrGV7n48EHAgeCq05VS5HetGtWK4Nk5pZbkRK/oGFekwRslcMYfhXZVepNOHKG/jdwK/RyiZHNU2XeRXmhTMQeT+wvkPeNCJeARivRsQe7+2T1GF9XnKBtUO8JlMc3V/8Ydj09ijHg0Frlv7x4uI7DQXnhSxOzlcC+56vH2aBmQpH3bqEnDlJvcpVjpKxDXJx9vGON2es1gWkqlJkS/RqBtSENH5BUEFND3YpcalGqMuRf96bdNJ+U6PyoJaWGxRTx10O+mNIEbcr3V9ef0w9GFG6eRJutQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565528; bh=nghp3KIRqDs4QmGBm/kmfUVZBKlPPsSQAzVjioVZ8hk=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=FqamMo968DfD04z0ReqBGl69n5Ne0XJLg/9aoMCeOd3IC5FnEgDM8SIxjyI2dr/qGxl2ouJGZQ5lulrGGngEDNtqWqcurSMDLJPJdLxEssJ71VrXnLgPC/XarbLEs+S+DpJbLjqsAdwKWfiy+0UAKLJAE3XKiwJSaVPdoDS/Jng3mi6JwMqJOI7PRXeaT21e9cQHzLO47RiQpp/E7BNjuNYwYgarifM+xj2LRsEkuO7NRTXultUFZz8i8tQOOYJ+jA15FO9j92CIzELk+4wRCTZKcrjS/6afeGRDA2fYepnf3IsuX7KsnWYn2UDTt04bVcjpxY+dw2psjBND6U6YBQ==
X-YMail-OSG: l_lRQ5QVM1lvi7wLC5lLZUzSXXbQaC8PeGKbBYYVoldQ8zBFlGaR.02FxKVRaMt
 UhCKDHL1y9j0FXwhmrVCUnJLck_dNbbtAIcs.Kfx0ohu.VtIPvOPNrK4gOMy.ZbeneeEz9eYSour
 CEF9mL9_yqVlENLGvYNKIxGsueGy6aWnW0EN8Xz_faKad7dIEQXuQ43_gaFfsuXD92TnHBbitCl6
 xL6SemivqsvGi85j5paHJ8Qw1K1QUuzuteibtupnbrSzUudlu2KbCl77ypL9YCFYWVOEm8SzdKBg
 Ifv5QaLp_Xb5W0cGM2IVbOkcINlna5DQ22qbitXdW1BSgZUrmMMQbr_yPgQYNPc7S038vVuLqh7g
 5rwqvwqbRto7ix4Ty5e5FOZlKeT2E._5rjslSOcC8pkKNZqEKsbITPMpEplOAHosVh3GFuWi8jh2
 LTOunvn5P.1H9lR4xwu9enSB3UQXvKCvyTh4cfrGbAeT5FdJ.zrU6.hKDDF8sZ07_x6sLVZF_Bet
 vtlsB5Et8zlhd8pZwDRFgiWivdapv_LfdDd1oS5cwrDZlMZ2v.e8.zpbrL9sa4giY3YP_goMtkVG
 Gcv_y7vXlRzwJCUlX45XOHSOuRnhMT9V9VEeODQZEMejSfpgwzNwdiVNfutbrTtvKJA59WhDeHAd
 x4cqE5KkaZFH_pMFC32tkzdXNLviqHQX08TsiMn7DMZZt9VgwCGWMjAAk1GRCpZbsDR2tBTk35.7
 i1wZBfRH2jycmX53NtlMlwoZaDVZ2P0Gb8aLBlB62h71EKvzyv_OG3M_Lzdz7I9Q7DdimRckd92f
 1SLMDU4hoDK5SbqKwob.aOuG09LwvUiwc1QyNTiXcSkORmm0kOc6tkmeUPNo5DyWm_SJ0ocp2ald
 .jh9NH5Th8hhwl9q5e4IP9WcoUm0QKqJU7vME4rl8.nof1hR.z0B2NwjfUvvcPJCUQayQZ_LTbh7
 OmbuhthVhzXDWT9luq1VILta6jkJpeoFnLOR7ml2X3mi3NrtKMvndaJLVL304TkLbwAYsr2rsT74
 v0uPna4w7xrB4hC9SEP3jGWb5sLBGZEpNyEQ5K6H.8nnouMY7JnpE_OLMcjhpzrfHkNkhLfV8SFJ
 OMpbkCjTKuziD6iWebLFiA27OmEvhc0KZ0JJsm71q28qFIuW5fkAyEq0Z0S7FOof1Ndy5PQ4hKS_
 dy_mzCbyleY_tjDrOASEq3S_KPCm25ebKsxl0VfCCAB6gPKEYxIntvkBscmOWUM3TLKAN7Gm_IB1
 btYOerNi_Vs9J.eKRpwo8uSFExvjpB9FjtjjEEWINXOpKQhtmLJpAUBGLLVPr6gEjF.9dhLdvHZg
 VUsAhUQ6p9uKEBYktMkJPiC7hL9Guf5ysOo6SnwvZ4XHoY6FDbY2MZUdAvRzW6nokU6ncBDFkF5w
 6qFLc6K8vNw_bQqvev.i99axe2cwzalvXTcDU0.6_VUdb7LPAxC2ZwqjQRz5xf9WPsIcGeRYVTT9
 bgK7PuarR9Nt9gKZeWpOsOYCgDoCB2zcHE1OXQBQoeq5gSZD1qYBgp1GRHAzHuS0YBwImojuIRCu
 IQ8rpqWYLnRm8MXH8TE.8q_TsO3_fPf5uzOIAFRo4DfaJRuNA3A7eVydART88a5XjZqfvaIJSAg4
 8N4wt1okD15Qu6bIB1IsGiBI7TwXRmWsU5vucA5Zgqf8F0kZ9VW2ojKVqnj9HV.g4qQhRchBq.Z9
 o4Ni3uQOo3yVRRUArh9o9E3mNv.TfLezB8neDT4K0Frsx6WZAE8GZr.X5WfTo_aLmqyxLrUxrl5g
 gRAXRGaKGSPvdbeyW0HUBAQr2C1.S_vuyuI2DOodbd5HWCQoysUIIyYkxPOrSLlud5JZ76IaDruO
 8O7tqmV0HEoC6afDpuaP2TxNYez_2legFslMSuxeP3bhsYV5Bl58wT1Y5KMKmvG_J2SCpNmIOjLB
 IlYAyyXE5O6YuvfdS_drEsYQ_Grvehc93Rzq1zA_YDwmA_DX_iUEXKWzKB97oZ5_sD1Tqame4t5d
 0Ej7GluIlOHeP8sLlM2FKtQ6dPBvPA_Tn4fkGBg0wmd9N0C82R2w2O2s8t0N7SD4sL2Mae5imHSE
 J38pYGuH1I.L3uReHkugqvcvmZuc7xnGYsq4cI3Hv0lf60f6zbhOOlOXyvpQMJN4xn.Qlnl0ji.F
 EyeUuMY6eWTa7Rzbcp2pmLMruTGjVFZ7vjNgZYBCbSKBBH1_MTTfgJaXqnmI8BGxQXIA3Ok13Q5u
 NJCaW7S.2bhAHYNLNO6OZjfxoIespjyTnB_zANR_k2XhedXQfJmxj4VTkEJ5GcVuBmpo3lj5JdWb
 Vww1ZfKQkfQ05NMaCgOjsxcy30syGVJIbJ8kHTo2LkQWT1vPF3DM-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 29e365d2-b41e-4be2-b781-5466ae6afe71
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:12:08 +0000
Received: by hermes--production-ir2-7c4859dc89-4b66q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 10014e88bce9f7ab21d55ee9ecdc66d0;
          Wed, 25 Nov 2026 00:12:03 +0000 (UTC)
Message-ID: <5540b093-3ecf-4ba8-99ee-84197a037f11@yahoo.com>
Date: Wed, 25 Nov 2026 01:12:00 +0100
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
Subject: [PATCH net-next v14 13/15] net: dsa: realtek: rtl8365mb: refactor QoS
 priority handling
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

The shared QoS layer hands the backend internal priorities that are
802.1Q traffic types, and the backend stores them in the chip as they
are, together with a separate per-port PCP for untagged frames. Family D
numbers its internal priorities differently and has no separate
untagged-PCP register, which the next patch adds.

Move the conversion between a traffic type and the chip's priority, and
the programming of the PCP of untagged frames, behind three new hooks in
struct rtl8365mb_family_info, as for the VLAN, PVID and L2 helpers:
qos_iprio_to_hw, qos_hw_to_iprio and qos_set_untag_pcp. The existing
behaviour becomes the family C implementation: the traffic type is
stored as it is and the untagged PCP register is written as before.
rtl8365mb_qos_qmap_init() now iterates over the chip's priorities and
converts each one back to its traffic type.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   4 +
 drivers/net/dsa/realtek/rtl8365mb_main.c |   3 +
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 102 +++++++++++++++++++----
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |   6 ++
 4 files changed, 98 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 9a69e85..d34c9b6 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -38,6 +38,10 @@ struct rtl8365mb_family_info {
 	void (*l2_uc_to_data)(const struct rtl8365mb_l2_uc *uc, u16 *data);
 	void (*l2_data_to_mc)(const u16 *data, struct rtl8365mb_l2_mc *mc);
 	void (*l2_mc_to_data)(const struct rtl8365mb_l2_mc *mc, u16 *data);
+	int (*qos_iprio_to_hw)(u8 iprio);
+	int (*qos_hw_to_iprio)(u8 hw);
+	int (*qos_set_untag_pcp)(struct realtek_priv *priv, int port,
+				 u8 hw_prio, u8 untag_pcp);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index bf508ed..639e6b6 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -830,6 +830,9 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.l2_uc_to_data = rtl8365mb_c_l2_uc_to_data,
 	.l2_data_to_mc = rtl8365mb_c_l2_data_to_mc,
 	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
+	.qos_iprio_to_hw = rtl8365mb_c_qos_iprio_to_hw,
+	.qos_hw_to_iprio = rtl8365mb_c_qos_hw_to_iprio,
+	.qos_set_untag_pcp = rtl8365mb_c_qos_set_untag_pcp,
 };
 
 /**
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index 5b9e1ab..b61ffdb 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -18,6 +18,7 @@
 #include <net/ieee8021q.h>
 
 #include "realtek.h"
+#include "rtl8365mb.h"
 #include "rtl8365mb_qos.h"
 
 /* The chip's eight internal priorities carry 802.1Q traffic types, one
@@ -218,54 +219,113 @@ static int rtl8365mb_qos_check_port(struct realtek_priv *priv, int port)
 	return 0;
 }
 
+/* Family C stores the traffic type as the chip's priority */
+int rtl8365mb_c_qos_iprio_to_hw(u8 iprio)
+{
+	return iprio;
+}
+
+int rtl8365mb_c_qos_hw_to_iprio(u8 hw)
+{
+	return hw;
+}
+
+int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
+				  u8 hw_prio, u8 untag_pcp)
+{
+	return rtl8365mb_qos_regmap_update_field(priv,
+						 RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port),
+						 rtl8365mb_qos_sel_mask(port),
+						 untag_pcp);
+}
+
+/* Convert an internal priority (an 802.1Q traffic type) to the value the
+ * chip uses. Return the value or a negative errno.
+ */
+static int rtl8365mb_qos_iprio_to_hw(struct realtek_priv *priv, u8 iprio)
+{
+	return rtl8365mb_get_family_info(priv)->qos_iprio_to_hw(iprio);
+}
+
+/* Convert a chip priority back to an internal priority (a traffic type) */
+static int rtl8365mb_qos_hw_to_iprio(struct realtek_priv *priv, u8 hw)
+{
+	return rtl8365mb_get_family_info(priv)->qos_hw_to_iprio(hw);
+}
+
 int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port)
 {
-	return rtl8365mb_qos_regmap_read_field(priv,
-					       RTL8365MB_QOS_PORT_PRI_REG(port),
-					       rtl8365mb_qos_sel_mask(port));
+	int val;
+
+	val = rtl8365mb_qos_regmap_read_field(priv,
+					      RTL8365MB_QOS_PORT_PRI_REG(port),
+					      rtl8365mb_qos_sel_mask(port));
+	if (val < 0)
+		return val;
+
+	return rtl8365mb_qos_hw_to_iprio(priv, val);
 }
 
 int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 				u8 untag_pcp)
 {
-	u32 untag_reg = RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port);
 	u32 reg = RTL8365MB_QOS_PORT_PRI_REG(port);
 	u32 mask = rtl8365mb_qos_sel_mask(port);
-	int ret;
+	int hw, ret;
 
 	ret = rtl8365mb_qos_check_port(priv, port);
 	if (ret)
 		return ret;
 
-	ret = rtl8365mb_qos_regmap_update_field(priv, untag_reg, mask,
-						untag_pcp);
+	hw = rtl8365mb_qos_iprio_to_hw(priv, iprio);
+	if (hw < 0)
+		return hw;
+
+	ret = rtl8365mb_get_family_info(priv)->qos_set_untag_pcp(priv, port, hw,
+								  untag_pcp);
 	if (ret)
 		return ret;
 
-	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, hw);
 }
 
 int rtl8365mb_qos_set_pcp_prio(struct realtek_priv *priv, u8 pcp, u8 iprio)
 {
 	u32 reg = RTL8365MB_QOS_1Q_REMAP_REG(pcp);
 	u32 mask = rtl8365mb_qos_sel_mask(pcp);
+	int hw;
 
-	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
+	hw = rtl8365mb_qos_iprio_to_hw(priv, iprio);
+	if (hw < 0)
+		return hw;
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, hw);
 }
 
 int rtl8365mb_qos_get_dscp_prio(struct realtek_priv *priv, u8 dscp)
 {
-	return rtl8365mb_qos_regmap_read_field(priv,
-					       RTL8365MB_QOS_DSCP_PRI_REG(dscp),
-					       rtl8365mb_qos_sel_mask(dscp));
+	int val;
+
+	val = rtl8365mb_qos_regmap_read_field(priv,
+					      RTL8365MB_QOS_DSCP_PRI_REG(dscp),
+					      rtl8365mb_qos_sel_mask(dscp));
+	if (val < 0)
+		return val;
+
+	return rtl8365mb_qos_hw_to_iprio(priv, val);
 }
 
 int rtl8365mb_qos_set_dscp_prio(struct realtek_priv *priv, u8 dscp, u8 iprio)
 {
 	u32 reg = RTL8365MB_QOS_DSCP_PRI_REG(dscp);
 	u32 mask = rtl8365mb_qos_sel_mask(dscp);
+	int hw;
 
-	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
+	hw = rtl8365mb_qos_iprio_to_hw(priv, iprio);
+	if (hw < 0)
+		return hw;
+
+	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, hw);
 }
 
 static int rtl8365mb_qos_set_port_qmap(struct realtek_priv *priv, int port,
@@ -306,19 +366,27 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 {
 	unsigned int nq = priv->ds.num_tx_queues;
 	struct dsa_port *dp;
-	int iprio, ret;
+	int prio, ret;
 
-	for (iprio = 0; iprio < RTL8365MB_NUM_INTERNAL_PRIOS; iprio++) {
-		int tc = ieee8021q_tt_to_tc(iprio, nq);
+	/* The table is indexed by the chip's priority, not by the traffic
+	 * type.
+	 */
+	for (prio = 0; prio < RTL8365MB_NUM_INTERNAL_PRIOS; prio++) {
+		int tt = rtl8365mb_qos_hw_to_iprio(priv, prio);
+		int tc;
 		u8 qid;
 
+		if (tt < 0)
+			return tt;
+
+		tc = ieee8021q_tt_to_tc(tt, nq);
 		if (tc < 0)
 			return tc;
 
 		qid = rtl8365mb_qos_tc_to_qid(nq, tc);
 		ret = rtl8365mb_qos_set_qmap_qid(priv,
 						 RTL8365MB_QOS_QMAP_DEFAULT,
-						 iprio, qid);
+						 prio, qid);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index 9602807..d68b2bd 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -30,4 +30,10 @@ int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
 int rtl8365mb_qos_get_apptrust(struct realtek_priv *priv, int port, bool *trust,
 			       unsigned int n);
 
+/* Hooks of struct rtl8365mb_family_info, one set per chip family */
+int rtl8365mb_c_qos_iprio_to_hw(u8 iprio);
+int rtl8365mb_c_qos_hw_to_iprio(u8 hw);
+int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
+				  u8 hw_prio, u8 untag_pcp);
+
 #endif /* _REALTEK_RTL8365MB_QOS_H */
-- 
2.53.0

