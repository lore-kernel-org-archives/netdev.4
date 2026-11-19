Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108147;
	b=GCrn4RoKqy0v8OcDgyna8CzDPHZXY2JRv8BCC6ahCXa1yHduZNhgIYCZKaujQRYnHnUY
	 82W9ZX6A1fnRsL9G2OsLb2hmpl6DC/9hs9hX5xZznPjRCOn5B8co/Sl4Vlox1nOxtaQLh
	 St9spsXRtaF3C9dd6xdibAun6uKX3lBUFyvqP9KcsWhKYARcJie1onmVRdEA98aOgEbZ9
	 zTTZxRgpyiPpjT8sHi+uHQByrv+Ywq7A+gvi67tVifV9MGQ7oKyi9WJ2PtOD7UV0qWi7p
	 3F0CKIN7UiDb7Hd9YmzSELTWgm61i4gNEWCF1hDgiN2vtFlX7ByFdnexNo9YknrRysw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108147;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fP3XcqiyC0HXROQDSnE9YZ9p6WEV0Jep+2zJXMAthCA=;
	b=z4ZrPVrKiTjYwByznUUlgm3fWsRifcF08wHoS67xBehA46uiRRokuWCGroxG9rwTwroD
	 WVHOL4EhmYsP+ndVfv93vU5jv60NzEFxw3qPskFNpkVCbZkIhr5oOuFRmL4efpUFV4HX8
	 CbasNuhNH4toer4/UPl0gldDJIO13in+4abYxt8G6VJkd9zThO3Bz/G42a5DpEee84bG0
	 P+CdRCPxLXRh5/GSCUyUv5vh90mUfRdcCcf67xx7i5B03VWOJmpsmG9BJh7qp0dlkn7tD
	 aVT6c59Jb49wDZxDw8mRjIRAHCHAEN6QfGR3VDOvMt8aN/jhqG9VOoCc1orO6YaIRAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0p4dIwx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD560A2633;
	Thu, 19 Nov 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0p4dIwx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707F11F000C6;
	Thu, 19 Nov 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108147;
	bh=fP3XcqiyC0HXROQDSnE9YZ9p6WEV0Jep+2zJXMAthCA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D0p4dIwxUM3EksLozKANuJCXmAeJzv8OrxEIKTn2KD6rn/gl9tB1IcgS4UcbkVO75
	 S0j+SP/ZiK1CWbAA9GdQN+ehoh/4IPs3a4vvpNm5GuLRx5NWheSHiT/Q8jpB4LRTq+
	 Ga7DybbgRvCBf/i9ZZk7U26qkKfo0J/ZusdKSyE6tL6ATXRiuy0w/j/zrtD4kU00Is
	 Bn1lhzYiNnlBgcEzBOMFPeoApiLbHs7MVxsQlGS/QG7NxDVwcO4N3HvUOuIUh4HT/K
	 yzEORDQofjq+rC0roqma/0olUig/LYAl9LbVQsCOYHe9vA8iAdrJ0AGK8hOt4NGSKK
	 8XwifWEshzjGA==
Subject: Re: [PATCH net-next v8 04/10] bnge: add RXFH ethtool support
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:06 +0000
Message-ID: <179510814600.3136.4406095238662565923@kernel.org>
In-Reply-To: <20261116140653.1685797-5-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-5-vikas.gupta@broadcom.com>
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

- [Low] The commit message does not mention a functional change in
  bnge_alloc_irqs() (drivers/net/ethernet/broadcom/bnge/bnge_resc.c).

--

bnge: add RXFH ethtool support

This patch adds the ethtool RXFH operations (get/set_rxfh and
get/set_rxfh_fields) to bnge. Changes are only accepted while the device
is down. It also moves the default RSS key to netdev_rss_key_fill() and
removes the RSS_HASH_TYPE_DELTA_CAP handling.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> index 506ceee775e19..25aa6e7c43c37 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c

[ ... ]

> @@ -435,12 +435,17 @@ int bnge_alloc_irqs(struct bnge_dev *bd)
>  	 * We dont need to consider NQs as they have been calculated
>  	 * and must be more than irqs_demand.
>  	 */
> +	old_rx = bd->rx_nr_rings;
>  	rc = bnge_adjust_rings(bd, &bd->rx_nr_rings,
>  			       &bd->tx_nr_rings,
>  			       irqs_demand - aux_msix, min == 1);
>  	if (rc)
>  		goto err_free_irqs;
>  
> +	/* The indirection table may point at rings that were just removed */
> +	if (bd->rx_nr_rings != old_rx)
> +		bnge_set_dflt_rss_indir_tbl(bd);
> +

[Severity: Low]
This isn't a bug, but should the commit message mention this change in
bnge_alloc_irqs()?

During probe, bnge_init_one() first calls bnge_net_init_dflt_config(),
which fills the default indirection table from the original rx_nr_rings.
It then calls bnge_alloc_irqs():

bnge_init_one()
    bnge_net_init_dflt_config()   <- table filled from original rx_nr_rings
    bnge_alloc_irqs()
        bnge_adjust_rings()       <- rx_nr_rings may shrink here

Without the new reset, the table could still hold entries for RX rings
that were just removed, and the new get_rxfh would report them before the
first open.

That looks like a fix for a stale-index problem that existed before this
patch. Would it be better as a separate patch, possibly with a Fixes: tag?

The changelog covers the other side changes in detail, such as the new
default key source, the removal of rss_hash_key_valid and the removal of
DELTA_CAP. It does not mention this reset. It also does not mention the
new BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP bit or the renumbering of the
BNGE_RSS_CAP_* enum in bnge.h.

>  	tx_cp = bnge_num_tx_to_cp(bd, bd->tx_nr_rings);
>  	bd->nq_nr_rings = (min == 1) ?
>  		max_t(u16, tx_cp, bd->rx_nr_rings) :

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
