Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108148;
	b=LqUXAXL2o3i+ynFBRq+kFE32oz65QEULZZJZEyMPdHl6fPjnrlkQYms3T+GZreUqwYTz
	 t8BIoGvyyonpLXpNV4oJvW0rsR/0yd/mhGEiDAIDc49njzMIiTxOy0QXm07Dz0vNUm4UQ
	 9cc4siGAkuDtsbFjJyFTp7PkmlfkVhqsdcy2MavBl9L6FsK2LPfDv0EtDdR9A4uNiOx1W
	 jRJ81d1a3AezRcsihOL7iWyiEzamRey0Jzmuv6M/dg8DiL9BLpm8HhRMqD+nDTZecdukd
	 agfP0urID9XpK3AIi3SQ1eUVLQWzpylV82xRayIQgTLUwue44OnFDysapCh7Tf1uHqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108148;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PSqQVFaw3UwgJdiIZRX3APSYTWHL6vnnXw7KglXBjxo=;
	b=a6+qAhE3GrwThta4ae542h7s+LoGs5F73giS9TOYWcF/gC3eLK3kTPDJ14H+sKY/oNRv
	 SY7Mcur4SYga/yQf1P/5T5nF5Yz8r1f6aO1uLfvCp5OBZ2KlxO8UN30QimW8GqE5NxSVf
	 nqaD4CrGqmssKqAGopeySeR+aG9w2tRQ3SE8tjCDj4atP5osfAaTkP/0mKr6wZIR4UDxn
	 agl1ZGDi6nAub/K/09XsgGESlRXQuxT5f1h0yEweTUw2mG8oymixOKlq894w7GZs0TeYb
	 dcKlk2hFST15+Xh99/bSi1fZFlb4WNglHkbxpRVChJKA+wCOePgNnFpdW0xEXTJybMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxKp+Pb7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C405860A2613;
	Thu, 19 Nov 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bxKp+Pb7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1E91F000C8;
	Thu, 19 Nov 2026 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108148;
	bh=PSqQVFaw3UwgJdiIZRX3APSYTWHL6vnnXw7KglXBjxo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bxKp+Pb7NDKGhCo65km8UAPgni/Y3EYXVdXi5YTv3EIbVfqrlxXwpD1T3H078RivS
	 HZbtt3lE/bsojjP9kb+wfSE2RJhXKaW2oesKNk0wixq9PrCTaVNwPAn/t5cC03EAoI
	 INJlhn9hhmNK0l71cf66BVLs90F76B/hF1rOJ/VaDjzYvZilL7Xz9XqnGW6Y131O96
	 DIcbSTg4TAqSltvv2vi3BbluNXT1iOOcA9RdHQsXmgqd/YY9nIOlsUJya3yQ23yzrf
	 u+tT7MJ2UW1pR2tQA0ImnQiQDWpgBHQSTkbUKW4Q/g0p3RVFHzwwjnlrQqhz+SG/UV
	 4+/eyornPfDhQ==
Subject: Re: [PATCH net-next v8 05/10] bnge: add ethtool support to manage RSS
 contexts
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:07 +0000
Message-ID: <179510814742.3136.14901565561375383969@kernel.org>
In-Reply-To: <20261116140653.1685797-6-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-6-vikas.gupta@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message does not disclose that user-created RSS
  contexts are destroyed when bnge_reserve_rings() gets fewer RX rings…
- [Medium] An NTUPLE-off request made while the interface is up is held
  back, and applying it at close now always fails while RSS contexts…
- [Medium] bnge_refill_dflt_rss_ctxs() (bnge_vnic.c) calls
  ethtool_rxfh_ctxs_resize(bd->netdev, tbl_size).
- [Low] bnge_reserve_rings()
  (drivers/net/ethernet/broadcom/bnge/bnge_resc.c) contains bug fixes…
- [Low] A comment added in bnge_create_rxfh_context() (bnge_ethtool.c)
  says 'The invalid id prints as -1 for all.' The same patch changes…

--

bnge: add ethtool support to manage RSS contexts

This patch adds the create, modify and remove rxfh_context ethtool
callbacks to bnge. Each RSS context is backed by its own VNIC, with its
own indirection table and hash key. It also reworks bnge_reserve_rings()
so that a user-configured default table and user RSS contexts are kept or
declared lost when the RX ring count changes, and it makes
bnge_set_features() refuse to clear NTUPLE while RSS contexts exist.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> index 878fe4888160f..1bb9c30197695 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> @@ -1073,6 +1073,180 @@ static u32 bnge_get_rx_ring_count(struct net_device *dev)

[ ... ]

> +static int bnge_create_rxfh_context(struct net_device *dev,
> +				    struct ethtool_rxfh_context *ctx,
> +				    const struct ethtool_rxfh_param *rxfh,
> +				    struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	bnge_init_vnic_mem(vnic);
> +	/* Number the VNIC after the base VNICs, so that its error messages
> +	 * tell the RSS contexts apart. The invalid id prints as -1 for all.
> +	 */
> +	vnic->vnic_id = BNGE_BASE_VNICS + rxfh->rss_context;

[Severity: Low]
This isn't a bug, but is the last sentence of this comment still accurate?

bnge_init_vnic_mem() sets vnic_id to BNGE_VNIC_ID_INVALID (0xffffffff).
This same patch also changes the vnic_id format specifiers in
bnge_hwrm_vnic_rss_cfg() and bnge_setup_vnic() from %d to %u:

	netdev_err(bn->netdev, "hwrm vnic %u set rss failure rc: %d\n",
		   vnic->vnic_id, rc);

With %u, the invalid id prints as 4294967295, not -1.

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index e605448286d55..4b22152025d8c 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -3147,6 +3152,10 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)
>  	if (flags == bn->priv_flags)
>  		return 0;
>  
> +	if ((bn->priv_flags & BNGE_NET_EN_NTUPLE) &&
> +	    !(flags & BNGE_NET_EN_NTUPLE) && bn->num_rss_ctx)
> +		return -EBUSY;
> +

[Severity: Medium]
Can this -EBUSY end up coming from the deferred feature update at close,
instead of being returned to the user's request?

bnge_fix_features() holds NTUPLE back only when netif_running() is true.
It does not look at num_rss_ctx:

bnge_fix_features() {
    ...
	if (netif_running(dev)) {
		if (dev->features & NETIF_F_NTUPLE)
			features |= NETIF_F_NTUPLE;
		else
			features &= ~NETIF_F_NTUPLE;
	}
    ...
}

So running "ethtool -K <dev> ntuple off" on an interface that is up only
updates dev->wanted_features.

At close, bnge_close_core()->bnge_clear_rss_ctxs() calls
bnge_del_one_rss_ctx(bn, rss_ctx, false), which returns before the
decrement:

	if (!all)
		return;
	...
	bn->num_rss_ctx--;

bnge_close() then calls netdev_update_features(dev). netif_running() is
false by then, so ndo_set_features is asked to clear NTUPLE while
num_rss_ctx is still non-zero, and this check returns -EBUSY.

__netdev_update_features() then logs "set_features() failed (-16)", and
netdev_update_features() still sends a NETDEV_FEAT_CHANGE notification.
The request stays in wanted_features and fails again on every later close
or feature update for as long as the contexts exist. The user never gets
the -EBUSY that the commit message describes.

Should bnge_fix_features() also take num_rss_ctx into account? This
appears to be unchanged at the end of the series.

>  	bn->priv_flags = flags;

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> index 25aa6e7c43c37..d74ffd4f41172 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c

[ ... ]

> @@ -358,27 +390,46 @@ int bnge_reserve_rings(struct bnge_dev *bd)
>  		hwr.rx = rx_rings << 1;
>  	tx_cp = hwr.tx;
>  	hwr.nq = sh ? max_t(u16, tx_cp, rx_rings) : tx_cp + rx_rings;
> +
> +	/* One ring group per rx ring, so rss_ctx is checked against the final
> +	 * rx ring count. Fail before any driver state is changed, so that a
> +	 * retry reserves again instead of finding the failed values in place.
> +	 */
> +	hwr.grp = rx_rings;
> +	if (!bnge_rings_ok(&hwr))
> +		return -ENOMEM;
> +
>  	bd->tx_nr_rings = hwr.tx;
>  	if (!bd->num_tc)
>  		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
>  
> -	if (rx_rings != bd->rx_nr_rings)
> +	rx_changed = rx_rings != bd->rx_nr_rings;
> +	if (rx_changed) {
>  		dev_warn(bd->dev, "RX rings resv reduced to %d than earlier %d requested\n",
>  			 rx_rings, bd->rx_nr_rings);
> +		indir_lost = bd->netdev &&
> +			     netif_is_rxfh_configured(bd->netdev) &&
> +			     (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
> +			      bnge_cal_nr_rss_ctxs(rx_rings) ||
> +			      bnge_get_max_rss_ring(bd) >= rx_rings);
> +		bnge_check_rss_ctxs_lost(bd, rx_rings);
> +	}
>  
>  	bd->rx_nr_rings = rx_rings;
>  	bd->nq_nr_rings = hwr.nq;
>  
> -	/* One ring group per rx ring, so rss_ctx is checked against the final
> -	 * rx ring count.
> -	 */
> -	hwr.grp = rx_rings;
> -	if (!bnge_rings_ok(&hwr))
> -		return -ENOMEM;
> +	if (old_rx_rings != bd->hw_resc.resv_rx_rings || rx_changed) {
> +		if (!bd->netdev || indir_lost ||
> +		    !netif_is_rxfh_configured(bd->netdev))
> +			bnge_set_dflt_rss_indir_tbl(bd, NULL);
> +		bnge_refill_dflt_rss_ctxs(bd);
> +	}
>  
> -	if (old_rx_rings != bd->hw_resc.resv_rx_rings ||
> -	    old_rx_nr_rings != bd->rx_nr_rings)
> -		bnge_set_dflt_rss_indir_tbl(bd);
> +	/* Notify only now, so the notification reports the new ring count
> +	 * and the reset indirection table.
> +	 */
> +	if (indir_lost)
> +		ethtool_rxfh_indir_lost(bd->netdev);

[Severity: Low]
This isn't a bug, but should these two fixes be split out, or at least
described in the commit message?

The first is the bnge_rings_ok() move. It now runs before
bd->tx_nr_rings, bd->tx_nr_rings_per_tc, bd->rx_nr_rings and
bd->nq_nr_rings are written. That fixes already released code: before
this series, a failed reservation left the failed ring counts in the
driver state.

The new comment describes that bug. However, the commit message does not
list it among the behaviour changes, and there is no Fixes: tag, so
stable will not pick it up.

The second is the indir_lost and ethtool_rxfh_indir_lost() handling. It
fixes a problem introduced earlier in this series by "bnge: add RXFH
ethtool support". Since that patch, a user-configured default
indirection table was replaced with the default spread whenever the ring
count changed. dev->ethtool->rss_indir_user_size stayed non-zero, so the
core kept reporting the table as user-configured.

Would it be better to fix that in the earlier patch, so that each patch
is correct on its own?

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
> index a44971a7c74d3..7d587290c33ab 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c

[ ... ]

> @@ -201,6 +222,89 @@ void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)

[ ... ]

> +void bnge_check_rss_ctxs_lost(struct bnge_dev *bd, u16 new_rx_rings)
> +{

[ ... ]

> +		if (!ctx->indir_user_size)
> +			continue;
> +
> +		if (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
> +		    bnge_cal_nr_rss_ctxs(new_rx_rings)) {
> +			lost = true;
> +		} else {

[ ... ]

> +		if (lost) {
> +			bnge_del_one_rss_ctx(bn, rss_ctx, true);
> +			ethtool_rxfh_context_lost(bd->netdev, rss_ctx->index);
> +		}
> +	}
> +	mutex_unlock(&bd->netdev->ethtool->rss_lock);
> +}

[Severity: Medium]
Does this delete user-created RSS contexts whenever the table size
changes, even when their tables could be folded?

Any context with ctx->indir_user_size set is marked lost whenever
bnge_cal_nr_rss_ctxs() differs between the old and new ring counts.
bnge_del_one_rss_ctx(bn, rss_ctx, true) and ethtool_rxfh_context_lost()
then erase it and send ETHTOOL_MSG_RSS_DELETE_NTF. From "bnge: add
NTUPLE filter support in ethtool" onward, the all=true path also frees
every user ntuple filter steered to that context.

Contexts survive close, because bnge_clear_rss_ctxs() passes all=false.
So this runs at open, via bnge_open_core()->bnge_reserve_rings(),
whenever firmware grants fewer RX rings than were requested.

The comment in bnge_refill_dflt_rss_ctxs() says foldable tables are
dropped anyway. The core already provides ethtool_rxfh_ctxs_can_resize()
and ethtool_rxfh_ctxs_resize() to fold user-sized tables, but here they
are only used for default contexts.

Context 0 is handled the same way in bnge_reserve_rings():

	indir_lost = bd->netdev &&
		     netif_is_rxfh_configured(bd->netdev) &&
		     (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
		      bnge_cal_nr_rss_ctxs(rx_rings) ||
		      bnge_get_max_rss_ring(bd) >= rx_rings);

ethtool_rxfh_indir_can_resize() is not consulted there.

The commit message only says:

    A user-configured default table is kept,
    and ethtool_rxfh_indir_lost() is called when it no longer fits.

It does not mention that user RSS contexts, and the ntuple rules attached
to them, can be lost. Could the core resize helpers be used for user
tables as well, or could the commit message at least describe this
behaviour?

> +
> +void bnge_refill_dflt_rss_ctxs(struct bnge_dev *bd)
> +{

[ ... ]

> +	/* bnge_check_rss_ctxs_lost() already dropped every context with a
> +	 * user table when the table size changed, even if the table could
> +	 * have been folded. Only the default contexts are resized here.
> +	 */
> +	if (resize) {
> +		if (ethtool_rxfh_ctxs_can_resize(bd->netdev, tbl_size)) {
> +			dev_warn(bd->dev,
> +				 "RSS contexts cannot be resized to %u entries\n",
> +				 tbl_size);
> +			return;
> +		}
> +		ethtool_rxfh_ctxs_resize(bd->netdev, tbl_size);
> +	}
> +
> +	mutex_lock(&bd->netdev->ethtool->rss_lock);
> +	xa_for_each(&bd->netdev->ethtool->rss_ctx, context, ctx) {
> +		if (!ctx->indir_user_size)
> +			bnge_set_dflt_rss_indir_tbl(bd, ctx);
> +	}
> +	mutex_unlock(&bd->netdev->ethtool->rss_lock);
>  }

[Severity: Medium]
Do the RSS context notifications sent here report the intermediate
table instead of the final default one?

ethtool_rxfh_ctxs_resize() resizes each context's table, drops rss_lock,
and then sends ETHTOOL_MSG_RSS_NTF for every context:

net/ethtool/common.c:ethtool_rxfh_ctxs_resize() {
    ...
	xa_for_each(&dev->ethtool->rss_ctx, context, ctx)
		ethtool_rss_notify(dev, ETHTOOL_MSG_RSS_NTF, context);
}

The loop that follows rewrites the default contexts (indir_user_size ==
0) with bnge_set_dflt_rss_indir_tbl() only after those notifications
have gone out. So the notification carries the old i % old_rx_rings
pattern, truncated or replicated. That pattern can hold ring indices >=
the new bd->rx_nr_rings, and no second notification with the final
table follows.

bnge_reserve_rings() already gets this ordering right for context 0
("Notify only now, so the notification reports the new ring count and
the reset indirection table"). Should the additional contexts be handled
the same way, for example by notifying after the default tables are
refilled?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
