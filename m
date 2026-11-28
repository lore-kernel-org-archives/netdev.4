Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853227;
	b=baAa4gHW6Da9YibTqVQRAvqSZt9m+K4HysPzEVBtjGaRbLBLjl5G7cGKFWa3zyksx9Oa
	 yvG0fY9fK4DB3si6tzDZut014JqHoJlkvaDWdkLyWTtrNUFRRM6h4bvORMQ524Ofo4k1O
	 Ewgo3mG9aizjbD/pgE3dqSkNTwaEZDRazBdpDCoAsLtLjC2T59QnnGjT6jOCd+pnCl9oQ
	 dtWyUJAaS47e/PkmsBPMCEjJWFgGPVVd7byyPvuwQYN0Ij3AIw+6TwhOMEudRZi+U6aD6
	 XVLJ2uA0enueEnETrqFBFAgL+qRdw1trDGlLHyvt+Xiq8h/hmCEO3rStURwsNzh4MWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PuPuzHnYgwu3lNEL4ZzWNgVPQ2rln9oxlEjwyuLALt8=;
	b=VkFJZu2cwQTDjSqmJZm2CuEiH/LgD7gZruosXD8HNXmGu/9Pkbq6LyGTA6Z7aaQY4DWS
	 McOR2GFE5ruJcTzDY2XF+AmBAqad0YDc01ol16miKQ5haJ9PBkPVuirE/KH/HG2X9sTIc
	 g/3j5+E1pkQbDac7svfaJI8VKz3WgjFN7luqr08++CyFdcp4NNigE/uVH1WSEcuUkFmNY
	 gdw1XN/c+2JOqAvs0ZieTonQi/nX3HT5xc2FyouceRj4PJfvkX/WhcMqoR/UrMFSVbFnE
	 hMruRXb2W4+zCUE2uP1Guz+lM3YdkUJWH2UZ8FB2RT3/e/U5YJhnRBX7/CQ2sJJYajw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mIaDeYoj;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A78606A32D
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A78606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mIaDeYoj
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05b674e3eso65293265ad.0
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853226; x=1796458026; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuPuzHnYgwu3lNEL4ZzWNgVPQ2rln9oxlEjwyuLALt8=;
        b=mIaDeYojohXSbV7O6it1aoIHJI275DUP9VmIY0Lt9UVICiy9FYE4ynPeCnY1IUu8rA
         ect8Rg+W0Alf4fDOBMH28iDY3Od1emTlQ+Ais5c7yhAMuvAgCnqW5HnvxtxWGTG7Ge6l
         KOxO8INpz39ebg87K+qKgCiuO/A3Te0iRsL1uPxKdp9fUxMk6rh8GYAM9JzsDblJcfYI
         Tj+NTTN38is33dnUD+/KzX746ZowbRH4+MOoK7TBwLAemIyi0qQa7RD2vgPecdsrtBUg
         4GvPQwFxSkpMbutqYUWW526GAkQWVnB3KAW+NEvLdDa7gi4BErrbzvhgSrJyESoxVZK1
         xfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853226; x=1796458026;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuPuzHnYgwu3lNEL4ZzWNgVPQ2rln9oxlEjwyuLALt8=;
        b=c92zqOF+HYKjW40eleQnVH/yvy01+p+nzUyjDR+ctlpljtIlSeK4jwVY5m/bQ0CxjL
         1m9jtEGVgDL8xayTL1nsF4Ktt2CZEcErJrFQGzFH90EZNmiGzc7ZMtMzpYRfHcHgcz/M
         GRK4dhqckYZal+MDDrv75/F31uz+TQD7eNJ3B4nfQXJvXK7cjL7UrREI3pUXvJzOFJtx
         2dUZlAcxYSSBhVthdLTGVJxGeIjh1FnyeNYrPMD+49vhX03mPYp39BG1HtXPwP9EORQp
         r904uADOMVl75mWl9rXsEtZC73OIgu9cTaOkn4q/Q2UqfVP6XFgS0hR2f78ZfN7CRSdh
         pi2A==
X-Forwarded-Encrypted: i=1; AL+hErHjxWbxZ//rqXJPmXPXW79hH35v33WmlBdQz3ifgOBDX/N0b2bjSJ9ckvnBPB5HYtcm2ADoBVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KSIQCw6+d86/CLoB1bIOFCZvmWMhg0L/Tv6/xQacE14TkOkM8
	JPtoCaoKghL1O+w+kKDl+lsUQq3cLw7XX8n5CBYONzukAZ1102HvACN4n+SestlALzrwHYqcbU+
	Iz03NSA==
X-Received: from plhx13.prod.google.com ([2002:a17:903:2c0d:b0:2f0:38dc:b8f6])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19cb:b0:2e5:c563:c0dc
 with SMTP id d9443c01a7336-2f03f1c06f3mr286360385ad.42.1795853225762; Sat, 28
 Nov 2026 00:07:05 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:16 +0000
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
Message-ID: <20261128080700.3828378-5-kuniyu@google.com>
Subject: [PATCH v2 net 4/8] tcp: Fix reqsk abort condition on ICMP errors.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

TCP_SYN_SENT and TCP_SYN_RECV sockets treat ICMP soft errors
as hard errors as mentioned in RFC 5461 Section 4.1.

Commit 9cf7490360bf ("tcp: do not drop syn_recv on all icmp
reports") introduced the abort arg to tcp_req_err() to avoid
aborting TCP_NEW_SYN_RECV reqsk on ICMP_REDIRECT and
ICMP_FRAG_NEEDED.

However, tcp_v4_err() only checks ICMP_NET_UNREACH and
ICMP_HOST_UNREACH under ICMP_DEST_UNREACH and ignores other
codes such as ICMP_PORT_UNREACH.

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

Similarly, tcp_v6_err() passes fatal from icmpv6_err_convert()
and ignores soft errors such as ICMPV6_TIME_EXCEED, ICMPV6_NOROUTE,
and ICMPV6_ADDR_UNREACH.

Let's abort reqsk on ICMP_DEST_UNREACH (except ICMP_FRAG_NEEDED),
ICMP_TIME_EXCEEDED, and ICMP_PARAMETERPROB (and their IPv6
equivalents) to match TCP_SYN_SENT and TCP_SYN_RECV.

Fixes: 9cf7490360bf ("tcp: do not drop syn_recv on all icmp reports")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
v2: Change not to ignore hard error instead of following RFC 1122
---
 net/ipv4/tcp_ipv4.c | 3 +--
 net/ipv6/tcp_ipv6.c | 7 ++++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 4b6bc7812cb1..f7fef1dd8780 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -532,8 +532,7 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 		tcp_req_err(sk, seq, type == ICMP_PARAMETERPROB ||
 				     type == ICMP_TIME_EXCEEDED ||
 				     (type == ICMP_DEST_UNREACH &&
-				      (code == ICMP_NET_UNREACH ||
-				       code == ICMP_HOST_UNREACH)));
+				      code != ICMP_FRAG_NEEDED));
 		return 0;
 	}
 
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 7c17162160ad..8ec0f2707502 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -414,7 +414,6 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	struct tcp_sock *tp;
 	__u32 seq, snd_una;
 	struct sock *sk;
-	bool fatal;
 	int err;
 
 	sk = __inet6_lookup_established(net, &hdr->daddr, th->dest,
@@ -445,9 +444,11 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	}
 
 	seq = ntohl(th->seq);
-	fatal = icmpv6_err_convert(type, code, &err);
+	icmpv6_err_convert(type, code, &err);
 	if (sk->sk_state == TCP_NEW_SYN_RECV) {
-		tcp_req_err(sk, seq, fatal);
+		tcp_req_err(sk, seq, type == ICMPV6_PARAMPROB ||
+				     type == ICMPV6_TIME_EXCEED ||
+				     type == ICMPV6_DEST_UNREACH);
 		return 0;
 	}
 
-- 
2.56.1.839.g22a8290db9-goog

