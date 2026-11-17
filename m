Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957029;
	b=t5B3Nn8U5EyX3DZJZZy+gyqgx0G3oSXBCZKUgUbEgLbRQ5IBZa4GWml8Q5v9sPkCe46U
	 aC8DQga6IAus2d5r0Rlm3+Ga3+Q5GXpRkmrHcw3iUj3NaQEqTcQcYlBVMK3WfqsPh4auY
	 i7p56/zbySGWnMEL1Idr5ztc/qCFK3biOra0lQ7FB3UaNrz7B3wgaq0ruXtXwXEoAcA44
	 4UAzRY9cm7zoCQ1rXx4fJkgryAdMzfonzpCuT+bilHwf6CFsjhb3Uv2kHejmrl2KPZ2kO
	 SoWOZrqHT6+AbsIcnbmet+wPuNlnKUQywaYozIV+DWuVpcm0cXwVBiGuGqb9Y7mn5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957029;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V30PxotQwi22hEFXESUjYde/wVtAFXOIhw6/3E1NQPI=;
	b=PMGw0I+gmxkS59xXCbUy4AGP6bRT+2pbUaROHFerhGgOfkStsYXF3L7TprTbhPAj+GN0
	 7VOrd4Y6mdRglmIlaIWMY39tBlDTBe55EymbONvhGzTres9pNPnso5DYppWLJfXTLxEA+
	 Rlwp4X468AUxcTIeoymbpZkpcxEgqL11AX6E/IHTCqd7aZv7HjqrZdTCdgfQLqCnYMBvA
	 gH/OXS868vOH+cJCLKQ8MuSNsd7P/Bi5/xU+YaUkgEWfi5lsn15zruSSaXdJClKbGQOUq
	 //GBLBp6SLSlpAiNyML+m4NtpuAGpkuG+uqXggxgo8195hxW/YIKuSrLg1KDJEErLWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY1CK1Yi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1FA606A333
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY1CK1Yi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFD11F000C4;
	Tue, 17 Nov 2026 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957029;
	bh=V30PxotQwi22hEFXESUjYde/wVtAFXOIhw6/3E1NQPI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oY1CK1Yiptv8Kz8Wln/ZXNghdzg0+KCH6umSMiX4snTTPs4WAlBNVQpHhoLbm+k0B
	 A5lYcB30aGQrtUQG7sVTemZFf7+OtNkiHVQ5eqsjEWk3AvcB6YPsLvbjuquWbDRN76
	 QGEE2VIclJcabpd/c6/1+bY64ebhipAgnLs8pxs2p5nXmWanC3Rw5jQcb2PAE9JOYw
	 +9sw2GWMQ91qcJCothsOA4kEIeV7tzFW7OEj0xbl5nbRXQM4EBDp1JegbuU/FdGjiT
	 FkN98SG8wQOK4t0kPScD9T+dBDSNnP8vTuxY6PRS9qhNUG9RJitze9GcVdRmPspGzA
	 Z4ZMcMkRtK9rQ==
Subject: Re: [PATCH net-next v4 4/6] ionic: map the FEC type through a helper
 in ionic_get_fecparam()
From: netdev-bot+sashiko@kernel.org
To: eric.joyner@amd.com
Cc: netdev@vger.kernel.org, brett.creeley@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, nikhil.rao@amd.com, edumazet@kernel.org
Date: Tue, 17 Nov 2026 23:10:28 +0000
Message-ID: <179495702811.3136.11203317455960639884@kernel.org>
In-Reply-To: <20261116-ionic-get-fec-stats-v4-4-d25cae9f1e87@amd.com>
References: <20261116-ionic-get-fec-stats-v4-4-d25cae9f1e87@amd.com>
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

- [Low] In drivers/net/ethernet/pensando/ionic/ionic_ethtool.c, the
  refactor changes ionic_get_fecparam() so that it reads the device-…

--

ionic: map the FEC type through a helper in ionic_get_fecparam()

This patch moves the mapping from config.fec_type to the ethtool FEC
values out of ionic_get_fecparam() and into a new helper,
ionic_fec_type_to_ethtool(). The helper is then called once for
fec->active_fec and once for fec->fec. The commit message says there
is no functional change.

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index 13b5874fe5ad4..8f0f1585116bc 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c

[ ... ]

> +static int ionic_get_fecparam(struct net_device *netdev,
> +			      struct ethtool_fecparam *fec)
> +{
> +	struct ionic_port_info *port_info;
> +	struct ionic_lif *lif;
> +
> +	lif = netdev_priv(netdev);
> +	port_info = lif->ionic->idev.port_info;
> +
> +	fec->active_fec = ionic_fec_type_to_ethtool(port_info->config.fec_type);
> +	fec->fec = ionic_fec_type_to_ethtool(port_info->config.fec_type);

[Severity: Low]
Could active_fec and fec end up built from two different values of
port_info->config.fec_type here?

The old code loaded config.fec_type once, as the switch expression, and
set both fields from that one value. The new code does two separate
plain loads, one per ionic_fec_type_to_ethtool() call. There is no
local snapshot, no READ_ONCE() and no lock.

port_info is coherent DMA memory shared with the device:

ionic_main.c:ionic_port_init() {
    ...
	idev->port_info = dma_alloc_coherent(ionic->dev,
				     idev->port_info_sz,
				     &idev->port_info_pa,
				     GFP_KERNEL);
    ...
}

Its address is passed to firmware in ionic_dev_cmd_port_init():

	.port_init.info_pa = cpu_to_le64(idev->port_info_pa),

>From that point, firmware writes config.fec_type. RTNL does not
serialize those writes.

If firmware updates the field between the two loads, ethtool --show-fec
could report a configured/active pair that never existed together. The
compiler cannot merge the two loads either: with -fno-strict-aliasing,
the u32 store to fec->active_fec may alias the u8 source.

Given this, is "No functional change" in the commit message quite
accurate?

The later patch in this series, "ionic: report the operational FEC mode
from ethtool --show-fec", rewrites these lines but keeps the double
read. When autoneg is off, ionic_active_fec_type() returns
READ_ONCE(port_info->config.fec_type), and ionic_get_fecparam() then
reads READ_ONCE(port_info->config.fec_type) again for fec->fec.

Would it be simpler to read config.fec_type once into a local u8 and
use that for both fields?

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-ionic-get-fec-stats-v4-0-d25cae9f1e87%40amd.com
