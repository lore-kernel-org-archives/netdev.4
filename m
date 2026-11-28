Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.188.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795824306;
	b=fcI3Q2h1/XNV4dIAIQzUtp0sc+MuSc4bl7ZTlAW8vHG9X/PSe3BG+KOrpTJXfgCO5hgh
	 tI/XyxiB405oL5AnISZ/rTxADHf7hmFQsuHgS03GiqOolXj0wTS59KZ+prR4n/3PM1p0+
	 Z1awLrtS6sWnzwp6AUdxFl4C5U0uR9WgAdDN2YuC+d+QjaWSwDtTnKyMFEJ+a0bMOjyzz
	 12oH6F+YsorOv3jl6E9XW+hYi8VLm4u2earrLKfv7du87J48yxQvmCPt3XsqHSqBpQlYn
	 qyuH9tJJDwxAp1+1cUVrDT625E98NMoV7hbAEpB18O36b0mrOzpyKjuj9uVLDfcL2bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795824306;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=kDNW8cr0duM1sWMhuG4CsMaYiELUooPiHJ2jeAeuHmQ=;
	b=l3n4FMraQep6hm+wU+zappX65Wxyzs1KfjXqmq79b6wnFA5eUevr05InbzIjHez9Vsk4
	 yGS9EAueit4JPmkDLEmN3LfLVjfmv9WJMrmVCRo2nt841AWjy758OtbpVc/0Wsb0cEwP7
	 PW3OmPyqXLz2ygX5Cn0MDb6NjZUGIy/3fGts+ooTVJ+MEIYYP2tWS2p54hWOlJSaUdoDu
	 /lfrQAwfctLj9KymTSIPh/oaXqFSmIK7WnXST9ByFtz3jb87FwTu24FVhg0oSsMn84Uan
	 T8L6i/J8WBfQ3qh8M+4gPltFghyBWSbHay0BfRBLRkM2nQhltaQBZdv1HPbXRtXH3/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FXmLPGTU;
	arc=none smtp.remote-ip=66.163.188.148
Received: from sonic303-22.consmr.mail.ne1.yahoo.com (sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14B2606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=FXmLPGTU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824304; bh=kDNW8cr0duM1sWMhuG4CsMaYiELUooPiHJ2jeAeuHmQ=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=FXmLPGTUs1nQ3wArJPwCHYH5gIua7/Wq2VZXCrpfMAGr8yJF+c/v8uPOoTfdNX7RlSOt89IV2fQDr51v4i1DmPxiiM4nvYldbw/prUurpfInMijJnVE2CuYI4Q7E1lUbfGMCirOoOVrn4mi+SK0luF+jHqdN/8K9Vr0bM+/6ju7XB62uXFiJ/W9IHS5O0s8CAQ41DQ2IBL0EazN6vNJ6Dke9cObgR9Jgqs3jXdYPVgQc4mAlxRg4q1H2+P0qfANg1OQvXAzGvWGCBBE4u36zl/r6H1NyUBAYQ3j3f/eyuhn5jjUAQRbsXVZAMA/qUzMSoWGYwK1J1/feAL9WRohIFA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795824304; bh=oX13wyohtEA2xvWtzxMF0rkLFaKsshSaZuDds6j4fDJ=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=uStbDlgI83uKI++i6sM/xC9UIo2XT9LymOP306K0m+X2dwGEqB5FKW2aDXUSbyITPymneFM1RpqSzTl1dSSGwi9WFf3qZXkJT55Qr3JMJbO+CifzALvGImM1n36fz69nm4+vrDVWxMgLC+UZKjNEKB6OaeEw9AAEOeU1+Z3KYwK3IjQHf+t7JRidJo/BdWcpqWNAQ02vBoDgaDfMw6M2QthHVrBjoPDQxIVfUBBqjcTwSdp2RfMDMU793qUZP1oQmDT7d999PLLIjotXf0M4JsA4ClVSS10r8n4YnOkcxayVI8zySelVgXByq1mhQb8QuTzmBKIUyH7VasEd2FCGDw==
X-YMail-OSG: Iac43jMVM1n3DeIaJ3iUr7KXqtO6VGT7ubyw_YiMtRMCjZCQvcQFIXs939aXeuP
 zQUK9aGQ4gEXcwSHM0msI87x5tzJPXBgqsvk7eH_5KQf5.jy4GcaVnkKroLKMpIBa2FvVXkEdQlc
 Nah9r4YHNPrOgJBbglFHXhv1fwKEfb4vhN1NKGNbVMGtulb2osGEbVXENAl_iR.bu3mXEJnbM.3o
 ugOVYjXtRxANse8wQ1TT0KAWsbq8UVWEWYy8J5xCBhblvSbBbhnWFFiZ8yj_hsG3UNC3aqEiaXXx
 Q3bjno3NiS0tuBV7.yOlVCOdH1ZCF56tNR5Rexua7p8PDwA9RnLdvwIOzPIE82kPiizBxYnAcFIf
 2g8SKDUpYpt6lq19C8YZooVbpWqIzJAX8OpnMVIP6n5oEUgwdVQjZcTzVPOlEGYz9XvP.5URs86Z
 uFMpxEMrUxjDbTkEB9zMHBiMmeSeHkKth16wXZicw9OnN4vN3Er2FBmBaBfHzTjix6SBb4QUjTzu
 yfZt3Syr9Fu49Mzgf8DsF8.9hywHYJOMKwEPHV5P0qhEEEdFHQIHlS0z2PRMr.7M3UQtKiXZDauy
 .xRpfEn9omGFqWEyQWDjAAu0YfQFW9nkUEObw_gInqazC_b2mhtRCmbzjLyyzYXfQ7BjaNuE.f2L
 c3XMNv6etcSZYPmJ5Nfat_sHmiLfhQ1TyuHyxL9lagCZFnNmECQwW5ItIR1y7HgYbiQAQmT2nL3M
 0McaeCyKM6JPMXAMFVLbIdORU8EKIP7.l.rcdBL3lBiD5VIjTHvakUCW4sC_unxWPMKKKHEzFiIt
 flPJKcc31l0ybtc_DqzaYFdRCoLdPdhCqxL05ZF.7hjOZQtR06zfADTlel9zOOPACM1lGOKvzgWo
 tCEyA1K0Y25as3uj6km7zBqIrzgXLugAhTnbYXRONPak0chT84xPrtHu.3yqlHuEPw0OrHbTx6da
 RcetqEER5eoXsUOaRP4HXZRNRQgC.UAtzSFkIoONWDLoIj0kwPmM1nwGNN.2CrtCSdcA8oMcSTRs
 v3wn_oH9SGytpz77oLkRykNR.AhzRv47wF7kMi2yXJ_HEo.AROJbFwxfpkvu53tuos6m5Orm5cpg
 0PI0lkixDgEcP6fOY6aMjDMxYx2TlJGcDQGWNLVDFeAEe21PsJfiGSS05__S5T9B3v60syx9FO1X
 OwNCyBhuaHmw9rI6AFDHz6ETEqtT8OClMZIH55_71xPFF59.pNaBlqDnTD1dwGJ.a1.GKP817rkn
 Fo4B3_JBxmVUQ10tiT0BCI3gOJlR_6ag9oHu81bEWLFS0EQX0lBqRU4omjEi.jX_1sZhAdchfBiV
 LA6.EIeN_ejNpPsIbU.g2b_uwbnsOwund7pPhWw5YrO9DMePA0YgZ32pD66pldD0ky6mW3ceglYA
 i7wBkjDrrxu9ymN.AKsP9iLgBKNlZN3BNsnb.g5Y0I1BjgWmBc9bGKJGUh8ankF8yK3exZaHQnVC
 nvZscBvjrBrvAHqisrXPFjSMXC92TgW308kit99dzVADFbs1YsDtw85OMLkvdM0g6A_YuV3jWiVU
 ROglHsYYJzCKW421V2UaXPQ4Qso4OaPIt9fJmLrHnTom6_p4FnTcUpjSsczLTcIi_vhkeOmuTh2l
 4NcRyivXESWqdelcpPLxSX1UbiD05jarM9o_oLw4kmGHfrl42XInu1d_6TAGVd2t_KAH5ofASwF8
 7DGBg75ye63eihofaZzB5gw2IQxFn0Hs7VdZVe8abPXpoc3sgRU38_x9sjvLqUk61R6xpron0_3y
 F2uJ.25s0Llh12oPmjnPgqkmiXFdSxba5id2KQAxti56mmNiLfZUlNHwZiJCHfIBV.B1sV7crWoX
 oxvt93Goj4zhcsOHmD7gu8rXtfm1CCw.VScbpcFKgrsUHEwfCji5vjvYjkg.sCaDpZhIP4HTcteX
 VPygroMNfgNcRHbqbmLQcRDXpIpBealKVY3sHoT2Exx42BYr0IyRos30JDwcBRvYiaJ2tcEr8k.h
 MVsbIMGLtK3Jz0HuZzY1OE4oNWYeJAtrmGzX5LV6Cwbvsv9UMdbHjxWLgRT1SNTg9TBM6JlIXF_q
 dh7.AdbNyBjuB_qQOyGVkVk0pZvxfrTBK6Lku4edRoEN2EIUe9GsGtxSkEfkiE.HSvG3FdtTHoQO
 _6J6VKj2WDxX8hqLcYzcOrap.8aqiNYY8sAT5K7x2UfMs0eODMTfuTP5agTEhMWbGtxr3DPpSlwe
 AKjV0U9EItO8n.7EFe6p6l3NVYd0tK7fMQKWaRsB2UyL.9ItKcAryrNImmbs1nFy4zXQ7b6MAYdH
 zSXMKi1vhtrba4zKdMNS0Wle669jweFQq7KhHuk4RaHSa
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: e49afc99-d8bc-499c-93d4-a5c45f9f77e6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Sat, 28 Nov 2026 00:05:04 +0000
Received: by hermes--production-ir2-7c4859dc89-2h64k (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6aa8d7f1a0d4fbff58a6d2af6c833e98;
          Sat, 28 Nov 2026 00:04:59 +0000 (UTC)
Message-ID: <8e8090ad-1d38-4f2f-af48-f1bcd93823a4@yahoo.com>
Date: Sat, 28 Nov 2026 01:04:57 +0100
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
Subject: [PATCH net-next v15 08/15] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
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
index 7b6ed1a..86ce581 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -765,6 +765,10 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
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
index e923c7f..509e9fc 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -856,7 +856,7 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_port_get_pvid - Retrieve the port PVID
+ * rtl8365mb_c_vlan_port_get_pvid - Retrieve the port PVID (family C)
  * @priv: realtek switch private structure
  * @port: port index
  * @pvid: pointer to store the retrieved VLAN ID
@@ -866,7 +866,8 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
  * Context: Can sleep. Takes and releases &priv->map_lock.
  * Return: 0 on success or a negative error code on failure.
  */
-int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
 {
 	struct rtl8365mb_vlanmc vlanmc;
 	u8 vlanmc_idx;
@@ -880,6 +881,43 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
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
@@ -942,8 +980,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID and associated
- * VLANMC entry
+ * rtl8365mb_c_vlan_pvid_port_set() - Configure a port's PVID and associated
+ * VLANMC entry (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid: target VID
@@ -957,8 +995,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
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
@@ -1050,7 +1088,32 @@ undo_vlan_mc_port_set:
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
@@ -1062,7 +1125,7 @@ undo_vlan_mc_port_set:
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1135,3 +1198,25 @@ undo_set_framefilter:
 
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

