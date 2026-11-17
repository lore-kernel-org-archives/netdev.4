Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893750;
	b=vPmcN4jHUA5JVh8hJAgw/s+CimvNVLTuWzMzkGv+GxfPtkYgdhA00gXyJmEz7+9ICbDd
	 GrdPKeDf6VfpXsSZRJc6LEVaZBxVgfG0qTraH75DCJP7BFRNO3grCo5XtMJyPbc2bM4MZ
	 FY0qfe4NiXi9ooBmorb2MBhjbuR5cG/INtCLZ9rxB85EumDZgeS9FqzQ/S/prPdf+h/Av
	 66g5iTjSLLoFen/sxykUYHrLB2/84aCOwTVxaLGjJLdk4a9ZpyBZ5rrGtDu1QQji6Hzl8
	 ncHxdstwiB9C1A60aLcXsnSbqH8Cj1cM3eklRkmam1fd2ne3Gd4sSnmLNVcmOvbudDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Upl+B45H/mRuwHSl8scX7fcoO9O92DiSnrI4NdhulJo=;
	b=mz078+8d9uBBYbE+LF1EfFtZ7CClpTRhRQsly+ltCq92WhxKuGCiOGqGndZdiYUQlB0p
	 WwKK/VEPpqjPa97lsoq/JAriI9bv0Oj3WzHP2BONS7mDSvomrj5o+DeSJjbdoudBsUqic
	 XJ6E/WZJsHaEakhVnw+DKicdt5N9PeFE5biHMBRn2IY9nm4w4vkHG/ZsCcqyeejLx/lnQ
	 SNRbjgtoIgtX2MEFSplvv2Mi/pyIlvsOdVmzKZVdeA5Rn7G8d8Im06zqRJ/+g8hDGETAD
	 GWMLliChzeFx7i/Uamm1p8eLUONZMzTsikK1Wqzr/QKXpEsdmhwSZj8+YyWeH2XkeiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aB6fQ8Ss;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10365606A88F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10365606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aB6fQ8Ss
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso3714553a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893749; x=1795498549; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Upl+B45H/mRuwHSl8scX7fcoO9O92DiSnrI4NdhulJo=;
        b=aB6fQ8Ss+G0C0Lv5CalTJGQA2r4R3VT6yfjuCjaq+TgRSrtOu7DB4K3UTjHa88irlF
         saJNRCVwiXUObQEjVGywL9/RWaeGrcYXGG07+gtDFKdPqAv6bwqDSBXfd2wPiaZOmqqR
         7DDdgf39+hQ2KomqbV4zoryyNPVKU5Sk3r8lOpLD2bWteZr0zY6byK4nJUNwD2j+W7Rc
         R4ubl+gX2q2CElZ/yZdLrUWAfOaFNwZufr9MUnvqcbsByaJSayv2LuKaNUW+wfCJgbAu
         G1y/K18zFBgIDjyU3MRYyG1cuWAy1ymXNUoJrEJf0TW5NB0tWXj0jBXNd5gsY1zG+EoT
         FYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893749; x=1795498549;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upl+B45H/mRuwHSl8scX7fcoO9O92DiSnrI4NdhulJo=;
        b=TnpBQ6wrPU8H1zJgqK+UxLSTDd6X4PjiURvYQ/fFnRRRoc+brlvqCwVDcwc6GojGBS
         7g5aDTCzs1q5mUt+JcUgNtLa5eKV345VcakhzXI+BiETWEAnrb+2+v7dx1IdF8JyxYQI
         imGVGHSAJnmaqRlZn4j1RuRxpOaBqXkUgmy+yGbN97Z2LsCkGP3uBB0xXqwuPVq4Cllv
         8YBxRTkEiOOCTP7uEl8xO5ktf4eIB2xhlp7BomPDTtzDq5RuFiuvVC1zTzaebytYT9aU
         mSBsDX83d9JCXGwHPyJzcq5vYw2wePlhkdHVjLQYjAANgBirDuXJUG6+VeFwzTqBlwgW
         +PzA==
X-Forwarded-Encrypted: i=1; AL+hErHo3sAdRG55d6vxtgrgy6FJWYB8947lGQDttDt5Yqk/RWHSI9s1pCr/RvwvyHoCEBGCfm382Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ss3MDlYqc+LUPPAlYzqaC2wmiPfnXOip/X/OzLkMU6ADlYrr
	QtEjYLgDDEmvUvT4gjD6zJ7UXScV9OUhtrHjjwS9Uy9h8MmYMywHjX+10jgKutT9KH8iZ0t4ltf
	H5H7g0Q==
X-Received: from pjbbu21.prod.google.com ([2002:a17:90a:ee55:b0:3a7:d1df:7b34])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c81:b0:3b0:a37a:230a
 with SMTP id 98e67ed59e1d1-3b1b0a1feaemr11767418a91.25.1794893749109; Mon, 16
 Nov 2026 21:35:49 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:22 +0000
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
Message-ID: <20261117053543.84032-5-kuniyu@google.com>
Subject: [PATCH v1 net 4/8] tcp: Fix reqsk abort condition on ICMP errors.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

RFC 1122 Section 4.2.3.9 states the following soft errors
must not abort connections:

  o    Destination Unreachable -- codes 0, 1, 5

       Since these Unreachable messages indicate soft error
       conditions, TCP MUST NOT abort the connection, and it
       SHOULD make the information available to the
       application.

  o    Time Exceeded -- codes 0, 1
  o    Parameter Problem

       This should be handled the same way as Destination
       Unreachable codes 0, 1, 5 (see above).

Commit 9cf7490360bf ("tcp: do not drop syn_recv on all icmp
reports") introduced the abort arg to tcp_req_err() to avoid
aborting connection on ICMP_REDIRECT.

However, tcp_v4_err() still abort on soft errors (ICMP_NET_UNREACH
(0), ICMP_HOST_UNREACH (1)) and ignore hard errors.

For example, we can see SYN+ACK retransmitted after receiving
hard error:

  --ip_version=ipv4
   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
  +0 bind(3, ..., ...) = 0
  +0 listen(3, 10) = 0

  +0 < S 0:0(0) win 65535 <mss 1460,nop,nop,sackOK>
  +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>
  +0 < icmp unreachable port_unreachable [0:0(0)]
  +1 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK>

Also, tcp_v6_err() uses icmpv6_err_convert(), which handles
ICMPV6_PARAMPROB messages as hard error while RFC 5461 defines
as soft error.

But we should handle ICMPV6_UNK_NEXTHDR as hard error because
it is used as IPv6 version ICMP_PROT_UNREACH.

Let's correct the abort condition in tcp_v4_err() and
tcp_v6_err().

Note that icmpv6_err_convert() is used by other protocols.

Fixes: 9cf7490360bf ("tcp: do not drop syn_recv on all icmp reports")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/ipv4/tcp_ipv4.c | 7 ++-----
 net/ipv6/tcp_ipv6.c | 3 ++-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index fd9588bba967..f11e090d04fb 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -529,11 +529,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 
 	seq = ntohl(th->seq);
 	if (sk->sk_state == TCP_NEW_SYN_RECV) {
-		tcp_req_err(sk, seq, type == ICMP_PARAMETERPROB ||
-				     type == ICMP_TIME_EXCEEDED ||
-				     (type == ICMP_DEST_UNREACH &&
-				      (code == ICMP_NET_UNREACH ||
-				       code == ICMP_HOST_UNREACH)));
+		tcp_req_err(sk, seq, (type == ICMP_DEST_UNREACH &&
+				      icmp_err_convert[code].fatal));
 		return 0;
 	}
 
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 0f1523fff939..29fd0a084c91 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -447,7 +447,8 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	seq = ntohl(th->seq);
 	fatal = icmpv6_err_convert(type, code, &err);
 	if (sk->sk_state == TCP_NEW_SYN_RECV) {
-		tcp_req_err(sk, seq, fatal);
+		tcp_req_err(sk, seq, type == ICMPV6_PARAMPROB ?
+			    code == ICMPV6_UNK_NEXTHDR : fatal);
 		return 0;
 	}
 
-- 
2.56.0.679.gc527c65306-goog

