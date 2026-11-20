Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170756;
	b=PcpdXUptrgFeIpz1ZwOfC5PStd+/5b4MpfSOQpH+wVhc+gUp0wdZh8ww7/aJQhPg0H5s
	 uMyFrQHU1vgYIfJGG85aALYv82x1TQpJCewOGPN1lSiY4HWcFOVivEeQPaKleGFUNHCcb
	 giZnIqfi/Wy5RZA807KkUz2T4hnRMEQXwue9b2h/TdjsgSeWhsytNxRCJKhxxGTc+Oq46
	 uaxEmfU6vKUgx7Oa5iZZ9g6ctgoJxeGrtRsjM41+bTxlzm/FtX+K+kylUiZk9ufI6jCrd
	 QP3HcfxbjU9nnLw+iPqrubXiP268zZJcfBoC5OSsddbR/LDJkEkztnRoQv9q7Q0YEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170756;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=njj8qhypBIHm5MzN0dZcRldHSxSDov02gsixS2B6Rwo=;
	b=EswuUOLZ/3/z6SlU2aXNXOCfFPRf3eAaPPFA/BLXqdhS54r/F+MJJqR/9oXuCTqZyxDp
	 fK62WPl+iE01gTdO3PYVXE+RWQWaoVFLoQDVihZaZfDuVUdnT7ps/76BogBL9GS3mp+81
	 rtUW4iIyJIsDW6BG39kQOVrpTq1D4M2WJRfVVFjJeLtkIWI8iNIHBPI/upsyow8ONm1Nj
	 qIspyFASanF2NOZIVwRHERQ8hctIGB7NEr4lGD/XzjKbxTIAS3DaMEouKi64BdhOvLUyf
	 ndbj5ZoFpPioS40ZvzEhiwrtlJ2OBgbgqr72SS1MUfyjDClR+eA1Chcxhg52mCzxcZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KStwpshj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D31606A326;
	Fri, 20 Nov 2026 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KStwpshj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B491F000CF;
	Fri, 20 Nov 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170756;
	bh=njj8qhypBIHm5MzN0dZcRldHSxSDov02gsixS2B6Rwo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KStwpshjFBmKPgeiHLnE6umtDW42e21MLz2AaGKAf91ffcXm8b6qkrf7L6nM/tBnz
	 FRI5uFt/cqQ/5xH6EB0w8CGf7H55032Y2/HpsENeWe7i7wTowsWrkJnDX57tzLYjG7
	 jSPz9wLNvV0UNgMf7LxVx0Ju7jy70P/pR5pRgHMEW4RLSE0QETnet7ZoV/ntkpfpEy
	 GYnZjnqfqYvf7cNb7ODdY3SXLJ4Ap/Yb6PJItAADcaQTnN8AwFfhiNI6bdYdHI79bb
	 y8bz/mosmdSWm30mORRLdIRpdESja6FX+bKK7JocxhW89nFbTWDgSEm9evTl5m1OMB
	 htCgkmhO2nEKg==
Subject: Re: [PATCH net v3 03/10] net: au1000: disconnect the PHY before
 freeing the MDIO bus
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Fri, 20 Nov 2026 10:32:34 +0000
Message-ID: <179517075464.3136.12005891937960917967@kernel.org>
In-Reply-To: <20261117193223.2795612-4-f.fainelli@gmail.com>
References: <20261117193223.2795612-4-f.fainelli@gmail.com>
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

- [Low] The commit message of "net: au1000: disconnect the PHY before
  freeing the MDIO bus" partly misstates what the patch fixes, and…

--

net: au1000: disconnect the PHY before freeing the MDIO bus

This commit adds phy_disconnect() calls to the au1000_probe() error path
and to au1000_remove(), so that phy_connect() is balanced. It also makes
au1000_reset_mac_unlocked() skip MAC control register accesses when
mac_enabled is clear. It also resets the MAC in au1000_remove() after the
PHY and MDIO bus are torn down.

> Balance phy_connect() on probe failure and removal. Otherwise PHY
> interrupts, device references and the attachment to the freed netdev
> survive teardown.

[Severity: Low]
Can a PHY interrupt actually survive teardown in this driver?

mdiobus_alloc_size() sets every bus->irq[i] to PHY_POLL. au1000_probe()
only writes a real IRQ into mii_bus->irq[] when aup->phy_static_config is
set:

    if (aup->phy_static_config)
        if (aup->phy_irq && aup->phy_busid == aup->mac_id)
            aup->mii_bus->irq[aup->phy_addr] = aup->phy_irq;

In that same case, au1000_mii_probe() returns before it reaches
phy_connect():

    if (aup->phy_static_config) {
        ...
        if (aup->phy_addr)
            phydev = mdiobus_get_phy(aup->mii_bus, aup->phy_addr);
        else
            netdev_info(dev, "using PHY-less setup\n");
        return 0;
    }

That leaves dev->phydev NULL, so the new phy_disconnect() calls are
skipped.

On the dynamic search path, which is the only one that calls
phy_connect(), the PHY's irq is still PHY_POLL. That means no interrupt
is ever requested, and phy_disconnect() never reaches
phy_free_interrupt().

The device and module references taken in phy_attach_direct(), and the
attached_dev pointer to the freed netdev, do look like real leaks. Should
the "PHY interrupts" part be dropped from the message?

> PHY teardown can re-enable the MAC for MDIO even if the interface was
> never opened. Reset the MAC after PHY and MDIO bus teardown, before
> releasing descriptors and register mappings. Skip MAC control accesses
> when mac_enabled is clear, since stopping an already clock-gated MAC
> hangs MTX-1.

Would it help to say that the new mac_enabled check also fixes an
existing hang when register_netdev() fails in au1000_probe()?

Before this patch, the au1000_reset_mac() call just before
register_netdev() gated the MAC clock and cleared mac_enabled. If
register_netdev() then failed, the err_out path called
mdiobus_unregister(), which does no MDIO access, and then called
au1000_reset_mac() again:

au1000_probe()
  au1000_reset_mac(dev);        <- clock gated, mac_enabled = 0
  register_netdev(dev) fails
  goto err_out
    mdiobus_unregister()
    au1000_reset_mac(dev)
      au1000_hard_stop(dev)
        readl(&aup->mac->control)   <- MAC already clock-gated

According to the commit message, this access hangs MTX-1. The message
describes the PHY teardown case but not this change in the
register_netdev() failure path. Mentioning it would show backporters
which failure modes this patch fixes.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193223.2795612-1-f.fainelli%40gmail.com
