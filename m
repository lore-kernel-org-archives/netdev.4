Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161563;
	b=v0XHLrv4huleWHGcz1nbpSLN2Yt2IKKcimjd1C0m3RzcccSkY1V/eilfJk7txAYaJXpX
	 SI3QkXevvY7nXGXLrV5I5QP3KG2jGO8xIkZJV6N/IF/S9c6ZXbr7ee4FWbonNo+7mJRRw
	 FFIQ4dAKGbReFjLmTdufwM2qWYbJZDneKBT3Crv7unX1jNxFClnkFFTXMPBL1bczXEqO+
	 wOHj+pFoSrDPm0VWvYXbwDCmIUrSirU3sNUZzsDS59HkAfYNaQKBN0pQuDH+C/sYToqpZ
	 VW7sabnnIXfx+DdSjpd3iaeLVpRrGJ0hA1QLXRObGTohj6A15ceW+OXalQ1LSJQYwTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g+lR9KHvf51yvBoxd1/pkP2EXf3oWyK5p2AAAkTsaaU=;
	b=lLDJahBr8IMx5fG34py2KEsVKkKLp+5Ya+tyE3o8oSuS/84vQ8Kkae5xUsm0Vtj1NMk+
	 0uf7vzNLmdn7QHR39U+25N21zsWgjM5qZBaeuUH187dcqLF98uU03hZyElZLmzATGkor9
	 2NoieFzLlNxRQXM/+X5Q5RFQrw13oZSbZB8FiCBlFlf/6qh34o0Rq0zm9QYEdHawtHw5/
	 rBs+j5xy4y85aV4M5C3opFBNE1UGyVMhBWdQYp4r6qH3j8hJzDjDoWI9Tgor52sKTBrTs
	 EEPhLVsc8AXAbQbOrtFH/GczDBH2U5lnon6twGpXyCNIbD/vsYdBakdX0cdORczsaBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxngEe0e;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74124606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74124606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uxngEe0e
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a00144f1so210200a34.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161561; x=1795766361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+lR9KHvf51yvBoxd1/pkP2EXf3oWyK5p2AAAkTsaaU=;
        b=uxngEe0eL7yiw7fbE2VjSocWe3NaAGW/GESrNTbBhcCd+FpIyM0nARSzyJgBwU8txX
         n40EHENoLUN+xMxGu3BdZDJwHzm5+nnwc3s5W/w68y3OZf5PK57NMJYX1JoQVvgd8Qf4
         +nXqHNLqISbYFkcYvQ42YOgrq1bgguwMkNGxMSH/UxgNerB3HgDnCS46Y3phjfObtQ80
         Ota2E1aOIQIEGeGAoeJCDEA1qaSlmW8nooVbKy+R2rCt1EpB2/humwv5k16Zlh+C/51I
         cMWN/LAxdoep711gDHi/ButfdkhAO+9TF4safaEbWcczwVqeivDPzWpvyKEqCnDXGW1w
         epMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161561; x=1795766361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+lR9KHvf51yvBoxd1/pkP2EXf3oWyK5p2AAAkTsaaU=;
        b=xom16M9KASoIpchohQeXhuLbrvGL8Gc1xW4RuAnhBAQyN0bDsYO2JRWtviQIBWsZCv
         FkIkH55+AZ0HRqB2OAVwnp6VXKyDPLXyq5tdZEa3eKrY6FilGNzZa/EL+/F2poTs+3VM
         WROmS+jQ7+ZtsduxVGQ9HoUFNNoPdUGLfRk5d+TbHZTDcx1vU2xJDg18tnq8II1MkVd2
         9dUwlvYAekpmekoD/e6fdENiPLRWhV2aBfor3j4Sw9VZbnZd+SJouTq+vyt+y2Vfjg9x
         yQ7RF9mtQGfcCD/p6rlHP/zICGHxjHvp8u+dzvRMEqqE+riJHJa8C9zmJXCNFjkA9Mr6
         1cYA==
X-Forwarded-Encrypted: i=1; AL+hErE+tD1gDo7WnaUoR+n0ye8/Tt+1e0n9o1cu8SpdW9KUl1WHpzPkv1PGY8ulVov07a0apy0p/9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9khsVOr+o7G9lVNXB8x3HzBRCLaDuVx99dumia63ssDzT7PEak
	mcJHQLnOS2JKRfgQQA3erOOLB58chS3Z2fCmm1d/UMcnPVMJyw1UCTgK
X-Gm-Gg: AYBFou3mP1kfRHRiyYjtFDJzOelOl36bA5UG5SHMucFchjbt0NY/V96Fkz0gZyCT2ud
	veLo1ttYUvxHeXvvSxotVCqFyzxW2mfXApclkwcAG2O3+8qHxeKjFxWdMgZJ4dqnfXqQEUHEFxr
	N2hlCKla+E3qeqkPp9RGIwvp1W3N7CdyTaU9slEZIdKDehcKB/pl0F84W8sURz1BulC0xGm8wvz
	SAktIm/hhBTuOlDXF38QqkFsulZumVJstfiwcKfYmeVHnkXbn7tbL6/eZJsRhd/J6HT2ubhz6r5
	v5cD9++Q9/Ksj3I4igaDx5n4h4N4AZiNJTkgIRUMkpJ1EUlMiGURBTvHCO6zhsQvXWtV3eNUE8a
	bhyIT+f95HEQ4bsLCOoS67Sqc9nLGVJ560XR6c/yPcqRjA2VfojISP9Llm75YPoLoOtHu5d/Q1K
	rm8FSqNdLRXmftJLlo5nmwqgWqo46CafFa9mT+wsvg4uhvhoy73fw6j7m+hqyLMZOTh4I6K4vhe
	B+CfJwkkdPhyeI1+yFk3yXtvVY3MRyM3rcVKhXtWaWKKCskbkxM+vVgmpoqkPm6pdw1amwUbV8W
	4gXGbBOfrrey+U9ikb6RLmuPWV5gWgAbYHBQNEI4iI4SSglTEobxfbIrXqnNF9X1dbVw
X-Received: by 2002:a05:6830:2692:b0:862:c6cb:2e25 with SMTP id 46e09a7af769-863152f8ef7mr2846379a34.2.1795161561258;
        Thu, 19 Nov 2026 23:59:21 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm1550823a34.10.2026.11.19.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:59:18 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] nfc: llcp: fix socket list self-loop on connect of a linked socket
Date: Fri, 20 Nov 2026 15:59:08 +0800
Message-ID: <20261120075908.4064155-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

llcp_sock_connect() only rejects LLCP_CONNECTED and LLCP_CONNECTING, so a
socket that is still linked in local->sockets can be linked a second time
into local->connecting_sockets.  That covers bound and listening sockets,
and sockets that a peer moved to LLCP_CLOSED with DISC or DM.

Both lists use sk->sk_node.  When the peer answers with CC,
nfc_llcp_recv_cc() removes the node from the connecting list and links it
back into local->sockets, where the stale bind-time entry makes the node
point to itself.  Every later sk_for_each() over local->sockets then spins
forever with the read lock held, which pins the CPU and stalls RCU, and
the socket is never freed.

Reject the connection while sk_node is still linked.  A socket has to be
closed before it can be connected.

Reproduced on v7.4-rc3 as uid 1000: a soft lockup / RCU stall in
nfc_llcp_sock_from_sn() while walking local->sockets.

This issue was discovered by Tencent CodeBuddy Security.

Link: https://lore.kernel.org/all/20261009092338.3146149-1-bsdhenrymartin@gmail.com/
Fixes: a69f32af86e3 ("NFC: Socket linked list")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v1 -> v2: reject any socket that is still hashed (sk_hashed) instead of only
          LLCP_BOUND, covering bind()+listen()+connect() and sockets left
          linked after DISC/DM.
 net/nfc/llcp_sock.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 1e5ee4bcde68..01b311d5adda 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -714,6 +714,15 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 		ret = -EINPROGRESS;
 		goto error;
 	}
+	/* A socket that is still linked in local->sockets must not be linked
+	 * into local->connecting_sockets as well: both lists use sk_node, and
+	 * the CC handler links the node back into local->sockets, which turns
+	 * the stale entry into a self-loop.
+	 */
+	if (sk_hashed(sk)) {
+		ret = -EISCONN;
+		goto error;
+	}
 
 	dev = nfc_get_device(addr->dev_idx);
 	if (dev == NULL) {
-- 
2.43.7

