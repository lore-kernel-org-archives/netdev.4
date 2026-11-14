Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794656803;
	b=0qwn6JfqIIA1kQyUyJurj+ztDaIKpafelfAkBXoTaLduy7ecEQsSULd/GzzdVlZorQdq
	 dJWsYaYDFZsFpSFk61Y3gmJFAJFciGL2zG08ycAEjUD0/jw9bCwxQNUQdt38wYHfeeYXu
	 HPmY1M3recwSLtiw+x8KWptXbJiIES7ju7DM9M3vV8JYwks2t3xG3s+iRZfLum6PVQC6e
	 M/UBApadkkyMDc3vVijXSBx32knnCrdltleClp1bmKNKCv3Y6DeynQg7eo918d2qW0b2B
	 qHEWznsAhKWXu+KAu4em4AyWnyWeCTEM7d4qH/JDYIZUSp41n6Mf4yDdCdtYvHlP9Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794656803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zTzyJGH6WoifAZTeT+CENrLbVOdkxSUx8AVcMtqZb8s=;
	b=O1/L5RZIUaH5dOHNcZZFuxM049JJWbkPlqlu5c2gjuyFr9L4gg/iXsrHqJPeclVlcKL4
	 iiN2hKZ/FwO7TzS7EmT+bW6kLBLJ/r1ORsHBRKdkNaFltWQZY6zodQGkbG+H3WBe2Sl0R
	 ihSgpOt8NUtgHGx4jX3pdTxQCqjTRyE8Jdczx/PxmFEDQieuzg3ZYA+0xDe2/wxPnzjZO
	 z84rOFFSscO+FMLxtNjmMIrDhcrPs9bsR8F1FVYLYEpmyDtkAnsMiO0bCvyDfIg5l4JJQ
	 yqx2KujZzFF+h/CeG0S/6OeUWLp5/M+VjpyFfSFY821jvN7DzrcxFVyU4oB9CqvW0Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=mpwsVCXw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D025C606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D025C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=mpwsVCXw
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so1797946b3a.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 03:46:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794656801; cv=none;
        d=google.com; s=arc-20260327;
        b=pcVnAIypqcOZTvjmUB6smYn3vTpH+bn8jwbBSIjb3lXHDGnuolBtemirAVN4wNRTYS
         5yk2Ic/bYYiV756CVq3jCnrdzNELvh9UQywU+2ov07l6tckY3TYQXmd/VT91nxfM+uE7
         4lphVi1+vHG/PLa+BQgKTF7ip1Fx9mCX0CfG6jh20Qb2Iz9bhnSfsaFmlfKhGh+NbItV
         aKat6/7jNCW0qIFuLI305Kuzz6I7eFtPXJO4f05Qv3IzBJ4w2sTQagZZZBrucpwLWYtA
         1qtPIjoSn9h/Igmja+5qWcwPP+cxDp+VGRCYVmZN3+UQiQNtIKtUSB4e4POGKnlVeZ0m
         CFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zTzyJGH6WoifAZTeT+CENrLbVOdkxSUx8AVcMtqZb8s=;
        fh=0ND5cusOqB+elCdvGXmAw+cr/viCVJcrDFrkI5lfAxw=;
        b=GJrdTNRDzWaXcAAZ1KpThBR7qp8rq+UBqKG0cZYiBvYPi4wYsuMaTzcpwkXy49Ofd/
         9rJK0+vRCOj1ATjHBpeI1GDGn01n56N+MRVYAyxLz5m0SMmITgh4gSL8Fi9tUPf0aFWh
         aP2coCbgtr4z+sSrKJL1x/Blt4XazYj4JOUJbdzMu637ZygSwaOmOuMz3WCvclP9m5fk
         rxaV2kmzBqTZZxdxk4Cg1wDMnVdroMyG30lfdG/Xfn2RZs8C5JhYWPMulzkjRU1CkUJM
         Is256ohcrrJz7wHzZSU1ifGHYKeFiusbJA8rsRCG7Ze+F1g9ZrkXvQWOAUuQPCGm6NnY
         1rvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794656801; x=1795261601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zTzyJGH6WoifAZTeT+CENrLbVOdkxSUx8AVcMtqZb8s=;
        b=mpwsVCXw/lNL34BLGQtsIPFsv2ZXu1N/rhvuE4UJA//g/g5o98hqoSWmdBylILvhj9
         8lO2RwGIGtp6JOeJNeNPf13lH4EqH3QuiOAFIsWHvLt+pd6SeEkoqsQvZ/WekYKrNBnA
         GO6O9gZpnG6S850Fcv4fED0qf1eW7CHFJ1H7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794656801; x=1795261601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTzyJGH6WoifAZTeT+CENrLbVOdkxSUx8AVcMtqZb8s=;
        b=giN6vnXdrlmjwxgWEa+/Ougrc9YyUnr9cnHqPlfKWYf5DEiLDoAA7vF9UQhoLQPBlc
         tDmg0C87WGwl2EU4bC8i6082DCPw8qHIOo1d9HUA4WesPmd9rn2FqJUXlxtdZOUUzmcw
         150802rgQKfzkueCgB3Rfe96+yywBiVSWoshtEHiWdzDMrJmNTqVss4YOpQqrV5hcNcL
         q9Q0YChHa5uVSEobeo+nU+JM32YGIVet8mT5bWI45QsmUFgW7Mmr6EsmwWKUuVcUrPS8
         KH3Z2C8cad8T0+Vi8YvY7frtBES3K8OSqag291AHsq+lWzfqzGcP253NMwEa5C/kOLUw
         d6qA==
X-Gm-Message-State: APuU4Z+tzKaN8KdHdZffV0lcQcEQRufTZk1Pc5Cxv9gYV5SU520+e66g
	vlbhKHtDHvP6bf7twIvgrAJYGd/riPz/45s8c79hapxIOwI96gr6kIWr/0X3kR3v6jTSiseBuaw
	XoXa/cMpLAFXgxdlKytmUP8h4QnGTmvU7PAucFkQxuYF3bTNN81c=
X-Gm-Gg: AYBFou3MjTi11hiHn3/PgxEAyReSVJV8fOSYhliM1dg2eBFAF/J/A26xq/g76jkNsih
	j+rbe5nOKTXXZ2I3HkvtRmtnpBR6igPECYSIbXtDQEP9jSqKoeHYR2rzmg91ktqWSuTnA7TUjsd
	l06hxFfPIFPs1qosLrrnkOtlKw2rxXBFPyeZAEjf8srGmdhIR+uG/W+MrseGMvTGyqaQBIyZcbh
	fg+QvAodS+WW4nFPEXxLKRXfDyVPRmolbNC7VMqC5MWU4Iy83zkcOuXh7Qevh1cX8KXA5jIZKzH
	l/Qx3BJQ4grLyz1rPaGUR50zAMRvPJPcPaEOzWXt7OOyWHaogBFxoMsYMKShkApqfzTFXIGKboJ
	jZunkm1rdFbR1JLnWPQbWvK9+D0AO24jDsvPebgrZ3WlwiTMuKnwsY+zOgilpShV4StPsmbG0VB
	tmW71KAwJG4WQVX1U=
X-Received: by 2002:a05:6a00:3314:b0:851:8baf:5b26 with SMTP id
 d2e1a72fcca58-8beb58bcbe1mr5194903b3a.14.1794656800786; Sat, 14 Nov 2026
 03:46:40 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-BA27.v9.r0.20261108195325@mojatatu.com> <CAM0EoMkoXEtqWZ+qCJqLNjUEP5c86hoJP39ybJE2avaMJjh8_Q@mail.gmail.com>
In-Reply-To: <CAM0EoMkoXEtqWZ+qCJqLNjUEP5c86hoJP39ybJE2avaMJjh8_Q@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 14 Nov 2026 06:46:29 -0500
X-Gm-Features: AclHuK8txKojhpF5okfIuYlBVYiEfa3t4tt6ook4ROYWho7kASs9MEwQMUq1is4
Message-ID: <CAM0EoMkoPrz1+DNbJyviBB1BBEtCuTFvizimc3StBk-r=4BBew@mail.gmail.com>
Subject: Re: [PATCH net-next v9 0/4] net/sched: cap the accounted backlog
 before it can wrap
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Victor Nogueira <victor@mojatatu.com>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	cake@lists.bufferbloat.net, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 6:25=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Tue, Nov 10, 2026 at 9:40=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.co=
m> wrote:
> >
> > This series bounds the accounted backlog of the AQM qdiscs so that it
> > cannot wrap mod 2^32.
> >
> > v1 widened the counters to u64 and was rejected; from v2 on the fix dro=
ps
> > at enqueue instead. The v5 posting was a single patch; at the reviewer'=
s
> > request it is split into four:
> >
> >   1/4  cake: classifier refactor: cake_tcf_classify() returns its resul=
t
> >        to the caller.
> >   2/4  cake: use a dedicated split-GSO list iterator.
> >   3/4  the fix: drop at enqueue once the stored backlog cannot
> >        represent the packet's accounted length -- the standing
> >        QDISC_MAX_BACKLOG ceiling for ordinary packets, a per-packet
> >        representability check for the larger wire estimates. Covers
> >        fq_codel, cake, codel, pie, fq_pie, dualpi2, RED, pfifo, plug
> >        and gred.
> >   4/4  cake: split cake_hash() into side-effect-free key extraction (on
> >        the unsegmented skb) and set-associative resolution (after
> >        admission), move the split-GSO path ahead of the resolution, and
> >        tag every deferred split segment.
> >
> > For the sashikos: This series targets net-next with no Fixes: (the
> > aggregate wrap predates every touched qdisc).
> > Unfortunately something broke in the sashiko reviews. Review for v7
> > showed up a while later after v8.  So you will see that this series
> > has fixes (majority in comments and commit logs) from both.
> >
>
> Responding here to address the two sashiko reviews that came out
> (thanks for getting that out in record time!).
> Sashiko-nipa found legitimate commit log misstatements; the code is fine.
> Looking at the history, this patch series has now been going on for 3
> months! At some point between v7 and v8
> a bunch of merges occurred (one that had the most effect on the
> accuracy of the commit  log was Eric's c6648c9f3b51).
> I am sure all of us look at the code to make sure we are compatible
> with latest target tree, but does anyone look at
> "the comment i made on the commit log i made in v6 is no longer
> accurate somewhere between v7 and v8" - you have
> plenty of time in your hands if you do. But on the other hand i admit
> that the commit log is not accurate anymore.
> I am honestly exhausted sending this series over and over. I can send
> a v10 but sashiko will find something to nitpick on.
> and this could go on for another month and i have plenty of other
> patches in the backlog this is taking time away from.
>
> Thoughts? One other option is i send a fixed v10 and you apply it as
> fast as possible..
>

sigh. damn you sashiko. Because I am in a better mood, I will send a v10.

pw-bot: cr

> cheers,
> jamal
>
> > Changes in v9 (late Sashiko nipa reviews of v7 and v8, delivered on lor=
e):
> >   - 1/4: reword the "The Fix:" heading; this patch is preparation, not =
a
> >     fix.
> >   - 1/4: the classifier helper's comments now say the caller must drop
> >     the skb, since a terminal action does not take ownership of it.
> >   - 3/4: bound the child backlog as well as RED's aggregate, and re-der=
ive
> >     the aggregate from snapshots taken before the reservation when the
> >     enqueue does not succeed. A child that returns NET_XMIT_CN may or m=
ay
> >     not have reduced its ancestors already: pfifo_head_drop, sfq and
> >     fq_codel do, while hhf and skbprio evict a packet and return withou=
t
> >     qdisc_tree_reduce_backlog(). Keep what the child actually accounted
> >     for and pass any difference on to the ancestors above RED, so neith=
er
> >     counter can diverge. Verified with two A/B witnesses: RED over a
> >     grafted hhf child (control ends with red_backlog 2042016 !=3D
> >     child_backlog 6177600) and RED under an HTB class over a grafted
> >     pfifo_head_drop limit 1, where an unequal shrinking replacement
> >     otherwise wraps the aggregate and wedges the new admission guard --
> >     control 4294966052, fixed 92 with RED =3D=3D child =3D=3D HTB.
> >   - 3/4: note that CAKE's own split-GSO branch is the second exception;
> >     the segments it accounts are summed and checked against
> >     QDISC_MAX_BACKLOG by 4/4 before any of them is linked.
> >   - 4/4: add the split-GSO "Conditions to recreate the bug" recipe for =
the
> >     segment-sum rejection at the split ceiling.
> >   - 4/4: the IS_ERR_OR_NULL(segs) segmentation-failure return uses
> >     qdisc_drop_reason(..., QDISC_DROP_GENERIC); __skb_gso_segment() has
> >     already clobbered tc_skb_cb.drop_reason through SKB_GSO_CB, so the =
old
> >     qdisc_drop() reported an unrelated core reason and skipped
> >     trace_qdisc_drop.
> >   - 4/4: pass the flow_mode snapshot to the later flowchain calls
> >     (cake_get_flow_quantum(), cake_inc_srchost_bulk_flow_count(),
> >     cake_inc_dsthost_bulk_flow_count()) as well, so one enqueue sees on=
e
> >     mode (KCSAN-visible race and stale host index).
> >
> > Changes in v8:
> >   - 1/4 is cake-only. fq_codel_classify() is line-for-line the same as
> >     fq_pie_classify(), and fq_pie is not changed by this series, so the
> >     two stay in lockstep: fq_codel keeps its original classify shape an=
d
> >     the fq_codel backlog guard is placed inline in its enqueue path
> >     (3/4) instead. (Toke H=C3=B8iland-J=C3=B8rgensen)
> >   - 3/4: the fq_codel guard sits between idx-- and
> >     codel_set_enqueue_time(), so a dropped packet cannot touch flow
> >     state. The commit message is reworded as suggested. (Toke
> >     H=C3=B8iland-J=C3=B8rgensen)
> >   - 4/4: the original skb is consumed unconditionally right after a
> >     successful split -- that is the caller's reference, since a fraglis=
t
> >     GSO takes the list's own reference on the same skb in
> >     skb_segment_list() -- so the reject branch tags every deferred
> >     segment and drops the whole list with qdisc_drop_all(), and the
> >     admitted path no longer consumes the skb after the walk. (Toke
> >     H=C3=B8iland-J=C3=B8rgensen)
> >
> > Changes in v7:
> >   - 1/4: complete the fq_codel_classify() comment (Sashiko nipa v6
> >     main-2-1, Low). The comment listed only the terminal-action and
> >     no-class-ID cases; the function also returns true when no filter
> >     matched or when the selected class minor is above q->flows_cnt,
> >     and those packets are BYPASS drops, not a fallback to hashing as
> >     in cake. Comment-only, no code change; folded into this resend
> >     since the series is revised anyway.
> >   - 3/4: do not clamp the shared qdisc_pkt_len() (Sashiko nipa v6
> >     main-2-6, Medium). The clamp silently undercharged BPF
> >     __sk_buff.wire_len, act_police and the HTB/TBF shapers for a valid
> >     large GSO estimate. The initializer now stays truthful for every
> >     input and the overflow protection is enqueue admission: each
> >     affected qdisc drops a packet once the stored backlog cannot
> >     represent its accounted length -- the standing QDISC_MAX_BACKLOG
> >     ceiling covers ordinary packets, and a per-packet representability
> >     check covers the larger wire estimates, which a supported
> >     small-MSS BIG TCP aggregate can legitimately carry above 1 MiB
> >     while its raw length stays within GSO_MAX_SIZE. The consumers read
> >     the real length, and sch_handle_ingress() keeps complete pkt_segs
> >     metadata.
> >   - 4/4: tag every deferred split-GSO segment with QDISC_DROP_OVERLIMIT
> >     (Sashiko nipa v6 gpt-6-astra-2-5, Medium). __skb_gso_segment() stor=
es
> >     SKB_GSO_CB at cb offset 32, aliasing tc_skb_cb.drop_reason, and the=
 cb
> >     is copied into every segment, so tagging only the head left the res=
t
> >     with GSO scratch as their drop reason.
> >   - 4/4: snapshot q->config->flow_mode once with READ_ONCE() and pass i=
t
> >     to both hash helpers (Sashiko nipa v6 gpt-6-astra-5-9, Low). The sp=
lit
> >     introduced two loads with the segmentation work between them.
> >   - Not folded: the 3/4 intermediate-commit split-GSO limitation (4/4
> >     closes it; the pre-series path was already unbounded) and the
> >     Fixes:/stable suggestions (intentional net-next target). The gemini
> >     v6 TC_ACT_CONSUMED High is the v5 finding already rebutted as
> >     unreachable from a qdisc classify switch.
> >
> > v6  rewrite as a four-patch series per Toke H=C3=B8iland-J=C3=B8rgensen=
's review of
> >     v5 (split the classifier refactor, the split-GSO iterator, the
> >     overflow guard and the cake hash split; drop the machine-written
> >     prose). Considered the Sashiko gemini v5 TC_ACT_CONSUMED report and
> >     did not fold it (unreachable; see below). Reworded the cake block
> >     comment that had an embedded "/*" (Simon Horman's W=3D1 warning) an=
d
> >     reworded a comment that overstated the classifier's return cases. T=
he
> >     TC_ACT_CONSUMED switch case was dropped from the final 0001 because=
 it
> >     still reached __qdisc_drop(); no in-tree producer can deliver
> >     TC_ACT_CONSUMED to a qdisc classify switch (act_ct returns it only =
on
> >     a clsact/ingress qdisc, act_mirred only for a non-cloning ingress
> >     redirect, and cls_bpf/act_bpf remap an unknown verdict to UNSPEC).
> >
> > v5/v4/v3/v2 history: see the v6 posting. In short, v3 adopted the store=
d
> >     backlog compare qdisc_backlog_at_max() (no double-count of the 1 Mi=
B
> >     headroom, no per-enqueue 64-bit add), moved the classifier and the
> >     ceiling check ahead of the hash/shaper state, and added pfifo; v4
> >     split the hash keys from the set-associative resolution and handled
> >     the fraglist-GSO self-link; v2 replaced the rejected u64 widening w=
ith
> >     the enqueue drop; v1 widened the counters.
> >
> > Jamal Hadi Salim (4):
> >   net/sched: cake: return the classifier result to the caller
> >   net/sched: cake: use a dedicated split-GSO list iterator
> >   net/sched: cap the accounted backlog before it can wrap
> >   net/sched: cake: hash before segmenting and reject an overlong split
> >
> >  include/net/pkt_sched.h   |   1 -
> >  include/net/sch_generic.h |  20 +++++
> >  net/sched/sch_cake.c      | 185 ++++++++++++++++++++++++++------------
> >  net/sched/sch_codel.c     |  16 ++--
> >  net/sched/sch_dualpi2.c   |   1 +
> >  net/sched/sch_fifo.c      |   6 ++
> >  net/sched/sch_fq_codel.c  |   9 ++
> >  net/sched/sch_fq_pie.c    |   3 +-
> >  net/sched/sch_gred.c      |   9 ++
> >  net/sched/sch_pie.c       |   3 +-
> >  net/sched/sch_plug.c      |   9 +-
> >  net/sched/sch_red.c       |  46 ++++++++--
> >  12 files changed, 237 insertions(+), 71 deletions(-)
> >
> > --
> > 2.43.0
> >
