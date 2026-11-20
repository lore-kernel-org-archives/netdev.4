Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158825;
	b=fcpp2BfwXDuQ6FTm5KnODejpPoiKd6gazwnnUlJmdg8DebFAQAPht7XuTtkIc9hxZUuq
	 K1WNuq7mtzHlQjmaRRpB5p6CA44ESr7dZD8BiRS3AlrEtGuga3WGcExRGhDf39YRTw3bL
	 JB6DurTWFxZKj+SkG9WhpGOwOHT5o9VCczmaFQgOs9R7O3p5v5v+dSD5xzD+H7TBQtrNJ
	 cjLqHcnkRMFeEgfTevhpD3X6SP8ZH3WlHvTa6fQo8jFHKutsHFC63AJ+FFhPpQeTdF+9b
	 VzacSXGeLbC0NxC+mjCfDoA8dEaFGDm0GLjahJ4FBfRohx//XwPQnJgOSgXPwbDg/nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158825;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=LB9wymtVohhmpOcRNEMKuhiXQ1mq5XK/YUMlCRu5VHU=;
	b=czUxY0MEaQU61QSrb2uL9VnjhCkguY5vAt5UdTZt7UJkLqY++ZQojWYmaXVjU5hrIK7h
	 TVQvZLC1rt1lzCURDpyd7xBDIqIqqYDrBCScbMw26/+UQ8K7wuQ55q2a/nH9nfjHvgfhN
	 wxJrG1qqAXRoTfYqTpPqjU37HEDLpPGZlV2jV8qS92AkuoTVdRJhOZs/UvZ0coSH7jcJy
	 HsqFn9Km1Tf8hYUNytgJJ3Px5Kigr8t9vrXmVirsc2EQN/DKjs/63nsuo1xSKNUX7c9Vs
	 2zbzqOs/t4xOCWy1MBsGgSw46jhlIMGBqsdnAX0oyv6zB7lnvI3jOkfQVopb3IOw/4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=SmBCME1G;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254F606A320;
	Fri, 20 Nov 2026 07:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2254F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=SmBCME1G
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 21E38207D8;
	Fri, 20 Nov 2026 08:13:42 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKVg5zZ_qty8; Fri, 20 Nov 2026 08:13:41 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 7AE48206D0;
	Fri, 20 Nov 2026 08:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 7AE48206D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795158821;
	bh=LB9wymtVohhmpOcRNEMKuhiXQ1mq5XK/YUMlCRu5VHU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=SmBCME1GUjFJo2FT6pN9ojDF62kXxceM1TKgtTlbSlecg90SJiOn45q6Q3s4edxWy
	 CKd9LRdGINW3CRx722ACJByOb9zyHmIZZ1afEtuqLaIZKQFpd2KLAQZ0PQkmipQUF2
	 1ztlZsGDwmqy8j3AJpgsGI6iM/xBSd+pMRHF+s/FcZN/U2EGNVP1rr+W9Mk6dWKQGl
	 QzavQldlzObeOJgXKOap43FKPQnryvXWFDhhEdkyGXE1XU0kAzOQRwTsTMHiHU+DPE
	 0orBFf51TqNt+uAOlIX0eRx2Ry08dPc6pDyg/bij9+qLDuqSBNjQRjeFrIZdBXRlLX
	 xSranQSAfNPoA==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 20 Nov
 2026 08:13:39 +0100
Received: (nullmailer pid 1694731 invoked by uid 1000);
	Fri, 20 Nov 2026 07:13:38 -0000
Date: Fri, 20 Nov 2026 08:13:38 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: Daniel Wade <danjwade95@gmail.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>
Subject: Re: [PATCH net] net: af_key: fix use-after-free in dump_sp() on
 policy migrate
Message-ID: <av_zInP3LgU0gdIr@gauss4>
References: <20261114223529.1791-1-danjwade95@gmail.com>
 <99480e51-50f7-425b-b8e9-95b7734c64bf@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <99480e51-50f7-425b-b8e9-95b7734c64bf@redhat.com>
X-ClientProxiedBy: EXCH-03.secunet.de (10.32.0.183) To EXCH-01.secunet.de
 (10.32.0.171)

On Thu, Nov 19, 2026 at 12:32:46PM +0100, Paolo Abeni wrote:
> On 11/14/26 23:35, Daniel Wade wrote:
> > pfkey_xfrm_policy2msg_size() derives an exported policy's message length
> > from xfrm_vec[].encap_family. dump_sp() derives it twice: once through
> > pfkey_xfrm_policy2msg_prep(), which allocates the skb, and again in
> > pfkey_xfrm_policy2msg(), which fills it in.
> > 
> > dump_sp() holds net->xfrm.xfrm_policy_lock rather than pol->lock, so
> > xfrm_policy_migrate() can rewrite encap_family between the two
> > derivations. The second length is then up to 24 bytes per template
> > larger than the first, and pfkey_xfrm_policy2msg() opens with
> > memset(hdr, 0, size), clearing the difference into the skb's shared
> > info. Four BEET templates put 80 bytes there, which reaches dataref:
> > alloc_skb() had set it to 1, the memset makes it 0, and the skb_clone()
> > in pfkey_broadcast_one() leaves two skbs sharing one head with a dataref
> > of 1. Freeing the original releases a head the queued clone still points
> > at, so recvmsg() copies freed memory to user space and consume_skb()
> > frees it a second time. The CAP_NET_ADMIN that pfkey_create() and the
> > xfrm netlink receive path check is namespace-relative, so an
> > unprivileged user can reach this. SLUB's double-free check fires within
> > a second of starting the reproducer; the oops kills a task, or panics
> > the machine when the corruption lands in softirq context.
> > 
> > Racing SADB_X_SPDDUMP against XFRM_MSG_MIGRATE as an ordinary user gave
> > 4585 use-after-free reports and 765 double-frees in 300s on mainline
> > with KASAN and 8 CPUs. The reads reach user space (addresses trimmed):
> > 
> >    BUG: KASAN: slab-use-after-free in _copy_to_iter+0x1d8/0x1430
> >    Read of size 240 at addr ffff88810f98d140 by task pfkey_dataref_o/433
> >    CPU: 3 UID: 65534 PID: 433 Comm: pfkey_dataref_o Not tainted 7.4.0-rc2
> >    Call Trace:
> >     <TASK>
> >     dump_stack_lvl+0x66/0xa0
> >     print_report+0xd0/0x600
> >     kasan_report+0xc6/0x100
> >     kasan_check_range+0x105/0x1b0
> >     _copy_to_iter+0x1d8/0x1430
> >     __skb_datagram_iter+0xf8/0x820
> >     skb_copy_datagram_iter+0x6c/0x1a0
> >     pfkey_recvmsg+0x1ff/0x500
> >     sock_recvmsg+0x15e/0x1a0
> >     __sys_recvfrom+0x182/0x260
> >     do_syscall_64+0x10b/0x5f0
> >     entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >    Allocated by task 433:
> >     kmalloc_reserve+0x108/0x2b0
> >     __alloc_skb+0x123/0x5b0
> >     dump_sp+0xdf/0x490
> >     xfrm_policy_walk+0x1d9/0x6c0
> >     pfkey_do_dump+0x61/0x420
> >     pfkey_recvmsg+0x358/0x500
> > 
> > Take xp->lock for reading across both calls, so both derivations see the
> > same encap_family. xfrm_policy_walk() already calls dump_sp() under
> > spin_lock_bh(), so the plain reader suffices, as in xfrm_policy_timer().
> > The other callers of this pair are already serialized against migrate by
> > net->xfrm.xfrm_cfg_mutex.
> > 
> > Fixes: 80c9abaabf42 ("[XFRM]: Extension for dynamic update of endpoint address(es)")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Daniel Wade <danjwade95@gmail.com>
> @Steffen: do you prefer we take this one directly into the net tree?

I'm Ok with taking it directly into the net tree. PFKEY
is dead anyway, I plan to remove the implementation at
the beginning of the next year.
