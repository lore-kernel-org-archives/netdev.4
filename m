Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824708;
	b=X3tt1TftuXR4TLQZf7H6JAt7CUemvwAhHJKnEkhXq6SdmTdjrWFKkLByL6b14wTu1JEk
	 FFXCI5iwUBVpy3joF5ZCA9OBto6qfGItlGnsGWeEV00miPG8MLqgKpIEOM2wxXJd0vMRM
	 vHkRIo+t62fzwshnNwKUyq8YLjyXgrVGfGjyfA4qTExfIGK9AWvKJurt6Df8LOWlrLe+O
	 S9MPrKjm/hQtB+J16sbrWtr/2d8fHRy6XYYBeb46mnhyiRoBUALZg6TlSZkvszNCgAx2U
	 BksULy4nNeD3J/JJTYFeRFuFvsfCqkqMvMrVczUrBbuU1FJD1QZYOQvm6fbaInt0QnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824708;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=syl8z+fGJReCETcQSL1fbSQ4yMhWfwJdu8YJxP6hi/c=;
	b=Q7zwoFqCq2jyD8iXXaDfkom1uUVgK8aH3VaTI8u/QLyU0vGRzYKA9ZmBCIyybp0ECJFo
	 N5gpevhg5vY1t0A0D7lenvTrzXBASytLQMXZ6yEiS1INDQKWy6L7roFOvo4Hhgb3vytCj
	 pXCVnd5VxSc+btkkGK7+7FZpGjQVj4nvp1eHaiiVQShb8qKI44Yf0q2VAXGlVh+2Q4TsL
	 AluYHNmeMLtVMTtGlfywiesEALy0Zg/WKJJuKTAg5Nd4npWDf7KNiuiLGrmvWCVKW7Abx
	 uI1tqG/3mknqrzGBM6HS3rLYaPRGhsW2ciubG3QQWt9/7kvOuTB0hSMe7ujvo78oVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=R6EuRgJN;
	arc=none smtp.remote-ip=66.163.185.148
Received: from sonic305-22.consmr.mail.ne1.yahoo.com (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4502606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4502606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=R6EuRgJN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824707; bh=syl8z+fGJReCETcQSL1fbSQ4yMhWfwJdu8YJxP6hi/c=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=R6EuRgJNEFvB9uYCk7iVFOzc+rq8fFO9l1sQCvI1nifYPCL7g8A+MWDVwwGWp42IZ2zkhDoPS1Lys+RGEgBVeUGx23O50pjt0iCnrj3Xi6vNxtFAiIDXYaPHop/4Biu42nwLZxRRv4c3HdRTrqCcGUTX3txaF1WLcRXr7q0oaiOHKsCq7IAS5qxp+vO4ofEVjaEXIOZncU8Hd1LkRqXFZmKs8wEVksAzVi5k0abRP4GT1AlYMpZChHF7fB6dc54C0LClGKN3HCn/sPwLXmixDYiZ4SinQ2ahTo4fN5dfFi65lSXLzdKHDzGFKc5gpFsLAzV+X7LbeFSv2HbfmHXQCw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824707; bh=lcMRXOZMXQxMcR9LqBMiXNPzjcvyocncsAVh/MLXS2d=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=PZAor1I630VXAhA5FjPgvaMkJ5H936+sJesEl/tX1j6nO0I19VVFA9aJG4oSPV4r4DVTXCEYnh57dUW5J0Kn27HOr9v27Qzl0cgPjpbeAxtrwHdf7deE6X1s8EnSOGBoMqNORL9BSCKbSLtNFaVMyR4gvRv12F6JFXT/kc1VESdun5c6Zo/VEbC9wzI7gWIQgDuevMgVKkX0HiE4bm88ZgJ2MUT4gDWlEd0E/NWcM2QOU5fTCEM/am41rkCOCTJGig2yRuUgyPMOqVzs2MUUPtT658GKYMQjFz/Rmaes93OJP+eezwb5dpzKNOV2nupvyV18dV6zcWyKwW4tc3z9bA==
X-YMail-OSG: .PGiI6QVM1n4._ho6S_BqqDvlgy.mxpMFtcPYzlrWdbDpIGIfSQKizEJBUVH1Dw
 0tOIR.hS8LXisY6hzeDi9MizO1xByw7rHVrn3es33XR8h1Jb6q0FVaPADGpYZmnWNttPDPG1ahEG
 OyqfUsU.WU9bbKP5iKts6vdDEk8eCoTKRcwqjrYLKQ4yS8kr2iM1lIDcBqfploCs2E.tJLqURnwM
 WJP8P8GnInTe8ECeeNDPjtKFZy_sRq2VtAgURwFs2.fSpHJM54Gz.Roz8TOTNUzNxMrc24OxBdcR
 ssSzMySLN4ykGTRaWIrcTWgPgscYL31j9cpZwzoC3GmSOe8MPoO6pHFT9vjnsr06vj7ylxmlrp9v
 vwyVtTDcz_i8oRwEkh_P7YQaSGnyS1neIiX2V_3NpWHqdtUYSlTOzWz6dbNELvtL8aNcc3W_Awe.
 9Emgbg1B2venv5XPtLOiVBvhPaTqqxj8ZLLYUqMPwgoObtO.BR0IYhPXYY_kDWrmazPy0CXbAjGv
 yBbF4NyuLeTNTDxRT0CQilhU6HTDd6MKzEXcovY6EBRQ.MhEcRIrVq3U9hFWoH9NXF2bLF3Ey6iU
 JOMZSRNnNGdjB8qHqh12RIXp5akcsyycN8YmT4heMX8rCJPqUzH9Sz5ck9TuyVaZX.R63ysC4dlR
 KF5JTBB.BcnGNjolPlAveanmJPeo.EtPv8L8N9hNC4K_iCcsV1DTF9kNAICURrOgSwy9H0kceaVu
 7.jLVd2vMnmayLlHH89ynpQFiB1Cf5D3M8V4R1fhPd89gyfc9Gvw7AtXucECaODvCF0PaGnw.JzY
 VdnHfy3g5.kvkomW.yvWrdxYRcWP3RJVQAkAs5tZPgR37dhd_YEnKbHLuPpCceRHNxc.FnzN6CSf
 cEaysvug8xvb4hAWtpekwhvv5.54QVtclRPzphpkhTs8wciKtGqo7SDyS7JX8YjI_Z8M4DYkPdFn
 bEt9PqwKclwZ1PRfDx7.eH.wrfwKfHz2QQcr5NBKwgCEq.WeLi3tJ4VEbj3_UQLdOoir7.baik7Y
 QUrtn6ZsfSr0wNlEoUf_TXG8Bpc0C3z8dVy2BWM.GyyWWBuFhUmQimo6AbrZsBUFbduMzA1qjsqX
 6DFOZfxRSE4G2N9SyPzb2135jbsnKxBb.HT9e1rCrRY2ZReZwqPgkn3nyFEEFPM1tLQdPF52mHvS
 ln.3JYFEsePG43CAoauHo.osaM5JOSC..jtyEemM.wK4bEt_AyCZ9QvCttI6m5vXnFfJO1qNxPf6
 VD8EUlgrS_qSekWCPz9yZXxyv4gazrQ1pg.5K8uvfd7lPJyR8NbNKCwZy.fefvrLzdh3saDuJuYD
 TcSFpVkL2k5t4m0WOTQ8wX9xWbKyrEUdhDbHPfVg0k.wzi4FO8qUwrWLMNRGnTiiLJfIQNzJga1L
 1zkhE9HmOaUw8CLbKM8TT0FOzP5IEvSNcAUs3Qqu.JTiY8EikeZfCbGKlFXGtaEC81dDiR0TPd0W
 nhgFFv3Vs4KcWSiXT34gnLyWoCD__dJBauoajumXN4X330X205A4npIa1X1TPVNlduwbLc64ho6x
 v6oW_HT_Btq_FVE.DC8ht_ALuFrrNeA8zRbrB7ZpD8_E1ZaTmeAj32GPFTFzuTmZ2VBQDlzjDL2s
 WcrKzXfk.ngyM.klfJWJyCFUMdrt6kEMcWTOt3HK8dtTa3DvTtOpT5hL4N6q625xHzVLPF_YbJ6P
 h3sJb9MXvwaVDicMxIS2hvXgy4WU5sU9y7TiNULMNy64IyHSzQgZyF6cS1pdfXm.bcKNiSIVlZyV
 i1.mo3X3MWzz1aRmJVCJuuR86RLLztKMb9ujgFCdroF_L4jFqARxtL9_r96CoPMGiRE6dp3VHjab
 LUthQnHCax_T8xDmxBtkskFOxONPawzSDy0Il5_titZsti8xqWo7NiOhAeG6GQmco6d4bF1K3.Mg
 8P728iDO7nJJ6whHQA9s8fOvTmBMZAlnuEeFs6EGcxk0z35x0runu_QV6wztQN9Ic8OZq7o8T7bi
 nFU9VcJhoIGvTZqHeZqJF6AZVsTp2pSiRIDJKLlZq.UQSvFp.hWqDwaTFzOH3Qq.72tUrfFYWl17
 55ICMshLeYEM9.iZkSA18VnC2jaRV2GZN52kfKR3pR9Qss9NMDQaNpSp5OkXZMKoF0pnnkbPi9iP
 Om6iuwrVWLqFKvZCgzp7m9wge2Tw0g1oelEkCykqhwxIKQjyov0RhPiZjrm32UhlSHaDfpWUsKY3
 ZEpAvZBN4F1_bWoy42MACcSl7DvVVM75xLIIkJgRrJ5tkjoEpfVoM0bw6rEBwC.ZyAMBHkehQLk2
 zugLb3VvcB_0k4ihRqxJeFxYttd5ZU1scral98Kh4og--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 31a28056-8112-4000-92a6-24ece894b72d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:11:47 +0000
Received: by hermes--production-ir2-7c4859dc89-qhgqd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5995495912d2a81d0473510ef3344d23;
          Sat, 28 Nov 2026 00:11:41 +0000 (UTC)
Message-ID: <53029d03-873e-4799-8982-290f4f912750@yahoo.com>
Date: Sat, 28 Nov 2026 01:11:39 +0100
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
Subject: [PATCH net-next v15 15/15] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
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

Add the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the chip table.
It is the first chip of family D, whose handling was added in the
preceding patches, so this is the patch that makes it reachable.

The SGMII/HSGMII SerDes of this chip sits on port 6 and the
MII/TMII/RMII/RGMII interface on port 7, as on family C, but the external
interface indices are one lower (EXT0 and EXT1 instead of EXT1 and EXT2).
Unlike family C, rtl8365mb_family_d leaves jam_table unset (NULL), so no
family C initialization jam sequence is run during switch setup; the
subsystems touched by family D program their required registers
explicitly.

The chip exposes seven ports, numbered 0-4, 6 and 7. This is described
by port_mask in its chip info, as for the other chips.
rtl8365mb_family_d selects the family D implementations added in the
preceding patches: the force-mode configuration, the VLAN 4k accessors,
the PVID handling, the L2 entry (de)serializers and the QoS priority
numbering.

The L2 learning limit is the same as on family C (2112 entries), as
given by the Realtek rtl8367 common API (rtl8367_common V1.4.2), so
RTL8365MB_LEARN_LIMIT_MAX needs no per-family handling; only its
comment is updated.

Tested on a TP-Link Archer AX55 v1 (RTL8367S-VB, CPU port over HSGMII
(2500base-x) to an IPQ5018) with bridge VLAN filtering and per-port
PVIDs, and on a TP-Link EX511 v2 (RTL8367S-VB, CPU port over 1G SGMII
to an IPQ5018). RGMII mode has not been tested. See the cover letter for
details.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/Kconfig          |  3 +-
 drivers/net/dsa/realtek/rtl8365mb.h      |  4 --
 drivers/net/dsa/realtek/rtl8365mb_main.c | 55 +++++++++++++++++++++---
 3 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/realtek/Kconfig b/drivers/net/dsa/realtek/Kconfig
index f1530ba..e366632 100644
--- a/drivers/net/dsa/realtek/Kconfig
+++ b/drivers/net/dsa/realtek/Kconfig
@@ -35,7 +35,8 @@ config NET_DSA_REALTEK_RTL8365MB
 	depends on NET_DSA_REALTEK_SMI || NET_DSA_REALTEK_MDIO
 	select NET_DSA_TAG_RTL8_4
 	help
-	  Select to enable support for Realtek RTL8365MB-VC and RTL8367S.
+	  Select to enable support for Realtek RTL8365MB-VC, RTL8367S and
+	  RTL8367S-VB.
 
 config NET_DSA_REALTEK_RTL8366RB
 	tristate "Realtek RTL8366RB switch driver"
diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 4ebc46d..e3d5b07 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -71,10 +71,6 @@ struct rtl8365mb_family_info {
 const struct rtl8365mb_family_info *
 rtl8365mb_get_family_info(struct realtek_priv *priv);
 
-int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
-				     bool link, int speed, int duplex,
-				     bool tx_pause, bool rx_pause);
-
 static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
 {
 	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 81c35f4..d84b27b 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -89,6 +89,14 @@
  * things will work out-of-the-box for other chips, and a careful review of the
  * vendor driver may be needed to expand support. The RTL8365MB-VC seems to be
  * one of the simpler chips.
+ *
+ * The RTL8367S-VB (chip ID 0x6642) is not part of the family listed above. It
+ * belongs to a newer generation, which this driver calls family D. Its
+ * registers differ in the VLAN table, the external interface speed and RGMII
+ * configuration, the SerDes, the L2 lookup table (FDB/MDB entry layout, no
+ * EFID, LUT configuration registers) and the table access control register,
+ * so the code paths specific to it are selected with rtl8365mb_is_d() or
+ * through struct rtl8365mb_family_info.
  */
 
 #include <linux/bitfield.h>
@@ -119,9 +127,9 @@
 #define RTL8365MB_NUM_PHYREGS		32
 #define RTL8365MB_PHYREGMAX		(RTL8365MB_NUM_PHYREGS - 1)
 #define RTL8365MB_MAX_NUM_PORTS		11
-/* Valid for the whole family except RTL8370B, which has 4160 entries.
- * RTL8370B is mentioned in vendor code but it might not even belong
- * to the same RTL8367C family.
+/* Valid for the whole RTL8367C family (and for family D, RTL8367S-VB)
+ * except RTL8370B, which has 4160 entries. RTL8370B is mentioned in
+ * vendor code but it might not even belong to the same RTL8367C family.
  */
 #define RTL8365MB_LEARN_LIMIT_MAX	2112
 #define RTL8365MB_MAX_NUM_EXTINTS	3
@@ -824,6 +832,10 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 					    bool link, int speed, int duplex,
 					    bool tx_pause, bool rx_pause);
 
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.jam_table = rtl8365mb_c_init_jam,
@@ -845,6 +857,24 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.qos_set_untag_pcp = rtl8365mb_c_qos_set_untag_pcp,
 };
 
+static const struct rtl8365mb_family_info rtl8365mb_family_d = {
+	.family = RTL8365MB_FAMILY_D,
+	.ext_config_forcemode = rtl8365mb_d_ext_config_forcemode,
+	.vlan_4k_read = rtl8365mb_d_vlan_4k_read,
+	.vlan_4k_write = rtl8365mb_d_vlan_4k_write,
+	.vlan_port_get_pvid = rtl8365mb_d_vlan_port_get_pvid,
+	.vlan_port_reset_pvid = rtl8365mb_d_vlan_port_reset_pvid,
+	.vlan_pvid_port_set = rtl8365mb_d_vlan_pvid_port_set,
+	.vlan_pvid_port_clear = rtl8365mb_d_vlan_pvid_port_clear,
+	.l2_entry_size = RTL8365MB_D_L2_ENTRY_SIZE,
+	.l2_data_to_uc = rtl8365mb_d_l2_data_to_uc,
+	.l2_uc_to_data = rtl8365mb_d_l2_uc_to_data,
+	.l2_data_to_mc = rtl8365mb_d_l2_data_to_mc,
+	.l2_mc_to_data = rtl8365mb_d_l2_mc_to_data,
+	.qos_iprio_to_hw = rtl8365mb_d_qos_iprio_to_hw,
+	.qos_hw_to_iprio = rtl8365mb_d_qos_hw_to_iprio,
+};
+
 /**
  * struct rtl8365mb_chip_info - static chip-specific info
  * @name: human-readable chip name
@@ -935,6 +965,19 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
 		},
 		.num_tx_queues = 8,
 	},
+	{
+		.name = "RTL8367S-VB",
+		.chip_id = 0x6642,
+		.chip_ver = 0x0010,
+		.family_info = &rtl8365mb_family_d,
+		.port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),
+		.extints = {
+			{ 6, 0, PHY_INTF(SGMII) | PHY_INTF(HSGMII) },
+			{ 7, 1, PHY_INTF(MII) | PHY_INTF(TMII) |
+				PHY_INTF(RMII) | PHY_INTF(RGMII) },
+		},
+		.num_tx_queues = 8,
+	},
 };
 
 enum rtl8365mb_stp_state {
@@ -2018,9 +2061,9 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
-int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
-				     bool link, int speed, int duplex,
-				     bool tx_pause, bool rx_pause)
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause)
 {
 	u32 r_tx_pause;
 	u32 r_rx_pause;
-- 
2.53.0

