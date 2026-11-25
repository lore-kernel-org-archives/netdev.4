Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618384;
	b=hQ2BlzWkY4GdKK+276+tKyAjaGA5nMI3dUrwbL67Q6tU32XNi1iG3nmySbLe35//23Co
	 IdkJ5/WTRjOlGEPLl5NTf5+QsSHI4hmfQb9xRHPkOFgD2SZGGcBgCG+q/wbfeFVaprJOq
	 8FLkdHTLSqc+gjWroTKdIGbtwNG4sWXrqaPPv1pyUXV5jmDMdzf1aNOMDD23k1rfCBbbT
	 o6aW5Sn5eM/2OZHHaP6Y6GcJkEqdnNxNym+SQIL115y6jmYXbvtM52r1qftjMhdQtp2Yu
	 Us8zSH1kH0WUl6oharWxZEQlYuket8i45rVr2Y0U5GTqkjBPmYjBRKx3mve3skx1Pzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1aNbP6cm+IPOqIBqaQTTpgtlCC7hWsGOyVHRpxary5o=;
	b=eU1+C8Juh8jJcA+uJugOPRAoNOnKYh8LEOL/SpQ9M6ujxYbJ7Ir2kPD8PNi0QVsq7OcQ
	 7Xf0Z626MGErpvMP1LZe3qf6/JcNKHRtHcHsbg3Fn3FKfwoS/AcdueOKlfTxfhiOfT5rv
	 NN0L4CnfQbVN0BH1xxceMxUlnflPWZZrZlvTFhilKNAtoxsbxeLEzJr9/QRER+4z1HSOu
	 tmQ2Ct43znRjiG/KTfaKSXSQyXe8dewNzj9xKxlbqpRsaJ5s1dMkhaU2TALMfzA01qM7F
	 8Cam69KukcMvCtPVpHrgIGw2zP8hRbHOxaYxdu6XTQjyDFIVV4jtjkbmSIogWavqz1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5Tdqeda;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB2606A334
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5AB2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5Tdqeda
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso3687927a91.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618383; x=1796223183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aNbP6cm+IPOqIBqaQTTpgtlCC7hWsGOyVHRpxary5o=;
        b=r5TdqedarGwO4tllYebeAeSKUi0Z77B7fzrV9oR8s3Fpm/QJgzE8w+6yMmup1sKlQf
         /5p8vR27ORHV7V6AIA+gDZU8kka3TAzmaI86Hm55lFB5s0Wji293CFW/Y0bFMX6GOpVI
         KyOD1WrB7yVWt6IbbWhnSnc7nK22wfR3EvwMa5CSeiOeU+XN99xap7WLekUv19awDDYO
         QKc5w8o/Ews6mMi9jPCYsFvM99vFu3h60xn487tm+egz6YRQT9/ltoOB5xiC8YyWhldT
         MNBiSHjmXqd3nBj4uzY3xezoeaapa8J5gngle2Zx7LIbkkPnQQZZRZazHaweTKo92LXi
         8TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618383; x=1796223183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aNbP6cm+IPOqIBqaQTTpgtlCC7hWsGOyVHRpxary5o=;
        b=AJLiXKCg8PtXkEzwP7Fe7Q/fyN9c7bvxbFyhvmpSLIUic0Fyy4U7Lq+8rp5wbLl1t3
         ofV9y5Ffj2Csm5ery2UXlyBuxRW/Gp0HiCOnKL/ElVZkt8Uhvpe1aACspzBvHN6EliVa
         kIuh946U3UIez6d2MCO68q60zUC363lb03jobGO+s0EWq4GIT7K6ZDDElHuRwS8w1H8P
         1oFgmOjLboug9LqvcXvDP/EQ5sXn72EwWyrs4sIkJfnsjwkbjrSVluyYwpUBu9bSO3o2
         owGqPAFNjQiULhratNouOgfv4+gQ4SuN2d204UvkrgpFWsZyp/bQcat4FXm8oZua5pin
         jheA==
X-Forwarded-Encrypted: i=1; AL+hErEHyEmmnuFbsbCVAY8x72ptOCVd2jq9TOdN7kNXAafr1xPFsFDcc1ikl9QUPCTgWWFSGeD40nI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xJmsdnFL/5DsXNm1jXFQdnjja6MDMTCDN/9YSJjaIhtk002hI
	2J6u66Ywns3nXDlV80m8KGAirB6XQtEzTfk+ar+gfB3xBkxTnpFPap8T
X-Gm-Gg: AZFdTZeQIjgyV6CJ5M4/K5W+0y6ghWfPwF4LxkyWBR7RfiLdnOBemp4S91Z0BnCIu2L
	mzOkdrkpVL7gpeOSU1Zn7OtAQXTAjiynfpEVpPnAtAsZ9oAISaYct5IR1A3sIVEa3OZl/67nAjh
	9s+Qf5xQLShdBkd6HEY4GVtkSaxJpMhcLCuVXoZRrN5rpMIjTR2cCuCYQ4YzwkI4/C74Xr4EE/K
	5Jek1K78l7tmZQGQvLCXLQbrCTcMmtQ+t2pS25aqCGE+7EUXEVwRDyoTDaD+7xCpYxJp0yxQ3CY
	4kxKFLkytl3HD2hGNnOIzpCyfUwCISC+8Yl0LKiNmhlEVc492G4IyhfRuZ7rFPtySkz8/18gFQ4
	H+4k2KLdRsurpXjkP6ht8I1iaGvXtHNcC+DmjJZWjNEJHQm8MP5IAJ6KRF3breek89TG1YOiVUl
	W5CI60xnjdHKXUWSgTGBBsB6S34XkKKT1RU2x60XxFcAsJJ8bZLy4fbN8CPZTrZfy6xs/qqH3a+
	4bFY2lKIV+omGybOhRIkHuiVrk14XRMGnidjvExA59lOdkNqhBOgcrnP3pcq7NykexlQIIx6fk2
	JWrwxdYdKKnJ9ujQUvvg14yED73WLYEinyDaZ3lnlyXcRU5VtI9SrqPGpBBiRbXZL/8pXsPoGCF
	6V0zMgJRIqq1j
X-Received: by 2002:a17:90b:48d0:b0:3b3:b5b8:1f43 with SMTP id 98e67ed59e1d1-3b41c97115amr19301848a91.62.1795618383094;
        Wed, 25 Nov 2026 06:53:03 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm28554460a91.2.2026.11.25.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:53:02 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Thomas Graf <tgraf@suug.ch>,
	Cen Zhang <cenzhang@linux.microsoft.com>,
	netdev@vger.kernel.org
Subject: [PATCH net] ipv6: skip walkers of other tables when a route leaves the tree
Date: Wed, 25 Nov 2026 23:52:58 +0900
Message-ID: <179561512100.3216623.16734853197511150282@gmail.com>
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

fib6_walkers_replace_leaf() runs under the tb6_lock of the route's
table but checks every walker of the netns, including walkers of other
tables, which run under their own table's lock. Such a walker can be
anywhere in its walk: fib6_walk_continue() sets w->state to FWS_C
before it sets w->leaf, and the walker of fib6_clean_tree() starts with
an uninitialized w->leaf on the stack. A route delete in one table
while a link change cleans another one compares that value:

  BUG: KMSAN: uninit-value in fib6_del (net/ipv6/ip6_fib.c:103)
   fib6_del (net/ipv6/ip6_fib.c:103 ip6_fib.c:123 ip6_fib.c:2056)
   __ip6_del_rt_siblings (net/ipv6/route.c:4086)
   ip6_route_del (net/ipv6/route.c:4235)
   inet6_rtm_delroute (net/ipv6/route.c:5686)
   rtnetlink_rcv_msg (net/core/rtnetlink.c:7169)
  Local variable c.i created at:
   __fib6_clean_all (net/ipv6/ip6_fib.c:2315 net/ipv6/ip6_fib.c:2344)
   fib6_clean_all (net/ipv6/ip6_fib.c:2355)

A walker of another table never rests on a route of this table, so
skip it.

Fixes: c71099acce93 ("[IPV6]: Multiple Routing Tables")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user: one thread toggles lo, so that fib6_clean_all() walks every
table, while the main thread adds and deletes a route in the main
table.

#define _GNU_SOURCE
#include <arpa/inet.h>
#include <net/if.h>
#include <net/route.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>

static int s;

/* link changes walk every FIB table with fib6_clean_all() */
static void *toggle(void *arg)
{
	struct ifreq lo = { .ifr_name = "lo" };

	for (;;) {
		lo.ifr_flags = 0;
		ioctl(s, SIOCSIFFLAGS, &lo);
		lo.ifr_flags = IFF_UP;
		ioctl(s, SIOCSIFFLAGS, &lo);
	}
	return arg;
}

/* route deletes scan the walkers of all tables */
int main(void)
{
	struct in6_rtmsg rt = {
		.rtmsg_dst_len = 64,
		.rtmsg_metric = 1,
		.rtmsg_flags = RTF_UP,
		.rtmsg_ifindex = 1,	/* lo */
	};
	pthread_t t;

	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	s = socket(AF_INET6, SOCK_DGRAM, 0);
	inet_pton(AF_INET6, "2001:db8:1::", &rt.rtmsg_dst);
	pthread_create(&t, NULL, toggle, NULL);
	for (int i = 0; i < 2000000; i++) {
		ioctl(s, SIOCADDRT, &rt);
		ioctl(s, SIOCDELRT, &rt);
	}
	return 0;
}

Without the patch, KMSAN reports the uninit-value above; with it,
the reproducer runs to the end without a report.

The patch was written with LLM assistance; we reviewed and tested it.

 net/ipv6/ip6_fib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
index e1d49897d6ab..0d0748e31f57 100644
--- a/net/ipv6/ip6_fib.c
+++ b/net/ipv6/ip6_fib.c
@@ -100,6 +100,9 @@ static void fib6_walkers_replace_leaf(struct net *net, struct fib6_info *old,
 
 	read_lock(&net->ipv6.fib6_walker_lock);
 	FOR_WALKERS(net, w) {
+		/* Only walkers of this table are serialized by its tb6_lock */
+		if (w->root != &old->fib6_table->tb6_root)
+			continue;
 		if (w->state == FWS_C && w->leaf == old) {
 			pr_debug("walker %p adjusted by unlink of %p\n", w, old);
 			w->leaf = new;
-- 
2.43.0

