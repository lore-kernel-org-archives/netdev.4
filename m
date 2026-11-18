Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004303;
	b=Xa96XP66i+I9iAzMzvpg3+m1G1owblNw8f878VJsPmxx7zFN1XqOxX6tyFA/XbK0OleP
	 3Ugu/0Uyli04T+zTLdHH66a4iFHoAMpVM+d0pvCsr1W3hGrnpPQ53jUOJKvPJq6mCjYv4
	 VFuS9AKF0rXCO12FMpwWA43ML/vdUZOtrZJpUMX9EUkJkd5665xBYPSK1uBwWXkAqHWAm
	 JCOkkdxC+31A2QZSZNbQnHJ8PAFjltIKJpFg7krnawbr6tta0iHfIypmrNOk/qh2TTqzq
	 qfKl/pCRgzitvVd+70Q3XQenbpb3Al2unR7sIIveRtIze6rsL51GZK2JX+gKGuYQpTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004303;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V7BiP0CcGi8LITyg8W5iWi77jq5+Sz2IYuWjTO1UXbU=;
	b=da1NQ16+/Dz3KJyqw2D8V3iHf/5qk7/p2qalprd555YH6FGJNVlpkE5L2Kqz3bK+I0W4
	 3B8FRNzIK1S06zsc8A8Bq4wZf29bu98He880yqcOoEUW3DnlQhXBa0ll7xETs/6stb5s0
	 FGr8ipdrd4Sox7rb+TXVpNaB9JPe4D8NUC2rFMybzu+0wXYrIGoAegL060cogvUGO06yG
	 hdLyMso9u1AHU6wHNP/bugfnqCOwp/6TKxSgZ2PqP5S4ByNH5ERmRgQbfd8JxnkZ5fBhd
	 28c9UqlMGHNWLsV92BDGyQ/x9IEmXQhFH9IulvCwgpCh0PJeXWaQBVOCOXiXOAlrELA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQEfm1mD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EFE606A320;
	Wed, 18 Nov 2026 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQEfm1mD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BDFB1F000C4;
	Wed, 18 Nov 2026 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004302;
	bh=V7BiP0CcGi8LITyg8W5iWi77jq5+Sz2IYuWjTO1UXbU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YQEfm1mD5gqTK+heHD2m/ZlWsXYQSb+a/cnLFKDAyLYcikSVJxhHLLF32k1UiRbFY
	 ql1YILnuEz3jdM9CvuH1H0pNpggGJhjKL28fvgXNb1XJv+/56nTOkUk2+rRHZeFN90
	 s2Klwyv0VLrG1Tq96a1nNnAp0HIaC7HRTaDnooBVLjH5fcDim9y5JAffNEJqJiNy/J
	 fNLrj7BA4G2rH7JommHkHfIlrJp/ZLIy6L8YEug4F+Kwu52umJHnNFAlsedMpo0K7B
	 8ffZbEmODGP8wj9tkfqPU9bKoK8xE4AnhJ9frUNo8Wjg20lAprKSC6MvmTHUXn+SAq
	 EAotqyJUtvYbw==
Subject: Re: [PATCH net] net/sched: sch_qfq: bound backward slot rotation
From: netdev-bot+sashiko@kernel.org
To: ljp1205831794@gmail.com
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 paolo.valente@unimore.it, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiapenglin@tencent.com, corvus@tencent.com
Date: Wed, 18 Nov 2026 12:18:21 +0000
Message-ID: <179500430179.3136.14921789097403556118@kernel.org>
In-Reply-To: <20261116121710.77403-1-ljp1205831794@gmail.com>
References: <20261116121710.77403-1-ljp1205831794@gmail.com>
X-sashiko-severity: Critical
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

Critical: 1 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The clamp added to qfq_schedule_agg() is a fixed constant
  (33 on 64-bit, 1 on 32-bit).
- [High] On 64-bit, the new clamp in qfq_schedule_agg()
  (net/sched/sch_qfq.c:1321-1333) allows a backward rotation of…
- [Low] Two existing comments in net/sched/sch_qfq.c now contradict the
  new code in qfq_schedule_agg().

--

net/sched: sch_qfq: bound backward slot rotation

This patch caps the backward slot rotation in qfq_schedule_agg() at
BITS_PER_LONG - QFQ_MAX_SLOTS + 1 slots. If the start-time decrease is
larger than that, it first moves the activating aggregate's S, F and
roundedS forward by the excess and then calls qfq_slot_rotate(). The
goal is to stop qfq_slot_remove() from clearing bits beyond full_slots,
in the slot-list pointers that follow it.

> diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
> index e900890e9c544..e83105ce90156 100644
> --- a/net/sched/sch_qfq.c
> +++ b/net/sched/sch_qfq.c

[ ... ]

> @@ -1318,6 +1318,17 @@ static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
>  		if (!qfq_gt(grp->S, agg->S))
>  			goto skip_update;
>  
> +		slot = (grp->S - roundedS) >> grp->slot_shift;
> +		if (unlikely(slot > BITS_PER_LONG - QFQ_MAX_SLOTS + 1)) {

[Severity: High]

On 64-bit this allows a rotation of 33 slots. Is that bound safe when
grp->slots[] has only QFQ_MAX_SLOTS (32) entries?

Every user indexes the lists modulo 32. For example, in qfq_slot_insert():

	i = (grp->front + slot) % QFQ_MAX_SLOTS;

	hlist_add_head(&agg->next, &grp->slots[i]);
	__set_bit(slot, &grp->full_slots);

After a 33-slot rotation the existing members sit at logical offsets
33..63. These share physical hlists with offsets 1..31.

Suppose a later skip_update insertion lands at offset j (1..30). It joins
the list that already holds the member tracked by bit j+32, so two
full_slots bits now describe one list.

A possible sequence:

  X at bit 0, physical slot f
  stale B is capped and rotated by 33:
      X moves to bit 33 (still physical f)
      B goes to bit 0 (physical f-1)
  Y is inserted at offset 1, which is physical f, the list X is on
  B is served, then Y, then X

That leaves full_slots == {32} over an empty list. When the shared list
empties, qfq_front_slot_remove() clears only bit 0, so the aliased bit
stays set. qfq_slot_scan() then shifts by 32 and returns qfq_slot_head()
of the empty slots[f], which is NULL.

>From there, qfq_choose_next_agg() takes the NULL as "group is now
inactive" and clears the ER bit, even though grp->full_slots is still
nonzero:

	new_front_agg = qfq_slot_scan(grp);

	if (new_front_agg == NULL) /* group is now inactive, remove from ER */
		__clear_bit(grp->index, &q->bitmaps[ER]);

Any later activation of this group with S >= grp->S takes skip_update
and is orphaned. Once the other aggregates drain, can qfq_dequeue() call
qfq_peek_skb() with a NULL in_serv_agg?

If the stale bit is reached from qfq_deactivate_agg() instead, this
dereferences NULL directly:

	agg = qfq_slot_scan(grp);
	roundedS = qfq_round_down(agg->S, grp->slot_shift);

If it is reached from qfq_front_slot_remove(), BUG_ON(!agg) fires.
Aliased lists also serve aggregates out of timestamp order.

The commit message says:

  "This preserves the timestamp and physical-slot mapping, keeps every
  removal offset inside full_slots"

Does that still hold once the bitmap and the physical lists no longer map
1:1? Should the bound keep every occupied offset below QFQ_MAX_SLOTS
rather than below BITS_PER_LONG?

> +			u64 deltaS = grp->S - roundedS -
> +				((u64)(BITS_PER_LONG - QFQ_MAX_SLOTS + 1) <<
> +				 grp->slot_shift);
> +
> +			agg->S += deltaS;
> +			agg->F += deltaS;
> +			roundedS += deltaS;
> +		}

[Severity: Critical]

The clamp is a fixed constant (33 on 64-bit, 1 on 32-bit) and never
reads grp->full_slots. It is only safe if the highest set bit of
grp->full_slots is at most QFQ_MAX_SLOTS - 2 at rotation time. Can that
assumption be broken?

Two sequences seem to break it:

(a) qfq_slot_insert() puts a member at the capped offset 30, and an
ordinary 1-slot backward rotation moves it to bit 31. A later capped
33-slot rotation moves it to bit 64. On 32-bit, any further 1-slot
rotation does the same.

(b) A capped rotation leaves old members at bits 33..63. A second stale
aggregate in the same group triggers another capped 33-slot rotation,
and bit 33 becomes bit 66.

In both cases qfq_slot_rotate() silently drops the bit:

	grp->full_slots <<= i;

The aggregate stays linked on its slots[] hlist, though. When it is later
removed through qfq_deactivate_agg()->qfq_slot_remove():

	offset = (roundedS - grp->S) >> grp->slot_shift;
	...
	if (hlist_empty(&grp->slots[i]))
		__clear_bit(offset, &grp->full_slots);

offset is >= BITS_PER_LONG here. Doesn't __clear_bit() then write into
the grp->slots[] hlist_head pointers that follow full_slots in struct
qfq_group? Offsets of 71 and above would flip real pointer bits.

That looks like the same corruption the commit message describes:

  "a later qfq_slot_remove() clears a bit in the following slot-list
  pointers"

Even when the stray clear hits a bit that is already zero, the aggregate
no longer has a bit in full_slots, so qfq_slot_scan() never reaches it.
Once the other aggregates drain, qfq_choose_next_agg() returns NULL while
sch->q.qlen > 0, and qfq_dequeue() calls qfq_peek_skb(NULL, ...).

Should the bound use the highest occupied bit, for example
__fls(grp->full_slots), instead of assuming it is QFQ_MAX_SLOTS - 2?

> +
>  		/* create a slot for this agg->S */
>  		qfq_slot_rotate(grp, roundedS);

[Severity: Low]

This isn't a bug, but two existing comments in sch_qfq.c now contradict
this rotation bound. The comment above qfq_slot_insert() says:

 * and not a '-1' because the start time of the group may be moved
 * backward by one slot after the aggregate has been inserted, and

The comment above qfq_slot_rotate() says:

 * Here too we should make sure that i is less than 32

With this change, qfq_slot_rotate() can run with i == 33 on 64-bit, and
neither comment is updated. Since slots[] really has 32 entries, the
comments seem to state the correct constraint.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116121710.77403-1-ljp1205831794%40gmail.com
