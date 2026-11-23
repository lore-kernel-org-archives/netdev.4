Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431413;
	b=l9tju1vkw5k5e7CmCP3FAhYrYcgtD/Mkz1sP8JVNxeo6nglC5VW9H1JFIpXKHpC9U+es
	 PUn0o0V4ut1/+MH7MOTBHW1bnTkV0FG2ce/ICvqrPeLi6Y6FcDttmb9SgFj0R3tpZUBRs
	 Idc9vYSl0N3mbvDJJ7/rvUJAT+DeCWX/HRz2vMpIRx3cqb6mUfRn6BYp2Wv6Ln7r6iMea
	 29xGFWSIcDYgxgtgnKnlW0HwX/xswXFl4rnjyyE+oJj1i6UjOmanKuM7xpCvuyCV7bmEL
	 TXW5YsW4aooJLgwmgHadaPZVrUy8YJu+EMMN/R9PJ5jKIGtBsFkxpNkegb37sy7UITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=oeGvWgXxnsakqLjZaSu5vhCkqx58HIdji8JzO2W8orU=;
	b=mJYeDZpmWQJuCOukaFRy2edYWHEcGggG/1I6kHXlzwrL11gbzIlMRwK5dNSQ+2sOy8Yg
	 6hBLIanBQrPictGA7ii5R2fnhoMbsWdcl9nk2cXPw2DuuxkA04Ywy8vCfmjoEN0Ycbml1
	 dn2t0GPzVlkBu1imJpWjyabgqrV552pDGY1R2Nm/4iMLduRNHOA2QDC2cw/EcdLffOtug
	 ALGyjpKXRdMurnG7vXu2WzCPkBwL9p4Cp2Xd197e/Z6baOORxXpb3FlZFz69IG9xdvKAq
	 CssbnzJsoJOfYegU+r1rCqHqEbl2oG79jojvxAXl1QHgXnXf5JO2MxYXXK7W7ww0hxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RE0/FWqa";
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C8606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RE0/FWqa
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so1307530a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431412; x=1796036212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oeGvWgXxnsakqLjZaSu5vhCkqx58HIdji8JzO2W8orU=;
        b=RE0/FWqa8e+4LcFnBBjpEH8cq8D6Y8Ckb9dUjDllHBBsSqauEWJJsptkVHe+vkQalH
         pvx1/3p3+zjhN0XrqcuEsFakmXkZYN+E29CZFNcWz+mHwggKBDkrsnQ80OnkZkgckK8m
         OKBYDKrUbiIvdUCuO+uTa0lRMpYRuh+0Xw/bwEAUCvDKwOfUKWtNBrH0Dh/yIQk0Znol
         NIaOnBWO7yBSuVPDLlkGpjH/uNamuV973AVe0Z8vgQltV8iGHSikpL1I2zQiEgF+KXMg
         M5lzATVOAGDwtlK4iQ4WaciK90nZY8uLiawlOJAdGINmPixZSEQ/xcmtRtU926xormyc
         HYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431412; x=1796036212;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeGvWgXxnsakqLjZaSu5vhCkqx58HIdji8JzO2W8orU=;
        b=hrcs57Df796rSbUrhQXLbd5JeSvmTmvkK5jZamqu7WP4BZ2Texab/jYvYPGnuBMu1+
         gTEaJbnPWFZlnNPMBfiLqAE6jbedkl3+lKeCbgmp799YGbEnfoAxLdtZfjRyPr20TO2B
         fbcaeoiFksBy69kFjZKxYJUs2D1gM2N2+vOVtBlGuXBX2dDcuqVMGk7XL3tSH6sxB9sk
         0IbI050F9OXnE5l9Ko+7v4wOGylMConUhEN8FGZh2OZ04SB6HuFo3ybov0wTU+ulwBDc
         FIvZrkV9PEnE5zWZxPok3y8UK9pFsgcbJ+o4KTnTezhSnNqlLFT6z/wLgCKCZosHHJki
         YuhA==
X-Forwarded-Encrypted: i=1; AL+hErFxOJiEVzuxKHrX4DTVFWZU3MN4ycq6W/kBCq1xJl8MGlTkwPpT5r1Gwfu7aaSKH7YT2muBfFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+adNSS2/d1SNBObS5xw47p8UwjISLLgx8WzLheudB1XYp5Mail
	5t3IW3MDPZ4Wp+tffz+UpKeXM8FVFG5BlY7koSVFIcvQCQWc/cAI120o
X-Gm-Gg: AZFdTZf7t29eS/yBc5x6Bkn2LEOZSKNO4edwZohmIJtFe8DITWLlVtAaA7Bt31JLEwA
	0DnH17JCwB+00pMNCsTY5oAQCG7fhbMsF78ZUe5QDW0R30iQIULVAu/iE+v2hRhhukdzKAHAM9t
	+zNgL/4dbRJod5VNqYYNltSKAoE10KLlOsdi42M3tDJENFccGhihd8vNsrRCa4OJLzjBl2IGCV6
	iQLalbtBaOQimZrX2z1ABPYZeuV7zOszo77gwX7lC7bLYCLpe8Sa2X6x1XGV4GmcA0xjfnZVJHk
	370iymQUroxwsMJtg9+3gdROGrVCdk6ILc8Rcxs/yyrMs9uB0xj4ohsQgDFUNSjBJb7Znct4bsw
	dXki6DE9yY+Bsz//MbAl2u8JxHf8vkWs0vReuCishIu2EVLARkkt29DglWoisSfP46ZZKJ0T+mk
	YzOkEbaCM1lELYcvIAk+0eJkjE5bAV8KSDEKCTTJEK8KovFbS6hlSUbB1GGoSL+k23/xqDx5/+b
	hubgjsLCOOxxMbbGUr2gKhQYxqyP0r3/QF6uyzonmIp57TeqNHW4peeacFripnAyc5Yi5vH0jA2
	23A+iaLg4+ct814c9DNNnzObZWYxFIxxxMJs4pTvrfDi3iuWCbai5t5W8X8f
X-Received: by 2002:a17:90a:e705:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b41cb056e2mr7626761a91.48.1795431412150;
        Mon, 23 Nov 2026 02:56:52 -0800 (PST)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm20163761a91.16.2026.11.23.02.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:56:51 -0800 (PST)
Message-ID: <776889e1-1ffe-40fd-834b-29b5aa474e5c@gmail.com>
Date: Mon, 23 Nov 2026 18:56:48 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/sched: sch_qfq: bound backward slot rotation
To: netdev-bot+sashiko@kernel.org
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 paolo.valente@unimore.it, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiapenglin@tencent.com, corvus@tencent.com
References: <20261116121710.77403-1-ljp1205831794@gmail.com>
 <179500430179.3136.14921789097403556118@kernel.org>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <179500430179.3136.14921789097403556118@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-11-18 8:18 p.m., netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 1 · High: 1 · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Critical] The clamp added to qfq_schedule_agg() is a fixed constant
>    (33 on 64-bit, 1 on 32-bit).
> - [High] On 64-bit, the new clamp in qfq_schedule_agg()
>    (net/sched/sch_qfq.c:1321-1333) allows a backward rotation of…
> - [Low] Two existing comments in net/sched/sch_qfq.c now contradict the
>    new code in qfq_schedule_agg().
> 
> --
> 
> net/sched: sch_qfq: bound backward slot rotation
> 
> This patch caps the backward slot rotation in qfq_schedule_agg() at
> BITS_PER_LONG - QFQ_MAX_SLOTS + 1 slots. If the start-time decrease is
> larger than that, it first moves the activating aggregate's S, F and
> roundedS forward by the excess and then calls qfq_slot_rotate(). The
> goal is to stop qfq_slot_remove() from clearing bits beyond full_slots,
> in the slot-list pointers that follow it.
> 
>> diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
>> index e900890e9c544..e83105ce90156 100644
>> --- a/net/sched/sch_qfq.c
>> +++ b/net/sched/sch_qfq.c
> 
> [ ... ]
> 
>> @@ -1318,6 +1318,17 @@ static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
>>   		if (!qfq_gt(grp->S, agg->S))
>>   			goto skip_update;
>>   
>> +		slot = (grp->S - roundedS) >> grp->slot_shift;
>> +		if (unlikely(slot > BITS_PER_LONG - QFQ_MAX_SLOTS + 1)) {
> 
> [Severity: High]
> 
> On 64-bit this allows a rotation of 33 slots. Is that bound safe when
> grp->slots[] has only QFQ_MAX_SLOTS (32) entries?
> 
> Every user indexes the lists modulo 32. For example, in qfq_slot_insert():
> 
> 	i = (grp->front + slot) % QFQ_MAX_SLOTS;
> 
> 	hlist_add_head(&agg->next, &grp->slots[i]);
> 	__set_bit(slot, &grp->full_slots);
> 
> After a 33-slot rotation the existing members sit at logical offsets
> 33..63. These share physical hlists with offsets 1..31.
> 
> Suppose a later skip_update insertion lands at offset j (1..30). It joins
> the list that already holds the member tracked by bit j+32, so two
> full_slots bits now describe one list.
> 
> A possible sequence:
> 
>    X at bit 0, physical slot f
>    stale B is capped and rotated by 33:
>        X moves to bit 33 (still physical f)
>        B goes to bit 0 (physical f-1)
>    Y is inserted at offset 1, which is physical f, the list X is on
>    B is served, then Y, then X
> 
> That leaves full_slots == {32} over an empty list. When the shared list
> empties, qfq_front_slot_remove() clears only bit 0, so the aliased bit
> stays set. qfq_slot_scan() then shifts by 32 and returns qfq_slot_head()
> of the empty slots[f], which is NULL.
> 
>>From there, qfq_choose_next_agg() takes the NULL as "group is now
> inactive" and clears the ER bit, even though grp->full_slots is still
> nonzero:
> 
> 	new_front_agg = qfq_slot_scan(grp);
> 
> 	if (new_front_agg == NULL) /* group is now inactive, remove from ER */
> 		__clear_bit(grp->index, &q->bitmaps[ER]);
> 
> Any later activation of this group with S >= grp->S takes skip_update
> and is orphaned. Once the other aggregates drain, can qfq_dequeue() call
> qfq_peek_skb() with a NULL in_serv_agg?
> 
> If the stale bit is reached from qfq_deactivate_agg() instead, this
> dereferences NULL directly:
> 
> 	agg = qfq_slot_scan(grp);
> 	roundedS = qfq_round_down(agg->S, grp->slot_shift);
> 
> If it is reached from qfq_front_slot_remove(), BUG_ON(!agg) fires.
> Aliased lists also serve aggregates out of timestamp order.
> 
> The commit message says:
> 
>    "This preserves the timestamp and physical-slot mapping, keeps every
>    removal offset inside full_slots"
> 
> Does that still hold once the bitmap and the physical lists no longer map
> 1:1? Should the bound keep every occupied offset below QFQ_MAX_SLOTS
> rather than below BITS_PER_LONG?
> 
>> +			u64 deltaS = grp->S - roundedS -
>> +				((u64)(BITS_PER_LONG - QFQ_MAX_SLOTS + 1) <<
>> +				 grp->slot_shift);
>> +
>> +			agg->S += deltaS;
>> +			agg->F += deltaS;
>> +			roundedS += deltaS;
>> +		}
> 
> [Severity: Critical]
> 
> The clamp is a fixed constant (33 on 64-bit, 1 on 32-bit) and never
> reads grp->full_slots. It is only safe if the highest set bit of
> grp->full_slots is at most QFQ_MAX_SLOTS - 2 at rotation time. Can that
> assumption be broken?
> 
> Two sequences seem to break it:
> 
> (a) qfq_slot_insert() puts a member at the capped offset 30, and an
> ordinary 1-slot backward rotation moves it to bit 31. A later capped
> 33-slot rotation moves it to bit 64. On 32-bit, any further 1-slot
> rotation does the same.
> 
> (b) A capped rotation leaves old members at bits 33..63. A second stale
> aggregate in the same group triggers another capped 33-slot rotation,
> and bit 33 becomes bit 66.
> 
> In both cases qfq_slot_rotate() silently drops the bit:
> 
> 	grp->full_slots <<= i;
> 
> The aggregate stays linked on its slots[] hlist, though. When it is later
> removed through qfq_deactivate_agg()->qfq_slot_remove():
> 
> 	offset = (roundedS - grp->S) >> grp->slot_shift;
> 	...
> 	if (hlist_empty(&grp->slots[i]))
> 		__clear_bit(offset, &grp->full_slots);
> 
> offset is >= BITS_PER_LONG here. Doesn't __clear_bit() then write into
> the grp->slots[] hlist_head pointers that follow full_slots in struct
> qfq_group? Offsets of 71 and above would flip real pointer bits.
> 
> That looks like the same corruption the commit message describes:
> 
>    "a later qfq_slot_remove() clears a bit in the following slot-list
>    pointers"
> 
> Even when the stray clear hits a bit that is already zero, the aggregate
> no longer has a bit in full_slots, so qfq_slot_scan() never reaches it.
> Once the other aggregates drain, qfq_choose_next_agg() returns NULL while
> sch->q.qlen > 0, and qfq_dequeue() calls qfq_peek_skb(NULL, ...).
> 
> Should the bound use the highest occupied bit, for example
> __fls(grp->full_slots), instead of assuming it is QFQ_MAX_SLOTS - 2?
> 
>> +
>>   		/* create a slot for this agg->S */
>>   		qfq_slot_rotate(grp, roundedS);
> 
> [Severity: Low]
> 
> This isn't a bug, but two existing comments in sch_qfq.c now contradict
> this rotation bound. The comment above qfq_slot_insert() says:
> 
>   * and not a '-1' because the start time of the group may be moved
>   * backward by one slot after the aggregate has been inserted, and
> 
> The comment above qfq_slot_rotate() says:
> 
>   * Here too we should make sure that i is less than 32
> 
> With this change, qfq_slot_rotate() can run with i == 33 on 64-bit, and
> neither comment is updated. Since slots[] really has 32 entries, the
> comments seem to state the correct constraint.
> 
> [ ... ]
> 

Thanks. I agree that the fixed rotation bound is insufficient.

 > [Critical] The clamp is a fixed constant and never reads full_slots.

It does not account for the highest occupied bit, so repeated
rotations can still push an aggregate beyond full_slots. For v2, I will
use __fls(grp->full_slots) to bound the actual rotation and adjust the
activating aggregate's timestamps when necessary.

 > [High] On 64-bit this allows a rotation of 33 slots.

Offsets greater than or equal to QFQ_MAX_SLOTS can alias the
same physical hlist. V2 will ensure that rotation plus the highest
occupied offset remains below QFQ_MAX_SLOTS, rather than only within
BITS_PER_LONG.

I will also update both comments and the commit message, and validate
these sequences on 32-bit and 64-bit KASAN kernels.

pw-bot: cr

