Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538969;
	b=FtXZ+8wwq5dqwm/gCGA8ek5DO1qjd2U5oQKmVmFnXHFSVhKvUUunkHeWlxQYIttw9n+t
	 tCzIlMiga//ZhmQyWvfuqTNpoG001+16zRFMU0I6Zq0y12ZV3kbZc30CYTcW4YC7FdKO2
	 +f+VpMscs2nwM6mLnXnWohJog2REgqtbqiTn7KbxqOfYVvLa63hVmWcQlx30KR+FkCLY+
	 OpAxa88M7c2ntYtLYk+ADe4vsdvSu/uwav2F2M0brHwcM036SWiPbKVlJgYLIKdTPJXtP
	 iPogbhSBpgUhtetb8Mmxh/yUJNOH6KBPk+MNkrWe4R3R20B0zjxoBa70P8F8b56pkvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538969;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wYLNAZcvAlxW8drbiBSHvvk3XyZKonPGhZLlrgm0+CU=;
	b=DMXSEK1oixKYCU0ZEP5WMR9OkCc9VeCfrfUs+kgDAlzfFlMRHNZ3dc/OSXoK1z48vRLx
	 O+BzoRzYqsndaEYUOqKDnPjIwkQCKRf/sEmtYqgP7H7JCxiZ2PueSxBdr7zNguzCcOQ16
	 MpLwBMyKWs8rT+VfCMhCGSVb8KW/6Z6a+V+ejPUscZjTsHQ44uLUEbDGZDqPPZdhTiapY
	 eykGQ6jNw+tPvp4+YT5Dgv6h01Z2I1uTIOpXa0+UwyJMVVpxLnbsZn1NsDGK3FhwkHpRa
	 FCttnFBNEl+GR/mj/xwOk746iu/Jj0WjjC21vUU5KeVIqxFMMS9vMU6EmhUQn3NNsyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY4UUBmj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5741860A2606;
	Tue, 24 Nov 2026 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VY4UUBmj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2851F000D0;
	Tue, 24 Nov 2026 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538968;
	bh=wYLNAZcvAlxW8drbiBSHvvk3XyZKonPGhZLlrgm0+CU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VY4UUBmj6CUyELYpfvbDSWKr9HAPiBDaTEyPMkyBARELbp96ObcSDI+Z4sztgWq+S
	 EmmQNxyS3w0s556g339p7mvkl3Ai6zq849SMMUQj/ePsaDg78HcnrfZ0+YVp/9ostX
	 f6K8Vt7gZuU9uPCm6Dv+9iSWQPPNhvjst6dImNy09ixDTf7AStiuPpVAL9nHq38WI/
	 9Hg4d353tHeGidxyJ8HMGzVx3h4EleKyxf35Uh63Gv5ky14JYOeXtKALQjtlWf2CO5
	 GnlXAY7T53MqidXdliBi/Pjh+ZilzXabwx9uB9YRFifN6ipoc4iIcJwOLtpcw0++08
	 SwodWxMOGkI2g==
Subject:
 Re: [PATCH net-next v6 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, nb@tipi-net.de, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Tue, 24 Nov 2026 16:49:27 +0000
Message-ID: <179553896749.3135.9852837290681703615@kernel.org>
In-Reply-To: <20261123164835.1733304-5-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-5-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On ACPI (non-DT) GENET systems, the new C45 scan can create a
  phy_device that GENET then attaches to instead of the intended PHY.
- [Low] Adding read_c45/write_c45 slows GENET probe on ACPI (non-DT)
  systems by much more than the commit message says.

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This adds read_c45/write_c45 callbacks to the UniMAC MDIO driver. Each
access does an ADDR cycle followed by a READ/WRITE cycle, and MDIO_CFG is
switched between C22 and C45 mode only when needed. Every cycle is now
followed by an idle check, resume takes the bus lock around the clock
divider update, and the BMSR workaround is skipped for C45 DT children.

> The platform device that GENET instantiates when it is probed without a
> Device Tree node (e.g.: ACPI) does not mask any address, so it is scanned
> too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a timeout
> per frame since GENET's interrupt is not registered yet when the bus is
> registered. That makes the scan slower at probe time on such systems, the
> same way the C22 scan already is.

[Severity: Low]

Could the commit message say how large this slowdown is?

For each empty address, get_phy_c45_ids() does a failing MMD 1 DEVS2
read and then the MMD 0 DEVS2 fallback read. That is two C45 reads, so
four frames (ADDR + READ each). Each frame goes through
bcmgenet_mii_wait():

	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);

The GENET ISR is not installed at this point, so nothing calls
wake_up(). Each frame sleeps the full HZ/100, which is 4-10 ms depending
on HZ.

With one C22 PHY on the bus, the C45 scan adds about 31 x 4 = 124
sleeping frames. That is roughly 0.5-1.2 s per GENET instance.

The existing C22 cost is about 63 frames: 32 BMSR workaround reads plus
31 failed PHYSID1 reads. Total probe-time MDIO waiting therefore roughly
triples.

Would it be worth stating the size of the delay? It would also help to
explain why the C45 scan cannot be avoided on these buses. Known hardware
here, such as the Raspberry Pi 4's BCM54213PE, is C22-only and gains
nothing from the scan.

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index f8e5c1811d96b..b01e99327b561 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -302,6 +408,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

[Severity: Medium]

Can this change which PHY GENET attaches to on ACPI systems?

Without a DT node, bcmgenet_mii_register() does:

	else
		ppd.phy_mask = ~0;

So bus->phy_mask = ~pdata->phy_mask = 0 here. With read_c45 now set,
__mdiobus_register() runs:

	if (!prevent_c45_scan && bus->read_c45) {
		err = mdiobus_scan_bus_c45(bus);

This covers every address that has no C22 device.
mdiobus_prevent_c45_scan() only skips the scan for Micrel OUIs.

Later, the has_acpi_companion() branch of bcmgenet_mii_probe() does:

	phydev = phy_find_first(unimacbus);

This returns the lowest-address phy_device on the bus, whether it is a
C22 or a C45 device.

Suppose something answers C45 ID reads at an address below the intended
C22 PHY. Would GENET then call phy_connect_direct() on that device
instead?

That device could be a C45-only PHY or switch. It could also be a ghost
device from a C22 PHY that misdecodes C45 frames sent to other
addresses. mdiobus_prevent_c45_scan() guards against that case, but only
for Micrel.

This has not been confirmed on known ACPI GENET boards, e.g. RPi4 with
the BCM54213PE at address 1, so it depends on what is on the bus.

There is also a side effect: with bus->read_c45 set, get_phy_device()
falls back to C45 ID probing for any C22 address whose ID reads as 0.
C45 frames now reach devices that only ever saw C22 frames before.

The commit message covers the probe-time slowdown but not this change in
PHY selection. Should the unmasked non-DT bus be kept out of the C45
scan?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123164835.1733304-1-florian.fainelli%40broadcom.com
