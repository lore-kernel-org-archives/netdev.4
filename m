Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436946;
	b=QlnB2PSBgq7hXnGV39xWB/VRVGvgSydY6lymukL93Go98ZMX2wp+SFWsSVYDUE5zg4Fm
	 LKxvq2tvC/jjPL6yXOKV6T3BsbGW/bo4H+1fsq6XOGd17Tp4MWBGWRJ6WAC1o3yni31ce
	 ViPLdzod8YxX9PZyc3AbI6fnrj3CX1FK2BSjcS1xrzo7y/XUvVS7urLYptdmSlgC/OBA1
	 tmTjLTqC7eKEuu3XfWd4oTItXrELkfYmmjkl+rFAy4tshVEdjaqGOeOTtaXf3klnwF9DT
	 xKBALxriUOEry2dz/NKLkLqOO4pl0SEZsa6+9lwBtB45CnIG1JBIhIZ7n4NmfvXEnMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
	b=m0hPchVknXedBX29r4UL7VfXISi76S9UNCBQODbeiCXme98N2LC3b7EwSR99eyUc/miD
	 ZZNaVpgcTDHd2plY7TcJIAyF5CJgeSyO2rOcVNgUk4QD0gJSHunUyptr7yFKt1eR4IrUh
	 PRZWHbNltos8GVFqR6iHLWUGNx40YqbmVwRjQgotHW0wrZ73IPNBVmtRmimPr2zo0GZRR
	 3NSCkF92Ve9n0CGH+TFaHusyMaGYYmULoCmjDF0dnE6/R2x1SmmQ1YLsO9QERBQN9bpu9
	 EQsuT2lpqo7Cl3b/iS23gtXSzw14u4ZclNvXrUf9U1Db132HvmaTiacFDqZYitH0UUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="exdAKoY/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C2606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exdAKoY/
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1766749f8f.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:29:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436945; cv=none;
        d=google.com; s=arc-20260327;
        b=TDjT8fONihwPjhUwrreVMeS/jDDbGwZpax+qq7ppI7VJHleSzvsoPPWDnhpVTi/URP
         GuTUMI1VYeCMp1Wt20At8wvJdfB2p7Ps66ua6kX9OVyGOPIJy2IOt58XwLRNumAnanXC
         KyGqQDkTCSXJV0iHAh7h3S49/0DO50IMHMq9qjHDeWKus6aq57W+iVsR2NXEmgC8XQXR
         FnXC87t/UeUaOUwg1XICz3ucbETO7S6no0C6BPc61SMnJnCtTjXMOHXW7hU/uPeulY/l
         qkiyOYXaTh3i3Jjl0t6TaFWWv9gkVpAPqItV/PgJMlhk6U7NDcBaxRuisFegNYlXv62t
         O51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        fh=Ep41dYfW2IAfJ0w4IslPcRyICC0kTFKXGBWy8oIAoKM=;
        b=WDKQMpNOt/D0OFM1tIuRP/LCIGWlCniKmbauMa/lkZ45omyO6TEY6Re342NYQq8l5i
         Z+2coIY0s/7GGPkflIZMKBE4rm+e/WVoTC7QeAZhiOOqAmEgAOdVHuebXlnMD5vop7Hm
         h33lLLjbOIMJxrjow1CEN9aQyM5x4grXI49VZWGVE+rTS7x7NjKhi9qpQ1RLC/2HaR6f
         Y/NJRceZU3lRsYFXVSa4DIQdNOZ3J3ddQu60e03eeoMBEEP3jTW0F9UxanpvJeqwXK/m
         o8wwZOwoNwJQ0lXDCj7McVI7E1+NvFnZeOuUzGLc6amQEAOz1u0cDqchcjpJg/j6zmcs
         F3OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436945; x=1796041745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        b=exdAKoY/Sj/1MXfEqx6dzg3yHAtBCcka/a3q+wOk9rh8sSSJckb+zIRZkfr40oLKVH
         wfDW18ceNJCsog9LvJkKKnghF7uN1XMi7rRx/tO5FjZoD5OrqUrAehqlQ0o+5/u1ZdCb
         GjRUDPBlgZ21WMLM6Qxns5OK/KkgTPAcivTBlc1CcXwqPlJqxNik/s1J7qwpFImIZej2
         640uIY7tOPlp+LT4oahfc1rtLth1nAfWuweJxebo0Bt75ROek64MzxDq+chxxDV2I5JG
         9xX70cNeoctg55raFUoP/6PYAvapBr3jiT2FrzhU8eCeQ+J/6BN/7aeCO6ctwfkxnxAC
         VOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436945; x=1796041745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrBlPM8eFe+UqrAcD/gV4kBOAQwCPiHjxrajE3hn/Mc=;
        b=WAKN7NxBz9Lg4N3tc1QExFhJFiIJG+bEsx0Tbn9Iy5e6tDp0Hc+lBUaDHpOt627JY8
         nJu4IjYxeNwptUAjYbob0KnvQKjiDKRNLnF/AjsdAMgjX0FnoIEl/Nef9+60jgwYe722
         lNP65jS8REXellVOvqTSvjR4WzMc68KJAaJAynwaaDIQvOfTEgzHefXV5QQOfBu/rh82
         r6B50NA6YKvzTYRma5HBEv4BPJaQ61+pPIUCC6JoL4VIDpzmBfDhaAqNvzu9jGz5X1lz
         4Xj+G1No7lrZaMSJnzW1gtsvoUxs5GP+/Ac5PPOBe7eQhNKpA0MTq34CPgDI7J9DaSTI
         ZwEQ==
X-Forwarded-Encrypted: i=1; AL+hErFIFGXgSLoOKHmA7DWfXT+M0f2x3Tfb1x0OAmbSDFwfglRz2O5ZnIj88PLgzHqFnqKp/dn3DtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mbhAhbYFwVxcHVPd5/wF0BN6QlIEClJgqNc1M4inJinbjLlFd
	gVwyvp/247cNMcvA03/jxPUyTSWk8RwD4NLhjAnYYJaH2fZ6FEt5p/2XcM2zY15m2tGH1sgJcyw
	LgqO7GSe+u3apHQaFeGNqKgXgcLzIOvw=
X-Gm-Gg: AZFdTZcBhBmiBd4V0D4e2RfkODbup5l/6WFdX1Yr+ufeLHrT9zfaWcl3G0Pjq/sgfBR
	6QBH5oWQwUG+FvQOnEyshGaZRWM2qnn5Ue1XVZUzgPr2oTBFQ9l7DZB/rIc5Z9fD0fKGnD0ipr8
	WcS90RMy37SZOahB9r/3Bvo9JG2i/iSR3l0bgndIWC26Ar1ahomcql0jnJTSuTVh9sxdsq4JpUW
	GW17dLZ+uL4IXPOxGWbu7x2nWp8V+rzL6WYhfR3/gHKITZMUBrG+IxyK6yLyeWvWt5rLq1dCjnK
	gKrE1RlNK8eInxxmCGJ+aydnGQi0uF3zRvubJu8JVU7OFmJ9TPstAUx/wJHoIyUyjyjXCSmqpLl
	s0KzDXH3bLZjUiQLqi0H1PkSUR/Ttu/C8unsmBj0ofWZ17XSKHqo29YnXmMiRanwZpSvQ+/GQhr
	m5BAqI6ouSNH9BEKbBLPXK6c7gNSpNrvrE4GIex+BYiVbjrvk/qIPcxCYtyg==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id
 ffacd0b85a97d-4b4510c5231mr3941260f8f.27.1795436944634; Mon, 23 Nov 2026
 04:29:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
In-Reply-To: <457ae5cb-fea3-4366-802f-f81447cca3cf@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 23 Nov 2026 12:28:38 +0000
X-Gm-Features: Aa3M54pwpdIWaGuuMBrn27ZxcRZ-1H1x8XFbCBtqvnWS6semHXinABmTSf51p7Q
Message-ID: <CA+V-a8vGO+pf-2fSZ3BEfNepz7wpPmqiRB00MUMWrW87mN13JQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 12/24] net: dsa: rzn1-a5psw: Add support for
 optional reset control
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.

On Fri, Nov 20, 2026 at 3:32=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
> > SoCs, where the ETHSW IP block is connected to a dedicated reset line
> > that must be controlled by software.
>
> So it is not optional for those? At least the DT binding should mark
> it as required for these compatibles.
>
Yes the resets are not present on RZ/N1 hence I made it optional. For
the RZ/T2H SoC where the reset is present the DT binding marks resets
as a required property.

Cheers,
Prabhakar
