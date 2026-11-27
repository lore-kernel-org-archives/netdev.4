Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758179;
	b=hxm77V9Uu8YA3dkuUR3nNoMzBJI9WB6lX4L3PH2LmqbOl2vkpYW3/5drCz7GgXlYL/9D
	 7H6SGdZHfuH++ZsNPxqpnG75dPnv4qBoEnf5MaOtgZbZLHaA+r6C1mbsWR2lX2Nm4kUBE
	 HVfQF4QqxVv2vvx4pjH7rMCnmA91/vVwpKVs+FZ7Fj2wBDCrcEbER74XF8qMN2Wf7008P
	 g+x5vsd7q9ZNb8HrZXP1hVz5VVY8fvMj0pNgP2vY1uQ0oIQehyOSFr/GOFhrx945FbHyL
	 60DxGiy5vtyIUCZ4Sc1zexkzRvvS0rE7aXWom3QGQS+UtUaSTOQubjVsSkKGigKLXMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:In-Reply-To:
	 References:From:Date:Subject:To:Cc;
	bh=HGt0ju/M5SRQjRd2zHJjdz3pvevsYivTWnOfSUsqHSY=;
	b=3DW7vB5I79SSi/p/3RBQOo/FbX052ihHjGflIPIZF5Qux5or+oM/2m9CfqkmToPdKkak
	 cG2n8nxjcXY/33BskwGzl7FsiPqBasCraIBhEiMi9cyAo1O3NKYTL4ScF77+wWC3/bu5g
	 T47QOhE4zJNoV4KiEdHw+Hp3B50eUsH8/CTY7Nr++Wp0aUUMiDqfVNG7YwbxYHaS3kQgh
	 zhZAvrfvLuIYblSWSnabKF1k95PxkWokvW/XxZR+WtCzyaMEHoQdDKwlROaPT4XpT/Xo9
	 rwzfHEdDZo/cN5wV7Pgp7ydR8/ma5WFJlYwDHZWldjNlZtLmjuuOnZCNfwOGHCQRDig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0NoVJC+;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB8C606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T0NoVJC+
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3b52896ae66so320031a91.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758178; x=1796362978; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HGt0ju/M5SRQjRd2zHJjdz3pvevsYivTWnOfSUsqHSY=;
        b=T0NoVJC+A2MOckGPVZTFYoTRtQbkY8vF+hiuIoq1U1pQxU3EuSn003TBeaIt9zQzTE
         yFOTnUP1kMtjQjWNG+GBPzXJD6HnVdDP60K/tZnv3YFooMeZrZ3LZFX5Jjqs1pP4uDES
         Su7lrgWC/vVdFrIdJV1QfVPnRfXxLLaXZC/IVNvVksE6MFOaRfLvzKQSOyNmV+OrS82+
         LxIJPHvQ3LpRJ9PwHBDeuHULj44o8RaLD5h9vRp1cuE6mYNBlF0RWu7sW68S/zQvDy2d
         FpEMqCpwh7MW7irnO8rqrB1WI7v3ZIiO+o6Yc0gZH+oHvOaQZuxsM46jau6tjReoMzY3
         VIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758178; x=1796362978;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGt0ju/M5SRQjRd2zHJjdz3pvevsYivTWnOfSUsqHSY=;
        b=AJeW+Ca1qpodiCtWjckPraHwxGfNmKczrJ7BLJVsiMWfTk40+ZxiOqNLsRg/7lvT5c
         gpj/qkOLmUzOnpDh6U8UfZ2WlUOOlz5lGBzHgYI66qch/GSYFENuQpJUWe65wfKDRPu+
         7cIhVVUnW2CC3cizaKuROXsHcMxS8aw7aBH4wM6/PYcOo7AEKYKVeY+LtjQpGxvysLN8
         mP72vNvyTW5uzzpMjhAKtpjmVtTCpjzKo72VumnMEhUaR0ORjVlpReqgVPQCUThJxEcl
         osBPuObG282YiaYAD9H1PICJHbU0XHWuHPFBBcaFhICx0g7VOqjNpS0DiXqg/A7SzWpI
         LE3A==
X-Gm-Message-State: APuU4Z+LZVXuOVYRefAYCb1yzmvOZvfCsnCiWPQ2QvHx1H8LEmWwiQGE
	9OCIHCK5pDM97SfS9+BMcP42peRkmsDPqdWm5Mc6Gyk/S+IOng5nP0oel+gleYt4gwcWXw==
X-Gm-Gg: AZFdTZcX2dBJXSSV0F8HcZ4ILayJD1iFPUKCtalbt+FAtr78++i/jwUecujG2TOTIZy
	pRP9A2uyplxMEBDfCkq/GOriewqCIxAKkz8tFtCIa3LC9BrnH8Nw541+9dqwxEBrQ1Es8G2f7qv
	lwySyfajlIjsKktF30Wh8y5eeSUVNhdvza+U7iBsZC14myVJlyrUlsMp0D5qLXwPhk/5G2JcS/O
	xSkwUNqK573DRV6gg04eMKjQ/HgGAl/WyU8Rjonkb4p+zOurwSw12jAdCmv8iPBufUDfJPhTV4R
	eL9hnASRPr7FNJ5r78bC876m62BCT9JOTW9DFLeNcU95y2FjS7JOfNdRnifoAiAy0CINkLWN1iE
	P8yltv9sTcdJkY6FgjxaJSidQ7sExvgaTa6NWButmpJKFkADGw4ReUTB8IbGgfFEQZOQ1mabL30
	ncSmmPwEDfsMxEoM5kXm1cWdbnSS0dXIn+BtzpUbRjaHPJlCftmrM9ohwgtdfmLp7BDKVlBHvAU
	Qttx/v1ocHdImiI6YyZt4+u2yHy8j80N2FWHX8V/NrnWH0XvHpEtQkiEarbBsI/fKpHtYMZCgSe
	G2N3VU4VAdtWkiHb3QN7NrR9pDcQS2EF3yD3XhI=
X-Received: by 2002:a17:90b:5543:b0:3b0:a1af:e4fa with SMTP id 98e67ed59e1d1-3b41c9e4290mr23442280a91.24.1795758178448;
        Thu, 26 Nov 2026 21:42:58 -0800 (PST)
Received: from [169.254.212.233] ([2406:da1c:1ee6:2e01:64c9:ebb0:9e1:f7da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm12022687a12.9.2026.11.26.21.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:42:58 -0800 (PST)
Message-ID: <5d53930db2b6d514f0346b6b8dd43b25d2320813.1795754281.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795754281.git.n0ps1edzz@gmail.com>
References: <cover.1795754281.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 12:03:31 +0800
Subject: [PATCH net v2 3/4] ipv6: route: fix use-after-free in
 ip6_confirm_neigh()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Kuniyuki Iwashima <kuniyu@google.com>,
    Hangbin Liu <hangbin.liu@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

dst_confirm_neigh() is reachable from paths that do not hold an RCU read
lock, including rawv6_sendmsg() with MSG_CONFIRM and MSG_PROBE.

ip6_confirm_neigh() loads the egress device with dst_dev().  Concurrent
route teardown can replace dst->dev with blackhole_netdev and drop the
route's reference to the old net_device.  The old device can then be freed
before ip6_confirm_neigh() finishes using the pointer.

An AI-assisted source audit identified the unsafe load.  A delay inserted
after it to widen the race window reproduced the issue on v7.4-rc3 with
KASAN:

  BUG: KASAN: slab-use-after-free in ip6_confirm_neigh+0x6a7/0xbd0
  Read of size 4 ... by task confirm_race/130

Hold the RCU read lock across the callback and use dst_dev_rcu() to load
the device.  The grace period added to netdev_run_todo() ensures that the
device remains alive until the read-side critical section finishes.

Fixes: 9514528d92d4 ("ipv6: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/netdev/20261123133000.1.n0ps1edzz@gmail.com/
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/ipv6/route.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1b2dcc066..6bdd4423c 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -257,16 +257,21 @@ static struct neighbour *ip6_dst_neigh_lookup(const struct dst_entry *dst,
 static void ip6_confirm_neigh(const struct dst_entry *dst, const void *daddr)
 {
 	const struct rt6_info *rt = dst_rt6_info(dst);
-	struct net_device *dev = dst_dev(dst);
+	struct net_device *dev;
+
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst);
 
 	daddr = choose_neigh_daddr(rt6_nexthop(rt, &in6addr_any), NULL, daddr);
 	if (!daddr)
-		return;
+		goto out;
 	if (dev->flags & (IFF_NOARP | IFF_LOOPBACK))
-		return;
+		goto out;
 	if (ipv6_addr_is_multicast((const struct in6_addr *)daddr))
-		return;
+		goto out;
 	__ipv6_confirm_neigh(dev, daddr);
+out:
+	rcu_read_unlock();
 }
 
 static struct dst_ops ip6_dst_ops_template = {
-- 
2.56.1.windows.1

