Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551384;
	b=eAluDUXQ2jD2gaeKGD4p0fOyag9zSFOeYx4crOHRkHLbmSZyBmYdO1pD4q/fqgMoK5WU
	 ihWe+i3+JMmMHy3+E2T8FuuiF+wDCVeapyZ2VYPpn7qfQXYyRB3+Y1tG44y4AjZMINFov
	 8vQliBIGOEj/pmILyUtw5ApA4n36VB8z5I9RHzgtqVFfcvJAYPTJF/Ntbav4DkE/nw4or
	 z5flbu7qYf1QA/LRrvN+WOM9fV7KMsWIb82GqctfY/iUeuTCCiX1dcs8gV4CSV8ZeJ52d
	 SDEIbfGy+A1nGXPhaThDSorAwv6LZe5RP/yqBvDUHmoSy7Sr6PUL3rAVeX/BRgLRtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551384;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=SgFAIxmUxHx6nwXdXG+ldkr9MHmCx9LhmQjMWY/spG0=;
	b=gDcVxLK3JaThMu7GdmVCU+WpisYiQv1r7NY6YIQ1XKj58xqxIhftJSa/rG4aTPrihvKQ
	 zMXJGxtQxNpPCdtUyGGzJTxv4YyPGbzDAoFVrqOTR3/o22e9xYpnjfeLmSU6KpOabn/fH
	 FZarpIbVfs/IOft9SBiXQbLrY5e2QhBLf08aJ6TcPZnJnkzt/l3N7lJouvZP71kOp/nKS
	 IQi7fOAb9Fz5AWeLhzcBk9FEwALqQYAaCU5JmNxoYKD8kRB3FMVbR6JyeZZPOXJyMjJZH
	 0b72vepc/o50BO8jUIOCACoXuDmjUF4t9PkNiSQcv/TYxZAbpEsNkQFamRqfysZXHaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=PwJkcziC;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C222606A329
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C222606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=PwJkcziC
Received: by dvalin.narfation.org (Postfix) id 30A1B20277;
	Tue, 24 Nov 2026 20:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795551380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgFAIxmUxHx6nwXdXG+ldkr9MHmCx9LhmQjMWY/spG0=;
	b=PwJkcziCmpqUvZ/HiSYOCKPpIowJw/+L6uygO5ZzEB6NqmQCyC8LnNtlOPYFkEZ7PrlBO8
	vYH4avZaILBs1cEMLgsbM4G2qZU+pnxPfVNCSa4J9lNDxwUqRd1Vb59tZPqgPfk2meOncj
	Ovpj4lTPGA0Qmac+fjHSWJgR4+OnUFI=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 12/15] batman-adv: tt: extract removal of pending local
 entry
Date: Tue, 24 Nov 2026 21:16:15 +0100
Message-ID: <8807006.NyiUUSuA9g@sven-desktop>
In-Reply-To: <179554084613.3135.2138652598368843379@kernel.org>
References:
 <20261123171827.3294525-13-sw@simonwunderlich.de>
 <179554084613.3135.2138652598368843379@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2081065.usQuhbGJ8B";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2081065.usQuhbGJ8B
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 21:16:15 +0100
Message-ID: <8807006.NyiUUSuA9g@sven-desktop>
In-Reply-To: <179554084613.3135.2138652598368843379@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:46 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > @@ -4550,6 +4588,43 @@ static void batadv_tt_local_transition_new(struct batadv_priv *bat_priv)
> >  	}
> >  }
> >  
> > +/**
> > + * batadv_tt_local_unhash_pending() - remove a pending entry from the local table
> > + * @bat_priv: the bat priv with all the mesh interface information
> > + * @tt_local: the local TT entry to remove
> > + *
> > + * Only an entry which is marked as BATADV_TT_CLIENT_PENDING and whose DEL was
> > + * queued is removed. An entry which still waits for its DEL (del_unqueued) must
> > + * stay in the local table until batadv_tt_local_purge_list() was able to queue
> > + * it.
> > + *
> > + * The caller must hold the hash bucket list_lock and the flags_lock of the
> > + * entry.
> > + *
> > + * Return: true if the entry was unhashed and the caller has to drop the
> > + * reference of the hash, false otherwise.
> > + */
[...]
> 
> [Severity: Low]
> This isn't a bug, but the kernel-doc of batadv_tt_local_unhash_pending()
> seems to leave out a requirement it inherits from batadv_tt_local_unhash().

Ok, will copy the requirements in a follow up patch:

diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index e08bf88b4b6d564a2a3b1564d1d5352b9df5947c..82eadd73b072550b712485485238d422ce0c2f6c 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -4744,10 +4744,10 @@ void batadv_tt_free(struct batadv_priv *bat_priv)
  * it.
  *
  * The caller must hold the hash bucket list_lock and the flags_lock of the
- * entry.
+ * entry. It must have checked that the entry is still part of the local table.
  *
  * Return: true if the entry was unhashed and the caller has to drop the
- * reference of the hash, false otherwise.
+ * reference of the hash after it released the flags_lock, false otherwise.
  */
 static bool
 batadv_tt_local_unhash_pending(struct batadv_priv *bat_priv,


Regards,
	Sven
--nextPart2081065.usQuhbGJ8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawXwjwAKCRBND3cr0xT1
y8ZcAP9s4KgI0PjASQjQDQBQJyvKA5PozpXSDkrSfM3qslnmvQEAxdXZ66oqEuz2
QlzRiLl+4gP05c56znDXTPX07YUpzQ0=
=/ih1
-----END PGP SIGNATURE-----

--nextPart2081065.usQuhbGJ8B--



