Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012770;
	b=CTa3sPER14R3X66Eww+5kdOjvO7lQc5No9p911d5Pm3a4PKh+9o9+jwphiIbuAaFEqBy
	 OV4Egu0bLUP6eTSyqI3IXBbcxSVsiSIDIRYn1o67up27uFEViljf5BI9iidgge58axPZ/
	 P11aFNqhHE8g6TS6xo3yVdBeQCXnrWwi4E2Za7VoJHIep9Zm499HrPcN345N5CIRxl0li
	 CiQiDQPJvtc+wU+Erww/jH05X4l7NkvTSV0SIyQY6c2BaN37rMFWl9GK3lySuPAo5eHuY
	 Dum+aRoDKXra/rPRqKHPz6Tl9hGf9/kym98knc4I+hld3/xWcGsE0RhJsi5h872MLPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012770;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=wn4w1sOHDWq6Q/CcG6uXsFLBxtrAmn/giQOE7FW30EM=;
	b=kBqoH0/+9/kOcdxxloTFuB8hPkc3M1vP2AWfFfuh7n85elc36pRj4Uink7SQ1ptKahaa
	 gioDRpcT399jYgmB4A8i2b+Pv1rmBTW1PH/T7r3SfEls6alyH0ioHkzFOnpRCTq4agMN9
	 C4lasCB21hI+VpC6dXptJiIlz43ToeuEZKW+bXc2ONtt3zIhcdXhqR+n+UD5eQPOFKM1P
	 zglivfyj6gXV8WbQ9C93fePKqSIbqVvVEWSWJbssMSK5vdQCXBrPQPSpjwNkmrTSyvkMn
	 g0TkJF7udIZF2YWDdJ8Nb3bBnmVs6z0YjG0Pcd85i//yynpXgYWF/NlTyeOQGrY/HIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=KmgreEfP;
	arc=none smtp.remote-ip=195.10.208.55
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [195.10.208.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C86606A31C;
	Wed, 18 Nov 2026 14:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C86606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=KmgreEfP
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4jV4476MzKzNlh1;
	Wed, 18 Nov 2026 15:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795012759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wn4w1sOHDWq6Q/CcG6uXsFLBxtrAmn/giQOE7FW30EM=;
	b=KmgreEfPcAsLsbdiBVPG/VXlTgRvTe57B+qJ5QP6cJSLTU1LROF5xfHfikHbjpf4bsICZ6
	Qt9nfB8Jji9lyJEPw59kCqxzkyK1pXG+8zSO4PVxvEhj8lnwE5I6Tl51QQPT4009VL9Coe
	RUD6ZwL+q39DNXOIIH42YrOPBYvKfqLHt2AGi1UdNQSzkfQEHoqvE6CZZ1+WG2yz+MvQ6z
	z3guxZkhq7S5AYEEczYmWkUdVeakzvfM+YwvgxBga/n48ZH36fnEykD8ZOpnHTIX4nOAb8
	MLvt2MbSAmOgV/NTTep/vOkp1T7Cf2l+41AQ1Opi8unM7ALktO546jDHrpYEVA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org,
	yana06070@163.com
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
Date: Wed, 18 Nov 2026 15:39:08 +0100
Message-ID: <20261118143909.115729-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <1794991714000.1115021.7710558447771708161@cmss.chinamobile.com>
References: <1794991714000.1115021.7710558447771708161@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jV4476MzKzNlh1

Hi Xia,

On Wed, 18 Nov 2026 16:48:34 +0800, Xia Yan <yanxia@cmss.chinamobile.com> wrote:
> I traced the race and the fix against current net-next.
>
> On the writer side, xfrm_policy_insert() links the policy and then calls
> rt_genid_bump_ipv6(), which resolves to fib6_flush_trees(). A fresh serial
> is allocated from the namespace counter first, then every node is
> restamped under tb6_lock. A late rt6_get_cookie() can pick up that
> post-insertion serial for a dst whose lookup ran before the insertion,
> and the pair keeps passing dst_check until the next flush. Sampling the
> cookie between two generation reads closes the in-lookup window. A
> policy inserted after the helper returns is still caught later, because
> the restamp changes fn_sernum itself and the stored pre-insertion cookie
> stops matching. fib6_new_sernum() never returns 0, so the fallback
> cookie always fails fib6_check().
>

Yes, that's a pretty good summary of the change with the small
correction that a newly linked node holds fn_sernum 0 until fib6_add
stamps it. So a cookie-0 dst can pass a check in that window, and fails
as soon as the stamp lands.

> 1/3 checks out as well. The old code kept writing -1 into the node, so a
> second failure changed nothing and the namespace generation never moved.
> The fresh allocation under tb6_lock matches the discipline the
> fib6_ifup()/fib6_ifdown() paths already get from __fib6_clean_all().
> The conversion boundary in 3/3 also matches the tree: rawv6 does not
> cache the dst, and the accepted-socket and refill stores in tcp_ipv6.c
> are listed as follow-up.
>

In fact there are many users of cached IPv6 dsts that will need
conversion and this series is mainly here to introduce the new API.

> One thing I could not fully work out is the ordering behind the
> generation checks. When the lookup misses a change, the reader relies on
> the two generation reads to notice it. My understanding is that this
> needs the change visible before the counter advance, and the counter
> advance visible before the node restamps. I could not establish either
> hop, though I may well be missing something.
>
> In xfrm_policy_insert(), the policy is linked into the hash and
> rt_genid_bump_ipv6() runs within the same critical section. As far as I
> can tell, the linking stores and the cmpxchg on fib6_sernum are all
> relaxed, with no barrier between them. Could a reader read the advanced
> generation in gen0, miss the policy during the lookup, sample a
> restamped fn_sernum, and still read the same generation in gen1?
>

Both hops are covered by fib6_new_sernum. It allocates the serial with
atomic_try_cmpxchg, which is fully ordered when it succeeds, so it acts
as an smp_mb before and after the update of fib6_sernum.

For the first hop, the policy (or route) is linked before
fib6_new_sernum runs, which gives message passing against the smp_rmb
after gen0: a reader that reads the advanced generation in gen0 also
finds the policy.

> In fib6_flush_trees(), the serial is allocated before __fib6_clean_all()
> takes tb6_lock, and fib6_clean_node() stamps the nodes with a plain
> WRITE_ONCE(). spin_lock() is an ACQUIRE, and my reading of
> memory-barriers.txt is that operations issued before an ACQUIRE may
> complete after it. So a reader could sample the restamped fn_sernum

For the second hop, every fn_sernum write follows a successful
fib6_new_sernum on the same CPU: fib6_update_sernum,
__fib6_update_sernum_upto_root, and fib6_clean_node in the flush case.
The full barrier orders the counter update before the tb6_lock
acquisition and the stamps, so the ACQUIRE semantics of spin_lock don't
matter here. A reader that samples a restamped fn_sernum reads the
advanced generation in gen1 after the smp_rmb, and the helper returns
cookie 0.

> between two reads that both still return the old generation. The only
> pairing I found written down here is fib6_get_cookie_safe()'s smp_rmb()
> against the smp_wmb() in __fib6_update_sernum_upto_root().
>

Right, this isn't documented. The barrier comments in
ip6_dst_lookup_flow_cookie should name fib6_new_sernum as the pairing
side, and fib6_new_sernum should state that its full ordering is relied
upon.

I also checked both hops with an LKMM litmus test: the outcome you
describe is forbidden with atomic_cmpxchg and becomes reachable with
atomic_cmpxchg_relaxed.

While going through the writers I also noticed that xfrm_policy_insert
unlinks a replaced policy only after rt_genid_bump_ipv6, so a lookup
after the bump can still match the old policy. That is a writer-side
ordering issue independent of this series, and it affects the current
late cookie sampling in the same way. I'll send a separate fix.

Does this explanation address your concern? If so, I'll carry your
Reviewed-by. I'm waiting for the Sashiko review of v3: if it reports
anything that needs a respin, I'll add the barrier comments in v4,
otherwise I'll send them as a follow-up.

Thanks for the careful review!

-- 
Ralf Lici
Mandelbit Srl
