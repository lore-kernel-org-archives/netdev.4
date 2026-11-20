Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209444;
	b=GNyJWzfwxgbCp66MqPc7XTYAfCsKBMh9t2dET84HSvLS7U2Tu+Drsf7y2ICelBqH5VPb
	 jJxbh2C7X5Eu1kAF+SYP2YJrBWTGGst95xnjW7TsRUnb1ZkQvRGmqcTP4rmXxxL695aI7
	 kN7lqnkhdHiUWvcNqgt/QuJKjbg0ARfUw+DURwyt2rOrZRwUrGenzAHkcWB9SjU7D7J/c
	 CFwbgelZVajO+17SmupDD1eEwUCSJ7voAxra2dWvQ0+EQJsth+OxDXTZJv3No5RGPiAa7
	 4ZYBE18JtKrYNf/GOiL6IspDxz9b8IwdKbaOW7QBPmt3S174JNhQGXwEt3uMIgXA/kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RmOzl6V8lBE6K4Kw59v7KS2vxDmVEr8c61I3ZbKSz3I=;
	b=KZaFOOrpBeLpgJn05YGnLR81/mbETDOjIcPowRONKbVc2GulM2O+QOdqpu3FspgD84Z/
	 Lv6wAyylB29oyRd04qJH13dDt2Z3I6XkFQ447XAZJtSjw6FYnAlrHAh2TTwXENEeCrL4X
	 wAJqkfMoZ9CYvqXzAPNnKGCKqmSAy5MSE2P9OfShwb9iw2WNemx2KPX2JHAgEzXfGrl75
	 GEN1pmVSz1hi5R0QW4vTbzRx5uXpBpY3Mc7NTZA5cf9RNimW9Xe0Mcj7sziHU2T36SsLz
	 yLXA4hXSkh0BazYpzeWnIu4zCtz453pJtYz4WU3wgn9QlP5LHbOIni0yUAQCOMq5uEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtOhGXQO;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC83606A697
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC83606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FtOhGXQO
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99e0b1ee864so472659241.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209434; x=1795814234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmOzl6V8lBE6K4Kw59v7KS2vxDmVEr8c61I3ZbKSz3I=;
        b=FtOhGXQO4DDshDXKuW9oigsknLqGFMD8hCYMjFTqU2WYid504+6aIQX1eqKHL7CmDg
         gUtnYtM6ms89BeBuQp/9x8gAPZ2VFrj0VsBe118dKAiNucD1nmpYy19qKfnuBDO/flHb
         3w5yJoJpOzEE+oUL7TvcmOLHapBnAiO5H3gJb1RVmSa2iK8HvWco27ylJ+OM1dbJT6Qu
         i+H5szKG0a5Jt2dgZeVcbRqxsMwovkZyE+077iPBQTMYUq2arHXhawK4mi4BYjhfFTzk
         BP97aD9bwca0s2TYrfvtiazG7osKrCHJD3Ygld4k5w4n3Tj8537luhQ25sHlz/E1e5dv
         0gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209434; x=1795814234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmOzl6V8lBE6K4Kw59v7KS2vxDmVEr8c61I3ZbKSz3I=;
        b=Hzb+BaJGY3d4GbDNkQ1+3qFG6169hPcOe9z0qRUwpqJpTE+QjhxaB3NI/gCbA4zkFr
         3Cj8KBVQOpMTtoaggqj8cnfBLO2oY+04JL0A37FABXmx1jLWTqC+ZmW8l5pc4sdpcRX1
         zBZi9Y2/VCq5LsGzMqsqwuE2GVQzQHxSXOro+VI+CQyczHk2GlKLRxhW+oqW1JM32lqs
         /Ojg02D2TGReuqAYYC7c467uAyyoGK6VLK6YiLSxKJpo+ZUfGKKamwzq6fwl+D/BfG7j
         CV6M6EENIP8AYWoZO1AQJQ8k7gdrCKTxQS9UMQqUf0rENUASQKqO8dkByW0i9q2GkYBc
         YdMA==
X-Gm-Message-State: APuU4Z+RvaXrWu3NZCD8jA8zcmVKKYEYI+5dcdQJIPwgcS03gcl2MlQ5
	3O8gwxEqpyJD6uhmwit6+i5Hb8pM3kMlAeq991anD7VwXhtEM91QGH17
X-Gm-Gg: AZFdTZechZO+BGiiW4zAE9TCQsaEkt4K20gbejj3jcRUu29WZ+GYknEf4i9FSamwrdF
	DIVeaoB5hj8HaFGN8cgmS/7jRFX76rkuINKFGq59lxkB5G1F/TEcdICZxR83zioxW682Q5nZDmn
	ONV3iZtf1DvsyV6sxJuUqGNEa3Lt+Im4lwPCEgqNMv0AIGIoQX4Gqu6K7xRSBEN6f4XALLYcN+F
	RmTxQAWI5EhQYkV03U8yRtTksk7llqF5aiDrpH4NJdroU4ZHezHaayToKU+8k0lBFhNpM8yY+lM
	5jI69tATeUjXXGQkm1p61H2D5ji8NnqfG0AyGx2QQBl3eXqSCitKbOVUfELadoomGGM4jrslUar
	6Q1bwasTM62AhyArbiNHYhlL89t/8jwlQQvDaUPpCOhapv64sV2v0NHxN1Y5kZddxurRISf4xiH
	lc0fK3nGJTPDnMAOTByzL9qIw9uw0M+9CgkgIJy7458h9tvZWluB3rD5urpgUlqhK3qNW5TnuAl
	JBl8OicY5sVdFluGphFOBpbPFb55moI3aduirLSm49eJ3xi7atpKhYiXZooEtQiOy4x51kpP2Lw
	CTJnF2FHE6WtBoCBtFETFkklrr+PNDhrNTzjoNnadBQa33ZVpDBpM89Qjt1TBvhmCuKc
X-Received: by 2002:a05:6102:441a:b0:7c3:f36:c7b with SMTP id ada2fe7eead31-7d739460f73mr2283411137.14.1795209433597;
        Fri, 20 Nov 2026 13:17:13 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm4075996137.7.2026.11.20.13.17.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:17:13 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3] tcp_metrics: hash the destination address with SipHash
Date: Fri, 20 Nov 2026 16:17:11 -0500
Message-ID: <20261120211711.75786-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tcp_metrics bucket is derived from a fold of the peer address.
For IPv4 the fold is ipv4_addr_hash(), which returns the address
unchanged. For IPv6 it is ipv6_addr_hash(), which XORs the four
32-bit words of the address. net_hash_mix() is only XORed in after
that fold, so two addresses of either family with the same fold share
a bucket in every netns.

A remote attacker with an IPv6 /64 can thus compute, without knowing
net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 address:

  w3 = w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */

A bucket holds six entries and the seventh insert replaces the oldest.
tcp_init_metrics() seeds the initial RTO from the cached RTT, so the
attacker can tell whether an entry it planted was evicted, and thus
whether another address in that bucket closed a connection since.

This primitive, with six entries of one fold and a seventh of another,
shows whether two folds share a bucket. Each answer rules out values
of net_hash_mix(), the only unknown, and since XOR and multiply is not
a PRF a few hundred answers recover it. The attacker can then fill
every bucket and see which one any client's connection evicts from.
The multiplication in hash_32() is invertible, so with net_hash_mix()
known, each observed eviction leaks 14 bits of the client's address.

Remote net_hash_mix() recovery followed by remote bucket eviction
observation was tested under different levels of legitimate traffic
and with the attacker machine and victim server being in different
continents:

 legit      attacker    evictions         false or
 conn/s     conn/s      detected          misclassified
 -----      ------      ---------         -------------
 1          944         214 / 214         0
 10         927         2146 / 2165       0
 100        864         22356 / 23576     0
 999        1239        167213 / 286754   0
 2974       1412        118665 / 809618   0

Measurements began after the attacker had recovered net_hash_mix()
and planted entries; the legitimate connections were present
throughout. net_hash_mix() recovery was successful in all cases and
took 28-936 seconds. Note that while the attacker must send many
connections, these are very efficient to process and caused negligible
load on the victim server as measured by latency and memory.

Fix this by hashing the address with SipHash and a random key, as commit
2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHash")
did for inet_peer. net_hash_mix() is fed into the SipHash input, as
inet_ehashfn() feeds it into its seed, so each netns gets its own bucket
map. hash_32() is kept to reduce the result to the table size.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
v3: - add testing numbers to changelog (Eric)
    - fix patch formatting issues (Eric)
    - feed net_hash_mix() into the SipHash input instead of XORing it
      in afterwards to protect from potential local attacks (Sashiko)
v2: https://lore.kernel.org/netdev/20261117041029.80543-1-juanagusnicco@gmail.com/
    - use siphash_1u32() for IPv4, a4.vif is always zero in tcp_metrics
      (Kuniyuki)
    - call tcpm_addr_hash() once after the address family branches
    - changelog: explain more clearly why net_hash_mix() and addresses
      are recoverable
v1: https://lore.kernel.org/netdev/20261112064624.15245-1-juanagusnicco@gmail.com/

Reproducer: github.com/agusnicco/tcp-side-channel

I address the questions Eric asked on v2 below:

> How many connections does your reproducer need, for each phase ?
>
> 1) Recovering net_hash_mix().
>
> 2) Filling the table (16384 * 6 flows with the default size ?),
>    then each sweep to find which bucket was hit.
>

1) I measured this to be 191 to 677 connections per attempt. The reproducer
verifies the recovered value against collisions it has not tested yet,
and starts over if they do not hold. The most it took was 15 attempts,
on a server receiving 800 new connections per second, 936s total.

2) You guessed it: 16384 * 6 = 98,304 connections. The attack would be
infeasible if they had to be sequential but concurrency can be as high
as the number of buckets. On my tests plants sustained 1000 conn/s
with zero target degradation. Filling the whole table took a median of
43s with victim server and attacker machine being across the Atlantic.

Each sweep is one read per bucket, 16384 connections, plus one more
for every eviction found. Sweeps took a median of 24s in my tests.

> Each probe also has to wait for an RTO, so wall time matters too.

Planting does not wait for an RTO since the attacker echoes an old
TCP timestamp, and the server records a large RTT immediately (see
reproducer). Reading takes about 0.3s per probe, a little over rto_min,
no matter how large the cached value is. Probes run in parallel.

> Also, how does this behave on a server with real traffic ? Every
> other client closing a flow evicts entries as well. You mention
> a test against Ubuntu 24.04 over the internet, was this host
> serving anything else ?

My original test had an idle host but I tested high traffic today
(see table in the commit message). I performed the attack on an nginx
server on Ubuntu 24.04 that was receiving legitimate connections while
the attack happened. The victim server was in a Virginia datacenter,
the attacker machine in Ireland.

The attacker needs to perform hundreds to thousands of connections per
second if the victim server is high traffic but these are extremely
cheap to handle. I tested this separately. Even an unproxied uvicorn
server could handle 200/s before degradation. nginx handled 1000/s
without degradation of any kind being observed. And they could do it
on a t3.micro EC2 instance (AWS) which has 2 vCPUs and 1 GiB of memory.
I measured degradation using latency and memory readings while the
attack happened.

I also reproduced the case where the attacker intersects buckets
from multiple hosts to recover the full 32 bits of each address.
This is possible under many common scenarios, the one I tested
involves client browsers loading a site and hence making many
connections to eight hosts simultaneously. 47/50 addresses were
recovered while the victim servers received 100 legitimate connections
per second. Also done across the Atlantic.

All tests were done on my own infrastructure.

> Note that many servers (including Google ones) have tcp_no_metrics_save=1

Many probably do but I haven't come across one yet. All distros ship
tcp_no_metrics_save=0. I also rented 5 AWS, Azure, and GCP VMs and
they all came with tcp_no_metrics_save=0.

This bug was discovered during an LLM-based code review.

The patch was tested on a QEMU guest. Addresses built to share a
fold no longer share a bucket, in either netns. Entries are still
found when a peer reconnects and by "ip tcp_metrics show/delete".

For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
"static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
be used there.

 net/ipv4/tcp_metrics.c | 49 ++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index ae551546422f..fc976f61217d 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/tcp.h>
 #include <linux/hash.h>
+#include <linux/siphash.h>
 #include <linux/tcp_metrics.h>
 #include <linux/vmalloc.h>
 
@@ -95,6 +96,25 @@ static unsigned int		tcp_metrics_hash_log __read_mostly;
 static DEFINE_SPINLOCK(tcp_metrics_lock);
 static DEFINE_SEQLOCK(fastopen_seqlock);
 
+static siphash_aligned_key_t tcpm_hash_key __read_mostly;
+
+static u32 tcpm_addr_hash(const struct inetpeer_addr *a, const struct net *net)
+{
+	u32 mix = net_hash_mix(net);
+
+	net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
+
+	if (a->family == AF_INET)
+		return siphash_2u32((__force u32)a->a4.addr, mix,
+				    &tcpm_hash_key);
+
+	return siphash_3u64(((u64)(__force u32)a->a6.s6_addr32[1] << 32) |
+			    (__force u32)a->a6.s6_addr32[0],
+			    ((u64)(__force u32)a->a6.s6_addr32[3] << 32) |
+			    (__force u32)a->a6.s6_addr32[2],
+			    mix, &tcpm_hash_key);
+}
+
 static void tcpm_suck_dst(struct tcp_metrics_block *tm,
 			  const struct dst_entry *dst,
 			  bool fastopen_clear)
@@ -270,13 +290,11 @@ static struct tcp_metrics_block *__tcp_get_metrics_req(struct request_sock *req,
 	case AF_INET:
 		inetpeer_set_addr_v4(&saddr, inet_rsk(req)->ir_loc_addr);
 		inetpeer_set_addr_v4(&daddr, inet_rsk(req)->ir_rmt_addr);
-		hash = ipv4_addr_hash(inet_rsk(req)->ir_rmt_addr);
 		break;
 #if IS_ENABLED(CONFIG_IPV6)
 	case AF_INET6:
 		inetpeer_set_addr_v6(&saddr, &inet_rsk(req)->ir_v6_loc_addr);
 		inetpeer_set_addr_v6(&daddr, &inet_rsk(req)->ir_v6_rmt_addr);
-		hash = ipv6_addr_hash(&inet_rsk(req)->ir_v6_rmt_addr);
 		break;
 #endif
 	default:
@@ -284,7 +302,7 @@ static struct tcp_metrics_block *__tcp_get_metrics_req(struct request_sock *req,
 	}
 
 	net = sock_net(req_to_sk(req));
-	hash ^= net_hash_mix(net);
+	hash = tcpm_addr_hash(&daddr, net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 
 	for (tm = rcu_dereference(tcp_metrics_hash[hash].chain); tm;
@@ -310,18 +328,15 @@ static struct tcp_metrics_block *tcp_get_metrics(struct sock *sk,
 	if (sk->sk_family == AF_INET) {
 		inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
 		inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
-		hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
 	}
 #if IS_ENABLED(CONFIG_IPV6)
 	else if (sk->sk_family == AF_INET6) {
 		if (ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
 			inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
 			inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
-			hash = ipv4_addr_hash(inet_sk(sk)->inet_daddr);
 		} else {
 			inetpeer_set_addr_v6(&saddr, &sk->sk_v6_rcv_saddr);
 			inetpeer_set_addr_v6(&daddr, &sk->sk_v6_daddr);
-			hash = ipv6_addr_hash(&sk->sk_v6_daddr);
 		}
 	}
 #endif
@@ -329,7 +344,7 @@ static struct tcp_metrics_block *tcp_get_metrics(struct sock *sk,
 		return NULL;
 
 	net = sock_net(sk);
-	hash ^= net_hash_mix(net);
+	hash = tcpm_addr_hash(&daddr, net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 
 	tm = __tcp_get_metrics(&saddr, &daddr, net, hash);
@@ -811,15 +826,13 @@ static int tcp_metrics_nl_dump(struct sk_buff *skb,
 }
 
 static int __parse_nl_addr(struct genl_info *info, struct inetpeer_addr *addr,
-			   unsigned int *hash, int optional, int v4, int v6)
+			   int optional, int v4, int v6)
 {
 	struct nlattr *a;
 
 	a = info->attrs[v4];
 	if (a) {
 		inetpeer_set_addr_v4(addr, nla_get_in_addr(a));
-		if (hash)
-			*hash = ipv4_addr_hash(inetpeer_get_addr_v4(addr));
 		return 0;
 	}
 	a = info->attrs[v6];
@@ -828,24 +841,22 @@ static int __parse_nl_addr(struct genl_info *info, struct inetpeer_addr *addr,
 
 		in6 = nla_get_in6_addr(a);
 		inetpeer_set_addr_v6(addr, &in6);
-		if (hash)
-			*hash = ipv6_addr_hash(inetpeer_get_addr_v6(addr));
 		return 0;
 	}
 	return optional ? 1 : -EAFNOSUPPORT;
 }
 
 static int parse_nl_addr(struct genl_info *info, struct inetpeer_addr *addr,
-			 unsigned int *hash, int optional)
+			 int optional)
 {
-	return __parse_nl_addr(info, addr, hash, optional,
+	return __parse_nl_addr(info, addr, optional,
 			       TCP_METRICS_ATTR_ADDR_IPV4,
 			       TCP_METRICS_ATTR_ADDR_IPV6);
 }
 
 static int parse_nl_saddr(struct genl_info *info, struct inetpeer_addr *addr)
 {
-	return __parse_nl_addr(info, addr, NULL, 0,
+	return __parse_nl_addr(info, addr, 0,
 			       TCP_METRICS_ATTR_SADDR_IPV4,
 			       TCP_METRICS_ATTR_SADDR_IPV6);
 }
@@ -861,7 +872,7 @@ static int tcp_metrics_nl_cmd_get(struct sk_buff *skb, struct genl_info *info)
 	int ret;
 	bool src = true;
 
-	ret = parse_nl_addr(info, &daddr, &hash, 0);
+	ret = parse_nl_addr(info, &daddr, 0);
 	if (ret < 0)
 		return ret;
 
@@ -878,7 +889,7 @@ static int tcp_metrics_nl_cmd_get(struct sk_buff *skb, struct genl_info *info)
 	if (!reply)
 		goto nla_put_failure;
 
-	hash ^= net_hash_mix(net);
+	hash = tcpm_addr_hash(&daddr, net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 	ret = -ESRCH;
 	rcu_read_lock();
@@ -947,7 +958,7 @@ static int tcp_metrics_nl_cmd_del(struct sk_buff *skb, struct genl_info *info)
 	int ret;
 	bool src = true, found = false;
 
-	ret = parse_nl_addr(info, &daddr, &hash, 1);
+	ret = parse_nl_addr(info, &daddr, 1);
 	if (ret < 0)
 		return ret;
 	if (ret > 0) {
@@ -958,7 +969,7 @@ static int tcp_metrics_nl_cmd_del(struct sk_buff *skb, struct genl_info *info)
 	if (ret < 0)
 		src = false;
 
-	hash ^= net_hash_mix(net);
+	hash = tcpm_addr_hash(&daddr, net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 	hb = tcp_metrics_hash + hash;
 	pp = &hb->chain;
-- 
2.53.0

