Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647770;
	b=kWotzoqhdhiB8kwjtnD93b7JI5cJVmasO/nyli8+NGdsDToWnS95RbUysiXNuFYCCeXr
	 K2mIhn6LpdvhAKWyt0ih0f0lxcKr5N0gNy93GB7oh5dNK+OMEpN5t4FoXmr/cubeLg30V
	 HLFr5eE4JRBYPDIjYB2briwusNQXu3C3TwxMyNveBF4WpF2HuI9pK8Rq4rPAwGfIeBpSz
	 OzqPaGaDKu4IH44a6D0T5gCEVws2pYzFMfoVjuhc5/LANl/Z2hFa+cu3aMuyTNyq2Lxtz
	 oOkoNi9GZYoyPHq9/ftUEQXZUuYrEsGI+hSygsBshUk0yxUiCFWQP2HIFia8z6ehgvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647770;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I1AmFeLV+vRIYLKijEb73ZThGt5Z4q1iPlXzgCCWvak=;
	b=LHtn1cbJeI83w/Dn2pquRhtgoRN3uVSSIC7+ktUGZ2xx/E/oUXV8HwI18YtTmHml+Rj7
	 XuY2MIroLAGoUHgyKaPIRUR1q2FEz60OGFm8Q1xE2bOZwuAwo1SiM3pfn1T+rapnXYLLM
	 3kwi8ju3Z7QDphCQ+scrRJJZyqgWdlGPf7Y2FGjAbgG6osCUG9ryKSqQk+LGv8exG13oT
	 vguR6CrxBncdmUD8ztGWJTKEpOrDfrUE2fQPxwiASIn7R4DUSkGdsAc6OM+PUb87Y2UOf
	 iv9F0MhBtZlk04GB79I6b3Dzt22AmnrroO1TyoHRVXRS2t+/kHNe//aa00Ns2GCXZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=xDcF1+s3;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id CF108606A899
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF108606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=xDcF1+s3
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id D4770FA25D;
	Sat, 14 Nov 2026 10:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I1AmFeLV+vRIYLKijEb73ZThGt5Z4q1iPlXzgCCWvak=;
	b=xDcF1+s3P2oLaMfM2p732UW1Nfi6BCW9Q+vAyUklNfDwMoZ50w6PUU397IlAL7tipjRYFL
	+hF5uF6imTipVXOVcPT7mWmi5OEUPsKGe1tgZszhnlJQvWxgUqEfZws5aeWeWC5t8YeybW
	uz/hn7CoYHCRNxuG3Seki9CMxP8eOcPofrZ5kvufveH8KLpGQTZHi3uo/+872yP0GUfMag
	57XACPAIj+Wg0IrsKEoQnCjwJItpQOUMadq6ASqh4Q224W25usBmU5qRlvxHOhF+LxnmZT
	itV42ij7N0t4d44QQ1AL7Pcq4P4Ub8L8kVixSMmVbzX7mNuuSo4uoFcGxgKP3w==
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
Subject: [PATCH net-next 08/15] batman-adv: always consume skb in batadv_forw_packet_alloc()
Date: Sat, 14 Nov 2026 10:15:49 +0100
Message-ID: <20261114091556.3336038-9-sw@simonwunderlich.de>
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

On success, batadv_forw_packet_alloc() stores the skb in the new
forw_packet, and batadv_forw_packet_free() frees it later. On failure
(queue full or out of memory), the skb was left for the caller to free.
Whether the caller still owned the skb therefore depended on the return
value.

Free the skb inside batadv_forw_packet_alloc() on failure, so the skb is
always consumed, and drop the kfree_skb() calls from both callers.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bat_iv_ogm.c |  4 +---
 net/batman-adv/send.c       | 14 +++++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 376c0f80bcee9..5faac7419e43a 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -647,10 +647,8 @@ static bool batadv_iv_ogm_aggregate_new(const unsigned char *packet_buff,
 	queue_left = own_packet ? NULL : &bat_priv->batman_queue_left;
 	forw_packet_aggr = batadv_forw_packet_alloc(if_incoming, if_outgoing,
 						    queue_left, bat_priv, skb);
-	if (!forw_packet_aggr) {
-		kfree_skb(skb);
+	if (!forw_packet_aggr)
 		return false;
-	}
 
 	forw_packet_aggr->skb->priority = TC_PRIO_CONTROL;
 	skb_reserve(forw_packet_aggr->skb, ETH_HLEN);
diff --git a/net/batman-adv/send.c b/net/batman-adv/send.c
index 929b6dd34c107..6672f81798e91 100644
--- a/net/batman-adv/send.c
+++ b/net/batman-adv/send.c
@@ -481,6 +481,9 @@ void batadv_forw_packet_free(struct batadv_forw_packet *forw_packet,
  * (optional) if_incoming, if_outgoing and queue_left. If queue_left
  * is NULL then bat_priv is optional, too.
  *
+ * The skb is always consumed: on success, it is owned by the returned
+ * forwarding packet, on failure it is freed.
+ *
  * Return: An allocated forwarding packet on success, NULL otherwise.
  */
 struct batadv_forw_packet *
@@ -505,6 +508,7 @@ batadv_forw_packet_alloc(struct batadv_hard_iface *if_incoming,
 		batadv_dbg(BATADV_DBG_BATMAN, bat_priv,
 			   "%s queue is full\n", qname);
 
+		kfree_skb(skb);
 		return NULL;
 	}
 
@@ -532,6 +536,7 @@ batadv_forw_packet_alloc(struct batadv_hard_iface *if_incoming,
 	if (queue_left)
 		atomic_inc(queue_left);
 
+	kfree_skb(skb);
 	return NULL;
 }
 
@@ -753,13 +758,13 @@ static int batadv_forw_bcast_packet_to_list(struct batadv_priv *bat_priv,
 
 	newskb = skb_clone(skb, GFP_ATOMIC);
 	if (!newskb)
-		goto err;
+		return NETDEV_TX_BUSY;
 
 	forw_packet = batadv_forw_packet_alloc(if_in, if_out,
 					       &bat_priv->bcast_queue_left,
 					       bat_priv, newskb);
 	if (!forw_packet)
-		goto err_packet_free;
+		return NETDEV_TX_BUSY;
 
 	forw_packet->own = own_packet;
 
@@ -770,11 +775,6 @@ static int batadv_forw_bcast_packet_to_list(struct batadv_priv *bat_priv,
 
 	batadv_forw_packet_bcast_queue(bat_priv, forw_packet, send_time);
 	return NETDEV_TX_OK;
-
-err_packet_free:
-	kfree_skb(newskb);
-err:
-	return NETDEV_TX_BUSY;
 }
 
 /**
-- 
2.47.3

