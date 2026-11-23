Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469193;
	b=afidhNJAyE1hooi+9pagXqVUBBDf2K1n+Qz985feTqFEw1c+ahYIGU1UK/D6UvLiLfoP
	 F2DktCbi1rQEihhJ1GRBqrNWC+pZFHw2/rgKz/mLjVjiA4XhdmVUKiGf2iLS+Hnc12YBt
	 uaZAThUTsua1ky0PULEYzW05P3qc/AKPydpe1wKxi9SUybzqczzxox6cWHTHWY0NTl3dY
	 bkIbSfbJVP2vIrnHWpJJkDdXKvtDFb/KTxXLwZ4/Y2qAGoNmgx/ViPjcfNIgna5ClGXON
	 6B9RPLKBJsuXNvitj0MkgtmeVh95MylQfd4VjXSSfq3XHl09DfgUpLpcFJsv8bWkNAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469193;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eH6UgdbRC4ievYK3CDGA8FvcsT7J3AAFgSAyupKWwdQ=;
	b=K+3Ycz04hqylsm6DHi5fQWeB0d5VEShLdfgFDLaIyDGwESxLfi2sNH0903/yVNHHp3aS
	 f1gyBJ1KkoPpZoBcMJi8g1N/DRPHvJXLASPrqDSwWtLC+Ou4GWF8c/6lW7caH13ZeWZIu
	 uSEKNWvLqWInb6Se5l6I7G23TdI6aK+4YBvi9qXRbZw+e/Vhjfucnj94qF/oZs7JNZSlm
	 hSwp7M904oo5i4ZKFopUqz68Fwhyrym/axqVB/kisSc6J3tbb6zyBuy40W1SDcvLDR6OS
	 hAsRRuCWUNfZ9ercb3Re7a9yhIWUJPSHEaGJUYpAO6PulxGJnPydFyfvBZ4eTILppyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RYFLPbJu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A052D606A689
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RYFLPbJu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D581F01566;
	Mon, 23 Nov 2026 21:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469193;
	bh=eH6UgdbRC4ievYK3CDGA8FvcsT7J3AAFgSAyupKWwdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RYFLPbJuH9uS96aZVrzDMj5eU4/etaryCBfA7I5nln6CTJhjtgNu626AEDkA/Wnv3
	 EJdA7dWFAWki2JNGl1Fp/lEWArYNb7UYd8pZ/6ELLh4CLQlodI78Js8925IAMxMFqz
	 pDEEK36JMR7X4G4NrF6+qMMOCV/LWkRPtdmcZTkxQ/HvfULU4evbKy0VaHvsaC9n+s
	 4vz36kp0hsAVEOXsAaFfaIF60hh7rKoR3VfcXU9s4YjlDLiwo8wlauVXISr0YswiXE
	 ob4OxGoAYTG8JPNQal686l+4AS+7e8N5hbogyPob2g657AKOWPBVy1yIofP0J8FSbJ
	 IBDk0S7JQ9IZQ==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 7/7] ipv6: stamp dsts with the generation sampled before the FIB lookup
Date: Mon, 23 Nov 2026 14:26:09 -0700
Message-ID: <20261123212623.106153-8-dsahern@kernel.org>
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
instead of the current generation. Dsts allocated without a lookup
result keep the stamp taken in ip6_dst_alloc().

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- New patch.

 include/net/ip6_fib.h       |  5 +++++
 include/net/net_namespace.h | 10 ++++++++++
 net/ipv6/route.c            | 12 ++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index 92fed30a7418..a11c4a556b5d 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -225,6 +225,11 @@ struct fib6_result {
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
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 38d5f3bc85bb..deedb5fb62ca 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1210,6 +1210,12 @@ static void ip6_rt_copy_init(struct rt6_info *rt, const struct fib6_result *res)
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
@@ -1294,6 +1300,7 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 	struct rt6_info *rt;
 
 	rcu_read_lock();
+	res.sernum = rt_genid_ipv6_sample(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 restart:
 	res.f6i = rcu_dereference(fn->leaf);
@@ -2277,6 +2284,7 @@ int fib6_table_lookup(struct net *net, struct fib6_table *table, int oif,
 {
 	struct fib6_node *fn, *saved_fn;
 
+	res->sernum = rt_genid_ipv6_sample(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 	saved_fn = fn;
 
@@ -2987,6 +2995,8 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 
 		res.fib6_flags = res.f6i->fib6_flags;
 		res.fib6_type = res.f6i->fib6_type;
+		/* derived from @rt6: it is only as current as that dst */
+		res.sernum = READ_ONCE(rt6->sernum);
 
 		if (res.f6i->nh) {
 			struct fib6_nh_match_arg arg = {
@@ -3166,6 +3176,7 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *__ip6_route_redirect(struct net *net,
 	 */
 
 	rcu_read_lock();
+	res.sernum = rt_genid_ipv6_sample(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 restart:
 	for_each_fib6_node_rt_rcu(fn) {
@@ -4383,6 +4394,7 @@ static void rt6_do_redirect(struct dst_entry *dst, struct sock *sk, struct sk_bu
 
 	res.fib6_flags = res.f6i->fib6_flags;
 	res.fib6_type = res.f6i->fib6_type;
+	res.sernum = READ_ONCE(rt->sernum);
 	nrt = ip6_rt_cache_alloc(&res, &msg->dest, NULL);
 	if (!nrt)
 		goto out;
-- 
2.43.0

