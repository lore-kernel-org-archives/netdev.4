Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040305;
	b=SryyZN9gzcKmin40sVvvzY/DJH+7kHLMd88urn4JEQZbU7icIFxRV5tSaFhwQogvMlU3
	 rtnslCulbc8YnniTXxWZHvGgSg7M3KBpOguVTChWzI2v+CYVS3nbFzxCmoQL431Rjx4IM
	 Btyv+X3kVsnj98Pm+Bbca2hZ5Bmnf3lrpNM33gPnnV7rFGTHl+QbJiErqtpdulLx187g0
	 eY4pTpfetWVFgh2VvIq3M/XEWeoQQQ+zCNxAzl1B8ymTx0CDzd35bNev+hEFo5nI/i1N2
	 qQLiR4z1/NyJKah5bHBQs4TGLITpJXje5D8YqJXgVlE8kn6lVM37QClhCGWlzpkKn1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040305;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mKjM9M2GTLsTZn2yAyHhccDEwzBNAB0NKif3TzkDTaU=;
	b=26sM2j2wlVjnuv1KB6TLJ3JIu4OY8tBjGhSa6DOxTo3giiHmrZw1sFHcBAWGnkCXMcvm
	 zviTte2szFnHBLivMcg6JQdQt3NRaEtyVi2DqZWZj0dUtO5xAyhocMv9pzkocgwzpEXAh
	 vow+1wvl8IMZvKlkTstd1q5iWwExVr6SSjvkjsg3IFHQaQpinOrTYQIlH91OcDGUL3QI4
	 jFcCdXjJB8GjvNHbl16LkbcmJHxxJqX3PeAixCk8cYY7/fPeDRHVkLXWtaV9/MZKBbelL
	 I1ozc+HKdFJHKX+bF5kb9jCGEZw8737NVHs9xBjicRkcqSm1xcndTuvs1jqcAjzB4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DcEKfQAt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D324606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DcEKfQAt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941DA1F000C4;
	Wed, 18 Nov 2026 22:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795040305;
	bh=mKjM9M2GTLsTZn2yAyHhccDEwzBNAB0NKif3TzkDTaU=;
	h=From:To:Cc:Subject:Date;
	b=DcEKfQAtE0aJFnfTei09dhx7V0RRWckcIr/3aNkaibguFpFLsQcnNDS9nMk5bJWfx
	 L3D+1ywW+fbfeEbg5ASdYrorc2NYdh0+DA453ZpgZRmnmfZkVnXScSkwRstdZGAwZJ
	 pKiRY9sN5cIHzXQl4DCNV6nVqb678Ri11ntOxcIRwtcFozHRvgUjmYdyti8ehUwSQ0
	 HwZp+SSM7ZDqyuj4RmQJtG0SjxhRcLpi/YyMPtoE4s+VBv5/X1n2GPLYgFSMTqueuc
	 gC+sYrcO+vRB68OJD6s7SKWzvRROgRFQUsRxz9mT1ET+CU+WLZwXdrLqJHJz5JinAx
	 mOz+/Eq+Fre4Q==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>
Subject: [PATCH net-next] 6lowpan: nhc: use RCU instead of lowpan_nhc_lock
Date: Wed, 18 Nov 2026 23:18:20 +0100
Message-ID: <20261118221820.1601273-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
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

lowpan_nexthdr_nhcs[] is protected by lowpan_nhc_lock, a spinlock
that is acquired with BH disabled for every compressed or uncompressed
packet, even though the table only changes when an NHC module is
loaded or unloaded.

lowpan_nhc_del() already calls synchronize_net() after clearing
its slot, so readers only need to be in an RCU read-side critical
section to safely use a struct lowpan_nhc.

Convert the table to RCU:

- Mark lowpan_nexthdr_nhcs[] as __rcu.

- Readers use rcu_read_lock() and rcu_dereference().

- lowpan_nhc_add() uses cmpxchg() to install the new entry only if
  the slot is empty, and lowpan_nhc_del() uses RCU_INIT_POINTER()
  to clear it.

lowpan_nhc_lock is removed.

While at it, use a single exit path in lowpan_nhc_do_uncompression().

The ->compress() and ->uncompress() handlers are no longer called
with BH disabled by this file. None of the in-tree handlers depends
on it.

Compile tested only, sparse (C=2) reports no warning.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Cc: Alexander Aring <alex.aring@gmail.com>
---
 net/6lowpan/nhc.c | 77 +++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 46 deletions(-)

diff --git a/net/6lowpan/nhc.c b/net/6lowpan/nhc.c
index a4dde85664f2f8ec52a403a94f85422dccf63367..b996fd4a3ece03fbad8e6518faa8eaf21f6aaa82 100644
--- a/net/6lowpan/nhc.c
+++ b/net/6lowpan/nhc.c
@@ -12,8 +12,7 @@
 
 #include "nhc.h"
 
-static const struct lowpan_nhc *lowpan_nexthdr_nhcs[NEXTHDR_MAX + 1];
-static DEFINE_SPINLOCK(lowpan_nhc_lock);
+static const struct lowpan_nhc __rcu *lowpan_nexthdr_nhcs[NEXTHDR_MAX + 1];
 
 static const struct lowpan_nhc *lowpan_nhc_by_nhcid(struct sk_buff *skb)
 {
@@ -27,7 +26,7 @@ static const struct lowpan_nhc *lowpan_nhc_by_nhcid(struct sk_buff *skb)
 	id = *skb->data;
 
 	for (i = 0; i < NEXTHDR_MAX + 1; i++) {
-		nhc = lowpan_nexthdr_nhcs[i];
+		nhc = rcu_dereference(lowpan_nexthdr_nhcs[i]);
 		if (!nhc)
 			continue;
 
@@ -44,13 +43,13 @@ int lowpan_nhc_check_compression(struct sk_buff *skb,
 	const struct lowpan_nhc *nhc;
 	int ret = 0;
 
-	spin_lock_bh(&lowpan_nhc_lock);
+	rcu_read_lock();
 
-	nhc = lowpan_nexthdr_nhcs[hdr->nexthdr];
+	nhc = rcu_dereference(lowpan_nexthdr_nhcs[hdr->nexthdr]);
 	if (!(nhc && nhc->compress))
 		ret = -ENOENT;
 
-	spin_unlock_bh(&lowpan_nhc_lock);
+	rcu_read_unlock();
 
 	return ret;
 }
@@ -61,9 +60,9 @@ int lowpan_nhc_do_compression(struct sk_buff *skb, const struct ipv6hdr *hdr,
 	int ret;
 	const struct lowpan_nhc *nhc;
 
-	spin_lock_bh(&lowpan_nhc_lock);
+	rcu_read_lock();
 
-	nhc = lowpan_nexthdr_nhcs[hdr->nexthdr];
+	nhc = rcu_dereference(lowpan_nexthdr_nhcs[hdr->nexthdr]);
 	/* check if the nhc module was removed in unlocked part.
 	 * TODO: this is a workaround we should prevent unloading
 	 * of nhc modules while unlocked part, this will always drop
@@ -93,7 +92,7 @@ int lowpan_nhc_do_compression(struct sk_buff *skb, const struct ipv6hdr *hdr,
 	skb_pull(skb, nhc->nexthdrlen);
 
 out:
-	spin_unlock_bh(&lowpan_nhc_lock);
+	rcu_read_unlock();
 
 	return ret;
 }
@@ -105,64 +104,50 @@ int lowpan_nhc_do_uncompression(struct sk_buff *skb,
 	const struct lowpan_nhc *nhc;
 	int ret;
 
-	spin_lock_bh(&lowpan_nhc_lock);
+	rcu_read_lock();
 
 	nhc = lowpan_nhc_by_nhcid(skb);
-	if (nhc) {
-		if (nhc->uncompress) {
-			ret = nhc->uncompress(skb, sizeof(struct ipv6hdr) +
-					      nhc->nexthdrlen);
-			if (ret < 0) {
-				spin_unlock_bh(&lowpan_nhc_lock);
-				return ret;
-			}
-		} else {
-			netdev_warn(dev, "received nhc id for %s which is not implemented.\n",
-				    nhc->name);
-			spin_unlock_bh(&lowpan_nhc_lock);
-			return -ENOTSUPP;
-		}
-	} else {
-		spin_unlock_bh(&lowpan_nhc_lock);
+	if (!nhc) {
 		netdev_warn(dev, "received unknown nhc id which was not found.\n");
-		return -ENOENT;
+		ret = -ENOENT;
+		goto out;
+	}
+
+	if (!nhc->uncompress) {
+		netdev_warn(dev, "received nhc id for %s which is not implemented.\n",
+			    nhc->name);
+		ret = -ENOTSUPP;
+		goto out;
 	}
 
+	ret = nhc->uncompress(skb, sizeof(struct ipv6hdr) + nhc->nexthdrlen);
+	if (ret < 0)
+		goto out;
+
 	hdr->nexthdr = nhc->nexthdr;
 	skb_reset_transport_header(skb);
 	raw_dump_table(__func__, "raw transport header dump",
 		       skb_transport_header(skb), nhc->nexthdrlen);
 
-	spin_unlock_bh(&lowpan_nhc_lock);
+out:
+	rcu_read_unlock();
 
-	return 0;
+	return ret;
 }
 
 int lowpan_nhc_add(const struct lowpan_nhc *nhc)
 {
-	int ret = 0;
-
-	spin_lock_bh(&lowpan_nhc_lock);
-
-	if (lowpan_nexthdr_nhcs[nhc->nexthdr]) {
-		ret = -EEXIST;
-		goto out;
-	}
+	if (cmpxchg(&lowpan_nexthdr_nhcs[nhc->nexthdr], NULL,
+		    RCU_INITIALIZER(nhc)))
+		return -EEXIST;
 
-	lowpan_nexthdr_nhcs[nhc->nexthdr] = nhc;
-out:
-	spin_unlock_bh(&lowpan_nhc_lock);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(lowpan_nhc_add);
 
 void lowpan_nhc_del(const struct lowpan_nhc *nhc)
 {
-	spin_lock_bh(&lowpan_nhc_lock);
-
-	lowpan_nexthdr_nhcs[nhc->nexthdr] = NULL;
-
-	spin_unlock_bh(&lowpan_nhc_lock);
+	RCU_INIT_POINTER(lowpan_nexthdr_nhcs[nhc->nexthdr], NULL);
 
 	synchronize_net();
 }
-- 
2.53.0

