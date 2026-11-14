Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658473;
	b=cjKp6BoUSfEBkZjN+2M0iKwF1lNANxiDbDFpYIt5SMiGPw1V81MdcMqZJ0zsdqyTb867
	 EwywT6pgdN/48xsdbaFvNP9ZS1OAXmx5d8U5/xQsmzzvlk49h85/6yqnbWHYzBrHj7ZHz
	 vOMKL8xkYWf7ma4k8Pjbkv2xciMUJvuoR0GCZv0yk5UfIpxZOaW3UByz/ML6hUBpavxkb
	 zv4DHzdETj78tWl+m4BA9t/JvQxfgQ9LZfUF/I5uM5uyf9xiW7nMjUxeGkPzSDwR63fkf
	 cLnLdYRyeOV+yBiHYTpYmiq2gF0KDzJFi9+fImwS2bLpI5svk5xwCvkHjyzCgn02k1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rkHCt23CdBkd3bQntuz/5fjchft9DC79ZRv+oWTy6+A=;
	b=PnnF3Zsm2vSLxzbjMrHBOwYrgbDH7yMgcp/Z+4br4bzcJAmg1DoK830mv5tvoS1F/QNv
	 Fh0SvlLmrYmaOiIBK5zm+HSaEzdjLDnADLmWvhms+PvlBH/FF+zt8Z7qucFfnKChQ+sZc
	 CrvxnM/Xn1XpbLhrMPw2+A7GKQPrUurOjTtzUqx9/Ob8eczjO5A8y07c/Ry6OvAmWzu0e
	 gWHqG+gkC0VYmegryY8pWu6wK6OlSZksxdHQoEF9/6FDsfEC0rWhsxJzFHGx1DbtsONgc
	 ccqbqhvdJ3g/+PW6uGA/g8sTGyNi44toSF0IYLyg1fOOKVJemKKRrGSfaujjLI4o6gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="nz/vgL6A";
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB344606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB344606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=nz/vgL6A
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91eb53957cbso47437536d6.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 04:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794658471; x=1795263271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkHCt23CdBkd3bQntuz/5fjchft9DC79ZRv+oWTy6+A=;
        b=nz/vgL6AlkOZ+PgEQ7j0Gr8NxxW3Vqzi8x0rNCqh+wzi/YG6JaUNWasty/W08+q6Ig
         0FSlhQcpoc/S4li6eLg1J+wafi9Q2+/YhMYwgLF+bH/+5EXPTSQntJcxkl5wSv0qA5sU
         G+FcXgZTgyLtrwRXZPrMLekR7A8dSkviE4l28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794658471; x=1795263271;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rkHCt23CdBkd3bQntuz/5fjchft9DC79ZRv+oWTy6+A=;
        b=ZfaMuPBTHY3pyiS6p2tbY3QUFmSnHpM0h0D2PLwpY7CuXdi6EA2dMmRUE2D4Uzx2L6
         X+f5GHRio1YDsa2PZGl6LoA9Ls+RSlhjCkHbSsGwRZbPA2Zhwep8O5Tk8eDtL79GdGre
         I5CnHbxc1NVXKKYlFLK+JYXF/j5BBEwgTLhUyIpXI92T7HDOrM29ak5k38H7V+sf7jpV
         2VX6gzQo2O06uFdH2sEHTATAs9a6lukVTajrGg6o3v0oI3d4p21gHlvEBuV4vGVhES7e
         85OULCrGF1D8SCc7rXnuKWf87S6W89C32KNbT8DG4yBfedD1AJgi8KaIJemFD7oAeaVG
         ZviA==
X-Gm-Message-State: APuU4Z+kCjEEz8sHvAtT/6hUpoQm1mt+fREm4bPYwWEXtkH95sJ6/8dm
	QP8ofcw4ybtY7F0rSsoX8v/L0FXRc6dRdsX4QRLQHvmGZ077W3NxWRvlkb1E2hgw2XqZnc8FDrk
	X2Jo=
X-Gm-Gg: AYBFou0lqgy7ySgUTKcnVleqozJknE4KMdVC4hTHWvwht+MYzyzPbl+FGxFduHSiiZ+
	OonvnMDCCrJ4lsYFNVtC2chNCiSxhlslOEk9ccjBkdX519LbAEmtAhONNDtluwpTulhVR08qiz1
	cw9ZZYBL8GH67shkIJGbcrnFXKspcfLfF7OvGw+NrulzyIDybFbpzm5QGP8aVi6vJ7MmI6wbDFy
	t3ZoPzCUm4p0QpiFPIUfdhB7WIBc20cS1+mXnfaRWTNUIT15Rn2/t1MzrdWqi8aXmugrkd3Ut4S
	FO6dcZMLf7dxcChjfC8oR9PyOHOTXdl/ifeYNYxX/9pwwyMG1abDSXbu2jux8uZ6rwBJlYKvsQe
	jeKXpk4NEPTvfMeau0Rl4WhvlFcpUZ5vd6fMYF76T9rNHuJmDatis5XYY/74Sifqjuj0T86t06M
	njRHL0Z1rSISdF8erucLJoLpXeh0JISCq1H5SV/q5gIsrGvRt6VFnD5j+S0Nog0bdY4Owap943G
	eGwsfcNwnyYfrGBClOz/gwlNKEji6+Wc1S6OxRXppIqGcpvWZuId/WuRULKzEBdto77s6craxxO
	KsoSiMw0gVPYUzzlKKF/uDvCx4I2rnvpY4ACcSxP5k1SumoHbKHngr3yX63mBd7azcE7zVymbGF
	0oXHfwAKY4EmECyEIpYKymzIu6OoFCwAGc3SU3A==
X-Received: by 2002:a05:6214:cca:b0:91e:f174:bc35 with SMTP id 6a1803df08f44-91f24217866mr80169216d6.27.1794658471326;
        Sat, 14 Nov 2026 04:14:31 -0800 (PST)
Received: from mbili.tail33bf8.ts.net ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm41840486d6.17.2026.11.14.04.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:14:30 -0800 (PST)
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
Subject: [PATCH net-next v10 0/4] net/sched: cap the accounted backlog before it can wrap
Date: Sat, 14 Nov 2026 07:14:22 -0500
Message-Id: <QDISC-BA27.v10.r0.20261114071135@mojatatu.com>
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
 net/sched/sch_hhf.c       |   6 ++
 net/sched/sch_htb.c       |   6 ++
 net/sched/sch_netem.c     |   6 ++
 net/sched/sch_pie.c       |   3 +-
 net/sched/sch_plug.c      |   3 +-
 net/sched/sch_prio.c      |   6 ++
 net/sched/sch_qfq.c       |   6 ++
 net/sched/sch_red.c       |  46 ++++++++--
 net/sched/sch_sfb.c       |   6 ++
 net/sched/sch_sfq.c       |   6 ++
 net/sched/sch_skbprio.c   |   6 ++
 net/sched/sch_taprio.c    |   6 ++
 net/sched/sch_tbf.c       |   6 ++
 29 files changed, 333 insertions(+), 71 deletions(-)

-- 
2.34.1

