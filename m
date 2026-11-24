Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504143;
	b=CWsmjwHyycHghOnlnnqq+9gEAttOIyk7wOzLS6J+xcK1nxZQfiuBMYPslKLTNzgOb73E
	 ZWlPv3xYl0OKPNrGYDvAIKDyy5jmMh0PmuVtc7eqfqG+xTnowEOj4zaLq43z75uWq4hzG
	 DCgaMh/2ea9LRlo92aCDcoAMCkfn4Hn9rpiq1eckq2KOnJSUkyHawFj3kDoqeZEPCOMdd
	 MxaAUKe6ULEInYfU8cTlY7gjIUOE05eMHuDlln+s/CEUuoRWuI2eZoe1MdrSNExGw0fbj
	 +mWMFSn81Oq2si9fTjsLhxhk3AsU+8LJh1T/Aioo+mfR0uL3ipTwSE6RkRbE8WKMr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yHzcEi28TzLcdkTdLjmsJRjiQsin7uG0PUUFZLOdqqY=;
	b=cEsMzykk3MSmvXKPCm7XSZAFEivt11RkATWcc06z37YnE18DrcoCnnDS1+67yh2Bg5pW
	 yOQ2Ie7serHDMeEvUcAHRnp3MnbJEN6NQP4q6ATiwvKFRD0PUmG2F04lwMGdbZT9PoEXu
	 LI//gkU5sk1BOBwVJVfsHUldBq3b7yGtxY7MbgoTV/vRLmM+qwseSZ3KDvhIB0XHPorXG
	 kQcIaKBL6bZA/XypH0M9Fm3NHAXhnRSL2cYNscaBFO+uv66k0GqmB5DIYgCthyZ4r6VBp
	 NkZa1Yj1ZJLSTt9kb8dhsLUywodHRWondy9G7S+8abyj303JD/6LbI+KLhnpwifknMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7IDtHpi;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3828606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3828606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7IDtHpi
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1944018b3a.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504142; x=1796108942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHzcEi28TzLcdkTdLjmsJRjiQsin7uG0PUUFZLOdqqY=;
        b=i7IDtHpiA7zeZev7aih9yX1LZtQXdeesNsKu4cSsMhiefYQDrnDgPRGnMpMJDBc2H6
         4yNSjtG6acrhqVBIPDrOng69tcGHUyU1KTKMOX9MMHEO9br25oUgFLPOGYfSTbw3RHzy
         7gRlu8VsXkog7fclpydcW4rXwR+8zHhJruqLv0DBTsUOssQ2+YXHp2JmhxlR+a2NCkxz
         RzUVuDzfxptM+Mb/jy/d1rGD5Ay4KOdjwJJAmntbj0tb/zt/JhtHChsAu3FjQJquZ8FC
         xCxXVFx4O8sjs41d0ZodlYSOWbgxGZhql82soaWWMUrgZXAEJypg7RUL1JsfH2DK1wVn
         9EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504142; x=1796108942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHzcEi28TzLcdkTdLjmsJRjiQsin7uG0PUUFZLOdqqY=;
        b=C38IdM66LQtzmEhihLHqpyp6KZZk19UAL+VciG4fGRZXDEO3e3FK7B9B882A7dCfIx
         8tPt+COtJ3Jn1GElFOMdMyE9vrxM2UCuYt2t/AMho7Si+kFWzo7ZEW8W6eP/yoZTmYzX
         c8aYbFjUw4pKHKR//jRKbhxP+S/kxRdrKizwJcVZZYXMxxMGL0o/GHnIDqMVKBwfKVcw
         rgqNd74w2a3jD4qdltQCcvLEIwrbqWEogGDWci8isJvQnThXxnmcyuQycuSHE+XvwY7W
         ADuLmCV0YoM6qz0EsasQrsJoTC7pHDvkCr7YD/aXqYZoVOXqeIsBztAAmOkvJcVyyl8H
         ZJtA==
X-Forwarded-Encrypted: i=1; AL+hErETjKepGHEd9RTz+jJ4ZC9EnO6B15+1TqzJb/1GowKK2/Nfb+q0H+sgEyhpazZ5U/CaV9P7Tbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7ceivdQchYZ6l1evsO6UIulFNeRcKRoQnmA51U5SmllbG6zri
	cLVlpax3TfQoXXZlxX/KIxwI8/7+W1DSHRdMfMga0EKtm5tFugTNagIO
X-Gm-Gg: AZFdTZfqSL2YVZnrKof3Hpp6T7R17DuSMAqvqx4zhBkvxC62YDPzmdnPlX8h4Pl6b0e
	apZnEiq1EQglgh7JLp6bpOKJzyRIv0ALCq2Ju2/IAgFmYqaiLJrvlNHIEPRbNpZUyESzvP2lr/8
	NNpDzRFBakCALGlpNs1AVhle7aEs0qQok74QVZPkTxYhsmsroAUUI/O/vUrRy7odPb4jakTSTN5
	hqM7VKsar3RM1mwYfYO1GJhPJSwUSm52TYXXRzV4DVyc0VsJ5sGjPYR1uFqePGZBL3BlGK124rO
	PRP01kKDT5FiKyIcgcWc7tQSsjTWK+SxW0fJGJyaSN7kk78NQZlQbIJuQEfMBd77aqCm9hcIyIW
	uvfD+C470Ymo9c2406OJW+VkuaybWFpfGyOWdMg4YcoFMcIUqsmHjoTBsnfMcvhNMp//5Bw8bOg
	C1HVchuigL7FxPBwoHDiuA66YrUcv7ieoglTBW28XPJcWtTPJK7HPDPC/0Y4Epg1paNnfYD0aDM
	cuKwfT6R+ALNSSp0F6fYV+vm5HmkhgENWqre1pruJPHm539JULNNkYOlQtrGMoOK34mgUOyVs8H
	Kb+jvl+TUAPQec38+PceoMZ1tmtpxoHKApAY3fJIFBqEIdXUKla85PlqPIVCg2EhP4s=
X-Received: by 2002:a05:6a00:94c8:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8c87d01fbc2mr12088013b3a.48.1795504142083;
        Mon, 23 Nov 2026 23:09:02 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6748955b3a.3.2026.11.23.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:09:01 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Hui Peng <benquike@gmail.com>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: allow route optimization mode only for DSTOPTS and ROUTING states
Date: Tue, 24 Nov 2026 16:08:56 +0900
Message-ID: <179550330841.535592.4607028415857424638@gmail.com>
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

verify_newsa_info() accepts XFRM_MODE_ROUTEOPTIMIZATION with any
protocol. esp6_init_state() treats a mode it does not know as
transport, so an ESP state in that mode is created, and the first
packet through it hits the WARN_ON_ONCE()s in xfrm_state_mtu() and
xfrm_inner_mode_input(), which assume that route optimization never
comes with ESP:

  WARNING: net/xfrm/xfrm_state.c:3264 at xfrm_state_mtu+0x239/0x3d0
  RIP: 0010:xfrm_state_mtu (net/xfrm/xfrm_state.c:3264)
  Call Trace:
   <TASK>
   xfrm_bundle_create (net/xfrm/xfrm_policy.c:3992 net/xfrm/xfrm_policy.c:2785)
   xfrm_resolve_and_create_bundle (net/xfrm/xfrm_policy.c:2885)
   xfrm_lookup_with_ifid (net/xfrm/xfrm_policy.c:3114 net/xfrm/xfrm_policy.c:3245)
   xfrm_lookup_route (net/xfrm/xfrm_policy.c:3344 net/xfrm/xfrm_policy.c:3355)
   ip6_dst_lookup_flow (net/ipv6/ip6_output.c:1299)
   udpv6_sendmsg (net/ipv6/udp.c:1699)

  WARNING: net/xfrm/xfrm_input.c:449 at xfrm_input+0x2176/0x5f50
  RIP: 0010:xfrm_input (net/xfrm/xfrm_input.c:449 net/xfrm/xfrm_input.c:705)
  Call Trace:
   <IRQ>
   xfrm6_esp_rcv (net/ipv6/xfrm6_protocol.c:119)
   ip6_protocol_deliver_rcu (net/ipv6/ip6_input.c:479)

Accept the mode only for the Mobile IPv6 protocols, as IP-TFS mode is
already limited to ESP.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
Steffen asked for this on our report:
https://lore.kernel.org/netdev/awUsEE7XZIFwc0Ws@gauss4/
Hui Peng posted a patch with this description in September, but its
diff changed attach_auth_trunc() instead:
https://lore.kernel.org/all/20260919215239.3471352-1-benquike@gmail.com/

The issue was found by an LLM-guided test generator that we are
developing as a research prototype. The patch was written with LLM
assistance; we reviewed and tested it. With it, the ESP state of the
reproducer is refused with -EINVAL and the warnings are gone, while
DSTOPTS and ROUTING states in route optimization mode and ESP states in
transport and tunnel mode are still accepted.

 net/xfrm/xfrm_user.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 217f65faa2bd..c4bbfd638d73 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -477,9 +477,16 @@ static int verify_newsa_info(struct xfrm_usersa_info *p,
 	switch (p->mode) {
 	case XFRM_MODE_TRANSPORT:
 	case XFRM_MODE_TUNNEL:
-	case XFRM_MODE_ROUTEOPTIMIZATION:
 	case XFRM_MODE_BEET:
 		break;
+	case XFRM_MODE_ROUTEOPTIMIZATION:
+		if (p->id.proto != IPPROTO_DSTOPTS &&
+		    p->id.proto != IPPROTO_ROUTING) {
+			NL_SET_ERR_MSG(extack,
+				       "Route optimization mode requires DSTOPTS or ROUTING");
+			goto out;
+		}
+		break;
 	case XFRM_MODE_IPTFS:
 		if (p->id.proto != IPPROTO_ESP) {
 			NL_SET_ERR_MSG(extack, "IP-TFS mode only supported with ESP");
-- 
2.43.0

