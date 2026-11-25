Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617429;
	b=J0eF+olCWjMpatRQo5g0mvgoW6QSMUWaUbxGt93buk9MHI5L2vDgVFCY3W96XXQQu3x/
	 t75o4wdmngrTSUgYjtOOTfjekpqS3KnBuHxMA40EShTbXpALPP3Bw9ZDx3NvJTCjXaIUN
	 zu5uJtn4odFi9XgpCbALg7rcfMBVaZbWRDi2UWy9Eo/UHDu/vp2yGYKCnvSE/1JKm7je5
	 vHEZiBuwLfPQSTudeP6W8GNT3ulO9GXNFkkrZBpIM8lwWkd/CO+5T7nU72NW8vYQYCXkQ
	 rpHXraKZOG+RVRrmyv6e1fHm8OF7gCNcyWYjEh9pjkVs+2N+lK8Y2tb1x316oK99qnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617429;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XKlofb4mp2YjJH48h+x2W8bCswXbdvaAGXnOq1DoHEg=;
	b=o/E1bDSSPxhWWr6IDS1rW/AJGZ1qh4yzqjstsndXkdlzdXU8Etplui/f1GiiSGDkEz26
	 xOnmo1XLpBslPbwQQXUZCdDW5Ej2iEnJdAP3fClzTXgocnbGl0KB2wJctyrhr4YAvoEUC
	 opNqES/Oa7kQnaWFU6EBOL4MpqLODverRJTwWtpI2vo4dJ5jN2dO02HAGKFciuNHVzRUz
	 aWtq6oQf6w+AUl3QUQA5CtxSFFCS0UDZR3Dql+ENfQuhA0fS3vTQsrSqq8VtQU4Wgr6Wb
	 8A1M9psEl3OhPGY6kA0Ocx/ukHZjsiGMLDi+1bC9ESM8U9+ay6OaOpZ0QdF5iBrki7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eC5wP0aZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F6606A333;
	Wed, 25 Nov 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eC5wP0aZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4A01F000ED;
	Wed, 25 Nov 2026 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617428;
	bh=XKlofb4mp2YjJH48h+x2W8bCswXbdvaAGXnOq1DoHEg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eC5wP0aZ58R25sb7QsgyhBiRygWlYXuvOorQ3N99XVPqbooL6DBSXQKQyFt731i0I
	 II/gl/U7Mz9wGzLuS8R1HE0EqgGgTaXCVXYllNdBtqNIq/cBuQcdVolYt5m/qDwPct
	 uuZ7Ya91eJtKunr/FJ1lR+KQ2MBFcI4b0TpcuIQBauI0cgQDsjnB+4mMdBRz1J0aJQ
	 S1dc5U8mpAYAC7CVg3JXSIrsb+HWNigEaTYaRMTLqsSAKUKEmjDgyMOWlITFlkEK6Z
	 AazmlUZorEIGa+rGbQQkn5JqQheGIRWZf5LPujkSmEAeoy7pQfGQ8+R2hIdfjRi/x2
	 tih8Hwuk5grEQ==
Subject:
 Re: [PATCH net-next v2 6/7] net: lan743x: reset the device on TX timeout
From: netdev-bot+sashiko@kernel.org
To: cbabroski@nvidia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, Raju.Lakkaraju@microchip.com,
 maxime.chevallier@bootlin.com, yuiko.oshino@microchip.com, nb@tipi-net.de,
 woojung.huh@microchip.com
Date: Wed, 25 Nov 2026 14:37:07 +0000
Message-ID: <179561742750.3135.10907427867283855252@kernel.org>
In-Reply-To: <a6d08d5760ecabea5c77d6001a8281c820873512.1795027003.git.cbabroski@nvidia.com>
References: <a6d08d5760ecabea5c77d6001a8281c820873512.1795027003.git.cbabroski@nvidia.com>
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

- [Low] A single TX timeout can trigger two back-to-back device resets,
  because lan743x_reset_work() does not wait for a dev_watchdog() call…

--

net: lan743x: reset the device on TX timeout

This adds an ndo_tx_timeout handler to the lan743x driver. The handler
schedules a work item that, under rtnl, detaches the netdev, closes it,
soft-resets the DMA controller, reopens it and reattaches it. The patch
also makes lan743x_dmac_init() return an error when the DMAC soft reset
times out.

> diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
> index 228b6ab539a17..3f129a22921e1 100644
> --- a/drivers/net/ethernet/microchip/lan743x_main.c
> +++ b/drivers/net/ethernet/microchip/lan743x_main.c

[ ... ]

> @@ -3381,6 +3385,12 @@ static int lan743x_netdev_close(struct net_device *netdev)
>  	struct lan743x_adapter *adapter = netdev_priv(netdev);
>  	int index;
>  
> +	/* lan743x_reset_work() takes rtnl, so it cannot be waited for here.
> +	 * A running one returns if the device is still down when it gets
> +	 * rtnl, otherwise it resets the reopened device once more.
> +	 */
> +	cancel_work(&adapter->reset_work);
> +
>  	lan743x_phylink_disconnect(adapter);
>  
>  	synchronize_net();

[ ... ]

> @@ -3485,6 +3495,57 @@ static int lan743x_netdev_stop(struct net_device *netdev)
>  	return lan743x_netdev_close(netdev);
>  }
>  
> +static void lan743x_reset_work(struct work_struct *work)
> +{
> +	struct lan743x_adapter *adapter =
> +		container_of(work, struct lan743x_adapter, reset_work);
> +	struct net_device *netdev = adapter->netdev;
> +	int ret;
> +
> +	rtnl_lock();
> +
> +	if (!netif_running(netdev) || !netif_device_present(netdev))
> +		goto unlock;
> +
> +	netdev_warn(netdev, "resetting after TX timeout\n");
> +
> +	netif_device_detach(netdev);
> +	lan743x_netdev_close(netdev);

[Severity: Low]
Can one TX timeout cause two resets in a row here?

netif_device_detach() only clears __LINK_STATE_PRESENT. It does not take
dev->tx_global_lock. dev_watchdog() holds that lock while it checks
presence, scans the queues, prints a message and calls ndo_tx_timeout():

net/sched/sch_generic.c:dev_watchdog() {
	spin_lock(&dev->tx_global_lock);
	if (!qdisc_tx_is_noop(dev)) {
		if (netif_device_present(dev) &&
		    netif_running(dev) &&
		    netif_carrier_ok(dev)) {
		...
				netdev_crit(dev, "NETDEV WATCHDOG: CPU: %d: transmit queue %u timed out %u ms\n",
				...
				netif_freeze_queues(dev);
				dev->netdev_ops->ndo_tx_timeout(dev, i);
	...
}

This interleaving looks possible:

CPU0 (dev_watchdog)                 CPU1 (lan743x_reset_work)
spin_lock(tx_global_lock)
netif_device_present() is true
                                    netif_device_detach()
                                    lan743x_netdev_close()
                                      cancel_work()  /* work is running,
                                                        not pending */
netdev_crit(...)
lan743x_netdev_tx_timeout()
  schedule_work()  /* requeues */
spin_unlock(tx_global_lock)
                                      netif_tx_disable()  /* waits on
                                                  tx_global_lock */

The netif_tx_disable() call in lan743x_netdev_close() is the first point
that serializes against dev_watchdog() through tx_global_lock. It runs
after cancel_work(), so nothing cancels the requeued work.

When the first reset calls netif_device_attach(), the requeued work sees
netif_running() and netif_device_present() both true. It then runs the
full detach/close/dmac_init/open/attach sequence a second time. That
means a second link flap and a second PTP clock unregister and register,
which can give the clock a new /dev/ptpN again.

The ndo_stop path does not have this window. There,
__dev_close_many()->dev_deactivate_many()->netdev_watchdog_down() stops
the watchdog before ndo_stop runs cancel_work(). The commit message only
accepts an extra reset for the ndo_stop/reopen race.

Would moving cancel_work() after netif_tx_disable() in
lan743x_netdev_close() close this window?

> +
> +	ret = lan743x_dmac_init(adapter);
> +	if (ret) {

[ ... ]

> +static void lan743x_netdev_tx_timeout(struct net_device *netdev,
> +				      unsigned int txqueue)
> +{
> +	struct lan743x_adapter *adapter = netdev_priv(netdev);
> +
> +	schedule_work(&adapter->reset_work);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795027003.git.cbabroski%40nvidia.com
