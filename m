Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303303;
	b=HEDWK8ws3bPxaetRsyDXrLnT9UGGUG4AhC5aqr7jOobG/R3pF50LhWseQVhownqLRRzN
	 3/0hfLcRIt/dOhYOHl+33tLkwnC7KjdUDslWyDc1jN9rCZOuCGoV5pR8N2D897q2nZdIV
	 N4pvGXVyFoLeEjHc0Ke8JjY1Xm2/pUb793eXrDc8fNzvzgJUUlz2686t77qWJYUEv5hvY
	 hFbBi1cVb0ZicmkJLE89JiIyfU1szCTFPER9JGx/DRfH9xw9wJAIE9H6f8GfS0SUyXeaZ
	 +UdwjrJA1pZBrfCL1Q8wTKKZ9gfYsjBNe8pDnvKTnGivO80CHxtGkyZ0uIisXGn+8jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303303;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Qyi/9ZzWIcwjyKbG6DREb3P6l5Kv2NVOsJQWAKjCwHk=;
	b=nohMjkyPN72iL+MJl0WD2D3mI7hMbLh7GG/wgJ/Sa2nAGlW6vdpL6xi0rOKdRvaVwq51
	 wwF47Lflo+Z4sbbPZFjRUm2zriVmR33DTtMSo5qKlEIs8fb3t/RfAUvgpug72MtwAbYxd
	 4ms1KZK/gDm24sBrdamjOHO8fU2q/T8r1qF/deddepE5medfy6VsmWrjLP0/FlmTcjcjN
	 iPbbUfoMRm9EEKqpnj7Btr3uwU3VXO9PC98dcoV2K3AiYY9ZEvzXIT6/NbF+IcdJ8Dhww
	 okfDq3X468LPHYTlbW9aK4UidA5h5ZqH1waB55bJfB4KUIkSiJwYe6hfKFlvbiKs2rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZoOqeNnc;
	arc=none smtp.remote-ip=91.218.175.29
Received: from mta0.migadu.com (out-29.mta0.migadu.com [91.218.175.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4A1606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4A1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZoOqeNnc
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FXG9/+uOSa9pGCyOSFGRZpF2RP3UjgNYjNCd6ZQHjNk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795303301; v=1; x=1795908101;
 b=ZoOqeNncaunvxmxxeFzI/bmuz9trllPpSjr/lnaYiud0Z5ZPvvs4ESAdrz27vvTJ+kQTVdEK
 4/SPWnML6wIFVqXjwCgqEgSg5atzF5ZBRg63ZSVnG7ApO74EzElJNh74MqqqQTcA2uNEzqcUQlm
 jpeZSUqhMWKB0Rli0NC6F1pE=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7db6ba311952e4e;
	Sat, 21 Nov 2026 23:21:40 +0000
X-Mizu-Trace-ID: f7db6ba311952e4e
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 21 Nov 2026 18:21:20 -0500
Subject: [PATCH net-next v5 2/4] ipv6: take fib6_sernum from a sequence
 shared by all netns
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
Message-Id: <20261121-bug-net-netns-move-rcu-barrier-v5-2-100a3b5d9090@linux.dev>
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

A per-cpu IPv6 route of a nexthop object records fib6_sernum of the
netns it was created in, and rt6_is_valid() compares it with fib6_sernum
of the netns its device belongs to when the route is checked. Every netns
starts its fib6_sernum at 1 and increments it on each tree change, so
different netns often hold the same value.

When a device moves to another netns, such a route remains usable until
nexthop_free_rcu() releases it, and fib6_info_destroy_rcu() queues that
callback from inside an RCU callback, after the device has moved. If the
fib6_sernum of the new netns matches the cached one in that window,
ip6_dst_check() accepts the route and a socket in the old netns keeps
sending through a device that now belongs to another netns.

Take every fib6_sernum bump from one sequence shared by all netns, which
only hands out values from 2 up, and have rt6_is_valid() reject 1, the
value every netns starts with: fib6_add() publishes a route before it
bumps fib6_sernum, so a route looked up in between can record 1. 0 still
means there is no sernum to check. Any other value a route records was
drawn from the sequence, which no other netns holds until it wraps after
2^31 bumps. fib6_new_sernum() callers only hold their own table's
tb6_lock, so bumps of one netns can race. Publish each value with a
cmpxchg on the fib6_sernum of the netns, drawing again if another bump
changed it first. As before, this orders the routing change before the
new value and the value before the nodes stamped with it, and keeps
fib6_sernum monotonic per netns.

A connected UDP socket in netns A caches a route through an IPv6 nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added to
and removed from B 0 to 20 times before the move, 63 trials:

                                     before   after   change
  trials sending after move (count)       3       0    -100%
  datagrams sent after move (count)    6634       0    -100%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/ipv6/ip6_fib.c | 28 +++++++++++++++++++++++++++-
 net/ipv6/route.c   |  6 +++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab0..71490edb01e99 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -123,12 +123,38 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)
 	fib6_walkers_replace_leaf(net, rt, next);
 }
 
+/*
+ * Draw fib6_sernum bumps from one sequence shared by all netns, so that a
+ * route cached against one netns does not match the sernum of another one,
+ * e.g. after its device moved, until the sequence wraps. Every netns starts
+ * at 1 and the sequence only hands out values from 2 up: 0 means no sernum
+ * to check.
+ */
+static atomic_t fib6_sernum_seq = ATOMIC_INIT(1);
+
+static int fib6_sernum_draw(void)
+{
+	int new, old = atomic_read(&fib6_sernum_seq);
+
+	do {
+		new = old < INT_MAX ? old + 1 : 2;
+	} while (!atomic_try_cmpxchg(&fib6_sernum_seq, &old, new));
+
+	return new;
+}
+
+/*
+ * Publish the drawn value with a cmpxchg on the netns sernum, drawing again if
+ * another bump got there first. The successful cmpxchg orders the routing
+ * change before the new sernum and the new sernum before the nodes stamped
+ * with it, and a stalled bump cannot overwrite a newer value.
+ */
 static int fib6_new_sernum(struct net *net)
 {
 	int new, old = atomic_read(&net->ipv6.fib6_sernum);
 
 	do {
-		new = old < INT_MAX ? old + 1 : 1;
+		new = fib6_sernum_draw();
 	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
 
 	return new;
diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4a4c5ace63c54..6731665fbb16d 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1466,7 +1466,11 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
 
 static bool rt6_is_valid(const struct rt6_info *rt6)
 {
-	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
+	/* Reject the initial sernum, which every netns shares and which a
+	 * route can record before its insertion bumps the sernum.
+	 */
+	return rt6->sernum != 1 &&
+	       rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
 }
 
 /* It should be called with rcu_read_lock() acquired */

-- 
2.43.0

