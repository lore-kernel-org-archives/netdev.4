Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902013;
	b=NuXphFkzLoO4OMSQv2qaM2N6uAzAhYqEqn7flqo2HFi5rt2kjd/BzsjaS+gBiA92NQvY
	 Y24zzOTi+C8da1MXdPMIav5IF0QEz3iyt8ZRYO3syihMspRRucsnNJZuR9K4+LhT53QBn
	 jhj1BG7pTWlo4LEwX3fj+kSBWuFzInyvqkbyomGMGRIwJ5aBRZ31LxZwKxens6GBCo81/
	 QVTTKKPLSxaFGdZTYhzrQEH1xWs79YGhumNpoen5nZfspM4emkwrJS3G4thAP7b8a2KLT
	 QZ1EcI4GBwJEwjh2v0gmuT7G0DqZlRAR5S8S7VxSM5eIsMuIsuglyIzjiYL8pSfndOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902013;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0PwMgoLCuoMJhIuYDvRS//1Y44f0sWEWfJY3HpnQIQ0=;
	b=1nJEIyMe/4JFjdN8Xb+SesPASo4gsQVLxlsh9lx0lHBA/7COfLuGqe3tfH7s+SF4XFCm
	 Rw/pxBk5uNteK0WFoEQpghbJfOOvhnvwe0tWdg5XMwriiwlKM3xuNG1PUHsKAq1RlG4MD
	 TMc5jOGPzrUuUgotO3vSct8hgn0HtX8Jrirg0SWdG20vQwKQEsNjz0i42kgmObZxZVqdP
	 BN0ibf5RtoNTBujBKr74HYmSlqGRruP6lHNDI8+1Wm3A+ba6Cnij62hCWbRVhxBX4UhMs
	 xc3IFfJKPeFlsAQTzB7JS6wkzsOq7wcf/PoD9MuDsJ88Gyhwx6JUW7mhml3e8ITFFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOQOFO9X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC4606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOQOFO9X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DD01F000D1
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902012;
	bh=0PwMgoLCuoMJhIuYDvRS//1Y44f0sWEWfJY3HpnQIQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SOQOFO9XKC7vJlpo+qHy6vxvLxuGMzDKXWQ41JWeHMAiwFkZqbf5pVpb3U5yTVUxg
	 LzIthaE2B3nnFbhPba4GuX/MMQ+FCGppFi7aCS+3QAt8RBuFb1A1ebDE8J3FB7aSK8
	 uRnM22Heg4amuy0GuJJpR+1KAeapZRRUoAwjLpMv4WpUgHVaJxW8kR5kYtv7u7RonG
	 L+CfYACb0DggiY2Cpx0Ezf/wbaY+5Do7Xnh7aOh3qr0QUpOXsFAAX0M05z3kSxeHLT
	 VcYBneR5pVwWQDL/KVwNrVaWp+fPFXWtjCqWuxsJuLijYOzPHLr5CnEyMhGSXKA3dF
	 iYqcisk5dOS7A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso3394632e87.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:53:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuSEiIdOPmx1pert+QafyI8qOBzgr1DQXVcK8EGjDU1hmZnKtZ8gn56rGxC2yzrg8lOZOL/Ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8usqF/VvAYidziJX8eKvMTcIzI1647rYtF7Kgd8HLWh1IBX2lN
	+3auCvdCNDN5imyFxyRvdqOsndZBGCCY2dHuUE7NOPMy21ZHOUyypnqcqVuwwo0ngcV0agtANjU
	/qhT3QoxLdmmCLmMeZRQpLmLlLlB/nDM=
X-Received: by 2002:a05:6512:1304:b0:5c1:5974:8a54 with SMTP id
 2adb3069b0e04-5c1705faa6emr5336793e87.5.1794902011428; Mon, 16 Nov 2026
 23:53:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-2-f55bd43e02d3@kernel.org> <179484034429.3136.3425183655553071974@kernel.org>
In-Reply-To: <179484034429.3136.3425183655553071974@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 08:53:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLmKyr8DsVDAZxTvO9KuUhjq3JZDLyQ=ZKbYWvE_his_WA@mail.gmail.com>
X-Gm-Features: Aa3M54rCVPjORVrSDgqIOUZ3DiC07EGVI44GyNXyHqpgZGlMKn_Z3BWKS-qQinI
Message-ID: <CAD++jLmKyr8DsVDAZxTvO9KuUhjq3JZDLyQ=ZKbYWvE_his_WA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 02/19] net: ethernet: cortina: Keep ports
 bound for shared IRQ
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> > +     } else {
> > +             phy_np =3D of_parse_phandle(dev->of_node, "phy-handle", 0=
);
> > +             if (!phy_np)
> > +                     return -ENODEV;
> > +     }
> > +
> > +     phy =3D of_phy_find_device(phy_np);
> > +     of_node_put(phy_np);
> >       if (!phy)
> > -             return -ENODEV;
> > +             return -EPROBE_DEFER;
>
> [Severity: High]
> Can a NULL return from of_phy_find_device() here be permanent instead
> of transient?

I guess yes? Then things never probe, such things happen.

> Doesn't this mean a PHY that is described but absent on one port still
> disables the working sibling? The commit message says this should no
> longer happen ("so an unusable interface does not disable its
> sibling").
>
> gemini-ssi1328.dts and gemini-wbd222.dts both use phy-handle on
> ethernet-port@1. On those boards, an unpopulated or unresponsive PHY1
> would leave no working Ethernet, and the port would stay on the deferred
> probe list for good. fw_devlink does not parse phy-handle, so nothing
> puts a limit on the deferral.
>
> Could the code tell a not-yet-probed MDIO bus apart from a missing PHY,
> for example by checking whether the PHY node's parent bus has
> registered?

So this is essentially trying to safeguard from hw failure which
is overzealous. If the PHY does the driver doesn't probe eventually
deferred probe gives up, thats OK.

Yours,
Linus Walleij
