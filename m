Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340733;
	b=BzvtMPJ6cOShip8rSSdXRQDEP5Kq43zfhYwLujmD3EBG0sHfpq/ULk0d5ebtC4004GfY
	 tisKxPsQABEtROWh8sE1nS3b2GQIsQowlXr6YXcG+CgdzdOVrB8cy0Qx6tkKbWIO+Lx31
	 Kj9uJCd/tgeLPip6vVec6SkdB9cy3N8lZfEXjtBoZHsrNmQbO2ugQE/HBRtVGwivt0T32
	 dutjYF7dK3UZEi+ZQpUMYSO2m0p3UT3Zbq9hGaRAz6jCVV5P9xUpODHBnr2oM3uG9V/IL
	 BuocZt4XHR272iig4GWkbkuN5MPUpxL6+GFXLu9stKPIqO4j6xBTY7iR2SciR7l6VCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340733;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=4FGI23XUsLXxELiulNZW06tlz1jffMoDDng/tZdEIlo=;
	b=Mq6GV7vRGEPDVksLk5jB043stXoYzpU0dW733thHBxu6tDX+wrX/0gyBi1Pwe4G2tLlt
	 +xtwRytzB+jsZj90DnfCVxzQIoazwqyufdaW54qr7OTaV54l4OIJqmEiIwLzn2mBE7hj8
	 G6f29rRcF3iuf7hdD6rBoOZUw+bWPjknOOsV75wVVJrNWHWvB2XIuXegIZplSXMZ+Jxtu
	 kVJ4ek9akgZY/cmnCt1O4ch5wOX3wsSvrjmjL7bz8OxlwvoA0lvXCXKMnGkYzCpTCu7mw
	 fiGnXeoN2wsldKaqDGDoPNPwpF4y7JYujcuRgUVecMZ8ShgG4wASKsnknbKJSp2S7Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rESp+ZXJ;
	arc=none smtp.remote-ip=66.163.184.45
Received: from sonic317-34.consmr.mail.ne1.yahoo.com (sonic317-34.consmr.mail.ne1.yahoo.com [66.163.184.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5FF606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rESp+ZXJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340732; bh=4FGI23XUsLXxELiulNZW06tlz1jffMoDDng/tZdEIlo=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=rESp+ZXJNOXA/Ap7+asIYBLPNSfwUsXAu0jeHXDQ0S0H0cJNeRFZ3lUeuts3jjmqmgh/VoQTx5wljuSoxTWkZs+sSBqIowpn+BsSUcTCYivqwTpm5390x1fQXAS6ruqeYNVZMuQ0yIomNhxE/vb6a2zejap7c7CuWTmqWCMRpdLnrwfU3irWSWVO4sw53G046fWG0sgt4eIOpx1rIdNxpJ0q45Nu2YJILJpZ24eogWpQxch59v9irWAkUviSRScRldXzlqWQGoggMmBdWDyLDZOWKg7m/tuo9y8Sk8IG7Hmim5/Kb4vgI+xGNA9zXfszgb/LFNVRS3uuQhBAZIrDsA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340732; bh=kBWZXPIoSGZJhrlfXnHAZbq7C1zdH/nzWMK8MZXUMrY=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=FsSfBJgliEOawGRPH65W4oqZgkDRLwBX4eCa+S7DqUTk5WRvQaZ5LIjOumKI4azJ3Th1Ov9WCk268NNoWUMPap4BZWqo1qQiMd4KgjL8Awx129GP03bWscow2oHI6eeqSwuKSGypBmSCwp6+tLZhiYcSnV0ugdFtXSeBsg3bOjQdTm4bwlsFGPYTNvUXiXyZH5doK7BjeWhH1uc7PIsyv1Xsk+JGHsYTvr13XUBnEQpHTi5WTLBynWGufv8ZGanzfps6uot+P6dnDC5EInbRK7oscflyMSJY190D09q7t5XprQrxoLs/UgSNEbRCp3rNkQzj+LH/GWCLepN7bci6YA==
X-YMail-OSG: XXxscE4VM1nvXax0gF_yNIWYSpeesu4wFIXRJoIDAZvMfuOpRpnff0MYEyxittH
 vOp2HEyCgcteSLcGEnIjl8LSlEqZfNVZDaU7JV4vN3IYGl4WHSqd4XmWql2rKmK4SrYiYEWKkB4m
 VJdeOeUGhMhiti8ZWitmsABdiznev8xTV1iETn_NlIeZJs18FQsJYzt8sWts13rpcl11R7sGb_nG
 nCgV.Pcsj5PKbr9o5rxYJLSLwg0cMQlOCj0_eLel0lEODzAmowTQsy8rQaQRonamWc172YFGlezE
 _EMqhfITKC4Wu7508bYHkKNKFNqMIrbMqwyPAlUM001T97GEC5t7pKgRcKApgR3TGR8EomUA2pb6
 crRW7RvZMOUCz90RTQzh3581dftO9XzT43yJtFw2LOg2ELYa8bHSb27NaB1bcrc_1WVgN9s1DYgZ
 ELgi0C3XqYyzHdqo8Bw5EEpNccTBqMIGofLtx0ul0XExkRgJef3h_AUZh.J_UZHgfz8BaKCRU9hX
 EdwjGwNdIUI6SDPcQ8fwWbHUl_6M29kcrjc9xJOTCl0Cw41lkmSEJpVEeguMh_jUtL_yzwa4v1Xv
 lhN7k94EtBpfIMNTr4GQls_Vifh5lgtoTvpJIku5yPs.mIdXR.QPU_LxAeec7Y._c41E7auAGaRU
 W17mj0DyaadpslE6Mk1I5IcSKRMM86X5lLnxpaWoSNeu2_wqOU1NS7i8zWt6nWt7i_N2XeybgV4C
 bo4WJoFYhlYKC6DioV7wwMJlO6e15ry_Ext2.fcT7WMNA_hJToAxH_r_73sMTMYG5ibMjirQ.a5w
 eW9uLLzhZMCdHG4f6ophFq7bF2M5XOcZj9jfiDI1w8HuY8RaexlC4y9sNgtpKdxPz9l5Wi53mf4U
 CEbe5ljfWOHYdAH28zlYmFaNYyUdJdlBBNmPRrDmCbSVMgioaXLD5ARLAR2NN2FQJnj4.MRTpsLs
 oawA3l.9bjkA4oVvl3EHszf0XAm9AeRGIYKsK91dJ3T23lrgr0pnvewdTOL.k4hK4sSkLDAAQHn1
 VcCkyguu1_9Eg1tuZCRWmlFBWGwYe5SgO_GsjSxBgF..rS29kVmoZKif04mjxgiC9EixyRczEnq4
 Y4jewve53koBkc.XoZNwWDggXpnfCwT.b3SWB1u3R59jeLkuduAJurB5R_RQOOADCdhfCGS_vfuu
 U2QfUESuSO0xYnFEUiLcM6yhRcezXMNVKTpwEG6CP7DYMIYMAQuAF5eGQLbH2lFnvLw6VAlq7dlv
 CWwmzOYwlVZyN2og9q3ZmPPyC.Jc.EyIRwSUVMlxHsMlUyPHWPKRNn6rxe3DtUqo72wtdMTtriSY
 wOs4AYxK_BeFj9HG_O3BFxnU8lnfh8GzvTycSHMJTqhd1CWqSrtTrZqc56BwuGqo4F13wxm1UcKt
 LR4x69SNGmMm3BprKgkt_L0t8MbXXwfpzWIvU39j983Pn3Xw_PA4zYewJ6J8WvpEzSz9XNrCQrz.
 Z8Cq5VHLo4ft9WYJDwT42lA9NlMlY_LRaFeveUEFaWlr1zqwdR_r1Z5957QpgeHoiQvcSl92CXBo
 jJKz2xrpuLB.r7SqY6M0CmaYuE8ifbYbgz5hHCbUhaxqGLejLPMsGO2ff3fYLIsjEvjrm4gkD9.8
 Aa14E9To1us1Kt5y5vNFhtVRM.2GfgL6ouhs3MgUwFLCHEUnJ3TyvZ2dZGfjb335OiwhTtMaruhT
 jPk_5LeNhO1FZSNTTX8fvuSGmS0TEKZdKekGAwGlzOG0tFvv4pbBnjQly1Xeo3oOZEL9pV7eVTF.
 9WBa.42vanq61rWH_jLGfef4V9YvvoEOJpyuVwSbGSdizwCLE2WNuvU57emoGyz45JsCFERal7l_
 Gdxl.xMj2r9cesT7Fz4f5DijeZ_NGAW_5vwtVM8i9vKRE4mp5C6ENgCgEOVwSfi8shvlsmIci.YV
 PJIS8skM1exSJpCq6fj9uQANUAl4oGcj9A6A4Dk5u_LNVW1pW1OMo_AILivCCpKiw1bloOZnNqr3
 dRvsy_UUY.lI6dNbc9ewk67TxxNGRaIvtuJZGn.ApxIidaeeE.mXjtnmOyPwqaJURHTn6BJFyHRg
 EXMnWq0BCiWYT1BWtS7TZ8WV6_oVL.xalYXl3W7X7yZV.omixldzOboN58jbYx2eMAYVS6CEwNN_
 9fxa3qNX37VOhtPQVoeM7VcSg3mU4zaFSta4kJ_u3QU1hngez9uaC.UPYs860EQ.hUx5gboxDO8F
 rWuJwJ4Bipr1dSnhK5UQ9sVs6QDoMqWR7UwOtTF86u8dUxye1xEXig74ofyRBsYVS8hDHte4_FDF
 Z4w8uTIKrfMrUjwUNrpm8hct0ARpKmsWt1jQAyuxwa4c-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 2d6a749e-8c58-4825-8f86-e04ef164ee27
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:45:32 +0000
Received: by hermes--production-ir2-7c4859dc89-qhgqd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 06428438c07c7a051946e1a0e76a7961;
          Sun, 22 Nov 2026 09:45:29 +0000 (UTC)
Message-ID: <4326418c-b713-48a6-b9fb-d0208ee12c61@yahoo.com>
Date: Sun, 22 Nov 2026 10:45:26 +0100
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
Subject: [PATCH net-next v13 09/14] net: dsa: realtek: rtl8365mb: use raw VID
 for PVID on family D
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

Family D has no working VLAN member config (MC) table. Its PVID is a raw
12-bit VID in a per-port register at 0x0700 + port, whereas family C
stores a 5-bit MC table index, two ports per register, at
0x0700 + (port >> 1).

Running the family C code on family D therefore reads an MC table that
does not exist, and writes an MC index into the VID register of port
(port >> 1) instead of the one of the port being configured.

Add the family D implementations of the PVID helpers,
rtl8365mb_d_vlan_port_get_pvid(), rtl8365mb_d_vlan_pvid_port_set() and
rtl8365mb_d_vlan_pvid_port_clear(), which skip the MC table. They keep the
family C frame filter handling and rollback on error. The shared code
reaches them through the vlan_port_get_pvid, vlan_pvid_port_set and
vlan_pvid_port_clear pointers in struct rtl8365mb_family_info, so it
needs no is_d() check.

Also clear the family D PVID registers when the VLAN support is set up.
Unlike on family C, where VLANMC index 0 is the neutral PVID, the
register holds a raw VID, and after a reset it keeps its hardware (or
EEPROM) default. Without clearing it an unconfigured port could report
a stale PVID from rtl8365mb_vlan_port_get_pvid(), and
rtl8365mb_port_vlan_filtering() would accept untagged frames into it.
rtl8365mb_c_vlan_port_reset_pvid() does nothing on family C.

No functional change for family C.

Nothing points to the new functions until the family D info is added
together with the chip table entry in the last patch. Until then they are
not static and are declared in rtl8365mb_vlan.h, so that the build does
not warn about unused functions.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c |  11 ++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 201 ++++++++++++++++++++++-
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   6 +
 3 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index bb3d7cd..7ad9ef1 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2452,11 +2452,22 @@ out_unlock:
  */
 static int rtl8365mb_vlan_setup(struct dsa_switch *ds)
 {
+	const struct rtl8365mb_family_info *fi;
 	struct realtek_priv *priv = ds->priv;
 	struct dsa_port *dp;
 	int ret;
 
+	fi = rtl8365mb_get_family_info(priv);
 	dsa_switch_for_each_available_port(dp, ds) {
+		/* Put the PVID in its neutral state, if the chip needs it */
+		ret = fi->vlan_port_reset_pvid(priv, dp->index);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to reset PVID on port %d\n",
+				dp->index);
+			return ret;
+		}
+
 		/* Disable vlan-filtering for all ports */
 		ret = rtl8365mb_port_vlan_filtering(ds, dp->index, false, NULL);
 		if (ret) {
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 2e4d8f9..9bcf346 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -44,6 +44,10 @@
  *
  * VLANMC index 0 is reserved as a neutral PVID, used for standalone ports.
  *
+ * Everything above describes chips that have a VLAN membership configuration
+ * table. RTL8365MB_FAMILY_D chips do not have one: their PVID is a raw 12-bit
+ * VID in a per-port register, and no VLANMC entries are allocated.
+ *
  */
 
 #include "rtl8365mb_vlan.h"
@@ -122,6 +126,12 @@
 #define   RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_MASK(_p) \
 		(0x1F << RTL8365MB_VLAN_PVID_CTRL_PORT_MCIDX_OFFSET(_p))
 
+/* Family D: the PVID is a raw VID, one register per port */
+#define RTL8365MB_D_VLAN_PVID_CTRL_BASE			0x0700
+#define RTL8365MB_D_VLAN_PVID_CTRL_REG(port) \
+	(RTL8365MB_D_VLAN_PVID_CTRL_BASE + (port))
+#define RTL8365MB_D_VLAN_PVID_CTRL_MASK			GENMASK(11, 0)
+
 /* Frame type filtering registers */
 #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_BASE	0x07aa
 #define RTL8365MB_VLAN_ACCEPT_FRAME_TYPE_REG(port) \
@@ -173,7 +183,7 @@ struct rtl8365mb_vlan4k {
  * This structure is used to get/set entries in the VLAN membership
  * configuration database. This feature is largely vestigial, but
  * still needed for at least the following features:
- *   - PVID configuration
+ *   - PVID configuration (family C only, family D has no VLAN MC table)
  *   - ACL configuration
  *   - selection of VLAN by the CPU tag when VSEL=1, although the switch
  *     can also select VLAN based on the VLAN tag if VSEL=0
@@ -1210,3 +1220,192 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 
 	return fi->vlan_pvid_port_clear(ds, port, vid);
 }
+
+/**
+ * rtl8365mb_d_vlan_port_reset_pvid() - Put a port's PVID in its neutral state
+ * (family D)
+ * @priv: realtek_priv pointer
+ * @port: the port number
+ *
+ * On family D the PVID is a raw VID in a per-port register whose value after
+ * reset is not defined by the driver (it may come from the hardware default or
+ * from an EEPROM), so clear it to 0.
+ *
+ * Context: Can sleep. Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_port_reset_pvid(struct realtek_priv *priv, int port)
+{
+	return regmap_update_bits(priv->map,
+				  RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				  RTL8365MB_D_VLAN_PVID_CTRL_MASK, 0);
+}
+
+/**
+ * rtl8365mb_d_vlan_port_get_pvid() - Retrieve the port PVID (family D)
+ * @priv: realtek_priv pointer
+ * @port: port index
+ * @pvid: pointer to store the retrieved VLAN ID
+ *
+ * Family D has no VLAN MC table: the PVID is read straight from the per-port
+ * register.
+ *
+ * Context: Can sleep. Takes and releases &priv->map_lock.
+ * Return: 0 on success or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
+{
+	u32 data;
+	int ret;
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &data);
+	if (ret)
+		return ret;
+
+	*pvid = data & RTL8365MB_D_VLAN_PVID_CTRL_MASK;
+	return 0;
+}
+
+/**
+ * rtl8365mb_d_vlan_pvid_port_set() - Configure a port's PVID as a raw VID
+ * written to its dedicated register (family D)
+ * @ds: DSA switch instance
+ * @port: port index
+ * @vid: target VID
+ * @extack: netlink extended ACK for error reporting
+ *
+ * Reads back the previous PVID and frame filter first so both can be
+ * restored if enabling the new PVID fails partway through, matching the
+ * rollback behavior of the family C implementation.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack)
+{
+	enum rtl8365mb_frame_ingress prev_accepted_frame;
+	struct realtek_priv *priv = ds->priv;
+	u32 prev_pvid;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &prev_pvid);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read current PVID\n");
+		return ret;
+	}
+	prev_pvid &= RTL8365MB_D_VLAN_PVID_CTRL_MASK;
+
+	ret = rtl8365mb_vlan_port_get_framefilter(priv, port,
+						  &prev_accepted_frame);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get current framefilter\n");
+		return ret;
+	}
+
+	ret = regmap_update_bits(priv->map,
+				 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK,
+				 vid & RTL8365MB_D_VLAN_PVID_CTRL_MASK);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set port PVID\n");
+		return ret;
+	}
+
+	/* Changing accept frame is what enables PVID (if not enabled before) */
+	ret = rtl8365mb_vlan_port_set_framefilter(priv, port,
+						  RTL8365MB_FRAME_TYPE_ANY_FRAME);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set port frame filter\n");
+		goto undo_pvid_write;
+	}
+
+	return 0;
+
+undo_pvid_write:
+	(void)regmap_update_bits(priv->map,
+				 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK, prev_pvid);
+	(void)rtl8365mb_vlan_port_set_framefilter(priv, port,
+						  prev_accepted_frame);
+	return ret;
+}
+
+/**
+ * rtl8365mb_d_vlan_pvid_port_clear() - Remove a port's raw-VID PVID
+ * configuration (family D)
+ * @ds: DSA switch instance
+ * @port: port index
+ * @vid: VLAN VID for PVID
+ *
+ * Reads back the previous frame filter first so it can be restored if
+ * clearing the PVID register fails.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_d_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+{
+	enum rtl8365mb_frame_ingress prev_accepted_frame =
+		RTL8365MB_FRAME_TYPE_ANY_FRAME;
+	struct realtek_priv *priv = ds->priv;
+	bool filtering;
+	u32 cur_pvid;
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	ret = regmap_read(priv->map, RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+			  &cur_pvid);
+	if (ret) {
+		dev_err(priv->dev, "Failed to read current PVID\n");
+		return ret;
+	}
+
+	/* Port is not using this VID as PVID. Nothing to remove. */
+	if ((cur_pvid & RTL8365MB_D_VLAN_PVID_CTRL_MASK) != vid)
+		return 0;
+
+	filtering = dsa_port_is_vlan_filtering(dsa_to_port(ds, port));
+
+	/* Changing accept frame is what really removes PVID. But only do
+	 * that if VLAN filtering is enabled.
+	 */
+	if (filtering) {
+		ret = rtl8365mb_vlan_port_get_framefilter(priv, port,
+							  &prev_accepted_frame);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to get current framefilter\n");
+			return ret;
+		}
+
+		ret = rtl8365mb_vlan_port_set_framefilter(
+			priv, port, RTL8365MB_FRAME_TYPE_TAGGED_ONLY);
+		if (ret) {
+			dev_err(priv->dev, "Failed to set port frame filter\n");
+			return ret;
+		}
+	}
+
+	ret = regmap_update_bits(priv->map,
+				 RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
+				 RTL8365MB_D_VLAN_PVID_CTRL_MASK, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set port PVID to 0\n");
+		goto undo_set_framefilter;
+	}
+
+	return 0;
+
+undo_set_framefilter:
+	if (filtering)
+		(void)rtl8365mb_vlan_port_set_framefilter(priv, port,
+							  prev_accepted_frame);
+	return ret;
+}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index b5b56ae..270f88b 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -34,6 +34,12 @@ int rtl8365mb_c_vlan_port_reset_pvid(struct realtek_priv *priv, int port);
 int rtl8365mb_c_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
 				   struct netlink_ext_ack *extack);
 int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
+int rtl8365mb_d_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid);
+int rtl8365mb_d_vlan_port_reset_pvid(struct realtek_priv *priv, int port);
+int rtl8365mb_d_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack);
+int rtl8365mb_d_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
 
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
-- 
2.53.0

