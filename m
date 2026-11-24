Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548281;
	b=4YDBqi9dwPg2qPM9Mwc9xs+k4khlE1voTXGBJrVyjL0pcgg3ZBo+DsbvO0+hLpqN4Xyi
	 INVTJ4fAjahT1hQflCE+oHYVul85tEmY3VfKNI6PWUeEF56i3lMHKm3w14JTF+yxKan9d
	 fx9kAkhX9n3ga+QAIdlJhFsu+xWDBVulUrIGIrJCO4zDoyrs9aDTdYdIMcitaxyW/GWG4
	 G6wLq+4EluU6PqKE4ssOmxkp1WUQsIKIELTFgp/9/RJXug9uWZOIQ8BWqdCIIoMww0Z+Y
	 5V36nW0rLDv/1tMRtrevJxJdu99jtXgxeqEdAmZHQG2RN6JiT9VT5ij2Ms2b4shz2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548281;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=cORf5hs+EqkLduwnTH+/lFR4dJOv+FMKikDVrfSgwBw=;
	b=HOKAqSqdY1kEw57UtJoS7jF9pHjJL/LBmNqR1CD3IchkD8DqPKHVdlAuyLR8ZxH3oB8G
	 foTZtyF1SLp+LSb7pQUBFwmE8V59f2QQmE299Ho+Mh3VhgBBkLlA3L9a08o3QpTKod62n
	 IEpuizN6vtEp447Hp8YgpPu8xPBFd/QCPRR7gp6xP8+2BQZ3m7IhMBqhmCwZ93eDEj+Gv
	 OpMDFSoJk+qpswk/N/nk43LnZwUAksQ0WsNJJOX/aS9hZ1O5PNOxYDjXbtp0H3IJfr+TY
	 giry8h6nnI+BpCTblfr6d0orgw1wCLqy0BEcrrmXpE5fQPWybxnZ5L5blzeu4A40IwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=Zu7L2e3M;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECA606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDECA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=Zu7L2e3M
Received: by dvalin.narfation.org (Postfix) id 42A1D2014F;
	Tue, 24 Nov 2026 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795548278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cORf5hs+EqkLduwnTH+/lFR4dJOv+FMKikDVrfSgwBw=;
	b=Zu7L2e3MHtRPaZIIxb24FE+bKJlkt4Mdtoxg1QvWZy/EKm2iyQD9Ct9R8IFg7ALPYKUeDu
	n137fmjBQPhkxul4oIOM6NdB9r3r2W3iKH2QPHOCCHOmeRDiL2B8M77lcW1BQcksjyf2K5
	g8pjlRWaBOWN76CWXdC3Rq9l1uPHOyc=
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 07/15] batman-adv: tt: don't remove unhashed local
 entries
Date: Tue, 24 Nov 2026 20:24:35 +0100
Message-ID: <2286793.irdbgypaU6@sven-desktop>
In-Reply-To: <179554084147.3135.8288154830036400852@kernel.org>
References:
 <20261123171827.3294525-8-sw@simonwunderlich.de>
 <179554084147.3135.8288154830036400852@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14143459.uLZWGnKmhe";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart14143459.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sw@simonwunderlich.de, netdev-bot+sashiko@kernel.org
Date: Tue, 24 Nov 2026 20:24:35 +0100
Message-ID: <2286793.irdbgypaU6@sven-desktop>
In-Reply-To: <179554084147.3135.8288154830036400852@kernel.org>
MIME-Version: 1.0

On Tuesday, 24 November 2026 18:20:41 CET netdev-bot+sashiko@kernel.org wrote:
[...]
> > batadv_tt_local_remove() looks up the local entry via RCU only.
> > batadv_tt_local_purge_pending_clients() can unhash it before
> > batadv_tt_local_mark_removed() acquired the hash bucket list_lock. The DEL
> > is then queued for a client which is no longer part of the local table (and
> > its CRC). And it might replace the queued ADD of a new entry which was
> > added for the same client in the meantime.
> 
> [ ... ]
> 
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://sashiko.dev/#/bug/linux-c3e34735-5286-4ed0-9338-a77e64fef540
> > Signed-off-by: Sven Eckelmann <sven@narfation.org>
> > Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
> 
> [Severity: Low]
> This isn't a bug, but should this commit have a Fixes: tag?

No, Fixes: or Cc: stable@ are not allowed for net-next

[...]
> Without a Fixes: tag, backporters and the stable tooling cannot tell which
> trees contain the broken logic.

No stable maintainer involved here.

Regards,
	Sven

--nextPart14143459.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawXkcwAKCRBND3cr0xT1
y5KpAP9CkaoRykRpfQeA7U6g7zlrfLEITgyQGqZHzIrzhLyGmwEA4XijW3Fj5CGp
Fpt/MOG7rfZ/9/1k1zEzysd7evgpTgU=
=G1G6
-----END PGP SIGNATURE-----

--nextPart14143459.uLZWGnKmhe--



