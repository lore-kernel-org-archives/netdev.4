Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546127;
	b=mRbMdGs+FXtnPrheNQjGIHcMLXxKfRdwESuJtGn8DuPzvrvdlLOyfkmKsR0aHxlNBOka
	 K3lHntVJwbKb5WvQojpN9tcrzA2NTXQC4zw2wq0SWAw+JRRbouuqatc6g0RtQtnro9spo
	 0lGGHriYV6TOMoROn81xDQaEhSnMAjH1qGenauL4qd16I/htyPljH3Nt0eYoighH1gI6T
	 a6vdjZoXIupPn9z3rEv7HfxlgdXOmRu3d9GTWKCZPkJ5+dcjdSDzWw4Bhq4PRj6UgpmdP
	 PB2WuvTMoR3p9Y9jtIYLqZ4RO52T0fE34PM8BW1uTKQZztDkLQQrlT0UezpxnSSM6JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546127;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Dc+VwRig8VSn4wpYWTZ82flxuN19bvjXSOBz/lbecMM=;
	b=Xci1oFMybLg0/Z3P2jDK5R6i/O+eDLam1FdwT4s5FbKGpIm/QsfqQAbQRRKdhhX2KObO
	 KwXliHGVd1BaQ9gXhUQfeUXtArTbahPiVcE6fqPs32a1c9QRWg1kFqYZw24U8uvfCzxEw
	 TkN1XrPvdER3m6CwVlCjbylXb4DmDci0UkSRG+NdTV39hWX30XHm9amTOZ6EqNO3+gWDD
	 sq3UIcvY6CO3G/d7RwSnUlFjmW2duzoLECbXdOgaJBIQ4+8tZ2qxOeNOXhWhlyIGCMQLf
	 +5tHYLS0ByuGOpzNgOqf7N5HG5P1oJXz4nbJQakSiMfhWDzS58tMgqpwstWJ2InfWAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPhRu7wG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C95606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPhRu7wG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7D41F000CF;
	Tue, 24 Nov 2026 18:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795546126;
	bh=Dc+VwRig8VSn4wpYWTZ82flxuN19bvjXSOBz/lbecMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WPhRu7wGW/JaWITdY49J/pYDBVrL2ggA16OBYkEmgNbFOI4qzXz4Eji9rNBzXZTaj
	 HaYWW6Ynu6cxeZbMxtgSkdCoQrO/kuteupznaUKqbvhM2rS30Z9DvqTAVWgeutetdR
	 TTeAaKVWD0/0bFVkiWUAH1qLBxFkwsoyvC+yg39hVY4rZLhkxJNArB+VMgdZb8bNWK
	 bfFvq560mchjlysJMTvHEzn11OcmI2E8MMYDkT6DOdBAiFEFEYmpPdU1qd4BLp/jtc
	 GxgsTbWimu1uMf18NW33RKXObLmU+/ck9/OQPxhEyHg+fBtl6xZVWsqRhkava/UVJ2
	 nqI77FRpmxmsA==
Subject: Re: [PATCH net] net/sched: fq_pie: clear memory_usage and flow
 backlog in fq_pie_reset()
From: netdev-bot+sashiko@kernel.org
To: edumazet@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org,
 jhs@mojatatu.com
Date: Tue, 24 Nov 2026 18:48:45 +0000
Message-ID: <179554612514.3135.4817357528010046097@kernel.org>
In-Reply-To: <20261123184602.386372-1-edumazet@kernel.org>
References: <20261123184602.386372-1-edumazet@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch leaves the problem it gives as its reason for
  clearing `flow->backlog` in place for the default configuration.

--

net/sched: fq_pie: clear memory_usage and flow backlog in fq_pie_reset()

This commit makes fq_pie_reset() clear q->memory_usage, matching
fq_codel_reset(), so tc statistics and the overmemory counter stay correct
after a non-empty qdisc is reset. It also clears flow->backlog, since
fq_pie_timer() keeps passing it to pie_calculate_probability() for flows
that no longer hold packets.

> diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
> index 5982847df8f85..a5e2a83efb679 100644
> --- a/net/sched/sch_fq_pie.c
> +++ b/net/sched/sch_fq_pie.c
> @@ -547,10 +547,12 @@ static void fq_pie_reset(struct Qdisc *sch)
>  		/* Removes all packets from flow */
>  		rtnl_kfree_skbs(flow->head, flow->tail);
>  		flow->head = NULL;
> +		flow->backlog = 0;
>  
>  		INIT_LIST_HEAD(&flow->flowchain);
>  		pie_vars_init(&flow->vars);

[Severity: High]
Is clearing flow->backlog enough to stop fq_pie_timer() from feeding stale
per-flow state into pie_calculate_probability()?

With the default dq_rate_estimator=0, pie_calculate_probability() does not
derive the delay from the backlog argument. It reads the cached values:

net/sched/sch_pie.c:pie_calculate_probability() {
    ...
	} else {
		qdelay = vars->qdelay;
		qdelay_old = vars->qdelay_old;
	}
    ...
	delta += alpha * (qdelay - params->target);
	delta += beta * (qdelay - qdelay_old);
    ...
}

In that mode backlog only gates update_prob when qdelay is 0.

pie_vars_init() only resets burst_time, dq_tstamp, accu_prob, dq_count and
avg_dq_rate. It leaves vars->qdelay, vars->qdelay_old, vars->prob and
vars->backlog_old as they were.

When the dequeue-time estimator is off, pie_process_dequeue() is the only
place that writes a fresh vars->qdelay. The reset frees the packets without
going through it. If the flow was congested at reset time, vars->qdelay
therefore keeps the last sojourn time of the purged queue.

adapt_timer is only stopped in fq_pie_destroy(), so it keeps running after
a reset such as:

linkwatch -> dev_deactivate() -> dev_deactivate_many() -> dev_reset_queue()
  -> qdisc_reset() -> fq_pie_reset()

If the stale qdelay is above target, can each tupdate round compute a
positive delta and keep raising prob for as long as the flow is idle? The
decay branch for qdelay == 0 && qdelay_old == 0 never runs in that case.
prob is only clamped when the u64 wraps, so it looks like it can grow past
MAX_PROB.

When traffic hashed to that bucket comes back, the 150ms burst_time runs
out. After that, pie_drop_early() no longer takes this early return:

	if ((vars->qdelay < params->target / 2) &&
	    (vars->prob < MAX_PROB / 5))
		return false;

Would that flow then see almost every packet dropped once its backlog
reaches 2 MTU? It looks like this would last until prob decays, which can
take seconds or longer depending on how long the flow was idle.

Should the reset path also clear vars->qdelay, vars->qdelay_old, vars->prob
and vars->backlog_old? That could go either in fq_pie_reset() or in a
full-reset helper. pie_reset() in sch_pie.c appears to have the same gap.

>  	}
> +	q->memory_usage = 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123184602.386372-1-edumazet%40kernel.org
