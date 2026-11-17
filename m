Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952567;
	b=XTc312OuWs/OhUI3CsKeYQCR3PNDHOOzlw5ob2HuouLqxPoktOI74Z2ImE7pWa4ljy1y
	 R3Q1j1i8Jl0qL47s1zjL4USIlP1KYdcjGxUsUE27AInnfjyQq2rXGhKhcCDVKkyyHQLUu
	 X728zNWLCyy4iQeyZqMw7DeufMTzCVP+RZMphjnGgRrJHC6BKOAQc19YGl2OgvGFFI8pU
	 UVmC1H531JlizjYv+Kvdg/fNTIpM6Bo7xX2s/5JLPv1gniot3FBjK2Zznh7zMQwhrfHpG
	 Xo+ecICw/97rEEecyCRVSoJo9H/yRPooFrfxUMbxi0/QG43krOjBIRGNuzyy8gQWuTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DSjrH7EnnuVI6DIehpVdsnek9CpkzZq1NaBOFJ/JCTk=;
	b=PgaupFeXgVQ+cEI4Yq+dr8RvclHumfoixFRVVQ2B7PHHelifVNe6S20gjFfnMcNLgR0f
	 +OufcKjk4tzWVSf5QqItvkhCaYH4So1crxN2Fu6NbkD8kkBDbFG/D/QznE0thi/7BoGKP
	 qY5hlSIAltwonkSmAen1UeBNgTYkWvFtG9pwTaIE34y/LyPJjTWsguFiL4AjP2r3N+T0/
	 wQuDMaOkgbqgBDgya5e3a76KMUdaEYvC8eHHEOV/MeEx5yYvPREiaVb1+cEst2FCcRx29
	 g/dxDwP2atvn/B8mVTkdtw1m4lj84KiEsc34GGHxn+540seJ2RTHNlTqro6IJuA9puA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g2/nqwqx";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1C606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD1C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2/nqwqx
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so16640eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952565; x=1795557365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSjrH7EnnuVI6DIehpVdsnek9CpkzZq1NaBOFJ/JCTk=;
        b=g2/nqwqx07e0tdK4DVJHIslgFnzAaRUxAAi5stbTk5pgexoRPdIoPYLuE6Qg0R9zBd
         4QvujGZdubMPFGPgZTKNz/EfuvBTgFRWHzS5CkcNqkRsA/LGBiW0kLBtDsNaitT1siDb
         mf17xXp5d/FR2SlhosXgz96l1fCaRRpjpbwXVe4HYJVIr2yJgnACE4HdZmlEKvqUHgcU
         WXJxNDTxRg3Lk7tD5CtDDtW2tjjqle4ZM9LJhqimuPA3E3YeIJl6xWlrunHDHYPiavFV
         VsISdeUccAe+wZp9hoRaLBkZeefll2L9+txv3Jj/Razygsk95O0yVwZeKGGgyGp4nK5Q
         1MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952565; x=1795557365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSjrH7EnnuVI6DIehpVdsnek9CpkzZq1NaBOFJ/JCTk=;
        b=WVCLPgZm6EDD9tBVHOvQBxPoohZOjvGQi46xE3zvGFrAx2pUdUuKCn+j06HYvWXyIP
         JUueFiFGP9H61u8Y5epAgsaiXTdJEHJtxpEzHuL0Xwj+iEjz6STxVnRQSc00CWCIZedR
         szBQHcWxCvP826COs0WM4iiVPYcT/IoBd1xTngkZy8fV3IUX2GFMbHE/Ltcw9ftfSq2O
         zT28uW3Y7RcRJoCoYs7evx2QagP33jdYgJ8glaHzEL7LAQzZ1QeSKaowYN7wQHWVopez
         b4ibmBfiCOn9OMjhhFfYJ6dnpP+RYNoUT+c8f1jlowl5BNChKaXjgP/UB7cyN+qhqGyW
         ERng==
X-Forwarded-Encrypted: i=1; AL+hErEvOz9z/sUNECJRPKQx9Jg/iQW/4DLQX0n/JWG5aDOWZ7kjTDrWKvDh7H/13BYg9gnpFJQyxzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z82WjZCZksEfWEwYhB1jb7U0AV2OqIoVauU/h9jfPyrMxZ7aj89
	M+nD903jN3YspqeJabicMd+DFmGJgnFLa/hLlod7KAYllCo91tMGm+yr
X-Gm-Gg: AYBFou0jVys/wbjVOTZuAcRPj++wy0Ds6IUDWxMD6dtt3tfZ6oaGR7VCgyDs/yT40oK
	JBTyExcpXjv049AGy0IFlMi6GoH6HdqglbpFD9HSfsZFSIjlBY6DodFnIU0r9mAHhQbrqnMmjWo
	nxTQnOL6pMeLI1bB2QNI8KuERifgwYimx055AH7SdzriZfdldZay9C9gxCDFaVmSa78sObgUVDc
	9n/L5Aod+qn+J7RC11ePTZzcGKW76y0Dpl12GAaDgbvgKva/7m0oqn7f01gloHNFxnL6ywwYWn7
	m7AUhjebhVnea6LMfuDFuKDQd/3TnuparXAW9ObSncFCu8ZOeO3flN3ZhjiYIMUJVTy2bd+0o59
	Z/EwQS/SaTs0EXcuQwNWs0JvARuDoWqwpvzXL77mfFvVGCrRleQPwDw3J4ebwQHNHjxX1k5RiNE
	Csrzxj/hyWCyhF4WGmYuMj1K6GHJCcv/ZgXZlqry9/W23jlDy17aJ0qma7la2V+9eRAwZ8caeM2
	Lc0LbAjs/mRBwVkDRUMp7Gp2f2RJsyc+LteNieaWayg3lS58CswZF70h8I8SLnv2H7uPnPsxchm
	6Gbclp8UOJ5XLPQP5zU8+OAdsfPAtLFrglret9MOKvvw5ms/FBmJQlWdSBV5AOKGaMPUOcuXGrz
	+G2cPH70TfltH/WKUxLsD/R276IclIZcjMK1JCw==
X-Received: by 2002:a05:7300:dd03:b0:376:aa76:6a15 with SMTP id 5a478bee46e88-3828120efe5mr619582eec.28.1794952565407;
        Tue, 17 Nov 2026 13:56:05 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bbf0d6sm726796eec.25.2026.11.17.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:56:05 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: edumazet@kernel.org,
	ncardwell@google.com
Cc: kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	0x7f454c46@gmail.com,
	fruggeri@arista.com,
	noureddine@arista.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH net] net/tcp-ao: fix reset key lookup for IPv4 segments on IPv6 listeners
Date: Tue, 17 Nov 2026 21:55:54 +0000
Message-ID: <20261117215554.68071-1-dennylin0707@gmail.com>
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

tcp_ao_prepare_reset() looks up the key for a reset that is sent on
behalf of a listener by the address of the peer. It takes that address
from the IPv6 header whenever the listener is an AF_INET6 socket, also
when the segment is an IPv4 one that arrived on a dual-stack listener.
The address is then read from the middle of the IPv4 header, the key of
the peer is not found and the reset is not sent.

The v4-mapped check that follows does not help: it looks at
sk->sk_v6_daddr, which is the unspecified address for a listener, and
it runs after the address has been picked.

Use the protocol of the segment to tell the family, like
tcp_v6_do_rcv() does.

Fixes: 06b22ef29591 ("net/tcp: Wire TCP-AO to request sockets")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 net/ipv4/tcp_ao.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index bb7bbc20ba3f..656dbf805cfc 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -813,14 +813,12 @@ int tcp_ao_prepare_reset(const struct sock *sk, struct sk_buff *skb,
 			sisn = th->seq;
 			disn = 0;
 		}
+		if (skb->protocol == htons(ETH_P_IP))
+			family = AF_INET;
 		if (IS_ENABLED(CONFIG_IPV6) && family == AF_INET6)
 			addr = (union tcp_md5_addr *)&ipv6_hdr(skb)->saddr;
 		else
 			addr = (union tcp_md5_addr *)&ip_hdr(skb)->saddr;
-#if IS_ENABLED(CONFIG_IPV6)
-		if (family == AF_INET6 && ipv6_addr_v4mapped(&sk->sk_v6_daddr))
-			family = AF_INET;
-#endif
 
 		sk = sk_const_to_full_sk(sk);
 		ao_info = rcu_dereference(tcp_sk(sk)->ao_info);
-- 
2.43.0

