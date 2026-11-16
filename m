Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828937;
	b=bwkvWfDwyr0qXxWjxREvbjbmIf/4kBE6i/YzTvxeOMWHNlpXkMsBxSNLEMtCzegeNa7L
	 QbTNA7W1XsBxSXjij8iNY6xNScNngtLkeiBraAvrMl0rp8UXBbIIYiR7a+jZ2j+XLCnSe
	 jBKyUqbkJO6k/7RWWooOfE3wiNvuBswlnUF3f0gUVjlamhzneQUU6r4rUNCzhszA2373O
	 kmg5hPCyX9tj+HhRVPGHj3vs8sK57mebuKYgE+Dcj1wMDSCl9LLlBWeWBLeb3HRBln53m
	 dR8zTbtpT45B861Gu8OnxahsfBGh5Lah+HFMDil7IJpRtAYRxpRuteVTrH0J1RS0JaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=WqFK9w3d7dyxhhMSoWn/wcT5uYqWpWdFg3urDQuc+O0=;
	b=hS3jQ5XVRr0SPD4ElMS25IFB7rfafGSXHRsIKnXTWrF6oOiNgel6peBjfDD+RgbNXYSy
	 CfOlLx20CdOXAy9JK/coo+mfK2tpu8uL7w/e0yxQnkOjnrNxRvLd1M7/LkbIlRbdDQQPu
	 m8a6WtYsxn1zOLL4fjRUqM0aJk6tcmZm8cotXiRvKjjbP4qHWo7cBAbCuyDPoi1yNmEso
	 pqFvIgeLU/ltqYXOBCGAiaAYZBNSrq8Z0aBoN3rVA1/MwArWt4bx7riBYH4+PLdclQr9p
	 8Y9VsBtHboDJKKP20drtmR1i8rUTYmMHd3i0i5kxl2qwBSstwxxDtqhQFEup2059Z3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=hYvCQ0pS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2863606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2863606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=hYvCQ0pS
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a07078200fso1394895b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828936; cv=none;
        d=google.com; s=arc-20260327;
        b=R2a6nV4VwTRQkFloxt2ExmSp4e7jsqmF3cPenfgp6Lil9dLiAi8zPVXwljGzne0IfR
         bVLi9PUv8GLgkm29BTI+93zsV28QaGKkfKGNRfJ+9MWbGBQ68b1B34NBZTeG71WtXeis
         G1eLHXyRxsCnqZAdSMjjaHCrWLmIjMVItvjnYZPKPyxNnn0NpWWEN1QrgqtpeBpSnazj
         jSHt7CCh0llx4cB84ET2XRMjoRmwKkh+f6yDBRDrGQOvz7pHSF0HSoGjizGKh8SIUkhm
         J8b4/secC56lLUHfeFOYAXxmQIVTbepYUDdkFsCdoXkx+7hLkvGu4/yZqXfpaYVS/CTN
         Sy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WqFK9w3d7dyxhhMSoWn/wcT5uYqWpWdFg3urDQuc+O0=;
        fh=H04ZLqpSJTDZ+xvkuYgEPTchcnNXmUORjLpxFyL2ApE=;
        b=X1hmGbtkQaeG8izvauWK3YjzYFRma09ZuVfCVbzdrUEH/WUNgAXkvNscph+lZtjV7b
         a+DKeKcNhyOr7Z5rJJSrqWYGCkuzaVreWROVCIOkUS3BH+DQ06aj63+0Y27YwSEWP79a
         h2wzwNPSDImtigW7XCy2aAYAW6iMyla7vhYDg9wV7UVv1FUck3codJaDw4GzzcWNiX66
         c3XPHQejQEVxqtYR95fP1yUbhGVvjXk0j1DA2qhfg4UUmolR3aoENuURbXGTgPhr1C/u
         ipJWWAT0PxFz3jy9O6F0XsKpjhyLrhB3Vx69S3hFWsQU1GCMHYauiL7RAXI1EoPHlRt8
         gozA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794828936; x=1795433736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WqFK9w3d7dyxhhMSoWn/wcT5uYqWpWdFg3urDQuc+O0=;
        b=hYvCQ0pS7v3i7hFzth/9CqNBIph6vsp55IWmIe0Tpd1j7Y0EWDjmUv9N5lvkXjNGA/
         Crs/Jj90jX5BNRzfjHSUvDn9F+9wwc8K3Nh+H2uRVfv0nLApfex3gq1M2V7VBhjqD0kR
         OeUZCiI0KjGNYI1BnRJKPBWLYy6RR1nBbKN7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828936; x=1795433736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqFK9w3d7dyxhhMSoWn/wcT5uYqWpWdFg3urDQuc+O0=;
        b=zxCrhC2De56RtNrnbO7i+lMTbA7FI13OI7L2nxzO5bjpAQiQgJvkUPXplrr2vkTMqM
         +RFRkL2QT/dV+S9X3cnOAXr2rfPA97JYyvP++JYtByfcGk14hBS6fA+1ZiRDKHOIed6G
         GmZem/MRz88OBVJgQjoAh/C6Siid4h+RJSrnoBJnuj6hMojex8e+7vpB/6QaF+DKX87b
         D68KdzzwdjpL0w/4SlZXJpI+oqSoZ/1AjwOWxO+Hl8VmpIhPwl6XCTygTMwj/8P1NOXF
         hs36twtUWtki4EOSFZupkswse4HlBe7Fk7oM2fZYen7G4odA0FlgfHwG7hktl63GuSVl
         6qmA==
X-Gm-Message-State: APuU4Z9m0kAf96gTFETMeHoE4f0Kkt0khQFiuc9zZz8kMJrXWh33qLYF
	4RfOznvaoRK5SUuVXYl02W6wAAcu0UAdH8eANzy5zAH5yFmhCyNLnwVQ56nmCwa0RFiw7VXq+/1
	vUEIsYbh+AyeJoGcFhQ0Q0Xm1h0LnP80Jn9ueMHWN
X-Gm-Gg: AYBFou0mDv1Ytua3cXC8UOvRDVpuzxG2ybGL42xhrNDW6F3PsKEXmzmMffAlmdI+BYJ
	p2hdD0pncm/He5mycYQoCvZH3Yd/KiTH7hPhF0Z5M+URsgf16jIlX5xhV0z9Y6/qyjsDJf4NDtD
	SOmbocPHTOqqFkYPWsl25pGjyHFxMW9mT1jZAXElCKDICMZTcC561j+pvu0DHGi2syI/NhvVBi8
	CuqFtWmWmUqZrjY7ndtkzqnEi3f6otNSlWVPah+Sb0iiEfW8LvUAAjwpmrBsD0b5cuEksAPe3gc
	i7M9ZrqPpZLIVWKP/EXvX+pFAb5HkW/mIYxh4Yg/lbhw7zHnpt4tPf8AJUHHJ1+M/7o0Yo/uKwJ
	vAegnfhWWoVzj2s0zpoz41XMIG1LyphsvxSV/GhF9+c05YPC2oaArBP0VhlwTxyvViO3dEIrg8G
	rOYU/OpQ2k+GMtla8=
X-Received: by 2002:a05:6a21:778c:b0:3e1:1e99:9463 with SMTP id
 adf61e73a8af0-3f7a8ee00a4mr7464255637.38.1794828935729; Mon, 16 Nov 2026
 03:35:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-BA27.v10.r0.20261114071135-3@mojatatu.com> <179478465911.3136.8987850942254431917@kernel.org>
In-Reply-To: <179478465911.3136.8987850942254431917@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 16 Nov 2026 06:35:23 -0500
X-Gm-Features: AclHuK9EteW1MfjN5EgVHP93WoZhZIvw9jnn7CNjBczuSWNNXtCzJzl-mMN7HHc
Message-ID: <CAM0EoM=YozcbD1-mfdWGFvTo=m=g8T7jW3JLo-CQ8eEzcQ8UMg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 3/4] net/sched: cap the accounted backlog
 before it can wrap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com, 
	toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:17=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 8 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 3 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] netem duplication still lets the 32-bit backlog wrap, in netem
>   itself and in every guarded parent above it.
> - [High] The new guard turns an existing taprio accounting leak into a
>   permanent egress blackhole.
> - [High] Known parent-backlog drift becomes a permanent drop-all in the
>   guarded classful parents.

All the highs are legit. V11 coming up. This is the punishment i get
for listening to you.

pw-bot: cr

cheers,
jamal
> - [Medium] htb_enqueue() (net/sched/sch_htb.c) runs htb_classify() in a
>   declaration initializer (line 632), before the new=E2=80=A6
> - [Medium] On any non-success child return, red_enqueue()
>   (net/sched/sch_red.c) now saves `red_backlog =3D=E2=80=A6
> - [Low] The commit has no Fixes: tag, and its only provenance reference
>   is misleading.
> - [Low] The commit message says 'qdisc_pkt_len() itself stays truthful
>   for every input: it is not clamped and the initializer keeps=E2=80=A6
> - [Low] plug_enqueue() (net/sched/sch_plug.c, lines 92-93) changes its
>   admission test from `(u64)sch->qstats.backlog + skb->len <=3D q->limit`=
=E2=80=A6
>
> --
>
> net/sched: cap the accounted backlog before it can wrap
>
> This patch adds qdisc_backlog_overflow() and calls it on the enqueue path
> of most qdiscs under net/sched. The goal is that a stab-inflated or
> GSO-inflated qdisc_pkt_len() can no longer wrap the 32-bit
> sch->qstats.backlog. RED now reserves the length in its own backlog befor=
e
> calling the child and re-derives the aggregate on failure, and plug's
> admission test switches from skb->len to qdisc_pkt_len().
>
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260818101130.=
16203-1-jhs@mojatatu.com
> Link: https://lore.kernel.org/netdev/CANn89iLfMJV7ancKH1Gjzzm7ZUG-gKcrczk=
JjJEWN5sCuWd-ug@mail.gmail.com/
> Link: https://lore.kernel.org/netdev/CANn89i+GOFH_8g+vSV0jUj0aBqLYVWuFOrH=
uDggZu9kPC_m6tQ@mail.gmail.com/
> Link: https://lore.kernel.org/netdev/87a4oottcj.fsf@toke.dk/
> Link: https://lore.kernel.org/netdev/87pkxks68f.fsf@toke.dk/
> Link: https://lore.kernel.org/netdev/179231932946.3135.749747899018638568=
8@kernel.org/
> Link: https://lore.kernel.org/netdev/179269577131.3135.396791539040313801=
5@kernel.org/
>
> > This is a followup of commit 709f34f7c28d ("net/sched: fq: add overflow
> > bounds to quantum and initial quantum") as reported by Sashiko.
>
> [Severity: Low]
> Is 709f34f7c28d the right reference? That commit clamps fq's
> psched_mtu() derived quantum and initial_quantum, and it carries its own
> Fixes: afe4fd062416. It never touches qstats.backlog accounting.
>
> The wrap fixed here comes from a stab-inflated or GSO-inflated
> qdisc_pkt_len() being added to each qdisc's 32-bit backlog, and that is
> much older.
>
> The message describes a user-reachable NULL flow->head dereference in
> fq_codel_drop(). Could a Fixes: tag be added so stable maintainers know
> which trees need this?
>
> > qdisc_pkt_len() itself stays truthful for every input: it is not
> > clamped and the initializer keeps succeeding, so BPF
>
> [Severity: Low]
> Does this match the current tree? __qdisc_calculate_pkt_len() in
> net/sched/sch_api.c clamps the stab-computed length:
>
>         pkt_len =3D clamp_t(int, pkt_len, 1, QDISC_PKT_LEN_MAX);
>
> Also, qdisc_pkt_len_segs_init() in net/core/dev.c rejects SKB_GSO_DODGY
> skbs whose wire estimate is above QDISC_PKT_LEN_MAX:
>
>                 if (unlikely(gso_segs > GSO_MAX_SEGS ||
>                              skb->len + (u64)(gso_segs - 1) * hdr_len >
>                              QDISC_PKT_LEN_MAX))
>                         return SKB_DROP_REASON_SKB_BAD_GSO;
>
> The sentence also contradicts the earlier statement that a stab inflates
> qdisc_pkt_len() "up to QDISC_PKT_LEN_MAX". Was the intent that this patch
> adds no further clamp on the trusted GSO path?
>
> [ ... ]
>
> > diff --git a/net/sched/sch_htb.c b/net/sched/sch_htb.c
> > index 1ba67b121de47..4ee8d3fe9cae9 100644
> > --- a/net/sched/sch_htb.c
> > +++ b/net/sched/sch_htb.c
> > @@ -630,6 +630,12 @@ static int htb_enqueue(struct sk_buff *skb, struct=
 Qdisc *sch,
> >       struct htb_sched *q =3D qdisc_priv(sch);
> >       struct htb_class *cl =3D htb_classify(skb, sch, &ret);
> >
> > +     if (unlikely(qdisc_backlog_overflow(sch, skb))) {
>
> [Severity: Medium]
> htb_classify() runs in the declaration initializer, before this guard.
> That means filter actions such as mirred, police and ct have already run.
>
> Suppose the classifier returned NULL with NET_XMIT_SUCCESS |
> __NET_XMIT_STOLEN (TC_ACT_STOLEN, QUEUED or TRAP). The existing branch
> would return ret without counting a drop:
>
>         } else if (!cl) {
>                 if (ret & __NET_XMIT_BYPASS)
>                         qdisc_qstats_drop(sch);
>                 __qdisc_drop(skb, to_free);
>                 return ret;
>
> When the backlog is at the ceiling, does this guard count an overlimit
> and a drop instead, and return NET_XMIT_DROP for a packet the classifier
> already consumed? Parents would then count a drop too, because
> net_xmit_drop_count() is 1 for a non-STOLEN code.
>
> The other classful qdiscs in the patch (prio, drr, ets, hfsc, qfq, sfq,
> sfb) check before classifying. fq_codel, cake and fq_pie handle the
> terminal verdict before the guard. Should htb do one of the two?
>
> [Severity: High]
> Can this guard permanently block the whole htb tree when a leaf is hhf
> or skbprio? Both return NET_XMIT_CN after evicting a different packet,
> and neither calls qdisc_tree_reduce_backlog(). The RED comment in this
> patch names both:
>
> net/sched/sch_hhf.c:hhf_enqueue() {
>     ...
>         if (hhf_drop(sch, to_free) =3D=3D idx)
>                 return NET_XMIT_CN;
>     ...
> }
>
> htb_enqueue() only adds len on NET_XMIT_SUCCESS. So it keeps counting
> the evicted packet, and on dequeue it subtracts the new packet's length.
> Take an hhf leaf at its limit: a 1500 byte heavy-hitter packet that
> evicts a 100 byte head leaves htb undercounting by 1400 bytes.
>
> When the queue drains, htb's backlog ends up at 2^32 - 1400. That is
> above QDISC_MAX_BACKLOG (2^32 - 1 - 2^20). htb's backlog only changes on
> enqueue and dequeue, so it stays there. qdisc_backlog_overflow() then
> rejects every later packet for every class until the qdisc is
> reconfigured. Any net undercount between 1 byte and 1 MiB at drain time
> has the same effect.
>
> skbprio (default limit 64) does the same under prio or htb when large
> high-priority packets evict small low-priority ones. prio, drr, ets,
> qfq, hfsc, cbs, sfb and tbf use the same add-on-success pattern.
>
> Before this patch the drift only made the stats wrong. Only RED gets the
> re-derivation. Do the other parents need similar handling?
>
> > diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> > index 1dc2924890eb5..9a7b11594fff0 100644
> > --- a/net/sched/sch_netem.c
> > +++ b/net/sched/sch_netem.c
> > @@ -467,6 +467,12 @@ static int netem_enqueue(struct sk_buff *skb, stru=
ct Qdisc *sch,
> >       unsigned int prev_len =3D qdisc_pkt_len(skb);
> >       int count =3D 1;
> >
> > +     if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> > +             qdisc_qstats_overlimit(sch);
> > +             return qdisc_drop_reason(skb, sch, to_free,
> > +                                      QDISC_DROP_OVERLIMIT);
> > +     }
>
> [Severity: High]
> Can netem duplication still wrap the backlog? This guard runs once, on
> the backlog from before either packet is accounted. Later in
> netem_enqueue(), the duplicate goes back through the root before the
> original is accounted:
>
> net/sched/sch_netem.c:netem_enqueue() {
>     ...
>                 skb2->tc_depth++; /* prevent duplicating a dup... */
>                 rootq->enqueue(skb2, rootq, to_free);
>                 skb2 =3D NULL;
>         }
>
>         qdisc_qstats_backlog_inc(sch, skb);
>     ...
> }
>
> The re-entered root enqueue reaches each ancestor's guard, and netem's
> own guard, with the same old backlog. They all pass and add len(skb2).
> The outer call then adds len(skb).
>
> Parents such as prio_enqueue() only add len after the child returns:
>
>         ret =3D qdisc_enqueue(skb, qdisc, to_free);
>         if (ret =3D=3D NET_XMIT_SUCCESS) {
>                 qstats_backlog_add(sch, len);
>
> So prio, htb, drr, ets, hfsc, qfq, sfb, cbs and tbf also take two
> packets per check, but QDISC_MAX_BACKLOG only leaves room for one
> QDISC_PKT_LEN_MAX packet.
>
> Example: stab overhead 2000000000 (clamped to 1 MiB), netem duplicate
> 100%, a limit of 4096 or more, and a delay. The backlog grows in 2 MiB
> steps. At 4094 MiB the guard passes and the backlog ends at 4096 MiB,
> which wraps to 0. This happens with netem as root, and also as a leaf
> under htb or prio.
>
> Under RED, the reservation covers RED's own counter. But
> qdisc_backlog_overflow(child, skb) still sees netem's stale value, so
> netem's backlog, which RED feeds into red_calc_qavg(), can still wrap.
>
> The RED comment mentions the netem clone re-entry, yet the commit
> message lists netem and these parents as covered. Would reserving before
> calling the child, or leaving headroom for two packets, close this path?
>
> [ ... ]
>
> > diff --git a/net/sched/sch_plug.c b/net/sched/sch_plug.c
> > index b60ddfee6a68a..5654e5310fb58 100644
> > --- a/net/sched/sch_plug.c
> > +++ b/net/sched/sch_plug.c
> > @@ -89,7 +89,8 @@ static int plug_enqueue(struct sk_buff *skb, struct Q=
disc *sch,
> >  {
> >       struct plug_sched_data *q =3D qdisc_priv(sch);
> >
> > -     if (likely((u64)sch->qstats.backlog + skb->len <=3D q->limit)) {
> > +     if (likely((u64)sch->qstats.backlog + qdisc_pkt_len(skb) <=3D
> > +                q->limit)) {
>
> [Severity: Low]
> This isn't a bug, but it changes what plug's configured byte limit means.
> The limit now includes stab overhead and the per-segment headers that
> qdisc_pkt_len_segs_init() adds for GSO skbs.
>
> Existing plug setups (for example Remus/COLO style checkpointing) that
> carry GSO traffic or have a stab attached will reach the limit sooner.
> Could the commit message mention this change in behaviour?
>
> [ ... ]
>
> > diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
> > index d7598214270b8..f3783e436da7c 100644
> > --- a/net/sched/sch_red.c
> > +++ b/net/sched/sch_red.c
>
> [ ... ]
>
> > @@ -136,14 +149,37 @@ static int red_enqueue(struct sk_buff *skb, struc=
t Qdisc *sch,
> >       }
> >
> >       len =3D qdisc_pkt_len(skb);
> > +     /* Reserve the length before the child sees the packet: netem
> > +      * can re-enqueue a clone here before the backlog is updated.
> > +      */
> > +     red_backlog =3D READ_ONCE(sch->qstats.backlog);
> > +     child_backlog =3D READ_ONCE(child->qstats.backlog);
> > +     qstats_backlog_add(sch, len);
> >       ret =3D qdisc_enqueue(skb, child, to_free);
> >       if (likely(ret =3D=3D NET_XMIT_SUCCESS)) {
> > -             qstats_backlog_add(sch, len);
> >               qdisc_qlen_inc(sch);
> > -     } else if (net_xmit_drop_count(ret)) {
> > -             WRITE_ONCE(q->stats.pdrop,
> > -                        q->stats.pdrop + 1);
> > -             qdisc_qstats_drop(sch);
> > +     } else {
> > +             u32 propagated, grew;
> > +
>
> [ ... ]
>
> > +             propagated =3D READ_ONCE(sch->qstats.backlog) -
> > +                          red_backlog - len;
> > +             grew =3D READ_ONCE(child->qstats.backlog) - child_backlog=
;
> > +             WRITE_ONCE(sch->qstats.backlog, red_backlog + grew);
>
> [Severity: Medium]
> Can this absolute write-back lose a concurrent update to
> sch->qstats.backlog? red_backlog is sampled before
> qdisc_enqueue(skb, child), and the field is overwritten only after the
> whole child enqueue has finished. That can include classification and
> netem's root re-enqueue.
>
> One writer does not hold the root lock. tc_fill_qdisc() calls
> q->ops->dump() under RTNL only, and red_dump()->red_dump_offload_stats()
> passes the qstats to the driver:
>
>         .stats.qstats =3D &sch->qstats,
>
> mlxsw then does a read-modify-write on it:
>
> drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c:mlxsw_sp_qdisc_updat=
e_stats() {
>     ...
>         stats_ptr->qstats->backlog +=3D mlxsw_sp_cells_bytes(mlxsw_sp, ba=
cklog);
>     ...
> }
>
> If that delta is lost, later negative deltas from the driver (or the
> clean-stats qstats->backlog -=3D backlog) can push RED's backlog below it=
s
> true value and wrap it. Once the wrapped value is above
> QDISC_MAX_BACKLOG, qdisc_backlog_overflow(sch, skb) drops every software
> path packet at RED.
>
> Before this patch, this writer could only race a single in-place +=3D.
> Could the failure path apply a delta instead of restoring the snapshot?
>
> [ ... ]
>
> > diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> > index 5a1dca9d5e9de..bdb2596de0ef5 100644
> > --- a/net/sched/sch_taprio.c
> > +++ b/net/sched/sch_taprio.c
> > @@ -590,6 +590,12 @@ static int taprio_enqueue_one(struct sk_buff *skb,=
 struct Qdisc *sch,
> >  {
> >       struct taprio_sched *q =3D qdisc_priv(sch);
> >
> > +     if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> > +             qdisc_qstats_overlimit(sch);
> > +             return qdisc_drop_reason(skb, sch, to_free,
> > +                                      QDISC_DROP_OVERLIMIT);
> > +     }
>
> [Severity: High]
> Does this guard turn taprio's existing backlog leak into a permanent
> egress blackhole? taprio_enqueue_one() accounts the packet before the
> child enqueue, and nothing undoes that if the child drops it:
>
> net/sched/sch_taprio.c:taprio_enqueue_one() {
>     ...
>         qdisc_qstats_backlog_inc(sch, skb);
>         qdisc_qlen_inc(sch);
>
>         return qdisc_enqueue(skb, child, to_free);
> }
>
> In software mode, taprio_init() creates the per-txq children with
> qdisc_create_dflt(..., &pfifo_qdisc_ops, ...). pfifo drops through
> qdisc_drop() and does not call qdisc_tree_reduce_backlog().
> taprio_dequeue_from_txq() only decrements the backlog for packets it
> actually dequeues.
>
> So each time a gate window is oversubscribed, every child drop leaves
> its qdisc_pkt_len() in taprio's backlog. After about 4 GiB of such drops
> (roughly 2.9M 1500 byte packets), the backlog passes QDISC_MAX_BACKLOG.
> >From then on this check drops every packet on the interface, and nothing
> brings the counter down until the qdisc is reset.
>
> taprio_enqueue_segmented() leaks the same way through
> taprio_enqueue_one(). Before this patch, the leak only made the stats
> wrong.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-BA27.v10.r0.20261114071135%40mojatatu.com
