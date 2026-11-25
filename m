Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648140;
	b=Ixj1WxQB8nQGipy3ENRacmtTABaV/tLXMQLXrPyn40/Am8eDIqAFrxpiOFkVGH3AGrZ0
	 6QGwxKh2cMSl3XtpT0WVpOCp5LPr5xo/6PrvkgG72HUzKs5VCwlGc5BRe+0/UqhY9voVk
	 vG3qOlJorvTM8rjCoGaIYUUqybW7VN/nR/KQ+yswqdm3jP9534vGw+8Tzp1xIzIqtrqVn
	 96Rh83Mk7hia1xBnR+G26mvJ3+u+cVTnn2x2CLShjs6dMNPBJ7GYPKzeWCxgBcn1QO4/Q
	 fEmazDYxYox2yQcczVjLUo+9k/DprYAkJ6B2DHylpyRRviad2NNWMmdfjlm7mHBaF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
	b=ljFokC3mq2X2QmJF0XW0Y0uVzaz7yoTMMphF+mRqeLa2B9oMovywAaccF5nO3WvHM82R
	 4uy+Hc30oOzYYUABGQfCsV922rI22e11ejQI0mDCNs26AstWE4woOK3L1aFjcTI8eOFhm
	 ZNQ6hriXuO6bQ5UKnlTO3UZBvVGQvUYI5Af0QLLHH2fN8Xa+/g4EolmXF+s+kd6PyR3Te
	 6W0UWfmcEQLdWIprPbW7fHHHImgCT0A/uTkJD8PVpN8gRGdy4cCOd9kM3FRv5O2NAu/2q
	 hyEjLqkSrVRZjYmWDw+ot5gLT0AYHABFFcr9bx+Yq1fzqFmrNdaptW9C3weYBzlLTOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3B606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C3B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgEQxPvq
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f0464dd6b6so39675615ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648139; x=1796252939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=MgEQxPvqyytLZXf90OJPdh9PK1QbYUQGR9tBs/gU/iq2JMuoIc1EOF5PMb/JixBK+Z
         wZdsRu1GceHsqwSdB+3O2/7Uf7ghDdLNUL7SLKmR8/BiYzlM1mkLX6XZUrB07Tev7973
         X7MksrtBfscb8nNYJbxGM+eNYzSr71x9jR0MLpzAgaxAa53nHoo9ysokjg+ydCbjgkum
         arsJzwe58DZENu8fxE6FjTT5rKBGlRJsyFCeIjUGG4w0BdBAA0Jpn1+K96zKAZvSAaz2
         90vgLS9ls0SHShj4sXXg5R8AEfgvAuPpE5qByrYdt2raTvSBo95lFHi8Jk2qURMPkz7v
         cZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648139; x=1796252939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EorhezSB3H7kybqBFg7VnnNzD79YcoCZdwMFraja7fw=;
        b=SkGsojC9YgZM/AAljP4JOI9BBH1orH3XI7+rrLPiXf3UohojaQ1E3keAIBJGQeU3U0
         m4tOfDLE0Kx79zckwQibSf0ATqpV3KUXjgl829x7eA3VIjNAOOE+SORdZHhTO55XDGGl
         RAxAzxLxWV5JmMxkpi1jxgOBfntspF0D7eDhea/tHZOt4lZFliGa+FM/QX4R90xdLsUR
         y3mAaU1dmPcwFfcTBB7/nOwSfTVi0CETBDSIwNNp2Pl0xosvyhG/KzMEFQpCLqeFwAZy
         5quU1pFtM3t1vHaQre83yv5MJBnSOwdrp0y7LoyrzIkvktbza8WYrHi6gaw1gZ4OnXSl
         bTGQ==
X-Forwarded-Encrypted: i=1; AL+hErG9gIJzgo+s4Cq6T27hiCWElWeze7XnB2XLJUB5Hq97gqNc5SQBIOFIpkExfX5BGczlBqoNXxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sjgh6sNlP6B6CM+W4+N6meS0og9Ahe1DXd6VQMjMgoCR2Zey1
	dmO7/xgd0eVoRbmDE5Rm1FzvpJgpY8WLhDC9U1vlesbIY73uL04PdoaJ
X-Gm-Gg: AZFdTZepkDmTVXDFDmf/LE1Ho1evud44lIKPu9H1CQR6gaXMPlmZEx3V33EO57Nmq9U
	uO5qFQ7Iv9kqZKiuUzHXPsk/qtemaZ5UaEk4ek9/USZiyRthycXgLBMGnnHiyqLwH2ehb67hUVb
	FU1WtJQPksS+6U3aXiKsohnzno5Fcf9cAyH1gkFfGxI/M4OvCL0P/8icca2PF2dhCYjMxZpRPrz
	L03f+Y84L9AM6jefkIuU93SVguypRxdBq8HNBoBnkmFd5B2RhR3YTFb1/rznLMjG9Lu36KQ5s1y
	ngb0tu2xqe/Br9B+4ux9IbZ81iUzRqqIwfjWGtdmpNUHdMB78UEUF73DYq8ElR+FoaBzSwmNpCA
	4grNJBVNzBvfIUomsMeGRuECsLhquQerXXRHzvkzhdOKNn6qfU7KwIkgAJgC2mg+mm8UW1bxWKZ
	3h40xnV9D9UYJQg69hnvOLxUXSXuSbxsk88nouh3OMCovzIw0Gs+Raiuq2fC0KkkLazOmeweOin
	lcB5C5iZ9yF7acTPFhhIw1aA7j2BpeYcbJCpO1jd72kU2MNNlM0xvBNdFt2GrXTFhjkXmefbFV3
	VyVaoS6JAFoIrRXrwzu0WvJnco/PzqutusY7AUhrUEkPW0SD
X-Received: by 2002:a17:903:19e7:b0:2ed:b7e4:f5b with SMTP id d9443c01a7336-2f03f18a7d9mr181302175ad.40.1795648139044;
        Wed, 25 Nov 2026 15:08:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm9395193a12.21.2026.11.25.15.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:08:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 78DBD420A76D; Thu, 26 Nov 2026 06:08:54 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:08:54 +0700
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
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdqgBF62SOKaU0Q@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="/uqKRyynA7J8RM0T"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-6-w@1wt.eu>

--/uqKRyynA7J8RM0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> +Most fixes sent along with reports cannot be applied as-is because they =
were
> +damaged by the mailer or lacking a commit message, forcing maintainers t=
o ask
> +for a resend. A fix must be applicable using ``git am``, which is most e=
asily
> +achieved by letting git produce and send the messages (see
> +Documentation/process/submitting-patches.rst).
> +
> +When the fix is meant to only be sent privately, the preferred method is=
 to
> +send the report as a cover letter of a series, followed by the fix::

Documentation/process/submitting-patches.rst guidelines also applies to
privately-sent fixes, no?

> +
> +  $ git format-patch --cover-letter -1
> +  (edit 0000-cover-letter.patch and replace the subject and text with the
> +   report's subject and text)
replace the subject and message body placeholder as appropriate for the rep=
ort

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/uqKRyynA7J8RM0T
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdqgAAKCRD2uYlJVVFO
o8cvAP0UI4UPI69NykSfDcgis1xBWe2etCvfNQGcwSBb/jIkFAEAk4tq4aFkzzMk
UKJQhOV/RP0fTwz7if/m457ISve37wU=
=72sa
-----END PGP SIGNATURE-----

--/uqKRyynA7J8RM0T--
