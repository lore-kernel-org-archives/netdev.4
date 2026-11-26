Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656829;
	b=JHJJdIXSzc7DnqJryJVpt0JI8+pjBcUk2xb8N3EuscbYi+/s5xPdR11+IrMUClScqB1M
	 Ms8DPrGggDBbSjC5rBgprWJDEHjLBy+10NNSAR1Qde0IMrKsIKsp6h9sHdXSCfmveWocZ
	 lRtQrKtu5GUfXHgLgXKiwC7A0VAjanMAnU4nkm3QKRCXFJQZnEeMTsNbQK+jHejcGv3Ib
	 aq/uBmSEUAnwuQVAYnJ5PrJ3u0IuJ9FsD68rSkN/mmm/0KG1T6RIkQpuKJ0uTBdPsn2eO
	 6NHzoWU0avIDuP9uT/Y+N5OInmsyB4bVQAYJzDBrQHf5MciytXwuamyoRxzbtvotHJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656829;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wchKAZ/VTZfbAw4K3wpoPKqqQbx3UjFAKnanmWR8ZqQ=;
	b=NEXTLxxaXOCyjhbuRp6K3gqPOldWqxPJ6gcNxyEp43fOdbEOc7tkYO5GwS3xe80560Zx
	 2NiEsxQOYzyhuT5jHSp5MrUzUyoj1N7E2lXrQff9WFDD5rGY9k3mNKIn/s+mqSCgYwHxB
	 rbJ6DZTPHwNoLcXK3zaC11u59mZKeT0I4E2FxHjLQchgJgJdL4cwCoU2ghhVSNxBd9UM0
	 mZqfQ7g0fTSBbF5hi3QnFejHC5LM8Sf/WfjhFvGB0Oo+Xbtoxk7P9oK8SJvooiC4tOwvE
	 eTsmRjD4E0x5Pg75vWuO83KvksW8sIVG6qAML80h8/LCsJhBsE+SZz8xT9dLbsRSucw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CfmJ4pSH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76B606A339
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CfmJ4pSH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D531F000D0;
	Thu, 26 Nov 2026 01:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656829;
	bh=wchKAZ/VTZfbAw4K3wpoPKqqQbx3UjFAKnanmWR8ZqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CfmJ4pSHbz8oqAxK3LceKkR8R6zXehqKotYa1IR/F2iUcbUtLQ0YNMpFV1JQg04re
	 f1lkL+XYJJWQPBjp3BfVrhIeVtz5fVPGxz5boHnd3r4sJZ6/OXYR73aIH4YZpui7Xy
	 LKohbU5GvKsgpqIJg0KtKX7GS1ZctLfaCIYNmCNzzUewXP2GHAbDxFuMB5qJqzNdr3
	 le7Omkl1nkchPUcJgiSFjbTJ4VmfqNFP3unTbF78kRdcrJ5SRY6btB5Sr+IJBwnlYD
	 njSqt6WMNFklLcLYpQAzWRWCcNdzT9DA0bnXUiJ5z2JINqLx/bQLBoTq/SumUeSEiS
	 m3vlgF9REXqLQ==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ralf@mandelbit.com,
	ja@ssi.bg,
	David Ahern <dahern@nvidia.com>
Subject: [PATCH net-next v2 04/13] ipv6: invalidate the failing dst in ip6_link_failure()
Date: Wed, 25 Nov 2026 18:33:30 -0700
Message-ID: <94591642bbaefaea15cf2aa2e0d5ca4e4de74686.1795642432.git.dahern@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1795642432.git.dahern@nvidia.com>
References: <cover.1795642432.git.dahern@nvidia.com>
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

When a default route's neighbour fails, ip6_link_failure() writes -1 to
the fn_sernum of the route's node so that users of dsts under that node
look the route up again and let router selection pick another default
router. That invalidates every dst under the node, which for a failing
router that can trigger this for every packet sent through it is far
more than needed.

Invalidate the failing dst only, which for a pcpu dst is one CPU's
copy. Do it by setting the top bit of its sernum: the netns route
generation, which a dst with a non-zero sernum is compared against, is
always positive, so the dst fails the check and its users do the lookup
again, and a pcpu dst that fails it is dropped from its slot and
rebuilt. The rest of sernum is left as it was, and setting the bit is
idempotent, so concurrent invalidators need no lock.

sernum of a published dst can now change under its readers, so read it
with READ_ONCE(), and in rt6_get_cookie() test and return a single
sample. A reader that sees the value before the mark and one that sees
it after both get a non-zero sernum: setting the bit never makes it
zero.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
 include/net/ip6_fib.h | 27 +++++++++++++++++++++++++--
 net/ipv6/route.c      | 18 +++++++++---------
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index 232289b439c3..bfc1895e8591 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -300,9 +300,14 @@ static inline u32 rt6_get_cookie(const struct rt6_info *rt)
 {
 	struct fib6_info *from;
 	u32 cookie = 0;
+	int sernum;
 
-	if (rt->sernum)
-		return rt->sernum;
+	/* Can be stale-marked concurrently (rt6_dst_invalidate()): test and
+	 * return one sample.
+	 */
+	sernum = READ_ONCE(rt->sernum);
+	if (sernum)
+		return sernum;
 
 	rcu_read_lock();
 
@@ -315,6 +320,24 @@ static inline u32 rt6_get_cookie(const struct rt6_info *rt)
 	return cookie;
 }
 
+/* An invalidated dst keeps the generation it was built under in the low
+ * bits, so state derived from it (exceptions) can be stamped with the FIB
+ * state it actually came from. The top bit makes it fail rt6_is_valid():
+ * the netns generation is always positive.
+ */
+#define RT6_SERNUM_STALE	INT_MIN
+
+static inline void rt6_dst_invalidate(struct rt6_info *rt)
+{
+	int sernum = READ_ONCE(rt->sernum);
+
+	/* Do not dirty the cache line of a dst that other CPUs read on the
+	 * fast path when it is already stale.
+	 */
+	if (!(sernum & RT6_SERNUM_STALE))
+		WRITE_ONCE(rt->sernum, sernum | RT6_SERNUM_STALE);
+}
+
 static inline void ip6_rt_put(struct rt6_info *rt)
 {
 	/* dst_release() accepts a NULL parameter.
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 52a30a62bcec..39204a0b42d1 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1466,7 +1466,7 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
 
 static bool rt6_is_valid(const struct rt6_info *rt6)
 {
-	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
+	return READ_ONCE(rt6->sernum) == rt_genid_ipv6(dev_net(rt6->dst.dev));
 }
 
 /* It should be called with rcu_read_lock() acquired */
@@ -1476,7 +1476,7 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
 
 	pcpu_rt = this_cpu_read(*res->nh->rt6i_pcpu);
 
-	if (pcpu_rt && pcpu_rt->sernum && !rt6_is_valid(pcpu_rt)) {
+	if (pcpu_rt && READ_ONCE(pcpu_rt->sernum) && !rt6_is_valid(pcpu_rt)) {
 		struct rt6_info *prev, **p;
 
 		p = this_cpu_ptr(res->nh->rt6i_pcpu);
@@ -2855,7 +2855,7 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 
 	rt = dst_rt6_info(dst);
 
-	if (rt->sernum)
+	if (READ_ONCE(rt->sernum))
 		return rt6_is_valid(rt) ? dst : NULL;
 
 	rcu_read_lock();
@@ -2912,14 +2912,14 @@ static void ip6_link_failure(struct sk_buff *skb)
 			rt6_remove_exception_rt(rt);
 		} else {
 			struct fib6_info *from;
-			struct fib6_node *fn;
 
+			/* Force sockets using this dst to look the route up
+			 * again; a stale-marked sernum never matches the
+			 * netns generation.
+			 */
 			from = rcu_dereference(rt->from);
-			if (from) {
-				fn = rcu_dereference(from->fib6_node);
-				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
-					WRITE_ONCE(fn->fn_sernum, -1);
-			}
+			if (from && (rt->rt6i_flags & RTF_DEFAULT))
+				rt6_dst_invalidate(rt);
 		}
 		rcu_read_unlock();
 	}
-- 
2.54.0 (Apple Git-157)

