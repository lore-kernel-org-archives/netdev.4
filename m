Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649784;
	b=DjU/NFt7TL2rbcYYdR9veBoNpLDpjZO+McANkGOEI+HeK/mFaNNwirdR5fgOWExU0lnK
	 75FPtHSXpVFHXlRS0IESGb64aKdkH7L3x4pirYF8TOa5mYoFpIaPfmgedo+AHzQQs5sm4
	 l8DIkjtjgZwl4ZdN+fgpMbmkrpyBALkxBM9OUqhkVFwRcBAQ4yRtUIxh5Nx505Ko1WnZl
	 huhqHW1Py6ZXI9gNGQGdIMHyO2SxgcGcBTI1pF2ikL3yQGNqf6ORq3MrYe/GoWl4Mo8hS
	 21OovR0xMCdSEFuEB/J/TMKhsowNPy44a7mumBO7o/4CDDYfEj890gSvTQdCTFL0iQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
	b=gWAAs6BVoh1Ggom+Ivm/jW4mxQLyk6B4GUCcmtsvyiD3Zn50Fmx1z78fHqrQi/5buPYu
	 t8EeCuET7KvSLI+yyaX+zLLrmv6Tl0YuFBo8urCohjDvYFc4UdQxbE/DbomvF4tQDXOBd
	 PBfxCKnJcNTxz6G1hEXpp8do2TPYWY8VwkDPrasnBDD2HktICMEn6au4FewEQVTzgKWOV
	 oDwvSyHE8YQnKhMV8TT2o1u9t2ZyRTu84bOHIMFIimrBBfikKdiLWr2wGtFD/Y+oolWOa
	 88uarnpTqBN14WFdXAy9Zg5QEeOTp0rPxtO8XjnJMKUWkS0axZOGuEKhENspPAAB4qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28C606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE28C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f066274caeso30058145ad.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649783; x=1796254583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=nR9+m7iTvWR/jIkbcf9Z+O6bsNRp72Axj2s0OUlmt9yupfWpUT6wQsOmbmA/yZJycV
         li74Whz8zjMczAWHicw6f0f6u4EbjNGeTVeld99kVxbyTQpe2UH7YhtyOh0QMNjRMOep
         HDFIn6AteS/5VpRAOObaLgMoB1UpY+xLEepGGj+nAnWWf7f47TiOtegrcKmxE4VtrxQH
         8OOQxOA/8pggzN/01WLKokpRZletP0m1gmJ/5enVlmreyR7RdJTTGCglXNYekVu8ZEY+
         6SHfiqaacf6otbN3RQX1njz4RCmmRFNHgVZyIWxQeQ/vINPUGxE0gI+gO4JZjNy/S/m7
         Nn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649783; x=1796254583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=Ucn50sZAYlcQ30Pyu7HH8drRvjFGIzxmT9IRrzcZR26F9ICayTjuchqMgzTHxA8xWl
         UktHF/5nh3USFUW3OqaRRkYqHDMgqclLuN88k07eJp91wpY79MzDgJjAVtlIkNVqElD2
         dp9JB0w0Vk8Mt/WBDVLEfflycgmSbvjCkqfz8rrc7oRqpZ9fwFfRQgLqXd7wZDqiZeqN
         37yGpM9pUIwTGyC4GaXY2pwtF4pyNgMTUfdmJAJxZDjTOkastUUhgX0fCr6lmZdxJSRs
         lWd6jfGuG/RM2iLVNeADWoc69ew9BEwKJWjMffau86OC1Zcuak14KDEJ40cBigdy3xq4
         HkUQ==
X-Forwarded-Encrypted: i=1; AL+hErEqJPVaRj0JuPNYeuUv0pP5m30MBYqLRPmUuHpoWoUDS+AV0smm+pt7HjVndRcK5aMl42VUMjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z88Zlfc8fcjwI36cAcnFE5xKshqJTfuaV0kz9LVlhqxops/QUp9
	Eymqp32h1Dwv7/bwLotYr/yY9UrR5pTq73n10tWe6oc1936KkvdSR0hT
X-Gm-Gg: AZFdTZcV7Wnt2svP181B4ETBzJLZmTVRsuXMnS0qXC5QSDF5Mt6UETEz8twQpl3mJo6
	vti5vQw0eNVrNac6cd2qgOI7c88J84CL6BjxpLPH1HfUMWzV5tpP+XHGuHCvZ2O6YfIAs6J1bis
	R/c5x05YZEftZCWSbePoQJKhOwz6DwqeswpKNcFIpboXNDVSFGBYEEmMW2aPh6BQeaFJ19kTyfK
	8XlQeUwG6vjcUbFCyKuHbfln8CiDt6GGGUu5Z34g2JmJyA4Lg+jENx2cPPdtfPViL4W+Csezys0
	2YUpXpc1ylmnN18MIOA0HQJPFw+HMi0DueSkAHkzEc++/bgddXuqqWTE4XMje62/MvmH0RJIR+/
	g+4cEL/o5Fn4TGQwezrYy/9Cr4O+cXAZzdtqNobF+xSkR5w2HvrociRLTmivGAeMY2EsTECN0Gl
	77i0zA/qSnTmYQPSiGcfCjJHX21Q/kDikAnjvsE9okYHjFcgf+iIaRxM3EOFWUrcqX8jYksUduz
	0QStC6YcZSUvS69oPSG3DNr3KY9tSRVHi/2Jqi0snlclZLCtaeQzmEApOUJJYhKbNkynCAb5UE7
	YcTMV0irmM/GLE/ZxnOHla/CQdT6
X-Received: by 2002:a17:90b:4ec4:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b41c8fcd3fmr17046919a91.10.1795649783039;
        Wed, 25 Nov 2026 15:36:23 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm19602862a91.9.2026.11.25.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:36:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C3C7E420A76D; Thu, 26 Nov 2026 06:36:17 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:36:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, gregkh@linuxfoundation.org,
	Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdw7OLaYvXcGPgj@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
 <awdqgBF62SOKaU0Q@archie.me>
 <awdrPui-KI-SK_5N@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="Kjo8vLeaeTg8pZ2D"
Content-Disposition: inline
In-Reply-To: <awdrPui-KI-SK_5N@1wt.eu>

--Kjo8vLeaeTg8pZ2D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:11:58AM +0100, Willy Tarreau wrote:
> On Thu, Nov 26, 2026 at 06:08:54AM +0700, Bagas Sanjaya wrote:
> > On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> > > +Most fixes sent along with reports cannot be applied as-is because t=
hey were
> > > +damaged by the mailer or lacking a commit message, forcing maintaine=
rs to ask
> > > +for a resend. A fix must be applicable using ``git am``, which is mo=
st easily
> > > +achieved by letting git produce and send the messages (see
> > > +Documentation/process/submitting-patches.rst).
> > > +
> > > +When the fix is meant to only be sent privately, the preferred metho=
d is to
> > > +send the report as a cover letter of a series, followed by the fix::
> >=20
> > Documentation/process/submitting-patches.rst guidelines also applies to
> > privately-sent fixes, no?
>=20
> Yes, why this question ?
>=20
> > > +
> > > +  $ git format-patch --cover-letter -1
> > > +  (edit 0000-cover-letter.patch and replace the subject and text wit=
h the
> > > +   report's subject and text)
> > replace the subject and message body placeholder as appropriate for the=
 report
>=20
> That's a wording detail / preference, not going to respin a series for th=
at!

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--Kjo8vLeaeTg8pZ2D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdw7AAKCRD2uYlJVVFO
oy3qAQC4EPhrAXmftWcO+Qjt6IRMGr42yV+tdJa0t7L7OWolnwEAxVxjaT6iGwY7
vDe54HMMZEorAqWYR7Jt1hlwu+PDuA4=
=BL++
-----END PGP SIGNATURE-----

--Kjo8vLeaeTg8pZ2D--
