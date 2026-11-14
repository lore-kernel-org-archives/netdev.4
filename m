Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647770;
	b=kjDZkEKe+5rGUiHNeVxTLpyhsfhmuBjZjpjiMTuFclsOnNf3Bx6l9W1+5qguR1JoiuJo
	 S9CzgNCg0nHEExrfRX9AmlEMm5QEPnoR9ymuUJJp3osQ0lbHaJvFw+8pk6dpP6hy+VRt2
	 jxSybF9yU454jUKDD7jJhWXtX/ndzJUpbPaEJ+o9hjilKPCdpIOld9nZmfIRBoYm4yxjt
	 GqxzK7ffaeNwkY51h+YPitKkXhxoz9cK1OQVAaJ1H3NKepfPEzJXAywip4loSu+dtxSZs
	 JZvSXmQ+IJOJWGyN+dSJGhmHHApIXjnhVG2DM18VX5uvU6wyPCtNr5SVtGhRq9piFIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647770;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rMO8X19lP9V1R2hK/QJuYzFCrlgW/VHC0tz8dhP2jr4=;
	b=UlPEADbptxv4j8V7oq1K1DOOiedgskTkp2YHW9JKAFFF15ngs91EfleWx4Lz4vLu5olv
	 Lgc6DpwPCxH/bZh7Q70ZsvY9oqV1+ffe8SX3YAFqgm+WZwUZ/IxoLtKjamOzvxg+pfHf8
	 TYLNBWR6HECV/5lj5vfuIfCAXCUxAJeSFMfwsnv3eceYgUg/dtoEGJIgdpMWmX3QGxIJp
	 WLxO66KornmTaGr9eKatM3I5SL6EuKd14SFXWfqraAUbNta7ZqUHlpaAjTi9jHZzMpQso
	 LIp1XtdFxkx8DeytrqN4P3mC7CYUTx2PC19TiVe1hh6g1RrrvP3ekjPiNQLvOHSiMCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=LjkpjWGo;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id BAE00606A896
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAE00606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=LjkpjWGo
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 39807FA1B3;
	Sat, 14 Nov 2026 10:16:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMO8X19lP9V1R2hK/QJuYzFCrlgW/VHC0tz8dhP2jr4=;
	b=LjkpjWGoOT9WGV/rrK5ehsavf9HbI+v976bkh4Ig5YHLpvY2PZDTtbqvTlFzpJMu7tz8yn
	NHwmj4qQlFWaTh5XBoNnmfBAfwPP6lnSRbwCot4QHNyzImbxJ/ltGhNO2p2pnxNl7zwkPx
	ow8LFsRJQD10rf7E3qHfqPZQjKCqdmi+wsHNAkLehWe6baT7PMWtLYfOBZEdZsIP9muZqz
	aKulfza1lN8mM7v2g0QlFohccpbQkzkSCt4UFGlHJHjeA2yVhST3cMD6jtIbd1CzUMZjeo
	t0yg6odFQRBvQ9Gh0s8/ptq6gilqs2fmzWmn6OUZnaYgzAhhPljdxsj/VDsmbA==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org,
	Sven Eckelmann <sven@narfation.org>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH net-next 06/15] batman-adv: hash: document key argument of hash operations
Date: Sat, 14 Nov 2026 10:15:47 +0100
Message-ID: <20261114091556.3336038-7-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114091556.3336038-1-sw@simonwunderlich.de>
References: <20261114091556.3336038-1-sw@simonwunderlich.de>
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

From: Sven Eckelmann <sven@narfation.org>

With all users converted, the data passed to batadv_hash_add(),
batadv_hash_remove() and the compare/choose callbacks is always the key
of the hash table, never a (partially initialized) element. The
kernel-doc of batadv_hash_remove() even still suggested to pass "the
structure you use with just the key filled".

Document the actual key contract.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/hash.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/batman-adv/hash.h b/net/batman-adv/hash.h
index 45a432cc15789..fca426c5e3c58 100644
--- a/net/batman-adv/hash.h
+++ b/net/batman-adv/hash.h
@@ -21,7 +21,7 @@
 /**
  * typedef batadv_hashdata_compare_cb - hash element comparison callback
  * @node: hlist node of the element currently stored in the bucket
- * @key: opaque payload to compare @node's key against
+ * @key: key to compare @node's key against
  *
  * Compare hash element by its keys.
  *
@@ -32,7 +32,7 @@ typedef bool (*batadv_hashdata_compare_cb)(const struct hlist_node *node,
 
 /**
  * typedef batadv_hashdata_choose_cb - hash bucket selection callback
- * @key: opaque payload whose key selects the bucket
+ * @key: key which selects the bucket
  * @size: number of buckets in the hash table
  *
  * Return: bucket index derived from the key in @key and the table @size.
@@ -80,7 +80,8 @@ void batadv_hash_destroy(struct batadv_hashtable *hash);
  *	@hash: storage hash table
  *	@compare: callback to determine if 2 hash elements are identical
  *	@choose: callback calculating the hash index
- *	@data: data passed to the aforementioned callbacks as argument
+ *	@data: key of the element to add (the key embedded in the element),
+ *	 passed to the aforementioned callbacks as argument
  *	@data_node: to be added element
  *
  *	Return: 0 on success, 1 if the element already is in the hash
@@ -132,10 +133,8 @@ static inline int batadv_hash_add(struct batadv_hashtable *hash,
  * @hash: hash table
  * @compare: callback to determine if 2 hash elements are identical
  * @choose: callback calculating the hash index
- * @data: data passed to the aforementioned callbacks as argument
- *
- * data could be the structure you use with just the key filled, we just need
- * the key for comparing.
+ * @data: key of the element to remove, passed to the aforementioned callbacks
+ *  as argument
  *
  * Return: returns pointer to hlist_node on success, so you can remove the used
  * structure yourself, or NULL on error
-- 
2.47.3

