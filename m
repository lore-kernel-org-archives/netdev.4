Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515635;
	b=Pb5zNUv9PyGKnPrQOjCBo5Dl6OeQIZgTN0Lhxnd1ZZkzj+DkIdN9MF7KqGEtEbmYqv14
	 J8kXAGZzTPdXIEWHmoLdQlA89kolsHr+pfj2TdEGiMmmDfndy7tfuaaNlWM87Rwjfdcg4
	 slKG50TBAjgUReURXqX7VCDfxobps5W2BBmcsARZWcaMeZRz+ZDtRekTjj2mKKH2YSaEr
	 G5evurhivd2ibqSZ9PUIUoYmAfRrC1E1jz1zy3TATZ4jstgNGKOOhpsuDP5NrujZVXr8Z
	 larep/tb9urrLjbZKO0UoO8QY8JbL05AinHbXKcoepyOLm3thunQtZ/O98XKx7sCBRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515635;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wL9x9RV5z37jD1Q5CVUbH84dk5j7429RAiA7/fZ/uM0=;
	b=IZjVBZ21ggOeVejROODMVK4y31UGD1VEb9qwyqh8xmhzqOj1BAjAi/Y/yFQ8Is/8J/lD
	 x6/clfw/CQ5hWNe5cEJ8THTf/7jy/H7bGKOImSDficlYneArROl72L5FBMvUwfva1wHev
	 Gc3jHxuGLMm/0ogOoBAlUB5i5ghVjestiF7soQFMuR9cjovqnRnAUAvLpMP5KO69D+ST9
	 jpR1ubINnnJJtvYt5F5T0PH1/Dt3vEw30LEnHZKtTi9u+k57l5LfXNhetyltPdGtpiSIK
	 0qTBqNxGmNgHiCHAZlGZd8XXQnHyRC8ECCaJmeb0mGaZWaWqY/nlF2Ja3+BSY8UPLJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTn223K7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89666606A339;
	Tue, 24 Nov 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gTn223K7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCC51F000C6;
	Tue, 24 Nov 2026 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515635;
	bh=wL9x9RV5z37jD1Q5CVUbH84dk5j7429RAiA7/fZ/uM0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gTn223K7Nn6TPx5LYS34fJjJp/6X7n7i+i4IPcH9sb1UnBo0kIN4J45KZfZMtQKao
	 GDYvd9ijE5b68paW/DIusXfI3QfltIcx4xMM8kbxLsedwgxAth30CO3mT8WSoYSP3q
	 TlBDgoOJ/imYaxuiL/8NNjREB0nuMazDgGo7DUqZWI50r+RejZ7qIXGJrzZoY/upMP
	 poEaOlfofbvVT0qDX4vnhkUuhF3mzP0YSuZYzo0MEbFBHiOJDXbsfwIFVhHF7WPkoq
	 AfVX5TqR7GY65Mrz1EZ4pUdCS184myAjFKq8Qwy6iMRFarBnN2tBp3ervqa0x0lSIa
	 S/piVp0+xXASQ==
Subject: Re: [PATCH net-next v9 07/10] bnge: add NTUPLE filter infrastructure
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:33 +0000
Message-ID: <179551563372.3135.5533765949543309773@kernel.org>
In-Reply-To: <20261123100746.1975030-8-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-8-vikas.gupta@broadcom.com>
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

- [Low] The commit message describes this patch as adding NTUPLE data
  structures and firmware command wrappers.
- [Low] The commit message says bd->max_fltr is 'no longer the sum of the
  firmware EM and WM flow counts and the L2 filter count', which…
- [Low] bnge: duplicate L2 filter allocation in
  bnge_alloc_user_l2_filter()

--

bnge: add NTUPLE filter infrastructure

This commit adds NTUPLE filter data structures to the bnge driver. It
also adds hash table and bitmap management for those filters, plus HWRM
wrappers to allocate and free them. It sets bd->max_fltr to a fixed
BNGE_MAX_NTUPLE_FLTRS (8192).

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> index 6316f75ca36ea..3ebb3cae4829b 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c

[ ... ]

> @@ -12,26 +13,150 @@
>  #include "bnge_hwrm_lib.h"
>  #include "bnge_filter.h"
>  
> -void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
> +#define BNGE_IPV6_MASK_ALL {{{ 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, \

[ ... ]

> +static bool bnge_is_usr_fltr(struct bnge_filter_base *fltr)
>  {
> -	netdev_assert_locked_or_invisible(bn->netdev);
> +	return (fltr->type == BNGE_FLTR_TYPE_L2 &&

[ ... ]

> +void bnge_del_l2_filter_rcu(struct bnge_net *bn, struct bnge_l2_filter *lfltr)
> +{
> +	struct bnge_filter_base *fltr = &lfltr->base;
> +
> +	hlist_del_rcu(&fltr->hlist);
> +	bnge_del_usr_fltr_node(bn, fltr);
> +	clear_bit(fltr->sw_id, bn->l2_fltr_bmap);
> +	bn->l2_fltr_count--;
> +	kfree_rcu(lfltr, base.rcu);
> +}
> +
> +void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *lfltr)
> +{
> +	struct bnge_filter_base *fltr = &lfltr->base;
>  
> +	hlist_del(&fltr->hlist);
> +	bnge_del_usr_fltr_node(bn, fltr);
> +	clear_bit(fltr->sw_id, bn->l2_fltr_bmap);
> +	bn->l2_fltr_count--;
> +	kfree(fltr);
> +}

[Severity: Low]
This isn't a bug, but bnge_del_l2_filter() keeps its name and changes what
it does. Before this patch its body was:

	netdev_assert_locked_or_invisible(bn->netdev);
	hlist_del_rcu(&fltr->base.hlist);
	kfree_rcu(fltr, base.rcu);

It now calls hlist_del() and then kfree() right away, and the lock
assertion is gone. The old RCU-deferred behaviour moves to the new
bnge_del_l2_filter_rcu(). All existing callers (bnge_cfg_rx_mode(),
bnge_hwrm_clear_vnic_filter() and bnge_hwrm_set_vnic_filter()) are
switched to it.

A caller outside this series that still uses bnge_del_l2_filter() would
still compile, but it would no longer get an RCU-deferred free.

The commit message only describes new NTUPLE infrastructure:

  Add the core NTUPLE filter data structures and firmware command
  wrappers needed for flow rule management.

Could it also list the changes to existing behaviour? For example:

- bnge_init_l2_filter() now takes a sw_id from the new 128-entry
  l2_fltr_bmap for every L2 filter, including the default and unicast
  rx-mode filters. It can also now fail with -ENOMEM.
- bnge_hwrm_l2_filter_alloc() now publishes BNGE_FLTR_VALID behind
  smp_wmb() and programs RFS_RING_TBL_IDX for BNGE_ACT_RING_DST filters.
- bnge_del_one_rss_ctx() now frees the NTUPLE filters bound to the
  context, both in firmware and in software.
- bnge_close_core() now walks usr_fltr_list and resets filter state.
- bnge_alloc_core(), bnge_free_core() and bnge_netdev_free() now set up
  and tear down filter memory.

Other commits in this series have a section on the existing behaviour
they change. This one does not.

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> index 32ab1ae419a3e..c31e6508c03f3 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c

[ ... ]

> @@ -726,9 +726,7 @@ int bnge_net_init_dflt_config(struct bnge_dev *bd)
>  		goto err_free_tbl;
>  
>  	bnge_set_dflt_rss_indir_tbl(bd, NULL);
> -	hw_resc = &bd->hw_resc;
> -	bd->max_fltr = hw_resc->max_rx_em_flows + hw_resc->max_rx_wm_flows +
> -		       BNGE_L2_FLTR_MAX_FLTR;
> +	bd->max_fltr = BNGE_MAX_NTUPLE_FLTRS;

[Severity: Low]
The commit message says:

  It is no longer the sum of the firmware EM and WM flow counts and the
  L2 filter count.

Does anything in the driver ever write hw_resc->max_rx_em_flows or
hw_resc->max_rx_wm_flows? At the parent commit the only references seem
to be their declarations in struct bnge_hw_resc (bnge_resc.h) and this
read. That would make the old value always
0 + 0 + BNGE_L2_FLTR_MAX_FLTR = 1024.

If so, the real change here is from 1024 to 8192. Could the commit
message say that, and explain why 8192 was chosen?

After this patch nothing reads max_rx_em_flows or max_rx_wm_flows either.
Should these now-dead fields be removed from struct bnge_hw_resc?

The message also says max_fltr "is the rule count that ethtool reports".
Nothing in this commit reports it to ethtool, though. That seems to
happen later, in "bnge: add NTUPLE filter support in ethtool", where
bnge_get_rxnfc() handles ETHTOOL_GRXCLSRLCNT. Could the wording here
reflect that?

[ ... ]

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
This isn't a bug, but bnge_alloc_user_l2_filter() is almost a line for
line copy of bnge_alloc_l2_filter() just above it. Both functions:

- compute the bucket with jhash2() and BNGE_L2_FLTR_HASH_MASK,
- return -EEXIST when bnge_lookup_l2_filter() finds a match,
- allocate with kzalloc_obj(),
- call bnge_init_l2_filter() and kfree() the filter if it fails.

The only real difference is that the user variant sets
fltr->base.flags before calling bnge_init_l2_filter(). That ordering
matters, because bnge_insert_usr_fltr() looks at the flags to decide
whether the filter goes on usr_fltr_list.

The gfp argument of bnge_alloc_l2_filter() does not buy anything
either. Its only caller, bnge_hwrm_set_vnic_filter(), passes
GFP_KERNEL, which is what the user variant hardcodes.

The two copies already differ in style on the error path (goto in one,
early return in the other), so they are likely to drift apart further
later on.

Could bnge_alloc_l2_filter() take a flags argument instead of gfp, and
set base.flags before bnge_init_l2_filter()?
bnge_hwrm_set_vnic_filter() would then pass 0, and
bnge_alloc_user_l2_filter() could either be a thin wrapper around it or
go away. Or is there a reason the user path needs its own copy that I
am missing?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
