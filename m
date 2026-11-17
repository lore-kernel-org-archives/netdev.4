Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919645;
	b=DiY4ihJbXyFlOozh/HxDAgwoYD8WlINJPyiZ8S3qwhloWBUhbTPRuEW0fBh/hRP7+AoT
	 ZYqO9b1gHST0MUBZejrRtQ6yf1UyoLlJBSGLpKF9rT+grHZFtL9H1GeJaGy4fXLTk5/dG
	 0plllfSuj9KZgFzgnfEOlfB0qTfIF4V+wsJ3VPK4MEe1aByeXrV28Fourzxq2/Nx+gpjH
	 OW2Dbqy/rjZqcf9z57AEitVRNtP3h+5Ad17KVBzZ2UDrpe3HsJxymljI/ao4HI9UVNQA6
	 jECiKOsfuBxNo7CtT792FvBEYtXiPldgcARSTd8XY39pUdZZaHLxk5FhZpT2XX9AOcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pey3AXivEIPkS803BEXqY1Wb6Um3mvfRZTuqrf6x1Q8=;
	b=AFXBJCXdhaVCk1ZWDGLayVAA5on5EBXo/t+ohGt/JcmQewZT4kXG3wMjQKfhzDXQjdS+
	 M6H9ctaQrJig4LCAfFwaFUMAolWCck30zkMUk9xo/1raVD+Mlwn7Q3jm3Zzwu61iOM6uZ
	 bS0tzhhODsiN2ewZ+V0ZMBLhL+KGZR+NbgwYgbz6bOojWabm6TP+FDyH3Sf3mNt2MV5if
	 UxJODWNJAaRSK2qmxbYeFmJTLBzhVL2CdLenAyZ42nVVwmbsRmfkHCUHgrUAaTB8Gf6+2
	 y55B1ezJxtsPiLuTkMRDzYBJ6txUSzTaQCY2L3OZNru91aw0CfBoQxMujPAv1QP+DCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=To3UIYjd;
	arc=none smtp.remote-ip=209.85.222.72
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A97606A88B
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A97606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=To3UIYjd
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99859876e19so716622241.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794919644; x=1795524444; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pey3AXivEIPkS803BEXqY1Wb6Um3mvfRZTuqrf6x1Q8=;
        b=To3UIYjdPEAyPbw3qcZfxGVZiWl/clOJ7HZsQaT2mwgD/TQcdpR1G1hhS1av3Mf0pB
         kg9IIVr5/cMlJ5Fl1UVpC2Yv1YZRiikvhGW/1X68BeIrGIgq0kn1tPqRyg0hmsNI5sYI
         0GcFosR0CBgNJfxShY3X5NXEq+34gMSBKmHtu3ljbbYR0mok/XVxzsk3pRXBV1bQd0kI
         n4QqBY4luczdXUxgvjiiUZsSUzE8cW0JabBX+UQLoFCCtXtb6zatXIozZh4CZ+4nVfK+
         BapfmM0XFTWkJdAomVlFTrAURY29RQ94VF+JMMMhJHeIfdGMhOTqS+Cna+VGbEznEx+L
         Xe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919644; x=1795524444;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pey3AXivEIPkS803BEXqY1Wb6Um3mvfRZTuqrf6x1Q8=;
        b=ewLpyDQdRp2V2+zJby0Z509/i0w5HiITIUS36EruCInZe3cEHzXwG4OSS8+xYqxIuK
         qZiv7Kb9rD2h2pCL/USztdieW5lgffqw2l1VBDIdEoJ4gjxX557jei2a6FY5JuJ+jE8S
         sb3GZ0WoCbgsI2vGSjb0+qWYqcIvWLd6Yd+VL0Wj4TMy2ZmFnj5Dfv/gNAI0h5pWaoQD
         z8wDbN+kHUhMI/NDPkBeI/MRG9dd0X30RpVVyIxSq4BkAovHkCOJPSCjemwKQ3mSHDx7
         3LFZtdg3dcfapuKrLYtTQf71jUC2rHcgso3JUaGI0RfqqWh6D4omp8uMJgDicSq1UIRZ
         Q4Zw==
X-Forwarded-Encrypted: i=1; AL+hErHA40wfXw+bdInePsEkz/0rRFYNgC15BTZjhdB69ycOMjk/Ap4H2RlAWcYi9zzZiTyfDKl9wAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8inGs73l8/7bgDqZlTApO6ydoELFeMX3tVTWXq91xWhQCU9bGp
	cisDhAVCmsCHewFWXMRlqC46FCdQqJFJc8DMCagFbjBVyCY8+OPnL9Bjyn/lIxFENSK6wn+AeGD
	yxbijdrPq7R9xxgt29TS5z/L9Ew==
X-Received: from vsbjy25.prod.google.com ([2002:a05:6102:4c19:b0:7aa:fcdb:c675])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr3262568137.34.1794919644167;
 Tue, 17 Nov 2026 04:47:24 -0800 (PST)
Date: Tue, 17 Nov 2026 12:47:09 +0000
In-Reply-To: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117124710.1338951-2-thaisonphan@google.com>
Subject: [PATCH net v3 1/2] tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
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

This was originally noticed via an out-of-tree socket hook observing
inet_sk(sk)->inet_saddr != LOOPBACK4_IPV6 on KASAN test runs. KASAN
enables SLUB_RCU_DEBUG by default, introducing an RCU grace period that
prevents cookie_v6_check() from reusing the warm request_sock initialized
during the initial SYN. Upstream, with tcp_syncookies=2,
SLUB_RCU_DEBUG=y, and slub_debug=P, sock:inet_sock_set_state shows slab
poison instead of 127.0.0.6:

  ... sock:inet_sock_set_state: family=AF_INET6 protocol=IPPROTO_TCP \
      sport=59839 dport=41050 \
      saddr=90.90.90.90 daddr=90.90.90.90 \
      saddrv6=::1 daddrv6=::1 \
      oldstate=TCP_LISTEN newstate=TCP_SYN_RECV

Initialize ireq->ir_rmt_addr and ireq->ir_loc_addr to LOOPBACK4_IPV6 in
cookie_v6_check() to match tcp_v6_init_req(). Tested against a QEMU
reproducer checking inet_sock_set_state and IP_OPTIONS, as well as the
packetdrill syncookie selftests.

Fixes: a3a128f611a9 ("inet: consolidate inet_csk_clone_lock()")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v3:
  - no changes
v2: https://lore.kernel.org/netdev/20261116023709.132684-2-thaisonphan@google.com/
  - clarify how KASAN (via SLUB_RCU_DEBUG) exposed the uninitialized
    request_sock, how the issue was observed, and include the
    inet_sock_set_state trace line (Eric Dumazet)
  - add Reviewed-by tag from Eric Dumazet
v1: https://lore.kernel.org/netdev/20261114161248.3428695-2-thaisonphan@google.com/

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
2.56.1.703.gf848ed807c-goog

