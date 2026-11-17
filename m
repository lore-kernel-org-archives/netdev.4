Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893749;
	b=XCF9Z/hbNGPgLP37h8RUWMUUPjP8GjI1jgf8EhIf3ab8RAjWnqpyAYVLGaFOQwTm++tE
	 MZFJn02ODGTemHg16+ccPr/zatYnRatEoE0sXRhcrAB7pWbIP/3I1kwOdTOQnBb/FLOUI
	 TKUbE6YUi20zZBqt2k1afU2p3m1FmPMITL0c3hhg4Mx7xPGrVz68C23o5z/SCJT21g5lI
	 VOWRyCQUJIgAi3bp6rESlxV0W48F3zo4INpaeXp1qtWviG0UyklpMcZlovGHa3IfAaaNw
	 mfizrjCELE5zPZLBuVM0D4YEhDWXvaEBshJPYx5aE8jPsUgpjU57DfpU5hsIgnBRr9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QRSpBiL6+Lq/tS0fSX7UPVfIfRXOAg5ZhDHclip+vfI=;
	b=cbmBdJKy2wyBEMasluwjdoHEpJ2KYiTz47YqbmTY2oKosQP3K+Ob8j4pRX9sFeWxccOa
	 IATqlNr5dB+Azd5a2R5YmqNNBdkarVxP+ayPUHUEsM9n5z8MD68qg1oG4eynYGjs1Mhwx
	 Y6HUlCsHDKBdYP8BpUSmTOe4bgtUdO0xkCYMg00uLo1EP2bZlCE/HtYA84FqM/9hFDCBD
	 2eEC5KPy9NAtEcDv2Sh++H5co/H0c+b0eoocbyExQ2v1jSuMxPSBtY3Hs8S1cy0mUGqZ8
	 Z82sLQ+r4GOyIYWjAlM4oC2YWvxCEwXDHMwiZUEDmRPSzvGlN3+cvw53IOdzuCw4M9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l6GzDZ71;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ADF606A884
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ADF606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l6GzDZ71
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso3714544a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893748; x=1795498548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRSpBiL6+Lq/tS0fSX7UPVfIfRXOAg5ZhDHclip+vfI=;
        b=l6GzDZ71qIF7YeaADgHrUC4/FpMC9hcekyE1Hc+u05i6qa/euJDJ5DTny2GNdoQprt
         h1r9iVUDI0pFtUQUsDPaiY9RKcMdnjTxzSGufLv+NB9m+erbiKDYeBbdCFGL3tp2Y1mw
         qxM/MjAoaBbM7lu2mLMENHx2Nj0aAGbO+5ov9F9zFYqjI97FvVbEZLMcks8YvZ5E4a2O
         KkHWDtPw9AvqlMebfIP7TvXKruOisrt/nmJhYf82O3eeJhyzmLNk9oKtBsuvnfLTinrb
         gWOShw5SkShiYmkZs/GAJZcZW2YUBU690cAskzUZHNOpUOle2zbetcIxEVB0sMrpw4JB
         Z1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893748; x=1795498548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRSpBiL6+Lq/tS0fSX7UPVfIfRXOAg5ZhDHclip+vfI=;
        b=P2aClDm0ShR2cU1t5gz7Nhe1amrJ0+KBuVi+PAd1PC0sxbiiDj5CsS3YLXpFb82Xf5
         baqaj98YjMpi/Li0ZSGNaAdidK+gE3d9jT+H/20483Bn0AQg1adssZMCJ8ymAI5Dd/DU
         trz39/1uRRbeuxdS5mLecYchydxbmrXlLwIz+E++CuDDxYQyr1wQLTQH37JELKPu9LoR
         sA92l72qbEpd5P/yGhgtyxelnNPNNUCSHCX2uLxVghkLzulAoFbWVfNI61p43toJri+b
         PLoCYWzVMOUR7isqFdWVbxqOkWfIKcMFPjtMWX96JzZz2QVoT/fNuQCeWFAemZqO3R6W
         oRyQ==
X-Forwarded-Encrypted: i=1; AL+hErGGuTvWyUgUdQx4OR5DLKb0yp775M2WbFAfZChOoPixXFiGjMBhDXU286GBpH02MDA9zk25oIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AbAjUasrk6JEVly3l/+DQ5MGeFM9aDoB+bvYtbEdiWu3fC1gE
	SaRz9n12ck9JSu24JYtUQUYvX+vGvNx+6yPziBgNUXO6W+x7DPeFYacOLamXSRru3CndAnH+aGj
	Apq2Ozw==
X-Received: from pgq11.prod.google.com ([2002:a63:104b:0:b0:cdd:b3ae:c565])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:908a:b0:3b1:bee2:223d
 with SMTP id 98e67ed59e1d1-3b1bee22478mr7518322a91.53.1794893748238; Mon, 16
 Nov 2026 21:35:48 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:21 +0000
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
Message-ID: <20261117053543.84032-4-kuniyu@google.com>
Subject: [PATCH v1 net 3/8] tcp: Don't bypass GTSM check for reqsk.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Since cited commits moved up TCP_NEW_SYN_RECV handling in
tcp_v4_err() and tcp_v6_err(), ICMP messages bypass IP_MINTTL
and IPV6_MINHOPCOUNT checks.

The minimal repro is:

  --ip_version=ipv6
   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
  +0 setsockopt(3, SOL_IPV6, 73, [255], 4) = 0
  +0 bind(3, ..., ...) = 0
  +0 listen(3, 10) = 0
  +0 < (ttl 255) S 0:0(0) win 65535 <mss 1440,nop,nop,sackOK>
  +0 > S. 0:0(0) ack 1 <mss 1440,nop,nop,sackOK>
  +0 < (ttl 1) icmp unreachable port_unreachable [0:0(0)]
  +0 < (ttl 255) . 1:1(0) ack 1 win 65535
  +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
  +0 accept(3, ..., ...) = 4
  +0 %{assert tcpi_state == TCP_ESTABLISHED}%

Let's restore IP_MINTTL/IPV6_MINHOPCOUNT for reqsk.

Fixes: 26e3736090e1 ("ipv4: tcp: handle ICMP messages on TCP_NEW_SYN_RECV request sockets")
Fixes: 2215089b2244 ("ipv6: tcp: handle ICMP messages on TCP_NEW_SYN_RECV request sockets")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/ipv4/tcp_ipv4.c | 19 +++++++++++--------
 net/ipv6/tcp_ipv6.c | 19 +++++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index bf8542368032..fd9588bba967 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -516,6 +516,17 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 		inet_twsk_put(inet_twsk(sk));
 		return 0;
 	}
+
+	if (static_branch_unlikely(&ip4_min_ttl)) {
+		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
+		if (unlikely(ip_hdr(skb)->ttl <
+			     READ_ONCE(inet_sk(sk_to_full_sk(sk))->min_ttl))) {
+			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
+			sock_gen_put(sk);
+			return 0;
+		}
+	}
+
 	seq = ntohl(th->seq);
 	if (sk->sk_state == TCP_NEW_SYN_RECV) {
 		tcp_req_err(sk, seq, type == ICMP_PARAMETERPROB ||
@@ -544,14 +555,6 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 	if (sk->sk_state == TCP_CLOSE || inet_test_bit(DEFER_CONNECT, sk))
 		goto out;
 
-	if (static_branch_unlikely(&ip4_min_ttl)) {
-		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
-		if (unlikely(ip_hdr(skb)->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
-			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
-			goto out;
-		}
-	}
-
 	tp = tcp_sk(sk);
 	/* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_child() */
 	fastopen = rcu_dereference(tp->fastopen_rsk);
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 8691d220cf94..0f1523fff939 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -433,6 +433,17 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 		inet_twsk_put(inet_twsk(sk));
 		return 0;
 	}
+
+	if (static_branch_unlikely(&ip6_min_hopcount)) {
+		/* min_hopcount can be changed concurrently from do_ipv6_setsockopt() */
+		if (ipv6_hdr(skb)->hop_limit <
+		    READ_ONCE(tcp_inet6_sk(sk_to_full_sk(sk))->min_hopcount)) {
+			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
+			sock_gen_put(sk);
+			return 0;
+		}
+	}
+
 	seq = ntohl(th->seq);
 	fatal = icmpv6_err_convert(type, code, &err);
 	if (sk->sk_state == TCP_NEW_SYN_RECV) {
@@ -452,14 +463,6 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	if (sk->sk_state == TCP_CLOSE || inet_test_bit(DEFER_CONNECT, sk))
 		goto out;
 
-	if (static_branch_unlikely(&ip6_min_hopcount)) {
-		/* min_hopcount can be changed concurrently from do_ipv6_setsockopt() */
-		if (ipv6_hdr(skb)->hop_limit < READ_ONCE(tcp_inet6_sk(sk)->min_hopcount)) {
-			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
-			goto out;
-		}
-	}
-
 	tp = tcp_sk(sk);
 	/* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_child() */
 	fastopen = rcu_dereference(tp->fastopen_rsk);
-- 
2.56.0.679.gc527c65306-goog

