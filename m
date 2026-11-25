Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572308;
	b=mbNSRNkah1YYVfrJ3Nf8KsJZDAOwXMB068jPL2TS/VfHLII3ppIXGHrgkZ9Sj5j96muU
	 nKD+OAb+VYtI5iyQGQZLbt22LnT3mPSFkqZ1WR/+pUNf0/XVtLZ5p6CxRP8kAm6pNrjoS
	 VZIO55ILxthS48VRzqF84wekytZ56dVLjzd5ZRxlXljCffD+QaT9b1h1eX/ol1cW0kFow
	 UOZrfleJB+Vmb7YZvM1idjlf9Cg9hAOPBaAy/2Pmuj5NOxUDsCbcNmlEx1x4ftz/vX+0U
	 MKZaEWgRVH1+QDloUibJCKJirTqp7QzKzr/b04F30DXDNIXVmleoBVfhJJSZazvzfMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jed9YGiJC9dQOx/9Evqtoev7hBIhjML3OUaG83yESDI=;
	b=lwyrxq2uvP/2E9+Ve/vxRfXo+FPxck116rFRj8AhY8nXweKMirQ41U+L/TxW5qIwIK/a
	 6QuYXb6J5cs9FRnWOo3mgC8Bxl8+KqvsfuOQWmZwT4EyRHEEdAkPz3GNQ/Pf8hDUiJWa8
	 IZMC3HLUh4D+D3gpNYdwGTx/pMEvM+xwArm5Z/NhuAqJ6/l67gLmlmssWrwAilU7kDWb5
	 Bn+mUfBuscJrDLc4Lh3oJYec2CuP2JBiM6lm/ERMK6VOhnO84o/5HTukuOsOBwGijvxY0
	 5bMm0N2t+jZS1x+I2WDI2fEfeCEklRGn7pPPtYn3l9GAM9pvvfA9vSYgpPYHwjbmSoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exH8vgS9;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC4606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88DC4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exH8vgS9
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f06ff94acfso20481315ad.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572308; x=1796177108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jed9YGiJC9dQOx/9Evqtoev7hBIhjML3OUaG83yESDI=;
        b=exH8vgS9DqqE9M8IIRqHtMcatwzxJPFDDXOUEXK46/DtFg1HFdSjcj/Z5wNA+26gkd
         Ird9efseZ71gekrcNZ/mQakB9vdzs9SOPwzDwu80Gm3tKbPPyb1zw01oNxV/dXeKRZkh
         H6zBihF8KXbM1zKZc5xU8eGzhZgoPwg+Sc7Y69IphfCkMkvQh6u7apAoAXIgFp7ASBMv
         zR/eZYhv6rNXm3MGD4zltZc5Shr83wRtwin6kvdVphBmngrL4OOC+IHX7yzCBK47YUW1
         U26xl1uXQ1BTjuSIj2uAVkFTBE+xYLozGFUqHeDXBc3pgTBStvIy6vftOQ7i46JCcPzM
         Lg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572308; x=1796177108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jed9YGiJC9dQOx/9Evqtoev7hBIhjML3OUaG83yESDI=;
        b=ydkDg48IieDjHHB/Hchm00Dsg25ftA8uUGzJokj+bos0R2kuoGZRUP8gLL9NMAO9Gw
         AIYPbp5lqfFYnM5lPn4qpsqKt6al2jOsJAXgd5W+fwh1rO/UO9UKpr6u6lyTP1kNNoVf
         6nsMS/fqq+OPE63aQbkAKL5fuHPAEpcCX7r8KmTpR0jhVt+APAgQfryABKQraBUXo/5a
         iiD/E2axOUxnNslR51ILu4VKIAHvIq31ZLOPNAVpHyMJ8SIilVS1VwgvH2SHt5v7pLLQ
         Ub6fJ9SzBtfvS9ptknRbNZDrGUOpXzW1SWiU+ckjR4K0C2UD0REmbrsOxIMkYSru/CNn
         KJmQ==
X-Forwarded-Encrypted: i=1; AL+hErGVh1Peg4koXpd7uF8NujwTFvZ6qzUhd2NT/tNg89Eh36BGhmX+LVmGTw4D9ZYY3ZYcHEImns4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M2r/CRgTsRN0CqSE851v1pT/Zfp1R/H9xLZ15fswX2Oj78RCs
	kWF3umr5Zec/VBHqzdMjWg0oFM7Na5NwjCtmiKASppbDTbjL+/0QgXBi
X-Gm-Gg: AZFdTZcljzj7Dae9i+zlarVhNfHjtKRN4vYugNj+gNsCsi8CBR4szcM6MMEZmWZE1wV
	vF1pnWFlppMoRQ/wCjxfa98CHLiDDrlcLIGkU1CbqgGTntSgRzdTmiIs9xsXC5RXwi5fKKKToJo
	9XCQ+MeZsn7iHMYy7E4y2cOhwHK0cPH6RgfsLUv5JDuY36PBmgNrHTyY7ZHxB5KjHpbM5Vzc3OC
	z581yzKOzotatywVzrqiN5diiZS1PsR3wKol1DCBWQAn9mAS30NsmocxcBJKTZv1yU9Wqh9umFS
	gslP2HWYIJCk0ZlR5/vyIYC/exsBvhGdS5iACoHEDYjTEWiTWY+fJlYzM2AFBWB5weKF99Pm5iV
	NXuGg4S99vuEXqJyIw1sE1VKw8PAHFsGy8IcByuaQ3DVnUZhp744Fk2pVveaSTjK5Pz/LrzUgSX
	UTtMdpOIQsVTV8pfxI+JtHH2DPZ1yt9cw50Ob7BpAbrhvT+NG5scQCcixhsnnyRTn1Jt03MKqu7
	YffjTFjy3UKcQOeV/+d5n5Qpdioe0LebiEgRnWEhatSfjrBECkXRzCp5VU7K/BtaELmoZ/vsxkK
	Xa60y0KVnwj9YCbCasrXs2qr1vzmkgNjUfdTAF3EPTlQc2hKfBNwMxPTfKJyqD53X+ETPqfuh+d
	MXPFU73OULTnR
X-Received: by 2002:a17:90b:2e8c:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3b41c8e105bmr13782987a91.17.1795572307707;
        Tue, 24 Nov 2026 18:05:07 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm26868511a91.16.2026.11.24.18.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:05:06 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Ying Xue <ying.xue@windriver.com>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net
Subject: [PATCH net] tipc: initialize the whole connect retry delay
Date: Wed, 25 Nov 2026 11:05:02 +0900
Message-ID: <179553307367.1670514.861086873017775410@gmail.com>
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

When a connecting socket gets TIPC_ERR_OVERLOAD and still has its SYN,
tipc_sk_filter_connect() schedules a retry after a random delay:

	get_random_bytes(&delay, 2);
	...
	delay %= (tsk->conn_timeout / 4);

delay is an unsigned long, so only two of its bytes are random and the
rest are whatever was on the stack:

  BUG: KMSAN: uninit-value in tipc_sk_filter_rcv (net/tipc/socket.c:2244)
   tipc_sk_filter_rcv (net/tipc/socket.c:2244 net/tipc/socket.c:2379)
   tipc_sk_backlog_rcv (net/tipc/socket.c:2422)
   __release_sock (net/core/sock.c:3344)
   release_sock (net/core/sock.c:3941)
   tipc_wait_for_connect (net/tipc/socket.c:2559)
   tipc_connect (net/tipc/socket.c:2658)
   __sys_connect (net/socket.c:2185)
  Local variable delay.i created at:
   tipc_sk_filter_rcv (net/tipc/socket.c:2207 net/tipc/socket.c:2379)

Use get_random_u16(), which gives the same range.

Fixes: 6787927475e5 ("tipc: buffer overflow handling in listener socket")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user:

#include <linux/tipc.h>
#include <sys/socket.h>
#include <unistd.h>

int main(void)
{
	struct sockaddr_tipc a = {
		.family = AF_TIPC,
		.addrtype = TIPC_SERVICE_ADDR,
		.scope = TIPC_NODE_SCOPE,
		.addr.name.name = { .type = 18888, .instance = 1 },
	};
	int srv = socket(AF_TIPC, SOCK_STREAM, 0), rcvbuf = 1024, tmo = 3;

	/* a listener that is overloaded at once */
	setsockopt(srv, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(rcvbuf));
	bind(srv, (void *)&a, sizeof(a));
	listen(srv, 0);
	for (int i = 0; i < 96; i++) {
		int fd = socket(AF_TIPC, SOCK_STREAM, 0);

		setsockopt(fd, SOL_TIPC, TIPC_CONN_TIMEOUT, &tmo, sizeof(tmo));
		connect(fd, (void *)&a, sizeof(a));
	}
	sleep(1);
	return 0;
}

Without the patch, KMSAN reports the uninit-value above during the
connects; with it, it does not.

The patch was written with LLM assistance; we reviewed and tested it.

 net/tipc/socket.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 65cc0c4964b3..e84168b29df9 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -2237,7 +2237,7 @@ static bool tipc_sk_filter_connect(struct tipc_sock *tsk, struct sk_buff *skb,
 		/* Prepare for new setup attempt if we have a SYN clone */
 		if (skb_queue_empty(&sk->sk_write_queue))
 			break;
-		get_random_bytes(&delay, 2);
+		delay = get_random_u16();
 		if (tsk->conn_timeout < 4)
 			tsk->conn_timeout = 4;
 		delay %= (tsk->conn_timeout / 4);
-- 
2.43.0

