Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199772;
	b=L3c9FGr598bypDSXqn1SEouD0a43Rp0ep93KNYuD/W9gTvpw4ZZIxAyblRHDNBom4wRl
	 SISD2WNSJQOp5oEho0VHvR/KwQYK0ls2SXmiJggGm/z841qr398M391d1l6BF40MzhnU0
	 PdjtM9Ffr7fL3TCfhA2RVwIftTYNWCrLKePnVRFY8PMnXspiSb7K3m3AXYH6HUu9hzxfR
	 AGAJOnC+aP8XfEBHAjdQEjK/Y5d+Vgvkt10zC7rPWQjtgW+RXDp4iDoGhOfJLXuyXDNyc
	 pkrH41ydbhUi/rFAGRwm01jNK+Bp7pXnPNTGXy3Q0EcQcQTJ7mLnL2wwxqtYbPrR41Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
	b=sYbjqF8uGFq2RcPhl+Eo/m5xCBfy72rGDYS8zGiL/CKVE9jyn1x5KZIgLix7nK/CUBDA
	 fcijz+u88Jd66gz3lEolrK9xN9fewqHVmLRboEPvAAEW0nxzboTkrOoA6Zvly85z3kz2O
	 jAIfLPzq+PQqgvwwlwSwezdsp42R+N6farR0HkgMAEjdv6noUcUE2eGzStigYI0yggpLZ
	 GJHh8nxy4CoZQmpB7c7udUFc1LIthQZwLONfKwyATrLZ+E7NTN/CLd4EmW8EQy1hKEz1C
	 K8/bvwAQBSFbK4U7spV1UevQFXcVSesdtSAuyVySv99CRF9RY+rY7mPwFaB7WGmL2nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhhzOot;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2F60A2611
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B2F60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhhhzOot
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1076639f8f.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199770; cv=none;
        d=google.com; s=arc-20260327;
        b=GuS64zR2MUN4bdqalvL8t9JHLAkF4sL9PqdZUDon3HcCJ6kSpm+KdpQpg5RCrRtZyr
         lOBkLNp+xlwj8gVw3dx/YbF8Cz6Hk0D4CI2Im8ViGWvSC7zrVhYL41QBaIDMpX1jUbNX
         MDA5MPbYLrhDZeb0Azu3C3hPh16JS+ybYNQmCQuyquH5jsMzWEpzXfP3Qozq1o0T3rK9
         rMXzf5DEf9JY5N1JBOvg7CLt99+zUIlK8J4gF6Ehx+IsCJCSf2w2KPJpC8LBDHEB9rRz
         +7wr17+53LGbKRi8B2eeOkNRwX/6tY8zAXBo3++nDszxwiZorUAf91CSKDJ53pGxzbRZ
         u42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        fh=aD5SVlrDi8bH623IGVktCO4iYRjJxubc+nIT4lm73vM=;
        b=MkzUQ3sNYmzU1asJTCeBzQsNezFBIRYmVv+Gr0PrDGRaDva0Cw1zs9cvcR5lIvJFCf
         JuQyYD1KFyiwfZhkNpGYmXTlp7dCRqqDUHBi9rR6zBwSxvvScOrf1+ecLprdpAfL3Hlh
         N609Ja0SJ/XNccy5shZqB2OBySRPH4bfrY2wcrG9LyOhFZ1cvjI1tA5k07EeG14HHhCv
         9EYRKmRsQDUsvmoKuZjoPklug4GOZMYrN3k61xAsYyhJXMTUBcQESmGXD0BTrVduvTte
         A599oAgXMqjeHJlMXfKvbAoDJ+nUC/sUI+PhIArY7s2Xowe1j6Q/2Ktycle8HffHoyon
         x/gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199770; x=1795804570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        b=MhhhzOoth3xNp4mBIoSCsfaBcfe+qgDacYLeCNiiaUZDcBhpuY9rHSYdJJvxx3Deye
         9BqY4Jg6+yYsHV6zDxnH+ZHlvLhA3gk2U08rTantGlRaFBmKkuT2rIIX+VNYElga38+l
         fXiQzDDFr4PHLElbGi0nDzKpVpO8L0a6rj867hXOgvYbu666cMi0VYos/MyGfS/i2OR8
         A24vOwKFMARIz8B26GN1gzWHA3YbBoxwrctmSlRxdVz9yrSRBaeeeHeAZyNyd8NNFbjb
         spd0hHtocJ8Q/c93ePqPgfBzb692s/nVxXNbtjUOcC/bKJEhw725KMtZUN7xjOJCdbld
         r33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199770; x=1795804570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxLabK95mTxRanr7oo+5ruy7RuGfwaK744Ez5cHpP98=;
        b=qZi08JUa3m38csJpBpoyfa1LArzX0MDXqihB625dNUTWLPy6iWe/fQPD4wFM+C3za2
         Lmy0yikpHrSYTEpR9r14qZX5VNqHMxieupMYHqgG5iqdP+XRxBl3TV5PQ7VdriGa7j4v
         EH6MMpQ6yX/JvWe4bV+U9TvpI5wRjh/d0JWCpDm/fjU1fJz5I9Y8sx/mcbE0az0aJYih
         zZfHSHjBf5A3LC2787FkovVzL48cIHFhQF/4zLOrxmMRebCcnRewfsI21g1hrDKdJ5KN
         4cbtnACuQEy646zBSejtvnVTMRx9j8VMh7zSRjouAQZhz+MrdrfygHGN2DTJiIaUlWZi
         gDbw==
X-Forwarded-Encrypted: i=1; AL+hErGcZXi/rvlqZFAfuh+Je8dGUzw1CAYmt3CNHEDFkZ8dvvzVRiq70KNQ9ty/4+lVNgwtfKRAvMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cv4gP8piYZznLIOXrldqIvhj6JlRdIjw7zdFmIkFcWnaV3TnN
	Sy3PTYHUk7A+pnPb8Eibdsi4XSK7F1Hwq0/MDVzvS/R9os8qKE4NmIKXL6kDUpo/VshVPuvkh0Q
	HsaGqOyBpImnPb4SvzuIPjC9W72oVs7U=
X-Gm-Gg: AZFdTZeSNk5BCtJCmJ+i6Mum4fDwbD4yTHbTlFToN8lxqOm+uxq4DmKIMagvqIslU/W
	ldUmNaxf1L84KQ5Sk0/nt9WnTRMBgWt7oYQ+DtQLXuRAqm6KGBeSI5DkGGTPAGPjpxo6LPLCGIm
	9HXtytOwMKTBrHtlCspGAO841bx4pC3VeuVS51ppk66m0UlKL2srxj+lBorIoyt67VGGLt4GxF2
	/vVeT0CKrlELBcTSR9jbBU4W3GT/yOjh2e85azhMRv2wKsxI8gRpmQWJr+oCAzAfzqL0ZIF3pix
	rrHi4cdoQdqO7QNkelB+HYxTElYexC0QaElbWLViEipzAiCAZQCHY9LAtV6aKjHKV5K7FklMFQc
	EQFisQTYUV0LU4JV6qtvyDHtNS24/3mA+rCPJI/OUHzCPZk21aM1jcoyJDSFnn5iPRwgTgNiHLp
	F+0W9MokmaTDnO3T5/201QyljG8TazTclXOGt/qE+n1jDGyt4LW1+bSh0OSA==
X-Received: by 2002:a05:6000:2c05:b0:498:b92a:30b with SMTP id
 ffacd0b85a97d-4abb0c5d560mr8148264f8f.15.1795199770371; Fri, 20 Nov 2026
 10:36:10 -0800 (PST)
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
 <20261120002549.1908299-22-prabhakar.mahadev-lad.rj@bp.renesas.com> <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
In-Reply-To: <73e4df46-89ba-4578-bb07-acad3d319d88@linux.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 18:35:44 +0000
X-Gm-Features: Aa3M54pteYuqCICsT2iLZaDSuKLW6c0ATYrH9gkWFijmAmsICBAQi61cGR-Fw3Y
Message-ID: <CA+V-a8s20m-vQ-Xe7gJvwyGvc-A0zRw3XpNqYAe8TtAuOcUjiA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 21/24] net: dsa: rzn1-a5psw: Update CPU port
 comment for RZ/T2H
To: Clement Leger <clement.leger@linux.dev>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Hi Clement,

Thank you for the review.

On Fri, Nov 20, 2026 at 9:45=E2=80=AFAM Clement Leger <clement.leger@linux.=
dev> wrote:
>
>
>
> On 11/20/26 01:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The comment in a5psw_phylink_get_caps() states that GMAC2 is connected
> > to the switch management port. This is only true on RZ/N1. On RZ/T2H
> > and RZ/N2H, the conduit is GMAC0. Update the comment accordingly.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v4->v5:
> > - New patch
> > ---
> >   drivers/net/dsa/rzn1_a5psw.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.=
c
> > index c0c1f45852da..751d03b0bde4 100644
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -237,8 +237,9 @@ static void a5psw_phylink_get_caps(struct dsa_switc=
h *ds, int port,
> >       config->mac_capabilities =3D MAC_1000FD;
> >
> >       if (dsa_is_cpu_port(ds, port)) {
> > -             /* GMII is used internally and GMAC2 is connected to the =
switch
> > -              * using 1000Mbps Full-Duplex mode only (cf ethernet manu=
al)
> > +             /* GMII is used internally and the conduit GMAC (GMAC2 on=
 RZ/N1,
> > +              * GMAC0 on RZ/T2H and RZ/N2H) is connected to the switch=
 using
> > +              * 1000Mbps Full-Duplex mode only (cf ethernet manual)
> >                */
>
> Hi Prabhakar
>
> I don't see the point of this commit, fold it into the one that adds
> RZ/N2 support.
>
Ok, I will squash this in patch#23 in next version.

Cheers,
Prabhakar

> >               __set_bit(PHY_INTERFACE_MODE_GMII, intf);
> >       } else {
>
