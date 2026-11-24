Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549623;
	b=neNl5RR7V4+Wb0x5lV9GlGh1M9j8mHYE2s2Rw8n9f09JsuC0rtB8GA6uC0BfHtrwzbxf
	 3XdxopcwNJh8aoG+6viEqSflNSYfe6QFdDYCok5nPoLKL1ext9IYvJ26lriyJ8nv9kG29
	 SEZF2LbR18GAQN388KxlDrEvgzCTKbplrPCwtL0pLW1AIxC0alwPK3alCWwm/eNHilTkz
	 /ldnGOhAisq8HnP1dgAWm4I0aa9ZFz7ZxPByJ1WpuS0in4e4mLlNByxMSe9uYiz4JGACP
	 rbUzF7a1zJlryXIXPLaD31K6oiyXf+XUTpURbtnvgDVSbWtxgi5QIilcUFw1GT/nVIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549623;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=cJRVzTMJnlShHbcMCuLGWkT4v841qpZ2m9PE1z4Vr0s=;
	b=F837dASE/XbWW6HzxihaArMcpIajVCgvXzHl4uD22pf7gMWOikAfjlKZB5D8yCZ/SF7Q
	 jxNTi/fKHknAxN2AQPFWUeYNSn0wToDddW4jULs8KWXj5chBp0ev2raARxN/xU86sMMeE
	 siQ4ZyicxWcEBzXDWWjHadf6kOV1J4aRr+gWoK7imNyeBQmwwP0DznUfboTJgejtVeYI0
	 YvCZYxYTB2/xYXDBZL32rON5tJqLPXwfa0uLEN+bPltfvL9jUcTGt6nA/p6LjS2arIBT0
	 io9YPcppxCEA973NXvCvYG0mbQ4W6lq5ld1yd9DSt90VVHobsJzbppcCj8lI865Hzvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=TUs1pWxp;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82888606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82888606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=TUs1pWxp
Received: by dvalin.narfation.org (Postfix) id B8B471FD15;
	Tue, 24 Nov 2026 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795549619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cJRVzTMJnlShHbcMCuLGWkT4v841qpZ2m9PE1z4Vr0s=;
	b=TUs1pWxpJHdUuzx3RVFfsGPmy/ifaaMFFO91p+PtzScMW9Xb3aaKBKHHyyKkH77LdmmpRW
	RToYqifsfyP/z1YWTuFTmwzKIZgjKxSbuiKgmpvkwyeiaDhim2hjZ6ZH0po9g1JPauQdTM
	EUSOmuBy5GNSgU1JvGNsaAF3j10jDck=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 11/15] batman-adv: tt: requeue DEL of pending local entry
 after failed allocation
Date: Tue, 24 Nov 2026 20:46:56 +0100
Message-ID: <9710957.CDJkKcVGEf@sven-desktop>
In-Reply-To: <179554084450.3135.11910035656981995724@kernel.org>
References:
 <20261123171827.3294525-12-sw@simonwunderlich.de>
 <179554084450.3135.11910035656981995724@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3374045.5fSG56mABF";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3374045.5fSG56mABF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 20:46:56 +0100
Message-ID: <9710957.CDJkKcVGEf@sven-desktop>
In-Reply-To: <179554084450.3135.11910035656981995724@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:44 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > @@ -1779,13 +1793,24 @@ batadv_tt_local_set_pending(struct batadv_priv *bat_priv,
> >  {
> >  	struct batadv_tt_common_entry *common = &tt_local_entry->common;
> >  	struct batadv_hashtable *hash = bat_priv->tt.local_hash;
> > +	bool queued;
> >  	u32 i;
> >  
> >  	i = batadv_choose_tt(&common->key, hash->size);
> >  	lockdep_assert_held(&hash->list_locks[i]);
> >  	lockdep_assert_held(&common->flags_lock);
> >  
> > -	__batadv_tt_local_event(bat_priv, common, common->flags | flags);
> > +	queued = __batadv_tt_local_event(bat_priv, common,
> > +					 common->flags | flags);
> 
> [Severity: Low]
> This isn't a bug, but this code now relies on __batadv_tt_local_event()
> returning bool. That return value was added by the preceding patch,
> "batman-adv: tt: keep local entry unchanged when ADD can't be queued".

What? I am now not even allowed to build on top of other patches in a patch 
series? This is insane.

> The commit message doesn't mention this dependency, and there is no
> Fixes: tag. No patch in the series has a Fixes: tag, so this may be
> intentional. Is the series meant to stay out of stable?

It is in the same patch series. Why should I add a Fixes: tag? This wouldn't 
even be allowed in a submission for net-next. And when this would not be a 
pull-request then I would not even have a commit ID to use here.

> 
> > +
> > +	/* a failed attempt must not hide the still queued DEL of an already
> > +	 * pending entry
> > +	 */
> > +	if (queued)
> > +		tt_local_entry->del_unqueued = false;
> > +	else if (!(common->flags & BATADV_TT_CLIENT_PENDING))
> > +		tt_local_entry->del_unqueued = true;
> 
> [Severity: Low]
> What happens here when the entry is already BATADV_TT_CLIENT_PENDING and
> the new event carries BATADV_TT_CLIENT_ROAM?
[...]
> Say a plain DEL was already queued earlier in the same OGM interval, for
> example by the timeout in batadv_tt_local_purge_list(). The DEL+DEL
> update can still fail, because __batadv_tt_local_event() allocates
> before it looks for the queued change to merge into:
> 
> 	tt_change_node = kmem_cache_alloc(batadv_tt_change_cache, GFP_ATOMIC);
> 	if (!tt_change_node)
> 		return false;
> 
> In that case the else-if above leaves del_unqueued false. So
> batadv_tt_local_purge_list() never requeues the DEL with the ROAM flag.
[...]
> Could __batadv_tt_local_event() look up the existing change before
> allocating, so the in-place update can't fail? If not, the kernel-doc
> could say that an already pending entry only keeps its first DEL.

This is a corner case (already existing in the current code) but I will make a 
note to think about first searching the list before trying to allocate a new 
entry. https://www.open-mesh.org/issues/491

One case would remain: if the plain DEL has already been taken out of 
changes_list for the next ttvn but not yet committed, the ROAM flag is lost. 
That is unavoidable, because the DEL is already part of the announced change 
set.


> 
> > +
> >  	common->flags |= BATADV_TT_CLIENT_PENDING;
> 
> [ ... ]
> 
> > @@ -1911,11 +1936,18 @@ static void batadv_tt_local_purge_list(struct batadv_priv *bat_priv,
> >  					      common);
> >  
> >  		scoped_guard(spinlock_bh, &tt_local_entry->common.flags_lock) {
> > -			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_NOPURGE)
> > +			/* entry already marked for deletion */
> > +			if (tt_local_entry->common.flags & BATADV_TT_CLIENT_PENDING) {
> > +				/* but its removal must still be announced */
> > +				if (tt_local_entry->del_unqueued)
> > +					batadv_tt_local_set_pending(bat_priv,
> > +								    tt_local_entry,
> > +								    BATADV_TT_CLIENT_DEL,
> > +								    "requeued");
> 
> [Severity: Low]
> This is a pre-existing issue and wasn't introduced by this patch. This
> requeue runs from the periodic work without tt.commit_lock.
> 
> Can it clear del_unqueued after the splice but before
> batadv_tt_local_purge_pending_clients() runs in
> batadv_tt_local_commit_changes_nolock()?

This is just a preparation for the "batman-adv: tt: commit only the announced 
local changes". It is normal that a patch at the beginning of a patch series 
doesn't have everything which is there after the patch series ended. This is 
why it is a patch series and not a patch.

Regards,
	Sven

--nextPart3374045.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawXpsAAKCRBND3cr0xT1
y5YRAP985zfMTcYcJwkAHx7hlY9XIPohnKAfSpgMeUHOdhV9VQD/QTS3VslaZbD3
qcEXTpVYJLENsr2HJOILjrfs6H47jAc=
=Cd5q
-----END PGP SIGNATURE-----

--nextPart3374045.5fSG56mABF--



