Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794802368;
	b=NepVqSN6Hmo15x94w2HrOLMWKTk9QWbDgsWf1+5yCfuu2N4hYzibKLb5z3N5fdw1Xnaw
	 k40fcZ/BUHGgrRNMcng8wAossoxy2GaXtC7AnqIDsfDTCCHK4XIhARiuL5iYsUnv9lD5p
	 AO2qrTdpVehV2Rdwd0gpRlA88vAZSIqpnpHzflWWxEe5nKSJbWGPsIep+xLaU1APl4Hx3
	 qWhcXedsVa+xiLonZU7f+rCNC2FLTXIXbRv/4LiKyG9ZgLmhz3ZSVJ04Lan6HLmroUlOk
	 MSguFUQGS2yTjsxEf+TEcZFOYOYYVy8/Tmt8KJzJfO3DyIMkKvrYYNOA3baEC7QxLtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
	b=VL59DIeOScYeNaOOLHcreH3T9EzZFMUEC0Im4iEsHesij1Gt1i8+qiKySKhjhypL0chB
	 C+M8+qFkwiG66or6+VkXK5EPKF4AiPkTdb0IYtfz+G6WknsJd8ensC46p4aOtxqKt1PM4
	 4O1MCLxbhVjPRSFItflWBewk/P2ftjo4SOtR7l7Um7dG7bWuHZE+0lQ0H/AbqpcDFOMQy
	 nQRtg0mP7WZSKYILZKTx5it5JvUd2XzPREsOKxdqTHCiH3aJ4BAaSs4s+K4trmMgmESBJ
	 DV2+H1UkxqkEZ71F1rVXGsT4CktWQZIqsfrN1oFrm5ypP3UgtusXDJB+ptpDFX7T3+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXuPr6SE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053F606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8053F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TXuPr6SE
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-99bf7b97f12so2771177241.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 20:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794802367; cv=none;
        d=google.com; s=arc-20260327;
        b=cj3XyLjnL5aJE0Fqxrky8/E3iKGyl5LGLl5iGlWh35LVd9f9FUEXzvVLGLSMFAEZvK
         E5loZhGEOaRsQXhRhj3WzJelvwi6YDH7Uf6vi2Pv2aTn1mu4iXiZyyWeDjUo9XsqogUU
         R9DM0PX7QYw5fwlpUW8uQoYDlHmMfiytxRsZhM0uKXKzPLb1iqesnso2Hna0BNlmNpbe
         yPPngmLTSFIi+Z9Fy7Ylp8gkTgmv9CrX/iJofsuSEvXp+T4ubNAzA3AwXZAIhhZrK13V
         lmWAjDtEQi1g7rFslegKJNaHPHvwCJEjMTtGNWjcsrsSnCnT3mGdHoXPG2QefOvc483d
         PNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        fh=J0GeS0+jCywP2SNOYpmzvFSzvUigKMN79gNIHpASZNk=;
        b=NRhpZ9s2C6Ycoh+3SXLRrp2IYmGmNUh395P5bSYjOj7eKxmNauBZJIIRQH8ncL4RkF
         orDwQSR173FMmbDhxcjQUeZMYfydVjaAmQtVRkcLLIe0SoxmwTQQnKxOXThkGiRSE7q0
         2PgDVaQf6HIXQHsqDDpD3fBPQpJgbE1nlktGarb7vBHmP6M3snRKvwKNmEW4oIWfEogD
         +P9v9/el3gWaa66/zU9eUjFBSjd1ny/szIDFC60QagBdHTe6/UG3pULWRLLVWZGFpHVc
         AToUHjMXjV1hfQp6rN3rPIt84jdV/rfGP/RKiDPDpgiuUIH2B0eVRNZj1lsc7Aj97MiE
         tHhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802367; x=1795407167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        b=TXuPr6SEkNx59MeEiBxkERt5f4mWr/KLQDwLa2jrvJYieaT+qwMYtqe9ZaojTHhZHG
         AJ7lHgR8xxpjk51JCJIadB37QGvLRiP0FBhk3yEvDf2lPtFkkJLF90wQu2Nb4O6kIf4n
         zZTlOkFImdMHRYpm3Uy2EfdKdMtJfA/3jteb9E4VGVwYJMWXf9j9hzcoPZu/AaDp2LFa
         0cDrWZEbL6WdhqLbjlTg/btbj0ILHRNIJZJYgX0J7h+us/HHw5W40QvqwH9YTLQRNAfF
         fTZ2SCX5ooqvF/KXBuYoINgxOHsrXPaKwcKZzhWOjTqLOZjq+6bIkxVBjdmcC8NhevmQ
         qkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802367; x=1795407167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02Znqn8yz/ktSadMwkToSavZ3zbFTsFGNf4SxxWIuWc=;
        b=FGscerDHAv+PJ9eboiRbdYhR/WoBqSUKQOXcz3m3iimAQHvd4j8ix7vD4k4DEeZqjd
         5S3glaGQJ8FMyvk5ASDm7VxBTh46K/Gn4R6Hay4az3zYl2o8b4Ke1FTId0+m8hCvoCM7
         oWFr/XI8VBZHaBCyW9ytJb2XrdOauAA9Mob2Jdw/BQVrjlSaYnYmzusLfUZU7V49s5zr
         k7sHLsk1cj4VONoBFwTtwMX4DzoQPcny7yKNs4woba9XVxQ9HLckE7WZUbJt1XfKkabn
         PAzSUbVx6B6OoMGN1+b6I4kDoaYGn0EReN2/QkQzh+z6DMmTuBlY+99isTgOS3lIJnKS
         0I5g==
X-Forwarded-Encrypted: i=1; AL+hErHsry3GFeBIAVkIY2WyJI8ppxWzKs5qGv4n5/ihtJpiutZe1ao7cLO60lIl/hNZxoJ7wfI4O3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2ITiz5zLHfWBV4ex6Cpd92JABrCNBuAK4vtvra8jut2eTV/dF
	7+aCTI60il9NFhhQy1IoJuUG7F/qWdzXgnKG8Y0Ta5AT90s/3t4LlCf2lZc52lYdBExYeIc7tGR
	NG4gZpJyX+Z4pHlHfUceoBDXbxtY+7ew=
X-Gm-Gg: AYBFou0EcDWyOdFqzFoFNnm7XEXjuIhzeZr2S7xEDHDnDFi8wGGUwIJk6dF5BH15Xy6
	QaiJPmPyCvC185UMG3XYrIguYOw00Obehyi8bjgPeRf+0HCyrpbp6ZG+wgqw4XGoBW2pRvha1O3
	l8TxGoAAXFeioUviRIKYHY3SUqbw9ReOSqdK9ZuQa87AYWENoxx07dCaFm2P6dDWcNQ9D/LL8hm
	yIV0U/KL8PQRgHg/AUqcDtePaE8ZbSM/AsZsEyjYIydvt4JyhEM108EhAJJZlQBjH8kLr4oC1P3
	B22SX4Ze1ACAaus+uUDoaGvXX3Ud5lGfifjWLgMzVcBjxugkHx7q46VfPqv1E/pBSX8Uwodx2WL
	rU1Oh9dSNwJCU4lVVpLq1qhCTsAJxXrDevJzevT5fHxiKEeywbcu09GK0CKvBc8FuuyE25G94mi
	lWhQ+iSz0WgYRegmf2YT6SzOaK9NFU6d45rVvtFdNvnMkwzKv7lN4V8/qo9CPwiA7R407/bNhyG
	DlVsHJlopg9d8VI3cV0MpNxa9BTxg==
X-Received: by 2002:a05:6102:6050:b0:7bb:64cc:1362 with SMTP id
 ada2fe7eead31-7d64d727889mr1664247137.6.1794802367378; Sun, 15 Nov 2026
 20:12:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com> <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
In-Reply-To: <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:12:35 -0700
X-Gm-Features: Aa3M54rSYwnxbv99PItlCP4qZptsSVG-Nk2eGb_2dwgIzFKw24XwIBCbb3Igc1g
Message-ID: <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 8:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
>
> > The generic PHY receive-byte counter describes successfully received
> > traffic. Some PHYs instead count bytes in all received frames,
> > including frames with errors.

That restriction comes from the current kernel-doc definition of
ethtool_phy_stats.rx_bytes: "Total successfully received bytes".
It was the reason for introducing a separate inclusive byte counter.

I checked the PHY statistics callbacks in net-next and couldn't find
any driver populating rx_bytes. The original series [0] introduced
the byte fields, but its initial drivers only populated packet and
error counters.

>
> In the general case, that is wrong. A PHY basically does digital to
> analogue conversion. It takes a stream of bit from the MAC and
> converts them to analogue signals on the media. In the opposite
> direction, it recovers the analogue signals, converts it to digital,
> and passes it to the MAC.
>
> Thinks about SGMII. When running to 10Mbps, the MAC has to duplicate
> the bits 100 times. At 100Mbps, it duplicates the bits 10 times. The
> PHY then puts the bits onto the wire, it has no need to understand the
> duplication, the boundary between the MAC level bits, it is just a
> dumb DAC/ADC.
>
> In order to see frames, not a stream of bits, you need a MAC.
>
> Now, some PHYs do in fact have MACs. Those that implement PTP for
> example need to reassemble the bit stream into frames. Anything which
> does MACSEC. Or rate adaptation.
>
> But in the general case, its just a stream of bits. And the byte
> counters should be for the general case. And for SGMII, the definition
> is a bit more fuzzy, does it include the repetition or not?

Should we instead clarify the existing rx_bytes definition to include
errored traffic and use it for ACx00, dropping rx_bytes_total? That
would leave the existing packet counters unchanged.

For ACx00, the byte counter includes FCS and bytes from CRC-bad
frames. We also tested at 10 and 100 Mb/s over RMII: the byte counts
showed no tenfold inflation at 10 Mb/s despite its repeated interface
cycles.

[0] https://lore.kernel.org/r/20250110060517.711683-1-o.rempel@pengutronix.=
de/

>
> If the PHY has a MAC, it can additionally fill in the frame counters.
>
>        Andrew
