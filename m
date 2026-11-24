Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544989;
	b=YdQI7ZwJw6YYkM4FMSdAQ2XWy+lBdjFw7JkF7XFJH2XyHSHdSbCAM7T/bVmP6jVjLfpC
	 bHvyCseKnowP03hPL8qgRVUMHH3fctFipuVBVVJC9/aRKel4xXNeI/V65ic1kGvTp4mSq
	 r1A22pS8YwhnkLRHeTjJjgGNJxbGrZxnJ2XkyXUpRxz4XGjk3uBTfPSwpmJC2lYIAWmwn
	 7gYl2Zy7Hz+/p5jJ7YYl0ga76cTNyKHYy9KTpImn3mgdDCnQ+6qZGPzuH8QGUx4uU3s8W
	 j5knrkrOydb6L4Wj/xAfogqvxhI26FUp7AAsS96UUeFck0hQl0ttOJzOwsqA6WSNNFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544989;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LwPQvU8HFIEJxsVRsyJ8MuUH901uLz76RTZpffHbgbM=;
	b=ARKyCo0j7MCELOcegS7eyGUw1nVfJcda/wBYBdSS4f6yjr5d2B5VRsWrHS/j0VXam6eZ
	 nV090AcUjjLVJJo1LRhSKgTA/FyX8gg6HbXnR9ykah4kGZecnUVriAwbuXx3FtqJAg3JV
	 x3nRGNu5pt82WtOoEKpdF+FmqeuiB8iUUz7g4r0rarjrN+1xR4qn4O8P2AvadiCz5LeJl
	 qS5P9kK2NQn65PlvOdDdFSGxHpNL7vucyVCYPsDLNiXpvwud5xWmQGW1LjUT5dv8fgK4K
	 HzoUKkMflH4xV6PUN6SZA3TbDvc6Pv7Uxp8BdOp3amsErvr/pztjFATym6ACbg5iIxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTiQtxxG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCBE606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTiQtxxG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE3A1F000C0;
	Tue, 24 Nov 2026 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544988;
	bh=LwPQvU8HFIEJxsVRsyJ8MuUH901uLz76RTZpffHbgbM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cTiQtxxG+SQwGLzgaWSz6U0Ljmo9ape9xdV2ZhteUS38A3Y9hid3TtP+oUjzQCQry
	 uKh3ZbwGpI2Ai6+lJtMjfNPt/r/hujbTIOfa3HUkvAehrPFdi9wfkLshzks8m55CxH
	 r669/68/CbUjgTJTyGQf+NlNq4klB547cdDR2JZHGfeEQqCVUYassN9w2SA9ZF3x+5
	 pJX9ZDycRYeNDMQv8tOLX7yjGdbMLToLm3n+01w57jvQkrp16n2DO6AypIbmTfdkR1
	 EBSLKBKo5K5YGSOP0XM1daMB/fZID5VSMJv5jPwdVX3UGyhSJYuQfA47RKZOuoLauj
	 vtjWckPMVqOjw==
Subject: Re: [PATCH net-next v9 01/14] net: ethernet: cortina: Keep shared
 free queue parent-owned
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:47 +0000
Message-ID: <179554498743.3135.16883208999993946923@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-1-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-1-298671d799d5@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message has Reported-by and Closes tags but no Fixes:
  tag and no Cc: stable, even though the patch fixes user-triggerable…
- [Low] gemini_ethernet_probe() now gets every available child's PCLK
  with devm_get_clk_from_child() and enables it with…

--

net: ethernet: cortina: Keep shared free queue parent-owned

This patch makes the parent gemini-ethernet device the only owner of the
shared software free queue. The parent now depopulates the port devices
before it cleans up the queue, and it keeps the port clocks enabled itself.
Each netdev is now unregistered before its PHY is disconnected.

Closes: https://lore.kernel.org/netdev/20260917192835.58126-1-mhun512@gmail.com/

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 3ed8b1ae0bbc2..f198e535f1a00 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -2387,11 +2390,10 @@ static irqreturn_t gemini_port_irq(int irq, void *data)
>  static void gemini_port_remove(struct gemini_ethernet_port *port)
>  {
>  	if (port->netdev) {
> -		phy_disconnect(port->netdev->phydev);
>  		unregister_netdev(port->netdev);
> +		phy_disconnect(port->netdev->phydev);
>  	}
>  	clk_disable_unprepare(port->pclk);
> -	geth_cleanup_freeq(port->geth);
>  }

[Severity: Low]
This isn't a bug, but should the commit message carry Fixes: tags, and
maybe Cc: stable?

The geth_cleanup_freeq() call removed from gemini_port_remove() here goes
back to the original driver. gemini_ethernet_remove() also calls it, so a
single parent unbind or module unload could run the cleanup up to three
times.

geth_cleanup_freeq() never clears freeq_ring. The later runs then call
dma_free_coherent() and kfree() on memory that was already freed. Unbinding
before any interface was opened also dereferenced the NULL freeq_ring.

The phy_disconnect() before unregister_netdev() order was added later. With
the interface up, it makes gmac_stop() call phy_stop(netdev->phydev) with a
NULL phydev.

Something like:

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")
Fixes: 3e813d61401a ("net: gemini: Clean up phy registration")

Without these tags, stable trees that still have these bugs may not pick up
the fix.

[ ... ]

> @@ -2656,6 +2666,30 @@ static int gemini_ethernet_probe(struct platform_device *pdev)
>  		return PTR_ERR(geth->base);
>  	geth->dev = dev;
>  
> +	/* Keep both port clocks enabled until the shared queue is torn down. */
> +	for_each_available_child_of_node_scoped(dev->of_node, child) {
> +		struct clk *clk;
> +
> +		if (!of_device_is_compatible(child, "cortina,gemini-ethernet-port"))
> +			continue;
> +
> +		clk = devm_get_clk_from_child(dev, child, "PCLK");
> +		if (IS_ERR(clk))
> +			return dev_err_probe(dev, PTR_ERR(clk),
> +					     "failed to get port clock\n");
> +
> +		ret = clk_prepare_enable(clk);
> +		if (ret)
> +			return ret;
> +		ret = devm_add_action_or_reset(dev, gemini_ethernet_disable_clk,
> +					       clk);
> +		if (ret)
> +			return ret;
> +		clocks++;
> +	}
> +	if (!clocks)
> +		return -ENODEV;

[Severity: Low]
Is the commit message accurate about this part? It says:

  Hold parent-managed enables on the port clocks across child removal, IRQ
  draining and shared queue cleanup, so teardown never relies on clocks
  already released by the children.

gemini_ethernet_probe() enables the clocks, and the matching
clk_disable_unprepare() runs as a parent devm action. Both port clocks
therefore stay on for as long as the parent is bound, not only during
teardown.

The patch also adds new ways for the parent probe to fail, and the message
doesn't mention them. Because of the "if (!clocks) return -ENODEV;" check,
a parent with no available port children now fails to probe. Before this
patch that probe succeeded and did nothing.

The parent probe can also fail or defer if devm_get_clk_from_child() cannot
resolve a child's PCLK, since it only does OF lookups. The child's own
devm_clk_get() can fall back to clkdev lookups.

The in-tree gemini.dtsi provides "PCLK" for both ports, so in-tree boards
don't hit these paths. Could the commit message describe these changes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org
