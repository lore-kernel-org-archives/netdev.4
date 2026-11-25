Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565299;
	b=YLJbq0uF195GquuVVLD10dKCGa+uRH+Lp6cdqg8a+eWdnyCXT1suDt5IWf0eZC/F9jRn
	 yFeBTy7bZslJ7vOV8K4fpRz289KPyo1SfgKV/2O7DmxEpsgBncWpJtPl1QalkTqQuHYIc
	 JZOJE8xDYJUGLzYls2cvlVMRs1cx9U3fdwmrGOZMSqa1NnFFyAh8er4qxJ3+3z5+G0QAN
	 cu2WdEjj4LZZozcbYqhIrx/O58PzknnAgBL399BzwIEuxrxbZJTL5Te3skb+LKdGeMm6p
	 gPI9KyAM1XIFI8q/2eegTUf7KIcsSFirZ0E5MTVganzTFlHVxPSF3lbUvHfJM4eD43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565299;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=iz6bL176dhDAyWP5Je5QkYXb+FS0AxL90OnpL4yreII=;
	b=c1DCdqq1WHf5jmPa5ge5QJXD4dEOjuYQcQpNFse5hxLJBgY2y/UD7nIwIQyYscQP9fe2
	 A8REHs7unW+u2OuHv3pUCiWAdyJJXMM/hfxNVT1+ETmLRI9aZDmU7Xsm6a5S8NVlp2olC
	 kQ5XXzecrgDN6Qj+NE/JVtyD6XnUvQHs/JJ55M/E1YCXfjpBQFPAG8104lLl2jt/i8wDn
	 hZonfqy0uYTLiAkAWf4SwUgt3XuVEG9VThu/hIvht5Ub/iybwXQAJC4h1CXvMN71PuFo+
	 GniiFEx2IV0ZyTeDmNFp0CGLDwM4OIJyKlH8LgcmpQ6dfIfTLgC4hjMxq8xiQQPDwAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cO5Xfuqa;
	arc=none smtp.remote-ip=66.163.188.148
Received: from sonic303-22.consmr.mail.ne1.yahoo.com (sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D679606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D679606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cO5Xfuqa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565297; bh=iz6bL176dhDAyWP5Je5QkYXb+FS0AxL90OnpL4yreII=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=cO5Xfuqac7nKqEhImVZWwTP9hwUhXum1ru7BLVVi3PwPAFT5j6j4geI3gKRgSDM6nP4+GZcwz5jZW5zpZHGGrWFkcmJnPlPdEUIvlWDF5syWzeJs6MiUr6nu+sXt3/FFXA9nyUZXVPLgtbPwwIZ3E9EAp2T4A5I33RWLjSA5xkdP+1B+0tBbhfCGlzdCTKkb9QLT6HaYGNIgpUQaCWrFXSeA+j7RkLx53d6w7lkcAdrTg6vtUtEz8OetOoDTgFDT7p2aEELWv3M5raw9n55BFM/vigi8zKFJsaE1soHAOH96lZPdJdZFOuPyRhPQNwpE5QGVC3rUIn7WmiiiQ2Mu+w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565297; bh=bq1+FBTdBsvv+qkW65247NCPIwMK8lhkl7GB9P4Ho4N=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=HXBKSbHLZHrw+RYh81hMePpYh4Mot3ALrcKerskcvkIIXTjNq/Y8QpNU184ATqcqJjERW9Ce2w3ECM9AykKN/78eOaDN+HqL00mZHPwWeEQ5+WMFD5Obo1u2BL6Kp+3YJagFsoKLA0y9AOoZYqtjtp3sPnpju/QJoWV6Ixjs3D/sWOjZ74KoVcmyA6yGyZhnplKzrroVVs+itURWzbNgMpdMkLHAuzRqsbSTRDUwGEWG53AhG178VzRlJcWG1IhYy7CgVaqw+9slofpE46+bpzNga9UX368YeGi8dDjfXI/il1zaMVx9frOWRqEh55+yd3UW9ODtrSyG2equOnZsMA==
X-YMail-OSG: SV_vVfAVM1mzD9VEUoavEcXUwdEwueRQ9tPOO9EzwpRvhENy9L7FfPB1piIrXZa
 UT4JoL3A.5uHW679c5KsCemgYr4K_ZVkU8pIxq_CX5jLcVkZaksTeDtcJ6y7AEMRtnuAchKPTBOU
 PkIieWHjah3PdkjU0j3a_i.4aT8nvPsHqKUVT708wBG1wZQwGvaOShMRauYLuKOQIFrl1Wr4OaNa
 BeIpbWcvHN.Yb8_dGplNux8do8_VwOJiNn6OGdTIY04Fq35JAImjxbIaSVOKXo.0QK1cj_5e6rv4
 u.Fgzf9KwyaKttZxByBL1saLWzgPPhp3QeKqdNkqJlJDbsIAWgWNqG1qSn9s9h5O05g2dVxKIBhF
 onpfE.tGu3c8yOpjUg2AYhMk7yLqmk8kWuHjRDNehYtwXEjzyCuuCJWP7aUE7m_E2IVJ4BJqtyDp
 YUyR.KLCIrm4daVCm..UcAKXOA5qtONdIMT4j0D0t5vbOw2bQ.d4lPw.cg4G.0CySur1xcbKj1H0
 msFg1L9qTaVl.WzDZVXhLWQTjjJXwxYyejo_iAMKCrdAWW6B4I3oRpnCLFGV1u_xtZ5uotxjCmcy
 k8eYlHG_3Wvr8QNQLUwmQbiBUzRmD20eAv1wggFgRi_Nq4C.jQ_2PBlsXE8yPWI4gJPEdx14OoHQ
 efO_XPD4K4FuCdx3ZjgdLw7aW9hlmLY4pVgZBHmzZb7Pnwb66qZcK9NLltAN8y_YDVAJund_q8hI
 9JbIT_fWj5Nucp1azjqkhyCgoYyrsQq.tnr8zQk97TemTKxE3mEjtdLwi70IjgbJhFm8tAu.rjPK
 vOtaWP._bE921D4zboGqyLZbJm0LCtnA8pRKkUX3gOWCQ9KbjeCs3BI43.lWp9eAYmeZIYnqwKme
 FFVe1zBbhUH0cdAwJbD49NeHQA704aqRdok4cpaqiCn.WOFWG.lmEGdzB.zQWAK5NZ8KBHuH2rbk
 leV74wJS0ymtX3Vtpr9EAsFcgyPA_eLrYRC7qjSIfl0OVkzf6y08jB5iUYOzf7HDrdTEJO1Qz.Jl
 ZeoM7LCd3Or7BYLq0pa4f.w5hH7rc0GwdFpswTA2DGG88u5ZPSnYF4wV76TUIrCuMzw1z1WZ9ev6
 zkZryM380IiUKat23KIzffkAeT5m5RVUsz.qSwdzHDM6c7svF1uCDzZZXfHCLSApC2_uaIVaC_0B
 5vfMhtcKF6Ph08Ginn5HwwOTiOPG4yg48ir7jD041ShcMIsrti2zYDzYksgEfXwWNrXYXAH8IJE5
 heqRpAabvVvq0bCqumILkzIUvCrL1VnISG.M2wxZTk8q3skJexl.04wK_JSr.IKyCxcj1iC_tWKy
 6uyJYpzp.fgxi8dyFgfhGuj.rErHbjEskXgWupGkHz1AYCbejgsGngWRkLm9tlLnkRtydZwlSQtw
 kq1qGECsCuwqHhleywJvC9kBh3Acyx_9.NIz4exkM8ucdpqiEzorQcC1D54H1F3eYgxwjpiq.oog
 iUJxMuEGXCRP7YteRG0jXP.sfBIrAPGPe2bJB10hbxIYqOcmSmRR4Ai6sA36Tfc1fvnKdwKIKU1E
 U0oWNl5X69MHEC.6c2fyYrKO_J2CtrTEIecv8SDDk3wRzwWvaTW.DQSs1zoiZ9e8Bi4bXkV0o4W6
 CrdiSsi4R_ULklM61qUxhwaSIcbF1b9FjWdtEksU4VPas7uOI8o_roo47zzjR5RgbXNoUHwr6OIW
 vW6kBG2YaxlqY5iMqBO5InqcCVumLDbEFfMBa3ebwu2Semrw_8T9dKXw6XLm1dqdeYccVpdofuIC
 Qw6RR7KMNhp584tAqNPXy6GVmCLlKEJB1sxhZB_3d9FCe5cXXmXrI9Tfhs5Ly8AUfcYcMdXNji.R
 O9DdA2C1ARrKyfN2Ms_R3OMO61SQdD2I_tPAkL6fDw88uu1ff1Cl9T_33YwPLLlK.m0t9oGUSbWg
 G3x7Ue..MxVYRp5.UnuzzSTtxLXXjwBO_rXaDGlSzlpmpDqShyqHSFxM2Z2DOc.iWdRyTVh.XuRJ
 rLMWW5Rxzxls6N5KPaRtOlWZOxC9Ka0HSZmPtIyOydbDTty_KN1YElntqJwRuVQyKU08n.cBKF9.
 aoAqBbX.b22XBybBHZizGZ1zVFmQ54wX_L6XeK7ertWfOvou_QwuBPBKFVD9DTlO2FEDW8Uf07_B
 xJfjVt1mccBDVugErS1I0gM7ZCcsGSjmCpwIBBbZo28H6lUZy0Jtd7c4NP3PyZ5WodbVQEdsEdf3
 CrnjLAZ0mUTt8MTZdhzMEG47lvWBadVLTi1KoQpD.cITfelmeu.zgInSR.WXoFC6r7Q2d_l87bkT
 EEn_b29Eo1MfyiebJX5YnyDtJjJNKDJAiqvM1JqjhsgyX3mc-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 97871773-53c2-4a6e-b312-6f1ac7b3544f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:08:17 +0000
Received: by hermes--production-ir2-7c4859dc89-v5pln (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 0b5dab70e2990a4869da0875f255aa77;
          Wed, 25 Nov 2026 00:08:14 +0000 (UTC)
Message-ID: <f5d6e665-9e94-416f-ab5a-acc01a7de65d@yahoo.com>
Date: Wed, 25 Nov 2026 01:08:11 +0100
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
Subject: [PATCH net-next v14 09/15] net: dsa: realtek: rtl8365mb: use raw VID
 for PVID on family D
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
index 1848847..3f45ff4 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2450,11 +2450,22 @@ out_unlock:
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
index 7627b75..aec11ea 100644
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
@@ -1211,3 +1221,192 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 
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

