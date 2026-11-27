Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785365;
	b=d5Q14m5e0k5k2hZIG4P4OQTkg0pfEjlQOrTyS9TP17VfzQAPy8Lit62T5LXTGNOEaJVa
	 iouLH5LwENX8DzfHVupeABFvoSMK+r945iSL3Vit1y8Ea7GyST+a/u3BC3iSEnbxh1VVU
	 qIqEYFeuDgOrjarIUG6UQYOMN1+OJxnmmeVq/FE2eb1gWlzIBGB31XKM/JzTSKPxSMMyb
	 VgCnD05MnBi8Kcx6wfdmnw4qAId2xjCUGYUhR3PCUFPClhCAeJ5W3qoG525sCU6doFh1y
	 eoZf5tk6rm6L5zNnI/ZHbZ3jv2SGpDR4go5QsSZTLyXzKt5vOSozSzlb0AmjgTVLkkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785365;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uzS/BNAYIj/VL8SPC7NkGalZWt1Ty07+faDWaDwzv/4=;
	b=EeOQTZvLIGdxCUVoD66nTOczmMG/Fi8qnwLLwdb8Hp63qyDcNZIbiZzDXy5+9vJl2dNq
	 C+FFKRyzVxdZh52BJ76vBhD6p/4mfiEWcrKLbqM7dLzgn8S0g0lS3qxZpzn7Xvawwxhdb
	 nKjf5NxQJcayELN8rF6WQhzTFi4y7JMrP/30V0UCyJ5WA9epATgc6TGJTZa9SSHS69tKE
	 BBo64veNB6t/k9m8UK9QvPNYGRjzPG1yMkInTRfQhwsTRSBO6EwD2LpjLR9pLA5mISySp
	 tg591NGtCHczKKeA2egbQDWn8j3U4wHx8Q9Juw1HjUHQdd7Zs7jF5TlA2iXJABk8XMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V/i5uyiJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AA606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/i5uyiJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795785364;
	b=fCzXG/Glr8YTot2K1ne1YKr8yfEnzBE/EO3+ka/US8IlxoL2wtmBFaZzg4tVTM+Fe38X
	 kBv3reVNJ6+Pj0mYcum4mSyK+TL57cdJSNmgZf4qu67udbG6quOzH5oO6yq/jvJ534lej
	 OOFvB5is1XUln+vESco3uycthxJdW7mQHsC7d5OEG9f2lzP7YVDfrz1lBN6kj6V/eK7ry
	 IMyqr24H640aeH8tduN6cADjEFVcoAhPqXPagCSm3/VR4+GRaKag2K5NkunU+n5PqJd2g
	 QpeufEmfOZiUQ4t1LQ1PRmx48q+CdVKwMByYH0nb5nhJvFCvOCr2J23l3il2gWXyKyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785364;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uzS/BNAYIj/VL8SPC7NkGalZWt1Ty07+faDWaDwzv/4=;
	b=iPdeFrPuTuuXnvfHclbZKCU52/PBPRO1sng7X6NTR/tOlA2mUJb7S4MvwrFla/NQBr9Q
	 JfQcrPcPimTtfqWwHnufmO/xgMX0PmZiwhtHz5kPG8ZczbPEUlO6VbqdSeS8j+vikbMm2
	 Wz3HCk7NgVc955Sj4hToN/7YJGZhuoYbxnDwdaMe15tTnu2b8T8l6+2g5JY3e984ykUXj
	 CLmiJnRo/4OQABTcjz6M8wbAxiB3IRUN4d/sgN8aQFD06RZpSb5KuVH77IvR2HyK0iS32
	 Mb0dTDdQb9H+tJMeC37U0AJH3l18AOfEKjDBixk3vgSJUBS7ZIQ3cXJ8DF9ORjA39pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54A231F00897;
	Fri, 27 Nov 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785364;
	bh=uzS/BNAYIj/VL8SPC7NkGalZWt1Ty07+faDWaDwzv/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V/i5uyiJgpt/dcj20AUchG+1mCFOjweU/YW9Ozld3IHRbpEV1i0yhd0RsInXdjRm9
	 U/m7EZNqBAXQK4GM6cAuStGkjQe7ovLGybANY+IoccHuqMYsbNp3VVOlqlYglE+RH/
	 jl+z/e+nKaoZhBMyRbWs2S4aD5BbY1lkHY8+eTlrudOSHr2BUHcFexz7NLnC63RSFy
	 y0uCyG5PD0k+QnaTgaCQuVBuVtSgKDLrRml/24Hv/C35xmdE3Cr3lQbeL9GDTaukPS
	 ihWC7k7aQ4iez7SAuEpi3L6qw01sDSGPznhwUkIAUaKRl6pS/5iJjpXeqvo+gfXa4M
	 8nEkPQMSh6ogw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D958D4B7FB;
	Fri, 27 Nov 2026 13:15:55 +0000 (UTC)
From: Juraj Sladek via B4 Relay <devnull+juraj.sladek.littleit.sk@kernel.org>
Date: Fri, 27 Nov 2026 13:15:54 +0000
Subject: [PATCH net 1/2] net: dsa: realtek: rtl8365mb: reset SerDes data
 path when conduit comes up
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-rtl8365mb-hsgmii-fix-v1-1-f2827126aa6a@littleit.sk>
References: <20261127-rtl8365mb-hsgmii-fix-v1-0-f2827126aa6a@littleit.sk>
In-Reply-To: <20261127-rtl8365mb-hsgmii-fix-v1-0-f2827126aa6a@littleit.sk>
To: Linus Walleij <linusw@kernel.org>, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: Johan Alvarado <contact@c127.dev>, netdev@vger.kernel.org, 
 Juraj Sladek <juraj.sladek@littleit.sk>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785355; l=5683;
 i=juraj.sladek@littleit.sk; s=20261127; h=from:subject:message-id;
 bh=0YUSMA7OC6o+AJt4wzQ06SzhSjjaDllSgGI4mRa2E5s=;
 b=thEX+Vwxp7Sex2jlME4gfPBQ5NrIooUZ7X6gaT59LF9dceoRsXoLXkgLe382M9JZNhyErJAdR
 GZ0HoE1c4l2B5I29iJy8YwPIZZEMhPgWsTZRJLF1I5sgsOiSLDig3xs
X-Developer-Key: i=juraj.sladek@littleit.sk; a=ed25519;
 pk=AqKiPr9Cm4+alKqIg7OT5xi2bB7LmUEaCQbSaKx1bCs=
X-Endpoint-Received: by B4 Relay for juraj.sladek@littleit.sk/20261127 with
 auth_id=1667
X-Original-From: Juraj Sladek <juraj.sladek@littleit.sk>
Reply-To: juraj.sladek@littleit.sk
Content-Transfer-Encoding: 7bit

From: Juraj Sladek <juraj.sladek@littleit.sk>

The SerDes of the external interface is configured from phylink long
before the conduit Ethernet controller starts transmitting on the link.
On a TP-Link Archer AX55 v1, where the IPQ5018 GMAC is connected to port
6 of an RTL8367S over a 2500base-x (HSGMII) fixed link, the SerDes
receiver regularly comes out of this in a state where every frame
received from the CPU is counted with an FCS error, so the CPU port does
not work at all until the switch is reset.

rtl8365mb_pcs_config() already resets the SerDes data path right after
taking the SerDes out of reset. Repeating that reset once the link
partner actually transmits recovers the receiver, so factor it out and
call it again from the .conduit_state_change() callback when the conduit
becomes operational.

Fixes: 987137345f33 ("net: dsa: realtek: rtl8365mb: add HSGMII support for RTL8367S")
Signed-off-by: Juraj Sladek <juraj.sladek@littleit.sk>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 66 +++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index da06f952a..54d90121e 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -858,6 +858,7 @@ struct rtl8365mb_port {
  * @pcs: PCS for the SerDes external interface
  * @sds_supported: SerDes tuning parameters match the chip option, so the
  *                 SerDes interface modes can be advertised
+ * @sds_in_use: the SerDes external interface has been configured
  *
  * Private data for this driver.
  */
@@ -870,6 +871,7 @@ struct rtl8365mb {
 	struct rtl8365mb_port ports[RTL8365MB_MAX_NUM_PORTS];
 	struct phylink_pcs pcs;
 	bool sds_supported;
+	bool sds_in_use;
 };
 
 #define pcs_to_rtl8365mb(_pcs) container_of((_pcs), struct rtl8365mb, pcs)
@@ -1380,6 +1382,24 @@ static int rtl8365mb_sds_raise_rate_limits(struct realtek_priv *priv)
 				  RTL8365MB_PORT6_EGRESSBW_CTRL1_MASK);
 }
 
+/* Reset the SerDes data path and resync its PLL, mirroring what the vendor
+ * firmware does right after deasserting the SerDes reset. This flushes the
+ * FIFOs and ensures a clean state for the link, preventing silent drops and
+ * CRC errors.
+ */
+static int rtl8365mb_sds_reset_datapath(struct realtek_priv *priv)
+{
+	int ret;
+
+	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_BMCR,
+				  RTL8365MB_SDS_BMCR_DPRST_PHASE1);
+	if (ret)
+		return ret;
+
+	return rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_BMCR,
+				   RTL8365MB_SDS_BMCR_DPRST_PHASE2);
+}
+
 static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 				phy_interface_t interface,
 				const unsigned long *advertising,
@@ -1467,18 +1487,7 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 	if (ret)
 		return ret;
 
-	/* Reset the SerDes data path and resync its PLL, mirroring what the
-	 * vendor firmware does right after deasserting the SerDes reset.
-	 * This flushes the FIFOs and ensures a clean state for the link,
-	 * preventing silent drops and CRC errors.
-	 */
-	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_BMCR,
-				  RTL8365MB_SDS_BMCR_DPRST_PHASE1);
-	if (ret)
-		return ret;
-
-	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_BMCR,
-				  RTL8365MB_SDS_BMCR_DPRST_PHASE2);
+	ret = rtl8365mb_sds_reset_datapath(priv);
 	if (ret)
 		return ret;
 
@@ -1492,7 +1501,13 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 	val &= ~RTL8365MB_SDS_NWAY_EN_MASK;
 	val |= RTL8365MB_SDS_NWAY_RESTART_MASK;
 
-	return rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_NWAY, val);
+	ret = rtl8365mb_sds_write(priv, RTL8365MB_SDS_REG_NWAY, val);
+	if (ret)
+		return ret;
+
+	mb->sds_in_use = true;
+
+	return 0;
 }
 
 static bool rtl8365mb_interface_is_serdes(phy_interface_t interface)
@@ -3079,6 +3094,29 @@ static int rtl8365mb_reset_chip(struct realtek_priv *priv)
 					20000, 1e6);
 }
 
+/* The SerDes is configured from phylink long before the conduit Ethernet
+ * controller starts transmitting on the link, so its receiver initially locks
+ * on an idle line. On an RTL8367S connected to an IPQ5018 over HSGMII this
+ * regularly left the switch receiving every frame from the CPU with an FCS
+ * error. Reset the SerDes data path again once the conduit is up.
+ */
+static void rtl8365mb_conduit_state_change(struct dsa_switch *ds,
+					   const struct net_device *conduit,
+					   bool operational)
+{
+	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb *mb = priv->chip_data;
+	int ret;
+
+	if (!operational || !mb->sds_in_use)
+		return;
+
+	ret = rtl8365mb_sds_reset_datapath(priv);
+	if (ret)
+		dev_err(priv->dev, "failed to reset SerDes data path: %pe\n",
+			ERR_PTR(ret));
+}
+
 static int rtl8365mb_setup(struct dsa_switch *ds)
 {
 	struct realtek_priv *priv = ds->priv;
@@ -3093,6 +3131,7 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 	cpu = &mb->cpu;
 
 	mb->pcs.ops = &rtl8365mb_pcs_ops;
+	mb->sds_in_use = false;
 
 	/* The SerDes has no link interrupt wired up, so phylink must poll the
 	 * PCS for link changes when it tracks the link through pcs_get_state()
@@ -3414,6 +3453,7 @@ static int rtl8365mb_set_mac_eee(struct dsa_switch *ds, int port,
 }
 
 static const struct dsa_switch_ops rtl8365mb_switch_ops = {
+	.conduit_state_change = rtl8365mb_conduit_state_change,
 	.get_tag_protocol = rtl8365mb_get_tag_protocol,
 	.change_tag_protocol = rtl8365mb_change_tag_protocol,
 	.setup = rtl8365mb_setup,

-- 
2.53.0


