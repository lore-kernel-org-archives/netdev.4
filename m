Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469190;
	b=oHXFeO1Oy/IXCKg2iwI+VLtdGffDY+Yvvi/7HtjaCL7iol5NyeWkmB0+BSrbTAnNFR4F
	 w5aYwnwKmD0bu+7N4huh3bKjAiIckZwrUHnY0F7XTaauCmQoBYdjLd/j9lRnfBMWDq+fR
	 bZuY039skPX1IWTjG7TiLPMI+/P8iN5+XQz4fgwvVALVVZNBdoFd3X2DtigQ7e0GOSOEE
	 mwaqcbYMbOIEKgLbFlNGUZMO7FJ+GmcIFIfONuiDYvjTebU118O9tAyNVMMUEOLAR2Eff
	 1lHPlwGf4Gm3DpAPNT1oHM8n/n9Oh9HIoev7tcxcekofEmqVB6kZgQbNIyVc4b8Ym3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469190;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=N0ohdUvRr5gJjZFdvhVg/zGWg5YJFGOZFqj/eev4ZlE=;
	b=2OwBU2GLxjR6Z5hreHtSLDF2H8jzgbUBdYCcNCm1HI++/1K1ZVKcGB6259NRPZSdPQk4
	 7yR+EzQ+EA+p5zB4MVo3APLUDx9FmrrRHskW7AIzOnVTGUJMg+ZIy+vunmxFtEPX4WsM6
	 tS/dG19ytXMYK33uItqfYBg29ceEP9y8CmnoE+lFG5//PTESPzT/ENmOi0grRYSk0A3qt
	 e1hmTZK3RHtfFI20HCI+UgpK7W8qfkGRjv1UZ9Ap13YAlr1sAgSKJW13aQD/SHLAn+43u
	 o7mM/6mv2/uk8TxV5Ar8cItilq2dDxglWuB+qftH+X3qc1UONitHkZbMcNKG6TEbLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhd3R7rv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D2606A332
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hhd3R7rv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC7E1F000D0;
	Mon, 23 Nov 2026 21:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469189;
	bh=N0ohdUvRr5gJjZFdvhVg/zGWg5YJFGOZFqj/eev4ZlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hhd3R7rvmUMdP97wSDY1QfHqdNyfahNyhgueg1z8ks6FDB+eRv95WfW+E+xg3FGHi
	 44o42DQs74H1T4A5B1I6c31pFsqLV7NAJF2HVDsQCvzZ6A5OTp6xeMjtEEYRD4S/1h
	 PEU7mFOpT2jVV2GeFMqObhWgy7CsTy1JU8rMS4xjUMfGtxSzN9F7d4Hc7xYBY5bnCJ
	 r2mFFUURrXx6k8v56RZo1n8kUgO/1RVDOE4H52fnUmFQ40+yNoAy+buC8AXVPWFqQU
	 Thiwu24b+d3/FOjWCdcRC3qIVZUhZ5HJdGI/3u7NaavzGjS7PYrwZ6SPiZTJogq07y
	 vJlpZd/94fXQg==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 1/7] ipv6: validate dsts against the netns route generation
Date: Mon, 23 Nov 2026 14:26:03 -0700
Message-ID: <20261123212623.106153-2-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123212623.106153-1-dsahern@kernel.org>
References: <20261123212623.106153-1-dsahern@kernel.org>
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

An rt6_info never carried the fib6 serial number it was created
under. rt6_get_cookie() read fn->fn_sernum through rt->from at the time a
socket, dst_cache or xfrm bundle stored its cookie, so a change that
landed between route lookup and cookie capture was folded into the
cookie and a stale dst looked valid. Only nexthop-object pcpu routes
were stamped at creation, with the same counter.

net->ipv6.fib6_sernum is already the counter that rt_genid_ipv6()
reads and that every FIB change bumps. Stamp every dst with it in
ip6_dst_alloc() and validate with a plain comparison in
ip6_dst_check(); the remaining checks are that the fib6_info is still
in the tree and not expired. rt6_get_cookie() now returns rt->sernum
and fib6_get_cookie_safe() goes away. fn_sernum stays for route dump
consistency.

Validity lives in the dst, so a long-lived dst is never re-stamped by
a later lookup: pcpu and exception dsts are shared by every socket and
dst_cache that holds them, and re-stamping would make a stale dst valid
again for all of them. IPv4 does the same: a stale cached route fails
rt_cache_valid() and a new one is allocated, while holders of the old
one keep seeing it as stale. Likewise here:

 - a pcpu dst that fails the check is dropped from the pcpu slot and
   rebuilt by rt6_make_pcpu_route().
 - an exception dst that fails the check is treated as a miss by
   rt6_find_cached_rt().

The smp_wmb() in __fib6_update_sernum_upto_root() paired with the
smp_rmb() in fib6_get_cookie_safe(), so that a lockless reader that saw
a new fn_sernum also saw the route inserted before it. That reader is
gone. The remaining fn_sernum readers, the route dumps, take tb6_lock
after reading it and the writers hold it, so drop the barrier.

ip6_link_failure() still writes fn_sernum, which no longer
invalidates anything; that is addressed in the next patch.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- Do not re-stamp pcpu and exception dsts when a lookup finds them
  again (drop rt6_refresh_sernum()); a stale pcpu dst is dropped and
  rebuilt, a stale exception is treated as a miss.
- Commit message updated to match.

 include/net/ip6_fib.h | 42 ++++-----------------------------
 net/ipv6/ip6_fib.c    |  2 --
 net/ipv6/route.c      | 55 ++++++++++++++++++++++---------------------
 3 files changed, 32 insertions(+), 67 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index 232289b439c3..ecce7ab007a5 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -273,46 +273,12 @@ static inline bool fib6_check_expired(const struct fib6_info *f6i)
 	return false;
 }
 
-/* Function to safely get fn->fn_sernum for passed in rt
- * and store result in passed in cookie.
- * Return true if we can get cookie safely
- * Return false if not
- */
-static inline bool fib6_get_cookie_safe(const struct fib6_info *f6i,
-					u32 *cookie)
-{
-	struct fib6_node *fn;
-	bool status = false;
-
-	fn = rcu_dereference(f6i->fib6_node);
-
-	if (fn) {
-		*cookie = READ_ONCE(fn->fn_sernum);
-		/* pairs with smp_wmb() in __fib6_update_sernum_upto_root() */
-		smp_rmb();
-		status = true;
-	}
-
-	return status;
-}
-
 static inline u32 rt6_get_cookie(const struct rt6_info *rt)
 {
-	struct fib6_info *from;
-	u32 cookie = 0;
-
-	if (rt->sernum)
-		return rt->sernum;
-
-	rcu_read_lock();
-
-	from = rcu_dereference(rt->from);
-	if (from)
-		fib6_get_cookie_safe(from, &cookie);
-
-	rcu_read_unlock();
-
-	return cookie;
+	/* sernum is the netns route generation the dst was created or last
+	 * revalidated under; ip6_dst_check() compares it to the current one.
+	 */
+	return READ_ONCE(rt->sernum);
 }
 
 static inline void ip6_rt_put(struct rt6_info *rt)
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..d465ac6ffbc6 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -1432,8 +1432,6 @@ static void __fib6_update_sernum_upto_root(struct fib6_info *rt,
 	struct fib6_node *fn = rcu_dereference_protected(rt->fib6_node,
 				lockdep_is_held(&rt->fib6_table->tb6_lock));
 
-	/* paired with smp_rmb() in fib6_get_cookie_safe() */
-	smp_wmb();
 	while (fn) {
 		WRITE_ONCE(fn->fn_sernum, sernum);
 		fn = rcu_dereference_protected(fn->parent,
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4a4c5ace63c5..6fa76c95b1d2 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -367,6 +367,7 @@ struct rt6_info *ip6_dst_alloc(struct net *net, struct net_device *dev,
 
 	if (rt) {
 		rt6_info_init(rt);
+		rt->sernum = rt_genid_ipv6(net);
 		atomic_inc(&net->ipv6.rt6_stats->fib_rt_alloc);
 	}
 
@@ -1458,15 +1459,12 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
 	ip6_rt_copy_init(pcpu_rt, res);
 	pcpu_rt->rt6i_flags |= RTF_PCPU;
 
-	if (f6i->nh)
-		pcpu_rt->sernum = rt_genid_ipv6(dev_net(dev));
-
 	return pcpu_rt;
 }
 
 static bool rt6_is_valid(const struct rt6_info *rt6)
 {
-	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
+	return READ_ONCE(rt6->sernum) == rt_genid_ipv6(dev_net(rt6->dst.dev));
 }
 
 /* It should be called with rcu_read_lock() acquired */
@@ -1476,7 +1474,11 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
 
 	pcpu_rt = this_cpu_read(*res->nh->rt6i_pcpu);
 
-	if (pcpu_rt && pcpu_rt->sernum && !rt6_is_valid(pcpu_rt)) {
+	/* A dst stamped with an older genid stays stale for everyone still
+	 * holding it, as in IPv4. Never re-stamp it; drop it and build a
+	 * new one.
+	 */
+	if (pcpu_rt && !rt6_is_valid(pcpu_rt)) {
 		struct rt6_info *prev, **p;
 
 		p = this_cpu_ptr(res->nh->rt6i_pcpu);
@@ -1878,8 +1880,14 @@ static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 	bucket = fib6_nh_get_excptn_bucket(res->nh, NULL);
 	rt6_ex = __rt6_find_exception_rcu(&bucket, daddr, src_key);
 
-	if (rt6_ex && !rt6_check_expired(rt6_ex->rt6i))
+	if (rt6_ex && !rt6_check_expired(rt6_ex->rt6i)) {
 		ret = rt6_ex->rt6i;
+		/* Do not re-stamp a stale exception: other holders must
+		 * keep seeing it as stale. Treat it as a miss instead.
+		 */
+		if (!rt6_is_valid(ret))
+			ret = NULL;
+	}
 
 #ifdef CONFIG_IPV6_SUBTREES
 	/* Use fib6_src as src_key and redo lookup */
@@ -2767,27 +2775,18 @@ struct dst_entry *ip6_blackhole_route(struct net *net, struct dst_entry *dst_ori
  *	Destination cache support functions
  */
 
-static bool fib6_check(struct fib6_info *f6i, u32 cookie)
+static bool fib6_check(struct fib6_info *f6i)
 {
-	u32 rt_cookie = 0;
-
-	if (!fib6_get_cookie_safe(f6i, &rt_cookie) || rt_cookie != cookie)
-		return false;
-
-	if (fib6_check_expired(f6i))
+	if (!rcu_access_pointer(f6i->fib6_node))
 		return false;
 
-	return true;
+	return !fib6_check_expired(f6i);
 }
 
 static struct dst_entry *rt6_check(struct rt6_info *rt,
-				   struct fib6_info *from,
-				   u32 cookie)
+				   struct fib6_info *from)
 {
-	u32 rt_cookie = 0;
-
-	if (!from || !fib6_get_cookie_safe(from, &rt_cookie) ||
-	    rt_cookie != cookie)
+	if (!from || !rcu_access_pointer(from->fib6_node))
 		return NULL;
 
 	if (rt6_check_expired(rt))
@@ -2797,12 +2796,11 @@ static struct dst_entry *rt6_check(struct rt6_info *rt,
 }
 
 static struct dst_entry *rt6_dst_from_check(struct rt6_info *rt,
-					    struct fib6_info *from,
-					    u32 cookie)
+					    struct fib6_info *from)
 {
 	if (!__rt6_check_expired(rt) &&
 	    READ_ONCE(rt->dst.obsolete) == DST_OBSOLETE_FORCE_CHK &&
-	    fib6_check(from, cookie))
+	    fib6_check(from))
 		return &rt->dst;
 	return NULL;
 }
@@ -2816,8 +2814,11 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 
 	rt = dst_rt6_info(dst);
 
-	if (rt->sernum)
-		return rt6_is_valid(rt) ? dst : NULL;
+	/* Any FIB change bumps the netns generation, which invalidates
+	 * every dst created under an older one.
+	 */
+	if (!rt6_is_valid(rt))
+		return NULL;
 
 	rcu_read_lock();
 
@@ -2830,9 +2831,9 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 
 	if (from && (rt->rt6i_flags & RTF_PCPU ||
 	    unlikely(rt->dst.rt_uncached_list)))
-		dst_ret = rt6_dst_from_check(rt, from, cookie);
+		dst_ret = rt6_dst_from_check(rt, from);
 	else
-		dst_ret = rt6_check(rt, from, cookie);
+		dst_ret = rt6_check(rt, from);
 
 	rcu_read_unlock();
 
-- 
2.43.0

