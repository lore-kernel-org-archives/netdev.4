Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454326;
	b=HQZTnYxh/fesTo+94I8io9jZSDEaICINjIsGjnU+JLwuNXqK7TJUMIw37BkVN8sIFay9
	 35R7VYKVu7qtxmI2x/z10fSol5j/3Xr562GqiOsg15NVBMf0rHgv88+MI3LRq2LvhNrxs
	 ka9agzGYVJBaPlrBLQXrIiYDE0Mtxo7QczJPoTxlFAni5HfUu/Rox7JkvIYNob0qscZUo
	 9L+c4Gf5FrVmhP5h4Idqxe8YLZsR2Y0FiUwdFvdvLymXSdyHGbok97bS6DAeEr5H6fBAK
	 tpHCvAjuOMlf8hH24A8wtzUyRZd66MNal5j7yfdODVAmfAlhtmcincAZ1BS99rvM74A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454326;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OnjUrr1HjKOmJwiUDAE5udiu7OQ3NKDJTRVt3O3qoLk=;
	b=NgnZ4SW90ZYX056p0cAcKpY94XNpvVGekcmp6+p9CcRyLF2P3engf1dSBOLR197zr7oy
	 5t3+TUbJ9U0aDOVjkcEh3jZ7mb+eHl3rN7iLw4swi5hh8lP0f41Ct+KiK2oyQD4x1GMsp
	 Ekbx7s8Df1WUz0dKlejRScNcLVgpBb2PtDuV06Tgn8hkvzCiiYNLeHI/tOsfZaT+6j+eo
	 /uX6pJ5lS6LWVmizg3n/SW1PK8AQajrX4u2QB/KahItrm4UUxY9Gi1fiYmddXixQMp+Jt
	 udFnR+l3MP2Z1Ja5K4SLw3yMVb4I0cYEWnGQto13jW1HcZJ0Ws0jJ+weTGyQp9wnypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=DuesnlKH;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id F1C25606A33D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C25606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=DuesnlKH
Received: from kero.packetmixer.de (p200300C59714C2E05a704819b6BA2db4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 5A7C7FA3E4;
	Mon, 23 Nov 2026 18:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnjUrr1HjKOmJwiUDAE5udiu7OQ3NKDJTRVt3O3qoLk=;
	b=DuesnlKHnljniPekhjNdko/Bf+n8cvjicTO12Ez4ywadOmwPTZInKlhtMqgI+xHTZJrPDn
	HVjEZDXmQRHTXlDVz4+qnYdBbNduAx+b00hKOdSoz1xUPpKfCKFzsHkIadBvfISi+p4C7M
	smwShCWmAA6GskKedjPmcCweLbs1zjAxDXzzzhRNqASyqrJnDIaZMGy7DsCIcFrYxXpU6Q
	tBub3J8pdSMntaicgqYWsqZ6YnPxz4ACMJ5CaPrfsA7vxTZatUGazE/PGTMjc0iEWTcbIG
	UHPT9XrVZUxf+n5ljmbWt8YNYBehdzhdNGR/6ZnJmqx/WUHVnDf9reuG0gFBqg==
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
Subject: [PATCH net-next 11/15] batman-adv: tt: requeue DEL of pending local entry after failed allocation
Date: Mon, 23 Nov 2026 18:18:23 +0100
Message-ID: <20261123171827.3294525-12-sw@simonwunderlich.de>
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

batadv_tt_local_set_pending() marks a local entry as
BATADV_TT_CLIENT_PENDING even when the DEL could not be queued because the
allocation of the change failed. The other nodes are then never informed
about the removal of the client. And nothing queues the DEL again because
an already pending entry is skipped by the purge.

The removal can also not simply be rejected. The callers of
batadv_tt_local_remove() don't retry it and a BATADV_TT_CLIENT_NOPURGE
entry would never be removed by the purge. And a roamed client must be
marked as BATADV_TT_CLIENT_ROAM right away to get its packets rerouted to
the new originator.

The entry is therefore still marked as before. But a pending entry whose
DEL could not be queued is now marked as del_unqueued:

* batadv_tt_local_purge_list() queues the DEL of such an entry again. This
  is retried every BATADV_TT_WORK_PERIOD until it succeeds.
* batadv_tt_local_purge_pending_clients() keeps such an entry in the local
  table until its DEL was queued. The local table then still matches the
  table which was announced to the other nodes.
* batadv_tt_local_refresh_locked() drops the mark when the client was
  detected again and the ADD for it was queued.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 61 ++++++++++++++++++++++++------
 net/batman-adv/types.h             |  7 ++++
 2 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index c94b292a1c4a..0c5e21f3ba75 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -655,8 +655,10 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)
  *
  * The other nodes only learn about the modification of a local entry through
  * the queued change. The caller must therefore not modify the entry in a way
- * which depends on this change (e.g. hash it as BATADV_TT_CLIENT_NEW or mark it
- * as BATADV_TT_CLIENT_PENDING) when the event could not be stored.
+ * which depends on this change (e.g. hash it as BATADV_TT_CLIENT_NEW) when the
+ * event could not be stored. The only exception is the DEL of
+ * batadv_tt_local_set_pending(). Its entry is marked as del_unqueued to get the
+ * DEL requeued by batadv_tt_local_purge_list().
  *
  * The caller must hold the flags_lock of @common. The events of an entry are
  * then queued in the same order in which its flags were modified.
@@ -955,6 +957,7 @@ batadv_tt_local_create(struct net_device *mesh_iface, const u8 *addr,
 	kref_init(&tt_local->common.refcount);
 	last_seen = jiffies;
 	WRITE_ONCE(tt_local->last_seen, last_seen);
+	tt_local->del_unqueued = false;
 	tt_local->common.added_at = last_seen;
 	tt_local->vlan = vlan;
 	spin_lock_init(&tt_local->common.flags_lock);
@@ -1076,6 +1079,12 @@ batadv_tt_local_refresh_locked(struct batadv_priv *bat_priv,
 			return false;
 
 		common->flags = flags;
+
+		/* the queued ADD replaces the DEL which still had to be
+		 * queued for the no longer pending entry
+		 */
+		if (readded)
+			tt_local->del_unqueued = false;
 	}
 
 	if (readded)
@@ -1762,6 +1771,11 @@ int batadv_tt_local_dump(struct sk_buff *msg, struct netlink_callback *cb)
  * entry. The entry is kept in the local table until the next TTVN increment
  * so that a consistency-check response can still be answered.
  *
+ * The entry is also marked as BATADV_TT_CLIENT_PENDING when the DEL could not
+ * be queued. The removal must not be lost because not all callers are able to
+ * retry it. Such an entry is marked as del_unqueued instead. It stays in the
+ * local table until batadv_tt_local_purge_list() was able to queue its DEL.
+ *
  * The caller must hold the flags_lock of @tt_local_entry and must not have
  * released it since it checked that the entry has to be removed. Both the
  * queue-then-mark order and this single flags_lock section are required.
@@ -1779,13 +1793,24 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
 {
 	struct batadv_tt_common_entry *common = &tt_local_entry->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	bool queued;
 	u32 i;
 
 	i = batadv_choose_tt(&common->key, hash->size);
 	lockdep_assert_held(&hash->list_locks[i]);
 	lockdep_assert_held(&common->flags_lock);
 
-	__batadv_tt_local_event(bat_priv, common, common->flags | flags);
+	queued = __batadv_tt_local_event(bat_priv, common,
+					 common->flags | flags);
+
+	/* a failed attempt must not hide the still queued DEL of an already
+	 * pending entry
+	 */
+	if (queued)
+		tt_local_entry->del_unqueued = false;
+	else if (!(common->flags & BATADV_TT_CLIENT_PENDING))
+		tt_local_entry->del_unqueued = true;
+
 	common->flags |= BATADV_TT_CLIENT_PENDING;
 
 	batadv_dbg(BATADV_DBG_TT, bat_priv,
@@ -1911,11 +1936,18 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
 					      common);
 
 		scoped_guard(spinlock_bh, &tt_local_entry->common.flags_lock) {
-			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_NOPURGE)
+			/* entry already marked for deletion */
+			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_PENDING) {
+				/* but its removal must still be announced */
+				if (tt_local_entry->del_unqueued)
+					batadv_tt_local_set_pending(bat_priv,
+								    tt_local_entry,
+								    BATADV_TT_CLIENT_DEL,
+								    "requeued");
 				break;
+			}
 
-			/* entry already marked for deletion */
-			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_PENDING)
+			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_NOPURGE)
 				break;
 
 			if (!batadv_has_timed_out(READ_ONCE(tt_local_entry->last_seen),
@@ -4524,7 +4556,8 @@ static void batadv_tt_local_transition_new(struct batadv_priv *bat_priv)
  * @bat_priv: the bat priv with all the mesh interface information
  *
  * Iterate over the local TT and physically remove every entry that has been
- * marked as BATADV_TT_CLIENT_PENDING.
+ * marked as BATADV_TT_CLIENT_PENDING and whose DEL was queued. An entry which
+ * still waits for its DEL (del_unqueued) stays in the local table.
  */
 static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 {
@@ -4548,12 +4581,22 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 					  hash_entry) {
 			bool cont = false;
 
+			tt_local = container_of(tt_common,
+						struct batadv_tt_local_entry,
+						common);
+
 			scoped_guard(spinlock_bh, &tt_common->flags_lock) {
 				if (!(tt_common->flags & BATADV_TT_CLIENT_PENDING)) {
 					cont = true;
 					break;
 				}
 
+				/* the removal must be announced first */
+				if (tt_local->del_unqueued) {
+					cont = true;
+					break;
+				}
+
 				batadv_dbg(BATADV_DBG_TT, bat_priv,
 					   "Deleting local tt entry (%pM, vid: %d): pending\n",
 					   tt_common->key.addr,
@@ -4572,10 +4615,6 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 			if (cont)
 				continue;
 
-			tt_local = container_of(tt_common,
-						struct batadv_tt_local_entry,
-						common);
-
 			batadv_tt_local_entry_put(tt_local);
 		}
 		spin_unlock_bh(list_lock);
diff --git a/net/batman-adv/types.h b/net/batman-adv/types.h
index 8e590f19d236..d443143f190b 100644
--- a/net/batman-adv/types.h
+++ b/net/batman-adv/types.h
@@ -1939,6 +1939,13 @@ struct batadv_tt_local_entry {
 	/** @last_seen: timestamp used for purging stale tt local entries */
 	unsigned long last_seen;
 
+	/**
+	 * @del_unqueued: the DEL of this BATADV_TT_CLIENT_PENDING entry could
+	 *  not be queued and must be queued by the next purge. Protected by
+	 *  common.flags_lock
+	 */
+	bool del_unqueued;
+
 	/** @vlan: mesh-interface vlan of the entry */
 	struct batadv_meshif_vlan *vlan;
 };
-- 
2.47.3

