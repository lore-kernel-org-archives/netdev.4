Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.184.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565247;
	b=Ie1HIgY2722oyS6zN79aEsFt87CwqYmLaqRBL9sn/UYmmvm4uftvu/W8eKScU+AiOyk9
	 qfmb/cRXxXYtoL3XAxFlpJ3rEIBz1VVuAHILb5fpjhlPv9oCVEd06+sehDvAhc9n5phju
	 QNGhQ2EMvBqXMcyz/1PcWMg85p7+zTuOc1z/ftClol22oLXdrVVINswlKRRbYf2nVjaoW
	 5vM1MMXchDULaKzvFC7l/VLS4OutysmgZPlp+W1XUv64sH3+AbCWrVLM8djVvH6IjA7Qr
	 k1a07HVpA4DlJacU4nFDsBX4btLeA772QYDGZgB9gq3V2XfzS2bGh10sr0xx+gGSWMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565247;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=v9GhEm9HHwir5mWVjDr+VmTQV778rTIw7ESROdXtCwo=;
	b=qxoWPsBIe0gqVDN+exl5hTWJRcWt2EmAHlDQkQF+fyAmeX+/mDLxGWVJWDlGGdafzUrP
	 9hQB10ROHPAjBopRF4OUEtkA2bQFbEk06p5y4cgbzL0l7TI+m2U2eKvTD9bLC+OoxOHJc
	 WneslrTj5XKSymEBN5IffLf2rkF8TCdq4C0zD4K0CAFoNHoEJmn+M9uWdPLEqjNPkwVaG
	 6FmmaaLqPN1B/OKxSVAycdilrbh+0zoPz4Zv1Gr+gnrz8QGe2etkwFQlBlsjMJQvrCEH9
	 56lGcuAf3AztIdnYN8pz9zr7AqohWRuFWW5mVcA6xiGd+djlkNhFsE7iPsUQNTuHDpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=Y3q7OyV6;
	arc=none smtp.remote-ip=66.163.184.44
Received: from sonic317-33.consmr.mail.ne1.yahoo.com (sonic317-33.consmr.mail.ne1.yahoo.com [66.163.184.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64AA606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E64AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=Y3q7OyV6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565246; bh=v9GhEm9HHwir5mWVjDr+VmTQV778rTIw7ESROdXtCwo=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=Y3q7OyV6kFHmxmcez9t6SbuKVP6bM8B0L/fsLNiW44Gaq6w9KqOflgtOOg85ckocRIUqtyf0atDcXtDSGGpMOiRLVbDBhsLxDRwWUJp73pXD0lVxsCkMpCjH0BywvFapGcLmG9BlLcl/oDpl70sn79L8HjLLTkfVq+RPG8Et+Aql2bfqdIWvScMzP7D7YtYrzTEaSXCjBBRoJt3sD3WbIS6IYksGfVnDk9S5Z+UZ5QibDjUIglfoN+kJ/ukX0gu/hai6LtE3a6rIPSXDxVxR90bpI70LyORBtvVpGpeqgE2d5QOxBlP9jgoFXapTynmov7P0jL+8Axn1vhvO5nFFPA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795565246; bh=n7oopBMCb0WtwEhEzQJEk/vIC9rZGMkvzu1ODbPRUMx=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=JqZl+0ID7c+VKOXHTbXktWVLafOY9b9ve3VCwvzcPKGusq7nKNqWcN759IAymaH2PbVEgbdN3fcE1SM9zSjY7Xj3mUEJfSXW27Pw612aQc1XOickdjGGlqCyZMpXmYYZDNXcUwZUXcCLuYppTxHejaS0ZI7w5ARMnq6a3zQget8Ohmmxax8ST3HF3jcvO2/e6HGoKJYRS3nNwVLysWvnD8aliH/LYEpKMu6kpcVChmprpCaRY0lUKbu6iCxunfTp4DmlX4duqI1hls1oQKxKYCadKXPUcWgZw4VJWXYPoY2bBGxy0maXKAQ4TCuESX7HargsJOumv050yXt4K2ulBg==
X-YMail-OSG: V8Ypd7EVM1n12j9JU_6_AwnHSAbnBe0a5AakDYe6USPlYVZcSTv1OEvOCvx_hf5
 pqwJanAxqu5yylL_Nmv2RoSVhzIf.0Q1QitXR6JDcw4FrDEYC3HDDWOwp6p3YaZNSizZ7I8FnBP1
 vGvBKaIWNMXCTnebXmzk.0.0YxwtzESbos7BeYFzeqiVhlmXWH8Gx.4wR9OXo8fqDIHrUzNFEkgP
 igNtTnvUl_xIJfdnqQoCbAbdQN4AIPEGrSBfoOwqGSbQ7MV_bLEfJHfDWfNGPDlfhBKm9chHmVoF
 4FJNm.naeECgHk3lb3vi525cAHA75PJ293Mxne0TBl.Apf9pjbemkCjJOyQ6eZdjZVkDcaiI7sbY
 Z4jdl6cLTgl.smsrOJelA317Oj23vNqCzvOCdfOGXS6whFx4tvZQs1CF7pHk_qyG_1joplNSyAw.
 YE6VqH5GApkOij.ftGGIms8VE4nypA4tSCkn.9dFb1W0blqrZ2dN_n4_VpHwUGV10O_pIFS.8Afd
 yF3.AXfHTj0kgYUSYBPS3dm5yRXRbu69CSvxH6lVuD619uqYwVCc9tv8jdZresUPQ8wFgOK60crh
 L9qAFqEQSlEr5vG.zG_0pIT5q4csrPYHOXl4LeCJbAVibKP.zIT4Ox772AtHQbzWuLCZa0XE76Bo
 sZmmPg8.iyqR15UVrh2pFa1kl82ALmtMLYBeH3_V6duYc5a4GmOqaC1QhBZRo5gv225mtw0i8eRN
 6E1pRbP3jMVfoU.tBCPuKjRk0ZLkB0ljmUFbHtqeVo5gMN1BtqZhYbYDVqL4G21EhrF6i7Iw07Vr
 zQj1ipPpqcPbrX4lbST2SADJSG9Y3vuBOR4Cil.M9fdjWh59yBmqca539H.yKRHTDVT0N0hneFhk
 172FGnDn3quF_SYmTaRezklmgAw7HxkTF229w.Z6Nk_ZOGFPYc7HOvk5rFwYhePBAje50iMftdAN
 80DDO8nbIc4jcAx6kFogkNPNjZZUUhHNmEMQFS9lVaVFQdEzeLK6uJnPJEtlgoDQMjFouE6NbBy6
 F5PCWOlMbNOIiu_1gf.pfNuUxBf9AE9oNYE9IEte.GL8.TN22H4okhUG4kvQOsijA1xYJWO_Nhqg
 3Z2dduwz..lP7XVIVjHLLoOWW.E7VmOZcXjXJE0c4QnWyCRXnKY8mTawQH9eKaXXw0zVJkpcIboN
 .z6zPrMdvKnm4Q5epzXLj3FZDn1_8YO1_fEWkkcf8Q1DIoc2mtWqefTBB4zYKm6wwiaZ9t_xNj7e
 yHBCq6WWmre7RjzhyG1E3Dd2pX8NV5JsSzuBJAYHS53qfm9UogXt_XIj0lelmglUGeZQd4AOqRcj
 YPOPSg7aArqCm4Ww8AFoFEAjIqt_mcWUhEZPL3YwBj87gTR6UBXpcHgHVjfU9SZHzYojHsFk0Huj
 7Zm4_h7WguUIvqdL0gsioJhlAxowVGmx75Xzevx0W7.U0oOackYnjLr71b6HfTCEKJqde8dBuP5r
 2o0R3CrEUAY2_onHzb4OirZMR0GJEbmKcH_O1xwunQX1ysCjyYSpk.UjTHbhDT4yOcTN3rp6njEI
 RhQiWO15CTAr5lwlHvAfmbjQYNV_1woSp9pYkQGTBui6rN4yruYvWRwFx7Ha1KVoNYtPAcvSPmRk
 NcLJMJuy34meJAJHFg4aglXo77TTH9GnPeIT9DLdM4D9peOQ0YIDSBHEsQaRU7Sm3JGM1PXC.bTk
 XyhWiuJizXIU1ceYXW4cE.4qFwxaIcui13BocdlHtjNkePOin2dipM0JvD_h1d1FjSr2YF.VgQ2k
 NHTGNNMD9OBX6hF1JtbuYWS9j5N12wXLnJD.YCG_rn6vZY3sMebY_OHLD7K6Bri64JCyXWd5cNM9
 vE_UYQ.OLbaasgrDruo6DCdEXtv8VU8O6O.5kx5M9.HdNzMFTIsVeH0ZES9VMgy24cBpX17f5dhV
 TIyzTICgpzGazqsPxpL2Ss_k1c6wWgOkbSuBKg7J3fwjSo5Y79qjt0ldxF8r2znb4ggI097jy5ZS
 H_Db4JNK.B5fbH0BpHzrgkG.ZjulbS.hzuLelHIt9ODiSXTJl9MIhO.2JbDFcKDhg0wM1den7VKm
 OCLzJDUN.IF3w7AVUYUa0hiEJ.qW.2EBW4VKjCeOo0h.mAEH6HFN3uDjy2vsIxkpT5AKDieCxxbi
 JBjpbrBc9PgI.NAr3ETyWEY.MlFuG5nGqERxtGLycLdyuRxs1nF0HuSmJLf5fWcnEGMB4Bh9.owd
 IQaEbNpSr_O0FsUDRVOoGC0ZUnFreHSgpDfUoDIJNT2SOlqpVCfJ2Cgm0uHDtlOoTS3XEgfSX5.i
 VGCbSy4lv1lDcD92spNJtqqgx6zLrWJvFNZGGO_9NCWbl
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: fb790867-24cb-4788-9cfc-9e203606637a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Wed, 25 Nov 2026 00:07:26 +0000
Received: by hermes--production-ir2-7c4859dc89-zhdpz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 650145d04bf733b0868ee6eacfa5ba44;
          Wed, 25 Nov 2026 00:07:20 +0000 (UTC)
Message-ID: <0c38f80b-2d44-4529-8400-340bb3d2d2cb@yahoo.com>
Date: Wed, 25 Nov 2026 01:07:17 +0100
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
Subject: [PATCH net-next v14 08/15] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
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

The PVID helpers (rtl8365mb_vlan_port_get_pvid(),
rtl8365mb_vlan_pvid_port_set() and rtl8365mb_vlan_pvid_port_clear())
work on a VLAN MC table index, which only family C has. Family D stores
a raw VID in a per-port register, so it needs its own implementation, and
also needs its PVID registers cleared at setup.

Move the helpers behind struct rtl8365mb_family_info, as already done
for the VLAN 4k accessors: the existing code becomes the family C
implementation (rtl8365mb_c_vlan_port_get_pvid() and the like), and
the three functions above only call it through the vlan_port_get_pvid,
vlan_pvid_port_set and vlan_pvid_port_clear pointers in the family
info. Also add a vlan_port_reset_pvid hook, implemented as a no-op on
family C (rtl8365mb_c_vlan_port_reset_pvid()) so existing setup
behavior is preserved. The callers are not changed. The following patch
adds the family D implementation without any is_d() check in the shared
code.

No functional change.

The family C functions are not static because they are referenced from
the family C info in rtl8365mb_main.c.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   8 ++
 drivers/net/dsa/realtek/rtl8365mb_main.c |   4 +
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 101 +++++++++++++++++++++--
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |   6 ++
 4 files changed, 111 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index be0f49e..c59e657 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -9,6 +9,8 @@ enum rtl8365mb_family {
 	RTL8365MB_FAMILY_D,
 };
 
+struct dsa_switch;
+struct netlink_ext_ack;
 struct rtl8365mb_jam_tbl_entry;
 struct rtl8365mb_vlan4k;
 
@@ -23,6 +25,12 @@ struct rtl8365mb_family_info {
 			    struct rtl8365mb_vlan4k *vlan4k);
 	int (*vlan_4k_write)(struct realtek_priv *priv,
 			     const struct rtl8365mb_vlan4k *vlan4k);
+	int (*vlan_port_get_pvid)(struct realtek_priv *priv, int port,
+				  u16 *pvid);
+	int (*vlan_port_reset_pvid)(struct realtek_priv *priv, int port);
+	int (*vlan_pvid_port_set)(struct dsa_switch *ds, int port, u16 vid,
+				  struct netlink_ext_ack *extack);
+	int (*vlan_pvid_port_clear)(struct dsa_switch *ds, int port, u16 vid);
 };
 
 const struct rtl8365mb_family_info *
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 24635fe..1848847 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -758,6 +758,10 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
 	.ext_config_forcemode = rtl8365mb_c_ext_config_forcemode,
 	.vlan_4k_read = rtl8365mb_c_vlan_4k_read,
 	.vlan_4k_write = rtl8365mb_c_vlan_4k_write,
+	.vlan_port_get_pvid = rtl8365mb_c_vlan_port_get_pvid,
+	.vlan_port_reset_pvid = rtl8365mb_c_vlan_port_reset_pvid,
+	.vlan_pvid_port_set = rtl8365mb_c_vlan_pvid_port_set,
+	.vlan_pvid_port_clear = rtl8365mb_c_vlan_pvid_port_clear,
 };
 
 /**
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index ff6f2ba..7627b75 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -847,7 +847,7 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_port_get_pvid - Retrieve the port PVID
+ * rtl8365mb_c_vlan_port_get_pvid - Retrieve the port PVID (family C)
  * @priv: realtek switch private structure
  * @port: port index
  * @pvid: pointer to store the retrieved VLAN ID
@@ -857,7 +857,8 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
  * Context: Can sleep. Takes and releases &priv->map_lock.
  * Return: 0 on success or a negative error code on failure.
  */
-int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
 {
 	struct rtl8365mb_vlanmc vlanmc;
 	u8 vlanmc_idx;
@@ -871,6 +872,43 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
 	return 0;
 }
 
+/*
+ * rtl8365mb_c_vlan_port_reset_pvid() - Put a port's PVID in its neutral state
+ * (family C)
+ * @priv: realtek_priv pointer
+ * @port: the port number
+ *
+ * Family C is left as it was before family D support: its PVID registers are
+ * not touched at setup, to preserve existing driver behavior.
+ *
+ * Return: 0.
+ */
+int rtl8365mb_c_vlan_port_reset_pvid(struct realtek_priv *priv, int port)
+{
+	return 0;
+}
+
+/*
+ * rtl8365mb_vlan_port_get_pvid() - Retrieve the port PVID
+ * @priv: realtek switch private structure
+ * @port: port index
+ * @pvid: pointer to store the retrieved VLAN ID
+ *
+ * Returns the port PVID if defined or 0 if not, as implemented by the chip
+ * family.
+ *
+ * Context: Can sleep. Takes and releases &priv->map_lock.
+ * Return: 0 on success or a negative error code on failure.
+ */
+int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+{
+	const struct rtl8365mb_family_info *fi;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	return fi->vlan_port_get_pvid(priv, port, pvid);
+}
+
 /*
  * rtl8365mb_vlan_port_get_framefilter() - Get the ingress frame filtering mode
  * for a port
@@ -933,8 +971,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID and associated
- * VLANMC entry
+ * rtl8365mb_c_vlan_pvid_port_set() - Configure a port's PVID and associated
+ * VLANMC entry (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid: target VID
@@ -948,8 +986,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
-				 struct netlink_ext_ack *extack)
+int rtl8365mb_c_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1041,7 +1079,32 @@ undo_vlan_mc_port_set:
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_clear() - Remove a port's PVID configuration
+ * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID
+ * @ds: dsa switch instance
+ * @port: port index
+ * @vid: target VID
+ * @extack: netlink extended ACK for error reporting
+ *
+ * Configures the PVID as implemented by the chip family.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				 struct netlink_ext_ack *extack)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	return fi->vlan_pvid_port_set(ds, port, vid, extack);
+}
+
+/*
+ * rtl8365mb_c_vlan_pvid_port_clear() - Remove a port's PVID configuration
+ * (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid:  VLAN VID for PVID
@@ -1053,7 +1116,7 @@ undo_vlan_mc_port_set:
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1126,3 +1189,25 @@ undo_set_framefilter:
 
 	return ret;
 }
+
+/*
+ * rtl8365mb_vlan_pvid_port_clear() - Remove a port's PVID configuration
+ * @ds: dsa switch instance
+ * @port: port index
+ * @vid:  VLAN VID for PVID
+ *
+ * Removes the PVID as implemented by the chip family.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+{
+	const struct rtl8365mb_family_info *fi;
+	struct realtek_priv *priv = ds->priv;
+
+	fi = rtl8365mb_get_family_info(priv);
+
+	return fi->vlan_pvid_port_clear(ds, port, vid);
+}
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index f6230eb..b5b56ae 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -28,6 +28,12 @@ int rtl8365mb_d_vlan_4k_read(struct realtek_priv *priv, u16 vid,
 			     struct rtl8365mb_vlan4k *vlan4k);
 int rtl8365mb_d_vlan_4k_write(struct realtek_priv *priv,
 			      const struct rtl8365mb_vlan4k *vlan4k);
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid);
+int rtl8365mb_c_vlan_port_reset_pvid(struct realtek_priv *priv, int port);
+int rtl8365mb_c_vlan_pvid_port_set(struct dsa_switch *ds, int port, u16 vid,
+				   struct netlink_ext_ack *extack);
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid);
 
 int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port,
 				 u16 *pvid);
-- 
2.53.0

