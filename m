Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745198;
	b=26YtiMExZW8ivvoM5zdVA9B2koUZ+HiLj6W1vrTx1xlcUt3D5yUKFPEAAi8W5MkPDNof
	 WsbSFxwDr17ccbmyQIFexeAnFPHsrcJRQ2GkkP8eGf8MaPMoSeX2NnhBI03Z0XxiSAost
	 BokzaiTaGjLVDeLigxJ77rKwIOXDoouB9sWl96vUnm+z/HFepX/to428rIVvXlWj4Rqpe
	 xwJreO4t4aSFdgqdGYVbvlglYgtDxgk0vdL0dSzydNBfKJfcC2Tv7n2/EgmFcVIUAn3FI
	 Te1y5udvB4Hr9zInhJ5fCGlTQhSV8Eqt+4WCDF2Gnr+uycmh36/s5H9OtMLX3kukwtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zJN4lywKLy/TUZfdqzX6Td/YHV+fU03Rlar+Ys9YZUE=;
	b=Wy0zPLNrB2FZc0Wt62unWEXT41u6Gl2G8/DgLcp2GV9i/l6AW0y23dRIPGQpO9fYsPdQ
	 LFlyLU1S/8eXfHb7Gfj3uvZbY/Ya9lM+G8smKyimbLQ3RCCxEA62Y8EuIzpxxrtdWdXES
	 7o8OffGxyoz8A1b/n31lYr2v7a2Uhjbi067JeYnJZuF+S0ivZx4n2gkUD/GsLWTT6nYzM
	 3Gyra5GvvEzECr2pmC/9Ep00Bc6+IYEA8OZu690p+9Y2AwgJtreJc0rEZThyJyU9Hh9BY
	 bKlQBCxMSQZy1ETc8fuSIyvehVREgwQ6+a4hV9ITcSlhxmyXv8nT2yI8YyhJq0RaL+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YZ0sa5Q;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14016606A31E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 12:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14016606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YZ0sa5Q
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1175979a12.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794745197; x=1795349997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJN4lywKLy/TUZfdqzX6Td/YHV+fU03Rlar+Ys9YZUE=;
        b=0YZ0sa5QpD227IeTPFtWCW5Asq0BwvMZIk8Brt0vPYEOKMr++pqwRtkUDr9RmxBjD9
         QeYPVlTbKj0lspfE5B7yp8d+EHfebnp5pDX49xjNiDDZpqJohmxVDi/NG9HOmXDEuPYV
         nvU2iOyKghE9DHMIuGPLHpdrQkG0Dg4hy66kXeb/4xbYMwJVg7rdMWRO7hJudZdrvLpQ
         9YBoyLKJC7Kuw2rC3IzP1oCwhKMtlkaPQtup7kgKwjytPRaqG0ZhIw57OTYLjCHypzm+
         eopzKOzRPdHnVlOIQ3WRXEWVXX0mEhARlbo+v3vah20fDKak5e6/lxgvREinWSe8o8V4
         g8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745197; x=1795349997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJN4lywKLy/TUZfdqzX6Td/YHV+fU03Rlar+Ys9YZUE=;
        b=vKuSYdyil4EvOoFZb5JqkpJa6jcjXvqAK9vZpKKKckfTHqL3+omxB7MWf7bszP460l
         ggcgDNE1cjPICAXeB/DIeB9szLifJaRI1jJdTQAdXG5Kghwmmy/MvLkOILTqLYWOYhl0
         bp92+DmNUbWXJ+PgEVb7iV7WJCfqTdv9iqVJqDXj1okmA8JuK6EnRvbJfYebPR5NuR5z
         MaDwGzklayKcL3tFprfGd+kQE550vtjQkB/UiZe27vFxTg3fiujE7Rtj7H/PnEcc8ngC
         1YE0a3tl48r/g7LGuZqJYLumrWuNr4Mx9B4g4epgAJJq4Pt1lVZSuPOcTKF2OQLLfd9N
         ZBgw==
X-Forwarded-Encrypted: i=1; AL+hErErOnyFmUPonE2rZUoRE9hxC1RBP1VcK7fRQvhhUFEx0zDYLLH+f1U9rmT5jcB8qB80qaiEQnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9klzoRgXhbkjMcVXoi45I66LpeAIMRrB8PXtcj68KDrntzLrzn
	0gwivWgZb9xYdPBE7KJGrZaOmoENOudsrXwdgWBs/CSHbbTB/jx9iQBA
X-Gm-Gg: AYBFou1JIa40RcQXLLRNq5w3U5y3d4zh9HCqdvx+JfYDY6rgnP0d6VPD8cXoCjQ3X4b
	h0SF4c15DlBOeJC3sgRd1bK40TuF9UKlkPrdSxDa0C6Iwmc5Xgmjn99RxIF9Z5VQdv+XsTnWLDL
	lCcZaNS6NjcAotCG/eWc67l4V5GSpnlbvVntld/OhUuwrqqKcNI9rK93fXeEdCS/3rFietJAKsf
	43soiT2xtpr7uSL8hkJfebN7N+/d5iM34ptD3WiCdzf9yyFavVAJTCnATczrpM9kRy4fXMkrHY1
	9I4zt1vLdZMq96MbhRxQ85nM2Rv8HuzLVFFtLMUIgCvsSZXC0YKw7L6OtxbLg9/wB0ntJVZpkct
	OrcJFH/Pu7U+xZp/ssv8o4f+F2UfQwo52Da2VBe7Z00cc+Qhzkfh4PREWcEwbM0gykKawU9Cnu+
	yzJtYMLnBsoNa4lG3Qlixq3Ib8zi/eu/JAEjwY3UbcKCfLiC1y3Y5+G5L8hWvZRuq4hfLFeNAff
	HzsHStV+hLQ0e/jYo62P2tjfKYVQQV1LEwGOVbhBBMyeOSE2/Jofz+/1X7gXXKPRvpTJy0VpvIh
	P9xAvP5mb9m3eMbSrt6A1UwKundsuqoy72OhApgr6FdT/avQ4FQHWQ2qSouJ3W8AhBSpTsJCfNP
	qJ0Ati8pVzWc7Y5iHIp5IkWIPQR3Ko8XnypnY8ZIGI1p7IKLaBkbxQk/dxoKqN9lvV+yIoF7lDZ
	ffB70eLeiB0dWMpP3e4VJRaanQa4tMO56Vtcew+Uk05GuJDBQd7TYeacvMc3n7RSltDIOWH/fsV
	AnDPRlhSSafroevvhP65qHt9OTRkQjGYM2KnUcPBsKAwJa6rPBwC4tpmUmSwXTQ
X-Received: by 2002:a17:90b:3ec9:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3b1b0b8695cmr7315282a91.64.1794745197326;
        Sun, 15 Nov 2026 04:19:57 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm13828101a91.11.2026.11.15.04.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:19:55 -0800 (PST)
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
Subject: [PATCH net] rxrpc: Don't send on a service call before its connection is secured
Date: Sun, 15 Nov 2026 22:49:34 +1030
Message-Id: <20261115121936.5523-1-danjwade95@gmail.com>
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

A service connection learns its security level only when the client's
RESPONSE has been verified; until then conn->security_level is 0 and
rxkad's cipher is NULL.  Since commit 41b996ce83bf ("rxrpc: Fix call state
set to not include the SERVER_SECURING state") a call leaves
SERVER_SECURING as soon as the request is queued, so rxrpc_send_data()
accepts a reply while the connection is still being challenged.

rxkad lays a DATA buffer out from the level at allocation but transforms
it from the level again at seal, and a partly filled buffer survives in
call->tx_pending across sendmsg() calls.  A buffer laid out at level 0
has no room for the security header, so if the RESPONSE raises the level
to 2 before the seal, rxkad_secure_packet_encrypt() pads and encrypts
round_up(8 + len, 8) bytes in place: 8 to 15 bytes past the end of the
page fragment, which are then transmitted.  rxgk splits the work the same
way and dereferences a NULL key context instead.

Refuse to queue data on a service call until its connection has reached
RXRPC_CONN_SERVICE, returning -EBUSY as rxrpc_do_sendmsg() already does
for a call still receiving its request.  The state is read under
conn->state_lock, so a sender that sees RXRPC_CONN_SERVICE also sees the
level and keys installed before it.

Discovered by an AI code review agent, reproduced on unmodified mainline
with KASAN: a server replying with MSG_MORE before the client's RESPONSE
was processed got every reply moved down by 8 bytes.  Same on v6.12.117.
With this patch the early sendmsg() calls return EBUSY and the replies
arrive intact.

Fixes: 41b996ce83bf ("rxrpc: Fix call state set to not include the SERVER_SECURING state")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
Tested on mainline b3dfbde62cf1 in a 2-vCPU KVM guest with KASAN and
PROVE_LOCKING, AF_RXRPC and RXKAD built in, CONFIG_RXGK not set.  The
test runs as an unprivileged user and makes its client ticket with
AF_ALG ecb(des), so crypto.af_alg_restrict was set to 0 in the guest.
20 calls per kernel: unmodified, every reply arrived moved down by 8
bytes; with this patch, every reply arrived intact.  Same on v6.12.117.

KASAN stayed quiet throughout, as expected: page fragments are not
tracked per allocation, and here the 12-byte overrun falls into the 56
bytes of alignment padding behind the 1416-byte fragment.

Behaviour change: a server that sends on a charged user call ID before
it has been told about the call now gets EBUSY while the connection is
still being challenged.  If that sendmsg() also carried RXRPC_TX_LENGTH
the length has already been recorded, so a retry that passes it again
gets EINVAL.  Client calls and unsecured service connections are
unchanged.

Stable: trees without 7801c42c3bb7 ("rxrpc: Fix update of
call->tx_pending without holding lock") return directly from
rxrpc_send_data(), so there the new call site needs "return ret;"
instead of "goto out_unlock;".  6.6.y was not examined.

Not tested: rxgk, IPv6, interoperation with AFS servers or clients.  The
rxgk consequences described above come from reading net/rxrpc/rxgk.c and
crypto/krb5 only.

The test program is not included here; it is available on request.

 net/rxrpc/sendmsg.c |   37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 312be27ca75..a2f0bc19109 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -89,6 +89,31 @@ static int rxrpc_wait_to_be_connected(struct rxrpc_call *call, long *timeo)
 	return ret;
 }
 
+/*
+ * Check that a service call's connection is secured.  A DATA buffer's layout
+ * depends on the security level, which isn't known until the client's
+ * RESPONSE is verified.  The lock pairs with rxrpc_process_event() setting
+ * the level and keys before the state.
+ */
+static int rxrpc_check_service_secured(struct rxrpc_call *call)
+{
+	struct rxrpc_connection *conn = call->conn;
+	enum rxrpc_conn_proto_state state;
+
+	spin_lock_irq(&conn->state_lock);
+	state = conn->state;
+	spin_unlock_irq(&conn->state_lock);
+
+	switch (state) {
+	case RXRPC_CONN_SERVICE:
+		return 0;
+	case RXRPC_CONN_ABORTED:
+		return -ECONNABORTED;
+	default:
+		return -EBUSY;
+	}
+}
+
 /*
  * Return true if there's sufficient Tx queue space.
  */
@@ -349,6 +374,12 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 			goto out_unlock;
 	}
 
+	if (rxrpc_is_service_call(call)) {
+		ret = rxrpc_check_service_secured(call);
+		if (ret < 0)
+			goto out_unlock;
+	}
+
 	/* this should be in poll */
 	sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
 
