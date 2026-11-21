Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303298;
	b=zxi3pbd9PoAO9bZAyua24odNT8/RLhjxd7kNF6vlM03mSedZr3oxF/b7VkHhCYxNmGct
	 oekaP7n4vj736J8fdRxoWRlHPF79dz9N9wBBvPuwvAa85iREN/0gBrT0xQqF32Jsz4l02
	 5JCMz1ArOKl7fkrWC7mEXQMK+cC0Z4jSee4wBA6QZ/2xfRfTIFXws/LGVwiY5rHTAWWCn
	 ziW9TVLJtlSJfU3Au27l5MKTV7f9lzey7cNTsHRTf3ZX1MCMrx6nLYMXkpZ7QU8DUofUM
	 zpASVeMD9B/XYgZqqGTNpm1ldZADJ9gnY79SvEqLveNJOqXI1rtWw0EtGljemvdQuxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303298;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=WqWQvGkWPd+0TqpWTmw1oriDkQ6wvnerzWbOi83HkgY=;
	b=hlQeDJEDKxpECRGn2+TZfRLjd06QotI5LyWKFlXgT7vXtQLXyNrAu+dZxzZLv6nnSGcN
	 ARd2jBnfMVJU+6Henf8iK7Zvvg79XRJlCmMIDvJZKasSkWw5/qm0ImSzW8WYaq9lEqpEo
	 UMSJg0Wlfw2eberR1pdnCKunwiLiGaB1FE3lqcVucB5Y4Krxk2CrGoUHBnAOH+hAeNYon
	 LE0zit8sdApkQC8nMKNH4T/HhqGCbOrrzLaViAel2P2TgsoRaWGt3lsRTJhaI508ia3UD
	 fpX7kDpVUYuGbwj+acoiezHEB+ufbYkP2+7GZUs6arM3qX5Yid2TZ+9/bHto2jr/KEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EAWXAU6P;
	arc=none smtp.remote-ip=95.215.58.9
Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266D606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2266D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EAWXAU6P
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=GNxMHNhRI9kjhozZi5ARCVY2OmD8h9tpOu+9lhr1rvs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795303295; v=1; x=1795908095;
 b=EAWXAU6PCOyr5Rne97llYqGyuHCev1DqaaekynDfJ59jZ8de4sErkO5q3lyyJ6BRnot/XN1m
 4ejknXZvUyO2FHeu/gUtvWIV6own1MlrfkQ44DnP8wW+WhTzdhy7ExqXoWD+mho78IYnWEwUurD
 UR6pC/83Pl+iAji0opDVja00=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 25c397f5e1f87c6d;
	Sat, 21 Nov 2026 23:21:35 +0000
X-Mizu-Trace-ID: 25c397f5e1f87c6d
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 21 Nov 2026 18:21:19 -0500
Subject: [PATCH net-next v5 1/4] ipv4: draw rt_genid from a sequence shared
 by all netns
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-bug-net-netns-move-rcu-barrier-v5-1-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Ralf Lici <ralf@mandelbit.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

An IPv4 route records the rt_genid of the netns it was created in, and
rt_is_expired() compares it with the rt_genid of the netns its device
belongs to when the route is checked. Every netns starts its rt_genid
at 0 and increments it on each cache flush, so different netns often
hold the same value.

When a device moves to another netns, routes cached through it remain
usable until dst_dev_put() points them to blackhole_netdev. For a route
using a nexthop object this happens in nexthop_free_rcu(), which
free_fib_info_rcu() queues from inside an RCU callback, so the
rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
the rt_genid of the new netns matches the cached one in that window,
ipv4_dst_check() accepts the route and a socket in the old netns keeps
sending through a device that now belongs to another netns.

Take every rt_genid bump from one sequence shared by all netns, which
never hands out 0, the value every netns starts with. Inserting a route
bumps rt_genid, so the routes a netns caches carry values drawn from the
sequence, which no other netns holds until it wraps after 2^32 bumps. A
moved device sends again only once it is up in its new netns, and
NETDEV_UP flushes the route cache there, so that netns no longer holds 0
either. Publish each value with a cmpxchg on the rt_genid of the netns,
drawing again if another bump changed it first, so that a bump stalled
between drawing and publishing cannot overwrite a newer value and
rt_genid stays monotonic per netns.

A connected UDP socket in netns A caches a route through a nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. B's rt_genid is
bumped 0 to 20 times before the move, 63 trials:

                                     before   after   change
  trials sending after move (count)       2       0    -100%
  datagrams sent after move (count)    1045       0    -100%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 include/net/net_namespace.h |  5 +----
 net/ipv4/route.c            | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
index 4a4d72080acdc..11133ba130480 100644
--- a/include/net/net_namespace.h
+++ b/include/net/net_namespace.h
@@ -558,10 +558,7 @@ static inline int rt_genid_ipv6(const struct net *net)
 }
 #endif
 
-static inline void rt_genid_bump_ipv4(struct net *net)
-{
-	atomic_inc(&net->ipv4.rt_genid);
-}
+void rt_genid_bump_ipv4(struct net *net);
 
 extern void (*__fib6_flush_trees)(struct net *net);
 static inline void rt_genid_bump_ipv6(struct net *net)
diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index d0930ae4c5ae6..ece931f7d9e4d 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -393,6 +393,42 @@ static inline int ip_rt_proc_init(void)
 }
 #endif /* CONFIG_PROC_FS */
 
+/*
+ * Draw rt_genid bumps from one sequence shared by all netns. A route keeps
+ * the genid of the netns it was created in, and is checked against the netns
+ * its device is in now, so distinct values make that check fail once the
+ * device has moved. Every netns starts at 0, which the sequence never hands
+ * out, and inserting a route bumps the genid, so cached routes carry values
+ * drawn from the sequence.
+ */
+static atomic_t rt_genid_seq;
+
+static int rt_genid_draw(void)
+{
+	int genid;
+
+	do {
+		genid = atomic_inc_return(&rt_genid_seq);
+	} while (!genid);
+
+	return genid;
+}
+
+/*
+ * Publish the drawn value with a cmpxchg on the netns genid, drawing again if
+ * another bump got there first, so that a stalled bump never overwrites a
+ * newer value and each bump is ordered after the ones it replaces.
+ */
+void rt_genid_bump_ipv4(struct net *net)
+{
+	int genid, old = atomic_read(&net->ipv4.rt_genid);
+
+	do {
+		genid = rt_genid_draw();
+	} while (!atomic_try_cmpxchg(&net->ipv4.rt_genid, &old, genid));
+}
+EXPORT_SYMBOL_GPL(rt_genid_bump_ipv4);
+
 static inline bool rt_is_expired(const struct rtable *rth)
 {
 	bool res;

-- 
2.43.0

