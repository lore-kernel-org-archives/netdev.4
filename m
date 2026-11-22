Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386445;
	b=eO4MOG9bG+GNuihfpeEpDI+kHW+2178R9emPden1N0jNMYd5iqDle2UVNUWEj5dhy3Tz
	 zvWYWmRPddoYa4vNz/x1mBVgIuyIwZ6gQqXZbrrGFcf4rkBq2ypM6x/CYQNwKmU5xlpv6
	 BKBCG+AlvacH79xVBGcUV88xu//XGj41gfmuKK1n1dafU7aH+wPj0CPbYgSQUOC7ut3qt
	 MYXNpTUMuGn2c/Z7yiDJ0WPR1AumK3KhO+og15FsbzjxOhebyMs4zZxtmAo09ZcRLtLBU
	 eAGC0Gomo7FN0WrvZ1y5Oc6S2JdShYRTswIpGGOwzWGOcspZ/cpYxU8NabNYgvZmmEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386445;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=dfgFX1zjjeyXPlnELmVLZEr7Vw1O/9Vju7agU2TmpGg=;
	b=Is8rXJZcyUqHi3a55QqW4ALfDsdFC7WgBCG/fyT7vjxAtRj7Smd/ky4r47zFunPheF5Q
	 BtDCrVY0QaSnyqOEOpVxx2uGm+5A1a5I5Q5UNeuDyokQS+lbyC3rNEf00heNkCyasLrML
	 LPF7fgsdbbBxtvL2C3KzcTjxgkX5AXjH/yy1Jkbv92IlZEgqEGhOGTb9YyS2rcDJlm72B
	 tlcuWZgzVxN6m1HMj3/GtonwK3LfPflrYDGVfNi+vPv1IsgNXW752HPM64HI8ymAUrAqo
	 H7IWwvA+CBkCfIuxFW9u2i+TwaUmPqgd6BkWDV3TA5q8KsF/JnQEEOebd5/gkuGt6Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlWGRujh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF1606A686
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DlWGRujh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F821F000D2;
	Sun, 22 Nov 2026 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386444;
	bh=dfgFX1zjjeyXPlnELmVLZEr7Vw1O/9Vju7agU2TmpGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DlWGRujhwuPAs1vSW+fx8Uu6LRvCSEAOKi+/ICyLn4uNcUjr84BmQh5gdlDrpzuZv
	 CMNhij49RdLi+NbUBBb1ZOZ9oC0Szs2F3BFcId8Ypu3BeLemiZOm7OjDch4YXGOAv6
	 4nXzweFVMZ57kYIAn7eERY31JBipqwFv6v/b+F/GAnAQd4fDgFGIspd4gqyL+016pf
	 5AXckJGu5GOQeIKlizFjNY5y82Sip5Hb/X4D2+nArSINzxsZfl5NAaWse6gN8Svp3o
	 +JYvYF68OSzBLz8d5m6UlRE/F0Hacvkn84dfVK5I8Udj5U6Z0/KAbwAH7Z7MacPA4h
	 frx8ExIyjaBLw==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	"Claude Sonnet 5 . 5" <noreply@anthropic.com>
Subject: [RFC net-next 2/6] ipv6: invalidate the failing dst in ip6_link_failure()
Date: Sun, 22 Nov 2026 15:27:00 -0700
Message-ID: <20261122222717.126333-4-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122222717.126333-1-dsahern@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org>
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

From: David Ahern <dahern@nvidia.com>

When a default route's neighbour fails, ip6_link_failure() wrote -1
to the fn_sernum of the route's node so that users of dsts under that
node would look the route up again and let router selection pick
another default router.

dsts are now validated against the netns route generation, so that
write no longer invalidates anything. Clear the sernum of the failing
dst instead; 0 never matches the generation, so its users do the
lookup again. Only that dst is invalidated, which for a pcpu dst is
one CPU's copy, rather than every dst under the node. Bumping the
netns generation here would be much costlier, since a failing router
can trigger this for every packet sent through it.

Signed-off-by: David Ahern <dahern@nvidia.com>
Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>
---
 net/ipv6/route.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1f7b2cdc1d9f..d355652a0520 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2885,14 +2885,13 @@ static void ip6_link_failure(struct sk_buff *skb)
 			rt6_remove_exception_rt(rt);
 		} else {
 			struct fib6_info *from;
-			struct fib6_node *fn;
 
+			/* Force sockets using this dst to look the route up
+			 * again; 0 never matches the netns generation.
+			 */
 			from = rcu_dereference(rt->from);
-			if (from) {
-				fn = rcu_dereference(from->fib6_node);
-				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
-					WRITE_ONCE(fn->fn_sernum, -1);
-			}
+			if (from && (rt->rt6i_flags & RTF_DEFAULT))
+				WRITE_ONCE(rt->sernum, 0);
 		}
 		rcu_read_unlock();
 	}
-- 
2.43.0

