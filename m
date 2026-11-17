Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888634;
	b=IyoLhT69T4khh8JygQDZe/XdBmHihxuTN6pz+QFEQEQwSBs462N+iLFy3nSxtJv3JFqo
	 4zYKZ07080/FFsr674IAy3NfNsUvzhPIvgcVJfeyoxTp77VEg/Yq1WczLuthxFs/Elzvb
	 mBZ6RpQayg7KCdJ02TJoKKeMqP61hJ24GyTq3EGMXCi3lw+reXJpdvBZu3oqjPg/F8M5u
	 A1KDq67e2U9zcM7QsdOrNMKChOgHF85vRMjWNJN8qU5dF6AEKh1UgWPSnj9sCokFmBgfa
	 qLMTO0w2LzwPwOOksXlWr5+Qjgs2WsHbUlGgCwaYibHvewCX5IeqaWKzXjcBuCu7QZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=if6TDOPB4GDhRNlp84c9OQo0eTdPYoer26tyCt21+Yw=;
	b=o4MuQRsZ5lCMc+mRiMx844b5P87YHI5u5nYQLoD09z70+AwS7H7yjIaAVoS5YEkxj3wj
	 lX68lB10zvtPSjy6K6LdpWUcy74/DC2F98ljlbaqdnuT3LQ6ZhKfE9w0LiZxGDA3hAO4S
	 jNARAX14DRrcnjNZmJ7Ma2prVGhc/iqBk/XVoqL/3vVwcfK6tOKUA9ocT1bwlVZvb/KNN
	 uNOALIBQy0or2LIgJohUVzKjdIvGH+kGWTwEJ7JAW7sxyEcQ3/4bvF9DA9LF/wIbCIhXO
	 PKyKozXBbXiz4TIjksoVOFH1rLJ5ncYdmSWR25jUhUj0zVNbPu+TxwRjsQyZF5Qny2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugq01SQ;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63809606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63809606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zugq01SQ
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso1279726137.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794888632; x=1795493432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=if6TDOPB4GDhRNlp84c9OQo0eTdPYoer26tyCt21+Yw=;
        b=zugq01SQ0C0o4IWmkS1Phe0Mlc91P9HUo7vOtM08DORL/7teCbZm+3O/Tn1oeN1U7V
         WdiA/D3RdscIirK0rPpjNNaM2Bfsd85kFTTBg8brL6Yk3Ypj6al8WkYnxMtA1c5/Nq+n
         5lomE+61XPDRz3VoVnXZvRc6LAl9kcTB62lbjuTjRGQwLLUrO407NKp4XxkSwlC1rq37
         fDJs26jywgY8bEjrctTD+JQxTKbVBTH6agD/TRhNQI1kmb8VaG+OduDKTUZi9zfBzDFB
         plvbxP5r/3X8+rD2LWF2ap75A3+Cslt8dHdnZA0Z9E7UmYbFsRfgcMOG3PpsvdQN1abd
         qR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794888632; x=1795493432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=if6TDOPB4GDhRNlp84c9OQo0eTdPYoer26tyCt21+Yw=;
        b=24LFTSUzDipV27bsWPh+hcp9vivQxdbOUGEbe9TIPgZB9QIGXAFiptyHODvDoSPS2U
         Bw2yCKW96FBmt4mfM7zUQH7p2pndOYD2G2QOfQRiXBkullV2fbiJS3w1JZ7mag+aZGxV
         5HDJ3V7KYrBD4JYu33r5YT5ZDW9O5o/32eMAaFylN/K5wAqvgAfNIl84h99iAIHNWN2l
         xvBLXYdLfzGxnDQh/miLP6YRM1CsO/G7nH+Un3/y2mXlhyXI737+so9CgJR/hc6KVRT4
         er6x6ykJkQpfRyEbfPxQ6oQTRJoomtmswPzshCBK+wtub0YaxvMaf+qeMUF50YSE4bk9
         K6+Q==
X-Gm-Message-State: APuU4Z+dSso0YwNXsNw3z57Y4GrjzRmG6l4uGQtoy4OzFWZn4lJxmX4J
	wENrWDMxF5rWFEgwpuffGkh0Aj4MbWoeRexBdPC/K6uNL5yUpe2aV9MY
X-Gm-Gg: AYBFou0s/MbUqjVHl98t4hA8+hgZPYaKji1myorzpZ/Awlfn4zI12TWImJI8Zs6jCZP
	+DBc0Ooc9cqs2sW/vveHd38qWTCfLWZjo0GOzo1DPf9A9CJKIJtbbaSgNOW5CcxfXR2ktFVH9VJ
	FHFTqmqXTJzUaLXC13rPjhq+9YOXVNrUIf3Rv0TxqA09X0xHanrbYIQBpfeJMHyZSlfaBLKh1OA
	I5Z5Cjn0NokG1UOC/XxSzl/zlNz0LmjtddaEkUf7SCszGknovdCYSM+tgJJWepJfryrpaY8wFLT
	C6/Mvry3coB8V6WANGyp1ByvadLu4w2GZhem+qJ0EpJ4ZBpc3KgVhQyVSIynbct+xsyaIGM/36e
	+VAKpgoPSIuKZeQawp8zA7Sr5Q89DND1dG/7kIKW4sYPcsRexmWodELsFV8fwDon+WQyYfBcttt
	Z2OWlMYhS+Yn7zr01oY0TjgyOUZvAmrSLCRXRunrzJA/oeLo4hj3D7Eg0d26H1o1fZbLPiuj+e5
	hpqMygPE9o281mQJfD0Pl5lRnFlX0OZB1uyRqBv9QfKLg54Oiq/5jplefCEsOvzQEzpx38Kq9nP
	KsiPq9lAMnVvgVtomVa5bwzZkhiUVPvnp3uFy+XAW8rojKA233dJvxUyt4bVqj5fSiZT5FDoQZE
	uEQphJV4+PIgL
X-Received: by 2002:a05:6102:c46:b0:7d2:da5c:6f73 with SMTP id ada2fe7eead31-7d64d81ec2cmr4025026137.26.1794888631829;
        Mon, 16 Nov 2026 20:10:31 -0800 (PST)
Received: from MacBook-Air-91.lan ([2603:9000:d440:53a:79ff:d196:f709:1b3d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e33989bb3sm1401452241.11.2026.11.16.20.10.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 20:10:31 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tcp_metrics: hash the destination address with SipHash
Date: Mon, 16 Nov 2026 23:10:29 -0500
Message-ID: <20261117041029.80543-1-juanagusnicco@gmail.com>
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
attacker can tell whether an entry it planted was evicted. Filling the
bucket of a chosen address with such entries reveals whether that
address, or another one in the same bucket, connected in the meantime.

The same test, with six entries of one fold and a seventh of another,
shows whether two folds share a bucket. Each answer rules out values
of net_hash_mix(), the only unknown, and since XOR and multiply is not
a PRF a few hundred answers recover it. The attacker can then fill
every bucket and see which one any client's connection evicts from.
The multiplication in hash_32() is invertible, so that bucket leaks
about 14 bits of the client's address, depending on the number of
buckets.

Hash the address with SipHash and a random key instead, as commit
2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHash")
did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
namespaces and to reduce the result to the table size.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
v2: - use siphash_1u32() for IPv4, a4.vif is always zero in tcp_metrics
      (Kuniyuki)
    - call tcpm_addr_hash() once after the address family branches
    - changelog: explain more clearly why net_hash_mix() and addresses
      are recoverable
v1: https://lore.kernel.org/netdev/20261112064624.15245-1-juanagusnicco@gmail.com/

Comments below are the same as on v1.

This can be exploited remotely to recover a client's IPv4 address.
A single host narrows the address to about 262 thousand candidates,
and because each netns keys the hash differently, intersecting buckets
extracted from multiple hosts converges quickly into one candidate;
3-5 are enough. The net_hash_mix() value only needs to be extracted
once per boot per host.

Many common cases facilitate this. For instance, a browser loading
one page connects to several hosts within the same second. That
supplies the buckets needed to converge, and the shared timing shows
they belong to the same client.

I reproduced the bug on a QEMU guest running mainline (2a500a04d6f9) and
against Ubuntu 24.04 over the internet. With the patch applied, the
reproducer no longer finds addresses that share a bucket. The
reproducer is available on request.

For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
"static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
be used there.

This bug was discovered during an LLM-based code review.

 net/ipv4/tcp_metrics.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/tcp.h>
 #include <linux/hash.h>
+#include <linux/siphash.h>
 #include <linux/tcp_metrics.h>
 #include <linux/vmalloc.h>
 
@@ -94,6 +95,22 @@
 
 static DEFINE_SPINLOCK(tcp_metrics_lock);
 static DEFINE_SEQLOCK(fastopen_seqlock);
+
+static siphash_aligned_key_t tcpm_hash_key __read_mostly;
+
+static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
+{
+	net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
+
+	if (a->family == AF_INET)
+		return siphash_1u32((__force u32)a->a4.addr, &tcpm_hash_key);
+
+	return siphash_4u32((__force u32)a->a6.s6_addr32[0],
+			    (__force u32)a->a6.s6_addr32[1],
+			    (__force u32)a->a6.s6_addr32[2],
+			    (__force u32)a->a6.s6_addr32[3],
+			    &tcpm_hash_key);
+}
 
 static void tcpm_suck_dst(struct tcp_metrics_block *tm,
 			  const struct dst_entry *dst,
@@ -270,13 +287,11 @@
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
@@ -284,6 +299,7 @@
 	}
 
 	net = sock_net(req_to_sk(req));
+	hash = tcpm_addr_hash(&daddr);
 	hash ^= net_hash_mix(net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 
@@ -310,18 +326,15 @@
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
@@ -329,6 +342,7 @@
 		return NULL;
 
 	net = sock_net(sk);
+	hash = tcpm_addr_hash(&daddr);
 	hash ^= net_hash_mix(net);
 	hash = hash_32(hash, tcp_metrics_hash_log);
 
@@ -819,7 +833,7 @@
 	if (a) {
 		inetpeer_set_addr_v4(addr, nla_get_in_addr(a));
 		if (hash)
-			*hash = ipv4_addr_hash(inetpeer_get_addr_v4(addr));
+			*hash = tcpm_addr_hash(addr);
 		return 0;
 	}
 	a = info->attrs[v6];
@@ -829,7 +843,7 @@
 		in6 = nla_get_in6_addr(a);
 		inetpeer_set_addr_v6(addr, &in6);
 		if (hash)
-			*hash = ipv6_addr_hash(inetpeer_get_addr_v6(addr));
+			*hash = tcpm_addr_hash(addr);
 		return 0;
 	}
 	return optional ? 1 : -EAFNOSUPPORT;
