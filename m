Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940678;
	b=z/G/EKnIgYK5nWFCKYiO9k5Nfz53ikaM4R4U4uA44txKyfkOrAMyFqBvTC9E1DsbAzIn
	 sQdZeqg1G3tiTeDSIyjEVGWdbrXInlRkjB4Gd3OdVNcgSmbMJvDVcV5Z+fmdeZVjiEECh
	 ozpBmc0Yxnr4/0WAtgVF1c3TyHTRcFH986vOP/D+lyWjmXou0xQHHZrIGYMLq/2zx/V/7
	 yFNpDwXp0ybTRwo6qEcXR+1MsmdT1SD3b1uM+TzEbLJM1P3e5pxqAwE/UtwO5MsEjxSkP
	 9AoxpT4ZHtOpfmYpVJmsLxyTACnslyz1n9++Yom7KgsUeadMvhhrAx+8nfMlMW/+syg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940678;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ckhCEAkRR8doUuJC+rABzk69KEWU/YIQOM2FH80JRM4=;
	b=FpbOtwCQiEcY0At91QHEdCnZJ2cer5/bHTDblOrBl3iP468hVmWKWDnvs2Lpshlpa1JD
	 Bme6W8MNgo0WASARC8cvvddYsxTONtW8P5YfdJn0KKRTGjSv5AF9r9pAENklDSozkDWJi
	 CwEKyb+CVkxnPTnaKj5MZBtSxMKVNxiOFTiVB2KscsKknEYliCkaVk5SRW/ZyOxlzmioO
	 LUDKLb8igDTuUNa2kYkTSacOL0TEsszGsadei3VZRH5Ti+Dcov6cDzkvqs5BFYUZHS04H
	 El87JUB0rFfJwEdbVBWPxDRavcHXR2uReKybO/bJqDpQdVos/lh3rkWY4GeSLYK+UQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsppJVVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1ED606A33A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsppJVVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24E81F000C8;
	Tue, 17 Nov 2026 18:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940678;
	bh=ckhCEAkRR8doUuJC+rABzk69KEWU/YIQOM2FH80JRM4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UsppJVVsNaq/KIYwhPi3280Hfxo6BmviioCI+wRrSAVIGqoxK/cKc+BZdbjiXacXu
	 R+Tfq5lA5bICnEBTm8zK7YLPb0Kj+/e4dBEC1uasXBd1jko3nqBvRmMC/Qr+2gsJQ0
	 EBKjREfY7mbDCJnY5NYonfbmUoY7gJHNMhoW9hOPxhR6UBU1ab1KOvk2Yo1b8zDCae
	 KBq+uR7xrhta/Z3VIy0M/Zcm28VAqI9pfZgqato9D00uEpyCYoFq7fNCpi0xO8NKZB
	 R3zH8wH9DVxGVjJTPtoJKDqxYTqoCXEiKL12N5itHJ8N0IKwkxYk//SHC0N4iTBbD8
	 d1gAof/jaK5ig==
Subject: Re: [PATCH net v3 6/7] tipc: fix self-deadlock in tipc_named_node_up
From: netdev-bot+sashiko@kernel.org
To: tung.quang.nguyen@est.tech
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, jmaloy@redhat.com, horms@kernel.org,
 tipc-discussion@lists.sourceforge.net,
 syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com, lkp@intel.com
Date: Tue, 17 Nov 2026 18:37:57 +0000
Message-ID: <179494067734.3136.14054050575784099743@kernel.org>
In-Reply-To: <20261116063529.6185-7-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-7-tung.quang.nguyen@est.tech>
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

- [Low] In net/tipc/node.c, the call to tipc_node_lxc_xmit() inside the
  new tipc_node_distribute() (line 1847) can never do anything, so it is…
- [Low] tipc_named_node_up() (net/tipc/name_distr.c, around lines
  227-231) maps -ELINKCONG to 0, with the comment "The link is congested…

--

tipc: fix self-deadlock in tipc_named_node_up

This patch removes cluster_scope_lock and uses nametbl_lock to protect
the cluster_scope list. That avoids a self-deadlock when
tipc_node_xmit() reaches tipc_node_link_down() while the read lock is
held. It also adds tipc_node_distribute(), which sends the bulk list
without calling tipc_node_link_down(), and moves the link reset on
-ENOBUFS into tipc_node_write_unlock().

> diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
> index 1fe650a95eb42..2e07d50a29437 100644
> --- a/net/tipc/name_distr.c
> +++ b/net/tipc/name_distr.c

[ ... ]

> @@ -202,25 +198,39 @@ static void named_distribute(struct net *net, struct sk_buff_head *list,

[ ... ]

> -void tipc_named_node_up(struct net *net, u32 dnode, u16 capabilities)
> +int tipc_named_node_up(struct net *net, u32 dnode,
> +		       u16 capabilities, int *bearer_id)
>  {

[ ... ]

>  	__skb_queue_head_init(&head);
>  	spin_lock_bh(&tn->nametbl_lock);
>  	if (!(capabilities & TIPC_NAMED_BCAST))
>  		nt->rc_dests++;
> -	seqno = nt->snd_nxt;
> +	named_distribute(net, &head, dnode, &nt->cluster_scope, nt->snd_nxt);
> +	if (!skb_queue_empty(&head))
> +		rc = tipc_node_distribute(net, &head, dnode, bearer_id, 0);
>  	spin_unlock_bh(&tn->nametbl_lock);
>  
> -	read_lock_bh(&nt->cluster_scope_lock);
> -	named_distribute(net, &head, dnode, &nt->cluster_scope, seqno);
> -	tipc_node_xmit(net, &head, dnode, 0);
> -	read_unlock_bh(&nt->cluster_scope_lock);
> +	/* The link is congested after the list is inserted into
> +	 * the link's send queue. Return 0, as this is normal.
> +	 */
> +	if (rc == -ELINKCONG)
> +		rc = 0;

[Severity: Low]
Can tipc_link_xmit() return -ELINKCONG for this list?

Every buffer that named_distribute() builds has user NAME_DISTRIBUTOR.
msg_importance() maps that user to TIPC_SYSTEM_IMPORTANCE:

net/tipc/msg.h:msg_importance() {
	if (likely((usr <= TIPC_CRITICAL_IMPORTANCE) && !msg_errcode(m)))
		return usr;
	if ((usr == MSG_FRAGMENTER) || (usr == MSG_BUNDLER))
		return msg_bits(m, 9, 0, 0x7);
	return TIPC_SYSTEM_IMPORTANCE;
}

In tipc_link_xmit(), a SYSTEM importance list that hits the backlog limit
is purged and gets -ENOBUFS. That means link_schedule_user(), the only
source of -ELINKCONG, is never called for it:

net/tipc/link.c:tipc_link_xmit() {
	...
	if (unlikely(l->backlog[imp].len >= l->backlog[imp].limit)) {
		if (imp == TIPC_SYSTEM_IMPORTANCE) {
			pr_warn("%s<%s>, link overflow", link_rst_msg, l->name);
			__skb_queue_purge(list);
			return -ENOBUFS;
		}
		rc = link_schedule_user(l, hdr);
	}
	...
}

When transmq is full, the buffers just move to the backlog and rc stays
0.

If that's right, this branch is dead code. The comment also says
congestion is a normal result here, but for this traffic congestion ends
in -ENOBUFS and a link reset. The -ELINKCONG entry in the
tipc_node_distribute() kernel-doc has the same problem.

Later in the series, the same branch and comment are copied into
tipc_named_distribute().

> diff --git a/net/tipc/node.c b/net/tipc/node.c
> index dfbeed21dbc1b..77979a850df24 100644
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c

[ ... ]

> @@ -1737,44 +1792,72 @@ int tipc_node_xmit(struct net *net, struct sk_buff_head *list,

[ ... ]

> +int tipc_node_distribute(struct net *net, struct sk_buff_head *list,
> +			 u32 dnode, int *bearer_id, int selector)
> +{
> +	struct tipc_media_addr maddr;
> +	struct sk_buff_head xmitq;
> +	struct tipc_node *n;
> +	int rc;
> +
> +	n = tipc_node_find(net, dnode);
> +	if (unlikely(!n)) {
>  		__skb_queue_purge(list);
>  		return -EHOSTUNREACH;
>  	}
>  
> +	if (tipc_node_lxc_xmit(n, list)) {
> +		tipc_node_put(n);
> +		return 0;
> +	}

[Severity: Low]
Can this tipc_node_lxc_xmit() call ever consume the list?

tipc_named_node_up() is the only caller of tipc_node_distribute(), and
it passes the bulk list from named_distribute(). named_prepare_buf()
builds each of those buffers with user NAME_DISTRIBUTOR:

net/tipc/name_distr.c:named_prepare_buf() {
	...
		tipc_msg_init(self, msg, NAME_DISTRIBUTOR,
			      type, INT_H_SIZE, dest);
	...
}

For that user, tipc_lxc_xmit() returns without touching the list:

net/tipc/node.c:tipc_lxc_xmit() {
	...
	case LINK_PROTOCOL:
	case NAME_DISTRIBUTOR:
	case TUNNEL_PROTOCOL:
	case BCAST_PROTOCOL:
		return;
	...
}

So skb_queue_empty(list) is always false and tipc_node_lxc_xmit() always
returns 0 here. All it adds is an extra rcu_read_lock() and a node read
lock round trip before tipc_node_build_list().

Runtime behavior doesn't change, because the old tipc_node_xmit() never
delivered named bulk messages over lxc either. This is still true at the
end of the series. The tipc_named_distribute() caller added later also
only passes named_distribute() output.

Could this call be dropped from tipc_node_distribute()? The commit
message says:

    Both functions call the newly introduced tipc_node_build_list(),
    which clones a list of messages in sequence and tipc_node_lxc_xmit()
    which delivers the list to the peer namespace.

The v3 changelog also says "Introduce tipc_node_lxc_xmit() for container
communication", but tipc_node_distribute() never does that delivery.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116063529.6185-1-tung.quang.nguyen%40est.tech
