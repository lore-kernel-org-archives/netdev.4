Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340673;
	b=m2vxjLyS+NhRK2RyhAdsWkivR/0irZ5TcDx0k0ZpUDA3iRm4t3cWra2xmURyvDVEKfKN
	 9/6B7kEqIArNeIj8jTDSl77W8cX968y7XvDkcyYrONLIzdXZXA5LZMk7crju7PJG4PFrr
	 mkXunVLAwyaCUFoKutrOglE3rnvVyElsLj+ZCwIowWQIlsbvQK2A9dzUvLoFXgFkaLBVX
	 JjF4PXEtDRwSTs9TWZ4g45ZMtNtZ0Krdpwn9uyA6uP7h1lkDCkUH0gRiqg+kQtEj7vAMz
	 r1UJ2miV/cxPhX1kPu4ohjhxoGRlvSciJsO3LAO9Fmra+Lwxamz0J75NWBUbe8yapEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340673;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=aj+gIXgzMv4AObQT101jv74wXWuyJhb+y0Qwods1qKs=;
	b=LLuAzGZPeJKvz4mmOxaeM413dZ7eVztS7DE0qQq/ir1xr0Tbg3R6h0ubQW16eMkqeFRb
	 xscpcL1wp9vlQbCDT1Nhb4Q97mJMfQB0dfHbAB6TFkM87958vUp4hjsFxiDj3aIBDNEFp
	 OTvPM72tQMTv6TcOMdG2yDAJZH5sE7thEXpjvuU3z31cbUsgS9BmuM7oR8ioNqFu72xqC
	 HSr4SS7K/jQbLLDxLKFpvU35u1h+zoNwS+kTJc+Fe2Yto3Gg7AqdYtACL3/AlP230/RB9
	 +eYojEk9RGRmaaIWQhf22VCy8RXfksWtFZd9tT+xs4dyRO0+Hmjk2abefLrz6rzi20Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=MC8hL9lE;
	arc=none smtp.remote-ip=66.163.186.204
Received: from sonic310-23.consmr.mail.ne1.yahoo.com (sonic310-23.consmr.mail.ne1.yahoo.com [66.163.186.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD291606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD291606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=MC8hL9lE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340671; bh=aj+gIXgzMv4AObQT101jv74wXWuyJhb+y0Qwods1qKs=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=MC8hL9lEV98KeZVZMQW1nh8VfRnSOUHbFPRp+ynT8Yay7C/FVqkOBMPu/T45ug10Zo/eshE6mqkVbM/VW/SxUL3FPWKT4wHKjdn3q5l0U9gEeUSf7Cu+FCS1pN1Z5zQY5p/RAC++oBCVzubCvMJU4/G6Fsj0yOgr+kwV50939zfzBmIspSdsMWoAqv95Qgq1fSHvHHx8tdVJyHi5rm0GsJjFfFcY7B7kYC1YxIhKIeIHJlbAKHyrmUcwt5tUbV/knl2MdkTemAV5HlySLcBm65abbXCmxb0nHP323quQ3+J/F76OZLGFuHDkr/dFT8KG2aLy2tJ3Bd8XnTK9pSfvgA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340671; bh=xxqEnwgUrL3t1BL4gZlsJ2rfjWHz8fnmU1/mY/PZ1cd=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=bou8l1D300W2mjNm/ZlmtZ4J8pexSxgjMAVwF5xKyLkXlYaqYgPIGifwi0INBAGMhrOWObLHhAFtVl5lq13kboMG2mV5rSHmIFqy9SSM1fhDYKhZP1E8Lrq9HWp3rs4H5bKogcHtRF5xtE1d4UnomoZuErrTLHpsk/SgjUKUBqApedoz0/j+tsjfLQz5vaE0cG8dE95PhmC0bfkx0OgJnM9VOexjqYl80mmqfVOpqJeACFPi/CUeiZSf5LDIS+uxLH5+9cDwiEreZv7deeLL8lt4+wNlH2LKoKUT7jzSK8vBV35m+Fhs/52m1aWv3gjLUIblbVIbZDC4AqQERbnwTw==
X-YMail-OSG: 4bsm9akVM1kIT.WMXKvVWO.Dezbhu7aMelz3JS3ld4PyQxif37tCb8OkLAxeve4
 0mffnPJ7REVswphOo0e6Ro7sjRgU_tR1PMKSgukzn3dngHLbK9x7ZM.odRVdJPXInunCpKBCPx2A
 iUrnaiwMJLs7Vv9S_5pd6m6RCYO.sXdAlueApfR9xIizlOrX9CBRfrbjQv4MyEUoRHJsrpf7D8jR
 ojYCgnzf32QakQBN91_DJg71fCNkUX0kRcv7DG0vX59JDQ5O0gqoXHuNLQH9oetQwWQduHKDqCTi
 HvvkFuKeP6frkigC_ySs1G9w4FycyLvr00wMFiU7GIemuDwGmbl5dgb24XqRt2swJARRm4oi.9aK
 C6hj0CLzqYAm913S3CaFxoyzGUC3_O1MuLxcAhYrL0Au5sBZ6pfK1kA8s_SofoMiKoR4061nFkRY
 7jPklCI7fL3W.TZDogMqX8lXNZ4p7Zfo5.2kWoVYy8OCqwvJBeM2wEDAaiWNXlQA_Eu.Pq_6Z_jf
 noYBP7iV2COw.YpvrxI_GF.8CU58K1R0Wjxyogk8TfdHex5AHFxqtQ9EgOyBEuetGZHluUqe4LXw
 qD5VBSirb6OutSaGXIigzX7waahwH8vstWala_KBeQXwcuFTuMcipdsj2R6BvAbi8kw_YUaQMp5V
 H37psAJjUCwH_rtyY.p.IC6mhrKPi3416AcX2wXuUw27.WcQ1IeZykkvJkZSm2rm_wUqzKo9gGxv
 jcYnB791X69bbdDSuIzTa4d8A23_bRihdOjc4tK3fZKM8SuZs6d1IR3_Ez2laeqvK6qpk1Vnd6XL
 hPY.r0MjT5cBzNm9R5huqWPU5zMoAZYuhgGKuS6Z_2avGTivYC6ijMkVEvXzuHYSdA13KFhz7wCh
 IH7Q_reJJmPQilI2imeS6NOeRMCEQjqptt3H.b3TsubXXaC6wbDJtZC6sHpOg8.rUS_OkaMcwf3f
 VfCeKpTe6Votm6yb9v05W4MZiAg8xZKSUz_jHjs_DSXW_6VMmZBTon0KjvA9OTt9ndaiuv9eENiM
 QR42NOK91JLyC5augxh3PkLuIpdbp6yiyIjiGrxGhZaMmFqRFohZEAIvUoeGxMlVpAr1wNJvHZX2
 ncfH5BlHpTsOyJP.Xh103NvG4wDT2khXUiMwy1nMqkm.WuTbmhax7xwmlSePy_P1Zh.2_z.0z8yb
 lNI0Hhrv6ezTZBn6I75U2e01yBRdWOK_gTNzlyYZjM.3PLljYFE19rv3M8edQuwNPC.NqOOZLgcn
 bBZJshKtSbcmanq8uiUsh7Yg9DmfYCf4CdAC_.n1I3A1RKW6OBxOE5LF4elBT39C1pb478dcZ.zX
 6nUv.uftF5Py3idE.FT94_3HGCblVssZ5cU9td7fTil30SbliVoYYRdyj4eQYnwqFe6rbvqsDBVx
 IWf1kQ58kHycghqEw0SYfM6INzT.O.mQRXbg3cgqroAd5rm13C7vXakO4Hvr5c1G47WN8dBWEOEs
 0cK3PFhZkkjifmkVO6o0k10I0HAMfFbcw5QJUAJaHRofUziV7.Wmem6Az0v2cZZ7eyCfcPG95cUm
 a7Eyb2nCzR8JNUrBpU_eBlGoeq5KTxyx_OLvBCGFRYQ38yuHEHPc6eJSFo9wlJFPuohpTS2o8CNE
 q6xzBfcH0Sq.jwcSzqK0kTsRng2ezwzcTdVf0yDiK8XN09_yy6fffjbp05J828D49kBGnfKK.Cro
 ZHMV2_vJoyVnqNbGp0cDcNTdeu8Hhtp_iMq9z.rHwL5iiJSTP8r97WkpsnesgEJwI3V567rDj.EF
 CZB9f3CDsmHZpQEGYZ1OPvDYE7w.d0s2RhZNb3EkDxb4gDXl1TQw60YyjN8toXitmKi_1FTxC7KY
 MIvloF0Zhw5qbUcARNRtfQ_HWhmzi8YDgPAW8G4N6nSAkSifQzcB1pSKGJLcK6Eiu9y0cG0jB97K
 T.8.mQaKDmDs7UI3WiwHnzriW34QYPW3tlW2OxQeVv5A4mqqfFnKzXH_7MDztSCESzEG9Ftz6Cpv
 uXi2yFWN0bdWb0yeYqOWTBnWVlniu9Pndy.gRCpHnO.xRXfTdgk65koKLLq5irAJbWFQutj8GBqi
 _scYqagngLz04Mf98b0d8NPzA_owtv38UeCxYyG272XremUgutjylTz.J6zDUykqdzuKtaXW2rmB
 333AAcnujRT6wx7IaSyJGEDAwN3Nhw4HRq6xAtMdsNoeURZIGbOrkmrOKyEK_R46xzSEKm_EIG7o
 SRwNh3Bur216AwvlxKxv3kHFaE6b4DFVmIAejRQ4x9FRxrm2Yg.Iv0d5dXxCRjVUHiJVhyf8fQdo
 tnJJ7holbQJoyCISdO1yAxUepjID.zeFgVuPTUGTVZZQ-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 14d03a2d-dfe9-4d1a-82e1-d836b547f1be
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:44:31 +0000
Received: by hermes--production-bf1-8768df57c-zvbfp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 43a1f7e1d0c18464bcccd418607a7c48;
          Sun, 22 Nov 2026 09:44:29 +0000 (UTC)
Message-ID: <a1bba585-c85e-42c9-84cf-93191bd53daf@yahoo.com>
Date: Sun, 22 Nov 2026 10:44:25 +0100
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
Subject: [PATCH net-next v13 08/14] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
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
index b807835..2e4d8f9 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -846,7 +846,7 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_port_get_pvid - Retrieve the port PVID
+ * rtl8365mb_c_vlan_port_get_pvid - Retrieve the port PVID (family C)
  * @priv: realtek switch private structure
  * @port: port index
  * @pvid: pointer to store the retrieved VLAN ID
@@ -856,7 +856,8 @@ static int rtl8365mb_vlan_get_pvid_mc(struct realtek_priv *priv,
  * Context: Can sleep. Takes and releases &priv->map_lock.
  * Return: 0 on success or a negative error code on failure.
  */
-int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
+int rtl8365mb_c_vlan_port_get_pvid(struct realtek_priv *priv, int port,
+				   u16 *pvid)
 {
 	struct rtl8365mb_vlanmc vlanmc;
 	u8 vlanmc_idx;
@@ -870,6 +871,43 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)
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
@@ -932,8 +970,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 }
 
 /*
- * rtl8365mb_vlan_pvid_port_set() - Configure a port's PVID and associated
- * VLANMC entry
+ * rtl8365mb_c_vlan_pvid_port_set() - Configure a port's PVID and associated
+ * VLANMC entry (family C)
  * @ds: dsa switch instance
  * @port: port index
  * @vid: target VID
@@ -947,8 +985,8 @@ rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
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
@@ -1040,7 +1078,32 @@ undo_vlan_mc_port_set:
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
@@ -1052,7 +1115,7 @@ undo_vlan_mc_port_set:
  * Takes and releases &priv->map_lock.
  * Return: 0 on success, or a negative error code on failure.
  */
-int rtl8365mb_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
+int rtl8365mb_c_vlan_pvid_port_clear(struct dsa_switch *ds, int port, u16 vid)
 {
 	enum rtl8365mb_frame_ingress accepted_frame, prev_accepted_frame;
 	struct realtek_priv *priv = ds->priv;
@@ -1125,3 +1188,25 @@ undo_set_framefilter:
 
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

