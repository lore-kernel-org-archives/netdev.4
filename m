Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552435;
	b=wr2QZ1dx88mVJOpCOFuCv8//6O72WaQB1KyDSOGaeAxW5b/oQl5Vg9ODtf2mTZcwMGaS
	 sa4pwYfe7fucNgoMiuRXcnP7DvmByYWD5bxdkNbwpoWt2lpxqDQDPsb9RlizGvYF8H1y4
	 6Z4byJg/owaVtMaa3fNGsAL5NvwheRbPnQT7rYCMGp80/eqTq8bq9YkCWDLwfAb64ebYK
	 VKs19A50TwsbHGSd9Mb7sawyq2QUa+3vbE7VGplbhpMMxkFfwaZUfbHQXdfDnVIuzS4w9
	 vgMfJZZIz9DGBehHCZ3yzMCctY7XuaRPE/Dhbss8qaEbFQSgUkuCEBksu4eNTbKb0gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552435;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=c2MHqh4y5WDPKpOHCTYLK4aLHvmoORxaMjltvDY0H5s=;
	b=G5V0rEjbYmlBeSFaUveZPYAi8zHR+C69hdxgKGiLxrQ+Cc85Ap1Pu6c8wTaG/Vb/vpsA
	 IIZzxqUFqNL47GwbWTbFVHW/L+DI1s2WOD6QueYQxibJIOdU9CCisfLIfvfmqLhwdoZoU
	 GAD2lq8cMed0rrxtCfmubIO9oL1vpoG4nf7oHkV23/53oBhMKUOB+hFd+fHhri8tnpevG
	 Wcqtd3kphsul8I6AsDdsj6JV6DYWtS21gkF8gsUvFV1Jz6PdUuhAceRNl9wFp+OP7ulxp
	 ZCAhPUarMhMLh19Q2ICOUypClH+OWMYM+jyuKkW2EgwP/5Nbk/h6qKR/gclWpgDyTkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=Kk7aX5n7;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D1606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=Kk7aX5n7
Received: by dvalin.narfation.org (Postfix) id 5BE672026D;
	Tue, 24 Nov 2026 20:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795552432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c2MHqh4y5WDPKpOHCTYLK4aLHvmoORxaMjltvDY0H5s=;
	b=Kk7aX5n7S10xJ7PJRCV186lqIz3a7ff6GoQED937p6ZtDyMf8eTzBh6y4KxTW4eES/xXFv
	PF1Aoecz27L8gbQEyUZ98lX4ON2+n747mdGp6n/UlKEuF+1Avsag+NoFW3Ov47Iz7l0fVZ
	hxQWAVqkq5gptquRT2ZAqIdAN19Aaxk=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 13/15] batman-adv: tt: commit only the announced local
 changes
Date: Tue, 24 Nov 2026 21:33:49 +0100
Message-ID: <4550986.ejJDZkT8p0@sven-desktop>
In-Reply-To: <179554084776.3135.15585552473847641901@kernel.org>
References:
 <20261123171827.3294525-14-sw@simonwunderlich.de>
 <179554084776.3135.15585552473847641901@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2295529.Mh6RI2rZIc";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2295529.Mh6RI2rZIc
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 21:33:49 +0100
Message-ID: <4550986.ejJDZkT8p0@sven-desktop>
In-Reply-To: <179554084776.3135.15585552473847641901@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:47 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
> > index 2a7f50de70fc8..b03d6c74732f4 100644
> > --- a/net/batman-adv/translation-table.c
> > +++ b/net/batman-adv/translation-table.c
> 
> [ ... ]
> 
> > @@ -1876,9 +1882,8 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
> >   *
> >   * All checks and modifications happen under the hash bucket list_lock and the
> >   * flags_lock of the entry. This prevents a concurrent
> > - * batadv_tt_local_purge_pending_clients() from removing the entry,
> > - * batadv_tt_local_transition_new() from clearing BATADV_TT_CLIENT_NEW and
> > - * batadv_tt_local_refresh() from modifying the entry after it was checked.
> > + * batadv_tt_local_commit_change() from removing the entry and
> > + * batadv_tt_local_refresh() from modifying it after it was checked.
> >   */
> 
> [Severity: Low]
> Should batadv_tt_local_purge_pending_clients() still be listed here?

Will adjust it in a follow up patch:

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index ede6c15581242dc3fe6ecdb1ba0fab3ab601faa7..22197827fa5d220850d57e6697393ac098d0cd03 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -2001,8 +2001,9 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
  *
  * All checks and modifications happen under the hash bucket list_lock and the
  * flags_lock of the entry. This prevents a concurrent
- * batadv_tt_local_commit_change() from removing the entry and
- * batadv_tt_local_refresh() from modifying it after it was checked.
+ * batadv_tt_local_commit_change() or batadv_tt_local_purge_pending_clients()
+ * from removing the entry and batadv_tt_local_refresh() from modifying it after
+ * it was checked.
  */
 static void
 batadv_tt_local_remove_entry(struct batadv_priv *bat_priv,


[...]
> On a related note, the comment in batadv_tt_local_unhash() is no longer
> accurate:
> 
>     /* An entry which still carries BATADV_TT_CLIENT_NEW was never counted
>      * and must not be uncounted here.
>      */
>     if (!(tt_common->flags & BATADV_TT_CLIENT_NEW))
>         batadv_tt_local_size_dec(bat_priv, tt_common->key.vid);
> 
> batadv_tt_local_commit_change() can now set NEW again on an entry that
> was already counted, and it uncounts that entry with
> batadv_tt_local_size_dec(). The accounting is still correct, because NEW
> means "not counted right now". But "was never counted" is wrong for such
> entries. Could this comment be updated too? Later patches in the series
> change neither comment.

Will adjust it in a follow up patch:

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 2c15890bc56fe195d361e51faaea602e9d37a51c..ede6c15581242dc3fe6ecdb1ba0fab3ab601faa7 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -1897,8 +1897,8 @@ static void batadv_tt_local_unhash(struct batadv_priv *bat_priv,
 	hlist_del_init_rcu(&tt_common->hash_entry);
 	atomic_inc(&hash->generation);
 
-	/* An entry which still carries BATADV_TT_CLIENT_NEW was never counted
-	 * and must not be uncounted here.
+	/* An entry which carries BATADV_TT_CLIENT_NEW is currently not counted
+	 * because its ADD was not committed yet. It must not be uncounted here.
 	 */
 	if (!(tt_common->flags & BATADV_TT_CLIENT_NEW))
 		batadv_tt_local_size_dec(bat_priv, tt_common->key.vid);

> [ ... ]
> 
> > +/**
> > + * batadv_tt_local_commit_change() - apply a committed change to the local table
> > + * @bat_priv: the bat priv with all the mesh interface information
> > + * @change: the change which is announced with the new ttvn
> > + *
> > + * The CRC and the full table responses of a ttvn must reflect exactly the
> > + * changes announced with it. Only the entry affected by a committed change is
> > + * therefore modified. An entry which was added or marked for removal after the
> > + * change set was taken stays in its current state until its own change is
> > + * committed with a later ttvn.
[...]
> [Severity: Medium]
> Does this fully meet the invariant in the kernel-doc above ("must
> reflect exactly the changes announced with it") when flags change?
> 
> The CRC-relevant flags BATADV_TT_CLIENT_WIFI and BATADV_TT_CLIENT_ISOLA
> are in BATADV_TT_SYNC_MASK. They are still written to the live entry
> when their ADD is queued, not when that ADD is committed. That happens
> in batadv_tt_local_refresh_locked(), reached through
> batadv_tt_local_add()->batadv_tt_local_refresh().

Yes, this is a known limitation (already a problem before this patch) and 
there is currently no solution for it.

Regards,
	Sven
--nextPart2295529.Mh6RI2rZIc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawX0rQAKCRBND3cr0xT1
y+i5AQCgUGBIbkpisvyzL1r0r90uel7EiTPu3WI7SXqY0LDT8wD9HAPO4VUiADmC
LDascDZeo9MranIFLWiQlQToz6QESg8=
=WIOJ
-----END PGP SIGNATURE-----

--nextPart2295529.Mh6RI2rZIc--



