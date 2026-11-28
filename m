Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853228;
	b=Alg4JvIr5VWLyLD2LfIILcKGB77HqI8ZVXl1SGxMSx2RWh45YpkMgD0aoB/To10AZsYA
	 I9uWxbYTKUZUbLmh4oZNuXrz17aNmD4uxnALOYUxyI7102zy1rByPrh2SgHbq/P2YOx8Q
	 5iPuBZrOW3OPwBEPcGfMMTFQmMiCm22snYCwQnGtbQnXFFceSqmcyEEMZaeA1lX/66KcV
	 aCb+R4pAqmEgl9Bp3OO4HE1mIFB+bcqqvtN5GFA7QdtEPnyWUPkuon+6ktiqphpEPzdeQ
	 8HxxZJPBj7b7IyEOvpI0NzXeoVf8BeIu5LnS2x3ljdIGdFiMeFYj01FIXiHNZqJi1Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9UVbQYkFbGEm75TrZqLkO8hxGwTEDnFKDrFEOf1iYn8=;
	b=jmPQWlPjL0eGsh/l5pZWR1nO9m+JqcQjEG8VM4CAfwpkeDQMZrvXB1XLupbdLzCQiHc/
	 Y6W50RaObbSMo1GRgFno0Ifi6e6/rWlOPtMxyvPVvmpPYORUHcyroiSMyeHYPj2aZw0zg
	 X2/ijktPKZ9iHFwXlxvuRS6BXlU608CmzuJrA5RLzpGL8qxcwHdFu8jXYIbTozCIu5MVh
	 bvFuATDvCYqe+I+C9ruCb6HH0YOCPXqj1IJp4X+xqCP0PxA2wJENerGNsCn0ui6QdTIJX
	 b9I1g2GTFqNF0utvtJHtb9Fh+IPD2oUXa6pCjSdJj9xy/O0Hp7f0iSw0Ehu4BGqT1OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=frhFnucG;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD33606A682
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD33606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=frhFnucG
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41aa2b9a8so5848442a91.3
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853227; x=1796458027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UVbQYkFbGEm75TrZqLkO8hxGwTEDnFKDrFEOf1iYn8=;
        b=frhFnucGo4He+q+1B15u8+LMCJWfEQ6nVwd/VOH+jUP2rtlsOmMDtnurxSu1aiWebk
         n8bl84IwJce4bQaXKxTbB9YhvsXwor0SbrfkQsHBSLLQsy8xDzqlCtsepcwvFVxXrVaS
         tZ+bA66wXgUpeo2neyPP3wWGSXqGFg3T6jH21On+rrab07TD29LzFfQZpN6NfJos6Aqh
         MtUAazQ26R4YkmF93lBkBpSwmCtBERClAOue+/zY6ETpa/a+aj/qtBMHp9ihzRDmm1Zg
         HsH/0FIUrfXmEu48A1fpC/CBZ1Y1XxTI6pixOKqhx09DyOOJ4CG16xrmgNF3m3fH2fWH
         VC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853227; x=1796458027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UVbQYkFbGEm75TrZqLkO8hxGwTEDnFKDrFEOf1iYn8=;
        b=ZJHgE4ibDdu6aigEhkVqZwh/s6VYq5Z7z3guH/ZReHTW16k2i60a2wPQp2JH0FDfYT
         1Dy9B2nSPup/XcLkme8NShP4ATF7K6PAABbHxNfeVE05mXc81MQcD5br9ydxExIL0NOq
         5Gfiul61EeBaWUSnbJCjg/+TwMIVgB+hcctnsFuEp6o2ZBfpR45pumUcrhGuOMqsB+uP
         Rde4S0b9EBhFIqpt26LjfglOUOdFPxD7XP14ohsZypx8wngtbrSG1RcULOlFH+K8PhDd
         WIX1VdPTFKpFnGlHsNOZk+phTofNd9auwDy9oQiKSjwrmqrCCFxTyDsxbppxVvUFFBLB
         mjmw==
X-Forwarded-Encrypted: i=1; AL+hErFyc/UTjlz4f+s11r+eyR9V540ezjffTUIUZFZfpTExfTnpwRHAOGVDGY+FogDbgR5cTd3NRr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q75JBz8felYzFoWm8MUicgGULQzqVOHiKjp0SSTFG7P1W/nsj
	tyFm0UC1KUH5aPU+l9RaUf5Fdqo9asHGSxjRsUMQrVU1Fe5w8CwEJaFlOTC5KGh32dwQ5PQo74t
	mUom1yw==
X-Received: from pjbds18.prod.google.com ([2002:a17:90b:8d2:b0:3b4:119b:583a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ecb:b0:3b0:e2a9:3466
 with SMTP id 98e67ed59e1d1-3b41c98a1d1mr23693215a91.16.1795853226726; Sat, 28
 Nov 2026 00:07:06 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:17 +0000
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
Message-ID: <20261128080700.3828378-6-kuniyu@google.com>
Subject: [PATCH v2 net 5/8] tcp: Check ip_sk_accept_pmtu() in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>
Content-Type: text/plain; charset="UTF-8"

Currently, tcp_v4_mtu_reduced() checks ip_sk_accept_pmtu()
after calling inet_csk_update_pmtu(), which is too late.

Even if we configure a socket not to perform Path MTU
Discovery with IP_PMTUDISC_INTERFACE, ICMP_FRAG_NEEDED
can overwrite MTU.

The last getsockopt() returns 1200 MTU:

  --ip_version=ipv4
   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
  +0 bind(3, ..., ...) = 0
  +0 listen(3, 1) = 0
  +0 < S 0:0(0) win 65535 <mss 1460,sackOK,nop,nop,nop,wscale 8>
  +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 9>
  +0 < . 1:1(0) ack 1 win 257
  +0 accept(3, ..., ...) = 4
  +0 setsockopt(4, SOL_IP, IP_MTU_DISCOVER, [4], 4) = 0
  +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) = 0
  +0 write(4, ..., 1000) = 1000
  +0 > P. 1:1001(1000) ack 1
  +0 < icmp unreachable frag_needed mtu 1200 [1:1001(1000)]
  +0 getsockopt(4, SOL_IP, IP_MTU, [1500], [4]) = 0

Let's check ip_sk_accept_pmtu() in tcp_v4_err() as done
in tcp_v6_err().

Note that inet_sk(sk)->pmtudisc is configured locklessly,
so we do not recheck it in tcp_v4_mtu_reduced().  This is
same with tcp_v6_mtu_reduced() too.

Fixes: 482fc6094afa ("ipv4: introduce new IP_MTU_DISCOVER mode IP_PMTUDISC_INTERFACE")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
Cc: Hannes Frederic Sowa <hannes@stressinduktion.org>
---
 net/ipv4/tcp_ipv4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index f7fef1dd8780..767f84d94aaa 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -391,7 +391,6 @@ void tcp_v4_mtu_reduced(struct sock *sk)
 		WRITE_ONCE(sk->sk_err_soft, EMSGSIZE);
 
 	if (inet->pmtudisc != IP_PMTUDISC_DONT &&
-	    ip_sk_accept_pmtu(sk) &&
 	    inet_csk(sk)->icsk_pmtu_cookie > dmtu) {
 		tcp_sync_mss(sk, dmtu);
 
@@ -587,6 +586,9 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 			if (sk->sk_state == TCP_LISTEN)
 				goto out;
 
+			if (!ip_sk_accept_pmtu(sk))
+				goto out;
+
 			WRITE_ONCE(tp->mtu_info, info);
 			if (!sock_owned_by_user(sk)) {
 				tcp_v4_mtu_reduced(sk);
-- 
2.56.1.839.g22a8290db9-goog

