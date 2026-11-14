Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647772;
	b=tOKbClVX+YUBjaRfimPBwmwFOwlKC83W2bJVqa5PDfczDsRl78Qd59J/Kxlw7AVv9wdL
	 TCu13DqNpir+0eL9h6wPhLpeqCY9OcZhPVaBJdZfvTXjmWRGrA5RSRe3PbjL1jJ+pRJrP
	 z11m+5OmdsGcsJigbAIfBKRQxmqnfq44jgB0AvzE5FeGjxwhlT9yySRgCLzu1wAw3OnjY
	 Wbmn4/NqbDaFK5DPAGBdet9h7EbYYxkmxSlSRCbbs+yZhF8pPRPqRRogNBFMwWqHeA0dD
	 F4KryjMHAuD6ZMey0YoXtdl0Z80D54GNsFVwkpj9LVB8xa+J+TkxreUBAdjYfpc4QsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647772;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U5fF9MUWlYEidvMrUipn+m0KX6+5jNKy7QbVVTr97kU=;
	b=aVIvGji3OyS4Kq0L+6c2hPfN3VDi/Hx88XCJLfchWFWEEFa+61IBMBNnTPjMlD4BEU/h
	 NhkO07PyQ6Uh8pbEO/PYGMeaWIUc8U6g+LqkLac0RNZXzQlmCWrKg8bzFvJWGGs/nrZPS
	 Por0HfCsLLiBskt+wqL+1MfUxEKxUmse3ZhmsKStd/yBpsJIkRv/EWbvoo/8JXP0Z0bGx
	 nr6Q7N/ctnHLOLAvf1a+CQWNiPqVLA9ESS2Xe7SHHq3mZ4c6wYLWGnNm0YA0aid/1nyI5
	 t5tZN5u2b/Jp9Hk12ld52GWGDSjHNdO40OzBN7QrIBcEXp7XugEl6AAgVT41SdIh2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=SBFTKvKJ;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 38DD460A2626
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DD460A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=SBFTKvKJ
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 40C39FA264;
	Sat, 14 Nov 2026 10:16:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5fF9MUWlYEidvMrUipn+m0KX6+5jNKy7QbVVTr97kU=;
	b=SBFTKvKJEJ9sAY6KwlNMwsCIF8eAVQxAspWqwA7jcyo6x+MqCtmP83bD9Tmu6xy4I77l05
	LJeZINU8ZN6aNv0lBZodSw1xEgrj0QhOuFl+GV/lRyiy/ynOgrtpztM/lWZNSWaQDM/5eF
	Y7hGYHjucxKVsVBtTnY80Yqxn78bmRSWnRErhSvw80hVa6im+sUd1bzvmpi/vKv+DHPDyY
	nc1UZF5bsKZbkuKTHU+rGadSTZq7SauOboOczUealn+AxPf9XQWzYxdT7Z+JJs0giQ8TkW
	K+014a8fzuCySs9eJZ+B+JtvkcNurOEoYxsuDt0fSa4weHQF8HxaI45Le8GX4w==
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
Subject: [PATCH net-next 13/15] batman-adv: bla: increase hash generation when purging entries
Date: Sat, 14 Nov 2026 10:15:54 +0100
Message-ID: <20261114091556.3336038-14-sw@simonwunderlich.de>
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

If batadv_bla_claim_dump() or batadv_bla_backbone_dump() is preempted
during a netlink dump and resumes in the middle of a hash bucket while
batadv_bla_del_backbone_claims() or batadv_bla_purge_backbone_gw()
concurrently removes an entry, the dump offset will be shifted.

Without incrementing the hash generation counter, netlink won't set
NLM_F_DUMP_INTR and the userspace will not be informed about the
inconsistent dump.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-83da443f-ce69-4393-a29f-e02b70d1ec96
Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bridge_loop_avoidance.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/batman-adv/bridge_loop_avoidance.c b/net/batman-adv/bridge_loop_avoidance.c
index 9be452f667250..ba410dca1c89c 100644
--- a/net/batman-adv/bridge_loop_avoidance.c
+++ b/net/batman-adv/bridge_loop_avoidance.c
@@ -319,6 +319,7 @@ batadv_bla_del_backbone_claims(struct batadv_bla_backbone_gw *backbone_gw)
 				continue;
 
 			hlist_del_rcu(&claim->hash_entry);
+			atomic_inc(&hash->generation);
 			batadv_claim_put(claim);
 		}
 		spin_unlock_bh(list_lock);
@@ -1286,6 +1287,7 @@ static void batadv_bla_purge_backbone_gw(struct batadv_priv *bat_priv, int now)
 				batadv_bla_del_backbone_claims(backbone_gw);
 
 				hlist_del_rcu(&backbone_gw->hash_entry);
+				atomic_inc(&hash->generation);
 				break;
 			}
 			spin_unlock_bh(list_lock);
-- 
2.47.3

