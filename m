Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968959;
	b=JKFexJsPfaTHnLLq9z71yx7reNcXhLCUncQlk+E+T20u+Taz3kCR2Ar2COer5YAgLLW3
	 bM//dVtlagkczL7BBnnsS5uHvzIkyH6x99poVPTwhEaVNfz4OeHA2yO6xwMr2IcBG0ew5
	 dIzyGo3v7vwl/39DrEEaEpvkOGWDBvbcoGQlf1QzRjiAqqQzW2js+tLBkqikllWbNG27R
	 5HoJyEhRSFe7//5JtjVgVdmQlhpw5zjoBKoMMjMz36od0h9TGovVUCgbP+9P4Dx4lSkRF
	 os95kSx90mU9JH5+KM5h4ecGdsqBTLbvIqASoTPPMTICMXxWUOYEek/NT/E/xLhfGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968959;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Pwh2SDJdSd/L2GiR4NykafWE8pbDUq5WlGlvFmGumpM=;
	b=LL1eGnkfKG++GldrfjfgLU1no2aQBIU6xAbBCQWOOLtELNvg2uuRn3eyzPi/Rim6B1jf
	 yoimOsevThWGZlQCJ9YbE0AidvxkqtVaVldnwJMPVwsMt/rZPaUqGFZx4cMgKkt+2EL4S
	 kLZA1h8Xwry3YrxD+iIDjjT0kgW2O3Hrk3K1FARWHilPC7kIB107hbEEnG+jyP0Wf135g
	 yRbqGlE/Yyv8MtW+hhEGyfHWze7hIeL2cXqzgsMHTlv9R/YGN4UA8mAN5sX7Bc/FRCGWr
	 N1cFvYwjoDqHTugCNILLroNrFjql6LAiaDWBYagDhdcm+hFF6mV6Q+cy9Gpa9uWX/Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dmQgK1JU;
	arc=none smtp.remote-ip=91.218.175.183
Received: from mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3AB606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3AB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dmQgK1JU
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Za8I7RX5D0AEG0dcje2wX+jjZGxntdFD9rJ0HE0ABi0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794968956; v=1; x=1795573756;
 b=dmQgK1JUhNlCJ10EWq7cTPOpIdgitI0mcwzbsFttjaF5OaPax0Nqmvd3WIWKP4givUwIQrAw
 J2i+CetELYXyaL++/v9GbsOpmjrGt1Ynpkk290cFlcMr2Uu/CVCkXtc5Q1KVFDfg5DJOS2F4inZ
 6KTz7XYsHWPxP1LDJQWnlD80=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c09c4fc1383378bf;
	Wed, 18 Nov 2026 02:29:16 +0000
X-Mizu-Trace-ID: c09c4fc1383378bf
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Tue, 17 Nov 2026 21:28:33 -0500
Subject: [PATCH net-next v4 4/4] net: remove rcu_barrier() from
 __dev_change_net_namespace()
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
Message-Id: <20261117-bug-net-netns-move-rcu-barrier-v4-4-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev>
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f@linux.dev>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Commit 6549dd43c043 ("net: dev: fix the incorrect hold of net
namespace's lo device") added rcu_barrier() before
NETDEV_UNREGISTER_FINAL in dev_change_net_namespace(), so that dst
entries released by RCU callbacks were on the dst garbage list before
dst_ifdown() moved them to the loopback device of the old netns.
Commit 070f2d7e264a ("net: Drop NETDEV_UNREGISTER_FINAL") removed the
event but kept the barrier, and dead dst entries now point to
blackhole_netdev instead of a loopback device.

The barrier waits for the RCU callbacks pending on every CPU while RTNL
is held, which takes a full grace period on each netns move. Container
and sandbox managers move one end of a veth pair for every new network
namespace, so this limits how fast such namespaces can be created on the
whole system, regardless of how many threads create them.

Remove the barrier. The RCU callbacks queued by NETDEV_UNREGISTER
handlers free memory and drop device references, which the move does not
wait for. Routes cached through the moved device are rejected once its
netns changes: IPv4 and per-cpu IPv6 routes no longer match the rt_genid
or fib6_sernum of another netns, and the per-cpu routes and exceptions
of a nexthop that leaves a group were already released when it left.

Creating 400 netns, each with a veth pair whose host end is moved back
to the initial netns, a tap device, addresses and routes, in a guest
with 4 CPUs online, median of 5 runs:

               before (netns/s)   after (netns/s)   change
  1 thread                   30                32    +6.7%
  4 threads                  40                48     +20%
  16 threads                 69               110     +59%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/core/dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 3a520c798d4a8..8a899e10e91c6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -13153,7 +13153,6 @@ int __dev_change_net_namespace(struct net_device *dev, struct net *net,
 	 * the device is just moving and can keep their slaves up.
 	 */
 	call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
-	rcu_barrier();
 
 	new_nsid = peernet2id_alloc(dev_net(dev), net, GFP_KERNEL);
 

-- 
2.43.0

