Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454321;
	b=k0AWWfu5XRZDlz0sefYWu+2NF+fB7iTEcnl0mNKjbEe/ldaQVobwuVLFRbQ6mBrDFsPY
	 xUZhNTpyCBGLklcMMjTbBdvMzb3wuCpXYcKdBIgNxnkQ5V0Vu8EB0IX6uFikmcvGJtXws
	 DF0haaoTCtXZ3uyPQ4Fa9ouXjRqTuJSMkaEq7RPP4CiDcRMOiGuYQStLkopAagjzETv0Z
	 JsALhPubOBa26aekUTWoARTvUw0v5iTj09vz8R4idM5dtQ5UEarx/5TcmODm2fea6fvD1
	 HOi2Z8c58X5AiEf+Nlc956cB+/MMTngfAgN8Z0M2G635H/gP4Oa1xEqhOGSFtf0mq/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454321;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=61uMj0sUvajsGIc4hbK6/2n/ENBq0us5BtBioYyKYo4=;
	b=VlaawP6jBzfDP+OV0Cy6uHitH9vwLuuF1qDNYC2ecGfG8V2hpJZ4VnXw5CBeQeiXVVEJ
	 uIPQZ3Rv4wCS+NPNgzwVLRsB+d+KjgBnFIkpL6UnZoigyIAx6b5ardx7bgQq7WBSKTmYG
	 ekxAFRDbtOhBjer7wJHJqQIsUddElLanT/KnJSJn7s7Ge1RyBP2rwYjeTs9mAetj3larC
	 +jyzdZBxX/vCgi4OSV/vaBdHrxbMyer/lDeZ++EM0e7towk74Sk8GELLFyOS+NpIi1GVg
	 GJLfYw0QkhF6bH2e6JuNjmyTtu4Tjof4OC/qdKyF7ify3Cy3OjfVHAP90MZbroUWjoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=fSbzlS85;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 3D956606A334
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D956606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=fSbzlS85
Received: from kero.packetmixer.de (p200300c59714c2E05A704819B6bA2DB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 5D2D7FA264;
	Mon, 23 Nov 2026 18:18:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=61uMj0sUvajsGIc4hbK6/2n/ENBq0us5BtBioYyKYo4=;
	b=fSbzlS85KrQN9fPaljyZS+1AuCfu3UbGT3TvUSyCGP9qaY6ZjaIdIviO0gCFvLiase7sGl
	QGgIR4xGFLXqJ+JIxgH97bh35tLfArWdKdLCR6wB2h6pKYRNWf/h+efsb0XhWYK86dFKej
	A7Gpa/jiQeKRTEw8/uXdYwJCD10zTo6yDXEorm9TGVkq5+8DZWleXuUm0tvV//9SBoy2QT
	t/b1MTS+D/1XxrX/Atux+Hs0ffuLFflMe70Km3IhDGhlJR2E51cgLkac8T+V/sMiXjshZn
	4r4z/TSe1ZuWsHkLLDeLjqn1NcJDED9ssSiETi7kgwTyA/CLuHCrxgWAtUbizA==
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
Subject: [PATCH net-next 02/15] batman-adv: mcast: use mla_lock also during mcast_free
Date: Mon, 23 Nov 2026 18:18:14 +0100
Message-ID: <20261123171827.3294525-3-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123171827.3294525-1-sw@simonwunderlich.de>
References: <20261123171827.3294525-1-sw@simonwunderlich.de>
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

While it is technical ok to not hold the mcast.mla_lock when calling
batadv_mcast_mla_tt_retract() in batadv_mcast_free(), it is more clear to
always require the lock when calling batadv_mcast_mla_tt_retract(). This
strict + simple rule will later make it also possible to check the lock
requirements automatically via the LLVM/clang CONTEXT_ANALYSIS.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/multicast.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/batman-adv/multicast.c b/net/batman-adv/multicast.c
index 415981fe6dc6..703f61955083 100644
--- a/net/batman-adv/multicast.c
+++ b/net/batman-adv/multicast.c
@@ -2184,8 +2184,9 @@ void batadv_mcast_free(struct batadv_priv *bat_priv)
 	batadv_tvlv_handler_unregister(bat_priv, BATADV_TVLV_MCAST_TRACKER, 1);
 	batadv_tvlv_handler_unregister(bat_priv, BATADV_TVLV_MCAST, 2);
 
-	/* safely calling outside of worker, as worker was canceled above */
+	spin_lock(&bat_priv->mcast.mla_lock);
 	batadv_mcast_mla_tt_retract(bat_priv, NULL);
+	spin_unlock(&bat_priv->mcast.mla_lock);
 }
 
 /**
-- 
2.47.3

