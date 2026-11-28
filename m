Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824532;
	b=ppoO4RiiZUgayNmw4BdbVJQqksElaOHSUVLUiRbKxfxgIQPaT5UF+PYj1BTxPaaJyXo1
	 hpt3knIgWy9WxbvQEkKZ1/y/fvEoj2kH0X3omg776kVvM/PKFn6ECat1z0SybwelN3w5l
	 jqpGvVRwEBdEdyJH8FPM+nqzqeMhF6e0zNwzTb9c7L7wDoJGZv3cbxSuzXHnwWBi4VmDM
	 /N38g5Xrjah3uKSJos7AK34lvgpcxhJlU2I4LKiikXbBAUVaJbuwzu8WHjE0pW+napjY9
	 weXyBeRXVJ9oPnQFUXRUFHLAy8KnHL/S4Up9tf+v9LzOYly81kvVQekWyz87CEEcCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824532;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=n0OGv5CIgwq1ZMolAjTE+jVmgGcYdGtRrOSCsigCedU=;
	b=GIKgevK9Wv7lYYAUE9qvu4deiWAkyb0/0TdXeAUCGCL/rqLm0YpiFeJWH4t2SgG5diE6
	 m5dCtWsYqRDyT1rUwcxRezzfV51llciGuNXO9f9xrXdFsWs/08K4aifSr9+/sOAmK60Ep
	 F5sjg68IhShEL7lq+PoschQfmjgiexUd9fLT5wxF7Hl7oOB9uyMiiEQlcOCXtyg4yT7qt
	 DL/kfVQnmN8YmeXSLUu9kA9TzHwExTdQ4Tgr23RGTaTbOkflREhz/pdv+616CZMPuUqQI
	 /k87hYetuV2wBL24Wi9wRv6HfIGwBeIfuXIx6mpu1PdTh/Ankz4jhaUnEwGOVzZ52rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b="fB7/aApj";
	arc=none smtp.remote-ip=66.163.184.148
Received: from sonic309-22.consmr.mail.ne1.yahoo.com (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3782606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3782606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=fB7/aApj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824530; bh=n0OGv5CIgwq1ZMolAjTE+jVmgGcYdGtRrOSCsigCedU=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=fB7/aApj9sKdP/pZ8ZuvcXAuF95kaEQ/Pi3P4E1pAThwFiALr7fyPBYXmsYCvxuqklMi0CZr8cUxHn0pZFuuNwiIqBSz4dVd66Vgopv+Cc7NqhRfZS9zJAQk+xtILHLTq6MVvUsnABrFimfQkwSLDJhAxR5YkUwcoNjC3L0+maA4FJXA7LnzwFS8Y+DuZeqSSPCgSMogVwHOOfxpsuSkdfVUW017zlNH/1hWR9cCVNHpYSkesbggvWPrVSRBZriMoxEg5/IuqNGKSVP2Fi21FWtHWVrSG8i4cgW9fRAoFUwkXjlgiCUfbGt0PWqT0cmOpA8fcK5LVhMoaprCFkEeBg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824530; bh=AYPUyDCOW4lZfuuPXBGPNgX4uz0GvBkEdUPutNYQcE0=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=LCfkE5XhwAoFOG122pvw31q6Vkv8Qib7lzbvmC3eCMHDEsm+Bw7+jnx1CgVMTtKLTcI1MAaUjRXEWi9vShJ+KPySFG3+E9tJxj883owgm3dQwdINXvsGHtRxjJuewCMgAIbj+FxTSnV0baDEbUEcDmbw5YzSAzMPabKmoVAXCCpEzqjn3j7NJ7pJEE0Yn2YmLSO1aMAzCuGsHyNyfHNI4Lp9YGJLAforZnyF26kQRJIVqvSrB0AgR5oZytJxs3HMoL4ZP1llBPKHgzUpAelBoCM4q1cEoEQ4ARXYhvtu0ldHplQGaXapgM7Pd/ake/ChTE6ae2yrSLpqbiukdVj8BQ==
X-YMail-OSG: vj.oGIMVM1nZ7YgzevU9Q0PQxknCYpxWUmkF0qBQivhE0GdoH94jd1UTqWDyHUH
 GedqjlxGriW0rQeJZIE9vQjnGwYkUIdyRsqGX8Jgj0IL05XUSc0.rtHk38_bcVmLiLVcPslTciuj
 dTFlxq4z4zQNx76SfMPzCu3Yx.UuwmxrfGDMq2jDqSZJsddObQ0sNyHHTyljMi4mR_Wwl2iwJBZV
 obLqhA2C96c2Jkw_c6qgmPIIVPU.QTNGU2nV0uCafod9KHff.OVriEPInJFXCdjkFbBv4GjB5.x0
 tunT5qFEbcdMfl6YyZXVFsiOJPExLv9XS6AaHZ8B4awew7qReBXikL1t0fHiS6K7SegbzKr4bgwg
 edTZHgUAdrzVY_.x8ZH0pItwHdzIbu1H9sZlSWzdMKqajoyAfrtt1zX_eFHaOyDA73qPT5zG5G7.
 I6oZG4CaBKyy9HU.XjUsQW_osNGhodg6J7pydImVlC8KrP.8e7CtKs.z012tLL2Od0od4_pbESNa
 bJgRkEfbndrtp9PnfbrXn8Uy_FiMXHBpJclDSqs4qUYLCT5l3xTOpM2Nzn35s5VVz99VcOD4ky7I
 rIAhYuD4Nvm5HBo16IGCMSmk1q3LbJNQ7QrpeNtjs3yMkJfWtkoV57EDM3sBy_qFgAMxPbisS133
 YMBeGj87artPivv1222SRcbFbzYe1DeIhbJDrwOTXkP5W0N3Ak9JhIz5mBoVUiUxAEzkSIUXoSpx
 AdCgQl0W5jV.iOR626GqY6ASmhNTIVF8424HYP0iryh4hlr2hj.PnwK9kxf07LC0b4dMSoNpEIlS
 oM5E2Uw2Fd56jsEo4qXU_UWAaPNmgaHEdLl4aD2g9SHkPzqIgrSNOUTb47N8gVdEGXJnrV8xQdiO
 r90goOkZefjAEDW.AN3DJtaOTp1FjYW4uP.iZWbyeLj.seaEK.XPcKe_fJhwH3qrooktcA76o7pb
 dvucHIuMOWJuKuJle5B9kfMf6QO8DILdf.fnuD2EZggTVdCbJ5GCy_wnl_ogtQbN9ht0jTT6BBYr
 qnDcPd92GTuGZi_4tpOWnD2v0cHCa7So6VjaJJ5pfCCqWi2XuGF9Q6OlVnuFyBoVI4G8BNMB_oxQ
 Jo3XGBjnudHdD2KSs1C5fG8ZlT8J47n42BboXcxTzmAXLHOECC0Ezbe8ByCDPDap2EPwt1_3k4N9
 uRqvtEFZWcjb6H6AwArSc6ehB2t7vIVsH7I.CUVzsh5EpEkfQ.DL5zBR8ulNqItKmOrEejImWvso
 v0KEJAXGEAsH7myfHH2Eoss1gSdrelFXwiTH6.WoIlXGDlghTZRoJMfsQPfLFlDceNGd2oLkHFWy
 40hv8kraIcv9AaWF31qMPUgLRQlryJmmHWbdLnMPmak4Dnz0F.x1rdCGG4wfIaM6EIfeFMkhq.FP
 orGuzyHy_tq.5OdENvE95eaWHjG1aaDhg9Z09UGwWxVo7T2AeiXZzUEtt1_ycMT1A4v6zpNEk1OE
 cfwVG6xFjySsDkKUpIwwhC_WDSZiO3IX88bVY1do5tNfRsphg2725yuptWw7qI519Qlwg70FIX2M
 KxAELbMHKNlyC1c_CGJc2IOgx0J6r98Pqc1g06Ngx2o2sNMBqH5tNkx3W_hZ_QkATLlH0CPKhBPO
 oxV1TFxj61TQx7GNOhwHJTwG9fDAq6RmpsjHTkOHDyLjhSttDslxbuF_CrRc_13hzJoJJMCrLwoB
 aEnRv5EQ1kXFavWZL5r.HMDFeHOCqE0RbTgM3oNYaj1U3WdmSuih1RqoDa_W62w5uCIyaJaO6Enx
 mp0YapFLcC6Y3yhdwXJ9jvtkTjFXcx5fUlJKxweF17kZ81uBIPND.lJn0MuHYS80NhbI981wGBzJ
 1SQCNqYI9LY0o9R2Un7Ifpgl0lPtGUsWpFIun4TlbeoLaSRa9dAy0nY.MCjskLUxyoRBa4ELZwmf
 n5soNUOAzNb4wWKzMvwZZWiimSPU__n6WOrErI8Km8dxJ5s3CA20x6bcJmQY6MbA6qAGfCbFjQLG
 m.bVUM1bJvc.iQMwexVdWOSONMAON7sTMnohQlT8laQHAO5W39ubeW3VnsTWNVXEbwUqOfIb91xU
 fZCX7n1Ee2toRYVVIH9AVTb8QWNVPaky.KJHnjF3b7TzYvEvQeF6iuTyy.4Tz_pxdy499yxQ5dzt
 gy6YPVsUqfntOS3cd_.5jr5.eunZsddTGAUiWB9_4mXeupy3Z7TX3Vyh7oVMsx3Rsr_rHNDPbf4H
 m23X9N6BXaKKErV1UWDAmKbSELaOU1dzLe_lYq4copFTsB6Vr7NrNf7i3Vs63oHfk9PPSp4xAd9Z
 KN3_b91qx9ovNvpXSewXIKSARD9fN_TaTToDS6EN4_Si_z1or
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: fb465204-05c5-45e9-ab9b-efb8389ea0d0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:08:50 +0000
Received: by hermes--production-ir2-7c4859dc89-cgshs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8e7c74dbd92deca16cfd6e44ee1d9a2f;
          Sat, 28 Nov 2026 00:08:47 +0000 (UTC)
Message-ID: <733ae36f-3bc9-4fd0-922d-0c0bf18e9ae1@yahoo.com>
Date: Sat, 28 Nov 2026 01:08:45 +0100
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
Subject: [PATCH net-next v15 12/15] net: dsa: realtek: rtl8365mb: make L2/LUT
 access work on family D
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
   driver reserves FID 0 for standalone ports and assigns fixed FID 1
   to offloaded VLAN-unaware bridge ports, instead of allocating FIDs
   1..3 across several bridges. This limits the switch to allocating one
   new bridge number. DSA allocates bridge numbers system-wide, so a
   bridge that already has a number from another switch may also be
   offloaded here; VLAN-unaware bridges in that case share FID 1, a known
   limitation. Conversely, if bridge number 1 is already held by a bridge
   that does not span this switch, a new local bridge cannot get a number
   in the advertised range and remains software-forwarded. The bridge
   number is also what port_set_efid() uses to tell that a port is in an
   offloaded bridge, so max_num_bridges must stay non-zero.

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
 drivers/net/dsa/realtek/rtl8365mb_main.c  | 201 +++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_table.c |  44 +++--
 drivers/net/dsa/realtek/rtl83xx.c         |   5 +-
 6 files changed, 386 insertions(+), 21 deletions(-)

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
index c81ac17..7062c58 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -440,6 +440,33 @@
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
@@ -2508,8 +2535,63 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
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
@@ -2734,6 +2816,46 @@ static int rtl8365mb_port_pre_bridge_flags(struct dsa_switch *ds, int port,
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
@@ -3470,6 +3592,38 @@ static int rtl8365mb_change_tag_protocol(struct dsa_switch *ds,
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
@@ -3551,6 +3705,15 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
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
@@ -3654,12 +3817,16 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 
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
 
@@ -3674,13 +3841,17 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
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
@@ -3703,9 +3874,25 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
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
+		 * bridges share FID 1 (known limitation). If bridge number 1
+		 * is already used elsewhere, a new local bridge remains
+		 * software-forwarded.
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

