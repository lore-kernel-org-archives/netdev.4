Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853090;
	b=5Je+e9Cs7NIXf/QHYLoEiWwF/iTMNkUSX8L6TxfQXR3BQe4/HwF77OBX0YoO4y/JRy+C
	 Ft66niTaDE6WkycZSs5WYajYtKqUpv4XhWoICPT2AVa7YAKxSlxwL8s8kvqp2+Qonwr/T
	 WqOf2gfkmZGSA+srXDbEvvjG4+y9VephYperVxRKCJzf7HBcvy7XNs3f3pukM3zpdI0Zl
	 jVOi0N7uwf0MkGk129WIdcunGnHOdYbnOshrkoFa6PFx8edtrzbjOQBqOVHjgTDyW/1m7
	 1VMsF6wt3sth6RjPWgWPSxZicStgL3mGssiHAWwDKUm0IOqn6weqaBWlcgaco5hP0NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853090;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MEmK62uLXuWw4WdQtZl8BjBNwRsMM/P7sRqpkRfqtuc=;
	b=SxA3uxbxscM+1e7UTNSsptzhCQ2gcvEs4tNgVvp1GcJAwzlzfJORefaVclW+BAFJnpxM
	 W82eefEDzlIutUuxA2YFZ4Ma7+/bGg0jhhBwuDbupMQmrfjYLR+9Zi3pvh9iX+//j4H7O
	 r0gfC0ynGin5LA+3WHxQElVlVeF85jGoJMrXyltTltL2EU8dS8GvvP9g8qrp+/eWYHq2/
	 1BzU3QtK+udnjn0PTBfgUMpsm0Lz7LxFuMwpnytfabYY75uYnE4U5Hk4/P5mTP/TK+OB/
	 iXSa17USU4JyFQ8VgaTPPQ82x+2MLojx2x8ZKLUUlipfbdti0Xr8Tb9xSroDC7scCrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftYq+aB3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856A606A31C;
	Sat, 28 Nov 2026 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftYq+aB3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752A61F00893;
	Sat, 28 Nov 2026 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795853089;
	bh=MEmK62uLXuWw4WdQtZl8BjBNwRsMM/P7sRqpkRfqtuc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ftYq+aB3NOJ2EeyX8dRMQVMIIMpcSorM4DO5VbjACov9P/d7USAeqEq8S+XeP8Cma
	 qyEzIQCXFjh+ihegTlZZi3eE0bN8Ysqb3gnvLlMQDhQuRJh4XD7PyKALFF7YaN4bLl
	 5z8RvK9gH7sUXLw3dRwsBc4IrygVq2+/x4gf5E39nT7yK1ISSmXfA1RxQ3OKf4n7cG
	 t4dRiQUYKGtsKROStjhUnptfiTdmNU5uWjSgo4mK0AbGKyHv87fbQoghXiPScQs94v
	 MZ8DeMyqqJc3RctfkIcyryZbZx3KUJmdFNDT+Jw8CdZr5TAoeIBXKqcyPR/AcXnurq
	 +xlZh/11UDSAQ==
Subject: Re: [PATCH] net: ethernet: sunplus: spl2sw: fix OF node leak in
 spl2sw_probe()
From: netdev-bot+sashiko@kernel.org
To: zhaofeng2@cmss.chinamobile.com
Cc: wells.lu@sunplus.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org
Date: Sat, 28 Nov 2026 08:04:49 +0000
Message-ID: <179585308901.3135.3807804002976380282@kernel.org>
In-Reply-To: <20261127074228.268-1-zhaofeng2@cmss.chinamobile.com>
References: <20261127074228.268-1-zhaofeng2@cmss.chinamobile.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Low] The patch fixes a reference leak that dates back to the original
  driver, but it has no Fixes: tag.
- [Low] The diffstat in the patch notes does not match the diff.

--

net: ethernet: sunplus: spl2sw: fix OF node leak in spl2sw_probe()

In spl2sw_probe(), the "ethernet-ports" node comes from
of_get_child_by_name(). This patch adds an of_node_put() for it after
the port setup loop, to fix a leaked reference on the probe path.

> spl2sw_probe() calls of_get_child_by_name() to obtain the
> "ethernet-ports" child node and uses it as the parent for
> spl2sw_get_eth_child_node() in a loop, but never releases
> the reference, leaking it on every probe (and on every
> goto error path).
>
> Drop the reference with of_node_put() once the node is no
> longer needed.
>
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

[Severity: Low]
Should this have a Fixes: tag? The of_get_child_by_name("ethernet-ports")
call in spl2sw_probe() arrived with the original driver:

Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")

> ---
> Verified against current tree. Leak found by code inspection
> (OF reference-counting audit of spl2sw_probe()).
>
>  net/ethernet/sunplus/spl2sw.c | 2 +--++
>  1 file changed, 2 insertions(+), 0 deletion(-)

[Severity: Low]
This isn't a bug, but the diffstat doesn't match the diff. The patch
changes drivers/net/ethernet/sunplus/spl2sw_driver.c, and
net/ethernet/sunplus/spl2sw.c does not exist. The bar also shows
deletions, but the diff has none.

Was this diffstat written by hand rather than generated by git
format-patch? With the error paths noted below, is the "Verified against
current tree" note accurate?

> diff --git a/drivers/net/ethernet/sunplus/spl2sw_driver.c b/drivers/net/ethernet/sunplus/spl2sw_driver.c
> index b5ae950f6d5b0..ce1045813f9cc 100644
> --- a/drivers/net/ethernet/sunplus/spl2sw_driver.c
> +++ b/drivers/net/ethernet/sunplus/spl2sw_driver.c
> @@ -476,6 +476,8 @@ static int spl2sw_probe(struct platform_device *pdev)
>  		spl2sw_mac_rx_mode_set(mac);
>  	}
>  
> +	of_node_put(eth_ports_np);
> +

[Severity: High]
The commit message says the reference leaks "on every goto error path".
Does this release cover those paths?

Only a normal exit from the port loop reaches this of_node_put(). Three
exits inside the loop jump straight to out_unregister_dev:

drivers/net/ethernet/sunplus/spl2sw_driver.c:spl2sw_probe() {
    ...
		ret = spl2sw_nvmem_get_mac_address(&pdev->dev, port_np, mac_addr);
		if (ret == -EPROBE_DEFER) {
			goto out_unregister_dev;
    ...
		ret = spl2sw_init_netdev(pdev, mac_addr, &ndev);
		if (ret)
			goto out_unregister_dev;
    ...
		ret = spl2sw_mac_addr_add(mac);
		if (ret)
			goto out_unregister_dev;
    ...
out_unregister_dev:
	for (i = 0; i < MAX_NETDEV_NUM; i++)
		if (comm->ndev[i])
			unregister_netdev(comm->ndev[i]);

out_free_mdio:
	spl2sw_mdio_remove(comm);

out_clk_disable:
	clk_disable_unprepare(comm->clk);
	return ret;
}

None of these labels drop eth_ports_np. Doesn't the reference on the
ethernet-ports node still leak whenever one of these gotos is taken?

The -EPROBE_DEFER case happens routinely. of_nvmem_cell_get() returns
-EPROBE_DEFER until the nvmem provider binds. Each deferred probe retry
would then leak one more reference on the node.

Could this use an unwind label that drops eth_ports_np before falling
through to out_unregister_dev? Declaring eth_ports_np with
__free(device_node) would also work.

The next leaks are pre-existing and were not introduced by this patch:

- spl2sw_get_eth_child_node() returns early from inside
  for_each_child_of_node(), and the port_np reference it returns is never
  released.
- phy_np leaks on the error exits.

Would a respin be a good time to fix those as well?

>  	/* Find first valid net device. */
>  	for (i = 0; i < MAX_NETDEV_NUM; i++) {
>  		if (comm->ndev[i])

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127074228.268-1-zhaofeng2%40cmss.chinamobile.com
