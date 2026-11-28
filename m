Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824652;
	b=TU6kSv/T/7iVIyV9pDU7xZGOuY/DzUNtcXvuxiuCw/k5AKfoGUYKwmPOm3zxLf0yFKrX
	 ZQOuZMN/JqCuPfLm30Y6tr5OMW765IdNLkPcVVKmIxUe67khNyZZPuPRZCX1n5t9doCzA
	 ADQzFdnJr4qgxLUJOj94SZ/ijr0vGt0in1bO6N/eRNQqoqt6RT9YtfyGQSpAbIW56MtcB
	 DaNdVFerR+rjlXvaxN9E7TVKYhi4O81+UrUbFCwTdHmehib9o/iPmUORsYp7p85L1YtxC
	 g5OsYVJ+k8g7ryMMr5TKch+ePTVEG8eRjz4dM8ihGcRKkx21cFjsgyUw6DUvJnJR/ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824652;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=wHUeyxrwyc07+ERgiFpKty+rqwo6poFuyrLn6RGP89g=;
	b=E8xdYOCdFLAH6tdv5K1ecQH1kjQ8rDlgOsHNNN3G/JoGzIYl1TeIUkxIMGvSIaiCUEl5
	 9ESjIbkhJ1d9M6/jI9dn7wlj9kvsDMMQLe7Tv3hhMcitO718kQfV2f1x5fz1IOjas23hM
	 xMd48aPx+ZQAs7HlWWI0zGcvsqC9HG5kxXb+fk8HTk3pFWWHnk1jHYy9pUEFwXxI4Se3x
	 NHSsIcZOqiOueLsnwudKfvdfoznPKacRF+mbaErHIxTekjLVp7qLKReZAbNS7n65HHxjp
	 BtC43sc1ftWC3L0NS/ICtfVPBn0wXHzWD21PBUDOyeEqB0h9aOnYLV8rpLb8BzPdF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SCEWUPo1;
	arc=none smtp.remote-ip=66.163.187.33
Received: from sonic308-10.consmr.mail.ne1.yahoo.com (sonic308-10.consmr.mail.ne1.yahoo.com [66.163.187.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1408606A32D
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1408606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SCEWUPo1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824651; bh=wHUeyxrwyc07+ERgiFpKty+rqwo6poFuyrLn6RGP89g=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=SCEWUPo1jWchtzIX00z08sIIbVkSR5oMAcKE4k4LPuRsctnVN5oTJS7FakAngqPYJwt8U/k8Tk8z3TreEbDc2UFPfURpIf1RVQggtvik6TryRA9RdT6cjeLeOFfFmdJVRwrGcQ0jT4YWinWtUxsDcH0DS5v1psOXelnewU0j3rhjjXw9mcPYTRjnaHK7VRzGGsFCdKatpVLF3a/T7sEdmqbwL2OJlM3rzBywrrJTiIkoEoPhJQYcv5ROu+iaswE3TFhlxyHwGLGduqGAI/vj+oJ15BPWhZ3bL8TX79OpbAsfiDyfLwCk3tVOpRMvo6AK8ktwpIuMxDkZHeM2rPMRSA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824651; bh=3iLm/8S314bAsljVpf/xHPpORtO0bKR9QwsuZIxUPov=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=mWnK2H3ekLT1kSvdxFTtVs+tN4fO+yrA+5eOvVRow/+8lf5zjmzqTd2iY4iP5rGgmUkSdEYt3P2Imaos7BKoEdSt7m8qFi2NPaiQF6R5BsY6M/WnruyEaE/v7DJUTfPHH5NZT5xxSF1kt2hYgtYCd1SaoC2GiLwKVaWZt0mSPs5dZvcnCH6515WSbN5YzuWRHhZHwr+8bjtuBMLIy74bsO/JJ8M+MEYI+5BPGuxieUHHCGL8eIRsxOPVzny3oOnfGJ61bTzUv8chh1wweDp7yMh1XKXHVNeTW0YoRxsJAlAWuwASFWzcI4EvRfOZgpDfqOY0v5uoc513Wmn02aNUmQ==
X-YMail-OSG: EQ5L5lkVM1l5ZB_xpd3M7OqHxNaFbazlT3GsgHoj45mt4xqrGb6vTf_p6Rlqn1J
 ER.HVJ_0GP_K.JwqHpr9ENraXyX_kpXkdrHC3IVWJTR1avK.9mEs_cJPzkWOWR9aydPv.aa_8dml
 J5CVa5Btsw2sm5pxCL37XgnossDLItUBfzZOxU9JVr1bpoA16EbJiJid_Uyp8FDxNmofdiQpHGU6
 _bwU7YVIaJOIT3NxZxg6stRCrVTdtMYH00imoXI69RJuQm0ACbo1eX7yseyMVmaV_dZ4wDJN9eP.
 XEyBSa1Iw7QnXcFdGysfTMoa6I0qClS9uesoTS.ux4drE1t.hbxDPlhr7XGs86vBVI1suQZzYrbd
 3VJjBQ1XUhVcIsqXb0XSmAo1bqE1RHYR3hmzeOioMkHNbViG5DD2mUeShOXCQZu4o6M.sRFb1mcu
 gn7rqPpcnXWzX7gOyiQDLHf6Rv3r8tC2ACNr8ot28WaXPZWh4Mh3zf7Nt6eOqI3r3XjOjGAHc14W
 ZkvyiAdTv4.aDjulMoylswbVYTOFbGBKcIttSDaipj.zyGLI_Un_WGvlb5GciAiVLVfv2s_l_aFC
 aibuQ4LoWRDJvnDNX.b0N5ZDVmddtrDEXAR07Gf9sn9qRM9RtiBFyV20Ak2JMmAuNIomRQtUpBgu
 w9Hjkwgz9gdPxsX2ZqtZE7UJk0.znS94NaRJd7FNzUcSq8nVDA2csUCqmQxNdooGWKct3WfcEzW_
 5fS_3TRjASuml8uvCevCvLA.sa6YXHwLUsERRvYhBeSLjj582V53qTAPZp.R8vF_OPl.1zWxForm
 JJr.QVwo1EdbzT8xRXZQ1fiYTuE4KGqKJfxlo7Uvs1Gp7euU2oY74bTv6GpHCxkHYCSkHOdwADOL
 ySP8fNb7Co.mfAgeZQc8xMkt_fsrZwytw3QpVXQ38acom1ySE3dpWt_IiP5rkfzTx4xiuJY5s5ag
 4hVwmKLgzpyZY3EkLU4WThZMLzdbFx7HdTto8Zc4zGyKRMg1grUEBQ3jxHa.MR9n.q.LOkGbyCii
 tgmdrrvW7UU06MpFBdZBP7scuRFJSYoKWVDrjuDPvErXcICPsDuuQF6MdN5r5j_4sLPbpBqmCyX0
 KDU67MGy18_4dssfhm8d43YEchvCUqmpcNRwAJRRheksjK7uxgPtFCrzFUicm0btBI9rHcqHEt_l
 Gb0wooKZ3TLey0Q_v1K8U.Rcu21.GyBRWQVq8H6NyqxRwlkJa_AJeOASBEJlDlC9lpqNjiFOz3uu
 qDqmtKNO06vQdZ.GZ66igkqoJSx8Mbk0xsDaCAy1W6dbeacaR7iKrjmnVHC01ZxwxE4SW8XXdvee
 do8R9hKafcg23rt2u8yGMcGfJmgXRE08Mr2UHt6tXe5dK9arhb0AfFLH1nYdXz5YybbK5UULy_st
 UtXkV8wnBXhcxHt_YrmSzmOOLIbysqPUAJIFZGhLVerBjZ5_LirTxMjHwTF37elrnNxmDbK.G66a
 vNFXsLROWsKVkrlW.5q3RK_MlDXvqPBCsQjklyhZPMbLo8.PA.dpm0eJnrHvyX_qi7Eq7M.chjvF
 2FJ2jDmP90PMvaunKCnPDYMyTfVhqf9ic25gFg0EKNN98NUwn_YTzUnob1SlSlUMg5G6mkuXL1m_
 b0tq9hGtaWCmR4xK4sVLdhsLZZmHR0hRSQlv4DS24UEF.59_ZmTCoO85_2Gn2H1XmUmK9brItPvm
 N7PdAs9_eCuLnoFxa7RhVHpYCJ7aVICmFsMLR5MO.Ew2dTNIjxJ3CkkZl9IBWf3nFNePcVaTi_d1
 iRuip6YakOARNuuGY6fs1ZFQCUw3bZ35.Fv4ysKftxdze.DhgbWxT4zeKGBHUuNp_gHJDNF_YYMs
 cutKhMHwD7qu7oncfY.1_P89irYgG6DYk5UOc.q8vXQODRp5W_oLQlUQ1a8FSjegN6q3N3z0MD5i
 vbb4_3jgDxjJsek0GOHDXfntFP3EQ2IDFvNG2glXD5Rh3UEaEXzYOmCEFFWA.pLLY8Zl511C6UN4
 Qp6cc38BEwxeV5siByxiVYUKsfCLFFt8qVzFsyCezii1eQu.NH3Ne3GnXKnDxXWU9k9ii2AjeXAS
 .3wa2OoXqSGzoJ38g78sezLkTraEkQwySNcI3PhWh74ye81R92903Zx2imvglP0e70Q80DXc.A0d
 oKyDfaLArVffJXG3FFtpkSUKFyPMoNqOoQ.TE1gLdhdFQUtP7JHShJVQ5rIy3XWHrGQlMsMA93LX
 rbH_iBxcgKrr3wanTdhcXjUfvAIgn.FEQP._UJ5PmrWAUYp6XEPTvzCxInCVRKUNNrFL2.Sbl_Bk
 4OAex9xubf9Sz9I7kXn7xL8n8slHylDCf1D13KFF_xps-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: fd34a7ec-17b8-4e9f-bdbb-569604b8762e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:10:51 +0000
Received: by hermes--production-ir2-7c4859dc89-526xz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 13756ac05936049b14326e5013c722ab;
          Sat, 28 Nov 2026 00:10:48 +0000 (UTC)
Message-ID: <9a939858-3886-46bd-bf21-a825e1595203@yahoo.com>
Date: Sat, 28 Nov 2026 01:10:46 +0100
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
Subject: [PATCH net-next v15 14/15] net: dsa: realtek: rtl8365mb: use PCP
 numbering on family D
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
On family D, convert between traffic types and the chip's numbering at
the register boundary: for the port priority, the PCP-to-priority and
DSCP-to-priority tables, and the priority-to-queue table. The PCP of a
newly inserted tag then matches the traffic type whichever source
classified the frame, and each traffic type still lands in the same
queue as before.

Add the family D implementations of the qos_iprio_to_hw and
qos_hw_to_iprio hooks introduced by the previous patch. Make the
qos_set_untag_pcp hook optional and leave it unset on family D, which
cannot assign a configurable PCP to untagged ingress frames. Use the
absence of that capability to reject PCP trust, while keeping port-based
default priority and DSCP trust supported. The family D hooks are wired
up by the patch that adds the first family D chip, so this patch changes
no behaviour yet.

Tested by Gustavo Foletto Mora on a TP-Link EX511 v2 with the baseline
QoS configuration (no CONFIG_DCB): untagged frames leave tagged with PCP
0, tagged frames keep their PCP, and the QoS registers read back in PCP
numbering.

Reported-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-7067296792
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/realtek.h       |  7 ++--
 drivers/net/dsa/realtek/rtl8365mb.h     |  3 ++
 drivers/net/dsa/realtek/rtl8365mb_qos.c | 54 +++++++++++++++++++------
 drivers/net/dsa/realtek/rtl8365mb_qos.h |  2 +
 4 files changed, 50 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index cee8e65..3dadc47 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -185,9 +185,10 @@ struct realtek_ops {
 	 * priority. A *_prio getter returns an iprio or a negative errno.
 	 */
 	int	(*qos_get_port_prio)(struct realtek_priv *priv, int port);
-	/* Set the priority of @port to @iprio, and make @untag_pcp the PCP
-	 * given to untagged frames on @port. @untag_pcp is an 802.1p
-	 * priority, not an iprio.
+	/* Set the priority of @port to @iprio. Where supported, also make
+	 * @untag_pcp the PCP given to untagged frames on @port. Hardware without
+	 * a separately configurable untagged PCP must reject PCP trust.
+	 * @untag_pcp is an 802.1p priority, not an iprio.
 	 */
 	int	(*qos_set_port_prio)(struct realtek_priv *priv, int port,
 				     u8 iprio, u8 untag_pcp);
diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 7fb1a46..4ebc46d 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -61,6 +61,9 @@ struct rtl8365mb_family_info {
 	void (*l2_mc_to_data)(const struct rtl8365mb_l2_mc *mc, u16 *data);
 	int (*qos_iprio_to_hw)(u8 iprio);
 	int (*qos_hw_to_iprio)(u8 hw);
+	/* Optional. A NULL callback means that the family cannot assign a
+	 * configurable PCP to untagged ingress frames.
+	 */
 	int (*qos_set_untag_pcp)(struct realtek_priv *priv, int port,
 				 u8 untag_pcp);
 };
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index d422955..0b95f1a 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -22,8 +22,11 @@
 #include "rtl8365mb_qos.h"
 
 /* The shared rtl83xx-qos.c layer hands this backend internal priorities
- * that are 802.1Q traffic types. The chip's own priority is derived from
- * them through the qos_* hooks of struct rtl8365mb_family_info.
+ * that are 802.1Q traffic types, one per traffic type. Family C stores them
+ * as they are. Family D numbers its internal priorities like PCP values, as
+ * its vendor API does, and takes the PCP of a newly inserted 802.1Q tag from
+ * the internal priority, so it converts them at the register boundary
+ * through the qos_* hooks of struct rtl8365mb_family_info.
  */
 static_assert(RTL8365MB_NUM_INTERNAL_PRIOS == IEEE8021Q_TT_MAX);
 
@@ -63,11 +66,11 @@ static_assert(RTL8365MB_QOS_PORT_QMAP_SEL_REG(RTL8365MB_QOS_MAX_PORTS - 1) <=
 
 static_assert(RTL8365MB_QOS_QMAP_DEFAULT < RTL8365MB_QOS_NUM_QMAPS);
 
-/* 802.1p (PCP) -> internal priority remap */
+/* 802.1p (PCP) -> hardware priority remap */
 #define RTL8365MB_QOS_1Q_REMAP_REG(_pcp) \
 	(0x0865 + (_pcp) / RTL8365MB_QOS_SELS_PER_REG)
 
-/* PCP given to untagged frames, one 3-bit field per port */
+/* PCP given to untagged frames, one 3-bit field per port (family C only) */
 #define RTL8365MB_QOS_PORT_UNTAG_PCP_REG(_p) \
 	(0x0851 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
 
@@ -83,7 +86,7 @@ static_assert(RTL8365MB_QOS_PORT_UNTAG_PCP_REG(RTL8365MB_QOS_MAX_PORTS - 1) <=
 static_assert(RTL8365MB_QOS_PORT_PRI_REG(RTL8365MB_QOS_MAX_PORTS - 1) <=
 	      0x0878);
 
-/* DSCP -> internal priority, one table for the whole chip */
+/* DSCP -> hardware priority, one table for the whole chip */
 #define RTL8365MB_QOS_DSCP_PRI_REG(_d) \
 	(0x0867 + (_d) / RTL8365MB_QOS_SELS_PER_REG)
 
@@ -152,8 +155,9 @@ static const u8 rtl8365mb_qos_apptrust_src[] = {
 	[RTL83XX_APPTRUST_PCP]	= RTL8365MB_QOS_PRIDEC_1Q,
 };
 
-/* The 1Q source also classifies untagged frames, by the PCP given to untagged
- * frames. Ranked above DSCP, it would hide DSCP from untagged IP frames.
+/* On family C the 1Q source also classifies untagged frames by their configured
+ * PCP. Ranked above DSCP, it would hide DSCP from untagged IP frames. Family D
+ * has no configurable untagged PCP and rejects PCP trust.
  */
 static_assert(RTL83XX_APPTRUST_DSCP < RTL83XX_APPTRUST_PCP);
 
@@ -240,6 +244,17 @@ int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
 						 untag_pcp);
 }
 
+/* Family D numbers its internal priorities like PCP values */
+int rtl8365mb_d_qos_iprio_to_hw(u8 iprio)
+{
+	return ieee8021q_tt_to_pcp(iprio);
+}
+
+int rtl8365mb_d_qos_hw_to_iprio(u8 hw)
+{
+	return ieee8021q_pcp_to_tt(hw);
+}
+
 /* Convert an internal priority (an 802.1Q traffic type) to the value the
  * chip uses. Return the value or a negative errno.
  */
@@ -270,10 +285,13 @@ int rtl8365mb_qos_get_port_prio(struct realtek_priv *priv, int port)
 int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 				u8 untag_pcp)
 {
+	const struct rtl8365mb_family_info *fi;
 	u32 reg = RTL8365MB_QOS_PORT_PRI_REG(port);
 	u32 mask = rtl8365mb_qos_sel_mask(port);
 	int hw, ret;
 
+	fi = rtl8365mb_get_family_info(priv);
+
 	ret = rtl8365mb_qos_check_port(priv, port);
 	if (ret)
 		return ret;
@@ -282,10 +300,11 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
 	if (hw < 0)
 		return hw;
 
-	ret = rtl8365mb_get_family_info(priv)->qos_set_untag_pcp(priv, port,
-								 untag_pcp);
-	if (ret)
-		return ret;
+	if (fi->qos_set_untag_pcp) {
+		ret = fi->qos_set_untag_pcp(priv, port, untag_pcp);
+		if (ret)
+			return ret;
+	}
 
 	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, hw);
 }
@@ -369,8 +388,8 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 	struct dsa_port *dp;
 	int hw_prio, ret;
 
-	/* The table is indexed by the chip's priority, not by the traffic
-	 * type.
+	/* The table is indexed by the chip's priority, which is the traffic
+	 * type on family C and the PCP on family D.
 	 */
 	for (hw_prio = 0; hw_prio < RTL8365MB_NUM_INTERNAL_PRIOS; hw_prio++) {
 		int tt = rtl8365mb_qos_hw_to_iprio(priv, hw_prio);
@@ -523,6 +542,7 @@ static int rtl8365mb_qos_apptrust_check_shared(struct realtek_priv *priv,
 int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
 			       const bool *trust, unsigned int n)
 {
+	const struct rtl8365mb_family_info *fi;
 	u32 reg = RTL8365MB_QOS_APPTRUST_REG(rtl8365mb_qos_apptrust_src[0]);
 	u32 mask = 0, val = 0;
 	bool any = false;
@@ -531,10 +551,18 @@ int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
 	if (n != ARRAY_SIZE(rtl8365mb_qos_apptrust_src))
 		return -EINVAL;
 
+	fi = rtl8365mb_get_family_info(priv);
+
 	ret = rtl8365mb_qos_check_port(priv, port);
 	if (ret)
 		return ret;
 
+	/* Without a configurable PCP for untagged frames, the switch cannot
+	 * assign the requested PCP before 802.1Q priority classification.
+	 */
+	if (!fi->qos_set_untag_pcp && trust[RTL83XX_APPTRUST_PCP])
+		return -EOPNOTSUPP;
+
 	for (i = 0; i < n; i++)
 		any |= trust[i];
 
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index 70c50ab..70608fa 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -35,5 +35,7 @@ int rtl8365mb_c_qos_iprio_to_hw(u8 iprio);
 int rtl8365mb_c_qos_hw_to_iprio(u8 hw);
 int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
 				  u8 untag_pcp);
+int rtl8365mb_d_qos_iprio_to_hw(u8 iprio);
+int rtl8365mb_d_qos_hw_to_iprio(u8 hw);
 
 #endif /* _REALTEK_RTL8365MB_QOS_H */
-- 
2.53.0

