Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853226;
	b=J/9ZoWfFLXAuOyE+HkDM/TsHGTnXq8t6fuvAOMS0zodcc18AER72IBCW5sr/Ta3vhYzb
	 PJx+cvPTuZJnwg6i7H+efZ5jQR1S0+zHrT8jPWRyjP/b0vCQshTO3Ligl26m9cBintsU4
	 VAijcEs247HNwpHkII1ERT8XHrhvzmlbPVm1jdwU86qExYx5qf4/qFSiDSINQyACyponX
	 Tqglk0yVTOewhQIRhLRpBree+bTgVzk43AsHkT6Z0obMsUVr/8AvOP3cyrqvGHn/OrZ2A
	 CPn+KvdBT7Dn3ZAvY+W0BgErOOYVyrdsKVl0ygWc90Na/V2sa25hzdwsOUlSUbN6iKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=3zOU248e0HS8AqJHoonLf9cpOrvrZWu/vfhMI1YKMc4=;
	b=zg+gDbk3sxbiq90M0R1YtmBRl6Fvx8Vu7LLXtnQ4kjf1AeReiX32qboQESjAH4Vd9iG/
	 kgBiBp/wMirrvkA4GD4+IAl6lbhurU8iTnUXr0xoJvBsqwnw/BuMNAEVGcVJ3X0GMFuzX
	 a3WI41c86fp4vEYuHDcqUtGDshGlMEVxUQYBpsAY4tN8xfM2VHTI4KHkA+edoVoYhw7l7
	 sLRXvZowgm3oI/JMVpSUkkdlUeqhBKoUq8MxMx1c6u/wMVYseqt/K1+7NcJseBYT7N3gQ
	 nA67AIFfWIKVsn27xgIkGPropu79xaAqkAD4x0Ch77Qkx2EStkBpbX+smfozGvaoeDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GPKqrLqt;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0604606A326
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0604606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GPKqrLqt
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4cd0f7abfso5938188a91.3
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853225; x=1796458025; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zOU248e0HS8AqJHoonLf9cpOrvrZWu/vfhMI1YKMc4=;
        b=GPKqrLqtKmEWxiu8BKt9iKq8wLUJpZ2wx2sYKSnRCWhsqSCRiudQpnwmIfp2+rDR1X
         FkftEmKUGCUS98PMZNUZmJTF5K4tcjcXcIAyK3Fd75iwZ8bpITCgZfUypksi2SnYdee9
         BoBqA1A4jKF2Vx8lsdt8iP5Efk8hMK+CMDstBintGKqCjnwlbbeD1BxxiRzg8fYf1QjZ
         bvfT6nmEHvexaSw9ev9Hils0SKkBMRwO7l24Rxe1O+jXRDNlMU0hbb1hC8eXEddu7iCY
         iKrRlgFrltmMASV9TI+/3+btbSDIlXLHQ4kIOBXZ+QqDUf6Iifb1zb35ttD29SyRyRPs
         +6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853225; x=1796458025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zOU248e0HS8AqJHoonLf9cpOrvrZWu/vfhMI1YKMc4=;
        b=Y2SuoyNXH+vzY55aafwdxN9Bdu8ZIXuZKmMROl4fVkZd0SAzB86XryyaqHFv34z8ta
         LleG2ivd4XpSbtIkGsgw6Xf9hehJ8kpxi48OkWWAFSpsMKfKn/bbrppcgKppi2PmQ549
         NnkWI/K36kBmlpGhxIEsKyym/FCXrSDqTdHThS7iZatqpX9M1VkT43nLcpIEOytTcuTv
         sUUUsYWEDJulNVsOHe4w/cTgSSyth1rDL6w1/h5EAkToTheIRfm8/eB1AgE9TD39fq5N
         QZzJ8wweSk5moMlRXmQbaSG+FJomDpVEXhPsL2ZqWXC33o7C31dDc3dwcgkrs6NqFrNg
         oZEw==
X-Forwarded-Encrypted: i=1; AL+hErHf5cNkMQKxp8VWFx0GC9dPTajGzWxpvJNSYsrb1kaaj3nfB2qAHI/NhBONJs9u7Nzb7gq4L8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UuKg/+PfJ4ZKLzpD58sm5CFeolDCuhIGZdTFxDhenLa6hu5Pf
	MnHi3gvhc7QZ+SMlScT7j713M+iikEvOnw9+nCTF8BxpFRxacbw5etPUiuNgf6N7RDiMPWoySGC
	eBJIDwQ==
X-Received: from pjbmf4.prod.google.com ([2002:a17:90b:1844:b0:3b4:2a5f:97bc])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70c:b0:3b3:c04e:4b61
 with SMTP id 98e67ed59e1d1-3b41cafe407mr28014030a91.47.1795853225079; Sat, 28
 Nov 2026 00:07:05 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:15 +0000
In-Reply-To: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261128080700.3828378-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128080700.3828378-4-kuniyu@google.com>
Subject: [PATCH v2 net 3/8] tcp: Don't bypass GTSM check for reqsk in tcp_v[46]_rcv().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The cited commit added TCP_NEW_SYN_RECV handling just before
the GTSM check in tcp_v[46]_rcv().

Without this patch, we cannot see SYN+ACK in the script below
because the ACK with TTL 10 completes 3WHS.

  --ip_version=ipv4
   0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
  +0 setsockopt(3, SOL_IP, IP_MINTTL, [250], 4) = 0
  +0 bind(3, ..., ...) = 0
  +0 listen(3, 10) = 0
  +0 < (ttl 255) S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
  +0 > S. 0:0(0) ack 1 <...>
  +0 < (ttl 10) . 1:1(0) ack 1 win 65535
  +1 > S. 0:0(0) ack 1 <...>

Let's restore GTSM check for reqsk in tcp_v[46]_rcv().

Fixes: 079096f103fa ("tcp/dccp: install syn_recv requests into ehash table")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/ipv4/tcp_ipv4.c | 10 ++++++++--
 net/ipv6/tcp_ipv6.c |  9 +++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index fe9cc5b66b97..4b6bc7812cb1 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -2135,12 +2135,18 @@ int tcp_v4_rcv(struct sk_buff *skb)
 		struct sock *nsk;
 
 		sk = req->rsk_listener;
-		if (!xfrm4_policy_check(sk, XFRM_POLICY_IN, skb))
+
+		if (static_branch_unlikely(&ip4_min_ttl) &&
+		    iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl)) {
+			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
+			drop_reason = SKB_DROP_REASON_TCP_MINTTL;
+		} else if (!xfrm4_policy_check(sk, XFRM_POLICY_IN, skb)) {
 			drop_reason = SKB_DROP_REASON_XFRM_POLICY;
-		else
+		} else {
 			drop_reason = tcp_inbound_hash(sk, req, skb,
 						       &iph->saddr, &iph->daddr,
 						       AF_INET, dif, sdif);
+		}
 		if (unlikely(drop_reason)) {
 			sk_drops_skbadd(sk, skb);
 			reqsk_put(req);
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 90426ea9e073..7c17162160ad 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -1792,12 +1792,17 @@ INDIRECT_CALLABLE_SCOPE int tcp_v6_rcv(struct sk_buff *skb)
 		struct sock *nsk;
 
 		sk = req->rsk_listener;
-		if (!xfrm6_policy_check(sk, XFRM_POLICY_IN, skb))
+		if (static_branch_unlikely(&ip6_min_hopcount) &&
+		    hdr->hop_limit < READ_ONCE(tcp_inet6_sk(sk)->min_hopcount)) {
+			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
+			drop_reason = SKB_DROP_REASON_TCP_MINTTL;
+		} else if (!xfrm6_policy_check(sk, XFRM_POLICY_IN, skb)) {
 			drop_reason = SKB_DROP_REASON_XFRM_POLICY;
-		else
+		} else {
 			drop_reason = tcp_inbound_hash(sk, req, skb,
 						       &hdr->saddr, &hdr->daddr,
 						       AF_INET6, dif, sdif);
+		}
 		if (drop_reason) {
 			sk_drops_skbadd(sk, skb);
 			reqsk_put(req);
-- 
2.56.1.839.g22a8290db9-goog

