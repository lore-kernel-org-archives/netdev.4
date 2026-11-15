Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784660;
	b=TcYGUNVyfpGyK7XtvTQJb6hlii2pQSW4oA3OhlO7tPkUV6t+FYHOFDGVt+rRamnN89WW
	 0RJLHlKbsTkBp/IQCxzK001CMCLMjf18k4F9pS29JO9+VB1hheGxdvB2kB/QXKng7TMPm
	 mbeJMXY5Xe5EU31n9sCDdlEeUK6rHivv818y7wMFOOvnfpjqAdabWNiQRdEzktg/UswQT
	 GWsgyjNrBIxgUjgYchJcHUy9DoPJ4FbsQzbStF9cGOO3+689ehcMXJ2XPt6uymkYnk1sn
	 47WVxSQWlDsznH50QGOZ24oYXv22dsLErUMdGUdHpd6x1z0tngPPOE+nhGf+VBiBKtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784660;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kMbsRKqO2VA5pQx+7MAqgMbABgjbZ/XetoctG1EERzw=;
	b=LrjWOuDBZ7q/EdGh3xf0bLrrb8DVE5rDolfrx6V0ysy9N5MxaW9O8H+/ksjfltXOgPzn
	 nUuGtG6H/OZ6ssmu3dkFBvXnQrm0SvOme6uvsKGkWwdpYrpRt8Tamm+ASoF/v+Lewx7FP
	 B7YrcBmEKCos5v9mQFr6B65g0SMtg9YNkRJEN/i0EcrWAHIUZxBJAFHT9emIwigUsWaZX
	 wPqe2wfEfBWtleqzTc2iBKI+WRFH9YdfXtc2P68TfU5UwMUUcMVAKPB3vHwVpS+2q6CIv
	 qCVGYHkTomLDB0fcAVEqwQr2Wq0VUVAJRm+SJK0z5HxruGDcdQMnqmKo0JWyEiOKDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/DDV0w6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B187E606A33A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/DDV0w6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A1A1F000C4;
	Sun, 15 Nov 2026 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794784660;
	bh=kMbsRKqO2VA5pQx+7MAqgMbABgjbZ/XetoctG1EERzw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a/DDV0w6ixce6YaX3fe0ST2iFAlHbkCCVSFOWeMPNVUPf8ge9O8WTFdQsKGT4l9nR
	 LMzmaH0p0EhIvs2+Ll7wRIxp8tb4i5qpiBTllM3FFRp4k9HZXgy5Yb1TCGKCK9bHWi
	 3FSzMHhTJSDFtTsETcH6yf9gzbz4pXxmGZbJ/ypxbsM4YxuekvG8pJaNMbo69vKj7z
	 4IxxVrTSrSv5xklitpYUn48URD+J7+mPY2Tk6H0T037Nm6NG3r5RUBDPSb0WnIUrjN
	 /7Ey+lsyeckqadPydMbQ1BrHqUTHYWKduml7TXKSS6izaEqJdfXPt8b5g5qGTlLtI4
	 u2DbLeHMuBHbw==
Subject: Re: [PATCH net-next v10 3/4] net/sched: cap the accounted backlog
 before it can wrap
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com,
 toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Date: Sun, 15 Nov 2026 23:17:39 +0000
Message-ID: <179478465911.3136.8987850942254431917@kernel.org>
In-Reply-To: <QDISC-BA27.v10.r0.20261114071135-3@mojatatu.com>
References: <QDISC-BA27.v10.r0.20261114071135-3@mojatatu.com>
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] netem duplication still lets the 32-bit backlog wrap, in netem
  itself and in every guarded parent above it.
- [High] The new guard turns an existing taprio accounting leak into a
  permanent egress blackhole.
- [High] Known parent-backlog drift becomes a permanent drop-all in the
  guarded classful parents.
- [Medium] htb_enqueue() (net/sched/sch_htb.c) runs htb_classify() in a
  declaration initializer (line 632), before the new…
- [Medium] On any non-success child return, red_enqueue()
  (net/sched/sch_red.c) now saves `red_backlog =…
- [Low] The commit has no Fixes: tag, and its only provenance reference
  is misleading.
- [Low] The commit message says 'qdisc_pkt_len() itself stays truthful
  for every input: it is not clamped and the initializer keeps…
- [Low] plug_enqueue() (net/sched/sch_plug.c, lines 92-93) changes its
  admission test from `(u64)sch->qstats.backlog + skb->len <= q->limit`…

--

net/sched: cap the accounted backlog before it can wrap

This patch adds qdisc_backlog_overflow() and calls it on the enqueue path
of most qdiscs under net/sched. The goal is that a stab-inflated or
GSO-inflated qdisc_pkt_len() can no longer wrap the 32-bit
sch->qstats.backlog. RED now reserves the length in its own backlog before
calling the child and re-derives the aggregate on failure, and plug's
admission test switches from skb->len to qdisc_pkt_len().

Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260818101130.16203-1-jhs@mojatatu.com
Link: https://lore.kernel.org/netdev/CANn89iLfMJV7ancKH1Gjzzm7ZUG-gKcrczkJjJEWN5sCuWd-ug@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CANn89i+GOFH_8g+vSV0jUj0aBqLYVWuFOrHuDggZu9kPC_m6tQ@mail.gmail.com/
Link: https://lore.kernel.org/netdev/87a4oottcj.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/87pkxks68f.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/179231932946.3135.7497478990186385688@kernel.org/
Link: https://lore.kernel.org/netdev/179269577131.3135.3967915390403138015@kernel.org/

> This is a followup of commit 709f34f7c28d ("net/sched: fq: add overflow
> bounds to quantum and initial quantum") as reported by Sashiko.

[Severity: Low]
Is 709f34f7c28d the right reference? That commit clamps fq's
psched_mtu() derived quantum and initial_quantum, and it carries its own
Fixes: afe4fd062416. It never touches qstats.backlog accounting.

The wrap fixed here comes from a stab-inflated or GSO-inflated
qdisc_pkt_len() being added to each qdisc's 32-bit backlog, and that is
much older.

The message describes a user-reachable NULL flow->head dereference in
fq_codel_drop(). Could a Fixes: tag be added so stable maintainers know
which trees need this?

> qdisc_pkt_len() itself stays truthful for every input: it is not
> clamped and the initializer keeps succeeding, so BPF

[Severity: Low]
Does this match the current tree? __qdisc_calculate_pkt_len() in
net/sched/sch_api.c clamps the stab-computed length:

	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);

Also, qdisc_pkt_len_segs_init() in net/core/dev.c rejects SKB_GSO_DODGY
skbs whose wire estimate is above QDISC_PKT_LEN_MAX:

		if (unlikely(gso_segs > GSO_MAX_SEGS ||
			     skb->len + (u64)(gso_segs - 1) * hdr_len >
			     QDISC_PKT_LEN_MAX))
			return SKB_DROP_REASON_SKB_BAD_GSO;

The sentence also contradicts the earlier statement that a stab inflates
qdisc_pkt_len() "up to QDISC_PKT_LEN_MAX". Was the intent that this patch
adds no further clamp on the trusted GSO path?

[ ... ]

> diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
> index 1ba67b121de47..4ee8d3fe9cae9 100644
> --- a/net/sched/sch_htb.c
> +++ b/net/sched/sch_htb.c
> @@ -630,6 +630,12 @@ static int htb_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  	struct htb_sched *q = qdisc_priv(sch);
>  	struct htb_class *cl = htb_classify(skb, sch, &ret);
>  
> +	if (unlikely(qdisc_backlog_overflow(sch, skb))) {

[Severity: Medium]
htb_classify() runs in the declaration initializer, before this guard.
That means filter actions such as mirred, police and ct have already run.

Suppose the classifier returned NULL with NET_XMIT_SUCCESS |
__NET_XMIT_STOLEN (TC_ACT_STOLEN, QUEUED or TRAP). The existing branch
would return ret without counting a drop:

	} else if (!cl) {
		if (ret & __NET_XMIT_BYPASS)
			qdisc_qstats_drop(sch);
		__qdisc_drop(skb, to_free);
		return ret;

When the backlog is at the ceiling, does this guard count an overlimit
and a drop instead, and return NET_XMIT_DROP for a packet the classifier
already consumed? Parents would then count a drop too, because
net_xmit_drop_count() is 1 for a non-STOLEN code.

The other classful qdiscs in the patch (prio, drr, ets, hfsc, qfq, sfq,
sfb) check before classifying. fq_codel, cake and fq_pie handle the
terminal verdict before the guard. Should htb do one of the two?

[Severity: High]
Can this guard permanently block the whole htb tree when a leaf is hhf
or skbprio? Both return NET_XMIT_CN after evicting a different packet,
and neither calls qdisc_tree_reduce_backlog(). The RED comment in this
patch names both:

net/sched/sch_hhf.c:hhf_enqueue() {
    ...
	if (hhf_drop(sch, to_free) == idx)
		return NET_XMIT_CN;
    ...
}

htb_enqueue() only adds len on NET_XMIT_SUCCESS. So it keeps counting
the evicted packet, and on dequeue it subtracts the new packet's length.
Take an hhf leaf at its limit: a 1500 byte heavy-hitter packet that
evicts a 100 byte head leaves htb undercounting by 1400 bytes.

When the queue drains, htb's backlog ends up at 2^32 - 1400. That is
above QDISC_MAX_BACKLOG (2^32 - 1 - 2^20). htb's backlog only changes on
enqueue and dequeue, so it stays there. qdisc_backlog_overflow() then
rejects every later packet for every class until the qdisc is
reconfigured. Any net undercount between 1 byte and 1 MiB at drain time
has the same effect.

skbprio (default limit 64) does the same under prio or htb when large
high-priority packets evict small low-priority ones. prio, drr, ets,
qfq, hfsc, cbs, sfb and tbf use the same add-on-success pattern.

Before this patch the drift only made the stats wrong. Only RED gets the
re-derivation. Do the other parents need similar handling?

> diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> index 1dc2924890eb5..9a7b11594fff0 100644
> --- a/net/sched/sch_netem.c
> +++ b/net/sched/sch_netem.c
> @@ -467,6 +467,12 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  	unsigned int prev_len = qdisc_pkt_len(skb);
>  	int count = 1;
>  
> +	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> +		qdisc_qstats_overlimit(sch);
> +		return qdisc_drop_reason(skb, sch, to_free,
> +					 QDISC_DROP_OVERLIMIT);
> +	}

[Severity: High]
Can netem duplication still wrap the backlog? This guard runs once, on
the backlog from before either packet is accounted. Later in
netem_enqueue(), the duplicate goes back through the root before the
original is accounted:

net/sched/sch_netem.c:netem_enqueue() {
    ...
		skb2->tc_depth++; /* prevent duplicating a dup... */
		rootq->enqueue(skb2, rootq, to_free);
		skb2 = NULL;
	}

	qdisc_qstats_backlog_inc(sch, skb);
    ...
}

The re-entered root enqueue reaches each ancestor's guard, and netem's
own guard, with the same old backlog. They all pass and add len(skb2).
The outer call then adds len(skb).

Parents such as prio_enqueue() only add len after the child returns:

	ret = qdisc_enqueue(skb, qdisc, to_free);
	if (ret == NET_XMIT_SUCCESS) {
		qstats_backlog_add(sch, len);

So prio, htb, drr, ets, hfsc, qfq, sfb, cbs and tbf also take two
packets per check, but QDISC_MAX_BACKLOG only leaves room for one
QDISC_PKT_LEN_MAX packet.

Example: stab overhead 2000000000 (clamped to 1 MiB), netem duplicate
100%, a limit of 4096 or more, and a delay. The backlog grows in 2 MiB
steps. At 4094 MiB the guard passes and the backlog ends at 4096 MiB,
which wraps to 0. This happens with netem as root, and also as a leaf
under htb or prio.

Under RED, the reservation covers RED's own counter. But
qdisc_backlog_overflow(child, skb) still sees netem's stale value, so
netem's backlog, which RED feeds into red_calc_qavg(), can still wrap.

The RED comment mentions the netem clone re-entry, yet the commit
message lists netem and these parents as covered. Would reserving before
calling the child, or leaving headroom for two packets, close this path?

[ ... ]

> diff --git a/net/sched/sch_plug.c b/net/sched/sch_plug.c
> index b60ddfee6a68a..5654e5310fb58 100644
> --- a/net/sched/sch_plug.c
> +++ b/net/sched/sch_plug.c
> @@ -89,7 +89,8 @@ static int plug_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  {
>  	struct plug_sched_data *q = qdisc_priv(sch);
>  
> -	if (likely((u64)sch->qstats.backlog + skb->len <= q->limit)) {
> +	if (likely((u64)sch->qstats.backlog + qdisc_pkt_len(skb) <=
> +		   q->limit)) {

[Severity: Low]
This isn't a bug, but it changes what plug's configured byte limit means.
The limit now includes stab overhead and the per-segment headers that
qdisc_pkt_len_segs_init() adds for GSO skbs.

Existing plug setups (for example Remus/COLO style checkpointing) that
carry GSO traffic or have a stab attached will reach the limit sooner.
Could the commit message mention this change in behaviour?

[ ... ]

> diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
> index d7598214270b8..f3783e436da7c 100644
> --- a/net/sched/sch_red.c
> +++ b/net/sched/sch_red.c

[ ... ]

> @@ -136,14 +149,37 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  	}
>  
>  	len = qdisc_pkt_len(skb);
> +	/* Reserve the length before the child sees the packet: netem
> +	 * can re-enqueue a clone here before the backlog is updated.
> +	 */
> +	red_backlog = READ_ONCE(sch->qstats.backlog);
> +	child_backlog = READ_ONCE(child->qstats.backlog);
> +	qstats_backlog_add(sch, len);
>  	ret = qdisc_enqueue(skb, child, to_free);
>  	if (likely(ret == NET_XMIT_SUCCESS)) {
> -		qstats_backlog_add(sch, len);
>  		qdisc_qlen_inc(sch);
> -	} else if (net_xmit_drop_count(ret)) {
> -		WRITE_ONCE(q->stats.pdrop,
> -			   q->stats.pdrop + 1);
> -		qdisc_qstats_drop(sch);
> +	} else {
> +		u32 propagated, grew;
> +

[ ... ]

> +		propagated = READ_ONCE(sch->qstats.backlog) -
> +			     red_backlog - len;
> +		grew = READ_ONCE(child->qstats.backlog) - child_backlog;
> +		WRITE_ONCE(sch->qstats.backlog, red_backlog + grew);

[Severity: Medium]
Can this absolute write-back lose a concurrent update to
sch->qstats.backlog? red_backlog is sampled before
qdisc_enqueue(skb, child), and the field is overwritten only after the
whole child enqueue has finished. That can include classification and
netem's root re-enqueue.

One writer does not hold the root lock. tc_fill_qdisc() calls
q->ops->dump() under RTNL only, and red_dump()->red_dump_offload_stats()
passes the qstats to the driver:

	.stats.qstats = &sch->qstats,

mlxsw then does a read-modify-write on it:

drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c:mlxsw_sp_qdisc_update_stats() {
    ...
	stats_ptr->qstats->backlog += mlxsw_sp_cells_bytes(mlxsw_sp, backlog);
    ...
}

If that delta is lost, later negative deltas from the driver (or the
clean-stats qstats->backlog -= backlog) can push RED's backlog below its
true value and wrap it. Once the wrapped value is above
QDISC_MAX_BACKLOG, qdisc_backlog_overflow(sch, skb) drops every software
path packet at RED.

Before this patch, this writer could only race a single in-place +=.
Could the failure path apply a delta instead of restoring the snapshot?

[ ... ]

> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 5a1dca9d5e9de..bdb2596de0ef5 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -590,6 +590,12 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
>  {
>  	struct taprio_sched *q = qdisc_priv(sch);
>  
> +	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> +		qdisc_qstats_overlimit(sch);
> +		return qdisc_drop_reason(skb, sch, to_free,
> +					 QDISC_DROP_OVERLIMIT);
> +	}

[Severity: High]
Does this guard turn taprio's existing backlog leak into a permanent
egress blackhole? taprio_enqueue_one() accounts the packet before the
child enqueue, and nothing undoes that if the child drops it:

net/sched/sch_taprio.c:taprio_enqueue_one() {
    ...
	qdisc_qstats_backlog_inc(sch, skb);
	qdisc_qlen_inc(sch);

	return qdisc_enqueue(skb, child, to_free);
}

In software mode, taprio_init() creates the per-txq children with
qdisc_create_dflt(..., &pfifo_qdisc_ops, ...). pfifo drops through
qdisc_drop() and does not call qdisc_tree_reduce_backlog().
taprio_dequeue_from_txq() only decrements the backlog for packets it
actually dequeues.

So each time a gate window is oversubscribed, every child drop leaves
its qdisc_pkt_len() in taprio's backlog. After about 4 GiB of such drops
(roughly 2.9M 1500 byte packets), the backlog passes QDISC_MAX_BACKLOG.
>From then on this check drops every packet on the interface, and nothing
brings the counter down until the qdisc is reset.

taprio_enqueue_segmented() leaks the same way through
taprio_enqueue_one(). Before this patch, the leak only made the stats
wrong.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-BA27.v10.r0.20261114071135%40mojatatu.com
