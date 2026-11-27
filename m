Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785369;
	b=IbfoH+YEaCHFNJMgDCaUu3IGi9z3srQx3Vbn09rCvHv0G8QYKHXYhpela4/7xhCdVpGI
	 WBncZQ9JJ0I7WHyal4fptRXFg9PydoDA23UupSYFprDgUqc+VKoWx/mlRGYo8wWIlx8hn
	 wg0FaEPi+w3w5xecSAz/fOQStwG7HH8NN1g47ngFUM5dKE7jTrAprhA9cJpsqUiOetY+J
	 yzveED0v1tnkP0I119oiT8ZJSeVIhbkY8u0WOk/RtgoGt+G/9AOi7BctfXb5E56uIIWBx
	 gSZtxxQN0A7YRl1P/i0BVc8dwUKccn4mWC2oEN9VlJxjRlxOpeSc6D/I9+LE4w8+yew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785369;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T9kP93CevqPlZEZKFyxDGFfKrLe6Ur0GFRXcEG9njRY=;
	b=klSVo3r9B3+KYnG+pj6V4D6trBWtdvp7uoaBBSrXEWj1llWw7JUAnzk1bW+4R1FOS4AN
	 MlYEmcN+mnNaiULecKWiQZQmcfz8Cv+ehviGj711o7YgKc2CIVDQE2vGsyfYToSeOC0DR
	 8lCHZEmiCa25i++9bpYcB1oFAY2/ADEHyeUHGqcQHZsa6h0eDZqzpPb8PjWD+CJV0shgC
	 OPpmCLgzqEWFrSwK/riwNPgarbKH7ALS3QvBAjdws8BIAuiDnWlKuFTbUN2LtRYXHiSOZ
	 aj5yRFV38awtgzZfLO8v/WW5Nl2bHo0VgF39Ic5V0KOaSq6L2M7tA7JSXM9aRmpEd0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oGicZ/Xg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7A5606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oGicZ/Xg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795785369;
	b=RZZjBPFE7lgxFYw0W2oXMSE3xGslIFM1PmA4FuPrfEgrs7sHw92Hcnl2Ry/Izj3NOJnq
	 3D1ly02ATSzi18pGvp8X12Hy06etXLFYVIOaRjCr9Kz8dUqA1Z5bM3Yy8FR9K1MsoHtXG
	 Tz1oL1NxRzWjonloGr78pkVvhebjtY+OAGUKMyMRWBopiHS5tfnZD790ernQkN4W3pJYj
	 ERiJniloGHGixujz6Xj5qutO9N+yQl5NcZgXqP0mTUMNUqSK29FzrdwwklhpRyZAV27qc
	 Uf+5dYVvCn6ujrVKuxGV+ffnt/JW5RxGKDDKOVDkUAbPCgjrnTm9yG7XpxPRetH2R6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795785369;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T9kP93CevqPlZEZKFyxDGFfKrLe6Ur0GFRXcEG9njRY=;
	b=3Cm3naMixoO1uAgXyhVGtV2T+NqCZqeQjdi3frABa7m7a8QzB3x4a0PDYp+MjBOTz/hZ
	 RDM9rVpaSJfd+SDbqSPpp2VK4Z0jqsCZZX23bNJs2lDNpJWBB4FxBjKziFulgM1iKieur
	 5lveprAJiWk/WEwGbMO7Gs30IVpGNSQkzDVZZvxq7xYso3Gv9s3Kj/9y7T+4M/LYFo2DT
	 g1Qh3VjGrkuGB7juZp3n6BiywvJPlcCDh4J/TsYfOd68pQv6zduLulHwlcxK4eRQFaanv
	 oobdWEbyzxFHa4Gt90g4BhY/ZdxGagRM4zbnkxi6MjsrrsYNkdN6CobRPfDvkK8HKDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A8261F00898;
	Fri, 27 Nov 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795785369;
	bh=T9kP93CevqPlZEZKFyxDGFfKrLe6Ur0GFRXcEG9njRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oGicZ/XguHpmMXu3lJtQn98O7W+ljkhl8ipEBAZr8eY9Dp9omY7S/TrOoMfYy++sk
	 hP/q2SCIkdvnSMMgG9muifKYIrZvM535Xd62o7+i9DvqzP+28yov/9ZwZDmyK1W1r8
	 zStXAt3AfwvvEqIpMgjchIHcU0Mc1hM499Atb+PhNff9fUkGhVCqD0oIRxYThohxcf
	 9mNMeGuAvXH1XJtPp9tU/7FLMoDJdKBNB7eWfT96HfC+baHy9DY9UEy1S6PgJxyShx
	 b0M9/4MmqTNE6aBDE2CsDjMDNcLwGZIwLWPPzp6aMCfABMK9uONpdaYf8ag6i/VH1I
	 JJdTE28uWmJYg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 055924B7FC;
	Fri, 27 Nov 2026 13:15:56 +0000 (UTC)
From: Juraj Sladek via B4 Relay <devnull+juraj.sladek.littleit.sk@kernel.org>
Date: Fri, 27 Nov 2026 13:15:55 +0000
Subject: [PATCH net 2/2] net: dsa: realtek: rtl8365mb: soft reset switch
 core after conduit comes up
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
Message-Id: <20261127-rtl8365mb-hsgmii-fix-v1-2-f2827126aa6a@littleit.sk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795785355; l=6803;
 i=juraj.sladek@littleit.sk; s=20261127; h=from:subject:message-id;
 bh=1Q6/LriyS2YpTV3L2s9x6aaNqhP0a/207xyHQO0fT0o=;
 b=R0fNhEtgX65umWEt2f/B0LVCuRsMS63UiRbPgIAw9Qc6DfP0yzbaEPwu5ethqv7o8oK69hBDx
 yTNURou16D5DbSBIeIbmzT+pjBRzH7re93qDzmDgn8LR+9DH3A7z0xN
X-Developer-Key: i=juraj.sladek@littleit.sk; a=ed25519;
 pk=AqKiPr9Cm4+alKqIg7OT5xi2bB7LmUEaCQbSaKx1bCs=
X-Endpoint-Received: by B4 Relay for juraj.sladek@littleit.sk/20261127 with
 auth_id=1667
X-Original-From: Juraj Sladek <juraj.sladek@littleit.sk>
Reply-To: juraj.sladek@littleit.sk
Content-Transfer-Encoding: 7bit

From: Juraj Sladek <juraj.sladek@littleit.sk>

With the SerDes data path reset on conduit up in place, about one in
five boots of a TP-Link Archer AX55 v1 (IPQ5018 GMAC connected to port 6
of an RTL8367S over 2500base-x) still ends up with a CPU port that
receives the frames sent by the CPU - port 6 ifInUcastPkts rises, with no
FCS errors and no drops - but never forwards them to any user port.
Traffic from the user ports to the CPU keeps working. In this state
PORT_DEBUG_INFO_CTRL3 (0x091A) reads 0x0000 instead of 0x0035, while all
the configuration registers are identical to a good boot. The state can
also turn by itself, or start out, as one where the frames from the CPU
are forwarded but corrupted (random MAC addresses, malformed payloads),
without any trace in PORT_DEBUG_INFO_CTRL3.

None of these recover the port: another SerDes data path reset, toggling
the forced link or the mode of the external interface, toggling the
HSGMII MAC selection in SDS_MISC, or running the whole PCS configuration
again. A soft reset of the switch core (CHIP_RESET.SW_RST) recovers it
every time, and it keeps the configuration programmed by the driver,
including the VLAN setup; the MIB counters are not cleared either.

Soft reset the switch core 3 seconds after the conduit becomes
operational. That is the delay used in all the testing below; it has
not been tuned. The reset is done unconditionally, since the corrupted
forwarding variant cannot be detected from PORT_DEBUG_INFO_CTRL3.

Tested on the AX55 by rebooting with the switch held in hardware reset
(reset GPIO asserted through the reboot) and checking traffic on a LAN
port after each boot:

  without this patch:    14 of 70 boots broken; a SW_RST issued at
                         runtime recovered all 9 broken boots it was
                         tried on
  with this patch:       0 of 40 boots broken (and 0 of 30 with an
                         equivalent debug implementation)
  power cycle boots:     10 of 10 good with this patch

Fixes: 987137345f33 ("net: dsa: realtek: rtl8365mb: add HSGMII support for RTL8367S")
Signed-off-by: Juraj Sladek <juraj.sladek@littleit.sk>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c | 54 ++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index 54d90121e..f30758110 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -859,6 +859,7 @@ struct rtl8365mb_port {
  * @sds_supported: SerDes tuning parameters match the chip option, so the
  *                 SerDes interface modes can be advertised
  * @sds_in_use: the SerDes external interface has been configured
+ * @sds_core_reset_work: switch core soft reset after the conduit comes up
  *
  * Private data for this driver.
  */
@@ -872,6 +873,7 @@ struct rtl8365mb {
 	struct phylink_pcs pcs;
 	bool sds_supported;
 	bool sds_in_use;
+	struct delayed_work sds_core_reset_work;
 };
 
 #define pcs_to_rtl8365mb(_pcs) container_of((_pcs), struct rtl8365mb, pcs)
@@ -3094,11 +3096,48 @@ static int rtl8365mb_reset_chip(struct realtek_priv *priv)
 					20000, 1e6);
 }
 
+/* On an RTL8367S connected to an IPQ5018 over HSGMII, the port MAC behind the
+ * SerDes occasionally ends up, after the link comes up, in a state where the
+ * frames received from the CPU are counted (ifInUcastPkts rises, no FCS
+ * errors) but never forwarded to any user port, while the switch to CPU
+ * direction keeps working. The port debug information register
+ * (PORT_DEBUG_INFO_CTRL3, 0x091A) then reads 0x0000 instead of 0x0035. This
+ * state can also turn, by itself, into one where those frames are forwarded
+ * but corrupted, or show up like that from the start, without any trace in
+ * the port debug information. Neither a SerDes data path reset nor re-running
+ * the SerDes configuration recovers from any of this, but a switch core soft
+ * reset does, and it keeps the configuration done by this driver, including
+ * the VLAN setup.
+ */
+static void rtl8365mb_sds_core_reset_work(struct work_struct *work)
+{
+	struct rtl8365mb *mb = container_of(to_delayed_work(work),
+					    struct rtl8365mb,
+					    sds_core_reset_work);
+	struct realtek_priv *priv = mb->priv;
+	u32 val;
+	int ret;
+
+	ret = regmap_update_bits(priv->map, RTL8365MB_CHIP_RESET_REG,
+				 RTL8365MB_CHIP_RESET_SW_MASK,
+				 RTL8365MB_CHIP_RESET_SW_MASK);
+	if (!ret)
+		ret = regmap_read_poll_timeout(priv->map,
+					       RTL8365MB_CHIP_RESET_REG, val,
+					       !(val & RTL8365MB_CHIP_RESET_SW_MASK),
+					       1000, 100000);
+	if (ret)
+		dev_err(priv->dev, "failed to soft reset switch core: %pe\n",
+			ERR_PTR(ret));
+}
+
 /* The SerDes is configured from phylink long before the conduit Ethernet
  * controller starts transmitting on the link, so its receiver initially locks
  * on an idle line. On an RTL8367S connected to an IPQ5018 over HSGMII this
  * regularly left the switch receiving every frame from the CPU with an FCS
- * error. Reset the SerDes data path again once the conduit is up.
+ * error. Reset the SerDes data path again once the conduit is up, and soft
+ * reset the switch core a few seconds later, see
+ * rtl8365mb_sds_core_reset_work().
  */
 static void rtl8365mb_conduit_state_change(struct dsa_switch *ds,
 					   const struct net_device *conduit,
@@ -3108,13 +3147,20 @@ static void rtl8365mb_conduit_state_change(struct dsa_switch *ds,
 	struct rtl8365mb *mb = priv->chip_data;
 	int ret;
 
-	if (!operational || !mb->sds_in_use)
+	if (!operational) {
+		cancel_delayed_work(&mb->sds_core_reset_work);
+		return;
+	}
+
+	if (!mb->sds_in_use)
 		return;
 
 	ret = rtl8365mb_sds_reset_datapath(priv);
 	if (ret)
 		dev_err(priv->dev, "failed to reset SerDes data path: %pe\n",
 			ERR_PTR(ret));
+
+	schedule_delayed_work(&mb->sds_core_reset_work, 3 * HZ);
 }
 
 static int rtl8365mb_setup(struct dsa_switch *ds)
@@ -3132,6 +3178,8 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 
 	mb->pcs.ops = &rtl8365mb_pcs_ops;
 	mb->sds_in_use = false;
+	INIT_DELAYED_WORK(&mb->sds_core_reset_work,
+			  rtl8365mb_sds_core_reset_work);
 
 	/* The SerDes has no link interrupt wired up, so phylink must poll the
 	 * PCS for link changes when it tracks the link through pcs_get_state()
@@ -3323,7 +3371,9 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
 static void rtl8365mb_teardown(struct dsa_switch *ds)
 {
 	struct realtek_priv *priv = ds->priv;
+	struct rtl8365mb *mb = priv->chip_data;
 
+	cancel_delayed_work_sync(&mb->sds_core_reset_work);
 	rtl8365mb_stats_teardown(priv);
 	rtl8365mb_irq_teardown(priv);
 }

-- 
2.53.0


