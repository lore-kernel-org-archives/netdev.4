Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457630;
	b=A2QG0D6hphSTt9AM2AEB0WubgpbhcQNJQyqe58YsHVN4fxFbYzQiCtE/JA6RqiC7w92j
	 jqZwiXx0V7NPaME2zWwh1eshGnomSp97W1x/QcosXJETkl7FdCEGoDF8GwP9dkE1AMzzX
	 7eKWxiS8DPzIHtdJy5B6TzMdxtlQK2Ufv+p7783iAhtXe6C5rxgoIYapE2sfFiyuv8cK/
	 opxLqEjMLJPNuM6b2HS/MZEmxCifHfLaQKa470/A480EfYZfcvAyolprdcA89U+VkePAl
	 YhqHpqnT+Z6HPgHC5U90bbPWUuwsWvBE1t7bZWX1mDYmQiMFFi0ARLRDLjmptpfujiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457630;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=YLMzs3icaI/TF/cOgSaIuciSiXWXB4AeI/+AwQ2yC+s=;
	b=CbhJLbTF4p5yfCoydlZj04NisWTgxcm+XWK0S4kMV7yhI3w1Z4mfhyDedeP/T/ESL2dF
	 +8cmW2bjAQA7k78/fM/69Qhr1syzCkBHjVPmGU3amshSnWKu20nav9bxSXuCtJwVLS4cC
	 AXZ9pOPrfFcCPFA4Y366Hgh1T+je9jxvZaAhPPCw2Fyza3dTjWkji0JDLAwIsV6rievpR
	 Inz9876DWq5WG41SKGEc/kn6AfqcnvYCe1mYw3D0vpl2EKjTpkuF5mGaydajDmSN6EI0d
	 czLToRlHJBeWlvtCQwT1nbdxCkT2lg+P/zn/iUZxbXVf6/ZmAWZx2RC0LswnSiUy3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=VYLYrLdV;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28C606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B28C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=VYLYrLdV
Received: by dvalin.narfation.org (Postfix) id 221D52040A;
	Mon, 23 Nov 2026 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1795457621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLMzs3icaI/TF/cOgSaIuciSiXWXB4AeI/+AwQ2yC+s=;
	b=VYLYrLdVifUrrtmmAPdqVOYBhjLtGJrsb9Hrt5w2pR3p9vV+El8z3TM8BoR5cOr+OklMZ7
	IWT7QRBSKbdoZwsnC/Tq8ad94C4WmmXxun+YaJKIG7dwxoHT8oea2xdNvPOJlz1TyQrP8L
	mD6wCkTiwvzYG9tTdJOmt6XrOBfUvOQ=
From: Sven Eckelmann <sven@narfation.org>
To: netdev-bot+sinfo@kernel.org
Cc: Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH net-next 01/15] batman-adv: document refcount of returned objects
Date: Mon, 23 Nov 2026 19:13:38 +0100
Message-ID: <3799504.aeNJFYEL58@ripper>
In-Reply-To: <179545458375.3294.10693460852466613013@kernel.org>
References:
 <20261123171827.3294525-1-sw@simonwunderlich.de>
 <20261123171827.3294525-2-sw@simonwunderlich.de>
 <179545458375.3294.10693460852466613013@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3806106.44csPzL39Z";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3806106.44csPzL39Z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: netdev-bot+sinfo@kernel.org
Date: Mon, 23 Nov 2026 19:13:38 +0100
Message-ID: <3799504.aeNJFYEL58@ripper>
In-Reply-To: <179545458375.3294.10693460852466613013@kernel.org>
MIME-Version: 1.0

On Monday, 23 November 2026 18:23:03 CET netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

They are things found by an LLM and they were marked with "Closed"+
"Reported-by" tags. None of them are reproduced. The marked ones are about the 
logical consistency of the local translation table (ok, and bridge-loop-
avoidance in one patch) and the data reported to other nodes.

They are corner cases but definitely problems in the implementation. They are 
not meant for backporting to stable or to net because they are no known 
affected users. And it looks to me like affected users would have the problem 
solved by some extra full translation table syncs.

Regards,
	Sven
--nextPart3806106.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCawSCUgAKCRBND3cr0xT1
y6REAQCsYugepYdtsUSDSZo3sJxEzu12QJVD1rVmDQoBtYHFBwD/XpSil1+5a+sa
jP6ctPMTOeKxWbtnUrlwa299k7SS1A8=
=7L95
-----END PGP SIGNATURE-----

--nextPart3806106.44csPzL39Z--



