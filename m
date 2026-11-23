Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454330;
	b=iJ9aQyeFK8xqfvCISlBXlxoeUsRO8Ls/Z3TZJRpe2+J3QTNwyOgohDIcFzty2xDNOAah
	 oNx2knbE0pfeHl6bCTVO2wCPZuZMBX6ru+AR6KsdbAkEbEqo7ic+XYZZYJZpHYLXjG9N/
	 bIq78CxTcgqegaMBSjtIpZrXyuUYE+S7DUoxy9jh52UIRTSKmEt9+HJ6vsl1Yh6ZnI2HA
	 GyPLjM9iKoXSHXJqrqr1Gbz2ZnoGO5HeEw59dx+FJRtJU/IQCkHMwVYdh2WXog0+PUHu8
	 KgxVKs3lQlPdKmFCwXhBOVaSvnfcSKR/+J2j8eoFH2V1wuPY1gpZV0ichY8CKmGKLYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454330;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ePBH4m2fFbxlYgrTlG+M7Jx8GZOsygSkrAT7dD6lj2M=;
	b=3P15LGqyMwWWEoOHooCrS/KyHk+5znXcbwd5/QOKqWk7BWT0KQEFQ8fHAFgjobG+9pOA
	 MfS2iaAaJomPrlmqEP3M+V6WrnpfB1dnK2fXS/ScKU0WznOohoq1estk4gTk3v1aVP1W8
	 puHCOtTyLwgX2MEM+Q87V60jxsOL/EBDvho2leGVGnFt1YgJht8feX/GDcI4VVowPOlFZ
	 R0yG2aGXXw3QqV2SQFPqeGCGWLDpqB6Bv46kW8HPxn58IaRSSenfHlSXTngyjF6/O0zaX
	 tjZM47ZJdGI2GSekqK6zaQTQKyApdCAWWjL7SrT+znQDqIzgnLvldzMKVvOjzDaQC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=FD6rwdKu;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6063B606A680
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6063B606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=FD6rwdKu
Received: from kero.packetmixer.de (p200300C59714c2E05A704819B6Ba2Db4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id C318FFA3E7;
	Mon, 23 Nov 2026 18:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePBH4m2fFbxlYgrTlG+M7Jx8GZOsygSkrAT7dD6lj2M=;
	b=FD6rwdKuySk/6KXxUQkm8CkeHz2YsSpY380BVfiKos8QL8qhbFnDBc190st021LKhsK4FN
	t0/UgvBpoMEbvJvQQQIXY8maZbjnVLg9mUsG35jB6usSRXTzaS0D2zmSouc6BflyNpiujD
	6SNjHJMxWGKak4jJcC1xHndqRBte9kHktBL2Iz1yPXTHET/JDfIfUBeTFZEY8v0GxupaOj
	CHaDqm6G7V8iBNmOVQ9+MT/Wp6ItWHFeFFhdNJp7OFhZyTOqfrkjCf3e4ctbsz09Oht3kI
	u0FDvZZdbZEL0sIzBBU1PMz30ovB16zCn6kaLYbQL84NjXXtHJlve2qC5B4aGQ==
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
Subject: [PATCH net-next 15/15] batman-adv: tt: drop ADD+DEL events of never announced clients
Date: Mon, 23 Nov 2026 18:18:27 +0100
Message-ID: <20261123171827.3294525-16-sw@simonwunderlich.de>
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

If a detected client was not yet announced, a DEL event can directly drop
the ADD event. The other nodes never heard about the client and don't need
a DEL for it. The entry can then also be removed from the local table
immediately instead of waiting for the commit of its DEL.

Only the initial ADD queued by batadv_tt_local_insert() can be cancelled.
The BATADV_TT_CLIENT_NEW flag of the entry is not enough to identify such a
change: batadv_tt_local_commit_changes_nolock() takes the queued changes
before it clears this flag. An ADD queued by batadv_tt_local_refresh() in
this window (for example for a changed BATADV_TT_CLIENT_WIFI flag) must
still be announced together with a following DEL because the initial ADD is
already on its way to the other nodes. Each change entry therefore stores
whether it is the initial ADD of its client.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 119 ++++++++++++++++++++++-------
 net/batman-adv/types.h             |   7 ++
 2 files changed, 100 insertions(+), 26 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 998c7f285e1d..c17cfee6ff84 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -651,13 +651,20 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)
 }
 
 /**
- * __batadv_tt_local_event() - store a local TT event (ADD/DEL) with given flags
+ * batadv_tt_local_event() - store a local TT event (ADD/DEL) with given flags
  * @bat_priv: the bat priv with all the mesh interface information
  * @common: the TT entry involved in the event
  * @flags: flags of the TT entry combined with the event flags
+ * @initial_add: whether the ADD is the first one of a client which was never
+ *  announced to the other nodes
+ * @cancelled: set to true if a DEL cancelled the initial ADD of the client and
+ *  to false otherwise (optional)
  *
  * Only a single change per client is queued. It describes the latest state of
- * the client and a new event therefore replaces an already queued one.
+ * the client and a new event therefore replaces an already queued one. The
+ * only exception is a DEL for a client whose initial ADD is still queued. The
+ * other nodes don't need to know anything about such a client and the ADD is
+ * cancelled instead.
  *
  * The other nodes only learn about the modification of a local entry through
  * the queued change. The caller must therefore not modify the entry in a way
@@ -669,12 +676,12 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)
  * The caller must hold the flags_lock of @common. The events of an entry are
  * then queued in the same order in which its flags were modified.
  *
- * Return: true if the event was stored, false if the memory for it could not
- * be allocated.
+ * Return: true if the event was stored (or cancelled a queued ADD), false if
+ * the memory for it could not be allocated.
  */
-static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
-				    const struct batadv_tt_common_entry *common,
-				    u8 flags)
+static bool batadv_tt_local_event(struct batadv_priv *bat_priv,
+				  const struct batadv_tt_common_entry *common,
+				  u8 flags, bool initial_add, bool *cancelled)
 	__must_hold(&common->flags_lock)
 {
 	struct batadv_tt_change_node *tt_change_node;
@@ -685,6 +692,9 @@ static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
 
 	lockdep_assert_held(&common->flags_lock);
 
+	if (cancelled)
+		*cancelled = false;
+
 	tt_change_node = kmem_cache_alloc(batadv_tt_change_cache, GFP_ATOMIC);
 	if (!tt_change_node)
 		return false;
@@ -704,6 +714,7 @@ static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
 		flags &= ~BATADV_TT_CLIENT_ROAM;
 
 	tt_change_node->change.flags = flags;
+	tt_change_node->initial_add = initial_add && !del_op_requested;
 
 	/* check for ADD+DEL, DEL+ADD, ADD+ADD or DEL+DEL events */
 	spin_lock_bh(&bat_priv->tt.changes_list_lock);
@@ -716,12 +727,31 @@ static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
 		if (entry->change.vid != tt_change_node->change.vid)
 			continue;
 
-		/* the other nodes may know the client with different
-		 * flags. A DEL+ADD must therefore still announce the
-		 * current flags and an ADD+DEL must still remove the
-		 * client. ADD+ADD and DEL+DEL only update the flags
-		 */
-		entry->change.flags = flags;
+		if (del_op_requested && entry->initial_add) {
+			/* ADD+DEL of a client which was never announced (e.g.
+			 * roaming of a client still in the NEW state) have no
+			 * effect and can be removed.
+			 */
+			list_del(&entry->list);
+			kmem_cache_free(batadv_tt_change_cache, entry);
+			changes--;
+			if (cancelled)
+				*cancelled = true;
+		} else {
+			/* the other nodes may know the client with different
+			 * flags. A DEL+ADD must therefore still announce the
+			 * current flags and an ADD+DEL must still remove the
+			 * client. ADD+ADD and DEL+DEL only update the flags.
+			 *
+			 * The queued change keeps its initial_add state. An
+			 * ADD which only updates the flags of a still queued
+			 * initial ADD stays cancellable. But an ADD queued
+			 * after the initial ADD was committed (and before the
+			 * entry left the NEW state) must not become
+			 * cancellable.
+			 */
+			entry->change.flags = flags;
+		}
 
 		kmem_cache_free(batadv_tt_change_cache, tt_change_node);
 		goto update_changes;
@@ -1063,6 +1093,10 @@ batadv_tt_local_refresh_needed(struct batadv_tt_local_entry *tt_local,
  * updated. An ADD event is queued when @announce is set, the pending removal
  * was cancelled or a flag announced to the other nodes was modified.
  *
+ * @announce is only set for an entry which is just being inserted. Its ADD is
+ * therefore the initial ADD of a client which was never announced to the other
+ * nodes.
+ *
  * The entry is left untouched when the ADD event could not be queued. The
  * other nodes would otherwise never be informed about the new state. An already
  * hashed entry is simply refreshed again when the next packet of the client is
@@ -1083,6 +1117,7 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 {
 	struct batadv_tt_common_entry *common = &tt_local->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	bool initial_add = announce;
 	bool readded = false;
 	bool roamed = false;
 	u8 remote_flags;
@@ -1131,7 +1166,8 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 		 * without a queued change which commits/announces it
 		 */
 		if (announce &&
-		    !__batadv_tt_local_event(bat_priv, common, flags))
+		    !batadv_tt_local_event(bat_priv, common, flags,
+					   initial_add, NULL))
 			return false;
 
 		common->flags = flags;
@@ -1883,6 +1919,11 @@ static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
  * retry it. Such an entry is marked as del_unqueued instead. It stays in the
  * local table until batadv_tt_local_purge_list() was able to queue its DEL.
  *
+ * A client whose initial ADD is still queued was never announced to the other
+ * nodes. Its DEL cancels the ADD and the entry is removed from the local table
+ * right away. The caller has to drop the hash reference of the entry after it
+ * released the flags_lock.
+ *
  * The caller must hold the flags_lock of @tt_local_entry and must not have
  * released it since it checked that the entry has to be removed. Both the
  * queue-then-mark order and this single flags_lock section are required.
@@ -1891,8 +1932,11 @@ static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
  * must have ensured that the entry is still part of the local table. A DEL for
  * an entry which was already purged could otherwise cancel the ADD of a new
  * entry for the same client.
+ *
+ * Return: true if the entry was removed from the local table instead of being
+ * marked as pending, false otherwise.
  */
-static void
+static bool
 batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
 			    struct batadv_tt_local_entry *tt_local_entry,
 			    u16 flags, const char *message)
@@ -1900,6 +1944,7 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
 {
 	struct batadv_tt_common_entry *common = &tt_local_entry->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	bool cancelled;
 	bool queued;
 	u32 i;
 
@@ -1907,8 +1952,13 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
 	lockdep_assert_held(&hash->list_locks[i]);
 	lockdep_assert_held(&common->flags_lock);
 
-	queued = __batadv_tt_local_event(bat_priv, common,
-					 common->flags | flags);
+	queued = batadv_tt_local_event(bat_priv, common, common->flags | flags,
+				       false, &cancelled);
+	if (cancelled) {
+		/* the entry was never announced */
+		batadv_tt_local_unhash(bat_priv, tt_local_entry, message);
+		return true;
+	}
 
 	/* a failed attempt must not hide the still queued DEL of an already
 	 * pending entry
@@ -1924,6 +1974,8 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
 		   "Local tt entry (%pM, vid: %d) pending to be removed: %s\n",
 		   tt_local_entry->common.key.addr,
 		   batadv_print_vid(tt_local_entry->common.key.vid), message);
+
+	return false;
 }
 
 /**
@@ -1940,6 +1992,9 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
  * also applies to an entry which still carries BATADV_TT_CLIENT_NEW because its
  * ADD might already have been taken for the next ttvn.
  *
+ * Only an entry whose initial ADD is still queued is removed from the local
+ * table immediately. Nothing was announced about it to the other nodes.
+ *
  * An entry which was already removed from the local table after it was looked
  * up is ignored and BATADV_NO_FLAGS is stored in @curr_flags.
  *
@@ -1956,6 +2011,7 @@ batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_tt_common_entry *common = &tt_local_entry->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	bool unhashed = false;
 	u16 flags;
 	u32 i;
 
@@ -1984,11 +2040,15 @@ batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,
 		if (roaming)
 			flags |= BATADV_TT_CLIENT_ROAM;
 
-		batadv_tt_local_set_pending(bat_priv, tt_local_entry, flags,
-					    message);
+		unhashed = batadv_tt_local_set_pending(bat_priv, tt_local_entry,
+						       flags, message);
 	}
 
 	spin_unlock_bh(list_lock);
+
+	/* drop reference of removed hash entry */
+	if (unhashed)
+		batadv_tt_local_entry_put(tt_local_entry);
 }
 
 /**
@@ -2037,6 +2097,8 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
 
 	hlist_for_each_entry_safe(tt_common_entry, node_tmp, head,
 				  hash_entry) {
+		bool unhashed = false;
+
 		tt_local_entry = container_of(tt_common_entry,
 					      struct batadv_tt_local_entry,
 					      common);
@@ -2046,10 +2108,10 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
 			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_PENDING) {
 				/* but its removal must still be announced */
 				if (tt_local_entry->del_unqueued)
-					batadv_tt_local_set_pending(bat_priv,
-								    tt_local_entry,
-								    BATADV_TT_CLIENT_DEL,
-								    "requeued");
+					unhashed = batadv_tt_local_set_pending(bat_priv,
+									       tt_local_entry,
+									       BATADV_TT_CLIENT_DEL,
+									       "requeued");
 				break;
 			}
 
@@ -2060,10 +2122,15 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
 						  timeout))
 				break;
 
-			batadv_tt_local_set_pending(bat_priv, tt_local_entry,
-						    BATADV_TT_CLIENT_DEL,
-						    "timed out");
+			unhashed = batadv_tt_local_set_pending(bat_priv,
+							       tt_local_entry,
+							       BATADV_TT_CLIENT_DEL,
+							       "timed out");
 		}
+
+		/* drop reference of removed hash entry */
+		if (unhashed)
+			batadv_tt_local_entry_put(tt_local_entry);
 	}
 }
 
diff --git a/net/batman-adv/types.h b/net/batman-adv/types.h
index d443143f190b..0a2db6583c11 100644
--- a/net/batman-adv/types.h
+++ b/net/batman-adv/types.h
@@ -2005,6 +2005,13 @@ struct batadv_tt_change_node {
 
 	/** @change: holds the actual translation table diff data */
 	struct batadv_tvlv_tt_change change;
+
+	/**
+	 * @initial_add: the change is the initial ADD of a client which was
+	 *  never announced to the other nodes. A DEL of this client cancels
+	 *  the change instead of being queued
+	 */
+	bool initial_add:1;
 };
 
 /**
-- 
2.47.3

