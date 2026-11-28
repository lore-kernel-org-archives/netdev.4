Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853225;
	b=JsjKJU1n2/7sdHqSkssxwGOhSR6yFLjc4mqAe8SZ4VkvcXNJKZd78oD9jd03UeD8pa5A
	 BOU5Ui61dgq6dAdHtiLO1g7/+zhixJiQUz80mvY7OR33GNz/wHH+lW1kLauxQ2Fp6Disq
	 J2MsgN1VNGjmVkZMIrVgmniXEZPkoE+IyGuw3frKtYGHdJ+atVn4PmOnLktWZUqDFrBj5
	 dOoOluVVcut5giu7U2kfqqo3wASu8//WSyG08F4/zj67C4Ts04UUn/Rgy7FSH4Pw4H79T
	 t/7n+K5NLS4rQncicDgk3RWAeLWMDHKDRWef5pT8MFsB9DGpYVGUs/6iPgBzefQbJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CrocVESO4mkw9Ptw4vfsZInRzrKeQHoEowQSEZIRE1M=;
	b=171ciXbuu3TGB7D2YRDuFJ/z29+/YUrR2W1pxZxYSreA58/0e3K6ZFD9jaDdF/Vw2QEb
	 Z0sHuBExM4mMtzQdlnaFMYK6Br6ucoyLYFJFsuAa3bnIEGOY/LWHbMhdQ6dcz1WIBmHCL
	 0Dm/uuX9UFzkKTFwcpT0GQTaGThSffCv/vJIZfvZQqhrZpROAYt/6bcosuucyeyqDXCzh
	 I1wxhcPvn4PCBnweUFzSzCEWfl4V0f55+U/6GwjmPXPKbDWEIjY3dyXOszrt6HFP7PPL/
	 cHZF2OEckS1wxAXpXf2gY7k2pTfCfJEp+9X49EJh15kpp9Of1Dg07Yd4eowuSX0zdxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W9Jw3uRX;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F775606A329
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F775606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W9Jw3uRX
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f0578f1d51so91947975ad.3
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853224; x=1796458024; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrocVESO4mkw9Ptw4vfsZInRzrKeQHoEowQSEZIRE1M=;
        b=W9Jw3uRXM9sSGh6abBJnH9N45aSxE5mWZxjpr5Y3ehnbllSNpk3MWq5L7GsoE0P7g3
         78MwX5VuX2KLMElcgIN8jVeaujCB58OsLovEPujodn2tIn2c1dfkOjsXCZYtiAQcJW8h
         fgdGP6NLRbWLoernvECd3XmhfgKvb4YK4z5r9B0q//9FKNjdGtO9RnqW3fS7gYREIt7F
         wIP0UAPIxIwZ0ynWoUoy6+RpXDLfv0Qsb+3mJYqalfiTWZoDubDMFyJC/NlMc+QvuNKw
         JrJ/oTye+dOHH2t6ALjvJoWViZj/NtRpnOrBfwQNy7lrqaOUO9S3vvmIABiLRxIqCFBF
         9xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853224; x=1796458024;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrocVESO4mkw9Ptw4vfsZInRzrKeQHoEowQSEZIRE1M=;
        b=HfxQgofNXlcMW1zqdAW0y2kgFDlm+rpRs5q/aCGgM/iTK/VoA6kXs5lmv1AZZGnYxO
         9+HS2vppf3pa9J+DBn+5FMDoWiuOATSm9y6RqU3lCweD7v53ltOhUb7BRIAqMJ+qM1QM
         LkAenVSB58U8XyRauhj6lPJV76RIyybCKkg9OFd+uGhTOhOfiWwpYgqes00QFswDomxm
         tyHP68HohQ1fq9FAArLJ/HQYiL320ArcjheyoaLkam2tLrmgyfJeekRx/l4naaiqE5t/
         hfnKSdgEmwBJyYjuz0HH/fNlsPQG56fy9wRDjjoV6V0nvkuage3xBBknBE6pRszqHk0y
         L/eg==
X-Forwarded-Encrypted: i=1; AL+hErH95+jSRi+eNNNH6tYB78CUZaiX+c+xcu+cCGwvKEqrvHi8KUfCqFwuJMb6F9gwpRtA+bDfDXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ed1wq5WmLzKxfgf6XrkxvGgViJSkm6LIdRjxQfDmMnYuvNKYN
	WKqFdw1SDiaMT94KxJRtnpzQf/yoiEG7EuF5zCrQkFwlpGjyZdtRDbiyhcZaZ8nUoAYhWasNXJA
	xTDXjRQ==
X-Received: from plbmg8.prod.google.com ([2002:a17:903:3488:b0:2f0:b53b:eaa2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4586:b0:2ef:f46a:e223
 with SMTP id d9443c01a7336-2f03f149821mr281742195ad.34.1795853224355; Sat, 28
 Nov 2026 00:07:04 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:14 +0000
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
Message-ID: <20261128080700.3828378-3-kuniyu@google.com>
Subject: [PATCH v2 net 2/8] tcp: Don't bypass GTSM check for reqsk in tcp_v[46]_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
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

Let's restore IP_MINTTL/IPV6_MINHOPCOUNT for reqsk in
tcp_v[46]_err().

Fixes: 26e3736090e1 ("ipv4: tcp: handle ICMP messages on TCP_NEW_SYN_RECV request sockets")
Fixes: 2215089b2244 ("ipv6: tcp: handle ICMP messages on TCP_NEW_SYN_RECV request sockets")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp_ipv4.c | 19 +++++++++++--------
 net/ipv6/tcp_ipv6.c | 19 +++++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index e001c54cdc4b..fe9cc5b66b97 100644
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
index 5c7ed38f1f56..90426ea9e073 100644
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
2.56.1.839.g22a8290db9-goog

