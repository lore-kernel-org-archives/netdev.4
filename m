Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527151;
	b=Ud83omgKsU7CkzUX37Iitdpzsyh2YgWiv3iDSLTPH+AZA+oQbRE2rtxdJIjyb7raKyvN
	 asD/SL+bkyCaJa+Dl9LjY1emKka4JO5Y6VPVlHwKQyy6As0SCS3Bk2df8mNfUWNn/kjZY
	 9nRQu3A+HhaG62xZZ56EZpXc65aRxYV/J0/NFOoyzjlt2dufmd0GbTbOoeEzGmussv9WD
	 atUfuzYE9idCazdbQdCS4rizpTFtI1wD391juzHkrhch84Pw9ePWR6dVbNtvG0ggwkRTB
	 7BBw0HHrgyFbeK/YRuL+0Ymh9uAfc7klQIDxpaBna5osxh4anFjUi93wCJ19pOLxE9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VrG772mnzwgskPCfeH5KojWdP8V7/dproYx9MqGGJFs=;
	b=a+Sz6S+PBynNGEQHQ3hwS6hgevrSLWGfm9EbtL8X7nbfsOR29AeNxVQecJ532fenFUkk
	 bbjSH0lp+RCUbxPIz0Ah3apKPV6gk+4W+d3IMu5SZeJZ8ANAKp2XTgqCTxEJ/RrBuRvKV
	 xW4x9PO+zm09qlSR8j5Y5sY9FW2Wa6in4L5rbCeqv+PtelKdZqs/XnI/Xsge7cMK4jE5A
	 W+hYe02sthuNawpzR30+KFpa7wV1vICfqH2ptuVwu8RN53U8tTbQ7lA5HZBjaMq6N8VH4
	 yyW4C1dj5f8NOPZkrgx7cXhqMgUFgFijAkFWVgivpDT2zuTlCYRMspgqJFJ0R3gaQxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4egP5Gj;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D6A606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D6A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g4egP5Gj
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3357343b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527150; x=1796131950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrG772mnzwgskPCfeH5KojWdP8V7/dproYx9MqGGJFs=;
        b=g4egP5GjJXT/6CK+2TBHZWJZAVK+2YffiQ8BG07fEU9u0r/bMyw5At30O/ekDEEpZg
         x/9925pgcJM4bkvHoCAdBHY/EGG0uqPMTxRYND8Djzm0vAhndDCfeK0AaPMwEpwzJOhl
         0z1BuRwIuv0qqp0ASWjtxq7SNnrhEQ3ZBv9+0Kntf8UPJkJMue5bfnw7JXBBJ89szzHe
         PBSQYv3ZucgLAUBYCFDD1DpdfTIczM/2JvKrG2ZD6BpcT3PVDEVVdN24sMFlTkxCFfXk
         aORNk9HYwtSvkKWxeLRTM3ePL4gunQ2Mt405OnvSb3qP6/4rxHoyi9ZyBzpptQ1P6epP
         XPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527150; x=1796131950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrG772mnzwgskPCfeH5KojWdP8V7/dproYx9MqGGJFs=;
        b=dpbj8HRw9SV1T7LECa38X+2RZn8tDX2r0jSZACI8+/KqFSSJWEy58NeyJgjWGwit0+
         pa0NzrOiD9V49TJfSxRfT+RDSYM1jCrdscpVUVpHIx7SWy21oGje/pFKgYswU8AiKba9
         lDa+njrHRTNPRfC9FmgVEDXNwM7ayUuGqzDE7NsAkk1E+jsJtV5L9wkjSajgiPk4CInr
         drJOr4YhiOWtZ6renza/OcXTI5CarDeIJtULJPWYNxH5SBa79y5RssjinBXkBBzA62c6
         +MUu0Arc94fUuJte77pt3KOWgqHachHHiwixji6Auu9kVS1w36pWEV+AJbRNUj48gm/e
         RDXQ==
X-Forwarded-Encrypted: i=1; AL+hErHXbNM7EM4WFbkqPJPpZd5pySmUgNqwIY9W1EvRpi/BLlV3GGtyrqqJXbQDKvLrEXMOODftzgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kz/K5z+adbAt4trHWoMNzh2PFBkaFWqhfdWMtJgHEtyleUCtr
	spS535Oa5dUl7VhwQWQoRXFS0aDsy8PFWDZujCs0XGj7gIIitu34vID0
X-Gm-Gg: AZFdTZd3BbTxyMgN4/5G1vM7JI72HKgHXHEIsxIRXyzsiWKxZwnSayjceu9SQL2Q8XC
	1cori2rgmGnmkxjxlhx3BvYGjegi4WRDMFNKzeTCD4Y7+CIq6sWiyBVqhMCW1H306eTP2x1j2lr
	N18kfBdURYmY3iR7mOgW48wOpRtfrWC6ddOcmMlnpOF/OGhDpLo62hV7o9UL8lCCJsC5fHSBrHQ
	EQuNtAiX5XIaJiwG+w9mHWK2ehxaQJ/hP90nae4GpbS/Zs8bvlo6QGfefEWlUqrtLklPKlgGCTx
	Aplru9hxE3/9YqBQvCHGs32CRBe6qpOFA7oPpKumfKN/MDwS61lQioj4t+Y3bFHqJtnqLA4E9Xk
	bPQpHW7nZEIm2lEmCSnpCZLbqa6PRG6k+/AMlua5gpd1l9EbvMP/8mWXmv8wmNFDvJOLCehW2Zy
	lIP0WkhowiphHOHIp5MlRAjOQv9HUzzhd2YTFFL7v3ZToIbeIQNgyEfSlmMleqr284G6131F2e8
	pEeA5s4WJ81wLfX5kvq4UcBfdprqoNXh47b2gSIbUcKgoIQkfkJbRAfIceq9LhXlGDSzLxsiyG6
	Ax/2sIGIYNFjsDJN61mY2ZjJfnR3O7wAtP4V/WipmQwt8azBPpLBuHqgiW18+omureg=
X-Received: by 2002:a05:6a00:2e91:b0:8b5:f313:9f40 with SMTP id d2e1a72fcca58-8c87d322aa5mr12811537b3a.49.1795527150559;
        Tue, 24 Nov 2026 05:32:30 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bc47sm7336887b3a.6.2026.11.24.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:32:30 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Ido Schimmel <idosch@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH net] ipv6: anycast: delete the anycast route under idev->lock
Date: Tue, 24 Nov 2026 22:32:26 +0900
Message-ID: <179552107133.1345245.9532670970901182620@gmail.com>
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

IPV6_LEAVE_ANYCAST no longer holds RTNL, so a join of the same address
can run between the two halves of its last leave. __ipv6_dev_ac_dec()
unlinks the aca from idev->ac_list under idev->lock but deletes its
anycast route only after dropping the lock. A join in that window finds
no aca and creates a new one, and its ip6_ins_rt() fails with -EEXIST
because the old route is still in the table. __ipv6_dev_ac_inc()
ignores that error, the leave then deletes the old route, and the
address stays joined without an anycast route in the local table.

Delete the route before dropping idev->lock.

Fixes: f7fdf13bf103 ("ipv6: anycast: Don't hold RTNL for IPV6_LEAVE_ANYCAST and IPV6_ADDRFORM.")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user: one thread drops the last membership of an anycast address on lo
while another joins it again on a second socket, and the main thread
then looks for the anycast route in /proc/net/ipv6_route.

#define _GNU_SOURCE
#include <arpa/inet.h>
#include <net/if.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>

struct in6_ifreq { struct in6_addr addr; unsigned int prefixlen; int ifindex; };

static struct ipv6_mreq mr = { .ipv6mr_interface = 1 };	/* lo */
static pthread_barrier_t bar;
static int sl, sj, joined;

/* one thread drops the last membership while the other joins again */
static void *race(void *join)
{
	for (;;) {
		pthread_barrier_wait(&bar);
		if (join)
			joined = !setsockopt(sj, IPPROTO_IPV6, IPV6_JOIN_ANYCAST, &mr, sizeof(mr));
		else
			setsockopt(sl, IPPROTO_IPV6, IPV6_LEAVE_ANYCAST, &mr, sizeof(mr));
		pthread_barrier_wait(&bar);
	}
	return NULL;
}

/* the anycast route of 2001:db8::100 in table local */
static int route(void)
{
	char line[256];
	int n = 0;
	FILE *f = fopen("/proc/net/ipv6_route", "r");

	while (fgets(line, sizeof(line), f))
		n += !strncmp(line, "20010db8000000000000000000000100 80", 35);
	fclose(f);
	return n;
}

int main(void)
{
	struct ifreq up = { .ifr_name = "lo", .ifr_flags = IFF_UP };
	struct in6_ifreq ifr = { .prefixlen = 64, .ifindex = 1 };
	int s, lost = 0;
	pthread_t t;

	/* CAP_NET_ADMIN for IPV6_JOIN_ANYCAST */
	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	s = socket(AF_INET6, SOCK_DGRAM, 0);
	inet_pton(AF_INET6, "2001:db8::1", &ifr.addr);
	if (ioctl(s, SIOCSIFFLAGS, &up) || ioctl(s, SIOCSIFADDR, &ifr))
		return perror("lo"), 1;
	inet_pton(AF_INET6, "2001:db8::100", &mr.ipv6mr_multiaddr);

	pthread_barrier_init(&bar, NULL, 3);
	pthread_create(&t, NULL, race, NULL);
	pthread_create(&t, NULL, race, "join");
	for (int i = 0; i < 10000; i++) {
		sl = socket(AF_INET6, SOCK_DGRAM, 0);
		sj = socket(AF_INET6, SOCK_DGRAM, 0);
		setsockopt(sl, IPPROTO_IPV6, IPV6_JOIN_ANYCAST, &mr, sizeof(mr));
		pthread_barrier_wait(&bar);
		pthread_barrier_wait(&bar);
		lost += joined && !route();
		close(sj);
		close(sl);
	}
	printf("joined without an anycast route: %d of 10000\n", lost);
	return 0;
}

Without the patch, a few of the 10000 joins leave the address without
its route; with it, none do, and lockdep stays quiet.

The patch was written with LLM assistance; we reviewed and tested it.

 net/ipv6/anycast.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ipv6/anycast.c b/net/ipv6/anycast.c
index be6dac8a8566..d66d0154ac3a 100644
--- a/net/ipv6/anycast.c
+++ b/net/ipv6/anycast.c
@@ -415,12 +415,11 @@ int __ipv6_dev_ac_dec(struct inet6_dev *idev, const struct in6_addr *addr)
 		rcu_assign_pointer(prev_aca->aca_next, aca->aca_next);
 	else
 		rcu_assign_pointer(idev->ac_list, aca->aca_next);
+	ip6_del_rt(dev_net(idev->dev), aca->aca_rt, false);
 	write_unlock_bh(&idev->lock);
 	ipv6_del_acaddr_hash(aca);
 	addrconf_leave_solict(idev, &aca->aca_addr);
 
-	ip6_del_rt(dev_net(idev->dev), aca->aca_rt, false);
-
 	inet6_ifacaddr_notify(idev->dev, aca, RTM_DELANYCAST);
 
 	aca_put(aca);
-- 
2.43.0

