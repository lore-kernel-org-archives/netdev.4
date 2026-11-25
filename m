Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648580;
	b=0H5rJL/Qq1iIxTyZywhYkyddcW13eDamcXLv9kcesB+lWqckzW8vNRvUsvh0JXOE4yl+
	 gWa0L5c1io0TSMBSPLmWKNS/GcnTcz5K1DjkBXo1JJ+9xwNoOVL4u2jG+Go/hWW+n9jxb
	 hxqSRnnP7+3/18K73F6VFvGrKq5XJRvi4Ndsf5+0Pz7oycA/DxbHBpoWDVKysRPjHyYHt
	 PsL6CmVjIEm/+qrlylK2fnNmE4FTHUUMHTOMpMXMpxt/f1iI5mIrEECJlZpICm+nVFDiU
	 IOuv/0nAkD4dbQUJh1S0GzD5NZf+NvViWnWVuOuyz/GnFcNwQMXMxgHcvgArDN1KyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
	b=cJWFhFnGB2EW0abY5fEx1FEee0jOVGt3ALimQhPZ7SKb+kGM9kFLYKZ82xl62WK8lh2s
	 DzGrWKNR17a2YMzzZD+8kgeiPJdHjlwV/3vCX8b1XOwfQ5+1hdWCCiHnSyh9PEjjMjLsQ
	 S0m6ga/WEXIUxEiB7tSgfMRTjZMcKpgYFE35uLRb5Xsjjp4rhrISBnVvXVEjdWSPfVrSl
	 UxOyBqG245vrajMLbKLV682CYEG9tlEKw7vdtCOhNRL4C9fx4GXhxcGFpMs/pR+oi6kB/
	 X7Cgf0OzptaHPjR2KprPcXUiaNWxYw/VJRalKe9Ja7oH++e+RmTB2zC1SsdidxX/NWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA66606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so2456153a91.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648579; x=1796253379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=jKVIZ7DvKZtbXaP2DWsG09+5JZ3RgD/mzAYzNjFfghXqE8SLLfTjgQVYyBObvfZCIE
         u46RPFKr8glGu10TadtWqkJSA+3yPwR6nZ7qoJY3i9sH2LNi4yvOq2SMZBS3h3J46CnL
         CkVwe0jjwltsnc7kUiZHEkusvRGEg86aCCiucpp/NAxej67F4qRP4AsCDV7CrqXlEadi
         I4ZJvss+NMW9r2Tp3r17lk6RoXBeo6dA/zcXSL3qyGEfzRDD6F/xUfn7zmYoNLHFv+0F
         D1ZFxvU3E62+cAleVRJ/ZhJhKRi3GTUlH8P58M9GUwU9apVhS2soKP335BgzHyB97ApV
         bMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648579; x=1796253379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=y61L+7aHZwiyhxlCkQyg8CY6QPa1J8YLpzRXuRTDcRF4/o5J3LKGR09fPHE0sYxSD5
         Y2zg9CdfwFBfvnyYqaxz+htzw0ZtWA2RBS/cmLv/haTPWy0dPSeAdDI3cfqMTRTMaCX8
         rjL8WNr4+YkjZjDiG7qqOfFCx3y0wi/T0wnIcSBLRahlDzlz9+9+uVRCRaGJABK3xant
         9E1faT9crRMDMpfg/bp3aT5V0B3ZVYHWQkp6CEnzHOVdIXCKFq1m5EEewCSNtZfoD8w7
         YQKdRcKRwS6fRFMQfUWGLYJLWNEodqoa2gKZHOVFDNdteyuksqeICnFmdSqLxVdVar0r
         eT3A==
X-Forwarded-Encrypted: i=1; AL+hErHaWBVsn1AcOHe0M1BaRKpKOZITZZdGJZ0ppQijTy+b1NGiEz7GKD2ADOGbs/morrYrMgjf02U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oX+UuLC2kd+dNeODlbw3lKHNGYq6GAn+/AMmS9yCzzPRhw5jF
	B0/gRetcHUkcipyNSzt4k8fARe3T8vKrPukn/ha2wwBvu68uVgMuRn+j
X-Gm-Gg: AZFdTZflgcB+vrRy76kwb5+8zlLBQ74r2bBVEkS7y40zM9BKjrsIUG6vsl2enxTHidQ
	uWv9mwi8uvs/KaFRWdcjTqcSVL67BwUfCtOpNAC6YjRArfgYKh3Apa38iby1DrZa4EzLjVjoRN5
	gN3zy6bHY62zHvvjrawZxu9flhePa5jALb3Xy3fBes/ty0PWSvUwEHnFRLhI8F6VlXLI8KCRSeb
	ZiJiynRRjP0BaCChmudd092Tvk5GkdYunrnPuG+ytLsxP/pw3DMlkt2Nty8TIzvFQzN+XVoFkte
	7Mr34ahHCzVnTua5q6KgRBqwXhAvSkFbr4asdSY/Bp0g/lux3EOgSNWfUxYcq0HVi7Lr0AXtvhP
	bRmjcQW/CVil3DC2+nqhJxSBEzBcQDVVzwKRdmTxGiFuPeehFJO73EpUs63A3+cop6A7SYXTYqJ
	4rTAhtOKW7wPxWgxzsTj1bhQTObLEsm7nL4FVmN8EVqDjm070+BwC7pYGjRre6vjErxZ6XzXWcx
	Xr0vVN26M6DCO5MDEuOIe2zkBDiv/4rWsGjfMt6J0jxsqYGKInzC0wLNDXyrCp3xdPArL4iMB09
	UEc01U6HKGlhdZzmOE4O42YiK/A=
X-Received: by 2002:a17:90b:2e49:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b41cb212bfmr17680989a91.55.1795648579180;
        Wed, 25 Nov 2026 15:16:19 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm29282158a91.0.2026.11.25.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:16:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5F6F6420A76D; Thu, 26 Nov 2026 06:16:14 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:16:14 +0700
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
Subject: Re: [PATCH v2 06/14] docs: security-bugs: do not send archives or
 binary attachments
Message-ID: <awdsPgHF6Y0xuSQI@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-7-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="Yd+Dybq0Bn8RY/CL"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-7-w@1wt.eu>

--Yd+Dybq0Bn8RY/CL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:06PM +0100, Willy Tarreau wrote:
>  Please send **plain text** emails without attachments where possible.
>  It is much harder to have a context-quoted discussion about a complex
> -issue if all the details are hidden away in attachments.  Think of it li=
ke a
> +issue if all the details are hidden away in attachments. Archives (zip, =
tar,
> +etc.), binary files and documents (PDF, etc.) are never acceptable: when=
 a
> +reproducer is too large to be placed in the message, attach its source f=
iles
> +as plain text, and provide scripts that generate the required files (e.g=
=2E file
> +system images) instead of the files themselves. Think of it like a
>  :doc:`regular patch submission <../process/submitting-patches>`
>  (even if you don't have a patch yet): describe the problem and impact, a=
nd
>  list reproduction steps, all in plain text, then provide a proposed fix =
as

What if the issue can only be reproduced with specific binary files? Should=
 I
send it as e.g. ASCII-armored, OpenPGP-encrypted attachment or should I put
it somewhere else on the Internet (as privately-accessed file) and share its
link instead?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--Yd+Dybq0Bn8RY/CL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdsPgAKCRD2uYlJVVFO
o5lbAQCf+HFr4dpqHo/NjE5YZQjZhBumSvZxjxGVy4Bc+rJ6OwD/dQ9wDciflsw8
W5Gcx2EYKEBwUYE42WbwBHghakXKQQc=
=0aJI
-----END PGP SIGNATURE-----

--Yd+Dybq0Bn8RY/CL--
