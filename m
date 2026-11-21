Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303314;
	b=NLhkxtScEMY03EXKEKXtjLKVeBLY/zNiK/025q9Pdmprn45/p+6QTq1LgHew38Ozlevw
	 6+WylU/B278gJTgTcxCZSNuCG/xUjIwpmc8HINU45PKh5Yu9Hy449Nl/6Dxnt618MVQ1e
	 MQyT5+bBx5kjn7U/hieo/C/fIIYojCMP2togl4eUOhYxghr6BRmVlxahN3nQhh4kAyRJR
	 jcUZA4Qt1usW3l+2USD5vCjK37mX/tqR+UfPCDqU+AQjuMfzVo6w0hUemQPxSjylqGueq
	 Jl8xRvNtjQggr11bRvQoMHGTnknGjbDG/VASbuQ+4gmxRVe27kMFQShdL9cKTh0yz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303314;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=zyKALNKnFjZykKRGyCn9IPvxDmhW60d0Qms1kA+cJHQ=;
	b=YJJZqf1rN8s8F6udlULMTSFigqNLwinGaChu8SFt/CUCe2LPIDW1LRs7cXxpLnhM3+6k
	 ZZvryrZUuuogMn5j8MB4ljRPP4wlf4SvAr0G33HfDhcdSk0rNlq3anl1cmc4wBillah1o
	 XA/+8yveqY/MZ9AfqqQEBn2fBimpCQ5WnaWLVxQFZBTT26CJLWnZSjCmGp66d5pXlwSyh
	 3eJ/Mvov14FoMcqF/s6lTM8+c1vTylf5U6whWhDB+ZA8vseiJUvuvROndFPYX2NhJ4TRF
	 kHSOIp+U7zLTIu6vpXM4FYij2DfH1wDZIHoufzwl72r4cHZK6rcCpKgUvF+PUm8TNlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mdYB9RGA;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D583606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D583606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mdYB9RGA
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Izj7XCHwlTZoYZL1ePfZUkbgMrLk3intiIl1aTCAGtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795303312; v=1; x=1795908112;
 b=mdYB9RGAn7Eb93JIvp6V35b4foYxRdINgKrQ45lCK31uXP0qYoM+eucGQQpbgsIwG1rkMssh
 mH+v3A/ebl0TaPDQfGWFzUjkFNa68OAGmkEcxcVYJxjPFEZbrY9mI67EuaOkqpERw86NEiBY+Vj
 D2478TVTtBq0vpJQnqWPAtwo=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8730f2f79daef3a3;
	Sat, 21 Nov 2026 23:21:52 +0000
X-Mizu-Trace-ID: 8730f2f79daef3a3
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Sat, 21 Nov 2026 18:21:22 -0500
Subject: [PATCH net-next v5 4/4] net: remove rcu_barrier() from
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
Message-Id: <20261121-bug-net-netns-move-rcu-barrier-v5-4-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Ralf Lici <ralf@mandelbit.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
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
  1 thread                   27                31     +15%
  4 threads                  37                48     +30%
  16 threads                 67               103     +54%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 net/core/dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 1a63f6b939f70..88dcd30f59d22 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -13168,7 +13168,6 @@ int __dev_change_net_namespace(struct net_device *dev, struct net *net,
 	 * the device is just moving and can keep their slaves up.
 	 */
 	call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
-	rcu_barrier();
 
 	new_nsid = peernet2id_alloc(dev_net(dev), net, GFP_KERNEL);
 

-- 
2.43.0

