Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714468;
	b=NAKgQrsdSSJHoou+LkEq46ugDmlh7bxWTyNRnCmjMepEMduN0WgEEDq4CKzXP/G3Kr7O
	 kVIJ3vnbE9S4xpv/Rr9ESyejUBz73VaYVw+ofaCtpCLWBx9IzNYOVt8qHWprUdP13yPMr
	 FE7lxshec9jFzlN1HrLs09MuRWCiYPUbE3o2dhJDtDHtsx4nGMhMkDvxSD8ndE1v0lVIp
	 3hHwLlsgdJYiCh5MhPadT1QJE9xqAl1OhGn1A3cqcuMIebK1ejHF/4XkztG0miywGfazd
	 Avm93Zq1Uj74Fs84IT9T8PJJO1HVl88rtFdEhv91HjSUCTFTk/57qw5lavflSl5TuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8LFfqjWNVZcWitQQ/EYLHPjhet/iq74BUyWBBYp09Fs=;
	b=dchxV0J3VLb/X2akYk5Zbp5TI4B6NU9/ODtbGUm3+EYSbB1JwpOsMtqHfHBrbTpECKR6
	 q6ZRDJWJB41zL4MQ8PEfyssERdMVFbqTe5depOkhxt6ssqOwCJrjnm3LBSOox39ul7Y0n
	 AuQWH72lujDpRateKZvzGlFYHHivyWxBosc4i4AGdr/Ir6/8biaWKjj0YQ5OA6GN4/eZG
	 YHUIrF0xNCi7KELtTDKQuiS9i6tUPQPKvElf0vmTDqLqipEn/Y/kPJOAAcx0lz9cXjhm8
	 62nUArfaalCb6vKVaNGnKoTIrQ/qxM84MthGMCSlDKHebk050r7Ao24r2fxUN9aGq/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--willemb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYeB3235;
	arc=none smtp.remote-ip=209.85.160.200
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7E606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F7E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willemb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYeB3235
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53639e47be2so135903921cf.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795714467; x=1796319267; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LFfqjWNVZcWitQQ/EYLHPjhet/iq74BUyWBBYp09Fs=;
        b=WYeB3235xF03W2/XVX+vDxPLrJo3q/644KssTXKkfDO2bZ0AeaqFUCGo8vHGgGYMql
         q1UKqT44oknXp6PLU5BElau04zpen/q2PXR0kYHvuv8VGwl4BsGAikQt/BTyjvvN50mC
         u6ACtDo/+bbGV+paZOVRPlmeUfijb5NCRXm9t5vGDG7BZZmaobpB4PY167MYqK0PPjnt
         +NkM9sOEdx5Dplx4M4Zl+jTSNJRNsa99FNCnJ5HnWrhd300aHUrJAV2QobE1C2JYdoRo
         x5P8jB/UJ/0eWBXpoCcBQ8kDT7Z/JzMm7dBnQTduExhDWRwBBIwhLt8Tw/76KcRDApQT
         hfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714467; x=1796319267;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LFfqjWNVZcWitQQ/EYLHPjhet/iq74BUyWBBYp09Fs=;
        b=h64w8PKMCMWC5mpV2kejOEWh7RozkPsHmEQ32dDegI4ffIThxyIdbabKTeXCqu3qVK
         cGjghUsMrNv/yx6KgbwKxpodOwz2YSKdefeNIRriuAzyeLf4jE0/ihGoujQQAEIn9WFR
         E5PDjyhFJXCvZebwcP8vVZjq7cvXYOAsFnIqxDPGBwwGO9pDDTZx67E9ov8bIa2BA8vq
         M/YefERTb83/J1u9lNjlZwy8USUeK81t4ttYft1qlVu6+1BgYG8tuURgPoQErg++dL2b
         9Pv8Nh6Vl/X26yrkfOzNztr6LDVjbRzfgM6FbyF6GE4x+rSZqnrFfS+Z7C36Rv+UAf9L
         gT4g==
X-Forwarded-Encrypted: i=1; AL+hErEcefZJUkkd5oVdJpGB/TbzODIQH4A58UQjfJBXNSdZDuKmtG0fxv1bz/5fVL8rlNLdV8Me8L8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rhY4ibMYJIHqi8EiklP+Sh4wdfCazAb/YO/8+8xHRAV+3oZaR
	JOTMt9P84dd8sFH498iogU6Gsv+B8ugriGeepTWiL4Yg/dJVZC1J71QnyNt8Lvmc5vJBbfPw0aK
	eYF0Qpe02cg==
X-Received: from qtf20-n1.prod.google.com ([2002:a05:622a:6814:10b0:55d:6f1c:bf64])
 (user=willemb job=prod-delivery.src-stubby-dispatcher) by 2002:ac8:5d49:0:b0:533:3d48:37ff
 with SMTP id d75a77b69052e-55d76a8a916mr397826001cf.49.1795714466249; Thu, 26
 Nov 2026 09:34:26 -0800 (PST)
Date: Thu, 26 Nov 2026 12:34:25 -0500
In-Reply-To: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com>
Message-ID: <willemb.9c5fa5d89f88@google.com>
Subject: Re: [PATCH] net: tap: fix inconsistent lock state in tap_sock_destruct
From: willemb@google.com
To: Shuai Liu <847807867@qq.com>, willemdebruijn.kernel@gmail.com, jasowangio@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com
Cc: syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuai Liu <847807867@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Shuai Liu wrote:
> tap_sock_destruct() calls ptr_ring_cleanup(), which in turn uses
> ptr_ring_consume() with a plain spin_lock() for consumer_lock.
> This destructor runs in two distinct contexts:

> 1. softirq context: from softirq rx drop paths via
>     skb_release_head_state() -> sock_wfree() -> __sk_free() ->
>     sk_destruct() -> tap_sock_destruct().  In softirq the BH
>     state is already disabled, so consumer_lock is taken with
>     SOFTIRQ-ON-W semantics.

> 2. process context: from tap_release() -> __fput() -> sk_free()
>     -> sk_destruct() -> tap_sock_destruct() (triggered by
>     close_range syscall).  Here softirq is enabled when the
>     same consumer_lock is taken.

> lockdep flags this as inconsistent {IN-SOFTIRQ-W} ->
> {SOFTIRQ-ON-W} usage of (&r->consumer_lock) and warns about
> a possible deadlock scenario.

> Fix by hand-rolling the cleanup loop with spin_lock_irqsave() /
> spin_unlock_irqrestore() so consumer_lock is always taken from a
> uniform softirq state.  irqsave is a no-op on the softirq path
> (interrupts are already off), so there is no extra cost there.

> Reported-by: syzbot  
> <syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com>
> Link: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
> Signed-off-by: Shuai Liu <847807867@qq.com>

Dropped in line with your below comment, thanks

https://lore.kernel.org/netdev/tencent_21D314AEB4D8C2C489FB8D74348B93FC7706@qq.com/
