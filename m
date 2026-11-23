Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454327;
	b=Tk3lnuP2mypg1jkOAK7npD8TgOsnRDgDRGnHIUWOX7oWtjeoutR3DSm/bLwA+92Jpt6p
	 26UGXQEYRcpgnHirarjybaz+ZmCaSDd88LczKJdXUg0kFA0SYCpqglz7huJ64AFlVTc7B
	 /h5MCsBuwfIfShN8r1xBLuSvc6C/AL7MUV9MBwkIMdx+DSc3s6fUfOuBJ2PfzDXG/qHp5
	 AUm3zqaXtAVr8dG9SCQVAzQncQEd+o3Lkf/P9nBmjI4z7R5QjFP0LaaSq0BoPzfuwrX9K
	 Tl7RfCQ6kzcg5L7wszNML456R9ekwQMiqgMF+Sws2LD7IUrTMVl0KQbSbptXl0sMnHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454327;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ikTWj3OMaD8zV0VbfYNdcMbCpUWhH/Zoj/Xn+pSLTzw=;
	b=40pbrDMRW6bH8/8tMFzRPwOigI0oVhkR0bytjddnFIyNytj2oJSN6DdIGGY4uAoHG+jI
	 AqlWHLnHIRgo1An4lpd6Ys9QN8n50xs1onM9SQL76Emd+cuUA+UB7c81ct3m09aiJvMgE
	 ODhYZGHhLwrmMJFh8aMxQPFKHb/knP44fAw/0Dw/Z2Rrw4VrRAx62pwvPgPsIjX63EivM
	 TV6hgAiJVdlIfSzeXQYeJ3Sv3CJGrABx53FnQ+2emu3g6uY5FHEHB7ic3u2p3E0KebYmp
	 Gmz/jJSJ5pXLI7vcpsq2Kbgjb9hRJiJskxqaUUJIUBT+cj4p05YsxOfVbkt082TpsHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b="P/2fMsgk";
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 78DD6606A68F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DD6606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=P/2fMsgk
Received: from kero.packetmixer.de (p200300c59714c2E05A704819B6bA2DB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id CAC4EFA3E5;
	Mon, 23 Nov 2026 18:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikTWj3OMaD8zV0VbfYNdcMbCpUWhH/Zoj/Xn+pSLTzw=;
	b=P/2fMsgkn0PKxOfTX4wLZBqSkibt5SzHaIS/I0Y7Xly49Fvw1oLI0mNBlTGunPirml5xj5
	ggPD7/3l6O5NG4vPkVUJuZ+2pkWRIh6/kWU3mWNXgeQF2XF4IsQ9u1li5awLPFP38C/noH
	UyynXxABnisicy77qltsOTU0c6ALjA2H9F7rvemZV8ntsWt0+L2sWVlQalRJByW2vRvKHb
	KNNdvPsMg+nUR/khFs2pBYb7icQ++aEQnSe/rJyIzxuwRYJDnH+8mSMvO/trQYb+3NMP4K
	JKPDCPA6Xs3GIXQchvPTezVb2OyAFSZR6PH5tvMqZf13ye9NfJrzVMbBwTk3Ew==
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
Subject: [PATCH net-next 12/15] batman-adv: tt: extract removal of pending local entry
Date: Mon, 23 Nov 2026 18:18:24 +0100
Message-ID: <20261123171827.3294525-13-sw@simonwunderlich.de>
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

batadv_tt_local_purge_pending_clients() removes the entries which are
marked as BATADV_TT_CLIENT_PENDING from the local table. The actual removal
of a single entry has to follow some rules: an entry whose DEL still has to
be queued must stay in the local table and an entry which still carries
BATADV_TT_CLIENT_NEW was never counted and must not be uncounted.

Move the removal of a single entry to batadv_tt_local_unhash_pending(). It
can then be shared with the upcoming code which removes only the entry of a
committed DEL. The actual unhash steps are placed in
batadv_tt_local_unhash() because they will also be needed for entries which
are removed without going through the pending state. There is no functional
change.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 108 +++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 28 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 0c5e21f3ba75..2a7f50de70fc 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1760,6 +1760,44 @@ int batadv_tt_local_dump(struct sk_buff *msg, struct netlink_callback *cb)
 	return ret;
 }
 
+/**
+ * batadv_tt_local_unhash() - remove an entry from the local table
+ * @bat_priv: the bat priv with all the mesh interface information
+ * @tt_local: the local TT entry to remove
+ * @message: message to append to the log on deletion
+ *
+ * The caller must hold the hash bucket list_lock and the flags_lock of the
+ * entry. It must have checked that the entry is still part of the local table
+ * and has to drop the reference of the hash after it released the flags_lock.
+ */
+static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
+				   struct batadv_tt_local_entry *tt_local,
+				   const char *message)
+	__must_hold(&tt_local->common.flags_lock)
+{
+	struct batadv_tt_common_entry *tt_common = &tt_local->common;
+	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
+	u32 i;
+
+	i = batadv_choose_tt(&tt_common->key, hash->size);
+	lockdep_assert_held(&hash->list_locks[i]);
+	lockdep_assert_held(&tt_common->flags_lock);
+
+	batadv_dbg(BATADV_DBG_TT, bat_priv,
+		   "Deleting local tt entry (%pM, vid: %d): %s\n",
+		   tt_common->key.addr, batadv_print_vid(tt_common->key.vid),
+		   message);
+
+	hlist_del_init_rcu(&tt_common->hash_entry);
+	atomic_inc(&hash->generation);
+
+	/* An entry which still carries BATADV_TT_CLIENT_NEW was never counted
+	 * and must not be uncounted here.
+	 */
+	if (!(tt_common->flags & BATADV_TT_CLIENT_NEW))
+		batadv_tt_local_size_dec(bat_priv, tt_common->key.vid);
+}
+
 /**
  * batadv_tt_local_set_pending() - mark local TT entry as pending removal
  * @bat_priv: the bat priv with all the mesh interface information
@@ -4550,6 +4588,43 @@ static void batadv_tt_local_transition_new(struct batadv_priv *bat_priv)
 	}
 }
 
+/**
+ * batadv_tt_local_unhash_pending() - remove a pending entry from the local table
+ * @bat_priv: the bat priv with all the mesh interface information
+ * @tt_local: the local TT entry to remove
+ *
+ * Only an entry which is marked as BATADV_TT_CLIENT_PENDING and whose DEL was
+ * queued is removed. An entry which still waits for its DEL (del_unqueued) must
+ * stay in the local table until batadv_tt_local_purge_list() was able to queue
+ * it.
+ *
+ * The caller must hold the hash bucket list_lock and the flags_lock of the
+ * entry.
+ *
+ * Return: true if the entry was unhashed and the caller has to drop the
+ * reference of the hash, false otherwise.
+ */
+static bool
+batadv_tt_local_unhash_pending(struct batadv_priv *bat_priv,
+			       struct batadv_tt_local_entry *tt_local)
+	__must_hold(&tt_local->common.flags_lock)
+{
+	struct batadv_tt_common_entry *tt_common = &tt_local->common;
+
+	lockdep_assert_held(&tt_common->flags_lock);
+
+	if (!(tt_common->flags & BATADV_TT_CLIENT_PENDING))
+		return false;
+
+	/* the removal must be announced first */
+	if (tt_local->del_unqueued)
+		return false;
+
+	batadv_tt_local_unhash(bat_priv, tt_local, "pending");
+
+	return true;
+}
+
 /**
  * batadv_tt_local_purge_pending_clients() - finalise removal of pending local
  *  clients
@@ -4579,40 +4654,17 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 		spin_lock_bh(list_lock);
 		hlist_for_each_entry_safe(tt_common, node_tmp, head,
 					  hash_entry) {
-			bool cont = false;
+			bool unhashed;
 
 			tt_local = container_of(tt_common,
 						struct batadv_tt_local_entry,
 						common);
 
-			scoped_guard(spinlock_bh, &tt_common->flags_lock) {
-				if (!(tt_common->flags & BATADV_TT_CLIENT_PENDING)) {
-					cont = true;
-					break;
-				}
-
-				/* the removal must be announced first */
-				if (tt_local->del_unqueued) {
-					cont = true;
-					break;
-				}
+			scoped_guard(spinlock_bh, &tt_common->flags_lock)
+				unhashed = batadv_tt_local_unhash_pending(bat_priv,
+									  tt_local);
 
-				batadv_dbg(BATADV_DBG_TT, bat_priv,
-					   "Deleting local tt entry (%pM, vid: %d): pending\n",
-					   tt_common->key.addr,
-					   batadv_print_vid(tt_common->key.vid));
-
-				hlist_del_init_rcu(&tt_common->hash_entry);
-				atomic_inc(&hash->generation);
-
-				/* An entry which still carries BATADV_TT_CLIENT_NEW was
-				 * never counted and must not be uncounted here.
-				 */
-				if (!(tt_common->flags & BATADV_TT_CLIENT_NEW))
-					batadv_tt_local_size_dec(bat_priv, tt_common->key.vid);
-			}
-
-			if (cont)
+			if (!unhashed)
 				continue;
 
 			batadv_tt_local_entry_put(tt_local);
-- 
2.47.3

