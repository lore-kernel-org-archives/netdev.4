Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167409;
	b=lwP1qAxNGft57DMKGwz4frtV/HCpe7e0e7obSFTJF2iZb4ZZV0gNlqy4ZFWIMuPTJlkw
	 lRx4nJA3dSH9CmVcGWJEwilFmF0/5bEqVElDTzcGTHVHLK+CJ76Msc/sxzH/RFlBah+Cm
	 pbqwpqw4NNMpafZuQMi5gTiJeE+IkZitq23yXa52LIhi2oYrHTbl9EAhobKu1DEE2cXrc
	 WelTVD5yGS7xmAUo0F5n69tirhsmmFALK3YQTgYe96u1WSHXw3HEyLA/+3+d/x8ZTq62f
	 9zLiI24vGfOGRBuDlRDNx81EK6lTvZ9B7r9zMM2d0U7vBSJtVsgO7Ceh436ewQtAc2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167409;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=XLgzlk4p9xjRE5TUAfyAN9GaJ2qtaw8YbL6A1PquV84=;
	b=LVpxrmGSlK2xHJ1mB3kFLwL/wG5mhCOk6+LioMAswT7pjzrNAllmULpU4t/ibx7kvSzM
	 0F994dI9MT5xhqrrOrdqSjOUbV+0J2ekO04o+m8U0N0R2Yu8v2L0jcNiD69cTCJBkW/W1
	 7dj4DnyaW4zcSPnLXVGtXIWUQjawm35nKzUQTiPC33xJmKV4TUZLFAyJBQI9uitVTZpa2
	 0kemtTcx1JrQOs4yWkuo/thcg313g1g5A2lERU+BHwxlfNuNrf3ct2mVbA0sulfeNjvz+
	 2/OglwQgsi6ShzmUayiN9GlmLq6AEzPX9nWUZ7NVU235xrWiEF9nokCZBtS/3gtXFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=whxJmxP3;
	arc=none smtp.remote-ip=195.10.208.61
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F341606A331;
	Fri, 20 Nov 2026 09:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F341606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=whxJmxP3
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4jW9G43LSwzLmQ5;
	Fri, 20 Nov 2026 10:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795167404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XLgzlk4p9xjRE5TUAfyAN9GaJ2qtaw8YbL6A1PquV84=;
	b=whxJmxP3cHbhscH7MtEj9roIhnbPG1m0qr1hjK610eAQTMfxmQnqp4tX7NkeOcqlE3gxfR
	t94TLMclN706w8S35rI70PnnH6P10GsdheyVl5lZxoCX9RAFWqlDgXMAzbpmcTAfql+PVE
	p/BM0H0hXTKtnDXuKJZSqwRGIkIaBDdwwpThznmi2oF6p9MxhyA7Y7PoyTA50V/5xmFRX2
	E/BRR5MTlXfYs05qogjivtaE1PGCKQLd/dQkKz0yqURGTORzfViuKPN1KDKhc40XaTBVya
	X2IfdDwi9VmxW2XUN0w1iukRkJpWkp5iM4tSqCxZyHyQqz7xwWjdlc3IFZ1VCA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 4/5] ipv6: add ip6_dst_lookup_flow_cookie
Date: Fri, 20 Nov 2026 10:36:19 +0100
Message-ID: <65536a8e6733b8fb94614de2e104548a921a52dd.1795166508.git.ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795166508.git.ralf@mandelbit.com>
References: <cover.1795166508.git.ralf@mandelbit.com>
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
X-Rspamd-Queue-Id: 4jW9G43LSwzLmQ5

Persistent dst caches read the validation cookie with rt6_get_cookie
after route lookup has returned. For routes without their own sernum,
this reads the current fn_sernum of the associated node. A concurrent
FIB change or xfrm policy insertion can therefore pair an old dst with a
new serial, allowing subsequent dst_check calls to accept the stale
result until another relevant change.

Add ip6_dst_lookup_flow_cookie to return the dst together with its
validation cookie. Like ip6_dst_lookup_flow, it performs the route
lookup followed by the xfrm policy lookup. Sample the cookie between two
reads of the IPv6 generation and return cookie 0 if the generation
changed. Both FIB changes and xfrm policy insertion advance the
generation. This lets the route dst serve the current packet while
preventing its subsequent reuse through cache validation. For dsts of
routes using nexthop objects, return the generation read before the
lookup, which ip6_dst_check compares with rt->sernum. xfrm bundles
retain their existing validation through their own route and path
cookies.

The generation checks rely on writers publishing routing changes before
advancing the generation, and advancing it before stamping the nodes.
Both follow from the fully ordered atomic_try_cmpxchg in
fib6_new_sernum. Document this there and name it as the pairing side of
the read barriers in the helper.

The following patch converts selected socket cache users, while other
persistent caches are left for follow-up conversions.

Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
Changes since v3 https://lore.kernel.org/netdev/7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com/
- Move the writer ordering and the ip6_dst_check change to separate
  patches. (David)
- Say in the kdoc that the helper performs the xfrm policy lookup.
  (David)
- Narrow the kdoc to changes that advance the IPv6 generation. (Sashiko)
- Document the full ordering of fib6_new_sernum and name it as the
  pairing side of the read barriers. (Xia)

Changes since v2 https://lore.kernel.org/all/e48cac0cdf9f3adcedecbbfff4a314a98bc22d01.1794384146.git.ralf@mandelbit.com/
- Move the serial update after rt6_multipath_rebalance in fib6_ifup and
  fib6_ifdown. (Sashiko)
- Clarify that this introduces the new API while the following patch
  converts *some* users to it while leaving the rest as follow-up.

Changes since v1 https://lore.kernel.org/netdev/e40f48e925a0950eac99a3f084e485e82cabe88f.1793806941.git.ralf@mandelbit.com/
- Fix kdoc return statement in ip6_dst_lookup_flow and
  ip6_dst_lookup_flow_cookie. (NIPA)

 include/net/ipv6.h    | 13 ++++++++++
 net/ipv6/ip6_fib.c    |  4 +++
 net/ipv6/ip6_output.c | 57 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index b77dc5c3ea26..ddeca746c991 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1062,6 +1062,11 @@ int ip6_dst_lookup(struct net *net, struct sock *sk, struct dst_entry **dst,
 #if IS_ENABLED(CONFIG_IPV6)
 struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, struct flowi6 *fl6,
 				      const struct in6_addr *final_dst);
+struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
+					     const struct sock *sk,
+					     struct flowi6 *fl6,
+					     const struct in6_addr *final_dst,
+					     u32 *cookie);
 #else
 static inline struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk,
 						    struct flowi6 *fl6,
@@ -1069,6 +1074,14 @@ static inline struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struc
 {
 	return ERR_PTR(-EAFNOSUPPORT);
 }
+
+static inline struct dst_entry *
+ip6_dst_lookup_flow_cookie(struct net *net, const struct sock *sk,
+			   struct flowi6 *fl6, const struct in6_addr *final_dst,
+			   u32 *cookie)
+{
+	return ERR_PTR(-EAFNOSUPPORT);
+}
 #endif
 
 struct dst_entry *ip6_sk_dst_lookup_flow(struct sock *sk, struct flowi6 *fl6,
diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..1915d31136d6 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -123,6 +123,10 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)
 	fib6_walkers_replace_leaf(net, rt, next);
 }
 
+/* The successful atomic_try_cmpxchg is fully ordered: it publishes the
+ * routing change before the new generation, and the new generation before
+ * the nodes stamped with it. ip6_dst_lookup_flow_cookie relies on both.
+ */
 static int fib6_new_sernum(struct net *net)
 {
 	int new, old = atomic_read(&net->ipv6.fib6_sernum);
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 3cc911f6618e..083ffdc8f404 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1279,8 +1279,7 @@ EXPORT_SYMBOL_GPL(ip6_dst_lookup);
  *
  *	This function performs a route lookup on the given flow.
  *
- *	It returns a valid dst pointer on success, or a pointer encoded
- *	error code.
+ *	Return: a valid dst pointer on success or a pointer encoded error code.
  */
 struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, struct flowi6 *fl6,
 				      const struct in6_addr *final_dst)
@@ -1300,6 +1299,60 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
 }
 EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
 
+/**
+ *	ip6_dst_lookup_flow_cookie - perform route and xfrm policy lookup on
+ *				     flow and return the matching dst cookie
+ *	@net: Network namespace to perform lookup in
+ *	@sk: socket which provides route info
+ *	@fl6: flow to lookup
+ *	@final_dst: final destination address for the xfrm policy lookup
+ *	@cookie: where to store the cookie for the returned dst
+ *
+ *	Same as ip6_dst_lookup_flow, but also returns the cookie describing
+ *	the routing state the dst was obtained from. A caller caching the dst
+ *	should use this cookie when validating it with dst_check. If a FIB
+ *	change or an xfrm policy insertion advanced the IPv6 generation during
+ *	the lookup, a route dst no longer validates with it. Route deletion
+ *	does not advance the generation. An xfrm bundle is validated by xfrm
+ *	and ignores the cookie.
+ *
+ *	Return: a valid dst pointer on success or a pointer encoded error code.
+ */
+struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
+					     const struct sock *sk,
+					     struct flowi6 *fl6,
+					     const struct in6_addr *final_dst,
+					     u32 *cookie)
+{
+	const struct rt6_info *rt;
+	struct dst_entry *dst;
+	int gen0, gen1;
+
+	gen0 = rt_genid_ipv6(net);
+	/* read the generation before looking at the FIB or xfrm policies,
+	 * pairs with the full barrier in fib6_new_sernum
+	 */
+	smp_rmb();
+
+	dst = ip6_dst_lookup_flow(net, sk, fl6, final_dst);
+	if (IS_ERR(dst))
+		return dst;
+
+	rt = dst_rt6_info(dst);
+	*cookie = rt->sernum ? gen0 : rt6_get_cookie(rt);
+
+	/* keep the FIB and cookie reads before the final generation read,
+	 * pairs with the full barrier in fib6_new_sernum
+	 */
+	smp_rmb();
+	gen1 = rt_genid_ipv6(net);
+	if (unlikely(gen0 != gen1))
+		*cookie = 0;
+
+	return dst;
+}
+EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow_cookie);
+
 /**
  *	ip6_sk_dst_lookup_flow - perform socket cached route lookup on flow
  *	@sk: socket which provides the dst cache and route info
-- 
2.56.0

