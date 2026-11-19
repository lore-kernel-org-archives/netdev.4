Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129566;
	b=MDVLd/XcnNj0pdK1nChgmy31I87jEeYmsRNglgPLG0Cv+FjLF7llTAFX0G0D7osMIm74
	 UMoX3WvhK6DghDJVOKpo/wY/HtEtH9Y4MbfOSZorevjd+LaBltQaq4nU8lHiLNVI+zIDe
	 eLJvLSk2jAKVGJdbR5q6KLt5S7o3YJJG9h12nD8S3DFNuRFnI1uqujUDhuKmlrqBXpx57
	 DJLJkGYudzf2AIXk0HJxdb3ZVVqn3d+Eo2Kc56g3+lQzNVkdlI6mOfFDQbWOqksdonfLO
	 yH1n8May1nRneiQ1XRCc/4vLNm5O7FAmyB9Tdi8j0IGtywNHLmgBxWXSvFauDGpNnnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129566;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W4mxiG4oToYatrLsqljUqJLYR25GWExPKIRgGy0+9+g=;
	b=Df6cB4mF7LlUQhQMiIzhhFjgKsDdv240jpcBEHs7VPcvStv34DfQEa5F+titQPo3UPnN
	 wl257rsuThF4NGrAysL7VYqqE2M8LUjWpE8R6uHL3m99j/A2FdPWA0Io4TU2OKi5LuldB
	 /J46W2u98EoltUFgayMLs3V0UXaebX5ZwZpaZmNflpbzNYVCKp5MHSLb2ybnB5E6NFGEl
	 +F1Ss+0Qryl/6tDUYauI/4MC++1wFB6U/6AsX1HSXLfAl4kO5AWrs3wXHkuOczEs5RrfY
	 Ji0RqnvHSYoKCxZDclePaZDanxNpIGqLhY5AnnX+Ue0vVwnvc4rLefC1SkJh203qa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6qflBHN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47997606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6qflBHN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D43C1F000C6;
	Thu, 19 Nov 2026 23:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129565;
	bh=W4mxiG4oToYatrLsqljUqJLYR25GWExPKIRgGy0+9+g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P6qflBHNk9BN76vULTp2ydha62SKgfmq609AvWSw2EHQLI0tobm+D/r8byiCO+TkW
	 DB19r4hK7mjAFZTArrclCs6S0rGPIeVW7aB4hnWxL3XCBt7kcYraGeA7pGYlpR18ev
	 ISgcBFcQNFtpoedgQhwApEasTt+kn4rcpwl4uoxL+zcWhBEpRX68dOHAPC6NdyFS3J
	 8J8CCkqjdqZ35r7L+ME6PeLnJg80eB5FYwaB1TTCwqg3tc9BEesSYBy27GpwgKrAd5
	 Zkp9nQw1MfUHcyWN0suWntcoz0vNS9FU/AslnjMSLzIpXNLNCZRK3RqofH16zjWfQo
	 KMVaKosjAjb4Q==
Subject: Re: [PATCH net-next v11 3/4] net/sched: cap the accounted backlog
 before it can wrap
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com,
 toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Date: Thu, 19 Nov 2026 23:06:04 +0000
Message-ID: <179512956455.3136.10875557629987344136@kernel.org>
In-Reply-To: <QDISC-BA27.v11.r0.20261116134053-3@mojatatu.com>
References: <QDISC-BA27.v11.r0.20261116134053-3@mojatatu.com>
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

- [High] Use-after-free in taprio_enqueue_one() and
  taprio_enqueue_segmented() (net/sched/sch_taprio.c).
- [High] The new booking scheme in taprio drifts the backlog negative,
  and the new guard turns that into a permanent egress stop.
- [High] The new qdisc_backlog_overflow() guard bases a hard drop
  decision on sch->qstats.backlog, but that field has two writers under…
- [Medium] red_enqueue() (net/sched/sch_red.c:172-181) claims to apply a
  delta 'rather than restoring the snapshot' so that a concurrent…
- [Medium] The permanent commit message (everything above '---')
  describes only the guard.
- [Low] The comment in red_enqueue() (net/sched/sch_red.c:164-171) says
  '(pfifo_head_drop, sfq and fq_codel do; hhf and skbprio return…
- [Low] The commit message's rationale contradicts the tree it applies
  to.
- [Low] The commit fixes a crash-class bug: according to the message, a
  wrapped per-flow backlog can make fq_codel_drop() pick an empty flow…
- [Low] The two new guard sites in net/sched/sch_fifo.c (pfifo_enqueue()
  line 32, pfifo_tail_enqueue() line 49) drop with a bare…

--

net/sched: cap the accounted backlog before it can wrap

This adds qdisc_backlog_overflow() and calls it on the enqueue path of
most qdiscs in net/sched, so a packet is dropped once the 32-bit
sch->qstats.backlog could no longer represent it. It also changes how
RED, taprio, netem, hhf and skbprio account backlog around child
enqueues and evictions.

Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatatu.com/
Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260818101130.16203-1-jhs@mojatatu.com
Link: https://lore.kernel.org/netdev/CANn89iLfMJV7ancKH1Gjzzm7ZUG-gKcrczkJjJEWN5sCuWd-ug@mail.gmail.com/
Link: https://lore.kernel.org/netdev/CANn89i+GOFH_8g+vSV0jUj0aBqLYVWuFOrHuDggZu9kPC_m6tQ@mail.gmail.com/
Link: https://lore.kernel.org/netdev/87a4oottcj.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/87pkxks68f.fsf@toke.dk/
Link: https://lore.kernel.org/netdev/179231932946.3135.7497478990186385688@kernel.org/
Link: https://lore.kernel.org/netdev/179269577131.3135.3967915390403138015@kernel.org/

> The Fix: drop at enqueue once the stored backlog cannot represent the
> incoming packet's accounted length.

[Severity: Medium]
The commit message only describes the guard. The patch also includes
several accounting and behaviour changes that are not mentioned above
the "---" line:

- taprio_enqueue_one() now books backlog and qlen only after the child
  returns NET_XMIT_SUCCESS, and taprio_enqueue_segmented() only counts
  slen for accepted segments.

- hhf_enqueue() and skbprio_enqueue() now call
  qdisc_tree_reduce_backlog() on their NET_XMIT_CN paths.

- netem_enqueue() books the original packet temporarily (backlog, qlen,
  and the ancestors through qdisc_tree_reduce_backlog(sch, 0,
  -(int)prev_len)) around the duplicate's root re-enqueue. This also
  makes the sch->limit check for the duplicate stricter.

- plug_enqueue() now measures its byte limit with qdisc_pkt_len()
  (stab-adjusted, GSO wire estimate) instead of skb->len.

Only the v10/v11 notes describe these, and git am drops those notes.
The notes also say that without the taprio/hhf/skbprio changes the
guard "stopped the tree", so a backport of the guard alone would run
into that.

Could these changes be described in the commit message, or split out
into separate patches?

> qdisc_pkt_len() itself stays truthful for every input: it is not
> clamped and the initializer keeps succeeding, so BPF
> __sk_buff.wire_len, act_police and the HTB/TBF shapers read the real
> length, and sch_handle_ingress() -- which ignores the initializer's
> return value and reads pkt_segs for packet statistics -- keeps
> complete metadata.

[Severity: Low]
Does this match the tree the patch applies to?
__qdisc_calculate_pkt_len() still clamps the stab-adjusted length:

net/sched/sch_api.c:__qdisc_calculate_pkt_len() {
    ...
	pkt_len = clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
    ...
}

qdisc_pkt_len_segs_init() also still fails an oversized DODGY
aggregate:

net/core/dev.c:qdisc_pkt_len_segs_init() {
    ...
	if (unlikely(gso_segs > GSO_MAX_SEGS ||
		     skb->len + (u64)(gso_segs - 1) * hdr_len >
		     QDISC_PKT_LEN_MAX))
		return SKB_DROP_REASON_SKB_BAD_GSO;
    ...
}

This patch changes neither function. So BPF wire_len, act_police and
the shapers do see a clamped length when a stab is attached.

The second arm of qdisc_backlog_overflow() can still be reached by
non-DODGY GSO without a stab, so the code itself looks fine. Only the
stated rationale seems off.

> Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatatu.com/

[ ... ]

> Reviewed-by: Victor Nogueira <victor@mojatatu.com>
> Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

[Severity: Low]
This isn't a bug, but the commit message says a wrapped per-flow
backlog can make fq_codel_drop() dereference a NULL flow->head. The
only reference to earlier work is "a followup of commit 709f34f7c28d".

Should this carry a Fixes: tag (and Cc: stable) so it gets picked up
for backports? The bundled taprio, hhf and skbprio accounting fixes
have no Fixes: tags either.

> diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> index 1acaadb3e2cf0..a5a6bdf55e0a1 100644
> --- a/include/net/sch_generic.h
> +++ b/include/net/sch_generic.h
> @@ -915,6 +915,26 @@ static inline unsigned int qdisc_pkt_len(const struct sk_buff *skb)
>  	return qdisc_skb_cb(skb)->pkt_len;
>  }
>  
> +#define QDISC_PKT_LEN_MAX	(1 << 20)	/* 1 MiB */
> +
> +/* Largest backlog that still has room for one more 1 MiB packet. */
> +#define QDISC_MAX_BACKLOG	(U32_MAX - QDISC_PKT_LEN_MAX)
> +
> +/* Would this packet's accounted length wrap sch->qstats.backlog?
> + * Packets up to QDISC_PKT_LEN_MAX fit below QDISC_MAX_BACKLOG; GSO
> + * can make the length larger, so compare against the real headroom.
> + */
> +static inline bool qdisc_backlog_overflow(const struct Qdisc *sch,
> +					  const struct sk_buff *skb)
> +{
> +	u32 backlog = READ_ONCE(sch->qstats.backlog);
> +	u32 len = qdisc_pkt_len(skb);
> +
> +	if (likely(len <= QDISC_PKT_LEN_MAX))
> +		return backlog > QDISC_MAX_BACKLOG;
> +	return len > U32_MAX - backlog;
> +}

[Severity: High]
Can this check turn an offload stats race into a permanent drop?

sch->qstats.backlog has two writers that hold different locks. The
datapath updates it under the qdisc root lock. Offload drivers update
it from the dump path while holding only RTNL:

tc_fill_qdisc()
  q->ops->dump()
    prio_dump_offload() / red_dump_offload_stats() / ets_offload_dump()
    fifo_offload_dump() / tbf_offload_dump()
      ndo_setup_tc()
        mlxsw_sp_qdisc_update_stats()
          stats_ptr->qstats->backlog += mlxsw_sp_cells_bytes(mlxsw_sp, backlog);

nfp does the same thing:

	qstats->backlog += new->backlog_bytes - old->backlog_bytes;

If a datapath +len is lost to this race, the matching -len later leaves
the counter just below zero. As a u32 that is above QDISC_MAX_BACKLOG.
>From then on prio_enqueue(), ets_qdisc_enqueue(), pfifo_enqueue(),
tbf_enqueue() and red_enqueue() drop every software-path packet.
Nothing is admitted, so nothing brings the counter back.

Before this patch the same race only affected the reported stats. Could
periodic "tc -s qdisc show" on an mlxsw or nfp port now blackhole
CPU-originated traffic until the qdisc is reset?

> +
>  static inline unsigned int qdisc_pkt_segs(const struct sk_buff *skb)
>  {
>  	u32 pkt_segs = qdisc_skb_cb(skb)->pkt_segs;

[ ... ]

> diff --git a/net/sched/sch_fifo.c b/net/sched/sch_fifo.c
> index 1b6388d50967f..16c8d4f74e7e7 100644
> --- a/net/sched/sch_fifo.c
> +++ b/net/sched/sch_fifo.c
> @@ -29,6 +29,9 @@ static int bfifo_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  static int pfifo_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  			 struct sk_buff **to_free)
>  {
> +	if (unlikely(qdisc_backlog_overflow(sch, skb)))
> +		return qdisc_drop(skb, sch, to_free);
> +

[Severity: Low]
This isn't a bug, but every other guard added by this patch counts an
overlimit and/or uses QDISC_DROP_OVERLIMIT. Here and in
pfifo_tail_enqueue(), a drop at the backlog ceiling shows no overlimits
in tc -s. It also keeps the default QDISC_DROP_GENERIC reason set in
__dev_xmit_skb(), so it looks the same as an ordinary limit drop.

Should these use qdisc_qstats_overlimit() and qdisc_drop_reason(...,
QDISC_DROP_OVERLIMIT) like the other sites?

>  	if (likely(sch->q.qlen < READ_ONCE(sch->limit)))
>  		return qdisc_enqueue_tail(skb, sch);
>  

[ ... ]

> diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
> index d7598214270b8..de33e9e02c64c 100644
> --- a/net/sched/sch_red.c
> +++ b/net/sched/sch_red.c

[ ... ]

> @@ -136,14 +149,41 @@ static int red_enqueue(struct sk_buff *skb, struct Qdisc *sch,
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
> +		/* Re-derive the aggregate from the snapshots: the child may
> +		 * have dropped the packet or evicted another one, and may or
> +		 * may not have reduced the ancestors' backlog itself
> +		 * (pfifo_head_drop, sfq and fq_codel do; hhf and skbprio
> +		 * return NET_XMIT_CN without qdisc_tree_reduce_backlog()).

[Severity: Low]
Is this comment still accurate? This same patch adds
qdisc_tree_reduce_backlog() to the NET_XMIT_CN paths of both hhf and
skbprio:

net/sched/sch_hhf.c:hhf_enqueue() {
    ...
	if (hhf_drop(sch, to_free) == idx) {
		...
		qdisc_tree_reduce_backlog(sch, 0,
					  prev_backlog - sch->qstats.backlog -
					  len);
		return NET_XMIT_CN;
	}
    ...
}

net/sched/sch_skbprio.c:skbprio_enqueue() {
    ...
	qdisc_tree_reduce_backlog(sch, 0, to_drop_len - qdisc_pkt_len(skb));

	return NET_XMIT_CN;
}

The arithmetic below still works for these children. The comment,
though, describes how they behaved before this patch.

> +		 * Keep what the child actually accounted for, and pass the
> +		 * difference on to the ancestors above RED.
> +		 */
> +		propagated = READ_ONCE(sch->qstats.backlog) -
> +			     red_backlog - len;
> +		grew = READ_ONCE(child->qstats.backlog) - child_backlog;
> +		/* Apply a delta rather than restoring the snapshot: an
> +		 * offload driver may have updated the counter while the
> +		 * child ran, and an absolute store would lose it.
> +		 */
> +		qstats_backlog_add(sch, grew - len - propagated);
> +		if (propagated != grew)
> +			qdisc_tree_reduce_backlog(sch, 0, propagated - grew);

[Severity: Medium]
Does this delta actually keep a concurrent offload driver update?
red_dump_offload_stats() passes &sch->qstats to the driver through
ndo_setup_tc() while holding only RTNL, and
mlxsw_sp_qdisc_update_stats() does:

	stats_ptr->qstats->backlog += mlxsw_sp_cells_bytes(mlxsw_sp, backlog);

Let D be a driver update that lands on sch->qstats.backlog while the
child runs. Let P be what the child itself propagated up through
qdisc_tree_reduce_backlog(). Then:

	backlog     = red_backlog + len + P + D
	propagated  = P + D
	new backlog = backlog + grew - len - propagated
	            = red_backlog + grew

So D is lost here exactly as it would be with the absolute store.

qdisc_tree_reduce_backlog(sch, 0, propagated - grew) also subtracts D
from every ancestor's backlog. With prio or ets above RED, those
ancestors now run qdisc_backlog_overflow() as well. Could a spurious D
wrap an ancestor's counter and make it drop traffic?

> +		if (net_xmit_drop_count(ret)) {
> +			WRITE_ONCE(q->stats.pdrop,
> +				   q->stats.pdrop + 1);
> +			qdisc_qstats_drop(sch);
> +		}
>  	}
>  	return ret;
>  

[ ... ]

> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 5a1dca9d5e9de..e5aee9c650c96 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -589,6 +589,13 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
>  			      struct Qdisc *child, struct sk_buff **to_free)
>  {
>  	struct taprio_sched *q = qdisc_priv(sch);
> +	int ret;
> +
> +	if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> +		qdisc_qstats_overlimit(sch);
> +		return qdisc_drop_reason(skb, sch, to_free,
> +					 QDISC_DROP_OVERLIMIT);
> +	}
>  
>  	/* sk_flags are only safe to use on full sockets. */
>  	if (skb->sk && sk_fullsock(skb->sk) && sock_flag(skb->sk, SOCK_TXTIME)) {
> @@ -600,10 +607,13 @@ static int taprio_enqueue_one(struct sk_buff *skb, struct Qdisc *sch,
>  			return qdisc_drop(skb, sch, to_free);
>  	}
>  
> -	qdisc_qstats_backlog_inc(sch, skb);
> -	qdisc_qlen_inc(sch);
> +	ret = qdisc_enqueue(skb, child, to_free);
> +	if (ret == NET_XMIT_SUCCESS) {
> +		qdisc_qstats_backlog_inc(sch, skb);
> +		qdisc_qlen_inc(sch);
> +	}

[Severity: High]
Can this read skb after the child has freed it?

Before this patch the backlog was booked before the handoff and the
function ended with return qdisc_enqueue(...), so the skb was never
touched afterwards. Now qdisc_qstats_backlog_inc() reads
qdisc_skb_cb(skb)->pkt_len after qdisc_enqueue() has returned
NET_XMIT_SUCCESS.

Some children free the skb they were given and still return
NET_XMIT_SUCCESS. tbf_segment() does:

net/sched/sch_tbf.c:tbf_segment() {
    ...
	qdisc_tree_reduce_backlog(sch, 1 - nb, prev_len - len);
	consume_skb(skb);
	return NET_XMIT_SUCCESS;
}

So does the split-GSO branch in cake_enqueue():

	/* we never use the original skb after splitting */
	consume_skb(skb);
	skb = NULL;

netem's corrupt path does too: netem_segment() consumes a GSO skb, and
skb_unclone_full() frees the original cloned skb.

taprio_graft() allows any of these to be grafted as a per-txq child in
software mode. The value read is then added to taprio's backlog, where
it can also trip the new guard.

taprio_enqueue_segmented() has the same problem, because the moved line
now runs after taprio_enqueue_one() has handed segs to the child:

		} else {
			slen += segs->len;
			numsegs++;
		}

Other parents (cbs, prio, drr, ets, hfsc, htb, tbf) save
len = qdisc_pkt_len(skb) before calling the child. Would doing the same
here, and saving segs->len before taprio_enqueue_one(), avoid the
use-after-free?

>  
> -	return qdisc_enqueue(skb, child, to_free);
> +	return ret;
>  }

[Severity: High]
Can booking only on NET_XMIT_SUCCESS push taprio's backlog below zero?

taprio_graft() sets TCQ_F_NOPARENT on every child, so a child's
qdisc_tree_reduce_backlog() corrections stop before they reach taprio.
taprio_dequeue_from_txq() still subtracts every skb it dequeues:

	qdisc_bstats_update(sch, skb);
	qdisc_qstats_backlog_dec(sch, skb);
	qdisc_qlen_dec(sch);

If a child keeps an skb but returns NET_XMIT_CN, taprio never books
that skb, yet still subtracts it on dequeue. pfifo_tail_enqueue() is
one example:

	qdisc_tree_reduce_backlog(sch, 0, prev_backlog - sch->qstats.backlog);
	return NET_XMIT_CN;

With pfifo_head_drop limit 1 as the child:

  100 byte packet, SUCCESS, booked       backlog = 100
  1500 byte packet evicts it, CN         backlog = 100
  dequeue the 1500 byte packet           backlog = U32_MAX - 1399

That value is above QDISC_MAX_BACKLOG. The new qdisc_backlog_overflow()
check at the top of taprio_enqueue_one() then drops every packet on
every txq, and since nothing is admitted the counter never recovers.
skbprio, sfq with headdrop, and hhf or fq_codel evicting from the same
flow can do the same.

The upward drift mentioned in the v11 notes is also still there with
children that drop internally while returning SUCCESS, or drop at
dequeue (fq_codel_drop() on another flow, codel dequeue drops). After
about 4 GiB of such drops the same guard trips.

Is the "permanent egress stop" described in the v11 notes still
reachable through these paths?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-BA27.v11.r0.20261116134053%40mojatatu.com
