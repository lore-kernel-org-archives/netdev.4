Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454325;
	b=b4Zp0in7J6Ukq/X0aWZJuSGqBMsHdmtcWJM0ZNtm7jMM/kZby2tFI7km1VEir7wNSv5U
	 EFj+iYPEMsFdjGV62xh19zW9YlCVySvNd+/uj/Mo/IKXzvF0i6Ho2JY6rCPwWxxJI03pU
	 2XasieGGnSiYu5cnsGC7i8STngzIWipKVfdhkkFBfTB9uwd5slxmR09dV/0k3/Uzy0jwq
	 +ZuIkci8GMmeJSYhU0p4z3lxCiEGa2iuQ1dzhfzcrJb0VK5P1P6cY/4s/WJps3G5v37a1
	 eP8gF1ndnTAvIqNTD12O1N+QoROQX8eeFrBox9W0tNxLs54D6Jx9sj/uC5fXhO/BNTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454325;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lqaK0INzUFWLDlrUVnZlhmVa43GMGTJpgQAW2zOKnCc=;
	b=XOAhxpSjyjNAcAg15r1sTFX4aT2pxi6CFD11LbUNb18KVA33onYS3OvCvNSbfEDWUAqc
	 wMsayCFkqRLkAO031iGqV/9QdiHzQK7LOrVw5TumAqI/5r14G7ANb9veRsZoGbWwmocml
	 Qey9AFsj8MAwIKgFNl9KY/Yu3SjwHHHEXc5mqhqujJWlMQ6bU6HlmeQaO8O4cMn4VkBNa
	 ayydHO2t7rJKN3q4kJ3/mkmdm+NUGkyI4TUPNl6JNSRnxnrNAA45OsudjaWuCD/zxVfBH
	 5MePim0hNpa4Vpr8MiVoQDzZFgqAvIHPWm/SFN3tciJWdnsDDySBunqnwXpIrgPZk+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=me5A1sjZ;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E8128606A688
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8128606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=me5A1sjZ
Received: from kero.packetmixer.de (p200300C59714c2E05a704819b6Ba2dB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 82728FA3E3;
	Mon, 23 Nov 2026 18:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqaK0INzUFWLDlrUVnZlhmVa43GMGTJpgQAW2zOKnCc=;
	b=me5A1sjZKFPWJwIspyOiw8IjFt7Xdv4PRf9oheJdoVCItNae5B/Km8VpIGJ3Lghv2NmWkM
	ykKgfbjI+L+0x9VeksgvuxHh+N78ZMVw8JR+IfiJp8bkyBi3Yq/SXykgv4NgH38ze8nULN
	IhmKKVVdycfBakhL6bRUrMB82ddCNYKExVjybiJa2GayN00WULp6xTu5T73vbFpHKp266f
	emtROZ84DqRc/KWWfjfVQcPdNWlFtevb4FfMmV+xmXn23gcG2HbzdWtCksdTeV90B1boQn
	igAsyB5qxWrn7Aj/IuglXafbEYpiTOCoFD727YUIyTA9A8Hu08UbKs3mU+FxLA==
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
Subject: [PATCH net-next 10/15] batman-adv: tt: keep local entry unchanged when ADD can't be queued
Date: Mon, 23 Nov 2026 18:18:22 +0100
Message-ID: <20261123171827.3294525-11-sw@simonwunderlich.de>
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

The allocation of a local TT change can fail. __batadv_tt_local_event()
drops the event silently in this case. But the local entry was already
modified at this point: a new entry was inserted, the removal of a pending
entry was cancelled or the flags of the entry were changed. The other nodes
are never informed about this new state and the local table no longer
matches the announced one.

Let __batadv_tt_local_event() report whether the event was stored and only
modify the entry afterwards:

* batadv_tt_local_refresh_locked() prepares the new flags, queues the ADD
  and only then stores the flags in the entry. The entry stays untouched
  when the ADD could not be queued and the refresh is retried with the next
  packet of the client.
* batadv_tt_local_insert() queues the initial ADD before it inserts the
  entry in the hash. Both still happen under the same hash bucket
  list_lock. A new entry is not inserted when its ADD could not be queued
  and batadv_tt_local_add() fails.
* batadv_tt_local_refresh() reports the failed refresh to
  batadv_tt_local_add() which fails too. The caller would otherwise
  continue with an entry which is still in its previous state: the
  multicast code would stop to retry the add of a listener whose entry is
  still pending to be removed and batadv_interface_tx() would forward a
  packet of a client with outdated flags. A client which came back is also
  still marked as BATADV_TT_CLIENT_ROAM. batadv_tt_local_add_roam() is
  therefore skipped. It would otherwise treat the client as newly roamed
  instead of cancelling the roaming.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 139 ++++++++++++++++++++---------
 1 file changed, 98 insertions(+), 41 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 977f62c88da7..c94b292a1c4a 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -653,10 +653,18 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)
  * Only a single change per client is queued. It describes the latest state of
  * the client and a new event therefore replaces an already queued one.
  *
+ * The other nodes only learn about the modification of a local entry through
+ * the queued change. The caller must therefore not modify the entry in a way
+ * which depends on this change (e.g. hash it as BATADV_TT_CLIENT_NEW or mark it
+ * as BATADV_TT_CLIENT_PENDING) when the event could not be stored.
+ *
  * The caller must hold the flags_lock of @common. The events of an entry are
  * then queued in the same order in which its flags were modified.
+ *
+ * Return: true if the event was stored, false if the memory for it could not
+ * be allocated.
  */
-static void __batadv_tt_local_event(struct batadv_priv *bat_priv,
+static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
 				    const struct batadv_tt_common_entry *common,
 				    u8 flags)
 	__must_hold(&common->flags_lock)
@@ -671,7 +679,7 @@ static void __batadv_tt_local_event(struct batadv_priv *bat_priv,
 
 	tt_change_node = kmem_cache_alloc(batadv_tt_change_cache, GFP_ATOMIC);
 	if (!tt_change_node)
-		return;
+		return false;
 
 	memset(tt_change_node->change.reserved, 0,
 	       sizeof(tt_change_node->change.reserved));
@@ -718,6 +726,8 @@ static void __batadv_tt_local_event(struct batadv_priv *bat_priv,
 update_changes:
 	WRITE_ONCE(bat_priv->tt.local_changes, changes);
 	spin_unlock_bh(&bat_priv->tt.changes_list_lock);
+
+	return true;
 }
 
 /**
@@ -966,7 +976,7 @@ batadv_tt_local_create(struct net_device *mesh_iface, const u8 *addr,
 }
 
 /**
- * batadv_tt_local_refresh_locked() - refresh a hashed local TT entry
+ * batadv_tt_local_refresh_locked() - refresh a local TT entry
  * @bat_priv: the bat priv with all the mesh interface information
  * @tt_local: the local TT entry to refresh
  * @iif_is_wifi: whether the client is connected via a wifi interface
@@ -980,10 +990,19 @@ batadv_tt_local_create(struct net_device *mesh_iface, const u8 *addr,
  * updated. An ADD event is queued when @announce is set, the pending removal
  * was cancelled or a flag announced to the other nodes was modified.
  *
+ * The entry is left untouched when the ADD event could not be queued. The
+ * other nodes would otherwise never be informed about the new state. An already
+ * hashed entry is simply refreshed again when the next packet of the client is
+ * received.
+ *
  * The caller must hold the hash bucket list_lock of the entry and must have
- * checked that the entry is still part of the local table.
+ * checked that the entry is still part of the local table or is inserting it
+ * under this list_lock.
+ *
+ * Return: true if the entry was refreshed, false if the required ADD event
+ * could not be queued.
  */
-static void
+static bool
 batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 			       struct batadv_tt_local_entry *tt_local,
 			       bool iif_is_wifi, u32 mark, bool announce,
@@ -991,51 +1010,49 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 {
 	struct batadv_tt_common_entry *common = &tt_local->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	bool readded = false;
+	bool roamed = false;
 	u8 remote_flags;
 	u32 match_mark;
+	u16 flags;
 	u32 i;
 
 	i = batadv_choose_tt(&common->key, hash->size);
 	lockdep_assert_held(&hash->list_locks[i]);
 
 	scoped_guard(spinlock_bh, &common->flags_lock) {
-		if (common->flags & BATADV_TT_CLIENT_PENDING) {
-			batadv_dbg(BATADV_DBG_TT, bat_priv,
-				   "Re-adding pending client %pM (vid: %d)\n",
-				   common->key.addr,
-				   batadv_print_vid(common->key.vid));
+		flags = common->flags;
+
+		if (flags & BATADV_TT_CLIENT_PENDING) {
 			/* whatever the reason why the PENDING flag was set,
 			 * this is a client which was enqueued to be removed in
 			 * this orig_interval. Since it popped up again, the
 			 * flag can be reset like it was never enqueued
 			 */
-			common->flags &= ~BATADV_TT_CLIENT_PENDING;
+			flags &= ~BATADV_TT_CLIENT_PENDING;
+			readded = true;
 			announce = true;
 		}
 
-		if (common->flags & BATADV_TT_CLIENT_ROAM) {
-			batadv_dbg(BATADV_DBG_TT, bat_priv,
-				   "Roaming client %pM (vid: %d) came back to its original location\n",
-				   common->key.addr,
-				   batadv_print_vid(common->key.vid));
+		if (flags & BATADV_TT_CLIENT_ROAM) {
 			/* the ROAM flag is set because this client roamed away
 			 * and the node got a roaming_advertisement message. Now
 			 * that the client popped up again at its original
 			 * location such flag can be unset
 			 */
-			common->flags &= ~BATADV_TT_CLIENT_ROAM;
-			*roamed_back = true;
+			flags &= ~BATADV_TT_CLIENT_ROAM;
+			roamed = true;
 		}
 
 		/* store the current remote flags before altering them. This
 		 * helps understanding is flags are changing or not
 		 */
-		remote_flags = common->flags & BATADV_TT_REMOTE_MASK;
+		remote_flags = flags & BATADV_TT_REMOTE_MASK;
 
 		if (iif_is_wifi)
-			common->flags |= BATADV_TT_CLIENT_WIFI;
+			flags |= BATADV_TT_CLIENT_WIFI;
 		else
-			common->flags &= ~BATADV_TT_CLIENT_WIFI;
+			flags &= ~BATADV_TT_CLIENT_WIFI;
 
 		/* check the mark in the skb: if it's equal to the configured
 		 * isolation_mark, it means the packet is coming from an
@@ -1044,17 +1061,38 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 		match_mark = (mark & bat_priv->isolation_mark_mask);
 		if (bat_priv->isolation_mark_mask &&
 		    match_mark == bat_priv->isolation_mark)
-			common->flags |= BATADV_TT_CLIENT_ISOLA;
+			flags |= BATADV_TT_CLIENT_ISOLA;
 		else
-			common->flags &= ~BATADV_TT_CLIENT_ISOLA;
+			flags &= ~BATADV_TT_CLIENT_ISOLA;
 
-		if (remote_flags ^ (common->flags & BATADV_TT_REMOTE_MASK))
+		if (remote_flags ^ (flags & BATADV_TT_REMOTE_MASK))
 			announce = true;
 
-		if (announce)
-			__batadv_tt_local_event(bat_priv, common,
-						common->flags);
+		/* queue-then-modify: the new state must not become visible
+		 * without a queued change which commits/announces it
+		 */
+		if (announce &&
+		    !__batadv_tt_local_event(bat_priv, common, flags))
+			return false;
+
+		common->flags = flags;
 	}
+
+	if (readded)
+		batadv_dbg(BATADV_DBG_TT, bat_priv,
+			   "Re-adding pending client %pM (vid: %d)\n",
+			   common->key.addr,
+			   batadv_print_vid(common->key.vid));
+
+	if (roamed) {
+		batadv_dbg(BATADV_DBG_TT, bat_priv,
+			   "Roaming client %pM (vid: %d) came back to its original location\n",
+			   common->key.addr,
+			   batadv_print_vid(common->key.vid));
+		*roamed_back = true;
+	}
+
+	return true;
 }
 
 /**
@@ -1068,8 +1106,11 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
  *
  * See batadv_tt_local_refresh_locked() for the actual refresh.
  *
+ * An entry whose modification could not be announced stays in its previous
+ * state. The refresh is then retried with the next packet of the client.
+ *
  * Return: 0 if the entry was refreshed, -ENOENT if the entry is no longer part
- * of the local table.
+ * of the local table, -ENOMEM if the required ADD event could not be queued.
  */
 static int
 batadv_tt_local_refresh(struct batadv_priv *bat_priv,
@@ -1079,6 +1120,7 @@ batadv_tt_local_refresh(struct batadv_priv *bat_priv,
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_tt_common_entry *common = &tt_local->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	int ret = 0;
 	u32 i;
 
 	i = batadv_choose_tt(&common->key, hash->size);
@@ -1094,12 +1136,13 @@ batadv_tt_local_refresh(struct batadv_priv *bat_priv,
 		return -ENOENT;
 	}
 
-	batadv_tt_local_refresh_locked(bat_priv, tt_local, iif_is_wifi, mark,
-				       false, roamed_back);
+	if (!batadv_tt_local_refresh_locked(bat_priv, tt_local, iif_is_wifi,
+					    mark, false, roamed_back))
+		ret = -ENOMEM;
 
 	spin_unlock_bh(list_lock);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -1111,14 +1154,17 @@ batadv_tt_local_refresh(struct batadv_priv *bat_priv,
  *  any)
  * @roamed_back: set to true when the client returned to its original location
  *
- * The entry is inserted into the local hash and its initial ADD event is
- * queued under the same hash bucket list_lock. A concurrent
- * batadv_tt_local_commit_changes() can therefore not count the entry in the
- * CRC of a ttvn before its ADD was queued and a concurrent
- * batadv_tt_local_remove() can not unhash it before the ADD was queued.
+ * The initial ADD event is queued and the entry is inserted into the local
+ * hash under the same hash bucket list_lock. A concurrent
+ * batadv_tt_local_commit_changes() can therefore not commit the entry without
+ * its ADD (or the ADD without the entry) and a concurrent
+ * batadv_tt_local_remove() can not unhash the entry before the ADD was queued.
+ *
+ * The entry is not inserted when its ADD could not be queued. The other nodes
+ * would otherwise never be informed about the new client.
  *
  * Return: true if the entry was added, false if the client already has an
- * entry in the local table.
+ * entry in the local table or the ADD event could not be queued.
  */
 static bool batadv_tt_local_insert(struct batadv_priv *bat_priv,
 				   struct batadv_tt_local_entry *tt_local,
@@ -1146,15 +1192,18 @@ static bool batadv_tt_local_insert(struct batadv_priv *bat_priv,
 		return false;
 	}
 
+	/* announce the added client to the mesh */
+	if (!batadv_tt_local_refresh_locked(bat_priv, tt_local, iif_is_wifi,
+					    mark, true, roamed_back)) {
+		spin_unlock_bh(list_lock);
+		return false;
+	}
+
 	/* reference for the hash */
 	kref_get(&common->refcount);
 	hlist_add_head_rcu(&common->hash_entry, head);
 	atomic_inc(&hash->generation);
 
-	/* announce the added client to the mesh */
-	batadv_tt_local_refresh_locked(bat_priv, tt_local, iif_is_wifi, mark,
-				       true, roamed_back);
-
 	spin_unlock_bh(list_lock);
 
 	return true;
@@ -1198,6 +1247,14 @@ bool batadv_tt_local_add(struct net_device *mesh_iface, const u8 *addr,
 			/* stale entry which has to be replaced by a new one */
 			batadv_tt_local_entry_put(tt_local);
 			tt_local = NULL;
+		} else if (err) {
+			/* The entry is still in its previous state (e.g.
+			 * pending to be removed). The caller must not treat
+			 * the client as added and the roaming is handled
+			 * together with the refresh which is retried with the
+			 * next packet of the client.
+			 */
+			goto out;
 		}
 	}
 
-- 
2.47.3

