Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565649;
	b=VOeW5utSW92MYPgwTlRwA7alK7qcVOjvIWUGCI5Du98JZxoP11XkDb6SASdTKswcEed5
	 hzvCw7IYv9OFtqHHR6VqIg9ghebokgdY6s8GA9shp8r5ZasLzOF0RIHvyiAgZAO9Fsnec
	 aCwoemsTxpthNtOwyzc8GrvPj02EENZ6JA8W7JOBp3Fjn1ceb7aemlnf/tmy1n/6GD1yT
	 p+VZz2RTPlfR/LtvTWOMI/nTlVk0LtuarQ/WH7bel0pM/OqkR4UXLLVlLGZlWp6ElbTop
	 vleY0Su07KlvJGJNwYhPGwC2cTxLZpViJjXL53VmE2szuaIASO22PW9+9CEKOxB9elg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565649;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=z/1suhOq9GQu5EKQjlWUv6teWXzfqpn6Op2B/RdOMUE=;
	b=R+2Yug6e+uZ9LI92/Kt1PNFlT+sMoX509WKv7RPLh9K6EpTBE3DtgykLWhFc48BPCny1
	 GlJKDH/2QbJ7zNh7LIbu50+c9pJTTN+yzF+m20mYYN6Lgu27A3zIbgHTR4KeRm6wQLiNF
	 FgBeMb9kAir+wmpqXsi2GWsuYi4XvaGgjvEjgBbnirqiTz3VCDsapj56+NPcGupye4ffn
	 dssPEjvZEBpeS6Ip3nhjJYYpNv+f8h3AlNvmXUySTg1ah8pfGAq8wnJVfDMvrIktt/YxA
	 ZqoKUoHWQ5Dy5/TOpeKSYAGdc8HalgOykWNTSg51DhTX7loQPplTe/kJ07QDxI6c69g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=d+phNBI5;
	arc=none smtp.remote-ip=66.163.185.32
Received: from sonic313-9.consmr.mail.ne1.yahoo.com (sonic313-9.consmr.mail.ne1.yahoo.com [66.163.185.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AD606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756AD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=d+phNBI5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565647; bh=z/1suhOq9GQu5EKQjlWUv6teWXzfqpn6Op2B/RdOMUE=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=d+phNBI5stZgeq0YrtA2zD7ul+ViTc7xQqCENw9lfMpMYPDWYEy6LARCwdRQXSiHPyC3SvoQreC55wXQGtbXsyglZJX9AmZf2IaKpqBDInJXdEU6Q03c0y+g+T5/sP3j7l2ajcEq02Z7cAUCZ6fLAFpkxo7zMV/51UoYeTvY1c4NN6eqBzgM81KEYy61b8plRAh43qOnvNEZol9mTBAhMP9fpcu7OTOFqnJm0k82a5golJ1R50Ii8Un5u64UTeC3LlxkMaj7ji3nyO5gHNXX7qTUrzWox5qK3oTUe9veWY5Z5voCYtKFYqPK1+d6Xe3TsUZCODSMPwq27ejzfp66SA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565647; bh=bVNYRmN873FdmU+3HJT8gKNvZb8pYmnBXeKKUPo2N2D=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=eB5vlGucXSdk+pZe+VgNej5v7hYI+roNpMRKfjUymyDJ+3sf/z4PP5IthqbDf3WBIfrw69R2kRtxWDfsgrai78w68Vkor9qsB2H4yfcLD+cIvHnLI5f4OHHZiwMA6lpM5n8r6XR9T4ExMKV1HsVMRlVqb2DApfPap6uD2ofmBh9UfGpfGALESnvr/fs7jlyM/k/mc7uKapoZGLv8mgEqdGm+1FBlhanqHmAN3wTbSr6EdlLaf0lNncDh/mmO08hBvz3qJHCokLB+jpRtP/Z1ZgWwfAQ5e4w61bjSXXOJ3c3zIVqJ2cradYaItpj/FgZZez2W+9w1LHsyDzFSwTzDHA==
X-YMail-OSG: uLfaSnEVM1n_nNUJTUWkBDZXyzNokX9y3U32p0oZ4CyUlyx.Xcp1oHiEjzs8pFD
 tJH1qVKfMdWfpb6qqaYxlrXeUwd9HGLtwzyWzjXbxPiJXORhH6w3Vuk3DcgTJJXjcuNaeaYZPZ.H
 W9PtKeywkNB28UJJcLZFqXhbFjfUujNMmOrxexCjSEnLbZt9CeUL_LA0ejN8DaDyx4qA6368V4m7
 hm8RHRwK6fMHzYXBl1lvwWEAEkJT7ByD0rzmIbOQJ08bucTnZrzSr.UzLKZX0X_bhZO.rOlqN2lt
 L28SQDuvHz6b3o_tLJYeOUhoXe.pGivE4tkb2yiKJHuKP8EUKJw0wXnA2U378NVTfYYvuJXgndr4
 gEbO5cUB97r9rFw_7Fr_lPKkEp1ea3OtBfHNC4OcugzS1NI1ID28Meh9zUikvZU5GakibvntbAqF
 kog7xD3uDvMPs.DQSQQYV5g.xfFJK_AyEJjKBuGwSLvc5xjgdL4N1NPYshvGcSFj.JBj9lJ2vfu7
 UZez5owmnDJVxqNHZinzzsJHcXZ4gLpWVc2omFjJlQjj7XbRj8z2vGWBYA7wRK5EZl6JxKWyQXek
 VXDXhZz5g8QEPE3FQKadW3oLn5lKEYcKk9j5B252CUST1bIUyWEd48r6f8.wENu1xtpuutW4oX3G
 f8uHe97T1w3ME4JPQ64tnNmJs72i1LJgPvVF6vg9yQvP3lq1m4vB_BzDVZrI89jWz3m0x_FNRyDf
 3nguB0VPTyogJSbbvvJrhU6w0bJwY9A_yfJaf9NPqItBnjYzMp7uCJ0fsX6Vmb05lWkIrE.NDKG0
 ss9GwOIrotE7vo_zIwtHr0Bl17xy68nYP5joRgX5p9uGa3lI_QhzR1odyuRIdSDxcBzgbS.bEDsq
 W4xi6cSCtmAd35J0iaGl79izx7LdL.QbXNnHYtCnHY723TUgD3P0wLxH54B6bkfQRQA2IKmmoDqS
 KYrMSCUqa_CAgxR4z0v1xNX7ATq_RYLxXU66vkbl06T6o.5ES.d6CFMH2MWJb7hIt6HEOwTcY0Hb
 uPMzuv6Eedeq.bO299kPx6azV9FqghDiPz5z_PfwHkM_jJfGSjaBhKoLX_jVFpFOewpsAFMY89hW
 2mzqQ8f1OtU4HkoA48FR.veKvWXb__Nk7CVNYjX2TEhdOuH1ouxz1w0n_t.xuvSOn_pdAfNhjlcN
 ex3Lp8j8LWPCiz.7zUuGaFhAEqrjGVw9M0vhMN5n.asxurB3da..LYon4vLM1rLDMKJrX7PgXvqE
 I1T.RrJxwKI1rw0DwbiEHyHAAARxLhsZJeCyh3Jcpgb3ibKn0P9N2gzDtHTvZSxSDbUzZa5t5rKT
 .g3sBt7wCq_oFQN_elDsnpHhQjaJOaZG5ZvGeLLVxj.uChZ3Nwoy_jWkBNDsCjs8atJi64suwuEw
 oMhaj6RsoFBMJINAZnj3QrdlLUp0MkR32wshmVduyOZIF.2PShv.Va3LF1U.xSA_ejb4hijjP4Sp
 _rYIl2gcFvrUKIqTdN2zw6SFv8ugE78KDltTw.Q9XwxQDiA84NghDmulxa1umiCyuDvDu8wYDbRa
 QzQsVaAMkXU8.5itgcUl6wpylw1RL7zngjLx7yhUnAJpTywh0DKIoaSCdKl7XyxwmejO9FXjfCaD
 VS0NU3LOZ3b8KzncjLazHiqheC9fF4Q3yLrmkuMB9LEskkAHiftvMp8j_ZFHIeiwFPWC5fzK4Cch
 WFRjLLARFnTu.cPhwZyz8hUXvmJG0f.VUVnyyr5wD8oUb7c0Dck2sp5LKINtyVurnt7KzXqyC38z
 g4hBlXsNGb2RIa9eVo9J1M1e5fsyGBJewJxPW9lZUsAAhGG9QpFlRd7VJ4aGu_SBlXxE1BXojd_B
 eIRSqRa2Qj5CuKhp8GkSxNE.XvChdoaGGEqwB_r4RaOx0caKl2J.4Rdi9EieyFvw7EoZi5z6sNlt
 DKLdDMkc1kMgoVJuIRPE94ymYKbVUus0QiNyKbwy_XfZgFWT5k199.X3S2okLRzy65_iK76fYn2A
 agE1uEZNP7u.7EE4pM6AadDvsLhhsC1oFpVq_cHNhegWCIz5e8uLHKcfVuTuo6NLNMc74fF.jfAN
 1cV_itKzZZQc9jRlyl0tqyOdJA5UkLVzfboi_347107hvU90BTigVzNB5tvqZlzBXcmM8MiXdmHu
 IPHJJ0iJZvI.ZcjCKejnUXa15yUf1v_BB0_Na4xexoXPVZtd4ijoqlkVQN7LidMPHCpekJOTiHls
 EZQnuVyNu40M1t6Z5D1I5Fi8bRyXCIqTFuF95lQ0hvFH8aarHaCSwFRlV0qGPhAiQ7qH1c7YXkX9
 1uQu_wzsd632Eg6hn4RjT61AUxpApriMmK33WDhQn4lqg7VDNayE-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 1cb86507-cd33-47ba-8931-63237501190f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:14:07 +0000
Received: by hermes--production-ir2-7c4859dc89-jpc6b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0338d3f1489788879650fca98a888d59;
          Wed, 25 Nov 2026 00:14:04 +0000 (UTC)
Message-ID: <abe7ed42-694c-435b-b573-b0341aa10971@yahoo.com>
Date: Wed, 25 Nov 2026 01:14:01 +0100
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
Subject: [PATCH net-next v14 15/15] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
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

Add the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the chip table.
It is the first chip of family D, whose handling was added in the
preceding patches, so this is the patch that makes it reachable.

The SGMII/HSGMII SerDes of this chip sits on port 6 and the
MII/TMII/RMII/RGMII interface on port 7, as on family C, but the external
interface indices are one lower (EXT0 and EXT1 instead of EXT1 and EXT2).
The chip reuses the existing initialization jam table, taken as is from
the RTL8367C code, followed by the common jam table. Neither has been
compared with the vendor RTL8367D initialization. Some common entries
write registers that family D programs later (EXT_TXC_DLY at 0x13F9, the
LUT configuration at 0x0A30, the interface select register at 0x1305);
the bits that the jam leaves set there are not documented for family D.
They were used on the tested hardware (see below), which uses SGMII and
HSGMII on port 6 and not RGMII or MII on port 7.

The chip has 8 ports (0-4, 6 and 7), which is described by port_mask in
its chip info, as for the other chips. rtl8365mb_family_d selects the
family D implementations added in the preceding patches: the force-mode
configuration, the VLAN 4k accessors, the PVID handling, the L2 entry
(de)serializers and the QoS priority numbering.

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
 drivers/net/dsa/realtek/rtl8365mb_main.c | 58 +++++++++++++++++++++---
 3 files changed, 54 insertions(+), 11 deletions(-)

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
index d34c9b6..282a225 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -47,10 +47,6 @@ struct rtl8365mb_family_info {
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
index 639e6b6..eef591e 100644
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
@@ -814,6 +822,10 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 					    bool link, int speed, int duplex,
 					    bool tx_pause, bool rx_pause);
 
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.jam_table = rtl8365mb_init_jam_8365mb_vc,
@@ -835,6 +847,27 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.qos_set_untag_pcp = rtl8365mb_c_qos_set_untag_pcp,
 };
 
+static const struct rtl8365mb_family_info rtl8365mb_family_d = {
+	.family = RTL8365MB_FAMILY_D,
+	.jam_table = rtl8365mb_init_jam_8365mb_vc,
+	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),
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
+	.qos_set_untag_pcp = rtl8365mb_d_qos_set_untag_pcp,
+};
+
 /**
  * struct rtl8365mb_chip_info - static chip-specific info
  * @name: human-readable chip name
@@ -925,6 +958,19 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
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
@@ -1977,9 +2023,9 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
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

