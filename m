Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386444;
	b=PzxpZt2BSww4/eNv0GK1qPncVT8iuB7A+DNQxFyfqZTZ08nDxcLIYa2Gl5V/Yefxtx3N
	 vft9Rvj+98r5+LZcBz5V2dWxYHwulW8fU/jFhafUrpeN9JDLZ2qvDDjUmm1eku9nN2NYo
	 FYkwzBfWfznqnzuF8fNpbnTiBWuRviuMyqi+BglMTGUWIjIwwf1uXEFamvxRFcUfpCCq6
	 m8pY9jVCuwIg9YOBjXcyJxRna9j0b/UpTYmxIdwtAOVSXZrZQJJJ3tsbnqXl9wfMkn7ic
	 UcwyqJqz3lfvzTf/a/vCZ4NPil0n/2CDHIAlZQ8f8dY82/wB8nleqQAuWLTCNCvNEEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386444;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=AADb8u9tbxY2dKrtbGcP6birSdHbgYRRvl48KAzLpHk=;
	b=UJ3JOBJTiN8H/sV8OHE5I+CZXrZ3EW0YSQKp7x3ybbY4NBoEpMyst0w7KRbIk+iHfhnN
	 smjIbbHTu0hbHNbhRcgcTvsiT1+6mKWHecBcg+oE3n9poe8ms8YPcbtRHXqkvZ76X9Ct8
	 9s1zBQTJg3sANtR6epmTG6e4XFzBwURNpnoi/RaCFIIN4V4sDGbrxm3KDzQrbcluotI1b
	 yL3Z5hiwmQzB0V5TCqSZ5kt5F8kLQu/C0iprh9yMCxti9egY5S77lvnwTJ21sCNYYJzKa
	 iSanPScgMwy4SdyYCVNvemkHdIC2/GaLsTTMe09IOoTeEMoXEQcaop9hsFTvejUjZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huCY2gOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB8606A336
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huCY2gOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5576C1F000D4;
	Sun, 22 Nov 2026 22:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386443;
	bh=AADb8u9tbxY2dKrtbGcP6birSdHbgYRRvl48KAzLpHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=huCY2gOcP5jMDIdN2SOSKTy3zVASPCqrEw9lUizOGUF3LE3TXgm66ZgYm1t/WAQEi
	 KTnQ62K2iD2boxd5QD8pIZqeLLGLbNpZ8cS3pcNpokmHCZCG7u/e0cuwmzy76K2XHX
	 oAHeyvQEnrchws0gAEmSGpvTbH+qIvA8CqFCdxn2zg1QNbqJK2NIDwioDsXnpCbDBR
	 J0XNPAaoyTJgeH6pnp4CUrWtjkjW/kyqPjFj51cEASlWRheHwqW9Jk/S/O+Mu+7x7d
	 FZCiCq+liiL7z6N7wGtdG4ThNzgLBrsfIK/yDNlgymf/MBKeIFTTw5U4S1ZxRyTa7f
	 jEzW4ivPk7WzA==
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
Subject: [RFC net-next 1/6] ipv6: validate dsts against the netns route generation
Date: Sun, 22 Nov 2026 15:26:59 -0700
Message-ID: <20261122222717.126333-3-dsahern@kernel.org>
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

Because validity now lives in the dst, long-lived dsts must be
re-stamped when a lookup finds them again, or they would stay invalid
forever:

 - pcpu dsts of routes with an embedded fib6_nh are re-stamped in
   rt6_get_pcpu_route(); nexthop-object pcpu dsts are still dropped
   and rebuilt.
 - exception dsts are re-stamped by rt6_find_cached_rt().

The smp_wmb() in __fib6_update_sernum_upto_root() paired with the
smp_rmb() in fib6_get_cookie_safe(), so that a lockless reader that saw
a new fn_sernum also saw the route inserted before it. That reader is
gone. The remaining fn_sernum readers, the route dumps, take tb6_lock
after reading it and the writers hold it, so drop the barrier.

ip6_link_failure() still writes fn_sernum, which no longer
invalidates anything; that is addressed in the next patch.

Signed-off-by: David Ahern <dahern@nvidia.com>
Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>
---
 include/net/ip6_fib.h | 42 +++------------------------
 net/ipv6/ip6_fib.c    |  2 --
 net/ipv6/route.c      | 66 +++++++++++++++++++++++++------------------
 3 files changed, 43 insertions(+), 67 deletions(-)

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
index 4a4c5ace63c5..1f7b2cdc1d9f 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -367,6 +367,7 @@ struct rt6_info *ip6_dst_alloc(struct net *net, struct net_device *dev,
 
 	if (rt) {
 		rt6_info_init(rt);
+		rt->sernum = rt_genid_ipv6(net);
 		atomic_inc(&net->ipv6.rt6_stats->fib_rt_alloc);
 	}
 
@@ -1458,15 +1459,24 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
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
+}
+
+/* @rt was just found by a lookup against the current FIB, so it is as
+ * valid as a freshly allocated dst. Call with rcu_read_lock() held.
+ */
+static void rt6_refresh_sernum(struct rt6_info *rt,
+			       const struct fib6_result *res)
+{
+	int genid = rt_genid_ipv6(dev_net(ip6_rt_get_dev_rcu(res)));
+
+	if (READ_ONCE(rt->sernum) != genid)
+		WRITE_ONCE(rt->sernum, genid);
 }
 
 /* It should be called with rcu_read_lock() acquired */
@@ -1476,7 +1486,14 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
 
 	pcpu_rt = this_cpu_read(*res->nh->rt6i_pcpu);
 
-	if (pcpu_rt && pcpu_rt->sernum && !rt6_is_valid(pcpu_rt)) {
+	/* Routes with an embedded fib6_nh keep their pcpu dsts across FIB
+	 * changes; nexthop objects can change under them, so those are
+	 * dropped and rebuilt.
+	 */
+	if (pcpu_rt && !rt6_is_valid(pcpu_rt) && !res->f6i->nh)
+		rt6_refresh_sernum(pcpu_rt, res);
+
+	if (pcpu_rt && !rt6_is_valid(pcpu_rt)) {
 		struct rt6_info *prev, **p;
 
 		p = this_cpu_ptr(res->nh->rt6i_pcpu);
@@ -1878,8 +1895,10 @@ static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 	bucket = fib6_nh_get_excptn_bucket(res->nh, NULL);
 	rt6_ex = __rt6_find_exception_rcu(&bucket, daddr, src_key);
 
-	if (rt6_ex && !rt6_check_expired(rt6_ex->rt6i))
+	if (rt6_ex && !rt6_check_expired(rt6_ex->rt6i)) {
 		ret = rt6_ex->rt6i;
+		rt6_refresh_sernum(ret, res);
+	}
 
 #ifdef CONFIG_IPV6_SUBTREES
 	/* Use fib6_src as src_key and redo lookup */
@@ -2767,27 +2786,18 @@ struct dst_entry *ip6_blackhole_route(struct net *net, struct dst_entry *dst_ori
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
@@ -2797,12 +2807,11 @@ static struct dst_entry *rt6_check(struct rt6_info *rt,
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
@@ -2816,8 +2825,11 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 
 	rt = dst_rt6_info(dst);
 
-	if (rt->sernum)
-		return rt6_is_valid(rt) ? dst : NULL;
+	/* Any FIB change bumps the netns generation, which invalidates
+	 * every dst created under an older one.
+	 */
+	if (!rt6_is_valid(rt))
+		return NULL;
 
 	rcu_read_lock();
 
@@ -2830,9 +2842,9 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 
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

