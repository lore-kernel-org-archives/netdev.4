Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133394;
	b=Ltrow/uP+N4J8WAav2Yx3mgwK7ahRdSgMkYKZxAhCbIkh+6MQdqA71M0ZeYVtDduOy70
	 oX0LB6AhYWdz+LofrrJ6aihzSTiIQB8Yzk8TqEsvbO5dK/PRo0+kOqQb8Vuhzv5RztzWo
	 9lhn4r9YMHC2WJtvmpLPs7aeMA3w7hXAHtAf4aHhytt5kDreX6z/bwRTLMPZNjBKGE8AS
	 uLZBmK+MXFPjqxOAWmkx0hCYe3yiQMsVyVNP9FWDPJP9tayrf+xItOkpuCKLicLWV0T/7
	 TkbJhM2lnPwMShqjf5lbtXLqH35/83Lfs7m5y5bWO/Yx0bGHWsEhDKKHUX8zADQjTzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133394;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=zFsE2OBRDF5jIRbcmqp1WRJG/783QQpzfaQ8RI3g+mw=;
	b=JRTUyt5rBCgdMuHZ0ivA9w86UAJ1lK4oneFBCZhFGKgOkjRj2dNw33/ImYZu9/ZPfT7Q
	 Gh8WjBSOYtgeV3O3sUJV/FwpDRyIUB17XZ4P+fWurCCVX1z+x8+RoSOevyKVsfJyUOxbU
	 P3/evdqnD1tK4hRxeshuAyRCziZegmgIUjlqLEsqV+l0xxTnXJZpIQpHt93/PY8lSmUnZ
	 QJK8fJ2oBAgeyBVdDo3oOnFAnv+WX0pantoncLLpNjFk7iVnAAI113yLwlLBejlUVJzEi
	 05JOJcSf9Izjs5FHMYRDGlyLrVFii/zwuvV0e+ydyqbuXtqdCBop3kZh/ENwGg3J/HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=awuEPJur;
	arc=none smtp.remote-ip=66.163.184.44
Received: from sonic317-33.consmr.mail.ne1.yahoo.com (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B48160A2607
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B48160A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=awuEPJur
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133385; bh=zFsE2OBRDF5jIRbcmqp1WRJG/783QQpzfaQ8RI3g+mw=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=awuEPJurjLgAjNnZu178Lio1rNzpgqa5CrWmBvkjXUSPM/U3p+QfJFlxes9vm7Fg3aHwjjrfseRrAUsiqSwdr29ibVRcXA/E60LECAigl6ZCWNwAaUZMeC0W53cxIY3EyMzS1ebmEaNt3qVLXYT7Zl1wtPN433iFdsF0FJIAn7GJMqtBzDC6yHoa/APtFQ0Dix2W6itNJrwuCwRtoPbAKaLkRz2iYmUNBKfgvYVbHCho6l30Jegfy3G+eh5XochfDEpZyK3mdMyuyyeCmjCVL5HZJMI3+OVs4I5SpPetHSb0J2Je6lIuMph6tdy8qnusETbCxzX1oyG3rcJPaJYnoQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133385; bh=xPZEfhPGtSPakXkaoG4c1vehkvRNb8q4Y7CTpMtlSvp=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=c+B0A9Lfk0nW92iimTQTuOQkWo8VW2rCvc8X2xLtJBRIBxl7ufBwqNYKW+oE+tyNjbMb44A1ymAK/TuUXJfnUDffYHjnauyK51M8HbalyL4uAxGbN2IrQNoDSCGetywdC3rBTDSUUt4gWQU4+UhKWJe8Hwz07cUVbv5mbv38EWjk7IssIJAyWC8j6C8esJj9k/xzKM73RtfVlnbOrKxvc4eBmi2DmSfBuwvn3Hnluiwslp95g+tawIYHixW5V8JcyYPQOmem6XzTZkcb7Dxd1rZlRSVHwZZtMRumVT15GWk+OYo9fI7NcL3CV0kPw1dfO9ul173huWhCvHHzgXKyZw==
X-YMail-OSG: Q1do08kVM1k3tN2543KBi3ZdL8py2xKRiHnjCchWlud.X.rbB2eb0YwH4mV877u
 T_SRybJ5ewhmw0ln34Hh9D.ADykocUH_LQndB7WMtYIMp.N9ZfnD0uhLimyaowUqSBCmv_y0FMhn
 Pv1265KbkblWrYNRm34HT1Vl2dME32pyUB5wxyDuH6dBhNfLs73rc2VuzTfxHZ8xTUEk6FDVT7Xm
 pJ6WlEHYXglTXdb6WPXUMlZQQZP5vJn8nak897GKpo6HvtSjtWIJQ4Wzk_SilnsSCv71GyP3f6WH
 _FZbIMxaR0HFZV_W0M8KVCXgEUz5vzPq25bStmVueUjrti1tmj88_BvjEP8tz8EuzaaiIbwunsyb
 82VySudBNXyyBWJrM3pze3SkYPYBMTGtUgmATo8IydiqlsTa3SdqjAn6WyxtWM4AX_YIQbxcv9Ls
 CIUG9kArzYJ8rk2.KdIZz5R4qBAIfsCP9DvtJvOhezuePnoYFnafq97bIIf9l1kU_onzUkxufFva
 MdgG4hPkgvHZnIGPjfljBTFLC_PVVYtBsLttN7D6g4Mv3oiTbTPZvOC71BhNwxqqsXjcO615pl5t
 yASFQNyo6uubFmsQUM6kpAJVKi7kd3VtqJSAQPC3CbE7Z9w.W4YUnsd2kPnhDHDPsC8X0nqiIjMR
 T823XC5OBv9XG8sW_YYWMcUB1bGP1jikOoO0XlJw1Y23juY6_u_dPBbcG2owqss_ooNcMGMtIbg2
 EH9KjfMgZQWkeuYJnnmo15DBBe5Hc8zCUav7WKrha2c1jlxppYVJT_j6K7Y3Ec_0Y0k.1AFVO0My
 dEHiRrhIGMFUiyyvBjpISm.UFda4.w7TOsdSim3b_OgarfPTKdWh5s6VBQxNy0BtnRTgjERjZ26m
 RmRmrSFrc2yEA8CTDDcPrbXlhyr9SSPuC4PAPeP6eyEsNyqzAyzwgo9KxLEfsiogBnZUcMU5EzUw
 z3gV2D9AZGxkKBhrjOTP2.kyHfxch.JlnT.P0QPH7alTb4OZCkv.mR6u9E85Bl19OsurkuzOgDb5
 UBMg41CJrCkDpy4ekFwhWicuoCxPe1b73dwWbqBwtH_rLx9DkIygNydfXIJqMXo2aYDaNMwX0AMD
 0jGfIJzfmaCxdqbUZUNGYYfGMxpk4tawuf9PfLVNYuA2UV4Ghqj2E53ws5129LTV8y1Ach4ChPTb
 bttoIzqk8D00VfOiFutm5178CLRcvnwUVo6nXa13UnpFC2OtT1psRstNjXlJaY37fPgApJqKqEFi
 BPrP32giHXwbWzT0UOOwcsVJlc8gDxrXLu1gJr8DNnroifIuuPlsuoV0jxNd98omxhKhROluf4sM
 4EYa4I1CVYez1UqVWFduqeGU3YM2LwBJ_q2BRqcJdCu15DTvvOWwrNLY3hj4uga1XdZfI4iIKKOh
 _UmHmTWap1OdZzbdCT32ais.UfIIrhI06NluBjQrkIFJM2RTQOigKtTnVelynevlDKVa0sKct.o2
 X4S0rw6MXCiiamElcm9G91HncCRkX9TxdvoI8jbc8T36hwkQ2bpfHPNmczUTuZQrp9vqPWykp2CI
 e_731x2.d0Y8_eYiL5ppWUn0Pi2hfS4S4WQBjG6QuOlgi6HGYjRT1Fn1Lpi7jOhvFybuEBx6T3Su
 vjeQ6bn83Ooa3NvIy35sxfVSVp0XQWaafHXsOEtmxeyUiMxtGhUgw8X60GYrEPimt9GHaDga2AJz
 FXVOGF1pRzWI4SaweXDqyB2Yv0f_hciUVmOHCyu9NBr0wp90iVI2sx_jHHoRQml2YOjXfp.byHYM
 _EbXfabrXu0H2CEUY4XN0e4qw9xN1.v5OE.KSLus.bbe93mpHr4ZjgwW9l8dqXJmdf826I4k6ZxY
 OhAxhds6TP5RU9av1hnxcA_8d7O_yPbwfH6NUsRra_tUZfQiC40iD2FPUDqLHnA0M2qn7hD9kCXs
 wBXvqGSX17UmT3VPNBvn_dIKnUen1MmEPW1ptByNgIKUcmVWdjd9Mfe.MwqWfvvUCsR77gyg69pq
 zRJRlCe2kWPC4LsSzNV1Kc6LX6Qwlte0Wui5vy_KJ.DQl67GnAa0jIJK1NvDUBy8gFCK6GYdeQ6F
 X81N7feMdPmYVsZnjTtzk9nOKpM74AgjCX3Q1EwoBsfDvHF_qwEleUuDnhqcWYDhU5IPGEz8bj6L
 4ZO60iVofZ_qcgJhd7QV7jkgggSJJDbE82CCCTDfUieMOxxk81xRZxdT3ZBbiULZbeYq8a0f_mdV
 4aZuEFmN1iqpZOF6tn.U0GHH2rCdCjm6XmeWgAXcTtR8kLLyHIXhg8_jup1bSkFepbqQyOqGyF4D
 2gi8DP6gEK5W0rrlSde2j0.rnAq9CnIFODlrGecAhDjmXI2nQDFbO
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 2949d025-65bc-4da1-af09-66d802d6495b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:09:45 +0000
Received: by hermes--production-ir2-7c4859dc89-lmzdv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 99fbd7daef1faee536e088399b678797;
          Fri, 20 Nov 2026 00:09:40 +0000 (UTC)
Message-ID: <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
Date: Fri, 20 Nov 2026 01:09:37 +0100
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
Subject: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add support
 for RTL8367S-VB
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Language: pl
In-Reply-To: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27079 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

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
index dc436ee..1386e1f 100644
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
@@ -799,6 +807,10 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 					    bool link, int speed, int duplex,
 					    bool tx_pause, bool rx_pause);
 
+static int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+					    bool link, int speed, int duplex,
+					    bool tx_pause, bool rx_pause);
+
 static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.family = RTL8365MB_FAMILY_C,
 	.jam_table = rtl8365mb_init_jam_8365mb_vc,
@@ -817,6 +829,24 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
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
@@ -907,6 +937,19 @@ static const struct rtl8365mb_chip_info rtl8365mb_chip_infos[] = {
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
@@ -1959,9 +2002,9 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
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

