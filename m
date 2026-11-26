Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656828;
	b=OuVlxhpijbcl/bbUhQ1nK1jiY43b927r16e23H1iSXqfQk/M95EFas+6UXdsOEL4Vb2p
	 DJO0Od6yBX8akcugfraMPK1uU6poueSIfTSbVCh1iDYbmnerhlH0q8a8AGpatt5Sfz3J5
	 nEE33SfmMzQFZfMo0nlz7jvpYOq05KzdQ615IXtwehivYAKaTG8/4P4ClTCWyIpNPaBuD
	 LlPpHMN5nO88nIGTEDHzQqcB/o0WJtK4xFEPZ7ZI8BGTjpVHO18bQBgJAFxBFkTnk5gcV
	 RT0vRbMJKyQ5ggLQ9+6wWgHQPA6mNljDw5/rgoxAgQZVQniu52XA8w3BRtz868sxixA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656828;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cpnBDjimsdADYM08pVcuu/Iys4YfPf46YFBDiH9clsA=;
	b=SL64ML9VRZlAKYiKk93F+6OKfhcmfB97avvpcRzDAhHxjRxkNiAkhuVoQda0FwoYL5J/
	 D2VJvAzS+x+cmsCQHXwk5SyIYZcM5w8ouudR97foO/h2Gh0goofYy3CjiBHEdMfmrRZQq
	 OFhjhfwTUMcVQeDo6fkhLKTiE17yFK3UpkTctfSnEZCrpfbNxUsnbFgKO4H9K6b/AlFsH
	 MuxZs8NmAsrTpcuMWMPxhfamMcZ16usY0d0OhicAYAWgMfRWBpHCHmw3M+uLxir1P1C5/
	 s5ZkoNqiYqlUiXx40QPhY3vT5JF9YC1g3wguFJMysOJJ7UdHgS6+o3lqI9Wab6eZlxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRB5V4ck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97924606A682
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DRB5V4ck
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16501F000EB;
	Thu, 26 Nov 2026 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656828;
	bh=cpnBDjimsdADYM08pVcuu/Iys4YfPf46YFBDiH9clsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DRB5V4ckDDUwMzLo6oiwLSzTerffwpdfM//EM2KcOa/jujs4gdulGH2bwS4jiFRy6
	 Qox1ugECGahgpuKErdJZlMoWV1RUDQMkmtA6gn3DZOkF2K8IOA258u4QMaDGTfoj63
	 ceupGDAfgvMZn7TDWIFFMbTSU+0UnFmXXfbr4dHqtoddScXcK1fsIiusCnWXA3JeBk
	 EReoMcRhIP3sBMvEmk/8bF/xWEletYccayO3jwiOA/P2fK7KoT24UTxTUc/C1alvnb
	 16yHBTwIMu3M3DE0xOfKRPTlRZ4dxTR5Zrg0xie2st4X/72LJDkQGUWJHPuqSuBrsa
	 6yy1W4H/TbF0A==
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
Subject: [PATCH net-next v2 03/13] ipv6: don't insert a PMTU exception whose MTU could not be stored
Date: Wed, 25 Nov 2026 18:33:29 -0700
Message-ID: <e158d506fc9aab4b823c28cc1a3bfcaff0e7f67b.1795642432.git.dahern@nvidia.com>
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

rt6_do_update_pmtu() sets the MTU of a dst with dst_metric_set(). A dst
shares the read-only metrics of its route until it needs its own, and
dst_metric_set() allocates writable ones with GFP_ATOMIC on first use,
doing nothing if that fails, without telling the caller.

For a PMTU update on a new exception the caller then goes on to insert
an exception that has no learned MTU, which lowers nothing, replaces
any exception for that destination that was there, and invalidates the
cached dsts of the nexthop. For an update on an existing exception the
reduction is lost while the stamp that keeps the exception alive is
refreshed.

Allocate the writable metrics in rt6_do_update_pmtu() and return an
error if that fails. Do not insert the new exception then, and release
it. For an exception that is already in use there is nothing to fall
back on, but nothing is claimed either: the next packet too big that
exceeds its MTU makes the update again.

The handlers that update a dst in place do not take a lock either, and
each one decides to lower the MTU from a value it read before. Storing
it unconditionally lets a handler that decided on 1400 overwrite a
1280 that another one stored in between. Lower the MTU with a compare
and exchange, so that it only ever goes down and a smaller value
stored meanwhile is kept.

Fixes: 45e4fd26683c ("ipv6: Only create RTF_CACHE routes after encountering pmtu exception")
Signed-off-by: David Ahern <dahern@nvidia.com>
---
 net/ipv6/route.c | 52 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 3337a8fe2550..52a30a62bcec 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1546,6 +1546,34 @@ static struct net *rt6_exception_net(const struct rt6_info *rt)
 	return container_of(rt->dst.ops, struct net, ipv6.ip6_dst_ops);
 }
 
+/* Lower the MTU in the metrics of @rt to @mtu.
+ *
+ * A dst shares the read-only metrics of its route until it needs its own.
+ * Allocating them can fail, and dst_metric_set() does not say: the PMTU would
+ * be lost.
+ *
+ * Only ever lower it, and with a compare and exchange: PMTU handlers update a
+ * dst in place without a lock, and each decides to lower the MTU from a value
+ * it read earlier, so storing unconditionally could overwrite a smaller value
+ * that another handler stored in between.
+ */
+static int rt6_lower_mtu(struct rt6_info *rt, u32 mtu)
+{
+	u32 *metrics = dst_metrics_write_ptr(&rt->dst);
+	u32 old;
+
+	if (!metrics)
+		return -ENOMEM;
+
+	old = READ_ONCE(metrics[RTAX_MTU - 1]);
+	do {
+		if (old && old <= mtu)
+			break;
+	} while (!try_cmpxchg(&metrics[RTAX_MTU - 1], &old, mtu));
+
+	return 0;
+}
+
 /* Remove rt6_ex from hash table and free the memory
  * Caller must hold rt6_exception_lock
  */
@@ -2913,13 +2941,23 @@ static void rt6_update_expires(struct rt6_info *rt0, int timeout)
 	rt0->rt6i_flags |= RTF_EXPIRES;
 }
 
-static void rt6_do_update_pmtu(struct rt6_info *rt, u32 mtu)
+static int rt6_do_update_pmtu(struct rt6_info *rt, u32 mtu)
 {
 	struct net *net = dev_net(rt->dst.dev);
+	int err;
+
+	/* If the MTU cannot be stored the PMTU would be lost and, for a new
+	 * exception, an exception would be inserted that does not lower
+	 * anything.
+	 */
+	err = rt6_lower_mtu(rt, mtu);
+	if (err)
+		return err;
 
-	dst_metric_set(&rt->dst, RTAX_MTU, mtu);
 	rt->rt6i_flags |= RTF_MODIFIED;
 	rt6_update_expires(rt, READ_ONCE(net->ipv6.sysctl.ip6_rt_mtu_expires));
+
+	return 0;
 }
 
 static bool rt6_cache_allowed_for_pmtu(const struct rt6_info *rt)
@@ -2960,7 +2998,11 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 		return;
 
 	if (!rt6_cache_allowed_for_pmtu(rt6)) {
-		rt6_do_update_pmtu(rt6, mtu);
+		/* If the update cannot be made, the next packet too big that
+		 * exceeds this dst's MTU triggers it again
+		 */
+		if (rt6_do_update_pmtu(rt6, mtu))
+			return;
 		/* update rt6_ex->stamp for cache */
 		if (rt6->rt6i_flags & RTF_CACHE)
 			rt6_update_exception_stamp_rt(rt6);
@@ -2998,8 +3040,8 @@ static void __ip6_rt_update_pmtu(struct dst_entry *dst, const struct sock *sk,
 
 		nrt6 = ip6_rt_cache_alloc(&res, daddr, saddr);
 		if (nrt6) {
-			rt6_do_update_pmtu(nrt6, mtu);
-			if (rt6_insert_exception(nrt6, &res))
+			if (rt6_do_update_pmtu(nrt6, mtu) ||
+			    rt6_insert_exception(nrt6, &res))
 				dst_release_immediate(&nrt6->dst);
 		}
 out_unlock:
-- 
2.54.0 (Apple Git-157)

