Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537660;
	b=2TBnl7RjqLm5UoGEkbdjGY7vmyd0rx6grMcCprHt/+wkn6NRFHEc77EGj3ynlQKYUewR
	 mpeXDKK3DYmTpctWIqRpQpaYBsN1NDwHqIkaGdCxYIX4h67aoAPvrMIhgpt+bx3JT+3uI
	 GAsHN3JkmSpTjX9zl99fE0meG3KXFgLjvZ96tCIQfaLH0DnAnKD7PWXsvPRquKcidzuV/
	 M2ZzqE5kVhyqiziucYiampAad2H/JqiHjRrEbRFytWBBsD+5zjm8/rOjFP34xQziclHJc
	 C3Zjb1ept2lFeoxaVu8php/0zhSWjiB9ybdI7Kbs1ElrruzQjA7z4+lrGJ8XVAE5u9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537660;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=h56pUtpzKi6ZjI8yryE2jUzmVykN3g1PyuvGdZZmHnA=;
	b=RDWNpNi9jYzZ/E1d0PvPApAEWJuGbJOd4Fb6PCN+++3jkUh0dmV5sT94wJqcsZq1hFmG
	 +x+ipo3JZZDvVRxDhKJGugPuwFYyiqll5+wrP7CiDfUrut349+QRXY1nrfAuUl/pqflvd
	 Fihg8gqUKpAJR7DmgP9UI+YXHfwSVLly8yGU++PoMT1X1vTEcYY5dyJbHyV1dDLezuyKF
	 tqa/RpSvZ1ez/LFDdjZN528wqn4Fopakgwj6iTbuAitdvyE7XSf+pD1+mshNTIGj9x/nD
	 C7B/1WFN9/cPLcrhdzCHt0VWCP2YUhnU78fPAZ0SZF6Ws8aNul+w1zHbYZ2pqg/ljWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=BlcVNAk2;
	arc=none smtp.remote-ip=195.10.208.47
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453A606A326;
	Tue, 24 Nov 2026 16:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8453A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=BlcVNAk2
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4jYpBB61ktz3yS1;
	Tue, 24 Nov 2026 17:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795537650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h56pUtpzKi6ZjI8yryE2jUzmVykN3g1PyuvGdZZmHnA=;
	b=BlcVNAk2TMrd3fwRAAW4KXBDfq0uxcrx+9zwHeXtqv5buNZ326tXrLtW3sboBAV6QbJtdO
	Ti6FTShADfo0teCWKwtv7cc+F9ab9KjRDKL+yLv6paMCMOCZNPzl0PPHNUN0PeDPgUwrOO
	RgKCyyRvO6PalDwMAE4ZWmXOOg6r8IuAg5j1qNmz08q+oC69UqjEsM6lMKSYgFSUH08/hJ
	axf68VRaA/lrVf72R/4ot0rHQJrRuMiTMZPEblCkRrRoCwPrWi0xgm2FijnW5gHVvfSCAm
	tQ9glXC4WEJs8ER94g8KPYtIToM0hMmYNvp9uo5jNjpA+P1d4q+ouJwpbVQTBQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 3/4] ipv6: sample the route's serial during the lookup
Date: Tue, 24 Nov 2026 17:27:09 +0100
Message-ID: <773ec5346a43c3b6d9cd03e01569caea7043c577.1795537128.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795537128.git.ralf@mandelbit.com>
References: <cover.1795537128.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jYpBB61ktz3yS1

ip6_dst_check validates a dst against a cookie that its holder reads
with rt6_get_cookie after the lookup has returned. For routes without
their own sernum, this is the current fn_sernum of the route's node, so
a FIB change or xfrm policy insertion between the lookup and the read
pairs an old dst with a new serial, and the stale dst keeps passing
dst_check until another relevant change.

Sample that state during the lookup instead. ip6_pol_route and
ip6_pol_route_lookup read the IPv6 generation before walking the FIB
and, once the route and path are selected, the fn_sernum of the route's
node followed by the generation again. If the generation changed in
between, or the route was unlinked meanwhile, the selection may predate
the change and the sample is 0. Store the sample in struct fib6_result
and stamp every dst built from the result with it.

The sample covers the lookup in one table. With fib rules, the table is
selected before the first generation read, so a rule inserted while the
rules are evaluated can leave the lookup on the previous table with a
stamp that still validates. Closing that needs the generation read
before rule selection and passed down to the table lookups, which is
left for a follow-up.

Writers that change the selection without advancing the serial are not
covered either: deleting one route of an ECMP group makes fib6_del_route
rebalance the remaining ones without a new serial, and changing the
forwarding sysctl changes how gateways are scored without one, so a
lookup racing with either can keep its previous path. Both cases
predate this series.

Nothing uses the stamp yet, the following patch does.

Suggested-by: David Ahern <dsahern@kernel.org>
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
---
New in v5
- Replaces the lookup cookie API and its users from v4. (David)

 include/net/ip6_fib.h | 10 +++++++++
 net/ipv6/ip6_fib.c    |  4 ++++
 net/ipv6/route.c      | 49 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/include/net/ip6_fib.h b/include/net/ip6_fib.h
index 232289b439c3..75da95b2349b 100644
--- a/include/net/ip6_fib.h
+++ b/include/net/ip6_fib.h
@@ -208,6 +208,10 @@ struct rt6_info {
 	struct dst_entry		dst;
 	struct fib6_info __rcu		*from;
 	int				sernum;
+	/* fn_sernum of the route's node, sampled by the lookup that built
+	 * this dst, 0 if the lookup raced with a generation change
+	 */
+	u32				cookie;
 
 	struct rt6key			rt6i_dst;
 	struct rt6key			rt6i_src;
@@ -225,6 +229,12 @@ struct fib6_result {
 	u32			fib6_flags;
 	u8			fib6_type;
 	struct rt6_info		*rt6;
+	/* sampled by rt6_lookup_stamp: the IPv6 generation and the route
+	 * node's fn_sernum, both 0 if the generation changed during the
+	 * lookup
+	 */
+	int			gen;
+	u32			cookie;
 };
 
 #define for_each_fib6_node_rt_rcu(fn)					\
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..c94968a8fcbd 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -123,6 +123,10 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)
 	fib6_walkers_replace_leaf(net, rt, next);
 }
 
+/* The successful atomic_try_cmpxchg is fully ordered: it publishes the
+ * routing change before the new generation, and the new generation before
+ * the nodes stamped with it. rt6_lookup_stamp relies on both.
+ */
 static int fib6_new_sernum(struct net *net)
 {
 	int new, old = atomic_read(&net->ipv6.fib6_sernum);
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 98e3ca0644ab..8b98ee945c58 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1216,11 +1216,48 @@ static void ip6_rt_copy_init(struct rt6_info *rt, const struct fib6_result *res)
 		rt->rt6i_flags |= RTF_GATEWAY;
 	}
 	rt6_set_from(rt, f6i);
+	rt->cookie = res->cookie;
 #ifdef CONFIG_IPV6_SUBTREES
 	rt->rt6i_src = f6i->fib6_src;
 #endif
 }
 
+static int rt6_lookup_gen(const struct net *net)
+{
+	/* the acquire pairs with the full barrier in fib6_new_sernum */
+	return atomic_read_acquire(&net->ipv6.fib6_sernum);
+}
+
+/* Record in @res the state the selected route was found under: the
+ * generation read by rt6_lookup_gen and the fn_sernum of the route's
+ * node. If a FIB change advanced the generation during the lookup, the
+ * selection may predate it, so record 0, which never validates.
+ */
+static void rt6_lookup_stamp(const struct net *net, struct fib6_result *res,
+			     int gen)
+{
+	bool linked;
+	u32 cookie;
+
+	/* a route unlinked by a concurrent deletion has no node left, so no
+	 * dst built from it should validate: treat it like a generation change
+	 */
+	linked = fib6_get_cookie_safe(res->f6i, &cookie);
+
+	/* keep the FIB and fn_sernum reads before the final generation read,
+	 * pairs with the full barrier in fib6_new_sernum
+	 */
+	smp_rmb();
+	if (unlikely(!linked || rt_genid_ipv6(net) != gen)) {
+		res->gen = 0;
+		res->cookie = 0;
+		return;
+	}
+
+	res->gen = gen;
+	res->cookie = cookie;
+}
+
 static struct fib6_node* fib6_backtrack(struct fib6_node *fn,
 					struct in6_addr *saddr)
 {
@@ -1291,8 +1328,11 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 	struct fib6_result res = {};
 	struct fib6_node *fn;
 	struct rt6_info *rt;
+	int gen;
 
 	rcu_read_lock();
+	/* read before walking the FIB, rt6_lookup_stamp checks it again */
+	gen = rt6_lookup_gen(net);
 	fn = fib6_node_lookup(&table->tb6_root, &fl6->daddr, &fl6->saddr);
 restart:
 	res.f6i = rcu_dereference(fn->leaf);
@@ -1311,11 +1351,13 @@ INDIRECT_CALLABLE_SCOPE struct rt6_info *ip6_pol_route_lookup(struct net *net,
 		dst_hold(&rt->dst);
 		goto out;
 	} else if (res.fib6_flags & RTF_REJECT) {
+		rt6_lookup_stamp(net, &res, gen);
 		goto do_create;
 	}
 
 	fib6_select_path(net, &res, fl6, fl6->flowi6_oif,
 			 fl6->flowi6_oif != 0, skb, flags);
+	rt6_lookup_stamp(net, &res, gen);
 
 	/* Search through exception table */
 	rt = rt6_find_cached_rt(&res, &fl6->daddr, &fl6->saddr);
@@ -2278,10 +2320,16 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 	struct rt6_info *rt = NULL;
 	bool have_oif_match;
 	int strict = 0;
+	int gen;
 
 	WARN_ON_ONCE((flags & RT6_LOOKUP_F_DST_NOREF) &&
 		     !rcu_read_lock_held());
 
+	/* read before the forwarding mode and the FIB, rt6_lookup_stamp
+	 * checks it again
+	 */
+	gen = rt6_lookup_gen(net);
+
 	strict |= flags & RT6_LOOKUP_F_IFACE;
 	strict |= flags & RT6_LOOKUP_F_IGNORE_LINKSTATE;
 	if (READ_ONCE(net->ipv6.devconf_all->forwarding) == 0)
@@ -2296,6 +2344,7 @@ struct rt6_info *ip6_pol_route(struct net *net, struct fib6_table *table,
 	have_oif_match = fl6->flowi6_iif == LOOPBACK_IFINDEX &&
 			 oif == res.nh->fib_nh_dev->ifindex;
 	fib6_select_path(net, &res, fl6, oif, have_oif_match, skb, strict);
+	rt6_lookup_stamp(net, &res, gen);
 
 	/*Search through exception table */
 	rt = rt6_find_cached_rt(&res, &fl6->daddr, &fl6->saddr);
-- 
2.56.0

