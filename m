Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735882;
	b=4YsmwAP5LG58fDVWQfQc7sl6BefqfTUwZOLueZ4motnXPJIM+fEYqktResipZiTZuKSx
	 zA+Re3J+rjYfGIOu2qVrrYlyVZ8mda/qrVIWJpgh4Gxzt7PSgsipQ16JsaK1Iu3ee0uK3
	 itUEADfSa3sqJy6M1Vv+KRqMTZivo7rcUdpiR0hxYnS7Yhqi0SZY6VVzcGpKBD84uFWW7
	 sNKR2XzeV/3JE6H9sBtUspxoykmC93qi2+V06jwjZWcUX3ftZjhEyYg3BTP5J40XRvHJT
	 XPAS1mKc/f+0HCcCCn3ZBTXHmt2M3Xo/KvrHpj2gf5pNIhszZP0e1NLDyLoQpGWO4Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735882;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=dHnXQL0Q1Zu3htY5lL86h3bFX/9xtrVkhQNFd43gABg=;
	b=4AVcNpFOcly/oJfGrFBk3Hun1jzFLNEvsKfHiuCgHcCkz2ytQYNIFGDfS9uEn1xEwdZp
	 xbf3VHHbg2F5dP5nUFUS1nVKgtSvSpukn1vbETOV/+ALszUf5EpThTch1b4d2rCw5vCXz
	 lZG5lfLXAtlHuZ3N3QFMqx2zsDwXVvmPQr1aI94DKkL5iGz4GqXYdR+cvrUoiAHpw2YTC
	 8s3yMgmO0l7NYGOytTDDV/ExXajhO4T0RUiiva1ZAN8kSR1k7LtRKpyAcSHbv0rTjYVb3
	 ec2RW+WSH43mnjfaiihNmyNXBHRooCFNnd02jX4Dr+8uASch+HDelYy9Dv5po+DWQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=NPNm9MOM;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F8606A327
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743F8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=NPNm9MOM
Received: by dvalin.narfation.org (Postfix) id 5F5D5215DD;
	Sun, 15 Nov 2026 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1794735879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dHnXQL0Q1Zu3htY5lL86h3bFX/9xtrVkhQNFd43gABg=;
	b=NPNm9MOM9XLJTuJSf7lA68lWvha5XNGqhmu/TIkzRVPfMLhKWpgGPPsQrWjSb54bGANsKT
	73B09hLJ1WaGxH/xrcpgqhMbDwxywMKnvdnmyaABR/m4KbUqO13qxExnLJas+gEPgpUb92
	fW9TNbs9KW5QS+H6NXrLdVbqu/eVlTc=
From: Sven Eckelmann <sven@narfation.org>
To: Simon Wunderlich <sw@simonwunderlich.de>, sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com,
 b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org
Subject:
 Re: [PATCH net-next 07/15] batman-adv: never consume skb in BLA rx and DAT
 incoming snooping
Date: Sun, 15 Nov 2026 10:44:36 +0100
Message-ID: <2285103.irdbgypaU6@sven-desktop>
In-Reply-To: <sashiko-outbox-215353@kernel.org>
References:
 <20261114091556.3336038-1-sw@simonwunderlich.de>
 <20261114091556.3336038-8-sw@simonwunderlich.de>
 <sashiko-outbox-215353@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14136404.uLZWGnKmhe";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart14136404.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 15 Nov 2026 10:44:36 +0100
Message-ID: <2285103.irdbgypaU6@sven-desktop>
In-Reply-To: <sashiko-outbox-215353@kernel.org>
MIME-Version: 1.0

On Sunday, 15 November 2026 10:24:44 CET sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can batadv_bla_rx() ->
> batadv_handle_claim() register the local node's own backbone gateway with
> own_backbone set to false [1]?
> 
> When a frame from an unclaimed source MAC arrives on a VLAN before a local
> entry exists in bat_priv->bla.backbone_hash, batadv_bla_rx() calls
> batadv_handle_claim() with primary_if->net_dev->dev_addr before reaching
> batadv_bla_update_own_backbone_gw() at the allow label:
> 
> net/batman-adv/bridge_loop_avoidance.c:batadv_handle_claim() {
> 	...
> 	backbone_gw = batadv_bla_get_backbone_gw(bat_priv, backbone_addr, vid,
> 						 false);
> 	...
> 	if (batadv_compare_eth(backbone_addr, primary_if->net_dev->dev_addr))
> 		batadv_bla_send_claim(bat_priv, claim_addr, vid,
> 				      BATADV_CLAIM_TYPE_CLAIM);
> 	...
> }
> 
> Because batadv_bla_get_backbone_gw() inserts the new entry with
> own_backbone as false and batadv_bla_update_own_backbone_gw() then finds the
> already-inserted entry, the local gateway skips the initial
> batadv_bla_send_announce() call and never enters the
> BATADV_BLA_BACKBONE_GW_UNSYNCED startup grace period (entry->wait_periods
> and bat_priv->bla.num_requests).
> 
> [1] https://sashiko.dev/#/bug/linux-dba9d95d-5eeb-40fd-abf4-e054aee1f735
> 
> 

Not related to this patch. And the patchset to handle this better is 
pending [1] ("bla: register own backbone gw when claiming for local node" 
might be submitted outside this patchset).

Regards,
        Sven

[1] https://git.open-mesh.org/pub/ecsv/batman-adv.git/log/?h=b4/resource-limit
--nextPart14136404.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCavl/BQAKCRBND3cr0xT1
y/naAQDSeqyWklCQry5ne37eXsf2RtNwREMp+aLYNv4D/7XGUQEAg73yL97gSG8C
2Rk6beBBKBBJvREHVrsAs96peuFdvgk=
=mLFC
-----END PGP SIGNATURE-----

--nextPart14136404.uLZWGnKmhe--



