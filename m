Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656832;
	b=Yzxbiw6fKYCY9dafB5/1quOV9XrTioRpR89P/yW8ATCQyScGaqCLFC9Gcvj5vFuTrZiN
	 +6Ubzxz4qnsfmW58y6+os4xMhS/JpQm1S1j5ZeVPGt/JacFwCOQHWf0mdFUSVHWTvYlbg
	 GaJl/k2Cib33JuhpNBJ0W/rqtkxRqxNLo2ljcogS9IHRGcBPHCZ0GksGoqog83cqYdLa8
	 z3LpgGaCdkYq73d0hhQEFkn3t2BxfwDBeREZzqatWeSPKGFQP9GGKqiX/Nj+MdfBSbTRw
	 xEotvwigTKedtn4LDYOhBF3roTcljAuVp+0hHWTKU9uu5mGicGMbeOxkPSVN0YfBphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656832;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=msMVlh+BamApOTe+qrKK1F7EAQWsl25GaQUNFWUEDxY=;
	b=XMS0wtm0NhXSBfBYqPGp6krrXRO9pU33wUUb3vYu68/6UCAD2+0JtnCr7XlTIC4iUOD7
	 I1ISgOVO/skJ4xGCpdSUxacdjQMe4RUGdp1nLm9O0LEun+hcXWRzXzPDWSV/SKH5uvZgI
	 SCyaSO0hGXmx7F11lPYZCJvCG/G6pnmiKIje31cNFo9QCFIluX8dliDthOdNw1eiY1b+O
	 weOD/gYQdPMK4rIVWiqYc81rCsDpjIZDc1mj30xL+fI3NYUt+e3+Fy4MGbKABGiuo+/Y8
	 zIioqK3MCHXDAV+yWzMYG9rgZmDnKC59OrTFLrWKbNBPFHF0NNSMy9VYXlMWNGEddmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8K7bNWV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A74606A337
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8K7bNWV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E82E1F000D3;
	Thu, 26 Nov 2026 01:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656831;
	bh=msMVlh+BamApOTe+qrKK1F7EAQWsl25GaQUNFWUEDxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c8K7bNWVJKCr5yGa8wJSazRMsMzR6VJI+BkgUUlYODeNGLeSv/DYOrCGCAEES/lXx
	 3gGo3RGiR7RweDL3ibv3mQz2G/Hpyja7OWNixFyF2KvZr17UI9DnenY8l7jDvdZaY1
	 z1yOCyFagsgckD0buU0DZPSRZoKxzelsQOB5aFhz1qoDgE09pCORFr2bTWdCKsIjWh
	 KnYqHlinHH5cnopI4IvWq02WUUf1yp+n4F4p5MZuwZsLwaSXQJkVi1wDxTGp04TsqX
	 q71gw0zK/ZzirBxPhiWwrvBidPPq2NoBSk+siLIxck6bEK9v/CXVqM+46Q3vviGlUy
	 jdW/XpEQaJ7wQ==
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
Subject: [PATCH net-next v2 06/13] ipv6: validate dsts against the netns route generation
Date: Wed, 25 Nov 2026 18:33:32 -0700
Message-ID: <52846eb18319fc2841ffa6dbb32abcc898eca8df.1795642432.git.dahern@nvidia.com>
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

This covers every holder. Every IPv6 route dst is allocated with
DST_OBSOLETE_FORCE_CHK and stamped at allocation, and holders that
cache a dst (sockets, early demux, dst_cache users, xfrm bundles, SCTP,
IPVS, nf_flowtable) revalidate it through ip6_dst_check(), whose first
test is the generation. The comparison uses the dst's own stamp, not
the cookie the holder captured, so a cookie captured late cannot make
a stale dst look current.

Validity lives in the dst, so a long-lived dst is never re-stamped by
a later lookup: pcpu and exception dsts are shared by every socket and
dst_cache that holds them, and re-stamping would make a stale dst valid
again for all of them. IPv4 does the same: a stale cached route fails
rt_cache_valid() and a new one is allocated, while holders of the old
one keep seeing it as stale. Likewise here:

 - a pcpu dst that fails the check is dropped from the pcpu slot and
   rebuilt by rt6_make_pcpu_route().
 - an exception dst that fails the check is not handed to users as
   their dst. The lookup paths that do that then replace it with a
   current copy that keeps the learned MTU, expiry, redirect gateway
   and flags, so that a FIB change in the netns does not discard every
   learned PMTU and redirect. The copy is stamped like any other dst
   built from the lookup. Callers that only read an exception, not
   hand it out as a dst, still find it whatever its generation: the MTU
   of a FIB lookup in ip6_mtu_from_fib6(), which bpf_fib_lookup() uses
   and which never goes through a dst lookup that would refresh it,
   deleting an exception, and matching a redirect gateway. Hiding it
   from them would make a learned PMTU or redirect disappear from those
   until some packet to that destination refreshed it.
   With source-prefix routes an exception can be keyed by the flow's
   own source address or by the route's source prefix. The exact one is
   found first, and a stale exact one is refreshed in preference to a
   current one under the prefix key, as the exact one would be returned
   if nothing were stale.

   The stale exception is found without rt6_exception_lock, so the
   replacement only goes ahead if it is still the exception for that
   destination once the lock is held, and the state is copied under the
   lock. If another CPU has installed a newer exception, or the
   exception was removed on purpose (aged out, link failure, route
   delete), the copy is dropped and the lookup uses whatever is there
   now: a replacement from an older snapshot must not overwrite the
   newer exception or bring back a deleted one. If the replacement
   cannot be made for lack of memory the stale exception stays, and the
   lookup misses; the next one tries again.

   The replacement is swapped in with hlist_replace_rcu(), not unlinked
   and re-added: nothing invalidates pcpu dsts for a refresh, so a
   lockless lookup that ran in a gap between the two would miss the
   exception and build a pcpu dst that ignores it. The swap also keeps
   the entry's place in its chain, which route dumps count, and the
   bucket depth. A new dst shares the read-only metrics of its route and
   writable ones are allocated on first use, with dst_metric_set()
   silently doing nothing if that fails. The copy gets writable
   metrics up front, so that failing to is treated like any other
   allocation failure instead of replacing the exception with a copy
   that lost its PMTU, and a later merge into it does not have to
   allocate. A stale exception whose MTU is no longer below the route's is
   dropped rather than failing every refresh, unless it is a redirect:
   its PMTU may have been lowered in place and then caught up with by a
   device MTU change, and the gateway is still worth keeping, so only
   the PMTU is forgotten and the copy carries the route's own MTU, as a
   new redirect exception does. The old exception is put
   on the uncached list, not dst_dev_put(): its holders keep a working
   dst until they notice it is stale, and device unregister detaches it.

   If the replacement cannot be made for lack of memory, the lookup
   returns some other dst: a pcpu dst or a clone stamped with the
   current generation, which would bypass the stale exception until the
   next PMTU update, since nothing invalidates pcpu dsts for a refresh.
   The lookup marks the dst it returns stale in that case, so its users
   look the route up, and try the replacement, again.

   An in-place PMTU update of a held exception does not take
   rt6_exception_lock, so it can land on the old dst while a
   replacement is being made, or after it. The identity check cannot
   see that. __ip6_rt_update_pmtu() already follows such an update with
   an update of the exception's stamp, which stays lockless, as before,
   while the updated dst is still the exception in the table, the
   common case. When it is not, that step now takes the lock and merges
   the update into the exception currently in the table (smaller PMTU
   wins, earlier expiry wins, as for an in-place update), so the lock
   orders it against any replacement in progress. A replacement that
   swaps in its copy while the update sees the old dst in the table is
   caught by a barrier pairing: the updater does smp_mb() between the
   update and its lookup, the replacement does smp_mb() after the swap
   and merges into the copy whatever changed on the old dst since it was
   copied. Either the updater finds the copy or the replacement sees the
   update, so the lower PMTU is not lost. Neither path orders the merge
   against a handler updating the current exception in place. Both only
   ever lower the MTU, the merge and rt6_do_update_pmtu(), with the same
   compare and exchange (rt6_lower_mtu()), and the merge lowers the
   expiry the same way: a smaller value stored by one is kept whichever
   order they run in.
   The device MTU change path, which runs under the lock and can also
   raise an exception's PMTU, is not covered by that.

Creating a PMTU or redirect exception must not invalidate every dst
in the namespace, which bumping the netns generation would do: a burst
of packet-too-big messages would make all sockets and dst_caches look
their routes up again. IPv4 limits this to the nexthop:
update_or_create_fnhe() marks only that nexthop's cached dsts stale.
Do the same here. rt6_insert_exception() marks the sernum of the
fib6_nh's pcpu dsts stale, with rt6_dst_invalidate() as
ip6_link_failure() does, instead of calling fib6_update_sernum(), so
their users look the route up once and find the exception. The top
bit, not zero, means the low bits still say which generation the dst
was built under, so that state derived from it can be stamped with that
instead of the generation current at allocation.

That only reaches pcpu slots that are already populated, and the
lookup checks the exception table before it builds a pcpu dst. A
lookup that missed the exception can install its pcpu dst after the
writer scanned the slots, and that dst, stamped with the still-current
generation, would ignore the exception until the next PMTU update. Close
this the way the fib6_destroying handshake in fib6_purge_rt() does: the
writer issues smp_mb() between publishing the exception and reading the
slots, and ip6_pol_route() looks the exception up again for its own
flow after the fully ordered cmpxchg() that installs the pcpu dst.
Whichever side runs second sees the other. The re-check runs only when
a pcpu dst has to be built.

The pcpu invalidation does not reach the RTF_CACHE clone that
ip6_pol_route() makes for FLOWI_FLAG_KNOWN_NH: it is not in rt6i_pcpu and
holders such as the IPVS dest->dst_cache keep it. ip6_dst_check() therefore
also fails an uncached RTF_CACHE dst when its nexthop has an exception for
the dst's destination, so that its holders look the route up and find the
learned PMTU.

Visiting every possible CPU on each exception insert would make a
burst of packet-too-big messages cost the possible CPU count each, on
large systems. Each fib6_nh therefore keeps a cpumask of the CPUs that
installed a pcpu dst since the last invalidation: rt6_make_pcpu_route()
sets its CPU's bit after the install, and the invalidation visits,
tests and clears only those. The per-CPU dst accesses and
invalidations of an insert follow the dsts created rather than the
number of possible CPUs, and a burst of exceptions invalidates each
dst once. Finding the set bits still scans the whole mask, nr_cpu_ids
bits, on every insert that does not replace an exception, which is a
few words even on large systems. The mask is allocated and freed
with the pcpu array, and the handshake above covers it: the installer
orders its mark before the re-check, the writer orders the publish
before reading the mask.

An exception insert no longer changes any fn_sernum, so route dumps
depend on tb6_excp_seq alone for exceptions on the root node, as the
dump patch before this one arranged.

The smp_wmb() in __fib6_update_sernum_upto_root() paired with the
smp_rmb() in fib6_get_cookie_safe(), so that a lockless reader that saw
a new fn_sernum also saw the route inserted before it. That reader is
gone. The remaining fn_sernum readers, the route dumps, take tb6_lock
after reading it and the writers hold it, so drop the barrier.

Reported-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: David Ahern <dahern@nvidia.com>
---
 include/net/ip6_fib.h |  51 +---
 net/ipv6/ip6_fib.c    |  14 +-
 net/ipv6/route.c      | 600 ++++++++++++++++++++++++++++++++++++++----
 3 files changed, 559 insertions(+), 106 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index af2a17945011..ef5138ae7075 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -9,6 +9,7 @@
 #ifndef _IP6_FIB_H
 #define _IP6_FIB_H
 
+#include <linux/cpumask.h>
 #include <linux/ipv6_route.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
@@ -152,6 +153,11 @@ struct fib6_nh {
 #endif
 
 	struct rt6_info * __percpu *rt6i_pcpu;
+	/* CPUs that installed a dst in rt6i_pcpu since the last time an
+	 * exception insert invalidated them, so that it does not have to
+	 * look at every possible CPU.
+	 */
+	cpumask_var_t		rt6i_pcpu_dirty;
 	struct rt6_exception_bucket __rcu *rt6i_exception_bucket;
 };
 
@@ -273,51 +279,12 @@ static inline bool fib6_check_expired(const struct fib6_info *f6i)
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
-	int sernum;
-
-	/* Can be stale-marked concurrently (rt6_dst_invalidate()): test and
-	 * return one sample.
+	/* sernum is the netns route generation the dst was created under;
+	 * ip6_dst_check() compares it to the current one.
 	 */
-	sernum = READ_ONCE(rt->sernum);
-	if (sernum)
-		return sernum;
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
+	return READ_ONCE(rt->sernum);
 }
 
 /* An invalidated dst keeps the generation it was built under in the low
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index 4da83c22bbde..266370e15774 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -148,12 +148,12 @@ void fib6_update_sernum(struct net *net, struct fib6_info *f6i)
 		WRITE_ONCE(fn->fn_sernum, fib6_new_sernum(net));
 }
 
-/* Tell route dumps that an exception was added under @f6i. A dump notices
- * a changed tree through the root node, so only an exception on the root
- * needs to be visible. Use a table sequence for that, rather than a fresh
- * fn_sernum, so that it does not depend on what else a change to fn_sernum
- * does: fresh values can only come from the netns counter, and a made-up
- * one could later be issued by the counter to the same node.
+/* Tell route dumps that an exception was added under @f6i without
+ * invalidating cached dsts: those follow the netns generation, which this
+ * leaves alone. A dump notices a changed tree through the root node, so
+ * only an exception on the root needs to be visible. Fresh fn_sernum values
+ * can only come from the netns counter, so use a table sequence rather than
+ * a made-up fn_sernum that the counter could later issue again.
  * Caller holds tb6_lock.
  */
 void fib6_update_excp_seq(struct fib6_info *f6i)
@@ -1455,8 +1455,6 @@ static void __fib6_update_sernum_upto_root(struct fib6_info *rt,
 	struct fib6_node *fn = rcu_dereference_protected(rt->fib6_node,
 				lockdep_is_held(&rt->fib6_table->tb6_lock));
 
-	/* paired with smp_rmb() in fib6_get_cookie_safe() */
-	smp_wmb();
 	while (fn) {
 		WRITE_ONCE(fn->fn_sernum, sernum);
 		fn = rcu_dereference_protected(fn->parent,
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 823ed595d4b6..86351769ee2b 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -115,6 +115,10 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
 static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 					   const struct in6_addr *daddr,
 					   const struct in6_addr *saddr);
+static struct rt6_info *
+rt6_find_cached_rt_refresh(const struct fib6_result *res,
+			   const struct in6_addr *daddr,
+			   const struct in6_addr *saddr, bool *retry);
 
 #ifdef CONFIG_IPV6_ROUTE_INFO
 static struct fib6_info *rt6_add_route_info(struct net *net,
@@ -367,6 +371,7 @@ struct rt6_info *ip6_dst_alloc(struct net *net, struct net_device *dev,
 
 	if (rt) {
 		rt6_info_init(rt);
+		rt->sernum = rt_genid_ipv6(net);
 		atomic_inc(&net->ipv6.rt6_stats->fib_rt_alloc);
 	}
 
@@ -1291,6 +1296,7 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 	struct fib6_result res = {};
 	struct fib6_node *fn;
 	struct rt6_info *rt;
+	bool retry = false;
 
 	rcu_read_lock();
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
@@ -1318,13 +1324,17 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 			 fl6->flowi6_oif != 0, skb, flags);
 
 	/* Search through exception table */
-	rt = rt6_find_cached_rt(&res, &fl6->daddr, &fl6->saddr);
+	rt = rt6_find_cached_rt_refresh(&res, &fl6->daddr, &fl6->saddr,
+					&retry);
 	if (rt) {
 		if (ip6_hold_safe(net, &rt))
 			dst_use_noref(&rt->dst, jiffies);
 	} else {
 do_create:
 		rt = ip6_create_rt_rcu(&res);
+		/* see rt6_find_cached_rt_refresh() */
+		if (retry && rt != net->ipv6.ip6_null_entry)
+			rt6_dst_invalidate(rt);
 	}
 
 out:
@@ -1458,9 +1468,6 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
 	ip6_rt_copy_init(pcpu_rt, res);
 	pcpu_rt->rt6i_flags |= RTF_PCPU;
 
-	if (f6i->nh)
-		pcpu_rt->sernum = rt_genid_ipv6(dev_net(dev));
-
 	return pcpu_rt;
 }
 
@@ -1476,7 +1483,11 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
 
 	pcpu_rt = this_cpu_read(*res->nh->rt6i_pcpu);
 
-	if (pcpu_rt && READ_ONCE(pcpu_rt->sernum) && !rt6_is_valid(pcpu_rt)) {
+	/* A dst stamped with an older genid stays stale for everyone still
+	 * holding it, as in IPv4. Never re-stamp it; drop it and build a
+	 * new one.
+	 */
+	if (pcpu_rt && !rt6_is_valid(pcpu_rt)) {
 		struct rt6_info *prev, **p;
 
 		p = this_cpu_ptr(res->nh->rt6i_pcpu);
@@ -1523,6 +1534,13 @@ static struct rt6_info *rt6_make_pcpu_route(struct net *net,
 		return prev;
 	}
 
+	/* Tell fib6_nh_invalidate_pcpu() there is a dst to invalidate on this
+	 * CPU. The cmpxchg() above orders the install before the mark.
+	 */
+	cpumask_set_cpu(smp_processor_id(), res->nh->rt6i_pcpu_dirty);
+	/* Order the mark before the exception re-check in ip6_pol_route() */
+	smp_mb__after_atomic();
+
 	if (res->f6i->fib6_destroying) {
 		struct fib6_info *from;
 
@@ -1749,18 +1767,163 @@ struct rt6_exception_bucket *fib6_nh_get_excptn_bucket(const struct fib6_nh *nh,
 	return bucket;
 }
 
-static int rt6_insert_exception(struct rt6_info *nrt,
-				const struct fib6_result *res)
+/* A new exception may apply to dsts already cached on @nh. Make them fail
+ * ip6_dst_check() once so their users look the route up again and find it;
+ * dsts of other routes are left alone.
+ */
+static void fib6_nh_invalidate_pcpu(struct fib6_nh *nh)
+{
+	int cpu;
+
+	if (!nh->rt6i_pcpu)
+		return;
+
+	/* The exception was published before this call. Pairs with the
+	 * cmpxchg() and the cpumask update in rt6_make_pcpu_route(): either
+	 * we see the CPU of a pcpu dst installed by a lookup that missed the
+	 * exception, or that lookup's re-check in ip6_pol_route() sees the
+	 * exception.
+	 *
+	 * Only CPUs that installed a dst since the last invalidation are
+	 * visited, so the dst accesses and invalidations follow the dsts
+	 * created, not the number of possible CPUs. Finding the set bits
+	 * still scans the whole mask, nr_cpu_ids bits, on every call. A burst
+	 * of exceptions invalidates each dst once.
+	 */
+	smp_mb();
+
+	rcu_read_lock();
+	for_each_cpu(cpu, nh->rt6i_pcpu_dirty) {
+		struct rt6_info *pcpu_rt;
+
+		if (!cpumask_test_and_clear_cpu(cpu, nh->rt6i_pcpu_dirty))
+			continue;
+
+		pcpu_rt = READ_ONCE(*per_cpu_ptr(nh->rt6i_pcpu, cpu));
+		if (pcpu_rt)
+			rt6_dst_invalidate(pcpu_rt);
+	}
+	rcu_read_unlock();
+}
+
+/* Carry a PMTU or expiry learned in place on @rt over to @cur. Caller holds
+ * rt6_exception_lock.
+ *
+ * That lock does not keep @cur from being updated in place at the same time:
+ * a PMTU handler that holds @cur as its dst writes the metric and the expiry
+ * without it. Both only ever lower them, with a compare and exchange (see
+ * rt6_lower_mtu()), so that neither overwrites what the other stored with a
+ * value that is not lower, in whichever order they run.
+ */
+static void rt6_exception_merge(struct rt6_info *cur, const struct rt6_info *rt)
+{
+	u32 mtu = dst_metric_raw(&rt->dst, RTAX_MTU);
+
+	/* @cur has writable metrics if it was made by a refresh or by a PMTU
+	 * update. A redirect exception that was neither may not, and then
+	 * there is nothing to do if allocating them fails: the update still
+	 * applies to the dst that got it, and the next packet too big that
+	 * exceeds the larger MTU of @cur updates it.
+	 */
+	if (mtu)
+		rt6_lower_mtu(cur, mtu);
+
+	/* As dst_set_expires() does, never extend an expiry */
+	if (rt->rt6i_flags & RTF_EXPIRES) {
+		unsigned long expires = READ_ONCE(rt->dst.expires);
+		unsigned long old = READ_ONCE(cur->dst.expires);
+
+		do {
+			if (old && !time_before(expires, old))
+				break;
+		} while (!try_cmpxchg(&cur->dst.expires, &old, expires));
+
+		cur->rt6i_flags |= RTF_EXPIRES;
+	}
+	cur->rt6i_flags |= rt->rt6i_flags & RTF_MODIFIED;
+}
+
+/* Copy what an exception has learned from @old into its replacement @nrt.
+ * Caller holds rt6_exception_lock, so @old is not replaced or removed under
+ * us.
+ */
+static int rt6_exception_copy_state(struct rt6_info *nrt,
+				    const struct rt6_info *old)
+{
+	u32 *metrics;
+
+	/* Take the flags as they are, not just what was learned on top of the
+	 * route's: a redirect exception, for one, does not carry the route's
+	 * flags at all (see rt6_do_redirect()). The copy then looks exactly
+	 * like the exception that lookups through this nexthop returned
+	 * before it went stale.
+	 */
+	nrt->rt6i_flags = old->rt6i_flags;
+	nrt->rt6i_gateway = old->rt6i_gateway;
+
+	/* A new dst shares the metrics of its route, which are read-only;
+	 * writable ones are allocated when first needed, and the caller of
+	 * dst_metric_set() is not told if that fails. Allocate them here, even
+	 * if what is learned is just the route's own value, so that failing
+	 * to is seen before the exception is replaced, rather than as a PMTU
+	 * that is silently lost, and so that a later in-place update or merge
+	 * into this exception does not have to allocate. The caller did so
+	 * before it took the lock, so this finds them in place.
+	 */
+	metrics = dst_metrics_write_ptr(&nrt->dst);
+	if (!metrics)
+		return -ENOMEM;
+	metrics[RTAX_MTU - 1] = dst_metric_raw(&old->dst, RTAX_MTU);
+
+	if (old->rt6i_flags & RTF_EXPIRES)
+		WRITE_ONCE(nrt->dst.expires, READ_ONCE(old->dst.expires));
+
+	return 0;
+}
+
+/* @old: @nrt replaces this stale exception, which it is a copy of. Nothing
+ * new applies to dsts cached on the nexthop, so they are not invalidated.
+ *
+ * @old was found without the lock. If it is no longer the exception for this
+ * destination, a newer one was installed or it was removed on purpose (aged
+ * out, link failure, route delete); either way the copy is out of date, so
+ * return -EEXIST instead of overwriting or resurrecting it. The state is
+ * copied here, under the lock, so the copy is current at the moment of
+ * replacement.
+ */
+static int __rt6_insert_exception(struct rt6_info *nrt,
+				  const struct fib6_result *res,
+				  struct rt6_info *old)
 {
 	struct net *net = dev_net(nrt->dst.dev);
 	struct rt6_exception_bucket *bucket;
 	struct fib6_info *f6i = res->f6i;
+	struct rt6_exception_bucket *old_bucket = NULL;
 	struct rt6_exception *rt6_ex, *new_ex;
 	struct in6_addr *src_key = NULL;
 	struct fib6_nh *nh = res->nh;
+	unsigned long old_expires = 0;
+	u32 old_mtu = 0;
 	int max_depth;
 	int err = 0;
 
+	/* Allocate what the lock would otherwise be held across: this lock is
+	 * shared by every nexthop of every netns, and a refresh runs for each
+	 * stale exception after a FIB change. Nothing is published until the
+	 * swap below, and what is not used is freed after the unlock.
+	 */
+	new_ex = kzalloc_obj(*new_ex, GFP_ATOMIC);
+	if (!new_ex)
+		return -ENOMEM;
+
+	/* A copy of an exception carries writable metrics, see
+	 * rt6_exception_copy_state(). nrt is not visible to anyone yet.
+	 */
+	if (old && !dst_metrics_write_ptr(&nrt->dst)) {
+		kfree(new_ex);
+		return -ENOMEM;
+	}
+
 	spin_lock_bh(&rt6_exception_lock);
 
 	if (f6i->fib6_destroying) {
@@ -1771,6 +1934,11 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 	bucket = rcu_dereference_protected(nh->rt6i_exception_bucket,
 					  lockdep_is_held(&rt6_exception_lock));
 	if (!bucket) {
+		/* Nothing to replace */
+		if (old) {
+			err = -EEXIST;
+			goto out;
+		}
 		bucket = kzalloc_objs(*bucket, FIB6_EXCEPTION_BUCKET_SIZE,
 				      GFP_ATOMIC);
 		if (!bucket) {
@@ -1790,27 +1958,88 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 	if (f6i->fib6_src.plen)
 		src_key = &nrt->rt6i_src.addr;
 #endif
+	if (old) {
+		old_bucket = bucket;
+		rt6_ex = __rt6_find_exception_spinlock(&old_bucket,
+						       &nrt->rt6i_dst.addr,
+						       src_key);
+		if (!rt6_ex || rt6_ex->rt6i != old) {
+			err = -EEXIST;
+			goto out;
+		}
+		/* Before the copy: an in-place update of old that lands in
+		 * between is then both in the copy and seen as a change after
+		 * the swap, which merges it again, harmlessly.
+		 */
+		old_mtu = dst_metric_raw(&old->dst, RTAX_MTU);
+		old_expires = READ_ONCE(old->dst.expires);
+		err = rt6_exception_copy_state(nrt, old);
+		if (err)
+			goto out;
+	}
+
 	/* rt6_mtu_change() might lower mtu on f6i.
 	 * Only insert this exception route if its mtu
 	 * is less than f6i's mtu value.
 	 */
 	if (dst_metric_raw(&nrt->dst, RTAX_MTU) >= fib6_mtu(res)) {
-		err = -EINVAL;
-		goto out;
-	}
-
-	/* Allocate the new entry before the one it replaces is touched, so
-	 * that running out of memory leaves what was learned in place.
-	 */
-	new_ex = kzalloc_obj(*new_ex, GFP_ATOMIC);
-	if (!new_ex) {
-		err = -ENOMEM;
-		goto out;
+		if (old && (old->rt6i_flags & RTF_DYNAMIC)) {
+			/* A redirect whose PMTU was lowered in place and has
+			 * since stopped lowering anything, e.g. after a device
+			 * MTU change: the gateway is still worth keeping. Forget
+			 * only the PMTU and carry the route's own MTU, as a new
+			 * redirect exception would. The metrics are writable
+			 * already (rt6_exception_copy_state()), so this cannot
+			 * fail.
+			 */
+			dst_metric_set(&nrt->dst, RTAX_MTU, res->f6i->fib6_pmtu);
+		} else {
+			/* A stale exception that no longer lowers anything
+			 * would fail every refresh from here on: drop it.
+			 */
+			if (old)
+				rt6_remove_exception(old_bucket, rt6_ex);
+			err = -EINVAL;
+			goto out;
+		}
 	}
 
 	new_ex->rt6i = nrt;
 	new_ex->stamp = jiffies;
 
+	if (old) {
+		/* rt6_ex, found above, is old's entry. Swap in place: lockless
+		 * lookups see either the old or the new exception and never
+		 * a gap in which they would miss it and build a pcpu dst that
+		 * ignores it, nothing invalidates pcpu dsts for a refresh, and
+		 * the position in the chain, which route dumps count, and the
+		 * depth do not change.
+		 *
+		 * Holders of old find out that it is stale when they next
+		 * check it, so keep it working rather than dst_dev_put() it.
+		 * Device unregister detaches it like any other uncached dst.
+		 */
+		hlist_replace_rcu(&rt6_ex->hlist, &new_ex->hlist);
+
+		/* An in-place PMTU update of old does not take the lock, and
+		 * one that saw old still in the table does not merge (see
+		 * fib6_nh_update_exception()). Pairs with smp_mb() there:
+		 * either it sees nrt and merges into it under the lock, or
+		 * this sees its update and merges it here. Only a change
+		 * since the copy is merged, so the PMTU a redirect copy
+		 * dropped above is not brought back.
+		 */
+		smp_mb();
+		if (dst_metric_raw(&old->dst, RTAX_MTU) != old_mtu ||
+		    READ_ONCE(old->dst.expires) != old_expires)
+			rt6_exception_merge(nrt, old);
+
+		rt6_uncached_list_add(old);
+		dst_release(&old->dst);
+		kfree_rcu(rt6_ex, rcu);
+		goto out;
+	}
+
 	rt6_ex = __rt6_find_exception_spinlock(&bucket, &nrt->rt6i_dst.addr,
 					       src_key);
 	if (rt6_ex)
@@ -1828,10 +2057,14 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 out:
 	spin_unlock_bh(&rt6_exception_lock);
 
-	/* Update fn->fn_sernum to invalidate all cached dst */
-	if (!err) {
+	/* new_ex is in the table on success only */
+	if (err)
+		kfree(new_ex);
+
+	if (!err && !old) {
+		fib6_nh_invalidate_pcpu(nh);
+
 		spin_lock_bh(&f6i->fib6_table->tb6_lock);
-		fib6_update_sernum(net, f6i);
 		fib6_update_excp_seq(f6i);
 		fib6_add_gc_list(f6i);
 		spin_unlock_bh(&f6i->fib6_table->tb6_lock);
@@ -1841,6 +2074,12 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 	return err;
 }
 
+static int rt6_insert_exception(struct rt6_info *nrt,
+				const struct fib6_result *res)
+{
+	return __rt6_insert_exception(nrt, res, NULL);
+}
+
 static void fib6_nh_flush_exceptions(struct fib6_nh *nh, struct fib6_info *from)
 {
 	struct rt6_exception_bucket *bucket;
@@ -1890,9 +2129,10 @@ void rt6_flush_exceptions(struct fib6_info *f6i)
 /* Find cached rt in the hash table inside passed in rt
  * Caller has to hold rcu_read_lock()
  */
-static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
-					   const struct in6_addr *daddr,
-					   const struct in6_addr *saddr)
+static struct rt6_info *__rt6_find_cached_rt(const struct fib6_result *res,
+					     const struct in6_addr *daddr,
+					     const struct in6_addr *saddr,
+					     struct rt6_info **stale)
 {
 	const struct in6_addr *src_key = NULL;
 	struct rt6_exception_bucket *bucket;
@@ -1918,12 +2158,31 @@ static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 	bucket = fib6_nh_get_excptn_bucket(res->nh, NULL);
 	rt6_ex = __rt6_find_exception_rcu(&bucket, daddr, src_key);
 
-	if (rt6_ex && !rt6_check_expired(rt6_ex->rt6i))
+	if (rt6_ex && !rt6_check_expired(rt6_ex->rt6i)) {
 		ret = rt6_ex->rt6i;
+		/* Callers that hand the exception to users as their dst pass
+		 * @stale: a stale one must not be re-stamped, other holders
+		 * must keep seeing it as stale, so it is a miss for them and is
+		 * returned in @stale to be replaced. Callers that only read it
+		 * (MTU of a FIB lookup, route delete, redirect gateway match)
+		 * get it whatever its generation: what it has learned is still
+		 * right.
+		 */
+		if (stale && !rt6_is_valid(ret)) {
+			*stale = ret;
+			ret = NULL;
+		}
+	}
 
 #ifdef CONFIG_IPV6_SUBTREES
-	/* Use fib6_src as src_key and redo lookup */
-	if (!ret && src_key && src_key != &res->f6i->fib6_src.addr) {
+	/* Use fib6_src as src_key and redo lookup. Not if a stale exception
+	 * was found for the flow's own source address: without the refresh
+	 * the exact match is what the lookup returns, and a current one under
+	 * the prefix key must not take its place, which would also keep the
+	 * stale one from ever being refreshed.
+	 */
+	if (!ret && !(stale && *stale) && src_key &&
+	    src_key != &res->f6i->fib6_src.addr) {
 		src_key = &res->f6i->fib6_src.addr;
 		goto find_ex;
 	}
@@ -1932,6 +2191,86 @@ static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
 	return ret;
 }
 
+static struct rt6_info *rt6_find_cached_rt(const struct fib6_result *res,
+					   const struct in6_addr *daddr,
+					   const struct in6_addr *saddr)
+{
+	return __rt6_find_cached_rt(res, daddr, saddr, NULL);
+}
+
+/* Replace a stale exception with a current copy of it.
+ *
+ * Validity is a property of the dst and the dsts held by sockets and
+ * dst_caches must stay stale, so @old cannot be re-stamped. Its content (the
+ * learned PMTU or redirect gateway) is still right though: it lives on the
+ * nexthop this lookup just selected, and nexthop or route removal flushes it.
+ * Dropping it instead would make every FIB change in the netns discard all
+ * learned PMTUs and redirects.
+ *
+ * The copy is stamped like any dst built from this result. Caller holds
+ * rcu_read_lock().
+ */
+static struct rt6_info *rt6_refresh_exception(const struct fib6_result *res,
+					      struct rt6_info *old,
+					      bool *nomem)
+{
+	const struct in6_addr *saddr = NULL;
+	struct rt6_info *nrt;
+	int err;
+
+#ifdef CONFIG_IPV6_SUBTREES
+	if (old->rt6i_src.plen)
+		saddr = &old->rt6i_src.addr;
+#endif
+	nrt = ip6_rt_cache_alloc(res, &old->rt6i_dst.addr, saddr);
+	if (!nrt) {
+		*nomem = true;
+		return NULL;
+	}
+
+	err = __rt6_insert_exception(nrt, res, old);
+	if (!err)
+		return nrt;
+
+	dst_release_immediate(&nrt->dst);
+
+	/* @old was replaced or removed since we found it: use what is there
+	 * now, which is a miss if it was removed.
+	 */
+	if (err == -EEXIST)
+		return __rt6_find_cached_rt(res, &old->rt6i_dst.addr, saddr,
+					    NULL);
+
+	if (err == -ENOMEM)
+		*nomem = true;
+	return NULL;
+}
+
+/* rt6_find_cached_rt() for the lookup paths that hand the result to users:
+ * a stale exception is replaced by a current copy instead of being lost.
+ *
+ * If the replacement could not be made for lack of memory, the exception is
+ * still there, stale, and the caller will return some other dst, which
+ * would be valid and bypass it until the next PMTU update. *@retry is set
+ * so the caller can mark that dst stale, which makes its users look the
+ * route up, and try the replacement, again.
+ *
+ * Caller holds rcu_read_lock().
+ */
+static struct rt6_info *
+rt6_find_cached_rt_refresh(const struct fib6_result *res,
+			   const struct in6_addr *daddr,
+			   const struct in6_addr *saddr, bool *retry)
+{
+	struct rt6_info *stale = NULL, *rt;
+
+	rt = __rt6_find_cached_rt(res, daddr, saddr, &stale);
+	if (!rt && stale)
+		rt = rt6_refresh_exception(res, stale, retry);
+
+	return rt;
+}
+
 /* Remove the passed in cached rt from the hash table that contains it */
 static int fib6_nh_remove_exception(const struct fib6_nh *nh, int plen,
 				    const struct rt6_info *rt)
@@ -2014,8 +2353,24 @@ static int rt6_remove_exception_rt(struct rt6_info *rt)
 					from->fib6_src.plen, rt);
 }
 
-/* Find rt6_ex which contains the passed in rt cache and
- * refresh its stamp
+/* @rt, a dst some user holds, was just updated in place (PMTU, expiry). Refresh
+ * the stamp of the exception for its destination and make sure that exception
+ * carries the update.
+ *
+ * The exception in the table is not necessarily @rt: a stale one is replaced
+ * by a copy (see rt6_refresh_exception()) while the old dst stays with its
+ * holders, and the in-place update does not take rt6_exception_lock.
+ *
+ * While @rt is still the exception in the table, which is almost always,
+ * only the stamp is refreshed, without the lock. The smp_mb() pairs with the
+ * one in __rt6_insert_exception() after a refresh swaps in its copy: either
+ * the lookup here finds the copy, or the refresh sees this update of @rt and
+ * merges it into the copy. Once @rt has been replaced, the lock orders this
+ * after any later replacement in progress, and the update is merged into
+ * whatever exception is current. Either way a PMTU or expiry learned from
+ * @rt is not lost to the copy.
+ *
+ * Caller holds rcu_read_lock().
  */
 static void fib6_nh_update_exception(const struct fib6_nh *nh, int plen,
 				     const struct rt6_info *rt)
@@ -2024,7 +2379,6 @@ static void fib6_nh_update_exception(const struct fib6_nh *nh, int plen,
 	struct rt6_exception_bucket *bucket;
 	struct rt6_exception *rt6_ex;
 
-	bucket = fib6_nh_get_excptn_bucket(nh, NULL);
 #ifdef CONFIG_IPV6_SUBTREES
 	/* rt6i_src.plen != 0 indicates 'from' is in subtree
 	 * and exception table is indexed by a hash of
@@ -2035,9 +2389,31 @@ static void fib6_nh_update_exception(const struct fib6_nh *nh, int plen,
 	if (plen)
 		src_key = &rt->rt6i_src.addr;
 #endif
+
+	/* Order the update of @rt before the lookup, see above */
+	smp_mb();
+
+	bucket = fib6_nh_get_excptn_bucket(nh, NULL);
 	rt6_ex = __rt6_find_exception_rcu(&bucket, &rt->rt6i_dst.addr, src_key);
-	if (rt6_ex)
+	if (!rt6_ex)
+		return;
+	if (rt6_ex->rt6i == rt) {
+		rt6_ex->stamp = jiffies;
+		return;
+	}
+
+	spin_lock_bh(&rt6_exception_lock);
+
+	bucket = fib6_nh_get_excptn_bucket(nh, &rt6_exception_lock);
+	rt6_ex = __rt6_find_exception_spinlock(&bucket, &rt->rt6i_dst.addr,
+					       src_key);
+	if (rt6_ex) {
 		rt6_ex->stamp = jiffies;
+		if (rt6_ex->rt6i != rt)
+			rt6_exception_merge(rt6_ex->rt6i, rt);
+	}
+
+	spin_unlock_bh(&rt6_exception_lock);
 }
 
 struct fib6_nh_match_arg {
@@ -2315,6 +2691,7 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 	struct fib6_result res = {};
 	struct rt6_info *rt = NULL;
 	bool have_oif_match;
+	bool retry = false;
 	int strict = 0;
 
 	WARN_ON_ONCE((flags & RT6_LOOKUP_F_DST_NOREF) &&
@@ -2336,7 +2713,8 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 	fib6_select_path(net, &res, fl6, oif, have_oif_match, skb, strict);
 
 	/*Search through exception table */
-	rt = rt6_find_cached_rt(&res, &fl6->daddr, &fl6->saddr);
+	rt = rt6_find_cached_rt_refresh(&res, &fl6->daddr, &fl6->saddr,
+					&retry);
 	if (rt) {
 		goto out;
 	} else if (unlikely((fl6->flowi6_flags & FLOWI_FLAG_KNOWN_NH) &&
@@ -2349,6 +2727,10 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 		rt = ip6_rt_cache_alloc(&res, &fl6->daddr, NULL);
 
 		if (rt) {
+			/* see rt6_find_cached_rt_refresh() */
+			if (retry)
+				rt6_dst_invalidate(rt);
+
 			/* 1 refcnt is taken during ip6_rt_cache_alloc().
 			 * As rt6_uncached_list_add() does not consume refcnt,
 			 * this refcnt is always returned to the caller even
@@ -2364,9 +2746,34 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 		local_bh_disable();
 		rt = rt6_get_pcpu_route(&res);
 
-		if (!rt)
+		if (!rt) {
 			rt = rt6_make_pcpu_route(net, &res);
 
+			/* The exception lookup above may have raced with
+			 * rt6_insert_exception(), whose pcpu invalidation
+			 * skips CPUs that have not marked an installed dst.
+			 * rt6_make_pcpu_route() orders the install and the mark
+			 * before this lookup, so a miss here means the writer's
+			 * invalidation sees our dst and marks it stale.
+			 */
+			if (rt) {
+				struct rt6_info *excp;
+
+				excp = rt6_find_cached_rt_refresh(&res,
+								  &fl6->daddr,
+								  &fl6->saddr,
+								  &retry);
+				if (excp) {
+					rt = excp;
+					retry = false;
+				}
+			}
+		}
+
+		/* see rt6_find_cached_rt_refresh() */
+		if (retry && rt)
+			rt6_dst_invalidate(rt);
+
 		local_bh_enable();
 	}
 out:
@@ -2807,27 +3214,18 @@ struct dst_entry *ip6_blackhole_route(struct net *net, struct dst_entry *dst_ori
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
@@ -2837,16 +3235,89 @@ static struct dst_entry *rt6_check(struct rt6_info *rt,
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
 
+struct rt6_clone_nh_arg {
+	const struct rt6_info *rt;
+	struct fib6_info *from;
+	const struct in6_addr *saddr;
+};
+
+/* Has this nexthop an exception for the destination of the clone in
+ * @_arg? Nonzero if so, which ends a walk of a group.
+ */
+static int rt6_clone_nh_excp(struct fib6_nh *nh, void *_arg)
+{
+	struct rt6_clone_nh_arg *arg = _arg;
+	const struct rt6_info *rt = arg->rt;
+	struct fib6_result res = {
+		.f6i = arg->from,
+		.nh = nh,
+	};
+	struct rt6_info *ex;
+
+	if (nh->fib_nh_dev != dst_dev_rcu(&rt->dst))
+		return 0;
+
+	/* A clone without a gateway was made from a member without one. A
+	 * member of the group that has one, on the same device, is not where
+	 * its exceptions are. A dst with a gateway may have got it from a
+	 * redirect, which is not the member's, so any member will do for it.
+	 */
+	if (!(rt->rt6i_flags & RTF_GATEWAY) && nh->fib_nh_gw_family)
+		return 0;
+
+	if (!rcu_access_pointer(nh->rt6i_exception_bucket))
+		return 0;
+
+	ex = __rt6_find_cached_rt(&res, &rt->rt6i_dst.addr, arg->saddr, NULL);
+
+	return ex && ex != rt;
+}
+
+/* An RTF_CACHE dst on the uncached list is not an exception of the table: it
+ * is a clone that ip6_pol_route() made for FLOWI_FLAG_KNOWN_NH, or an
+ * exception that was replaced or removed. A PMTU or redirect learned for its
+ * destination after it was made is an exception on the nexthop, which
+ * invalidates the pcpu dsts but not this one, and ip6_dst_check() would
+ * otherwise keep passing it. Report whether such an exception exists, so the
+ * holder does the lookup again and gets it.
+ *
+ * The dst does not say which member of a nexthop group it was made from, so
+ * look at every member that it can have come from: the ones on its device
+ * and, if it has no gateway, without one. Several can match, and an exception
+ * on one that was not the source only makes the holder look the route up
+ * again, which is harmless. Missing the source's would not be.
+ *
+ * Caller holds rcu_read_lock().
+ */
+static bool rt6_uncached_clone_superseded(const struct rt6_info *rt,
+					  struct fib6_info *from)
+{
+	struct rt6_clone_nh_arg arg = {
+		.rt = rt,
+		.from = from,
+	};
+
+#ifdef CONFIG_IPV6_SUBTREES
+	if (rt->rt6i_src.plen)
+		arg.saddr = &rt->rt6i_src.addr;
+#endif
+
+	if (from->nh)
+		return nexthop_for_each_fib6_nh(from->nh, rt6_clone_nh_excp,
+						&arg);
+
+	return rt6_clone_nh_excp(from->fib6_nh, &arg);
+}
+
 INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 							u32 cookie)
 {
@@ -2856,8 +3327,11 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 
 	rt = dst_rt6_info(dst);
 
-	if (READ_ONCE(rt->sernum))
-		return rt6_is_valid(rt) ? dst : NULL;
+	/* Any FIB change bumps the netns generation, which invalidates
+	 * every dst created under an older one.
+	 */
+	if (!rt6_is_valid(rt))
+		return NULL;
 
 	rcu_read_lock();
 
@@ -2869,10 +3343,16 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
 	from = rcu_dereference(rt->from);
 
 	if (from && (rt->rt6i_flags & RTF_PCPU ||
-	    unlikely(rt->dst.rt_uncached_list)))
-		dst_ret = rt6_dst_from_check(rt, from, cookie);
-	else
-		dst_ret = rt6_check(rt, from, cookie);
+	    unlikely(rt->dst.rt_uncached_list))) {
+		if (unlikely(rt->dst.rt_uncached_list &&
+			     (rt->rt6i_flags & RTF_CACHE) &&
+			     rt6_uncached_clone_superseded(rt, from)))
+			dst_ret = NULL;
+		else
+			dst_ret = rt6_dst_from_check(rt, from);
+	} else {
+		dst_ret = rt6_check(rt, from);
+	}
 
 	rcu_read_unlock();
 
@@ -3754,6 +4234,13 @@ int fib6_nh_init(struct net *net, struct fib6_nh *fib6_nh,
 		goto out;
 	}
 
+	if (!zalloc_cpumask_var(&fib6_nh->rt6i_pcpu_dirty, gfp_flags)) {
+		free_percpu(fib6_nh->rt6i_pcpu);
+		fib6_nh->rt6i_pcpu = NULL;
+		err = -ENOMEM;
+		goto out;
+	}
+
 	fib6_nh->fib_nh_dev = dev;
 	fib6_nh->fib_nh_oif = dev->ifindex;
 	err = 0;
@@ -3788,6 +4275,7 @@ void fib6_nh_release(struct fib6_nh *fib6_nh)
 	rcu_read_unlock();
 
 	free_percpu(fib6_nh->rt6i_pcpu);
+	free_cpumask_var(fib6_nh->rt6i_pcpu_dirty);
 
 	fib_nh_common_release(&fib6_nh->nh_common);
 }
-- 
2.54.0 (Apple Git-157)

