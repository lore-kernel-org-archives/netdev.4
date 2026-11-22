Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377962;
	b=HU4+sCY4B3sOHqPlWuZSvFObyu9Q62smYDzhE4z7D8x7YWTaYpdgAsxhv64j5W09eyLy
	 5zFTJ9yC3u1pe3ZubmL/5tL85azBXD+PV41euZNgO6R1KYYiMSH+uS1qvLZ2OC5Cmxr3d
	 s5p89sI23KzWDgrUKEVFWUVMLYSC/Hrp3ReGebuj+vIZ8lFubFcAhn78B83IZIl9zQovB
	 34p3LfCuhLNwaqRBW5wAIkO9FnlEJ1PdtPY15GjgnJUmjxepPVPbj1y1RVniuVUlF/iJU
	 ONgTyWTu13Fw/t25xmPK/Apo+NVvzC4NlJvgzCWx6l+Dlc+fU1MdcSr7dszvpQRPILA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
	b=rilW/IGzMJgXlQomsiZWu8prvW4oM4h1Vv/QenqTHlXfSaVBcoiO/VmDlwPq8A5qTwbc
	 1phs6ay0igPTcLwDracnO2DM5g35XCcgnshQ+Urca7vMI9mMXHW347C/jboxlxLoX59xV
	 WtBS3cZKQl37Am//sSmy8Ujw32hV3weIC+6xrYrs6fF1V5fzcYR+34po+fKD1I4HeYKCz
	 7E7wASQM2qT8F7hl0dPLVPDFwUw68UuuY5EgSuctosGAXMITwb4XVgYq4YoaEaG7vCk4W
	 QNXvpJvtr+xo8iOmVKG//Pccv5cIKIVHkddJvl1u6l+P26KSj8qDP0X1hncl1XoS4mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cy3a/LWk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06C9606A31E
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B06C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cy3a/LWk
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso871463137.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 12:06:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377960; cv=none;
        d=google.com; s=arc-20260327;
        b=KsJII95jTvbPCNmy6n0Vk3QLdYbVsBis6TS844b+E3WNSCWyzXDV7IiKpXXossokf3
         YXZQeMIsdruKVLCFZ1ucrVU4hvfr4rn3PKHL9C21iiaEGnDW3pBXZnVB/H4iINVw/9fe
         DCGH2C4tLSZWznIKDCLzRB0E97QGvpsn08rlB7Dl8U9Mj2/JEffmoJ3rSbV0J0t8I+SY
         iGiCGDs8V1HB0xB2MXj5EC7yBWABRyIjN9smXrmsaYImKQ92fDaUWzqk2cOY6/VQ4J5r
         Up9gRjyTE7uuyZXIz6zd5vl3/qICudnm7VBEZ5mGSiwjdNKtIg78tsxfaANOESDU+h9O
         yPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        fh=pPnku7Z+aNsNSKOubZHXuqFt26qDFSO5bouYFXpxZvU=;
        b=r/kjtXRBjo+nYMJi5S0MDxc7DFhtk/uyzPiR0In2kjvRvfrmkKfuBfY37mJmPOb3KG
         AOGlcQyW+XQHb0iodD9U8fOKmb9UhC2ggeEvYawKO4Ud1dztqsT7pPX+4epyLGJ2e0qO
         Lfa6tIh52RDDMq3x+G+B1HwMuKfYm8Y9r68EpMZRS6dfKBv7SEIg23F6Wu11AotTCAdk
         Mqiu2cqZa1CDjbW+4Frx0OuH0HoAV+BnaxGD4ax/T26EpC8GqfQDEomrTnrT+nRUnXzn
         0z3gdlXb8raYpB8jfrOAYhGDSlQKh6g4PpjiWrWDgXK/AO4fSOkVT99UE9sxUu0WMJao
         BqTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795377960; x=1795982760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        b=cy3a/LWkfynbJqHp3M5c5SBxDzImhrahUcNPjL/ABV1eBCb7+vchP9df3wNjokLHWu
         ONHAv7zDqbwHsTN1JbNrNvOKqxXP+JpOYKJmDHNUG0tASQN6BliVzZ48jsNoYZFCGzYL
         H1+yWIxVnvhUouwPTQbW1gsK+lix9v1PNHv5rj4IdUbbHxDVyxJAOa9+JemxD8U5P1C/
         2dqPfqbe2Qr9dZHpbTZhMYNv4VnEPySuM6h6lX6Vr+k+clJHoBGUa+EpRO4jkF9+aUHd
         jpG4rXglP7F0JnMhjUacVy73redlnxIAcy8tYF13u2WWlLCULuYdGrgcBUEtkbKOU2pz
         OayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377960; x=1795982760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltJjjHY7wQ9E8rybzcEZKs7FUdTfp7SjBbsj6Z63JWs=;
        b=V3gP2asZA0GVKz5LlBX6KuTpwLqEdx0dYZAUdps8md/rgf46pIi/0jrvlGujxjq7NO
         NnUVmK+UxgTW/QS8Odw0gMgQMR3oQ9Vhkc58OfzgwGJtdTuBAl68COKuwtXZAZGIEX7n
         ikL4e9y5t3GPpU7L745y24Ah6jsvAALrd+MI/B4f4o/9hqzBt0pDfQ5yHo5yxDrMeDXC
         6wrrlRsoZM/a59jfyygHMpfkrr95bBlk5PrIILOTGcndyw415RDjlKMvsNqB3B55gvwa
         Ic6yEfq/6OuOiZL/+S31e56Cc4/ZAwB7pHR7776XemWXeOp5scRWWPMBNNNINsFUpmLE
         8+yw==
X-Gm-Message-State: APuU4Z90CAd2CTBdKCH9aVSyQrtqBCG6uxCOQYceZWEa6IXhNu4M//JK
	CIzCLlxsnuJKs5EdJ9bbv6pW6pGxGcrr1/Ix+GevclIf0FLGIhymkYfvwp4a0Ag28qe7v0keYT4
	StafXlM8wFGfr7DnpUAGkomo/SJvGb+EeE++ynR4gXw==
X-Gm-Gg: AZFdTZdo6irp06NeofuG0sVTLPewvuYt5j2zDxdkBPFodecLNukYNgHfosu6zvx0pHd
	jE2Q0PxN5gHC4pJum7d3NSLGUxJ5ocG7KXtGDP3Yji3QLFW6GIlaq4UmxipkwCeJyb1cBiJJaVr
	LtB4SMJMrgppXmfYZHnXOXCcyFx+drAW7VQM3THv8jNbmz1jlZeB2Si5Nb9/EA0cMeaCo52Q8QA
	Q4DKpN8repusSQ44gKwZQif4YQmX3fZ/EwktqA7JzDyh+uUQbYDUeZOEBKbKwgV0yfsSoVEx2GZ
	ObMo2tqsP8nG3uaIuJnkeMm0565feJHV7naaT1A+nAnnddt3BZVetS/5ePGmTrKyEkv0GeA5aX8
	P8BNBYVdcnDhFGtEJEjydw9aO9y6/p1U2BZRnF2e/fH0uleigm7F4zKliocWtZ4TQtSFD78Ve3h
	hnliVpNp/jg2bu++k0COAxI8LR6ZJjSfaWfBUeSu3iFKYrG8Y2fwI85y5UIs0jmaF2TyaS9Phlg
	B/6MjltiE/eYpHSNcW84A/49hDNsg==
X-Received: by 2002:a05:6102:6e88:b0:7cc:2152:4f72 with SMTP id
 ada2fe7eead31-7d72b361a7fmr3205448137.1.1795377960563; Sun, 22 Nov 2026
 12:06:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
 <20261122-submit-sun8i-rxall-v1-v1-2-607789772c56@gmail.com> <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
In-Reply-To: <ba116748-1650-4816-97a6-69eeecd4b2cb@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 13:05:48 -0700
X-Gm-Features: Aa3M54pG1AzgHZF28ZU3Gb7U1D0EKDZkbO9-Ggw6woKfAmVhRg5yTB70PYbUkHk
Message-ID: <CADvTj4pDQhnABu0GnsXN-mNhvdiHkwrrk3yJs5gq9RaMPWZFSg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool rx-all
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jakub Kicinski <kuba@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:39=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +static void sun8i_dwmac_update_rx_ctl1(struct stmmac_priv *priv, u32 c=
lear, u32 set)
> >  {
> > +     struct sunxi_priv_data *gmac =3D priv->plat->bsp_priv;
> >       u32 v;
> >
> > -     v =3D readl(ioaddr + EMAC_RX_CTL1);
> > -     v |=3D EMAC_RX_DMA_START;
> > -     v |=3D EMAC_RX_DMA_EN;
> > -     writel(v, ioaddr + EMAC_RX_CTL1);
> > +     guard(spinlock_irqsave)(&gmac->rx_ctl1_lock);
> > +     v =3D readl(priv->ioaddr + EMAC_RX_CTL1);
> > +     writel((v & ~clear) | set, priv->ioaddr + EMAC_RX_CTL1);
>
> Netdev does not like these magical guard constructs. scoped_guard is
> acceptable, but good old fashioned lock/unlock is preferred.
>
> It is also unclear why this now needs locks, when before it did not.

I added the lock because changing rx-all adds a new writer to RX_CTL1
while the interface is up. The runt-forwarding bit shares that register
with the RX DMA enable bit. If ethtool read the register just before
another CPU stopped RX DMA, writing it back with runt forwarding
enabled could also turn DMA back on.

I went back through the callers to see whether that can actually
happen. RTNL serializes the ethtool change with opening and closing the
interface, resetting it, and reconfiguring RX queues. Neither the sun8i
IRQ handler nor its TX completion path requests a DMA threshold change.
System suspend does stop RX DMA outside RTNL, but userspace is frozen
before the driver reaches that point on the normal sun8i suspend path.

So although the register is shared, I couldn't find a path where the
new writer races an existing one. I think we can drop the lock and
leave the existing DMA callbacks alone.

> This patch is too big, does too many things. Please break it up into
> smaller changes, with good commit messages, which are obviously
> correct.
>
>         Andrew
>
