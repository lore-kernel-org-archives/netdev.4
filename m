Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469192;
	b=zSjCmPcSSRQMFpa1C0wzsTtriti4vKH47miZjBrSlqLc/PZelS2+LaK4KOckIYpmQeEU
	 mtbH8y0SOohB+1xvHNEsAafNorMYxLh2GVLj3RKGlU5agDRoJB/wT0Bdi0CR5f+fS2wMB
	 bN1QU9cTbQUIM6zLJRCxEVRKFmHtHICQRYqKFo1k0D3QFMoVX7f/70GjwCU05ASlCXmhp
	 6o4DEsc+DgOPaFUQnIInpjnXf9920Q3Y+F8bRLtPGVKYBtGKuNWXLrss1+7W0UbT2cPAJ
	 5WA3cnjYVR4YibIHzUq00TsrX2aI/HBEbcSyL49Xz7sppH4tZlr49nUYzk03XHkeVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469192;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0XNXqikktmro8BSaMXi6gVfIL79lfS7VSfdwQmtku7A=;
	b=B8rSWLRWZzz0qhW7KZDoUWFb09OGyMQy2Mbdz9HoLmFyLlrHE53iX+iIEzxDO0aG11Yx
	 3V4s3omFe771XNEt+0Uz5dopTuuTo4ftqLeRKlA5Npf99ehaxoBMZOb4dtK4v9eZitZIr
	 13wOxDAeCZAi57HN9gWqDfW1SI+N/GstEUsGBTLR+uNaYXW4+f/k+gjkLJBJO1D2k9UZV
	 MVSTuCFXq22eYsYY4/I3B5xPT5HmrjBTXTSD6Tf3IwMU/M88ZSAEEqLiWkeCnQ2eZ2gYs
	 /GUxVyGoHQrnNosiazggWPlXnHdIwM273T0JHggeoabLL1zZuvNpWMd3CIcGLM7KnJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=offhgGL3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447BE606A690
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=offhgGL3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F191F00A03;
	Mon, 23 Nov 2026 21:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469192;
	bh=0XNXqikktmro8BSaMXi6gVfIL79lfS7VSfdwQmtku7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=offhgGL3dH+RaWwGK5yee2co/WXcitshY3wlmepfejwdlXBgJkK74Yn3X2ebL1Bqq
	 G2XhxDcv0Qoqt4XXmEXeeulLnfCDhybFCwFBBDzyvE9vPQk1x7TmFtYVuRnRssdfcF
	 g/ZTpBcQ6daCSxr5lBxt6DqgJeKmy37U2ZDUS6YouctFE7AKpLnFSPGlnFo7SptuGx
	 ThOqalNkseLs87XwJVatG20WOzo77HgEqSu+Ul3hPvirD257toqcyyw1LKFF6+akNQ
	 tTHeQdPhKsEwTTixj298YZ6kCHw4q7mnff+JSxuCr36MrdJytZL04Vx/DpGqKp4KK+
	 3kRnrH0h3I5fw==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 5/7] ipv6: scope exception invalidation to the affected nexthop
Date: Mon, 23 Nov 2026 14:26:07 -0700
Message-ID: <20261123212623.106153-6-dsahern@kernel.org>
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

rt6_insert_exception() bumped the netns route generation, which with
generation-based dst validation invalidates every dst in the
namespace each time a PMTU or redirect exception is created. A burst
of packet-too-big messages would make all sockets and dst_caches look
their routes up again.

IPv4 limits this to the nexthop: update_or_create_fnhe() marks only
that nexthop's cached dsts stale. Do the same here by clearing the
sernum of the fib6_nh's pcpu dsts, so their users look the route up
once and find the exception.

Route dumps notice a changed tree through the root node's fn_sernum,
and the exception dump relies on that changing when an exception is
inserted on the root. A fresh fn_sernum can only come from the netns
counter, which must not be bumped here, and a locally made-up value
could later be issued by the counter to the same node and go
unnoticed. Add a per-table tb6_excp_seq, bumped for exceptions on the
root node, and have fib6_dump_table() restart when either it or the
root's fn_sernum has changed.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- None.

 include/net/ip6_fib.h |  3 +++
 net/ipv6/ip6_fib.c    | 25 ++++++++++++++++++++++++-
 net/ipv6/route.c      | 27 +++++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index ecce7ab007a5..92fed30a7418 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -329,6 +329,7 @@ struct fib6_walker {
 	unsigned int skip;
 	unsigned int count;
 	unsigned int skip_in_node;
+	unsigned int excp_seq;	/* tb6_excp_seq seen by a partial dump */
 	int (*func)(struct fib6_walker *);
 	void *args;
 };
@@ -362,6 +363,7 @@ struct fib6_table {
 	struct inet_peer_base	tb6_peers;
 	unsigned int		flags;
 	unsigned int		fib_seq; /* writes protected by rtnl_mutex */
+	unsigned int		tb6_excp_seq;	/* writes under tb6_lock */
 	struct hlist_head       tb6_gc_hlist;	/* GC candidates */
 #define RT6_TABLE_HAS_DFLT_ROUTER	BIT(0)
 };
@@ -583,6 +585,7 @@ int fib6_tables_dump(struct net *net, struct notifier_block *nb,
 		     struct netlink_ext_ack *extack);
 
 void fib6_update_sernum(struct net *net, struct fib6_info *rt);
+void fib6_update_excp_seq(struct fib6_info *rt);
 #if IS_ENABLED(CONFIG_IPV6)
 void fib6_update_sernum_upto_root(struct net *net, struct fib6_info *rt);
 #else
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index d465ac6ffbc6..266370e15774 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -148,6 +148,25 @@ void fib6_update_sernum(struct net *net, struct fib6_info *f6i)
 		WRITE_ONCE(fn->fn_sernum, fib6_new_sernum(net));
 }
 
+/* Tell route dumps that an exception was added under @f6i without
+ * invalidating cached dsts: those follow the netns generation, which this
+ * leaves alone. A dump notices a changed tree through the root node, so
+ * only an exception on the root needs to be visible. Fresh fn_sernum values
+ * can only come from the netns counter, so use a table sequence rather than
+ * a made-up fn_sernum that the counter could later issue again.
+ * Caller holds tb6_lock.
+ */
+void fib6_update_excp_seq(struct fib6_info *f6i)
+{
+	struct fib6_table *table = f6i->fib6_table;
+	struct fib6_node *fn;
+
+	fn = rcu_dereference_protected(f6i->fib6_node,
+				       lockdep_is_held(&table->tb6_lock));
+	if (fn == &table->tb6_root)
+		WRITE_ONCE(table->tb6_excp_seq, table->tb6_excp_seq + 1);
+}
+
 /*
  *	Auxiliary address test functions for the radix tree.
  *
@@ -637,12 +656,16 @@ static int fib6_dump_table(struct fib6_table *table, struct sk_buff *skb,
 		if (res > 0) {
 			cb->args[4] = 1;
 			cb->args[5] = READ_ONCE(w->root->fn_sernum);
+			w->excp_seq = READ_ONCE(table->tb6_excp_seq);
 		}
 	} else {
 		int sernum = READ_ONCE(w->root->fn_sernum);
-		if (cb->args[5] != sernum) {
+		unsigned int excp_seq = READ_ONCE(table->tb6_excp_seq);
+
+		if (cb->args[5] != sernum || w->excp_seq != excp_seq) {
 			/* Begin at the root if the tree changed */
 			cb->args[5] = sernum;
+			w->excp_seq = excp_seq;
 			w->state = FWS_INIT;
 			w->node = w->root;
 			w->skip = w->count;
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index a132d33259a2..38d5f3bc85bb 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1717,6 +1717,28 @@ struct rt6_exception_bucket *fib6_nh_get_excptn_bucket(const struct fib6_nh *nh,
 	return bucket;
 }
 
+/* A new exception may apply to dsts already cached on @nh. Make them fail
+ * ip6_dst_check() once so their users look the route up again and find it;
+ * dsts of other routes are left alone.
+ */
+static void fib6_nh_invalidate_pcpu(const struct fib6_nh *nh)
+{
+	int cpu;
+
+	if (!nh->rt6i_pcpu)
+		return;
+
+	rcu_read_lock();
+	for_each_possible_cpu(cpu) {
+		struct rt6_info *pcpu_rt;
+
+		pcpu_rt = READ_ONCE(*per_cpu_ptr(nh->rt6i_pcpu, cpu));
+		if (pcpu_rt)
+			WRITE_ONCE(pcpu_rt->sernum, 0);
+	}
+	rcu_read_unlock();
+}
+
 static int rt6_insert_exception(struct rt6_info *nrt,
 				const struct fib6_result *res)
 {
@@ -1791,10 +1813,11 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 out:
 	spin_unlock_bh(&rt6_exception_lock);
 
-	/* Update fn->fn_sernum to invalidate all cached dst */
 	if (!err) {
+		fib6_nh_invalidate_pcpu(nh);
+
 		spin_lock_bh(&f6i->fib6_table->tb6_lock);
-		fib6_update_sernum(net, f6i);
+		fib6_update_excp_seq(f6i);
 		fib6_add_gc_list(f6i);
 		spin_unlock_bh(&f6i->fib6_table->tb6_lock);
 		fib6_force_start_gc(net);
-- 
2.43.0

