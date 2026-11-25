Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565473;
	b=ef24L/w5+T5IjsUPcNj0+TX4WzDBuF5H/4rpC6GHVx9mcJzhgr9x5g08/8Y/wjLXTZYT
	 9XMuSCDvucvOEu0/0CNADHHUMPBC6LjhtP5up8f6gaGJeljVHetP/+NqhQDYlEkp7Clov
	 mqKeY1ekiZBrVca+e8QQgL1X3YrEGXsbN44J4GZzTlv1ehqzESpbPDV5i+F5bBrXOTAA+
	 19vYhzVQTZprgq2Kx8BRLdk83okQtQddAjSgDi2hKDiTYAaBPaY8f9gSdLXkvXl7GHoe7
	 5cLPfiUW4nvNcoBvqbRnUXrIg6G/JbD1aTAXa0UtzCZP9gkjfNPmhowHVPFFGmjPqSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565473;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=jK8zmQ6ntuLF1xeVG2JSjcqjT7ZxFgIsGb0vnrteI90=;
	b=OPcMPGAa1cLfPTGt/Z7uftnESCzz5sg2JSwuj2wLyKQx7gAeARLizgWrACQ5q5BgEvn8
	 dGoCPea9Jzw3vv1wQAPyclXh/ivbCBDvNt95JsdPuiKNMmdyH5v0BBWj0StCbEKfA/THw
	 z9Mzxqs1T7wvrTCFm4l2somY6CvrBvjhA/pkvkxcJ3s2w/gVo5KgKqgGA3zCEwmZyzFF8
	 NWSk9jHKb9yiGPYMRs23C9ceHE8DaR+X2SRW99oxwRktY1QLxIuGl97d9d/DITTOlm5mx
	 VcHTcMuniDY8paXzj/76zzgvSDvvOBuaph5RghDHFGT5ZIUWF9BvH47Ay1B54QtxrTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ipyHqVHY;
	arc=none smtp.remote-ip=66.163.186.206
Received: from sonic310-25.consmr.mail.ne1.yahoo.com (sonic310-25.consmr.mail.ne1.yahoo.com [66.163.186.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C32606A33E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08C32606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ipyHqVHY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565472; bh=jK8zmQ6ntuLF1xeVG2JSjcqjT7ZxFgIsGb0vnrteI90=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=ipyHqVHYf6FoeZ0RB16MmTqIbZR3WLaDBXGMEZ1XPadc/o+VsPRmJ+Q/kzsClwoVim5U/5pbkLynE6jS1hDYeLuvTGuH9EOM+I+bEeJjahWcWLBZ1psFuVxFhYLQClceMT+eoe1feCzAGtKHWE6pZV9NI62+GbHDemOKM5C6VajZPGyqJTKX2Xd5YJ4CfqIralXiWKoEK+sW13nxhHlMYv7yqREucxQB654i/b+W86alT0zGW+Y1tS1v/my6E4q4hO639oTSjWTqsUCfaN0Yo9rSeoJwQ+R6ue8aXzhHwchd1NTxfkFS+lLNbXr8H5n1YwPVSYCtNdBJUAdCYytXqg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565472; bh=7NEW6ikAoc45TCz2HCTY+Lidj8NBYbS7ECj0LZwZA4R=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=iJPWG7OHpXMirUPnxqArzbYDC9Bi9nudoXVPiDOoYrasyZY9HELnCeg8UMUOBqxcN/41SWq3tqx7TVP+idrUFGuWoRr8Mr71/4OY/b5h5/CYfdtoypUBJW8u6TbQoE1YaOswvdFdxEJb9/hTgxqx8iGtKnVfgfkYViAYJYHIttooag6rkeWs24RXIttnD+OXfIY/DL/a+iYg42UhE5Yz6luvizzFnIVkVXeVLR1GZkMajLo4aP84+R7KyaV0JWwZSMh31V3SHOTsokN6Z/Ti6YC7xsVEpICAd27mWrj/g5ZC7+WM2gEUZR0zsJtm9IwEsVvq/T4Wa7Q0ZRKZII775Q==
X-YMail-OSG: GRFvDkQVM1nzgtjTfN0XTuixv_1Qceg2RVT5UEeM6puH2Ny_SuU9jrYzGGXIE9B
 G0xd2yG53EwCEE2IGHqU.gKvpYVgq4O8cETBiOw1tdJTHjv5oKQNwQ1AXviwM4eMAJzu1Jjmnbx9
 wXmynTS82HU5PFhg.5T3auNWkmzyxcdvdECNiqTUFHECkT.yuQISFC1.nARtL.Hj.D0xUrzYdycG
 L.lZSQAp1P7sVPOQcoD_a9fpQdfA5PBwLprdz0Fuk.owgv80xE0jd8G5hhapjyduKaFsqJEniFAT
 KbyHBnYR1C2.3hejkmYjSdL_sVqpkq.SFS35H4q3hkkNfkIFu4yDh5asbJnaJNvgy7.lbC_nPUR1
 6NaDllX2BL_tH1p0Vq_KVGxbFWSgY61JJeWFeBxciFODuiGOLNmEV3JsGSjAaoc3SMWyCZlz4q6l
 m4BtrglkGNIck9pghlCjR7bSZsg_tZfGsvpI.4.0fFK9dDB9PdpeLz7Sk1fgmdqkfuHfFkibqu74
 vCfzP77WSarYAsbe0NcPrOKFUK1wK1beOvjASINRsGsAeZbqvhNaOIKDDMHlxhURSJ.JCwNGnLLI
 8RNzH6v88fJ9ZgACP8apeMjnmOv1adTtFF.bCw9_6vrOIQbZRQrvn8e050yyVz2pKi0pFVHNH1RW
 wEb_w2JfXx_c5lf7fHiOYLkqH1KeLxQlqhq9._SFSp.txBCKG8V9d3tI8.1ycuBBJKvvJuQxminM
 Rj05v2w3kW13jejoq7Q9dykCkizJDqXr7WM8rJuVh.Z7ksbVcrQeS7JqSO0ap6Zfmwr0xENbmfZV
 GX5nB8FSh4X21WObV2MBcanUMnaqbxdeXLE500vqe0heHBGT2RB4iphWJu.l32JWggH_XmcvClTc
 loSJyB61Ft3_omsSq93jozKVbM8KLFwkXHhrgbBe9QDjQ8Gqx5evcJ.1FFGPq1VIaLVr5yIewHye
 sx0et0HsR2G.WlabGWwpEmnqBrBVezl9DN3t25COwInBvqq42WaEw71zbOlo5aE3LAjQhDXyQta1
 NuXy8MGMiFvZ8mAF6rK1q3zgfqhS2zXDaKLn6mzSN1BwndUlpZUzvbJH8tUsz5fHiRrvU_C5N_hf
 TmCPpWq2T0OK66BtLP3RDDsZUhtJQ9d_.9fYOt5beyCQVRzEZHFl3CbUOp97v8LMAvf7wwpMuLhw
 USfHXuHoWZpMgOxzEKF8rh5deTzCrK9D32HLfGBYn9O8T54WHSz_3PpXjNROq5dFMh1ENmPEQUD0
 32x2_jBcUFvjAre8YdNu4_jBne5ps0DsKQ6SN4tWbNlGxK6hHyWUavf0HCfe4j711inUzRYdWxXp
 Y3x4V50ihILbj8ycZQlUoB1iFvNZSwzWINHuuiXkjyAyq9OjBZIGiFYg1qr5FT8VAxbnfGhs.qTs
 371VbvIS92CCpGaE0_ZbJZsUq2.vVWsFEhiesd9YMp4RQP1o9MUBkX.291C9_vccBepYzgh6oznX
 e9LN5h976rm8tG1HWDULlgYc0MTpm6X4QortxDLuh7sMY7st2QnosRt9tVK9NsakUISmrpW6azIN
 8p.imw7xjdzSBPuKmXTtKvd9KIp2oNRe3oo20CwmNQJh1Yr1F93DbXuqzVYYmVhKpKCmNB7Y.bOf
 RQkpz.ZF5O5RDc.DK2x81Khj4csJoy6fwPX_BtAcyKyV9NTohpWjBlByKPIhua5LnwAC7d05fYYO
 iIvF5PiOD3nSuebZcWqSIliwoI1J0I0SHn.dHHWdrG_fm7uPFtT9kvfpAMOmkWeOagZXdV9MB_YL
 eP2svRpdRfW6Ru6CxmiDifq3W4XxgChCAhlO5cmJ9qZB0TIz9_m.JIAU7wHHfHZXgCLHihANL839
 6ZAC9S_EC137THo6ZAE2gyJb2hkuoeb_YMlOWF_6zMHBzMzQkZhN4fiOTzEBun0pE_l5yQRuQTrB
 gV4RpnRQKRtpqY.5vV0AD2sAcDwg09OdFYlaNDgHUU7VrSWC.K_03EjxB_ltg7TZVRaiWR6Gv8KB
 5JsMCvD1BT5Ga9fHIp00ODkuphWjXhRztsEoKu1mqccbTN1ee.81ZvRvuaOSQ3D8ESV1OkgfmdOv
 lajCCjh7qJ9AScq4BE.Ft84HZNI6w5bPQm9GlN3Trf24PMkt2xwWEWOT3.6U6bN0_MdXLSS8v5NF
 bJ0iFDW_NmQEpcBgoTOjYogZiumP8pE15rdbIMQDH3NViZtVBp18lM3vPB7zXAmVwKi9vrDpo16f
 .NoLJ1k0F6p2mq5JVacfrbbzIJJtLqK3xr72fcZ2i_XrxSRhlG7EP0TaTInhlY8UbPsu5hLxR4_o
 Tjxp1plsrbcxE3GsIN9ratc6aGuOILGx4tKcKMWAiREEv3x4yqhA-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 82b03fc1-88b8-4361-b6c4-80508273ceff
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:11:12 +0000
Received: by hermes--production-ir2-7c4859dc89-8w8b5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 39b76a0c1a9ccbdb90e9743d8f21fa61;
          Wed, 25 Nov 2026 00:11:07 +0000 (UTC)
Message-ID: <f431815c-e496-49b4-9231-c82694b12032@yahoo.com>
Date: Wed, 25 Nov 2026 01:11:04 +0100
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
Subject: [PATCH net-next v14 12/15] net: dsa: realtek: rtl8365mb: make L2/LUT
 access work on family D
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

The L2 lookup table on family D switches (e.g. RTL8367S-VB) differs
from family C in ways that make the current FDB/MDB code misbehave:

 - An L2 entry is 5 words instead of 6, with a different field layout
   in words 3 and 4 (port, age, static and multicast member bits).
 - There is no EFID and no per-bridge FDB isolation. The register at
   0x0A32, used as the per-port EFID register on family C, is the LUT
   aging timer on family D, so writing an EFID there corrupts it.
 - In the table access interface, the SPA field is 3 bits wide and the
   address register is 12 bits wide, with no address extension bit.
 - Only ports 0..7 are present in the LUT, so the extended port flush
   register, which the L2 code only writes for ports above 7, is never
   reached.
 - A VLAN-unaware bridge reaches the driver with VID 0, where the chip
   learns in SVL. If both standalone ports and an offloaded VLAN-unaware
   bridge share SVL FID 0, a MAC learned or programmed on a bridge port
   is hit by traffic arriving on a standalone port and dropped by the
   ingress port isolation mask instead of flooding to the CPU.
 - Even with IVL enabled in a VLAN-aware bridge, an 802.1Q-tagged frame
   entering a standalone port with a VID used by the bridge performs an
   IVL lookup in that VLAN. Without EFID, hitting a bridge entry drops
   the frame instead of flooding it to the CPU, unless the lookup-hit
   isolation fallback is enabled.

Teach the table and L2 code about these differences. The L2 entry
layout is selected through struct rtl8365mb_family_info, the other
differences with rtl8365mb_is_d(). Family C behavior is unchanged.

Specifically:

 - rtl8365mb_table: use the family D port mask and address width, and
   read the hit address from status bits [11:0].
 - rtl8365mb_l2: add family D unicast/multicast entry (de)serializers.
   The IVL bit is set only for a non-zero VID, so VID 0 produces the SVL
   key (IVL=0, FID=1) and static unicast and multicast entries match the
   ones learned in a VLAN-unaware bridge. IVL_EN of the VLANs follows
   the VLAN filtering state (see the VLAN 4k patch), so the key matches
   the one the chip learns with in VLAN-unaware and VLAN-aware bridges.
   Entries read back with IVL=0 are reported with VID 0. Use age 6 for
   static unicast entries, as the vendor code does.
   Look an entry up before deleting it, so that a missing entry is not
   allocated by the delete. As the key has no EFID, an entry found on
   another port, or one that is not static, is left alone.
   Nothing points to the family D helpers until the family D info is
   added together with the chip table entry in the last patch. Until
   then they are not static and are declared in rtl8365mb_l2.h, so that
   the build does not warn about unused functions.
 - rtl8365mb_main: use family D's port-based FID registers (0x07AC /
   0x07AD + port) in port_set_efid() and port_vlan_filtering() to
   assign FID 1 to the ports of an offloaded VLAN-unaware bridge, while
   standalone ports stay in FID 0. Port-based FID applies regardless of
   the VLAN tag, so it isolates the bridge's LUT entries from
   standalone ports and keeps 802.1Q tagged frames transparent on a
   VLAN-unaware bridge. It is not enabled on the shared CPU port, whose
   TX frames carry an explicit port mask in the CPU tag; assisted
   learning entries added on the CPU port with VID 0 use FID 1 so that
   bridge traffic hits them. It is disabled when a port leaves the
   bridge or when VLAN filtering is enabled on it.
   Enable the lookup-hit isolation fallback (bit 0 of 0x0A10,
   dal_rtl8367d_l2_lookupHitIsolationAction_set() in the vendor API)
   and include each port's own bit in its port isolation mask on
   family D. A LUT hit on a port outside the ingress port's isolation
   mask then floods according to the ingress isolation mask, reaching
   the CPU on standalone ports, including for tagged frames in IVL
   VLANs, while same-port hits are still dropped.
   Add a LUT init step that clears PBFIDEN, sets LOOKUP_HIT_ISO_ACT,
   clears IPMC_HASH and BCAM_DISABLE, and writes 3000 to the aging
   timer register, as dal_rtl8367d_l2_init() does (units of 0.1 s, i.e.
   300 s).
   Do not advertise fdb_isolation and set max_num_bridges to 1: the
   driver reserves FID 0 for standalone ports and assigns the single
   fixed FID 1 to the offloaded VLAN-unaware bridge, instead of
   allocating FIDs 1..3 across several bridges. DSA allocates bridge
   numbers system-wide, so this does not stop a bridge that already has
   a number from another switch from being offloaded here as well; such
   bridges share FID 1, a known limitation. The bridge number is also
   what port_set_efid() uses to tell that a port is in an offloaded
   bridge, so max_num_bridges must stay non-zero.

Register layouts follow the vendor RTL8367D API; the code itself is an
independent implementation.

Base L2/LUT handling and port-based FID isolation in FID 1 were tested
by Gustavo Foletto Mora on a TP-Link EX511 v2 (RTL8367S-VB, CPU port 6
over 1G SGMII to an IPQ5018), including register readback across live
vlan_filtering toggles and bridge leave, and unicast between standalone
ports through a VLAN-unaware bridge. The lookup-hit isolation fallback
(0x0A10) with self-port isolation masks was tested as well (no frame is
sent back out of its ingress port), including a VLAN tagged on two
bridge ports with the hosts on standalone ports of the same switch.

Reported-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-6708118180
Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/realtek.h         |   4 +-
 drivers/net/dsa/realtek/rtl8365mb_l2.c    | 144 +++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_l2.h    |   9 +
 drivers/net/dsa/realtek/rtl8365mb_main.c  | 199 +++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_table.c |  44 +++--
 drivers/net/dsa/realtek/rtl83xx.c         |   5 +-
 6 files changed, 384 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
index fda385e..cee8e65 100644
--- a/drivers/net/dsa/realtek/realtek.h
+++ b/drivers/net/dsa/realtek/realtek.h
@@ -79,7 +79,9 @@ struct realtek_priv {
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
index cd5b333..162082e 100644
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
@@ -240,6 +255,96 @@ void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
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
+	/* A VLAN-unaware bridge reaches us with VID 0. Its ports use
+	 * port-based FID (RTL8365MB_D_UNAWARE_BRIDGE_FID) so the chip learns
+	 * in SVL (IVL=0, FID=1), isolated from standalone ports in FID 0.
+	 * Use the same key here so static entries match the learned ones.
+	 * Only a real VID selects IVL. IVL_EN of the VLANs follows the VLAN
+	 * filtering state (see rtl8365mb_d_vlan_4k_refresh_ivl()), so this
+	 * matches the key the chip learns with. An entry read back with
+	 * IVL=0 and FID 0 is written back with FID 1: the driver only
+	 * creates SVL entries in FID 1, FID 0 is used by standalone ports,
+	 * which have no FDB entries programmed by DSA.
+	 */
+	bool ivl = uc->key.ivl && uc->key.vid;
+	u16 id = ivl ? uc->key.vid :
+		       (uc->key.fid ? uc->key.fid :
+				      RTL8365MB_D_UNAWARE_BRIDGE_FID);
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
+	/* key.vid and key.fid share storage; with IVL=0 the field holds the
+	 * FID, and keeping it as read makes mc_to_data() rebuild the same key.
+	 */
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
+	/* Same as for unicast: VID 0 means a VLAN-unaware bridge, use SVL
+	 * with RTL8365MB_D_UNAWARE_BRIDGE_FID. key.vid and key.fid share
+	 * storage, so a non-zero FID read back by data_to_mc() is preserved.
+	 * An entry read back with IVL=0 and FID 0 is written back with FID 1:
+	 * the driver only creates SVL entries in FID 1, FID 0 is used by
+	 * standalone ports, which have no MDB entries.
+	 */
+	bool ivl = mc->key.ivl && mc->key.vid;
+	u16 id = ivl ? mc->key.vid :
+		       (mc->key.fid ? mc->key.fid :
+				      RTL8365MB_D_UNAWARE_BRIDGE_FID);
+
+	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);
+	rtl8365mb_l2_mac_to_data(mc->key.mac_addr, data);
+	data[3] = FIELD_PREP(RTL8365MB_D_L2_MC_D3_VID_MSK, id) |
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
@@ -310,8 +415,11 @@ int rtl8365mb_l2_add_uc(struct realtek_priv *priv, int port,
 	 * OS's back. As a trade-off, these will show up as permanent to users.
 	 */
 	uc.is_static = true;
-	/* age greater than 0 adds/updates entries */
-	uc.age = 1;
+	/* age greater than 0 adds/updates entries. D has no EFID, so efid
+	 * is not serialized (offloaded VLAN-unaware bridge ports use FID 1
+	 * via port-based FID). Vendor code writes age 6 for D.
+	 */
+	uc.age = rtl8365mb_is_d(priv) ? 6 : 1;
 	fi = rtl8365mb_get_family_info(priv);
 	fi->l2_uc_to_data(&uc, data);
 
@@ -349,6 +457,38 @@ int rtl8365mb_l2_del_uc(struct realtek_priv *priv, int port,
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
index a9f9ae4..449ecca 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_l2.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_l2.h
@@ -13,9 +13,13 @@
 #include "realtek.h"
 
 #define RTL8365MB_C_L2_ENTRY_SIZE		6
+#define RTL8365MB_D_L2_ENTRY_SIZE		5
 /* Highest L2 entry size of any supported chip, used for sizing */
 #define RTL8365MB_L2_ENTRY_SIZE			RTL8365MB_C_L2_ENTRY_SIZE
 
+/* SVL FID used for an offloaded VLAN-unaware bridge on family D */
+#define RTL8365MB_D_UNAWARE_BRIDGE_FID		1
+
 struct rtl8365mb_l2_uc;
 struct rtl8365mb_l2_mc;
 
@@ -24,6 +28,11 @@ void rtl8365mb_c_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc, u16 *data);
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
index cf06bc9..bf508ed 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -437,6 +437,33 @@
 #define RTL8365MB_LUT_PORT_LEARN_LIMIT_REG(_physport) \
 		(RTL8365MB_LUT_PORT_LEARN_LIMIT_BASE + (_physport))
 
+/* Family D port-based FID registers (used to isolate an offloaded
+ * VLAN-unaware bridge in FID 1 from standalone ports in FID 0)
+ */
+#define RTL8365MB_D_PORT_PBFIDEN_REG		0x07AC
+#define RTL8365MB_D_PORT_PBFID_BASE		0x07AD
+#define RTL8365MB_D_PORT_PBFID_REG(_physport) \
+		(RTL8365MB_D_PORT_PBFID_BASE + (_physport))
+#define   RTL8365MB_D_PORT_PBFID_MASK		GENMASK(1, 0)
+
+/* Family D LUT lookup-hit isolation action: when set, a hit on a port
+ * outside the ingress port's isolation mask floods according to the
+ * ingress isolation mask instead of dropping the frame.
+ */
+#define RTL8365MB_D_LUT_LOOKUP_HIT_ISO_ACT_REG	0x0A10
+#define   RTL8365MB_D_LUT_LOOKUP_HIT_ISO_ACT	BIT(0)
+
+/* Family D LUT configuration */
+#define RTL8365MB_D_LUT_CFG_REG			0x0A30
+#define   RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK	BIT(6)
+#define   RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK	BIT(4)
+/* RTL8367D_REG_LUT_CFG2 in the vendor API: the LUT aging timer, in units
+ * of 0.1 s (dal_rtl8367d_l2_aging_set() writes seconds * 10). On family C
+ * this address is the per-port EFID register!
+ */
+#define RTL8365MB_D_LUT_CFG2_REG		0x0A32
+#define   RTL8365MB_D_LUT_AGING_DEFAULT		3000
+
 /* Port isolation (forwarding mask) registers */
 #define RTL8365MB_PORT_ISOLATION_REG_BASE		0x08A2
 #define RTL8365MB_PORT_ISOLATION_REG(_physport) \
@@ -2467,8 +2494,63 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
 			goto undo_egress_mode;
 	}
 
+	if (rtl8365mb_is_d(priv) &&
+	    dsa_port_bridge_dev_get(dsa_to_port(ds, port))) {
+		/* PBFID is ignored while PBFIDEN is clear. Write them in the
+		 * order that leaves the port in its previous state if the
+		 * second write fails, and never leaves it with port-based FID
+		 * enabled and FID 0: PBFIDEN first when enabling VLAN
+		 * filtering (disabling port-based FID), PBFID first otherwise.
+		 */
+		if (vlan_filtering) {
+			ret = regmap_update_bits(priv->map,
+						 RTL8365MB_D_PORT_PBFIDEN_REG,
+						 BIT(port), 0);
+			if (ret)
+				goto undo_refresh_ivl;
+
+			/* Best effort, PBFID is ignored from here on */
+			(void)regmap_update_bits(priv->map,
+						 RTL8365MB_D_PORT_PBFID_REG(port),
+						 RTL8365MB_D_PORT_PBFID_MASK, 0);
+		} else {
+			ret = regmap_update_bits(priv->map,
+						 RTL8365MB_D_PORT_PBFID_REG(port),
+						 RTL8365MB_D_PORT_PBFID_MASK,
+						 RTL8365MB_D_UNAWARE_BRIDGE_FID);
+			if (ret)
+				goto undo_refresh_ivl;
+
+			ret = regmap_update_bits(priv->map,
+						 RTL8365MB_D_PORT_PBFIDEN_REG,
+						 BIT(port), BIT(port));
+			if (ret)
+				goto undo_pbfid;
+		}
+	}
+
 	return ret;
 
+undo_pbfid:
+	/* Only reached when enabling port-based FID, PBFIDEN is still clear */
+	(void)regmap_update_bits(priv->map, RTL8365MB_D_PORT_PBFID_REG(port),
+				 RTL8365MB_D_PORT_PBFID_MASK, 0);
+undo_refresh_ivl:
+	if (rtl8365mb_is_d(priv)) {
+		/* DSA updates dp->vlan_filtering only after this callback
+		 * returns, so old_ivl is the state before the change. Restore
+		 * IVL_EN only if the change flipped it; refresh_ivl() would
+		 * see no flip here and do nothing.
+		 */
+		bool old_ivl = rtl8365mb_d_want_ivl(ds, -1, false);
+		bool new_ivl = rtl8365mb_d_want_ivl(ds, port, vlan_filtering);
+
+		if (new_ivl != old_ivl) {
+			mutex_lock(&priv->vlan_lock);
+			(void)rtl8365mb_d_vlan_4k_set_ivl(ds, old_ivl);
+			mutex_unlock(&priv->vlan_lock);
+		}
+	}
 undo_egress_mode:
 	/* The previous state was the opposite of the new one, see below */
 	(void)rtl8365mb_port_set_vlan_egress_mode(priv, port,
@@ -2693,6 +2775,46 @@ static int rtl8365mb_port_pre_bridge_flags(struct dsa_switch *ds, int port,
 static int rtl8365mb_port_set_efid(struct realtek_priv *priv, int port,
 				   u32 efid)
 {
+	/* Family D has no EFID (0x0A32 is RTL8365MB_D_LUT_CFG2_REG). Instead,
+	 * assign port-based FID 1 to offloaded VLAN-unaware bridge ports
+	 * (efid != 0 and !vlan_filtering) so their SVL entries do not collide
+	 * with standalone ports in FID 0.
+	 */
+	if (rtl8365mb_is_d(priv)) {
+		struct dsa_port *dp = dsa_to_port(&priv->ds, port);
+		bool enable = efid && !dsa_port_is_vlan_filtering(dp);
+		u8 fid = enable ? RTL8365MB_D_UNAWARE_BRIDGE_FID : 0;
+		int ret;
+
+		/* PBFID is ignored while PBFIDEN is clear, so write them in
+		 * the order that leaves the port usable if the second write
+		 * fails: PBFID first when enabling, PBFIDEN first when
+		 * disabling.
+		 */
+		if (enable) {
+			ret = regmap_update_bits(priv->map,
+						 RTL8365MB_D_PORT_PBFID_REG(port),
+						 RTL8365MB_D_PORT_PBFID_MASK,
+						 fid);
+			if (ret)
+				return ret;
+
+			return regmap_update_bits(priv->map,
+						  RTL8365MB_D_PORT_PBFIDEN_REG,
+						  BIT(port), BIT(port));
+		}
+
+		ret = regmap_update_bits(priv->map,
+					 RTL8365MB_D_PORT_PBFIDEN_REG,
+					 BIT(port), 0);
+		if (ret)
+			return ret;
+
+		return regmap_update_bits(priv->map,
+					  RTL8365MB_D_PORT_PBFID_REG(port),
+					  RTL8365MB_D_PORT_PBFID_MASK, 0);
+	}
+
 	return regmap_update_bits(priv->map, RTL8365MB_PORT_EFID_REG(port),
 				  RTL8365MB_PORT_EFID_MASK(port),
 				  efid << RTL8365MB_PORT_EFID_OFFSET(port));
@@ -3429,6 +3551,38 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
 	return rtl8365mb_cpu_config(priv);
 }
 
+static int rtl8365mb_d_lut_init(struct realtek_priv *priv)
+{
+	int ret;
+
+	/* Ensure port-based FID is disabled on all ports at startup */
+	ret = regmap_write(priv->map, RTL8365MB_D_PORT_PBFIDEN_REG, 0);
+	if (ret)
+		return ret;
+
+	/* Flood according to the ingress isolation mask when a LUT hit
+	 * resolves to a port outside that mask, rather than dropping.
+	 */
+	ret = regmap_update_bits(priv->map,
+				 RTL8365MB_D_LUT_LOOKUP_HIT_ISO_ACT_REG,
+				 RTL8365MB_D_LUT_LOOKUP_HIT_ISO_ACT,
+				 RTL8365MB_D_LUT_LOOKUP_HIT_ISO_ACT);
+	if (ret)
+		return ret;
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
@@ -3518,6 +3672,15 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
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
@@ -3621,12 +3784,16 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 
 	/* Configure user ports */
 	dsa_switch_for_each_port(dp, ds) {
+		u32 iso_mask = upports_mask;
+
 		if (!dsa_port_is_user(dp))
 			continue;
 
+		if (rtl8365mb_is_d(priv))
+			iso_mask |= BIT(dp->index);
+
 		/* Forward only to the CPU */
-		ret = rtl8365mb_port_set_isolation(priv, dp->index,
-						   upports_mask);
+		ret = rtl8365mb_port_set_isolation(priv, dp->index, iso_mask);
 		if (ret)
 			goto out_teardown_irq;
 
@@ -3641,13 +3808,17 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 	 * DSA ports.
 	 */
 	dsa_switch_for_each_cpu_port(dp, ds) {
+		u32 iso_mask = downports_mask;
+
 		/* Use the first CPU port as trap_port */
 		if (cpu->trap_port == RTL8365MB_MAX_NUM_PORTS)
 			cpu->trap_port = dp->index;
 
+		if (rtl8365mb_is_d(priv))
+			iso_mask |= BIT(dp->index);
+
 		/* Forward to all user ports */
-		ret = rtl8365mb_port_set_isolation(priv, dp->index,
-						   downports_mask);
+		ret = rtl8365mb_port_set_isolation(priv, dp->index, iso_mask);
 		if (ret)
 			goto out_teardown_irq;
 	}
@@ -3670,9 +3841,23 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
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
+		/* No EFID; FID 0 is used by standalone ports and FID 1 by the
+		 * offloaded VLAN-unaware bridge via port-based FID, so allow
+		 * at most one offloaded bridge. The bridge number it gets is
+		 * what rtl8365mb_port_set_efid() takes as "offloaded" to
+		 * enable port-based FID, so max_num_bridges must not be 0.
+		 * Bridge numbers are allocated system-wide by DSA, so this
+		 * does not stop a bridge that already has a number from
+		 * another switch from being offloaded here as well; such
+		 * bridges share FID 1 (known limitation).
+		 */
+		ds->max_num_bridges = 1;
+	}
 
 	ds->configure_vlan_while_not_filtering = true;
 
diff --git a/drivers/net/dsa/realtek/rtl8365mb_table.c b/drivers/net/dsa/realtek/rtl8365mb_table.c
index f3c8749..da90031 100644
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
@@ -57,6 +63,7 @@ int rtl8365mb_table_query(struct realtek_priv *priv,
 			  enum rtl8365mb_table_l2_method method,
 			  u16 port, u16 *data, size_t size)
 {
+	bool is_d = rtl8365mb_is_d(priv);
 	bool addr_as_input = true;
 	bool write_data = false;
 	int ret = 0;
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

