Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647770;
	b=ZIoWNH5IhN5HfGGfWzwweBZ4TRTFs5CBM1JXyUHDNUDEtq/+X2MipJ/41Ftoq5wedAk6
	 ClBCzPvtw9zaRnpRiEolvW1P1HliF7m9gIhOf/xlFB3u8Q/PlR8gpKuC+iPGTrqRy09oy
	 4p2ufqrRnZAaI4H30IXYu1rF9TcJTaEKFvIF2ohW8q4Tr6ZpjoqfyTgLrwrVzc+WpqKkx
	 SPBSB0m5vzgPnNm5gsn5mc9R7//BfmY2Yi1ikF45s0jML7qiNkibUg9vB2OSWtkdkNbaz
	 Q7DJgmmPLQG+eny32kfp+ed52PP+8CmDC2xlbtZy6jaHPj4Zu0IOV9OMZZ9eliwMdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647770;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lpwA1u59qouthY54ConAsgtyKnxGuTVoNhdbJJpeitk=;
	b=2QPHQ/skHSonrqNzq03z5VCNf8mjYZ8Ugq+aOvzxFYvD9PyXUaEssAxuqwFPEGDIIr4t
	 mCCENsxWw31hnxT3PnLlvvUUTw5MtNYAGqhB+GDDuCyWnxfaA/qy3ofWVHlAJ0K2toBR9
	 RRQgrHQ9E7zCQbwHt8H+EKBC7brZDGDDgV41oT8ricT24Ucj6qyeVHSyTnpA486AytvrW
	 hDJsPSDJq7USJTTec0XCAxeNlhuMMsz0AuH7hOs3wZTT0SP7A+zRsnhKhB9ZZkpbu5alt
	 Ckck1hZm/+Bi3GeoHyihTR6GNR4kaU92ZR4cauSWKbjydQ/454zXeAHSilLWicu2v6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=UctLexUT;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id CC1CA606A331
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=UctLexUT
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 44DE0FA1B2;
	Sat, 14 Nov 2026 10:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpwA1u59qouthY54ConAsgtyKnxGuTVoNhdbJJpeitk=;
	b=UctLexUT3uMFMjc2CCclKAFUs4ePn0l2Zm4l9SbVP7FhXYbWRLApfXTxGcn7rF3uOSv/Zo
	Y98gzVymDkSkPWq4poUnD4xR3TI8xHXwiKqY53fFp5AaAm71usMIHFQrzC/uCDOV5lSlpI
	ywDDFN9F0EjZBYMRnJ6sa7Wj4BaQ7SFGkIIE7dFPlpzt1kz/f0P+L7R/auunuzZpAxjRfK
	LY2N/3j8X28FGBxCM402DIiiXsZrnaoxG7KF3NheKNe06VoHEllokOHkc0G/dzMYSEc5ZP
	MqECFT/dATAG+a4Xn3oZzqL7byuWWS98y3b/xqhZPR7k2lPwHma+kKKBGZk/vQ==
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
Subject: [PATCH net-next 05/15] batman-adv: originator: pass explicit key to orig_hash
Date: Sat, 14 Nov 2026 10:15:46 +0100
Message-ID: <20261114091556.3336038-6-sw@simonwunderlich.de>
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

The key of the orig_hash is the originator address. But batadv_hash_add()
was given the whole orig_node, while batadv_orig_hash_find() is given the
bare address, and batadv_compare_orig() and the lookup compare the
orig_node pointer itself against the address. This only works because
orig is the first member of struct batadv_orig_node.

Pass orig_node->orig as key to batadv_hash_add(), compare explicitly
against orig_node->orig in batadv_compare_orig(), use it for the lookup,
and let batadv_orig_hash_find() take a const u8 * address instead of an
untyped pointer.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bat_iv_ogm.c |  2 +-
 net/batman-adv/bat_v_ogm.c  |  2 +-
 net/batman-adv/originator.c | 19 ++++++++++---------
 net/batman-adv/originator.h |  2 +-
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/net/batman-adv/bat_iv_ogm.c b/net/batman-adv/bat_iv_ogm.c
index 0b2134a8f963a..376c0f80bcee9 100644
--- a/net/batman-adv/bat_iv_ogm.c
+++ b/net/batman-adv/bat_iv_ogm.c
@@ -155,7 +155,7 @@ batadv_iv_ogm_orig_get(struct batadv_priv *bat_priv, const u8 *addr)
 
 	kref_get(&orig_node->refcount);
 	hash_added = batadv_hash_add(bat_priv->orig_hash, batadv_compare_orig,
-				     batadv_choose_orig, orig_node,
+				     batadv_choose_orig, orig_node->orig,
 				     &orig_node->hash_entry);
 	if (hash_added != 0)
 		goto free_orig_node_hash;
diff --git a/net/batman-adv/bat_v_ogm.c b/net/batman-adv/bat_v_ogm.c
index cf3c1d22761b9..4abb4c871e8c5 100644
--- a/net/batman-adv/bat_v_ogm.c
+++ b/net/batman-adv/bat_v_ogm.c
@@ -68,7 +68,7 @@ struct batadv_orig_node *batadv_v_ogm_orig_get(struct batadv_priv *bat_priv,
 
 	kref_get(&orig_node->refcount);
 	hash_added = batadv_hash_add(bat_priv->orig_hash, batadv_compare_orig,
-				     batadv_choose_orig, orig_node,
+				     batadv_choose_orig, orig_node->orig,
 				     &orig_node->hash_entry);
 	if (hash_added != 0) {
 		/* remove refcnt for newly created orig_node and hash entry */
diff --git a/net/batman-adv/originator.c b/net/batman-adv/originator.c
index 1ac3e0ad66c79..391d97bc938b9 100644
--- a/net/batman-adv/originator.c
+++ b/net/batman-adv/originator.c
@@ -45,12 +45,12 @@ static struct lock_class_key batadv_orig_hash_lock_class_key;
 /**
  * batadv_orig_hash_find() - Find and return originator from orig_hash
  * @bat_priv: the bat priv with all the mesh interface information
- * @data: mac address of the originator
+ * @addr: mac address of the originator
  *
  * Return: orig_node (with increased refcnt), NULL on errors
  */
 struct batadv_orig_node *
-batadv_orig_hash_find(struct batadv_priv *bat_priv, const void *data)
+batadv_orig_hash_find(struct batadv_priv *bat_priv, const u8 *addr)
 {
 	struct batadv_hashtable *hash = bat_priv->orig_hash;
 	struct batadv_orig_node *orig_node_tmp = NULL;
@@ -61,12 +61,12 @@ batadv_orig_hash_find(struct batadv_priv *bat_priv, const void *data)
 	if (!hash)
 		return NULL;
 
-	index = batadv_choose_orig(data, hash->size);
+	index = batadv_choose_orig(addr, hash->size);
 	head = &hash->table[index];
 
 	rcu_read_lock();
 	hlist_for_each_entry_rcu(orig_node, head, hash_entry) {
-		if (!batadv_compare_eth(orig_node, data))
+		if (!batadv_compare_orig(&orig_node->hash_entry, addr))
 			continue;
 
 		if (!kref_get_unless_zero(&orig_node->refcount))
@@ -85,16 +85,17 @@ static void batadv_purge_orig(struct work_struct *work);
 /**
  * batadv_compare_orig() - comparing function used in the originator hash table
  * @node: node in the local table
- * @data2: second object to compare the node to
+ * @data2: mac address of the originator to compare the node to
  *
- * Return: true if they are the same originator
+ * Return: true if the node is the originator with the given address
  */
 bool batadv_compare_orig(const struct hlist_node *node, const void *data2)
 {
-	const void *data1 = container_of(node, struct batadv_orig_node,
-					 hash_entry);
+	const struct batadv_orig_node *orig_node;
 
-	return batadv_compare_eth(data1, data2);
+	orig_node = container_of(node, struct batadv_orig_node, hash_entry);
+
+	return batadv_compare_eth(orig_node->orig, data2);
 }
 
 /**
diff --git a/net/batman-adv/originator.h b/net/batman-adv/originator.h
index fabfc3e67c6eb..dff729ecf2df1 100644
--- a/net/batman-adv/originator.h
+++ b/net/batman-adv/originator.h
@@ -83,7 +83,7 @@ static inline u32 batadv_choose_orig(const void *data, u32 size)
 }
 
 struct batadv_orig_node *
-batadv_orig_hash_find(struct batadv_priv *bat_priv, const void *data);
+batadv_orig_hash_find(struct batadv_priv *bat_priv, const u8 *addr);
 
 /**
  * batadv_orig_node_vlan_put() - decrement the refcounter and possibly release
-- 
2.47.3

