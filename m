Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515629;
	b=QM97ABTl5swdUmB2sERRvBNAJiebLFFcek6CQEy7h24ode7FmBVp3WwiV01Jr53hh3Mb
	 BdSduUhM1+FcZ8eu+0Pu2+g6m6F2Pq/ALhT2D8vtf85cO3OBXLfatta1EqS+NvDgYVboU
	 K3AKhcMpqHZpHQK+zUM8d7Bme8tulq33victTBQt6CE2C9vcCM/dnUpNl8GcAGbi9ccAd
	 eS4oxf1QmgSieglFtnr+Qf+7RQIimWq9pXwKs4WEqgG9uwvGZfkr7z7CvTIsSadCwglBa
	 dJqSahUKQlvLP0/8gRyjU8OkGrc1QA5vCMAouiCAd9M85a89nOLSIIPJ0mia8YeLlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515629;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=71lhKW3WAtNPUMZQpIRwdFzKebxSgDk2Bsk4diiWFOc=;
	b=y83awqXHwpL0YQg3kJIotir9HNk4HPYg/8+5vviIFsg1sV769vmdD+g6MhT1cj9fw23K
	 GJRsLe4LmciYGf4DX2ftil287LoGwZN2g40zzUZOzMiC4nltaQecYqvNVv1BoI+R+NbP0
	 f2MMRCmZUbw3i06rnTp/mZ5Ld6zy6w363aUiHaET6+PEsvV0IyuWN5UTpSJv87r3t2vLC
	 BefpLhRBTYRCuv5ixBIjDWX9JSXNnEEbnWsOZkfVH82Z/Qe63jNxtNyxQFs5b2z1zj0G0
	 /6fGVSn2PqhkxFZvd2YhUkRuD/r6SPjzXBxDW9r2cG8MKVCFZHjart0nExWlb0fIx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8VESq8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60C4606A33D;
	Tue, 24 Nov 2026 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a8VESq8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CE21F000C0;
	Tue, 24 Nov 2026 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515629;
	bh=71lhKW3WAtNPUMZQpIRwdFzKebxSgDk2Bsk4diiWFOc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a8VESq8dwu+7Wc9G+agp0PYiJJedS6oUbkD/QEZDpyuFkAXRhFwgh3NwEYdaSAzbB
	 kJcZsnYDleJbz600ZB3l4xJh09zNwQBCCxIzukTNsJtYTBWqiIOWMUqoDmLsZC6vbW
	 6DcZaKrJgKolyKZZU5e7nkJLU/+V6W3XbxqPMj9QKD+ErWTPrlrvhjrX5NfgC9sLRv
	 N/aav3bu4M5C4DAPtwSXAFCxT6S30q8W4mzDhmH5wr0SnkVpCnGj2BmUiXNX/OT8ux
	 F41BSu2gS1hCN44UuEIafUhFrM6OwHiWFMy8bDgZy2pC0U3BwG3HdT2hAovCDZBVJB
	 C+E+mAFRHyorg==
Subject: Re: [PATCH net-next v9 04/10] bnge: add RXFH ethtool support
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:28 +0000
Message-ID: <179551562804.3135.9305263922001429893@kernel.org>
In-Reply-To: <20261123100746.1975030-5-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-5-vikas.gupta@broadcom.com>
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

- [Low] This commit sets four RSS-context fields in bnge_ethtool_ops:
  `.rxfh_per_ctx_key = 1`, `.rxfh_max_num_contexts =…

--

bnge: add RXFH ethtool support

This adds the ethtool get/set_rxfh and get/set_rxfh_fields callbacks for
the RSS hash key, the indirection table and the hash fields. Changes are
only accepted while the device is down. The default key now comes from
netdev_rss_key_fill(), and the indirection table is reset or kept when
the RX ring count changes.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> index 2467e44de291a..878fe4888160f 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c

[ ... ]

> @@ -757,6 +1090,18 @@ static const struct ethtool_ops bnge_ethtool_ops = {
>  	.get_eth_ctrl_stats	= bnge_get_eth_ctrl_stats,
>  	.get_pause_stats	= bnge_get_pause_stats,
>  	.get_rmon_stats		= bnge_get_rmon_stats,
> +	/* RXFH */
> +	.rxfh_per_ctx_key	= 1,
> +	.rxfh_max_num_contexts	= BNGE_MAX_ETH_RSS_CTX + 1,
> +	.rxfh_indir_space	= BNGE_MAX_RSS_TABLE_ENTRIES,
> +	.rxfh_priv_size		= sizeof(struct bnge_rss_ctx),

[Severity: Low]
This isn't a bug, but these four fields describe RSS context support.
This patch doesn't add create_rxfh_context, modify_rxfh_context or
remove_rxfh_context to bnge_ethtool_ops, so here they have no effect.

The ethtool core checks for the create callback before it reads any of
them, for example in ethnl_rss_create_validate():

    if (!ops->create_rxfh_context)
        return -EOPNOTSUPP;

As a result, "ethtool -X ethX context new" still returns -EOPNOTSUPP at
this commit, the same as before the patch. The new BNGE_MAX_ETH_RSS_CTX
define in bnge_vnic.h is only used by rxfh_max_num_contexts here.

The next patch in the series, "bnge: add ethtool support to manage RSS
contexts", adds all three callbacks. By the end of the series these
fields line up with the context code.

The commit message doesn't mention these fields. Could they and
BNGE_MAX_ETH_RSS_CTX move to the RSS context patch, where they are first
used? Alternatively, the commit message could note why they are added
here.

> +	.get_rx_ring_count	= bnge_get_rx_ring_count,
> +	.get_rxfh_indir_size	= bnge_get_rxfh_indir_size_eth,
> +	.get_rxfh_key_size	= bnge_get_rxfh_key_size,
> +	.get_rxfh		= bnge_get_rxfh,
> +	.set_rxfh		= bnge_set_rxfh,
> +	.get_rxfh_fields	= bnge_get_rxfh_fields,
> +	.set_rxfh_fields	= bnge_set_rxfh_fields,
>  };

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
