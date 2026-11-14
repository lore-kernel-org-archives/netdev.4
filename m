Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647771;
	b=M5q6cxJIM7z//wrg2LXW++2ceroWIoAmOo1tErjj+sijSPoTizPuu1YwCLDBFL3SqSWz
	 bwrs+GN07ZC9yEk+AuQyvrALhwQItUBZPSB7uXQ9Vwu6ArxDCm0UmMSrX1Apclxmtc7WT
	 WKhm88e2hfsiVnuwin2Tu8Qbo2L1sX3oPwXo1g/yII4cOJ4VixSQ/qud1/QJCXAq5iDQl
	 CLtMfdt+lKwrxN2n2KNPR16mxKC7163LUuXz+7ESc7F521f7u25L6nbzjz06ihSSwyZuc
	 64dTciOOQxynw3Fl1G8htPCi7u53TpdBDvpi+izW+WujTBKPNH0AKzMGwUR9N3MZY5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647771;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HvrsAJYHVGH/RliNVC/cO2F1T1fBiKCBgVjk9ZSBZDs=;
	b=OANGTVCIUJP+b4xP5RMqgjpePIt+RnaiXGh4TUfGvwqI4otdeoo/vDd8AoZvGJUuf8h/
	 m/EyuLZ05JZid+PrO4g46aSDcVqhhdaeh+0tHrnISycvu3sEyaieLWC8I2phsBCSw4Mih
	 mu9n5dAh2Rm/KnT4XTAU0Eyhp4Fvc5OqFbmbmIvDx4RZkiv602csT6XLByqDmjjbUy+GD
	 45JOhluJpJIyjqkDc5QZu8XrJ8lEZv+Sm8/dRwf0aZz/dlup/TWpy6Yr1FzfzLYjw7r1B
	 uF+QNVop1UVBhsUTsoPvGFZrEXmGqvKFeFfNEzTdm04f1cDRq+IzLSIpPk/Gyc5GKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=JsotrbVt;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 8FCB1606A8A7
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCB1606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=JsotrbVt
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id C25DEFA25F;
	Sat, 14 Nov 2026 10:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvrsAJYHVGH/RliNVC/cO2F1T1fBiKCBgVjk9ZSBZDs=;
	b=JsotrbVtBa+FTinBs9K63Lj9oL8T5s7ipj1vpk3Y6jrE6yzBtAhWD/0uIH2kub2qio5uht
	6Vwr3Qx+5cKSQ6l/Ly5Fb3JHjFaIQALODS5BDs85CjNWk6uIFhq5EMXz0jX1ym8dRomZxK
	oyZ8QnciOMf47wIJAPkEpETkLrDkgPf/JLaTLubd/e16iVttNuDuMgBgIPfZPuE4zyviao
	Wc+t3MAL92u7+qCndkFVtzn+w5KffypOiJ8EUNta0yrz+ShEvT6xcR9nVob0x5oPly8vUh
	BY/CVsx/35ABCZ4AAZowa3/+IR6300XHzVgb8G1VAa1Fj5LALBaoDTMdwaMOeA==
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
Subject: [PATCH net-next 09/15] batman-adv: split fragment forwarding into lookup and forward
Date: Sat, 14 Nov 2026 10:15:50 +0100
Message-ID: <20261114091556.3336038-10-sw@simonwunderlich.de>
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

batadv_frag_skb_fwd() consumed the skb only when it returned true, and
passed the receive result back through an out-parameter that was only
valid in that case.

To ensure that the forwarding functions either borrow or consume the skb,
split it into:

* batadv_frag_fwd_neigh_get(): borrows the skb and returns the next-hop
  (with a reference) when the merged packet would exceed its MTU
* batadv_frag_skb_fwd(): always consumes the skb and returns
  NET_RX_SUCCESS or NET_RX_DROP (instead of using the out-parameter
  "rx_result")

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/fragmentation.c | 99 ++++++++++++++++++----------------
 net/batman-adv/fragmentation.h |  9 ++--
 net/batman-adv/routing.c       | 15 ++++--
 3 files changed, 69 insertions(+), 54 deletions(-)

diff --git a/net/batman-adv/fragmentation.c b/net/batman-adv/fragmentation.c
index 493af3091aa8a..9025d5f651464 100644
--- a/net/batman-adv/fragmentation.c
+++ b/net/batman-adv/fragmentation.c
@@ -385,70 +385,79 @@ bool batadv_frag_skb_buffer(struct sk_buff **skb,
 }
 
 /**
- * batadv_frag_skb_fwd() - forward fragments that would exceed MTU when merged
- * @skb: skb to forward
+ * batadv_frag_fwd_neigh_get() - get next-hop for fragments that would exceed
+ *  MTU when merged
+ * @skb: received fragment
  * @recv_if: interface that the skb is received on
- * @orig_node_src: originator that the skb is received from
- * @rx_result: set to NET_RX_SUCCESS when the fragment was forwarded and
- *  NET_RX_DROP when it was dropped; only valid when true is returned
  *
  * Look up the next-hop of the fragments payload and check if the merged packet
- * will exceed the MTU towards the next-hop. If so, the fragment is forwarded
- * without merging it.
+ * will exceed the MTU towards the next-hop.
  *
- * Return: true if the fragment is consumed/forwarded, false otherwise.
+ * Return: the next-hop neighbor (with increased refcounter) when the fragment
+ * has to be forwarded without merging it, NULL otherwise
  */
-bool batadv_frag_skb_fwd(struct sk_buff *skb,
-			 struct batadv_hard_iface *recv_if,
-			 struct batadv_orig_node *orig_node_src,
-			 int *rx_result)
+struct batadv_neigh_node *
+batadv_frag_fwd_neigh_get(const struct sk_buff *skb,
+			  struct batadv_hard_iface *recv_if)
 {
 	struct batadv_priv *bat_priv = netdev_priv(recv_if->mesh_iface);
-	struct batadv_neigh_node *neigh_node = NULL;
-	struct batadv_frag_packet *packet;
-	bool ret = false;
+	const struct batadv_frag_packet *packet;
+	struct batadv_neigh_node *neigh_node;
 	u16 total_size;
 
-	packet = (struct batadv_frag_packet *)skb->data;
+	packet = (const struct batadv_frag_packet *)skb->data;
 
 	neigh_node = batadv_orig_to_router(bat_priv, packet->dest, recv_if);
 	if (!neigh_node)
-		goto out;
+		return NULL;
 
-	/* Forward the fragment, if the merged packet would be too big to
-	 * be assembled.
-	 */
 	total_size = ntohs(packet->total_size);
-	if (total_size > neigh_node->if_incoming->net_dev->mtu) {
-		if (packet->ttl < 2) {
-			kfree_skb(skb);
-			*rx_result = NET_RX_DROP;
-			ret = true;
-			goto out;
-		}
+	if (total_size <= neigh_node->if_incoming->net_dev->mtu) {
+		batadv_neigh_node_put(neigh_node);
+		return NULL;
+	}
 
-		if (skb_cow(skb, ETH_HLEN) < 0) {
-			kfree_skb(skb);
-			*rx_result = NET_RX_DROP;
-			ret = true;
-			goto out;
-		}
+	return neigh_node;
+}
+
+/**
+ * batadv_frag_skb_fwd() - forward fragment without merging it
+ * @bat_priv: the bat priv with all the mesh interface information
+ * @skb: skb to forward
+ * @neigh_node: next-hop to forward the fragment to
+ *
+ * The skb is always consumed by this function.
+ *
+ * Return: NET_RX_SUCCESS when the fragment was forwarded and NET_RX_DROP when
+ * it was dropped
+ */
+int batadv_frag_skb_fwd(struct batadv_priv *bat_priv, struct sk_buff *skb,
+			struct batadv_neigh_node *neigh_node)
+{
+	struct batadv_frag_packet *packet;
 
-		packet = (struct batadv_frag_packet *)skb->data;
+	packet = (struct batadv_frag_packet *)skb->data;
 
-		batadv_inc_counter(bat_priv, BATADV_CNT_FRAG_FWD);
-		batadv_add_counter(bat_priv, BATADV_CNT_FRAG_FWD_BYTES,
-				   skb->len + ETH_HLEN);
+	if (packet->ttl < 2)
+		goto free_skb;
 
-		packet->ttl--;
-		batadv_send_unicast_skb(skb, neigh_node);
-		*rx_result = NET_RX_SUCCESS;
-		ret = true;
-	}
+	if (skb_cow(skb, ETH_HLEN) < 0)
+		goto free_skb;
 
-out:
-	batadv_neigh_node_put(neigh_node);
-	return ret;
+	packet = (struct batadv_frag_packet *)skb->data;
+
+	batadv_inc_counter(bat_priv, BATADV_CNT_FRAG_FWD);
+	batadv_add_counter(bat_priv, BATADV_CNT_FRAG_FWD_BYTES,
+			   skb->len + ETH_HLEN);
+
+	packet->ttl--;
+	batadv_send_unicast_skb(skb, neigh_node);
+
+	return NET_RX_SUCCESS;
+
+free_skb:
+	kfree_skb(skb);
+	return NET_RX_DROP;
 }
 
 /**
diff --git a/net/batman-adv/fragmentation.h b/net/batman-adv/fragmentation.h
index 51e281027ab63..3c98a4f82286e 100644
--- a/net/batman-adv/fragmentation.h
+++ b/net/batman-adv/fragmentation.h
@@ -17,10 +17,11 @@
 
 void batadv_frag_purge_orig(struct batadv_orig_node *orig,
 			    bool (*check_cb)(struct batadv_frag_table_entry *));
-bool batadv_frag_skb_fwd(struct sk_buff *skb,
-			 struct batadv_hard_iface *recv_if,
-			 struct batadv_orig_node *orig_node_src,
-			 int *rx_result);
+struct batadv_neigh_node * __must_check
+batadv_frag_fwd_neigh_get(const struct sk_buff *skb,
+			  struct batadv_hard_iface *recv_if);
+int batadv_frag_skb_fwd(struct batadv_priv *bat_priv, struct sk_buff *skb,
+			struct batadv_neigh_node *neigh_node);
 bool batadv_frag_skb_buffer(struct sk_buff **skb,
 			    struct batadv_orig_node *orig_node);
 int batadv_frag_send_packet(struct sk_buff *skb,
diff --git a/net/batman-adv/routing.c b/net/batman-adv/routing.c
index ca71e29a9ad33..d5772429535e9 100644
--- a/net/batman-adv/routing.c
+++ b/net/batman-adv/routing.c
@@ -1206,6 +1206,7 @@ int batadv_recv_frag_packet(struct sk_buff *skb,
 	struct batadv_priv *bat_priv = netdev_priv(recv_if->mesh_iface);
 	struct batadv_orig_node *orig_node_src = NULL;
 	struct batadv_frag_packet *frag_packet;
+	struct batadv_neigh_node *neigh_node;
 	int ret = NET_RX_DROP;
 
 	if (batadv_check_unicast_packet(bat_priv, skb,
@@ -1220,11 +1221,15 @@ int batadv_recv_frag_packet(struct sk_buff *skb,
 	skb->priority = frag_packet->priority + 256;
 
 	/* Route the fragment if it is not for us and too big to be merged. */
-	if (!batadv_is_my_mac(bat_priv, frag_packet->dest) &&
-	    batadv_frag_skb_fwd(skb, recv_if, orig_node_src, &ret)) {
-		/* skb was consumed */
-		skb = NULL;
-		goto put_orig_node;
+	if (!batadv_is_my_mac(bat_priv, frag_packet->dest)) {
+		neigh_node = batadv_frag_fwd_neigh_get(skb, recv_if);
+		if (neigh_node) {
+			ret = batadv_frag_skb_fwd(bat_priv, skb, neigh_node);
+			batadv_neigh_node_put(neigh_node);
+			/* skb was consumed */
+			skb = NULL;
+			goto put_orig_node;
+		}
 	}
 
 	batadv_inc_counter(bat_priv, BATADV_CNT_FRAG_RX);
-- 
2.47.3

