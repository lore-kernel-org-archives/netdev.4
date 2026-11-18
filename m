Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968951;
	b=BgPzfCGbDCnFRglui+EBclQ1KioZSVmaAuIwLrNVUViuuN2FoGvay7ZqJ08aP2GOsZok
	 E+q9x+Zlne1U4e0FOfMahq4vp1kEFj6p7j6KpV4i4dwpVW/sKBelJGeAD9c/Pk8/rksre
	 R1LD1hnhrvd1YKvlMjX5ylYTiwysYsovMr7M8b3UU9tqVDE0e4GKVw37SNiVdIxw/hovz
	 y+nWuVnjEcc4YYzUvbJ2eaHPGJtjg6loIDtXa24CB+Ly/2Jen0rK0w6UQ0pVRti/TwF0w
	 84x+AEs+tBoXJBp5cb/s0otNtdQmvuKj4XCnkG2OWsqYtSsfjW52FHsLqSXRSSHPZTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968951;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=cPxS1SkmvsscQRV5MYIa8akRylBV+jAccSMpvpxeFnk=;
	b=a9PiZGHFDf+Wg3RhurSONjJJ72fYsrDOrEyOWJGj99yzy9oeXr3xd0nKjD1bLWGJr8E/
	 5gbt7o+5D9uabYfthqnrmuLGu2KdvKV5FNReKH9C6msHpRXYpGNGN7nZqqtG/q4cIr+0n
	 ecas6V7g3sc57CNYRLwoG2SuCkhJmFLH6mTskXRNzL9VXS6UCe/LRGNDYeRklX4tsKcVa
	 lMW7Gwc7MCUJpxQyrysW6s6cuKRejU/QTfDhTQKoGiZnnU5LSOkzGyfZLOGYJQZ6+FX8v
	 1DtgIShHpCNqSqO2WW9/bdjqJ6EgEgI58OkgRJNTLnK1HcLbFGErt0mLgn/3/2Vgmlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=no5g0K7t;
	arc=none smtp.remote-ip=95.215.58.137
Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8F606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC8F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=no5g0K7t
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j8FO9OwvBDhGPbMXs2woLTjOBZA6uj/qJHh1sSWVpWM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794968949; v=1; x=1795573749;
 b=no5g0K7tHxBWwUm3C9JV9oF1vpaT4TWbGOOTottJnqjyQP7uXYxQZ6UZ4jlcDVP8IAeQLvi4
 Qw0EpSfNPdE+HYMVct2GrjFItHi6LPHNYBz/+CM79xv2dIrK6TMxPjAzPU9h0Wd3jKvzDliz75k
 GEBYDKxeJ7mYlJtdZraJGVmc=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5391049313abef4a;
	Wed, 18 Nov 2026 02:29:09 +0000
X-Mizu-Trace-ID: 5391049313abef4a
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Tue, 17 Nov 2026 21:28:32 -0500
Subject: [PATCH net-next v4 3/4] nexthop: release cached routes when a
 nexthop leaves a group
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261117-bug-net-netns-move-rcu-barrier-v4-3-43e1ca0aac7f@linux.dev>
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

When a nexthop is removed while other members keep its group alive, only
the group array changes: the routes through the group stay in the FIB,
and the dsts they cached through the removed nexthop are released when
that nexthop is freed, from an RCU callback.

Until then those dsts stay valid. IPv6 route exceptions, such as the
ones created on Packet Too Big, are checked against the cookie of their
FIB node, which does not change, so a socket keeps sending through the
removed nexthop. When the nexthop goes away with its device, removing
the device's IPv6 addresses usually flushes the routing tree first, but
not when the device carries no IPv6 address.

Once all readers see the new group arrays, release the per-cpu routes and
exceptions of a removed IPv6 nexthop, as replacing a group already does
for its old members, and flush the IPv4 route cache once if any of the
groups carries IPv4 routes. The routes using the nexthop directly are
already gone at that point.

A connected UDP socket in netns A sends to a route through group {nh 1,
nh 2}, on an IPv6 exception of nh 1 created by Packet Too Big, while nh 1
is deleted. Datagrams still sent through nh 1 after the new group is
published and before nh 1 is freed, 10 trials, median and range, the
ones left after the change being sent before the dsts are released:

                     before (datagrams)   after (datagrams)   change
  per trial            1140 (367-3788)            1 (1-3)      -99.9%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/ipv4/nexthop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 42e55b5a755ee..3fccd4f2f916b 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -2116,6 +2116,7 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 	struct nh_grp_entry *nhge, *tmp;
 	LIST_HEAD(deferred_free);
 	bool need_flush = false;
+	struct nh_info *nhi;
 
 	/* If there is nothing to do, let's avoid the costly call to
 	 * synchronize_net()
@@ -2130,6 +2131,20 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
 	/* make sure all see the newly published array before releasing rtnl */
 	synchronize_net();
 
+	/* Routes through the groups can still hold dsts cached through @nh,
+	 * which are only released when @nh is freed. Release them now that
+	 * no reader can pick @nh from the old groups any more.
+	 */
+	nhi = rtnl_dereference(nh->nh_info);
+	if (nhi->family == AF_INET6)
+		fib6_nh_release_dsts(&nhi->fib6_nh);
+	list_for_each_entry(nhge, &deferred_free, nh_list) {
+		if (!list_empty(&nhge->nh_parent->fi_list)) {
+			rt_cache_flush(net);
+			break;
+		}
+	}
+
 	/* Now safe to free percpu stats — all RCU readers have finished */
 	list_for_each_entry_safe(nhge, tmp, &deferred_free, nh_list) {
 		list_del(&nhge->nh_list);

-- 
2.43.0

