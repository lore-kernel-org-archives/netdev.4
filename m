Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853230;
	b=fl0MlxSAw3QMjoriYchSHW+EXBPZ45KEB2ZTCr5z2K8yY9UkCaAB5+gCFHsNAkHgHppP
	 Xbxm7UoXwMXur4rLntHwgzCATSUPbzK3PBI/UzJelZfMRUTBZ7UBiy8BV9VXcLhj2yQxe
	 XujqAq6/rETlafvxwdwfeBSBN37X/T78Fknoi5a/m1T4irSHD63rY+BTuSZi70uTGsPEK
	 yFMbY1ZeAHeCd8CeuScre2Lp2+4vaxq8lge1Ni4mG6CZJ3pb2hwXroLOwRgtDilQprzAR
	 FREhmVxLsERBRL05tUx6TE3nr8zX/oIT1WqieVhXS2j22j4ZC1WS40TwRy+5taokCSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zce4h6x/1fXCWdp7cEmCm10/qnZbOK9a9RjvdvrIHc4=;
	b=zPpMVsHTtDLzOXKHCoSfD3R6LmLB/J3DN4BO0Prk5jfm3osE2ftSEizpeJd+S6pxc3HD
	 UfcrxCw5BLF3C/77mkBhBtlKKip8SjT7soZ+0eceGiMyxu1HdqeAcZADP1qV6LqVjR3K5
	 z5wIJTaIO7zt/dxwCKv5Z2KldA7WbNvOvaSzfqYiGWTIIG8mSAWxzz8xMwvQn1EWvUFNo
	 jVAWDDKsWN1UlBw6FXj7w+mvyQEzmX+0aiMu3nIAEDhUPwg7Hdm7LHbmKIWsUe7QbmgGv
	 VublPrhJlPjgUly+0xfLJ2gUZ2laulPJEDPxxE/ZnC4joJj5Nzq/q/ugLtL1K94lRWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HiO+uFfa;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F792606A689
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F792606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HiO+uFfa
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso4278060a12.1
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853229; x=1796458029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zce4h6x/1fXCWdp7cEmCm10/qnZbOK9a9RjvdvrIHc4=;
        b=HiO+uFfabgNLdpRZAmA4gpYijNwzgT96s77GqpCFmRA4teCy2tqgNhk3wWmYwFZVLA
         IPH8OPI8rGZPEobm9pfEBlXJGPeuxqQaL2AvqoYr1oEPqV/wOgiPN8NYAYGh96crDVbf
         dSxgNw/amd6CaLoIuGJDctvnt/imvWBbDLhFXnlpDEC5PEmzUlP9o+/jsPfRwAIlJWIj
         07ba3we3lBCNt/C9sgwCJFz5bqUrHTByRsNZfqd/tePVTg2ExSpgFjvwQwuTHlKdKg48
         Y6odhnNodo9Y6QzijOHk3jxY5ySb2Uq4OsvGyMjHOAnUC4o3fxVIi/N8vephZWfxWeLD
         vrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853229; x=1796458029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zce4h6x/1fXCWdp7cEmCm10/qnZbOK9a9RjvdvrIHc4=;
        b=d5Uh2+m4F9+MLJfH4RFHNuLrXtf3oBAhxJeQz3e3Tj5lUCCX0dJBoBx3aOHU/pe3id
         IhQUOJt1kNs13Le9PPwyGUKH6KaYKw31n2UgS+njyAA+9cUnx6FNDCY2Rc9TX11NtS4D
         hXFsJLHFY8XtIGEnnZCymmpa3ghZFVQQ056X92flzeoH2p+rzCtnU4PhbVffgXfxkKMB
         9hJ+Zdk0f0+vGNh6mXyEXXApOpVuiyPOJmYelmQ/vYcZffYAYX4ovP5KsIhaYdbKAjb0
         NqZo0/VqrgjhxVJQFz09o/0J5dQm8fjxLq9OGYeUuEmak4hb1qhdc3Y9jLmUhmrg7p2x
         O8UA==
X-Forwarded-Encrypted: i=1; AL+hErFD6XgpSW0LbYgT5le+fMy4WmBwx61DUUbLzA4ojJxCWALdJNgUmib6UqLpJVV04ilP5HJF/1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SONxnWrLH4gAJYBNcWe5d945eGvM9x4K07Cx01r3ePnrP+Ywe
	EK+51TIOEeZjpF86GxZwYTaFYD5z06SwDcHiszrkKDMZyxvZhmgn2zYd8FudtNwcMzr5gsoTRaE
	o3HrWuA==
X-Received: from pglk4-n2.prod.google.com ([2002:a05:6a02:6b84:20b0:cde:bc05:128e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3219:b0:407:957:5e2
 with SMTP id adf61e73a8af0-407095706a9mr13455724637.9.1795853229231; Sat, 28
 Nov 2026 00:07:09 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:20 +0000
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
Message-ID: <20261128080700.3828378-9-kuniyu@google.com>
Subject: [PATCH v2 net 8/8] tcp: Pass inet6_iif() to __inet6_lookup_established()
 in tcp_v6_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

tcp_v6_err() passes skb->dev->ifindex to __inet6_lookup_established().

When ICMP is sent to a local address not on loopback device,
ip6_rt_get_dev_rcu() sets dst->dev to lo and ip6_rt_copy_init()
sets rt6i_idev to the actual device.

In ip6_rcv_core(), skb->dev is still lo, but IP6CB(skb)->iif
is set to ip6_dst_idev(skb_dst(skb))->dev->ifindex.

So skb->dev->ifindex is 1 while inet6_iif(skb) points to the
actual device.

Since tcp_v6_err() passes the wrong ifindex, such an ICMP error
is not delivered.

For example, this script creates a socket bound to tun0 and
generates ICMPv6 Port Unreachable to it, but the socket cannot
receive it and getsockopt() fails:

  --ip_version=ipv6
   0 `ip link set lo up`
  +0 `ip6tables -A OUTPUT -p tcp -j REJECT`
  +0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
  +0 setsockopt(3, SOL_SOCKET, SO_BINDTODEVICE, "tun0", 4) = 0
  +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
  +0 getsockopt(3, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0

Let's pass inet6_iif() to __inet6_lookup_established().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv6/tcp_ipv6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 8ec0f2707502..9fbb0d97fbc7 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -418,7 +418,7 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 
 	sk = __inet6_lookup_established(net, &hdr->daddr, th->dest,
 					&hdr->saddr, ntohs(th->source),
-					skb->dev->ifindex, inet6_sdif(skb));
+					inet6_iif(skb), inet6_sdif(skb));
 
 	if (!sk) {
 		__ICMP6_INC_STATS(net, __in6_dev_get(skb->dev),
-- 
2.56.1.839.g22a8290db9-goog

