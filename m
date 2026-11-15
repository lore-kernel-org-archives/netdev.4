Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735739;
	b=txTFXU2EFNnx1DUyNePbKi2iL86sV+Xk/xcloOA0codrBUUCRehcVNgwVYgqGXUOggDQ
	 VD1F6CJpWhioZL1mYz5l39m3fMb8sres9zCs6yTnVnfoVTtLe3vAW7YmHXdTvtw9FRhB5
	 aoN2y5ZdzroQeC0waW/shv0neaZMFD76nMh8hD8rwNx55dFlh4QZSaKimBFjI/Qp8pPWY
	 anVDpwe3WiaGtUmQN0LNGprdr5x30S3UiY7K0EsTpi546V/sVmDBvqwWLqn8ZXsfIp5NP
	 B8lRpFeVThg+6KP1S35XkDMZ45v8a39G/ZAnW09QKNqDx4y6wBC+B98syED5F7XQQyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735739;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=jyi0ZYdSXMFjxWis5yIKPZ/e/pVOg1Og2RcpInXXxw8=;
	b=tuooyiX6mZQbxCTeKjjMduXr1KKh/LQXZJh3DbGvyRsjjYD5sY40Nr9SDLiowSbaME8K
	 3oiT4vb6xyXHAppETe4ba28vG4ocoz8wy4x77rVms2/yMPoa0ZdtyPyFBTayEbJ34vbhZ
	 vsEAeAZNsJAhFzFG08RdYVaqGSHkumFQ11luA3w1k26FJADYeVehLUlhAOasjOhWr/SPD
	 lXy6ttVS7jxyacryh+6/PHZvzQBQRt06MSilOXGX/q/7GoPj2Y3962Murke88bOotFVg6
	 7sobQkHK4I9tZo8yyrFxF4VAskblPzWK6a19oRtAAgwJGY6rFqr2dvHSpCifC6V2IMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=2dJ5YK7Q;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880B606A31E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9880B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=2dJ5YK7Q
Received: by dvalin.narfation.org (Postfix) id BAC5A1FD16;
	Sun, 15 Nov 2026 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1794735736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jyi0ZYdSXMFjxWis5yIKPZ/e/pVOg1Og2RcpInXXxw8=;
	b=2dJ5YK7QgAfvNQVVaVJdmuWNlNlG87tdSddq1xEh5UJBMdX58p49zinqu6YR6whGjIz/LD
	prKGB6QESgD1kXYCieRxW6E2EWWDHtl6szTA5Qk5WqrIgD9aAmkAxygZq3IIPk+84cf2VL
	QlXVmQ6fmMB3n8E4qWSK8NPL9ZVfpfU=
From: Sven Eckelmann <sven@narfation.org>
To: Simon Wunderlich <sw@simonwunderlich.de>, sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, antonio@mandelbit.com, netdev@vger.kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 04/15] batman-adv: tt: use dedicated key type for hashes
Date: Sun, 15 Nov 2026 10:42:13 +0100
Message-ID: <4777859.LvFx2qVVIh@sven-desktop>
In-Reply-To: <sashiko-outbox-215350@kernel.org>
References:
 <20261114091556.3336038-1-sw@simonwunderlich.de>
 <20261114091556.3336038-5-sw@simonwunderlich.de>
 <sashiko-outbox-215350@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2433226.ElGaqSPkdT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2433226.ElGaqSPkdT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 15 Nov 2026 10:42:13 +0100
Message-ID: <4777859.LvFx2qVVIh@sven-desktop>
In-Reply-To: <sashiko-outbox-215350@kernel.org>
MIME-Version: 1.0

On Sunday, 15 November 2026 10:24:43 CET sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> This problem wasn't introduced by this patch, but can batadv_tt_local_crc()
> include a BATADV_TT_CLIENT_PENDING entry in the local CRC calculation
> [1]?
> 
> batadv_tt_local_commit_changes_nolock() runs
> batadv_tt_local_purge_pending_clients() and batadv_tt_local_update_crc()
> sequentially under per-bucket locks, and batadv_tt_local_crc() only skips
> BATADV_TT_CLIENT_NEW:
> 
> CPU0                                    CPU1
> batadv_tt_local_commit_changes_nolock()
>   batadv_tt_local_purge_pending_clients()
>                                         batadv_tt_purge()
>                                           batadv_tt_local_purge()
>                                             ...
>                                               common->flags |=
>                                                 BATADV_TT_CLIENT_PENDING
>   batadv_tt_local_update_crc()
>     batadv_tt_local_crc()
>       includes pending entry in crc     <-- CRC mismatch
> 
> The local CRC then disagrees with the committed translation table state and
> triggers unnecessary full TT synchronizations across the mesh.


Not related to this patch. And the patchset to handle this better is pending [1].

Regards,
	Sven

[1] https://git.open-mesh.org/pub/ecsv/batman-adv.git/log/?h=b4/tt-avoid-unhashed-event
--nextPart2433226.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCavl+dQAKCRBND3cr0xT1
y6oOAQCKyP0GEmH1xuxYPjD3qa2YYZvDjNW99ur5+VT7Yt97uQEA4rDoEHRecu4r
PYXljqTRHgyXPN3+KI4Z3DyQouxt3g8=
=CaO4
-----END PGP SIGNATURE-----

--nextPart2433226.ElGaqSPkdT--



