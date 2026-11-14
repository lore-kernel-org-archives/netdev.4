Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647768;
	b=MnWC5Cmb1pTtixelxpXrdFdXb0BjHvLVC+lEh6NxvTA7Ewf0sSLOa/sRDX8GJLXJUWoL
	 bmcf/VipHhzn1VeBS4gwoghE8bH2nGcD/ix4eFYZul0pxT3f//DxbCw+JkLe063Djb1Y2
	 htRNrStZ4LPU3s+1cZTgmfPnMWPCpqY34apxGuPbPKZXELusTQXMa/eHosdNpnyda2oQC
	 HBTKm3WLMk7FnM4TyiWSuW8LTXv8z1B+8X9siouMvLoCSolzyO+HheWuxdWdajC/hbv42
	 kjg9cj6p5LsfoU6iZRRRPs+HKr4CYq19RiW0yOs3jaMWQBYCVCbucwGTtpqaS86M5AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647768;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UhPIb55+0Jx/newmWatABDZ4iwRN5cB0+wyLOkbouv8=;
	b=41obrqcKZq3M5YqFtRWBIUiC/WDSKoTNjTSFgwXMl26bSDI4e4+fTX3XjFcgRnzvXwH+
	 EDxk7ZwvAqkTjCFb6VWNnJmyuKt0NWVyy3SAxxWzj5PjEZcu1/O76VvbQPgyMpjvaTy2I
	 rt4ds1Vi45dkt2E62chq++tze+YoJNSsMYdVqBebICEvQKZUh+fHPmZBPjnQ4Z1SOuo+b
	 nVfegIGDOfH5+gfxaUf1xdmI2uSEuUxHbbyMrRzn1m5ZViP5Dx1Lcrhz7CKmXjTHAtLHJ
	 3+D8evGkJlNO4kiSj13K3hfj2FfYdtIARda14UNgD+kK6Vi1u7qIQbS/jSNkALKpq8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=gAZhrwnk;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 223E8606A33F
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223E8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=gAZhrwnk
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 0B3F0FA0B2;
	Sat, 14 Nov 2026 10:15:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794647759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhPIb55+0Jx/newmWatABDZ4iwRN5cB0+wyLOkbouv8=;
	b=gAZhrwnkGoiyukG2zvMYow3fQ0l0l+Is7bT1PnDf5/dDrz4oGPgh4yDF0nAT+O/vH6MPhz
	2geW2qAWzZSRq3Ou35QsI2/Uq1iFn/jpzKwzB6rCmherQVMrked6tLrsURIPx0GxPcqgaD
	i90T8E9jmSD0zSeIuxUIKw+PvYxXiXWm8cxv8Vq5einjxoWzMmpkDRyhCq0ODie2Le8KCj
	z9QCk0ZjebOr2qbXoPQPYeZPS/GlqAXex1sJ7xKr10wAvdvuxAX9YHHQjPSTypyD+FSRxr
	NUjeLdWIZ18Lto82x2QN5/zphe7/wJgslQX5EgMqtbFq3Bv3kqUUk+frA80QKw==
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
Subject: [PATCH net-next 01/15] batman-adv: bla: use dedicated key type for claim hash
Date: Sat, 14 Nov 2026 10:15:42 +0100
Message-ID: <20261114091556.3336038-2-sw@simonwunderlich.de>
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

The claim hash lookup functions are given a struct batadv_bla_claim.
For a lookup, a dummy claim is created on the stack and only its addr
and vid members are filled. All other members stay uninitialized, and
only by reading the hash and compare callbacks can one tell which
members form the key.

Move addr and vid into a new struct batadv_bla_claim_key, embedded as
batadv_bla_claim::key. The helpers are only using this key for
hashing/comparison.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/bridge_loop_avoidance.c | 98 +++++++++++++-------------
 net/batman-adv/types.h                 | 12 +++-
 2 files changed, 60 insertions(+), 50 deletions(-)

diff --git a/net/batman-adv/bridge_loop_avoidance.c b/net/batman-adv/bridge_loop_avoidance.c
index fc8336aa09a0c..a5ac7ba24e834 100644
--- a/net/batman-adv/bridge_loop_avoidance.c
+++ b/net/batman-adv/bridge_loop_avoidance.c
@@ -59,18 +59,18 @@ batadv_bla_send_announce(struct batadv_priv *bat_priv,
 
 /**
  * batadv_choose_claim() - choose the right bucket for a claim.
- * @data: data to hash
+ * @data: &struct batadv_bla_claim_key to hash
  * @size: size of the hash table
  *
  * Return: the hash index of the claim
  */
 static inline u32 batadv_choose_claim(const void *data, u32 size)
 {
-	const struct batadv_bla_claim *claim = data;
+	const struct batadv_bla_claim_key *key = data;
 	u32 hash = 0;
 
-	hash = jhash(&claim->addr, sizeof(claim->addr), hash);
-	hash = jhash(&claim->vid, sizeof(claim->vid), hash);
+	hash = jhash(&key->addr, sizeof(key->addr), hash);
+	hash = jhash(&key->vid, sizeof(key->vid), hash);
 
 	return hash % size;
 }
@@ -119,24 +119,24 @@ static bool batadv_compare_backbone_gw(const struct hlist_node *node,
 }
 
 /**
- * batadv_compare_claim() - compare address and vid of two claims
- * @node: list node of the first entry to compare
- * @data2: pointer to the second claims
+ * batadv_compare_claim() - compare key of a claim with a search key
+ * @node: list node of the claim to compare
+ * @data2: &struct batadv_bla_claim_key to compare with
  *
- * Return: true if the claims have the same data, false otherwise
+ * Return: true if the claim has the given key, false otherwise
  */
 static bool batadv_compare_claim(const struct hlist_node *node,
 				 const void *data2)
 {
-	const void *data1 = container_of(node, struct batadv_bla_claim,
-					 hash_entry);
-	const struct batadv_bla_claim *cl1 = data1;
-	const struct batadv_bla_claim *cl2 = data2;
+	const struct batadv_bla_claim_key *key = data2;
+	const struct batadv_bla_claim *claim;
+
+	claim = container_of(node, struct batadv_bla_claim, hash_entry);
 
-	if (!batadv_compare_eth(cl1->addr, cl2->addr))
+	if (!batadv_compare_eth(claim->key.addr, key->addr))
 		return false;
 
-	if (cl1->vid != cl2->vid)
+	if (claim->key.vid != key->vid)
 		return false;
 
 	return true;
@@ -188,7 +188,7 @@ static void batadv_claim_release(struct kref *ref)
 	spin_unlock_bh(&claim->backbone_lock);
 
 	spin_lock_bh(&old_backbone_gw->crc_lock);
-	old_backbone_gw->crc ^= crc16(0, claim->addr, ETH_ALEN);
+	old_backbone_gw->crc ^= crc16(0, claim->key.addr, ETH_ALEN);
 	spin_unlock_bh(&old_backbone_gw->crc_lock);
 
 	batadv_backbone_gw_put(old_backbone_gw);
@@ -211,13 +211,13 @@ static void batadv_claim_put(struct batadv_bla_claim *claim)
 /**
  * batadv_claim_hash_find() - looks for a claim in the claim hash
  * @bat_priv: the bat priv with all the mesh interface information
- * @data: search data (may be local/static data)
+ * @key: key of the searched claim
  *
  * Return: claim if found or NULL otherwise.
  */
 static struct batadv_bla_claim *
 batadv_claim_hash_find(struct batadv_priv *bat_priv,
-		       struct batadv_bla_claim *data)
+		       const struct batadv_bla_claim_key *key)
 {
 	struct batadv_hashtable *hash = bat_priv->bla.claim_hash;
 	struct batadv_bla_claim *claim_tmp = NULL;
@@ -228,12 +228,12 @@ batadv_claim_hash_find(struct batadv_priv *bat_priv,
 	if (!hash)
 		return NULL;
 
-	index = batadv_choose_claim(data, hash->size);
+	index = batadv_choose_claim(key, hash->size);
 	head = &hash->table[index];
 
 	rcu_read_lock();
 	hlist_for_each_entry_rcu(claim, head, hash_entry) {
-		if (!batadv_compare_claim(&claim->hash_entry, data))
+		if (!batadv_compare_claim(&claim->hash_entry, key))
 			continue;
 
 		if (!kref_get_unless_zero(&claim->refcount))
@@ -615,7 +615,8 @@ static void batadv_bla_answer_request(struct batadv_priv *bat_priv,
 			if (claim->backbone_gw != backbone_gw)
 				continue;
 
-			batadv_bla_send_claim(bat_priv, claim->addr, claim->vid,
+			batadv_bla_send_claim(bat_priv, claim->key.addr,
+					      claim->key.vid,
 					      BATADV_CLAIM_TYPE_CLAIM);
 		}
 		rcu_read_unlock();
@@ -688,15 +689,15 @@ static void batadv_bla_add_claim(struct batadv_priv *bat_priv,
 				 struct batadv_bla_backbone_gw *backbone_gw)
 {
 	struct batadv_bla_backbone_gw *old_backbone_gw;
-	struct batadv_bla_claim search_claim;
+	struct batadv_bla_claim_key claim_key;
 	struct batadv_bla_claim *claim;
 	int hash_added;
 	u16 claim_crc;
 	bool changed;
 
-	ether_addr_copy(search_claim.addr, mac);
-	search_claim.vid = vid;
-	claim = batadv_claim_hash_find(bat_priv, &search_claim);
+	ether_addr_copy(claim_key.addr, mac);
+	claim_key.vid = vid;
+	claim = batadv_claim_hash_find(bat_priv, &claim_key);
 	claim_crc = crc16(0, mac, ETH_ALEN);
 
 	/* create a new claim entry if it does not exist yet. */
@@ -705,9 +706,9 @@ static void batadv_bla_add_claim(struct batadv_priv *bat_priv,
 		if (!claim)
 			return;
 
-		ether_addr_copy(claim->addr, mac);
+		ether_addr_copy(claim->key.addr, mac);
+		claim->key.vid = vid;
 		spin_lock_init(&claim->backbone_lock);
-		claim->vid = vid;
 		WRITE_ONCE(claim->lasttime, jiffies);
 		kref_get(&backbone_gw->refcount);
 		claim->backbone_gw = backbone_gw;
@@ -720,7 +721,7 @@ static void batadv_bla_add_claim(struct batadv_priv *bat_priv,
 		kref_get(&claim->refcount);
 		hash_added = batadv_hash_add(bat_priv->bla.claim_hash,
 					     batadv_compare_claim,
-					     batadv_choose_claim, claim,
+					     batadv_choose_claim, &claim->key,
 					     &claim->hash_entry);
 
 		if (unlikely(hash_added != 0)) {
@@ -813,12 +814,12 @@ static void batadv_bla_del_claim(struct batadv_priv *bat_priv,
 {
 	struct batadv_bla_claim *claim_removed_entry;
 	struct hlist_node *claim_removed_node;
-	struct batadv_bla_claim search_claim;
+	struct batadv_bla_claim_key claim_key;
 	struct batadv_bla_claim *claim;
 
-	ether_addr_copy(search_claim.addr, mac);
-	search_claim.vid = vid;
-	claim = batadv_claim_hash_find(bat_priv, &search_claim);
+	ether_addr_copy(claim_key.addr, mac);
+	claim_key.vid = vid;
+	claim = batadv_claim_hash_find(bat_priv, &claim_key);
 	if (!claim)
 		return;
 
@@ -827,7 +828,8 @@ static void batadv_bla_del_claim(struct batadv_priv *bat_priv,
 
 	claim_removed_node = batadv_hash_remove(bat_priv->bla.claim_hash,
 						batadv_compare_claim,
-						batadv_choose_claim, claim);
+						batadv_choose_claim,
+						&claim->key);
 	if (!claim_removed_node)
 		goto free_claim;
 
@@ -1355,11 +1357,11 @@ static void batadv_bla_purge_claims(struct batadv_priv *bat_priv,
 purge_now:
 			batadv_dbg(BATADV_DBG_BLA, bat_priv,
 				   "%s(): %pM, vid %d\n", __func__,
-				   claim->addr, claim->vid);
+				   claim->key.addr, claim->key.vid);
 
 			batadv_handle_unclaim(bat_priv, primary_if,
 					      backbone_gw->orig,
-					      claim->addr, claim->vid);
+					      claim->key.addr, claim->key.vid);
 skip:
 			batadv_backbone_gw_put(backbone_gw);
 			batadv_claim_put(claim);
@@ -1960,8 +1962,8 @@ bool batadv_bla_rx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 		   unsigned short vid, int packet_type)
 {
 	struct batadv_bla_backbone_gw *backbone_gw;
+	struct batadv_bla_claim_key claim_key;
 	struct batadv_bla_claim *claim = NULL;
-	struct batadv_bla_claim search_claim;
 	struct batadv_hard_iface *primary_if;
 	struct ethhdr *ethhdr;
 	bool own_claim;
@@ -2007,9 +2009,9 @@ bool batadv_bla_rx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 	    batadv_bla_check_ucast_duplist(bat_priv, skb))
 		goto handled;
 
-	ether_addr_copy(search_claim.addr, ethhdr->h_source);
-	search_claim.vid = vid;
-	claim = batadv_claim_hash_find(bat_priv, &search_claim);
+	ether_addr_copy(claim_key.addr, ethhdr->h_source);
+	claim_key.vid = vid;
+	claim = batadv_claim_hash_find(bat_priv, &claim_key);
 
 	if (!claim) {
 		bool local = batadv_is_my_client(bat_priv, ethhdr->h_source, vid);
@@ -2098,8 +2100,8 @@ bool batadv_bla_tx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 		   unsigned short vid)
 {
 	struct batadv_bla_backbone_gw *backbone_gw;
+	struct batadv_bla_claim_key claim_key;
 	struct batadv_bla_claim *claim = NULL;
-	struct batadv_bla_claim search_claim;
 	struct batadv_hard_iface *primary_if;
 	struct ethhdr *ethhdr;
 	bool client_roamed;
@@ -2122,10 +2124,10 @@ bool batadv_bla_tx(struct batadv_priv *bat_priv, struct sk_buff *skb,
 		if (is_multicast_ether_addr(ethhdr->h_dest))
 			goto handled;
 
-	ether_addr_copy(search_claim.addr, ethhdr->h_source);
-	search_claim.vid = vid;
+	ether_addr_copy(claim_key.addr, ethhdr->h_source);
+	claim_key.vid = vid;
 
-	claim = batadv_claim_hash_find(bat_priv, &search_claim);
+	claim = batadv_claim_hash_find(bat_priv, &claim_key);
 
 	/* if no claim exists, allow it. */
 	if (!claim)
@@ -2231,8 +2233,8 @@ batadv_bla_claim_dump_entry(struct sk_buff *msg, u32 portid,
 			goto put_backbone_gw;
 		}
 
-	if (nla_put(msg, BATADV_ATTR_BLA_ADDRESS, ETH_ALEN, claim->addr) ||
-	    nla_put_u16(msg, BATADV_ATTR_BLA_VID, claim->vid) ||
+	if (nla_put(msg, BATADV_ATTR_BLA_ADDRESS, ETH_ALEN, claim->key.addr) ||
+	    nla_put_u16(msg, BATADV_ATTR_BLA_VID, claim->key.vid) ||
 	    nla_put(msg, BATADV_ATTR_BLA_BACKBONE, ETH_ALEN,
 		    backbone_gw->orig) ||
 	    nla_put_u16(msg, BATADV_ATTR_BLA_CRC,
@@ -2527,8 +2529,8 @@ bool batadv_bla_check_claim(struct batadv_priv *bat_priv,
 {
 	struct batadv_hard_iface *primary_if = NULL;
 	struct batadv_bla_backbone_gw *backbone_gw;
+	struct batadv_bla_claim_key claim_key;
 	struct batadv_bla_claim *claim = NULL;
-	struct batadv_bla_claim search_claim;
 	bool ret = true;
 
 	if (!READ_ONCE(bat_priv->bridge_loop_avoidance))
@@ -2539,10 +2541,10 @@ bool batadv_bla_check_claim(struct batadv_priv *bat_priv,
 		return ret;
 
 	/* First look if the mac address is claimed */
-	ether_addr_copy(search_claim.addr, addr);
-	search_claim.vid = vid;
+	ether_addr_copy(claim_key.addr, addr);
+	claim_key.vid = vid;
 
-	claim = batadv_claim_hash_find(bat_priv, &search_claim);
+	claim = batadv_claim_hash_find(bat_priv, &claim_key);
 
 	/* If there is a claim and we are not owner of the claim,
 	 * return false.
diff --git a/net/batman-adv/types.h b/net/batman-adv/types.h
index b3edfc71af4a7..9d43e9cac0cc6 100644
--- a/net/batman-adv/types.h
+++ b/net/batman-adv/types.h
@@ -1836,14 +1836,22 @@ struct batadv_bla_backbone_gw {
 };
 
 /**
- * struct batadv_bla_claim - claimed non-mesh client structure
+ * struct batadv_bla_claim_key - key of a claim in &batadv_priv_bla.claim_hash
  */
-struct batadv_bla_claim {
+struct batadv_bla_claim_key {
 	/** @addr: mac address of claimed non-mesh client */
 	u8 addr[ETH_ALEN] __aligned(2);
 
 	/** @vid: vlan id this client was detected on */
 	unsigned short vid;
+};
+
+/**
+ * struct batadv_bla_claim - claimed non-mesh client structure
+ */
+struct batadv_bla_claim {
+	/** @key: hash key identifying the claim */
+	struct batadv_bla_claim_key key;
 
 	/** @backbone_gw: pointer to backbone gw claiming this client */
 	struct batadv_bla_backbone_gw *backbone_gw;
-- 
2.47.3

