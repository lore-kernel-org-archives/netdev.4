Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554166;
	b=B5F4Vj+7hLZQ1HrLTK4+EflA4jtTscUiwI9XwcP7Mn1QIIg0R8f+E7UipEMH6cdnpcdd
	 dtwhQAAvRPwLBjC9xMM+aU0Q9uLY6Dk9jNTGfEDtuBjcO0wRwSQWmH/xE5hMfBt1eD9T8
	 DMNRfevdThiAPpAmkLgO/qPN7oYhTXB34np75BblPoD0jQnLSQYeYXUoQwbn5fJH8lU+u
	 0IGTTLSUOpSOW8oOiQMOKa+mOj8yCrZNNR4tv7ZNWkx1+0pB6UW2s5WpoE0gHZRL+YQ8f
	 d4olrmUJNpUamopyFwqlKxHbBED5IHz+dI3jTj6fvOYzx4F+GgXMwLFyg9TkNb02wZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554166;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=4JGiNssiIcSVO+k5XG7/GTij0g2M1gpRrtZJ04qYbvI=;
	b=IJwjw8+SlBdvjzjc7Zw8oZpYeF8jUZL3YPik9aSwBLFyV6dlEDdkCh2/r/GSIxyn1Dvk
	 cMEh5uABHTQ2uikkuoVxOlrEyOrQO1o7don4a5QcNi8lqsBKuf0RJIMeoiDzN00X1U6fx
	 AwmTFJyM5DsNFXcgdnaIsDZgskO+YMze5joeMs/BqCYUTpm/C3pKa2glgZUHJDFMoSZJr
	 dDAohhtQxdAH3KgOBmMZdNig+L3nHT40eC6Ff1Zk4GUvlNFCoEopH5OeFncbFuTFPqG1I
	 Vp24uYYcbwdshxzqSbiPpDERfFlbuM2CSArb4w+6Co8hx47riszt0AjFJGYqHIKmXBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=VBiFhedo;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E35606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=VBiFhedo
Received: by dvalin.narfation.org (Postfix) id 58AA02014F;
	Tue, 24 Nov 2026 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795554163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4JGiNssiIcSVO+k5XG7/GTij0g2M1gpRrtZJ04qYbvI=;
	b=VBiFhedo04EAIz/Qylw9LFm+7RRDT8VKIZchXKdAlsoVp+mSKZna2Uljn6qt1ciaWTMs/y
	xWRJSi6OPtnQcKTu+xqLSZXv4on9mFh78CIgsFkI619LkO4DpFAKpRvCKRU4LGgqAn5dDd
	jiRDNoyXGnkcr10W3+hF+3PsdtjICi8=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 15/15] batman-adv: tt: drop ADD+DEL events of never
 announced clients
Date: Tue, 24 Nov 2026 22:02:41 +0100
Message-ID: <2071514.yKVeVyVuyW@sven-desktop>
In-Reply-To: <179554084949.3135.16426370585063518179@kernel.org>
References:
 <20261123171827.3294525-16-sw@simonwunderlich.de>
 <179554084949.3135.16426370585063518179@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2249726.OBFZWjSADL";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2249726.OBFZWjSADL
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 22:02:41 +0100
Message-ID: <2071514.yKVeVyVuyW@sven-desktop>
In-Reply-To: <179554084949.3135.16426370585063518179@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:49 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > @@ -685,6 +692,9 @@ static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
> >  
> >  	lockdep_assert_held(&common->flags_lock);
> >  
> > +	if (cancelled)
> > +		*cancelled = false;
> > +
> >  	tt_change_node = kmem_cache_alloc(batadv_tt_change_cache, GFP_ATOMIC);
> >  	if (!tt_change_node)
> >  		return false;
> 
> [Severity: Low]
> Can the cancellation be skipped under memory pressure? In
> batadv_tt_local_event(), the new change node is allocated before
> changes_list is searched for a queued initial ADD.

See
https://patchwork.open-mesh.org/project/b.a.t.m.a.n./patch/20261124-event-late-allocation-v1-1-756780b98c10@narfation.org/

[...]
> > @@ -1883,6 +1919,11 @@ static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
> >   * retry it. Such an entry is marked as del_unqueued instead. It stays in the
> >   * local table until batadv_tt_local_purge_list() was able to queue its DEL.
> >   *
> > + * A client whose initial ADD is still queued was never announced to the other
> > + * nodes. Its DEL cancels the ADD and the entry is removed from the local table
> > + * right away. The caller has to drop the hash reference of the entry after it
> > + * released the flags_lock.
> > + *
> 
> [Severity: Low]
> This isn't a bug, but the first paragraph of the
> batadv_tt_local_set_pending() kernel-doc still reads:
> 
>  * The entry is kept in the local table until the next TTVN increment
>  * so that a consistency-check response can still be answered.
> 
> That is no longer always true with the new cancel path. Only this later
> paragraph mentions the exception.
> 
> The summary line of batadv_tt_local_remove() also still says "logically
> remove an entry from the local table". Through
> batadv_tt_local_remove()->batadv_tt_local_remove_entry()->
> batadv_tt_local_set_pending(), the entry can now be unhashed and freed
> before any TTVN increment.
> 
> Could both comments be updated? The callers of batadv_tt_local_remove()
> in mesh-interface.c and multicast.c rely on that description.

Will send a follow up patch:

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 7de69a30dda5de8f3e875acc21e4edfada838c9c..d69e5380f461c73443ddee949a2698ee02b8c0bf 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1964,8 +1964,9 @@ static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
  * @message: debug message describing the reason for the change
  *
  * Schedule the TT change announcement and set BATADV_TT_CLIENT_PENDING on the
- * entry. The entry is kept in the local table until the next TTVN increment
- * so that a consistency-check response can still be answered.
+ * entry. An entry which was already announced to the other nodes is kept in
+ * the local table until its DEL is committed with a TTVN increment so that a
+ * consistency-check response can still be answered.
  *
  * The entry is also marked as BATADV_TT_CLIENT_PENDING when the DEL could not
  * be queued. The removal must not be lost because not all callers are able to
@@ -2106,13 +2107,19 @@ batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,
 }
 
 /**
- * batadv_tt_local_remove() - logically remove an entry from the local table
+ * batadv_tt_local_remove() - remove an entry from the local table
  * @bat_priv: the bat priv with all the mesh interface information
  * @addr: the MAC address of the client to remove
  * @vid: VLAN identifier
  * @message: message to append to the log on deletion
  * @roaming: true if the deletion is due to a roaming event
  *
+ * An entry which was already announced to the other nodes is only removed
+ * logically. It is marked as BATADV_TT_CLIENT_PENDING and stays in the local
+ * table until its DEL is committed. An entry whose initial ADD is still queued
+ * is removed from the local table immediately. See
+ * batadv_tt_local_remove_entry() for details.
+ *
  * Return: the flags assigned to the local entry before being deleted
  */
 u16 batadv_tt_local_remove(struct batadv_priv *bat_priv, const u8 *addr,

> 
> [ ... ]
> 
> > @@ -1907,8 +1952,13 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
> >  	lockdep_assert_held(&hash->list_locks[i]);
> >  	lockdep_assert_held(&common->flags_lock);
> >  
> > -	queued = __batadv_tt_local_event(bat_priv, common,
> > -					 common->flags | flags);
> > +	queued = batadv_tt_local_event(bat_priv, common, common->flags | flags,
> > +				       false, &cancelled);
> > +	if (cancelled) {
> > +		/* the entry was never announced */
> > +		batadv_tt_local_unhash(bat_priv, tt_local_entry, message);
> > +		return true;
> > +	}
> 
> [Severity: Low]
> Does this hold when the DEL comes from a roaming event? The commit
> message says:
> 
>   The other nodes never heard about the client and don't need a DEL
>   for it.
[...]

There is too much text for a low severity at this time of day. Just made a 
note for later: https://www.open-mesh.org/issues/493

Regards,
	Sven

--nextPart2249726.OBFZWjSADL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawX7cQAKCRBND3cr0xT1
y50yAQDNQi+vtGSntlly8ShE3zzrK3+CZsHKQhJwg55Dds1DTgEA4K3LIwpHjAc+
91zj5Z+iAsW5VREI+Qgz6IsDpH/xzQg=
=MVS0
-----END PGP SIGNATURE-----

--nextPart2249726.OBFZWjSADL--



