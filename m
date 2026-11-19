Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129567;
	b=N6NYCZNjxyuS7WaDqRQawSDI74YcaW/9ClFg+rUe8LhcXdxLJofWu+cuEWpTZCuXljso
	 ZO9PWi7yX2OXkSI2HnB520sA6SvKW61pmvdwpAHrdvTOju2gJ41d4mEIStMlby4ZpYaV2
	 nGtVw1b7orufVeKek9ppBwOEv/PCOvGQ4VA39Ui6Kdyp94SAeBBa0QoqA3zHgy1H2LnpW
	 dqTErPL6qSvbp/6mdFLOcUPv989zO/xyUZAQSFR+JmYIdSIeJnvyBA8v23+OtVKqHfHfN
	 We6GxcL3pVAhweyvsHDSpXkSFk33mGcGUiBdamcsU2tfB5HOAHqwkBYc1VtSADfatKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129567;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5ymAQAAKQJVjkbYMoP+J2SYkQkkOORoQOdyDURVNF+E=;
	b=VkX974KafLHxuPfKzSGmd24NH55a3ThiXkiMkQ2ggkJ0Nt1ZN7wINxhuCbj9XBpterNz
	 MjNSas329gQ05e9XhN7/8mlIjAA8eBQClSL52yKoMKdm8oc2zXibUVtEOQg0qkKjDERUM
	 Qcvy00kLvuWuNCoTK9NtX+Q4MPuQup/tCLL8kXRC+qIJcxgNtsIDz0B/dUTHJolghAwzp
	 ulyyMnBSEHlQz6YRPpdyIRRuXtIJ8kzAwrIw5m1Ju6bnXWTlQIgSBmPVQ3KZvjrLoDjIV
	 qjx1yRzm9bGO827XrQ3T6JTRJbVfkZYdgS4ojParaWlsRc3Bh55AK9vt7NB+d+ncooA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmSYLhuS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC7606A336
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmSYLhuS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6231F000C4;
	Thu, 19 Nov 2026 23:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129567;
	bh=5ymAQAAKQJVjkbYMoP+J2SYkQkkOORoQOdyDURVNF+E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NmSYLhuSa65f6WSmDEAkTBm7x/BzStRQUXr5ZkWFoxwX3EefKohwZ+orVAKj73feC
	 HY4hRYbD/3SGqGPSfMOZvmXFBhzUUPKHfeIKMF9LFWxj1ZyG/Fh1MoZ3dtjP2SmWc8
	 03lHdu3D+06TlaedWFEy759MR74gZDmhoGpEBLnVwltxvcYYM22bxE+gUYt04Eycwa
	 VQVrM8oWDVXqAhNtCcBynFQCHMlvtU2wWz3H8YFjgHw6eGoW3zIFTjkpsbKTaIZOAm
	 kxYxKqyVrho/I9k+nkRkrgpcQXBkq3Tt98qTwBtRJgVIB+wYr+PgPZRn2/Hf3BwpI+
	 N2fs87CbaYcpw==
Subject: Re: [PATCH net-next v11 4/4] net/sched: cake: hash before segmenting
 and reject an overlong split
From: netdev-bot+sashiko@kernel.org
To: jhs@mojatatu.com
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com,
 toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Date: Thu, 19 Nov 2026 23:06:06 +0000
Message-ID: <179512956604.3136.14111923092083550904@kernel.org>
In-Reply-To: <QDISC-BA27.v11.r0.20261116134053-4@mojatatu.com>
References: <QDISC-BA27.v11.r0.20261116134053-4@mojatatu.com>
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

- [Low] The commit message's reproducer for
  net/sched/sch_cake.c:cake_enqueue() does not show any fault on the…
- [Low] The patch fixes several user-visible defects in
  net/sched/sch_cake.c:cake_enqueue() but has no Fixes: tag.
- [Low] The new split-GSO admission test in
  net/sched/sch_cake.c:cake_enqueue(), `(u64)sch->qstats.backlog + slen…

--

net/sched: cake: hash before segmenting and reject an overlong split

This splits cake_hash() into a side-effect-free cake_hash_keys() and a
cake_hash_resolve() that updates the set-associative state only after the
packet is admitted. It moves split-GSO segmentation ahead of the resolution,
checks the segment sum against QDISC_MAX_BACKLOG and drops the whole list
on rejection. It also reads flow_mode once with READ_ONCE().

Link: https://lore.kernel.org/netdev/179231933068.3135.80340792633077986@kernel.org/
Link: https://lore.kernel.org/netdev/179269577270.3135.16072065138845192450@kernel.org/

> net/sched: cake: hash before segmenting and reject an overlong split

[Severity: Low]
Is "hash before segmenting" accurate for the title? The parent commit
already called cake_hash() on the unsegmented skb, in the "choose flow to
insert into" block, before skb_gso_segment() ran.

The actual change seems to be that the resolution (tags, host indices and
bulk counters) now waits until the packet is admitted.

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

Does this reproducer cause a fault on the unpatched kernel?

Using its numbers: QDISC_MAX_BACKLOG is U32_MAX - (1 << 20) = 4293918719,
and 4095 * 1048560 = 4293853200.

__qdisc_calculate_pkt_len() clamps the GSO skb's stab length
(65028 + 1048468) to QDISC_PKT_LEN_MAX. qdisc_backlog_overflow() then takes
the "backlog > QDISC_MAX_BACKLOG" branch and admits the skb.

On the old code the split path then adds slen = 46 * 1428 + 628 = 66316,
which gives a backlog of 4293919516. That is still below U32_MAX, so nothing
wraps. qdisc_backlog_overflow() then refuses the next enqueue.

So the steps seem to show only that the new check rejects the split. Could
the message say what goes wrong when an overlong split is admitted?

Another patch in the series says the result is a u32 wrap. A wrap needs
slen > U32_MAX - backlog, and qdisc_backlog_overflow() keeps that above
1 MiB. A 64 KiB UDP_SEGMENT payload can't get there.

> Reviewed-by: Victor Nogueira <victor@mojatatu.com>
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
> Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>

[Severity: Low]
Should this have Fixes: tags? The message describes several defects in
cake_enqueue() ("The Fix:", "Conditions to recreate the bug") but doesn't
say which commits introduced them:

- When skb_gso_segment() failed, the skb was dropped after cake_hash() had
  already updated q->tags[], the host tags and indices, and the bulk
  counters. This ordering goes back to cake's original split-GSO code.

- The same drop got a garbage drop reason. __skb_gso_segment() writes
  SKB_GSO_CB(skb)->mac_offset = skb_headroom(skb) at cb offset 32, which
  overlaps tc_skb_cb.drop_reason. __tcf_kfree_skb_list() then passes that
  value to kfree_skb_reason() as an enum skb_drop_reason. Per-skb reason
  reporting already existed in tcf_kfree_skb_list() from 0170d7f47c8bb0.
  So this appears to predate ff2998f29f390d ("net: sched: introduce
  qdisc-specific drop reason tracing"), which only reworked it.

- The flow_mode reads can disagree when cake_mq_change() runs at the same
  time. That came in with the cake_mq work (for example ebc65a873effc8 and
  bc0ce2bad36c28).

Without Fixes: tags, stable backporters can't easily tell which trees need
this.

> diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
> index 803ead499ae97..4851097f0ae5f 100644
> --- a/net/sched/sch_cake.c
> +++ b/net/sched/sch_cake.c

[ ... ]

> @@ -1788,12 +1815,50 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
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
> +	if (qdisc_pkt_segs(skb) > 1 && q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
> +		netdev_features_t features = netif_skb_features(skb);
> +		struct sk_buff *nskb, *seg;
> +
> +		segs = skb_gso_segment(skb, features & ~NETIF_F_GSO_MASK);
> +		if (IS_ERR_OR_NULL(segs))
> +			return qdisc_drop_reason(skb, sch, to_free,
> +						 QDISC_DROP_GENERIC);
> +
> +		/* we never use the original skb after splitting */
> +		consume_skb(skb);
> +		skb = NULL;
> +
> +		/* The split path accounts the segment sum, not the
> +		 * stab-adjusted qdisc_pkt_len(), so check it here.
> +		 */
> +		skb_list_walk_safe(segs, seg, nskb)
> +			slen += seg->len;
> +
> +		if (unlikely((u64)sch->qstats.backlog + slen > QDISC_MAX_BACKLOG)) {

[Severity: Low]
Is this check meant to be stricter than qdisc_backlog_overflow()?

include/net/sch_generic.h defines QDISC_MAX_BACKLOG as a limit on the
backlog before the add:

/* Largest backlog that still has room for one more 1 MiB packet. */
#define QDISC_MAX_BACKLOG	(U32_MAX - QDISC_PKT_LEN_MAX)

qdisc_backlog_overflow() rejects only when adding the length would wrap
U32_MAX:

	if (likely(len <= QDISC_PKT_LEN_MAX))
		return backlog > QDISC_MAX_BACKLOG;
	return len > U32_MAX - backlog;

This check uses the constant as a limit on the backlog after the segments
are added. That makes the split path up to 1 MiB stricter than every other
admission path, including the qdisc_backlog_overflow() call a few lines
above on the same packet.

With the reproducer's numbers, backlog = 4293853200 plus slen = 66316 gives
4293919516. That is above QDISC_MAX_BACKLOG but below U32_MAX.

So the whole split is dropped as QDISC_DROP_OVERLIMIT. With split-gso off,
the same skb would be admitted and charged the larger 1 MiB length.

Would "slen > U32_MAX - sch->qstats.backlog" match the helper's rule?

> +			qdisc_qstats_overlimit(sch);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-BA27.v11.r0.20261116134053%40mojatatu.com
