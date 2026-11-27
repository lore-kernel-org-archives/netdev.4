Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780779;
	b=r7zGMeZTnp20gwm+R/1qMMfLG8F7YiO15/AIsSqUR6Ff5Vsmf7SnJKO1nrtUZGu+YhN1
	 t+0w8frfXabcSfzgEmEe5z5hqtPI4YgBp03PMrFsYLcjN+sK4Sz6jcubqjGIRg/F4psVW
	 iZ9B9mnoDwbmOZ4YL+urzj96a/TBYet/hxemk75AC5iaU8jteaLQY9T16RcswUGnphj7B
	 UFm5WXjanM93Ev51pzgI54ARcmlcBCi7eKGhZ/9fw4lzpZoGm7lcDZ5VqBDYClH0JxVVk
	 oDjsmnmwZ+YNjpC4yTn9kvAEaX+s1r7Lw6V0nlCZpagPqQXyfNJ3TOJK4B4DOH3XJXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kEE83A6/87/qkmZfVCwC4bUUab/ynwAytYu5nvbEGfc=;
	b=MhZlTtUiTI5qe1ZhoXhuFzdb3PTFFFmfOndZu5baGi5oQDFXPWckx8EmzLAlAHzYp1Sy
	 3IFJ/Cvb4pwVcXkshGGnkBj0XFN/gBwpjgr9jjq/avsYPQy1JrovKZj9xvSW0Bo9C+L7K
	 SfMuv6ea1OXFbs3wTm5BJacAbSY7Nj8xGSlqiqHmnhoLk9EBQ/m9Xm0tCeM7k6RWMyPx4
	 eNZSaW+NK+pjJ5qPSGy2rnSYr0nZbGZKjU715Bygt9elCrrY9JOE1s5KuwkfBbQa+rbrt
	 TsvmiaVRSG7FkqJnRMLXt3eXvoAkwIoZMjzHjEY5RYIdlJIm1YDtdOhOSWhzGPYyO0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=usUigRmF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BEB606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BEB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=usUigRmF
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cde5a7d79b0so4117990a12.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795780778; cv=none;
        d=google.com; s=arc-20260327;
        b=dCRi5hRl/jUuUbe7qXdyTtymTbxyEuWcRf04lWpsKzVH+u+6PR5kQ9EjTssQTMB0kD
         KiP/xZEAeTMMEPs/QXTtsjbBMXcsYEQFDkHMNG35vU9HULcVQLyRJ9fVrXYzCJDTFnx4
         igBswCBOmuYnUcmumm2QOxDtadIP0+0X5UexBAtt3tiG149ZpP3x1WPvuQiVTub/j0/t
         /tDl+kNVgk8dujt2a+F6yzjmqjB02K9psLaMa6hmz1JQLh1788rvWA1wvWN2/loyCP0A
         QWoWRc/L/wwnGIzu6zSbpoPumaR4Q76R1a+sfadFnW7mxwkH09kI8DN0v3NmzNv8MziK
         hLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kEE83A6/87/qkmZfVCwC4bUUab/ynwAytYu5nvbEGfc=;
        fh=H04ZLqpSJTDZ+xvkuYgEPTchcnNXmUORjLpxFyL2ApE=;
        b=VF5PpvQAYNFrH0PjbrVjYADol24ZYh5bfj6kpBprLHzrp23BufwM2Iw+d88bfEJIhN
         9at14o/XtUCDHETOYVmu4bNbALidEnZD/1K6HZs9/tXCM2oCaaDL+DLU94iGVOK/lvwI
         3csUqimwEtxQpm+WEMsTHSJv9RAsev/24EL70D2umYp/bRSoXmkgP+j+Cx5aS/3CHpW2
         Z87siHDVOBfECP9XVBdSNfrpfpy963JqKOCMtvtbbZXV29mLpsQKZIUo2vAMakGP+LsB
         BOkIOIQPKajZuGn3qiQC0JsfKLvERb3NhH3K71J2Ish+hoxrvgsPI+CbX6OBLTwhhYYK
         mH3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795780778; x=1796385578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEE83A6/87/qkmZfVCwC4bUUab/ynwAytYu5nvbEGfc=;
        b=usUigRmFIj5UwqdKXeD3DJh8HEW4b8ctXDB2oqQ8I60RAV6mRnRAqnt93c45H5Y9x0
         bGvVfDkeLMMDntw5XMiGH0Bx+N8PMrOv6mnxM0mLltOFspMJMhKruUtDRbhWW3EDgoAD
         wI/qRFSADMwJo2OI5xup8+l8lEiaevHgTk6qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780778; x=1796385578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEE83A6/87/qkmZfVCwC4bUUab/ynwAytYu5nvbEGfc=;
        b=aSYVr1y4lalyT1n/R6GnnVXfkC/saXyKKymq3VDIluOpeFj5qwqgKSJUDDhVM8FJuq
         zWUOfaeVXy7ImGbigJjRKEkypxcSJC8FOwBSDUYVqJ+d2Y1iuGUydGiI0GZlbj28WRE9
         Z3IxIorYMZGD8qGrJmvw1xLZ5AqdiKFJesZgta9/SWl7N+EuZsJuB+cIuGMN9wZBEpSx
         lkyl1HWAU333ZGZFVZSGlTIW4xvsk4nrxPmw2aDt5r1zIa/9XWPRl5FST0ssHO/no1Fh
         y8U87jZW8rFFr2I9IKC00p2JVIizO038nSf3NT0HqHaTiAVLjpM1L32DCkLtHx71EMLf
         0UvA==
X-Gm-Message-State: APuU4Z+4etM9IeP1wuLdnzUvsFiuMCSyl7WOeYlS4bp9eZfOOLXeCG2W
	6R5Xh6Ty6mT2BwEdkJm7Ed9iAClsY5eEs/TPKeLb6QorQ3Oz3uTeDIyPEX2d49zNFsrem8OnOV6
	ONTrTWtOGBJz6NlaSKqi4whObSFoNAiUeVo8oj4kj
X-Gm-Gg: AZFdTZcW4GIB7OPYiYs3S4/ZHAYLszAoh/f7/yv0vXjowHFphRO0XQGbIhGpI5WyJDU
	zlN41j+5wFTdy9ykGFQwdAzsRAnz3a/AuLJrPg0kq+D/FljuL4x2jJxsGBupwJk5sdpgqs6ZKpQ
	D0jgjwuuwnpl8PeN8ipmaZzDmUvdAWYoFWtKKljPusaqW5LKQSdsRglyCDIeGOGG2FnXmPtOM3Z
	IQsqoO8Du8lTS0MOvtTWyFwrMLAYVdhj8mqXz+r9qMcIKBgYDA5EP8QiZAsdi31j+XVuX87eIbo
	6B2j5pNUJqV0px5KqkOjrRKNh/o3Yw4Cey9nTalElCh6xyvDFD/ZgoMjXDdV/xe9j+TIa+ENTvp
	gWuX4zEaFZaXIDmpzpqAI/9nc6gUEIKpBcpUrQSEFMdEsVYG3zb7ZgV+Z4GJeUSMbOwNjneCWuc
	15S4dHGvfk/nB9JKE=
X-Received: by 2002:a05:6300:8095:b0:3e2:2b76:bf40 with SMTP id
 adf61e73a8af0-4014c850bdbmr21839919637.26.1795780778478; Fri, 27 Nov 2026
 03:59:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-BA27.v12.r0.20261120184210-3@mojatatu.com> <179563697668.3135.16270822968642633734@kernel.org>
In-Reply-To: <179563697668.3135.16270822968642633734@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 27 Nov 2026 06:59:27 -0500
X-Gm-Features: Aa3M54qUGOt3zeFUh9KoK-UOeI19Ep2fnkLicq4uhiISeBqeh3ajWe_nGngSEew
Message-ID: <CAM0EoMnGi5jUYRZLQdpf1o4iKZYh4nr_QtojF5-95FqxRmJ6SQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 3/4] net/sched: cap the accounted backlog
 before it can wrap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	stephen@networkplumber.org, vinicius.gomes@intel.com, victor@mojatatu.com, 
	toke@toke.dk, bjorn@kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 3:02=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 3 =C2=B7 Medium: 1 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] taprio_enqueue_one() now records the child's backlog and qlen
>   before qdisc_enqueue(skb, child) and afterwards adds the full=E2=80=A6
> - [High] In software mode, taprio's sch->qstats.backlog and sch->q.qlen
>   are only ever reduced in taprio_dequeue_from_txq(), by the skb=E2=80=A6
> - [High] The new enqueue guard decides only from the stored
>   sch->qstats.backlog.
> - [Medium] Parts of the permanent commit body describe an earlier
>   revision (v11), not this code.
> - [Low] The patch bundles several behaviour changes that the permanent
>   commit body does not mention, beyond 'add the enqueue guard'.
> - [Low] The patch fixes a user-visible bug.
> - [Low] net/sched: htb_enqueue() overlimit increment is overwritten by
>   htb_dump()
>

lucky version 13 sent.


cheers,
jamal

> --
>
> net/sched: cap the accounted backlog before it can wrap
>
> This patch adds qdisc_backlog_overflow() and calls it in the enqueue path
> of many qdiscs. Packets are dropped before the 32-bit sch->qstats.backlog
> can wrap. It also makes qdisc_qstats_backlog_dec() saturate at zero,
> changes taprio to mirror the child's backlog change, and has netem
> temporarily book the original packet while its duplicate re-enters the
> root.
>
> Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojatat=
u.com/
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
> > Ordinary packets (qdisc_pkt_len() at most QDISC_PKT_LEN_MAX) are
> > covered by a standing ceiling: drop once the backlog is within
> > QDISC_MAX_BACKLOG (U32_MAX - QDISC_PKT_LEN_MAX) of the wrap point, the
> > largest backlog one more 1 MiB packet cannot wrap, so there is no
> > per-enqueue 64-bit add.
> >
> > A larger wire estimate is checked against the space that actually
> > remains (len > U32_MAX - backlog): qdisc_pkt_len_segs_init() adds the
>
> [ ... ]
>
> > since each adds the packet's own length to a 32-bit backlog. In RED,
> > account the packet before handing it to the child, bound the child
> > backlog too, and re-derive the aggregate from pre-reservation snapshots
> > on failure.
>
> [Severity: Medium]
> Do these parts of the commit body still describe the v12 code?
>
> The only RED change in red_enqueue() is the qdisc_backlog_overflow()
> check on sch and child. The packet is still booked only after the child
> returns NET_XMIT_SUCCESS:
>
>     ret =3D qdisc_enqueue(skb, child, to_free);
>     if (likely(ret =3D=3D NET_XMIT_SUCCESS)) {
>         qstats_backlog_add(sch, len);
>
> There is no early booking and no snapshot re-derivation. The v12 notes
> say that approach was reverted.
>
> The ceiling in the code also differs from the text:
>
>     #define QDISC_MAX_BACKLOG   (U32_MAX - 2 * QDISC_PKT_LEN_MAX)
>
> and so does the large-packet check:
>
>     return (u64)backlog + len + QDISC_PKT_LEN_MAX > U32_MAX;
>
> git am drops the changelog below the --- line. Could the commit body be
> updated to match this version?
>
> > The Fix: drop at enqueue once the stored backlog cannot represent the
> > incoming packet's accounted length.
>
> [Severity: Low]
> This isn't a bug, but the commit body only describes the enqueue guard.
> The patch also carries several other behaviour changes that the body
> does not mention:
>
>   - qdisc_qstats_backlog_dec() now saturates at zero for every qdisc
>     (this appears only in the v12 notes)
>   - new qdisc_tree_reduce_backlog() calls on the NET_XMIT_CN paths of
>     hhf_enqueue() and skbprio_enqueue()
>   - taprio_enqueue_one() now mirrors the child's backlog change instead
>     of booking before the enqueue, and taprio_enqueue_segmented() no
>     longer counts drops on taprio
>   - netem_enqueue() temporarily books the original packet on itself and
>     its ancestors while the duplicate re-enters the root
>   - plug_enqueue() now compares qdisc_pkt_len() against the byte limit
>     instead of skb->len
>
> Could these be described in the commit body, or split out into their own
> patches?
>
> > Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/netdev/20260818101130.16203-1-jhs@mojat=
atu.com/
>
> [ ... ]
>
> > Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
>
> [Severity: Low]
> This isn't a bug, but the commit message describes wrong AQM drop
> decisions and a NULL flow->head dereference in fq_codel_drop(). There is
> no Fixes: tag and no Cc: stable.
>
> Commit 709f34f7c28d, which this patch follows up, carries a Fixes: tag.
>
> Should Fixes: tags be added here as well? The hhf/skbprio CN path and
> taprio accounting changes would need their own.
>
> > diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> > index 1acaadb3e2cf0..bff07ce8c1306 100644
> > --- a/include/net/sch_generic.h
> > +++ b/include/net/sch_generic.h
>
> [ ... ]
>
> > @@ -997,7 +1020,15 @@ static inline void qstats_backlog_sub(struct Qdis=
c *sch, u32 val)
> >  static inline void qdisc_qstats_backlog_dec(struct Qdisc *sch,
> >                                           const struct sk_buff *skb)
> >  {
> > -     qstats_backlog_sub(sch, qdisc_pkt_len(skb));
> > +     u32 backlog =3D READ_ONCE(sch->qstats.backlog);
> > +     u32 len =3D qdisc_pkt_len(skb);
> > +
> > +     /* An offload driver can update the counter from the dump path
> > +      * while the packet is in flight, so a lost increment can leave
> > +      * the backlog below the length being removed.  Do not let that
> > +      * wrap: the enqueue guard would then drop every packet for good.
> > +      */
> > +     WRITE_ONCE(sch->qstats.backlog, backlog > len ? backlog - len : 0=
);
>
> [Severity: High]
> The comment says a wrap here would make the enqueue guard drop every
> packet for good, but only this helper saturates. Can the other
> subtractions from the same counter still wrap it?
>
> qstats_backlog_sub() is unchanged:
>
>     WRITE_ONCE(sch->qstats.backlog, sch->qstats.backlog - val);
>
> The codel, fq_codel, fq_pie and cake dequeue and drop paths use it, and
> so does the new netem undo path. qdisc_tree_reduce_backlog() also calls
> it for every ancestor.
>
> Offload drivers do their own arithmetic on this counter from the dump
> path. mlxsw_sp_qdisc_update_stats() does:
>
>     stats_ptr->qstats->backlog +=3D mlxsw_sp_cells_bytes(mlxsw_sp, backlo=
g);
>
> When the HW backlog shrinks, that delta is effectively negative.
> mlxsw_sp_qdisc_leaf_unoffload() does:
>
>     qstats->backlog -=3D backlog;
>
> Take an mlxsw port with an offloaded prio or ets root, where the stored
> value is S + H (software bytes plus the HW contribution):
>
>   - A dump racing a datapath qstats_backlog_add() loses L.
>   - The software packet dequeues, and the clamp leaves H - L.
>   - The HW backlog drains, mlxsw adds -H, and the counter wraps to
>     about U32_MAX - L, which is above QDISC_MAX_BACKLOG.
>
> Wouldn't prio, ets or red then drop all software-path traffic until the
> qdisc is reset? Before this patch the same wrap only corrupted the
> statistics.
>
> >  }
>
> [ ... ]
>
> > diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> > index 5a1dca9d5e9de..2f199541e0049 100644
> > --- a/net/sched/sch_taprio.c
> > +++ b/net/sched/sch_taprio.c
> > @@ -589,6 +589,15 @@ static int taprio_enqueue_one(struct sk_buff *skb,=
 struct Qdisc *sch,
> >                             struct Qdisc *child, struct sk_buff **to_fr=
ee)
> >  {
> >       struct taprio_sched *q =3D qdisc_priv(sch);
> > +     u32 backlog;
> > +     int qlen;
> > +     int ret;
> > +
> > +     if (unlikely(qdisc_backlog_overflow(sch, skb))) {
> > +             qdisc_qstats_overlimit(sch);
> > +             return qdisc_drop_reason(skb, sch, to_free,
> > +                                      QDISC_DROP_OVERLIMIT);
> > +     }
>
> [Severity: Low]
> This isn't a datapath bug, but will the overlimit counted by the new
> guard in htb_enqueue() ever reach userspace?
>
> HTB keeps its qdisc-level overlimit count in q->overlimits, which
> htb_do_events() increments. htb_dump() then does:
>
>     sch->qstats.overlimits =3D READ_ONCE(q->overlimits);
>
> tc_fill_qdisc() calls this before gnet_stats_copy_queue() serializes
> sch->qstats. Every dump therefore overwrites the
> qdisc_qstats_overlimit(sch) increment made here.
>
> tc -s would then show the backlog-overflow drop without a matching
> overlimit. That is unlike the other qdiscs this patch touches, where
> the overlimit is reported alongside the QDISC_DROP_OVERLIMIT drop.
>
> Should this guard bump q->overlimits instead, for example with
> WRITE_ONCE(q->overlimits, q->overlimits + 1), so that the count
> survives htb_dump()?
>
> [Severity: High]
> In software mode, can taprio's backlog only grow, so that this guard
> eventually trips for good?
>
> taprio_graft() marks every child:
>
>     new->flags |=3D TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
>
> and qdisc_tree_reduce_backlog() stops at such a qdisc:
>
>     if (sch->flags & TCQ_F_NOPARENT)
>         break;
>
> So drops a child makes at dequeue time never reach taprio. Examples are
> fq_codel_dequeue():
>
>     qdisc_tree_reduce_backlog(sch, q->cstats.drop_count,
>                               q->cstats.drop_len);
>
> and the codel and cake dequeue drops. The only decrement of taprio's
> counters is in taprio_dequeue_from_txq(), and it covers just the skb
> that is returned.
>
> Before this patch the drift only made the stats wrong. With this check,
> once the dropped bytes add up past QDISC_MAX_BACKLOG (about 4 GiB),
> would every packet on every txq be dropped with QDISC_DROP_OVERLIMIT
> until the qdisc is reset? Remote senders can drive the congestion that
> causes these AQM drops.
>
> [ ... ]
>
> > @@ -600,10 +609,20 @@ static int taprio_enqueue_one(struct sk_buff *skb=
, struct Qdisc *sch,
> >                       return qdisc_drop(skb, sch, to_free);
> >       }
> >
> > -     qdisc_qstats_backlog_inc(sch, skb);
> > -     qdisc_qlen_inc(sch);
> > +     /* A child may free skb (tbf_segment(), cake's split path) or evi=
ct
> > +      * another packet before returning, so take everything this funct=
ion
> > +      * needs before the handoff and mirror the child's net change.  A
> > +      * child that evicts cannot reach us through
> > +      * qdisc_tree_reduce_backlog() because taprio_graft() marks it
> > +      * TCQ_F_NOPARENT.
> > +      */
> > +     backlog =3D READ_ONCE(child->qstats.backlog);
> > +     qlen =3D qdisc_qlen(child);
> > +     ret =3D qdisc_enqueue(skb, child, to_free);
> > +     qstats_backlog_add(sch, READ_ONCE(child->qstats.backlog) - backlo=
g);
> > +     WRITE_ONCE(sch->q.qlen, sch->q.qlen + qdisc_qlen(child) - qlen);
>
> [Severity: High]
> Does this count a packet twice when the child is netem with duplication
> enabled?
>
> In software mode qdisc_root_bh() for the child is taprio itself.
> netem_enqueue() sends the duplicate back to the root while this outer
> call still holds its snapshot:
>
>     rootq->enqueue(skb2, rootq, to_free);
>
> The clone keeps queue_mapping, so the nested taprio_enqueue() picks the
> same child:
>
> taprio_enqueue_one(skb)              /* snapshot B, Q */
>   qdisc_enqueue(skb, child)
>     netem_enqueue(skb)
>       rootq->enqueue(skb2)           /* taprio_enqueue() */
>         taprio_enqueue_one(skb2)
>           taprio books +L, +1
>       netem books skb
>   qstats_backlog_add(sch, (B + 2L) - B)   /* +2L */
>   sch->q.qlen +=3D 2
>
> That is 3L and 3 on taprio for two queued packets. netem's own
> pre-booking through qdisc_tree_reduce_backlog() stops at the
> TCQ_F_NOPARENT child, so it does not change this. taprio_dequeue_from_txq=
()
> subtracts once per dequeued skb:
>
>     qdisc_qstats_backlog_dec(sch, skb);
>     qdisc_qlen_dec(sch);
>
> Wouldn't L and 1 leak upward on every duplicated packet? The zero clamp
> does not help with upward drift. Once the leaked bytes pass
> QDISC_MAX_BACKLOG, the new guard at the top of taprio_enqueue_one()
> would drop everything until reset.
>
> Before this patch taprio booked each packet exactly once, before the
> child enqueue.
>
> >
> > -     return qdisc_enqueue(skb, child, to_free);
> > +     return ret;
> >  }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-BA27.v12.r0.20261120184210%40mojatatu.com
