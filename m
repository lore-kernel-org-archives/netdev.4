Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574558;
	b=Xrt/2ZVPW6ezzb499PFRJFIUDpEiZuziDwRHb+d2MR0Maq77fm3adopJ6Sls0PscSQ7Q
	 +XywShejJb+Xf2++pKR4NCD9Pp8Oi0/biI8KlmYzmpthB9xuttq5TpfIg0N47qlqi3Z71
	 56LvFT++fAEOhMAS08+2qKfz6+H3YKmvSYLRVA3a5irrcShKCwnRqt2eaNtFrOsGxRnrS
	 T4QDOL37ayZjGh48Z6vrA76XHcjy6D6ai6lug0EHaaDwXwRI1L94vaggDSjLEn5pgcjc8
	 P7A0gjL1Qfpc72GOO9sahWLlDERzukepOVabJ/iKZsjUBBrTY90B5KP0HzWYtnCsypA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
	b=dXWpDxGduaroggbWB/m8Pdz7BcqSAJnEsG+Ol7+U7rVWD+Xj1OjMku0kNHzbXeYuTtcD
	 92Gg2UDC4h43/xneAirBmkytS3g9JJJ/QwcLfWj04hz5IsZtCqbWAIRTZz/z6c7Urs+IN
	 Qh8CmfrEwrO0dk2PN9w2iKznBu0D8oFTu1Qf1H7xV9pnI+Qu+NCL/7Xj6sh9afHaxG//t
	 j+QluRdZ4sNrFulD/mNMYUd70cwph9YRJ9Yn39OVBG9VHnxF0mnl741CT5ikW4DvgL63s
	 tiTurj+Ni1NBV3g6q27obG3Wa5CJ9D47I5rlXya0pUsQJnoLGaaz3dzoxU2Wy4xFPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpqHvE7o;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2980606A691
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2980606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpqHvE7o
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so2398455a12.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574557; x=1796179357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
        b=lpqHvE7oFQMRktUkqjnAP23urMaMeOWlZbyQz8DFAkOKgQcFkgf/wQXFk3odj6kSsD
         1oI/GkxWQ11lVFXOW3Q2khTt1HNOnFvUxixkqdxEH7J/37gWizkM51Bccgz5Vy8VHHoj
         3bd9hJrJx8O0NnkrtjhioYVgiUVJkSrgp2jVx1AcGZZftIyymymXTLkpOzzvwPQ9GISS
         sx93lMp+QLA/J1QItLXS1SlCgf/k57kooLzH9n2vKqyMoh/5ucyvsxEXtL5NCY+hUm0i
         tSjMfaSvKb9cPIN3hcwP+X/Wq+ldW9QIv71lfoHNdwjXk7NLKwoXmANZrV1RAOJVmZst
         /VTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574557; x=1796179357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEExPnF37SF6L15+U7oygTLDkR+EbGh7oqFgruuLRMI=;
        b=lwCd5nJx8c8lWDP8V8dP62XmtYoiYi0/coOoAEzGq+t8De7VykrAYuHzGtUbLzCRv8
         ikutdGOZFKDTAlqx/UeVUJHmE+wVixANdo/KheHxCc0dLWacxZtC29F+PvatcfIGbqqY
         Evop7wHT2hk7sy4gjBXOPHTA64ncRAdXgHo7LcY6bh5Bz2gP25Ea7SVb0W8z1SV4lCYk
         Lo4425wf5BUe9PxLnWpEGoQGbvspLQCXRVmHZJ3d5NT7LcJzc7j+YM0JoZuX8VsWcye1
         xp9pf93W+FKzzH6euhyZxQdOBLS3mOnvAiWZckOvVvmAUw0S4qs83kS70kL+05fI5dtR
         IqLg==
X-Forwarded-Encrypted: i=1; AL+hErGoCsErTYhNj330YMD3wU1/Ph7aGM04yYcr1Itzo25pXizu7PzQnLDLSp8B6Q+R7u/n1cKOtjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X+PElgd+pVM2WRUxVDQp+R009nNKfE66o6ha9byT+yysUTz7e
	tcLlL9qzr7rddPOjUwQB2rWjV/9YmlFjPDXYfaZWkPCGM6ouklakwxJ2
X-Gm-Gg: AZFdTZfqMgt/cPWjlI1qpayXTjt0SM54V6ZsdY5vzQeNrLPA9Tf8MbwZxhbNIHBrl1n
	E6s6a0EyzoImGaMPXvDZovFruw7RKJcjYEDLJFiAUIylcS1jpFTt56xIhFLRhhlM9oeubOklxCo
	rrYfcusC8EVR+ftq9q4sLapNafP1++OTZYFbxhGJfT87yVigGWlVjoTEm+Z3wcnF4sZj1YOojHG
	Stv6KcqesXpDl/0J+51ylMYN6cIzUctMJR5roJlsXiODGBc1SJJfzxQQE9amr8u8gcp6fQd3+Kk
	agX9tbdqnWPCsogXuemZVyMuPuc/uAofifwxMFHsDKn5aBeG6gV+hQ6V04vrhu9eg3bl6bdKys/
	i0Pz8kdJ+DDsIMgYbwUl6nxWc91HwIbRiANgtfYUxX8JEIzj9Hf0hNEfOaWTbacMEv76zQ3GXeE
	YzHdSNN08lX4FzI0sYz25G8SvNQ8gblt2skpiH94qOUaYBKvLC00ZbrXjoMr3CSewuA6JECpWvO
	S2flqQKHN/EbgomHJ3N+pQgu0tVhRFKeju6F9OC34R4YldiXp+UYJ7zvWeXFu4sPbpm3WSnT465
	cStxhNdEkrmV2BCtkZuRqI6JFxh+B2llb2hotCN9+n/u+Xn3WI+NcknCwc8MF52o2E4=
X-Received: by 2002:a17:90b:3f43:b0:3b4:e97:22ec with SMTP id 98e67ed59e1d1-3b41c931cfcmr16259721a91.35.1795574556864;
        Tue, 24 Nov 2026 18:42:36 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm25727086a91.6.2026.11.24.18.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:42:35 -0800 (PST)
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
Subject: [PATCH ipsec v2 2/2] xfrm: refuse modes that AH and ESP do not support
Date: Wed, 25 Nov 2026 11:42:28 +0900
Message-ID: <e5abf3005007d9bf3eab4b640d513856f8eacf6c.1795573672.git.kyuwoncho18@gmail.com>
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

ah6_init_state() refuses any mode but transport, tunnel and BEET, but
ah_init_state(), esp_init_state() and esp6_init_state() accept any mode
and only adjust header_len for the ones they know. For ESP over IPv6,
a state in route optimization mode then reaches the WARN_ON_ONCE()s for
unknown modes in xfrm_state_mtu() and xfrm_inner_mode_input(), as long
as verify_newsa_info() lets the mode through. Over IPv4 there is no
route optimization mode, and __xfrm_init_state() refuses it before the
type is set up.

Make these functions refuse the modes they do not support, as
ah6_init_state() does, so that each type checks its own modes. ESP
keeps IP-TFS.

Fixes: c2d305e51038 ("xfrm: remove input indirection from xfrm_mode")
Fixes: c7b37c769d2a ("xfrm: remove get_mtu indirection from xfrm_type")
Suggested-by: Sabrina Dubroca <sd@queasysnail.net>
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
 net/ipv4/ah4.c  | 11 ++++++++++-
 net/ipv4/esp4.c | 18 +++++++++++++++---
 net/ipv6/esp6.c |  6 +++++-
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
index 6fd642d2278d..32094169718c 100644
--- a/net/ipv4/ah4.c
+++ b/net/ipv4/ah4.c
@@ -535,8 +535,17 @@ static int ah_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 	else
 		x->props.header_len = XFRM_ALIGN8(sizeof(struct ip_auth_hdr) +
 						  ahp->icv_trunc_len);
-	if (x->props.mode == XFRM_MODE_TUNNEL)
+	switch (x->props.mode) {
+	case XFRM_MODE_BEET:
+	case XFRM_MODE_TRANSPORT:
+		break;
+	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct iphdr);
+		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for AH");
+		goto error;
+	}
 	x->data = ahp;
 
 	return 0;
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 111bea0bd260..1bb7c4b24cc6 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -1148,10 +1148,22 @@ static int esp_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 
 	x->props.header_len = sizeof(struct ip_esp_hdr) +
 			      crypto_aead_ivsize(aead);
-	if (x->props.mode == XFRM_MODE_TUNNEL)
+	switch (x->props.mode) {
+	case XFRM_MODE_BEET:
+		if (x->sel.family != AF_INET6)
+			x->props.header_len += IPV4_BEET_PHMAXLEN;
+		break;
+	case XFRM_MODE_TRANSPORT:
+	case XFRM_MODE_IPTFS:
+		break;
+	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct iphdr);
-	else if (x->props.mode == XFRM_MODE_BEET && x->sel.family != AF_INET6)
-		x->props.header_len += IPV4_BEET_PHMAXLEN;
+		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for ESP");
+		err = -EINVAL;
+		goto error;
+	}
 	if (x->encap) {
 		struct xfrm_encap_tmpl *encap = x->encap;
 
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index b287c807b018..ced910d44b47 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -1192,12 +1192,16 @@ static int esp6_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 			x->props.header_len += IPV4_BEET_PHMAXLEN +
 					       (sizeof(struct ipv6hdr) - sizeof(struct iphdr));
 		break;
-	default:
 	case XFRM_MODE_TRANSPORT:
+	case XFRM_MODE_IPTFS:
 		break;
 	case XFRM_MODE_TUNNEL:
 		x->props.header_len += sizeof(struct ipv6hdr);
 		break;
+	default:
+		NL_SET_ERR_MSG(extack, "Invalid mode requested for ESP");
+		err = -EINVAL;
+		goto error;
 	}
 
 	if (x->encap) {
-- 
2.43.0

