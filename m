Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547967;
	b=5p1R9PdR3ZaKOsHZ6w9s+qjRDwobuMrufwMjeX+paraSay7KAFRC5KKaoXfm/6uHtGK/
	 9+P7JsiW9locMGnJn8RC6YVDUxJdDcMdJhL+qV3gzblj7phvy0jV5Qcx4ZaLYNciVXeAv
	 zCQtxMREtt8OqC8odkwBfO9zrtNH8hVTHenQjQ+vn6RBCTJZhcneujX5z0crvAtQbfvUy
	 eTrkk3f7TS3ZOW/FSbYiHVXvewWPoUZBhSDQNf1CZfq+kMmtpaDHYuw66uVJz/WneqUCz
	 7LQPquDj07UYSecYcsWflskm5eCxYVI1lgG9JtRhsIqAjm5Qu6ojDRg6BxbLSdl9wBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547967;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=hw7hh680LO3BRwF7TnXftJMY5VtS1yVoasYOrI2SQcw=;
	b=PmObTWUPTvF3eXtDTQo6gkMaRMJvSYa3z/B5lyiryU3UuD3k/7zg2qKD8qwWFvKy9EdO
	 TixAoEwB0bgJwDM8GpsS8OwDzqyclk9WMauHlWqRtNdX/7dqIcBdcFulf0nOJ5f8GRQ/H
	 VUkgE9z3+cIJ49mdASPXdWzaESxWAOgWImLsnfSN9fKMNpjbA/qKeO9AoHXO/Ot+HURLz
	 aIq2LntotfXbp0vDZhfZKozq3dkkf/ZYwhF8Mp9m0/Vbxj43fNWGqX6DeDQckE7Z1ew0E
	 eDfR5QYP62E2QevCEz6XUmcY+g7iBWETn1yKFhkozrv967MvOd18q1JGcIYP8T+efqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=SBs6eMsn;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D8606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=SBs6eMsn
Received: by dvalin.narfation.org (Postfix) id E27DA20324;
	Tue, 24 Nov 2026 19:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795547959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hw7hh680LO3BRwF7TnXftJMY5VtS1yVoasYOrI2SQcw=;
	b=SBs6eMsnRYeDnJLV97wBTsF0fmG5YtG9Pk2AF/IJ28NHU0eeYnFxd3l/9RruchJ/2/+L6R
	0ZCBf3NLuVSWDoKqc4uXTSZa4L0u4qY5zMQWcqI32YNddZjkQjNhk9RwV7TRnxSlWhMclr
	BtZvmH7PVXQU2h48sgpi6S9YDKXF2G8=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 04/15] batman-adv: bla: register own backbone gw when
 claiming for local node
Date: Tue, 24 Nov 2026 20:19:15 +0100
Message-ID: <6050900.DvuYhMxLoT@sven-desktop>
In-Reply-To: <179554083850.3135.5611010478427382077@kernel.org>
References:
 <20261123171827.3294525-5-sw@simonwunderlich.de>
 <179554083850.3135.5611010478427382077@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6327635.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6327635.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 20:19:15 +0100
Message-ID: <6050900.DvuYhMxLoT@sven-desktop>
In-Reply-To: <179554083850.3135.5611010478427382077@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:38 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > When no backbone gateway entry for the local node exists yet on this VLAN
> > (for example due to an earlier error), the entry is therefore created like
> > a foreign backbone gateway.
> 
> [Severity: Low]
> Is "for example due to an earlier error" the usual way to reach this state?

I just gave an example. Sorry for not providing a full list of everything 
which ever could happen under any circumstance.... will also not change the 
commit for this.

> 
> Could the commit message say that this is the normal startup path? Stable
> maintainers would then have an accurate picture of how often the bug
> occurs.

No stable maintainer involved here.

> > diff --git a/net/batman-adv/bridge_loop_avoidance.c b/net/batman-adv/bridge_loop_avoidance.c
> > index 68ff2f94cf49d..3da070a087da6 100644
> > --- a/net/batman-adv/bridge_loop_avoidance.c
> > +++ b/net/batman-adv/bridge_loop_avoidance.c
> > @@ -986,18 +986,22 @@ static bool batadv_handle_claim(struct batadv_priv *bat_priv,
> >  				unsigned short vid)
> >  {
> >  	struct batadv_bla_backbone_gw *backbone_gw;
> > +	bool own_backbone;
> > +
> > +	own_backbone = batadv_compare_eth(backbone_addr,
> > +					  primary_if->net_dev->dev_addr);
> >  
> >  	/* register the gateway if not yet available, and add the claim. */
> >  
> >  	backbone_gw = batadv_bla_get_backbone_gw(bat_priv, backbone_addr, vid,
> > -						 false);
> > +						 own_backbone);
> 
> [Severity: Low]
> Should this patch have a Fixes: tag?

No, Fixes: or Cc: stable@ are not allowed for net-next

Regards,
	Sven
--nextPart6327635.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawXjMwAKCRBND3cr0xT1
y98KAP0XuAaVVcy3KJlx3P1vW/re2kF6EWJH4QsfagcxkMC4MQD+OZC66ix5Bp/8
DUpt5MhPeXVTj02g6Hc0UqlgNNLlwgY=
=d6XZ
-----END PGP SIGNATURE-----

--nextPart6327635.lOV4Wx5bFT--



