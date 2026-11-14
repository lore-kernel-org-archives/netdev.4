Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672787;
	b=PUKlDHsBq1kpJMOmdBDvAX1QHph6ZCvhfvG7MGRwlpBu7BuC346Gz6mQSpXvcllTsp/4
	 pVeBIJkHSAOIo+90anw6nYjkkappi0TxbDjw5Xehnr27St6qUemXoaUO9VdI1HSJEZOoi
	 KdHziuki0m9MG+zDZ6b09AvrEPqeISqaGjzDfdxBs0YViJ8Yrat0W9eL4Iw0bXngf5/5x
	 AUwZMJ6yD1h+okKtQZcmJllMQeoKdMGKx6NaKb/GYj5z2+KaGS0VxrnKtnqCRhYewdoC/
	 j+3frzz9vUDfheDqoADeeyyo8WW3nBxF+xutJxIEgxdyvA9UwIt5fabBoiJ1c2pRVLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=L0ZfYfEQN7LuG5FSK1KxSP31QhlyFlSY0e3jHRK4CI8=;
	b=SScgIK3LUF0u6Y39psD11FD4fzOjWI63ITsbx5Iu9B9rqZi0T1mxX5ohleedd675cUUo
	 GjpxeY6NiCB++pv9wP109VQqLq8p1DUB0pnGS6A3NYXTx4jTZ0iR5pjjLWfyfP+8Jvxia
	 TWKfjaND2PGnFdSleOx2couftIsOxdlk/AjmXzyp7Oy23WXTt9NhjF4K4GnFsvbr2WF/Y
	 Zyq+PRj0jPYXaHnzGxZxpWp/xXQ92Xv86zp5IzmFNIMZBLsA8sdWH1H+9naXmgcc44lrb
	 p12Jl5VooJdyWK2HGaqCgHIKvQH1EmZn6ao9RAIUASFMQICRUy0kHTH1MEOIYNfwnEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxqcqV1V;
	arc=none smtp.remote-ip=209.85.222.70
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC1606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DC1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dxqcqV1V
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99870ee564fso1945710241.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672786; x=1795277586; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0ZfYfEQN7LuG5FSK1KxSP31QhlyFlSY0e3jHRK4CI8=;
        b=dxqcqV1VDTkVXeYNy/zhY1OZhvplEr6t8AMjITIs+pP7KzMgcfZgl3zIr77ScGTyTd
         gY1snc65kzzSCtjfAgnw2+ABJ2/m59PVBpP9oAKMLM3xvZELmZ2co94oFnwWVqtSYLI2
         ghVi55aHUDyj3lsxT3Kbxr7hgnhxuUkVEwEL0fB+IS3w9T1658pa8ivXLaDbGGyAWQ7s
         I0QJaCx6Ho9vZZBwabKO4wiX/cGDUEVLT2R9lc2muhmKtyfu1jZDVYqOmzWv6dJjDYVw
         7DdbRCqVW1MgiVeD0aef6UnyuymGuLpfLKDipPESYfwuqNtgsbhcY/JDFDKGPFfk3Su8
         rM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672786; x=1795277586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0ZfYfEQN7LuG5FSK1KxSP31QhlyFlSY0e3jHRK4CI8=;
        b=l7d8J1MyFtPcAW6ow+9aeXDA3Sb78b51ay6CbWUrVd+H5wz3tGwf0nMlsFfcIM2ZPF
         HpJwKNJoZxuirOu/zxwDa0D7eq3urfVBtJht+fJV5xb63xbyyDLInzkKKXaWIpMUEL6d
         gsWxXEBG6K6II99rr0Whg+ChaxuapR862RcgF/80bDmlURY65hSzIMeUNawjkb9blOs0
         hLePPaEoUyt7XdqPovdm+g/o8Pz989Ok2mWzQPBwDfcF7ZROwBil5qpW+N4Fo7UvOzVi
         XdhGFQdesYY2Aq4K7TWPXSTK18l5YhsW5mVsClIJIPh4Za6yK+1ApvpoPO4xF/GHlzlm
         oxpA==
X-Forwarded-Encrypted: i=1; AL+hErGdjtfDEXB2CsxqvK00HH9lIw+Cc0zCxpg1Jz4hMczveMomS2kKMit+XUi7gLeTN5KvdqlE2Nw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eZLyCUQOdWtCj9GYcI9N4R4R5B2l8BDWkeKY55Hc6NoJ43WP+
	e5bJdXit/v9RcstYhRdYYMzLItU6dfLDytIHUGs/7tOtck7UdJ0pe4On+MzNEkjFIsbxxshG39w
	x8f3TFI7zYPKkJt5eSYtRB/R4CQ==
X-Received: from uatx2.prod.google.com ([2002:ab0:35c2:0:b0:99e:e0e:e2af])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:508e:b0:7cc:26a8:e726 with SMTP id ada2fe7eead31-7d64d7a45camr2156391137.26.1794672785979;
 Sat, 14 Nov 2026 08:13:05 -0800 (PST)
Date: Sat, 14 Nov 2026 16:12:47 +0000
In-Reply-To: <20261114161248.3428695-1-thaisonphan@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114161248.3428695-2-thaisonphan@google.com>
Subject: [PATCH net 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Cc: Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()") moved
the LOOPBACK4_IPV6 initialization for passive IPv6 TCP sockets from
tcp_v6_syn_recv_sock() to tcp_v6_init_req().

IPv6 SYN cookie connections allocate a fresh request_sock without
__GFP_ZERO and call tcp_v6_syn_recv_sock() without tcp_v6_init_req(),
leaving ireq->ir_rmt_addr and ireq->ir_loc_addr uninitialized in
cookie_v6_check(). inet_csk_clone_lock() then copies uninitialized slab
bytes into sk_daddr, sk_rcv_saddr, and inet_saddr, exposing them to
tracepoints and bpf_sock and causing inet_daddr != LOOPBACK4_IPV6 checks
(such as IP_OPTIONS in do_ip_setsockopt()) to misclassify native IPv6
child sockets as IPv4-mapped.

Initialize ireq->ir_rmt_addr and ireq->ir_loc_addr to LOOPBACK4_IPV6 in
cookie_v6_check() to match tcp_v6_init_req().

Found in CI testing on a KASAN kernel; reproduced without kernel
modifications in a KASAN VM (tcp_syncookies=2) and tested against the
reproducer and packetdrill syncookie selftests.

Fixes: a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
---
 net/ipv6/syncookies.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
index b581cb1ee2e8..b33011b71fff 100644
--- a/net/ipv6/syncookies.c
+++ b/net/ipv6/syncookies.c
@@ -17,6 +17,7 @@
 #include <net/ipv6.h>
 #include <net/tcp.h>
 #include <net/tcp_ecn.h>
+#include <net/transp_v6.h>
 
 #define COOKIEBITS 24	/* Upper bits store count */
 #define COOKIEMASK (((__u32)1 << COOKIEBITS) - 1)
@@ -205,6 +206,8 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
 
 	ireq->ir_v6_rmt_addr = ipv6_hdr(skb)->saddr;
 	ireq->ir_v6_loc_addr = ipv6_hdr(skb)->daddr;
+	ireq->ir_rmt_addr = LOOPBACK4_IPV6;
+	ireq->ir_loc_addr = LOOPBACK4_IPV6;
 
 	if (security_inet_conn_request(sk, skb, req)) {
 		SKB_DR_SET(reason, SECURITY_HOOK);
-- 
2.56.0.611.g1030f0b940-goog

