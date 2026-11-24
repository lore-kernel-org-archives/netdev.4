Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515633;
	b=2D+qmcXRLCVU93/yDlcEdoWIZTzuScohDWWCdkjJzRV453HJB5gRtkuiIuN3Ibsfobkb
	 90GiPX4tOpZb0ZVnc1cqSHsS0YboQu1a7z9vRZ37rwfg5PKnWa+UGbcbEqxKGof5J6QOD
	 xms/TorHPf3j6viDPVjs5AkT8jX7oqdYCgI9Xrp/zRGU/yNbJdWbaaOtgmkdl4g/pcQ67
	 xLC0EnUX+/B1a6kVL1pme0tYXWzyZSdS1KPNn6LjkytO8giZ87CRHams1uLwAQIyNl2DX
	 oTo/RDSdWck2ES6gV8uQ06B6JBy+YFqfnrMpunhvyN5zSSdw77sEm9k3ydDkiicaxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515633;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gjDyuTkmmyfYSqD39L2E6i2oyf7DxqDr5MYZav/UbyU=;
	b=4FCqP3sutqF6tvqs7ym7pfknPmHcY84KFQ/LM/lcRen3+TY/rMeIuCWawtJVMboEZMCF
	 9YnlWoEFLNgdoJbGanBSEWuqejmphr0gYVU5ICwey0BzpmIgQZk1nqQYrbx2CXKzGEOE/
	 UXys+sXFWdtMU/ZyOSq26vkS7kaSDsDTDupy66ncVPXQPLNtb3VSkH0M4+ESbofGP7QAe
	 BlvB1pyGCu3yeJ4vQvd15XHcN9S6ERqNRSBkQMCDlF2Pmpk0kN8MVrV6+v1DZkNMRwGRE
	 9Nd+IPdMxaahdFPCgFBovsCY8f2HOW87qAWnMm13ooVlRR/6HfLEL4CMaY7/iYWjjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpFqO1P6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C13606A692;
	Tue, 24 Nov 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpFqO1P6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5522F1F000C6;
	Tue, 24 Nov 2026 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515633;
	bh=gjDyuTkmmyfYSqD39L2E6i2oyf7DxqDr5MYZav/UbyU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IpFqO1P63or12BDYNLZZoaIXfhk2Xse3vdtKdaLPNOFDbXISS0MiCPKMrZ/AafES3
	 LuS+giDnHIQcfZZ/Z8kIlMR4s4MlSXHZRegQsR/UbzNXKb0SsBOoJaGrX9lyU7+vez
	 1tkFpH9KWfZ17bgpE1hjh2qoypGssRTDdkrO0kF2oVeKNaje32rGLkNWPaS2DGG7Hy
	 2v9YfNboqsR9EWolR8f4Tui5U5RGcV61yXPbwoi6o4uCXqIk/58LrGWOoOQniLjizT
	 fw0Y6/YoswKkgMOhNdK1namMRKMDGIaJcJmhSm+iDjMXJKG5mOkcrykvkndEnAEdxt
	 ohvmCm5pe2/YA==
Subject: Re: [PATCH net-next v9 06/10] bnge: remove refcount from L2 filter
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:31 +0000
Message-ID: <179551563189.3135.3879694697631182157@kernel.org>
In-Reply-To: <20261123100746.1975030-7-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-7-vikas.gupta@broadcom.com>
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

- [Low] The commit message does not describe two behaviour changes this
  patch makes.

--

bnge: remove refcount from L2 filter

This patch removes the refcount from struct bnge_l2_filter. A filter is
now expected to be removed only by the context that created it. It also
folds the RCU lookup wrapper into bnge_lookup_l2_filter(), and makes
bnge_alloc_l2_filter() return an error when the key is already present.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> index a8bb441ebef9a..6316f75ca36ea 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c

[ ... ]

> @@ -13,8 +14,8 @@
>  
>  void bnge_del_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr)
>  {
> -	if (!refcount_dec_and_test(&fltr->refcnt))
> -		return;
> +	netdev_assert_locked_or_invisible(bn->netdev);
> +
>  	hlist_del_rcu(&fltr->base.hlist);
>  	kfree_rcu(fltr, base.rcu);
>  }

[ ... ]

> -static struct bnge_l2_filter *__bnge_lookup_l2_filter(struct bnge_net *bn,
> -						      struct bnge_l2_key *key,
> -						      u32 idx)
> +static struct bnge_l2_filter *bnge_lookup_l2_filter(struct bnge_net *bn,
> +						    struct bnge_l2_key *key,
> +						    u32 idx)
>  {
>  	struct bnge_l2_filter *fltr;
>  	struct hlist_head *head;
>  
> +	netdev_assert_locked_or_invisible(bn->netdev);
> +
>  	head = &bn->l2_fltr_hash_tbl[idx];
> -	hlist_for_each_entry_rcu(fltr, head, base.hlist) {
> +	hlist_for_each_entry(fltr, head, base.hlist) {

[ ... ]

> @@ -75,9 +63,10 @@ static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
>  
>  	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
>  	      BNGE_L2_FLTR_HASH_MASK;
> +
>  	fltr = bnge_lookup_l2_filter(bn, key, idx);
>  	if (fltr)
> -		return fltr;
> +		return ERR_PTR(-EEXIST);

[Severity: Low]
This isn't a bug, but should the commit message describe two behaviour
changes this patch makes? The message only talks about removing the
refcount:

  However, going forward, the filter will only be removed by the same
  context that created it, making refcount unnecessary.

First, the contract of bnge_alloc_l2_filter() changes. When it found a
duplicate MAC/VLAN key it used to take a reference and return the
existing filter. It now returns ERR_PTR(-EEXIST).

That error would go back through bnge_hwrm_set_vnic_filter() to
bnge_init_chip(), where open fails with "HWRM vnic filter failure", and
to bnge_cfg_rx_mode(). As far as I can tell this branch can't be reached
today, so there is no runtime impact.

Second, lookups of l2_fltr_hash_tbl switch from an RCU walk under
rcu_read_lock() to a plain hlist_for_each_entry(). The new
netdev_assert_locked_or_invisible() calls in bnge_lookup_l2_filter() and
bnge_del_l2_filter() make the netdev instance lock the required
protection.

At this commit nothing documents that rule. The bnge_netdev.h comment
saying l2_fltr_hash_tbl is covered by the netdev instance lock only
appears later in the series.

Could the commit message mention the new -EEXIST return and the move
from RCU to the instance lock for lookup and delete? Other commits in
this series list changes like these explicitly.

>  
>  	fltr = kzalloc_obj(*fltr, gfp);
>  	if (!fltr)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com
