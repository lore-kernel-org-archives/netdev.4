Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647773;
	b=1UC9pLtUauQtY/3t8xMaqrko23hMLageIA8iaVocYTzdB2oR65O7h8qxOv6PZmhtrM2f
	 zjQytYkwegt6ksgSQaQJeeV7ntSV+7eSobQhzyl+Zmku0sSmTASXixXa7Cc5ZRwDNUdhi
	 KDE1bp0n+0eNA3pjhonyDidWVufUqVuw+sn0L14zZ3qIjlGfxu84fss8bV9tU9n0caHKl
	 3Gm5XU1q1fa8O5WiQopQXnvxd1bQqLEdhHGUwZbuK8NPo75a8GTHoYXnYHekT+yPwHaVC
	 l5orMsFpkCm+uavOVVuezQyCVTwe3ATQMNX9IP8WRnMoibxljObbuBD5t++gjNXHgQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647773;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vfa0AsOKduV86UNfepDSvCQLv6EBZg4lBd1rkjOjpf8=;
	b=TLYHyq09K8LrbkoN9rS3eQmrlM4n+8t3NuIox2NGbppQlhyD+pc90uNMLXLHoKXtmZqU
	 WGEOZ0ljPAwk0oLLxgSpSyTXF86zBCrNcmkjAi0YLYJsoPr02VyUB2rB1nepg0xrnuNUM
	 d5t7fuWTeFqZKEkQGiMwNHjg+Jf4YupvWpnsxX7T1YeYIV8bbiWwr4X5h8rjiVlG3bt/c
	 aSQK/FkQGVH3gX0G/gV8VVrFJcLbpFXlWeB1SegPVWb2JkGAUBZEq5AZvNNramG5scC4g
	 PxS+10Jv7EdHt1Bt8UNHOPZxes5h6wknMR/xuMza1jB368DgICg/lwgTBf+jEiXpFRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=Blcz3VYM;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 1679C60A2634
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1679C60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=Blcz3VYM
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 3B648FA265;
	Sat, 14 Nov 2026 10:16:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfa0AsOKduV86UNfepDSvCQLv6EBZg4lBd1rkjOjpf8=;
	b=Blcz3VYMkICeQxeKnZl7JUVCGUCK9tBEdRd8cz5dsOggZwzkQGpFl0JiCUcnxJgLa/EhCg
	VkDWjS3EYtH41zDMKW/BpcXBOZQPrylYPdWju9dy2B71KB2YDIFV/rLQYMp3SN3xPlgUmU
	TjTP1fhbMgsLS2iUnZX8kIJxV62QbZq7y/UY7YSfde+7+NQlL9qP49dDTlNmPCounuL6hU
	dLZXYvze5Z1bk8qYHpyEQ51Sr+RV/qrIWeLW4oj9mwxb/cLVcpJSLUiJFWxWApYOrO+Bi1
	L+l6iI2w5RTqSCOle8/Yh3OI3LcKIMUBzC1sEwEygt2i+nAbglhNbdjPsZrS1g==
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
Subject: [PATCH net-next 14/15] batman-adv: increase orig hash generation when purging originators
Date: Sat, 14 Nov 2026 10:15:55 +0100
Message-ID: <20261114091556.3336038-15-sw@simonwunderlich.de>
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

If batadv_mcast_flags_dump() is preempted during a netlink dump and resumes
in the middle of a hash bucket while batadv_purge_orig_ref() concurrently
removes an originator, the dump offset will be shifted.

Without incrementing the hash generation counter, netlink won't set
NLM_F_DUMP_INTR and the userspace will not be informed about the
inconsistent dump.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-83da443f-ce69-4393-a29f-e02b70d1ec96
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/originator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/batman-adv/originator.c b/net/batman-adv/originator.c
index 391d97bc938b9..f85ad961f8a9b 100644
--- a/net/batman-adv/originator.c
+++ b/net/batman-adv/originator.c
@@ -7,6 +7,7 @@
 #include "originator.h"
 #include "main.h"
 
+#include <linux/atomic.h>
 #include <linux/container_of.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -1290,6 +1291,7 @@ void batadv_purge_orig_ref(struct batadv_priv *bat_priv)
 			if (batadv_purge_orig_node(bat_priv, orig_node)) {
 				batadv_gw_node_delete(bat_priv, orig_node);
 				hlist_del_rcu(&orig_node->hash_entry);
+				atomic_inc(&hash->generation);
 				batadv_tt_global_del_orig(orig_node->bat_priv,
 							  orig_node, -1,
 							  "originator timed out");
-- 
2.47.3

