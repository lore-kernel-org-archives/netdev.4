Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991727;
	b=mT5Q0cmB7D05fXslXKpR67TRZWOaAVHaPZmmh9EKKTnVmeO4suNZXxm/iqTZhaGFfqMs
	 bb1ynMF1HM3cF2lTVDL2oXe57YIVvaYntVCzUtFEPofNDBVA+sJDvUwB99Vx5GMz64ba/
	 HPYetz/jj2UPsDZMW4Qa1yCBkb/KR2nFRpXjKl7zgKwPt9/MzVPBcJd6UkewRe/gwFilC
	 R/KR3R4DImWDyAdyTXMv68ulQhODCZJQ9hE7HcazLQIPRQvmga4atoUntzAwjWz4Yw54w
	 doGRsbwi7fAk05X7q2CN4Z51vnpqnO3pbgXHnjwYSE4caE3eaFNFNfIfF+DYNGdTlxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991727;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hLKwl57vq0KOyNZEMw3n/9gybqQza5X72WPH5qGtjfw=;
	b=LB1rYTZWPknDZyOx3NR0XXgS5cu1OME1ZCvy9/QVWpWAk9MSDrzP4Aq657tcphRjqpwx
	 gCf7b6d9j8wpxZVfbV7V/Z7AiDp8UGbTSav93bjh40+4XnxbGHcZwIaEFKB2lViAHcAIg
	 GFF1Lcfn8cmYsCVD6iLnkzrjPQdR1X7S2WTGUxyBLx3Y1tHQSG+cvrkHRL0tW7DQr4oXr
	 wCV8SYb2nWAatm/pz8bUjJvDEhGiZdqia6fsJXDzewHAfeIaSISxkNt6y5HHYLtYdw33s
	 mzmshMl4LKROQFDCN5bv8H7ZK1J3uXaKyPieYDUamsm/8gghxNjAavjjFE01NMGk7fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YDty5W0a;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0EB606A325;
	Wed, 18 Nov 2026 08:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0EB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YDty5W0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YDty5W0aXS8zQ2emYOqT7+ZmHAPgpHSdXcgpxzywZEZtlPOSE8aZ+AX1Lu0qspP9PYXxJdHSOhuab
	 xrus/gsCRIPpK2iS4aY6Hs9KWXNyw2xYUTxWt18IMAzr1vVjIWnBadiBQS10KEAE9rjzaeluIuhAGG
	 dMT9V+DhjjM9vavs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afd6661fa4-0fac3;
	Wed, 18 Nov 2026 16:48:36 +0800 (CST)
X-RM-TRANSID:2ee56afd6661fa4-0fac3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.131] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6afd666290b-d02f7;
	Wed, 18 Nov 2026 16:48:36 +0800 (CST)
X-RM-TRANSID:2eea6afd666290b-d02f7
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Florian Westphal <fw@strlen.de>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Antonio Quartulli <antonio@mandelbit.com>, linux-kernel@vger.kernel.org,
 Xia Yan <yanxia@cmss.chinamobile.com>, yana06070@163.com
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
Date: Wed, 18 Nov 2026 16:48:34 +0800
Message-ID: <1794991714000.1115021.7710558447771708161@cmss.chinamobile.com>
In-Reply-To:
 <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
References: <cover.1794906743.git.ralf@mandelbit.com>
 <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I traced the race and the fix against current net-next.

On the writer side, xfrm_policy_insert() links the policy and then calls
rt_genid_bump_ipv6(), which resolves to fib6_flush_trees(). A fresh serial
is allocated from the namespace counter first, then every node is
restamped under tb6_lock. A late rt6_get_cookie() can pick up that
post-insertion serial for a dst whose lookup ran before the insertion,
and the pair keeps passing dst_check until the next flush. Sampling the
cookie between two generation reads closes the in-lookup window. A
policy inserted after the helper returns is still caught later, because
the restamp changes fn_sernum itself and the stored pre-insertion cookie
stops matching. fib6_new_sernum() never returns 0, so the fallback
cookie always fails fib6_check().

1/3 checks out as well. The old code kept writing -1 into the node, so a
second failure changed nothing and the namespace generation never moved.
The fresh allocation under tb6_lock matches the discipline the
fib6_ifup()/fib6_ifdown() paths already get from __fib6_clean_all().
The conversion boundary in 3/3 also matches the tree: rawv6 does not
cache the dst, and the accepted-socket and refill stores in tcp_ipv6.c
are listed as follow-up.

One thing I could not fully work out is the ordering behind the
generation checks. When the lookup misses a change, the reader relies on
the two generation reads to notice it. My understanding is that this
needs the change visible before the counter advance, and the counter
advance visible before the node restamps. I could not establish either
hop, though I may well be missing something.

In xfrm_policy_insert(), the policy is linked into the hash and
rt_genid_bump_ipv6() runs within the same critical section. As far as I
can tell, the linking stores and the cmpxchg on fib6_sernum are all
relaxed, with no barrier between them. Could a reader read the advanced
generation in gen0, miss the policy during the lookup, sample a
restamped fn_sernum, and still read the same generation in gen1?

In fib6_flush_trees(), the serial is allocated before __fib6_clean_all()
takes tb6_lock, and fib6_clean_node() stamps the nodes with a plain
WRITE_ONCE(). spin_lock() is an ACQUIRE, and my reading of
memory-barriers.txt is that operations issued before an ACQUIRE may
complete after it. So a reader could sample the restamped fn_sernum
between two reads that both still return the old generation. The only
pairing I found written down here is fib6_get_cookie_safe()'s smp_rmb()
against the smp_wmb() in __fib6_update_sernum_upto_root().

If either gap is real, the reader ends up caching the plain dst with a
post-flush serial that stays valid until the next flush. That is the
state the series sets out to prevent, so I suspect I am missing
something. Your September RFC [1] seems to anticipate this in item 1 of
its writer contract: "a routing-visible update is published before its
serial is allocated and stamped". Could you check whether the two hops
are covered somewhere I did not look?

[1] https://lore.kernel.org/netdev/20260901122501.482920-1-ralf@mandelbit.com/

If there is an answer to the above that I missed, please feel free to
add:

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>


