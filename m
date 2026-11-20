Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195778;
	b=j8Ynbb1PgTNv4Hgdhj1KXefwPsRxfMSTqkaAuJY4jUU/XZN1uvVnIpo46gAzV7L2d2Jl
	 3MOtNaaLfqj8BXuc3un0hMboKnt8lBNxAuNG/hcc1zUafWnsxLfWIReKwmaiRPUIYEydR
	 gYBBgJCK2M9lQ7nmgUNz3o03T/VDrW6BsYtqp1RRTng+q3enaCHQ44kg+SwtGma9qdSUI
	 awxm4j+WH1OZL3AWwjL9otFd01pbnxTZtveKL7+GYUta6xEoqZNCInL9etyY8eqSlzPmA
	 hUQZbyF91Y/qahGs9Vjp66/g5vtMuGsL0IDyNzwv5uOkLqkzBvIjjhzPdhsGuHEMJpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195778;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=B0k3Iz0D65pNQ61LNKhNPqcBd9W2d+0IiygYS5eo3Y4=;
	b=qUyI1QHi0Vr7qV5X9hElTW1zmdiCVU33b8SSGwbgt6ruUpCjkGw26/9VqbYObprnS8fH
	 amZgRSJ6EsGweFR8dKa1wiKHbRQyAlDnc2fYrb2+i+mfD5kibL+nNoBkw9W8gEDiq9x4I
	 em5vaJNicqVXXvo9GAnlFKmBDDWY69YimohO6z2Fg3XiLX8xTUeLQMWgbHwOHe0K/ertA
	 jo6fHMAcWzW9Ut7aSAO7S24Lj8+NGo/n9Ef7zwX4V4JI1XtkplrdHbks4AcC37+9axDcr
	 qNPKYK7uMRA0I/eFNWs5alsLYTuv3AVBNOVp5m8dgf6Lf5K2LkYBCxsD029b+feaEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GI+ByhO7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2201F60A2609
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GI+ByhO7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F2E71F000D8;
	Fri, 20 Nov 2026 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195777;
	bh=B0k3Iz0D65pNQ61LNKhNPqcBd9W2d+0IiygYS5eo3Y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GI+ByhO79V3bH5+ONoq845KDWv0ZqLHU/4Cb6K8vN3QFM0DeqZ+EWSyLjZmqYKzlU
	 ypct2iwp6vJ2Kq3+ltvH1G38OwkMBNemE8b3nLLaTOCcy7uqG/lAKnFTHCCgyghMlL
	 GPPCtxm5eJQK4893tHhZdcQiZGls78ezhbr6119VsAs5QN/W++guA8pSL+iqORABvr
	 5FOIICOGNLeHm7Z4x9G13A4Dq5RRX+7AavXE0VkyLc/X4UYLnXqd+BDVy+8D+wzkdS
	 cKHTfroRDVeeA93uu2AvLYNcNMZFP2QZV1XFFvNtb3dBlIKBOwivsxrtve+uk7AzVX
	 qP0h2FhiV5M9Q==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:21 +0100
Subject: [PATCH net-next v9 02/14] net: ethernet: cortina: Keep ports bound
 for shared IRQ
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-2-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The software free queue interrupt is routed through port 1 even on
boards which only connect a PHY to port 0. Since PHY setup was moved
into probe, the PHY-less port fails to bind and releases the threaded
handler needed by the shared queue.

Publishing the port before PHY setup also leaves a dangling parent pointer
when probe fails and devres frees the netdev private data. Opening the
sibling can then dereference freed memory.

Keep children bound as IRQ-only ports when no PHY is described or when PHY
setup or netdev registration fails permanently, so an unusable interface
does not disable its sibling. Disconnect any attached PHY after
registration failure. Continue to propagate deferred-probe and mandatory
resource errors.

Resolve referenced PHYs explicitly and defer probe until they register.
Preserve fixed-link registration and PHY connection errors, and release
fixed links on probe failure or removal. This avoids permanently binding
a port IRQ-only just because its MDIO bus has not probed yet.

Publish a port to the parent only after its IRQ and optional netdev are
ready, and protect port lifetime with RTNL. Refuse shared queue setup
until both ports have completed initialization.

Keep shared hardware initialization parent-owned across individual child
removal so recreating one child cannot reset a live sibling. Mask
firmware interrupt state before child IRQ handlers are registered, and
use the allocated ring rather than an order sentinel to decide whether
the queue still needs initial setup.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 165 ++++++++++++++++++++++++++--------
 1 file changed, 129 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index f198e535f1a0..4f27a48908b1 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -25,6 +25,7 @@
 #include <linux/interrupt.h>
 #include <linux/reset.h>
 #include <linux/clk.h>
+#include <linux/rtnetlink.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
@@ -155,6 +156,7 @@ struct gemini_ethernet_port {
 struct gemini_ethernet {
 	struct device *dev;
 	void __iomem *base;
+	/* Protected by RTNL. */
 	struct gemini_ethernet_port *port0;
 	struct gemini_ethernet_port *port1;
 	bool initialized;
@@ -359,18 +361,51 @@ static void gmac_adjust_link(struct net_device *netdev)
 	gmac_enable_tx_rx(netdev);
 }
 
+static void gmac_deregister_fixed_link(void *data)
+{
+	of_phy_deregister_fixed_link(data);
+}
+
 static int gmac_setup_phy(struct net_device *netdev)
 {
 	struct gemini_ethernet_port *port = netdev_priv(netdev);
 	union gmac_status status = { .bits32 = 0 };
 	struct device *dev = port->dev;
+	struct device_node *phy_np;
+	phy_interface_t interface;
 	struct phy_device *phy;
+	int ret;
+
+	ret = of_get_phy_mode(dev->of_node, &interface);
+	if (ret)
+		return ret;
+
+	if (of_phy_is_fixed_link(dev->of_node)) {
+		ret = of_phy_register_fixed_link(dev->of_node);
+		if (ret)
+			return ret;
 
-	phy = of_phy_get_and_connect(netdev,
-				     dev->of_node,
-				     gmac_adjust_link);
+		ret = devm_add_action_or_reset(dev, gmac_deregister_fixed_link,
+					       dev->of_node);
+		if (ret)
+			return ret;
+
+		phy_np = of_node_get(dev->of_node);
+	} else {
+		phy_np = of_parse_phandle(dev->of_node, "phy-handle", 0);
+		if (!phy_np)
+			return -ENODEV;
+	}
+
+	phy = of_phy_find_device(phy_np);
+	of_node_put(phy_np);
 	if (!phy)
-		return -ENODEV;
+		return -EPROBE_DEFER;
+
+	ret = phy_connect_direct(netdev, phy, gmac_adjust_link, interface);
+	put_device(&phy->mdio.dev);
+	if (ret)
+		return ret;
 	netdev->phydev = phy;
 
 	phy_set_max_speed(phy, SPEED_1000);
@@ -1051,10 +1086,17 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
 	u32 en;
 	int ret;
 
+	ASSERT_RTNL();
+
+	/* The software free queue interrupt is routed through port 1. */
+	if (!geth->initialized || !geth->port0 || !geth->port1)
+		return -ENODEV;
+
 	if (netdev->dev_id == 0)
-		other_netdev = geth->port1->netdev;
+		other_port = geth->port1;
 	else
-		other_netdev = geth->port0->netdev;
+		other_port = geth->port0;
+	other_netdev = other_port ? other_port->netdev : NULL;
 
 	if (other_netdev && netif_running(other_netdev))
 		return -EBUSY;
@@ -1065,7 +1107,6 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
 		   new_size,
 		   port->rxq_order);
 	if (other_netdev) {
-		other_port = netdev_priv(other_netdev);
 		new_size += 1 << (other_port->rxq_order + 1);
 		netdev_dbg(other_netdev, "port %d size: %d order %d\n",
 			   other_netdev->dev_id,
@@ -1076,7 +1117,7 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
 	new_order = min(15, ilog2(new_size - 1) + 1);
 	dev_dbg(geth->dev, "set shared queue to size %d order %d\n",
 		new_size, new_order);
-	if (geth->freeq_order == new_order)
+	if (geth->freeq_ring && geth->freeq_order == new_order)
 		return 0;
 
 	spin_lock_irqsave(&geth->irq_lock, flags);
@@ -2387,8 +2428,35 @@ static irqreturn_t gemini_port_irq(int irq, void *data)
 	return ret;
 }
 
+static void gemini_port_clear(struct gemini_ethernet_port *port)
+{
+	struct gemini_ethernet *geth = port->geth;
+
+	ASSERT_RTNL();
+
+	if (!port->id && geth->port0 == port)
+		geth->port0 = NULL;
+	else if (port->id && geth->port1 == port)
+		geth->port1 = NULL;
+	else
+		return;
+}
+
+static void gemini_ethernet_disable_irqs(struct gemini_ethernet *geth)
+{
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_0_REG);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_1_REG);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_2_REG);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_3_REG);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
+}
+
 static void gemini_port_remove(struct gemini_ethernet_port *port)
 {
+	rtnl_lock();
+	gemini_port_clear(port);
+	rtnl_unlock();
+
 	if (port->netdev) {
 		unregister_netdev(port->netdev);
 		phy_disconnect(port->netdev->phydev);
@@ -2398,19 +2466,15 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 
 static void gemini_ethernet_init(struct gemini_ethernet *geth)
 {
+	ASSERT_RTNL();
+
 	/* Only do this once both ports are online */
 	if (geth->initialized)
 		return;
-	if (geth->port0 && geth->port1)
-		geth->initialized = true;
-	else
+	if (!geth->port0 || !geth->port1)
 		return;
 
-	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_0_REG);
-	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_1_REG);
-	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_2_REG);
-	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_3_REG);
-	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
+	gemini_ethernet_disable_irqs(geth);
 
 	/* Interrupt config:
 	 *
@@ -2442,10 +2506,20 @@ static void gemini_ethernet_init(struct gemini_ethernet *geth)
 	writel(0, geth->base + GLOBAL_HWFQ_RWPTR_REG);
 
 	geth->freeq_frag_order = DEFAULT_RX_BUF_ORDER;
-	/* This makes the queue resize on probe() so that we
-	 * set up and enable the queue IRQ. FIXME: fragile.
-	 */
-	geth->freeq_order = 1;
+	geth->initialized = true;
+}
+
+static void gemini_port_publish(struct gemini_ethernet_port *port)
+{
+	struct gemini_ethernet *geth = port->geth;
+
+	ASSERT_RTNL();
+
+	if (!port->id)
+		geth->port0 = port;
+	else
+		geth->port1 = port;
+	gemini_ethernet_init(geth);
 }
 
 static void gemini_port_save_mac_addr(struct gemini_ethernet_port *port)
@@ -2541,15 +2615,6 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
 
-	/* Assign pointer in the main state container */
-	if (!id)
-		geth->port0 = port;
-	else
-		geth->port1 = port;
-
-	/* This will just be done once both ports are up and reset */
-	gemini_ethernet_init(geth);
-
 	platform_set_drvdata(pdev, port);
 
 	/* Set up and register the netdev */
@@ -2600,17 +2665,39 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	if (ret)
 		goto unprepare;
 
+	if (!of_property_present(np, "phy-handle") &&
+	    !of_phy_is_fixed_link(np)) {
+		dev_info(dev, "no PHY\n");
+		goto irq_only;
+	}
+
 	ret = gmac_setup_phy(netdev);
 	if (ret) {
-		netdev_err(netdev,
-			   "PHY init failed\n");
-		goto unprepare;
+		dev_err_probe(dev, ret, "PHY init failed\n");
+		if (ret == -EPROBE_DEFER)
+			goto unprepare;
+		goto irq_only;
 	}
 
-	ret = register_netdev(netdev);
-	if (ret)
-		goto unprepare;
+	rtnl_lock();
+	ret = register_netdevice(netdev);
+	if (!ret)
+		gemini_port_publish(port);
+	rtnl_unlock();
+	if (ret) {
+		phy_disconnect(netdev->phydev);
+		dev_err(dev, "netdev registration failed: %d\n", ret);
+		goto irq_only;
+	}
+
+	return 0;
 
+irq_only:
+	dev_info(dev, "keeping port for shared IRQ\n");
+	port->netdev = NULL;
+	rtnl_lock();
+	gemini_port_publish(port);
+	rtnl_unlock();
 	return 0;
 
 unprepare:
@@ -2706,6 +2793,9 @@ static int gemini_ethernet_probe(struct platform_device *pdev)
 	spin_lock_init(&geth->irq_lock);
 	spin_lock_init(&geth->freeq_lock);
 
+	/* Quiesce firmware state before child IRQ handlers are registered. */
+	gemini_ethernet_disable_irqs(geth);
+
 	/* The children will use this */
 	platform_set_drvdata(pdev, geth);
 
@@ -2717,10 +2807,13 @@ static void gemini_ethernet_remove(struct platform_device *pdev)
 {
 	struct gemini_ethernet *geth = platform_get_drvdata(pdev);
 
+	rtnl_lock();
+	geth->initialized = false;
+	rtnl_unlock();
+
 	devm_of_platform_depopulate(&pdev->dev);
 	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
 	geth_cleanup_freeq(geth);
-	geth->initialized = false;
 }
 
 static const struct of_device_id gemini_ethernet_of_match[] = {

-- 
2.56.1

