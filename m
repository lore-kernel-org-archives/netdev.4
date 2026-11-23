Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417161;
	b=w1WpTP2sH1LWz7QhdJSwtpasmHJhWcWuo5X75uqjajaPmkjJsuOdrNouSqFOtBpOX9DL
	 uc7ikZ50fu0osZRnVxs6H6JmtpCgq/vgHgQIfhTXeDYQqLgNf7DSR62o5OJtKFVb7eoAq
	 y12u7hIf8f/vdb9ytorgU8nCW9u47rtws+3i/6W1WPX+Q1g+eE3YHW9JBAdtkqRNNH/Ww
	 aoUnPLhT4o8P8nA6ZqjIk/2/Pub7ljVthsncfndIHHy5A1oJn10uktw42n39SfzouEtgA
	 WTQWUeWj+gx8JFUzoFkwpm7fBHqp7hdCzR7KdlTzvAcUYKBklZzvhqbZ5ux/bG/xU4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417161;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=4uGLmKkycWhl6chDAMAVelwD0Gt3fcUfCq1dLiVMmDQ=;
	b=LWx7EzYQqiGt1+64SjFlPpSs2dXuF1tLP7HGknfhhvdGpRYSyERerbE4IyCUwrG3hLhi
	 hlVvZftc+ULAbAFELcDv8eq/BKUQIU/ImHIuYZ6g5qfFuVf5I+ed0Kzzu9e5nQKAkgEEU
	 xKPIVAdIo3b0Etd0xKQlrDxxl7GnXMzQonQG/ZHf7t5mGVpEPrsUqweaHrmQbSxc9KRF0
	 GmI1fVrGZGAVCLkPEqF58PRV+x5zcUZQMF9pJ7JBk7/bgsreBPYlmiYc3zK3ONv1Xhmd7
	 JQSBWAhlQS8+wwfdMqnMdSgX1YNUun8KdwLwuNe9twc6MfV6aH/NgOjqdH6p0W+xStA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DZE6bu6G;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A45606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DZE6bu6G
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5BYI7kxo6/z6iVE9dme+tMD5IW7QULhAbKDgXKjM+8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795417158; v=1; x=1796021958;
 b=DZE6bu6GbtYB1djj4tTfRx8SceDRrvR/KI4lMMWXbEAUourXx/zu5We7c7ZghvgPn5jZVVuT
 ECdPyOT41Y8ZvNMrDSVvuN3RTq4rHczHxRQCIdTLA2HuM8n4GwOQjTEC4VUpDJ5iyOuamD2SMHE
 V3UULROkldmzfN4R+R69pVMA=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba276d915217f0c6;
	Mon, 23 Nov 2026 06:59:18 +0000
X-Mizu-Trace-ID: ba276d915217f0c6
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 23 Nov 2026 01:59:13 -0500
Subject: [PATCH net] ipv6: reject released nexthop object routes in
 ip6_dst_check()
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-bug-net-ipv6-dst-check-released-v1-1-769d320a2470@linux.dev>
X-B4-Tracking: v=1; b=H4sIAEDkA2sC/x2NwQqDMBAFf0X23IVuCqH1V0oPafLUpZJK1oaC+
 O8Gj3OYmY0MRWHUdxsVVDX95gZy6ShOIY9gTY3JXZ0XcTd+/0bOWFmX6jnZynFC/HDBjGBI/JC
 IAHHDHZ5aZSkY9H8entREeu37ARtTUVl2AAAA
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: netdev@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

A per-cpu IPv6 route through a nexthop object records the fib6_sernum of
its netns, and ip6_dst_check() accepts it as long as that value matches
the fib6_sernum of the netns of its device, without looking at
dst->obsolete as it does for per-cpu routes without a nexthop object.

When such a route is released with dst_dev_put(), for example when its
nexthop is deleted from a group or replaced in place and the old
nexthop is freed, it is pointed to blackhole_netdev, which belongs to
init_net. For a socket in init_net the recorded fib6_sernum stays
current until something else changes the IPv6 routes there, so the
socket keeps sending into blackhole_netdev: send() succeeds and every
datagram is dropped.

Reject routes that dst_dev_put() marked DST_OBSOLETE_DEAD in
rt6_is_valid(), as ipv4_dst_check() does, so that the socket looks up
its route again.

A connected UDP socket in init_net sends 3000 datagrams, one per ms, to
a route through group {nh 1, nh 2} taking nh 1, and nh 1 is deleted, or
replaced in place by one through the gateway of nh 2, after 1 s, with no
other IPv6 route change in init_net. Datagrams that arrived through
neither nexthop, 5 trials, median and range:

               before (datagrams)   after (datagrams)   change
  delete         2060 (2049-2064)                   0    -100%
  replace        2061 (2059-2065)                   0    -100%

Fixes: 8f34e53b60b33 ("ipv6: Use global sernum for dst validation with nexthop objects")
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/ipv6/route.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 1b2dcc066e198..dbc878c09b870 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -1466,7 +1466,8 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
 
 static bool rt6_is_valid(const struct rt6_info *rt6)
 {
-	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
+	return READ_ONCE(rt6->dst.obsolete) == DST_OBSOLETE_FORCE_CHK &&
+	       rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
 }
 
 /* It should be called with rcu_read_lock() acquired */

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261123-bug-net-ipv6-dst-check-released-91ceae12f8e6

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

