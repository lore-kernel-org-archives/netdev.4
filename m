Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.38.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454322;
	b=hgR4ibFzywcXucDCoX22eGi0M/IKUECzRPzuUDpfLatamb6Www6vFKH2nFs2nqUzd0RO
	 fyOit10J7ELjXB46KyVUJ/AuULwdgbxIx40bBKwhWF9IMyJZr0opz4cK29PS/gP1HVHTz
	 yorevQ8yGChbqHCWQGmO/yYhXXBtp94onq9VE0m9fWPIGy/0UmabSl7xUlgq5fM9vcBVa
	 qJhwIQ8BspQlbqMgZLNVqJ2zQOVnmc7GuNJfbTuwGpuEmfwOK6mqVbQ7OHNgha+o473o7
	 R34tR3Xl//NT8Xf0b22j/skm7QsyQtjrego3bDGmL26LPc+fGXeQtsLylOBR8j3X6HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454322;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ux7RoI3q/q6IS/J7nuLk3xttccdt6yzu4InzHrHTg0Y=;
	b=hMpZEEPkQ5JxOQUSjRtzOX07sD2ytPiO/wIOSyZRnV6NOYqvAa3g/w2LvQesFa0qPsBK
	 2I+RWdLuY3X8gXFr/iYgZ5/188kSmzosRrjnfrt9OyoSIH+Mn9gOKxdFZ32WUgV+5uFb7
	 udP7CA1xqnvHZcVELZdUgQRQhkrYEK2PBr1aT/YZPrx6sp7xhl/aedWTRNiByw4Mmveal
	 ycz474JN3vvbgoovMk4JprFZPokCLfUz64w68Gs4vLj7yrbri1s93H9hM8AIXhGjiu8Z5
	 HfSKKuXQSCQXUry1hWN/IEzNomiXquzFwMKSErfQHImPyvHdXomp8YvmqMs+M6a+vAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=simonwunderlich.de;
	spf=pass smtp.mailfrom=simonwunderlich.de;
	dkim=pass header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=FChvYkMm;
	arc=none smtp.remote-ip=23.88.38.48
Received: from mail.simonwunderlich.de (mail.simonwunderlich.de [23.88.38.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B0B59606A33F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B59606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simonwunderlich.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=FChvYkMm
Received: from kero.packetmixer.de (p200300C59714C2E05A704819B6ba2dB4.dip0.t-ipconnect.de [IPv6:2003:c5:9714:c2e0:5a70:4819:b6ba:2db4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 72826FA3DE;
	Mon, 23 Nov 2026 18:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1795454316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ux7RoI3q/q6IS/J7nuLk3xttccdt6yzu4InzHrHTg0Y=;
	b=FChvYkMmWoxDrBiYh9wf1t1RdoKrAqrwPwMfTRtKWItX+tEkE6hvhaxkMlMV3gLiq/OeH6
	hLAB2zMg+XXpFo9CAEySSj4ulI5wgXU2N01diWF6WjUnjWSTDIxtBjOx1ahHlobcETnCAl
	wX2FtUOzVl/S7qR5akV51X/CDVC4xNvEKc6/oRbBKKBYd0OPTH8B8b+EP+0O+foctjcfO1
	PBN9VhtsLDp7FiuKwp4NeRbCQd45WJf4YQkcTIgL8RBmjHGtdLb5MrGMmQcuIy6Sh16xSx
	RGYQz4b75/DD5lC7ZxREaZJNrNbpMs9j7h7enBY7/15onbyCPPrAbP2C7IAbyw==
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
Subject: [PATCH net-next 05/15] batman-adv: tt: unhash local entries with hlist_del_init_rcu()
Date: Mon, 23 Nov 2026 18:18:17 +0100
Message-ID: <20261123171827.3294525-6-sw@simonwunderlich.de>
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

A context which looked up a local TT entry via RCU has no way to find out
whether the entry was removed from the local hash in the meantime.
hlist_del_rcu() leaves the pprev pointer of the node untouched and
hlist_unhashed() therefore still reports the entry as hashed.

Use hlist_del_init_rcu() when a local entry is unhashed by
batadv_tt_local_purge_pending_clients() and batadv_tt_local_table_free().
hlist_unhashed() can then be used under the hash bucket list_lock to check
whether an entry is still part of the local table.

batadv_tt_local_remove_now() still unhashes via batadv_hash_remove(). It is
converted when it is merged into the locked removal path.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 net/batman-adv/translation-table.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 1807a498d694..1c784a0e8c9b 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1887,7 +1887,7 @@ static void batadv_tt_local_table_free(struct batadv_priv *bat_priv)
 		spin_lock_bh(list_lock);
 		hlist_for_each_entry_safe(tt_common_entry, node_tmp,
 					  head, hash_entry) {
-			hlist_del_rcu(&tt_common_entry->hash_entry);
+			hlist_del_init_rcu(&tt_common_entry->hash_entry);
 			tt_local = container_of(tt_common_entry,
 						struct batadv_tt_local_entry,
 						common);
@@ -4464,7 +4464,7 @@ static void batadv_tt_local_purge_pending_clients(struct batadv_priv *bat_priv)
 					   tt_common->key.addr,
 					   batadv_print_vid(tt_common->key.vid));
 
-				hlist_del_rcu(&tt_common->hash_entry);
+				hlist_del_init_rcu(&tt_common->hash_entry);
 				atomic_inc(&hash->generation);
 
 				/* An entry which still carries BATADV_TT_CLIENT_NEW was
-- 
2.47.3

