Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195775;
	b=eS8JYAqGwavKowKGIpau0dMa5ZX7zURxEaVDz8K9KWwkHDUGvrn//WiBfq+wq2OUprjU
	 sEbou5BlUtfJVcGcijxYVMH4qPvgNgv9DGk3oP+QI6ta6tvQZhweBgR8AAsdxMVjn8MIO
	 2Igv8OxfDjIOVZLWvQnhpY92gzsmKnNoTzmvmX5DuPJZxBzq8KAh8USP0cgPX/Y5l+nYo
	 fcq1w2XMlsRaDZ1eChLq9Za0QlaOTVmNvnFJyR6Suluf9/vQqXDr+XYSprrdz+/QiCoel
	 Slx06trCs096M3iB/DYuxpGKS/lVl4P6Rw63CuHD7+MTm/0GS3Pg6hJtYPEMZPtyBRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195775;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=VVhRmPzd3GJWUe1W4GtpoULEj7iHjpx9b6zhNdHXKfc=;
	b=fv2LGKBp5p06Rw7BZSOdhFsVKvfXB1DPGtsd+nhwiNGvSK5c8dYkqZ/G1DGxIhgy6Nb5
	 wXxYXhEegyvFi6T+cXsR2TRLNlUlgATuHN4NGGQ0OtQ38v2D7XyfPZ+5hJLJZvT14cEr9
	 EfC/mPxgVdjTqmjUT5MJ2raTYDtiB/tIFo25jY+m3PjyV00J9z2t8CcHPbYU8GhuMqbcx
	 0uNRzozzt6zHorMMp3oXTcQjI8fJka8mlyVZsu+0cpZgGYl8T2vwPTKD0YbaqDPuDMtTk
	 JhE4YrzSmlQc04LKbomkP+I/xnfDokv6qeQyEXXTA+Exuk04MMjluPxkc6RlWFK16pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQURBK4f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158D606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQURBK4f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9F71F000D2;
	Fri, 20 Nov 2026 17:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195774;
	bh=VVhRmPzd3GJWUe1W4GtpoULEj7iHjpx9b6zhNdHXKfc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CQURBK4fh1Bn4X98X54iV8SuGb5LfaXxmtU5pfJitvbIEmzDRj9lw1eDrfJEZBK3e
	 /179udLgDyFGtKtNDaE5lRAsUQhs0Hzlvn35CfHVXDqLqCDeZNPW+iXgwRaUu0Ch02
	 Sci4/MSStCt+t00LtzH68D9YQ4bn7T41Ube8HsecnH2f8OT1TquYJPpTsXXaaY0G3T
	 GESb8spjRaltAJsqvWnsztRNf7FRQBIVrPrLUBT6HIH8yqooJD4vihvqcFzZb35Vkw
	 rxVZN+4zBROuUXDlDRKMbaPQdzZJDdj0s9mV1UsoFqxSXOg0tws2DUOe49MokgW373
	 D3M3HMZ+ebftw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:20 +0100
Subject: [PATCH net-next v9 01/14] net: ethernet: cortina: Keep shared free
 queue parent-owned
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
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-1-298671d799d5@kernel.org>
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

The software free queue is shared by both Ethernet ports, but teardown is
not ordered around that ownership. On parent unbind or module unload, the
parent remove callback runs before devres depopulates the child devices. It
therefore destroys the queue while both child netdevs are still registered
and can be doing DMA. Devres then removes each child, and both child remove
callbacks destroy the same queue again, resulting in up to three cleanup
attempts.

Removal before the first interface has been opened is broken as well. The
shared block initialization assigns a nonzero queue order, but allocation
is deferred until open. Cleanup consequently derives a nonzero page count
and dereferences the NULL queue ring.

Depopulate both port devices before cleaning up the queue, and perform that
cleanup only from the parent. Disable the free-queue interrupt after the
managed handlers have drained, since its threaded handler can re-enable it.
Guard cleanup for paths where no queue was allocated.

Hold parent-managed enables on the port clocks across child removal, IRQ
draining and shared queue cleanup, so teardown never relies on clocks
already released by the children.

Port 1 owns the shared refill interrupt, so prevent the children from being
unbound independently. Unregister each netdev before detaching its PHY so
ndo_stop can still access netdev->phydev.

Reported-by: Myeonghun Pak <mhun512@gmail.com>
Closes: https://lore.kernel.org/netdev/20260917192835.58126-1-mhun512@gmail.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 40 +++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 3ed8b1ae0bbc..f198e535f1a0 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -1004,6 +1004,9 @@ static void geth_cleanup_freeq(struct gemini_ethernet *geth)
 	unsigned int pages = len >> fpp_order;
 	unsigned int pn;
 
+	if (!geth->freeq_ring)
+		return;
+
 	writew(readw(geth->base + GLOBAL_SWFQ_RWPTR_REG),
 	       geth->base + GLOBAL_SWFQ_RWPTR_REG + 2);
 	writel(0, geth->base + GLOBAL_SW_FREEQ_BASE_SIZE_REG);
@@ -2387,11 +2390,10 @@ static irqreturn_t gemini_port_irq(int irq, void *data)
 static void gemini_port_remove(struct gemini_ethernet_port *port)
 {
 	if (port->netdev) {
-		phy_disconnect(port->netdev->phydev);
 		unregister_netdev(port->netdev);
+		phy_disconnect(port->netdev->phydev);
 	}
 	clk_disable_unprepare(port->pclk);
-	geth_cleanup_freeq(port->geth);
 }
 
 static void gemini_ethernet_init(struct gemini_ethernet *geth)
@@ -2635,17 +2637,25 @@ static struct platform_driver gemini_ethernet_port_driver = {
 	.driver = {
 		.name = "gemini-ethernet-port",
 		.of_match_table = gemini_ethernet_port_of_match,
+		.suppress_bind_attrs = true,
 	},
 	.probe = gemini_ethernet_port_probe,
 	.remove = gemini_ethernet_port_remove,
 };
 
+static void gemini_ethernet_disable_clk(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static int gemini_ethernet_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct gemini_ethernet *geth;
 	unsigned int retry = 5;
+	unsigned int clocks = 0;
 	u32 val;
+	int ret;
 
 	/* Global registers */
 	geth = devm_kzalloc_obj(dev, *geth);
@@ -2656,6 +2666,30 @@ static int gemini_ethernet_probe(struct platform_device *pdev)
 		return PTR_ERR(geth->base);
 	geth->dev = dev;
 
+	/* Keep both port clocks enabled until the shared queue is torn down. */
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
+		struct clk *clk;
+
+		if (!of_device_is_compatible(child, "cortina,gemini-ethernet-port"))
+			continue;
+
+		clk = devm_get_clk_from_child(dev, child, "PCLK");
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
+					     "failed to get port clock\n");
+
+		ret = clk_prepare_enable(clk);
+		if (ret)
+			return ret;
+		ret = devm_add_action_or_reset(dev, gemini_ethernet_disable_clk,
+					       clk);
+		if (ret)
+			return ret;
+		clocks++;
+	}
+	if (!clocks)
+		return -ENODEV;
+
 	/* Wait for ports to stabilize */
 	do {
 		udelay(2);
@@ -2683,6 +2717,8 @@ static void gemini_ethernet_remove(struct platform_device *pdev)
 {
 	struct gemini_ethernet *geth = platform_get_drvdata(pdev);
 
+	devm_of_platform_depopulate(&pdev->dev);
+	writel(0, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
 	geth_cleanup_freeq(geth);
 	geth->initialized = false;
 }

-- 
2.56.1

