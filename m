Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859559;
	b=Q7q/vgNx7fOkDcZIV9wRX9pKwUFYiYiWkea0m/mfDQ4ReXr9BFHL3EUlonGAJqxjH+Tc
	 jwzvvSs7dJIJ2wMHchZ3q5biYz7TJeHZaVSxbdR9vgkKCfCFOZ1zWKRUt8ZzLtlD1Pgwr
	 HlS2olnouKwam/JhQ47FoY+AL1FAlWe8CNl95RjuFmheTdtVfBShwmLGp/uLvb8xn3U39
	 wTYtolbpyEXaEzCa5nTJXNcfwJOka+EfcvZUtWpg0J8vMeL61d8/BKEFWRgAib+MGVAv3
	 5+4fWlHLvv4l1QcDAmzc0EBGkmkiHpj9dXqxFJjyK04wwTjSdWUaV+US1n9MZMyqr0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=daNCiLAHlIawpM/Vc7SGq8lz5Ze02UVcVBEqld5+lr4=;
	b=NZOvQU2XaiEoiXFwSLi1mfhPTAmMfxWLS6oWoa/PmhcAq8055MUuuXl5Y8+yDN5oHDHn
	 UFnajjOk9uI57A3oM81lbC+XZ2tDgFOOJ05fjr0IAfpBCbZ606DsiJocoX6f+FPE33QAk
	 zrMZE4j/Y8iuRsgLqdqTOF7TppOd7cVVbiup18dpEE2mXOS+3CiDVYPV6UZK8G/7Jp7H8
	 Fsj7XFXU57dkGnNywvo4M/GP0FmU3oKFqrCO5N5xO3PTXo7jraNggRlws9QbwV0bLm8ND
	 ZsO5rQ+G8W89Qz/x/CPMlMoaaOANCPsaVdVScn3HOvQcRC/8uqJpX3567k6fYUoLeEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=SRzsmm43;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2A7606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2A7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=SRzsmm43
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94960131b30so244622485a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794859558; x=1795464358; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daNCiLAHlIawpM/Vc7SGq8lz5Ze02UVcVBEqld5+lr4=;
        b=SRzsmm43r/u/xj2idm5w0H8nzXqorpkWph/xkjQWOBivhBnicczXe28TcR6dsue8p7
         0z7Z5VCZOib8rxf3llx2weuAiT2q3pJLvBR1C/0SWKwyqPbEhd0D7s7GZ+njlCeW1poX
         xgq+fVlB/IxSZMWXdswRQEnQ6Ol028rv2btOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859558; x=1795464358;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daNCiLAHlIawpM/Vc7SGq8lz5Ze02UVcVBEqld5+lr4=;
        b=OfTyyi4s98UBUaA9k1g9oqfRzqFNGgKvKwp/OAIEw56k+a1GIvra/WG65jwanR9tie
         lixKcQ9A4iwSjI+pxDsTWiOoCALxFj4ATu7JW2temgvstMMpFEf9oviUjxJDVBW4cgdU
         ddkCCS2HG+jn9RAcZ+yOsXkTki22vZcrjLCmF3WOWnR/RcNr8hbQ9esoD31y8wdhx8rh
         4gIFvGqGgeSL5hzZL4DpuObfvcEYPLzw7P+n4nEsBVneVDfGOpNuSBIJQrHj2QTQq6W1
         a5/LxDfOMcHIiTyGI33xgif4H6bCu/W7CfEz6qJdf5Z7VwFiPUR3fqOYHODp2PNFfmEi
         REKQ==
X-Gm-Message-State: APuU4Z+N+TmLZUvWROk+uXg5SC8ez7Zm38v2faB1l/5h5nmGYfUoLrG7
	Uq0OZ7xSm2fBnMwpxfuRi4UjmumoZUv8DPqRylePCiRQBsl25tj4kKkH3ubC8U5RuLj64t71tLx
	hECk=
X-Gm-Gg: AYBFou1IXn2aDbiyDh3MPME4UeIiE1xRJDthphB8Pi1mlKsBy14Tiw661AU7kFo5+oe
	yUqzU8WjY3X2ARza60Hg3rVzuJaDBTvz48mN8ltZaanS3//hFzLesd+BUqYzVkdAYRoAkqi8FAr
	KfzazdIsuc7nVLu59nxPxaaF+Af/h+zIceXTBla9e2tssPVuT9YUdBZ6GS0F7RjgV1hgXFZj4Hz
	porq8yWQ9NOYbYeHzTk8yMHmAfJ1hFEJQpDAM7RrHY/ju7ZunlS1LK2zjoycM+6k5yESRW0/q8h
	068e21HqdQQhhCdlKdn3VTnLy7Xv6h7xL8yByMSJm3uXoF22WYNburiwOtXYgIMmR7v/hpwuJgS
	sNtgQ4M2UQjwM+2FyAAaCNvQOTpHcqvbv4+sdeX1aQcI2ocQEFnjvbUHiEBnnHSQVb9OQGFrN10
	R+f2uy7pZFFSv+vSrIaU/E40ZtPI6McAWlm4y1OYlVgWTXQgqUm7wFJ4K6CQVcxybrZFpC8pjVx
	AsJk0vamH2hc6tDOnfWB7zZqKz4tV78/MhLrzDDM/utEF7Slfd+JP3/z68oXkWV2kqN16FFhDMf
	mRogN+LASXwsw0wHx6AS05vnQz6kVcX074eXfqkh1dSBOUSBhIXQEbGc5g2r54y5GcU4r3OE3Z0
	=
X-Received: by 2002:a05:620a:880a:b0:93f:3120:6c7c with SMTP id af79cd13be357-9494bb26155mr1791485585a.50.1794859557792;
        Mon, 16 Nov 2026 12:05:57 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7b607sm94333936d6.26.2026.11.16.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:05:57 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	cake@lists.bufferbloat.net,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v11 0/4] net/sched: cap the accounted backlog before it can wrap
Date: Mon, 16 Nov 2026 15:05:50 -0500
Message-Id: <QDISC-BA27.v11.r0.20261116134053@mojatatu.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series bounds the accounted backlog of the AQM qdiscs so that it
cannot wrap mod 2^32.

v1 widened the counters to u64 and was rejected; from v2 on the fix drops
at enqueue instead. The v5 posting was a single patch; at the reviewer's
request it is split into four:

  1/4  cake: classifier refactor: cake_tcf_classify() returns its result
       to the caller.
  2/4  cake: use a dedicated split-GSO list iterator.
  3/4  the fix: drop at enqueue once the stored backlog cannot
       represent the packet's accounted length -- the standing
       QDISC_MAX_BACKLOG ceiling for ordinary packets, a per-packet
       representability check for the larger wire estimates. Covers
       every qdisc in net/sched that adds the incoming packet's
       qdisc_pkt_len() to its own 32-bit backlog: fq_codel, cake,
       codel, pie, fq_pie, dualpi2, RED, pfifo, gred, the leaves fq,
       sfq, hhf, skbprio, netem, choke, etf and taprio, the classful
       parents prio, htb, drr, ets, qfq, hfsc, cbs and sfb, and tbf's
       direct enqueue path.
  4/4  cake: split cake_hash() into side-effect-free key extraction (on
       the unsegmented skb) and set-associative resolution (after
       admission), move the split-GSO path ahead of the resolution, and
       tag every deferred split segment.

For the sashikos: This series targets net-next with no Fixes: (the
aggregate wrap predates every touched qdisc).
Unfortunately something broke in the sashiko reviews. Review for v7
showed up a while later after v8.  So you will see that this series
has fixes (majority in comments and commit logs) from both.

Changes in v11 (Sashiko gemini and nipa reviews of v10, delivered on lore):
  - 3/4: taprio books the packet only once the child accepted it, and the
    segmented path adds a segment to the tree adjustment only when it was
    accepted, so the two counters move by the bytes that were really
    accounted. A child that dropped used to leave its length in taprio's
    backlog, and after 4 GiB of those drops the new guard turned the leak
    into a permanent egress stop.
  - 3/4: netem accounts the duplicate before it re-enters the root and
    undoes it afterwards. The re-entry used to reach every guard with a
    backlog that did not hold the clone yet, so a guard with room for one
    packet admitted two.
  - 3/4: hhf and skbprio pass the net change of an eviction on to the
    ancestors when they return NET_XMIT_CN. The parent does not book the
    incoming packet on CN, so a leaf that evicted a differently sized
    packet left the two counters drifting, and a drain-time undercount of
    a few hundred bytes put the parent's backlog just below zero -- above
    QDISC_MAX_BACKLOG -- where the new guard stops every class.
  - 3/4: htb classifies after the guard, so a terminal action verdict is
    reported as that verdict instead of an overlimit drop.
  - 3/4: RED applies its correction as a delta instead of restoring the
    snapshot taken before the child enqueue, so a concurrent update from
    an offload driver is not lost.
  - 1/4, 2/4 and 4/4 are unchanged from the v10 posting; 2/4 carries the
    Acked-by it received on the v9 posting.

Changes in v10 (late Sashiko nipa review of v9, delivered on lore):
  - Fixed all the commit log complaints
  - 3/4: cover the rest of net/sched. The leaves fq, sfq, hhf, skbprio,
    netem, choke, etf and taprio, the classful parents prio, htb, drr,
    ets, qfq, hfsc, cbs and sfb, and tbf's direct enqueue path all add
    the incoming packet's qdisc_pkt_len() to their own 32-bit backlog,
    so an unguarded leaf can wrap its own counter and an unguarded
    parent can wrap the aggregate it keeps over its children.
  - 3/4: drop plug's redundant qdisc_backlog_overflow() test. plug is
    classless and q->limit is a u32, so its byte test alone already
    bounds the stored backlog below U32_MAX.
  - 3/4: refresh the RED comment that still described the pre-rework
    behaviour.
  - 3/4: drop the Acked-by from the v9 posting, since the patch now
    covers 29 files and the earlier ack no longer applies to it.
  - 2/4: carry the Acked-by from the v9 posting; the patch is unchanged.

Changes in v9 (late Sashiko nipa reviews of v7 and v8, delivered on lore):
  - 1/4: reword the "The Fix:" heading; this patch is preparation, not a
    fix.
  - 1/4: the classifier helper's comments now say the caller must drop
    the skb, since a terminal action does not take ownership of it.
  - 3/4: bound the child backlog as well as RED's aggregate, and re-derive
    the aggregate from snapshots taken before the reservation when the
    enqueue does not succeed. A child that returns NET_XMIT_CN may or may
    not have reduced its ancestors already: pfifo_head_drop, sfq and
    fq_codel do, while hhf and skbprio evict a packet and return without
    qdisc_tree_reduce_backlog(). Keep what the child actually accounted
    for and pass any difference on to the ancestors above RED, so neither
    counter can diverge. Verified with two A/B witnesses: RED over a
    grafted hhf child (control ends with red_backlog 2042016 !=
    child_backlog 6177600) and RED under an HTB class over a grafted
    pfifo_head_drop limit 1, where an unequal shrinking replacement
    otherwise wraps the aggregate and wedges the new admission guard --
    control 4294966052, fixed 92 with RED == child == HTB.
  - 3/4: note that CAKE's own split-GSO branch is the second exception;
    the segments it accounts are summed and checked against
    QDISC_MAX_BACKLOG by 4/4 before any of them is linked.
  - 4/4: add the split-GSO "Conditions to recreate the bug" recipe for the
    segment-sum rejection at the split ceiling.
  - 4/4: the IS_ERR_OR_NULL(segs) segmentation-failure return uses
    qdisc_drop_reason(..., QDISC_DROP_GENERIC); __skb_gso_segment() has
    already clobbered tc_skb_cb.drop_reason through SKB_GSO_CB, so the old
    qdisc_drop() reported an unrelated core reason and skipped
    trace_qdisc_drop.
  - 4/4: pass the flow_mode snapshot to the later flowchain calls
    (cake_get_flow_quantum(), cake_inc_srchost_bulk_flow_count(),
    cake_inc_dsthost_bulk_flow_count()) as well, so one enqueue sees one
    mode (KCSAN-visible race and stale host index).

Changes in v8:
  - 1/4 is cake-only. fq_codel_classify() is line-for-line the same as
    fq_pie_classify(), and fq_pie is not changed by this series, so the
    two stay in lockstep: fq_codel keeps its original classify shape and
    the fq_codel backlog guard is placed inline in its enqueue path
    (3/4) instead. (Toke Høiland-Jørgensen)
  - 3/4: the fq_codel guard sits between idx-- and
    codel_set_enqueue_time(), so a dropped packet cannot touch flow
    state. The commit message is reworded as suggested. (Toke
    Høiland-Jørgensen)
  - 4/4: the original skb is consumed unconditionally right after a
    successful split -- that is the caller's reference, since a fraglist
    GSO takes the list's own reference on the same skb in
    skb_segment_list() -- so the reject branch tags every deferred
    segment and drops the whole list with qdisc_drop_all(), and the
    admitted path no longer consumes the skb after the walk. (Toke
    Høiland-Jørgensen)

Changes in v7:
  - 1/4: complete the fq_codel_classify() comment (Sashiko nipa v6
    main-2-1, Low). The comment listed only the terminal-action and
    no-class-ID cases; the function also returns true when no filter
    matched or when the selected class minor is above q->flows_cnt,
    and those packets are BYPASS drops, not a fallback to hashing as
    in cake. Comment-only, no code change; folded into this resend
    since the series is revised anyway.
  - 3/4: do not clamp the shared qdisc_pkt_len() (Sashiko nipa v6
    main-2-6, Medium). The clamp silently undercharged BPF
    __sk_buff.wire_len, act_police and the HTB/TBF shapers for a valid
    large GSO estimate. The initializer now stays truthful for every
    input and the overflow protection is enqueue admission: each
    affected qdisc drops a packet once the stored backlog cannot
    represent its accounted length -- the standing QDISC_MAX_BACKLOG
    ceiling covers ordinary packets, and a per-packet representability
    check covers the larger wire estimates, which a supported
    small-MSS BIG TCP aggregate can legitimately carry above 1 MiB
    while its raw length stays within GSO_MAX_SIZE. The consumers read
    the real length, and sch_handle_ingress() keeps complete pkt_segs
    metadata.
  - 4/4: tag every deferred split-GSO segment with QDISC_DROP_OVERLIMIT
    (Sashiko nipa v6 gpt-6-astra-2-5, Medium). __skb_gso_segment() stores
    SKB_GSO_CB at cb offset 32, aliasing tc_skb_cb.drop_reason, and the cb
    is copied into every segment, so tagging only the head left the rest
    with GSO scratch as their drop reason.
  - 4/4: snapshot q->config->flow_mode once with READ_ONCE() and pass it
    to both hash helpers (Sashiko nipa v6 gpt-6-astra-5-9, Low). The split
    introduced two loads with the segmentation work between them.
  - Not folded: the 3/4 intermediate-commit split-GSO limitation (4/4
    closes it; the pre-series path was already unbounded) and the
    Fixes:/stable suggestions (intentional net-next target). The gemini
    v6 TC_ACT_CONSUMED High is the v5 finding already rebutted as
    unreachable from a qdisc classify switch.

v6  rewrite as a four-patch series per Toke Høiland-Jørgensen's review of
    v5 (split the classifier refactor, the split-GSO iterator, the
    overflow guard and the cake hash split; drop the machine-written
    prose). Considered the Sashiko gemini v5 TC_ACT_CONSUMED report and
    did not fold it (unreachable; see below). Reworded the cake block
    comment that had an embedded "/*" (Simon Horman's W=1 warning) and
    reworded a comment that overstated the classifier's return cases. The
    TC_ACT_CONSUMED switch case was dropped from the final 0001 because it
    still reached __qdisc_drop(); no in-tree producer can deliver
    TC_ACT_CONSUMED to a qdisc classify switch (act_ct returns it only on
    a clsact/ingress qdisc, act_mirred only for a non-cloning ingress
    redirect, and cls_bpf/act_bpf remap an unknown verdict to UNSPEC).

v5/v4/v3/v2 history: see the v6 posting. In short, v3 adopted the stored
    backlog compare qdisc_backlog_at_max() (no double-count of the 1 MiB
    headroom, no per-enqueue 64-bit add), moved the classifier and the
    ceiling check ahead of the hash/shaper state, and added pfifo; v4
    split the hash keys from the set-associative resolution and handled
    the fraglist-GSO self-link; v2 replaced the rejected u64 widening with
    the enqueue drop; v1 widened the counters.

Jamal Hadi Salim (4):
  net/sched: cake: return the classifier result to the caller
  net/sched: cake: use a dedicated split-GSO list iterator
  net/sched: cap the accounted backlog before it can wrap
  net/sched: cake: hash before segmenting and reject an overlong split

 include/net/pkt_sched.h   |   1 -
 include/net/sch_generic.h |  20 +++++
 net/sched/sch_cake.c      | 185 ++++++++++++++++++++++++++------------
 net/sched/sch_cbs.c       |   6 ++
 net/sched/sch_choke.c     |   6 ++
 net/sched/sch_codel.c     |  16 ++--
 net/sched/sch_drr.c       |   6 ++
 net/sched/sch_dualpi2.c   |   1 +
 net/sched/sch_etf.c       |   6 ++
 net/sched/sch_ets.c       |   6 ++
 net/sched/sch_fifo.c      |   6 ++
 net/sched/sch_fq.c        |   6 ++
 net/sched/sch_fq_codel.c  |   9 ++
 net/sched/sch_fq_pie.c    |   3 +-
 net/sched/sch_gred.c      |   9 ++
 net/sched/sch_hfsc.c      |   6 ++
 net/sched/sch_hhf.c       |  18 +++-
 net/sched/sch_htb.c       |  14 ++-
 net/sched/sch_netem.c     |  18 ++++
 net/sched/sch_pie.c       |   3 +-
 net/sched/sch_plug.c      |   3 +-
 net/sched/sch_prio.c      |   6 ++
 net/sched/sch_qfq.c       |   6 ++
 net/sched/sch_red.c       |  50 +++++++++--
 net/sched/sch_sfb.c       |   6 ++
 net/sched/sch_sfq.c       |   6 ++
 net/sched/sch_skbprio.c   |  17 +++-
 net/sched/sch_taprio.c    |  18 +++-
 net/sched/sch_tbf.c       |   6 ++
 29 files changed, 381 insertions(+), 82 deletions(-)

-- 
2.43.0

