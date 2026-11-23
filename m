Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469192;
	b=qMJ4i3lwr2xVJTF+raL1UQGOulGYT8CCC1a/FqaJ/Jc9jdtZ3BlMWhD3wR/J4KqZcjWT
	 dpVOfYVA6jIDhM2M9X4VCfAw1l6vuxS5wNw9tmGHgArGP87zKlnSRH8eBSCQo+jaZ51fU
	 590mvuROXxHT7j0Pi0rEb7FHniT0E35SNxxK3H1EhxLGDuYUtrQeSJQyCtrgtbVDtLkMK
	 xVR83bxaO7kPIo6RBXZbjm4SlvLCWJLGw+u8Fb9zPwkGPmIvwIsjGiERr8yNCP4Q07UQu
	 1GWucMHVB+5rx9RIaNx6A0oPocpGYElxzJsNSI0WMFVjW6fZDMVBNY5lhFEkwlTz/lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469192;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DPe8sGGCdGPvCKGe5lwr97QVEUM6TDbF4ggH12EU7+E=;
	b=0lNDzRlfwjAZXqPI7rpXu27QkBdXyPBS5V2NOaMgIOKGUr+my3uthVvXlsz5wDCfNFlr
	 qGWNCp0eQQ3bFoEjvgB689ptUOY3LXnRO00DaByH+RKl/RhBGBqa+8UgtpUei24pnU0zO
	 lYXPlfGKYxksAH3YGnb9xuWw0H2ulyn3ba4cEdLVS8CNm0HcMO6JUAGqMRMv6mpEwd4lL
	 vJbFsozrZB+GgO8YY1x5XKENjLX+HmBJvDrHRH+l9Ml6i/p2To7EILyL6uoxc/tZI7QGf
	 bxgT9Zd9ZGNpvBVQo/8behL6Mw5FwmZussY9HyAVkgBkKey/ix4D6vWhhmQE7xu8uaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsXMtOt0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF44606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsXMtOt0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0861F000F0;
	Mon, 23 Nov 2026 21:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469192;
	bh=DPe8sGGCdGPvCKGe5lwr97QVEUM6TDbF4ggH12EU7+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HsXMtOt0uN/HypjeFPioAb/50LIeMrpKRQ/wNpGiT3pJDm30Fc655vNZo4dzqhyXI
	 syZ2B4Emp8/oYGyjih6u3R2ygobMiNfi/cRheOZb+YCBPZtDXEO2uu6O5YJ7iwN2/D
	 odTWj81Ks4hG5tgJSn3wZJHJm9yEFf0fT8fuNQobPhR9viLowhWp5kalZxXqgZbS+a
	 XEjucRCIo3eo3bsHmCDluicfO5jkLbYHwxXUynI3nyikExn8AS6OiTcISy8vylTDDF
	 PC/VaQs0S104m+jK7P7h8FmqHdJWNVgAs07oRrdh0lkpEqo7eNCJzw/3Dx8HGkD8H8
	 CUpSMU7aZzkIA==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 6/7] ipv6: make rt_genid_bump_ipv6() a plain counter increment
Date: Mon, 23 Nov 2026 14:26:08 -0700
Message-ID: <20261123212623.106153-7-dsahern@kernel.org>
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

rt_genid_bump_ipv6() called fib6_flush_trees() through a function
pointer. That walked every node of every table to write a new
fn_sernum, so that cookies derived from fn_sernum would mismatch.

Cached dsts are now validated against net->ipv6.fib6_sernum itself,
so the walk no longer invalidates anything. Do what
rt_genid_bump_ipv4() does and increment the counter, keeping
fib6_new_sernum()'s wrap to 1 so the value is never 0.

This makes nexthop, address and FIB rule changes cheap, and stops
them from touching fn_sernum, which route dumps use to detect that a
tree changed: a dump is no longer restarted by events that do not
change the tree.

With the walk gone, drop the __fib6_flush_trees pointer and its
export, fib6_new_sernum() in favour of the new helper, and the sernum
handling in fib6_cleaner that only the walk used.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- None.

 include/net/net_namespace.h | 26 ++++++++++++++-----
 net/ipv6/addrconf_core.c    |  7 -----
 net/ipv6/ip6_fib.c          | 51 ++++++-------------------------------
 3 files changed, 27 insertions(+), 57 deletions(-)

diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 4a4d72080acd..f39baf51bcc5 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -556,18 +556,30 @@ static inline int rt_genid_ipv6(const struct net *net)
 {
 	return atomic_read(&net->ipv6.fib6_sernum);
 }
-#endif
 
-static inline void rt_genid_bump_ipv4(struct net *net)
+/* Invalidate every cached IPv6 dst in @net. Returns the new generation,
+ * which is never 0.
+ */
+static inline int rt_genid_bump_ipv6(struct net *net)
 {
-	atomic_inc(&net->ipv4.rt_genid);
+	int new, old = atomic_read(&net->ipv6.fib6_sernum);
+
+	do {
+		new = old < INT_MAX ? old + 1 : 1;
+	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
+
+	return new;
 }
+#else
+static inline int rt_genid_bump_ipv6(struct net *net)
+{
+	return 0;
+}
+#endif
 
-extern void (*__fib6_flush_trees)(struct net *net);
-static inline void rt_genid_bump_ipv6(struct net *net)
+static inline void rt_genid_bump_ipv4(struct net *net)
 {
-	if (__fib6_flush_trees)
-		__fib6_flush_trees(net);
+	atomic_inc(&net->ipv4.rt_genid);
 }
 
 #if IS_ENABLED(CONFIG_IEEE802154_6LOWPAN)
diff --git a/net/ipv6/addrconf_core.c b/net/ipv6/addrconf_core.c
index 29095c90aa16..e7ee5f98327d 100644
--- a/net/ipv6/addrconf_core.c
+++ b/net/ipv6/addrconf_core.c
@@ -9,13 +9,6 @@
 #include <net/addrconf.h>
 #include <net/ip.h>
 
-/* if ipv6 module registers this function is used by xfrm to force all
- * sockets to relookup their nodes - this is fairly expensive, be
- * careful
- */
-void (*__fib6_flush_trees)(struct net *);
-EXPORT_SYMBOL(__fib6_flush_trees);
-
 #define IPV6_ADDR_SCOPE_TYPE(scope)	((scope) << 16)
 
 static inline unsigned int ipv6_addr_scope2type(unsigned int scope)
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 266370e15774..75512fbcb945 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -43,7 +43,6 @@ struct fib6_cleaner {
 	struct fib6_walker w;
 	struct net *net;
 	int (*func)(struct fib6_info *, void *arg);
-	int sernum;
 	void *arg;
 	bool skip_notify;
 };
@@ -123,21 +122,6 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)
 	fib6_walkers_replace_leaf(net, rt, next);
 }
 
-static int fib6_new_sernum(struct net *net)
-{
-	int new, old = atomic_read(&net->ipv6.fib6_sernum);
-
-	do {
-		new = old < INT_MAX ? old + 1 : 1;
-	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
-
-	return new;
-}
-
-enum {
-	FIB6_NO_SERNUM_CHANGE = 0,
-};
-
 void fib6_update_sernum(struct net *net, struct fib6_info *f6i)
 {
 	struct fib6_node *fn;
@@ -145,7 +129,7 @@ void fib6_update_sernum(struct net *net, struct fib6_info *f6i)
 	fn = rcu_dereference_protected(f6i->fib6_node,
 			lockdep_is_held(&f6i->fib6_table->tb6_lock));
 	if (fn)
-		WRITE_ONCE(fn->fn_sernum, fib6_new_sernum(net));
+		WRITE_ONCE(fn->fn_sernum, rt_genid_bump_ipv6(net));
 }
 
 /* Tell route dumps that an exception was added under @f6i without
@@ -1464,7 +1448,7 @@ static void __fib6_update_sernum_upto_root(struct fib6_info *rt,
 
 void fib6_update_sernum_upto_root(struct net *net, struct fib6_info *rt)
 {
-	__fib6_update_sernum_upto_root(rt, fib6_new_sernum(net));
+	__fib6_update_sernum_upto_root(rt, rt_genid_bump_ipv6(net));
 }
 
 /*
@@ -1595,7 +1579,7 @@ int fib6_add(struct fib6_node *root, struct fib6_info *rt,
 			fib6_info_release(iter);
 		}
 
-		__fib6_update_sernum_upto_root(rt, fib6_new_sernum(info->nl_net));
+		__fib6_update_sernum_upto_root(rt, rt_genid_bump_ipv6(info->nl_net));
 
 		if (rt->fib6_flags & RTF_EXPIRES)
 			fib6_add_gc_list(rt);
@@ -2282,16 +2266,6 @@ static int fib6_clean_node(struct fib6_walker *w)
 		.skip_notify = c->skip_notify,
 	};
 
-	if (c->sernum != FIB6_NO_SERNUM_CHANGE &&
-	    READ_ONCE(w->node->fn_sernum) != c->sernum)
-		WRITE_ONCE(w->node->fn_sernum, c->sernum);
-
-	if (!c->func) {
-		WARN_ON_ONCE(c->sernum == FIB6_NO_SERNUM_CHANGE);
-		w->leaf = NULL;
-		return 0;
-	}
-
 	for_each_fib6_walker_rt(w) {
 		res = c->func(rt, c->arg);
 		if (res == -1) {
@@ -2331,7 +2305,7 @@ static int fib6_clean_node(struct fib6_walker *w)
 
 static void fib6_clean_tree(struct net *net, struct fib6_node *root,
 			    int (*func)(struct fib6_info *, void *arg),
-			    int sernum, void *arg, bool skip_notify)
+			    void *arg, bool skip_notify)
 {
 	struct fib6_cleaner c;
 
@@ -2341,7 +2315,6 @@ static void fib6_clean_tree(struct net *net, struct fib6_node *root,
 	c.w.skip = 0;
 	c.w.skip_in_node = 0;
 	c.func = func;
-	c.sernum = sernum;
 	c.arg = arg;
 	c.net = net;
 	c.skip_notify = skip_notify;
@@ -2351,7 +2324,7 @@ static void fib6_clean_tree(struct net *net, struct fib6_node *root,
 
 static void __fib6_clean_all(struct net *net,
 			     int (*func)(struct fib6_info *, void *),
-			     int sernum, void *arg, bool skip_notify)
+			     void *arg, bool skip_notify)
 {
 	struct fib6_table *table;
 	struct hlist_head *head;
@@ -2363,7 +2336,7 @@ static void __fib6_clean_all(struct net *net,
 		hlist_for_each_entry_rcu(table, head, tb6_hlist) {
 			spin_lock_bh(&table->tb6_lock);
 			fib6_clean_tree(net, &table->tb6_root,
-					func, sernum, arg, skip_notify);
+					func, arg, skip_notify);
 			spin_unlock_bh(&table->tb6_lock);
 		}
 	}
@@ -2373,21 +2346,14 @@ static void __fib6_clean_all(struct net *net,
 void fib6_clean_all(struct net *net, int (*func)(struct fib6_info *, void *),
 		    void *arg)
 {
-	__fib6_clean_all(net, func, FIB6_NO_SERNUM_CHANGE, arg, false);
+	__fib6_clean_all(net, func, arg, false);
 }
 
 void fib6_clean_all_skip_notify(struct net *net,
 				int (*func)(struct fib6_info *, void *),
 				void *arg)
 {
-	__fib6_clean_all(net, func, FIB6_NO_SERNUM_CHANGE, arg, true);
-}
-
-static void fib6_flush_trees(struct net *net)
-{
-	int new_sernum = fib6_new_sernum(net);
-
-	__fib6_clean_all(net, NULL, new_sernum, NULL, false);
+	__fib6_clean_all(net, func, arg, true);
 }
 
 /*
@@ -2624,7 +2590,6 @@ int __init fib6_init(void)
 	if (ret)
 		goto out_unregister_subsys;
 
-	__fib6_flush_trees = fib6_flush_trees;
 out:
 	return ret;
 
-- 
2.43.0

