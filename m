Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648230;
	b=rR0+5kv7vuPwi3USp6jwAiMknI5KnUcthAxpOVSvxMDKJj7216mw6Fn9fbbDlsj4KiM1
	 jeInNF2R/g+zRovFNhy2yvZcXIPJVaQ30lRLAg5uy/Q01uQPPxzEK2mstydQgCTKY1b9x
	 9DUaR16zABFX397nritlBfk7d8FjIct8RYfuqcihjMSBgXLCjfaGUA7zE7UNfgJnHGVHG
	 Fa6VD1DR5dTb7lW/b8BOR9iWp6CemMHMMP0UGwPLRb368j1nkDeQ1dfHzvNFZ9HRIPrDo
	 2kAWMmMz5kwGNxauldRVGzt64fZwTiLV4zsaK0e++YTeq4ISfX5+J9DRvKczim+aoXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
	b=pI3YJiccxDOSOoMW43BgcC8UObqqwBNzNbkHpE2hF7QMr4TzePDdjjfR0bJ6D9pQHSY4
	 luwIhEJvNakRyhnbycPS55+I7GdB1R2d6NNhpOrWxRPz2sc4oYKKDtv2TkE229AgxtGI/
	 HRWx5UW5cR7H2SzuHQ6bdrlcWuMMWHAuo318gmgp9SXSBzSiyhdwjfh0TgpR5p5USJriz
	 Zs2Yx+/AmzIvKtkefI9amZKNkoYXkK1XrdWtVe4gpbcbaJsBYBlXrI7x8f6ChgQldpo0w
	 uMgVMh6ccCBCSWNpK7wkx63HdQXMEQszkt0qVynFek/rLLey6fH8kq6eUgn8couXEJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701C2606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701C2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3830865a91.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648230; x=1796253030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=QiSPxi8Ruze1+eJW6+Da2Pb69jLHtjp5IOjJBHZJcfCiPL+nrAc/PVojTPm/UyFnFr
         2ToPnK8ovRrXR/aZZeKm9h6vS5pzLDPhzpjmuJqIQgCatKiLHY/V/nYzTPa1tUY8viLW
         HHQsqwosd/i0t9dlJU4W0+xtuayQqbQoW+3ExNQxi7m24WsrgIN4teF5xobePoU7/i98
         ptn05DfhDKV9mDYG2vp6RlRg7KE0UffcyutOQ0p3mu9OklqnnbBDA5e4zhg2rU8LLLYi
         B0c7T89jS1Bxy6HJDKtQ1FHLhdUT0g0G6U9EDRLy7nHRlnfHPRxUhNV6NfEGeetdzMvk
         idTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648230; x=1796253030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=FqDSoRMmeGVQ1Xdj5xSK7EE9tMNnN8DcWGhFWz0JY+mVetXnrta7Cd0DTup0PjFC26
         l/W2QAHw7It+zH6KYuZ/85r7qtmWgP3gHeUrdwNqGOtu4WbJ+6mpCoK6QkRydwotg5oR
         eQeQAoU1zj6LfXk9CsJ12+L4+xJDNH1JcIRxg60eyvFuAM0EIfbPr28KA0v8eoxQaEok
         +BvD+Z0Li1FRav+MoJxax6iTlX+PhjgapR/BXPFlSgF8EYinL0SuuokAKE0SksfQ7nfD
         SRwMEB4RQR++DQWuq9cFhc5uso2K7H0H1QzHl+R4SpeCdEkMtaNDuWFgpvFNXP9TIT39
         iI2Q==
X-Forwarded-Encrypted: i=1; AL+hErFGxk2UWhijFzXlWDgY7dPY9Kt5wn1G5uIo8ee5fLOkPFoex3QTRW4DBXOcrIBmhN0VZ0qpGno=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QZbq5xrwEI3ra2fL5DSaro8Sq1lBsUSsAGNWpjbIOQoeTFO3x
	sG61QYOU7vGE51LPjIbOnpRp3fyDsev1pEj9Rjbys1fjoykIYGRvOM91
X-Gm-Gg: AZFdTZcK31ARFl4Rza7Eq2jHPaiVGlPZshqFAzULBNsHV+TCRI/FfRSTJJx3tfSUY2P
	CHf+xsC3iVKzxsopfnXevEE5qCB5C0S+2w1C9z6o93/8PLETfMEaDljOgxacDunYYtFlloLzuvf
	g1YX86ySHELKKDpgMThron8SbQuGAEkRo0C/q/9/o6K1DMZQYrmb36t/CtDOEuQKzc3JA7DKajv
	KkHC/irA+BTA0WviLC6cbGX38LfkE3vtKcd1kPouFd8C4NXYezxdZbuhiyiISTG+WMtBF0Pp8J/
	WWlIQ3amHuEJ2ryCCTNiX8QygYaYYk6oqAn7C8zB7aXMGO3beFnMAYZKP/HVFnUpHhx7pwpjOWU
	aQYXob74GGQOqjItMlBkpHB3atH/Fsf0g0e4qJYeONzx/X3lAH263TqupdMw9u7w6oZujoVa5MF
	bKsLrWizK+9FqNbSEtPvzuYIsQINFL0vPpqq5hW4So46g62Q+H8GX4Y+Qemw00gECaE0lBqHlYs
	rOpY9VFX6FpaOcamB0sWz0xAuoLDjFQlTHPb29DHahESmgpU4bV71rO1OhWHhLeJ674GiXg5iKS
	jYfa44QPh4qomzSZSResYBdaujWX
X-Received: by 2002:a17:90b:2648:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b41c95f127mr17871039a91.52.1795648229629;
        Wed, 25 Nov 2026 15:10:29 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm6822830a12.10.2026.11.25.15.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:10:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 19F1A420A76D; Thu, 26 Nov 2026 06:10:25 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:10:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 13/14] docs: submitting-patches: defer to
 security-bugs.rst for security fixes
Message-ID: <awdq4PpsF0BiBpBf@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-14-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="fXRipf5woL+m9ZeZ"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-14-w@1wt.eu>

--fXRipf5woL+m9ZeZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:13PM +0100, Willy Tarreau wrote:
> -If you have a patch that fixes an exploitable security bug, send that pa=
tch
> -to security@kernel.org.  For severe bugs, a short embargo may be conside=
red
> -to allow distributors to get the patch out to users; in such cases,
> -obviously, the patch should not be sent to any public lists. See also
> -Documentation/process/security-bugs.rst.
> +If you have a patch that fixes a bug with possible security implications=
, you
> +need to read Documentation/process/security-bugs.rst first: it explains =
which
> +bugs need to be handled privately, and whom to send them to.  Most such =
fixes
> +are posted publicly like any other fix, but their reproducers and exploi=
ts must
> +never be posted publicly.
> =20

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--fXRipf5woL+m9ZeZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdq4AAKCRD2uYlJVVFO
o6e0AP9gJNOsIP9zrW1e2mg+m5ED7Bg/2J+m6qHgcL361ELOsAD+JrY2Pd5C+/6o
IZAvI+CqACZ8YZPx9icO9xBREbGGQAI=
=9Bsp
-----END PGP SIGNATURE-----

--fXRipf5woL+m9ZeZ--
