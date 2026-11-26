Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656828;
	b=qepvtMVDYIQoTk6onDV/DCO8FSxZogwXW5y/sV/NnhfqxyjRyuAt/s9h7vlHWCGxwfwq
	 jVIxUnEPuptYiDgQoNNququVWPne5eIiHmGji6DMl5ZfpAyyrVXC41nwkoaFNdcmA98C4
	 UXv/sKiA7NtBigE66LF++SlkJyjPTpUr6+eWPTuoAYoZHqR9RcWWABX3LeHEz9Bgkp6ti
	 0ntdnC88t2rRaAaMefkvWytfD5gp8QnoLPnt0sAZSjwE+SpdzTGFfs8wc8/WHUlQNhUsv
	 8RCKIBz7bTncOEtGDDlzstNWlRkgsGzOMVZY+H7N680tMA2eZQw/C6frtWnnuI1yUgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656828;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eROQXAitMwlUKrlvTmxWuJSOdzqhAnG4G6zvGu/Wb3k=;
	b=H+r/S/BzzhrnoW8v1fiGNa/E1sfjFtQ5MxSxU2oRuHlovZJjytEK8TXd1/tK7Ya6wSyD
	 Jc3SEeTF/HbiRhVuJYpVeiAYHlf2++k49nwgrtF9SOOnO7525IPiC/8HyAjirqzvzEgiO
	 BJj/obyRChV1YOKkH1CbJcnvp1MrYX88dRrF35Py+CLkCTsN/57jzdrI98XYkI5m55pS6
	 wJZr7WwopGCEQQTiNkSFX860alqwlA8HxeM6dFzpP8CxVP2IVKwgCbd2E91858cqUaGTb
	 AMt4RMoJLNclTiss0ZzQhfnjxnkarCq+VhY4isvElW6EKgmalKXTcfUYB15APlxV3Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcO69hlu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091B606A338
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcO69hlu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189521F000D2;
	Thu, 26 Nov 2026 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795656827;
	bh=eROQXAitMwlUKrlvTmxWuJSOdzqhAnG4G6zvGu/Wb3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kcO69hluBN09refb6uN01/F0JDYIyFKR1ILcHI6pxaw9IEiuCEg18++V0xYEyURfw
	 ScG6lhGUt8DZVE/cAXcwqM+Jl/j4nYysRcPoQ4U9MAT7A4tSsdX0QCrIB/lPgFpSSj
	 7VSPLvcpvu+lU5BFiKdvAXI1nz+BMmVJEkVmqGqdbuZWf+5YFBID66GmUTyZiwXFc7
	 jCm88oTTuShmXW7YLMDfGZQgYY3hSRFMRQX7+7U+kLsLuVkavruTLXnG+yhAv/2nep
	 a4kF94LOBG7Hqt/RyHPZClY3aaG+S/UutySZZzTHc59oweweVJkQS4hOIEnlER3jVX
	 Fa2vuKgOO4t/Q==
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
Subject: [PATCH net-next v2 02/13] ipv6: keep a superseded pcpu dst working until its holders notice
Date: Wed, 25 Nov 2026 18:33:28 -0700
Message-ID: <9a45f4107473a2ab534f0c17ee237ff5344573bc.1795642432.git.dahern@nvidia.com>
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

When rt6_get_pcpu_route() finds that a pcpu dst of a route using a
nexthop object has been invalidated, it takes the dst out of its slot
and calls dst_dev_put() on it. That points the dst at the blackhole
device and makes its output a discard, although the dst may still be
held: by a socket, a tunnel dst_cache, an xfrm bundle, or an skb that
has not reached dst_output() yet (a queued or NFQUEUE reinjected
packet, async crypto). Those packets are dropped, where the holder
would have noticed that the dst is stale at its next check and looked
the route up again.

The dst does have to be detached from its device when the device is
unregistered: it is no longer reachable from the FIB, and a holder
such as an idle socket can keep it indefinitely, which would hold the
device. Put it on the uncached list instead. It keeps working until its
holders let go, and rt6_uncached_list_flush_dev() detaches it on
unregister like any other uncached dst.

Fixes: 8f34e53b60b3 ("ipv6: Use global sernum for dst validation with nexthop objects")
Reported-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: David Ahern <dahern@nvidia.com>
---
 net/ipv6/route.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6f0af090c606..3337a8fe2550 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1483,7 +1483,13 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
 		/* Paired with READ_ONCE() in __fib6_drop_pcpu_from() */
 		prev = xchg(p, NULL);
 		if (prev) {
-			dst_dev_put(&prev->dst);
+			/* Holders may still be using it until they notice it
+			 * is stale, so keep it working rather than dst_dev_put()
+			 * it, which would turn the packets of anyone who has
+			 * not rechecked yet into drops. Device unregister
+			 * detaches it like any other uncached dst.
+			 */
+			rt6_uncached_list_add(prev);
 			dst_release(&prev->dst);
 		}
 
-- 
2.54.0 (Apple Git-157)

