Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.190.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133168;
	b=iNcBUm2eRJu2Mdvxu3r8BKoQMgV/QQLdEFD04/0J/FC7nDJrW7B+av4VMeLJfwEDMXyj
	 V2c5TyRMeCqXXEy9W23LJgrBYCcnckgJ0XZc22tq0uQySNWRRL8O6V6hF5XK0Wf3p990d
	 ADjdZd4pcp8B3nNjZqbLJVwETnRx4Dbaw82iL5Z07l+tdS+tY/C2SeBzhbbSZmjQ+qm0p
	 WZmz+xGz7nbj/L6C8MxyG9ntTpSiXCGWk0CrnsYlzZ6s/AE4W8cHd0utu3dXN5WfBcNd3
	 N9WQD2ijqv9bmyUI9v6WjVfl6O9ednZqx1plLNhwyX4HHAc8cFhGc8A8bNjROH638sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133168;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=VY0z4ubjFUO6e0IUf1LwXzebZ/WexTJ9dug5GStdpiM=;
	b=bpnrWbccPYzvDyO7uZcG4YZQkElyt2f5HXbSpjuO2jbU3kUqsnqStZESZQJjArbBx9Ar
	 rKvkh+veug+XNLWcsVtEqZPdIvzSsctNs46G5xVeYiQn9ClxtucQpnlXHQbvSsmvBh/V5
	 /NkAkEp2yr/fieRJREiP9YzUiDZkcDUnJ3Vm3xyV1OxKci/9UxrqARGF/0hbIkCrYM9B9
	 +MckN33AMPkxTROgrEpIuGdDIIb8E3SSmB1m1Litq1LKb4TPwN416LStKCzWIqkCBYcax
	 FBpoKhdnetYuOR3/8PqTTc4W3FNS5VYygffDFuC9bFqxteyjeC38BYkv0WON+zrvo1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=Ssa3Rt0M;
	arc=none smtp.remote-ip=66.163.190.147
Received: from sonic315-21.consmr.mail.ne1.yahoo.com (sonic315-21.consmr.mail.ne1.yahoo.com [66.163.190.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F71D606A33A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F71D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=Ssa3Rt0M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133166; bh=VY0z4ubjFUO6e0IUf1LwXzebZ/WexTJ9dug5GStdpiM=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=Ssa3Rt0Md49oD3afH0++dtczYpjwzHA+Nj1D2sd+j6YG0VjKcEFhaglmfJps89s+3ptgy7IorbF9MgykXcoDxb3aCMmuM4zkxykZeUOTTl7Aa1WpRvqRQFHZ54vbnOB6k5T6KUnsKl/PraokRedCuD3fEwSHoWfcRixUIdv+nujheizbo86Ml4NIUTvmfA4eZk89WexC01RVsw8+TGrDThudZdxDSAO/xEW1UEWFi82F2wa9f3HbE2Bjt0kewvLDDopTwi9KCQ7ml/p3gIo0MZ50wbbr9rWr35ddRp/os+wugKlbynIrM1PzWiF/PWzg6L0fYk3oZf9zlVte2IYaIw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133166; bh=n0NcWkKEcUmnzVjk9vPgxs2MLd/i6NPLHpwgZOZPsUB=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=I4bmsMp4qfuwyL7HZqHnl4dapWzMgEjQquebjGmZsPsQ93aRtF+c7qsJ8fSJRlPJ1eIHTzkfcE0ZgopKDtZ6Bq+InOfAgJZwL6ClND3mKS2l3f648Z1WzP3ao7m5NnSu9QXjgvP17Zb/96AmT/uXqGBl7l43FFHJXmSr6SGXYwGmQ0abRhE1bA/E5XjNVRVC0pnBq6fGrsQq8EYmRrIePbK3DLTgRyEVEY+N5JhEqcbJ9e4MYoJriIpQxW95/RU6RhC+GaUFdOiUYy2oFBXwRIhJgzNgIk0Mtz+rp46HfIKf2P1OZFyALbBHBLrHTB5saLngVS0cof318VF0CMxGZg==
X-YMail-OSG: aDTjb3MVM1npGEM1tjJUc1J09jPW7gih0WG9Z3mVpkHNvUxcMayZ9Paml7Vx2k8
 m_OUYg4SOPucnV2LHTdwwOMdMPlS1d20sxHkEeLxwjYNQbok16m_qa5kbbZFXxm4oAZLhvyplkVS
 2AO6ymff_S1yD50KbUT5lty_qPZ0n77AspA.HfniPZ1i0c5wc1U5_JvVGWXjyOp5ZOz8TUFya9dm
 _NfAIBZpRwQetyuITNCmy.yjXzRamD_ml9Ok4MylBTIGw2fgFtvBPH1O8xZIT.434wOqUk62X2jC
 caKu9hf7oqLQPhwJCC9GVjrrbOeEycqR5LFLCo8EQTqMCQYyxnCHS8N8KvVHQPTE7ElMPz3DKi1c
 DQ9OpX_N2wcdxvQ7If_hWjQ5qk4tV9rubeD7J80nQmR.jGBAtN7Xva40uxX.DBnb2hyo5Il0_xTS
 Hk4a2S_8YLhXbKvy0A3YcAeIM_TVLohO6FNK_qiBKNUUlf4Lu3eoIk.8QbeVb55OjLWDidWZQf8B
 lrTnVZvpmtX.0O5Y.iM3zFgKi4NAEconrIJ0av.u.u.JOAHxINYOwU_TOpJ3wR5MwUjA_HrHPWl2
 iUqBAs70nwUxc91yaVy_d.HkUpJlEwbdTEzKcGW.JdlUH9TmpCLrTng0UituAc1gy5qq.H7R980f
 yHf980Ui0128coEuPseplVPCuL9j.jnhsWzRb665.BrS8z8BdyrV_MrzYjlfdrBplopiLId6T.Qc
 uf245gf76dRAbBQqsAUYvesdEyCHXb27n4bw_QVAmz3bXpBRubCV.l2oFTCa3VLK_gmla9YTfkvY
 13VI.twhNUIcMF.CiS8AbC4GSBUE6ta3S5xy1edj3vrxFezHhObjR._k2gDtyDppZ_jp9E9EZozK
 3yLnq1Nm66EiWlX4YvU5uMwgUQR6mAIwlaKxlnAQlUONhhR0gw.gLNgD85NOt6FFW.sSpmyDjLgE
 iuDiWXrFUoAe_i.i1hMK_9tEf9LO_WxeIzfuqFVqLNEcsfzFvEz43sUoAbn8eA3T00XWnuBDE4kp
 08UplEacS1pNLXmpSdgWIlI7Rn.epFQZmHl7nVYi0ni02cxyuZvNuqssH7MFhBd82AAi6EdjqhRx
 Cu8ZCD9gAawPKYaSnOe7BhrWhSHFbhACGITVLUJgVQzWjyOHC_rvr4k6dAVYXxyL7AZg3TGt111w
 vk8f1EZ76v9s_aaFUtV8K.Sjr5j9bzFESAe7ZAlgzDRArTXijF0oyqacP7t.TxHmv9YFg_CaHuJQ
 hTqgTpvgywRhXSF4qv1Outtmxz9vc.UoFwfzr2pa5fqLVbzP_iROgF8vmA7_Fy6Hm03keVsoTFXI
 _yjWgwMS.ZYZd4gnz3ltkU2FzXOXJ425AzDt8WPgnhX2lLTWcHMioMuIg1.tjXMgEAcFBVRQfMzQ
 q3ehy7YXbMtrOVS6mTqNMFtCphnHle6B.dWPoMg4eqMlgwdykAq256FXZfIpjQKyB_j1DhbQz7Z.
 wTVj19LkT0RL6S76J0PpFYN_1vQ4CWzL5ujPmineeix5V..PhvFbWSFVG2WeD4mUcN5Vqx50UHi1
 0QSRuoKpPZrEhsLgkbcI4R9Zc3wZzASLktqx3dZlDHby3Qead..09n_8C2BbUfV_UbFZum5cw_t5
 aQ3x.EloGqb5eFWErGc99sfotTkdxRDevtwJW.fnpkN0Ziz2ULPGlKwVl_ikmBJ8_WykHCovDc8w
 _s9lN1dOM0aXhQGAtugVgpYw67zp3h_0zUfKoBeiFhanefNArXba033AMweWE1HlCP.tbsv5EH2K
 Ehy4wn.yBAzCl.9roOaBxuaFAteb_CJ.fB6voLP9hJzKvkjq6BYIKC52Bl2M6YNlqWLONrwjv5n3
 _m_3yXxD2IpdAnJHKcQlfTC6kPa7QZz_qTjHmFboCVlkvi9b2t7HHCjVAmO1xaRL7ev03mbT6OBO
 tHfXxTXAjHGDYgCbwD6PUdg0FL9YLZSz.2Po91VM3EKH5RVjqRb5QlVb86fcgOkcYQIJIZ11gON9
 goY8bUZaepE.pGIe8hdP90CMiW2rC4LGU9R1teGYE7Fgc44HqR5tVvOojTDAFKMtimJKObnNsMfD
 4Q.2rtjD0gmhhGOB8mYvGqcmkHy.9hMha5rAW9sJLn_dtyQlTld1hRumQnadu3QjBOM_TEAhab7D
 WJBcfYPsBS1O5A2JamMYzg50FdUbDXNiNMsCa.CDHmRO4F4MWc1cziAw9iGlqhv0A7iMtVXJcQcT
 iaKDWjAL40S6PBC30esyEge.rv4CYmNYxKEI66tDxWIAXeonRH2q.QdSeYHfrGc3zwmnzfA4g_ft
 QZ7VdbX26bJKiQQTngZfNEz1fP7FxqibfythzV4QvVVQ9UHc-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 2efe4084-1c9c-4cf7-9967-ddb56f0f0a85
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:06:06 +0000
Received: by hermes--production-ir2-7c4859dc89-9kgzz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a0e7d468a15789d24f9b8e28866dea23;
          Fri, 20 Nov 2026 00:06:04 +0000 (UTC)
Message-ID: <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
Date: Fri, 20 Nov 2026 01:06:01 +0100
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
Subject: [PATCH net-next v12 09/13] net: dsa: realtek: rtl8365mb: use raw VID
 for PVID on family D
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
index 6c27100..3129517 100644
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
@@ -121,6 +125,12 @@
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
@@ -172,7 +182,7 @@ struct rtl8365mb_vlan4k {
  * This structure is used to get/set entries in the VLAN membership
  * configuration database. This feature is largely vestigial, but
  * still needed for at least the following features:
- *   - PVID configuration
+ *   - PVID configuration (family C only, family D has no VLAN MC table)
  *   - ACL configuration
  *   - selection of VLAN by the CPU tag when VSEL=1, although the switch
  *     can also select VLAN based on the VLAN tag if VSEL=0
@@ -1191,3 +1201,192 @@ int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 
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
index 62ee59c..d8187bc 100644
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

