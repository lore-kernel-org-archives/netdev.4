Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196627;
	b=vvWpJjJIsR6YYnVBlBW1nmOiI5PY4r862d4yXnonQ7nlX5Cr734aVDfuDABT+nAlQFbz
	 2qMMeeCC3JRvGc78T90qW1igEdm9ZQJiy2VqQm8dO0cDLo1W2MIG7yTyQDukMa0i33b2/
	 5GVOJEFnU6dJleRY3uvK3Z9vkkTfjOAr8W8i8z9MTHN3zRXolgO7F8qe3nrda6GsDR2N+
	 6y50s7n+BVqDrNffrAWIWkriAG8Jh2Rkl4StNxTSQRLVWeRlBRWBJa9474rVz4m14BDfe
	 OepOR7vu4jkOZvm2wOhJXYq4uWr7kZuoXiXMJw4Ottai9mTxvy0QwMf7KZOmXZmc8QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9RS1aTZbvFjlQeMzAWvxNDOmSGxq+psns4GOzN5ypAs=;
	b=f/X/DndkIig6E9mH3FSjWnSOhl28uLdmXqqs2NWdkhs2wak1gpunsT7+yRC33XhpzFau
	 5ycO0fplbVaPA7KUQiuEjjbwM8mXXPd5SE5+T+34bC6CJpPqk3scpQzL7ByCx06RnAyzT
	 XR2gAb2nuoR+LiX/bWBeF9kJwSY0NW5rKevSxJcnvyy/VXebqlxjc3y9Hspb79u8Q5Cin
	 m3Tu5l2BFiAcnGxjN00gfWvt4ch2VGPxB0MpiW8HcwMjDcbe2byxbHTK88X0m/DkpZzlT
	 J1FdaSb+GVqysyrb+8IT9M95anPo10STayLkcFraHZ6Ee20YO/RhtN3EEhDuwCDOesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4iGkAy4;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F966606A33C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F966606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J4iGkAy4
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso339640241.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196624; x=1795801424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RS1aTZbvFjlQeMzAWvxNDOmSGxq+psns4GOzN5ypAs=;
        b=J4iGkAy4Jk/VD59I2nqQ1enVY3HtGwVnhz0h5ynsHI2i38PPbVDFduQH6KVKdWejDO
         dMCH6d2/hpoonk0tRwe7AZuXcMDT5P0e0GJtWIAg66q8ihXbrd2L7Nd6dDDuVxu27ADT
         Iu8APcY6TUb7TKtt8nXxPLKUxc4wz0FHF+J0IebC6x1/B84QyivsAQ0dtfDfd5tU68Jb
         SczJ3Vn/qdjwVWo9zC4pPOt9fyrOQ6u7RRc99OyVHBeuA5Lfuqeycm49O63oW2A+tlwT
         TEHCoqTessyy01NuZYBX7gJafHh6cyJ/etkauWBqkJVAJZtShjbvkEayazif+Fw5xXZG
         KflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196624; x=1795801424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9RS1aTZbvFjlQeMzAWvxNDOmSGxq+psns4GOzN5ypAs=;
        b=xUzkaFbREwcNghfxivlFGR4BXP07snXUzajJ+WLw7zsjsdonom2vqsCboMnP8aAcSa
         iKDh6ul8OFL+Jr0c8FJ1V/I2/3tnh8dSCjOXugMLEJ0E8CTidn0mrw2c+MtLtNqqEMt8
         gsLPjUFVOOf3oLb7zAy+BjrrA9BV/EsK78DdrVPwUh+dODlnsCO7sv+fmxBxsdSv1ILH
         p20C+XE0gmBfJiS406l5M1GUn3U4Gf+2SrSNnGMRLZubzMoQBrkxQFTQawYdarsAevV1
         Z9HHZXLp9Ye975x3wNt+3BQ8JUvdQmbgCFf6kFD1bwnt745XW31S6Oc8XCMMqlaxNDUm
         +HSw==
X-Forwarded-Encrypted: i=1; AL+hErHSLFWlQE44B2HO/GRv5hqqqgrZOrBruT3TWosZ3HuZ07g+jkv82/ByLiYJMOLaWyLuExL0ZlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+50ZC0X4Yig5CDZx3U9hDOviLegGca+OYiTKKqb6BeD5gjO+jl
	y6VPoD7+XkSvkV/6eF0dvQ8Ev88kWfxNSQBWSmBf3i0wMmYWLFa47PF0
X-Gm-Gg: AZFdTZdGtaGnr5EwaKzrxkoR+CV1BH1Uoz0yoT3FkIav9EXnR5BBRL58BV1Ym25tIzL
	qy9kOQU91TUCjOtauiHG3IoKWVY3KcTekipuLwWMMLQxyo/PeshGP2a2U9fjRPwohKfYp6NaS12
	H7POwWSS+EPTi9e9lIK6A6YN7/vQuQXMkNaLOqL0OWk24qm/+SX52HEG8DVBL6Yo3mDh/SybOsa
	0GEd2VncJaIm2UVrmpj0oazaLnpcZPKYa/0Vj0wDVYDNbiuTXxBF3GVVmQP4jCUrfv9Wn3ZvbYD
	Y0AERDTBPSte372cXufbsyl97U2RtACTORaRvEIdPzkKHPOCilCeSaLYhTs/mOfW06DI7w6an0t
	/gWvyu+AwO2X9SOlEnTN+jpYGa0gv+Z7Iu5wxICrzg4I/THV0YyqnZgruWzhWxn3loD8CK6qgYK
	6/NzmOnzltk40yMIiSXjUqitQgUmxOOYHBB/HFWJfL0jBQO55xhF9l7LRi0p9uZU70oYNet7uno
	XARZxkiFsiHd8+S8twfbWmpGPFuRZp+U9imKgz8scI6o9OT9yem/cvVxx9lF0hnu24iJoHnvmLZ
	AB7kp6lW9qaZiVsBRokEaIvpNuPFMtkeUAO1GZo7b1rT1RFMls38fpzgYT/+DNyTmcZECg==
X-Received: by 2002:a05:6102:c54:b0:7c1:f530:2d8e with SMTP id ada2fe7eead31-7d7396a6024mr1680666137.35.1795196624132;
        Fri, 20 Nov 2026 09:43:44 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:43 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/4] udp: Fix bind conflict check stopping at the first reuseport socket
Date: Fri, 20 Nov 2026 12:43:38 -0500
Message-ID: <20261120174341.35873-2-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120174341.35873-1-juanagusnicco@gmail.com>
References: <20261120174341.35873-1-juanagusnicco@gmail.com>
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

Since commit df560056d960 ("udp: inuse checks can quit early for
reuseport"), udp_lib_lport_inuse() and udp_lib_lport_inuse2() report
the port as free as soon as they find one overlapping socket that has
SO_REUSEPORT and the same owner, without looking at the rest of the
chain.

This is only safe if overlap is transitive, and it is not:

- A wildcard address overlaps specific addresses that do not overlap
  each other.
- A socket with no bound device overlaps sockets bound to different
  devices.

As a result, an unprivileged user can bind an address and port that
another user's socket holds, and receive its datagrams:

  victim:   bind(127.0.0.2:P)
  attacker: SO_REUSEPORT, bind(127.0.0.3:P)
  attacker: SO_REUSEPORT, bind(0.0.0.0:P)     /* should fail */
  attacker: SO_REUSEPORT, bind(127.0.0.2:P)   /* should fail */

Only stop at a socket that matches the new one in family, IPV6_V6ONLY,
bound device, SO_REUSEADDR and local address, and keep scanning past
the other compatible sockets. Identical SO_REUSEPORT sockets, the
workload the early stop was added for, still stop at the first one
(binding 16384 of them on a KASAN build: 223 ms before, 222 ms after,
3727 ms with the full scan every time).

Fixes: df560056d960 ("udp: inuse checks can quit early for reuseport")
Cc: stable@vger.kernel.org
Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 net/ipv4/udp.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 303d0102519a..446729b41d66 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -131,6 +131,15 @@ EXPORT_PER_CPU_SYMBOL_GPL(udp_memory_per_cpu_fw_alloc);
 #define MAX_UDP_PORTS 65536
 #define PORTS_PER_CHAIN (MAX_UDP_PORTS / UDP_HTABLE_SIZE_MIN_PERNET)
 
+static bool udp_lport_same_bind(const struct sock *sk, const struct sock *sk2)
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
+					if (udp_lport_same_bind(sk, sk2))
+						return 0;
+					continue;
+				}
 				return 1;
 			}
 			__set_bit(udp_sk(sk2)->udp_port_hash >> log, bitmap);
@@ -188,6 +200,8 @@ static int udp_lib_lport_inuse2(struct net *net, __u16 num,
 			if (sk2->sk_reuseport && sk->sk_reuseport &&
 			    !rcu_access_pointer(sk->sk_reuseport_cb) &&
 			    uid_eq(uid, sk_uid(sk2))) {
+				if (!udp_lport_same_bind(sk, sk2))
+					continue;
 				res = 0;
 			} else {
 				res = 1;
-- 
2.43.0

