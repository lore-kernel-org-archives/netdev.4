Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592281;
	b=GSxfWnAYrC3DvAgXh3JQJY4ojJZlExiFryDjXbq1suvgs8fE6B0XDqEw1G6WlpDWr+Oo
	 pbFb8LFKgCPzzWQuW5lHbSvEsAXtDTAAKA/jlY4qi9smLSKWk38YyD5faNpXrhhw0z24M
	 W84we9wPhT4boXDCe54yty3mUyxIV0UEBioFT317Y3cO9J/OYylYWFzgr6rxtpQ6TcOw/
	 ZhoXxjnBXjfujGLlUEvS6G7yUx4HU3OMEiDFR5oPhy0lA2wLKxrT9gbGWJSCHN8Hdan8e
	 6JM1648meovEJuwBxCYcCUQG6IScPexmycOjaDLIsLMXoL3vDOv4SIwwd8i18Vx/wfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592281;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=txMFrZLoBMh46DRbpZdQXPCe/D7qF+CKakhaa0rXSP4=;
	b=sxjskX5vWyynFWORrxpE5aBbd8ny4Rw4YlvNWoQr75IP8S0ZGj8rDHIQENdzUv6dQF+M
	 v7cJ9fj5C3JPRBsLib7/pWa+Vrdy8gKtY93Eq+stReCFODutf1B7hR/jezPiYPyo/5n05
	 dwm65vqGVi1526DbKNKtl8qS3HW3ybVQoTBAF28fW4/86Zo80epwc7VXOKXsqAL+RlE8+
	 qHvu0XVbnCaXVo9A6xv2z3uG1VfdkSn5M0Y1KyU+MgsJcIXFhpR5iiO41zIcgECITYKA8
	 /x4yqmiWpW1UTQ+Qj6ent3cl31GjSXgbkyllV9Un7rSNjUPBwo3wZ6BdSJpCcGr7+jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnDopUy0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9286606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnDopUy0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C2A1F000C0;
	Wed, 25 Nov 2026 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592280;
	bh=txMFrZLoBMh46DRbpZdQXPCe/D7qF+CKakhaa0rXSP4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DnDopUy032Lb0Ye8XC4EcMSu+SelH1jXSCNAeSUvIgaIAH744PRSLEfywqdiPJEWO
	 /3BtErBhWG6JHCRSVG47AcnCy8v+o03xloivOEKywu27+5tR3u1Y27pI9kJ9otDipH
	 f7AsmHkUviJltxHY+zjmsehYzYtOEs6CXs2U3aPFphmJ7VhVw8m00LqC4GdGfmIpm7
	 ioqTDzTWR6jiIZPiJebzM7BqC8HiAkSr9jnCBedug0w0kMbBE7X0SAqRqznPK/bDk7
	 +pSv1DlBbkZeFPnAsOzFihVHLTgkP2JRRwVS5318iXH1g75KwO+PiORSuaxPz8SE1H
	 lQrM9/O7lCe4w==
Subject:
 Re: [PATCH] net: phy: avoid synchronous module request in async probe context
From: netdev-bot+sashiko@kernel.org
To: 18255117159@163.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 07:37:59 +0000
Message-ID: <179559227928.3135.10596298102368144827@kernel.org>
In-Reply-To: <20261124070753.25972-1-18255117159@163.com>
References: <20261124070753.25972-1-18255117159@163.com>
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

- [High] In async context, phy_request_driver_module()
  (drivers/net/phy/phy_device.c:643-648) now calls…
- [Low] The commit message presents the fix as letting the module load be
  'requested without blocking the async worker'.
- [Low] The patch fixes a user-visible boot-time WARN_ON_ONCE in
  __request_module() (kernel/module/kmod.c:145), and the underlying path…

--

net: phy: avoid synchronous module request in async probe context

When phy_request_driver_module() runs from an async worker, it now calls
request_module_nowait() instead of request_module(). This avoids the
WARN_ON_ONCE(wait && current_is_async()) in __request_module(). The warning
was hit when probing an RTL8126A behind a PCIe host controller that uses
PROBE_PREFER_ASYNCHRONOUS.

> Use request_module_nowait() when current_is_async() is true so that the
> PHY driver module load is requested without blocking the async worker.

[Severity: Low]
Could the commit message describe the actual hazard behind the warning?

The comment above the WARN in __request_module() describes a deadlock, not
just blocking:

	/*
	 * We don't allow synchronous module loading from async.  Module
	 * init may invoke async_synchronize_full() which will end up
	 * waiting for this task which already is waiting for the module
	 * loading to complete, leading to a deadlock.
	 */

do_init_module() calls async_synchronize_full() when the module has not
requested async probe. Before this patch, a PHY module that actually needed
loading could therefore hang the boot, not only warn.

The message also doesn't mention that the change drops the guarantee that
the PHY driver is loaded before phy_device_create() returns. Nothing else
makes up for this. mdio_uevent() only emits an OF-style MODALIAS, not a
PHY-ID based mdio: alias.

> Signed-off-by: Hans Zhang <18255117159@163.com>

[Severity: Low]
This fixes a user-visible WARN_ON_ONCE() in __request_module() and a
possible deadlock. Should it carry a Fixes: tag so backporters can tell
which kernels are affected?

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..a634b8b0c5b2d 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -639,8 +640,12 @@ static int phy_request_driver_module(struct phy_device *dev, u32 phy_id)
>  {
>  	int ret;
>  
> -	ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
> -			     MDIO_ID_ARGS(phy_id));
> +	if (current_is_async())
> +		ret = request_module_nowait(MDIO_MODULE_PREFIX MDIO_ID_FMT,
> +					    MDIO_ID_ARGS(phy_id));

[Severity: High]
Can this leave the PHY device registered without its dedicated driver?

request_module_nowait() is __request_module(false, ...), which only waits
for modprobe to be exec'd:

kernel/module/kmod.c:__request_module() {
    ...
	ret = call_modprobe(module_name, wait ? UMH_WAIT_PROC : UMH_WAIT_EXEC);
    ...
}

phy_device_create() therefore returns before the PHY module has loaded and
registered its phy_driver. The async worker then continues into
mdiobus_scan()->phy_device_register()->device_add() with no driver bound.

The comment in phy_device_create() explains why this request is
synchronous:

	 * We don't do normal hotplug because it won't work for MDIO
	 * -- because it relies on the device staying around for long
	 * enough for the driver to get loaded. With MDIO, the NIC
	 * driver will get bored and give up as soon as it finds that
	 * there's no driver _already_ loaded.

Take the RTL8126A from the commit message. r8169_mdio_register() checks for
the driver right after devm_mdiobus_register():

	} else if (!tp->phydev->drv) {
		...
		return -EUNATCH;
	}

If modprobe hasn't finished by then, wouldn't rtl_init_one() fail, so that
the NIC is never probed again? tg3_mdio_init() has a similar
!phydev->drv check and returns -ENODEV.

Some MACs attach the PHY before modprobe completes. For those,
phy_attach_direct() falls back to genphy:

	if (!d->driver) {
		if (phydev->is_c45)
			d->driver = &genphy_c45_driver.mdiodrv.driver;
		else
			d->driver = &genphy_driver.mdiodrv.driver;

		phydev->is_genphy_driven = 1;
	}

Once genphy is bound, driver_attach() skips this device when the dedicated
driver registers later. Doesn't that contradict this part of the commit
message?

    The PHY driver will still bind later, when it registers and the driver
    core attaches it to the already-created PHY device.

r8169 is partly covered by MODULE_SOFTDEP("pre: realtek"), so realtek is
usually loaded already on the reporter's board. Other MACs have no such
protection.

Before this patch, with module.async_probe=1 or a per-module async_probe
option, the PHY module was loaded correctly and only the warning fired. With
this change, that case races instead.

Would it be better to keep the module load ordered before the PHY device is
registered? For example, the probe could be deferred, or the NIC could avoid
probing from async context. Either would avoid making the request
fire-and-forget.

> +	else
> +		ret = request_module(MDIO_MODULE_PREFIX MDIO_ID_FMT,
> +				     MDIO_ID_ARGS(phy_id));

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124070753.25972-1-18255117159%40163.com
