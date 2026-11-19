Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108151;
	b=JzcY7qBSgFPzQqAIkXSHccQ2rq3Sugad2o/KsrHMOfMckenQnH0X6PUjPg3hiX/kotl8
	 /AcBuGo/g5e64Hj9audj9n/Azx0wDth+JcmBJ5YqGq0xNpN0l/LJEWluQ7ltJulEUXBJR
	 CYnhSHZB7SlGn70uxqP0Sysv6jvYndD6oQAwWQlHzWm+L46TW7Eqik+xqPr65Wc60bR0a
	 n/cc95DLjiNh5OmARhtcY7QW6kApb2+eA8UBqHZ1rbzSvhLs8PACxpL731fx08ZliTsIm
	 zE6qO8W2XCGawWOjWpFi3ohG6649k/68YCcX1h4b/ClWIQqV5DCG3MmSQ1vEULjoZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108151;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YOS9l922kaCnYRxq81NzRXR0w7nYE1A+evZ57GcclQg=;
	b=mfcpbGNXpeSY4/zHYruOK26pIjjjDq2auwXcBBWzDfVenFI2gvVzIGs9ZqQt/drQovZE
	 qVgXFdkYh3ZrTLrXWvcI0mXSvemsumbxJ88vPtRCaTWWhWWFpGw8RuZWY47PkrawlzpU3
	 eFz/KONvDPG4tpvk65ciXlJbyoD6WZvLsiAdeZ0myREBfd5Ka0UGF5oLAeC7UPQfuISsy
	 qkAbz8FReMfFXrOUy+yFJ8SwYgdvdQYO25NrKlWIw9xaLDKBOqF/Ee97FsWscej27kzRn
	 H9KFD6fjM/n/vr2ioFdwkQUkIQ3IV+qVk2Gc44TSicFvrjVwCz8Z995KnQwjh48hhuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iv0ZFFDX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636BB60A383D;
	Thu, 19 Nov 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iv0ZFFDX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBD11F000C4;
	Thu, 19 Nov 2026 17:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108151;
	bh=YOS9l922kaCnYRxq81NzRXR0w7nYE1A+evZ57GcclQg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Iv0ZFFDXIl9ODhRDFvNdNTD7vscBL3fgcEv1iWt3+tRzCCgF6wXLs+vy3WZZbU/Db
	 HoLv6aXI0x2nGNBYUWeto28L9LJrwcqaIOAeuqxCooP4/UTExu++W1bWypHzwZfGEz
	 pZGnHdqs8aKM/qwI+dxZ/SExLJH3WR2lgeY9tG/7yCHF7peci1HAgmDv26bckOq4g1
	 U3BWUcsuDESZUIPW/mIaGg1TOnNWLDNihTRo+ZpN91tjr807C/5fgMhdvCp8oqVZPW
	 /sNu2uVgl0cWDk9FczYAWlmhVPFQdBaA+kSz1gZXlscdbZN3Gp4Hd0wTLPrq0ytGdg
	 Zyr9rjwBjSkQQ==
Subject:
 Re: [PATCH net-next v8 08/10] bnge: add NTUPLE filter support in ethtool
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:10 +0000
Message-ID: <179510815010.3136.2518748601962705515@kernel.org>
In-Reply-To: <20261116140653.1685797-9-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-9-vikas.gupta@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message gets the old unicast-filter behaviour wrong
  and hides a policy change that affects every user of the driver,…
- [Medium] bnge_hwrm_l2_filter_alloc() now sets
  CFA_L2_FILTER_ALLOC_REQ_FLAGS_TRAFFIC_L2 (0x1 << 4) for user…
- [Low] The patch adds a user-visible limit on the RSS ethtool uAPI that
  the commit message never mentions.
- [Low] The new restore and ring-lost messages identify a rule by its
  internal bitmap index (fltr->sw_id), not by the ethtool location the…
- [Low] In bnge_cfg_rx_mode() the overflow check no longer matches the
  fill loop, although the comment above the uc_count loop still says it…

--

bnge: add NTUPLE filter support in ethtool

This adds ethtool rxnfc get/set operations for ntuple and ETHER_FLOW
rules in bnge. User rules are kept in software across down/up and are
programmed again on open. Unicast address filters now share the L2
filter pool with user ETHER_FLOW rules: BNGE_MAX_UC_ADDRS is removed and
l2_filters[] and uc_list are sized by BNGE_MAX_L2_FLTRS.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> index 1bb9c30197695..ac93b0e123ad1 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c

[ ... ]

> @@ -999,6 +1001,12 @@ static int bnge_set_rxfh_fields(struct net_device *dev,
>  		return -EBUSY;
>  	}
>  
> +	if (bnge_has_usr_ntp_fltr(bn)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Delete user ntuple rules before changing the RSS hash fields");
> +		return -EBUSY;
> +	}
> +
>  	bd->rss_hash_cfg = rss_hash_cfg;
>  
>  	return 0;
> @@ -1060,6 +1068,12 @@ static int bnge_set_rxfh(struct net_device *dev,
>  		return -EBUSY;
>  	}
>  
> +	if (rxfh->key && bnge_has_usr_ntp_fltr(bn)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Delete user ntuple rules before changing the RSS hash key");
> +		return -EBUSY;
> +	}
> +

[Severity: Low]
This isn't a bug, but should the commit message mention this new limit?

While any user ntuple rule exists, bnge_set_rxfh_fields() returns
-EBUSY. bnge_set_rxfh() does the same whenever a key is supplied. To
change the RSS hash key or the rx-flow-hash fields, the user has to
delete every ntuple rule first.

The only explanation is the comment above bnge_has_usr_ntp_fltr(). The
rules sit in ntp_fltr_hash_tbl at an index computed by
bnge_get_ntp_filter_idx()->bnge_toeplitz(). That index depends on the
default VNIC rss_hash_key and on rss_hash_cfg, and the rules are never
rehashed.

Since users can see this limit on the RSS ethtool interface, could the
changelog describe it?

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> index 3ebb3cae4829b..e2dc3a34cad33 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> @@ -584,3 +584,134 @@ int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,

[ ... ]

> +static bool bnge_usr_fltr_ring_lost(struct bnge_net *bn,
> +				    struct bnge_filter_base *fltr)
> +{
> +	if (fltr->flags & (BNGE_ACT_DROP | BNGE_ACT_RSS_CTX) ||
> +	    fltr->rxq < bn->bd->rx_nr_rings)
> +		return false;
> +
> +	netdev_warn(bn->netdev, "filter id %d: rx ring %u no longer exists\n",
> +		    fltr->sw_id, fltr->rxq);
> +	return true;
> +}
> +
> +static void bnge_cfg_one_usr_fltr(struct bnge_net *bn,
> +				  struct bnge_filter_base *fltr)
> +{
> +	struct bnge_ntuple_filter *ntp_fltr;
> +	struct bnge_l2_filter *l2_fltr;
> +
> +	if (list_empty(&fltr->list_node))
> +		return;
> +
> +	if (fltr->type == BNGE_FLTR_TYPE_NTUPLE) {
> +		ntp_fltr = container_of(fltr, struct bnge_ntuple_filter, base);
> +		l2_fltr = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
> +		ntp_fltr->l2_filter_id = l2_fltr->base.filter_id;
> +		if (bnge_usr_fltr_ring_lost(bn, fltr) ||
> +		    bnge_hwrm_cfa_ntuple_filter_alloc(bn->bd, ntp_fltr)) {
> +			netdev_err(bn->netdev,
> +				   "restoring previously configured ntuple filter id %d failed\n",
> +				   fltr->sw_id);

[Severity: Low]
Do these messages print the rule number the user sees?

Users see ntuple rules at location BNGE_MAX_L2_FLTRS + sw_id. For
example, bnge_add_ntuple_cls_rule() does:

	fs->location = BNGE_MAX_L2_FLTRS + new_fltr->base.sw_id;

bnge_grxclsrlall(), bnge_grxclsrule() and bnge_srxclsrldel() use the same
offset. These messages print the raw sw_id instead.

The L2 and ntuple sw_id spaces both start at 0. So if ethtool rule 128
is dropped after a down/up, the log says "filter id 0: rx ring N no
longer exists" or "restoring previously configured ntuple filter id 0
failed". Rule 0 may be an unrelated L2 rule, or it may not exist. The
ring-lost message also does not say which filter type it means. bnxt
prints sw_id the same way.

Would it be clearer to print the ethtool location here?

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> index 76f8bb73056dd..305f0054742c8 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> @@ -885,15 +885,18 @@ int bnge_hwrm_l2_filter_alloc(struct bnge_dev *bd, struct bnge_l2_filter *fltr)

[ ... ]

> -	req->flags = cpu_to_le32(CFA_L2_FILTER_ALLOC_REQ_FLAGS_PATH_RX);
> -
> -	req->flags |= cpu_to_le32(CFA_L2_FILTER_ALLOC_REQ_FLAGS_OUTERMOST);
> +	flags = CFA_L2_FILTER_ALLOC_REQ_FLAGS_PATH_RX |
> +		CFA_L2_FILTER_ALLOC_REQ_FLAGS_OUTERMOST;
> +	if (BNGE_L2_FLTR_IS_NTP_MAC(fltr))
> +		flags |= CFA_L2_FILTER_ALLOC_REQ_FLAGS_TRAFFIC_L2;
> +	req->flags = cpu_to_le32(flags);

[Severity: Medium]
How does this traffic type interact with RoCE?

Every other L2 filter in bnge and bnxt leaves the traffic field at 0
(CFA_L2_FILTER_ALLOC_REQ_FLAGS_TRAFFIC_NO_ROCE_L2). This is the only
place in the tree that sets TRAFFIC_L2. The commit message states the
change but gives no reason and does not mention RoCE.

When the aux device is registered, bnge_hwrm_vnic_cfg() puts the default
VNIC in RoCE dual mode:

	if (vnic->vnic_id == BNGE_VNIC_DEFAULT && bnge_aux_registered(bd))
		req->flags |= cpu_to_le32(BNGE_VNIC_CFG_ROCE_DUAL_MODE);

Suppose TRAFFIC_L2 means non-RoCE L2 only. Take a MAC that a user rule
shadows, such as a macvlan MAC. bnge_cfg_rx_mode() gets -EEXIST for it
and installs no type 0 default VNIC filter. Would RoCE frames for that
MAC then match no filter and never reach the default VNIC?

Now suppose TRAFFIC_L2 means all L2 traffic, including RoCE.
bnge_add_l2_cls_rule() accepts rules for MAC/VLAN pairs that carry RoCE
traffic, for example the port MAC with a VLAN. Such a rule would send
RoCE frames to a plain ring on the ntuple VNIC. Is that intended?

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index 2b26576f0e997..b71e427d3ba10 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -2079,7 +2082,14 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
>  	netdev_hw_addr_list_for_each(ha, uc)
>  		if (!ether_addr_equal(ha->addr, dev->dev_addr))
>  			uc_count++;
> -	if (uc_count > BNGE_MAX_UC_ADDRS - 1) {
> +	/* The unicast addresses and the user ETHER_FLOW rules share the L2
> +	 * filters. Receive the addresses that do not fit in promiscuous mode.
> +	 * The firmware supports many more L2 filters than BNGE_MAX_L2_FLTRS,
> +	 * so it is not expected to refuse a filter in the loop below.
> +	 */
> +	l2_free = BNGE_MAX_L2_FLTRS -
> +		  bitmap_weight(bn->l2_fltr_bmap, BNGE_MAX_L2_FLTRS);
> +	if (uc_count > BNGE_MAX_L2_FLTRS - 1 || uc_count > l2_free) {

[Severity: Medium]
The commit message says:

    bnge_cfg_rx_mode() counts the free L2 filters, and when the
    addresses do not fit it receives them in promiscuous mode, as
    it already does for more than BNGE_MAX_L2_FLTRS - 1 addresses.

Does that match the old behaviour? Before this patch the check was
uc_count > BNGE_MAX_UC_ADDRS - 1, so four or more extra unicast
addresses already meant promiscuous mode.

With the new check, the driver programs up to 127 L2 filters before it
falls back. That affects every user of the driver, even with ntuple
disabled.

The message also calls BNGE_MAX_L2_FLTRS "the number of L2 filters of a
function". It is actually a driver constant (128).
bnge_hwrm_func_qcaps() fills in the limit reported by the firmware,
hw_resc->max_l2_ctxs, but nothing here uses it.

Suppose the firmware does refuse a filter partway through the fill
loop. The error path then does:

		if (rc) {
			...
			vnic->uc_filter_count = i;
			return rc;
		}

This returns before skip_uc:, so it skips both the promiscuous fallback
and bnge_hwrm_cfa_l2_set_rx_mask(). Would the remaining addresses then
not be received at all? The old code received them in promiscuous mode.

Should the threshold take max_l2_ctxs into account? Could the commit
message also describe the change from 3 to 127 addresses?

[ ... ]

> @@ -2095,6 +2105,11 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
>  
>  	for (i = 1, off = 0; i < vnic->uc_filter_count; i++, off += ETH_ALEN) {
>  		rc = bnge_hwrm_set_vnic_filter(bn, 0, i, vnic->uc_list + off);
> +		if (rc == -EEXIST) {
> +			/* Already delivered by a user L2 rule */
> +			vnic->l2_filters[i] = NULL;
> +			continue;
> +		}

[Severity: Low]
Does the overflow check above still match this loop?

uc_count includes addresses that already have a user ETHER_FLOW rule.
It is compared against l2_free, which already excludes the l2_fltr_bmap
bits that those same rules hold.

In this loop, bnge_hwrm_set_vnic_filter()->bnge_alloc_l2_filter() finds
the user rule in l2_fltr_hash_tbl and returns -EEXIST. No L2 filter is
used for those addresses.

So each shared MAC is counted twice. Take k user rules whose MACs are
also in the uc list, plus m other addresses. The VNIC goes promiscuous
when k + m > 127 - k, even though only m filters are needed.

bnge_del_usr_l2_filter() does not run this decision again, so the VNIC
stays promiscuous until the next address list change.

The comment above the uc_count loop also still says "Count only the
entries that will actually be programmed so the overflow check matches
the fill loop below", which is no longer true.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
