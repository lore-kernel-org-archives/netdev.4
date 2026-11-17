Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893753;
	b=kMeWKnYu6nJ0pmAqktJvpSk7mkESfwuA1GO1CTYSIqi24RgqQloLnpQxhWydfwXjN33N
	 Gbl8a9B3cN0syV2tkad02N2eLTWUg2JohUJ5dlX57bU+aNS7OzuuNlBS/XUOQ6leujNqP
	 W2yp9Ul4CFMRa9pip4f320zV8w7SfReqEygmaAItTFj/4cxsxjNGzcPb6XTo2nmEyokkf
	 NMBCqo5J14+yLb7UqmiSu14bWwaMzb1F4zGxODOSKbOLahc/7hfSZl8dy+U3+At7BWY7+
	 HNcfI70ia/FwM8Hy5vp6QskLDtSjBpgXVJeJN99qBS2cpiho91dW1yrasQ75nbK4sSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=15f/27mCqGdkiIQYpdpbt3GHAwssTVbPAV+/TyVkDWw=;
	b=hr5rjexA/+jggG2ldBM6bZ8JyylOKZd4ELKEu1CX9Gjj6WFeb6RQ+hZ4Fhr5tW1JDw05
	 7n3rkx1rMsSI/tOJ4KBFmlM6JU8IgNuUzFNMx18FPJ13Wfa9ZuvUgzXDCxp/Pvft//XLr
	 aBAGg0ynMDVE+TAACCK8vGZ1QrmhE9DL49RxKkG/hf/JX7+MhdaKvDmrKU+l5dyw+eGxS
	 jHHByQ5j+G+g8X/3xROr7MF7lXvd/oAvPub/In+zCzGuCRrg9Vy+s67KfeynT6Ff33Gyh
	 GYdIKMPPGq/toG/zkbv8rFdvxfZ99zfuvQn0gcQuQFX4DcKkeNwonLWMLcR9vUo0yYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P3VmVc2O;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD0B606A8AB
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD0B606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P3VmVc2O
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b203b0c139so2881511b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893752; x=1795498552; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15f/27mCqGdkiIQYpdpbt3GHAwssTVbPAV+/TyVkDWw=;
        b=P3VmVc2Ol7wthH2+P7kyujYeWMlyuG52MEiLI/EE2w6iPklXtS/GTnXCk+IYN0BfCB
         4zjMNImMLeUzATcFcBYirsEO17g8YQO7PP0OVpgiwCEm08UTW/Y4L/ipFkNzNOohb7AY
         VT3zAox7Z+mvOSdUqVXSM+kPU5hlFUSq5mhHaTo/Vn4Y41Tryao2wbC7EX4MO+T2rm/3
         o0FAji2EusvuebVkGs14GITYdhpmhZf2rGfKm8pzZhN9sk8bvVkHzv/SzABhxLaeRb2F
         m82lfKsQRzvSxhBQJ//Yg2kkXBYYhIvpVDue9nWV8ThYWWS/A2Ts4sKVNAdY7cWxU4lO
         7ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893752; x=1795498552;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15f/27mCqGdkiIQYpdpbt3GHAwssTVbPAV+/TyVkDWw=;
        b=CrOVdruf5BsKeMjSykIwaO4mnLC1Yi6YNWiLyvQiRf/CbDk51QIpTSmdXxd9e0W6J7
         XrXtDjKDJQ4GX7NXAIDxHdLyhgEf7XiirYHheQuoOI0Ie+/M6cIS73JawrPtggAR8kJx
         bupjIEmDJPV+G21R9s6KUJIGKf+oX+dt20UFht6LIFITNk8TOwlLyuI26ERo5cEAYOi2
         jXSMPfUV17UjfqiOPeGyh9C98gK3BSi+NXAHHIbjuBtBwACg7ay6cymWQh9HdAI+P0zJ
         ++ot/hYGJ5Nh1sS8qsa5sHW7ZBoWqv8qsCX/orIy7yq2cDIFzW7UT0AEAPW2HpQ4ZO/T
         JQrw==
X-Forwarded-Encrypted: i=1; AL+hErGLUr+vwv0yEaO4ClwWxXagnoPo8Q6erWgjiK28ydCMq39h2HWM7uikhl/3YODsL/hpVQ2xWuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bLjcm6/1jdseBJaekC6H7mHCdJbt0BJ+b+O8H8lhv9p4/QK+A
	YT0c/z4wTeRxohvzcJeQPsFwY09MxQndaHhpbwipzeyVDLSSW/Z7LOjTXFC2gU7qdbecp+XFKOi
	RN9uYxg==
X-Received: from pgbm14-n2.prod.google.com ([2002:a05:6a02:618e:20b0:cd6:24a5:115])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6372:a80f:b0:3fa:adeb:3986
 with SMTP id adf61e73a8af0-3faadeb3a65mr5252209637.7.1794893752147; Mon, 16
 Nov 2026 21:35:52 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:26 +0000
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
Message-ID: <20261117053543.84032-9-kuniyu@google.com>
Subject: [PATCH v1 net 8/8] tcp: Pass inet6_iif() to __inet6_lookup_established()
 in tcp_v6_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
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
---
 net/ipv6/tcp_ipv6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 29fd0a084c91..ab0eff884d3d 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -419,7 +419,7 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 
 	sk = __inet6_lookup_established(net, &hdr->daddr, th->dest,
 					&hdr->saddr, ntohs(th->source),
-					skb->dev->ifindex, inet6_sdif(skb));
+					inet6_iif(skb), inet6_sdif(skb));
 
 	if (!sk) {
 		__ICMP6_INC_STATS(net, __in6_dev_get(skb->dev),
-- 
2.56.0.679.gc527c65306-goog

