Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506772;
	b=zT/PjrbAW5tNdwQnyinYgTpJcVzb1fVgrn0FErbiVuGtf7XIt3EPq/QjXDTpgvXR05Lo
	 uKjgxR3WVkgvHbOT6JgWDPegzOYP3rRwUH0x1Zp7PHZhddx0eYTBZQUhoPEk+nXIsx3+6
	 uBJ4WAuqHgNBUXOpEt2H19k1uVPCUTB/Ib8XR7VNCzyylXDy7NGN+Z7obAXguX9vUKDAo
	 XBlcJ7J2PuBN2gp7g5PCDIQ1LX3oRxxZmEKakQPBVSQZ9aAwD7n283qJ2i3X6nWwbMbu2
	 o5iYt5DDNlenHCne5wqBAp+k7eEUZhtxPBsp3vulEkwojtU2a+3wRN+0TOEVFvZjb9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RrnVY+ZofBroIM5B7vAXAF0TamSQ44tggpydwwzWVMM=;
	b=wnH5gyMkKWy7VUgkda3HooQ/Tnb8aopDKHn+rOReJE13WDR0siTgejLu8qvR5oYOtbsP
	 AL795eRlx5RdkDrU229Mgl/YRAnuUiAvkG6zhcRJcWIo5pCE9nc1WjH+oourF+ITuSEkN
	 xeb5A1bedDcMG5pStDLW6ClMH6z21fSBM7Yh5DkqVGDPdFefBPeLtMMHV/3d+0oNTzPIn
	 6BJr5zsx/JgL29hnuUMv1XT9Wep2C7C9dhOqgfrveWFZWOWcZ05Rp+amwefinPncuZqS6
	 /ktzrSx/nMIlTNkWhrpW5Cryavvb0IcoGmRgl/q13JBkwjpJJmOUYrA6BXQKkjFz0fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYou23AF;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5702C606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5702C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYou23AF
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2224371a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506772; x=1796111572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrnVY+ZofBroIM5B7vAXAF0TamSQ44tggpydwwzWVMM=;
        b=cYou23AF4SEylTjH72edOqmsrdJC71eO5tZsSTwRxDdUUtNwNOFvNtV+TrUkuG2bzP
         tF9xgmzEiB4muV6gxFq7nUv7V0s8efg2t9q5T0YwrYWTfpFNSLiRZMEL7YS23Jh4U6rm
         ksWQ+PaHD0KZoouBjvoze64VLs8HIfIKQDB3hwl2ZndzaavrmsBTzpbKPqyWZBdaBqOh
         moiIn0tNptDn4p/rSUTHs2f/2PkMC9SUUHhYQuq0tkob11I/HjJpS0wYtSxcNSWoqsrp
         2owKk9ehjH0zx70fmdGfQdgNge5bv/AJ784rSl13nkRmrxEBSUFD58OcRCxoVGt1YyXe
         eTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506772; x=1796111572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrnVY+ZofBroIM5B7vAXAF0TamSQ44tggpydwwzWVMM=;
        b=LTm0mQESMB+KJ+74z/zF72P9EBNajbmmr4dh0ctAheKO0bSsv9hZq9wDU8YKuyPZx+
         P8u65Ic7LwOzzwzFy2RyVmJ1lHKZH8C5jSKqBb7+hWjilcNEf6IfoWaQ6HeIxvblSVW9
         0kMBQZP1p7pWBJ84CdCs5wbPcJDHSCSp0oxtd8WoBughDfy9+ASXlqzWDWTAVL7id1XU
         4f4Y8V2j1JPdejktMDWTEilATspL3PHTKwSy1Wm9s/KL0iEXeykD4OCPjiV0welnB3aY
         C1SefeEHAPi9KO5dhItVcdwxXXjBvmKlSomcnoqlgEgAVkzj8DHEbtphnWKE4LR6/Yba
         WA/A==
X-Forwarded-Encrypted: i=1; AL+hErHBwQGlvp0J8Iak25Hr6bphbyaBCNXCo898htW2JI9KCKaDJK0/i6lc9vwnBVz+moYXFKSVb9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wQHwJl6QJRpB6+xNWdDcr8RcPzADASyWZd8EKe1uzfsgTKerj
	haNy2wGNoB+9t1sXmFaGUeJTB+XJk2ngPdO0shPb5sIErThmo2A6kdgE
X-Gm-Gg: AZFdTZf5twgA/iydUGPsyzmJrJNKxGwY3lVULf30e6T6FdYbSJhhez496b4t3d9IQUT
	S+l1ejIn5E8zW4LmOPMbUlJ+uHcV0buOZ3qkHZt/8uNct/zWf9Dgo7a/DMyzYTBv4/H1zE+TQ5J
	rEPpHcEK5auVuaBG4esWsZj2EABbVwwdR7wE/PmBVIT11F3Z9A7fXYALWDBK6nTBAGQpUda6+Uc
	A/ypD8SJUSUAXq+W0nmJxUDVghHWCHr1m0OdcRXv/r/KH9rLY19t8/rfNa661tN/1FuBG2tcE0I
	2C8ANSUerV11+kgzsmzxnzL/73GMFuXluToLoHf+6DvwjdlI356iGil8KA+mV1BNAi0EncaBSyl
	geKo619TX2qjd0EbLepsjwnsmN18NzEaSX41KJ7xUExJPvaIE0jixrRArLvXsJcC3XpWHQIsE3u
	5sNP3oO4CnRTkuOE8UY5wPnBJoYt8/ny7puADioN7x04S1VlD+X5gtEfuCnzrqn0HMmgFhRSsfy
	0vBh3opjey18uMd+VewR3AkG9+uyNQcLz6mw8n9Y5EPj8tfZdFBj4j3inYsZ2433qjNSqOYHQLK
	bvKYtYAQ02OloMJFw7M66Mstw8riS6CLOOTYz/ylzdEOwN3mwlkCU0zJbZkhVbr6Id0=
X-Received: by 2002:a17:90b:2ecb:b0:3b3:c45e:c715 with SMTP id 98e67ed59e1d1-3b41c95e7bcmr11837289a91.50.1795506771626;
        Mon, 23 Nov 2026 23:52:51 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm24140910a91.13.2026.11.23.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:52:51 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tipc: drop discovery messages shorter than the fields they carry
Date: Tue, 24 Nov 2026 16:52:46 +0900
Message-ID: <179550610427.774194.2378040347436778640@gmail.com>
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

tipc_disc_rcv() reads the media address and words 13 and 14 of a full
MAX_H_SIZE header, and the 128-bit node identity from the data after
it, but tipc_msg_validate() only checks that the declared header is at
least MIN_H_SIZE. A peer on the bearer can send a discovery message
with a 24-byte header, and those fields are then read from past the end
of the message. For a UDP bearer, tipc_udp_msg2addr() takes the peer's
address from there:

  BUG: KMSAN: uninit-value in tipc_udp_msg2addr (net/tipc/udp_media.c:129)
   tipc_udp_msg2addr (net/tipc/udp_media.c:129 net/tipc/udp_media.c:159)
   tipc_disc_rcv (net/tipc/discover.c:227)
   tipc_rcv (net/tipc/node.c:2136)
   tipc_udp_recv (net/tipc/udp_media.c:389)
   udp_queue_rcv_one_skb (net/ipv4/udp.c:2433)
   udp_queue_rcv_skb (net/ipv4/udp.c:2473)
  Uninit was created at:
   kmem_cache_alloc_node_noprof (mm/slub.c:5105)
   __alloc_skb (net/core/skbuff.c:616 net/core/skbuff.c:716)

Discovery messages have been sent with a MAX_H_SIZE header since commit
948fa2d115c5 ("tipc: increase size of tipc discovery messages"), and
with the node identity after it when TIPC_NODE_ID128 is set. Drop the
shorter ones.

Fixes: b97bf3fd8f6a ("[TIPC] Initial merge")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype: as an unprivileged user in its own
user and network namespace, it enables a UDP bearer and sends it a
discovery message with a 24-byte header. KASAN stays quiet, as the
bytes read are in the skb's tailroom; KMSAN reports them as above, and
the kernel logs "Rcv corrupt discovery message" for the address built
from them.

The patch was written with LLM assistance; we reviewed and tested it.
With it, the short message is dropped without KMSAN reports, and two
namespaces joined by a veth pair with UDP bearers still discover each
other and bring the link up.

 net/tipc/discover.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/tipc/discover.c b/net/tipc/discover.c
index b9d06595b067..0f99e4af1cfa 100644
--- a/net/tipc/discover.c
+++ b/net/tipc/discover.c
@@ -219,6 +219,12 @@ void tipc_disc_rcv(struct net *net, struct sk_buff *skb,
 	}
 	hdr = buf_msg(skb);
 
+	if (msg_hdr_sz(hdr) < MAX_H_SIZE ||
+	    ((caps & TIPC_NODE_ID128) && msg_data_sz(hdr) < NODE_ID_LEN)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	if (caps & TIPC_NODE_ID128)
 		memcpy(peer_id, msg_node_id(hdr), NODE_ID_LEN);
 	else
-- 
2.43.0

