Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133335;
	b=wvgWig6h8ZXv/U7n9D99gPJ3TK3nBFrrrAUYFngELLD37S+FrrQfGE84h3bv62dNcJsc
	 2BCRU1HaaTc3JqdwPMQWR80nK7fFf6TS4jxak5rFk5hvwaVmImU26FqUJE5bDBsEjZTsc
	 D1Dp/kznPcOgzWcuaFjzayhGfPwfcxKxUf2hR0yTcs9ebd+L4iIz4WLDPVysv/Y+njEOv
	 UeibHxDpAWyq3XVo3c43i7xmE8eIlPVcbpkpq7P4QZmizGrb/1Vkg8c6wZPG1IUHZFRf/
	 fQh2dO8sE6Gh/PDkqxuTtA9jJe76YQ06JCBgdSD+PgDh6Ylh1GaJW6vRjpfDpDQgUsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133335;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=4Vg7N3oYshy3EEXzhRxXXAH88TafQV+Xi5HI17lnSNQ=;
	b=ftgFeavFePZkZRIGbxUO5fBJ8Gn7Nc7o6qwg1wQa7Nf4ZOtrAGjIjxMOpkCLHOcWanEV
	 A4tcgStA9olehMnWGvQkXvDf5Bh1GglrxABIgoyrXXhed0h1JLvhuPdhOj2H+EmkN/I+S
	 bVvSOQS6BaSoYrNugQtoYkKAR9rDjFpi8GGeFw/mlBDJRmvBLNTMZHagJpcXcF8XDXjWG
	 R1FWrlqZc6+06BkDTQU0hEHlW9yfX+7abxylVVrKxU2mSiWIcw45zh6El+ibkGk+6Rrwy
	 wvNeiIVLvnwLrLWz+bj4qgtIPQISq4uXc1V1T/hy86Sa3IdGY2aWdW10G3Pn3OiYTdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=jYl7tj24;
	arc=none smtp.remote-ip=66.163.184.44
Received: from sonic317-33.consmr.mail.ne1.yahoo.com (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63565606A338
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63565606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=jYl7tj24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133330; bh=4Vg7N3oYshy3EEXzhRxXXAH88TafQV+Xi5HI17lnSNQ=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=jYl7tj24CsbNyhb05DyW+LaUUcLWY/2EuE7rj/VuIDn3IalrST1HSmj+fOXzwno6ZIcLIZ7SkekevpcbYg0L5zMk0RMJA8BYoXuLdp9fsDp43/WpfNoB2UIDv1RVY2w/Gy3tT3gLPxJ5pB9X45aNGUBiHtkxvjnmiGBhZ/X0BmRoTb56czz6ec+amCfzrgufO7LpLjoZzSZVJLJh6kWlsCcRL63+ueV3ujp1OGF8PBKBAW1VsHZxiGExJKkCe0LD285ADLGNejMWJP2VnVEvrMQP0X8N81tMX9uT2YYfqcERLMbd1Zq3QxcV6sFILtgRhGVcDpPNc9YNSPZpNpOFgA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133330; bh=QYwR9E3g95uG4COJQzwe3y24YAgYYO95sOV4UshUDr4=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=NHPMISLvruegXXOGg4OEA0U7AoVoJ52ISfw9/W3oSqubCkGKTXsXnDbCqD4J3/G5rl3lYf2Vziysu4Atuq70GV9qJofBfILuxEp/PzSFvBFIe4gb/EYYEDk3io8dmf588MfCvWwYGAyDNz+7gHVeAlUbm/VbGVms3ZZCvTxnnKXeykwE8tkmga9DHExig9AZ3XQrhybnPLglJglzfCz01kwsf28Xyk7pyZFGcW0sOaIi+56xht0ocDqNdE8XLQij8NaoH5y/tkREYGNdnyeyk61IwXZIaR9Z9/KSj+M1iZAnqRTQAJ4ernJDCDYGNAgRYPGqewYaeUoYhiAU1R4/8A==
X-YMail-OSG: w59OyagVM1m58e_R35lc2n5p47zcl0sKKwrODwoI4NdBlY4p0hLDbDsI.dGDdDH
 fpsTph0VmkHmw5hOu1kHSprcAwZc0PstD.GtdYDKvtdyHJPnsZlywdg87REqflc_7JBTztoJ8VjN
 OSce0DGdZ04f0Xab5vP5FYswpG1xLbWHrLNxU_KWRdnoZEUfU2VYrmp_BHncPrDPIaWFofBgcYU7
 0gMwbjegROp.Zmg4aW5gJQOzi8wd_el7LgXV75D3A.SMneCgIRNQOdnNj_YS1XlTFyFuJykNaj7u
 1JT_CsNUbs5P727M515HlPMQUKcjJ59ATRHDlqZDXgTHhJRS1OkQ_ox3rkhjQuEVUOmmZierR6pm
 sF5Uv0kwPvi2tHM91KQQqpcLZy8oTZCOG4__aD_kEnmttB2n._VWxQy5mNShNg5A2adNGHGg3uoD
 zYuQD87fR1reLXLhMaVuuITSgxSIB6CnAcBTv6sTJWWvzFtrALjS1UzP8vE2awwijsFhF4SQwrXa
 nfmFY2viNCuKf6bskzvx5He8KSKJPwRSaA8XXe9fuifKdhts_f7n4.6lBM6XH7LCg6iw009SFivR
 Gzw51U2YBdtvwWWdizuIWa64gZzyUmlI9w7kHmKvz_QAU663gSEggIDw1yLz5xlqHXbe1BdfJN.B
 37dJ4_BCMKGW47b71r_SCwsV0cKjgQcUevsQfGk7kHV4oF2XpOuj7HIw8kKqRdgOggpEe2QekcEf
 .hptT4vyj.ngker9p7aCljT4K9gqEXL37FRo1S7Vj3_zxLRNIgUPGvgRogYjGnFZEsbexrcjREaS
 02DY5u5nUelbJkmlZRAwNAifyywG_iBkFsDgv6xNwFdTUJP0I5KXtvxAG8T4m7OVI0DAHNkfRTTv
 uMPQhsCbNFvG_I.fGAnyZ6R1nlV8gsvuohqQrFP79y6vYhs56VqL4C53by.JJB3ee9qF5V5ADrWy
 YzNTRilymlLFAZEwyB99BdeXDSsjizeK5q1jvFV5FteijZwpZcfeqYr5O0CTb0ylYKpwe1OjBuZJ
 aTDcsn.xUw4ULU0X09.TeL397E0SSp5Exz_8jx6II2zdYGAA.IvQcibarzkxSHuq2i4kAWVBmPkM
 l1uxyIUuymdbgU8iAnk.yG_qVF4Q56VtA1x5hplRli6p8Z8MZuaYSCRghhEC3rSog1AarFDp6Nxu
 AwTfEmLHr.YzmbSYfhXOSeBr8inwyTzkLTGbQGVlDmVyUDqkfKS6pV19towPvTAlXOCRAEsdQ9St
 RfscO.dDHOCCSVQr6O_Bp5vZctTWp_p_OZjrbkK1cG4OjXXqU_wHJi20Prd_j4YCH_smptnVovHq
 a5_kq7MF_wVq42S1QzmwMHDjIJNxyNAeh0vue6wh7NMlELqxqQAvyQRo6XZjucWKl1kcoZ3.qBUV
 L2r4f4CAIkAJW3U5yiiu5aavoxwEx_7HTaRz5JEvSAGU2hfb4.uLrccW1ba7df0.pAkNgVxGVyua
 A4fYIcPtIM...w3T6YOFLpSDwxwld0vaLHCu_ocJX_tYTh10.dzYtVPKEhHLldTxFBLTFloKbK.M
 R8OIrtzzIile_sEKSdjOxCEEjTTcMnZpSB0EmIoadVhzm3A0G2lB9h20mCd7EFmSfCsKhU_4NVay
 vUwtHt2GLWGPVwMOfFTUq_rLD_pFogNDqB7pmrT5x1yjspUAcNgL5wuluhx9vw.Vw40YFPaigZq9
 3kP_XNI..xG5dVz1vyyrJuvUJLzwdAazRRMzB6A5hMNfMiQOJymfzc2ks5108yevLsH5tkEqfw7Q
 I5gPFf3MlpDN0FQ5PUB.0rtRhkQu92NqeJ9KbeC3gDTYAazIEPmkf14UCSv8H1_z3xZzas662Klx
 JP85id2ZGPdylqoPpoGT.iM6XBr3n7EJ9staY3DYzl1QHelt.4uVvKjmx0j.OAN0DhYK4zLLfWgK
 lU16kF0uKzxoyGiZtPtCY7fl8Z9kshj8YlORj0zyrDIWaQKMg8h_IRhtbCB2WnrhAxOmjotHPaJI
 bzdgucHd0EpOFGdjpJ6.R0nIu9MJmCH5807Wi36ZZz61cqiqMBj3v8KqDAL9tQ3ytyb_n1EMbWqV
 .9cM805QYmuWgidzzyCpNey61yUrR7n2adedy4ipr11RLrTBTF2yn4e2ECzw6iypISSaRYO2Jqhm
 QwlqdHJFu1cR3qdqvh4AvT2Y2h84NrSDGlloWcHkNeU.M0hkE7gx5x4XyD2FekbmmE9kMc_6keK4
 .al2e_e.QXzVAvptiCwYtCUhbe.0LlHy.58rS4VF0RwUTnUo5943A6H38cwRqflfOPaYRcCvNGo6
 s_zi_VHzfhSoM2LYmXbvDvMHHzMF6hC1TYy9z.XyFHbJ7O9m0rHE-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: aa6f1d8b-29c0-4e45-8e1d-517b7eb58d3a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:08:50 +0000
Received: by hermes--production-ir2-7c4859dc89-hgxcv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3f78fcc602d196eece77e35b70852337;
          Fri, 20 Nov 2026 00:08:47 +0000 (UTC)
Message-ID: <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com>
Date: Fri, 20 Nov 2026 01:08:44 +0100
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
Subject: [PATCH net-next v12 12/13] net: dsa: realtek: rtl8365mb: make L2/LUT
 access work on family D
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

The L2 lookup table on family D switches (e.g. RTL8367S-VB) differs
from family C in ways that make the current FDB/MDB code misbehave:

 - An L2 entry is 5 words instead of 6, with a different field layout
   in words 3 and 4 (port, age, static and multicast member bits).
 - There is no EFID and no per-bridge FDB isolation. The register at
   0x0A32, used as the per-port EFID register on family C, is the LUT
   aging timer on family D, so writing an EFID there corrupts it.
 - In the table access interface, the SPA field is 3 bits wide and the
   address register is 12 bits wide, with no address extension bit.
 - Only ports 0..7 are present in the LUT and there is no
   FLUSH_PORT_EXT register.
 - A VLAN-unaware bridge reaches the driver with VID 0, where the chip
   learns in SVL (IVL=0, FID=0). An entry programmed by DSA with IVL set
   gets a different key than the learned one for the same MAC, so both
   coexist and the learned one keeps winning.

Teach the table and L2 code about these differences. The L2 entry
layout is selected through struct rtl8365mb_family_info, the other
differences with rtl8365mb_is_d(). Family C behavior is unchanged.

Specifically:

 - rtl8365mb_table: use the family D port mask and address width, and
   read the hit address from status bits [11:0].
 - rtl8365mb_l2: add family D unicast/multicast entry (de)serializers.
   The IVL bit is set only for a non-zero VID, so VID 0 produces the SVL
   key (IVL=0, FID=0) and static unicast and multicast entries match the
   learned ones in a VLAN-unaware bridge. IVL_EN of the VLANs follows
   the VLAN filtering state (see the VLAN 4k patch), so the key matches
   the one the chip learns with in VLAN-unaware and VLAN-aware bridges.
   Entries read back with IVL=0 are reported with VID 0. Use age 6 for
   static unicast entries as the vendor code does.
   Look an entry up before deleting it, so that a missing entry is not
   allocated by the delete; as the key has no EFID, an entry found on
   another port or one that is not static is left alone.
 - rtl8365mb_main: make port_set_efid() a no-op on family D, add a LUT
   init step that clears IPMC_HASH and BCAM_DISABLE and writes 3000 to
   the aging timer register, as dal_rtl8367d_l2_init() does in the
   vendor RTL8367D API (the unit is not documented), and do not
   advertise fdb_isolation. Without EFID the bridges cannot be told apart
   in the LUT, so set max_num_bridges to 1. DSA allocates bridge numbers
   system-wide, so this does not stop a bridge that already has a number
   from another switch from being offloaded here as well. Bridges that
   are offloaded together share the LUT and are separated by the port
   isolation masks only.

Without EFID, FID 0 is shared by every port that is not in a VLAN-aware
bridge: standalone ports, ports of bridges left to software and the
offloaded VLAN-unaware bridge. There is no isolation between them in the
LUT, only the port isolation masks. DSA does not program FDB/MDB
entries of standalone ports here, as fdb_isolation is not set, so those
ports get no host address filtering and their traffic goes to the CPU.
A MAC learned in FID 0 on a bridge port may therefore also be hit by
traffic from a standalone port, or from a software-bridged one, until
the entry ages out or is replaced. Static multicast entries written for
a VLAN-unaware bridge use the same key and do not age, so the same may
apply to them. This was observed by Gustavo Foletto Mora: with the hosts
on standalone ports of the same switch, unicast to a host was dropped once
its MAC had been learned on the VLAN-unaware bridge side. With learning off
on the bridge ports it was forwarded, and with a VLAN-aware bridge it did
not happen.

A host on an offloaded port can use this to keep the MAC of a standalone
port in FID 0 on its own port, so that traffic arriving on the
standalone port for that MAC is dropped until the entry ages out. This
needs a host on the local L2 segment and is bounded by the aging time.
Avoiding it needs a per-bridge FID. VLAN 4K entries carry a FID, but
they only classify bridges whose ports have a PVID; a bridge without
VLANs is classified into FID 0, so that does not help the VLAN-unaware
case. It is a known limitation of the chip without EFID.

Register layouts follow the vendor RTL8367D API; the code itself is an
independent implementation.

Tested by Gustavo Foletto Mora on a TP-Link EX511 v2 (RTL8367S-VB, CPU
port 6 over 1G SGMII to an IPQ5018). With a VLAN-aware bridge: per-VID
FDB readback, static entries replacing learned ones and being deleted
again on every port and VID, the same MAC as a static entry on two
VIDs, MDB entries, VLAN add/delete churn, and moving a port to a second
bridge (handled in software). With a VLAN-unaware bridge: a static entry
with VID 0 replaces the learned one and traffic follows it, a static
entry pointing at the ingress port drops the frames, the MAC relearns on
the original port after the delete; traffic to the bridge MAC no longer
floods to the WAN port; MDB entries limit the flood to the group
members and the flood returns after the delete. Unicast and multicast
forwarding were also checked with loopback cables between user ports
(known and unknown unicast, static entries on the wrong port, MDB, 20k
full-size pings without loss or port errors). MACs of foreign ports
(a veth standing in for a Wi-Fi station) become entries on the CPU port
through assisted learning. Real Wi-Fi stations, RGMII and 2500base-x
were not covered by this test. Leaving a dynamic or foreign-port entry
alone in l2_del_uc() was not exercised.

Nothing points to them until the family D info is added together with
the chip table entry in the last patch. Until then they are not static
and are declared in rtl8365mb_l2.h, so that the build does not warn
about unused functions.

Reported-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-6708118180
Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Stanislaw Pal <kuncy7@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/realtek.h         |   4 +-
 drivers/net/dsa/realtek/rtl8365mb_l2.c    | 126 +++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_l2.h    |   6 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c  |  58 +++++++++-
 drivers/net/dsa/realtek/rtl8365mb_table.c |  44 ++++++--
 drivers/net/dsa/realtek/rtl83xx.c         |   5 +-
 6 files changed, 226 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index c166719..920db50 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -78,7 +78,9 @@ struct realtek_priv {
 	 * create/update it. l2_(add|del)_uc uses a single table op and,
 	 * internally, it might not need this lock. However, altering FDB
 	 * may still collide, as well as l2_flush, with fdb_dump iterating
-	 * over FDB.
+	 * over FDB. On the RTL8367S-VB (family D), l2_del_uc also looks the
+	 * entry up before writing it, as two separate table queries, so it
+	 * does depend on this lock.
 	 */
 	struct mutex		l2_lock;
 	struct mii_bus		*user_mii_bus;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
index cd5b333..e98ba5c 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c
@@ -45,6 +45,21 @@
 #define RTL8365MB_L2_MC_D5_MBR_HI2_MSK		GENMASK(7, 7)
 #define   RTL8365MB_L2_MC_MBR_HI2_MSK		GENMASK(10, 10)
 
+/* Family D unicast (auto-learn / static) entry */
+#define RTL8365MB_D_L2_UC_D3_VID_MSK		GENMASK(11, 0)
+#define RTL8365MB_D_L2_UC_D3_IVL_MSK		BIT(13)
+#define RTL8365MB_D_L2_UC_D3_PORT_LO_MSK	GENMASK(15, 14)
+#define RTL8365MB_D_L2_UC_D4_PORT_HI_MSK	BIT(0)
+#define RTL8365MB_D_L2_UC_D4_AGE_MSK		GENMASK(3, 1)
+#define RTL8365MB_D_L2_UC_D4_STATIC_MSK		BIT(6)
+
+/* Family D multicast entry */
+#define RTL8365MB_D_L2_MC_D3_VID_MSK		GENMASK(11, 0)
+#define RTL8365MB_D_L2_MC_D3_IVL_MSK		BIT(13)
+#define RTL8365MB_D_L2_MC_D3_MBR_LO_MSK		GENMASK(15, 14)
+#define RTL8365MB_D_L2_MC_D4_MBR_HI_MSK		GENMASK(5, 0)
+#define RTL8365MB_D_L2_MC_D4_STATIC_MSK		BIT(6)
+
 /* Port flush command registers - writing a 1 to the port's MASK bit will
  * initiate the flush procedure. Completion is signalled when the corresponding
  * BUSY bit is 0.
@@ -240,6 +255,78 @@ void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
 	data[5] |= FIELD_PREP(RTL8365MB_L2_MC_D5_MBR_HI2_MSK, val);
 }
 
+void rtl8365mb_d_l2_data_to_uc(const u16 *data,
+			       struct rtl8365mb_l2_uc *uc)
+{
+	u16 id = FIELD_GET(RTL8365MB_D_L2_UC_D3_VID_MSK, data[3]);
+
+	rtl8365mb_l2_data_to_mac(data, uc->key.mac_addr);
+	uc->key.ivl = FIELD_GET(RTL8365MB_D_L2_UC_D3_IVL_MSK, data[3]);
+	/* D has one shared VID/FID field, selected by IVL */
+	uc->key.vid = uc->key.ivl ? id : 0;
+	uc->key.fid = uc->key.ivl ? 0 : id;
+	uc->key.efid = 0;
+	uc->port = FIELD_GET(RTL8365MB_D_L2_UC_D3_PORT_LO_MSK, data[3]) |
+		   (FIELD_GET(RTL8365MB_D_L2_UC_D4_PORT_HI_MSK, data[4]) << 2);
+	uc->age = FIELD_GET(RTL8365MB_D_L2_UC_D4_AGE_MSK, data[4]);
+	uc->is_static = FIELD_GET(RTL8365MB_D_L2_UC_D4_STATIC_MSK, data[4]);
+}
+
+void rtl8365mb_d_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc,
+			       u16 *data)
+{
+	/* A VLAN-unaware bridge reaches us with VID 0. The chip learns such
+	 * traffic in SVL (IVL=0, FID=0), so use the same key here, otherwise
+	 * the static entry never matches the learned one. Only a real VID
+	 * selects IVL. IVL_EN of the VLANs follows the VLAN filtering state
+	 * (see rtl8365mb_d_vlan_4k_refresh_ivl()), so this matches the key
+	 * the chip learns with.
+	 */
+	bool ivl = uc->key.ivl && uc->key.vid;
+	u16 id = ivl ? uc->key.vid : uc->key.fid;
+
+	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(uc->key.mac_addr, data);
+	data[3] = FIELD_PREP(RTL8365MB_D_L2_UC_D3_VID_MSK, id) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D3_IVL_MSK, ivl) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D3_PORT_LO_MSK, uc->port & 0x3);
+	data[4] = FIELD_PREP(RTL8365MB_D_L2_UC_D4_PORT_HI_MSK,
+			     (uc->port >> 2) & 0x1) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D4_AGE_MSK, uc->age) |
+		  FIELD_PREP(RTL8365MB_D_L2_UC_D4_STATIC_MSK, uc->is_static);
+}
+
+void rtl8365mb_d_l2_data_to_mc(const u16 *data,
+			       struct rtl8365mb_l2_mc *mc)
+{
+	rtl8365mb_l2_data_to_mac(data, mc->key.mac_addr);
+	mc->key.vid = FIELD_GET(RTL8365MB_D_L2_MC_D3_VID_MSK, data[3]);
+	mc->key.ivl = FIELD_GET(RTL8365MB_D_L2_MC_D3_IVL_MSK, data[3]);
+	mc->member = FIELD_GET(RTL8365MB_D_L2_MC_D3_MBR_LO_MSK, data[3]) |
+		     (FIELD_GET(RTL8365MB_D_L2_MC_D4_MBR_HI_MSK, data[4]) << 2);
+	mc->is_static = FIELD_GET(RTL8365MB_D_L2_MC_D4_STATIC_MSK, data[4]);
+	mc->igmpidx = 0;
+	mc->priority = 0;
+	mc->fwd_pri = 0;
+	mc->igmp_asic = 0;
+}
+
+void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
+			       u16 *data)
+{
+	/* Same as for unicast: VID 0 means a VLAN-unaware bridge, use SVL. */
+	bool ivl = mc->key.ivl && mc->key.vid;
+
+	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(mc->key.mac_addr, data);
+	data[3] = FIELD_PREP(RTL8365MB_D_L2_MC_D3_VID_MSK, mc->key.vid) |
+		  FIELD_PREP(RTL8365MB_D_L2_MC_D3_IVL_MSK, ivl) |
+		  FIELD_PREP(RTL8365MB_D_L2_MC_D3_MBR_LO_MSK, mc->member & 0x3);
+	data[4] = FIELD_PREP(RTL8365MB_D_L2_MC_D4_MBR_HI_MSK,
+			     (mc->member >> 2) & 0x3f) |
+		  FIELD_PREP(RTL8365MB_D_L2_MC_D4_STATIC_MSK, mc->is_static);
+}
+
 /*
  * rtl8365mb_l2_get_next_uc() - get the next Unicast L2 entry
  * @priv: realtek_priv pointer
@@ -310,8 +397,11 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 	 * OS's back. As a trade-off, these will show up as permanent to users.
 	 */
 	uc.is_static = true;
-	/* age greater than 0 adds/updates entries */
-	uc.age = 1;
+	/* age greater than 0 adds/updates entries. D has no EFID, so efid
+	 * is not serialized (bridges are isolated by the port isolation
+	 * masks only). Vendor code writes age 6 for D.
+	 */
+	uc.age = rtl8365mb_is_d(priv) ? 6 : 1;
 	fi = rtl8365mb_get_family_info(priv);
 	fi->l2_uc_to_data(&uc, data);
 
@@ -349,6 +439,38 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
 	fi = rtl8365mb_get_family_info(priv);
 	fi->l2_uc_to_data(&uc, data);
 
+	if (rtl8365mb_is_d(priv)) {
+		struct rtl8365mb_l2_uc found = { 0 };
+
+		/* Do not blind-write: look the entry up first (as the vendor
+		 * code does) so a missing entry is not (re)allocated. The
+		 * lookup and the write are separate table queries, so this
+		 * is not atomic; it relies on FDB operations being
+		 * serialized by the caller.
+		 */
+		ret = rtl8365mb_table_query(priv, RTL8365MB_TABLE_L2,
+					    RTL8365MB_TABLE_OP_READ, &addr,
+					    RTL8365MB_TABLE_L2_METHOD_MAC, 0,
+					    data, fi->l2_entry_size);
+		if (ret == -ENOENT)
+			return 0;
+		if (ret)
+			return ret;
+
+		/* The key has no EFID on family D, so the entry found may
+		 * belong to another port or bridge: leave it alone. DSA only
+		 * programs static entries, so leave a dynamic one alone too,
+		 * as the hardware may have relearned or aged it since the
+		 * lookup.
+		 */
+		fi->l2_data_to_uc(data, &found);
+		if (found.port != port || !found.is_static)
+			return 0;
+
+		/* rebuild the write payload: the read overwrote data[] */
+		fi->l2_uc_to_data(&uc, data);
+	}
+
 	/* it looks like the switch will always add/update the entry,
 	 * even when age is 0 or uc.key did not match an existing entry,
 	 * just to immediately drop it because age is zero. You can still
diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.h b/drivers/net/dsa/realtek/rtl8365mb_l2.h
index a9f9ae4..5bb4e32 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.h
@@ -13,6 +13,7 @@
 #include "realtek.h"
 
 #define RTL8365MB_C_L2_ENTRY_SIZE		6
+#define RTL8365MB_D_L2_ENTRY_SIZE		5
 /* Highest L2 entry size of any supported chip, used for sizing */
 #define RTL8365MB_L2_ENTRY_SIZE			RTL8365MB_C_L2_ENTRY_SIZE
 
@@ -24,6 +25,11 @@ void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
 void rtl8365mb_c_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc);
 void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data);
 
+void rtl8365mb_d_l2_data_to_uc(const u16 *data, struct rtl8365mb_l2_uc *uc);
+void rtl8365mb_d_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
+void rtl8365mb_d_l2_data_to_mc(const u16 *data, struct rtl8365mb_l2_mc *mc);
+void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc, u16 *data);
+
 int rtl8365mb_l2_get_next_uc(struct realtek_priv *priv, u16 *addr, int port,
 			     struct realtek_fdb_entry *entry);
 int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index b83e393..dc436ee 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -437,6 +437,18 @@
 #define RTL8365MB_LUT_PORT_LEARN_LIMIT_REG(_physport) \
 		(RTL8365MB_LUT_PORT_LEARN_LIMIT_BASE + (_physport))
 
+/* Family D LUT configuration */
+#define RTL8365MB_D_LUT_CFG_REG			0x0A30
+#define   RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK	BIT(6)
+#define   RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK	BIT(4)
+/* On family C this address is the per-port EFID register! */
+#define RTL8365MB_D_LUT_CFG2_REG		0x0A32
+/* Written as a whole register, as dal_rtl8367d_l2_init() does in the
+ * vendor API: the field layout and the unit of this value are not
+ * documented.
+ */
+#define   RTL8365MB_D_LUT_AGING_DEFAULT		3000
+
 /* Port isolation (forwarding mask) registers */
 #define RTL8365MB_PORT_ISOLATION_REG_BASE		0x08A2
 #define RTL8365MB_PORT_ISOLATION_REG(_physport) \
@@ -2695,6 +2707,10 @@ static int rtl8365mb_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 static int rtl8365mb_port_set_efid(struct realtek_priv *priv, int port,
 				   u32 efid)
 {
+	/* Family D has no EFID; see RTL8365MB_D_LUT_CFG2_REG. */
+	if (rtl8365mb_is_d(priv))
+		return 0;
+
 	return regmap_update_bits(priv->map, RTL8365MB_PORT_EFID_REG(port),
 				  RTL8365MB_PORT_EFID_MASK(port),
 				  efid << RTL8365MB_PORT_EFID_OFFSET(port));
@@ -3431,6 +3447,23 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
 	return rtl8365mb_cpu_config(priv);
 }
 
+static int rtl8365mb_d_lut_init(struct realtek_priv *priv)
+{
+	int ret;
+
+	/* After the jam table: lookup multicast by MAC (not DIP) and keep
+	 * the CAM enabled.
+	 */
+	ret = regmap_update_bits(priv->map, RTL8365MB_D_LUT_CFG_REG,
+				 RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK |
+				 RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK, 0);
+	if (ret)
+		return ret;
+
+	return regmap_write(priv->map, RTL8365MB_D_LUT_CFG2_REG,
+			    RTL8365MB_D_LUT_AGING_DEFAULT);
+}
+
 static int rtl8365mb_switch_init(struct realtek_priv *priv)
 {
 	struct rtl8365mb *mb = priv->chip_data;
@@ -3520,6 +3553,15 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		goto out_error;
 	}
 
+	if (rtl8365mb_is_d(priv)) {
+		ret = rtl8365mb_d_lut_init(priv);
+		if (ret) {
+			dev_err(priv->dev, "failed to init LUT: %pe\n",
+				ERR_PTR(ret));
+			goto out_error;
+		}
+	}
+
 	if (mb->sds_supported) {
 		ret = rtl8365mb_sds_raise_rate_limits(priv);
 		if (ret) {
@@ -3672,9 +3714,19 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 		goto out_teardown_irq;
 
 	ds->assisted_learning_on_cpu_port = true;
-	ds->fdb_isolation = true;
-	/* The EFID is 3 bits, but EFID 0 is reserved for standalone ports */
-	ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
+	if (!rtl8365mb_is_d(priv)) {
+		ds->fdb_isolation = true;
+		/* The EFID is 3 bits, but EFID 0 is reserved for standalone */
+		ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
+	} else {
+		/* No EFID, so bridges cannot be told apart in the LUT: allow
+		 * at most one offloaded bridge. Bridge numbers are allocated
+		 * system-wide by DSA, so this does not stop a bridge that
+		 * already has a number from another switch from being
+		 * offloaded here as well.
+		 */
+		ds->max_num_bridges = 1;
+	}
 
 	ds->configure_vlan_while_not_filtering = true;
 
diff --git a/drivers/net/dsa/realtek/rtl8365mb_table.c b/drivers/net/dsa/realtek/rtl8365mb_table.c
index f3c8749..6b1323f 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_table.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_table.c
@@ -5,6 +5,7 @@
  */
 
 #include "rtl8365mb_table.h"
+#include "rtl8365mb.h"
 #include <linux/regmap.h>
 
 /* Table access control register */
@@ -16,10 +17,13 @@
 /* Should be one of rtl8365mb_table_l2_method enum members */
 #define   RTL8365MB_TABLE_CTRL_METHOD_MASK	GENMASK(6, 4)
 #define   RTL8365MB_TABLE_CTRL_PORT_MASK	GENMASK(11, 8)
+/* Family D: SPA is 3 bits */
+#define   RTL8365MB_D_TABLE_CTRL_PORT_MASK	GENMASK(10, 8)
 
 /* Table access address register */
 #define RTL8365MB_TABLE_ACCESS_ADDR_REG		0x0501
 #define   RTL8365MB_TABLE_ADDR_MASK		GENMASK(12, 0)
+#define   RTL8365MB_D_TABLE_ADDR_MASK		GENMASK(11, 0)
 
 /* Table status register */
 #define RTL8365MB_TABLE_STATUS_REG			0x0502
@@ -29,6 +33,8 @@
 #define   RTL8365MB_TABLE_STATUS_HIT_STATUS_MASK	GENMASK(12, 12)
 #define   RTL8365MB_TABLE_STATUS_BUSY_FLAG_MASK		GENMASK(13, 13)
 #define   RTL8365MB_TABLE_STATUS_ADDRESS_EXT_MASK	GENMASK(14, 14)
+/* Family D: the address is bits [11:0], there is no EXT bit */
+#define   RTL8365MB_D_TABLE_STATUS_ADDRESS_MASK		GENMASK(11, 0)
 
 /* Table read/write registers */
 #define RTL8365MB_TABLE_WRITE_BASE			0x0510
@@ -59,6 +65,7 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 {
 	bool addr_as_input = true;
 	bool write_data = false;
+	bool is_d = rtl8365mb_is_d(priv);
 	int ret = 0;
 	u32 cmd;
 	u32 val;
@@ -91,7 +98,13 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 		case RTL8365MB_TABLE_L2_METHOD_ADDR_NEXT_MC:
 			break;
 		case RTL8365MB_TABLE_L2_METHOD_ADDR_NEXT_UC_PORT:
-			cmd |= FIELD_PREP(RTL8365MB_TABLE_CTRL_PORT_MASK, port);
+			if (is_d) {
+				cmd |= FIELD_PREP(RTL8365MB_D_TABLE_CTRL_PORT_MASK,
+						  port);
+			} else {
+				cmd |= FIELD_PREP(RTL8365MB_TABLE_CTRL_PORT_MASK,
+						  port);
+			}
 			break;
 		default:
 			return -EINVAL;
@@ -146,8 +159,9 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 	if (addr_as_input) {
 		ret = regmap_write(priv->map_nolock,
 				   RTL8365MB_TABLE_ACCESS_ADDR_REG,
-				   FIELD_PREP(RTL8365MB_TABLE_ADDR_MASK,
-					      *addr));
+				   is_d ?
+				   FIELD_PREP(RTL8365MB_D_TABLE_ADDR_MASK, *addr) :
+				   FIELD_PREP(RTL8365MB_TABLE_ADDR_MASK, *addr));
 		if (ret)
 			goto out;
 	}
@@ -177,13 +191,23 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 		}
 
 		/* If so, extract the address */
-		*addr = 0;
-		*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_MASK, val);
-		*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_EXT_MASK, val)
-			 << 11;
-		/* only set if it is a L3 address */
-		*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDR_TYPE_MASK, val)
-			 << 12;
+		if (is_d) {
+			/* Bit 11 is "TYPE" in the register map, but the entry
+			 * index (2048 hash + 64 CAM) needs 12 bits; the vendor
+			 * code reads [11:0] as well.
+			 */
+			*addr = FIELD_GET(RTL8365MB_D_TABLE_STATUS_ADDRESS_MASK,
+					  val);
+		} else {
+			*addr = 0;
+			*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_MASK,
+					   val);
+			*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDRESS_EXT_MASK,
+					   val) << 11;
+			/* only set if it is a L3 address */
+			*addr |= FIELD_GET(RTL8365MB_TABLE_STATUS_ADDR_TYPE_MASK,
+					   val) << 12;
+		}
 	}
 
 	/* Finally, get the table entry if we were reading */
diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/rtl83xx.c
index ad42c05..cfe7d42 100644
--- a/drivers/net/dsa/realtek/rtl83xx.c
+++ b/drivers/net/dsa/realtek/rtl83xx.c
@@ -602,7 +602,8 @@ int rtl83xx_port_fdb_add(struct dsa_switch *ds, int port,
 
 	/* Bridge ports use bridge.num as EFID, while standalone ports use
 	 * EFID 0. FDB entries for the CPU port follow the bridge EFID due
-	 * to assisted learning.
+	 * to assisted learning. Chips without an EFID in their L2 table
+	 * (RTL8367S-VB) ignore it in l2_add_uc().
 	 */
 	efid = db.type == DSA_DB_BRIDGE ? db.bridge.num : 0;
 
@@ -654,6 +655,8 @@ int rtl83xx_port_fdb_del(struct dsa_switch *ds, int port,
 	/*
 	 * DSA_DB_BRIDGE ports use bridge number [1..N] as EFID, while
 	 * DSA_DB_PORT use the default EFID (0), not used by any bridge.
+	 * Chips without an EFID in their L2 table (RTL8367S-VB) ignore it in
+	 * l2_del_uc().
 	 */
 	efid = db.type == DSA_DB_BRIDGE ? db.bridge.num : 0;
 
-- 
2.53.0

