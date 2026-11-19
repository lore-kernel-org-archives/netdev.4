Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116106;
	b=YhBiLYAKINhZWgTtykMhO4x2zX+pQSwgnTLCJf/B3WxeRQuV0H1aWyQ7AKraS69Kq2/2
	 WdGM/j5PO/kUtUR/WB7SFRHPGXj4kFkhnjU8n7DA2BQksduKqg0hkI9C53IttDnZPn4z5
	 0RZFolyl6oOEg1Xyd2XtzMl7qbn5B/wGI/eK2b6QFtSurviDFWSvdT6j1dBRvODG/SJj0
	 IFxkNim4A/5PsitT+7r1vcuKJ5XSnghhQjueG88aj1nkhfPQ9PZ9cIUWk1jSUpn08VU+x
	 e3jI814xpIBRBL3xKBj6Dd4C1NMOrffLkV9ieI8TMjuHeVxzHJDWBQkQDsIba5AuWDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=A9Gr8u6/sFmyVXr/C2dW5QjdNcTSaTJRjLF2+ife4dA=;
	b=byVGYpytzaY4k+ClfM63gkbsIu269ZzlQAonMm9MTD2uk1yvQh28HGhFc1lPuklPjNVQ
	 OaEqVfMgLcJKoZU3nq5GY2Q4CcndHpJVJfQUPR9RzdQJg4o0Y8F+JeRu/xlh0Qu4DS5p/
	 cq/oUo0XSslSQiAIvhD2q0jB8i97WlcIUR7rFZn4X3eSdLdJVT5SmAKZ35c8iYicA1SeJ
	 L8aoX7+qArTCOj6rRRcZgjg0+IrPRmwsNL0qvEy9YJ2qvormkrW6qeXzoJrlNejI0PXwu
	 TcJDhFCVyU8FZi4VS9Pm13P90qgeL6mSkksdgYnKoHSxSFEaLuraBmEYXN9kWeSwmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgqlI5rl;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180C606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E180C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgqlI5rl
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso159695e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116104; x=1795720904; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A9Gr8u6/sFmyVXr/C2dW5QjdNcTSaTJRjLF2+ife4dA=;
        b=LgqlI5rlX61bXFV7AeI/bODcIFWOwfuNmik9O0AL2Dw5GCD7FawqLSff9MLxb9S6vl
         hObGL8IyqMKwxBtM4iC6KaRnjvRtbaNNSJ3+mkxYmm4nCiErFftR5NiUMT13WDH6DB31
         z/0RWWtzjznCWGnGg4jmjChnRispU/NILcmJiOEVz+L0e3GdGnqTaTLPUEtsX/bYQP1N
         QE3bp1w+6EAPD5FUOE+fiESfNsfPSfiNy+kJTitqqwt0Q6CvLZTLf5ezxl3qhY4dgmmG
         0ZGcZy46i7H6njQK2jGWiu4oUHihHTfJURHGXWdNs1ywY1YNfzTBf1JbSed15DuaIHke
         QRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116104; x=1795720904;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A9Gr8u6/sFmyVXr/C2dW5QjdNcTSaTJRjLF2+ife4dA=;
        b=XjeeOCZpdDqf0IX4FvdqmSS5fWW5KT5e4wcoHoMvyznBuUX5+AJ7WJbLxc9Z97LLx/
         6iXAU2RP+9fMitiauJ7Nntqdo2GfMxyvl1z1W9aYZrPves3+xT8+Macjgr05lqsfXu+F
         areJyOSPuxkLAsnMhHyIM92d3n04beopJ29aPKfh1eAEQPJOSdpNlU1gYaVkMchMr0m1
         ph1U6EBxyXhuRGzKhA0fTRBID26zY2D7U90rF2uHp/mjLob6Rf1GhPlP+ve1qnmTmsRP
         xw6I1lllJcELHG7dR29uC4qYwxVn0Z7iesZ3RsTliiCSN7Du61mBZ7kkKFYFk48fvtDs
         Cy2g==
X-Forwarded-Encrypted: i=1; AL+hErGA0MuWsuSnZVlPq82U5dMrA0xqg3aHmqai7bw/pML676F7SoCm0AOlyNPJIxWJo2G/9a4SHGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z87A9ztcVrxhwjGnOkWKKrz/qgivdnKbhtRfrhJ0h+P0cxITJar
	ua5NWu4Br/vceMubsF58MlWvDFIoCPwO1LzEcrcJoV8DgVOlmBl0Yj5D6Y5ALNkl4W97SRkTBg=
	=
X-Received: from wmqy14.prod.google.com ([2002:a05:600c:364e:b0:4bb:7c76:87b])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:530f:b0:4bb:781f:6067
 with SMTP id 5b1f17b1804b1-4bb887e21e4mr13588775e9.1.1795116103847; Thu, 19
 Nov 2026 11:21:43 -0800 (PST)
Date: Thu, 19 Nov 2026 20:21:42 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192142.2637952-1-dmnk@google.com>
Subject: [PATCH net] udp: only quit inuse scan early on identical SO_REUSEPORT sockets
From: Dominik Maier <dmnk@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	dmnk+artist@google.com, Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit df560056d960 ("udp: inuse checks can quit early for reuseport")
optimized udp_lib_lport_inuse() and udp_lib_lport_inuse2() to return 0
immediately upon encountering the first same-UID SO_REUSEPORT socket
that matches under wildcard conflict rules.

However, a socket that matches under wildcard rules (or shares only a
relaxed subset of bind attributes) does not guarantee that the remaining
sockets in hslot->head or hslot2->head are conflict-free for the new
socket. Because IPv4 UDP sockets prepend to the head of the hash chain,
an unprivileged local user can bind a non-conflicting SO_REUSEPORT
socket (e.g., 127.0.0.2:PORT) ahead of another user's exclusive
127.0.0.1:PORT UDP listener, then bind 0.0.0.0:PORT (returning early on
127.0.0.2:PORT without reaching the exclusive listener), and finally
bind 127.0.0.1:PORT at the head of hslot2->head to intercept cross-UID
UDP datagrams.

Only take the O(1) early exit when sk and sk2 share the exact same
conflict domain (sk_family, ipv6_only_sock(), sk_bound_dev_if,
sk_reuse, and exact receive address via inet_rcv_saddr_equal() with
match_wildcard=false), and continue scanning the hash chain otherwise.
This preserves O(1) bind scaling for identical SO_REUSEPORT groups while
preventing cross-UID conflict checks from being skipped.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available on request. This revised exact-match fastpath patch was
compile-tested with -Werror and checked with checkpatch.pl --strict; it
has not yet been runtime-tested against the reproducer or kernel
selftests.

Fixes: df560056d960 ("udp: inuse checks can quit early for reuseport")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 net/ipv4/udp.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f..d784faf 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -131,6 +131,15 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_alloc);
 #define MAX_UDP_PORTS 65536
 #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
 
+static bool udp_sk_reuseport_match(struct sock *sk, struct sock *sk2)
+{
+	return sk2->sk_family == sk->sk_family &&
+	       ipv6_only_sock(sk2) == ipv6_only_sock(sk) &&
+	       sk2->sk_bound_dev_if == sk->sk_bound_dev_if &&
+	       sk2->sk_reuse == sk->sk_reuse &&
+	       inet_rcv_saddr_equal(sk, sk2, false);
+}
+
 static int udp_lib_lport_inuse(struct net *net, __u16 num,
 			       const struct udp_hslot *hslot,
 			       unsigned long *bitmap,
@@ -154,8 +163,11 @@ static int udp_lib_lport_inuse(struct net *net, __u16 num,
 			if (!bitmap) {
 				if (sk2->sk_reuseport && sk->sk_reuseport &&
 				    !rcu_access_pointer(sk->sk_reuseport_cb) &&
-				    uid_eq(uid, sk_uid(sk2)))
-					return 0;
+				    uid_eq(uid, sk_uid(sk2))) {
+					if (udp_sk_reuseport_match(sk, sk2))
+						return 0;
+					continue;
+				}
 				return 1;
 			}
 			__set_bit(udp_sk(sk2)->udp_port_hash >> log, bitmap);
@@ -188,10 +200,13 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 			if (sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
-				res = 0;
-			} else {
-				res = 1;
+				if (udp_sk_reuseport_match(sk, sk2)) {
+					res = 0;
+					break;
+				}
+				continue;
 			}
+			res = 1;
 			break;
 		}
 	}
-- 
2.56.1.750.gf70dc682cf-goog

