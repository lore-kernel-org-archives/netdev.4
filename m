Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108150;
	b=MbdyKgrRJvfalneS2CVhw5tuXBQDILR6kfpeESUi+9XzQhOKzNXrgSZovjmY3BvG9La2
	 Zwi1/mmczvBowMKajTtSRs3T8uKTDUK81QbDU2ONT5L5uXgTYA6zeeIOnzXN8vCPVvDXS
	 n5RwMPC1dERqSD5J6kxj+DdIt5lrx3RmC2nQJcDFQkcJjGyvg4/GG5Imzxq7j1FaRE/S3
	 Rtp7BnbqLtywNsKELnPZUZdK5jXcXwZveZymFz6FwVSqxhB/mdNkGHa/Z6InqtL7Nxwfr
	 C20qAUNt0JbT0B6EeoRuEBklwKKwejY73cjO5yyXohlGBjEH5XZKcN5R8+RQTHlpTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108150;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V/SClVkHawywlSW8ZBpKO3xLQwjFX3XdpDt9XLNgukg=;
	b=YSRRn/0FyrpIzj+aS82+hr0168CqiorndqzTwVA9UKqlP3vb1XmVvmONLhxuWCoZRKMH
	 TAz9zbYvreJKs3ZEozUAMwO3L7nB1+PIJeICJQz133uPdRrSHNbP29jI5yF96RJp39hAh
	 Mt9HlRiHmipOrpxeBoPfHaJ00pK9CUXHjXdiSA1z3Bj5kEvbEMJg2mlbU3Y64ZUgIs01i
	 jpiCnnYKhSgizPyTqZxb356sg2BaXkF7YYkordER2GwjxqPvAzDM6dwCbm8bJm3AQ5ayT
	 4tLUv7ssAHaUVhaTcfcIpXuugMqsCgW50CHosRavLS0guQigNNV0MZubGMxVryJXaPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jg1JqDzg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D960A3818;
	Thu, 19 Nov 2026 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jg1JqDzg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280A31F000C7;
	Thu, 19 Nov 2026 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108149;
	bh=V/SClVkHawywlSW8ZBpKO3xLQwjFX3XdpDt9XLNgukg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jg1JqDzgdbr9H3GgqAGd8kRz0F4BU7Q9eVXQkHe+uwV+Xn0UIK3ATNJAB86mdwhRs
	 rcyquDPovUId0A3+aCHYwUof5j54mGfZKhfOxR2OsFQGStzgLIaYbbDhdpnrH9zCrS
	 w1ZfXEbH6VIMCx5U/VRR2lmwhQZlfeNmbheiwePbRdyKTlec0i3V1fSr7W7vbB2x5A
	 Skv/ZaUdK8BLaJEeaoPW5W2Qa/OH/APTkpiLiGmc2WwKP8fYPi7VVig9aym/taqvxD
	 eB9FTapCuP3oe7CGxSBM7b0VpkXkbPUHST7z7WG7BlD+9tL9pXMEyYuTMFFGXA/LQV
	 qCC+3XSZ+t5jw==
Subject: Re: [PATCH net-next v8 07/10] bnge: add NTUPLE filter infrastructure
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Thu, 19 Nov 2026 17:09:08 +0000
Message-ID: <179510814874.3136.16401645419893919570@kernel.org>
In-Reply-To: <20261116140653.1685797-8-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-8-vikas.gupta@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch ties an ntuple filter to its L2 filter only through
  a copied firmware handle, `bnge_ntuple_filter.l2_filter_id`.
- [Low] bnge: duplicate L2 filter allocation in
  bnge_alloc_user_l2_filter()

--

bnge: add NTUPLE filter infrastructure

This commit adds the ntuple filter data structures, hash table, bitmaps
and the HWRM wrappers that allocate and free ntuple filters in firmware.
It also tracks L2 filters by sw_id in a bitmap, and sets bd->max_fltr to
the fixed value BNGE_MAX_NTUPLE_FLTRS.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
> index 372657cba43c4..87d66266a9f5b 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h

[ ... ]

> +struct bnge_ntuple_filter {
> +	/* base filter must be the first member */
> +	struct bnge_filter_base	base;
> +	struct flow_keys	fkeys;
> +	struct bnge_flow_masks	fmasks;
> +	__le64			l2_filter_id;
> +	u32			flow_id;
> +};

[Severity: Medium]
The only link from an ntuple filter to its L2 filter is a copy of the
firmware L2 handle in l2_filter_id. There is no pointer or refcount back
to the struct bnge_l2_filter. What happens to an ntuple filter that is
already programmed when its parent L2 filter is freed and re-created in
firmware?

Later patches in the series fix most of this:

"bnge: add aRFS flow steering ndo support" changes bnge_fltr_match() to
compare l2_key. It also makes bnge_cfg_ntp_filters() look up the L2 id
by key again before programming.

"bnge: add NTUPLE filter support in ethtool" adds bnge_cfg_usr_fltrs(),
which binds user rules to l2_filters[0] again on open.

One path still looks open at the end of the series. Every unicast list
update goes through bnge_cfg_rx_mode(), which does this:

bnge_cfg_rx_mode() {
    ...
	for (i = 1; i < vnic->uc_filter_count; i++) {
		struct bnge_l2_filter *fltr = vnic->l2_filters[i];
		...
		bnge_hwrm_l2_filter_free(bd, fltr);
		bnge_del_l2_filter_rcu(bn, fltr);
	}
    ...
}

bnge_hwrm_set_vnic_filter() then re-creates the filters, and firmware
gives them new L2 ids.

In the later aRFS patch, bnge_rx_flow_steer() binds aRFS rules for flows
to a secondary unicast MAC (a macvlan, for example) to that MAC's L2
filter, through bnge_lookup_l2_filter_from_key(). After such a rule is
programmed and BNGE_FLTR_VALID is set, nothing walks ntp_fltr_hash_tbl to
invalidate or re-program it when its parent L2 filter is removed.

While the flow stays active, rps_may_expire_flow() keeps the stale entry.
bnge_rx_flow_steer() keeps matching it by l2_key and only re-programs it
when the RX queue changes. Does steering for that flow stop without any
error, so that packets fall back to default VNIC RSS?

When the rule finally expires, bnge_hwrm_cfa_ntuple_filter_free() sends
the cached ntuple filter_id. Suppose firmware dropped that entry together
with its parent L2 filter and has since reused the id. Could this free an
unrelated live ntuple filter?

Should the L2 filter teardown in bnge_cfg_rx_mode() also invalidate or
re-program the ntuple filters that reference that L2 filter?

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> @@ -72,10 +227,339 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
>  	if (!fltr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	bnge_init_l2_filter(bn, fltr, key, idx);
> +	rc = bnge_init_l2_filter(bn, fltr, key, idx);
> +	if (rc) {
> +		kfree(fltr);
> +		fltr = ERR_PTR(rc);
> +	}
> +
>  	return fltr;
>  }
>  
> +struct bnge_l2_filter *bnge_alloc_user_l2_filter(struct bnge_net *bn,
> +						 struct bnge_l2_key *key,
> +						 u8 flags)
> +{
> +	struct bnge_l2_filter *fltr;
> +	u32 idx;
> +	int rc;
> +
> +	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
> +	      BNGE_L2_FLTR_HASH_MASK;
> +	fltr = bnge_lookup_l2_filter(bn, key, idx);
> +	if (fltr) {
> +		fltr = ERR_PTR(-EEXIST);
> +		goto l2_filter_exit;
> +	}
> +	fltr = kzalloc_obj(*fltr, GFP_KERNEL);
> +	if (!fltr) {
> +		fltr = ERR_PTR(-ENOMEM);
> +		goto l2_filter_exit;
> +	}
> +	fltr->base.flags = flags;
> +	rc = bnge_init_l2_filter(bn, fltr, key, idx);
> +	if (rc) {
> +		kfree(fltr);
> +		return ERR_PTR(rc);
> +	}
> +
> +l2_filter_exit:
> +	return fltr;
> +}
> +
> +void bnge_free_l2_filters(struct bnge_net *bn)
> +{
> +	int i;
> +
> +	netdev_assert_locked_or_invisible(bn->netdev);
> +
> +	for (i = 0; i < BNGE_L2_FLTR_HASH_SIZE; i++) {
> +		struct bnge_l2_filter *fltr;
> +		struct hlist_head *head;
> +		struct hlist_node *tmp;
> +
> +		head = &bn->l2_fltr_hash_tbl[i];
> +		hlist_for_each_entry_safe(fltr, tmp, head, base.hlist)
> +			bnge_del_l2_filter(bn, fltr);
> +	}
> +
> +	bitmap_free(bn->l2_fltr_bmap);
> +	bn->l2_fltr_bmap = NULL;
> +	bn->l2_fltr_count = 0;
> +}
> +
> +void bnge_free_ntp_fltrs(struct bnge_net *bn, bool skip_user)
> +{
> +	int i;
> +
> +	netdev_assert_locked_or_invisible(bn->netdev);
> +
> +	/* Under netdev instance lock and all our NAPIs have been disabled.
> +	 * It's safe to delete the hash table.
> +	 */
> +	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++) {
> +		struct bnge_ntuple_filter *fltr;
> +		struct hlist_head *head;
> +		struct hlist_node *tmp;
> +
> +		head = &bn->ntp_fltr_hash_tbl[i];
> +		hlist_for_each_entry_safe(fltr, tmp, head, base.hlist) {
> +			if (skip_user && bnge_is_usr_fltr(&fltr->base))
> +				continue;
> +			bnge_del_ntp_filter(bn, fltr);
> +		}
> +	}
> +
> +	if (skip_user)
> +		return;
> +
> +	bitmap_free(bn->ntp_fltr_bmap);
> +	bn->ntp_fltr_bmap = NULL;
> +	bn->ntp_fltr_count = 0;
> +}
> +
> +static int bnge_alloc_l2_fltrs_mem(struct bnge_net *bn)
> +{
> +	int i, rc = 0;
> +
> +	if (bn->l2_fltr_bmap)
> +		return 0;
> +
> +	for (i = 0; i < BNGE_L2_FLTR_HASH_SIZE; i++)
> +		INIT_HLIST_HEAD(&bn->l2_fltr_hash_tbl[i]);
> +
> +	bn->l2_fltr_count = 0;
> +	bn->l2_fltr_bmap = bitmap_zalloc(BNGE_MAX_L2_FLTRS, GFP_KERNEL);
> +
> +	if (!bn->l2_fltr_bmap)
> +		rc = -ENOMEM;
> +
> +	return rc;
> +}
> +
> +static int bnge_alloc_ntp_fltrs_mem(struct bnge_net *bn)
> +{
> +	struct bnge_dev *bd = bn->bd;
> +	int i, rc = 0;
> +
> +	if (!(bn->priv_flags & BNGE_NET_EN_NTUPLE) || bn->ntp_fltr_bmap)
> +		return 0;
> +
> +	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++)
> +		INIT_HLIST_HEAD(&bn->ntp_fltr_hash_tbl[i]);
> +
> +	bn->ntp_fltr_count = 0;
> +	bn->ntp_fltr_bmap = bitmap_zalloc(bd->max_fltr, GFP_KERNEL);
> +
> +	if (!bn->ntp_fltr_bmap)
> +		rc = -ENOMEM;
> +
> +	return rc;
> +}
> +
> +int bnge_fltrs_mem(struct bnge_net *bn)
> +{
> +	bool ntp_alloced = !bn->ntp_fltr_bmap;
> +	int rc;
> +
> +	rc = bnge_alloc_ntp_fltrs_mem(bn);
> +	if (rc)
> +		return rc;
> +
> +	rc = bnge_alloc_l2_fltrs_mem(bn);
> +	if (rc)
> +		goto err_free_ntp_mem;
> +
> +	return 0;
> +
> +err_free_ntp_mem:
> +	if (ntp_alloced) {
> +		bitmap_free(bn->ntp_fltr_bmap);
> +		bn->ntp_fltr_bmap = NULL;
> +	}
> +	return rc;
> +}
> +
> +#define BNGE_IPV4_4TUPLE(bd, fkeys)					\
> +	(((fkeys)->basic.ip_proto == IPPROTO_TCP &&			\
> +	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4) ||	\
> +	 ((fkeys)->basic.ip_proto == IPPROTO_UDP &&			\
> +	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4))
> +
> +#define BNGE_IPV6_4TUPLE(bd, fkeys)					\
> +	(((fkeys)->basic.ip_proto == IPPROTO_TCP &&			\
> +	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6) ||	\
> +	 ((fkeys)->basic.ip_proto == IPPROTO_UDP &&			\
> +	  (bd)->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6))
> +
> +static u32 bnge_get_rss_flow_tuple_len(struct bnge_dev *bd,
> +				       struct flow_keys *fkeys)
> +{
> +	if (fkeys->basic.n_proto == htons(ETH_P_IP)) {
> +		if (BNGE_IPV4_4TUPLE(bd, fkeys))
> +			return sizeof(fkeys->addrs.v4addrs) +
> +			       sizeof(fkeys->ports);
> +
> +		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4)
> +			return sizeof(fkeys->addrs.v4addrs);
> +	}
> +
> +	if (fkeys->basic.n_proto == htons(ETH_P_IPV6)) {
> +		if (BNGE_IPV6_4TUPLE(bd, fkeys))
> +			return sizeof(fkeys->addrs.v6addrs) +
> +			       sizeof(fkeys->ports);
> +
> +		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6)
> +			return sizeof(fkeys->addrs.v6addrs);
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 bnge_toeplitz(struct bnge_net *bn, struct flow_keys *fkeys,
> +			 const unsigned char *key)
> +{
> +	u64 prefix = bn->toeplitz_prefix, hash = 0;
> +	struct bnge_ipv4_tuple tuple4;
> +	struct bnge_ipv6_tuple tuple6;
> +	struct bnge_dev *bd = bn->bd;
> +	u8 *four_tuple;
> +	int i, j, len;
> +
> +	len = bnge_get_rss_flow_tuple_len(bd, fkeys);
> +	if (!len)
> +		return 0;
> +
> +	if (fkeys->basic.n_proto == htons(ETH_P_IP)) {
> +		tuple4.v4addrs = fkeys->addrs.v4addrs;
> +		tuple4.ports = fkeys->ports;
> +		four_tuple = (u8 *)&tuple4;
> +	} else {
> +		tuple6.v6addrs = fkeys->addrs.v6addrs;
> +		tuple6.ports = fkeys->ports;
> +		four_tuple = (u8 *)&tuple6;
> +	}
> +
> +	for (i = 0, j = 8; i < len; i++, j++) {
> +		u8 byte = four_tuple[i];
> +		int bit;
> +
> +		for (bit = 0; bit < 8; bit++, prefix <<= 1, byte <<= 1) {
> +			if (byte & 0x80)
> +				hash ^= prefix;
> +		}
> +		prefix |= (j < HW_HASH_KEY_SIZE) ? key[j] : 0;
> +	}
> +
> +	/* The valid part of the hash is in the upper 32 bits. */
> +	return (hash >> 32) & BNGE_NTP_FLTR_HASH_MASK;
> +}
> +
> +u32 bnge_get_ntp_filter_idx(struct bnge_net *bn, struct flow_keys *fkeys,
> +			    const struct sk_buff *skb)
> +{
> +	struct bnge_vnic_info *vnic;
> +
> +	if (skb)
> +		return skb_get_hash_raw(skb) & BNGE_NTP_FLTR_HASH_MASK;
> +
> +	vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
> +	return bnge_toeplitz(bn, fkeys, (void *)vnic->rss_hash_key);
> +}
> +
> +static bool bnge_fltr_match(struct bnge_ntuple_filter *f1,
> +			    struct bnge_ntuple_filter *f2)
> +{
> +	struct bnge_flow_masks *masks1 = &f1->fmasks;
> +	struct bnge_flow_masks *masks2 = &f2->fmasks;
> +	struct flow_keys *keys1 = &f1->fkeys;
> +	struct flow_keys *keys2 = &f2->fkeys;
> +
> +	if (keys1->basic.n_proto != keys2->basic.n_proto ||
> +	    keys1->basic.ip_proto != keys2->basic.ip_proto)
> +		return false;
> +
> +	if (keys1->basic.n_proto == htons(ETH_P_IP)) {
> +		if (keys1->addrs.v4addrs.src != keys2->addrs.v4addrs.src ||
> +		    masks1->addrs.v4addrs.src != masks2->addrs.v4addrs.src ||
> +		    keys1->addrs.v4addrs.dst != keys2->addrs.v4addrs.dst ||
> +		    masks1->addrs.v4addrs.dst != masks2->addrs.v4addrs.dst)
> +			return false;
> +	} else {
> +		if (!ipv6_addr_equal(&keys1->addrs.v6addrs.src,
> +				     &keys2->addrs.v6addrs.src) ||
> +		    !ipv6_addr_equal(&masks1->addrs.v6addrs.src,
> +				     &masks2->addrs.v6addrs.src) ||
> +		    !ipv6_addr_equal(&keys1->addrs.v6addrs.dst,
> +				     &keys2->addrs.v6addrs.dst) ||
> +		    !ipv6_addr_equal(&masks1->addrs.v6addrs.dst,
> +				     &masks2->addrs.v6addrs.dst))
> +			return false;
> +	}
> +
> +	return keys1->ports.src == keys2->ports.src &&
> +	       masks1->ports.src == masks2->ports.src &&
> +	       keys1->ports.dst == keys2->ports.dst &&
> +	       masks1->ports.dst == masks2->ports.dst &&
> +	       keys1->control.flags == keys2->control.flags &&
> +	       f1->l2_filter_id == f2->l2_filter_id;
> +}
> +
> +int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
> +			   u32 idx)
> +{
> +	struct bnge_ntuple_filter *f;
> +	struct hlist_head *head;
> +	int bit_id;
> +
> +	spin_lock_bh(&bn->ntp_fltr_lock);
> +
> +	head = &bn->ntp_fltr_hash_tbl[idx];
> +	hlist_for_each_entry(f, head, base.hlist) {
> +		if (bnge_fltr_match(f, fltr)) {
> +			spin_unlock_bh(&bn->ntp_fltr_lock);
> +			return -EEXIST;
> +		}
> +	}
> +
> +	bit_id = bitmap_find_free_region(bn->ntp_fltr_bmap,
> +					 bn->bd->max_fltr, 0);
> +	if (bit_id < 0) {
> +		spin_unlock_bh(&bn->ntp_fltr_lock);
> +		return -ENOMEM;
> +	}
> +
> +	fltr->base.sw_id = (u16)bit_id;
> +	fltr->base.filter_id = BNGE_FLTR_ID_INVALID;
> +	fltr->base.type = BNGE_FLTR_TYPE_NTUPLE;
> +	fltr->base.flags |= BNGE_ACT_RING_DST;
> +
> +	head = &bn->ntp_fltr_hash_tbl[idx];
> +	hlist_add_head_rcu(&fltr->base.hlist, head);
> +
> +	bnge_insert_usr_fltr(bn, &fltr->base);
> +	bn->ntp_fltr_count++;
> +
> +	spin_unlock_bh(&bn->ntp_fltr_lock);
> +
> +	return 0;
> +}
> +
> +struct bnge_ntuple_filter *
> +bnge_lookup_ntp_filter_from_idx(struct bnge_net *bn,
> +				struct bnge_ntuple_filter *fltr, u32 idx)
> +{
> +	struct bnge_ntuple_filter *f;
> +	struct hlist_head *head;
> +
> +	head = &bn->ntp_fltr_hash_tbl[idx];
> +	hlist_for_each_entry_rcu(f, head, base.hlist) {
> +		if (bnge_fltr_match(f, fltr))
> +			return f;
> +	}
> +	return NULL;
> +}
> +
>  int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
>  			      const u8 *mac_addr)
>  {

[Severity: Low]
bnge_alloc_user_l2_filter() looks like a copy of
bnge_alloc_l2_filter(), which sits just above it. Both functions do
the same steps:

- compute the bucket index with jhash2()
- return -EEXIST when bnge_lookup_l2_filter() finds a match
- allocate with kzalloc_obj()
- call bnge_init_l2_filter() and kfree() the filter if it fails

The only difference is that the user variant sets fltr->base.flags
before bnge_init_l2_filter(). That lets bnge_insert_usr_fltr() see
BNGE_ACT_RING_DST and add the filter to usr_fltr_list.

The gfp argument of bnge_alloc_l2_filter() also does not seem to do
anything useful. Its only caller, bnge_hwrm_set_vnic_filter(), always
passes GFP_KERNEL, and the user variant hardcodes GFP_KERNEL as well.

Could bnge_alloc_l2_filter() take a flags argument instead and set it
before calling bnge_init_l2_filter()? bnge_hwrm_set_vnic_filter()
would pass 0, and the ethtool path would pass the user flags. Then
there is one copy of the lookup, init and error handling to keep in
sync when bnge_init_l2_filter() grows more state in later patches.

A merged helper would also tidy up the user variant. It currently
exits through goto l2_filter_exit on some errors and through a direct
return ERR_PTR(rc) on another.

This is not a functional problem. It just removes duplicated code
that has to be maintained.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116140653.1685797-1-vikas.gupta%40broadcom.com
