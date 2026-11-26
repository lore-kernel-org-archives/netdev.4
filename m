Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656836;
	b=oxXKT7Du3a1QyN7wmQw2A3l0T/+D6cpWcIR+X1iwG656WukG6VBUfMxX4aOsX8xNS4Zc
	 KIXzziKmzTw5uUBo9pAi1FBDb43FlCYgJy3JmSK48zyLmQ+QUBQwVDimOSOjy/mfyDwib
	 yQeuUv3cgo4NDMVhilSGf99DO51IYfmVz2pwo45RJKeYskoJf9uwZ75DHZCCot33CivyA
	 uvgP5WNsFgBcP0LBPUhaWcpVJVAgBC7jmDNjWjoNbnsLAbq3O0EK08Og3Yd7+JDBy7qb0
	 igg+xO9ApkQ45QweQNC5DNYOqTStrm9XQJrkkmVbXjcxqW2aI62evP/+OeLi6bzoeug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656836;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GLkNdb/FQg8oJgmc8KKb+Zht1YzQeWSZKOpKXVlP5hM=;
	b=vrwyiPAh/miMy5Pr7IsGw/vp5ef4XugufDcJ5AA0w/kOhb27WR1VSXlKLsYPN14N4hRc
	 djrwqVl0KIN2QUBe9tKvmsBA3cpRZNKp/sSTPTHefwd9GOLjjY9pPJDZXg1CCaHZJnacC
	 fimlK4CAAvsxeZSwEmnW8SbS3Etsrhcb1t+4xiDAZx19vUn5A+LJztAxbegci9xoAfZD/
	 g1Ih7tGBge+WRpm0KmSMjmC4AoP8iO9l17NOf8A1aDjSJK8KfGmbIgmCAJkUQgycHWT1w
	 bh7eYe0PygHN5pDiya4BKZVSJCY8PcBdbQxXqtehQqrzZapd+QGLuUhHib6q9D641Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RU6KkwgI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE464606A336
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RU6KkwgI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F4D1F000EE;
	Thu, 26 Nov 2026 01:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656836;
	bh=GLkNdb/FQg8oJgmc8KKb+Zht1YzQeWSZKOpKXVlP5hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RU6KkwgIv9rKvBr0GERA1DUav8MJq6K6gutdBVwhXMQI3GcC3AqzJvBZVj46khWw7
	 NP7xYO45lT/yy/COKKEJhGHDl7Mk9XmKWcsCHktIdZlS32RoEI55yOqKgwFt4+wPF6
	 oibbtNZT2Gh/wH08ThQq/jEYUW74CxtBOfS+njwb05s+/ACDtpcyz/buBiZLnSq4CP
	 VtYGsUHfWyGGhSWwE7G85iN1C5NrceLXRkoPorZygDYroBOFb8ADUuCZwlqK+t0vOx
	 dTOb1NF9k65ah353UOnyv3Ed7sjSLxP2nxOV+mOl2TsPFvqFg508skkXWkNWsWpGX6
	 ywxZhRhKQLTlA==
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
Subject: [PATCH net-next v2 10/13] ipv6: stamp dsts with the generation sampled before the FIB lookup
Date: Wed, 25 Nov 2026 18:33:36 -0700
Message-ID: <9dd4252dc06c088f6e62b7c93156058514994df6.1795642432.git.dahern@nvidia.com>
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

A dst is stamped with the netns route generation in ip6_dst_alloc(),
which runs after the FIB has been read. A route change that lands
between the lookup and the allocation is folded into the stamp: the
dst was built from the old tree but carries the new generation, so
ip6_dst_check() accepts it and it can keep bypassing the new route
indefinitely.

Sample the generation before the FIB is walked, carry it in
struct fib6_result and stamp every dst built from that result with it.
Writers bump the generation after the route change is visible, so a
lookup that read the old tree cannot have sampled the new generation;
the resulting dst fails ip6_dst_check() as soon as the change is
published. Use an acquire read for the sample so the FIB reads are not
reordered before it.

The sample is taken in fib6_table_lookup(), ip6_pol_route_lookup() and
__ip6_route_redirect(). Exceptions created from an existing dst in
__ip6_rt_update_pmtu() and rt6_do_redirect() inherit that dst's stamp
instead of the current generation, taken with rt6_dst_sernum() so that
a dst already marked stale still passes on the generation it was built
under. The copy that replaces a stale exception in
rt6_refresh_exception() is stamped from the lookup result too; every
caller samples, and a debug warning catches one that does not. Dsts
allocated without a lookup result keep the stamp taken in
ip6_dst_alloc().

A lookup can also return a cached dst that a later lookup built:
between the sample and reading the pcpu slot, a lookup on the same CPU
(softirq, preemption, migration) can run after a FIB change and
install a pcpu dst stamped with the newer generation for the route
this lookup selected, and an exception can be refreshed by another CPU
in the same way. Such a dst passes the validity checks, but the
decision it is returned for predates the change. ip6_pol_route() makes
a dst whose stamp differs from its sample fail ip6_dst_check(), so its
users look the route up again. This also covers callers that use
ip6_pol_route() directly, such as seg6, which caches the result in a
dst_cache.

The sample is taken for one table. A lookup that reads several, the
local table and then the main one, or those the rules select, decides
from all of them: a route that is added to a table that was already
read, and missed, while a later one is read is not part of the
decision, but the dst of the later table is stamped after the change
and would look current. fib6_rule_lookup() therefore samples before
the first table, and if the dst it returns carries a newer stamp, a
change landed in between and the dst is made to fail ip6_dst_check()
so that its users look the route up again. That only happens when the
generation moved during the lookup.

Reported-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: David Ahern <dahern@nvidia.com>
---
 include/net/ip6_fib.h       | 11 +++++++++++
 include/net/net_namespace.h | 10 ++++++++++
 net/ipv6/fib6_rules.c       | 33 ++++++++++++++++++++++++++++++---
 net/ipv6/route.c            | 30 +++++++++++++++++++++++++++++-
 4 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index ef5138ae7075..1c70176751d5 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -231,6 +231,11 @@ struct fib6_result {
 	u32			fib6_flags;
 	u8			fib6_type;
 	struct rt6_info		*rt6;
+	/* Route generation sampled before the FIB was read. Dsts built
+	 * from this result are stamped with it, not with the generation
+	 * at allocation time. 0 means not sampled.
+	 */
+	int			sernum;
 };
 
 #define for_each_fib6_node_rt_rcu(fn)					\
@@ -305,6 +310,12 @@ static inline void rt6_dst_invalidate(struct rt6_info *rt)
 		WRITE_ONCE(rt->sernum, sernum | RT6_SERNUM_STALE);
 }
 
+/* The generation @rt was built under, whether or not it is still valid */
+static inline int rt6_dst_sernum(const struct rt6_info *rt)
+{
+	return READ_ONCE(rt->sernum) & ~RT6_SERNUM_STALE;
+}
+
 static inline void ip6_rt_put(struct rt6_info *rt)
 {
 	/* dst_release() accepts a NULL parameter.
diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index f39baf51bcc5..31ffac7baf73 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -557,6 +557,16 @@ static inline int rt_genid_ipv6(const struct net *net)
 	return atomic_read(&net->ipv6.fib6_sernum);
 }
 
+/* Sample the generation before walking the FIB. Writers bump it after the
+ * route change is visible, so a lookup that sees the old tree cannot sample
+ * the new generation: whatever dst it builds carries a generation that
+ * fails ip6_dst_check() once the change lands.
+ */
+static inline int rt_genid_ipv6_sample(const struct net *net)
+{
+	return atomic_read_acquire(&net->ipv6.fib6_sernum);
+}
+
 /* Invalidate every cached IPv6 dst in @net. Returns the new generation,
  * which is never 0.
  */
diff --git a/net/ipv6/fib6_rules.c b/net/ipv6/fib6_rules.c
index 0ffd7b47a046..eec87486bb2f 100644
--- a/net/ipv6/fib6_rules.c
+++ b/net/ipv6/fib6_rules.c
@@ -96,10 +96,37 @@ int fib6_lookup(struct net *net, int oif, struct flowi6 *fl6,
 EXPORT_SYMBOL_GPL(fib6_lookup);
 #endif
 
+/* A dst that a table lookup returns is stamped with the generation sampled
+ * before that table was read, so a change that lands after the read cannot
+ * be folded into the stamp. A lookup that reads several tables, the local
+ * one and then the main one, or those the rules select, makes its decision
+ * from all of them. A route that is added to a table that was already read,
+ * and missed, while a later one is being read is not part of that decision,
+ * but the dst of the later table is stamped after the change and would look
+ * current. Sample before the first table, and if the dst carries a newer
+ * stamp a change landed in between: make it fail ip6_dst_check(), so that
+ * its users look the route up again.
+ */
+static struct dst_entry *fib6_rule_lookup_done(struct dst_entry *dst,
+					       int sernum)
+{
+	struct rt6_info *rt = dst_rt6_info(dst);
+
+	/* The static null, prohibit and blackhole entries are not made from a
+	 * route and not stamped
+	 */
+	if (rcu_access_pointer(rt->from) && rt6_dst_sernum(rt) != sernum)
+		rt6_dst_invalidate(rt);
+
+	return dst;
+}
+
 struct dst_entry *fib6_rule_lookup(struct net *net, struct flowi6 *fl6,
 				   const struct sk_buff *skb,
 				   int flags, pol_lookup_t lookup)
 {
+	int sernum = rt_genid_ipv6_sample(net);
+
 	if (net->ipv6.fib6_has_custom_rules) {
 		struct fib6_result res = {};
 		struct fib_lookup_arg arg = {
@@ -116,19 +143,19 @@ struct dst_entry *fib6_rule_lookup(struct net *net, struct flowi6 *fl6,
 				 flowi6_to_flowi(fl6), flags, &arg);
 
 		if (res.rt6)
-			return &res.rt6->dst;
+			return fib6_rule_lookup_done(&res.rt6->dst, sernum);
 	} else {
 		struct rt6_info *rt;
 
 		rt = pol_lookup_func(lookup,
 			     net, net->ipv6.fib6_local_tbl, fl6, skb, flags);
 		if (rt != net->ipv6.ip6_null_entry && rt->dst.error != -EAGAIN)
-			return &rt->dst;
+			return fib6_rule_lookup_done(&rt->dst, sernum);
 		ip6_rt_put_flags(rt, flags);
 		rt = pol_lookup_func(lookup,
 			     net, net->ipv6.fib6_main_tbl, fl6, skb, flags);
 		if (rt->dst.error != -EAGAIN)
-			return &rt->dst;
+			return fib6_rule_lookup_done(&rt->dst, sernum);
 		ip6_rt_put_flags(rt, flags);
 	}
 
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 86351769ee2b..cebd0809ba88 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1214,6 +1214,12 @@ static void ip6_rt_copy_init(struct rt6_info *rt, const struct fib6_result *res)
 	rt->rt6i_idev = dev ? in6_dev_get(dev) : NULL;
 	ip6_rt_init_dst(rt, res);
 
+	/* Pair the dst with the generation the FIB was read under, so a
+	 * change between the lookup and this allocation is not folded in.
+	 */
+	if (res->sernum)
+		rt->sernum = res->sernum;
+
 	rt->rt6i_dst = f6i->fib6_dst;
 	rt->rt6i_flags = res->fib6_flags;
 	if (nh->fib_nh_gw_family) {
@@ -1299,6 +1305,7 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 	bool retry = false;
 
 	rcu_read_lock();
+	res.sernum = rt_genid_ipv6_sample(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 restart:
 	res.f6i = rcu_dereference(fn->leaf);
@@ -2207,7 +2214,10 @@ static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
  * Dropping it instead would make every FIB change in the netns discard all
  * learned PMTUs and redirects.
  *
- * The copy is stamped like any dst built from this result. Caller holds
+ * The copy is stamped with the generation sampled before the FIB was read,
+ * like any dst built from this result, so @res must carry that sample:
+ * without it the copy would be stamped when it is allocated and could look
+ * current although the FIB changed after the lookup. Caller holds
  * rcu_read_lock().
  */
 static struct rt6_info *rt6_refresh_exception(const struct fib6_result *res,
@@ -2218,6 +2228,8 @@ static struct rt6_info *rt6_refresh_exception(const struct fib6_result *res,
 	struct rt6_info *nrt;
 	int err;
 
+	DEBUG_NET_WARN_ON_ONCE(!res->sernum);
+
 #ifdef CONFIG_IPV6_SUBTREES
 	if (old->rt6i_src.plen)
 		saddr = &old->rt6i_src.addr;
@@ -2662,6 +2674,7 @@ int fib6_table_lookup(struct net *net, struct fib6_table *table, int oif,
 {
 	struct fib6_node *fn, *saved_fn;
 
+	res->sernum = rt_genid_ipv6_sample(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 	saved_fn = fn;
 
@@ -2777,6 +2790,17 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 		local_bh_enable();
 	}
 out:
+	/* A cached dst, pcpu or exception, can have been built or refreshed
+	 * by a lookup that ran after a FIB change landed behind our sample:
+	 * it is stamped with the newer generation and passes
+	 * rt6_get_pcpu_route() and the exception lookup, but our decision
+	 * predates that change. Make it fail ip6_dst_check() so that its
+	 * users look the route up again, as fib6_rule_lookup_done() does
+	 * across tables; this also covers callers that bypass that wrapper.
+	 */
+	if (rt && rt6_dst_sernum(rt) != res.sernum)
+		rt6_dst_invalidate(rt);
+
 	if (!rt)
 		rt = net->ipv6.ip6_null_entry;
 	if (!(flags & RT6_LOOKUP_F_DST_NOREF))
@@ -3498,6 +3522,8 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 
 		res.fib6_flags = res.f6i->fib6_flags;
 		res.fib6_type = res.f6i->fib6_type;
+		/* derived from @rt6: it is only as current as that dst */
+		res.sernum = rt6_dst_sernum(rt6);
 
 		if (res.f6i->nh) {
 			struct fib6_nh_match_arg arg = {
@@ -3677,6 +3703,7 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *__ip6_route_redirect(struct net *net,
 	 */
 
 	rcu_read_lock();
+	res.sernum = rt_genid_ipv6_sample(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 restart:
 	for_each_fib6_node_rt_rcu(fn) {
@@ -4902,6 +4929,7 @@ static void rt6_do_redirect(struct dst_entry *dst, struct sock *sk, struct sk_bu
 
 	res.fib6_flags = res.f6i->fib6_flags;
 	res.fib6_type = res.f6i->fib6_type;
+	res.sernum = rt6_dst_sernum(rt);
 	nrt = ip6_rt_cache_alloc(&res, &msg->dest, NULL);
 	if (!nrt)
 		goto out;
-- 
2.54.0 (Apple Git-157)

