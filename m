Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548645;
	b=14RHMudEtP73tm6LOfRXtWyGW8Oor8Mi1qkxccFEGzFW8wIClEzr3XiLq05UjngVcD1o
	 fsxcTyOmLBtYRWfp096sNv4TurKO2zYx8c+Y+6ZoQy0PSdyxXPCEP0+NAV2YpPJ/YViyn
	 qFMVVyl+qZtL092mUKP0p58hOaPEzJ9xuV7i4qmbemjsnK1/zMIgsjtY6jgALdd/AgnEl
	 tESjKXOmHY2zZjhWraEYmbw+cVl4FY3ILaIAd6oCtabMZjMydHH5uE4SamUq1ogjCU2gV
	 Htqg4TgH5idUMcKFJ88f1rhLHAMV7+kaKprICf+njrsypqbNn8RE6Kjbhw/usw9sKIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548645;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=C6LFLahScyEdnHNyHIpJYyhDCb17bkz1JmKjMkFMMbg=;
	b=npdj9qvYUGN8260DqZGrbU2fjqZeV55JNltrXaC9HEIf1XMt7o4vhB3Ui4eoA5vre9Ti
	 RmwF5BM8cc2Ru7pJujhVZ2NwZclqpIIHE90M8cIAvYIv1kW1YSoVOqyG/gi94Pe+d+DJV
	 4tO287zW+IdiVJ0afkwB8LsdMAtq3N7UG/0d48fwaBWjAXnwLSRtBemS3M24f6fpPBQLu
	 AHP38lXP5ZG0ZdQHBZUDPIfWnUuzUkgBtXYF0PhJWnpdraBsHUGxzkpXkBkPuzcnQROD3
	 NjdmJsqwihrD99z5minphLK1jNCeZLzbjqK292k37VdWu48wWOzOThXm5OpZOQywUqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=qN1cYuK4;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D8606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 583D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=qN1cYuK4
Received: by dvalin.narfation.org (Postfix) id C0FB4203E2;
	Tue, 24 Nov 2026 19:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795548643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C6LFLahScyEdnHNyHIpJYyhDCb17bkz1JmKjMkFMMbg=;
	b=qN1cYuK498MOSJXUxYLSpZdQzxIJtE/3oMa8dgbowvVVdVJ+mWSBJ38hpTdCoCKLvKBREG
	a5WVQ6xhsfmmB6n7OZEbt79ZChCLpOIpYBZOjAdFAWAVAao9zql97BITbEfRYj2sx+QBdi
	QGMV0p9alIePFRA1EVW0LvY8HpQEMDI=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 10/15] batman-adv: tt: keep local entry unchanged when
 ADD can't be queued
Date: Tue, 24 Nov 2026 20:30:40 +0100
Message-ID: <8764057.T7Z3S40VBb@sven-desktop>
In-Reply-To: <179554084314.3135.7493792255015362398@kernel.org>
References:
 <20261123171827.3294525-11-sw@simonwunderlich.de>
 <179554084314.3135.7493792255015362398@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10953751.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart10953751.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 20:30:40 +0100
Message-ID: <8764057.T7Z3S40VBb@sven-desktop>
In-Reply-To: <179554084314.3135.7493792255015362398@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:43 CET netdev-bot+sashiko@kernel.org wrote:
> > diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
> > index 977f62c88da76..c94b292a1c4a8 100644
> > --- a/net/batman-adv/translation-table.c
> > +++ b/net/batman-adv/translation-table.c
> > @@ -653,10 +653,18 @@ static u16 batadv_tt_flags_get(struct batadv_tt_common_entry *common)
> >   * Only a single change per client is queued. It describes the latest state of
> >   * the client and a new event therefore replaces an already queued one.
> >   *
> > + * The other nodes only learn about the modification of a local entry through
> > + * the queued change. The caller must therefore not modify the entry in a way
> > + * which depends on this change (e.g. hash it as BATADV_TT_CLIENT_NEW or mark it
> > + * as BATADV_TT_CLIENT_PENDING) when the event could not be stored.
> > + *
> >   * The caller must hold the flags_lock of @common. The events of an entry are
> >   * then queued in the same order in which its flags were modified.
> > + *
> > + * Return: true if the event was stored, false if the memory for it could not
> > + * be allocated.
> >   */
> > -static void __batadv_tt_local_event(struct batadv_priv *bat_priv,
> > +static bool __batadv_tt_local_event(struct batadv_priv *bat_priv,
> >                                    const struct batadv_tt_common_entry *common,
> >                                    u8 flags)
> >        __must_hold(&common->flags_lock)
> 
> [Severity: Low]
> At this commit, batadv_tt_local_set_pending() in
> net/batman-adv/translation-table.c doesn't follow the new rule. It still
> ignores the return value and always sets the PENDING flag:

This prepares it for a later patch. I don't think it helps us here to discuss 
in which patch this comment is added.

Regards,
	Sven
--nextPart10953751.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawXl4AAKCRBND3cr0xT1
y5yzAQDFrPw6mFWxgsmTLHTh/ggZG6w7rryMxKeiO54dfeOyvQEAt1IQ1iIY/fqW
eqLnt1OzHZWbYCIL3Acb+b0T9X37Aws=
=CMte
-----END PGP SIGNATURE-----

--nextPart10953751.nUPlyArG6x--



