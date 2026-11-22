Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.185.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340395;
	b=a0mNB/xmEuzYa6WoxWF1B3zb7GtjyRkCJUlnIg7iDjhSelo48i1Xlaf1UyPpsjrmSbEh
	 BuMb5+Ngc4f0sl5wIlZ6zqgW1mCyi1O9MPu27JusHzcww/gkTAZZVla8UIkH+7OPmDSQJ
	 OtQ8MjCt2iscBAiYfa0iRxkoAqPLLmR1Gn70Nq65XSBQ4UNJGcJUPJJdhzAL1qD7Sa/hQ
	 1ODvURYYJ/lsJh5ZTZZd9EBtmpKIJgCWTtongVgi1zlWcrXu+ZyLyL1CceEJwJUaj65ku
	 T5hVC6UviJDxPhmAvp7qwJ6aaDzCLjTot5+3FWPQp1P3R2x73DsF6vWWek1hpyF66Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340395;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=6/HVcooRKimsr1B3zu2/RYwE+H54hE0OAuaV4V17dQA=;
	b=Ws9KNtqNcGBnyad5bKl6VONEgx6T9cznDi+rJXzUG8puuZtXWZsUqbfRUZx8X45JJ3mQ
	 hB4Qk5fwzrQafFNRnF1ag561K/av+t5Dc5KWOIb8uXE9Cs3rijXYMBuufB5Lq+khu5JQJ
	 +kD1mTBGOzFG5oKJQvSwDrx0DALl09gflBzivQlRQqKuckDAaVDja+0OKKfeudSccuKUR
	 /63yn9ywwZGO9eBBRilUltFEYozDud5uQaj6HGzV6VaBWxGvCgeF/vKlii6BqCqSFYJtj
	 TJjnGMdjjkJSyuj1TQ3nmRVV+Zz4g/ajR8BEiIJrta+7/4vXA3aHce1OFh8uKVZLscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=jhofewhF;
	arc=none smtp.remote-ip=66.163.185.31
Received: from sonic313-56.consmr.mail.ne1.yahoo.com (sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EAA606A32A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EAA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=jhofewhF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340393; bh=6/HVcooRKimsr1B3zu2/RYwE+H54hE0OAuaV4V17dQA=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=jhofewhFjw63KFcgsF2pAG6q0CcFltrG+ztb0AhDAWobZmBt0tC+vA4hryaDMfXTcGmvkQBRqKKDvUEXWrcfDW9Kd7tEX889EaovN2Aw+411v6KD9kqcPsllKz4HxGMyiRQdJ2TFF/hBUGy5GFMOffQ4j7XkHwxI4j/rBzA5DoGV77zUPAxWKN5yXVzRpNXV2P+Vps9XFAznKBMF0d6jiWHRgcAqVUGVDiVxQ4AYH2qFCPgQ06ZMSJ9EH1q7L5ncryJ3/lEZk6T5HMymPO/YqHcfhYtdNdg6NxVAjNq2kt5fnIYas4WF6k/KnjM7jFmVgP3Pve5e2HP7mZhP6Qy5mQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795340393; bh=9hbf9QlhQvjiynYw+ks5dMntUxDTRe4P8CfwH2yzgNC=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=rqUG9LPvwW2m5CRJww+RzZb2qQWE/Qx6e5fAeMPIiuvnlg8l5lTFWFiozs3btKoRWu6tRsB7gy2FxjrBW8skIEh4aLXqlJs4kKdnxy25k7bRe1xjEFgIWNFAqBGePia2Gfjw19HYS8fAahilT+BffI4hIuARpCmMJL5kmp8fTKJhHmcnr7CzWycDEZ01wYo4+ONYXk7HByAGb+TglINSoOC2+d6MhYAGXkmUugh3L8yQ4VLPqYzQ96AezoCX+W3+1VqhYNiRILz+A3K03tav5r++fLsdipdhaEDRTb6QvuAkpzKJU6be+kd/599XOkeFYC7M+z9m9i7D5DDE7cTNXA==
X-YMail-OSG: g4Ln_k8VM1ne9WV.WMp9t0yLjV5YIqud3YYO1OZCwSffonlHzprwa5vaFxu4NcG
 nryITaMDVd3dpYHXGrG13GqYZh779ih0J4AyqUe318l7YvRvdRIsnrZixq1oa5y_wCDNXAINsXx3
 SNEnX3rAM5CVtYayzjdXl8YxZDvNcdjgj6CAwWbwQkl5DUFcq01Fec.MlVCrWmSVYN3BObsS51aT
 CPBdl7hvrWcHs70Lx5qG7Cr21W7wpQMe7PlTn0rvuhpm2yoQDaprP6ZvnuQv97oTPlOL9fGEcfso
 BXrV5zmKtGWB6NHHP19U_TL4gBhl2IsoL9PRvId3Lg6U3S9F0uCqQsXxSyGihke3MxHTxzSRP2rv
 aEWBwAU98ZVhf20DWNOoUM1FikB22puq9Hxro72kHlWZoeNaJz6i0prfupXwzNv9DwW27ZhariYx
 pxKzEE2CJiUNa6oZj1N1dr40rZwa2D98Ned4J3PvNioQ8dO51vhd3uEWBVRROS7qv5lHFNDhJ7o0
 3RLjiLt.NLFyqXSDQTL.nqkeSZYbMMrFQ5s5Ke5jav_S2KAgqf4BxjVPUn59jXfMsYiTsjJSWJd9
 ocmAqMtDCHaiFyQeDkRoOX3c4MBzciQnQAhXbmvvHp.hree07qCZq_vHA1fPK7EmUbQYpn.UjPLQ
 .DmFIAGen0jikAd4tkRrHwiDn7sJbjpi94fr6lsvIeWnvHXwLnxKUszhFtEygsX36JMca7BzMRYZ
 ID94gCXjHpaEp2Xqaih6goPcFV1j5IQi9iSuLx7NVS9Lpvm0v1GiTE9tsKAT.y0pImfZ3TW.gdHT
 y.teWgDWVx5U6P1zA8gIKqHkjHj9X5ia85BvJK8kQWqjgYQ_1gTCf7jc9hI5saLOR4Z9e.Rne4C_
 wbwEl4JbFtswbH5xM.4Pa849AVzfRs2Fs4mjJjhXKYPSyTOqKjmTVzm2pofUmLb338ABiHrJaUzU
 XtQd5PirWxC8PHxTa216_NdFA7YkafI.uwUGJ8tw1hJ2uKRQESb6wWlyjSIMwBSWKwKclzuMg0ND
 e5RKLmojbNikNhzK5yexl0xnW2p6K7YS78.e..y2z9d44Nopj9mSHRyE9wJrNA1QuUMiGJ10GBpb
 4uXhfReDnO0ZUWkymzBGDy1EHOLfKCHYVUCdbjKuNUqWHAVP0dyPy1v.8TItCcOZVKJSdCzR4RkC
 JoeZ.3HZAyXLndytH_9qR7kpFSEm4xxwQoSXWiUqP2FPX852t5ictQM2awVQ8FhkSz5ArMjnk_FC
 UUBplZfby2b0Jpu96BA9qPhdwD_aS6SE2ctS4iPumbWNS5DRXrZMdIvmr.9thLcG5QnS0L6NdWRM
 CblgE973zFI39X2t9S8G9ZyXRWUgbd9I6zkt4ET4ArUBDhKNz9ewADL_nVcguxMXv9latGYMdKQ1
 wmDMgBGO00SksuHlAuMNR7tqDgTNQxQD.qj1nTgFrAsCPD3zufMBwayLAvd6BI9e8PQK3DB2iygM
 YizpseOBJwrALhOBpM_dkuZyWG5qJAU.30vSBG0M2kJBPARbvc8UAmD3fO2xK23gpmUlj3sbpOlj
 ylCqUrHs65ojjzlIUHM_cX5TNHeR0z8rakh0yOtajQv5_8kKdFEr8y.ISKCpCykoADedXl23aGCu
 SgatrHg_L7EoKJSMSMOe4btZq_9fHwSee7KxDcFR5YTf2CWkBwg8bNVUgBkYEr6E5Pdm6Dm9.dLU
 Nel9GQocLjA8dQM0E9Bpf5OY9Un7KnDQRrO6Cko2WX79R8Bt.pqwpHH60NvtC2Ysh4NbjnLrXwOR
 aY.CqfXidzqgqTxSTSNOJvruFcT5I7LttPZB6D8kMAEZfwUSh.TtzToDKmrB6PQQ1knUR47BYBEM
 rAYCPnNV2lgbnhCZPJqh.PB8fEcQWGpLS.DsYzJ4VlauZm8q_oAqd6NMI84er6DcoTCgL1OiOwe2
 dSpuxjQlUEAUwABUA8R6AVkOO_Ut503TANHDROyTTMIScc1Rg10RsAPz2FQJXXKEyjRrT5c4p6cn
 7aOIcMapUmhdJpM59EnrGxhbtwe5qghrGjUyAGVd3sDpsrX27US3egyY4QqhYuaSiwlwBFBXdnyB
 1RcRxLZ3fIkaRpa3YS1_sB8qtMiV2a.oFlr2_VVd.mac3IOmbCp7Mcto99DywfC8xtKX4d6FYTZx
 1hh8MhmwKJl9QOYZ4CeHeyZFM_cfvobTXcgA0CywhYruv080TTFKcOLRFuhqirFiLqErJC_Tinu8
 EZAdgZ7vFG4prMxkhBz2dTTxXuvdrSPW5T_YR_fUYx5unRJqujvhgPK54qrS7x8lLv9uwSesuNMj
 mBkxyFnw1bxeTT6BRe9Ti4KZSd8gdPFLtt5pr.Ik-
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 10a3861c-a0b3-4d58-aa97-737c1479e64f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 09:39:53 +0000
Received: by hermes--production-ir2-7c4859dc89-526xz (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 90f9fa6f918b9b48093164e586379177;
          Sun, 22 Nov 2026 09:39:51 +0000 (UTC)
Message-ID: <a6b2d25a-2b5a-4ee0-b7a2-1fbed611e11d@yahoo.com>
Date: Sun, 22 Nov 2026 10:39:48 +0100
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
Subject: [PATCH net-next v13 04/14] net: dsa: realtek: rtl8365mb: set speed
 for family D
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

On family C hardware, forcing a 2.5 Gbps link speed requires relying
strictly on the HSGMII SerDes configuration block, while forcing a dummy
1 Gbps value inside the standard digital interface register. Family D
introduces a dedicated hardware link speed value (5) for 2500M. The speed
bitfield width has been expanded to 3 bits, splitting the most significant
bit into a new separate register field (FORCE_SPEED2), which maps directly
to a distinct per-port digital interface force layout.

On family D the forced-mode configuration (link, duplex, pause, speed)
is written to a per-port register at 0x12c0 + port instead of the
per-extint register. The bit positions of TXPAUSE, RXPAUSE, LINK, DUPLEX
and the low two speed bits are the same as on family C; the upper speed
bits go to bits 13:12 (FORCE_SPEED2), so FORCE_EN (bit 12 on family C)
is not set. A second per-port register at 0x12c8 + port enables the
forced mode: the vendor RTL8367D API writes 0xFFFF there when the MAC
is forced and 0 otherwise. This driver always forces the MAC, as on
family C, so it writes 0xFFFF on every call, including link down.

Add the family D implementation as rtl8365mb_d_ext_config_forcemode().
The shared code reaches it through the ext_config_forcemode pointer in
struct rtl8365mb_family_info, so it needs no is_d() check.

Nothing points to it until the family D info is added together with the
chip table entry in the last patch. Until then it is not static and is
declared in rtl8365mb.h, so that the build does not warn about an unused
function.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>
Tested-by: Oleg Gavrilov <gabonpivovich@gmail.com>
Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/dsa/realtek/rtl8365mb.h      |   4 +
 drivers/net/dsa/realtek/rtl8365mb_main.c | 110 +++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb.h b/drivers/net/dsa/realtek/rtl8365mb.h
index 390ff0a..a9bf4f2 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.h
+++ b/drivers/net/dsa/realtek/rtl8365mb.h
@@ -23,6 +23,10 @@ struct rtl8365mb_family_info {
 const struct rtl8365mb_family_info *
 rtl8365mb_get_family_info(struct realtek_priv *priv);
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause);
+
 static inline bool rtl8365mb_is_d(struct realtek_priv *priv)
 {
 	return rtl8365mb_get_family_info(priv)->family == RTL8365MB_FAMILY_D;
diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 0457f84..05db3dd 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -346,6 +346,8 @@
 #define RTL8365MB_PORT_SPEED_10M	0
 #define RTL8365MB_PORT_SPEED_100M	1
 #define RTL8365MB_PORT_SPEED_1000M	2
+#define RTL8365MB_D_PORT_SPEED_2500M	5
+#define RTL8365MB_D_PORT_SPEED_MSB_MASK	BIT(2)
 
 /* External interface force configuration registers 0~2 */
 #define RTL8365MB_C_DIGITAL_INTERFACE_FORCE_REG0		0x1310 /* EXT0 */
@@ -364,6 +366,26 @@
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK		BIT(2)
 #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK		GENMASK(1, 0)
 
+/* bits[13:12]; bit 13 reserved, no defined speed value uses it yet */
+#define   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK	GENMASK(13, 12)
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE		0x12c0
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE + (_port))
+
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE		0x12c8
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(_port) \
+		(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE + (_port))
+
+/* Per-port force-mode enable. The vendor RTL8367D API
+ * (dal_rtl8367d_port_macForceLink_set()) treats it as an on/off switch for
+ * the whole forced configuration: all bits set when the MAC is forced, zero
+ * when it is not. The meaning of the individual bits is not documented.
+ * This driver always forces the MAC, as on family C, so all bits are set
+ * on every call, including link down.
+ */
+#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK	GENMASK(15, 0)
+
 /* CPU port mask register - controls which ports are treated as CPU ports */
 #define RTL8365MB_CPU_PORT_MASK_REG	0x1219
 #define   RTL8365MB_CPU_PORT_MASK_MASK	RTL8365MB_PORT_MASK
@@ -1733,6 +1755,94 @@ static int rtl8365mb_c_ext_config_forcemode(struct realtek_priv *priv, int port,
 	return 0;
 }
 
+int rtl8365mb_d_ext_config_forcemode(struct realtek_priv *priv, int port,
+				     bool link, int speed, int duplex,
+				     bool tx_pause, bool rx_pause)
+{
+	const struct rtl8365mb_extint *extint =
+		rtl8365mb_get_port_extint(priv, port);
+	u32 r_tx_pause;
+	u32 r_rx_pause;
+	u32 r_duplex;
+	u32 r_speed;
+	u32 r_link;
+	int val;
+	int ret;
+
+	if (!extint)
+		return -ENODEV;
+
+	if (link) {
+		/* Force the link up with the desired configuration */
+		r_link = 1;
+		r_rx_pause = rx_pause ? 1 : 0;
+		r_tx_pause = tx_pause ? 1 : 0;
+
+		if (speed == SPEED_2500) {
+			r_speed = RTL8365MB_D_PORT_SPEED_2500M;
+		} else if (speed == SPEED_1000) {
+			r_speed = RTL8365MB_PORT_SPEED_1000M;
+		} else if (speed == SPEED_100) {
+			r_speed = RTL8365MB_PORT_SPEED_100M;
+		} else if (speed == SPEED_10) {
+			r_speed = RTL8365MB_PORT_SPEED_10M;
+		} else {
+			dev_err(priv->dev, "unsupported port speed %s\n",
+				phy_speed_to_str(speed));
+			return -EINVAL;
+		}
+
+		if (duplex == DUPLEX_FULL) {
+			r_duplex = 1;
+		} else if (duplex == DUPLEX_HALF) {
+			r_duplex = 0;
+		} else {
+			dev_err(priv->dev, "unsupported duplex %s\n",
+				phy_duplex_to_str(duplex));
+			return -EINVAL;
+		}
+	} else {
+		/* Force the link down and reset any programmed configuration */
+		r_link = 0;
+		r_tx_pause = 0;
+		r_rx_pause = 0;
+		r_speed = 0;
+		r_duplex = 0;
+	}
+
+	val = FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_TXPAUSE_MASK,
+			 r_tx_pause) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_RXPAUSE_MASK,
+			 r_rx_pause) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK, r_link) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK,
+			 r_duplex) |
+	      FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK,
+			 r_speed &
+			 RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK);
+
+	/* Speed is 3 bits on family D: bits[1:0] go into FORCE_SPEED,
+	 * bit[2] goes into FORCE_SPEED2 (register bit 12); only 2500M
+	 * sets it. Register bit 13 is reserved.
+	 */
+	val |= FIELD_PREP(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK,
+			  FIELD_GET(RTL8365MB_D_PORT_SPEED_MSB_MASK,
+				    r_speed));
+	ret = regmap_write(priv->map,
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(port),
+			   val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(priv->map,
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(port),
+			   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static void rtl8365mb_phylink_get_caps(struct dsa_switch *ds, int port,
 				       struct phylink_config *config)
 {
-- 
2.53.0

