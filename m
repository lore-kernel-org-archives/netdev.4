Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341047;
	b=DUJQ4WYnhkYjDDcjONyy1qQ8Jb+IzhQNbO+YX4bhkyOs8twAfUK5x5od2D2NIeiuu8u6
	 IWJZuilReJl4K+fnMj4BbRCOfWWqIpTo6OUOnAlXKmMZ+CfgFRkucF6ZezaGfA4/1VD9A
	 nWoHQBbgFfDrM9jWZ/hVUNj9rqUVR1vWBTqbIOqOHpTEfLvJo0ByZV1ffKxPhjKMwIjOi
	 M+n4cTIsR7kCykwEIWOiBCrHEjksTuhcdblDLxYdJ3F56qwEGHQfVc/j9ppzuBXp765Dq
	 FSM/AJ4mSSF+FFUiRHwDLdNubWv8qUWt1ZYVhJPE3lKQEjUUF5z5LnSjb84HCWb2FzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341047;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Gox4wAF1MK4uz4XlmyL6TfUAXIYUtDxzSuTQBpysJIs=;
	b=F31FCiorjayUmmmT3HhV0iQ4JD7cPLM5FmT1bo/AD6gEqfyHqoXi3iAoZm9UQMui9I2+
	 KkzrPFnw+kqezLFW7ihtdT4szblPIKcyAnZrnkL2+Q8/f36gnN/Y9MdvbdjXPlFz1KX8k
	 0uLT4pvqcIRkg3N/XTCVMDqP4+2rQhjAbbE23dP3eK/Ml1RlGo8ulGqpzOTAZ+4rLJiMb
	 gNSvFFqQWSqZeU9+4qo9KDYD+rRqRFVnF7cwdqiCvhnIbqqYvOoX72syPriYBydQdvMJL
	 QUdwS0DMe4iQMciA3u54qDxFvPEymjgRT7Gx4vEGF0Kv1nc4qA5a9L5S9kqTK9v8JWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=kJ+PygFm;
	arc=none smtp.remote-ip=66.163.186.147
Received: from sonic302-21.consmr.mail.ne1.yahoo.com (sonic302-21.consmr.mail.ne1.yahoo.com [66.163.186.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F25606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F25606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=kJ+PygFm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795341046; bh=Gox4wAF1MK4uz4XlmyL6TfUAXIYUtDxzSuTQBpysJIs=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=kJ+PygFmVgVqffpV5WS8QKdMTDHUNAhixkMjdB08vh2+Ybmu0h4hsSeo9iI27KQarZ6MRYssE3XgEplo8P3byh2RMBij/fpHiv4Qkz4Bc0e0nc/02/ljqZakINh9iJaY7d6YW9ZVRl2IuLj5A3AmkhpWa6ec0af6H77oeWOToX6DrQOdx1eUHEsruPNnYwymmniFkqIeFQieaSPe3DQBUkx3iYxRNR4vUcl/43Tf9CIyJQR3Wda2hg0V+j5hcVOL8cExEQhC52KH4ia3JK4WxgyQCe8tXqXkD1uGlTqgdORzJXcvKMsXUpunAjKXBQ345fy6njv0KjA6s7hheN9Lyg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795341046; bh=rWCmTEgyytACMa+AFaIfOUcSM7/iIiIFOR3x5ETyW4H=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=lFCGoWuEeg9aR7iP4sp9d2oFdlzvIyn9g5EpfQEWSZC+CCQnAaG8DAUKk27XYKVGbDTIiuVw8/BE1R8JZbqPwWsowa3v3FM9WE/paZrLIFOxZKYSDEm+pdCrG3DThffVcTOekxatvTFatiTqPkGlKdH4d9/yUQRiHtIpnyw7yeVpYOxHlzXcF8HmCIIBrG2HOr7LSNekWN257d2a8xb0ZQNLFJ03OUKHPROnn+FoT6P2NRmwM9lmZSlqg+26AapTj7fiZ5Ynzaci0yff+zzrwvD/lW19h6/0cAi8qYr2KnqMBOH9X3i71Xx7ZEfYCBQVp3fNtLdguMbJ+RHjhOx8Jg==
X-YMail-OSG: YJdpVA4VM1mFudB07_N..8tH7b1t8DVyM8107d_nenVmRu3CkVjrj34Xgdf5cXu
 li31H8NBgqjmPkcpotsQ6zY6AJb_.vfRh_OQnycyQgZRVFOhTj22Oa95aqfH369W1Fc8MxI8uFTL
 GaRTfZkP5zD1QDYHJ6on7EsTMJA6m3yNGDBmG50JqyIXvaXpyYhyUNPWw87dFW5veZgvciu7ZOW3
 9bHnpSMmOoFGO98os_q8en4QfqheLIfPJYP6zAhGiPXio00cZ4yj1.a8iet6.rcOovjW7SCGqOKw
 kpsOfi4BI7JG4.21ET4eo4jT7GRf_HHKnR7pI7aPiFwJnpRYAQhCvHcjRunG6SVyZOCY2BgzppRH
 pZC4M2l8Gm9Lya00FMHNIPwRDM9b0L7L.KhLxoxu5Y.XgUsEFjc0EU_X2QjOGY6ajnJX87OB5dly
 DnDf1M4r9cK1LlQ8bmoTKhP4TcyqcF26NzslCSJSZGhx6qD7kF_HJ0mDk5h.aiJ_aUwnZVWa9zfn
 DEFvShd932liASDOGMcZ0ayweWxY2jlo4.gWcN7bJgZKVsQjPlCK4s_kCAXstHHeNgbM8iK7s1I0
 f5wXnBQo5GgR9WS.jXl813hjUM68Ohk0tUaPCkZfGn6Fq4FW.EFX.QTPkgu___4Y0mTUYgqos7Hu
 74.0m4cCwjeQfw7rsHKnMqjE4MIKXeUNhiLw8fcnLoeua1u4OqAd8EymAeNoJ6N1MlcEPK5vO4cI
 dcOUlDtD8S2iIBe7v_loTYjy9OdHo1OxLfs_QtLUHjh6kvddcaAjFM_sS8D_pxOctMj1iTbMm_fJ
 Fis7sLglxlrwKDqmOpWUQ2Gfv_eehAmQDZuGssEs6h0fG5okqDiUf6c08aogt36skEvfhQgqmazp
 e8K.R8CZHU0zJx.xcpDtgVF2VzsAhGYLWI29OiX5mjZf3Gou3iIa7NtoADHxh.GoTe.QZydU5B6x
 NrIJzmLwczE9nea0f8q9dPdkY5i7BA0Lw.oVEHybhKf189KnzmdNMCZ4dNOAcM7aeFb5FKdUwKVd
 QakkhUsJdJzzdD7tcZnA6TWYSKMUynvqFo7hDSbdndsY5nZT.udfsSM5nqTIJd9Duf0ygWl_DZtT
 db6M2vOTeo4TEFtNr9NHXkn0De9qqTXKqqO8.lE73YI.AAz9ndQEJhWiakDNh0BgpLqhXDL59vTz
 .wtgp1q5DcZcH6b8lu8l4yQpOhIU8kKJ1aGs_AKLO5Wxp.kyfMy5kQcj__Dn4IZDDQqRYBejlpFQ
 9gk36QNgUVYddy2XVcIhhVox70qOg3_JVejR1.3jtnOryAivk2oVAqRtfZOIcQToNn_6WQcGQ37i
 MefHgXar4wccxrV_MBXKCXow04RRXuGO0HokiE0eO7KAoWMYdu5al5rfCXXrwwvQ54pzEd1RwUng
 x4h4YrdQGf8qt0DK_D1e1p02DXU1yW6CnI1PuOt9gA_l00Ue9xKgbr6z8bbxLFrI1Hnd6dbPTw2S
 kthCfPvm6N7YBASEzEgwL33OmuxoJeORLNajOU3kgc8ZyUJFJZaZEgo_ZVWq9rrW1oTMKhd3je2A
 LaYmLLBtpXkcT8EXsfvFNcsaHIS0bs9_m1fcDT.JH_YoeFnu.fUNbw3vUXduJIiMBKqsdnI.2iZL
 by0H7FWyHRGuYWeEbndZBNMtkswPnBoEEDDWWH8nrIzchHaJ1kXojGv5ugqRI84Hv30qWogQXA4B
 kJlYjEQiwe7b68in4Cp1RDNYDBzbEgCZgsv8XagvbpyvG5KKjyMB3ZESvve4PYfcTYHuNTpzTsE.
 tCQ.o8K7uk6v6gXpbLCzsd34bOpLNeoqrmh6bT8FJjaC2My4ZNPHUk2ytqCSJDtbs3Or71dH.BQk
 W1eQ1PacRaC2VUd0.OlibLl6mbeU_NRrtqHPxpWbcmE9H3voWYYAJuLdqvY4klRye43QGZSsGPP4
 FYjzbSzmCMTZxfNwYy3OjbXxA5Zh6Hss6DAKToBQ5SMcxGKqRqJbWpGjbecN.t64qclEiZ5vYoI8
 qpCpWnYOv5NiWXcO.PhNf604.LSG49q22UBc6R8DLr3U3oefO30BaZOYHqlBGTYh6FjkoQkTHljl
 QvIYLVbpm7Zk7M_5Q7ZU7yigDT_aiOkeGaQ4VkA129rAjmiy0p_DZeHfI8Y5b6EcEZM1k.1EkbiE
 elJ8a8AXSKVrv5wvcQrVnQPKqx1_ikCG6poIk0ghoLqmVdS1f0VqsDd2La.6PAQfkjPsEK4L.Ch6
 0UpPQYfU.kMnTpTS712KZZV4DDLl43Pr_JgKr_FndZC_1g.FGZO2nNwW.xeuX8kUhrHFzRmsDL53
 7JlHWbYFdvn3Zx_dUqtqGDIWhx.HCW3qrn9OMf8fmaXD_AZVf
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: b5f741b7-c9bb-441a-9fb3-37dc64448ac4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:50:46 +0000
Received: by hermes--production-ir2-7c4859dc89-v5pln (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c0aabf2277c48e51a79f27283484abc0;
          Sun, 22 Nov 2026 09:50:41 +0000 (UTC)
Message-ID: <2ec7a146-d353-4eb0-b0ac-a53d6a0a2838@yahoo.com>
Date: Sun, 22 Nov 2026 10:50:38 +0100
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
Subject: [PATCH net-next v13 14/14] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
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

Add the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the chip table.
It is the first chip of family D, whose handling was added in the
preceding patches, so this is the patch that makes it reachable.

The SGMII/HSGMII SerDes of this chip sits on port 6 and the
MII/TMII/RMII/RGMII interface on port 7, as on family C, but the external
interface indices are one lower (EXT0 and EXT1 instead of EXT1 and EXT2).
The chip reuses the existing initialization jam table, taken as is from
the RTL8367C code; it has not been compared with the vendor RTL8367D
initialization. It was used on the tested hardware (see below).

The chip has 8 ports (0-4, 6 and 7), which is described by port_mask in
its chip info, as for the other chips. rtl8365mb_family_d selects the
family D implementations added in the preceding patches: the force-mode
configuration, the VLAN 4k accessors, the PVID handling and the L2 entry
(de)serializers.

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
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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
index 9a69e85..c280e62 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -43,10 +43,6 @@ struct rtl8365mb_family_info {
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
index 75d9c61..7356324 100644
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
@@ -832,6 +844,24 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
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
+};
+
 /**
  * struct rtl8365mb_chip_info - static chip-specific info
  * @name: human-readable chip name
@@ -922,6 +952,19 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
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
@@ -1974,9 +2017,9 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
-int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
-				     bool link, int speed, int duplex,
-				     bool tx_pause, bool rx_pause)
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause)
 {
 	const struct rtl8365mb_extint *extint =
 		rtl8365mb_get_port_extint(priv, port);
-- 
2.53.0

