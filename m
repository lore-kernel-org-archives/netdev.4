Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940677;
	b=ABgXTxAa5hDu3dGqlK1Uv1/NQSnctOvUVtuJcpedbsdiFZXifzZGfkepb31oHq2Xe8cr
	 avputvaDXoK71JPNTrf/G7D0q9n3kAYkrYbIXuK938J+JWiP3RuJ19JPDCYI5oh/xjj4X
	 YGp1u7eAN9s4cH2zjcpJwlb7QdRowrL1bUN61ChTyv+Pk8UQLPdceZMF4ptTSBejT/GSE
	 RZEYpoc57hZD1hjnp1wtMgBcPoLH5z1+XlxQ0pEN9QeoZX88lxqB9izweRrbapIsPR5k7
	 orlp2jrSKdAQxdNpZHIVXYOyh8B0s9/6j54soeX4nVcIOnNKeBsc2HzAwIAFISASIcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940677;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HS/rVs0O7LE+BkNUxTstJQy2yrEb12UXlOn4mUIxDSA=;
	b=oaGfei6fXsrPTLazn8sBECrkk1x3EWgw2dT+GtVq8uOqbU4r/YUjyTv2wKocmwaDTVuz
	 Xag/8xfYbxQdMWWJF2t5in6CE+oS3xJn73P36NOMTVpCQntR3iDgAIwovUAHGSHmKOhdh
	 Lq+BoDgln1yyBhWLEfRqMbIEGh2QMMn0NLWRdSSheKUigLauakkL4+tj8D1LY8YjuUSiG
	 07HqmSfzfN6A1gYv/ZgnwLMXljVuHafHuv6BIl6eXReZEGtiMb8RRlRywMr/aNcvPhHRO
	 /uo3ur6YzQcgNntzNwRfnlrG6CdSlDNii19PiVYOkSIX/Yo9Y6zsPO42j5+Yn78aN2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKznYMIV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63A606A330
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HKznYMIV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841DC1F000C8;
	Tue, 17 Nov 2026 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940677;
	bh=HS/rVs0O7LE+BkNUxTstJQy2yrEb12UXlOn4mUIxDSA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HKznYMIVz/zfAbPqRGb9P8oElno9j4bNOo7XObT3u3T5OabqTRb4wMP0KDgjQ2Q2I
	 q3GAsxR8+ttNMYK3i+YWwk21jvIKagr44BvwaJHbTe14HZUXHBt+dLp7R4/5n2Ju3E
	 Sx7yGdh5pixTWhvfL1NS4wFSwm5m3qEUur7O1+0lMIRcZHjfd656/sFdwJkanZJu2f
	 wCxZLDPQfbc75yDHI55N+bhdx3yXo+SZx0VLDjScl2AHt2NrEMNXsgztSmpE7xV7xM
	 sESmfR9NGgWRxPm4BLqdU1FBDs6KB4uQR53wVHbb+R+gjVw+0uDlu08xocBeQyq7ar
	 QCIED2oKb8neQ==
Subject: Re: [PATCH net v3 5/7] tipc: validate original address of received
 skb in tipc_named_rcv()
From: netdev-bot+sashiko@kernel.org
To: tung.quang.nguyen@est.tech
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, jmaloy@redhat.com, horms@kernel.org,
 tipc-discussion@lists.sourceforge.net,
 syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com, lkp@intel.com
Date: Tue, 17 Nov 2026 18:37:56 +0000
Message-ID: <179494067612.3136.6822690964741396713@kernel.org>
In-Reply-To: <20261116063529.6185-6-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-6-tung.quang.nguyen@est.tech>
X-sashiko-severity: Critical
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

Critical: 1 · High: 1 (1) · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] Both bug classes the commit says it fixes are still
  reachable from a remote peer: publications that are never removed, and…
- [High] Check-then-act race in the new validation.
- [Medium] The fix for this case is right, but the commit message
  describes the wrong mechanism and understates the impact.
- [Medium] The new check in tipc_named_rcv() only verifies that
  msg_orignode(hdr) is some non-preliminary remote node in node_htable.
- [Low] The kernel-doc for the newly exported tipc_node_find_remote()
  (node.c:660-669, prototype at node.h:106) does not describe the real…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  tipc_publ_notify() walks n->publ_list with list_for_each_entry_safe()…

--

tipc: validate original address of received skb in tipc_named_rcv()

This patch makes tipc_named_rcv() reject name distributor messages whose
original node address is the local node, zero, or not in the node table.
The lookup is moved into a new helper, tipc_node_find_remote().
tipc_node_subscribe() and tipc_node_unsubscribe() now use that helper too.

> 2. A remote peer can send a withdrawal message whose original address
>    is equal to the local node's address or is unknown. Upon receiving
>    this message, the local node can follow this execution path:
>
>    tipc_named_rcv()
>     tipc_update_nametbl()
>      tipc_nametbl_remove_publ()
>       tipc_node_unsubscribe()
>        return NULL;
>       kfree_rcu(p, rcu);
>
>    As a result, the publication is freed, but p->binding_node remains
>    linked to the local node's publ_list. Subsequent traversal of this
>    list will access freed memory.

[Severity: Medium]
Is this the right mechanism? The local node has no publ_list. The comment
in name_table.h says remote publications live on node->publ_list. Local
ones live on name_table->node_scope or cluster_scope.

In the own-address case, the withdrawal can match one of our own
cluster-scope bindings. publ_to_item() sends the type, lower, upper, port
and key of those bindings to every peer:

tipc_named_rcv()
  tipc_update_nametbl()
    tipc_nametbl_remove_publ()    <- matches local p (sk.node == own)
    tipc_node_unsubscribe()       <- returns early due to in_own_node()
    kfree_rcu(p, rcu)

When p is freed, p->binding_sock is still on tsk->publications (added in
tipc_sk_publish()). p->binding_node is still on nt->cluster_scope. Later
walks would then read freed memory:

  tipc_sk_withdraw()
  named_distribute(), via tipc_named_node_up()
  tipc_named_reinit()

So any cluster peer seems able to cause a use-after-free of local socket
bindings. Could the commit message say so, and name the lists that are
actually left pointing at freed memory?

In the unknown-address case, such a publication can only exist through
scenario 1, where tipc_node_subscribe() failed. Its binding_node was only
initialized by tipc_publ_create(), so freeing it leaves nothing dangling.
Is the unknown-address part of scenario 2 accurate?

> diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
> index 3ea5e900cb454..1fe650a95eb42 100644
> --- a/net/tipc/name_distr.c
> +++ b/net/tipc/name_distr.c
> @@ -378,18 +378,26 @@ void tipc_named_rcv(struct net *net, struct sk_buff_head *namedq,

[ ... ]

>  	spin_lock_bh(&tn->nametbl_lock);
>  	while ((skb = tipc_named_dequeue(namedq, rcv_nxt, open))) {
>  		hdr = buf_msg(skb);
>  		node = msg_orignode(hdr);
> +		n = tipc_node_find_remote(net, node);

[Severity: Medium]
This check accepts any remote, non-preliminary node in the node hash table.
Should it also check that orignode is the peer that actually sent the
message?

tipc_rcv() and tipc_node_bc_rcv() only call tipc_named_rcv() on
n->bc_entry.namedq of the sending node. There, n was found through
msg_prevnode(). Only the queue is passed down, though:

net/tipc/node.c:tipc_rcv() {
    ...
		tipc_named_rcv(net, &n->bc_entry.namedq,
			       &n->bc_entry.named_rcv_nxt,
			       &n->bc_entry.named_open);
    ...
}

Valid name distributor messages always carry orignode equal to the
sender, because named_prepare_buf() calls tipc_msg_init() with our own
address.

With this patch, peer B can still send PUBLICATION items with orignode set
to another live peer A. They are linked onto A's publ_list and stay there
until A goes down. B can also send WITHDRAWAL items that remove A's real
bindings from the name table.

Would rejecting msg_orignode(hdr) != n->addr fit better here? That would
also cover the own-address and unknown-address cases this patch targets.

[Severity: Critical]
Can a node that is down but still hashed pass this check?

When peer Y loses contact, node_lost_contact() sets TIPC_NOTIFY_NODE_DOWN.
tipc_node_write_unlock() then drains Y->publ_list:

net/tipc/node.c:tipc_node_write_unlock() {
    ...
	if (flags & TIPC_NOTIFY_NODE_DOWN)
		tipc_publ_notify(net, publ_list, node, n->capabilities);
    ...
}

Y stays in node_htable until tipc_node_cleanup() deletes it, which happens
after NODE_CLEANUP_AFTER (300000 ms). tipc_node_find() ignores node state,
so tipc_node_find_remote(Y) keeps succeeding during that window.

Suppose a malicious peer X sends a PUBLICATION with orignode = Y in that
window:

tipc_named_rcv()
  tipc_node_find_remote(Y)       <- succeeds
  tipc_update_nametbl()
    tipc_nametbl_insert_publ()
    tipc_node_subscribe()
      list_add_tail(&p->binding_node, &Y->publ_list)

Y->publ_list has already been drained and is never walked again. Then:

tipc_node_timeout()
  tipc_node_cleanup()
    tipc_node_clear_links()
    tipc_node_delete_from_list()  <- Y is eventually freed

publ_list is never drained before Y is freed. p stays in the name table
permanently, and p->binding_node points into the freed node.

Later a node with address Y is created again, for example after Y reboots.
X then sends a matching WITHDRAWAL with orignode = Y:

tipc_named_rcv()
  tipc_node_find_remote(Y)       <- succeeds on the new node
  tipc_update_nametbl()
    tipc_nametbl_remove_publ()   <- returns the stale p
    tipc_node_unsubscribe()
      list_del_init(subscr)      <- writes into the freed old tipc_node

Doesn't this mean both problems from the commit message are still
reachable by a remote peer: a publication that is never removed, and a
list operation on freed memory?

A presence check alone doesn't seem to close this. Would either of these
work?

  - require orignode == n->addr, with n up
  - drain publ_list in tipc_node_cleanup() or tipc_node_free()

Later patches in the series don't seem to change tipc_named_rcv(),
tipc_node_find_remote() or tipc_node_cleanup() in this respect.

> +		if (!n)
> +			goto free_skb;
> +		else
> +			tipc_node_put(n);

[Severity: High]
The reference is dropped right after the check.
tipc_node_subscribe() and tipc_node_unsubscribe() later do a separate
lookup. Can the node be removed between the two lookups?

Only tn->nametbl_lock is held across both. tipc_node_cleanup() runs from
the node timer on another CPU and takes only node_list_lock and n->lock
before tipc_node_delete_from_list() calls hlist_del_rcu():

CPU A                               CPU B
tipc_named_rcv()
  tipc_node_find_remote(Y) ok
  tipc_node_put(n)
                                    tipc_node_timeout()
                                      tipc_node_cleanup()
                                        tipc_node_delete_from_list(Y)
  tipc_update_nametbl()
    tipc_node_subscribe() or
    tipc_node_unsubscribe()
      tipc_node_find_remote(Y) fails

For a PUBLICATION, the insert has already succeeded. p is left in the name
table on no publ_list, which is scenario 1 again.

For a WITHDRAWAL, tipc_node_unsubscribe() fails silently and
tipc_update_nametbl() frees p anyway:

		p = tipc_nametbl_remove_publ(net, &ua, &sk, key);
		if (p) {
			tipc_node_unsubscribe(net, &p->binding_node, node);
			kfree_rcu(p, rcu);

p->binding_node is still on the old node's publ_list at that point, which
is scenario 2.

tipc_node_cleanup() only removes a node that has been down for
NODE_CLEANUP_AFTER, so this needs the spoofed orignode described above.
Would holding the validated node, and its liveness, from the check through
subscribe/unsubscribe close this?

[ ... ]

> diff --git a/net/tipc/node.c b/net/tipc/node.c
> index 870f84e2fb1c4..dfbeed21dbc1b 100644
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c
> @@ -657,16 +657,37 @@ void tipc_node_stop(struct net *net)
>  	spin_unlock_bh(&tn->node_list_lock);
>  }
>  
> -void tipc_node_subscribe(struct net *net, struct list_head *subscr, u32 addr)
> +/**
> + * tipc_node_find_remote - Find a node associated with an address
> + * @net: the associated network namespace
> + * @addr: node's address
> + *
> + * Return:
> + * * Found node - Success
> + * * NULL       - Invalid node's address
> + *
> + */
> +struct tipc_node *tipc_node_find_remote(struct net *net, u32 addr)
>  {
>  	struct tipc_node *n;
>  
>  	if (in_own_node(net, addr))
> -		return;
> +		return NULL;
>  
>  	n = tipc_node_find(net, addr);
> +	if (!n)
> +		return NULL;
> +
> +	return n;
> +}

[Severity: Low]
This isn't a bug, but the kernel-doc for this newly exported helper doesn't
say that the returned node holds a reference. tipc_node_find() takes it
with kref_get_unless_zero(), and the caller has to drop it with
tipc_node_put().

NULL also covers more than an invalid address:

  - own or zero address (in_own_node())
  - unknown address
  - preliminary node
  - node whose kref already reached zero

Could the Return section list these cases?

Also, this sequence is redundant:

	if (!n)
		return NULL;

	return n;

The function could just return tipc_node_find(net, addr).

[ ... ]

> @@ -679,12 +700,9 @@ void tipc_node_unsubscribe(struct net *net, struct list_head *subscr, u32 addr)
>  {
>  	struct tipc_node *n;
>  
> -	if (in_own_node(net, addr))
> -		return;
> -
> -	n = tipc_node_find(net, addr);
> +	n = tipc_node_find_remote(net, addr);
>  	if (!n) {
> -		pr_warn("Node unsubscribe rejected, unknown node 0x%x\n", addr);
> +		pr_warn("Node unsubscribe rejected, invalid node 0x%x\n", addr);
>  		return;
>  	}
>  	tipc_node_write_lock(n);

[Severity: High]
This is a pre-existing issue, not introduced by this patch. Does
tipc_publ_notify() walk n->publ_list without any lock that serializes it
against this list_del_init()?

tipc_node_write_unlock() drops n->lock before calling
tipc_publ_notify(net, publ_list, ...). tipc_publ_notify() then iterates
without n->lock:

net/tipc/name_distr.c:tipc_publ_notify() {
    ...
	list_for_each_entry_safe(publ, tmp, nsub_list, binding_node)
		tipc_publ_purge(net, publ, addr);
    ...
}

tipc_publ_purge() only takes nametbl_lock for each entry. Meanwhile,
tipc_named_rcv() on another CPU holds nametbl_lock and takes n->lock in
tipc_node_unsubscribe() to run list_del_init(subscr).

The new check still accepts orignode equal to a node that is going down.
Such messages can be Y's own messages that were already queued, or a peer
spoofing orignode = Y.

Suppose a concurrent WITHDRAWAL removes the entry saved in tmp:

  - list_del_init() makes tmp->binding_node point to itself
  - tmp is passed to kfree_rcu()
  - list_next_entry(tmp) == tmp on the next step
  - tipc_publ_purge() finds nothing to remove

The loop then never ends, which hangs the CPU in softirq context.

The walk can also run in process context, for example on bearer disable:

tipc_node_delete_links()
  tipc_node_link_down()
    tipc_node_write_unlock()
      tipc_publ_notify()

There, an RCU grace period can complete between iterations, so tmp could
be read after it has been freed.

A concurrent list_add_tail() could also be missed by the walk, which would
leave that publication unpurged.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116063529.6185-1-tung.quang.nguyen%40est.tech
