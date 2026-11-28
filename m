Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824358;
	b=Rvf0y3w+U7lxmeV4TyYSmWeOO1QihColAQDOdjmFVz9ipiZHLVuNv9YaL7gCsZ1BBKOR
	 F9XnRpKfN+sVK2afIwOLk8MMJRWhbQeg0dZxi8JPFEF61AW/D6DYwyEuCT6K13XVAJZ7p
	 qH2ha3rRcGgEa84aYP6V8BkqAdM/ggqjfOBwl0SPGENSsEB/FNqPRZ/QlSr9tukEJju85
	 El8hxoPm0i2qJyC7lflr4W8ey8lkmn8Rpbj/ZZ1Xky+O2oUOnNPAEF8D/CqToGUE6CDmv
	 iD3ak39aO2zeWKUXmpW4g8ed+rdpV0QDzuo4ytIKY0cEo6SCXV62BQCcQ86Bz5tCWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824358;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=DcyIgrd75d/DNck0hPM/bnWt6PXA1139IvR1rIS/X3A=;
	b=BZrciqzgyJ4Sa7Bk8VetMdN+Nq3B9u3fDVtC7UOnoQhkxo2AAy06LfMFiVbBxvEop7hU
	 TULOpYEAn3D0gkiqHuUKZr3+qEYEb0y+cv4d3YALpY9G9cTjgLCszQ6z4kOhDhJ0iMWTm
	 r5HFNEjlDhnpwIIDdqfsiPzF5xOziQ4ETvLfJk/N0G0RerSYHJITrQqu7jcB2tdT1lGVv
	 QcLEm9BXxHYFvDi5H8RmUiG2dqUh6iNBvmpIcaULG9wmKN4/D1Shglol0ozE0vYPT2N92
	 jAAjuopZWx7QFSw6N9bvAH0kpojq1OPdgvZHmNMFBd0Gy54IbGHnKC2L/7pUkXg7qJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=kld6rYyG;
	arc=none smtp.remote-ip=66.163.189.147
Received: from sonic314-21.consmr.mail.ne1.yahoo.com (sonic314-21.consmr.mail.ne1.yahoo.com [66.163.189.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5E606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC5E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=kld6rYyG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824356; bh=DcyIgrd75d/DNck0hPM/bnWt6PXA1139IvR1rIS/X3A=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=kld6rYyGnh8ZVnr7ymiAngcOZ66xAw58GskwDcGrQCkVfFlzMAnCrjinP9ZLS7DMgfGr82u44CcVAwGfEsplWbxF4o8dDltIwKftBBtbjH2lWEliQDsOAji8PQkgvPwD9ak9bdtM39akgv8+oJjo303eynO/LiBGF71M1b7Mkhy9DnsZfrTdO20HPVl0Yntz6mvmth7T5FntUat5LmlQatlE5xY70j4PVnuEkeEM1cp3BThhu8DOaaH7rVEi+hMMLm7KEsAOYOLHdanPHt+6aCCn/4/Z8khY2KHdiXA7VVOUkrkkKW3/a4C1Jtlp5xjGrQ1hZ1PDMr4+QaGWbIyB8Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824356; bh=ejYLwn6odeEjR/3kENaOfvWb3kYza+SxsU1sDAXAgsD=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=EWiJj61/YOcKuvjTzYc1LJA32K3M+Ckx3nB5nUbMsbwIPB4TujYhOoj8a+n7olXm5miJP9GH3Wu2v8W7l6036GQIF7MxRmhLuP44G78HV3cZW2M5r83XTOrHIYle55xeOd98RJhK6BS6iqbIVl4lh7LrwOr10xLEFQ/1slZRjDTnBYw9J3LvAUUXcV1ErY+5trtLmTE+zwV9uVMOsCiJO11zWhufEnXFflh+bGWhTksg165Fzzaincr5uNrqNvL9IZfgd/RJUVYS5PYYkeCMbAvfolt3j3p4ekO34CinUPmUjEm26ARgkKHVCovsXHboRPY7/giX7k+KuMz9WKLKQA==
X-YMail-OSG: MHGknB4VM1nRh8VukkegvW2CID6hfX3092Arq0SbVdYFPcZumHVVqRxH7w.8exL
 CcHDdT0ZhaZWdyXDQ00pxeW7HfCdUvv7yO3IX4uiYSjViBTE340E1E7jLhOxSwIa4YHmo.9oLH8L
 dIsMWoboFjYXCMjSTZ0bJ2oeQ1fzt05FzOqOXqXRCXgVpFEaMw9b6EiBcHcD3cI7uKLvPwgICHri
 sm9G3HVhfQBUwiL86OytoWw8u_5r.jNQvRobji66WKmYlGe933v00t3leAEwQt1.S2dKkiwaMNHn
 ZuN4XiXPwlV7yy1fdDdGiQicDS_Mn59YPQE7Sh0gC89J.yIAkGN5I9BPnEjUcJzGzkV9gc02WUDz
 _Q.eCi4obSOQLA4gBLy6xJQzGEQdPrGFxjs3FKLbmbmnXomn_.aLpC_7Pa8GFtCRnu7Z69r62evh
 kpFef9Ysd0SuPJLqSJVa.Bx5SthIr_MBBZHGESJiL57PRiolURO21bhxmSqRhK55DR2Kb9X3xoDw
 .yyyBLQOchicPYWZRDJPX9xwT4zeZSnqSPJpHgXxjEwN.S82GIjzvn29hydu7O5yKyuW.t9HaHe_
 2sQ0ZSCEch5GgtfLsxWHg_6GZ7W95tuiOnA5fltQgbEoYweYcAwOos2R7pfoJn0LSb1pdMNBR_UH
 l9hWM41M0U8za36qSm9P9Fq6Bj0.ruVMv_RciLs322wXPq_ehbfB385jy9RsSyHiyz46i0juhP9Q
 XpEDlTOkRdDjcBYGrLGbFwAbwkGaIC7XYf.m92K9vaGYL9jpj0Mbdv4FYWFlNEPTK5GETGIkaxdK
 y0gsaZWnqaPQtp0_yzBLrrO5XLImUTx_5YM4jJ6c8LEE6drf_N40mqAS6zFwSbppAIpOl5WmR._L
 DVHRWn5vyzo3z92iSnOU_oBs0s_mhH.RJrGLHTCNK7v6W.Hvu8nnVLwhnlFlM6XVJNBBFSfAYBXV
 wRrwN.Y95oI0Aq9J7w.KNNfb_xrSZvtIkxJHOHwWKtPTmpq.iTLtns_5UgkyI.IhY28wNlT85ewc
 8CjRO7diUd.0PWRtb0t41KclupnuOvJv23Ry8CKRYKFe5Ie1TJE14gL_xyOWI1e2g1YlTefH5Kjm
 .wrZg56qw3.QbktFs63V5_JECWKU7FLvY21d0i4xS1GgRXOJTzNYRhN7UO51BlzxfW6L62ALsL89
 kVedG9SEtNuGP_OD2k7I8XOMjRyCfV7vY6dHO9HDDXTB6nqGP6itaMKSr9RaGd.BzJzb2RE5s0oV
 7Jay9WwzhOLPc9x4vp1WvS5lulmcU8WQxfdsg9WgsYZrIjt2RLxzrutvIDd4D4f8g5kxDmfq6Zq1
 Yt0D6WpLA.xsnLYUvFknrdOOdDur8XxqcyHUBzHVNAG8zwLiTQ86afnkGGQYiBnMjm3Mik6yXH.w
 EotxIaSQJxjhp73U8ykvOoda6k5rJ3XKXu.tHyFZepoSg8i_3rLq1t1dHF5y3qXn9BjaR2CrKrnH
 2QMBHPZQOfN0iqd.NdZAizMm7lK5LPNxd7Cczl2FEd0nZT97iUaBGQzjRPRsQgucFuNcsmxgm9SJ
 rkRwZZVum..qHvvFM2ygaQgZSkvXJLkopIo98DxDVYM2onKMO7X2lG01G6OtaycnfWp_7kKszdhS
 ZJmmk4GQ6145CnTMjnHlCNfLoNWa5M18Fsh2eVi6Z9jwIXZsRo3aNoJDDV7KQIUWTryMoCAOf.eS
 Cy3fgDDTFyNLGAe80nDpywo2A8uGU7HE8F9DnmNrbb5oK7T691iKU7mnauWra6qSbGxNxqXr2I1k
 .GC8WrR62QCBOFzpUswb4O1GSBrd3UUmYQtivq_t3pvCRo1NnAZ8c9..T0wURebvLEs05FKu.Dx8
 JZW.6oWuC.VE4PGzojI.uDec5NKnAVSoz9qyEz0LkI6xL3NoBu9lbnOXLVkf_5_xIrkzzw4eCLx1
 CbiXYZXugEtqAKHQchNLR1BUoovYz6SUA6AZUFUEXpKBf1U7seA5vvEPZXv0WuwfuVMpG6mAzOMO
 1mMd6uXQ88iK_TqaGmLsQsqod1peHApoEaq8h1SxFCi_G7ixDCa9UfmZCH7Ag6rjUnRevuHsyCyP
 JtriVMokK8AQYQ9wsE_rjcObzVpvXBLP6o6l4u7FFerbvB8dQr4DcKZJE771S0An9viP16NgA_Cz
 OqhxYofYusp5RJx9YINKzPHINaQ_q24E3xAY4iG6BiCqYGav80.PRpRtZBjnI.elrx7y9FGqI9R7
 pFakherxEzF4OkKH9S._ZFC8Tpz3D2KG9XA2cVwnQj8Lb58T9cAQKaXnD1lh1pLxJHXzYULeOWTv
 ZH6z25_Ex1_eXO.iwOng3kuB3KGN4n3wVine5m3hXEqcwJxnnNw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: af5a7516-4800-43b0-b674-3f68f7002bff
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:05:56 +0000
Received: by hermes--production-ir2-7c4859dc89-jbbfn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a0b823dbfe2beecf03f93abcf1a4fe0a;
          Sat, 28 Nov 2026 00:05:55 +0000 (UTC)
Message-ID: <c5820073-b35a-4156-ab8e-9397d4673323@yahoo.com>
Date: Sat, 28 Nov 2026 01:05:52 +0100
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
Subject: [PATCH net-next v15 09/15] net: dsa: realtek: rtl8365mb: use raw VID
 for PVID on family D
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

Family D has no working VLAN member config (MC) table. Its PVID is a raw
12-bit VID in a per-port register at 0x0700 + port, whereas family C
stores a 5-bit MC table index, two ports per register, at
0x0700 + (port >> 1).

Running the family C code on family D therefore reads an MC table that
does not exist, and writes an MC index into the VID register of port
(port >> 1) instead of the one of the port being configured.

Add the family D implementations of the PVID helpers,
rtl8365mb_d_vlan_port_get_pvid(), rtl8365mb_d_vlan_port_reset_pvid(),
rtl8365mb_d_vlan_pvid_port_set() and
rtl8365mb_d_vlan_pvid_port_clear(), which skip the MC table. They keep the
family C frame filter handling and rollback on error. The shared code
reaches them through the vlan_port_get_pvid, vlan_port_reset_pvid,
vlan_pvid_port_set and vlan_pvid_port_clear pointers in struct
rtl8365mb_family_info, so it needs no is_d() check.

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
index 86ce581..dc5db50 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2479,11 +2479,22 @@ out_unlock:
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
index 509e9fc..aecfcf5 100644
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
@@ -123,6 +127,12 @@
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
@@ -174,7 +184,7 @@ struct rtl8365mb_vlan4k {
  * This structure is used to get/set entries in the VLAN membership
  * configuration database. This feature is largely vestigial, but
  * still needed for at least the following features:
- *   - PVID configuration
+ *   - PVID configuration (family C only, family D has no VLAN MC table)
  *   - ACL configuration
  *   - selection of VLAN by the CPU tag when VSEL=1, although the switch
  *     can also select VLAN based on the VLAN tag if VSEL=0
@@ -1220,3 +1230,192 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 
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
+		ret = rtl8365mb_vlan_port_set_framefilter(priv, port,
+			RTL8365MB_FRAME_TYPE_TAGGED_ONLY);
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

