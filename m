Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656827;
	b=o2OF7pFFIiTO4SwrzmTWGV3sNFefvdK3f4Bv1/NxqMpohqucXqFkTrt0keaWd0Lofqk7
	 ZA/GjcNqE7L/1854eYOXAHUtwHDw0pZpELy62IGDB2ar38lPqRaBIzR7LSyU3TcdRAuzm
	 ol3vbqH8Woe3V7bwOmcDcLEz1ABtEpKywcYkluXn1BFpSVUDoZxn50YAbOSdZ03oGhVWb
	 q3OTuE4/qz1JukSjPXoVe69yoCIUIIO1GakpuK/BaiD3mVv62kZX6cs/+pX+4lrz+ja+d
	 OrPfhPfH3w9EsIYoa1WYbVJwqxTQbOBKmznfAlDE0l2P1Z8pQL/NdDH5oWyCT7bJSRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656827;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=j6q14PjSENriLgotTkkpQI/MJpCCd3LFrqljQq3PAKM=;
	b=l5OlNJWRpQsAtoD/bU6asjEEKNGXKflMYYZYvSh1TG0RQTqxBYrB7DuE2wNpTQLZ72g5
	 DFNxmLnfwzCzLdv6JntKwjTimXN7r7Ce8MuAcig6J+DUSIQHyWCabFRyTOyLe2tUC4mAW
	 UYLso0Bm1hj/FTfb8jfNobgUgNmaGfBtgCI5b3NBrcQpjJ5kDFE8y2l8jkipurHHNlub5
	 4CqxF6VlrjtrmalqDic0wC8tliuERPmRsr+UE7RPl6Gc2T1wRVmUydwUpJNFWUx1VQ+Gz
	 FglWSm0KmoCaTgtfhPPsoXMdMKC6rSnVPWqMn+TLwpzCzGAv8rLz9iksjAykKUnjxFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UStI+Hwj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5E2606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UStI+Hwj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592BE1F000CA;
	Thu, 26 Nov 2026 01:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656826;
	bh=j6q14PjSENriLgotTkkpQI/MJpCCd3LFrqljQq3PAKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UStI+Hwjv4QqTUZuDEtxDu9IzseOBoAZA+rc88BYRGj0Co+MfsW/2dBSwaEnh7T4l
	 wWPYqQVjvLauFcLQsc/W0FZw8fyOQwtJA7T27taJM7mHToiS0kjb9QoiqrW9MAv10o
	 NLBHF8tPItuZbjC1l0CxQ7JFPZwQCjxGa71n6YYn1fSAzakUxhDvSFTURn4g/Zh/5+
	 E8FgndwtMff7P+3mOkbVWGWha4kCMi+0fFpNKrqxV55jzYKEIY50Ksy3d8uupLEEfu
	 zT9d2NClauzjd2HPI7pomEOd6WsON9P0zCHj4At9WxWWuhvObPExx9Ns65I9lJrzBK
	 D4KARYe7ZqZNw==
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
Subject: [PATCH net-next v2 01/13] ipv6: allocate the exception entry before removing the one it replaces
Date: Wed, 25 Nov 2026 18:33:27 -0700
Message-ID: <09f2c4510b77554f66cb3c56f8667a2d2864b959.1795642432.git.dahern@nvidia.com>
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

rt6_insert_exception() unlinks the existing exception for a
destination before it allocates, with GFP_ATOMIC, the table entry for
its replacement. If that allocation fails, what was learned (a
reduced PMTU or a redirect gateway) is already gone and the caller gets
-ENOMEM, so traffic falls back to the route's own MTU and gateway.

Allocate the entry first. If that fails nothing has been touched and
the exception stays as it was.

Fixes: 35732d01fe31 ("ipv6: introduce a hash table to store dst cache")
Signed-off-by: David Ahern <dahern@nvidia.com>
---
 net/ipv6/route.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 4a4c5ace63c5..6f0af090c606 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1721,8 +1721,8 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 	struct net *net = dev_net(nrt->dst.dev);
 	struct rt6_exception_bucket *bucket;
 	struct fib6_info *f6i = res->f6i;
+	struct rt6_exception *rt6_ex, *new_ex;
 	struct in6_addr *src_key = NULL;
-	struct rt6_exception *rt6_ex;
 	struct fib6_nh *nh = res->nh;
 	int max_depth;
 	int err = 0;
@@ -1765,19 +1765,24 @@ static int rt6_insert_exception(struct rt6_info *nrt,
 		goto out;
 	}
 
+	/* Allocate the new entry before the one it replaces is touched, so
+	 * that running out of memory leaves what was learned in place.
+	 */
+	new_ex = kzalloc_obj(*new_ex, GFP_ATOMIC);
+	if (!new_ex) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	new_ex->rt6i = nrt;
+	new_ex->stamp = jiffies;
+
 	rt6_ex = __rt6_find_exception_spinlock(&bucket, &nrt->rt6i_dst.addr,
 					       src_key);
 	if (rt6_ex)
 		rt6_remove_exception(bucket, rt6_ex);
 
-	rt6_ex = kzalloc_obj(*rt6_ex, GFP_ATOMIC);
-	if (!rt6_ex) {
-		err = -ENOMEM;
-		goto out;
-	}
-	rt6_ex->rt6i = nrt;
-	rt6_ex->stamp = jiffies;
-	hlist_add_head_rcu(&rt6_ex->hlist, &bucket->chain);
+	hlist_add_head_rcu(&new_ex->hlist, &bucket->chain);
 	bucket->depth++;
 	rt6_exception_net(nrt)->ipv6.rt6_stats->fib_rt_cache++;
 
-- 
2.54.0 (Apple Git-157)

