Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.190.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565591;
	b=sEhjbXPFcBhQvLhOTw4aNTIh5r39kG+DIpouX0gIxpALhIWqVWLcfHRGz1j6Z8PwKnAf
	 en4N5pnTMwJffr3aGH9DRWkD6SiI+gy9d/omFF/NyecF9TxJ80MD4O203iKegRKzrrJkg
	 DMlQJvEnz5ylORZ/IPocFNTzIotTniM8WaGPeyW1MUQzsvfR/T9mCUPeaJkTX2e78ZE8w
	 ZrbHbb7Xr5YYlEtILEuBrwONK8xS0QwXjR9CUf4tDTzCU+b+i9Zh0lguEvp2T/Slx8tJt
	 towPEuoVPEfb6myyYbV4/wJh1ZfG80/QVHa/QEzlLsuS/OQz2iqrbVNPfDIee4Ocs9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565591;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Nve6Kou+e2cvOBQ0nlK5P7yII2LIXxNsQKJcZ7sEdT4=;
	b=ojyFIRVnU25fm7Bx2h0KVTLFydWUaVMlOFxs3QBijXFRpf9wrRzxNihUIK5drDRa3tf+
	 is37V9LkpFTVVUztnikbQodNtQsj0Y8BbvolCOjhdSX7Oe/mkMDuhYBkJ6bb+0iHp3Frz
	 SC+D7irqEcGCqQxKFCG/DOeV+usIVVR+vZdvsb7GzjdAzEN8KGVnhdzVdWc6a6HSBUKjL
	 rTI95EzYl3ArVw2MGmbaK6a8AmCAxq1q1O3mhrPjSxO3hbblmn9bdO+5zxDaS5qq2f9yk
	 o/zwUfY368ghCjwgmC4Mb+T82f1HTirlFT8KKSOgbABY9CsLCfHgDkRoVDFu7phsI2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CdrFIIfz;
	arc=none smtp.remote-ip=66.163.190.147
Received: from sonic315-21.consmr.mail.ne1.yahoo.com (sonic315-21.consmr.mail.ne1.yahoo.com [66.163.190.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A2606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=CdrFIIfz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565589; bh=Nve6Kou+e2cvOBQ0nlK5P7yII2LIXxNsQKJcZ7sEdT4=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=CdrFIIfzAg1+yesSF3Y0f/CfC2KvsKRdnBnwKp5PCg5JsOxM/SuqNEaJQYOTfo4gVAtueo5PRMKpOQ/pynl+qeb+mh+8t6h+WRV2Fs7fJWi+lkXDWVM/kfp8NTcsoILWxnRmhddLD+SG26AZysiCnsRQOQcUh/u+PgeJ+mJiCKfqRFhzAMbM8TPOICfhUDW+j6wKvfa/k1BML6NOR9t3h3fFR6k9vTUTd+pIxPvGA7ppc9qAnYxIyN0c/+MXX80d6xqaRdeYfy204Dwi2lvUev+x2cDQzLsp1AyUBqt7uX005GpTJHO1eiN3iIqno1pF4dFx+VnLvpeC/b5rVB3xRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565589; bh=sEfDl8ari/6/261iSinDF2s8raDAO/Ea0cspcoKqsP7=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=qbJWtv/wYi+H43X4WKH0LzFaTm6gsgIOWVYoLG+BVRdQno89ECRPXvRNfWUm3hAe34l9sPEijBDIidq7H96qfG0x3s5KuPX3yfpYpPR+dItgYRylt/ldJmnf8KO5njc/8ijgnbGoIvgVWMEj80MNGp419fbpb7nSuP9DKncCg/nZ9p/aR/iEH3KeIhyRM9wSJlkL7GOkxzFiJo+jMDDhEDuZZ+0cSIkC4ZySvQDkbuF9QwKXyoNrp08Yfa+6ulfaCv6MzVT9XpMJBOaC1Vhc6bbOaOjsUSNxIvQqF3lrILnb40jshjNbQtZAiovCELHjg6IIVB4MDHQ1ump6JZGPSg==
X-YMail-OSG: KpPNpQQVM1lXGzGkWLHgGTRm0G_f58ALtdSS17L1pbo43IiwgEPXcbUfOhTU9Zq
 pu66RUj_WW9VNQK54kNBWJnU5AqKdNlUAHC65JuwQiSeo8sojO56jbPrfcFsIJSfpwEkLZBv4dlK
 z381wPc8t8kUSXsFrVMZoj9cv5ljTf2F9KXiESGUctFKZrmFe_AcLW5RIaEHig7gnFQJdfpF2akQ
 MlEdUj24eKTFmfnlkRryQ5nsk717h19XQjV1TpN7D5JVaD.e7GLK.2io5DjdTZggH3sD73kOtiGg
 uiMk5v6rsY79e0wsFs9kmOxNC.hkNARS0rtWMFseFQwKRY_44C5OiHxDkjho1vUU.VfcgNNstVXk
 L0PCy_sq0sKULukjIsfBTCxf2J5ZtUETxVKfmaZBqMFfwmfHVd7m7gykt2RoTtfUWsxWwPvMLOPT
 qBtP5nvXPMJ8QFvwDgGK4MXiWXaW2xXgsSJoFGBX8dK9DLAm_kPC83fSnU_COvKDntl3rUZWIN2x
 MD9Mb_2XXAyTaEHMgP.V_y7WTD1PB6W2GfAnHw6OTDuPEjuAPC310xZbQ9B2mWH4b9cQwsmpKjgv
 IYpZeCj25IhAGjs95acY_WC7PP3R8fqwQ_gCOZcjrolKJ_1U0TmxdhSoVw8DZTK8nBR0zduEMW2u
 k6fdCiJsaUiferqVhIkDJGduJeaB2GJBfVta47qkg3QfB_Ak6OY.NK8a1.0xfaxmzu2vgLXNGnP7
 QiYOFkYJWylWU.e5q1SsNn7vvCQbf6CSaHLEK.bqd8S7ydjzbeaZF1hh1iLmXUPpwQ8emGbYIqjM
 niL7KRvZ7Pbp0muP5FDdR5DAtwevsl0BxJ1AJJVPEw4MELPKBUsnITdoSehUCYw_8XzEdEFqEwB7
 tPAD3DYWL5IKEjzizTluAfdtPCTMi7JvWcqSr6_nmde.wj_oOVWHzWw6p5J_1NXwqN3npGI9bV4i
 a.D0.ozNSKlPNQE5KbRZtpp6BAF5Emws92DywsRI0Cso.WuLmWOhGjLKH0cPzRkYdv2gVvT0fFQd
 0M5KD7WJoU0F5LPsFXQuQrc0vFJtGLAQkQPwKA0x3uBzhPlFLmTB87n3rfh9DsJv1pmxiGcSqbVq
 tkFPGNQoDOsxZyp0q5RXrkTEtQoo85nCBwGOXIMjuCSlotz3VjP3u_UO.7F5CILusMzz0XP4b7sr
 gkK7UfNwnrXOlV4TRDxVovdtwhLmLD4x_eFPsmd9MfYyFD_Ps_tOY4K4sjdvoHCjAz8VhLrNihGj
 IzAMaHIu5aNZUXbKxNu.9FtNU9Za5rIIq0LCHYQr4jVx714p_L_yWRk2fpPmhwUA2PYPdlCzMWJG
 TMcZSyv_3UzQTtPpfhKsxFQKYXsi0bFLrZDw9P8znUxkDYO.iM0NfvVx4yDe5rAUwYC.PJBYM1t8
 drkGKZtH__Nr.IXwIyHawZJ2WOC.t2IoGheJGfwrBVi0gBqojOl4YgC9GYo8vyVuA_uXxatbAwBK
 0F3WwqDTEb8BwGMsfS05PboJ2GXOw1DIkOqDlE.ALLKI.SrXXAriQ4TZ9WjvP5T8o4Il0scZr3DV
 qOynZb7W3dQVLDGK_WlPl0TYeTavUGwM8w.Edu6u1iGMA6tPmLZlokQVsrfzJ3g3T_Ym3Y5c2vqL
 l_g1Ytgbs2bE4.SG3ZI3ftCplTA87S.pqdpXJaRewk03fzzqtQ3WgWOTKm17vzYVfS6WAcqcT5at
 zWriXhFhwUSevgY8pExhVcHbWIO5St4vJXH8decMmylF4Et.RAvAB__2_Qpd.F.KUK4UmR6RMQ7P
 bmV.w7_Y.SXA4gnUaNljxjucIDu.tnYTKFT1GL_s4yrjZsvhOMI5Ihgxa.8sSIkM2LcFUF0NVxyZ
 yac0jEIb6ThZPk6GGWVLSkdDP0u83tz8suKcXGnHLvdGpdtlr.0LzjWufGcXrN4BbYs3Q6F3xoLE
 hc.N_ztRexdzgBBOKvK9250jPAqLDykarf5G_4ADJM1jv_PYz6gRzu1nsQvBGNyNzT8YH_FrE0sh
 HGXMt.6z36a6YTAVbPqRNg0DFEbTdCklXXm3h17gaWFX1TUIUGRgCLQ_b4AxOw0qG0TK.fxhSBrK
 OhyiBpB9uym0e.jnsgr0gSXiwzfCNCpSgpuflnkhYwmRPgKGsILvgDhP245WQdR3483JmOKThyYr
 _5jlpRlqCgzAJtu4id_OLuG.1ZZQ4lmwWCFYcGPXkU0_VY1mEvKfzECdjGJAw52fERsmHxeqdtnB
 k7s_DKki1VVIUVjxf7gp.UwCVtJHZ_7SmUvmC6O4n730Qd7nWEqgntDjBSO3Q1KqNVmV7x64v03k
 l9OQgI7VsX4VFAfv1UHdcy7xmlNblP68.D4Jv_D4MIxABOaBK.fI-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 409c2ac1-7cbc-4664-9511-3ab01f248fa8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:13:09 +0000
Received: by hermes--production-ir2-7c4859dc89-jbbfn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1a446bb07c71891bbb05e408a29ae931;
          Wed, 25 Nov 2026 00:13:03 +0000 (UTC)
Message-ID: <fd7d2df4-3994-4091-a63f-7ba57310cedc@yahoo.com>
Date: Wed, 25 Nov 2026 01:13:00 +0100
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
Subject: [PATCH net-next v14 14/15] net: dsa: realtek: rtl8365mb: use PCP
 numbering on family D
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

Add the family D implementations of the qos_iprio_to_hw, qos_hw_to_iprio
and qos_set_untag_pcp hooks introduced by the previous patch. The PCP of
untagged frames cannot differ from the one the port priority implies, so
the family D qos_set_untag_pcp hook returns -EOPNOTSUPP for a mismatching
@untag_pcp. The shared layer never asks for one. As for the other family
D functions, the hooks are wired up by the patch that adds the first
family D chip, so this patch changes no behaviour yet.

Tested by Gustavo Foletto Mora on a TP-Link EX511 v2 with the baseline
QoS configuration (no CONFIG_DCB): untagged frames leave tagged with PCP
0, tagged frames keep their PCP, and the QoS registers read back in PCP
numbering. Trusting PCP (dcb apptrust) together with a non-zero default
priority was not tested on family D, so it is not known whether the chip
then classifies untagged frames by that priority or by PCP 0.

Reported-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-7067296792
Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_qos.c | 36 +++++++++++++++++++++----
 drivers/net/dsa/realtek/rtl8365mb_qos.h |  4 +++
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index b61ffdb..23e1ebb 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -21,8 +21,12 @@
 #include "rtl8365mb.h"
 #include "rtl8365mb_qos.h"
 
-/* The chip's eight internal priorities carry 802.1Q traffic types, one
- * internal priority per traffic type.
+/* The shared rtl83xx-qos.c layer hands this backend internal priorities
+ * that are 802.1Q traffic types, one per traffic type. Family C stores them
+ * as they are. Family D numbers its internal priorities like PCP values, as
+ * its vendor API does, and takes the PCP of a newly inserted 802.1Q tag from
+ * the internal priority, so it converts them at the register boundary
+ * through the qos_* hooks of struct rtl8365mb_family_info.
  */
 static_assert(RTL8365MB_NUM_INTERNAL_PRIOS == IEEE8021Q_TT_MAX);
 
@@ -66,7 +70,9 @@ static_assert(RTL8365MB_QOS_QMAP_DEFAULT < RTL8365MB_QOS_NUM_QMAPS);
 #define RTL8365MB_QOS_1Q_REMAP_REG(_pcp) \
 	(0x0865 + (_pcp) / RTL8365MB_QOS_SELS_PER_REG)
 
-/* PCP given to untagged frames, one 3-bit field per port */
+/* PCP given to untagged frames, one 3-bit field per port (family C only;
+ * family D has no such register, see rtl8365mb_d_qos_set_untag_pcp())
+ */
 #define RTL8365MB_QOS_PORT_UNTAG_PCP_REG(_p) \
 	(0x0851 + (_p) / RTL8365MB_QOS_SELS_PER_REG)
 
@@ -239,6 +245,26 @@ int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
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
+/* There is no separate PCP for untagged frames: it is the one the port
+ * priority implies, so a different one cannot be set.
+ */
+int rtl8365mb_d_qos_set_untag_pcp(struct realtek_priv *priv, int port,
+				  u8 hw_prio, u8 untag_pcp)
+{
+	return untag_pcp == hw_prio ? 0 : -EOPNOTSUPP;
+}
+
 /* Convert an internal priority (an 802.1Q traffic type) to the value the
  * chip uses. Return the value or a negative errno.
  */
@@ -368,8 +394,8 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 	struct dsa_port *dp;
 	int prio, ret;
 
-	/* The table is indexed by the chip's priority, not by the traffic
-	 * type.
+	/* The table is indexed by the chip's priority, which is the traffic
+	 * type on family C and the PCP on family D.
 	 */
 	for (prio = 0; prio < RTL8365MB_NUM_INTERNAL_PRIOS; prio++) {
 		int tt = rtl8365mb_qos_hw_to_iprio(priv, prio);
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index d68b2bd..ec88eb2 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -35,5 +35,9 @@ int rtl8365mb_c_qos_iprio_to_hw(u8 iprio);
 int rtl8365mb_c_qos_hw_to_iprio(u8 hw);
 int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
 				  u8 hw_prio, u8 untag_pcp);
+int rtl8365mb_d_qos_iprio_to_hw(u8 iprio);
+int rtl8365mb_d_qos_hw_to_iprio(u8 hw);
+int rtl8365mb_d_qos_set_untag_pcp(struct realtek_priv *priv, int port,
+				  u8 hw_prio, u8 untag_pcp);
 
 #endif /* _REALTEK_RTL8365MB_QOS_H */
-- 
2.53.0

