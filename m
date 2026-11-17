Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940679;
	b=OztmtRmSbpwXK3Me3mMpjlJEZMj4pHmjGQ85hujITXQN1hSi4OVAL7NdK+ASxxes1Ww/
	 vXidJ26DoH/sl4eR6XEQkbLGaVVgORQC9RQ3rfU4bereZG6Zei/FyVb7iPKjbFUjTTZxj
	 GYNyKij2Iz3Zqrp6IyKLtmicyguH0SdcG4N85rRiOhF0S1Q0TlpoLQ/T70zcit0tzs19+
	 UsJAukGLhHU7Kg2EJtSU+KOdb0kC3nOinONEeLqbk0ySkc0aVgoCb2AwwUM7kFtx442/k
	 4Cu0KNQlGk4ZAUosf8rJUI8Qt3xUX/9nC7L3OHiqFG9u2k67ciEMqfSrC+NUn/kOtuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940679;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FqmAVGUAmXYoxgnGBtu3RxmxbxijEqxzhOLaOfBfkLE=;
	b=PQ1oY+/l7af0H9Jd/saQYccY9DhUnPldP8K05spAj/HAmdRABbVWn6Ci9SbTUkmGe+j9
	 5TArCrDMjWK6ka1swNbTujm8wba8QG0k8TqfnA/4Bes66R29tCD6dRbLROr0KAQbKNMNe
	 u3RCVO+bLhbYE4bHtmRA5MpDDtlx0hycAERNuu1JGwuB2grwBiwkyUKQirzQAyHrN1TWb
	 e7P/8aY8B2RtnbP1CmJvtA4qgsqYSEhY9x9ZRNLIJrHoXyBFb8cU12OEFZVX7hfJBMsZV
	 FrFA0TbRTQ11NVGV9TYSIG0ZmQ2rDN9p/UM63ZwTH0FnIkmQ5+QcNAKWTH7JZv93NXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLsXnry2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB01606A884
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLsXnry2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED91A1F000C6;
	Tue, 17 Nov 2026 18:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940679;
	bh=FqmAVGUAmXYoxgnGBtu3RxmxbxijEqxzhOLaOfBfkLE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NLsXnry2dQr/g6p22Ri/OpLrTgAz3h+APNodGzpHg5+zNwIJ1YmOYEfHaW3JDKyB/
	 yfujJbC4UxE+5xPgg2tUfh2PKsC5dfpCUCON2aHiLrcbYQf8pqz2vSRrPs1tgk3VfF
	 gpvLa/K+hOL18I1LMN093XLGjqzEqu1gyFrsc6EWCYkeS83is6XkYMVMay9m5QhUpZ
	 IEF2mnPhzD5pYuig3O+uxRKmNen8rZYtdYdJlyG0Mxpjq2lGL2GwPYYTIIPVUMZmWV
	 SASjP0+WKXI5IWJuC6IlThZ13uvN1iBWKE69vZMhdiDbXrK1BdKlALsqogNpsSaIJB
	 lJEyEYQyG42OA==
Subject: Re: [PATCH net v3 7/7] tipc: fix NULL pointer dereference in
 named_distribute()
From: netdev-bot+sashiko@kernel.org
To: tung.quang.nguyen@est.tech
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, jmaloy@redhat.com, horms@kernel.org,
 tipc-discussion@lists.sourceforge.net,
 syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com, lkp@intel.com
Date: Tue, 17 Nov 2026 18:37:58 +0000
Message-ID: <179494067854.3136.6305701493862898370@kernel.org>
In-Reply-To: <20261116063529.6185-8-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-8-tung.quang.nguyen@est.tech>
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

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] tipc_nametb_insert_self_node_pub() (net/tipc/name_table.c)
  corrupts nt->cluster_scope in its -EEXIST branch.
- [High] tipc_service_insert_publ() (net/tipc/name_table.c) erases and
  kfree()s a service_range that still holds live publications whenever…
- [High] tipc: use-after-free of service_range on -EEXIST in
  tipc_service_insert_publ()
- [Medium] tipc_node_write_unlock() (net/tipc/node.c) no longer resets
  the link when the TIPC_LINK_STATE publication fails with -ENOBUFS.
- [Medium] On the deferred node-timer path, a failed bulk is never
  retried when the peer has more than one link.
- [Low] The -EEXIST check in tipc_net_finalize() (net/tipc/net.c) is dead
  code, because the caller and callee disagree on the contract.
- [Low] The commit message leaves out several behaviour changes and
  slightly misdescribes how the publication reaches other nodes.
- [Low] The commit carries `Reported-by: kernel test robot
  <lkp@intel.com>` and `Closes: https://lore.kernel.org/oe-kbuild-…
- [Low] The kernel-doc for tipc_nametbl_insert() (net/tipc/name_table.c)
  says it returns "Inserted publication - Success" and "-ENOBUFS - No…

--

tipc: fix NULL pointer dereference in named_distribute()

This patch fixes a race in which tipc_named_node_up() can run
named_distribute() before tipc_net_finalize() has published the node's own
TIPC_NODE_STATE binding. In that case the bulk list is empty and NULL gets
dereferenced. The fix adds an nt_self_node_exist flag and inserts the self
publication on demand from the node-up and node-timeout paths; while the
own address is unset, the bulk is deferred to the node timer.
named_distribute() now returns -ENOBUFS on allocation failure, and the
callers reset links to retry.

> Fix the this issue by checking for the node's self-address publication on
> either node-up or node-timeout event. If the publication does not exist, insert
> it into the name table and publish it to the other nodes.

[Severity: Low]
This isn't a bug, but there's a typo: "Fix the this issue".

Is "publish it to the other nodes" accurate?
tipc_nametb_insert_self_node_pub() doesn't broadcast anything. It only
links the publication into nt->cluster_scope, so the publication goes out
inside the per-destination bulk.

The log also leaves out several behaviour changes:

- When the own address is still 0, bulk distribution is now deferred to
  the node keepalive timer through the new per-node dist_bulk flag. This
  can delay binding propagation by up to one keepalive interval (10 s at
  first).

- named_distribute() now purges a partial bulk on allocation failure and
  returns -ENOBUFS. A __tipc_named_distribute() failure now takes every
  bearer to the peer down, in both tipc_node_write_unlock() and
  tipc_node_timeout(). Before, a partial bulk was sent and nothing was
  reset.

- tipc_node_timeout() now takes the node write lock, calls into the name
  distributor and may reset links.

- The -ENOBUFS bearer handling in tipc_node_write_unlock() has changed.

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611022356.UddfVq4D-lkp@intel.com/

[Severity: Low]
Should these two tags be here? The v3 changelog says "Initialize p to NULL
in tipc_net_finalize() to address a warning", and the report ID date
matches the v2 posting. So this looks like a robot report against v2 of
this same patch.

The robot's instructions ask for these tags only when the fix goes in as a
separate commit, not as a new version of the same patch.

> diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
> index 6bb0333f39bf4..5db2183944445 100644
> --- a/net/tipc/name_table.c
> +++ b/net/tipc/name_table.c
> @@ -789,26 +789,34 @@ void tipc_nametbl_build_group(struct net *net, struct tipc_group *grp,
>  	rcu_read_unlock();
>  }
>  
> -/* tipc_nametbl_publish - add service binding to name table
> +/**
> + * tipc_nametbl_insert - insert service binding into name table
> + * @net: network namespace
> + * @ua: the service range is binding to
> + * @sk: address publishing socket
> + * @key: target publication key
> + * @skb: buffer containing the publication
> + * @err: error code
> + *
> + * Return:
> + * * Inserted publication - Success
> + * * -ENOBUFS             - No buffer space is available
> + *
>   */

[Severity: Low]
This isn't a bug, but the Return: section doesn't match the function.
tipc_nametbl_insert() returns struct publication *, and every exit is
"return p;". No path returns -ENOBUFS or ERR_PTR(-ENOBUFS).

The outcomes that can actually happen are:

  non-NULL p, *err = -ENOBUFS (skb allocation in tipc_named_publish() failed)
  NULL, *err = -ENOBUFS (publication allocation failed)
  NULL, *err untouched (local publication limit reached)
  NULL, *err untouched (duplicate, -EEXIST)

The v3 changelog says this comment was corrected. Could it describe these
cases instead?

> -struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,
> -					 struct tipc_socket_addr *sk,
> -					 u32 key, int *err)
> +struct publication *tipc_nametbl_insert(struct net *net, struct tipc_uaddr *ua,
> +					struct tipc_socket_addr *sk, u32 key,
> +					struct sk_buff **skb, int *err)

[ ... ]

> @@ -831,24 +839,91 @@ struct publication *tipc_nametbl_publish(struct net *net, struct tipc_uaddr *ua,

[ ... ]

> +int tipc_nametb_insert_self_node_pub(struct net *net)
> +{
> +	struct name_table *nt = tipc_name_table(net);
> +	struct tipc_net *tn = tipc_net(net);
> +	struct publication *p = NULL;
> +	struct tipc_socket_addr sk;
> +	struct tipc_uaddr ua;
> +	int err = 0;
> +
> +	sk.ref = 0;
> +	sk.node = tn->node_addr;
> +	tipc_uaddr(&ua, TIPC_SERVICE_RANGE, TIPC_CLUSTER_SCOPE,
> +		   TIPC_NODE_STATE, tn->node_addr, tn->node_addr);
> +
> +	p = tipc_nametbl_insert_publ(net, &ua, &sk, tn->node_addr, &err);

[Severity: High]
This new caller relies on the -EEXIST handling in
tipc_service_insert_publ(). That handling was added by the earlier patch in
this series, "tipc: fix missing link-up event on memory allocation
failure". Is it safe?

-EEXIST is only set from inside the walk over sr->all_publ, so the range is
never empty when it is set. The exit path still does this:

net/tipc/name_table.c:tipc_service_insert_publ() {
    ...
exit:
	if (!res) {
		if (err && *err == -EEXIST) {
			rb_erase_augmented(&sr->tree_node, &sc->ranges,
					   &sr_callbacks);
			kfree(sr);
		}
    ...
}

Doesn't this free a service_range that still holds the publication that
caused the -EEXIST, along with any siblings? Their all_publ and local_publ
links would then point into freed memory.

Those publications are also no longer reachable through the rb-tree.
tipc_nametbl_remove_publ(), tipc_publ_purge() and tipc_service_delete()
can't find them, and lookups no longer see the binding.

A cluster peer can reach this too. tipc_named_rcv()->tipc_update_nametbl()
inserts peer-supplied items with &err, so a peer sending the same distr_item
twice would leak publications and drop bindings each time.

> +
> +	if (p) {
> +		list_add_tail(&p->binding_node, &nt->cluster_scope);
> +		return 0;
> +
> +	} else if (err == -EEXIST) {
> +		bool found = false;
> +
> +		list_for_each_entry(p, &nt->cluster_scope, binding_node) {
> +			if (p->sr.type == TIPC_NODE_STATE &&
> +			    p->sr.lower == tn->node_addr &&
> +			    p->sr.upper == tn->node_addr &&
> +			    p->key == tn->node_addr &&
> +			    p->sk.ref == 0 && p->sk.node == tn->node_addr) {
> +				found = true;
> +				break;
> +			}
> +		}
> +
> +		if (!found)
> +			list_add_tail(&p->binding_node, &nt->cluster_scope);
> +		return 0;

[Severity: High]
When tipc_nametbl_insert_publ() returns with err == -EEXIST, this
branch assumes the duplicate publication is still intact in the name
table and goes looking for it on nt->cluster_scope. Is that still true
with the -EEXIST handling added earlier in this series by "tipc: fix
missing link-up event on memory allocation failure"?

tipc_service_insert_publ() only sets -EEXIST after it finds a matching
_p while walking sr->all_publ. So sr is always a pre-existing range
that still holds that publication. The exit path frees it anyway:

	if (!res) {
		if (err && *err == -EEXIST) {
			rb_erase_augmented(&sr->tree_node, &sc->ranges,
					   &sr_callbacks);
			kfree(sr);
		}
		...
	}

That frees sr while _p, and any other publication with the same
lower/upper, is still linked to it through all_publ and local_publ.
Those publications are also no longer reachable from sc->ranges, so
lookups lose the binding. A later tipc_nametbl_remove_publ(),
tipc_publ_purge() or tipc_service_delete() on them would then touch
freed list heads.

This new caller is not the only way in. tipc_nametbl_insert() always
passes its local error to tipc_nametbl_insert_publ(), so a duplicate
local bind through tipc_sk_publish() -> tipc_nametbl_publish() gets
here too. So does a peer that sends the same distr_item twice, via
tipc_named_rcv() -> tipc_update_nametbl().

The range can never be empty on the -EEXIST path. Could the erase be
dropped for -EEXIST, or limited to a range that
tipc_service_create_range() just allocated and that still has an empty
all_publ?

[Severity: High]
Can this corrupt nt->cluster_scope? When nothing matches, the
list_for_each_entry() loop has run to the end. p is then
container_of(&nt->cluster_scope, struct publication, binding_node), not a
real publication, so the call becomes:

    list_add_tail(&nt->cluster_scope, &nt->cluster_scope);

That leaves head->next pointing at the head. Forward walks then see an
empty list, and every existing cluster-scope publication is orphaned. With
CONFIG_DEBUG_LIST or CONFIG_LIST_HARDENED, __list_add_valid() should
complain instead.

There is also no new publication to add on this path:
tipc_nametbl_insert_publ() has already freed the one it allocated.

The function still returns 0, so __tipc_named_distribute() sets the flag:

	if (!tn->nt_self_node_exist) {
		if (tipc_nametb_insert_self_node_pub(net))
			return -ENOBUFS;

		tn->nt_self_node_exist = true;
	}

named_distribute() then walks what looks like an empty cluster_scope, skb
stays NULL, and this line, which still has no guard, dereferences NULL:

	hdr = buf_msg(skb_peek_tail(list));

Wouldn't that bring back the same syzbot crash this patch is meant to fix,
with the flag set so the state never gets repaired?

The !found case seems reachable because the -EEXIST test in
tipc_service_insert_publ() is broader than the match above:

	if (_p->key == key && _p->sk.ref == p->sk.ref &&
	    (!_p->sk.node || _p->sk.node == node)) {

Here is one way to get there:

1. Our own address is still 0.

2. A peer whose address equals our future trial address sends its own
   TIPC_NODE_STATE [Y,Y] publication.

3. tipc_net_finalize() doesn't set the flag. Either tipc_publ_create()
   fails under GFP_ATOMIC, or the -EEXIST check in tipc_net_finalize()
   never fires (see below).

The next node-up or node-timeout distribution then takes this branch.

> +	}
>  
> +	return -ENOBUFS;
>  }

[ ... ]

> diff --git a/net/tipc/net.c b/net/tipc/net.c
> index 82f6d2f6ab892..2114c5ef09a90 100644
> --- a/net/tipc/net.c
> +++ b/net/tipc/net.c

[ ... ]

> @@ -139,7 +143,17 @@ static void tipc_net_finalize(struct net *net, u32 addr)
>  	tipc_named_reinit(net);
>  	tipc_sk_reinit(net);
>  	tipc_mon_reinit_self(net);
> -	tipc_nametbl_publish(net, &ua, &sk, addr, &err);
> +	spin_lock_bh(&tn->nametbl_lock);
> +	if (!tn->nt_self_node_exist)
> +		p = tipc_nametbl_insert(net, &ua, &sk, addr, &skb, &err);
> +
> +	if (p || err == -EEXIST)
> +		tn->nt_self_node_exist = true;

[Severity: Low]
Can err ever be -EEXIST here? tipc_nametbl_insert() passes its own local
error to tipc_nametbl_insert_publ(), and the only value it copies back is
-ENOBUFS:

	} else if ((error == -ENOBUFS) && err) {
		*err = -ENOBUFS;
	}

So if this insert hits a duplicate, nt_self_node_exist stays false. The next
node-up or node-timeout then reaches the -EEXIST branch of
tipc_nametb_insert_self_node_pub() discussed above.

For now the range erase on -EEXIST in tipc_service_insert_publ() hides
this, because the second insert lands in a fresh range. Once that erase is
fixed, this path leads into the cluster_scope corruption.

> +	rc_dests = nt->rc_dests;
> +	spin_unlock_bh(&tn->nametbl_lock);

[ ... ]

> diff --git a/net/tipc/node.c b/net/tipc/node.c
> index 77979a850df24..496ef262f315b 100644
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c

[ ... ]

> @@ -438,17 +442,46 @@ static void tipc_node_write_unlock(struct tipc_node *n)

[ ... ]

>  	if (err == -ENOBUFS) {
> -		if (rc == -ENOBUFS && bearer == bearer_id)
> +		/* link has been down already */
> +		if (bearer == bearer_id)
>  			return;
>  
>  		tipc_node_link_down(n, bearer_id, false);
>  	}
>  }

[Severity: Medium]
Without the rc == -ENOBUFS check, is the comment still right?
tipc_node_build_list() sets the bearer whether or not the send succeeds:

	*bearer_id = n->active_links[selector & 1];

So after a successful tipc_named_node_up(), bearer is no longer -1.

On the first link to a peer, __tipc_node_link_up() sets both
TIPC_NOTIFY_LINK_UP and TIPC_NOTIFY_NODE_UP. n->link_id carries that local
bearer in its low 16 bits, and the same bearer is in active_links[0].

Say the bulk goes out fine (rc == 0, or -ELINKCONG mapped to 0), but
tipc_nametbl_publish() for TIPC_LINK_STATE fails with -ENOBUFS. Then this
returns without calling tipc_node_link_down().

Doesn't that undo the retry added by the earlier series patch "tipc: fix
missing link-up event on memory allocation failure"? TIPC_LINK_STATE
subscribers would never see the link-up event.

[ ... ]

> @@ -850,13 +887,33 @@ static void tipc_node_timeout(struct timer_list *t)
>  #endif
>  	__skb_queue_head_init(&xmitq);
>  
> +	tipc_node_write_lock(n);
>  	/* Initial node interval to value larger (10 seconds), then it will be
>  	 * recalculated with link lowest tolerance
>  	 */
> -	tipc_node_read_lock(n);
>  	n->keepalive_intv = 10000;
> -	tipc_node_read_unlock(n);
> +	remains = n->link_cnt;
> +	if (n->dist_bulk) {
> +		dist_bulk = true;
> +		n->dist_bulk = false;
> +	}
> +	tipc_node_write_unlock_fast(n);
> +	if (dist_bulk)
> +		dist_rc = tipc_named_distribute(n->net, n->addr, &bearer);
> +
>  	for (bearer_id = 0; remains && (bearer_id < MAX_BEARERS); bearer_id++) {
> +		/* 1. tipc_named_distribute() calls tipc_node_distribute() and
> +		 *    tipc_node_distribute() returns -ENOBUFS.
> +		 * 2. tipc_named_distribute() calls __tipc_named_distribute()
> +		 *    and __tipc_named_distribute() returns -ENOBUFS.
> +		 */
> +		if (dist_rc == -ENOBUFS &&
> +		    (bearer == -1 || bearer == bearer_id)) {
> +			rc = TIPC_LINK_DOWN_EVT;
> +			goto link_down;
> +		}

[Severity: Medium]
What happens if the peer has more than one link when the deferred bulk
fails? Suppose tipc_node_distribute() returns -ENOBUFS, for example from a
SYSTEM-importance backlog overflow or a failed skb_clone() in
tipc_link_xmit(). Then bearer holds active_links[0], and only that bearer
is taken down. n->dist_bulk was cleared above and is never set again.

This timer can fire up to one keepalive interval after node-up, so a second
link may be up by then. Taking one link down only triggers failover. The
node stays up, so no new TIPC_NOTIFY_NODE_UP runs tipc_named_node_up(), and
nothing sets dist_bulk again.

Would the peer then never receive the bulk carrying last_bulk? Its
bc_entry.named_open in tipc_named_dequeue() would stay false, and later
non-bulk publications from this node would be held indefinitely.

The __tipc_named_distribute() failure case takes all bearers down to
"Force the node down to retry distribution". This path doesn't.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116063529.6185-1-tung.quang.nguyen%40est.tech
