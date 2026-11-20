Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167152;
	b=dO1ufL0XJUR+NzjqoVVZVdI6OX907lEMIi4Yan7oSk+Y3irLHX+zeK6tvk0g0W40GtVG
	 ZUk13xvyPbwHoIZb59AwrTZ0qVL2MJxX7TlOv8TS/fhTa5A0KPlUNVFv3brMV5aIqC+aV
	 dnANXrMafxFZS34pf0/3gdZhhnswRFqvd8Du+GnPm8ErXhvnzva2zfZaUmpxqOUi+UuuE
	 MPedRBYCYnFEZ80mm9DEoyxfGwXqB9Fl3ARNK8xKZigfEeRfgTxllLxsE199Wa3orhTSy
	 CmZHNQFTZkmtpVqEG9o09Ec9KbNJtl3bVLxZvxDeh9DZ0WLGQoenhf1oa2TTtyFMjtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167152;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Wl+1Y8SscpZu5c/+A8SGiP7r5RTTmIzRVOYemhTE16s=;
	b=Pb1Fs9PWkURtJrb3mz8u6qm3ClNZTVh1cOIQ76KS4xhXyxH/MQhWUv9LQc69BuAzn4sg
	 wPl8wXx7/eY4vC72zr1qXTVssMzMmVlMAvx4/XPql/InBhaITboO6yND7I575uhRWopjN
	 kH9NJxvuVwwmc/ZUNcvPNfUXNB49QuFNPvn+qxsbXGbSBvVxJZ7KsKhdnuWR1DmtOV8AR
	 wckF4GvLNPq/GeLOr25xKGz6DdvuM24nbt8KCVTC1LshaTTjIDH3MttUid4G/VYGhe+Ud
	 lKoJsHh0+hMFUtMh62zkNUBVYylqRx4geNjoKShfjgra8W7lH1zrWbBBtf5Nf0/AUEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kPZ0LKFM;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD90606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD90606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=kPZ0LKFM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wl+1
	Y8SscpZu5c/+A8SGiP7r5RTTmIzRVOYemhTE16s=; b=kPZ0LKFMaWfHPifU/dVu
	TJNP7mHIWypkmCCedPnNOz/ifdUipTy/3tXcXyLNlNmgqUBIpk2CGdos2ejOlBOM
	f6GNsB9tggi6IfuaMWWrTuQpakEuiZxTK+3wnAss35LtptnBPq9+k6IUmYnRSkTG
	grnoZZle0gvFHBIs/szATkBReI+ypE+6F5NB8ktO4V13txFmkrQ0SwOdtTuOx8Jh
	CPKnAc51CMRLpwQHa2eAvOD9k3/5AfFixDpAQCnF89I60vL84/ouxK95+iZBDpBS
	diUZScPReLqoC3+aknLHMej6XZWnWKz8jTDavjV+xUxOoxZiFrRo5yC9cdL62FIp
	+g==
Received: (qmail 1417033 invoked from network); 20 Nov 2026 10:32:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 10:32:27 +0100
X-UD-Smtp-Session: l3s3148p1@YeMm7LFgsrcujnuU
Date: Fri, 20 Nov 2026 10:32:25 +0100
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
Subject: Re: [PATCH 3/6] ARM: dts: renesas: r9a06g032: Add #reset-cells to
 system controller node
Message-ID: <awATqUeXeKfiTEr7@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-3-feee2bb28bb4@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="tO7PsHmg5vUk1tXy"
Content-Disposition: inline
In-Reply-To: <20261119-rzn1-miic-resets-v1-3-feee2bb28bb4@reliablecontrols.com>

--tO7PsHmg5vUk1tXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 09:57:45AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> Update the rzn1 system controller node with cells for the reset controller
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

I'll leave the final decision for Geert, but I think this can be merged
with patch 6. But in general:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--tO7PsHmg5vUk1tXy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsAE6kACgkQFA3kzBSg
KbYHmQ//Y9yJPTxYFP3eZThxeShEaRY1gN9JF9+fsHlS4f68NrnD+ZoqB+MSggDt
WmHizS0YVZ6+5OcWSPmVWn4aNnXbrXFeCDSNQgIFmjQBwcvA+1uaI8rc7Ul4kAhH
VS2Z0tdur0JMIGv5C5r20jw/4AwfDLMOrui++tjwvf9yXH7kwIRlFKzQuEz+bM8D
b4yuwxMNe4gClr/ava4ydeaunSjwP16Y6BAQUVv9sUuwp6jto+6NOKCe+a40n5Mq
XoaCKUcHmwkic9+GeX69q3Hn/eBR0+Pe3ESiLvnm+pElticVOd4oUVJbNMthWeqa
fIdIpUDZN5V0AoJ6Sr0HTGoKzAPRtFo0QuWrarhUJ7HZIqx4eqEnmkUAFiwx6wjj
GIO89J+jfg5CghQ1vfIbvODH2+XwoPbHKbgCX21tf0xTVp+GA7Zf6DdOHlhz3oPR
VMcpZi+y7mkxNv104VmDyVmqunHr7ZU+UgIBsfvakdjsFRdqoK69se9o88wRHQH3
DNNmqKjydp/Rru6DsoXZ9kWlpYyl5lKPvn8qBGuyQ84PSKmEeNDGflfqv3mGKW34
PryStiAR9UV8IO+MJXH+U0qWQVYKyXGFXFWI7qcx3YhaG9gyiTLig3/fzFKmyNFY
j7PF+L1bbq7gHKaN5CG0N6zk3uAFgzKBzfHNhydRzY+0r+Vj5dA=
=nOOC
-----END PGP SIGNATURE-----

--tO7PsHmg5vUk1tXy--
