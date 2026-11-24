Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543013;
	b=PpVKVWopa8lQiZoou3uqPFhFYyaDwlktlUvvflLbCD+6HouSnsKJHMeUeIq/LIGd9J7P
	 Vem5zv6mzINTKvbWK/Xx2bmVUDxpwZ2frTfcXTFnGhFdO0VxXKLkpz+EmwAA5yOGg8EQE
	 5j3xGS25SDASZQLk1wlH1wT7j2Z97h1YBWinneuMKk7nmVHBadrY9N8RoB5e5dIzpG+kj
	 E12xvrtP5UWsNds5jHhXqDS5bmTPx9GU6Emw26VtWhQVxWOTlFMVrsOBJBm7dtKu6aYxP
	 c3H84A/49AD8tg3RVzf3G0tAhqm0rTEmMb8cZmOBITj8cbdCTyOEThVHNmdMQQXJu/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NH5unrqT265vEp+dApv9hr1i3do1hsssYsK1qTP0+8k=;
	b=QJdoMI2YFIlVydkjJuiUXE0lV3WKbwcDA4KkGDYS71MvfpvXXoDLaq0XdnRFU1dXDQkl
	 S2OAwixqXpEWVjznV7skisfNau34PtQn2+moygsnfT7a5uq8GaYOAqx2xmxbDSIQbPij4
	 czpMsdjdRfuCm3H9Ul2mXjYtyaLkHeurooET1TRPy1PFGvVpHm2CRgbJeBW2N2k8iiLaG
	 FgsxASjZZ8in+yWTOcH6UuQ8e0I5KO44DFbtUB9ZKbDLQqJq0sMU1p/vlHq0FbBBM7ET4
	 QGrt1mq68FNEYcnzuxG+tWolisjZlG45N7KOLDWaO4tL8hxrKs/ThP0+F90NONXq15A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qO+9NrAi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FCF606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FCF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qO+9NrAi
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50a4a2132cso709389966b.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795543011; cv=none;
        d=google.com; s=arc-20260327;
        b=Kt15JLqu0u0bVCd0wpHOm+cbw0sb7Pguvws1J0gl04Km8bP/RQsvhqbFdX72jzWd/e
         c4sX+zU8IwGMGHJgFYf5USTypSL9LAj9nvSU1cPIJ607KUqTkHjwJrfFGJ5rmDFMnKSF
         lRrHLRVFpLAlQ/A6IvuPUrT8frMP8QolkKLt0b1gqyxLjoHA1yYb+jq4GmMPH4/UNeZ1
         QN7ek4LilmlL8NCGCdk4KgkZjAVbzFpWEx/VDweyRB01siJ5UnPvl8kIm4AK4kfmJ6VV
         OFYQBbu4xa818nGoV+WMdIALOGQ/MFBmz7LALUlvEssBPxhCLqep8vhLaNkVXtfA8WSh
         jmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NH5unrqT265vEp+dApv9hr1i3do1hsssYsK1qTP0+8k=;
        fh=IjKab3N2pdgpJKotKNQhTD9Cipbfm7WgHYNfkfn6dHE=;
        b=TOYY6YT3oV2Oim3/jZyW8H5Ywr4LpCbwRJ003AJH99dyYvcxmUoacTVBjy/OHRbUPV
         kwP1yFUdrpY0HMeGrOuwBZPqnHD6XsZrj+/0E9fA1RnHC4BLyuNROu4LYMC43NvIL15R
         HiEE8K4oeE3btkEfXvIkKoa9hc/CbiujvpBaLkaKk/LQC+xbCvyha+05i5kSVatOKURf
         KjdI/2DhoKVe7Gihyzzr/KTAl2N3fntqwC+/bMs/kgZybMO3o1Ege/j9XOEd2qqq5K2e
         l+5/R9/ivHmxjgTGmT2jrDtGTR11+BJwwUh9+TwBlxWQbahIQTqDA+b22mJbqqUFpVAT
         OM8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795543011; x=1796147811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NH5unrqT265vEp+dApv9hr1i3do1hsssYsK1qTP0+8k=;
        b=qO+9NrAinPza2feC2isW29dklt5rnf3veXezRS8ZyS69xMM1zH9LcgplPZo/QoyDiL
         PqxU3k1i8w3AgUTksyFw6aHsf16qcmgtbZAnCEa4c3J5wDS/CqcR0UQYmusDFfKffS6z
         KiVUSat0iOijjpW3ITZ4QPL0psSiay5U9WaaCB3Z/slNL1OBE0Xw3lnY+7VBSHma/7J5
         iue2y7rVAbTXL8MnuCqF9qY78/jkfsFjgDmmUp2Qya0OMR5iR0Qdcd9G/f5D0qsYgTgS
         5We6unMy1ZCqH4lpo9peZ7nVJDGjkxXfeoOxg2BBiJbW7wdTAMmp1M9QSRWdunSHhmWY
         HM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543011; x=1796147811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NH5unrqT265vEp+dApv9hr1i3do1hsssYsK1qTP0+8k=;
        b=o8cTAnjYoEyfAf/kqwcbsCj0NylTeihB2eprmB5/emHTjSn1Nv9d+FvSrGcuMmjsDN
         lfBq+bAvcwrmro2yo3yTCOIvteVL+MfP5yCirj5QL9luIwywzx5zClH2KXqynlXOMUlf
         UJcGTA/KJ0N0sM2VTjJXuLP06gZsjaS0/iFkTrIP+ZpBRWkMSd31u6m0/1K9lFk+OwRj
         4DSwQRdNCMckCeuz8FJry8UXDkJdpA6WD8aSK9Ixma7hved0jQW6FcRoX/gSjZYlgaBK
         tAja4iZewh3JKc2QeKIhYguoBDeh+gBMC6ykt4WpMWRgv76z7A8La63+V+omAnY14Aw3
         FTKA==
X-Forwarded-Encrypted: i=1; AL+hErGqbUqfpX6y2zt77OtPlxSEH0wXQZKD8uAP3qLqYb2qVO15H1LOgs/tqlcbDpp7tfCnR7nAtLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P2lILisZhfIxe9EJdEMDbZ0TMp5FPbrUJ61a60b6xcYFRZzfY
	yyYdiBAj6Acy1xj1/kov6Pk7NczVAUp/cmTEZ8pIo9TqlnPlp24gOD3sTggs83rz3WD/L8tIFll
	EE92OzbEX3byc61Eh6VBQqHRR8fck0+A=
X-Gm-Gg: AZFdTZeuG5S16LtxU/xTnCcmxbQOVHajnTl7b6QGIWM0Q8gdMzcvaRIiH1k8P9kA78A
	JakKqOMUWNmbZRaWhdVi6XKNX+5z/OqZdP5ZHY4ygh0vo2pEv7yJwud80JsC+y4iEKzgVWtRb4v
	rjtL6PU/qPh/jhiqCGaIfR9Yc/6GqBztZFTGhLS8A6GbjFjS0tZk4ru1lLJ0foa83mGHkDI7Whw
	Qpolj1sfqln/0y7wusDOFyT97RhJdcgUxsC74LyQB3kYLRnE1bHMCJJGgWd50ecWiSeAG8R3MEB
	1TN2MOHvemF08hlLKofpFUQMYCQFDMJaQZG4IaL2M7bYu42DEafbfN9D6H7+qScx1w9jHDpaV/D
	tsAlrIyXeESlv746eKvxvmJPUw4DruxsFhjwOlOL6LOxMXVw/LH1I21opj2xlut688js83HClUe
	I9MJPcDPjnNYoPxX+WPXUNa/6SUdnftWeTF0rqTl/ZFbE=
X-Received: by 2002:a17:906:c10e:b0:c41:5e31:5184 with SMTP id
 a640c23a62f3a-c513a99abe6mr1273417166b.13.1795543010796; Tue, 24 Nov 2026
 09:56:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
 <20261121091235.1447291-3-pawlik.dan@gmail.com> <awWkbH3O8IrMYiSF@solitude> <20c5e53b-e2f5-45c2-9d64-d279cb884870@lunn.ch>
In-Reply-To: <20c5e53b-e2f5-45c2-9d64-d279cb884870@lunn.ch>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Tue, 24 Nov 2026 18:56:38 +0100
X-Gm-Features: Aa3M54qxnIPqJfyP0cYbDBX1uT5v6587PtlWyKTheAzN28rhHK9Hlm2H7w3zdog
Message-ID: <CALC2AphzUqBjgx+JqLTQU8=EizXoR+EKTJjakjKbP29exNNH0g@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, petr.wozniak@gmail.com, maxime.chevallier@bootlin.com, 
	olek2@wp.pl, szymon.datko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026, Marek Beh=C3=BAn wrote:
> It would be much better to somehow check for RollBall protocol.

Agreed, that is nicer than matching revisions - it covers every
bridge-less variant without a list. Two problems with the snippet as
written, though:

- i2c_mii_read_rollball() maps a poll timeout to 0xffff, so
  mdiobus_c45_read() never returns -ETIMEDOUT here.
- Returning 0 skips the PHY probe retry loop, so a genuine module
  whose bridge is still booting at the first read would lose its PHY
  for good. That is what got 8fe125892f40 reverted in b521003c27eb.

What about this instead (with Andrew's MDIO_MMD_PMAPMD/MDIO_CTRL1):

    case MDIO_I2C_ROLLBALL:
        /* mdio-i2c reports a RollBall command timeout as 0xffff,
         * both for a bridge that is still booting and for a module
         * without a bridge. Retry after one cheap read instead of a
         * full PHY probe, which times out on every register under
         * rtnl_lock.
         */
        err =3D mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLBALL,
                               MDIO_MMD_PMAPMD, MDIO_CTRL1);
        if (err =3D=3D 0xffff)
            return -ENODEV;

        err =3D sfp_sm_probe_phy(sfp, SFP_PHY_ADDR_ROLLBALL, true);
        break;

It ends in the same -ENODEV retry the full probe returns today, but a
failed attempt costs one read (~0.3 s under rtnl_lock) instead of a
full probe (~21 s). A bridge-less module then falls back after ~33 s
instead of ~9 minutes, with no revision list.

The trade-off: a genuine module whose bridge stays silent for more than
~33 s would lose its PHY, where today the slow probe accidentally gives
it ~9 minutes. The RollBall fixup comment says modules block access for
up to 25 seconds, so I think that is fine, but please shout if you know
of slower ones.

If you are OK with the shape, I'll test it on the rev A module and
send v5 as a single patch.

Dan

wt., 24 lis 2026 o 18:38 Andrew Lunn <andrew@lunn.ch> napisa=C5=82(a):
>
> On Tue, Nov 24, 2026 at 04:09:21PM +0100, Marek Beh=C3=BAn wrote:
> > It would be much better to somehow check for RollBall protocol.
> >
> > For example by trying one mdio read before probing PHY in
> > sfp_sm_probe_for_phy():
> >
> >       case MDIO_I2C_ROLLBALL:
> >               err =3D sfp_sm_probe_phy(sfp, SFP_PHY_ADDR_ROLLBALL, true=
);
> >               break;
> >
> > change to:
> >
> >       case MDIO_I2C_ROLLBALL:
> >               err =3D mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLB=
ALL, 1, 0);
>
> nitpick: MDIO_MMD_PMAPMD, MDIO_CTRL1
>
>         Andrew
