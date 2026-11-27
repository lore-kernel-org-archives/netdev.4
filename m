Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758186;
	b=X1A+EScDGZSArM9IB2pq1GVpL+nyhj3XtkqlWEkmK88VO2At6PpHuCOGk3D+Eufe6Gtk
	 M2CG2GZ6KrPnDekzAcVHr4QMBrAFfxWnCL2EO2c+CWL9vgH21AKjcRh5APhLg5ixZfNss
	 xDLyZm6pPZwZmvz0V1nmQuWoPjEWaPdIYEA4NSYb9pZVcButE6QVQcknzDo8BNNPZUBPS
	 sqBWFLoOl53Ec8ba9LEw0OgKBqkaPfree0jvg3TFEnI9nSgtYZXgsOp50JvODojI9P9bV
	 3OUkZWRQbFyGQFSbfEbLBXOoKFzFccrGF2EkwKA9OZFv6dCk9n3curMwRU8cRveqkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:In-Reply-To:
	 References:From:Date:Subject:To:Cc;
	bh=UpT25VFf7eU22sV/VzXxGuM9gIjAsd0+ZF31m/a17hI=;
	b=MRQSHjBKjNpj0teBKluicB82/LMIiuB/fTQ5HUQnjaNR2ACSO0mXH71IPHevvPH/+kSc
	 Oqkc4DmfDyIz+WUGvCae2pmR6TWkZ8NINfy1IuDepd5IuKNsAJS5SumhH42HXC271SAYl
	 tfaqDZg5svLu6j2qAIVpIR/MuiOhLPE+Oq4hC4wl0xSxcyNdXWvyTMkq6ixrKx5HxNcLl
	 dFlCneqGfOeIP3RFxPQKJZeI7a0X5GXrK1rLzZuJhhA/b6ftoiacs3vJc7Kmjhn07l0J2
	 aBqOlTzjtZevXqlNnY4pyikm0CQuKGx0NVG4K+WkXcA6ZkNZdtyw8fY0XMgel6V8otA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6qbZQWu;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDBC606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6qbZQWu
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd8f943737so1893529a12.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758186; x=1796362986; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UpT25VFf7eU22sV/VzXxGuM9gIjAsd0+ZF31m/a17hI=;
        b=e6qbZQWuefoENmjDWe/NciyEIGqaLOgY2G+M8rm+J7ukGGZWzt4xSkQByOIx4h/9K1
         FWU4fMGsgtn/C9LxC4ddBMr4O68BrkX1wEPFzzrh2WqvNHhXAEHmGtH3vXwcTPmXz363
         UHAM7Up8Q04SDqc3JfXb0CRWjpz+CT8He5WFiKdp/Fx7h/PQy3JmtQPpSyHUJsW/2wz2
         E+YScQZJJeWEygdC0MrLhC+BAslMD+b9zSYxZ63XqZSc8oj/NIFwijarMU5ghVYxBfmP
         VzHEeH9B6nf1keIiCOHaYcPoUvVdQ+hFEnVXs7k4ZLxlIFmliz/f0ySZV9UlPWcFbjof
         vsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758186; x=1796362986;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpT25VFf7eU22sV/VzXxGuM9gIjAsd0+ZF31m/a17hI=;
        b=2U5z+BbqDMkQEN20eP1w8F23UR8ZtuGk0bARkp/lt0UBazs379lZBe6f7h3k9cC7Ik
         GbN01EOvvOylet/L191iDr4ENMv8gjpEmn8ZE7yBBRdSfit98171g6JhTRK7D6FWah2n
         5NV7SKxvrq08SAV1d8rJOhyKAkin5U1p/96/0W0blJo9LrYZDT8V8CDPSlBYIW5hSj4+
         O08NmYt5UIPjK905eA5tuQywOVKBLK8ul/GVkbJ7gmxH6xGaxZAtq6Y3OfSOXPhVKOFg
         tnjjRd4z1W2beMsJnNw8IrQpk9uQltqEWoWtvR3++/og2DMWdQw1ITkGZWe3ZuTZAyM9
         zw5A==
X-Gm-Message-State: APuU4Z+8WpikgWmwMK8A/w2yesSEVSlm/tTzMkXC104FKr5tP4rOeYnI
	ri6mlFMzYDLqrjakL9zcB85YYD2jGRf1+uNbJ+8B5YeM2YxTs22XiDmiNdIktbMfHlU0DQ==
X-Gm-Gg: AZFdTZeNhpWxm7ipbnTK65dXyookhp5J92bx8TuQRF6j62cgCrY3y552K1Yle8w+LPv
	zUiKrwch/ZUDGxKbXO6F/SkKMnoka27wN+gDVAgwECqt1pHdDAjjlEB0KwW/s/vtGB3NN1Nj4KT
	RHYBbbIy+4H/q0XtVqYYKj8CU6+wYS7Zbwish7x7/uYyewVJlwOrf7XYXKKSqIAzq3hijQiTetA
	E6/MG4Jge2WkBeb+rmVdKvkwbW47StMh2YuOtvJjzykn7vYj6HEDEHE1uNlfDDOMj6zBFpgo5vj
	VGw8JwmidKh+opiZ2HBFXJ6cNeDHU+s0yypa6JyGZGP5aGIUk/DOgjmWOzLclXNxeTnOVnSvUfV
	Kd0evSmH936rrvUVe88hSnyxbBetYAExjKcQQRyslnJFn+pfpvVL4mPHU+UNRUmK2ywDmfjX5Y0
	1WCatR8kAEVZ8wk+auam8VDNXew1ujUz24oSRA7LXm2LV6O6Yk1NNL9m9z6ktAyGsa5BRC6L2b5
	VZu8JXNvwMEYj5cWE8LnMrwaxnEb2frfY67SGZWQmbp8LV+98s63o9IlP8hFUU167ATY3anV6oO
	VLoAhhjW3LdeKzLwGHAOMw/ON+S7zaHx8RWTfg==
X-Received: by 2002:a05:6a21:7e81:b0:3e1:a63f:13c4 with SMTP id adf61e73a8af0-4014c351961mr18428205637.51.1795758185614;
        Thu, 26 Nov 2026 21:43:05 -0800 (PST)
Received: from [169.254.212.233] ([2406:da1c:1ee6:2e01:64c9:ebb0:9e1:f7da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm12022687a12.9.2026.11.26.21.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:43:05 -0800 (PST)
Message-ID: <0cd69817db8a8efff95403ae1ff108bd460b9ccf.1795754281.git.n0ps1edzz@gmail.com>
In-Reply-To: <cover.1795754281.git.n0ps1edzz@gmail.com>
References: <cover.1795754281.git.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Fri, 27 Nov 2026 12:03:46 +0800
Subject: [PATCH net v2 4/4] ipv6: route: fix use-after-free in
 ip6_dst_neigh_lookup()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Willem de Bruijn <willemb@google.com>,
    Kuniyuki Iwashima <kuniyu@google.com>,
    Hangbin Liu <hangbin.liu@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list

ip6_dst_neigh_lookup() can be called without an RCU read lock.  One such
caller is irdma_addr_resolve_neigh_ipv6(), after its route lookup.

The callback loads the egress device with dst_dev() and passes the pointer
to __ip6_dst_neigh_lookup().  On a neighbour-cache miss, that helper calls
ipv6_neigh_create(), which dereferences the device and can invoke its
operations.  Concurrent route teardown can replace dst->dev with
blackhole_netdev, drop the route's reference to the old net_device, and
free it while the lookup is still using the pointer.

Hold the RCU read lock across the lookup and use dst_dev_rcu() to load the
device, matching the protection in ipv4_dst_neigh_lookup().

Ido Schimmel identified this unprotected callback during review.  The
lifetime and non-RCU caller were validated by source inspection; this path
has not been triggered independently at runtime.

Fixes: 9514528d92d4 ("ipv6: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20261125190113.GA421469@shredder/
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
 net/ipv6/route.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6bdd4423c..a9f197bf5 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -249,9 +249,16 @@ static struct neighbour *ip6_dst_neigh_lookup(const struct dst_entry *dst,
 					      const void *daddr)
 {
 	const struct rt6_info *rt = dst_rt6_info(dst);
+	struct net_device *dev;
+	struct neighbour *n;
+
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst);
+	n = __ip6_dst_neigh_lookup(rt6_nexthop(rt, &in6addr_any),
+				   dev, skb, daddr);
+	rcu_read_unlock();
 
-	return __ip6_dst_neigh_lookup(rt6_nexthop(rt, &in6addr_any),
-				      dst_dev(dst), skb, daddr);
+	return n;
 }
 
 static void ip6_confirm_neigh(const struct dst_entry *dst, const void *daddr)
-- 
2.56.1.windows.1

