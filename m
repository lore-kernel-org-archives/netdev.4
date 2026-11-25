Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617427;
	b=gx9BFp3DcsgSINCj+rnthSUxG6HBJrhls5hGa4w0zH2hiXJpQy0b+uXHn1deud7GBLE6
	 Dba1iL9a97PFTVUNTIeJDPBXeDWHo9+4E28raOFTaBWILqCtRWs9lbCPT/f0M/sFR6pSu
	 n84tJ/8HMIG0YDdNzW8OUaYaOHufehbMy57+u/UNOpoCOO8YjhFYQ9S9eWvJfG8i3Hbiq
	 ZJ3flwh908jNF14hn8ZM6Wyh2spetC1bs5O58rBP0SDWN7BMaSpECDBzcpDF2RAQYYB33
	 yOUKO1tej3EndrjJtOrG3D+UfuVrNZHXlIU8srpuIEyp+TWd4LOF2h5hymp5plbP5PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617427;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UI3b/gELHVYalkRB4XyjY/BrPA924TcgWqJQg7zISQA=;
	b=r0qCRRqTzREu23ynWKevHeYASbHKte8xpbNMFEwhoWVxt/e0nVq+X06a5Y4tPWUtnZId
	 uDScXq66lemz0Rg2g/qZCYbeQR7qknEJsLDe5u3rALugylE8YKgSMqR7GwN3HeBAEAHwY
	 c4dSfifQux8RgmoBdGq+o5rf1aLHPwYdk7hOG/RLATqei3P4pcygSjDSDGtV7yG87KMWA
	 /MxTfYGAX4DGZTbR0zXUwmxZ7FjTcYnZYuxDbcdxbLlLLBim8F37MWLFfMIErViAICVl8
	 6C/04spvq92QoHpzdkE2P0uN+UgEzgfjytM5ClcNEDv6ANO2V/Zi9HBdctyiJkoE2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6fy8wMw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FED606A329;
	Wed, 25 Nov 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m6fy8wMw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC121F000C6;
	Wed, 25 Nov 2026 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617426;
	bh=UI3b/gELHVYalkRB4XyjY/BrPA924TcgWqJQg7zISQA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m6fy8wMwRfRHQpXO1z8sDHalVp8Jd58U14fX/W2sz6Sxu7C3lcK/KP+HoDZa8/Yof
	 RuQL5pqJ5/eTNzgFho4OdkWRO6Fmk9sQtM0SCoIS7vChGGGfjCwDI/plJ5yC6XZxhi
	 rdp52cwpujaytJk0oU2dZl7A/3gq8fmpA7MNBAwtciPZFu8xTixkKG9IM+wIP/E4O9
	 wTd9ZRufGaQc4G9mGjDmvzjiGUJCnoqsksXWU5ETVY1ppfnZ7vckFQFdx8/jA7L/Eu
	 xC6T9eRvraOfAuA1PNxwKOBC2WuhbwNNHwxyQCbF1xYlYMQJCCZGTh2U2tyr94eWHl
	 x4AqVnt9iD1+w==
Subject:
 Re: [PATCH net-next v2 5/7] net: lan743x: handle a failed reopen on resume
From: netdev-bot+sashiko@kernel.org
To: cbabroski@nvidia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, Raju.Lakkaraju@microchip.com,
 maxime.chevallier@bootlin.com, yuiko.oshino@microchip.com, nb@tipi-net.de,
 woojung.huh@microchip.com
Date: Wed, 25 Nov 2026 14:37:05 +0000
Message-ID: <179561742562.3135.3380061250286040261@kernel.org>
In-Reply-To: <614c536edbd2cf29e8a53076612404d1091d18c5.1795027003.git.cbabroski@nvidia.com>
References: <614c536edbd2cf29e8a53076612404d1091d18c5.1795027003.git.cbabroski@nvidia.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The RX-filter resync added to lan743x_pm_resume() after
  netif_device_attach()…
- [Low] This is a patch-structure concern: one commit bundles three
  changes under the subject "handle a failed reopen on resume".

Pre-existing issues:
- [Low] lan743x_rfe_set_multicast() writes and validates only perfect-
  filter slots 1..min(mc_count,32).

--

net: lan743x: handle a failed reopen on resume

This patch makes lan743x_pm_resume() check the return value of
lan743x_netdev_open(). On failure it calls dev_close(), and a new ndo_stop
wrapper skips the hardware close while the device is detached. It also
skips the close in lan743x_pcidev_shutdown() when the device is already
detached, drops lan743x_pci_cleanup() from the lan743x_hardware_init()
failure path, and reprograms the RX filter after netif_device_attach().

> diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
> index b226078bf3a96..228b6ab539a17 100644
> --- a/drivers/net/ethernet/microchip/lan743x_main.c
> +++ b/drivers/net/ethernet/microchip/lan743x_main.c

[ ... ]

> @@ -4076,7 +4089,6 @@ static int lan743x_pm_resume(struct device *dev)
>  	if (ret) {
>  		netif_err(adapter, probe, adapter->netdev,
>  			  "lan743x_hardware_init returned %d\n", ret);
> -		lan743x_pci_cleanup(adapter);
>  		return ret;
>  	}

[Severity: Low]

This isn't a bug, but the subject only covers part of what this commit
does. It contains three separate changes:

  - the reopen failure handling (dev_close() and lan743x_netdev_stop())
  - the lan743x_hardware_init() failure path (the present check in
    lan743x_pcidev_shutdown(), and dropping the lan743x_pci_cleanup()
    call that d6423d2ec39c added)
  - the RX filter reprogram in lan743x_pm_resume()

The third change runs on every successful resume, not only after a
failed one. RFE_CTL is written only in lan743x_rfe_set_multicast().
lan743x_rfe_open() writes only RFE_RSS_CFG. So the reprogram also
restores RFE_CTL and the multicast filter on every normal resume.

Would it be easier to review and backport these as separate patches?

[ ... ]

> @@ -4109,10 +4121,23 @@ static int lan743x_pm_resume(struct device *dev)
>  	 * For instance, it is true when system wakesup after pm-suspend
>  	 * However, it is false when system wakes up after suspend GUI menu
>  	 */
> -	if (netif_running(netdev))
> -		lan743x_netdev_open(netdev);
> +	if (netif_running(netdev)) {
> +		ret = lan743x_netdev_open(netdev);
> +		if (ret) {
> +			netdev_err(netdev, "failed to reopen after resume: %d\n",
> +				   ret);
> +			dev_close(netdev);
> +		}
> +	}
>  
>  	netif_device_attach(netdev);
> +
> +	/* ndo_set_rx_mode is skipped while the device is detached */
> +	if (netif_running(netdev)) {
> +		netif_addr_lock_bh(netdev);
> +		lan743x_rfe_set_multicast(adapter);
> +		netif_addr_unlock_bh(netdev);
> +	}

[Severity: Medium]

Does this resync cover unicast address changes made while the device was
detached?

__dev_set_rx_mode() returns early when the device is not present. That
return comes before the unicast promisc accounting, not only before
ndo_set_rx_mode():

net/core/dev_addr_lists.c:__dev_set_rx_mode() {
    ...
	if (!netif_device_present(dev))
		return;
    ...
	promisc_inc = netif_uc_promisc_update(dev);
	if (promisc_inc)
		__dev_set_promiscuity(dev, promisc_inc, false);

	if (ops->ndo_set_rx_mode)
		ops->ndo_set_rx_mode(dev);
}

lan743x does not set IFF_UNICAST_FLT, so it depends on the core setting
IFF_PROMISC when dev->uc is non-empty. lan743x_rfe_set_multicast() only
enables unicast acceptance through IFF_PROMISC:

	if (netdev->flags & IFF_PROMISC) {
		rfctl |= RFE_CTL_AM_ | RFE_CTL_AU_;

Consider this sequence:

  - lan743x_hardware_init() fails on resume, so the device stays
    detached with IFF_UP set. This patch now handles that case.
  - A macvlan, or a VLAN with its own MAC, is brought up on top.
  - dev_uc_add() runs on the lower device, but __dev_set_rx_mode()
    returns early, so uc_promisc and IFF_PROMISC are never set.
  - On the next successful resume, this resync calls
    lan743x_rfe_set_multicast() with IFF_PROMISC still clear.

Wouldn't frames for the new unicast address be dropped until a later
rx-mode event runs the core path? __dev_set_rx_mode() and
dev_set_rx_mode() are not exported, so the driver cannot call the core
path directly.

The commit message says:

    While the device is detached, the core does not call ndo_set_rx_mode, so
    address list changes made in that window, such as IPv6 multicast joins,
    which do not take rtnl, never reach the RX filter. Program the filter
    again after the device is attached.

The IPv6 multicast case is handled. For unicast list changes, though, the
filter still seems to miss them after this patch.

At this commit lan743x_hardware_init() does not appear able to fail. The
window opens with the later commit "net: lan743x: reset the device on TX
timeout", which makes lan743x_dmac_init() return the SWR poll error. That
commit's reset work copies the same multicast-only resync, so it does not
close this gap.

[Severity: Low]

This is a pre-existing issue, but lan743x_rfe_set_multicast() writes
perfect filter slots 1 through min(mc_count, 32) only. It never clears
RFE_ADDR_FILT_HI_VALID_ in slots past the current list length:

			if (i < 33) {
				lan743x_csr_write(adapter,
						  RFE_ADDR_FILT_HI(i), 0);
				...
				data |= RFE_ADDR_FILT_HI_VALID_;
				lan743x_csr_write(adapter,
						  RFE_ADDR_FILT_HI(i), data);

If the multicast list shrinks from N to M > 0 entries, can slots M+1..N
stay valid while RFE_CTL_DA_PERFECT_ is still set? The hardware would then
keep accepting groups the stack has already left.

Nothing in lan743x_hardware_init(), lan743x_rfe_open() or
lan743x_mac_init() invalidates slots 1..32 either. The new resume resync
relies on this helper, so it has the same behaviour.

>  	rtnl_unlock();
>  
>  	return 0;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795027003.git.cbabroski%40nvidia.com
