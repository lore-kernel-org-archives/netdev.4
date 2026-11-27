Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784034;
	b=mUfUDDqWGauHA1Q4e9/nAWhWmv2QAJcmEfGjg9KhAsZd812UXoR2zNbjQTmn0bX/5Tpv
	 1X/TrO1S7JBWtMDvpHqtw4bFDJAB11QDzrwLSt3B7CfkscVOnCoTPbOIshKHgXG03aaY8
	 GrQwV83ncu/sdWkW1MVcA0aZJNC4lsMdQ06a0VTkiz0o1gAVWy9/71w4TAimuS1UXI4O8
	 K+C4cR+hTyW8xKa12JkPaQA2BC9wOveORwgWaGKKZQ3lEnSstTglMsa0SdugQHKj6PYC4
	 bOAbdlCRdRXnQwyopU7nkc9maSXD1b0i3jrtOiSl8gKqFnEOyaLVk5KZ9TCmJ4wjJPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784034;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=J2NBcvVX5LFc6MB0ZdwlrPbiorFkKdez/lryG7mjCCU=;
	b=XrDe7XT+jOqeZnj9/OoilglzLOTw7rNYJNW04QmDW66A8+uySYEGK/MEJls9Z/Y4qh5w
	 +AIaTeQfxZcApVmthpNIXRqE9p+Q4T7jWYQuv1a3bx8dLCvV1kjS5Qhx2ZqVd+v78ZnW1
	 RlzBTyKBeqFggJWk0OU+QrHUBP6dmACK5dwhCZ3TrU2H/Ysb7QZTPMuj3Q8SZcxSFaXai
	 88THVVk3YxAMnnJcmdImMObOzEJ6HQ0vJSPCQHKxhWhccUlsZUGkR4lCURh8GGo+jUyhR
	 LrXwg8M32Nx+9B6Gnl1jxtUwDePckPhY7Kcqru/2ioddObr4gKnkyOnS5p0pqXThUOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HaHPrHTC;
	arc=none smtp.remote-ip=220.197.31.8
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E50606A31E;
	Fri, 27 Nov 2026 12:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HaHPrHTC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=J2
	NBcvVX5LFc6MB0ZdwlrPbiorFkKdez/lryG7mjCCU=; b=HaHPrHTChcWNmy59D3
	MdM8omdQE6DJMKmT7AAAwm6l7dEYJhFvSOfRMpdbnOuBVa1jQoRrWIxsjiWB1d27
	KRa57opJsZjnqhVQJPgMwN8YZ6ptXUnvsT8WCH1AI5XQ9CEDt9cgAgc1Kv58qwpy
	iuQsJaMhPJgjXiqAv5T3otMIo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD396o9fQlrfdk5Dg--.62904S2;
	Fri, 27 Nov 2026 20:53:20 +0800 (CST)
From: Bilal Hashim <AeeSec@126.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bilal Hashim <AeeSec@126.com>
Subject: [PATCH] rxrpc: rxgk: round up appdata and authx lengths in rxgk_construct_response()
Date: Fri, 27 Nov 2026 20:52:50 +0800
Message-ID: <20261127125250.1434-1-AeeSec@126.com>
X-Mailer: git-send-email 2.47.0.windows.2
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
X-CM-TRANSID:_____wD396o9fQlrfdk5Dg--.62904S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy8uw4kJr1UAF4fKr1fXrb_yoW8Ar17pF
	909Fy0kr45Xry3WFZ5Gw4Fkr4Sqr47XF13tas0gF1fZr9YqFn0qFsrKF92v3yfA397Jr1r
	Ja1jq3y3tF1qva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEXTmJUUUUU=
X-CM-SenderInfo: 5dhh2vbf6rjloofrz/xtbBnwCMJ2sJfUAoVgAA3V

In rxgk_construct_response(), the buffer length calculation forgets to
round up both `appdata->len` and `authx_len` to 4-byte XDR boundaries:

1. `auth_len` is computed using `appdata->len` instead of
   `xdr_round_up(appdata->len)`, while rxgk_construct_authenticator()
   pads `appdata` to `xdr_round_up(appdata->len)` bytes and returns
   `sizeof(a) + xdr_round_up(appdata->len) + sizeof(b)`. When userspace
   supplies a non-4-byte-aligned `RXRPC_RESP_RXGK_APPDATA` control
   message, the allocated authenticator buffer is up to 3 bytes too
   short, causing `skb_store_bits()` / `crypto_krb5_encrypt()` to fail
   or hit `WARN_ON()` in `crypto_krb5_encrypt()`.
2. `len` uses `(4 + authx_len)` instead of `(4 + xdr_round_up(authx_len))`,
   even though `rxgk_pad_out()` subsequently writes up to 3 trailing XDR
   padding bytes after `authx_offset + authx_len`.

Wrap both `appdata->len` and `authx_len` in `xdr_round_up()`.

Signed-off-by: Bilal Hashim <AeeSec@126.com>
---
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -936,11 +936,12 @@ static int rxgk_construct_response(struct rxrpc_connection *conn,
 	if (IS_ERR(gk))
 		return PTR_ERR(gk);
 
-	auth_len = 20 + (4 + appdata->len) + 12 + (1 + 4) * 4;
+	auth_len = 20 + (4 + xdr_round_up(appdata->len)) + 12 + (1 + 4) * 4;
 	authx_len = crypto_krb5_how_much_buffer(gk->krb5, KRB5_ENCRYPT_MODE,
 						auth_len, &auth_offset);
 	len = sizeof(struct rxrpc_wire_header) +
-		8 + (4 + xdr_round_up(gk->key->ticket.len)) + (4 + authx_len);
+		8 + (4 + xdr_round_up(gk->key->ticket.len)) +
+		(4 + xdr_round_up(authx_len));
 
 	response = alloc_skb_with_frags(0, len, 0, &ret, GFP_NOFS);
 	if (!response)

