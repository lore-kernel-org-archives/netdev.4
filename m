Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215456;
	b=FeCdHelfp0eetm0TUiYbTsJ5EPcofa3rfC/vyMwh6EnYr97SlLlXKgK9kbtCTQBnvkPt
	 OLIJu/GbfqlW1hMHH9t0fG2VhQsEuAEHNI2PRD+8QQI5jBnbAy/dyNX7FQGtt9DdA3akz
	 aH/4j2LoOBskTmdxUTJFCj/ZswytZ7XSH9fZJ3H/49VXYYvysir44U7A5x7QyNuoLvF4Y
	 5W/EgaLWWUzUJwHMzSIjohFklhtKZxcqYei0KoD2ZUCNY+yNilzHNvX4/9dhOXr1z3OOB
	 koEW6ksnZe+uYWDj+kC3xiOTyYNiOQ5sA7W1MAiHjPzED/0Xr6TRzjV3IhaWyl8ecgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215456;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ENZVxE0y8gjqKfjgJTUxW4TtHM8gnT28vUctdJcrMJE=;
	b=JO3c49fndc0RlBk+PJL0YdTNFODnvXlSThH2rOS+HQ2Naqhuim1nRHNehgqhRccN8VM9
	 zzNlwAG17WwO2l/+Q6TK9Bw6JE3CpJ64654EBum8Sl8rzSK2tTINmBfaD4zYW8gqlOlMO
	 PcJ3Z/vA1XRyZK7MwSJgYvAWOY6y/Si8+UUIs7ON4sfD/6sMAbw3hmfbLxfG5X05JUb9c
	 AKn7jOr9n720jIGWlYZHVQLI3MAtfeUVrs4ztEQ9zYV+Via7Ejl09g/78dOLUsIoQQyPp
	 k27astCQWiQefP3xu6CPCT5//8/pA6BkAInhEqNHThr4rVNF/Bm+8TmT45vTPoXHXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LBrxkvi3;
	arc=none smtp.remote-ip=91.218.175.181
Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C924606A6A1
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C924606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LBrxkvi3
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7yXPqyne3u8Dihg2TSmEFzSQTpqzV2N+LvG7O8qfd+Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795215452; v=1; x=1795820252;
 b=LBrxkvi3Eh6lB6d2/Wud5uIPQDUksqCawyTdcFO5r/3pch7BUSliEuWjOLkd3XX3szeEDBhE
 feaiLrLyniUQUfESb+RxDdQlnl8ZD5u6xHstLGSUKSTSsq6npD6HzakHIugDjifFkR/Q+h2U74z
 FFIakGMJ3vyy34C5S82foBG8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05f9b90382653a16;
	Fri, 20 Nov 2026 22:57:32 +0000
X-Mizu-Trace-ID: 05f9b90382653a16
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eddy Tsalolikhin <eddsterxyz@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v1] tls: fix ring wrap in sk_msg_memcopy_from_iter() after splice
Date: Sat, 21 Nov 2026 06:57:19 +0800
Message-ID: <20261120225720.89044-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

tls_sw_sendmsg_splice() forces sg.curr = sg.end after adding the
spliced page.

The following non-splice sk_msg_memcopy_from_iter() is a do-while
loop: it advances i with sk_msg_iter_var_next() and only then tests
i != sg.end, so starting from sg.curr == sg.end it wraps the ring.

Reported-by: Eddy Tsalolikhin <eddsterxyz@gmail.com>
Reported-by: Kyle Zeng <kylebot@openai.com>
Fixes: c5a595000e26 ("net: tls, update curr on splice as well")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/tls/tls_sw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 365c9485bb7c..d3a9b1c41de8 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -764,8 +764,10 @@ static int tls_sw_sendmsg_splice(struct sock *sk, struct msghdr *msg,
 		}
 
 		sk_msg_page_add(msg_pl, page, part, off);
-		msg_pl->sg.copybreak = 0;
+		/* keep sg.curr on the last frag so a later copy won't wrap */
 		msg_pl->sg.curr = msg_pl->sg.end;
+		sk_msg_iter_var_prev(msg_pl->sg.curr);
+		msg_pl->sg.copybreak = sk_msg_elem(msg_pl, msg_pl->sg.curr)->length;
 		sk_mem_charge(sk, part);
 		*copied += part;
 		try_to_copy -= part;
-- 
2.43.0

