Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795624178;
	b=qP4Xrlk6IrUFqfTBdMufX/ujY11OUgI3A2ka1ddO5vSeAfC4+EkKDQlwf5unOdP67Px4
	 ZI2EUAVGBoLDNNh1OgGlH8F/Ei09aDo7FVnvw39kqY28zkCWM6CnI/I73ZtA1TZ/ArMA4
	 DCIzcy3YP8fQzLbhbCIp3blbEc2QGVJrId48CGe6zgsSg3YGwnQcSeeN+BYr8gbvi7q71
	 PmX+VeGYvNxcSR5ys+BAtJKpD84zS1kNqWUu0pfDHgBEA2E+pjEfPG0PhgJl7EYiaG1vr
	 LMyNSqJF7+T7Eod16MmPELAovzeTppMz7Z/Mnd4efglPz6KBC2L/WISbfqIEqtzmiqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624178;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=ASYS5LcSGVobGmnz7A+WEgV0DD/dEsw19GdpYXv3zRI=;
	b=QxYH0MHvEaN5+FjHRSo4ZxLb3DBAQU+CzTWjzoaIK8rtaYiP8yyD3fkKKVYBVCXGdo9U
	 afUaJ78p2UsJLEBcm4ZE94J5BZCYCsU+v3hoKZ5iplQIEqfqHzp0pyt5vB3mjVlPhWjSM
	 h4Hphr0meD9X8afHHZ1R/wppCswX9IT8a6DOqG3AoddONJzj1dGFnp1BLDh3ERqJbKPkd
	 MGwDxuLWwsy+C4b9ARDIcRP/vGFM3KzWoQuO7iYmmr502K4heWLgEnYXIJarBoOB+nYYy
	 dBdk63NGTqSNU6ucVQXgzOGoMQxOExUM+YS5YMWXU0pqaE88uiCJKUjW/vPgw8eA5yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=YXQlyrYK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6A0606A330;
	Wed, 25 Nov 2026 16:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6A0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=YXQlyrYK
ARC-Seal: i=1; a=rsa-sha256; t=1795624128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d9PjjrYWF8E6MSXFnWTY74TT8HKv+EbSaMKTPejp5jgVGM8MvACNX8HSYB60J9U/SM8GlayDNW2CGr0QBP3a5CyFUmmGQuD7w7wS9BMnYItKVMf4fZVotzZ+5qEG9nxm5+Bay06xD3NTtm0EP2lISSPUWyTZghg6AyH3Wrj6Opc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795624128; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ASYS5LcSGVobGmnz7A+WEgV0DD/dEsw19GdpYXv3zRI=; 
	b=MxdB90XDqn0TjPltQecv5oz8XLWC2tcvJs8SQY1yPBbET2yd3aeyiE9ygsgVpjPS4z5P019vioHZpLBN3MpS5uVIoPKsjAFnT4FRcUl6alQP+jK0aRPZ+cVeMqb8kgm8SYDnVMPrvMP08Y7xFymdEOqNWteoVX3S4Nynsp+VZMQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=YXQlyrYKgoS83YX44pDgeiKXwnoyCbt91NI0PwNti5Ss5UxEhnyUINJCYuT1/LZ9CQoyUKyIJzkifKP2IUmx+f8jsfnaitXQ1iBaAzDlcL51SE9vhUy2KHuGWUpw4OiXv02sMluPwkQ0OmQihEeDm6ATq0kCqWp8xjRJACLNHsI=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=ASYS5LcSGVobGmnz7A+WEgV0DD/dEsw19GdpYXv3zRI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795624126636918.7718905734253;
	Wed, 25 Nov 2026 08:28:46 -0800 (PST)
Date: Wed, 25 Nov 2026 16:28:28 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>, Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <awcMrBlm2RGC7gJ2@pie>
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
 <20261120102754.778283-3-magnusleatti@kernelriot.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120102754.778283-3-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.600.19
X-ZohoMailClient: External

On Fri, Nov 20, 2026 at 07:27:54AM -0300, Magnus Leatti wrote:
> "wol g" is accepted, but the chip sleeps right through magic packets
> in S5: motorcomm_init() turns OOB WoL off and nothing turns it back on
> at power-off.
> 
> Turns out the chip can just arm itself. Hit it with a reset, OOB WoL
> comes right back on, and about 2-3 s later it has the PHY up, receiver
> running, the eFuse address loaded into the first MAC filter, and PMT
> ready for magic packets. Timed that from userspace without a driver
> bound.
> 
> So on a power-off with "wol g": remove, reset, set WOL_CTRL_PKT_EN
> again because the reset clears it, enable PME, D3hot.
> 
> Notes:
> 
>  - It wakes on the eFuse address, not the software one. Same as r8169.
>  - Magic packets only. "wol u", reboot, kexec and interface down stop
>    at the remove.
>  - Hibernation that powers off through .shutdown arms too, and resume
>    copes without a reset. Tried twice: woke on the packet, link back.
>  - After a power loss (cable out and back in, BIOS set to stay off) it
>    won't wake until the next clean shutdown. The vendor driver does
>    the same, so that's the hardware.
> 
> With this the box wakes on a magic packet to the eFuse address, 5 of
> 5. Without it, 0 of 3.

The last paragraph should probably not be carried in the commit message,
please remove it.

> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 63ce2301a0f6..34abbdb645ec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -12,6 +12,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/rtnetlink.h>
>  #include <linux/slab.h>
>  #include <linux/stmmac.h>
>  
> @@ -27,6 +28,9 @@
>  #define EPHY_CTRL				0x1004
>  /* Clearing this bit asserts resets for internal MDIO bus and PHY */
>  #define  EPHY_MDIO_PHY_RESET			BIT(0)
> +#define WOL_CTRL				0x100c
> +/* Magic and remote wake-up packet enable */
> +#define  WOL_CTRL_PKT_EN			BIT(1)
>  #define OOB_WOL_CTRL				0x1010
>  #define  OOB_WOL_CTRL_DIS			BIT(0)
>  #define MGMT_INT_CTRL0				0x1100
> @@ -363,6 +367,38 @@ static void motorcomm_remove(struct pci_dev *pdev)
>  	stmmac_dvr_remove(&pdev->dev);
>  }
>  
> +static void motorcomm_shutdown(struct pci_dev *pdev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
> +	struct stmmac_priv *spriv = netdev_priv(ndev);
> +	struct dwmac_motorcomm_priv *priv = spriv->plat->bsp_priv;
> +	bool wake;
> +	u32 reg;
> +
> +	/* Userspace is still running and may close the interface */
> +	rtnl_lock();
> +	wake = system_state == SYSTEM_POWER_OFF && netif_running(ndev) &&
> +	       (spriv->wolopts & WAKE_MAGIC) && device_may_wakeup(&pdev->dev);
> +	rtnl_unlock();
> +
> +	/* The netdev is unregistered after this. priv and its mapping stay. */

This is obvious, please remove this comment.

> +	stmmac_dvr_remove(&pdev->dev);
> +
> +	if (!wake)
> +		return;
> +
> +	/* Reset re-enables OOB WoL; left alone, chip arms itself (eFuse MAC) */
> +	motorcomm_reset(priv);
> +
> +	/* The reset has cleared it. Without it the chip does not wake. */

This is also obvious from code, please remove.

> +	reg = readl(priv->base + WOL_CTRL);
> +	reg |= WOL_CTRL_PKT_EN;
> +	writel(reg, priv->base + WOL_CTRL);
> +
> +	pci_wake_from_d3(pdev, true);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +}
> +
>  static const struct pci_device_id dwmac_motorcomm_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MOTORCOMM, 0x6801) },
>  	{ },
> @@ -374,7 +410,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
>  	.id_table = dwmac_motorcomm_pci_id_table,
>  	.probe = motorcomm_probe,
>  	.remove = motorcomm_remove,
> -	.shutdown = motorcomm_remove,
> +	.shutdown = motorcomm_shutdown,
>  	.driver = {
>  		.pm = &stmmac_simple_pm_ops,
>  	},
> -- 
> 2.56.1
> 

With these minors fixed,

Reviewed-by: Yao Zi <me@ziyao.cc>

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
