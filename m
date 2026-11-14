Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647771;
	b=DxHAqtmgVnFooLWqSljImnOEJE82LOeRQwVSeMPAPH7jgzWWycMQCJV73nxtoX02xq2a
	 AnSxspTI9IElTSYWNg3N3DsSHv42s7CbV5zpfcVGWi59gfrjqa8nBxpre3F+2ueps8xIX
	 grgyVuSnSym5hUmvPt9Xh36DkluhYdlBMRFuGEaUKN6F28P8aC007cRf7pMjxpTErpnR7
	 4/ZyXjMqghZMW9ZQ7K4KMJND7jq3ty1vmokKptheS/+1d4Ctg6pgZIXzAdQKQfLfRufwa
	 wW0Wf3uRREpWQTjND3drawD20lhGBEHNAyYtR7ng/NfMHSZpXPo/oJ+v2Ae70ZB+vVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647771;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wmZwJtte7nN5ISs0EOLLPKSeOakG+0DgYFGlBVu/uOA=;
	b=ZBgXNd9REWniwpeyiUtS8fd9oP1+o4wXsrmDLjUIDWbhdRN4+/OKfMshB/g5jWiBLMug
	 FWTYyLuPIFwd6z2ppPtRkXsMf0UXhRTJafDXyP4OgrRa1omF+X22GQHuqcLriLhV1gJO9
	 K55BqChKBXi7jxT4z1xUJI/+1p1efX69IOzIOfD7opYX43CH2q27SaLfwutjdopPv9bpo
	 peNdehROdL70PIkqa7Cw7byXjhF5nAOMNuvRAj9pOZ+TRQSsNwzMsaN37Zt5x3CYNQHUQ
	 Z84oMKQfDIgqlGXt0N0Ri+W/uwKFecOTf1H5iNXYOFe9zK0HgZUlvZTSYrpyPedRMHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=I5KeVkSM;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9360D606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9360D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=I5KeVkSM
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 9C1F3FA260;
	Sat, 14 Nov 2026 10:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmZwJtte7nN5ISs0EOLLPKSeOakG+0DgYFGlBVu/uOA=;
	b=I5KeVkSMNm+SqQ19p5Tx2TpNMOPn3lJEOCAGX4z0fC/gnGokHbVJzz+CNVG3oQG2FuCwOS
	jHYCAAppx2hqSU1qdOCKOQ2peqyN7oA68YChQSzIWYo2ulg1mKCT1w2CTs62XMltx2cAvZ
	UAbyJC/DFDf7X3nr7XScBbUblX7sX72EC7HdkqFQQCGdvhwARIcvTN6o8+IgRzZ6Ay9iQo
	u9E3/VPYnYwI64IdqnBc6az4+EHsXrVocBuLj2vKWdesoUgYzCExCFgoDSWFwRn4Utxv+Z
	fL+/uVI5Gobd4I1aNOLuiV0ReXcUrH2xGrqWsVS3bMshfQ1GtoOcbejz/9VXlg==
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
Subject: [PATCH net-next 10/15] batman-adv: document skb ownership of always-consuming functions
Date: Sat, 14 Nov 2026 10:15:51 +0100
Message-ID: <20261114091556.3336038-11-sw@simonwunderlich.de>
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

Several functions always consume the skb they are given, but their
kernel-doc did not say so. Add an explicit "The skb is always consumed by
this function" to these functions.

Some even suggested the opposite and need corrections:

* batadv_v_elp_packet_recv() said the skb is consumed on NET_RX_SUCCESS,
  but it is freed on NET_RX_DROP as well
* batadv_send_skb_to_orig() still documented an -EINPROGRESS return
  value, which it no longer returns since the removal of the network coding
  support
* batadv_frag_insert_packet() did not say that the skb is freed on error

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bat_v_elp.c     |  6 ++++--
 net/batman-adv/fragmentation.c |  2 ++
 net/batman-adv/send.c          | 17 ++++++++++++++---
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/net/batman-adv/bat_v_elp.c b/net/batman-adv/bat_v_elp.c
index 0eb07b789cffc..5c251feecabc5 100644
--- a/net/batman-adv/bat_v_elp.c
+++ b/net/batman-adv/bat_v_elp.c
@@ -551,8 +551,10 @@ static void batadv_v_elp_neigh_update(struct batadv_priv *bat_priv,
  * @skb: the received packet
  * @if_incoming: the interface this packet was received through
  *
- * Return: NET_RX_SUCCESS and consumes the skb if the packet was properly
- * processed or NET_RX_DROP in case of failure.
+ * The skb is always consumed by this function.
+ *
+ * Return: NET_RX_SUCCESS if the packet was properly processed or NET_RX_DROP
+ * in case of failure.
  */
 int batadv_v_elp_packet_recv(struct sk_buff *skb,
 			     struct batadv_hard_iface *if_incoming)
diff --git a/net/batman-adv/fragmentation.c b/net/batman-adv/fragmentation.c
index 9025d5f651464..936056a78effe 100644
--- a/net/batman-adv/fragmentation.c
+++ b/net/batman-adv/fragmentation.c
@@ -131,6 +131,8 @@ static bool batadv_frag_init_chain(struct batadv_frag_table_entry *chain,
  * Insert a new fragment into the reverse ordered chain in the right table
  * entry. The hash table entry is cleared if "old" fragments exist in it.
  *
+ * The skb is always consumed by this function.
+ *
  * Return: true if skb is buffered, false on error. If the chain has all the
  * fragments needed to merge the packet, the chain is moved to the passed head
  * to avoid locking the chain in the table.
diff --git a/net/batman-adv/send.c b/net/batman-adv/send.c
index 6672f81798e91..24eb222299d33 100644
--- a/net/batman-adv/send.c
+++ b/net/batman-adv/send.c
@@ -109,6 +109,8 @@ int batadv_send_skb_packet(struct sk_buff *skb,
  * @skb: packet to be transmitted (with batadv header and no outer eth header)
  * @hard_iface: outgoing interface
  *
+ * The skb is always consumed by this function.
+ *
  * Return: A negative errno code is returned on a failure. A success does not
  * guarantee the frame will be transmitted as it may be dropped due
  * to congestion or traffic shaping.
@@ -126,6 +128,8 @@ int batadv_send_broadcast_skb(struct sk_buff *skb,
  * @skb: packet to be transmitted (with batadv header and no outer eth header)
  * @neigh: neighbor which is used as next hop to destination
  *
+ * The skb is always consumed by this function.
+ *
  * Return: A negative errno code is returned on a failure. A success does not
  * guarantee the frame will be transmitted as it may be dropped due
  * to congestion or traffic shaping.
@@ -163,9 +167,10 @@ int batadv_send_unicast_skb(struct sk_buff *skb,
  * host, NULL can be passed as recv_if and no interface alternating is
  * attempted.
  *
- * Return: negative errno code on a failure, -EINPROGRESS if the skb is
- * buffered for later transmit or the NET_XMIT status returned by the
- * lower routine if the packet has been passed down.
+ * The skb is always consumed by this function.
+ *
+ * Return: negative errno code on a failure or the NET_XMIT status returned by
+ * the lower routine if the packet has been passed down.
  */
 int batadv_send_skb_to_orig(struct sk_buff *skb,
 			    struct batadv_orig_node *orig_node,
@@ -313,6 +318,8 @@ bool batadv_send_skb_prepare_unicast_4addr(struct batadv_priv *bat_priv,
  * depending on whether BATADV_UNICAST or BATADV_UNICAST_4ADDR was supplied
  * as packet_type. Then send this frame to the given orig_node.
  *
+ * The skb is always consumed by this function.
+ *
  * Return: NET_XMIT_DROP in case of error or NET_XMIT_SUCCESS otherwise.
  */
 int batadv_send_skb_unicast(struct batadv_priv *bat_priv,
@@ -389,6 +396,8 @@ int batadv_send_skb_unicast(struct batadv_priv *bat_priv,
  * BATADV_UNICAST_4ADDR was supplied as packet_type. Then send this frame
  * to the according destination node.
  *
+ * The skb is always consumed by this function.
+ *
  * Return: NET_XMIT_DROP in case of error or NET_XMIT_SUCCESS otherwise.
  */
 int batadv_send_skb_via_tt_generic(struct batadv_priv *bat_priv,
@@ -429,6 +438,8 @@ int batadv_send_skb_via_tt_generic(struct batadv_priv *bat_priv,
  * Look up the currently selected gateway. Wrap the given skb into a batman-adv
  * unicast header and send this frame to this gateway node.
  *
+ * The skb is always consumed by this function.
+ *
  * Return: NET_XMIT_DROP in case of error or NET_XMIT_SUCCESS otherwise.
  */
 int batadv_send_skb_via_gw(struct batadv_priv *bat_priv, struct sk_buff *skb,
-- 
2.47.3

