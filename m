Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211852;
	b=bytg9cynI04buwrt+K5LGvzyDUywMmi4L6zqgxtVQcfY7M4JONUzxHeTlCFpooxZ6qxu
	 6q0gGPZ4E8z/JuKL3Pb6ajskvCh939+cTrb7rxvKUkHJ0UzgQhyA8PaGH8Yg1CIXVRGV8
	 RnhCABCmIB6rG4HA4kmjrTtk4amcQbZ2PRVkz23gmVwOvP3a/yRFEDTB1xel673KAIBlC
	 Ucv/v5Vep7lCez24zMnjyNKHXdQ+yJ2d43qW6xgQUnmQXNtEyu2Whx0L08T3jiM4Uivv9
	 4/9vXlfWhEDN1nKIwOQ6lPxWhUYHigbtLVuI65kSF8F07UytAQtVp9jDvim57wbFHoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=WB5YrOS6lqLstUxpR641Ej+II1QcAH7KNtKBVfA2Css=;
	b=OlYZlAPeZyNTh9vFXqhnjpqX5qNsU7TuG5ey/o/HBrPO7AUbyfuhHeW48ge7j3knOpS0
	 WRIJ5W4+QFg8UobFMQRFxji4gR3vmSyntpw9ODpyl2OIiY9h/rc4HjtlGwhjjhbOeZWSG
	 t/DMPkxWHx8vgZS88ciz20R5voWx0fZp7uTmeZCTpXN0i8L+Umqt8fpScZD2e6dSEI4rE
	 eJLFioeOgq0aFboeZ4SGSqwkMgI0iUcYwfm6aimh65UMajTtlGM2ixJ6i9P1fQSUSRJnI
	 4pWiduje3TgxYtZ3JZPMvoRhg5/gBgbbacdneqdxVsHFouq/SqyTJRsNSUG1fPMPYtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=JJAwoK30;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE0606A695
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBE0606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=JJAwoK30
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-86298f9267fso819218a34.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795211844; x=1795816644; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WB5YrOS6lqLstUxpR641Ej+II1QcAH7KNtKBVfA2Css=;
        b=JJAwoK30Z1NZo+0BdT3kGKTbsyhKp5l/wQRPEFpuJAUf4wvXTrfuvAsRQLGftwhXCW
         HZUTPSz5NOyoO5gFt/kRZfjmv+KKl98aEJ5V0unKlYr3cpvh12gaqVuGtlbxMegMakYP
         m9RRIE87hmvsP4x41we1T51ftahG6tS3jMLhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211844; x=1795816644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WB5YrOS6lqLstUxpR641Ej+II1QcAH7KNtKBVfA2Css=;
        b=2nHKsYd8wMrHDZY1Cei1AoOd0nRLp3SX9v1+zPPg18JPtS57R7Qdby3uNhTq19dEm1
         0Omd7u3kIvxJTBuJ6MvL0vAvqissn6xdU1LlFtLUQDh5tc2xH97VKR2KLYkv7qjOmbCb
         UDbQ4KZQO5u4Wx3eANFg1gE1n4M7IWduEb6jyycYpYEHF1sau6AJyxLU6NIndNJjD6HV
         kx+5P6D2QtCxaclv/CcW5mDL/jKannUkP93JitkpOGyQZO0Tz5yyxuCcpiJluDvwhMyl
         BxMwuKFsvCTbH3DZMaCXvslmno+0kkio85MC0xDdWsIzHyhiPsZW7yGYTmRHweWoMgzE
         f2qg==
X-Gm-Message-State: APuU4Z93in8BetiAWgO2NOBWM/ruwxXAe8I2YdobhMgeZuLow7EVQEhY
	7VLjjxqUnK082Fd8+LDGqH2FCbtZiBOrIMCWbwl+2nkjLiLej30WBqJaMUGTbrt16PQ16x+Jy7v
	7GNu/xWI=
X-Gm-Gg: AYBFou3W1U/8AUZWbcCdzYdDK0HNoOvdxatt1sCHcL2GLw/p/r69Fx4sLQBll7bGdyg
	5nGuvYKKEsNV9XdLCMvbG+vf+pTeA4quk8tDdSc24EPQox6EdNU2ZIE+jGEVNVBhEr/f2PoDn8D
	xInr7CalFaD9ReE8Hj9akaF8gW1d9Q4nB0HGHtDV1DyYGrbBBK6oWS7NnmZnGJ4sZ+Zo/Am8wQa
	0xOrAfmGftYLZlqD5tyyjNxqgEPZ+Z6HpakRDmNFqNBVFTzYwE2n64joV8hqrpEpnK8UflCFSJe
	y0YkP4NplRPKyy89KArKO4z0Y8OvloIUN1mkWe0039p/+GyPmk1QeUcRKaOlK0etcgVhGGCwGpl
	4VZw65L+6UMKO0c4F9BJa1M/y7N0UCDyVUjofeX4rNkk0ns0SuSpbH9vzP8mXZfjZXtrS5a/Dpl
	mcLzwLjtR1xenkvkVuXm9/2B9SjHzO0NOy3/vny3kQejSYyPLJ3YM+eW8j2lWIul80h5JNQ7Uq8
	3JTQgFrUROVM8jSVY4PdBTDhkAqcxvyrTk52D7t8NC9FXIAdJD5v74zqPSgVy9gfUm1SMzyeU+k
	QB9iCqLxfyWV6lH/6ZWrvPLiHwTqA3qxkzi7Di0rErvf62kpnuXz5lmi+x2UmmKGzty6QjtbjZD
	uhwcdSamz
X-Received: by 2002:a05:6808:6707:b0:573:b33c:1e5f with SMTP id 5614622812f47-57a09504f06mr5047696b6e.12.1795211844221;
        Fri, 20 Nov 2026 13:57:24 -0800 (PST)
Received: from com-75606 ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc61659cb8sm4099130fac.17.2026.11.20.13.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:57:23 -0800 (PST)
Date: Fri, 20 Nov 2026 13:57:21 -0800
From: Kyle Zeng <kylebot@openai.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
	kuba@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net/sched: serialize autonomous timers with qdisc
 resets
Message-ID: <awDCQf7I1sG9LTLa@com-75606>
References: <20261110044450.51921-1-kylebot@openai.com>
 <179465832501.2199510.6314071993812416961@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179465832501.2199510.6314071993812416961@kernel.org>

On Sat, Nov 14, 2026 at 12:12:05PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 2 � Medium: 1 � Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The fix does not cover HTB offload mode.
> - [High] net/sched: sfq_perturbation() runs on detached child before
>   qdisc_reset()
> - [Medium] The new qdisc_lock_root_sleeping() relies on a stated
>   invariant: the sleeping root only changes in dev_graft_qdisc(), under...
> 
> --
> 
> net/sched: serialize autonomous timers with qdisc resets
> 
> This adds qdisc_lock_root_sleeping(). The helper takes the sleeping
> root's lock under RCU and retries if the root changed while it waited.
> The SFQ, RED, PIE, FQ-PIE and DualPI2 timers now use it.
> 
> Default qdisc attach and shutdown now go through dev_graft_qdisc().
> __qdisc_destroy() holds the tree lock across the final qdisc_reset().
> The final resets of TAPRIO children move to taprio_destroy().
> 
> > diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> > index 1acaadb3e2cf0..e234256e6ae81 100644
> > --- a/include/net/sch_generic.h
> > +++ b/include/net/sch_generic.h
> > @@ -608,6 +608,26 @@ static inline spinlock_t *qdisc_root_sleeping_lock(const struct Qdisc *qdisc)
> >  	return qdisc_lock(root);
> >  }
> >  
> > +/* The caller must hold rcu_read_lock().  dev_graft_qdisc() changes the
> > + * sleeping root under the old root's lock, so retry if it changed while
> > + * we were waiting for that lock.
> > + */
> > +static inline spinlock_t *qdisc_lock_root_sleeping(const struct Qdisc *qdisc)
> > +{
> > +	struct Qdisc *root;
> > +	/* Lock of the sleeping root observed under RCU. */
> > +	spinlock_t *lock;
> > +
> > +	for (;;) {
> > +		root = qdisc_root_sleeping(qdisc);
> > +		lock = qdisc_lock(root);
> > +		spin_lock(lock);
> > +		if (root == qdisc_root_sleeping(qdisc))
> > +			return lock;
> > +		spin_unlock(lock);
> > +	}
> > +}
> 
> [Severity: Medium]
> Is the invariant in this comment complete? qdisc_root_sleeping() reads
> qdisc->dev_queue->qdisc_sleeping. qdisc->dev_queue can also change, and
> there it changes without any root lock held:
> 
> net/sched/sch_htb.c:htb_offload_move_qdisc() {
>     ...
> 	if (!(cl_old->leaf.q->flags & TCQ_F_BUILTIN))
> 		cl_old->leaf.q->dev_queue = queue_new;
> 	cl_old->leaf.offload_queue = queue_new;
>     ...
> }
> 
> When destroying is true, both dev_graft_qdisc() calls around this store
> are skipped.
> 
> One possible sequence:
> 
> 1. An HTB offload root is replaced by mq. At the same time, an unlocked
>    filter request holds a reference on the old HTB through
>    __tcf_qdisc_find() -> qdisc_refcount_inc_nz().
> 
> 2. mq_attach() grafts each txq to its own mq child. queue_old and
>    queue_new now have different sleeping roots, O and N.
> 
> 3. The delayed final put calls htb_destroy() ->
>    htb_destroy_class_offload(..., destroying=true). The driver reports
>    a moved classid. htb_offload_move_qdisc() then switches the moved
>    leaf L from queue_old to queue_new with no lock held.
> 
> 4. htb_destroy_class(moved_cl) -> qdisc_put(L) -> __qdisc_destroy(L) ->
>    sch_tree_lock(L) now takes N's lock and calls qdisc_reset(L).
> 
> 5. Suppose L is an SFQ whose sfq_perturbation() validated O before the
>    switch and still holds O's lock. sfq_rehash() and sfq_reset() would
>    then run at the same time on L.
> 
> Can this still reach the final-reset-vs-timer corruption this patch is
> meant to close?
> 
> The two plain reads of qdisc->dev_queue in qdisc_lock_root_sleeping()
> also race with the plain store in htb_offload_move_qdisc().
> 
> The window looks narrow, since the timer has to hold O's lock from
> before the dev_queue switch until __qdisc_destroy() takes N's lock. It
> looks reachable on PREEMPT_RT or with vCPU preemption.
> 
> [ ... ]
> 
> > diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
> > index 8bbcfc9e85d94..2bd3fc65053ac 100644
> > --- a/net/sched/sch_sfq.c
> > +++ b/net/sched/sch_sfq.c
> > @@ -611,8 +611,7 @@ static void sfq_perturbation(struct timer_list *t)
> >  
> >  	get_random_bytes(&nkey, sizeof(nkey));
> >  	rcu_read_lock();
> > -	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
> > -	spin_lock(root_lock);
> > +	root_lock = qdisc_lock_root_sleeping(sch);
> >  	q->perturbation = nkey;
> >  	if (!q->filter_list && q->tail)
> >  		sfq_rehash(sch);
> 
> [Severity: High]
> Does this close the window for a detached tree that still holds
> packets?
> 
> Since 47e8dbb6e763, a root qdisc_graft() calls
> dev_deactivate(dev, false). The old tree therefore keeps its packets
> until this qdisc_reset() runs. Several things happen before we get
> here:
> 
> - dev_graft_qdisc() has switched every txq's sleeping root.
> - qdisc_graft() has done rcu_assign_pointer(dev->qdisc, new ? :
>   &noop_qdisc).
> - __qdisc_destroy() itself has done qdisc_hash_del().
> - gen_kill_estimator() has run, and it can block in
>   timer_shutdown_sync().
> 
> During that window, an SFQ child C of the old root still has q->tail
> set and an armed perturb timer. One possible sequence, for example
> deleting a root prio 1: that has an sfq child with perturb set:
> 
> CPU1 (RTNL)                          CPU2 (perturb timer)
> qdisc_graft(dev, NULL, ...)
>   dev_graft_qdisc() per txq
>   dev->qdisc = &noop_qdisc
>   notify_and_destroy()
>     qdisc_put(old)
>       __qdisc_destroy(old)
>         qdisc_hash_del(old)
>         gen_kill_estimator()
>                                      sfq_perturbation(C)
>                                        qdisc_lock_root_sleeping(C)
>                                          locks new root, passes
>                                        sfq_rehash(C)
>                                          qdisc_tree_reduce_backlog(C)
>         sch_tree_lock(old)
>         qdisc_reset(old)
> 
> The timer validates the new sleeping root. That is the same lock
> sch_tree_lock(old) takes later, so the rehash and the reset are
> serialized.
> 
> However, the tree that C belongs to is no longer reachable.
> qdisc_tree_reduce_backlog() looks up TC_H_MAJ(C->parent) with
> qdisc_lookup_rcu() on the live device. The old root is gone from
> dev->qdisc and from the hash, so the lookup returns NULL and hits
> WARN_ON_ONCE(parentid != TC_H_ROOT).
> 
> If some live qdisc happens to match that major handle, the dropped
> count and drop_len are subtracted from its q.qlen and
> qstats.backlog instead. Those packets never belonged to it, so its
> q.qlen can underflow.
> 
> As far as I can tell, qdisc_tree_reduce_backlog() no longer returns
> early when n and len are both 0. A rehash that drops nothing
> therefore still walks the parents.
> 
> This needs only CAP_NET_ADMIN in a network namespace owned by an
> unprivileged user namespace. With panic_on_warn, the WARN becomes a
> panic.
> 
> The timer behaviour predates this patch. But the commit message says
> the validated root remains current until the timer unlocks, and that
> the final reset is now serialized with autonomous timers. Holding a
> current root's lock does not mean sch is still part of that root's
> tree.
> 
> Should the old tree be emptied before it is unpublished, as
> dev_deactivate() did before 47e8dbb6e763? Or should the autonomous
> timers be stopped, or skip their work on a detached qdisc, before
> the hierarchy is unlinked?
> 
> [Severity: High]
> Does this cover HTB offload mode?
> 
> In offload mode, htb_init() sets TCQ_F_MQROOT on the HTB qdisc, so
> sch_tree_lock(htb) takes qdisc_lock(htb) itself. Each offloaded leaf is
> attached directly to its own txq. qdisc_root_sleeping(leaf) is
> therefore that txq's qdisc_sleeping, never the HTB:
> 
> net/sched/sch_htb.c:htb_graft() {
>     ...
> 	if (q->offload) {
> 		/* One ref for cl->leaf.q, the other for dev_queue->qdisc. */
> 		qdisc_refcount_inc(new);
> 		old_q = htb_graft_helper(dev_queue, new);
> 	}
> 
> 	*old = qdisc_replace(sch, new, &cl->leaf.q);
>     ...
> }
> 
> htb_graft_helper() -> dev_graft_qdisc() sets dev_queue->qdisc_sleeping
> to new. qdisc_replace() -> sch_tree_lock(sch) then takes the HTB's own
> lock. Under that lock, qdisc_purge_queue(old) -> qdisc_reset(old) ->
> sfq_reset() runs.
> 
> With an HTB offload capable device (for example mlx5) and an SFQ leaf
> that has perturb set, can the following happen?
> 
> CPU1 (RTNL)                          CPU2 (perturb timer)
> htb_graft()
>   htb_graft_helper(dev_queue, new)
>                                      sfq_perturbation(old)
>                                        qdisc_lock_root_sleeping(old)
>                                          locks qdisc_lock(new), passes
>   qdisc_replace()
>     sch_tree_lock(htb)
>     qdisc_purge_queue(old)
>       sfq_reset(old)                   sfq_rehash(old)
> 
> The reset holds the HTB's lock and the timer holds new's lock, so
> nothing serializes them. Would this corrupt the slot lists, q->tail,
> q->ht and the per-slot skb lists that the commit message describes?
> 
> htb_delete() in offload mode seems to follow the same pattern. First,
> htb_destroy_class_offload(..., false, ...) calls
> htb_graft_helper(dev_queue, NULL). The txq's sleeping root becomes
> noop_qdisc, or new_q after htb_parent_to_leaf_offload() for a last
> child. Then:
> 
> net/sched/sch_htb.c:htb_delete() {
>     ...
> 	sch_tree_lock(sch);
> 
> 	if (!cl->level)
> 		qdisc_purge_queue(cl->leaf.q);
>     ...
> }
> 
> Meanwhile the leaf's timer takes noop_qdisc's lock or new_q's lock.
> 
> This race existed before this patch. However, the commit message says
> the patch closes timer races "with queue resets during graft". Should
> qdisc_replace() and qdisc_purge_queue() under an MQROOT parent also be
> serialized against the child's sleeping-root lock?
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110044450.51921-1-kylebot%40openai.com

Thanks. I agree with these findings.

The patch fixes stale-root lock acquisition and serializes the final
reset, but it does not establish stable queue ownership for offloaded
HTB, serialize every offloaded-leaf purge, or prevent detached SFQ
from accounting against the live hierarchy.

These are distinct, pre-existing issues. I would prefer to address
them in separate patches and keep v2 focused.

Kyle
