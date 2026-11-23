Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454329;
	b=RRoAXyRGhKT+KRrwUB9ICv3kAxMxuMC3OA927BDWsJBWfWkNRJ9QOnEch3PKJr0Hb8JD
	 tCbOcxT9ScJGD0clC89xLLJCuBPLLzvOPGamZ1pBb4hnEtr1pc8rtYcMR1hgUrCiCd1Vo
	 j0AQcOmeP4wK2xU4fTZssQ7b9MCJZ6HJo6g69e09EJ98GNyArJkMnzbjSeptcP2a6nCHU
	 nsK4RrhuYtFOWDTu0A1DN4AdTe1amPt3s8yTg8ffOSxdCPtfxqs2yJETTpWtTk0M7C9dU
	 cpt0oAfd/PIH5zKOJKOXODjHTiBsgXIgFT3ojAm6GoLfwhKgyDc0tTwXrQmaq3bHB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454329;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QNQHQ5O4TWMLgh/nR3cvCkdwm53W/SDGuT90F6rmcCY=;
	b=0jXJPP4ILexvh3vK0t9eyCaADts/aOW8h+GRSjOZDFkoBorl6N3J3DvoZa3BGhgfs8jp
	 h5gudT6hzGDoDQyuFszXaDUe60++jG9c06axVyYGvpeVngx7etKprPupn2WvwnUMxxTaz
	 kP0hPZohYS845Ja4v0ALTOJLxFXeiyEiNjinaPDTsRuWCd72+jdjag0K5a/17kbRgNW1u
	 0EFGoV7TXVcSwwGTOU9LXA/jGHwbaiTe6/H+LsUiLxNteRmRVLSPEiW9Ewm3PNk2OAz3V
	 Z94HnM68QNdbxWxTXrgHa1DQVGD7QVKb32Pu5i8H+H7tckn5RAJBHWo69k/3jPPBH1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=moUu8MGX;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id DA558606A33D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA558606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=moUu8MGX
Received: from kero.packetmixer.de (p200300C59714C2E05A704819B6BA2DB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 0F616FA3E6;
	Mon, 23 Nov 2026 18:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QNQHQ5O4TWMLgh/nR3cvCkdwm53W/SDGuT90F6rmcCY=;
	b=moUu8MGXz+/fpaPMIDzUVqBWvsc7rGNBflMnHLv/zAx+REPwG5FTZDSWqy+bs4t4cm7hEE
	S3Stv9Izs0jJMfEo8LYCTRAOlwcI6c2Xf5y+XIqnZtPUbVJmoLBgd+05lvYo5uQ2Czu6dg
	q3K/dnP2XE9MG0TscXNM8G070zqfYQFY90A56aPwbbHz6ELMNlwiQ0VF3lFeoUA6DijcHY
	/Tr4DQ1vKBXQnSquoJ0Xjn9KC+/cIDCb5qh6xNNQilEUQX5H3T0ZrRuRwe9NHJ18sR1wZj
	VRc0hzDtxqWwNrhrnYt2lAweSBaZqrOTGmuWevLDO0ER4aBcNBLQYw8GnNJLeQ==
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
Subject: [PATCH net-next 14/15] batman-adv: tt: avoid list_lock for unchanged local clients
Date: Mon, 23 Nov 2026 18:18:26 +0100
Message-ID: <20261123171827.3294525-15-sw@simonwunderlich.de>
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

batadv_tt_local_add() is called for every packet transmitted by a local
client. batadv_tt_local_refresh() takes the hash bucket list_lock for each
of them, although this lock is shared by all entries of the bucket and is
only needed when the entry has to be modified or announced.

For the common case, the entry is neither BATADV_TT_CLIENT_PENDING nor
BATADV_TT_CLIENT_ROAM, the dynamic flags (BATADV_TT_CLIENT_WIFI and
BATADV_TT_CLIENT_ISOLA) are unchanged and the entry is still hashed. Only
last_seen has to be refreshed then.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 115 ++++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 26 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index b03d6c74732f..998c7f285e1d 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -984,13 +984,77 @@ batadv_tt_local_create(struct net_device *mesh_iface, const u8 *addr,
 	return tt_local;
 }
 
+/* flags of a local TT entry which depend on the packets of the client */
+#define BATADV_TT_LOCAL_DYNAMIC_MASK \
+	(BATADV_TT_CLIENT_WIFI | BATADV_TT_CLIENT_ISOLA)
+
 /**
- * batadv_tt_local_refresh_locked() - refresh a local TT entry
+ * batadv_tt_local_dynamic_flags() - get the dynamic flags of a local client
  * @bat_priv: the bat priv with all the mesh interface information
- * @tt_local: the local TT entry to refresh
  * @iif_is_wifi: whether the client is connected via a wifi interface
  * @mark: the value contained in the skb->mark field of the received packet (if
  *  any)
+ *
+ * Return: the BATADV_TT_CLIENT_WIFI and BATADV_TT_CLIENT_ISOLA flags which the
+ * local entry of the client has to carry.
+ */
+static u16 batadv_tt_local_dynamic_flags(struct batadv_priv *bat_priv,
+					 bool iif_is_wifi, u32 mark)
+{
+	u32 match_mark;
+	u16 flags = 0;
+
+	if (iif_is_wifi)
+		flags |= BATADV_TT_CLIENT_WIFI;
+
+	/* check the mark in the skb: if it's equal to the configured
+	 * isolation_mark, it means the packet is coming from an
+	 * isolated non-mesh client
+	 */
+	match_mark = (mark & bat_priv->isolation_mark_mask);
+	if (bat_priv->isolation_mark_mask &&
+	    match_mark == bat_priv->isolation_mark)
+		flags |= BATADV_TT_CLIENT_ISOLA;
+
+	return flags;
+}
+
+/**
+ * batadv_tt_local_refresh_needed() - check if a local entry has to be modified
+ * @tt_local: the local TT entry to check
+ * @dynamic_flags: the dynamic flags the entry has to carry
+ *
+ * The bucket list_lock which is shared by many entries is only needed when
+ * the entry has to be modified or announced. For the common case of an
+ * already announced client with unchanged flags, it is enough to refresh the
+ * last_seen timestamp.
+ *
+ * Return: true if the slow path of batadv_tt_local_refresh() is required,
+ * false otherwise.
+ */
+static bool
+batadv_tt_local_refresh_needed(struct batadv_tt_local_entry *tt_local,
+			       u16 dynamic_flags)
+{
+	struct batadv_tt_common_entry *common = &tt_local->common;
+	u16 flags;
+
+	flags = batadv_tt_flags_get(common);
+
+	if (flags & (BATADV_TT_CLIENT_PENDING | BATADV_TT_CLIENT_ROAM))
+		return true;
+
+	if ((flags & BATADV_TT_LOCAL_DYNAMIC_MASK) != dynamic_flags)
+		return true;
+
+	return hlist_unhashed_lockless(&common->hash_entry);
+}
+
+/**
+ * batadv_tt_local_refresh_locked() - refresh a local TT entry
+ * @bat_priv: the bat priv with all the mesh interface information
+ * @tt_local: the local TT entry to refresh
+ * @dynamic_flags: the dynamic flags the entry has to carry
  * @announce: whether an ADD event has to be queued even when no announced
  *  flag was modified
  * @roamed_back: set to true when the client returned to its original location
@@ -1014,7 +1078,7 @@ batadv_tt_local_create(struct net_device *mesh_iface, const u8 *addr,
 static bool
 batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 			       struct batadv_tt_local_entry *tt_local,
-			       bool iif_is_wifi, u32 mark, bool announce,
+			       u16 dynamic_flags, bool announce,
 			       bool *roamed_back)
 {
 	struct batadv_tt_common_entry *common = &tt_local->common;
@@ -1022,7 +1086,6 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 	bool readded = false;
 	bool roamed = false;
 	u8 remote_flags;
-	u32 match_mark;
 	u16 flags;
 	u32 i;
 
@@ -1058,21 +1121,8 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 		 */
 		remote_flags = flags & BATADV_TT_REMOTE_MASK;
 
-		if (iif_is_wifi)
-			flags |= BATADV_TT_CLIENT_WIFI;
-		else
-			flags &= ~BATADV_TT_CLIENT_WIFI;
-
-		/* check the mark in the skb: if it's equal to the configured
-		 * isolation_mark, it means the packet is coming from an
-		 * isolated non-mesh client
-		 */
-		match_mark = (mark & bat_priv->isolation_mark_mask);
-		if (bat_priv->isolation_mark_mask &&
-		    match_mark == bat_priv->isolation_mark)
-			flags |= BATADV_TT_CLIENT_ISOLA;
-		else
-			flags &= ~BATADV_TT_CLIENT_ISOLA;
+		flags &= ~BATADV_TT_LOCAL_DYNAMIC_MASK;
+		flags |= dynamic_flags;
 
 		if (remote_flags ^ (flags & BATADV_TT_REMOTE_MASK))
 			announce = true;
@@ -1119,7 +1169,8 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
  *  any)
  * @roamed_back: set to true when the client returned to its original location
  *
- * See batadv_tt_local_refresh_locked() for the actual refresh.
+ * See batadv_tt_local_refresh_locked() for the actual refresh. The hash bucket
+ * list_lock is only taken when the entry has to be modified or announced.
  *
  * An entry whose modification could not be announced stays in its previous
  * state. The refresh is then retried with the next packet of the client.
@@ -1135,14 +1186,22 @@ batadv_tt_local_refresh(struct batadv_priv *bat_priv,
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_tt_common_entry *common = &tt_local->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	u16 dynamic_flags;
 	int ret = 0;
 	u32 i;
 
-	i = batadv_choose_tt(&common->key, hash->size);
-	list_lock = &hash->list_locks[i];
+	dynamic_flags = batadv_tt_local_dynamic_flags(bat_priv, iif_is_wifi,
+						      mark);
 
 	WRITE_ONCE(tt_local->last_seen, jiffies);
 
+	/* fast path: nothing to modify or to announce */
+	if (!batadv_tt_local_refresh_needed(tt_local, dynamic_flags))
+		return 0;
+
+	i = batadv_choose_tt(&common->key, hash->size);
+	list_lock = &hash->list_locks[i];
+
 	spin_lock_bh(list_lock);
 
 	/* the entry was removed from the local table after it was looked up */
@@ -1151,8 +1210,8 @@ batadv_tt_local_refresh(struct batadv_priv *bat_priv,
 		return -ENOENT;
 	}
 
-	if (!batadv_tt_local_refresh_locked(bat_priv, tt_local, iif_is_wifi,
-					    mark, false, roamed_back))
+	if (!batadv_tt_local_refresh_locked(bat_priv, tt_local, dynamic_flags,
+					    false, roamed_back))
 		ret = -ENOMEM;
 
 	spin_unlock_bh(list_lock);
@@ -1191,8 +1250,12 @@ static bool batadv_tt_local_insert(struct batadv_priv *bat_priv,
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
 	struct hlist_head *head;
 	struct hlist_node *node;
+	u16 dynamic_flags;
 	u32 i;
 
+	dynamic_flags = batadv_tt_local_dynamic_flags(bat_priv, iif_is_wifi,
+						      mark);
+
 	i = batadv_choose_tt(&common->key, hash->size);
 	head = &hash->table[i];
 	list_lock = &hash->list_locks[i];
@@ -1208,8 +1271,8 @@ static bool batadv_tt_local_insert(struct batadv_priv *bat_priv,
 	}
 
 	/* announce the added client to the mesh */
-	if (!batadv_tt_local_refresh_locked(bat_priv, tt_local, iif_is_wifi,
-					    mark, true, roamed_back)) {
+	if (!batadv_tt_local_refresh_locked(bat_priv, tt_local, dynamic_flags,
+					    true, roamed_back)) {
 		spin_unlock_bh(list_lock);
 		return false;
 	}
-- 
2.47.3

