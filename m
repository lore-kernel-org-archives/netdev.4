Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108146;
	b=ufrPDNOnzmA/VX4QONQBZc9wYN29Yi2bVYTLVcGlwwtvrfpEtw13614yvmEtrTHkPg6a
	 /9cwNl2z/O48pd/e3eNqmcnhrKLhCnqj66jwPMuEtkbCeL153JOeBvGOJmc9RdNv7kRVN
	 UmQb8SehOi/4BJH0iJ4+VAzpllyd3BsgNz2MNyamAj0fu02vIQ0uymPepIhfLv1vnb3qd
	 QtN/RYpSqdB1BT2yTFZvrzjfv8v1YEOw1tHo7ayDVOnWe5KaFmWKh2BzpOz10F9G1DVZc
	 rQPFgN97bkmA821+PV2OhZTJ4jeFzmspTf/sz3dLK+R+LXjKjAslBqgOtoO3c23ow8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108146;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZUBsQmWkWkBRXV1DDphKivlgIT9QM0m/AuyF/6NoUao=;
	b=k7HxNiIs8KwMB40INRXHhAnW/MhrhqLS9qEVVy4ia9sYo0mukX681vrjt9qCDgmT1Y26
	 6GkYtfIN8PPMsXNAC9Sq1c3TFKumlvqglTIm2WzbVkUGo8eD/tfvh2+e+wlzyCNSVhqlk
	 KN2Ldf95AEhYWN8K0Cz/LsI3uhoWCNOMR8lpJCdS92DIbXp7KLeQMDMf/42ln2Jx1OD+d
	 5f66sPSwoPoO4HUpm41Qexw5UTRmvsomI8vZECuW6+gZuQq9SIMkmSbtORN11yfraccNm
	 HrCuS9LLORHTZNgQziW2ZiJGURvbdl0495IkrpZxOzjG1bmWmRwhM6e39NCo+tYSiDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgsZFH7a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742A60A2627;
	Thu, 19 Nov 2026 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HgsZFH7a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9531F000CA;
	Thu, 19 Nov 2026 17:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108145;
	bh=ZUBsQmWkWkBRXV1DDphKivlgIT9QM0m/AuyF/6NoUao=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HgsZFH7aE1GVTP7GqcxUrV3ajwhNRY1bei0kfn4+Tx9ycK9Hc/1tgSsdlr9T3tQAi
	 wZsSaakrtgcRCBcih1RVAX9w2DXR2Ke9McgqFEmrH/E3gc2w8HNgduyyddoJ63Ofbp
	 wKSEhBoF/YEwTVClXOBoy9UHevI6+R60DCO8dmkt00kBp3aGD3ROS55DgNqesi8eGy
	 N3xa9NnjyX4PmAkbVANv0KGs6mbz3E3hLwwIr/FyPMy1xfVk2hAcUM6mWD7waztyql
	 4Vg+3USsAGfcpO+wn58kYkecuUWlwzTKeLemgDEKizWVJodk6tVFLkIQKv4gOtHlXH
	 MjP8REzj78ATA==
Subject: Re: [PATCH net-next v8 02/10] bnge: add NTUPLE/ARFS VNIC
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:04 +0000
Message-ID: <179510814465.3136.8399207150280899643@kernel.org>
In-Reply-To: <20261116140653.1685797-3-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-3-vikas.gupta@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] At the target commit, bnge_reserve_rings() writes
  bd->tx_nr_rings (361), bd->tx_nr_rings_per_tc (363), bd->rx_nr_rings…
- [Low] At this commit, bnge_set_dflt_rfs() (bnge_netdev.c:3310-3315)
  sets NETIF_F_NTUPLE in netdev->hw_features and netdev->features, and…
- [Low] The commit message mentions only adding bnge_set_dflt_rfs() "to
  configure the default NTUPLE feature state".
- [Low] The patch adds the prototype `bool bnge_arfs_capable(struct
  bnge_dev *bd, bool new_rss_ctx);` to bnge_resc.h:78.

--

bnge: add NTUPLE/ARFS VNIC

This patch allocates a second VNIC for NTUPLE/aRFS, which brings the VNIC
count to BNGE_BASE_VNICS (2). bnge_reserve_rings() now also requires the
matching RSS contexts from firmware. The patch adds ndo_fix_features and
ndo_set_features handling for NETIF_F_NTUPLE and turns the feature on by
default via bnge_set_dflt_rfs().

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index 31ca314fd52b8..e79e05be25e11 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -3051,6 +3056,11 @@ static int bnge_close(struct net_device *dev)
>  	bnge_hwrm_if_change(bn->bd, false);
>  	bn->sp_event = 0;
>  
> +	/* netif_running() is false now. Apply an NTUPLE change that
> +	 * bnge_fix_features() held back while the interface was up.
> +	 */
> +	netdev_update_features(dev);
> +
>  	return 0;
>  }
>  
> @@ -3133,6 +3143,36 @@ static const struct netdev_stat_ops bnge_stat_ops = {
>  	.get_base_stats		= bnge_get_base_stats,
>  };
>  
> +static netdev_features_t bnge_fix_features(struct net_device *dev,
> +					   netdev_features_t features)
> +{
> +	/* NTUPLE can only be changed while the interface is down. */
> +	if (netif_running(dev)) {
> +		if (dev->features & NETIF_F_NTUPLE)
> +			features |= NETIF_F_NTUPLE;
> +		else
> +			features &= ~NETIF_F_NTUPLE;
> +	}
> +	return features;
> +}

[Severity: Low]
This isn't a bug, but the commit message only says:

  Add bnge_set_dflt_rfs() to configure the default NTUPLE feature state
  at netdev allocation time.

The patch does more than that. It adds .ndo_fix_features and
.ndo_set_features, silently holds back NTUPLE changes while the interface
is running, applies them later from bnge_close() via
netdev_update_features(), and turns ntuple-filters on by default.

Could the commit message describe the down-only policy for NTUPLE changes
and the new netdev ops? Right now that policy is only explained later in
the series, in "bnge: add aRFS flow steering ndo support".

> +
> +static int bnge_set_features(struct net_device *dev, netdev_features_t features)
> +{
> +	struct bnge_net *bn = netdev_priv(dev);
> +	u32 flags = bn->priv_flags;
> +
> +	flags &= ~BNGE_NET_EN_NTUPLE;
> +	if (features & NETIF_F_NTUPLE)
> +		flags |= BNGE_NET_EN_NTUPLE;
> +
> +	if (flags == bn->priv_flags)
> +		return 0;
> +
> +	bn->priv_flags = flags;
> +
> +	return 0;
> +}
> +

[ ... ]

> @@ -3265,6 +3307,13 @@ static void bnge_init_ring_params(struct bnge_net *bn)
>  	bn->netdev->cfg->hds_thresh = max(BNGE_DEFAULT_RX_COPYBREAK, rx_size);
>  }
>  
> +static void bnge_set_dflt_rfs(struct bnge_net *bn)
> +{
> +	bn->netdev->hw_features |= NETIF_F_NTUPLE;
> +	bn->netdev->features |= NETIF_F_NTUPLE;
> +	bn->priv_flags |= BNGE_NET_EN_NTUPLE;
> +}

[Severity: Low]
Is NETIF_F_NTUPLE meant to be advertised and enabled at this point in the
series?

At this commit, drivers/net/ethernet/broadcom/bnge/ has no
get_rxnfc/set_rxnfc ethtool ops, no ndo_rx_flow_steer and no rx_cpu_rmap.
BNGE_NET_EN_NTUPLE is written by bnge_set_dflt_rfs() and
bnge_set_features(), but nothing reads it.

As a result, ethtool -k shows ntuple-filters as on, while ethtool -N
returns -EOPNOTSUPP. The NTUPLE change that bnge_fix_features() holds back
and bnge_close() later applies also has no effect.

Later patches in the series add the missing code: "bnge: add NTUPLE filter
support in ethtool", "bnge: add aRFS flow steering ndo support" and "bnge:
add cpu_rmap support for IRQ affinity". Could the feature bit be set in
the patch that makes it work, so intermediate commits don't advertise a
feature they can't use?

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> index 01205b161d822..506ceee775e19 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c

[ ... ]

> @@ -237,8 +241,12 @@ static void bnge_copy_reserved_rings(struct bnge_dev *bd,
>  
>  static bool bnge_rings_ok(struct bnge_hw_rings *hwr)
>  {
> -	return hwr->tx && hwr->rx && hwr->nq && hwr->grp && hwr->vnic &&
> -	       hwr->stat && hwr->cmpl;
> +	/* The default and the NTUPLE VNICs each need a full set of RSS
> +	 * contexts for the final number of ring groups.
> +	 */
> +	return hwr->tx && hwr->rx && hwr->nq && hwr->grp &&
> +	       hwr->vnic >= BNGE_BASE_VNICS && hwr->stat && hwr->cmpl &&
> +	       hwr->rss_ctx >= bnge_cal_nr_rss_ctxs(hwr->grp) * BNGE_BASE_VNICS;
>  }

[ ... ]

> @@ -358,6 +369,10 @@ int bnge_reserve_rings(struct bnge_dev *bd)
>  	bd->rx_nr_rings = rx_rings;
>  	bd->nq_nr_rings = hwr.nq;
>  
> +	/* One ring group per rx ring, so rss_ctx is checked against the final
> +	 * rx ring count.
> +	 */
> +	hwr.grp = rx_rings;
>  	if (!bnge_rings_ok(&hwr))
>  		return -ENOMEM;
>  

[Severity: High]
Can this -ENOMEM return leave bd->rss_indir_tbl stale?

With this patch, bnge_rings_ok() can fail depending on what firmware
grants: fewer than BNGE_BASE_VNICS VNICs, or fewer than
2 * bnge_cal_nr_rss_ctxs() RSS contexts.

By the time the check runs, bnge_reserve_rings() has already updated
bd->tx_nr_rings, bd->tx_nr_rings_per_tc, bd->rx_nr_rings and
bd->nq_nr_rings. The early return then skips the indirection table reset
that follows:

	if (old_rx_rings != bd->hw_resc.resv_rx_rings ||
	    old_rx_nr_rings != bd->rx_nr_rings)
		bnge_set_dflt_rss_indir_tbl(bd);

Suppose a retry gets the same RX grant but enough RSS contexts. Then
old_rx_rings matches resv_rx_rings, and old_rx_nr_rings matches the
already reduced bd->rx_nr_rings. So bnge_set_dflt_rss_indir_tbl() is never
called.

bnge_fill_hw_rss_tbl() then uses the table to index rx_ring[] without a
clamp:

		else
			j = bd->rss_indir_tbl[i];

		rxr = &bn->rx_ring[j];

The table may still hold entries computed for the older, larger ring
count. It may also never have been initialized, since
bnge_alloc_rss_indir_tbl() kmallocs it. In either case, can
bnge_init_chip()->bnge_setup_vnic()->...->bnge_fill_hw_rss_tbl() read
past the end of bn->rx_ring[] and pass bogus fw_ring_id values to
firmware?

A later patch in the series, "bnge: add ethtool support to manage RSS
contexts", appears to fix this. It moves the bnge_rings_ok() check ahead
of any bd-> updates and adds a j >= bd->rx_nr_rings clamp in
bnge_fill_hw_rss_tbl(). Could the reordering be folded into this patch,
since this is where the new failure conditions come from?

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
> index c0b6992d7f828..97e8ef08974c7 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
> @@ -75,6 +75,7 @@ void bnge_aux_init_dflt_config(struct bnge_dev *bd);
>  u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd);
>  int bnge_cal_nr_rss_ctxs(u16 rx_rings);
>  bool bnge_aux_has_enough_resources(struct bnge_dev *bd);
> +bool bnge_arfs_capable(struct bnge_dev *bd, bool new_rss_ctx);

[Severity: Low]
This isn't a bug, but bnge_arfs_capable() is declared here with no
definition and no caller in this patch.

Later in the series the prototype is removed, and bnge_rss_ctx_capable()
in bnge_resc.c is used instead. Could this declaration be dropped from
this patch?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
