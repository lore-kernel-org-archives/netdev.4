Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166637;
	b=yyQjtUO0ZyB/1yBwxkTC4cxXQQNPCDRWHmjgY4alCR4R3EDY2Gsko46sXkUmlQ6fu2Ds
	 XdST1Xat7nsdn6Thbrxr2pbeZ+upoeNjl9QAnS2vlbZFJnrdUAzDW9gqiJ0DHalnf8MCk
	 qB8djQh2ayIH6x2XwiJ9/iZfwdtgt4hcelPFrDZqTgpmZ9bPFOy+GbVbAUuSt6bLuwy2V
	 KOIAiJeW6aVy0ZkzjdGVuux22Vlbq+B+XtQGoVs/b1Q0Eawb2P4rK8hvdBI4igIiEyr1c
	 ZawSuRB+cLAZXbDw8d8sEUy/YLV1hb6yt/YEqg0Ix4GD2c/Uuit61DMw9KZvMut60Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166637;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QNoXpzyD5GfQ4mvGWevbENhC22Gs5cnrlABz42Of+y4=;
	b=FApBxqMitU+9uPxdJsiChPOKQJLD8eF33ZBdGrqEw7D21A43/qpy6N+FTLfkf6sMgeUx
	 tx3JnLjV2rWon5U9WhR8FYuDX0KNQfeukle/NRuu3E1FlgIcUMhjEwuyYxAacwCFahHom
	 Y0VYEmIVxjqAMN7mc8XH368rxW36f7AzlkyyLMjux3hqR2omT9ysVTgaZPnBAD9X2w8a/
	 4M2TOhF0SWndOVNPC8Y8GtJC+p2Ov7rRVZJKCIov4CRQ9v6pAPrCTyx5hKhAihccMiehz
	 1GzxC/yFVO7azLIoOOn3vLNY1QKkM9qq4t16db33icLr2S/C9WEk8aV9r89GHMWKX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QrmqOGTI;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80767606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80767606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QrmqOGTI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QNoX
	pzyD5GfQ4mvGWevbENhC22Gs5cnrlABz42Of+y4=; b=QrmqOGTIfAqiPELyZZpY
	H2Kcdwte9CEk12MCDXVWPksWdHLf/lUhVVF+MOfnCKM5dzjYrSPTbIBHK0Mc1/9f
	8A5jNnP+nqQKhe++5Oy+0HnEthn82sC8e+cwnECwgAIZm2+R67skmzONT+uFTC17
	p/NamNabOojfzCtGcQGx7e/+w1i71etCj+ZGUHI5CuNsV9QMzbGq//CKc80yd9Sp
	NpqCt3j4xIim+FT3heguhezihGpUsusYJWWTZ6L8qjtvU9XkrJQ69BZnPQ5XWXJ6
	GO1G2in/gDnOFN42flT0Fn3QSdMeSmYQI4L95L3tvkPe5PfrwnAk3K4R1QjLOYgK
	Hg==
Received: (qmail 1414173 invoked from network); 20 Nov 2026 10:23:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 10:23:44 +0100
X-UD-Smtp-Session: l3s3148p1@gGr5zLFgvs4ujnuU
Date: Fri, 20 Nov 2026 10:23:42 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awARmkCuelD_fdX6@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="JO3GButChuWibljo"
Content-Disposition: inline
In-Reply-To: <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>

--JO3GButChuWibljo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

thank you for this series!

> =20
> +  '#reset-cells':
> +    const: 1
> +

Maybe add the new property to the example below, too?

> diff --git a/include/dt-bindings/clock/r9a06g032-sysctrl.h b/include/dt-b=
indings/clock/r9a06g032-sysctrl.h
> index d9d7b8b4f426..e3059c50f7c3 100644
> --- a/include/dt-bindings/clock/r9a06g032-sysctrl.h
> +++ b/include/dt-bindings/clock/r9a06g032-sysctrl.h
> @@ -146,4 +146,7 @@
>  #define R9A06G032_CLK_UART6		152
>  #define R9A06G032_CLK_UART7		153
> =20
> +#define R9A06G032_RST_TS		1
> +#define R9A06G032_RST_MIIC		2

I didn't find any listing of the resets in the RZN1 docs, so coming up
with arbitrary numbers as we need them seems okay to me.

Happy hacking,

   Wolfram


--JO3GButChuWibljo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsAEZoACgkQFA3kzBSg
KbbT6hAAn7FkeKpyHdjW+ucRCZDLfEffjGdzUx47GhoXUpf8gXGmshhk3zweElwa
PAT6JfSU/apMDxuEB9pmib8LF7sgVJ+2uSC8blv//wUxSZav8u6HGQ27Kpdn/Cca
wCYaCufM+YoYhCJhXIFkk+siScNuaq5aSwL2sq03+QjpJzq0YxoyCHYbTKJ+eDZi
hSz8yfTDsaP5HhzP63LvxWJEaXDm7w8MPE/RlWgSSJg24D0tJad4Iq6yA/nd23cu
iMnoRZNmfL8xjQFanq9wMqhx2P3JsWOmF9ZymshrAFT46SprmcGvbLPoFKGfuUhc
4ukJxM4dMFAKtO16mVvCsJu9SA7mSAL6tE9dVbi430XTtUAHWiQ4ZJnwZaQ3gTER
ZTN6iuNQs5BnAgKncHLjh/YDjuD8gOWjiGQy4quM7IubO3ro5QZ5QJ1FGaeJQpgB
aMvxQvpG/50YWOPbM4Wy0XT08K/yX/BA0E6dY3jwl4PsblqkftwgsVEGkwYAoUEK
ay2I+A33iwW5RvJYEFwCJjQhMK26AyNIYl68o68BhWluD5jRXm92WoFV4oMZYi7Z
olUoeFWC/y/TycDoEH3DQ4TDuy9lCzhFtiPrIICRWF/iCh6VRdr70bxuMYYg+G8I
9siFEQEcTeKdtcQ8C3WRri4FPbjB9dBFmgpC1/0NhZiDcolZ4jw=
=Hyt+
-----END PGP SIGNATURE-----

--JO3GButChuWibljo--
