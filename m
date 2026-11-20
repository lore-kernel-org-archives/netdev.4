Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.190.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133118;
	b=Hli2KX2dMP3efLu2lcvSE1LWADs/bU4SXNhFIomcRWtVKdZYblaH10JUm2+vkQzwU0oI
	 ANwgqThZzP9ylk31+70beL+1EsW3Krs88ybH6pioJz0EX6hnxwc2nt8fZotvydkHGMUWY
	 kXKdnCWEUcOM0PaJYOlft3jhc5yaTvHJDdcPcWGJGoho44Hb8bFdcKOlch71+FVdBpFdF
	 UJ+Sqn4YP0nbmdfmiUINsgu/2p+/w5oVM9Xf2x8MIH3pCV/uFUCSnsG1YjMx1vi8SV83/
	 3BPtnOzyCb3LW5Ypq+DAh7nRJST3fUo5FRjASIsNWHQCrvGiX76aFi6B8hfNs1irlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133118;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=/lKRRAi75n4yU4N2MoGl0oUd6fHgd/Qej4Ck3MGVzos=;
	b=FoDaj2FFGFvH9TbTjRJwZc0CJp9Z4dsprqJ3EveNu3Lf/hbnmxUD7E7IBSKf33IrGGOd
	 +enb2FWUuheRjY1Sksc0BwzFd+tuGQK/eJmigWCAcktjZTpauDPVkkNelhACMcHXw6YDm
	 EGALXubpDrRU+6hUiIqnPXVgUA9NKVY0aGtUOEpBQZCvB5DI4hNZR1794BEVN+MZGcG3R
	 WEVIq/nhdXNGZFE4taSLrBku4NHqQvwZS3RDMbsiqlWP3F1aNY1ezT21mbVL2x1FDJwJX
	 EwzqIiJqLAnNFxg5Zn5d6cvxL50+k63VPoRGI5shb8D3zVnOmRus57fo5/uljp9Hl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rJpniXqo;
	arc=none smtp.remote-ip=66.163.190.33
Received: from sonic307-10.consmr.mail.ne1.yahoo.com (sonic307-10.consmr.mail.ne1.yahoo.com [66.163.190.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68FF60A260E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C68FF60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rJpniXqo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133114; bh=/lKRRAi75n4yU4N2MoGl0oUd6fHgd/Qej4Ck3MGVzos=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=rJpniXqo7qPHDOrQx+LJLi8nXfDWrCNBRzlgR76nc+p0s3WgrqKANnZnEMb3flYWPaeE1bXX/X+xKvVBYf6QgXMUv/6RY0zY9+iEvYmaszXYaEW6PfSUeeQ2sR8CMG10Ua/tVV+fcm2lS7ITA2Zx4xhS/BUEZgRq5yt09qA14ALpzQQroTtHMkT5ugpOLxLZQTdG5R1uiGkuItjlNsAjKJRNwb0U0l9h6YMqr6e+7hQj6ULooEMkA6Msi4HbLqH0VsvMFrjf2ouLyXu+m5xBxk/RkebigIrmUrlblDLXuwgmDyVYU75wKgwbR99Fj17lbIHVOigKnZ0GL/0uiaDW3A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795133114; bh=ujhufbI4l8qAuqwPSo+GXlvhQWbA117cxjvtv72KFjS=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=t0k7zhJm+HE8CiYkfahGhSclvfxKFW20VrtpTO9cxVVVuYNIeQ5jdxsCtQw4XfG/1rmU5U2gAZvGzYm78MJQHJl029oWmwtcksV/q3E+urAjnE1o78yHDJsWMFIof/7UFSc8OW2X5JEHXuGiVVZDv5imFUiEGyn8yZBij8Tg0uX0qGZvJCMJem5HKIWDJLR8emTQtWm5WwXs9GlrRVXpcEzITskmBroP0E1Ut3+OhDynPwx2purHYheCOVax8Su+LLlnCorLX9UIog5HAUDR6qcGgoY7KR/1pLzZdeS/uQ8I7RrWwtPjzxY9v5vfl8XR/zx3ewPvMVP9FTFRAuBuzQ==
X-YMail-OSG: Jx0077AVM1lMQkI28ZsqFRIrNfXQX43xVgYWQKf1tM5WTfryVMefZq1BD.1EIfb
 U9_Z3vH_6Z5yref723_s73HyP6OCdt06nQ43iTY2WN52kZN.eKlfU3Al_lo2X9gCyELWXotyjwMa
 4HGS2vEubOGByOmqFpK33pxKlbjk67QNDGBnvuRd5yUuuXfgmGIb2gnNe196MT18H7lZmGacMS27
 hYwUxgtijmpkWOJVDiWa6CdPIALSl1E7Fko.86vFu77d4GRWpIKf.HBcPXz7y55WLpZwaagFJtGP
 CNReHyXcAVA4h3TZap5WRHAWzlJn.dsodavRZFE_s3lyxKmDaqwFhFYCTKgDdsWUGU5ranPBnP2g
 fBgkkeboP6WDcZUPkfAc9RpiJBYw_tC7zUz3E2K88CuQkFxTmW0HSeYPGcSfnz2QdZcrNcKGw3wG
 igM2B0PYsFNBreYDcuDRyp4lopOF_EWqlh_L6gmHupaRP0djWhNf_sFm.iIYzTi0pC18Btuzx6iF
 bMMCp.jVgJaSACNkOBYRxudw8pszT5q1Om34ob3Ui7a8XlH375vflRrG96J2zZNoi_NEDbu_Vid7
 0JDBr75un_p5aopUxUxRxn2dc0lsBLyZnmjSdRb3Zo0vKls5nPnWl_KMBTpOH_PI1tk3YvnsR87B
 BuXzqOi6dBpgLL6b2RZZEba_UvUonxyh0Bp9zsu1B8p14Dm9Z1nJCuKIV7V45kjONN5jy8K2IwYp
 Zy_ggz9FYg8Uc9RL3kbEwjafl_xwRy.q2FekrVUR7VYJm1vtwR9GozL0j_9Y4CrY2eTERMKy93i8
 dZoffxcmW7md7._3pieCs94xfQTuGdMN9XqU.EUjNoeeIjzNsiOHEWG1FHPGAk9i8CimBuQyGcvI
 2Fvr2u_wopvUMoYHSeVIgRpPPcw.ppAHHJvul9jUkfgcqQ2Sk5Mk2TnLyjz3FPVEMKsWrGfD03Ll
 SOixUllLOVZFyEI0HvkFuD.5nn_Rj8jCD1EAGj49Daxrotra7vUvFhYbDEThO6ubsmXwcsC43r_w
 ImEI6NKZ0Fj81KjDID3dSmjDMl2mOyfg6hw6D8BiyB58.eta33QvWLfXh5LNuStlcmztfTWZkTv1
 9dCHlwPOVlOks1h5.Fz6OImiVxqCWnx1nXq3WhAfH_xDAZpn.6P.DKMYvtRjS8GXPDsjMkAKvtuG
 YU45JMxQItXb47nqZG1_SxiD1.zdBOp1_Uw8lH8XAnZevRUPeHvUd9fTgD9nTrdW46tqn5X.6DtW
 2guKnM0oV78AV4Kd8rmRzlHxDN2vVceMp30vMwCw8LqL7n1PUfzxkwy_OSaPldrd90k3T7yUs26K
 7JsHEP3bOffbQWY2tA04FjSms_ljx4IeBcRkXdjyrqU03OTFCBCMI4g18uS_i_XmLbPawg_qmcRo
 a765pSZ.g6D68mirFXazIW2vjRN5_XzZI.s3oG13GuzPOc1DZlsiBJCyal9fMjQLUuDYnEZFsxJf
 EGFgV63J9BRj5Uxs3GUHo9DrnPiXEqubY9gEGUpuBf2nK34nfR9KstEZSvq6PFZMEfUXVD563J3X
 jkVNn_YQxVCPbzvohFqbIb71HH4c6.098R6OR4s6Y9aVFXvQNtOS6GPz1G.0q_7pCySuD_otRwH1
 heWRc8Sos5fqVSkBp7sbDuTlbQiXHE7Z1xjBT0wiMmFfrlQ2ajByujWal3vA0_hgFAM5naB4mjh8
 l9rTIRiaVr03AHIsgzjUVodS3IQtSedoE.Z3Q.ZspPw5DUsCIWXzBo_bJx49jzJnXMz8sIQxwd9w
 qBCdkO08idF1yFCq9WAiT322_.OPZVlSCBH.AKAp2Y5pcE_ybnsBVsAw43_T.iK7pbRVhyy6rwFW
 3YAHAhFR___Wc54n2ayFiWr1JcaPASwa.CfzbRxPA25QbZx43a_KNvPxrW_sGEBQ16AkF5Aywo7l
 chBQK15j4NNtFAYs3E2mBAwJc_tOgb2md_DP1s8RBBtwTsWK1In7EOv7VJ8QRCnVn4qGrOizAyXh
 94hxmzdDKajCLN8zcMdtlYZVokMFXc.x3Szd4FZ324C44oPEJgupKz4t3NNJHWqr9Uww.HqrRRjo
 7hP8UClohMdxI_wY_mFvemLKhyNWFUlINhI6RHnNZLR0LK3Q1OE8.5ae17Xl3XYdSazEDuSxkB_l
 4cOiRcTGvLvJuX.n1d5wuzc61QKtsPBh0U3RVg3hYaWRntuHzElYYMavEmvEnnIgP4Rwp0Tw_tOq
 3l8PIpuQA_l9.JjJDeVD8zhLDzv3xdprGepxdhTDCyG_m0KGVfoF2rUoiDqLrER.gEzLEyX_8kKZ
 he9QBM9CFgSex7KIkNrXfvZOMZb1zjdn3LFoBLKOkWcG0ZQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 14447918-8869-4f37-bf1b-768fa57edd9f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Nov 2026 00:05:14 +0000
Received: by hermes--production-ir2-7c4859dc89-4b66q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 100bb70be6e76c16868100c74e665058;
          Fri, 20 Nov 2026 00:05:11 +0000 (UTC)
Message-ID: <e5b0e0b7-6c68-4b9d-ad52-f83bde5e32f8@yahoo.com>
Date: Fri, 20 Nov 2026 01:05:08 +0100
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
Subject: [PATCH net-next v12 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
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

The PVID helpers (rtl8365mb_vlan_port_get_pvid(),
rtl8365mb_vlan_pvid_port_set() and rtl8365mb_vlan_pvid_port_clear())
work on a VLAN MC table index, which only family C has. Family D stores
a raw VID in a per-port register, so it needs its own implementation.

Move the helpers behind struct rtl8365mb_family_info, as already done
for the VLAN 4k accessors: the existing code becomes the family C
implementation (rtl8365mb_c_vlan_port_get_pvid() and the like), and
the three functions above only call it through the vlan_port_get_pvid,
vlan_pvid_port_set and vlan_pvid_port_clear pointers in the family
info. The callers are not changed. The following patch adds the family D
implementation without any is_d() check in the shared code.

No functional change.

The family C functions are not static because they are referenced from
the family C info in rtl8365mb_main.c.

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
index 2269ac9..bb3d7cd 100644
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
index 858cf10..6c27100 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -827,7 +827,7 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_port_get_pvid - Retrieve the port PVID
+ * rtl8365mb_c_vlan_port_get_pvid - Retrieve the port PVID (family C)
  * @priv: realtek switch private structure
  * @port: port index
  * @pvid: pointer to store the retrieved VLAN ID
@@ -837,7 +837,8 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
  * Context: Can sleep. Takes and releases &priv->map_lock.
  * Return: 0 on success or a negative error code on failure.
  */
-int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
 {
 	struct rtl8365mb_vlanmc vlanmc;
 	u8 vlanmc_idx;
@@ -851,6 +852,43 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
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
@@ -913,8 +951,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID and associated
- * VLANMC entry
+ * rtl8365mb_c_vlan_pvid_port_set() - Configure a port's PVID and associated
+ * VLANMC entry (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid: target VID
@@ -928,8 +966,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
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
@@ -1021,7 +1059,32 @@ undo_vlan_mc_port_set:
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
@@ -1033,7 +1096,7 @@ undo_vlan_mc_port_set:
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1106,3 +1169,25 @@ undo_set_framefilter:
 
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
index 625d4c1..62ee59c 100644
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

