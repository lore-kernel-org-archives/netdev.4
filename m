Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745203;
	b=HM5a44UZnqoEiFLU/cd43hP7L/VTK5DZultt+T7PSPDbc/JHNgZqRyevuYCfPHJ2eySz
	 ZIZQYnV/RVWvYXdS6BBRV1Si5Smz4c226uUee7ZG66XRp6k/foHDPa4ne1c++FCQ34GYt
	 oixNor7xH4iSeKge9o0ccY6hSXS/s9NBittU/y+Nhpl6aRJrByEKG/wrk2ATiL590XK3F
	 Gaiuo8WH+KoZzkY5/YU8Zn+lvQgZ9Ae4s7/Fcl/LGuLBWKQsk2D3liO/DDOVQQ6pCb463
	 zyyjJ9qDzuw6DCklyf6swmuS6EzGvr25yZCt7faZSkA6LmTtzK7Q4PBED5MlBTW4weg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=stEeShhDgMgVvmA1klXyj8SxljseTC1hT6IQUE2U1uM=;
	b=RtlzjTEvW8ndQFpLNzMyjW3ateGvrxgUF0vjcOiZIZToSxg/JV+4V1TcBUIT/NAAG3F4
	 XlHdBCrPtPP8JevjscLUgFxZqQpS22IBzmwCGlaE5FpJrrhXDepDoVMHVK0E/z7NlC1bV
	 NVvZRMZk2ECqzzuHHBYx+RXnMA7dUeyHRnxzGoNchz3ji7Igdu2AEgPEQ3XTih2whj5K+
	 07bGMdcx84Dsi3X00Pa8q/Fy21Yx9fJ8qgZZ04755i/vQM+sN4WuNab9SPF2LpwHl5qgZ
	 IzPCBlCSEwpZYtjFU3JgOHWqNdtEjKqeS2pybk0Rnr1mIfk1CaIVhVT5TKHzaHQ4Adw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fbI9ZHM3;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13CE606A333
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13CE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fbI9ZHM3
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1931906a91.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794745202; x=1795350002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=stEeShhDgMgVvmA1klXyj8SxljseTC1hT6IQUE2U1uM=;
        b=fbI9ZHM3cEVryOSo/Loc77LlmCa4UD/eQZqbHKTcPNZUxxZfYndbLAvy4t6BdNl9nM
         QxpwrYE9wqeeHFblJlrPk6OpofY5WfY9ev6XFxLu53BzPa5hdZk0uptIjZQfDb9OnLu1
         uPQ4QWpVNHFdYReyoTzuPuVKY7XIaEu2m6HVXIEzY0rNMf5HQT916qPXWJIYjDdwUktv
         XCnQkj5FIk1w/yCUyTYCOBuw3JNVEZV4dgNZFkX6yJdjnBBWgjUW8N9wJuQRkuqTMf/p
         1LC/V2zrF9zK3ULxGqAaXGgVJHP0ije8FsIjNlQTlyZumqqxArKv080qfF2G1Q5cLu+u
         2SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745202; x=1795350002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stEeShhDgMgVvmA1klXyj8SxljseTC1hT6IQUE2U1uM=;
        b=m8BF7MB+5td3D1qs69Y2jtLmp0mgMRwNFJh4LT8QQk+BsTf7OufdFtx+P92uwO1jNQ
         QsPkH/VzaIJH6b33p6VEEk3nmP93fIU+n2JvMcbzzSR8PwumOLfV4sv7Pkwfcc9cbfGj
         gSKXN3d0emkzNWi8psxiVKzpJzFbBWNDl1GJRxeKubz4ifOohjX2JfmO1cEaJ88xASnZ
         68EVxM70kScV86t/TMprcKNAknixxUd0eImTOalGSk8hhrUwzH+80Z/V9ucXSSMYbr06
         YmE8YHAl5Cq6ZXljv2AUFdYexSbvetJUbWbSG/B1jpzKYG1ltIsUr/AeCyB6U+EiaSp9
         ZSbw==
X-Forwarded-Encrypted: i=1; AL+hErEDWkUcUkIaOmIsrgG7/ApndFHE2AtVABG37opJIwA1UqMddDuTfk3d3JDR2E1Tmq3DfCqaOvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/D7vR0yJUD2DaGIhiRkDVfFh5Zui7LCprbBPLR6E4OQFbeejIv
	1hcAYSNZYn0gb9EK6GxnZJ6AUX8n1foR4h++TYZ+xe862RCuHpoqujp0Bj0vpNf0
X-Gm-Gg: AYBFou11jNJxz67pr+nxZZKToPZdBku+APofe1c1j2+31ghm1YTdb+bWqBIaJY6e8F9
	1v/dFAW0iEO211xPo4lEPE1sjCY/+1aAaRpa2fiOz9BFFyyUkeXO40xW6tjmv018dMofbpJI6RI
	Dob3Q2wJoIP1vWXrz+XjyEUqRW1TwJJu5tblFHwQtcxc7ZnqaC+pAQc6O28+I1m+ii+hVjzAHzv
	mL0EJ7FUfqdVuPeVVyW+3ah3i9OmqHMxRj4vDAyToKrJGvwOQobPpbY6N9w5atz8rC9qHmd6aN+
	LVXdLd4O0EuKIOvzx3Vy5nMFAMcvCa3eR0Nvvbl5NacXiZlv2Hy+5rGl+nerc3rFrd9GIQUHo9Q
	Wmql8vaYu7vwr2k0PhS/7KW4dQAKU7UGR7VqJgRq6ph6T1rvlZQSP0rOSlx7KaqUMIGrX9c/y/q
	x407Gnh41VU7qmncdXgyXon81meBJaCVqqweAcssVvyZBXQH/9BHD9y27Ihn+UZCmso2+zmDmiI
	O6M+ORR2LFgWNeqFoqzUBlyQBQFzLcTR9zYh7siEOCXxTEu5MOiIwvcJXDHG7oktYU1A4dytOYx
	OwKIVtBoikiR5CgH4MUTWF05VxJj/kRF4QcpXRtynIZWb0ES/uQzk+pQQ13M6XWLBEQeb33FXxo
	zyMz9M1GbxKqRU7OgdDkSxP2te5vdayWuc7G79v9njS9O1+2DDZmMnTBf0w8erT9DzYFEc7wvH5
	qzcGc0k2mV1W22Ldkal70MAsISJR+mmJBaJevmNIFO1xPut7S+4Wiu6/2UxVOUm1PQlyjnsVTbR
	kK2ttC5gdhCjgyfWx517Wfnl8im1s+Nt+6HQb2VYVFoouqcVUgrbzBuPXaFXNZb
X-Received: by 2002:a17:90b:5585:b0:3b0:9e2f:cfc3 with SMTP id 98e67ed59e1d1-3b1b0a0ddf5mr7271589a91.32.1794745201749;
        Sun, 15 Nov 2026 04:20:01 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm13828101a91.11.2026.11.15.04.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:20:01 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] rxrpc: Fix rxkad to use the key's rxkad token, not the first token
Date: Sun, 15 Nov 2026 22:49:35 +1030
Message-Id: <20261115121936.5523-2-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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

rxkad takes conn->key->payload.data[0] as its token, but
rxrpc_init_client_call_security() may have chosen rxkad because of a
token that is not the first in the key.  Since YFS-RxGK support was added
the parser accepts rxgk tokens whatever the configuration, while the rxgk
class is only registered under CONFIG_RXGK=y.  So with CONFIG_RXGK=n a
key holding [YFS-RxGK, rxkad] gets rxkad security and rxkad reads the
struct rxgk_key as a struct rxkad_key.

rxkad_respond_to_challenge() then takes the ticket length from bits 16-31
of the rxgk token's lifetime, which the key's creator sets freely, and
copies up to 65535 bytes from offset 28 of an object that is only 72 to
136 bytes.  It sends what it read, including the kernel pointers in the
rxgk_key, to the peer in the RESPONSE.  Neither making such a key nor
placing a call needs privilege.

Add a helper that finds the rxkad token and use it in
rxkad_prime_packet_security(), rxkad_secure_packet_encrypt(),
rxkad_verify_packet_2() and rxkad_respond_to_challenge(), aborting in the
last if there is none.  A key's token list does not change once
instantiated, so the token stays valid as long as conn->key is held.

Discovered by an AI code review agent, reproduced on unmodified mainline
with CONFIG_RXGK=n: with [YFS-RxGK, rxkad] the server aborted with
RXKADBADTICKET, and a KASAN kernel whose compiler instruments memcpy()
reported a 64-byte slab-out-of-bounds read 28 bytes into an 88-byte
kmalloc-96 region.  With this patch both orders succeed and KASAN is
silent.

Fixes: 0ca100ff4df6 ("rxrpc: Add YFS RxGK (GSSAPI) security class")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Tested on mainline b3dfbde62cf1 in a 2-vCPU KVM guest with KASAN and
PROVE_LOCKING, AF_RXRPC and RXKAD built in, CONFIG_RXGK not set.  The
test runs as an unprivileged user against an AF_RXRPC server of its own
at security level 2, and makes the rxkad ticket with AF_ALG ecb(des), so
crypto.af_alg_restrict was set to 0 in the guest.  The rxgk token's
lifetime was chosen to give a ticket length of 64; any value up to 65535
is accepted.

Unmodified, [rxkad, rxgk] succeeded and [rxgk, rxkad] aborted with
RXKADBADTICKET, the RESPONSE copying 64 bytes from 28 bytes into the
88-byte rxgk_key.  With this patch both orders succeed.

On the same source built with GCC 13.3.0, where
CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX makes KASAN check mem*() ranges,
the unmodified kernel reports:

  BUG: KASAN: slab-out-of-bounds in skb_store_bits+0x3de/0x840
  Read of size 64 at addr ffff888009d2121c by task kworker/u9:1/229
  which belongs to the cache kmalloc-96 of size 96
  allocated 88-byte region [ffff888009d21200, ffff888009d21258)

and nothing with this patch.  A KASAN kernel built with GCC 11 does not
report it: that compiler cannot emit __asan_memcpy(), and on x86
mm/kasan/shadow.c then provides no checking memcpy() at all.

The NULL check in rxkad_respond_to_challenge() cannot trigger today, as
both client and service connections reach it with a key that holds an
rxkad token.  It is there because the helper can return NULL and the
function's output goes on the wire.  At level 2 the encrypt and decrypt
paths now walk the token list per packet: one step for an ordinary key,
at most AFSTOKEN_MAX (8).

Stable: v6.16 and later are affected; 6.12.y is not, as its key parser
stores only rxkad tokens.  Between 6.16 and 7.1 the prime, encrypt and
decrypt hunks need their context adjusted; the change is the same.

Not tested: CONFIG_RXGK=y, security levels 0 and 1, the AF_RXRPC KUnit
test, interoperation with AFS servers or clients.

The test program is not included here; it is available on request.

 net/rxrpc/rxkad.c |   31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)
diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index ca9f0e82cb9..dbfdaf78d90 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -175,6 +175,22 @@ static struct rxrpc_txbuf *rxkad_alloc_txbuf(struct rxrpc_call *call, size_t rem
 	return txb;
 }
 
+/*
+ * Find the rxkad token in a key.  rxkad may have been chosen because of a
+ * token that isn't the first (see rxrpc_init_client_call_security()), so
+ * payload.data[0] mustn't be assumed to be one.
+ */
+static const struct rxrpc_key_token *rxkad_find_token(const struct key *key)
+{
+	const struct rxrpc_key_token *token;
+
+	for (token = key->payload.data[0]; token; token = token->next) {
+		if (token->security_index == RXRPC_SECURITY_RXKAD)
+			return token;
+	}
+	return NULL;
+}
+
 /*
  * prime the encryption state with the invariant parts of a connection's
  * description
@@ -182,14 +198,14 @@ static struct rxrpc_txbuf *rxkad_alloc_txbuf(struct rxrpc_call *call, size_t rem
 static void rxkad_prime_packet_security(struct rxrpc_connection *conn,
 					const struct fcrypt_key *cipher)
 {
-	struct rxrpc_key_token *token;
+	const struct rxrpc_key_token *token;
 	__be32 tmpbuf[4];
 
 	_enter("");
 
 	if (!conn->key)
 		return;
-	token = conn->key->payload.data[0];
+	token = rxkad_find_token(conn->key);
 
 	tmpbuf[0] = htonl(conn->proto.epoch);
 	tmpbuf[1] = htonl(conn->proto.cid);
@@ -266,7 +282,7 @@ static void rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
 	/* Now txb->pkt_len % FCRYPT_BSIZE == 0. */
 
 	/* encrypt from the session key */
-	token = call->conn->key->payload.data[0];
+	token = rxkad_find_token(call->conn->key);
 	fcrypt_pcbc_encrypt(call->conn->rxkad.cipher, token->kad->session_key,
 			    rxkhdr, rxkhdr, txb->pkt_len / FCRYPT_BSIZE);
 	_leave("");
@@ -412,7 +428,7 @@ static int rxkad_verify_packet_2(struct rxrpc_call *call, struct sk_buff *skb,
 	len = round_down(len, 8);
 
 	/* decrypt from the session key */
-	token = call->conn->key->payload.data[0];
+	token = rxkad_find_token(call->conn->key);
 	fcrypt_pcbc_decrypt(call->conn->rxkad.cipher, token->kad->session_key,
 			    data, data, len / FCRYPT_BSIZE);
 
@@ -710,7 +726,10 @@ static int rxkad_respond_to_challenge(struct rxrpc_connection *conn,
 		return rxrpc_abort_conn(conn, challenge, RXKADEXPIRED, ret,
 					rxkad_abort_chall_key_expired);
 
-	token = conn->key->payload.data[0];
+	token = rxkad_find_token(conn->key);
+	if (!token)
+		return rxrpc_abort_conn(conn, challenge, RX_PROTOCOL_ERROR,
+					-EPROTO, rxkad_abort_chall_no_key);
 
 	/* build the response packet */
 	len = sizeof(struct rxrpc_wire_header) +
