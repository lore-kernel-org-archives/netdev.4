Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469190;
	b=hBmMfG74nz1cg4GHQ103sg5gfUNQeeaD0fx/cN3VHyVZxn9ZWfAb7W9bEKu0R/zuJlRP
	 cqY6gEE0ceo0+tv6pZ4+VAviXcNTmZpNr74U3ubKETXnA7zJIhEo0g5EjQ4ha9qec0GxW
	 c4M8+BL4L2WC3gvBHNawI8Seo9iNAup+OGlcXnjYZLJpaLtRK9Iu3IVJLvuz+iRYn/74h
	 v0rH3aR5CQzXrVObpo+A1Jy3Hti1YOXV33O57ZJw5MAPik/+LHlhXk828qxXhxl76emZP
	 n/MBaftaAzQs9TQMY234SWNZV5TuOhvKldNGPRCzn+funn9L5xqqA6tuTYV3tCtf41g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469190;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=oQx1HExhx0RCsnyejYc4L7AmX+11wbvwreIsD3Nmy6Y=;
	b=Ma12SiQuPuzwqzsCtpWB8Az24iM3niv4cU3gNyLJ1I2Z8hc5dYAqrycC3MEpY0yp4oSA
	 UXzI2zMzd0fPH9Beg2iG/eJ9NsYsXJeqFYjc8Bv+LCH87rdA+upMKNYI/pWGQI8z2XL6A
	 Hsyr6/2WsOykDLPaViR21nLIRipEBP4BZIAVScw1m0Uuw0lmZt5PQAkIFVzh1cQ+fMyPp
	 /CtbytsNpi4SUU8t5z3B72TCVpbVM9aF/S3UXawOjHBwqE8WPoY2DkJTF6xMIm7qr+n94
	 5XVWSS5WH4a39lEMwapowZKu9KipMWMtz2QHSZPsXxnFodyNOlqkqY7d5hdZs25Xrsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Hi/TcFNj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC4606A331
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hi/TcFNj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409AE1F000E6;
	Mon, 23 Nov 2026 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795469190;
	bh=oQx1HExhx0RCsnyejYc4L7AmX+11wbvwreIsD3Nmy6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hi/TcFNj0ofbvJra8fLhZ6s/g6WcQXP5YNSeLPVjGx+XkXMms+XnWaG7Ygly0IthN
	 K5GNVyqY8a94zQANbUbJEVtmsGoxvPPaFL5Rref7giwKmA/wruOSU57qDqsdcpmpiC
	 U6ksnaHR73t3SVP20FuATprWch5vaRa+XVWNLYPX2UZzsWJJ0vPW1J9Eu6T5xMKXMv
	 0S+e2x5oeFKUbTkNOBsZa4X8JdRPs4QwgqhALlGE6DkbNnv70xq1idNSALv5XhjfRF
	 7/sYMdL2V17wu1wUtc/x97LdW8KmB3LAblxohYvAlff2PyQ6pU5hm/Rnw15PVwRn9I
	 wO2tlRt/GikRw==
From: David Ahern <dsahern@kernel.org>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	David Ahern <dahern@nvidia.com>
Subject: [RFC net-next v2 2/7] ipv6: invalidate the failing dst in ip6_link_failure()
Date: Mon, 23 Nov 2026 14:26:04 -0700
Message-ID: <20261123212623.106153-3-dsahern@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123212623.106153-1-dsahern@kernel.org>
References: <20261123212623.106153-1-dsahern@kernel.org>
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

When a default route's neighbour fails, ip6_link_failure() wrote -1
to the fn_sernum of the route's node so that users of dsts under that
node would look the route up again and let router selection pick
another default router.

dsts are now validated against the netns route generation, so that
write no longer invalidates anything. Clear the sernum of the failing
dst instead; 0 never matches the generation, so its users do the
lookup again. Only that dst is invalidated, which for a pcpu dst is
one CPU's copy, rather than every dst under the node. Bumping the
netns generation here would be much costlier, since a failing router
can trigger this for every packet sent through it.

Signed-off-by: David Ahern <dahern@nvidia.com>
---
Changes since v1:
- None.

 net/ipv6/route.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6fa76c95b1d2..a132d33259a2 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -2874,14 +2874,13 @@ static void ip6_link_failure(struct sk_buff *skb)
 			rt6_remove_exception_rt(rt);
 		} else {
 			struct fib6_info *from;
-			struct fib6_node *fn;
 
+			/* Force sockets using this dst to look the route up
+			 * again; 0 never matches the netns generation.
+			 */
 			from = rcu_dereference(rt->from);
-			if (from) {
-				fn = rcu_dereference(from->fib6_node);
-				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
-					WRITE_ONCE(fn->fn_sernum, -1);
-			}
+			if (from && (rt->rt6i_flags & RTF_DEFAULT))
+				WRITE_ONCE(rt->sernum, 0);
 		}
 		rcu_read_unlock();
 	}
-- 
2.43.0

