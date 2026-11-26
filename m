Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656831;
	b=OFIKxKSBa/Remxr3hX92Di+mHhQVJoIAuaVOqh4AVgjITI89eC6zXmJvk+oo9Qo1Fyev
	 4asjDpMEfVRxRoJ5bjdd8EqnjXFH+PmgPOJ59UtqMyEbL1xH+HnUP0NRr1j2tteOQVlCD
	 tmLd9WTehPtVhOjoQNDmX9yJCvS+BX3OFXR1ZMpy1rY7t1avyUS3l1G899YmQl46w8+jo
	 f0JYfhDMKzUE2M36p9DlINx5qFEjCUFuiE8Dkyy826fr7PIIPFr+rdEmba3+w0Kqdn6BU
	 PLRmos+BsD69JpyhPonF+8cWXI6ahOecLx3pXXZzQZYac8wsrT9mR6hdg+l4z/TT7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656831;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jC5uY0DAbFhN/sA6A3kKFBjHeSma9xbe0mGA1UGEeio=;
	b=05DVrq17Th4KOvUc4LQJUD1gCaWVxcKRvjjEg5MJYyUY6p9kD/TVlggNjzsOYcYClwgn
	 FiO8i/922yU10hT6ePVvm6o2N4/kPArBEyly0sFyHUv37buU4DyYfpCHJm7ZH+NHSof2E
	 M2Aj4HVGl0IhEEtEX1HxJwBpfeNolmlSyfkDepYsWDSMAJDVNjKmWY3IQQJ4z/MdagRmr
	 oaPZlrCbFeEr59cULUgrpXPi8OMTJ12sxoqTpcXF4mU/iyz/EmwxGydH9C2h+k22Oazsw
	 sYR8BNGdTK/V8ClwxnpqDkNZcLhGVWDWR/ifD0Q9wZyLVtZz5jHaNsVayj5JwBpBGhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrjTxi+m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4185B606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrjTxi+m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47191F008B2;
	Thu, 26 Nov 2026 01:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656830;
	bh=jC5uY0DAbFhN/sA6A3kKFBjHeSma9xbe0mGA1UGEeio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DrjTxi+mkvaUM2UnXcvDyT/haj4RTAwFV1233khEIiquRrf0uIzGiub5SLQM90KoJ
	 S4WMuRUQn/jZfpO3GLnrXpc4ao5OWQWy8E6ZyDGdF/WfIdzadaiz/tx+VuBc/is0Af
	 Fy9bQ53Pgzh34BCxN9VSAcf9mEH600ia7kzfR6sELCvvk3k+I6q3FS6d3QKCTSvJcI
	 Zz0rn+CbOt1ZfQ9HyVIuik1qWE4ylqJ+bakD+7lenIrrzvUN+oTvuHYOiB8FU8r8Vk
	 mojuV0IuUuDCNlEqWi28JQrOyBXJAUeDQJb/yVAf7cRFAq3vqnuP7ZJnEK7WUbnft3
	 CgHQYVjR59cTw==
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
Subject: [PATCH net-next v2 05/13] ipv6: tell route dumps about exception inserts with a table sequence
Date: Wed, 25 Nov 2026 18:33:31 -0700
Message-ID: <09874919c6f8c0da76839f5e70bdce66df09b6d6.1795642432.git.dahern@nvidia.com>
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

A route dump that is suspended and later resumed restarts from the
root if the root node's fn_sernum changed, and the exception dump
relies on that happening when an exception is inserted on the root:
rt6_insert_exception() calls fib6_update_sernum(), which among other
things gives the node a new fn_sernum.

That ties dump consistency to what a change to fn_sernum otherwise
means. A fresh fn_sernum can only come from the netns counter, and a
locally made-up value could later be issued by the counter to the same
node and go unnoticed. Add a per-table tb6_excp_seq, bumped under
tb6_lock when an exception is inserted on the root node, and have
fib6_dump_table() restart when either it or the root's fn_sernum has
changed. The set of inserts a dump notices is the same as before.

Also correct the comment in rt6_nh_dump_exceptions(): only changes to
the root's exceptions are noticed, not those under other nodes, where
a dump suspended in the middle of a route's exceptions can skip or
repeat some of them.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
 include/net/ip6_fib.h |  3 +++
 net/ipv6/ip6_fib.c    | 25 ++++++++++++++++++++++++-
 net/ipv6/route.c      | 15 ++++++++++-----
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index bfc1895e8591..af2a17945011 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -386,6 +386,7 @@ struct fib6_walker {
 	unsigned int skip;
 	unsigned int count;
 	unsigned int skip_in_node;
+	unsigned int excp_seq;	/* tb6_excp_seq seen by a partial dump */
 	int (*func)(struct fib6_walker *);
 	void *args;
 };
@@ -419,6 +420,7 @@ struct fib6_table {
 	struct inet_peer_base	tb6_peers;
 	unsigned int		flags;
 	unsigned int		fib_seq; /* writes protected by rtnl_mutex */
+	unsigned int		tb6_excp_seq;	/* writes under tb6_lock */
 	struct hlist_head       tb6_gc_hlist;	/* GC candidates */
 #define RT6_TABLE_HAS_DFLT_ROUTER	BIT(0)
 };
@@ -640,6 +642,7 @@ int fib6_tables_dump(struct net *net, struct notifier_block *nb,
 		     struct netlink_ext_ack *extack);
 
 void fib6_update_sernum(struct net *net, struct fib6_info *rt);
+void fib6_update_excp_seq(struct fib6_info *rt);
 #if IS_ENABLED(CONFIG_IPV6)
 void fib6_update_sernum_upto_root(struct net *net, struct fib6_info *rt);
 #else
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..4da83c22bbde 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -148,6 +148,25 @@ void fib6_update_sernum(struct net *net, struct fib6_info *f6i)
 		WRITE_ONCE(fn->fn_sernum, fib6_new_sernum(net));
 }
 
+/* Tell route dumps that an exception was added under @f6i. A dump notices
+ * a changed tree through the root node, so only an exception on the root
+ * needs to be visible. Use a table sequence for that, rather than a fresh
+ * fn_sernum, so that it does not depend on what else a change to fn_sernum
+ * does: fresh values can only come from the netns counter, and a made-up
+ * one could later be issued by the counter to the same node.
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
index 39204a0b42d1..823ed595d4b6 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1832,6 +1832,7 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 	if (!err) {
 		spin_lock_bh(&f6i->fib6_table->tb6_lock);
 		fib6_update_sernum(net, f6i);
+		fib6_update_excp_seq(f6i);
 		fib6_add_gc_list(f6i);
 		spin_unlock_bh(&f6i->fib6_table->tb6_lock);
 		fib6_force_start_gc(net);
@@ -6122,11 +6123,15 @@ static int rt6_nh_dump_exceptions(struct fib6_nh *nh, void *arg)
 				continue;
 			}
 
-			/* Expiration of entries doesn't bump sernum, insertion
-			 * does. Removal is triggered by insertion, so we can
-			 * rely on the fact that if entries change between two
-			 * partial dumps, this node is scanned again completely,
-			 * see rt6_insert_exception() and fib6_dump_table().
+			/* Expiration of entries doesn't bump anything. An
+			 * insertion on the root node changes the root's
+			 * fn_sernum or tb6_excp_seq, and removal is triggered
+			 * by insertion, so if entries of the root change
+			 * between two partial dumps, the table is scanned
+			 * again, see rt6_insert_exception() and
+			 * fib6_dump_table(). A change under any other node is
+			 * not noticed: a dump suspended in the middle of that
+			 * route's exceptions can skip or repeat some of them.
 			 *
 			 * Count expired entries we go through as handled
 			 * entries that we'll skip next time, in case of partial
-- 
2.54.0 (Apple Git-157)

