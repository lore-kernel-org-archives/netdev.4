Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630794;
	b=DzYfnPTAO6XVuSy4Y6Cp3sUFUxXO8Q6t5s4LLIBeMM8mzivUVqR/u8V8knqxtxCPtqAI
	 l5iSWQbjy1/mpKvvDFEl1HbnUsVQWHzeQN3Zh70aJDbgnISlnY+zNKYFloV0ZNLphn3Wo
	 hlEB2Iypi75LrmatNtIGFYuTLJqj82u6tFvvzs2EvKEhAIi1F0KMHm88jP3plYxi0xJA0
	 okNonrh/gkOTIZiLB3hBBYvjDQVxl9brLvOcVYuHNE0OSrbtRqYZ7N51oDhLf1KTbuDKa
	 6fXrCB8wepI8gqs3birKQt+eY/5JpZuvlucDfxouVASwHEen6QVfwpn353cwU8Wq5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630794;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=ntj7Yrgs4fmCMKp2CWHe2DWtD4oP1sKMJTixdEDyB04=;
	b=03BmJQ8/NnP1EO9N8O9PDjBzR3E2E4VLy21OqDSNdTa+/XUvpq0OXtxZO6Bexzn4kaxl
	 M1NhdEyzvtRyKxPLNv14SNTgV6dH33cUN0bpJNc89j3BqYVuh6WcQhd7HLotjEW8LMh/Z
	 anzV52GWuunIoQFXk304KJdzYug0UBMk3PU4g+WmRR82j5W9yP6HFefnIa1suNZvueZ0J
	 DiRgEffcv2kYAjJyXMCRv5nIogYob5pR0sQIm3c2DD9M1/tcOQpKGN9tSwPidIYlmzIlJ
	 JyW91SSG5SZRr/iRJgLPEZXjHTmXj7dzbfJN7nIubupOBmHyLpOGiCkkwFKqYHxjVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L6rDLai/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31FA606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L6rDLai/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216E31F000C4;
	Wed, 25 Nov 2026 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630794;
	bh=ntj7Yrgs4fmCMKp2CWHe2DWtD4oP1sKMJTixdEDyB04=;
	h=Date:From:To:Cc:Subject;
	b=L6rDLai/qRvx61IJVvjls+H2n4wN7xPnhWVtd65pQBS33/hNDsyew0lFw4B1xu9SU
	 jl2d1oyt6/dkLVdQQXWggEJmJmFnqMaJEo5QRyA8USX3gFjTREh6uR20RNPQYU+x8V
	 j4vZqyLwS+SsgGlZcA5sWEQq+H1C8JSb3E37UZ2PrJKONuFlz5W5fMeBGA1R5R0mRE
	 durfELuQQKQrQviKSmF0Kb0gs0LBRIQuNZ2KFn2UILXhF0ayBYA4Sb7tyJq7cCTFtJ
	 SZHtwGKbzvVAASPiN4ATWH5qZl4N9yNYOW8BqD9gBsOamcOvV+5QSgQXXrtkWY7Axu
	 r6HQpIZZJ85YA==
Date: Wed, 25 Nov 2026 19:19:51 +0100
From: Alejandro Colomar <alx@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Simon Horman <horms@kernel.org>
Subject: [PATCH] net: Add missing const
Message-ID: <c9d923eca5851e04589758da9043a3d507cc9bd4.1795630753.git.alx@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fdhbgwpcswrariji"
Content-Disposition: inline


--fdhbgwpcswrariji
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Simon Horman <horms@kernel.org>
Subject: [PATCH] net: Add missing const
Message-ID: <c9d923eca5851e04589758da9043a3d507cc9bd4.1795630753.git.alx@kernel.org>
MIME-Version: 1.0

These pointers are derived from other const pointers.

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi,

This was found when changing some <linux/string.h> APIs to preserve the
const qualifier in the return type.


Have a lovely night!
Alex

 net/smc/smc_pnet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index 61ef1d697eee..a4a4292a48da 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -285,9 +285,9 @@ static bool smc_pnet_apply_smcd(struct smcd_dev *smcd_d=
ev, char *pnet_name)
  */
 static bool smc_pnetid_valid(const char *pnet_name, char *pnetid)
 {
-	char *bf =3D skip_spaces(pnet_name);
+	const char *bf =3D skip_spaces(pnet_name);
 	size_t len =3D strlen(bf);
-	char *end =3D bf + len;
+	const char *end =3D bf + len;
=20
 	if (!len)
 		return false;
--=20
2.55.0


--fdhbgwpcswrariji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsHJscACgkQ64mZXMKQ
wqlrpBAAgzXtXl+IGqpnfanE1SWAX5RWrwrkbV7DMrBxT9gRlaqBq9WksOrhCBgw
tRkLcb6R1b+4RaGS3M930KwN7zOFsm+70okAaHrh95bVyHhXZqlblVeoj59VKKE6
GNz37HS0cR33/S7JsQGCFGjGc4L73h6kQh+yMBRyZlkvYFKaMS8Q9f2h0/GsNIjP
HcV9m7hnqKqMhflZCVI1+/t7c8R51dRYb7VkxDXDSJeTu8ed77VGi1zKQZ89GsEW
L9hYKD7iG2p7YGLCEnf+CI37ljT9KLtfzWdpUGbZpE9oyJiF+VStQUNgs9n7Sq4R
3owgS2qgCra8WLUWPjji275Z8tdFF9TncJdU1mUaoHKlwVLU3aZvrtsUwfRN8UbA
qYYGZqZT5QNwK7aAZNlLhhoNaoZ+AbYqzhSOnEVMbNyfK9cojQnecWYm3EXDyZB6
VNSQmRLhDiPpr3P9Otzsgr2SZ5zVq6491Aw+y+sUS5g2v3vMY6qMRy/jHeou/77e
NmF/dme0O8j3TtQyhWvLuQ+J3u5UjLuybT6ksfl8LN4yegdd89aaNmtJHGV1uppF
WfMXHEshXj5+50lZOIL2BgDNSXzWvdqbKKTrkpFV7zzdv5giHvCdMGgKeJuK5lRn
3s0Fyi51Wl6XeO7J973fXPAd4RmL8uFp9qNtloV/qRjMvM6R7u0=
=EjlK
-----END PGP SIGNATURE-----

--fdhbgwpcswrariji--
