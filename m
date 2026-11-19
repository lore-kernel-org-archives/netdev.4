Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108152;
	b=j1vb9H/8gnB5xRq2kloraza8b2qDLCB9Hst9jMhu4pWmOeLxWo2XWt3fQa3mXjv8gLBP
	 8Bc7kCxyA05ZimoY/k9pVGRtAd/Mf40I53mnpRo/SBT9RTRi25IbUinTAfkT9+R3Zk/p7
	 IY1Go9D2e1zR3jbh2rQViZ+WAqev05CknnPRJaAK+yU6IFAgky6iHFnaXbvOnwyagkdm1
	 sTftVnzoiLk791LxsOpXkavKkxHnnKU+1ygB7pdFN61jdOKPvu+6wxKuX0mWeGK4Whu5w
	 JCB5LH37aW0bF+dsqKOw3I3yJRYNw1ROK7p0lubd8/gJpXfwZdKxaGY/W9KjyWSA25A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108152;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=N6Yp542gjSn5mEZpP1fXPtVEEQjn4agSEkf7qqahrSw=;
	b=MD+2eXfJCTK3YnFo5wU2ixYWt+2z88XlxTZY9YYuWc0CIILWee24T0R++TznMtce13EJ
	 9+l7YJyPP+3liin9UMelZTJUbZ0wBQQUgsNg6vawLqFPcM+HB//xWiSVd2NiZcEmL+2pe
	 5RNwIRHNtMNklzZJazn2RR1v+OJQgnpNSLcgzfoPrQmrEFL3yRcOBdxiMXfNLf/+SBxy6
	 abSB3RI8BcNRlz+X9lvyQT7BlgUu8WXQQQZBNPvIfX8bllTsK6uwDWWtHGtTqZiyrIhDN
	 ZKFU4Qv3dMF37cejJUgFyEy6aIhcr+hzU/x88UJqAbh4EjQKaNsZllDpHn0QStbD0IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8oHU7sX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483160A5BEB;
	Thu, 19 Nov 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8oHU7sX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2ED1F000C5;
	Thu, 19 Nov 2026 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108152;
	bh=N6Yp542gjSn5mEZpP1fXPtVEEQjn4agSEkf7qqahrSw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d8oHU7sXpscXZdFIMHaPWDdt9jg54AKf5uLZ7GDP5k7RN5ldQX51TKvDozv5gGPMm
	 iZEg18QaGETq3pLtJ/9buGZi2V9QorTLIrCCTSi9f0floYzaTAE727jkqzDJzvB1Dx
	 zS2Wh/k0Se8c9HD9H4oY85z1vUVT2oDMcH5tJtiZ4ZGEe95IRaOLVct+1nbBEF4DDM
	 Iaisi1Zm0EM7lwt+WMDdepsASW+2cQbjTfyY+5+bTvswRX51tNV+ckd0GRScZP53Ej
	 H+SngkJXqMXdcGrorzZfI6LqaDRfVu/m+T9q4YNWlnKuMZD44BQs8Yqn070V79cNH7
	 ms6zl5zL50zDQ==
Subject:
 Re: [PATCH net-next v8 09/10] bnge: add aRFS flow steering ndo support
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:11 +0000
Message-ID: <179510815141.3136.11040952527486167006@kernel.org>
In-Reply-To: <20261116140653.1685797-10-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-10-vikas.gupta@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] bnge_rx_flow_steer() lets network traffic create dynamic aRFS
  NTUPLE filters.
- [Low] The commit message's closing note does not match the code.
- [Low] In the expire loop of bnge_cfg_ntp_filters()
  (bnge_filter.c:834-835), the return value of…
- [Low] The locked expire re-check in bnge_cfg_ntp_filters() does not
  cover a bnge_rx_flow_steer() hit on an existing filter for the same…
- [Low] bnge_cfg_one_usr_fltr() (bnge_filter.c:660-664) now writes
  ntp_fltr->l2_key and l2_filter_id under…
- [Low] On a queue change, bnge_ntp_fltr_retarget() (bnge_netdev.c:3248)
  commits the new queue with WRITE_ONCE(fltr->base.rxq, rxq_index) and…

--

bnge: add aRFS flow steering ndo support

This adds an ndo_rx_flow_steer implementation for bnge. It creates aRFS
NTUPLE filters from incoming flows and inserts them into the shared NTUPLE
hash table. Firmware programming and aging through rps_may_expire_flow()
are deferred to sp_task, which the periodic timer queues with the new
BNGE_RX_NTP_FLTR_SP_EVENT.

> Note that, if the L2 filter is freed before sp_task programs the rule,
> the captured firmware id is stale. The NTUPLE alloc either fails (id
> gone) or binds to a recycled id for a different filter. The rule is
> then dropped, or it stays until it ages out.

[Severity: Low]
Is this note still accurate? bnge_cfg_ntp_filters() never programs the id
captured in bnge_rx_flow_steer(). Before every install it looks the id up
again from the stored key:

	l2_id = bnge_lookup_l2_filter_from_key(bn, &fltr->l2_key);
	if (l2_id == BNGE_FLTR_ID_INVALID) {
		bnge_del_ntp_filter_rcu(bn, fltr);
		continue;
	}
	fltr->l2_filter_id = l2_id;

L2 filters are only freed under netdev_lock. That covers bnge_set_rx_mode()
through ndo_set_rx_mode_async, close/teardown, and the ethtool delete path.
sp_task also holds netdev_lock, so the "binds to a recycled id for a
different filter" case doesn't look reachable. The note seems to describe
an earlier version of the patch.

The message also leaves out several behaviour changes to the existing
ethtool n-tuple path:

  - bnge_fltr_match() now compares l2_key instead of l2_filter_id
  - bnge_cfg_one_usr_fltr() now refreshes l2_key under ntp_fltr_lock
  - bnge_get_all_fltr_ids_rcu() and bnge_get_one_fltr_rcu() now filter on
    bnge_is_usr_fltr() instead of fltr->flags
  - bnge_del_ntp_filter_rcu() now uses hlist_del_init_rcu()

Could the commit message be updated to match the code and mention these
changes?

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> index e2dc3a34cad33..a0a8aebad20b6 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c

[ ... ]

> @@ -642,7 +657,11 @@ static void bnge_cfg_one_usr_fltr(struct bnge_net *bn,
>  	if (fltr->type == BNGE_FLTR_TYPE_NTUPLE) {
>  		ntp_fltr = container_of(fltr, struct bnge_ntuple_filter, base);
>  		l2_fltr = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
> +		/* bnge_rx_flow_steer() can already run and match this rule */
> +		spin_lock_bh(&bn->ntp_fltr_lock);
>  		ntp_fltr->l2_filter_id = l2_fltr->base.filter_id;
> +		ntp_fltr->l2_key = l2_fltr->l2_key;
> +		spin_unlock_bh(&bn->ntp_fltr_lock);

[Severity: Low]
Does ntp_fltr_lock actually serialize this write against
bnge_rx_flow_steer()?

The first match in bnge_rx_flow_steer() goes through
bnge_lookup_ntp_filter_from_idx(). That function walks the bucket under
rcu_read_lock() only:

	hlist_for_each_entry_rcu(f, head, base.hlist) {
		if (bnge_fltr_match(f, fltr))
			return f;
	}

With this patch, bnge_fltr_match() reads l2_key.dst_mac_addr and
l2_key.vlan with plain loads.

bnge_open_core() sets BNGE_STATE_OPEN and enables interrupts before it
calls bnge_cfg_usr_fltrs(). An RX softirq on another CPU can therefore run
set_rps_cpu()->bnge_rx_flow_steer()->bnge_fltr_match() while this code
writes l2_key, and the two paths share no lock.

The lock here only orders the write against the match loop in
bnge_insert_ntp_filter(). Would KCSAN flag this as a data race? On a MAC
change across close/open, can the reader see a torn key and return a user
filter's sw_id to the RPS core? If the lock is only meant to cover
bnge_insert_ntp_filter(), could the comment say so?

[ ... ]

> @@ -715,3 +734,105 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
>  		}
>  	}
>  }
> +
> +void bnge_cfg_ntp_filters(struct bnge_net *bn)
> +{

[ ... ]

> +	/* Free the old HW rule; reinstall it below on the new queue. */
> +	list_for_each_entry_safe(fltr, tmp, &update_list, base.list_node) {
> +		list_del_init(&fltr->base.list_node);
> +		/* If the free fails the rule stays on the old queue. It is not
> +		 * retried, so a firmware that keeps failing is not hit on every
> +		 * tick.
> +		 */
> +		if (bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr))
> +			continue;

[Severity: Low]
What happens to the software state when this free fails?

bnge_ntp_fltr_retarget() has already committed the new queue before
firmware is touched:

	WRITE_ONCE(fltr->base.rxq, rxq_index);
	WRITE_ONCE(fltr->flow_id, flow_id);
	smp_mb__before_atomic();
	set_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state);

bnge_hwrm_cfa_ntuple_filter_free() also sets BNGE_FLTR_FW_DELETED before it
sends the HWRM request.

If HWRM_CFA_NTUPLE_FILTER_FREE fails, the firmware rule still steers to the
old rfs_ring_tbl_idx. But fltr->base.rxq now holds the new queue, and
FW_DELETED is set even though the rule is still live.

>From then on, bnge_rx_flow_steer() calls for this flow and target hit the
READ_ONCE(fltr->base.rxq) == rxq_index check in bnge_ntp_fltr_retarget()
and never queue a reprogram. rps_may_expire_flow() is also evaluated
against the new queue's flow table, not the ring the hardware is using.

The comment accepts that the rule stays on the old queue. Should the old
rxq be restored and FW_DELETED cleared on failure, so that software still
matches what firmware has programmed?

> +		clear_bit(BNGE_FLTR_FW_DELETED, &fltr->base.state);
> +		list_add(&fltr->base.list_node, &install_list);
> +	}

[ ... ]

> +	list_for_each_entry_safe(fltr, tmp, &expire_list, base.list_node) {
> +		list_del_init(&fltr->base.list_node);
> +		/* Decide again under ntp_fltr_lock: the scan ran without it and
> +		 * the firmware calls above can take long. Use the rxq and
> +		 * flow_id that bnge_rx_flow_steer() writes under it. Unlink
> +		 * here too, so a flow cannot be retargeted onto a filter that
> +		 * is about to be freed. The firmware free comes after the
> +		 * unlock.
> +		 */
> +		spin_lock_bh(&bn->ntp_fltr_lock);
> +		if (test_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state) ||
> +		    !rps_may_expire_flow(bn->netdev, fltr->base.rxq,
> +					 fltr->flow_id, fltr->base.sw_id)) {
> +			spin_unlock_bh(&bn->ntp_fltr_lock);
> +			continue;
> +		}

[Severity: Low]
Does this re-check cover a bnge_rx_flow_steer() hit on this filter for the
same rxq?

In that case bnge_ntp_fltr_retarget() returns early and writes no state:

	if ((fltr->base.flags & BNGE_ACT_NO_AGING) ||
	    READ_ONCE(fltr->base.rxq) == rxq_index)
		return false;

bnge_rx_flow_steer() then drops ntp_fltr_lock and returns
fltr->base.sw_id. set_rps_cpu() in net/core/dev.c records that id only
after the ndo returns, outside ntp_fltr_lock:

	rc = dev->netdev_ops->ndo_rx_flow_steer(dev, skb, rxq_index, flow_id);
	...
	WRITE_ONCE(rflow->filter, rc);

Suppose this re-check runs inside that window. RXQ_UPDATE is clear and
rps_may_expire_flow() still sees the old rflow state. The filter is
unlinked and freed in firmware, and its sw_id bit is released. The core
then stores a dead sw_id in rflow->filter.

The rflow then looks active, so set_rps_cpu() skips the ndo. The flow runs
without a hardware rule until the slot goes stale, and the dead sw_id can
alias a reused id.

Hitting this needs a packet of the flow to arrive on a queue other than
the one the rule targets. One example is after the failed retarget free
described above.

The comment above says the locked re-check keeps a flow from being
retargeted onto a filter that is about to be freed. Doesn't that only
hold when the rxq changes and RXQ_UPDATE is set?

> +		hlist_del_init_rcu(&fltr->base.hlist);
> +		spin_unlock_bh(&bn->ntp_fltr_lock);
> +
> +		bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
> +		bnge_del_ntp_filter_rcu(bn, fltr);

[Severity: Low]
Can this leak the firmware ntuple filter? The return value of
bnge_hwrm_cfa_ntuple_filter_free() is ignored. bnge_del_ntp_filter_rcu()
then clears the sw_id bit, decrements ntp_fltr_count and kfree_rcu()s the
object anyway.

bnge_hwrm_cfa_ntuple_filter_free() resets base.filter_id only when the
send succeeds:

	rc = bnge_hwrm_req_send(bd, req);
	if (!rc)
		fltr->base.filter_id = BNGE_FLTR_ID_INVALID;
	return rc;

If HWRM_CFA_NTUPLE_FILTER_FREE fails, the rule stays programmed in
firmware, but the only copy of its handle is freed. Nothing can free the
rule until the VNIC/L2 contexts are torn down. Meanwhile the orphaned rule
keeps steering the old flow, and the released sw_id can be handed to a new
filter.

The update loop above checks the same call and keeps the rule on failure.
Should the expire path handle failure the same way? bnxt_en has the same
pattern.

> +	}
> +#endif
> +}

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index b71e427d3ba10..0e7c506af402c 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -3226,6 +3235,146 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)

[ ... ]

> +static int bnge_rx_flow_steer(struct net_device *dev, const struct sk_buff *skb,
> +			      u16 rxq_index, u32 flow_id)
> +{

[ ... ]

> +	new_fltr->flow_id = flow_id;
> +	new_fltr->base.rxq = rxq_index;
> +	rc = bnge_insert_ntp_filter(bn, new_fltr, idx);
> +	if (!rc) {
> +		bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
> +		return new_fltr->base.sw_id;
> +	}

[Severity: Medium]
Can remote traffic fill the ntuple table that ethtool rules rely on?

The aRFS filters created here share bn->ntp_fltr_bmap and the hash table
with administrator ethtool rules. The bitmap is sized bd->max_fltr
(BNGE_MAX_NTUPLE_FLTRS), and no slots are reserved for BNGE_ACT_NO_AGING
rules.

A remote peer can open many TCP connections to a local listener that reads
from them. With RFS enabled, each socket's flow reaches this function
through set_rps_cpu(). Unconnected UDP does not record rxhash, so this
needs TCP or connected sockets.

Once the bitmap is full, bnge_add_ntuple_cls_rule()->
bnge_insert_ntp_filter() fails:

	bit_id = bitmap_find_free_region(bn->ntp_fltr_bmap,
					 bn->bd->max_fltr, 0);
	if (bit_id < 0) {
		spin_unlock_bh(&bn->ntp_fltr_lock);
		return -ENOMEM;
	}

There is a second failure mode. bnge_fltr_match() ignores the filter type,
and the bnge_toeplitz() index matches the hardware RSS hash. A live aRFS
entry for a full-mask 5-tuple therefore makes bnge_add_ntuple_cls_rule()
fail with -EEXIST for that exact flow, including a drop rule meant to stop
it:

	fltr = bnge_lookup_ntp_filter_from_idx(bn, new_fltr, idx);
	if (fltr) {
		rcu_read_unlock();
		rc = -EEXIST;
		goto err_free_fltr;
	}

Each new flow also costs a GFP_ATOMIC allocation in softirq and an HWRM
call in sp_task under netdev_lock.

bnxt_en uses the same shared bitmap design, but this patch is the first to
let traffic insert into the bnge table. Should the number of aRFS filters
be capped below max_fltr, or part of the table be reserved for user rules?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
