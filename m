Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824594;
	b=UkMbYL9f/MD+y7mFUYrOjGTsn96seHZjL4fJ/BWW6X5L1fOql9y+D/795BLOGmp9BDUa
	 ZHKy4/ZH4fk4LF5Fr4dEXH/yIjTwLwhcSAeLcfrbOrojF33hZYeQdBERb2kKPBI1hJ12l
	 k4v0s0DnvyZU/d+2bqdvKVYRt8pKNPqbs7pSd5gaF/b/qRmv7NC8/oBpvn8nXBcmrvTDn
	 kf23jQQbLuTsPUAq73lLf0gcCUfNCw67MuK5v5WlaDCREvQYy4GUmobgBLvTNa9usdekH
	 /FMxvcVI9E8kcoVMibuFSdMZcgZ6fW6M1ekcTpNKEepX+3jZ2oiwh8shfy8JQByFDuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824594;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=OkFnRaS1/z75nHX40FeLzsDPWGPaXBCaMe77lRUgWsI=;
	b=W3lewG/ZLJ9JT+vzbdr+8biOKv6OJQVuNZIa5lwGADAvuCxIZSBBnW5FcyYvHM8IQ1uU
	 FMBTcJ5Lfa++Xal53oeYahFP1OqWHPCvUB45SnxoQIsx1Bb8xKxx1YbsieuQXmfJ4dDn6
	 UAGQ6h1FLPmtmn7OSDsUhhcn1HCXHn/Udx7Ocyun8G7lX7h8kR7xkAd9+CIYDGhWKgU9d
	 S3Sba/LIuJLddqdPb0ORfyEPgFPd/4M6p8j3JJj2k2Kd16VJa6A2rzjqJd82MXN+W2dpx
	 oGJoz7j9y4P0x65/3jkkyJsaBPIKb8lRLhd2rlfAbe33xTaJFTybT1Ti7lGg9tUoBlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="Tmt/3l8t";
	arc=none smtp.remote-ip=66.163.187.147
Received: from sonic316-21.consmr.mail.ne1.yahoo.com (sonic316-21.consmr.mail.ne1.yahoo.com [66.163.187.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7BA606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=Tmt/3l8t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824593; bh=OkFnRaS1/z75nHX40FeLzsDPWGPaXBCaMe77lRUgWsI=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=Tmt/3l8tDqJ7p+NPIVDBfox7YiU9u6LT1tCLBAxlwZVE1sKqAi+cZgzly7H+q6PCZR9gjSzJLOnnomcEK+kMvMFf5LWqtgXGxjgJQAuFBRsjgbMZ00tvYK6x/i5ccY0Zds1pdlwL6ODRoP6Ue2zhxz9icVgxupN6psY55Kf0W3wBGVi6h683o0pADCAfLN5RMalNtigTFftYjb3/vwD21xM7faH649CXd8HtiRlyZf0LVYXFG31rQ77t1xAlnYJYQX+9HMAz1f1mdX2B5f3xk8xm9isv7G+ejYF9L+0Si2AkWMDehJ4iD3ieOVPI+QFc/qPKU0lDHpYaUA2q323ohQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824593; bh=cxmL7XZhMgtiGUCB6KPc9nBojMVVls0DMny5BPm0UYn=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=isS+dqUzUG8CcGVHqMZWidK5Bi+JGOvFe9huIcsAThzaoOsJUQ0ikZuhaHziWrbJOYj7Ds47YQTIcuyVen8dyhoKox5QHR4idiUDSPNM9cscXdlnfYNOphutGob3AOsgJjQlmixJKyPFQk8CdSkE3w58vly8TK3Nfk+eNnmsw1J1ZIQVouFXEOAtLrjDLbPC1Hw46TNslTMNyQ/P1rZ1Z8f/Ls9t+sfMgzQ3Ycq0iyqJBKo5Qhj5BIMsKW7igI3dB0+OZBPkx9C1A8q1o7j4zibZjX/kA8gBax1kt0TKJ+XbvxEmTWahamSbeMWTCh3KCgcXJKtsKzHd8WFTG83rSg==
X-YMail-OSG: IjxChHkVM1mdZT8NditZ3cw53jId5eCk42hbIHlA4.O40s5YXG5NfYFw1cm_PlY
 BHxZG4n2ooYMRe_qM2g6AdxmEOYzhS4nfJUE9pTKnj.0n6DbSCHuVlv.oE30gJ.5wawX56hznJ0O
 pbDeiby7orSa0wHK2AdZbV0o5g5XVN8x48GVrq3sZF7AeStAe5381p1m14ro0NO.hJCrwaNXV8Nx
 8rHxAYnc9dojjJ_v5iMlUhoHaJ19rdQBOLZzb25beuGqBCH3mICPS4vt68L1Lyiqz.z8qA7VBtwE
 mP.c60uPVL.Vg9xbyngfjVUrJknwj0kRKg5tXnM.3jebUgOjPVm.3nSFRsLGocm4p2Tixcn81ALz
 Ll0z16ksp2z12oOqw5_DuMqAjNdbnE3fBVZASsuluLGaycFhp49ocT5ATx5V_k8aCaBgKKjoomZq
 HeIlIeh3xY125TlUEN4sowVTXUBKPaYq5ODzLgdQXHO06IA37R7NVzuyHaPzWV3eZmZcirWqTpAE
 Vo2Zhn3IoaG3vakUE0JEjkJ4nnx.h9xC2kSdjezETcN6iqxPSRF0EIVEPdeHgh9JMTys2HCAxSVs
 YPvsjU0LYo_x_tGTbtBkbqjboaq6DsGG_DfB7TvXruVOILdbsNBRcBiqLGtgPNb7zjQQcgclvgAZ
 M0NayGjCIfWEpqzRkHqEqO3bBir2wbLqkCB1C_4zJplqoAqktAQitkg._n70OPwiya0eAsCUZYt2
 STDxFQ96C1hnrCGSgewDuCejrkeanvofcBEvawx7HnR2XxK2W7_vSOZWVBHob1KUeYAbgCHogs_c
 uJJgruanDbl_59eUadal5KOFY7I6Vg3whja3zyGkk27TAhIhU0OY7fViYOal.WoPq69.vkKsR9Ds
 3_PAGxQpGROSp063LleaPd6x4LWS0zt0trXgasNBf9GPQbCXidsSHFVMXekQ4twqw_CPW6Nej1XJ
 cmnBLBBFDfqrsdzMc.gKKaaphLvfkln2wJOrMgkQhVy4scJB8Zkbfv.y_3H2OYF1Ep_HyayQ3saV
 ABYuDCLiEM1In9dP9ErxTfCGB_ddMDqb4tcOt1cr1ZMgqjyEFnuloHHPf2xE193xbolRLCuaZPRs
 FXDjkLdb2MPVbm142L0rHD2Z98.W1HU.34By92ZhJZt4Pltz_zmufkYwfR_8VHpqaCIDlSsoWR0N
 AWNWOFIx47YMKjbJvl5.J_KM_Oem6DYSuAUO2GEiaeIxQ3Fo7U6Cpip6yMuSC0LHG9kWt3IOZeeK
 jkDYAhUatrZLNwnXeD3mGGSc.YdUd9Lizut_GjUmhk_Vx4eA.RrmsxOh0M5cMMzyOxSUAwrmQ4MH
 eFJcszitxwebIQAYhFteQ0yw9D4tQDzCFdHg6X0a53AokA73m2Hm2IPpRFiByGlRRcBha.A_EUS4
 CoI7FZjkeUa6LGj6XeCiyAH9kK1AGvcWfgVCkcVI2H0uuIqxZH9TjtmZOBX6ZRc4.VQaYAuY5bR.
 Y9tZ7lLw.TNF6Y6h.I2SIl.Q6fjJ8ZvlAhn2rAzG96b1yFwbwkUKqz6xQkEREUIC2C8eRBsSZYTF
 jYBDUFGNgGNcfe_asMFMzElKN7QcoeXNmsqhO67woEyVSBgZ3tYvm8SJYH98WqayTQULq1_nGNBe
 c5rse32WhzYCk9lrz1Qa8KUL1zx9m.LmlRdhxFlpPRvp4nbpVmIdgkwytofPGQre_Tb1cvvxuHYw
 MbjNEVUys.rXR7frxVETYyHjdkn6mmEb1HWYIHVN0AAZHL6GnXPuyNK4FBNbFNoiwUhUeDp_nJEE
 UiSsgOwjdtlx5KHVk4WTX33zeQgvtSboHUHn9h_uas.ehCF60PtqiKohUtJtK6Aesi4LC439S_wQ
 d714zCw_wGohGuDFq6ivp_9meuCiYWGalT_eJd7rEIq6VaKIrJ186cJj0ks7NRIZf3eEk885tNsf
 1i3ObIHCoEuUmbcnx7oG1YVjPB23WytlazShnmHmD74H1BsMtxZqukwYdEXyK7BquFATPayorTJr
 tpZNWo5dWOKhjW7nQHnGsE_7tA2GlnDjR7raZCnL9VMaeBmwVkkrCa1U9BELrNH8nO7GOVgUlhb2
 O1Zi.2UU.YM7MjlN0GPQ865n09mtZWNRvZZwKVv0OqPodckNRjyyAe7qoX6F.g.48ntgVTR_2bt5
 enEMqVX_mGQF9kAdHk8OjPC2ui4XIzoXfoVfOrTpLSkWWm1jqhaM0f6mln2x7gKSW4uI6JkaenKX
 Yj4X_ifyZ6.xxay7iXtDeZJFsscSquAmzTW_rVU8sfdUBYbpCG6vZXdf4OPTpJQubu2oi1dfZ52F
 v7vpSPT2IfbZRuVdtDbW7tbFxaMYsEP2VvCsgdELnGsu744NaQQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: b4ec5d20-0d81-4b81-8028-2565e73e0597
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:09:53 +0000
Received: by hermes--production-ir2-7c4859dc89-4b5bc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 25489fbcb5abeb3dba64d6e814acc43c;
          Sat, 28 Nov 2026 00:09:50 +0000 (UTC)
Message-ID: <e81275c4-51d1-4974-9197-5925f9799d38@yahoo.com>
Date: Sat, 28 Nov 2026 01:09:49 +0100
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
Subject: [PATCH net-next v15 13/15] net: dsa: realtek: rtl8365mb: refactor QoS
 priority handling
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
converts each one back to its traffic type. Name the qmap index
hw_prio throughout, because it is already in the chip's numbering.

No functional change.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |  25 +++++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   3 +
 drivers/net/dsa/realtek/rtl8365mb_qos.c  | 119 ++++++++++++++++++-----
 drivers/net/dsa/realtek/rtl8365mb_qos.h  |   8 +-
 4 files changed, 129 insertions(+), 26 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 9a69e85..7fb1a46 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -16,6 +16,27 @@ struct rtl8365mb_vlan4k;
 struct rtl8365mb_l2_uc;
 struct rtl8365mb_l2_mc;
 
+/**
+ * struct rtl8365mb_family_info - family-specific data and operations
+ * @family: silicon family identifier
+ * @jam_table: family-specific initialization jam table
+ * @jam_size: number of entries in @jam_table
+ * @ext_config_forcemode: program an external interface force-mode register
+ * @vlan_4k_read: read a 4K VLAN table entry
+ * @vlan_4k_write: write a 4K VLAN table entry
+ * @vlan_port_get_pvid: read a port PVID
+ * @vlan_port_reset_pvid: restore a port PVID to its default
+ * @vlan_pvid_port_set: add a port to a PVID
+ * @vlan_pvid_port_clear: remove a port from a PVID
+ * @l2_entry_size: number of words in an L2 table entry
+ * @l2_data_to_uc: unpack a unicast L2 table entry
+ * @l2_uc_to_data: pack a unicast L2 table entry
+ * @l2_data_to_mc: unpack a multicast L2 table entry
+ * @l2_mc_to_data: pack a multicast L2 table entry
+ * @qos_iprio_to_hw: convert a traffic type to a hardware priority
+ * @qos_hw_to_iprio: convert a hardware priority to a traffic type
+ * @qos_set_untag_pcp: program the per-port untagged PCP where supported
+ */
 struct rtl8365mb_family_info {
 	enum rtl8365mb_family family;
 	const struct rtl8365mb_jam_tbl_entry *jam_table;
@@ -38,6 +59,10 @@ struct rtl8365mb_family_info {
 	void (*l2_uc_to_data)(const struct rtl8365mb_l2_uc *uc, u16 *data);
 	void (*l2_data_to_mc)(const u16 *data, struct rtl8365mb_l2_mc *mc);
 	void (*l2_mc_to_data)(const struct rtl8365mb_l2_mc *mc, u16 *data);
+	int (*qos_iprio_to_hw)(u8 iprio);
+	int (*qos_hw_to_iprio)(u8 hw);
+	int (*qos_set_untag_pcp)(struct realtek_priv *priv, int port,
+				 u8 untag_pcp);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 7062c58..81c35f4 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -840,6 +840,9 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.l2_uc_to_data = rtl8365mb_c_l2_uc_to_data,
 	.l2_data_to_mc = rtl8365mb_c_l2_data_to_mc,
 	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
+	.qos_iprio_to_hw = rtl8365mb_c_qos_iprio_to_hw,
+	.qos_hw_to_iprio = rtl8365mb_c_qos_hw_to_iprio,
+	.qos_set_untag_pcp = rtl8365mb_c_qos_set_untag_pcp,
 };
 
 /**
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
index 5b9e1ab..d422955 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
@@ -18,10 +18,12 @@
 #include <net/ieee8021q.h>
 
 #include "realtek.h"
+#include "rtl8365mb.h"
 #include "rtl8365mb_qos.h"
 
-/* The chip's eight internal priorities carry 802.1Q traffic types, one
- * internal priority per traffic type.
+/* The shared rtl83xx-qos.c layer hands this backend internal priorities
+ * that are 802.1Q traffic types. The chip's own priority is derived from
+ * them through the qos_* hooks of struct rtl8365mb_family_info.
  */
 static_assert(RTL8365MB_NUM_INTERNAL_PRIOS == IEEE8021Q_TT_MAX);
 
@@ -40,12 +42,12 @@ static_assert(RTL8365MB_QOS_SEL_BITS <= RTL8365MB_QOS_SEL_STRIDE);
 static_assert(RTL8365MB_QOS_SEL_STRIDE * RTL8365MB_QOS_SELS_PER_REG <=
 	      RTL8365MB_QOS_REG_BITS);
 
-/* qmaps: the queue id of each internal priority, one table per qmap */
+/* qmaps: the queue id of each hardware priority, one table per qmap */
 #define RTL8365MB_QOS_QMAP_TBL_REGS \
 	(RTL8365MB_NUM_INTERNAL_PRIOS / RTL8365MB_QOS_SELS_PER_REG)
-#define RTL8365MB_QOS_QMAP_TBL_REG(_m, _iprio) \
+#define RTL8365MB_QOS_QMAP_TBL_REG(_m, _hw_prio) \
 	(0x0904 + (_m) * RTL8365MB_QOS_QMAP_TBL_REGS + \
-	 (_iprio) / RTL8365MB_QOS_SELS_PER_REG)
+	 (_hw_prio) / RTL8365MB_QOS_SELS_PER_REG)
 
 /* The qmap each port reads, one select per port */
 #define RTL8365MB_QOS_PORT_QMAP_SEL_REG(_p) \
@@ -218,54 +220,113 @@ static int rtl8365mb_qos_check_port(struct realtek_priv *priv, int port)
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
+				  u8 untag_pcp)
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
+	ret = rtl8365mb_get_family_info(priv)->qos_set_untag_pcp(priv, port,
+								 untag_pcp);
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
@@ -280,10 +341,10 @@ static int rtl8365mb_qos_set_port_qmap(struct realtek_priv *priv, int port,
 }
 
 static int rtl8365mb_qos_set_qmap_qid(struct realtek_priv *priv, int qmap,
-				      u8 iprio, u8 qid)
+				      u8 hw_prio, u8 qid)
 {
-	u32 reg = RTL8365MB_QOS_QMAP_TBL_REG(qmap, iprio);
-	u32 mask = rtl8365mb_qos_sel_mask(iprio);
+	u32 reg = RTL8365MB_QOS_QMAP_TBL_REG(qmap, hw_prio);
+	u32 mask = rtl8365mb_qos_sel_mask(hw_prio);
 
 	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, qid);
 }
@@ -306,19 +367,27 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
 {
 	unsigned int nq = priv->ds.num_tx_queues;
 	struct dsa_port *dp;
-	int iprio, ret;
+	int hw_prio, ret;
 
-	for (iprio = 0; iprio < RTL8365MB_NUM_INTERNAL_PRIOS; iprio++) {
-		int tc = ieee8021q_tt_to_tc(iprio, nq);
+	/* The table is indexed by the chip's priority, not by the traffic
+	 * type.
+	 */
+	for (hw_prio = 0; hw_prio < RTL8365MB_NUM_INTERNAL_PRIOS; hw_prio++) {
+		int tt = rtl8365mb_qos_hw_to_iprio(priv, hw_prio);
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
+						 hw_prio, qid);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.h b/drivers/net/dsa/realtek/rtl8365mb_qos.h
index 9602807..70c50ab 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_qos.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_qos.h
@@ -14,7 +14,7 @@ struct realtek_priv;
 /* Ports the QoS code handles */
 #define RTL8365MB_QOS_MAX_PORTS		8
 
-/* Internal priority -> queue id tables (qmaps) */
+/* Hardware priority -> queue id tables (qmaps) */
 #define RTL8365MB_QOS_NUM_QMAPS		8
 
 int rtl8365mb_qos_pridec_init(struct realtek_priv *priv);
@@ -30,4 +30,10 @@ int rtl8365mb_qos_set_apptrust(struct realtek_priv *priv, int port,
 int rtl8365mb_qos_get_apptrust(struct realtek_priv *priv, int port, bool *trust,
 			       unsigned int n);
 
+/* Hooks of struct rtl8365mb_family_info, one set per chip family */
+int rtl8365mb_c_qos_iprio_to_hw(u8 iprio);
+int rtl8365mb_c_qos_hw_to_iprio(u8 hw);
+int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
+				  u8 untag_pcp);
+
 #endif /* _REALTEK_RTL8365MB_QOS_H */
-- 
2.53.0

