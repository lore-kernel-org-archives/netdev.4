Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647771;
	b=w6jOM/LZV8LfYK6LzpuIjvtUYsKeF0380FHMtZgPINfcjCzP5aY/MYQbtAKvMMDQz2F/
	 GK7pg47Bi7XH/Lzwp39vShySJ40iGMaThH7OySBpyKOh8qmlbiakJy1DA+zOxmzu9cgM9
	 XC6PLr8xG0IUutYfrfEcIzRToOP4IZhL+Pw8W2uFpHcqviCdVldmqr2WT8dWxmCnUDNVO
	 7f31my3eYV+x/RgZfn7lKMQ0RRLz7LwD8+Y126UIg6pCsixwNrEbSZG/t6jsuXStTmZH+
	 gCC/9xUDOm3M14jccgad7kKtliybCw8cnVq7XNVZPJC0I+8pel3u11vTOQibNVL9WNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647771;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WYWKSH+OcUm9juSk9Bmx7b1oIobikB6gENpthM5hQpM=;
	b=UlRTAqftUUjREl5AGi7pQeQ5FNwxjtul3alRaPaZlxCgRmXCSrDhkHSQTzbgp5z6MlOW
	 xdrWmS7473oPwBJDhTy5Dljd4GJ6fXIRi/UOm8O746ukgFhlbOgUpJ7R77ax956VfzTOA
	 3Hrg9BsvvUSpSyFcI7b4SDu00H12eaTHAoGt9DKrPktrDXIAnww29W7q6xNE7PTz4RRW+
	 SK3SlSZ9sfVg/K2hUxXzGq2ssr/VXEktg+MiVRmpDj6cvDW5gBk1Pyi67l8WuLn0dJPuB
	 kpZ4IHn5y5ePmBaECzBMyxBueMfyBKUajEFaxEDxJjXESDAl7BLS4QUs0aI7PgqhN+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=W0oUDiZq;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4C833606A8BC
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C833606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=W0oUDiZq
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 710BEFA261;
	Sat, 14 Nov 2026 10:16:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYWKSH+OcUm9juSk9Bmx7b1oIobikB6gENpthM5hQpM=;
	b=W0oUDiZqo6BEHLvYRUtshJWICsJ46J206CINn1TnYaRCplbUq9H65CNNoA/bsxTRNakZC7
	PK8ousgfFp6cTJPQ+3a9zG+HCX90WcpDoAmyCFdGsjwPClSFhoWEIpQ7YwfmNpjelZfQfT
	BEQKw8KpXzhH52AEPdnxwR5Avzv9tcJEpjF/tEv1LXITQduhhj+Pmqyjcu+iW4L1tPRSYJ
	mJH958CNCQk7W+IcS/w5B2fRlH6EdExmwpheQXrUzBzKKS+A3rHg/6eRCPaAH1pFeYNGPU
	s5WNwzz9G5tBThBgUPzwDDepT8jYZHwBYR8zNUFFNbfKI+jv1p5Hind4CwfXiA==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org,
	Sven Eckelmann <sven@narfation.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH net-next 11/15] batman-adv: tt: increase hash generation when purging clients
Date: Sat, 14 Nov 2026 10:15:52 +0100
Message-ID: <20261114091556.3336038-12-sw@simonwunderlich.de>
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

If batadv_tt_local_dump() is preempted during a netlink dump and resumes in
the middle of a hash bucket while batadv_tt_local_purge_pending_clients()
concurrently removes an entry, the dump offset will be shifted.

Without incrementing the hash generation counter, netlink won't set
NLM_F_DUMP_INTR and the userspace will not be informed by the inconsistent
dump..

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261008-tt-avoid-unhashed-event-v2-0-7c4eed81606d@narfation.org?part=6
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 926b4a3214196..3ce5569a8872f 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -4454,6 +4454,7 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 					   batadv_print_vid(tt_common->key.vid));
 
 				hlist_del_rcu(&tt_common->hash_entry);
+				atomic_inc(&hash->generation);
 
 				/* An entry which still carries BATADV_TT_CLIENT_NEW was
 				 * never counted and must not be uncounted here.
-- 
2.47.3

