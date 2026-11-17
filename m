Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893748;
	b=3UQplgzBmBRDA/8pWiN6S9e/WpU4EMjpt8+W7l8YSOtFoOUTY/6gxrQB3YN28CpvGbLR
	 jcqrF8Xximsy28yCxPChNFP4ieLCV0+vIwsumOedPJTESSevoldZ3Yht97MmCexJ+icvW
	 BS9Fy3PxvX4NRa11GfqBr2Ouc1JYgJc/vZ4X+gEeydrEeRnuJvbc/N3JI6ZLv2E3MonFe
	 6SfVYOrnEFrNuOHabS5IyM/RCd8s1OfaXV9szXmNiUA2cQQP/I3Kc00JHY7m+NNkndHbd
	 xWDxa+wuQwZlxKCPBFF4oaD41PM/sLGFEEuQnbnuZzw+Kju6O8ZmRnibnVsoevVu51g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vCM54dPWBpOhQ8X2d+DkjSRNdIVt9dIyyj1movkmfZM=;
	b=5KuAqami9c+mZ6Lp3m0y1Z9RZ1JtmB4U366XP4Mz8XNxF8Jy1rVo5D10OLIt6HVUZMK0
	 Pqzk33AGrOsk13N7/U0u8QrtVvHZhgXKrK1S8ELXFvFF77Sa+3Hv0c4QZ0LYfgTioaHAe
	 NHgJ6djUfbRfDY9jtSoGSImGIT4C+cnrlXfLtoA09D8f2lfjwpemgtXMc9NHvjYIe6AqC
	 16dp+PgYFOtcaARL+JRUFkMoC7u2EYzremII6vR6/Xz9xh/N5ZNckHQASSJtQ7sHoxmlH
	 8c/7kA5ObqDDW/Y4Q3hdw5/5Sp4HCA/eP56iWbGOzxHYj0+/CYtDaCIpU+CnzWvYGYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GnQyK9E5;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85245606A33B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85245606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GnQyK9E5
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed8aca9775so6348005ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893748; x=1795498548; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCM54dPWBpOhQ8X2d+DkjSRNdIVt9dIyyj1movkmfZM=;
        b=GnQyK9E5apzocZKELhyOC2zOSc3vTUENlxvDoMKAa0k/iZOji6DBhJRr0BvkiDTuoD
         40npY8cpPa1E8yGicUcYu5MveAPxCLY9WqDI3fo4wUqnqstSJn5UjVfZw8kfBVyGLAzj
         sUDZwYPXmHCsQhESFiDSYjWScpxpI57EORqbdg5V0IWu01P10UU3oEA+JHPot6lqkptT
         mOc/1x33FiIRvyKZeoGETcT2bA2zil0gRXuEQoa9UIAVetD30s/mW1R1ovP4lG20dy37
         lVJmNY6tcOUn6sx4/phPaACxf8nQVLx0zZhPvIhJyRjS/yAgKyyFD0Izc5xmVqi+B3jU
         2WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893748; x=1795498548;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vCM54dPWBpOhQ8X2d+DkjSRNdIVt9dIyyj1movkmfZM=;
        b=zUYdX9bBEiPEelTuNTzsjHrQnVefHtVlZ3J6ecvKdDm0ThyCSF7HuVoXuJBmhRKmlT
         DTbz48zKYf5ThU2uCKdyKLWMR3X2m5REHTi84IAFPKe8UPcDRC6av8+lT2wshaqtwn8C
         DfLF4wg4cYKg16a9DP7ru80o+ev9xIrzqw/1V8WshPUc7f38ngQf+yxhP10fUASSOBue
         tvbS0DFUabUckjEDnlYVg8QKCHhTg85GhL48FwBVFoZbgouLUPObGufT/SHZWp2oGbh7
         KQWDXJZsHNAKPa/vUMmBMMakzF7S5YNQZgXb5ezME4nVwokgqGY94E+ByZpJSU2DsQRb
         bvXw==
X-Forwarded-Encrypted: i=1; AL+hErHWooc9Sk+ZeF/BZ9jP4zlh3APBGBc7i+WMLiV2se7QqtAcaQkGL1dOPaGzJckWym0AxNbSQwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xxuKmNdy0PJP65WxAOHh9pEXFOPg8hzWlPaK3OTqjtGOxkAjI
	0YHePswVy1fkGfLjWUrbQWQK7vUPHtno4Qf5xROf/DkbaXxMidmmxdpZCtiuZYc2CE/nANReDHH
	XirM7WA==
X-Received: from plbmf8.prod.google.com ([2002:a17:902:fc88:b0:2ed:4e53:853d])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b48:b0:2e9:514b:7a7a
 with SMTP id d9443c01a7336-2efd9b8217dmr12830995ad.22.1794893747371; Mon, 16
 Nov 2026 21:35:47 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:20 +0000
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
Message-ID: <20261117053543.84032-3-kuniyu@google.com>
Subject: [PATCH v1 net 2/8] tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	Stephen Hemminger <stephen@networkplumber.org>, stephen hemminger <shemminger@vyatta.com>
Content-Type: text/plain; charset="UTF-8"

RFC 5082 introduced Generalized TTL Security Mechanism (GTSM),
and IP_MINTTL and IPV6_MINHOPCOUNT follow that.

If an incoming IPv4 packet has TTL less than inet_sk(sk)->min_ttl
configured via IP_MINTTL, the packet is dropped.

However, tcp_v4_err() checks the TTL extracted from the ICMP
payload, not the one in the outer IP header.

The minimal repro is:

  --ip_version=ipv4
   0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
  +0 setsockopt(3, SOL_IP, 21, [250], 4) = 0
  +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
  +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
  +0 > S 0:0(0) <...>
  +0 < (ttl 10) icmp unreachable host_unreachable [0:0(0)]
  +0 %{assert tcpi_state == TCP_SYN_SENT}%

Let's check ip_hdr(skb)->ttl.

Now GTSM is applied to locally generated ICMP errors, but this
behaviour matches tcp_v6_err().

Note that tcp_v6_err() properly checks ipv6_hdr(skb)->hop_limit.

Fixes: 97e3ecd112ba ("TCP: check min TTL on received ICMP packets")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: stephen hemminger <shemminger@vyatta.com>
---
 net/ipv4/tcp_ipv4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 7d58f522068d..bf8542368032 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -546,7 +546,7 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 
 	if (static_branch_unlikely(&ip4_min_ttl)) {
 		/* min_ttl can be changed concurrently from do_ip_setsockopt() */
-		if (unlikely(iph->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
+		if (unlikely(ip_hdr(skb)->ttl < READ_ONCE(inet_sk(sk)->min_ttl))) {
 			__NET_INC_STATS(net, LINUX_MIB_TCPMINTTLDROP);
 			goto out;
 		}
-- 
2.56.0.679.gc527c65306-goog

