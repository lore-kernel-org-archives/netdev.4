Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340979;
	b=udPVdDtOAqHcfy65OpS/UARxeT+KSDlWKFWbd7WktyQhGPI99tBsZhotieIjXrm2bzYe
	 1tcyip8xiyFH3DA2xr5N2EkbqC+SqE+pnyQ6br2Jlp+X8A+nObLRFI/eHyhChOUvh/L0T
	 4QkJWXMR07e4anoxKnUXC1R9TtKUP/VIFYQkiNHqddm3gnCDZMqSqxpVgyQbZ5agWZ/9Y
	 Xq6HC96WEQklyHzf63x71q3DWfyxiUI71XWR1dJKxUDUe/PceqS1b5k/bHjOpYLimNqDt
	 vT8SPgv3417n0ZLii4QXZpTkH0vLn3l8HmDhYiZVl/vcJXhSmc9DHChOWF4r75c+vdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340979;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=AXr77ig7wlBnv0h1VQ1e9ynSwmAK7ND1eSfnfKn9fC0=;
	b=lpCQvnHte9fav0w+wW8ccV1uMlA8Ad6Foa/hwJVFVWYBo1gfkNkZ92h0dI99cjgRFhm0
	 WNSEOnVcdbwBzFmuzJpcu4Xpm589BSCjsmouYbFKBjPIHJQx9MPKbb0JXfzU9YBwWlV0U
	 t282kXDXQTdl2gontvJLev2thy5SvEjeOO0rpDjCOb3FUHcSTBw/fjCgu2uUxwDqrCinn
	 Xs5gbxVH1e5kdnzblkylg+IAqLqGnnYlro9FDFLNFYS1iRgK2/PvTEXGOD+YVVW5R324o
	 V95gUBkrhLzSb3Wsqkp04fXeOeVayZ21Ngzpr2roe1g5hk2GEhXQl4ijxdu6+DmyLAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=uLwLIZEO;
	arc=none smtp.remote-ip=66.163.187.148
Received: from sonic316-22.consmr.mail.ne1.yahoo.com (sonic316-22.consmr.mail.ne1.yahoo.com [66.163.187.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209D606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8209D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=uLwLIZEO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340977; bh=AXr77ig7wlBnv0h1VQ1e9ynSwmAK7ND1eSfnfKn9fC0=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=uLwLIZEO2esAJ2kEw1pjZzzfuaqjDYgLkQ/ZV9Vpz+2U281yww/gudn+TyzLYGYsey+oefzcEvSOddI5cUsFvG8kJS+aYB7unhHTOyurJfi9QryD2kRUX/I2KEeeVti4zLUS8ehv3+bOWcpf8gCFPxIt/Co+FmkBzcO3+8Ie7Wjzdjl3PhxivWfqs7Vz62S7LLVA90g07FDgXyt3tZpPejoXuHGKnfaWGzpqR9A2OlWFdUf6QaYfm3c2TagTWjQCXwJ3pXiNf2+qi+eplJUR5pMGWJ+/UAIG+fZKmP2NwVvIbG71nBbZH+//ctk6Ted0W+jmPA/vyJGmJ+LaA+m/sA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340977; bh=2TuWL4VbVwSzz24JhlRbE9Zu5kQPa2CijwwjVVIVoYh=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=U9fAxcTt4hZ0C/e79s6fcvJPn/XPIQ3FV44IYlpvaABX0iqw5+WZGR1wlQAyFndbTu9FgZILBYyCq995ctCGk9yDa8s0tX7Ncvol8RKVB862sjjbGILbZNVXonI45GdW4degZL9y9/hmrWR5Gshpr9CD9EWcituIMnA2Ab+4FJka9zH2AeBYMosiKbhrl0wW2Xi4NlhCQ2PhtWILkeycox9gxwjbRfWyi92dZ8aWoH0Qy/uyiF/BgopPzFjBduYiXPkg69/+O4lspJCC+6Okq/tnmdVYuRj2y/01QyOQZqsTQMhVaihbnTTVLvtmQZ8bn25cmXHlvznqP8tEczqF4A==
X-YMail-OSG: 28FPnicVM1lIFqo3esJ0579VrZnSRp4gniyxmlfhWZsQRHwQd6U01oTBOAmf3Jw
 n97gS2pFvmcYPRgr0tA3JJDHJ5PbSXnw3jGCrmzj4XTR9k_uxv.zE47OL0UolQMzGWjBcpWQj8qK
 AUdF5DzJYUmt1VU0OMxSvrC.BAZVFZlSj379XNaJ.I9Fygv0iTTYXnJi3Bh6PRNbu8EsHvh4I6VA
 7HUx2oMgPIlyePPaGBEskK0ZaSwj2tMqLMNblHTw1lxkoTIz.ZLUgywI9gn88wLvmJtL39Px2kmV
 XCboey3Uu8nmkliL6etEKQ0VOgSJxCWusKdOcRaApaR4F5GPtLZIZHBZytI6TmH2AbLMzVQAdxms
 ykj5RLAyckU2O4OCeJq5NZD4RXjDqc8pCieuuXyQb1Zq0q9_WdDf38IYhd9xkUHNSbVYEvy2H9q5
 k5DPF4DIlxt5fkoXE43Xir5YWWKKSzrMWWUegTCk662sti3czAMTPmPXyavO0ACjOetVcWPUR.3i
 P2EZau8qEzuCkJBTMse7QNtZVifHvWR6P399h4ziN7GjNV4gtVPA13nJOP2RzO1JSDQE8ggMHFXc
 gdUTDU9_UsJ_EltMz5R5Rwk.epJhzwJtMNkEBkpQ7jd2G.MQIYXB.2DwGWqbPcNODXTSm.ulUzli
 859VMrwvZ09CyAyJrJXHoI_PRajytEU4OY5oC7PGiXymfHXdLLGV4o.m3yoIH8iHe48qoSam41ER
 1M6L2zTmqQTVcYluvkxIKWtlzkeonIHsiqc2dutdrpleBNMeIjlQvFONpKZBl28EyfzLpdqbCDAf
 z.WAt4PDJYhJjDrjouJIYrJdWhKFL54XNc0V1WAGXPqKU1..7WmSu9XNrr1SBMDIIBRStCwnWpX2
 yWlrM5iEgIZaEkxzoNgzkh8DbZb8qC10dRmZw9GgkERyWMo47gO2o_xAbbLXj6bqYF_BPhV7Gd9g
 lDZYS2nUKDo.ifRv0iH3CvPkx2UjFIkj4lTAZV98pL1AUci4hGwFBw9GY6.R80TVgUU4ilwGYKxe
 VN4SmuoYu5niaI09069iAlGoy_W542y1lJF8vMphxARB3vDM15xA_miFgYwU9f5Ip6AmLpnsVerY
 6BjRWh1a81d_osEa4DLpAZCMbxX8gevK9yLEmZtPS6BTGWGjTvHSC22LL0TxPvpg82TsTG4NyzCo
 jTHQD45YM.audZspn8yLU7nRxN5GbogR.y4SKOWyZ9L82WjqVRKGMbrKqk3NfaBFoMxN0jL6pmk1
 k0I0k0O4XIArwZtbL9AO0Hv8vSeXyOVG.UcU05BzRtM9ici94_PKSKZWamPPdxMHCv5.0MCJz9XY
 5K_1iCu1Js0b5vYx97oj5VuEgKuZcSx_GcPRW_MQP0bYUWWJ8R20Z40iXFQIdbJ4fIXnmx.GE2p_
 g71qL36fAm1ELGC_tQggqnUrIT2HljG_.5iq7NQaj_f4yOlOZXDO3jobevqVnGsKF6BMlRT_IbrF
 1IC4jCxb4.nA3j8VaXiNXHdGgP3mi2HWWBHOC08EgkqcQYuk8prI3J1O0Kh1mpuXoFMy9dndP5dy
 pTkCmm8La7Nie36rwmyJRI975VDlEWE8aQImyoU93KVB1XgjGLbTWPyG_HRTcVt29izudR8Kdi_Z
 cgKs_LU6zFwO.3oKfr6syRx_k.hYL5Qu4iqCPMAhZI2K_vWihgzGIUIHkx_U3.QOinE_etsTDl6i
 mW49WaWSr9OPpaqMU7La62f98V3jYj.F5mI87mYyDUaWCoaLOiYeAj0yJmO2g.sqn6e.6L7uTnNX
 73dBgCwTaXTPySuHyhf5kx5Sb.mTrwRuX815.F3WVa6a_W.jBxCPTtcMOeWilMcWhK.nCYKZAaDF
 2lu3XKRceD3v4rSWs7HxAO64w5TL2R10eAbojckLBySLoPwTpbu3ZUV178T_fM98NHMe7IZRf.dK
 JyH4Ba59So6ITYkejnXOiORdTfG3uAOASbe3kQAr_sDgVob3UDgSfu5FG5hDjPbOtsoBVdCsRt4W
 jejjLn.GAuIbnk4EvNzWTuhekC_3SMBJL1zxALEdi7j.WRKb.WKyj4xgOyOAceq1yj4B0L34EfNI
 .F3yMrmqeRqhbL9FUz7VNIK6KkS176IwbVsOLfxFd_4SrMPUemtYu30grK7pbcFj.07NOQpgygw5
 MUrKZ2RspqC4XDeM7ntDV1vmlj_fjKXOCxheuiZekoJKzhTRJlWNUPJJ9Wocg0RiB9MbcJ_dtk0j
 5Im.GMWR6bs0bnQwW0MgXxgrUrNSh1t4k3hhqDyybtD8ZhEz9sN_gLzvD2UaDsMn185D2vdeyITy
 Y1mB2Jy6UHgKwFnm3w50OoesVDlOzZl1xwIFPgw11J36KG9TbpQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 8abe9f63-1b91-46b8-9e81-db49e5a77267
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:49:37 +0000
Received: by hermes--production-ir2-7c4859dc89-55s69 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 26de67baa51ca06dc23ddef4aaf3e993;
          Sun, 22 Nov 2026 09:49:35 +0000 (UTC)
Message-ID: <f5adc725-64fd-4aa5-b76f-b817528ba1be@yahoo.com>
Date: Sun, 22 Nov 2026 10:49:32 +0100
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
Subject: [PATCH net-next v13 13/14] net: dsa: realtek: rtl8365mb: use PCP
 numbering on family D
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

Family C has separate per-port registers for the 802.1p PCP given to
untagged frames (0x0851-0x0852) and for the port's default internal
priority (0x0877-0x0878). The shared QoS layer hands the backend internal
priorities that are 802.1Q traffic types (Best Effort is 1, Background is
0) and writes the untagged PCP separately.

Family D has no 0x0851-0x0852 registers: its per-port PVID register at
0x0700 + port holds only the 12-bit VID, and
dal_rtl8367d_vlan_portPvid_set() rejects any priority != 0. On an
RTL8367S-VB the PCP of a newly inserted 802.1Q tag follows the frame's
internal priority, so writing the traffic type as is made untagged
frames leave an egress-tagged port with PCP 1 (Background) instead of
PCP 0 (Best Effort).

The vendor API numbers family D internal priorities like PCP values:
dal_rtl8367d_qos_init() maps each PCP to the same internal priority, sets
the port priority to 0 and keeps 1p remarking disabled. Do the same.
On family D only, convert between traffic types and the chip's numbering
at the register boundary: for the port priority, the PCP-to-priority and
DSCP-to-priority tables, and the priority-to-queue table. The PCP of a
newly inserted tag then matches the traffic type whichever source
classified the frame, and each traffic type still lands in the same
queue as before.

The PCP of untagged frames cannot differ from the one the port priority
implies, so rtl8365mb_qos_set_port_prio() returns -EOPNOTSUPP on family D
for a mismatching @untag_pcp. The shared layer never asks for one.

Tested by Gustavo Foletto Mora on a TP-Link EX511 v2 with the baseline
QoS configuration (no CONFIG_DCB): untagged frames leave tagged with PCP
0, tagged frames keep their PCP, and the QoS registers read back in PCP
numbering.

Reported-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-7067296792
Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_qos.c | 111 +++++++++++++++++++-----
 1 file changed, 90 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index 5b9e1ab..c06d684 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -18,10 +18,15 @@
 #include <net/ieee8021q.h>
 
 #include "realtek.h"
+#include "rtl8365mb.h"
 #include "rtl8365mb_qos.h"
 
-/* The chip's eight internal priorities carry 802.1Q traffic types, one
- * internal priority per traffic type.
+/* The shared rtl83xx-qos.c layer hands this backend internal priorities
+ * that are 802.1Q traffic types, one per traffic type. Family C stores them
+ * as they are. Family D numbers its internal priorities like PCP values, as
+ * its vendor API does, and takes the PCP of a newly inserted 802.1Q tag from
+ * the internal priority, so it is converted at the register boundary (see
+ * rtl8365mb_qos_iprio_to_hw()).
  */
 static_assert(RTL8365MB_NUM_INTERNAL_PRIOS == IEEE8021Q_TT_MAX);
 
@@ -65,7 +70,9 @@ static_assert(RTL8365MB_QOS_QMAP_DEFAULT < RTL8365MB_QOS_NUM_QMAPS);
 #define RTL8365MB_QOS_1Q_REMAP_REG(_pcp) \
 	(0x0865 + (_pcp) / RTL8365MB_QOS_SELS_PER_REG)
 
-/* PCP given to untagged frames, one 3-bit field per port */
+/* PCP given to untagged frames, one 3-bit field per port (family C only;
+ * family D has no such register, see rtl8365mb_qos_set_port_prio())
+ */
 #define RTL8365MB_QOS_PORT_UNTAG_PCP_REG(_p) \
 	(0x0851 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
 
@@ -218,11 +225,37 @@ static int rtl8365mb_qos_check_port(struct realtek_priv *priv, int port)
 	return 0;
 }
 
+/* Convert an internal priority (an 802.1Q traffic type) to the value the
+ * chip uses. Return the value or a negative errno.
+ */
+static int rtl8365mb_qos_iprio_to_hw(struct realtek_priv *priv, u8 iprio)
+{
+	if (rtl8365mb_is_d(priv))
+		return ieee8021q_tt_to_pcp(iprio);
+
+	return iprio;
+}
+
+/* Convert a chip priority back to an internal priority (a traffic type) */
+static int rtl8365mb_qos_hw_to_iprio(struct realtek_priv *priv, u8 hw)
+{
+	if (rtl8365mb_is_d(priv))
+		return ieee8021q_pcp_to_tt(hw);
+
+	return hw;
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
@@ -231,41 +264,69 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 	u32 untag_reg = RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port);
 	u32 reg = RTL8365MB_QOS_PORT_PRI_REG(port);
 	u32 mask = rtl8365mb_qos_sel_mask(port);
-	int ret;
+	int hw, ret;
 
 	ret = rtl8365mb_qos_check_port(priv, port);
 	if (ret)
 		return ret;
 
-	ret = rtl8365mb_qos_regmap_update_field(priv, untag_reg, mask,
-						untag_pcp);
-	if (ret)
-		return ret;
+	hw = rtl8365mb_qos_iprio_to_hw(priv, iprio);
+	if (hw < 0)
+		return hw;
+
+	if (rtl8365mb_is_d(priv)) {
+		/* No separate PCP for untagged frames: it is the one the
+		 * port priority implies, so a different one cannot be set.
+		 */
+		if (untag_pcp != hw)
+			return -EOPNOTSUPP;
+	} else {
+		ret = rtl8365mb_qos_regmap_update_field(priv, untag_reg, mask,
+							untag_pcp);
+		if (ret)
+			return ret;
+	}
 
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
@@ -306,19 +367,27 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 {
 	unsigned int nq = priv->ds.num_tx_queues;
 	struct dsa_port *dp;
-	int iprio, ret;
+	int prio, ret;
 
-	for (iprio = 0; iprio < RTL8365MB_NUM_INTERNAL_PRIOS; iprio++) {
-		int tc = ieee8021q_tt_to_tc(iprio, nq);
+	/* The table is indexed by the chip's priority, which is the traffic
+	 * type on family C and the PCP on family D.
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
-- 
2.53.0

