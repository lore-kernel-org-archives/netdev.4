Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647771;
	b=pebBMcI+yEdljSdMf89ZGVXp7rTErxybTcMahUE+z80f/mlZ/pANTyNdcpsB5FOdK8n1
	 w2Uyr6NfqjI3BVJYi66/L8fQ70/s80S+9ESErFaeqRs4APB5vbtaho44PfSo2dGxXSst4
	 cF6jP0MEHzL+OORElq9fuw/v0anX3IQgkkiC1HHDYAqcJfCluB3KoXZqXvPMSgiW3RKLI
	 FffMIYHAvQqbRPXANqqLecpTVrLwabr5kYSuvjDC0bxYxMP3kj6nQnNJCt0AOSlNvSaqF
	 1e2S2sVFrEAlbI8yNlbbNo0oXM2/GyoYwPPiY8E79piSAnDtUUqSk8rO7Yznb2hOQSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647771;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xvIcDMAQnNo4cjaKk9GQgRcmYUx/Puq3ObBx6E8mdQw=;
	b=s1gY0pU+N+PL05kamvIDzTUgjNuLsitUsh7zxHaBMFRjj0RguCmjL8XxkCDlFE5lv3eI
	 ynfpY1p8w8nZ6l/YgxEpaCauJkRpKiE+nk2cOewo1xkKJQama7v8hFT0QNVVrbrI8fMuH
	 mdyma7RwzUEWabMsWdym+neonuLal8APhPtjpFXLB5TKeWP4WPXy2cDkArojuZKdVDdv3
	 G9xf5QiutOfFWCw/QlcOAam/knkAU47d8KeAYNj5OdhkFqBfjAv73nOeo2lCVS827qTjH
	 m+kvHBoA1kRBrGRJQnpzFCjVlfq5dxjBY0+mvFg+u8QoPcrl2ACqv/Wv0Bt/gOelHFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=DRObJkyw;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B9E44606A895
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E44606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=DRObJkyw
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 2AE85FA1B6;
	Sat, 14 Nov 2026 10:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvIcDMAQnNo4cjaKk9GQgRcmYUx/Puq3ObBx6E8mdQw=;
	b=DRObJkywjdJSDPfbE/WivGAuVyPKuc8TxVUTdN2XuL+WeQYya3QHQyWtTPigN0jft3ca5U
	maPkzeysldlMEqwN80uAN4/KdvE0flK2i5gfjqK49xhZTymzwpDNATzkqHW3oaygxNfhZI
	9uqIwUSNLa1hKlhiQRKgawjdR3Lek6m1Sr3AF6m4SHbywFaBK1WJ+hkx2YLHABcH4Plf6a
	NKP5HpRbJBkhuje7NWWCnGYSgxUoiLsZxD4DoYrvsIuyxjjINjULGVMzcxsU4fBz14seHN
	h+US2l2NcHeev9ha3PIUmKY5UC0aGWY8BHELvn7SdWLWkFC4OVCFrj/SjAMO4w==
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
Subject: [PATCH net-next 07/15] batman-adv: never consume skb in BLA rx and DAT incoming snooping
Date: Sat, 14 Nov 2026 10:15:48 +0100
Message-ID: <20261114091556.3336038-8-sw@simonwunderlich.de>
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

batadv_bla_tx() and the outgoing DAT snooping functions return true when
the caller has to drop the skb, and they never free it themselves.
batadv_bla_rx(), batadv_dat_snoop_incoming_arp_request() and
batadv_dat_snoop_incoming_arp_reply() look the same, but they freed the skb
themselves when returning true, and only then.

So callers had to know, for each function, whether "true" meant "already
freed" or "free it now". batadv_bla_rx() and batadv_bla_tx() even had the
same kerneldoc text.

Make all of them only borrow the skb, and let the callers free it when
true is returned.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bridge_loop_avoidance.c | 13 ++++++-------
 net/batman-adv/distributed-arp-table.c | 10 +++++-----
 net/batman-adv/mesh-interface.c        |  6 ++----
 net/batman-adv/routing.c               | 16 +++++++++-------
 4 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/net/batman-adv/bridge_loop_avoidance.c b/net/batman-adv/bridge_loop_avoidance.c
index cc7a98fbc3d2a..9be452f667250 100644
--- a/net/batman-adv/bridge_loop_avoidance.c
+++ b/net/batman-adv/bridge_loop_avoidance.c
@@ -1952,10 +1952,10 @@ batadv_bla_loopdetect_check(struct batadv_priv *bat_priv, struct sk_buff *skb,
  *  * we have to race for a claim
  *  * if the frame is allowed on the LAN
  *
- * In these cases, the skb is further handled by this function
+ * The skb is never consumed by this function.
  *
- * Return: true if handled, otherwise it returns false and the caller shall
- * further process the skb.
+ * Return: true if the skb has to be dropped, otherwise it returns false and the
+ * caller shall further process the skb.
  */
 bool batadv_bla_rx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 		   unsigned short vid, int packet_type)
@@ -2066,7 +2066,6 @@ bool batadv_bla_rx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 	goto out;
 
 handled:
-	kfree_skb(skb);
 	ret = true;
 
 out:
@@ -2085,15 +2084,15 @@ bool batadv_bla_rx(struct batadv_priv *bat_priv, struct sk_buff *skb,
  *  * a claim was received which has to be processed
  *  * the frame is allowed on the mesh
  *
- * in these cases, the skb is further handled by this function.
+ * The skb is never consumed by this function.
  *
  * Warning: This function may reallocate the skb data buffer via
  * batadv_bla_process_claim()/... Any pointer into the skb data (e.g.
  * obtained from skb->data or eth_hdr()) before this call must be considered
  * invalid afterwards and has to be reacquired.
  *
- * Return: true if handled, otherwise it returns false and the caller shall
- * further process the skb.
+ * Return: true if the skb has to be dropped, otherwise it returns false and the
+ * caller shall further process the skb.
  */
 bool batadv_bla_tx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 		   unsigned short vid)
diff --git a/net/batman-adv/distributed-arp-table.c b/net/batman-adv/distributed-arp-table.c
index 204d48a8257ae..37de9787104d5 100644
--- a/net/batman-adv/distributed-arp-table.c
+++ b/net/batman-adv/distributed-arp-table.c
@@ -1337,6 +1337,8 @@ bool batadv_dat_snoop_outgoing_arp_request(struct batadv_priv *bat_priv,
  * from skb->data or eth_hdr()) before this call must be considered
  * invalid afterwards and has to be reacquired.
  *
+ * The skb is never consumed by this function.
+ *
  * Return: true if the request has been answered, false otherwise.
  */
 bool batadv_dat_snoop_incoming_arp_request(struct batadv_priv *bat_priv,
@@ -1396,8 +1398,6 @@ bool batadv_dat_snoop_incoming_arp_request(struct batadv_priv *bat_priv,
 	}
 out:
 	batadv_dat_entry_put(dat_entry);
-	if (ret)
-		kfree_skb(skb);
 	return ret;
 }
 
@@ -1466,7 +1466,9 @@ void batadv_dat_snoop_outgoing_arp_reply(struct batadv_priv *bat_priv,
  * from skb->data or eth_hdr()) before this call must be considered
  * invalid afterwards and has to be reacquired.
  *
- * Return: true if the packet was snooped and consumed by DAT. False if the
+ * The skb is never consumed by this function.
+ *
+ * Return: true if the packet was snooped and has to be dropped. False if the
  * packet has to be delivered to the interface
  */
 bool batadv_dat_snoop_incoming_arp_reply(struct batadv_priv *bat_priv,
@@ -1556,8 +1558,6 @@ bool batadv_dat_snoop_incoming_arp_reply(struct batadv_priv *bat_priv,
 	 */
 	dropped |= batadv_is_my_client(bat_priv, hw_src, vid);
 out:
-	if (dropped)
-		kfree_skb(skb);
 	batadv_dat_entry_put(dat_entry);
 	/* if dropped == false -> deliver to the interface */
 	return dropped;
diff --git a/net/batman-adv/mesh-interface.c b/net/batman-adv/mesh-interface.c
index 16b681e10b33d..cde49b8d6bb8e 100644
--- a/net/batman-adv/mesh-interface.c
+++ b/net/batman-adv/mesh-interface.c
@@ -522,7 +522,7 @@ void batadv_interface_rx(struct net_device *mesh_iface,
 	 * not handle it, we can safely push it up.
 	 */
 	if (batadv_bla_rx(bat_priv, skb, vid, packet_type))
-		goto out;
+		goto dropped;
 
 	if (orig_node)
 		batadv_tt_add_temporary_global_entry(bat_priv, orig_node,
@@ -547,12 +547,10 @@ void batadv_interface_rx(struct net_device *mesh_iface,
 	}
 
 	netif_rx(skb);
-	goto out;
+	return;
 
 dropped:
 	kfree_skb(skb);
-out:
-	return;
 }
 
 /**
diff --git a/net/batman-adv/routing.c b/net/batman-adv/routing.c
index e2951bf047024..ca71e29a9ad33 100644
--- a/net/batman-adv/routing.c
+++ b/net/batman-adv/routing.c
@@ -1109,11 +1109,12 @@ int batadv_recv_unicast_packet(struct sk_buff *skb,
 		}
 
 		if (batadv_dat_snoop_incoming_arp_request(bat_priv, skb,
-							  hdr_size))
-			goto rx_success;
-		if (batadv_dat_snoop_incoming_arp_reply(bat_priv, skb,
-							hdr_size))
+							  hdr_size) ||
+		    batadv_dat_snoop_incoming_arp_reply(bat_priv, skb,
+							hdr_size)) {
+			kfree_skb(skb);
 			goto rx_success;
+		}
 
 		batadv_dat_snoop_incoming_dhcp_ack(bat_priv, skb, hdr_size);
 
@@ -1351,10 +1352,11 @@ int batadv_recv_bcast_packet(struct sk_buff *skb,
 	if (batadv_bla_is_backbone_gw(skb, orig_node, hdr_size))
 		goto free_skb;
 
-	if (batadv_dat_snoop_incoming_arp_request(bat_priv, skb, hdr_size))
-		goto rx_success;
-	if (batadv_dat_snoop_incoming_arp_reply(bat_priv, skb, hdr_size))
+	if (batadv_dat_snoop_incoming_arp_request(bat_priv, skb, hdr_size) ||
+	    batadv_dat_snoop_incoming_arp_reply(bat_priv, skb, hdr_size)) {
+		kfree_skb(skb);
 		goto rx_success;
+	}
 
 	batadv_dat_snoop_incoming_dhcp_ack(bat_priv, skb, hdr_size);
 
-- 
2.47.3

