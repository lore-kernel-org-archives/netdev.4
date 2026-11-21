Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.186.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225626;
	b=klCA/X5HPWYCwbeZxgbV6VHJO/9w7EUNBk+iKDYX3dqO4Vl/0I/5sxSwtSNqIWdFC2uc
	 LmCtvicEFpikDWJuNvXk4EPqyuMpchPhX7CzymzUZTzSXmU0b76Qhi3fOJkv2EqGqAYCW
	 gjWI1ZjKIk+a/99cQNhxsX7/niYgYFPNZJqjlrbDCuxAUGFCvjR2oQO1wCl3kFG37+EPa
	 afLaOfjMuhBwNPIw9WjJtDjj3l8578VRGsl2HtvPjFEtKHiBWBPuijw+eLAkBhtJvL2JF
	 RMp96W45ShjYnBD4hl2BE1faPyry+EGgisvDcYrQQjW3aHlQLCQjqrYTVQXc9M5Tehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225626;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=sQCWdn6vdZ8GKZcGkoRUgfNyKUFpc9JBgviscbT0e3Y=;
	b=0Kxpiia6xK55wK/E+0tV5mC8wQ8ZS4DGpeSm671dmBirDqNAIQ684xWtDAbQb+k40y0z
	 g6hNSh9UQT9pY3D4dN6J+o2jZKFS6/tzMwYibSthg3rYi/9T81BkNW0ATVH7VbOrXznYp
	 CB/3pSKaRaIUISXG6fasO61KVng/e6+LJw/9GNkA6EFTAjuSaXtehkPNIpQp1D55XMVtO
	 CQ1FkaMmN6fdgJQ0ZrvPbgeiCVxUbPykFNsyHT8dvv63nXIr1IhnRuW6YOgUXWiC4Z6Gs
	 TLVbwXynU6YdxgbVbaZG9tHnq+BxPqFz4+Kez1HyujRj9mJIy6lP2BNhCzFnssqwGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rPu5MFmG;
	arc=none smtp.remote-ip=66.163.186.206
Received: from sonic310-25.consmr.mail.ne1.yahoo.com (sonic310-25.consmr.mail.ne1.yahoo.com [66.163.186.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE76606A6B2
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE76606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=rPu5MFmG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795225624; bh=sQCWdn6vdZ8GKZcGkoRUgfNyKUFpc9JBgviscbT0e3Y=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=rPu5MFmGiHhUwba9U9uPfWQj229TPDyebyhbMVQEb/GKOw0WD7CCNFzzGzEmpQ+4AwHcW0wT1e2ORLN7vI5QIAHPsQ2v2xV4sAdDFKf5iYrh9wZkiAG+5/gjEVUWWingeCc+m0wHnNxgsgghYIWy/Jy1q0EEmk6IRYbxruC33J0iPD23sd9T218ILJAjoujOS+nIPNGEKshBs7NPnKleBxZrhgRTivnL96Mlj/NJkIggEg9wHA0Uzx6rdnt+RqQYKqP9lXvwleZmGLilyr0MJiwiGr8cu8abzJIrmYqQZPt6ZTxa5RzTwJYzBcyI48gKXy0tPkx5cuX/kErcjKqr6Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795225624; bh=OSAzFE7qKfQiUoSM5t6MQPPJ4/j48GCN8VJRp1+58oQ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=oDkssX+heLVehIu3x1Dje8UsxS99BxuW+TPx7wySCSjF1DMQCVyELjeOCtwhTnIDV2P9xGXO+OK/XXT3Xhwr7RrnozRAgrmKaJRIJw9oQxU/X0EEtn18HffnXH7tZZTljPBSxscbs0dSRHiQCZCso92OX+BTsGYIplRKEpGArpzdRvz9nwqbJDMA+donC0ewifWs4w70CEJFhFOehRKzleZYl54ozTnQ+UEvVC3ze9GLHt1NWRqZotuzrm0RQRej1NFV8g0fAHRsm3rCna/88sx6ew4WGjViVEdm67XlqTL13zXCOGChRWQN4hoReFj471E9UfJJd6whnFMg0TA6cA==
X-YMail-OSG: _WYxLqgVM1kp0ljvwPDzLvAqLT7IonLANzCcfG0z1HBVGQJJBaTfD3JsPP69yW7
 MA9JHaIpjhtbX.igp12.XxiQLXrUqc9thJmbDZ4C5L8GU1duO_OV5jDKi2QgXKSHQWHEe1GGWwst
 sQaxswLpeNJ7AjIcfRdJm7N86BgKr1Q3zoAJ85E7ttEBPQprb10GjBVSc1gSQpUqyoTZjWVQlyq4
 dLnG.CumiA59JhhAbLzETG7DkWaL_P9PIUiuMDdqiLD6BPluEu24qZ6Al0DNgboZVuSTLWfSxOIv
 7iey1loISNzZP9NIeqVB06XnfneF3U2fjrjK42VADIv07kfYqZV9OzjOzyv6e.0x_TwQTl3PsnnK
 ZluWJc8pNzlnusRvkZQeYwGMuad.L9eQCsYQMua5aTV1DXmwm8gwObUWIRkp4Z2AybXMpNZ9qDPD
 AiyPhXKgUwggjpQKxcfoEj4J9YgNkJshN8zhECY82Dp.pjOUcv.zV717rSWb6UbSRQx794b1D5W1
 2z4NrkSxaRfr2NbIjcNki5fpwNcOVZUzLZKmQwy27cc11.Ou2O1ZQqrOReJC1qGPzl.ZasddF4Ey
 tVt3D73xUvYJgIRcsWSVI8a1X_aH1Lg.l6y73grMNPD_5uIVRjbiztGeGYLaGWWBzAb7W8Qtze5.
 pfDfrk7FdZtIhOkEtuY1FrPf65QV7JWZJn8o69iQAA9xYrh6CjyLJhqXCHbaHOVJC1KgbXojbNXt
 ZeocH.crogSmUU5hvhFSyH0uupTiNOBa.7GmjL.OpcCNyvZRgSHntWSyy4RnbiIx5PUvAIxNWzsY
 vHBN_hvJDpUJNtyOZBKVuCRectAHJe6ZSfeEHR_KmDWRHl2Fqc.M5G8k6IA1M8VyO4ADM5lz4DKs
 V_kkJkWBRi1Q2E50ByKPnUcx9MzOI8Dc4JoFL6SU9fns9C1ayKOFJNBj4ahZdVt4b9SsHZLKbKmL
 XvfHDmlLAtanKWtMZBLaZsHFwhYM.BmpGQ5VUPbzRfv9j_rD1j7Rmd_qFE3ez4uTnw8tyykcKIyP
 WvmTal0DdR2JheI8u5ErNGjcOXcf.EDqL3DuPeT7ShFArZgTtMzkfUEsE1btznlMfew6aNcVcCNi
 QrjaswnIcOpH6S2LpYHbBWe_jLu71OOiyFNYuGyXeUVUbse_hNb7dxTlWLc21U9gUUw5m0bqkTvI
 n1NmmseO0kGNiZvAQdKrG1YA.svb1HmRLdGCFKnayHJiCcE3wZFVxYUnfJe_r.BZArYU_oKCl4k8
 p9uEVLlJiwo2oZapER_58N3PkECUPfn1LzUd5KnU1bi8TT23Oi3aGfZJ3z_HEKWFz9aiDWfqgOJy
 dzy94kXQVQ8GLqIBQ5MB_AfcrnkLcrpVYg0920j.0CYDLEQIQp2zL0qH65Pl2ekhp7LrjFlpHry5
 B.dMfBHBvxcN4OtvP6d7pLtaeZJ8OHq_oRZTBLQpKHVZiYqnDdUB6ju8t1bQf19l65TNE.gOFBv1
 C6UbquXpDJXUwv29uNTs1h5z38efuCxhfCWw5pDD_oRViHte2.THF0UC8ormNZErUw0SCtnZOZiI
 NoQIaEeoFYYiJt9tkbKXeq4_oYxiTLdh5AC02Snql08BIFi0jbyvOo4Zvj8Om0Zk.xYJQmcCNTc7
 ALx9rW5ZlVHOgLgYxURK9PCcAfbRITWfKVauXy4c_.nYpTiswR0yIBeoyy7QesL9maAZ_TytppBh
 smV0W6pewETPdO87JZv4voJqAtVwPXgTJPIC0AtJoT7WWIBF7aC2Ixs1UAKSp6EsTlNWpWYCIjAe
 2R1JTPktbcdEGEMv1nM7lyIgVmIE.b6FHt1saCrjSPy.55GK5FlZG3aOlkGlcsFv7RBVblrIVbvG
 FgRrEjyJSUXKsV.Z28cIgdPjbbc0bWyvZAmqkr5U9nb93YujjTu4YDTwJR2i80KOqRg8nCkuXbNe
 c1.aWQl2jCEKfFrHQaX7GlOYBZ05heED15u8jW6PR9cWS5guYUqb1iHRCy.MGfwZfKpcuQtEzmzr
 pDyoypD1QJU5pha9ozbgv7GkGagsOJbB0paVNwV5CEo8CQfa7oSmTmJ6bU59Eik06eiTDpZQro0a
 hBV3Cz6B7y_G933Q0r6fPRSfEMRf3IGpnbNpItudK86NH0OJYXGmb7uoCcqjjZmvKXVoPUaJ00R3
 FL2I5lQaJ.Cy.NGGcrCI78Z8S7G76k0V4O9K2BFI_cCbEWk3xbXupV4leSrh80QfR34XG7VoNXty
 uzdUs.vNup8MYt4J_rrH4eK_KePVdUzyYQfbszWaIhee9X.arNUwu_XILgTVYdzi4TVrstGUIsit
 pWvZtC5jsK1W5Fzo2wNjfKeJAFotdeisZTeKVQA--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: d804cb78-eb88-4602-9327-56b39baf45d2
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Sat, 21 Nov 2026 01:47:04 +0000
Received: by hermes--production-ir2-7c4859dc89-4wlgf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ebbb51c27332e0c13b5f5a1af19bea99;
          Sat, 21 Nov 2026 01:47:01 +0000 (UTC)
Message-ID: <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
Date: Sat, 21 Nov 2026 02:46:58 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
To: Gustavo Foletto Mora <gusfmora@gmail.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com,
 gabonpivovich@gmail.com, contact@c127.dev, o.rempel@pengutronix.de
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
 <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 21/11/2026 Gustavo Foletto Mora wrote:
> an untagged frame that the switch forwards to a port where its VLAN
> is egress-tagged leaves with PCP 1. [...] without the DCB series, it
> leaves with PCP 0.
> [...]
> So on this chip the PCP added to an untagged frame seems to follow the
> frame's internal priority (here the port priority), not 0x0851 [...]

Hi Gustavo,

Thank you for the detailed test and for narrowing it down to the
register values.

This series does not touch QoS, so I think the difference comes from
the DCB series. Reading rtl8365mb_qos_set_port_prio(), it does this on
every port, with no family check:

  - writes iprio (IEEE8021Q_TT_BE, which is 1; Background is 0) to the
    port priority register (0x0877..0x0878),
  - writes untag_pcp (0 for Best Effort) to 0x0851..0x0852.

On family C both registers work, so an untagged frame gets PCP 0 and
internal priority 1. On family D, as you measured, 0x0851 has no
visible effect, and nothing in the backend programs an internal
priority -> PCP mapping. So the frame leaves with the PCP that matches
its internal priority, i.e. 1. That is what I expect from your data,
but I have not confirmed it on hardware.

Note that setting the port priority to 0 on family D would not be a fix:
that is Background internally, below what ingress PCP 0 gets, so
untagged traffic would be treated worse than tagged Best Effort.

Two questions, if you have time:

  1. Does a non-zero value written to 0x0851 on your board change
     anything (PCP of untagged frames, or the register reading back)?
     The backend writes it unconditionally today.
  2. Does the Realtek API in your stock firmware have an 802.1p
     remarking table (internal priority -> PCP, with a per-port
     enable) for this chip, and at which registers? If so, the family
     D fix would be to program the inverse of the ingress mapping, so
     that internal priority 1 leaves as PCP 0.

I do not plan to change anything in this series for this. I think it
should be raised against the DCB series (Oleksij Cc'd), unless you
see something in v13 that I missed.

Best regards,
Mieczyslaw
