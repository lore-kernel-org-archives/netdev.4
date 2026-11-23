Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454323;
	b=juEuuz4HfzIMXlA1q2BHSTSdElU5w7q6JCLUJTI+F0wncnNR0bUZ2YnZWqIS+HvQBzBE
	 rO0Jzj9UlujeHUq4YlH/pNN5sRcC9mK6tGr22klP2XAtHBJz+zT+sEEGBRMzl043adp8r
	 ZwuYDoROvOIt9zGKSkh5b6dSPqmnomrbxiAWksS3V251SewegZal8mcNxRFX86kVOlXC/
	 WNgOAdZLp9vIWmi/nDWOJnBiRhLL83YbkjuWkM9sGzPLouCDqEbh1fSy1DN8h4raJfGsn
	 /zaeu2D6biSBw48+zkvM1HVUHybIuIkJ1KV68krJK+Gvdwu1dSq0idoZGYaKWwQe6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454323;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oJvHQFMgooA7UahwimsOb3OkFjRJ0W83iVe8uaAwcJo=;
	b=kQNbJNejnQzr8AoJhMdRCPi2kDFnh0VPZQIv9FT48lQ4hVd0LG9wAnSM4hCl4airaB4a
	 qTx86uaPgfnnuqESLJU2nA+DH+awGJWu8DrmeYqSw3UA0Iq9jj7HcW5QvtXJ2Cib0YkXV
	 Kjo6KlfZaew0pNHCeR10mGkw5MPuCldFbI4E4V04n2HR+uE3SnKXSQzO6/JepMvryb9qJ
	 nFsbIXRMw6oUcQBZbk5AX3Ek7W+iMdMWVPyVugtMgdcb+Tcsniqz+3crH+Acj98hcZgmV
	 NGsL6Jand/0BrxaiRO/K3itmrNO8cCjVZijHJNdaPNI9bEnDLImUBx3uBfbsHwi8b9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=aSXbZnpz;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 2CFA4606A33D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFA4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=aSXbZnpz
Received: from kero.packetmixer.de (p200300C59714C2e05a704819B6ba2dB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 61A1BFA3E2;
	Mon, 23 Nov 2026 18:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oJvHQFMgooA7UahwimsOb3OkFjRJ0W83iVe8uaAwcJo=;
	b=aSXbZnpzBuOvGm4Ekc6962RsfPVSRVOMkKFf24ZO4q1PKDwcYOvS3+01CtwP+Lp8C8UoED
	ZYfSRXARLYvs3+VlXrGZop48llPG22oU587wNC2iTE8VPJCkCnYacR26ZV0+B+RUvcnydh
	sjYoI1lGJcevePFeCfPgGvsLXGTMe9qGxY+7mu/FAVNzG8/6+4kJoE/WHcbvlNuBTPyzpu
	1DE93c+KzNlmptbMLNjHc6zz/B5qGsRVL9ydCj6RwQRkSedSCrAg6t05Cw/sFBCeRgDnGo
	7/gaqJ4/JUshZa8lHCMhzdVJIFccT8r8PmSCjxlu17mIH6UEl/cHrR677xgtRw==
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
Subject: [PATCH net-next 09/15] batman-adv: tt: remove unannounced local entries via pending state
Date: Mon, 23 Nov 2026 18:18:21 +0100
Message-ID: <20261123171827.3294525-10-sw@simonwunderlich.de>
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

batadv_tt_local_remove_entry() unhashes an entry which still carries
BATADV_TT_CLIENT_NEW immediately because it was not yet announced to the
other nodes. But the flag is only cleared at the end of the commit. The ADD
of the entry might therefore already have been taken for the next TTVN when
the flag is checked.

Handle such an entry like an already announced one: queue the DEL and mark
the entry as BATADV_TT_CLIENT_PENDING. It is then removed from the local
table when the pending entries are purged by the next commit.
batadv_tt_local_purge_pending_clients() already takes care of not
uncounting an entry which was never counted.

This also leaves the commit as the only place which finishes the removal of
a local entry. A follow-up change relies on this to apply exactly the
announced changes to the local table.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 35 +++++-------------------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 2828e362640a..977f62c88da7 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1745,13 +1745,11 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
  * @roaming: true if the deletion is due to a roaming event
  * @curr_flags: pointer to store the flags of the entry before it was removed
  *
- * For an already announced entry, the (roamed) DEL change is queued and the
- * entry is marked as BATADV_TT_CLIENT_PENDING by batadv_tt_local_set_pending().
- * It stays in the local table until the next ttvn increment.
- *
- * An entry which still carries BATADV_TT_CLIENT_NEW was added right after the
- * last ttvn increment and was not (yet) announced. It is therefore removed
- * from the local table immediately.
+ * The (roamed) DEL change is queued and the entry is marked as
+ * BATADV_TT_CLIENT_PENDING by batadv_tt_local_set_pending(). It stays in the
+ * local table until the DEL is committed with the next ttvn increment. This
+ * also applies to an entry which still carries BATADV_TT_CLIENT_NEW because its
+ * ADD might already have been taken for the next ttvn.
  *
  * An entry which was already removed from the local table after it was looked
  * up is ignored and BATADV_NO_FLAGS is stored in @curr_flags.
@@ -1770,7 +1768,6 @@ batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,
 	spinlock_t *list_lock; /* protects write access to the hash lists */
 	struct batadv_tt_common_entry *common = &tt_local_entry->common;
 	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
-	bool unhashed = false;
 	u16 flags;
 	u32 i;
 
@@ -1795,24 +1792,6 @@ batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,
 		if (roaming)
 			common->flags |= BATADV_TT_CLIENT_ROAM;
 
-		if (common->flags & BATADV_TT_CLIENT_NEW) {
-			batadv_dbg(BATADV_DBG_TT, bat_priv,
-				   "Deleting local tt entry (%pM, vid: %d): %s\n",
-				   common->key.addr,
-				   batadv_print_vid(common->key.vid), message);
-
-			hlist_del_init_rcu(&common->hash_entry);
-			atomic_inc(&hash->generation);
-
-			/* The entry was never announced and was therefore
-			 * never counted in the local table size.
-			 */
-			__batadv_tt_local_event(bat_priv, common,
-						common->flags | BATADV_TT_CLIENT_DEL);
-			unhashed = true;
-			break;
-		}
-
 		flags = BATADV_TT_CLIENT_DEL;
 		if (roaming)
 			flags |= BATADV_TT_CLIENT_ROAM;
@@ -1822,10 +1801,6 @@ batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,
 	}
 
 	spin_unlock_bh(list_lock);
-
-	/* drop reference of removed hash entry */
-	if (unhashed)
-		batadv_tt_local_entry_put(tt_local_entry);
 }
 
 /**
-- 
2.47.3

