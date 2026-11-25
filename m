Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639048;
	b=tG9N/ZArCszPCeA0Z3cmXPQVooNCajqYAjhIijB60/zqu1aZ6fMsXZoE73+z4Lduo8Jl
	 IRNzk7RSLX/qvFPNrPq/Xfq0rHpVBByysqhp8j1wNBVuTqpSrJbl+mYJ6hpW/38h04Cg2
	 sutRysIn2yMH24X9QshBnWEmp6r4k1+GW/bta8paTgLoRKTa7ZvPpOYPAeu1ArYqNylyp
	 0kL/x2zfvy9ngdghqrqvtCEmUhskOFDZ5rVJMbVt82JXjeHIyr/byc98bECIHZHaaoSCs
	 VviixGvoRIYCVszjxjMHAfzLsD2mbutQD9C8IGGiLhxTlJ7+2CBuGE6Nbe2XANOs9iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639048;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pNIpR2CSCy6cZ7geSQLFo33obRtQDGl2quQIvTgUlwk=;
	b=4v6OcMzg1blWQFQXY4zZOvFrKn5V9PwEKAhVwo27rpF00AzTuujVRDYZnTiZ6cBll68H
	 g185Qcs4DKo1uXdMJUI2Odkd5PWnLCxPntTygGh71z5mfZ8IZUKvE1U567+cSZPj52ZnG
	 n9+Zs1k9t3a2nvM45HIDrtS0JbJGzhSh/sYSO7Y+d2lHgy14DiDZUDFtP5IZ1/kXMra40
	 dEmUte3yWjaj9MMlnnYOFB7MWz8VwaE1lAEqwlt1gMnRS//qJmlCUGYc62C2zi/RWtsuO
	 VyWLcNcXZiyr7qZ1EocD8Ri0eUkUBL0eFafZdPjUcpXoM+ph8MZcXxB3DgDfJYdN6dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+NqGi5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E022D606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+NqGi5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408AE1F000C4;
	Wed, 25 Nov 2026 20:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795639047;
	bh=pNIpR2CSCy6cZ7geSQLFo33obRtQDGl2quQIvTgUlwk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=A+NqGi5FDmegdoHmEJi4OAIjqiLuzKzJR4kAl2pui8dNRxwzmJCiOyXTiaKcv1pQY
	 UqDd+cokF4gZdoUw5QD+fvF73Mahx+xwHDRg2b2TG2E59kDWthza0xTieaeeR6Ky+n
	 vHxI5hdy+fnu87GSRQZmtJPvbMG2nVryKc4XA7/t1aDg3ZLmb5IEyvWK+RRowtlzCB
	 LCTwldc5aLXZtgkWvN9E170y5FFtmtv57csBjO0TvsIydKkjwm/ZOdKWIgPH0KAIks
	 amciC9fXrTv2yI6rWB3xR/AibbpAr7aOIUvV7fzP41DJ7Dm4KFXOqAeZ4F19pJ1GUD
	 D/BtQ+q9I8KiA==
Date: Wed, 25 Nov 2026 21:37:24 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Joe Damato <joe@dama.to>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] net: Add missing const
Message-ID: <awdGuVcwtVwUc7ge@devuan>
References: <c9d923eca5851e04589758da9043a3d507cc9bd4.1795630753.git.alx@kernel.org>
 <awcrIkjb2jvl3gY/@devvm20253.cco0.facebook.com>
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
	protocol="application/pgp-signature"; boundary="vfq2v7le43bamzof"
Content-Disposition: inline
In-Reply-To: <awcrIkjb2jvl3gY/@devvm20253.cco0.facebook.com>


--vfq2v7le43bamzof
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Joe Damato <joe@dama.to>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] net: Add missing const
Message-ID: <awdGuVcwtVwUc7ge@devuan>
References: <c9d923eca5851e04589758da9043a3d507cc9bd4.1795630753.git.alx@kernel.org>
 <awcrIkjb2jvl3gY/@devvm20253.cco0.facebook.com>
MIME-Version: 1.0
In-Reply-To: <awcrIkjb2jvl3gY/@devvm20253.cco0.facebook.com>

Hi Joe,

> Date: 2026-11-25 10:38:26-0800
> From: Joe Damato <joe@dama.to>
>
> On Wed, Nov 25, 2026 at 07:19:51PM +0100, Alejandro Colomar wrote:
> > These pointers are derived from other const pointers.
> >=20
> > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > ---
> >=20
> > Hi,
> >=20
> > This was found when changing some <linux/string.h> APIs to preserve the
> > const qualifier in the return type.
> >=20
> >=20
> > Have a lovely night!
> > Alex
> >=20
> >  net/smc/smc_pnet.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> patch seems right but i think the subject line and commit message could be
> improved tbh

I kept it simple, because it's an obvious improvement, and adding more
text felt like bloating it too much, but if you propose any improvement,
I could incorporate it into the patch.

>=20
> Reviewed-by: Joe Damato <joe@dama.to>

Thanks!


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--vfq2v7le43bamzof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsHRv4ACgkQ64mZXMKQ
wqm7AA/+JCflEozghJ0iJeE+9gtV7KcwtgAi9WvNkJB6BDaZ//wiy3FePgfyEhnn
N419IJZYKL0lfQQX4PUEhzHnLLvHCxdTg6JPxJ2vQmhrhJ/4lgIeQ50qMS0BpF4i
mA7yU8263ou5JMcMzaMY7NI1HN/7DA2krOdS2qRsdU4ufpbTu1zMjK7MtL7eDYie
fkNncVNeAHi1VCF6mdY04sflpuV9egN7rl6F/3S3pWmdL7fX8gfrvFlGTz9qvYfk
+tnj+dPGJZag7A93tnJHDxBpefKUHzefOweLAbhnPf9aMbKD28I8tns5DOFOoLm+
TdnlICss6m1EXMJTGQXXl/iv0AMallrGIevdtufaso8NOZspR94HY1WWqQ3V+6Pg
MVg3g+0WR3IY0uRxiLX/ba0JkBBON54zzQC8u440daE+ManG+iyCyUPmZ0OTl8W+
1pqyfqfutjIMN2jctnn+5EGhsLq7O9S6QbsmfrJ/zVA/VlYpW2XnnEiKOxbdI2A9
ZoJ8U7wqx4rmzp2oWVsuz02mMf0hX5PtOqczqq8menFtWQCL+as5RCYlU7qIDB/4
f4CfyQJqDlgwb+o3P2VG7Y/9lfz/VdQdcoXz+uU3aX+KeEagEIvG5PL4XxnKyIiF
CmhjUn+ioyQz6khC5PSUeKethhakoNic8CDK5VxaSaVdG5tqi7I=
=ungq
-----END PGP SIGNATURE-----

--vfq2v7le43bamzof--
