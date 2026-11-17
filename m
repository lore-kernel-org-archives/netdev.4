Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893751;
	b=m/gmP4HV94QeXfULtOHOlqK5BpjSS/zfLAA6EPVD8qXYy3SoHq+IXw2m/RmbTCqQzOws
	 kazpTvFWqJhRzUh7zwXs4rGz9nKWJE+jl2Vh3ZW10gmCWFUvERbuJFTWJMnmtyugOsmtf
	 qtZKeYhWAMthw4VX7Jzbcly+OvT77w5xPJkxD//nFAPPTpT1L5rBwxdPIy+nv5rLS0812
	 Do+ly13MLBtr5tUnXF0o5LNI5w825k92xhF7gJp+8gFRV3y0WrKYMTIH5lJpBFxs7T0M8
	 1kpwXtyAk/V2p0ER9psKs/je8OND3aLvY4u7mXqklnpr2yPbVyTP5BWRmUKo/FQ174Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=17DZTYfWwpRB59ASjYxqwaUzzsw81ZAfFj6+93FQA2g=;
	b=tzzwcKnSYPyNpIa+NLqnyB+m5ytXTkOOJ89lfPNGuiZXNYlWCAAvixTQMbFXPVk+Kqft
	 ymGgrNn8PUzBXCHS+8AaaODhe9MTRGq7evBcaqc8MXNfX3Od6gbUVFZrRDxF3i8ra8HKn
	 LKGaZAb7XwKUN0Q/qQcfKqtxKiUKoGZH5kkhjyM8JKwk9VszawEN9f8Kbb6/V1Ii353zz
	 Fbvu2Ty4z6YM6vfVmFC+cd7/5uQVzqwcdSLy8OLW0LNu682mgYDPfBR6+FRiu7+FY9LAR
	 wZfjr4vyJaI8V1BF58oaPtFiJ6jHs1Fa0RArnas7GvZFnxHHOYFGBnDMHmU5nZOgNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YaRHw5F4;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AC2606A898
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AC2606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YaRHw5F4
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efa9aea3c0so30177325ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893750; x=1795498550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17DZTYfWwpRB59ASjYxqwaUzzsw81ZAfFj6+93FQA2g=;
        b=YaRHw5F4unkUvNuxQ/dbXHA6JpwIyblpmSC9Cz/tip5wd/TxIK8ZZ6vFDMVxYFH7Ch
         rOAwTzuSrMvF7tjs/t09e8kEijVuq3os9cFQ0TpjaEqo4Cq+rKYXoytq8ILqiCDm1ZWh
         tg9kvOF/+8rLGB02iIJkt4QaYdBzDLzD0CXgCZiYhpeHp5jCAu4vrTnONaLpIM5lLtbE
         Aj9Ke++na/ZibxtVaj78neXh3YmOcAGljGMj4gq3LxeN8hXGhHBAIO4i1HgNqVw+Fitr
         ao44JsTy8gN2GpgFHH72iA14urC07vROCH6DTXnhk708gJacS7EUTXgfzNZqZLfzQTty
         g2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893750; x=1795498550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17DZTYfWwpRB59ASjYxqwaUzzsw81ZAfFj6+93FQA2g=;
        b=lFSbF5SlF8DkidyUYOLf5CfV+ZO1Ff/isyqRzeC8coct1gMdJ3ihz5TOL3z5FTZBng
         QV3oYoo7Lqfy4OVi50/UG09ec60fA+k3+25ehr47D8HJuAE7kK68Mrz3hWStSiAKENVl
         CvkCcxCQF12jm2YfzTAAECUzvjnlAztUSLGph9VBWKEaucxFmrSincDf1L2gXBrjLDg3
         LTcDqcLlwulvD7Bz1k4nat4wxtJbAJL0XK7DUYKO6emQ+IiiDTqYUpx6WLOdb6FiIGuu
         1M3PgawgINwzjMn8bdVQoEYZoTaVbvv4XQTWdYCVlWNxmmdprpoO7G1A/hwB52Bk96xk
         hZSw==
X-Forwarded-Encrypted: i=1; AL+hErHtF3s23hENGaIvXGPrTO0MPmmOUnTc2VKlvlytyEfhguRMom6VSi/b7klfLTK9bRLr6dHJZ8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7a1+FKtnZSXkJlHcZ0tfkO7CO8KT+iceFIDj2gZyDHq6gqib8
	rdCV3iPCn2es0qutRPFUPzWD57btXJL6OJNIJqB4tExhymImfGqixJZlbZ9tbGW9Nf9fdTq2S77
	x7e0x3Q==
X-Received: from plps18.prod.google.com ([2002:a17:902:9892:b0:2eb:515:b000])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d550:b0:2e9:6f2c:71b9
 with SMTP id d9443c01a7336-2ee0d6654a8mr123742985ad.1.1794893749901; Mon, 16
 Nov 2026 21:35:49 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:23 +0000
In-Reply-To: <20261117053543.84032-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117053543.84032-6-kuniyu@google.com>
Subject: [PATCH v1 net 5/8] tcp: Check ip_sk_accept_pmtu() in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
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
---
Cc: Hannes Frederic Sowa <hannes@stressinduktion.org>
---
 net/ipv4/tcp_ipv4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index f11e090d04fb..bc909fedda3a 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -391,7 +391,6 @@ void tcp_v4_mtu_reduced(struct sock *sk)
 		WRITE_ONCE(sk->sk_err_soft, EMSGSIZE);
 
 	if (inet->pmtudisc != IP_PMTUDISC_DONT &&
-	    ip_sk_accept_pmtu(sk) &&
 	    inet_csk(sk)->icsk_pmtu_cookie > dmtu) {
 		tcp_sync_mss(sk, dmtu);
 
@@ -588,6 +587,9 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 			if (sk->sk_state == TCP_LISTEN)
 				goto out;
 
+			if (!ip_sk_accept_pmtu(sk))
+				goto out;
+
 			WRITE_ONCE(tp->mtu_info, info);
 			if (!sock_owned_by_user(sk)) {
 				tcp_v4_mtu_reduced(sk);
-- 
2.56.0.679.gc527c65306-goog

