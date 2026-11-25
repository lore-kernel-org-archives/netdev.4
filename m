Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614546;
	b=H7tAkdnmt2+z1ZTsP+QH85bbKpgD795V/5wOkv9kWV696Aby4PvOsN/rEVPXKUXHBn7a
	 Lb1IHS6uWt4n4wMmaVsk7UuGTXnNtZGHpexXu8sPd4Za93WCG/Wj8zX/pocK5mbMhXhyM
	 o8n6iF6RtvHpd9lYvnM+OXx8ez/i9HVHBfdMergl/BfTL4YQzBWuOufS2tOx/1BOYkfY+
	 iHLXMbNZI1Z0vOwqyxEFwcl9gnruBTDx3X+E3gS4+uegYwabfw8g5soZ1gqny6p4Yp4uH
	 u82m4+nJXDGOob48U5gNKap/ZtycnKmyCHun4cZgLvdrxB671cKdY3Bvz7b8F5agLLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q+TEqk3BrCSLG9dvbIoNPDzAN/9pi420Wcl40rHqq+o=;
	b=qNLlsyalEtcduTenyjeNj1Ug4Ux/gQz5POY63giIwlCZo5y3QspY8h3/SaGrVLyDWPjF
	 JDgWQmnSo6PUCVG4VglSG9lyLSgV2RyhCzTMxmrssFKe9VPkojdUEdOAIa9f1RCysWVYP
	 uZnqC51hrJIfmF4HmGegGDwrfgp5vij0sVTPYjm69XhHfB/0Gg7yhDRh2iogiBqcne/ic
	 EP9Mw7G24dd8ZXR47OE/ieD7ihQ0EZG0nV6tP0ri3mgv62p2sr8IDLW6XphRvs+YnBocS
	 rR8JxDEIrJF2ZDO7LW2PusgSjYc7yXYHV+VxWOjwOZsTdiGMUniidvLvl9i5iOmtvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBRswj5m;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA8606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08EA8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBRswj5m
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386cf1041cdso1425997eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614545; x=1796219345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+TEqk3BrCSLG9dvbIoNPDzAN/9pi420Wcl40rHqq+o=;
        b=GBRswj5mjNzJLymR8dayJW2ojhT2B30cBwmTXtrjzjIB6rH4miof2IkwnmfCPkZ+tE
         OB8BdB5RSDtOUYv+Nk7IBRHQbisa0gKrP2h+nrf3xSyeKgJjlzFbpG92Cj+OimTgatH6
         Kx4RZuCHUqHH9PhjA2seW3rWWhHvHiojuZE3rhzQ4R4cxB2dy05jQZFE8CFCn1GUcMxD
         NSKUdGQnSZ3cwaPMmoaXsOcSvGdpo+iV9TdPa6spZLj82SV6FJR9sjey6hNSZaBMyPFz
         n7fSLN7vkfRCIliZpNdyR/8hh2uy4l9O1Uo8hOmiccsxRQGcSMH+2qa6e7ioM+0zsLol
         6yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614545; x=1796219345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+TEqk3BrCSLG9dvbIoNPDzAN/9pi420Wcl40rHqq+o=;
        b=vYezKb0fAohunWTUmwTAUbSKuNByTCCjfEfynSRVctU3VoTiNFwfZrqkttuNhuRUPO
         W7tew7DsJEZCdm3MWvqli2O+wkK85wESxFYQaiRJYu4kPDPjjUiCQzDyMG2wz1j3ExPr
         1ttuAn/BQtXIsK2b89ZrumZ02s4B3Kwi3rulqYJRjgwTKHlp5v1lf1qcRhJXBNokiVlt
         yxUbSPyzogU8SU2tIXq3GTziEAoLafi4hfl59Mw4YHB/nv8Be19jRkfeTnwbmSdXRPv+
         A9z/lIR4oiKiYajZOrQt0CHPX7bOuwwsLg4QIMoR1YsiqI9hko+HaAJfeozlfyOCZo52
         hdHw==
X-Forwarded-Encrypted: i=1; AL+hErG6RvM/303fobg9+TBdaUhb8sb2DwF+pcn2gY0fgvOoCyiR8+lnPsj3gMwEu6RvuZvUxC5ETqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OezxEzXzvThS1syF8Drq9f8BxeKykk/WD1M5UJhQ5nPH+uH8Q
	jKIeyDKAfrdZ9ZSOQR/utqsqI12RzItx7H9wFaFkDBEM1XfLVBLVoNDB
X-Gm-Gg: AZFdTZcsMUCF21HAeNcIjV1fCEpMIj2qEJINM7sv9EjPUNVwjkG5aXq9z597WhzIam0
	YmkIxiYSyGYQb5FqkzIUlpB54RLyeR3QOPoaAZcernOflcdiEQPs99mfG+MzU461X8SzXSRBlqn
	MgTewb7m7p6Or7KmANcDZqfISRGDsm/iMlvwbGIOiCtAHtOGiXxIj5YIiuAdTB0ZWXWPORYU6+W
	+F7VbHmy/goM1Y3sqjOgeBmSCdF92bmSgK89koHxz47gIBaS63aIzyuDucrW/BouSEH3hOUpFXg
	MpjAjro9p/xMKAx8T1z817YxUqwIHqcGzVJsYnEctgQ2SamkePAk2JVNueWylT+BP3nBnqjJrwd
	8jsx93ZuDVy/Nt3TxXyE5iUOtiegdkjPGDRN3aayYbO6ZGaoTV1qBsL6Gsv+F/YUxeMf4aik5hM
	8niA/ZFmHVs+zjF5iUBBAvcE4NM/MU8Gdu2TqAs+jgPXoSTMshcQc0eh1zfU+6aUisXz/daVm+7
	z1iV5Rp/uj1ugOJhyt2Cn92BgXtKw1i77Rlwcuc9Xbeaxos060yqCcm0kgRtMR9Shy874l1Ajgy
	+WsStggEmweaw+1ntGFibUxgMNR3fm1y9fD2ohPJtlYLqHvMM+ijR7whksGdokfts4rLQD9eODg
	UfvE6WHi6O78e
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr8586265eec.13.1795614544884;
        Wed, 25 Nov 2026 05:49:04 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm66740398eec.4.2026.11.25.05.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:49:04 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Mao Wenan <maowenan@huawei.com>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net] sctp: keep the port of a bound socket when adding an address fails
Date: Wed, 25 Nov 2026 22:49:00 +0900
Message-ID: <179560159232.2963157.3418291084812904092@gmail.com>
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

Since commit 29b99f54a8e6 ("sctp: destroy bucket if failed to bind
addr"), sctp_do_bind() releases the port when sctp_add_bind_addr()
fails. sctp_bindx_add() also calls it for each extra address of a
socket that is already bound, and possibly listening. There
sctp_get_port_local() takes no new reference, but the failure path
still calls sctp_put_port(), which unhashes the port and clears
bind_hash and inet_num while the socket keeps its other addresses and
stays listening. listen(0) then writes through the NULL bind_hash, and
accept() of a pending association oopses in sctp_clone_sock():

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:sctp_inet_listen (net/sctp/socket.c:8723)
  Call Trace:
   __sys_listen (net/socket.c:2016)
   __x64_sys_listen (net/socket.c:2021)
   do_syscall_64 (arch/x86/entry/syscall_64.c:61)

Release the port only when this call took it, that is, when the socket
had no bind_hash before.

Fixes: 29b99f54a8e6 ("sctp: destroy bucket if failed to bind addr")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user with CONFIG_FAILSLAB:

#define _GNU_SOURCE
#include <arpa/inet.h>
#include <fcntl.h>
#include <net/if.h>
#include <sched.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>

#define SCTP_SOCKOPT_BINDX_ADD	100

/* needs CONFIG_FAULT_INJECTION and CONFIG_FAILSLAB; runs as any user */
int main(void)
{
	struct ifreq lo = { .ifr_name = "lo", .ifr_flags = IFF_UP };
	struct sockaddr_in a = {
		.sin_family = AF_INET,
		.sin_port = htons(30114),
		.sin_addr.s_addr = htonl(INADDR_LOOPBACK),
	};
	int s, one = 1, nth = open("/proc/thread-self/fail-nth", O_WRONLY);

	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	s = socket(AF_INET, SOCK_STREAM, IPPROTO_SCTP);
	ioctl(s, SIOCSIFFLAGS, &lo);
	bind(s, (void *)&a, sizeof(a));
	listen(s, 5);
	setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));

	/* fail the allocation in sctp_add_bind_addr() */
	a.sin_addr.s_addr = inet_addr("127.0.0.2");
	if (write(nth, "1", 1) != 1)
		return perror("fail-nth"), 1;
	printf("bindx add: %d\n",
	       setsockopt(s, IPPROTO_SCTP, SCTP_SOCKOPT_BINDX_ADD, &a, sizeof(a)));

	printf("listen(0): %d\n", listen(s, 0));
	return 0;
}

Without the patch, listen(0) oopses as above; with it, it returns 0,
and in a variant that accepts a pending association, accept()
returns the new socket.

The patch was written with LLM assistance; we reviewed and tested it.

 net/sctp/socket.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index bc68af88e271..519063833aac 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -420,6 +420,7 @@ static int sctp_do_bind(struct sock *sk, union sctp_addr *addr, int len)
 	struct sctp_bind_addr *bp = &ep->base.bind_addr;
 	struct sctp_af *af;
 	unsigned short snum;
+	bool bound;
 	int ret = 0;
 
 	/* Common sockaddr verification. */
@@ -467,6 +468,7 @@ static int sctp_do_bind(struct sock *sk, union sctp_addr *addr, int len)
 	 * The function sctp_get_port_local() does duplicate address
 	 * detection.
 	 */
+	bound = sp->bind_hash;
 	addr->v4.sin_port = htons(snum);
 	if (sctp_get_port_local(sk, addr))
 		return -EADDRINUSE;
@@ -484,7 +486,8 @@ static int sctp_do_bind(struct sock *sk, union sctp_addr *addr, int len)
 				 SCTP_ADDR_SRC, GFP_ATOMIC);
 
 	if (ret) {
-		sctp_put_port(sk);
+		if (!bound)
+			sctp_put_port(sk);
 		return ret;
 	}
 	/* Copy back into socket for getsockname() use. */
-- 
2.43.0

