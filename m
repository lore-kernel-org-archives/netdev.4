Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968945;
	b=Jhh6hQ6b5FT6SiJb3ebmVvQ9WYYKOg6y7EHrEuxTIxSt+YimGeBqyUm91yyqR98OKRAW
	 x5vKR2ZahAArR0kOw1/T4RD9wS0qTnHHMfKxsBlEe6aKELKIZcJz8x4D5ymUwj5CdkImT
	 0F8NGLxkejQuiL3PVApFzK/rQ0+3XV6XBOsc7IQjQBqulHz8hsp754sLRpmtwG1CZ+MwW
	 gI3oQrMgy5RdIRJoAyijPu0ZxEGmtFyudyMOttjxfbEaod8n20qZLfLobqe6+cMScW2BR
	 Skce/1gvfzEy6AVUFK9DQJcqhldC4/4WOMTTKo2BwxRU44SIwdyt7+RhznrCbSX2W3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968945;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=xNNsaqZWbltLe29vh8c9m5LEUiW5nYXhMDb/b7gjjVM=;
	b=oT8O7/7/gwIIxwMU2l+V35C+qRVEaXgZLhTT2G17g4YVmATBTQg26zMl7uEe4F6DQU9g
	 B5jdQahdqwOnTaxUNsby4bp9SZ4Eqlgtn3ZLcBkGH30enV2y1gcqSZ/ABpFoPniXtkoxP
	 ubjZjZPYMMMziWpaBJHv/j4WekhHpYSBT90udFSJbWrleJ5rxJ5++a2l6/vQlUUSXdDLV
	 rcVKTZ3/TQFe58HUteN9n4nwCGSKOJnhCVT26Tq6oJgWjf3BbTTDFg8B8sOMQUiMDCsWA
	 pM6v0zGEnLbdmsKXYTX5BxRMz7VrrX72lvHFkX6NCgF0o/1Ry2QAD/VMJ5JMiKMz0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YolnICRs;
	arc=none smtp.remote-ip=95.215.58.132
Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80DA606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80DA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YolnICRs
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cpNaD7ZH3vjTO9Ho6qnhSNnvPor2Oyo++l4ViMHdDtg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794968942; v=1; x=1795573742;
 b=YolnICRsqNq/Q1E18JzTG5dK264mWoJjH1UfMjLHv+O5cY+5gcCvTc8559G/tyjcbeUtIsU5
 mC4FnzZ3558DVhAJmqPm4SiJ9p1GxuwGQmO8wHWby0QuZF7j1azm5bg8jvo8EhZWUkIDchX6/02
 d3r4kUGkD+8+6TxgOfSdNMrk=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3bc377a770cd0a92;
	Wed, 18 Nov 2026 02:29:02 +0000
X-Mizu-Trace-ID: 3bc377a770cd0a92
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Tue, 17 Nov 2026 21:28:31 -0500
Subject: [PATCH net-next v4 2/4] ipv6: take fib6_sernum from a sequence
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
Message-Id: <20261117-bug-net-netns-move-rcu-barrier-v4-2-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev>
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
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
tb6_lock, so two tables of one netns can store their values in either
order, and fib6_sernum is no longer monotonic per netns. It is only
compared for equality, so this costs at most an extra invalidation.

A connected UDP socket in netns A caches a route through an IPv6 nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added to
and removed from B 0 to 20 times before the move, 63 trials:

                                     before   after   change
  trials sending after move (count)       2       0    -100%
  datagrams sent after move (count)    4399       0    -100%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/ipv6/ip6_fib.c | 16 +++++++++++++---
 net/ipv6/route.c   |  6 +++++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab0..827051cbf7482 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -123,13 +123,23 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)
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
 static int fib6_new_sernum(struct net *net)
 {
-	int new, old = atomic_read(&net->ipv6.fib6_sernum);
+	int new, old = atomic_read(&fib6_sernum_seq);
 
 	do {
-		new = old < INT_MAX ? old + 1 : 1;
-	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
+		new = old < INT_MAX ? old + 1 : 2;
+	} while (!atomic_try_cmpxchg(&fib6_sernum_seq, &old, new));
+	atomic_set(&net->ipv6.fib6_sernum, new);
 
 	return new;
 }
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

