Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636979;
	b=SC0T+m5zOoUXpnm1JZO4Vdj4aKXRlY6wF3XJHeVHDF8dEbwspYhrq3H81mVJiwlnZ4X+
	 C+XdSpg+owmEayeh7p+mKFirHPrfyufolxJgKYdLxhlBKn8cIg+4koE5Yp0JEhvUJ5wBJ
	 Np6y5SUVdRIOpRkvnthjba7ZGme+n5IJBHl2dZYLMoCwWPcJBnNYvqRWSEzvpL6twvhAs
	 TkLx2pMLfOvBBA4kfpkkqY2s5VkaJAbYghOrgHlBBqy1C9Fp9MOHJYjaIegOA3HwCNNVC
	 UN67aFU50ebHSnb/R5dpDd93ny03pXwH/08lWr/w1/WkULr2ZZwO1mVyHypSWdylb/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636979;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qIjur6b5aQg0Uj3n7Ry6G4ux8kTyfhzUhutSKontryc=;
	b=oVP0C7a+RTdwbgJyCyXrHz6QZPfEc3G2PMylCqPCphVYmBsK3H/RXVZuvF/GlDGp60NU
	 a8eLUwPqHUA810Zs8iQgAKExeeIdV0y/AHzCBFGO6JMcf0OdHPe+1nzFO2gZDJoWq6LZi
	 T3bJsJllY8VpAxgzQG/W4LviICzjMk74MHZh7TlllT+mpGppaT9haLZBwrRVibgD6Psos
	 Rg/MUvZJ7q6md2ePkfxJBWZyS5QYjC9VdJv/GH8cPjV3c/AM1ikSH33OnKXMygpkE/OQm
	 44WhLzUegXY/TcDExFxvejgEpxPJu94vTkyLXxI96zmlr+VbQg/88tBROiyNp6SlMfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DdrpOFlG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B3606A33A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DdrpOFlG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962461F000C0;
	Wed, 25 Nov 2026 20:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795636979;
	bh=qIjur6b5aQg0Uj3n7Ry6G4ux8kTyfhzUhutSKontryc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DdrpOFlGop5TY4Xo2xhNkfkQRSQVOs5zzqrcly5C1wTVvqSDaXZ9hVe6CmA8fgQt1
	 fi4wg2JgkQqupDiCAzsLzQzbVxzvNVfCL0FwJrBnJnFLahJW9RTmE0kDXjX26OvNfI
	 lA1bbU/L0Ex0ob3D0OfQON/Tr+Z5NwTHyWZyHu7cKNnqVnZ0cSGz/Hd2u7KmgEGBu0
	 MTutRIv0qVRSsvFNUsc63SZpRqOB3IR3dvkgVnaWNv1jsKra7aUKtBG3CJEslznxPl
	 6Ym45RU6HF726NT+aqNp3PMXnEXSe8V5qacf9XJErg70eNOunXqcvAz4SKSajGNPp4
	 WIEAi0XQXq5nQ==
Subject: Re: [PATCH net-next v12 4/4] net/sched: cake: hash before segmenting
 and reject an overlong split
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com,
 toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Date: Wed, 25 Nov 2026 20:02:58 +0000
Message-ID: <179563697816.3135.394553088659517643@kernel.org>
In-Reply-To: <QDISC-BA27.v12.r0.20261120184210-4@mojatatu.com>
References: <QDISC-BA27.v12.r0.20261120184210-4@mojatatu.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The reproducer in the commit message does not reach the new
  split-sum rejection in cake_enqueue() (net/sched/sch_cake.c).
- [Medium] The new split-GSO admission check in cake_enqueue() only
  bounds cake's own backlog against bare U32_MAX.
- [Low] The patch fixes user-visible bugs in cake_enqueue() but has no
  Fixes: tag.

--

net/sched: cake: hash before segmenting and reject an overlong split

This patch splits cake_hash() into a side-effect-free cake_hash_keys() and
a cake_hash_resolve() that commits the set-associative state only after the
packet is admitted. It moves split-GSO segmentation ahead of the resolve,
sums the segment lengths, and drops the whole segment list if the sum
would wrap the backlog. It also reads flow_mode once with READ_ONCE() and
sets qdisc drop reasons on the segmentation-failure and overlimit paths.

Link: https://lore.kernel.org/netdev/179231933068.3135.80340792633077986@kernel.org/
Link: https://lore.kernel.org/netdev/179269577270.3135.16072065138845192450@kernel.org/

> Conditions to recreate the bug:
>   ip tuntap add tun0 mode tun
>   ip link set tun0 txqueuelen 32 up
>   ip addr add 10.99.0.1/24 dev tun0
>   # hold the tun fd open without reading so the backlog persists; a stab
>   # overhead of 1048468 accounts each 92-byte packet at 1048560 bytes, so
>   # 4095 queued packets leave 65519 bytes below QDISC_MAX_BACKLOG.  A
>   # 65000-byte UDP_SEGMENT payload with a 1400-byte segment size then has
>   # a segment sum past the remaining headroom, and cake rejects the whole
>   # split.  Setup needs CAP_NET_ADMIN; the payload itself does not.
>   tc qdisc add dev tun0 root handle 1: stab overhead 1048468 \
>       cake split-gso memlimit 512Mb

[Severity: Medium]
Does this reproducer actually reach the new split-sum check in
cake_enqueue()?

The 65519 figure assumes QDISC_MAX_BACKLOG is U32_MAX - 1 MiB. However,
include/net/sch_generic.h defines it as:

#define QDISC_MAX_BACKLOG	(U32_MAX - 2 * QDISC_PKT_LEN_MAX)

That is 4292870143.

With 4095 packets queued, the backlog is 4095 * 1048560 = 4293853200,
which is already above QDISC_MAX_BACKLOG. __qdisc_calculate_pkt_len()
clamps the stab length to QDISC_PKT_LEN_MAX, so qdisc_backlog_overflow()
takes this branch:

	if (likely(len <= QDISC_PKT_LEN_MAX))
		return backlog > QDISC_MAX_BACKLOG;

The existing guard therefore drops the GSO skb before cake_hash_keys()
or skb_gso_segment() run.

With 4094 packets queued, the backlog is 4292804640 and the skb passes
the guard. slen is 65000 + 47 * 28 = 66316, so backlog + slen is
4292870956. That is below U32_MAX, so the split is admitted.

With a stab, the guard always leaves at least 2 MiB of headroom.
Without a stab, slen equals qdisc_pkt_len(), which the guard already
covers. So the new check can only fire for a segment sum above 2 MiB.
Could the reproducer describe a case that hits the new rejection?

There are two smaller wording points in the same message. The subject
says "hash before segmenting", but the parent already called cake_hash()
before skb_gso_segment(). The actual change is that the resolve now
waits until the packet is admitted.

This part also seems to describe an earlier revision of this patch, not
the code being replaced, because the parent never dropped a segment
list:

  so tagging only the head left the rest with GSO scratch (a
  headroom-sized value) as their drop reason

> diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
> index 803ead499ae97..24fff15f8f7d8 100644
> --- a/net/sched/sch_cake.c
> +++ b/net/sched/sch_cake.c

[ ... ]

> @@ -1788,12 +1815,52 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>  					 QDISC_DROP_OVERLIMIT);
>  	}
>  
> -	/* choose flow to insert into */
> +	/* Select the tin and extract the keys before segmenting:
> +	 * skb_gso_segment() rewrites encapsulated headers, which
> +	 * changes the keys.
> +	 */
>  	b = cake_select_tin(sch, skb);
> -	idx = cake_hash(b, skb, q->config->flow_mode, flow_override,
> -			host_override) + 1;
> +	cake_hash_keys(skb, flow_mode, flow_override, host_override, &keys);
> +
> +	if (qdisc_pkt_segs(skb) > 1 &&
> +	    q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
> +		netdev_features_t features = netif_skb_features(skb);
> +		struct sk_buff *nskb, *seg;
> +
> +		segs = skb_gso_segment(skb, features & ~NETIF_F_GSO_MASK);
> +		if (IS_ERR_OR_NULL(segs))
> +			return qdisc_drop_reason(skb, sch, to_free,
> +						 QDISC_DROP_GENERIC);

[Severity: Low]
This fixes two existing problems in cake_enqueue(). In the old code,
the segmentation-failure drop ran after cake_hash() had already
committed q->tags[], the host indices and the way counters. Also,
qdisc_drop() reported whatever drop reason was left after
__skb_gso_segment() wrote SKB_GSO_CB at cb offset 32.

Should the patch carry a Fixes: tag? The drop reason reporting comes
from commit ff2998f29f390d ("net: sched: introduce qdisc-specific drop
reason tracing"). The hash ordering goes back to cake's split-GSO
support.

> +
> +		/* we never use the original skb after splitting */
> +		consume_skb(skb);
> +		skb = NULL;
> +
> +		/* The split path accounts the segment sum, not the
> +		 * stab-adjusted qdisc_pkt_len(), so check that sum
> +		 * against the same wrap boundary as the enqueue guard.
> +		 */
> +		skb_list_walk_safe(segs, seg, nskb)
> +			slen += seg->len;
> +
> +		if (unlikely((u64)sch->qstats.backlog + slen > U32_MAX)) {

[Severity: Medium]
This check only bounds cake's own backlog. What happens to the ancestor
qdiscs?

Once the split is admitted, this later call passes a negative byte
delta:

		qdisc_tree_reduce_backlog(sch, 1-numsegs, len-slen);

So each ancestor's backlog grows by slen - len, on top of the len it
already counted at its own enqueue.

With a root stab, __qdisc_calculate_pkt_len() clamps len to
QDISC_PKT_LEN_MAX. Each ancestor's qdisc_backlog_overflow() therefore
only tested backlog > QDISC_MAX_BACKLOG with the clamped length, never
with the segment sum.

Suppose cake sits under a classful parent (HTB, DRR, ...) whose other
children hold a backlog near QDISC_MAX_BACKLOG, while cake's own
backlog is small. Can a segment sum above about 2 MiB then wrap the
parent's u32 sch->qstats.backlog?

slen above 2 MiB is also the only case where the new check can fire.
Without a stab, slen equals qdisc_pkt_len() and the existing guard
already covers it. So either the check is unreachable, or the ancestor
wrap is reachable on exactly the inputs it is meant to reject.

The previous patch in the series ("net/sched: cap the accounted backlog
before it can wrap") defers parent aggregate growth only for tbf and
netem. It names cake's split-GSO branch as the case handled here.

The comment's "same wrap boundary as the enqueue guard" is U32_MAX. The
enqueue guard itself keeps a 1-2 MiB reserve below that and does not
cover the ancestors.

It is not proven that a GSO skb with a segment sum above 2 MiB can be
built. The DODGY path caps it at 1 MiB in qdisc_pkt_len_segs_init().
Non-DODGY GRO frag_list aggregates, or BIG TCP with a very small MSS,
might still produce one.

> +			qdisc_qstats_overlimit(sch);
> +			/* __skb_gso_segment() puts SKB_GSO_CB at cb
> +			 * offset 32, over tc_skb_cb.drop_reason; every
> +			 * segment inherits it. Tag each one with the
> +			 * qdisc drop reason.
> +			 */

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-BA27.v12.r0.20261120184210%40mojatatu.com
