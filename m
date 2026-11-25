Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574554;
	b=QksHmjW6gI99b9BAgLT+L5VyeYmcUM4QCRUmQIgK7lY4H4MFXDI1adTo8Qyk83iIi/YG
	 DTyKSR1a972fsYPB7R9S/l4K45bSI1abn0yCq54Ogh4ZLPKrgAY5YZtwhW4Yq4lch4B6N
	 K/J8FLQzX3e4khjtfR76rnG+m9piK8NQ01kBy+1PIquGABo2q9ccPPS69/u2MFmS7v5Jj
	 FKzMo+yS5t501HtyVrv6wGdafX+1lAdyMiVzO1iGCJ80aNvHoMREb2QZ8yKXzZX9qei8W
	 qRymKoukPU4odru1BEti+cNI1aiLhhPqlWhppdeh/7Kb39dsBOG5KdTw+SJBcLZflVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
	b=AaKTC0aiCSLb7Bn1qkh7izk2YkBzxXR3PTtpRmcWAkRMRGx76Em6Q7EyPPJHLVx2uV/w
	 SGYJ4n2M0pFjDIVKzin+ppYCPc8Vt5f+4jPiX1U6ZIpQLab+2LMJ0K0vPyn6FItScNaIv
	 XWhczWP42tGA/H1vFzI84HSJ1YMo5Lgw89iDNRbOee50OTHrBSxF56Ow271yyd4bpks/Q
	 ca3bC4aYY1X0pogStByrHzfajl8u+KxbE3ms4XKFqvUksGeoXqP80les+kjZm4VfA5Ai9
	 uiDGlk9Wp3gs6JKtp6hI9lKj5WsibGrK01JkAT0SA07qmi6zEhIYovvom+7MEuUbuDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAdERpM2;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC3606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DDC3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAdERpM2
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso5089585a91.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574553; x=1796179353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
        b=wAdERpM2eVBpy6AqMsBIoVQ4UlF4dIeQyQna04l6cWqH7voIF+WVlOC9Fgqxa0gRmr
         uN7Zqrxiy6rRikjmHoiM072ptof345qJR+9HlEiIcGCgBrY5GkS4JSmz1Q52ncumi0X1
         JpYm8CpCqE1at/gBzk/OYNsE8WRTcmDhoxjro8YG3ru045OS8NhQ8YrZbyYhsawRZe5i
         ITjj0JCyfxJYeJ9NmHvuPTMHhIqPOQeSNwjmrXA1YR5iKwZV/eFJO0E24X9SQM6TKRuB
         usp10dKaurz7TlUeJ4eDPVZKhV0zjM3DnBMpZGz/NuBkk3RQsJd24sfd73OlM683MhNW
         9ocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574553; x=1796179353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vLaUSGVzrenn35n8wMC/NJVDqhs0L2Vc/oVTJI7Ix0=;
        b=HsUXC6Sex6QLhMieoguPI8diZiB6MnoedY8AQSFWC4fJ5aETRpiN7qlNqIIxP13a+z
         GIeegk8G0PAaWkGNzPAJtF5aTJ8zsTU9DCeRMxri+FxFLuvDnqM1hKWf7e9subVddWtd
         LzyZ3g4ZKLvdSVNF1B72GF+jC3jCmd4Nd921qvnt+Xy/p2LQKv9zzDmMNAIkDNLpUd7E
         J0oxWCJCNiV0IZ8Xy/oMjqyGPozjdTbbNJHfFAHkGi6sJ+C9plgA2B/Z7X327c0ZkQA0
         VoogeQxVnwo/xViJa+UJfKIyjRkGpdfODA56sPWXmqSoLfuiqvk1qw+N5fNVBl5HNCTO
         Ocnw==
X-Forwarded-Encrypted: i=1; AL+hErHReHMI3/n8wzcOFTew6/tWTT19rS9CtUZ4nSI8ca2UK4TysqmxQSuLUdzghfwyicYCOnUsP5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TCqIZ8jD8xcUXaFjE+2TpOFs5Bk3yLry1ip6iX3jDxdHX2mNq
	X1/pPvD6aK4E+79HGDOjQQxHUhHRp1/lmxV8gxikGYxjVUf6/iM3sk6X
X-Gm-Gg: AZFdTZd8Fx4qft8is0NRumXvKxtLD0zrw0B+a6KdcP4PFz/g+slOmOslo7tkpVHKDLz
	6JLAfA2TN7VZGBdDWytopJoBJ0Bb1IG9JzkwChhSFjVJracnCYpcBnTpMUGOHeeeQN00Kfk+tXk
	RED7pQf8x1QntlLuPo9YUklMkUbL+TmQa3fHRjTAraAiIMw6s2cmowpD/o6AeRrCUkWWsxwP/eU
	JG7MsTG6toIKsfge+V71FLHzduSyDYvRQnvGhXhRDkfAFlEZEygUXH1DIUIMpaqEp87kelt6uDR
	gr2dmgSUUXqsPER1Ly18afyVgB8Oe1de3K7ADCUcQrVxYSVhqoUWQS8WMvODbgzAaz9zL5xJ6JR
	nnhjIZUoZGWeawQQJ9nAhbDdiESa4RXYRJJ3Q5kQMTxG2SXozedm40MpU4ElnuxMilCD2MCzBU/
	UMOSXdl/EFBitQwuVKxZ09X1FifVO4TNlN0UiQIFB1AOiOh7gSxjRJX+TM4QiDnSQBs7PnSw0Df
	1t45BrxSNVfMluL1PP/OzJEjoo2jAbAHbr6HKf00R74ieJsMg8U7RLNoGhm28RrSjVSEXcqt3kT
	32F7S8tOtm8rxaWC5Kia4+OxOMGDjNbqYimgS2iGIm8SADgi6Ltns4lNGzO2lKjK0Fc=
X-Received: by 2002:a17:90b:3f43:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b41c8e0512mr10754930a91.15.1795574553339;
        Tue, 24 Nov 2026 18:42:33 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm25727086a91.6.2026.11.24.18.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:42:32 -0800 (PST)
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
Subject: [PATCH ipsec v2 1/2] xfrm: allow route optimization mode only for DSTOPTS and ROUTING states
Date: Wed, 25 Nov 2026 11:42:27 +0900
Message-ID: <c1901b79c9de8fad23fecb49f1d4ab7ecdf04f57.1795573672.git.kyuwoncho18@gmail.com>
In-Reply-To: <cover.1795573672.git.kyuwoncho18@gmail.com>
References: <cover.1795573672.git.kyuwoncho18@gmail.com>
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
protocol. esp6_init_state() accepts any mode and only adjusts
header_len for the ones it knows, so an ESP state in that mode is
created, and the first packet through it hits the WARN_ON_ONCE()s in
xfrm_state_mtu() and xfrm_inner_mode_input(), which assume that route
optimization never comes with ESP:

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

