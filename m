Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940676;
	b=gerOoGUtuVGownc908iH511oKhP1T77iaNO2+xSBZkAouYNFWUIOSbu25+NzqFLkVG2j
	 yF/YIZaeDEx+6Y9JcgfDvkp2x3FYo9BTNxfZtMqpr1ejgQqfSx3tIQaFxQXD1a43o3lbK
	 I86TXGeXzg6zWw57cYwh5MxkQPoKXRKVOa+h1UhL8HLKr4pPB2gLeYKdKHIg6UmqjlQSd
	 tJ/ptHpHgDuv08q/v3xIjoQtyNEPbLQ1dbyvV+1m3HEwmgnnXqeF0JXH+jjBFTa4e82N8
	 /rT8um+mrFNiW1RdEui6BXXI5qd9w73cOW6ReCLrjjrUDNHeADGtba7uXjrFjUWDr0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940676;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TSYJayqFjuHEEWb2vq3BKF/+h/T6t10DspFxLkZbLnI=;
	b=3RrUUg5r3xtqG3rbVOXF0C8WmKUX9ozIi2dpzw1pJ8Xm+39d/D3XuheZVklUv7ZXdd1A
	 FsMeni0AxqH8S8psp2P2AWc4OKQMZiUPZNOaLc3no203Ykf1euwXTUkAeydFU6sV6tSfw
	 no7enx39eoWmLDh56U4tEIfzzbRvceV/lq3DaCY2uH05wOFJwEzaREkt0GTE3Ar3KDDX1
	 8HzGJOj1l88SK31tEGKe37cI9za09wvHlQ6JrPDY5+cYilGrASa7FE2aort5zdyS+UlcL
	 1dpTmzzpZkDF1hqxJ4L1l3UbQ0QCQG/SYlDKpfhQWR/l3mgwY/hS63nUk9NtkcbjTvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPcd9Pmr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980F606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPcd9Pmr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C961F000C4;
	Tue, 17 Nov 2026 18:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940676;
	bh=TSYJayqFjuHEEWb2vq3BKF/+h/T6t10DspFxLkZbLnI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XPcd9PmriZ2S3kMYAx0Suechn5sl7fTYHqdVWysAJogO/IqUzv3HZKOmcs4Hbnq/B
	 +nHCqQSCV4jZx8N0Pdn9/HM8mPe5eevS0oFfjx2lWFaVzpMDNoK15V0mIB8HjV7j+M
	 nuJCOurnYAxFjzDWdjuHlf7CGqcq0UBscFOw2O9Rj4fm//z8CLgL0pYupPV4P/OYOd
	 qR8uOZcjxX/M4YfDHvq4gBKb3UiBVd9aE1vq/xKdFn3eVm9uaBuebKXmmUG/AgqNEV
	 pf7U5Y7MM+RCcXFd0jIzrquxMozuFAyo2xfPjEGZq3QzViqc1FRhVGzCtyy51MDJ+f
	 NmBDaDCVQdskA==
Subject: Re: [PATCH net v3 4/7] tipc: fix missing link-up event on memory
 allocation failure
From: netdev-bot+sashiko@kernel.org
To: tung.quang.nguyen@est.tech
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, jmaloy@redhat.com, horms@kernel.org,
 tipc-discussion@lists.sourceforge.net,
 syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com, lkp@intel.com
Date: Tue, 17 Nov 2026 18:37:54 +0000
Message-ID: <179494067499.3136.17991206184972687844@kernel.org>
In-Reply-To: <20261116063529.6185-5-tung.quang.nguyen@est.tech>
References: <20261116063529.6185-5-tung.quang.nguyen@est.tech>
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

Critical: 2 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The new duplicate (-EEXIST) error path in
  tipc_service_insert_publ() (net/tipc/name_table.c) erases and kfree()s…
- [Critical] The fault introduced by the -EEXIST free in
  tipc_service_insert_publ() leads to a remotely triggerable infinite…
- [Medium] In tipc_rcv() (net/tipc/node.c), the new code after
  tipc_node_write_unlock() takes the node read lock again and purges…
- [Medium] The commit message describes only plumbing an error code out
  of tipc_nametbl_publish() and resetting the link on -ENOBUFS.
- [Low] tipc_node_write_unlock() (net/tipc/node.c) reads bearer_id =
  n->link_id & 0xffff while holding n->lock, then calls…

--

tipc: fix missing link-up event on memory allocation failure

This patch adds an int *err output parameter so tipc_nametbl_insert_publ()
and tipc_nametbl_publish() can report errors. If the TIPC_LINK_STATE
publication fails with -ENOBUFS in tipc_node_write_unlock(), the link is
reset so the publication can be retried. It also adds cleanup of the
service range and service on failure, and an xmitq purge in tipc_rcv().

> Fix this issue by checking the error code returned through the
> output parameter of tipc_nametbl_publish(). If the error indicates
> a memory allocation failure, reset the link so that the
> TIPC_LINK_STATE publication can be retried.

[ ... ]

> v3:
> - Free sr in tipc_service_insert_publ() on memory allocation failure.
> - Free sc in tipc_service_find() on memory allocation failure.
> - Purge xmitq in tipc_rcv() in case tipc_node_write_unlock() resets a bearer.

[Severity: Medium]
The commit message only describes passing the error code out of
tipc_nametbl_publish() and resetting the link on -ENOBUFS. The patch
also:

- adds an xmitq purge in the tipc_rcv() slow path
- tears down a newly created tipc_service (hlist_del_init_rcu() plus
  kfree_rcu()) in tipc_nametbl_insert_publ()
- adds -EEXIST handling in tipc_service_insert_publ() that frees sr
- changes the pr_err() in tipc_nametbl_remove_publ() to
  pr_warn_ratelimited() with different text, and ratelimits the bind
  failure warning
- makes tipc_nametbl_publish() report -ENOBUFS but still return the
  inserted publication when the cluster-scope distribution skb can't be
  allocated

These changes are only mentioned in the v3 notes below the --- line,
and those notes are not kept in git history.

The notes also don't seem to match the code. The sc teardown is in
tipc_nametbl_insert_publ(), not tipc_service_find(). The sr free happens
on -EEXIST, when sr is live, rather than on allocation failure, when sr
is NULL.

Could the commit message describe these changes?

> diff --git a/net/tipc/name_table.c b/net/tipc/name_table.c
> index 73b032ba2f8d0..e8b768699ab93 100644
> --- a/net/tipc/name_table.c
> +++ b/net/tipc/name_table.c

[ ... ]

> @@ -353,6 +356,9 @@ static bool tipc_service_insert_publ(struct net *net,
>  			pr_debug("Failed to bind duplicate %u,%u,%u/%u:%u/%u\n",
>  				 p->sr.type, p->sr.lower, p->sr.upper,
>  				 node, p->sk.ref, key);
> +			if (err)
> +				*err = -EEXIST;
> +
>  			goto exit;
>  		}
>  	}
> @@ -368,9 +374,15 @@ static bool tipc_service_insert_publ(struct net *net,
>  	}
>  	res = true;
>  exit:
> -	if (!res)
> -		pr_warn("Failed to bind to %u,%u,%u\n",
> -			p->sr.type, p->sr.lower, p->sr.upper);
> +	if (!res) {
> +		if (err && *err == -EEXIST) {
> +			rb_erase_augmented(&sr->tree_node, &sc->ranges,
> +					   &sr_callbacks);
> +			kfree(sr);
> +		}

[Severity: Critical]
Can this free a live service_range that still holds publications?

-EEXIST is only set after a matching _p is found in sr->all_publ, so sr
is not empty at this point. Also, tipc_service_create_range() returns the
existing range when lower and upper match exactly:

	if (lower == sr->lower && upper == sr->upper)
		return sr;

So a freshly allocated sr, whose all_publ is empty, never reaches this
branch.

When it triggers, every binding in the range silently disappears from
the name table, and subscribers get no TIPC_WITHDRAWN event.

The orphaned publications still have all_publ and local_publ pointing
into the freed sr. Later withdrawals fail in tipc_service_find_range(),
so the publications leak, and nt->local_publ_count is never decremented
for local ones.

A remote peer can reach this, because tipc_update_nametbl() now passes a
non-NULL &err:

tipc_named_rcv()
  tipc_update_nametbl()
    tipc_nametbl_insert_publ(net, &ua, &sk, key, &err)
      tipc_service_insert_publ()

One bulk or legacy NAME_DISTRIBUTOR message carrying two identical
PUBLICATION items looks sufficient, since those messages bypass the
seqno filter in tipc_named_dequeue(). The peer could then re-publish the
range and become its only destination.

The v3 note says sr is freed "on memory allocation failure", but on
-ENOBUFS sr is NULL and there is nothing to free. Is this block needed
at all?

The problem seems to remain at the end of the series. The later commit
"tipc: fix NULL pointer dereference in named_distribute()" treats
-EEXIST from tipc_nametbl_insert_publ() as an expected result for the
self-node publication, and that result goes through this same path.

[Severity: Critical]
Following on from the above, can this also cause an infinite loop in
tipc_publ_notify()?

Suppose a peer sends the same item X three times. All three can be in a
single bulk message:

1. X is inserted as p_old, and tipc_node_subscribe() adds p_old to
   n->publ_list.
2. The second X hits -EEXIST and sr is freed. p_old is orphaned but
   stays on n->publ_list.
3. The third X gets a fresh, empty sr2 from tipc_service_create_range()
   and passes the duplicate check. It is inserted as p2, which lands
   right after p_old on n->publ_list.

Before this patch the third insert was rejected, so p_old and p2 could
not exist at the same time.

When the peer then brings the node down:

tipc_node_write_unlock()
  tipc_publ_notify()
    /* publ = p_old, tmp = p2 */
    list_for_each_entry_safe(publ, tmp, nsub_list, binding_node)
      tipc_publ_purge(net, p_old, addr)
        tipc_nametbl_remove_publ()  /* returns p2, not p_old */
        tipc_node_unsubscribe()     /* list_del_init(&p2->binding_node) */
        kfree_rcu(p2, rcu)

On the next iteration publ is p2. Because p2->binding_node was
list_del_init()'d, list_next_entry(p2) is p2 itself, so the loop never
gets back to the list head.

If this runs from tipc_rcv() or tipc_node_timeout() in softirq, the CPU
livelocks.

On preemptible RCU kernels, it can also run from process context, for
example bearer disable via netlink -> tipc_node_link_down() ->
tipc_node_write_unlock(). There the grace period could end while the
loop is still dereferencing p2, which would be a use-after-free.

The address validation added later in the series doesn't seem to block
this, because the peer uses its own valid node address.

[ ... ]

> diff --git a/net/tipc/node.c b/net/tipc/node.c
> index d84b0274fefc4..870f84e2fb1c4 100644
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c

[ ... ]

> @@ -429,12 +430,15 @@ static void tipc_node_write_unlock(struct tipc_node *n)
>  
>  	if (flags & TIPC_NOTIFY_LINK_UP) {
>  		tipc_mon_peer_up(net, node, bearer_id);
> -		tipc_nametbl_publish(net, &ua, &sk, sk.ref);
> +		tipc_nametbl_publish(net, &ua, &sk, sk.ref, &err);
>  	}
>  	if (flags & TIPC_NOTIFY_LINK_DOWN) {
>  		tipc_mon_peer_down(net, node, bearer_id);
>  		tipc_nametbl_withdraw(net, &ua, &sk, sk.ref);
>  	}
> +
> +	if (err == -ENOBUFS)
> +		tipc_node_link_down(n, bearer_id, false);

[Severity: Low]
Does bearer_id still refer to the same link instance at this point?

bearer_id was read from n->link_id while n->lock was held, but the lock
is dropped before tipc_nametbl_publish() runs.

In that window, tipc_node_timeout(), a parallel tipc_rcv() or a bearer
reset could take the link down and bring it back up with a new session.
That new link-up's own LINK_STATE publication may succeed.

tipc_node_link_down() only checks that a link exists on the bearer:

	le = &n->links[bearer_id];
	l = le->link;
	if (!l) {
		tipc_node_write_unlock_fast(n);
		return;
	}

So this could reset the healthy, re-established link, or defuse its
pending link-up, and send TIPC_LINK_STATE subscribers a spurious
down/up. Should the reset be tied to the link instance whose publication
failed?

[ ... ]

> @@ -2193,6 +2197,16 @@ void tipc_rcv(struct net *net, struct sk_buff *skb, struct tipc_bearer *b)
>  			}
>  		}
>  		tipc_node_write_unlock(n);
> +
> +		/* tipc_node_link_down() was called in
> +		 * tipc_node_write_unlock().
> +		 */
> +		tipc_node_read_lock(n);
> +		le = &n->links[bearer_id];
> +		if (le->link && !tipc_link_is_up(le->link) &&
> +		    !skb_queue_empty(&xmitq))
> +			__skb_queue_purge(&xmitq);
> +		tipc_node_read_unlock(n);

[Severity: Medium]
Is this purge limited to the case where tipc_node_write_unlock()
actually reset the link?

tipc_node_write_unlock() returns void, so the condition here only checks
the current link state.

This slow path runs whenever n->state != SELF_UP_PEER_UP or
usr == TUNNEL_PROTOCOL. That covers establishment, failover and synch,
when the link is often legitimately not up.

For example, tipc_link_proto_rcv() returns TIPC_LINK_UP_EVT while the
link is still establishing:

	/* ACTIVATE_MSG takes up link if it was already locally reset */
	if (mtyp == ACTIVATE_MSG && l->state == LINK_ESTABLISHING)
		rc = TIPC_LINK_UP_EVT;

The link only becomes up later, in tipc_node_link_up(), which runs after
this purge.

Could this drop messages that tipc_node_check_state() or
tipc_node_bc_sync_rcv() queued earlier on this path? One example is the
RESET_MSG that __tipc_node_link_down() builds for a parallel link when a
FAILOVER_MSG arrives on a link that is still establishing.

Another CPU could also change the link state between the write unlock
and the read lock, for example on a link timeout or bearer reset.

tipc_link_is_up() also reads l->state under only the node read lock,
while fast-path receivers on other CPUs modify it under the read lock
plus le->lock.

>  	}
>  
>  	if (unlikely(rc & TIPC_LINK_UP_EVT))

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116063529.6185-1-tung.quang.nguyen%40est.tech
