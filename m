Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407954;
	b=Qx5VO+oCvUPgB5pSJ/pXX2a1GjlITOGzOHTWX3PD3jzg4qVFAy0NHUxnr2TuDN0zvzjs
	 zXf16xk+gUxa7/ILReTkpaKwIk5s5E1W19L4opYUWnSfcEhfqng3nnIyiYVRbjdIGCDyl
	 7j8/uxnId38HMTaOwXwTlbRgLwlwW/Hi0K9qF+IxIdPcRIIR7V9EsvA3PSf9US+r4Pp9t
	 ppAvIZPE3xHUhjEqqNNMZPVfH0zVc48Xb/mtk+i8JZ+IXlMkeRk8JGsuH1eto2xW3WQtG
	 MhVGGXU+2yREY3kup/kp7wI7wBGITfxAhCjphgdV/XjHmOINalwgl8cFUhImY0sTDVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407954;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EAMJgMrAqdD2gzzWO8T2wlvBsKn3ZG3JbBtPJIQlCWA=;
	b=MLCA0TiLkXeMR2Sp45BlZAYWCfCo4zOVykrjMj4BBX6n/6MmbdC21qMSxC8t2tC2vbOL
	 KEsNJVeeLNE8DptD6zJc0m/amLWWr0u9hjCiRxr8ll+TolJgRYGKB6Mcl/0A5bwo3jG+Q
	 eIywmqcNjFVyD/94GdpF8mRo6dbwq18PUMNReiHD+fAerm+7x5AKfiLxGqghKm7kqYpuE
	 iGqmfMVb0A85974hKoWArJeA/GS6a0t1j1LXUyQQ/ngCJhgmuyP3YL5R4rI0qpoPMil+P
	 tKoQGhiS2ZbJncd9HHkw/Ouy54VBFH7AXlwLfxw1lZeW+Ds7Iz1nUeLp91vLNVotiTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lIz08jWa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51E9606A330
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lIz08jWa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91EE1F000C4;
	Mon, 23 Nov 2026 04:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795407954;
	bh=EAMJgMrAqdD2gzzWO8T2wlvBsKn3ZG3JbBtPJIQlCWA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lIz08jWaSZgD+zbfFPkXjW0LrfsN/FHIGcK7d1h0yEK+Ec40r0MxbqgAOuDQCUEON
	 n1IGb/o5Q8JIJzo/LJCMe1yLEtIm67gL69b+o9XgHFfl8xHA3FqqLEYtSj+8zGfj06
	 iX+Fq1sjn/IhNLjd/XfscCZv7Lx1YRKk8gkzL5oXyRBduX7QTTutyTPsRmzYIYc90X
	 KhiGuZP2DOTvVqKVOFSc3zIXJ3V7Q5z0cJ/x4yH+okrVzaPlHWWGQz+2q3Zma3dy0R
	 M64S1B5cLExGhg4AMGZMTTjMUexiSQ6wAvuDZYntHXfpIIjKIBSJNZCvpyrWpTLA2d
	 J52rfmWm7GOYQ==
Subject: Re: [PATCH net-next v5 4/6] ionic: map the FEC type through a helper
 in ionic_get_fecparam()
From: netdev-bot+sashiko@kernel.org
To: eric.joyner@amd.com
Cc: netdev@vger.kernel.org, brett.creeley@amd.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 vadim.fedorenko@linux.dev, nikhil.rao@amd.com, edumazet@kernel.org
Date: Mon, 23 Nov 2026 04:25:53 +0000
Message-ID: <179540795350.3135.5068085678567262262@kernel.org>
In-Reply-To: <20261118-ionic-get-fec-stats-v5-4-c9c0ee63df4c@amd.com>
References: <20261118-ionic-get-fec-stats-v5-4-c9c0ee63df4c@amd.com>
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

- [Low] This commit replaces the single `switch
  (port_info->config.fec_type)` in ionic_get_fecparam()…

--

ionic: map the FEC type through a helper in ionic_get_fecparam()

This patch moves the mapping from config.fec_type to ethtool FEC values
out of ionic_get_fecparam() and into a new helper,
ionic_fec_type_to_ethtool(). The helper is then called once for
fec->active_fec and once for fec->fec. The commit message describes
this as "No functional change".

> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c b/drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
> index a192302c5e19b..c55148f3ae8fa 100644
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
Can these two loads of port_info->config.fec_type return different
values?

Before this patch the switch loaded the field once and set both fields
from that one value, so active_fec and fec always matched. Now there
are two separate plain loads.

port_info is DMA-coherent memory that the firmware writes. It is
allocated in ionic_port_init():

    idev->port_info = dma_alloc_coherent(ionic->dev,
                                         idev->port_info_sz,
                                         &idev->port_info_pa,
                                         GFP_KERNEL);

The store to fec->active_fec sits between the two loads, so the
compiler has to reload the field.

One concurrent writer is ionic_lif_handle_fw_up()->ionic_port_init().
That path sends the PORT_INIT dev command without RTNL, and the
firmware refreshes port_info while it runs. ionic_get_fecparam() also
does not check IONIC_LIF_F_FW_RESET.

If fec_type changes between the two reads, ethtool --show-fec could
report something like active_fec=RS with fec=OFF. The old code could
never produce that.

Would it make sense to read the field once into a local and pass that
to both calls? For example:

    u8 fec_type = READ_ONCE(port_info->config.fec_type);

It also looks like the later patch in this series, "ionic: report the
operational FEC mode from ethtool --show-fec", still reads the field
twice in the non-autoneg case. When an_enable == 0,
ionic_active_fec_type() returns READ_ONCE(port_info->config.fec_type),
and fec->fec does a second READ_ONCE() of the same field. So the window
seems to remain at the end of the series.

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-ionic-get-fec-stats-v5-0-c9c0ee63df4c%40amd.com
