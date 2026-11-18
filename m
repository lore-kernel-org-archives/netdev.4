Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968926;
	b=Djkr6qu00JA9G9SxB/xcJmbB0XDUTGN1gXYTklYuF5HWBdFxRI+E5bi9fQ9JbkmOgpBR
	 zuafrnMnzw25Krt0RK8ExilIENG4MhCt+MQK2PcWTYTYC68yp1+1DUHPvhzfua70na0Kw
	 tC5CmL18hx+o1Xr6Lf/iP8Jo+K+0c7fPscaNaiKv7mQ4HYG1jcfv2H3nluRRxvy3upg3v
	 5FlFpdhOhRISmDkKX9jKLFc7+QW/AkZam2AfuZ1jlgpW/xwpc8V7suNTNFIFv8ap8IZQZ
	 X+K4KoUG0N0KMtQwStSMpurlh/KGzym63B0a7+t7ZWTKkyTXThVmk6K394D3IPu2Shw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968926;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=MVzqKWZhRoE5mRJCz9JflE99rvHYZRCkgR4ECNB+82o=;
	b=dbIZbldlamGSfVMP7e5urhhFNy0J4qckaJUnFqlXNZrXJbkFQ4YAIpOQCRLJiHAFYjCD
	 QtnqrZXamrp953GJKaCBypT3Uj76QfuozcknetqKyBNuS1SLXCvQetqKrTPA57M3Ww95d
	 EM9L6715ptIs8UJjDmHoAkrKgaf2la/jJ40q3YieafmE4Aogdutya5Et4urN0MYNGjGiw
	 5smpODdT0LnMmHlMveQ25MeIlzn9Y9j+k9WdrG/okEZJCCmFECr1tI6JXIk+n/mPaPSxM
	 Esth2aGb22Q95+j8dz/q+Uv/nXjE+aJNm0VuHHRpkXDa/pTc0lIbHNqZFNPPCb5LN1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mUawUbaM;
	arc=none smtp.remote-ip=91.218.175.168
Received: from mta0.migadu.com (out-168.mta0.migadu.com [91.218.175.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF817606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF817606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mUawUbaM
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JUGWRc69vze+A3WszTmo6LTcDQYK71WLYUUAEhHlPPU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794968922; v=1; x=1795573722;
 b=mUawUbaMZxsLubp1TIu7vJchq2uXMDS9S5aiWGR8BS3h//pqnaeEEWGoIzJYs3Vd69A93U7N
 x1hjUPkJr/OtWXzWhrNL0+7+kUGPaZieOXymq289VoDte0brol38wdoR7+0KTI/sd42BIr3TgHy
 oXLyy7EYsLbIp5thzfAv13W0=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0afb058178fd23c1;
	Wed, 18 Nov 2026 02:28:42 +0000
X-Mizu-Trace-ID: 0afb058178fd23c1
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Tue, 17 Nov 2026 21:28:30 -0500
Subject: [PATCH net-next v4 1/4] ipv4: draw rt_genid from a sequence shared
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
Message-Id: <20261117-bug-net-netns-move-rcu-barrier-v4-1-43e1ca0aac7f@linux.dev>
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
either.
Concurrent bumps of one netns can leave the older of two values, so
rt_genid is no longer monotonic per netns. It is only compared for
equality, so this costs at most an extra route lookup.

A connected UDP socket in netns A caches a route through a nexthop
object on a veth. The veth is moved to netns B and brought up with one
RTM_NEWLINK, then the socket sends 200000 datagrams. B's rt_genid is
bumped 0 to 20 times before the move, 63 trials:

                                     before   after   change
  trials sending after move (count)       1       0    -100%
  datagrams sent after move (count)     661       0    -100%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 include/net/net_namespace.h |  5 +----
 net/ipv4/route.c            | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

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
index b9f5397336d34..294c9c278c403 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -393,6 +393,27 @@ static inline int ip_rt_proc_init(void)
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
+void rt_genid_bump_ipv4(struct net *net)
+{
+	int genid;
+
+	do {
+		genid = atomic_inc_return(&rt_genid_seq);
+	} while (!genid);
+	atomic_set(&net->ipv4.rt_genid, genid);
+}
+EXPORT_SYMBOL_GPL(rt_genid_bump_ipv4);
+
 static inline bool rt_is_expired(const struct rtable *rth)
 {
 	bool res;

-- 
2.43.0

