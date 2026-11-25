Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636978;
	b=1Ektk9g550tGn4cDx3tUblMgJ8SBBP8c2kKTUwNE51NsoezRF4cGgEt0KhNoWIbfcFgv
	 L+qXlEP5UxZz8SeqGmU0cR88E9VfS2zL47eTiTEAU4KPnMRIHj+M6UAAHdQsQ+drh6l9Y
	 JTP2/y1ZsznhX94byZtiM70dGyISiN611YWxRZ4ZhS2YzX9oEZhEyzTL7C4CaWPLWugDc
	 O/Ifh5yqEdYD17zuXN5oRJw0HVfl00F5gqX3sCFb+47uA3BbJsnev0zFp6k40VKtamW45
	 5f4t6YR/ljG6EEL4p+3pF0VLVE/YcqLCrOT/k4FkYoQAZIaYQkHJ/uOGGBnjQZYKbXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636978;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lntPPZawXECjyQwDZAA+SMN/0EmBgr0hQaqQDIlp4yE=;
	b=YW6VzGvs0qRLyscchCuRpz27XZYJqLKlU5ishlK60+Ypc9uKhgCuwgrw02Qax8PUbUKc
	 1feRB7JcFYlEX+IojDazo0NIetLtYRP/sejEmNU6t0R8+0K9bfCO5tjLzNTM8ACjRSPVD
	 hSJiOhsB2ZXXE13VLEs6caHI71YVdVyVmu3oOYY0GzgEbce+Cn4OWAiF9KyQfVNxv7Xy1
	 Yss2rPHK17+pI6JsP2hOVh1FXatjhsx1c2/wyveSeTXfR/THKzDhjlDRd7oRPl8nFKIjP
	 jQ6uisJppRnkmlp0GXd8nIDvn3BGmePf00i7+qgz9rRQz+l/hSKB42qSJ1Ri1x2OuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAfo+3at;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52078606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAfo+3at
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDBB1F000C0;
	Wed, 25 Nov 2026 20:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795636978;
	bh=lntPPZawXECjyQwDZAA+SMN/0EmBgr0hQaqQDIlp4yE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cAfo+3atiCK8kEYePAQakBBEwktSCrwCx84HOHTje9dAM9oJw3Y8hVNysMKnM4KxL
	 pml4PTAnqYNOs4FD26YbRApECwFKCYxgHdBclDuipt4KgSgp9zMsyf5xXOfdYikuWw
	 24vdnqol65zhSQ7rfJ0allZK8s4jIuypKgrdV9vYosRbcMStXAm30sPIgr+c9OrS4b
	 2Prqqw0+iUDpbxaIlNAVrOroArn9a0PKgxMyx+8yUhCIiOFpRlh0eOE/JUvbLAgoWf
	 NMezssr/1o1Q3UpMok5lzIpCLd39F+O4FBp3Je2/z5NdxwMFstdXlB8EOpO/pOadAx
	 YVin/wTWMIGbA==
Subject: Re: [PATCH net-next v12 3/4] net/sched: cap the accounted backlog
 before it can wrap
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com,
 toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Date: Wed, 25 Nov 2026 20:02:56 +0000
Message-ID: <179563697668.3135.16270822968642633734@kernel.org>
In-Reply-To: <QDISC-BA27.v12.r0.20261120184210-3@mojatatu.com>
References: <QDISC-BA27.v12.r0.20261120184210-3@mojatatu.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] taprio_enqueue_one() now records the child's backlog and qlen
  before qdisc_enqueue(skb, child) and afterwards adds the full…
- [High] In software mode, taprio's sch->qstats.backlog and sch->q.qlen
  are only ever reduced in taprio_dequeue_from_txq(), by the skb…
- [High] The new enqueue guard decides only from the stored
  sch->qstats.backlog.
- [Medium] Parts of the permanent commit body describe an earlier
  revision (v11), not this code.
- [Low] The patch bundles several behaviour changes that the permanent
  commit body does not mention, beyond 'add the enqueue guard'.
- [Low] The patch fixes a user-visible bug.
- [Low] net/sched: htb_enqueue() overlimit increment is overwritten by
  htb_dump()

--

net/sched: cap the accounted backlog before it can wrap

This patch adds qdisc_backlog_overflow() and calls it in the enqueue path
of many qdiscs. Packets are dropped before the 32-bit sch->qstats.backlog
can wrap. It also makes qdisc_qstats_backlog_dec() saturate at zero,
changes taprio to mirror the child's backlog change, and has netem
temporarily book the original packet while its duplicate re-enters the
root.

Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatatu.com/
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260818101130.16203-1-jhs@mojatatu.com
Link: https://lore.kernel.org/netdev/CANn89iLfMJV7ancKH1Gjzzm7ZUG-gKcrczkJjJEWN5sCuWd-ug@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CANn89i+GOFH_8g+vSV0jUj0aBqLYVWuFOrHuDggZu9kPC_m6tQ@mail.gmail.com/
Link: https://lore.kernel.org/netdev/87a4oottcj.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/87pkxks68f.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/179231932946.3135.7497478990186385688@kernel.org/
Link: https://lore.kernel.org/netdev/179269577131.3135.3967915390403138015@kernel.org/

> Ordinary packets (qdisc_pkt_len() at most QDISC_PKT_LEN_MAX) are
> covered by a standing ceiling: drop once the backlog is within
> QDISC_MAX_BACKLOG (U32_MAX - QDISC_PKT_LEN_MAX) of the wrap point, the
> largest backlog one more 1 MiB packet cannot wrap, so there is no
> per-enqueue 64-bit add.
>
> A larger wire estimate is checked against the space that actually
> remains (len > U32_MAX - backlog): qdisc_pkt_len_segs_init() adds the

[ ... ]

> since each adds the packet's own length to a 32-bit backlog. In RED,
> account the packet before handing it to the child, bound the child
> backlog too, and re-derive the aggregate from pre-reservation snapshots
> on failure.

[Severity: Medium]
Do these parts of the commit body still describe the v12 code?

The only RED change in red_enqueue() is the qdisc_backlog_overflow()
check on sch and child. The packet is still booked only after the child
returns NET_XMIT_SUCCESS:

    ret = qdisc_enqueue(skb, child, to_free);
    if (likely(ret == NET_XMIT_SUCCESS)) {
        qstats_backlog_add(sch, len);

There is no early booking and no snapshot re-derivation. The v12 notes
say that approach was reverted.

The ceiling in the code also differs from the text:

    #define QDISC_MAX_BACKLOG	(U32_MAX - 2 * QDISC_PKT_LEN_MAX)

and so does the large-packet check:

    return (u64)backlog + len + QDISC_PKT_LEN_MAX > U32_MAX;

git am drops the changelog below the --- line. Could the commit body be
updated to match this version?

> The Fix: drop at enqueue once the stored backlog cannot represent the
> incoming packet's accounted length.

[Severity: Low]
This isn't a bug, but the commit body only describes the enqueue guard.
The patch also carries several other behaviour changes that the body
does not mention:

  - qdisc_qstats_backlog_dec() now saturates at zero for every qdisc
    (this appears only in the v12 notes)
  - new qdisc_tree_reduce_backlog() calls on the NET_XMIT_CN paths of
    hhf_enqueue() and skbprio_enqueue()
  - taprio_enqueue_one() now mirrors the child's backlog change instead
    of booking before the enqueue, and taprio_enqueue_segmented() no
    longer counts drops on taprio
  - netem_enqueue() temporarily books the original packet on itself and
    its ancestors while the duplicate re-enters the root
  - plug_enqueue() now compares qdisc_pkt_len() against the byte limit
    instead of skb->len

Could these be described in the commit body, or split out into their own
patches?

> Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatatu.com/

[ ... ]

> Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

[Severity: Low]
This isn't a bug, but the commit message describes wrong AQM drop
decisions and a NULL flow->head dereference in fq_codel_drop(). There is
no Fixes: tag and no Cc: stable.

Commit 709f34f7c28d, which this patch follows up, carries a Fixes: tag.

Should Fixes: tags be added here as well? The hhf/skbprio CN path and
taprio accounting changes would need their own.

> diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> index 1acaadb3e2cf0..bff07ce8c1306 100644
> --- a/include/net/sch_generic.h
> +++ b/include/net/sch_generic.h

[ ... ]

> @@ -997,7 +1020,15 @@ static inline void qstats_backlog_sub(struct Qdisc *sch, u32 val)
>  static inline void qdisc_qstats_backlog_dec(struct Qdisc *sch,
>  					    const struct sk_buff *skb)
>  {
> -	qstats_backlog_sub(sch, qdisc_pkt_len(skb));
> +	u32 backlog = READ_ONCE(sch->qstats.backlog);
> +	u32 len = qdisc_pkt_len(skb);
> +
> +	/* An offload driver can update the counter from the dump path
> +	 * while the packet is in flight, so a lost increment can leave
> +	 * the backlog below the length being removed.  Do not let that
> +	 * wrap: the enqueue guard would then drop every packet for good.
> +	 */
> +	WRITE_ONCE(sch->qstats.backlog, backlog > len ? backlog - len : 0);

[Severity: High]
The comment says a wrap here would make the enqueue guard drop every
packet for good, but only this helper saturates. Can the other
subtractions from the same counter still wrap it?

qstats_backlog_sub() is unchanged:

    WRITE_ONCE(sch->qstats.backlog, sch->qstats.backlog - val);

The codel, fq_codel, fq_pie and cake dequeue and drop paths use it, and
so does the new netem undo path. qdisc_tree_reduce_backlog() also calls
it for every ancestor.

Offload drivers do their own arithmetic on this counter from the dump
path. mlxsw_sp_qdisc_update_stats() does:

    stats_ptr->qstats->backlog += mlxsw_sp_cells_bytes(mlxsw_sp, backlog);

When the HW backlog shrinks, that delta is effectively negative.
mlxsw_sp_qdisc_leaf_unoffload() does:

    qstats->backlog -= backlog;

Take an mlxsw port with an offloaded prio or ets root, where the stored
value is S + H (software bytes plus the HW contribution):

  - A dump racing a datapath qstats_backlog_add() loses L.
  - The software packet dequeues, and the clamp leaves H - L.
  - The HW backlog drains, mlxsw adds -H, and the counter wraps to
    about U32_MAX - L, which is above QDISC_MAX_BACKLOG.

Wouldn't prio, ets or red then drop all software-path traffic until the
qdisc is reset? Before this patch the same wrap only corrupted the
statistics.

>  }

[ ... ]

> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 5a1dca9d5e9de..2f199541e0049 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -589,6 +589,15 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
>  			      struct Qdisc *child, struct sk_buff **to_free)
>  {
>  	struct taprio_sched *q = qdisc_priv(sch);
> +	u32 backlog;
> +	int qlen;
> +	int ret;
> +
> +	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> +		qdisc_qstats_overlimit(sch);
> +		return qdisc_drop_reason(skb, sch, to_free,
> +					 QDISC_DROP_OVERLIMIT);
> +	}

[Severity: Low]
This isn't a datapath bug, but will the overlimit counted by the new
guard in htb_enqueue() ever reach userspace?

HTB keeps its qdisc-level overlimit count in q->overlimits, which
htb_do_events() increments. htb_dump() then does:

    sch->qstats.overlimits = READ_ONCE(q->overlimits);

tc_fill_qdisc() calls this before gnet_stats_copy_queue() serializes
sch->qstats. Every dump therefore overwrites the
qdisc_qstats_overlimit(sch) increment made here.

tc -s would then show the backlog-overflow drop without a matching
overlimit. That is unlike the other qdiscs this patch touches, where
the overlimit is reported alongside the QDISC_DROP_OVERLIMIT drop.

Should this guard bump q->overlimits instead, for example with
WRITE_ONCE(q->overlimits, q->overlimits + 1), so that the count
survives htb_dump()?

[Severity: High]
In software mode, can taprio's backlog only grow, so that this guard
eventually trips for good?

taprio_graft() marks every child:

    new->flags |= TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;

and qdisc_tree_reduce_backlog() stops at such a qdisc:

    if (sch->flags & TCQ_F_NOPARENT)
        break;

So drops a child makes at dequeue time never reach taprio. Examples are
fq_codel_dequeue():

    qdisc_tree_reduce_backlog(sch, q->cstats.drop_count,
                              q->cstats.drop_len);

and the codel and cake dequeue drops. The only decrement of taprio's
counters is in taprio_dequeue_from_txq(), and it covers just the skb
that is returned.

Before this patch the drift only made the stats wrong. With this check,
once the dropped bytes add up past QDISC_MAX_BACKLOG (about 4 GiB),
would every packet on every txq be dropped with QDISC_DROP_OVERLIMIT
until the qdisc is reset? Remote senders can drive the congestion that
causes these AQM drops.

[ ... ]

> @@ -600,10 +609,20 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
>  			return qdisc_drop(skb, sch, to_free);
>  	}
>  
> -	qdisc_qstats_backlog_inc(sch, skb);
> -	qdisc_qlen_inc(sch);
> +	/* A child may free skb (tbf_segment(), cake's split path) or evict
> +	 * another packet before returning, so take everything this function
> +	 * needs before the handoff and mirror the child's net change.  A
> +	 * child that evicts cannot reach us through
> +	 * qdisc_tree_reduce_backlog() because taprio_graft() marks it
> +	 * TCQ_F_NOPARENT.
> +	 */
> +	backlog = READ_ONCE(child->qstats.backlog);
> +	qlen = qdisc_qlen(child);
> +	ret = qdisc_enqueue(skb, child, to_free);
> +	qstats_backlog_add(sch, READ_ONCE(child->qstats.backlog) - backlog);
> +	WRITE_ONCE(sch->q.qlen, sch->q.qlen + qdisc_qlen(child) - qlen);

[Severity: High]
Does this count a packet twice when the child is netem with duplication
enabled?

In software mode qdisc_root_bh() for the child is taprio itself.
netem_enqueue() sends the duplicate back to the root while this outer
call still holds its snapshot:

    rootq->enqueue(skb2, rootq, to_free);

The clone keeps queue_mapping, so the nested taprio_enqueue() picks the
same child:

taprio_enqueue_one(skb)              /* snapshot B, Q */
  qdisc_enqueue(skb, child)
    netem_enqueue(skb)
      rootq->enqueue(skb2)           /* taprio_enqueue() */
        taprio_enqueue_one(skb2)
          taprio books +L, +1
      netem books skb
  qstats_backlog_add(sch, (B + 2L) - B)   /* +2L */
  sch->q.qlen += 2

That is 3L and 3 on taprio for two queued packets. netem's own
pre-booking through qdisc_tree_reduce_backlog() stops at the
TCQ_F_NOPARENT child, so it does not change this. taprio_dequeue_from_txq()
subtracts once per dequeued skb:

    qdisc_qstats_backlog_dec(sch, skb);
    qdisc_qlen_dec(sch);

Wouldn't L and 1 leak upward on every duplicated packet? The zero clamp
does not help with upward drift. Once the leaked bytes pass
QDISC_MAX_BACKLOG, the new guard at the top of taprio_enqueue_one()
would drop everything until reset.

Before this patch taprio booked each packet exactly once, before the
child enqueue.

>  
> -	return qdisc_enqueue(skb, child, to_free);
> +	return ret;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-BA27.v12.r0.20261120184210%40mojatatu.com
