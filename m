Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795071063;
	b=36Nqan5Mhjtp/wgcLZLcGwP9eSTAcG/d6WedhcWQJOJ3WmtSKClPBqItuaIV8rZ0Z693
	 w1C3Ckrtv7PT2XqGufYTY2iiG0c+pNfvENFyF1uxWyuvMV+xYUckT/Bbra/TPs2WYGVJr
	 2TKNaccMbzZ/tzm4I7l+wyhn94n2QQjFhBrCdu/gSujoFPBCgR2U3npUBxI3RFxm4E9q1
	 xf38Ou5KMe6bL4eK/WIlrnBkZ91yLIfzFOtIEKRot+aWt49kdHPEF7tF36ONrR9dz1Meo
	 ksujiXk2aoav8YfhMRDTFnJCVlBRslCJImATFQzU3sT4aIl72lwOZK5IBG8Pfkj0d0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=21+ZMeN7M5QzEt5ztkUWNg03Vu34l6r+4MJ3ywJYA5s=;
	b=5ebc+QVOgtNdvcNWd0ireX16MH4wyQ5jGdFIgl3BfLQkYs0fwdHfhtNvYjppUxefDeq/
	 O60IBpoafwRzQla3KtEUtCcn0lLT+iM9glbzQ6BSQ/0tbGMqHe1h4dIJtBb0Ndco/d9lV
	 +8kiuEpsEu1h6YKXun29qI9FhGE80QPNGREHP6VnLtWM4ajWVor4tIZQGzLsIpnta4WBE
	 vV+XRcc2bCF5pPQJGhfZ5qQUrl7VVWk9Z6OoAxqhp6J3CpyAb51VJybRL8sGqFsOlaUiS
	 hlKRzR/ZnoSx5+Y5WPIAYBV5mKKV7YPBX8srMpk+3yOkKCUfZsAL0y3wofhaJQ+2mvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dz3kqhhs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377A606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E377A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dz3kqhhs
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c506a231b88so265661166b.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 22:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795071061; cv=none;
        d=google.com; s=arc-20260327;
        b=Vtpv04iMCHHn9pDVvVFdkNST6fVWWgEYbrlriqxH8glgr8J7i3v6y72Oj4LR8YCy02
         YTjpQDLMkuYZwsmDzL+XQ1KaEjBS8RSXC2axksorpxo7H+/8T1a8FXU5FlLk+OWuQSzu
         B7dgZBuILj3pJNDOBPLFFvfzjg7wHa+kGyrx9hGaH470ckZFWEvJDJj59x5Tjr4QEsOq
         1UJddsVrFIINaYgMB6fYcpzlCKfJqgnwTdQL7984W92jqEg/x2aaHPi6Pjji+G6/IfB7
         t+Fi2r/C4zXXqh1PVKgsyiE/IDe+Ym/X3OMoJajq8Iy64PqOKKYHgylpC3hz5OMFjG0T
         jH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21+ZMeN7M5QzEt5ztkUWNg03Vu34l6r+4MJ3ywJYA5s=;
        fh=ZkQ+1rW0Vd3/oYoWJt3mTJcpCuk63DfPv0bAxCBHjKk=;
        b=qaLr7U6tzxBhqjE8ERyf6I5QwHZ6jS8clGeS4Pwi6M4O+LAOMFWJZr9tqQPjNKl5AZ
         i0DFhoZOXa0XuRe984qxe/yaxBZACIXAz/b2alQq6R/+z6kSh3BbK079y3Q8EkrqOM/9
         4PjxnQWFT33HyuP8Wiq8EWr8Cw+65+d7DB7iRQz7qcoWBvjSXNzJKNjyR1JC8WXScsNr
         bgaJ2DmzgYnYNqZvAj3SpI5drSlhhYIt4L1ycooyc9JEmkL9xfLmxDUKSelTG9f9ZvE0
         f8GV4fH8Za2mRrKOXPpae0Cx6N1E+wfhlQIeLEVlZrLn0kwmeUcF+CLWNe7SmEgF/A4o
         hD2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795071061; x=1795675861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=21+ZMeN7M5QzEt5ztkUWNg03Vu34l6r+4MJ3ywJYA5s=;
        b=Dz3kqhhseNsqNCwHF7k1uCU7FQuXQgICJzlP/c0pBJjdE2knWHXGiJRepazlnC5b5j
         E8U8mtr1gTLXz5BTNLZGw8RMPh5H3eRxTLqgKqBb6NxRXwyNs7sU7/dfJavvJu7QkIq3
         0uoSCHWAceLPVW3Wni19pX0CLlcGo0q55Vs6q1Cem2SX1+cZc2MECZ833Sk/1469wjaN
         HZNvWlJfP64yyPwVctHU0AxkUPa3Nqt3SHyg6NekWiEIYNQ6el+MPqPlYp4D+V6Bfx9s
         Exdk/jK8J0WUF1x0QQ8wTt9BxZf+7krvwFtkTqPc5niGIERV2KZ9B0Zp+wSqu1lqfRG+
         UaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071061; x=1795675861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21+ZMeN7M5QzEt5ztkUWNg03Vu34l6r+4MJ3ywJYA5s=;
        b=RG7P3x2ts77i5bLbLUxYobFo3rluBDwcBXhoyjnhaBWIO++bUhqNLxCg/0+ipEwzAH
         mvL8r7uTvx9QyVSV/0BS/1GYCp8q60Qd/0D06SuqySVshif80vqOvaTmGLjoO8Zlu/+E
         dNExCi2wvqYeG/+FkqbB+K7rsLAU467KOduNpbs0W+45t7QLnrasYbNjXcEVTaupVAwD
         FdUEr5gtjzraxgMR1kclipExsRJa2b0/5A83LPe/We/sORReyIFJ3i+vmq4SHZ8SzAzw
         7tAjH0q8bUcfDx/cZkTprtGmB4U4cRxyA8QWzooeXqWF3C7VYSgZkBNfmcqn7GPeZXU6
         okRg==
X-Forwarded-Encrypted: i=1; AL+hErGO3R7F4siRORAr8dRTCVixP5WgXaYlC2zkD2ippeGC3Zwv4jK9kwxk3TzRZmooJmzjkrFlIUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4HKoFvJpg9b9623j5peh/LtyqtEM4dmDG3nr0seJqu+UtiDXT
	JppGXBpJngAArzed8XFfIz4Zheb5pJBKG9RUd3Rfv2bGmKE6oKcNYUQ2B2PK9OKqm1m1zs++Myy
	ZSvEf6NMAbdkn9oR5synx4gyqj22OPGM=
X-Gm-Gg: AYBFou1wLf0xYfI5u41x+SjPZcd0phIIpd4fM+JVecK2vhjMVBYjySI/EArVt4z/Dxv
	P/8DBc9Xbv2qYBr+5kCNj6vIkOCI/WM7+UnsjmaF0cGVGiY4qLKm+1Eqg3JrKPVf/Hw7d/P1746
	PGp/94fxMB9DHXU+GkyJLmyBQHHKA7Ixn/9/qow18KR24UzkriD+pxvLCe4oARYo4CGmUD3+o9A
	5WzETc93OZoulWYuXoDuablqXEZVgrQy4oN3k9hBjjqUMbzhydjOSSLkI6XmLW+udeXNW9qyP8X
	OnakRu7hEga4qMhnD/65vUocNqPod92bri0BqxML5/LYEMyLg6DnSRYaIbOPFCPfOf0EkdScDv+
	VByV3tEguFhRNmc87+JhJjsjMz4bDFaGonVjSC0p+k4gmo+AGwGiML9ExrVZDjPvAFM47VWeMmj
	6DAqvvJqTZZVP51bH4WeOI/A==
X-Received: by 2002:a17:907:3d0d:b0:c50:95bd:e491 with SMTP id
 a640c23a62f3a-c510e2b7e08mr400463666b.28.1795071060980; Wed, 18 Nov 2026
 22:51:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118221450.1764790-1-pawlik.dan@gmail.com> <4ddef89e-d6aa-4d6f-bc8d-997a9ad781b9@lunn.ch>
In-Reply-To: <4ddef89e-d6aa-4d6f-bc8d-997a9ad781b9@lunn.ch>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Thu, 19 Nov 2026 07:50:48 +0100
X-Gm-Features: AclHuK_5r3LzpobJv6cf-BjS86pPufeEQH1uQqqP4Fae6DR4oKTexALqnOpdwqE
Message-ID: <CALC2ApjfktxVEubK9WHMK8mnVpXLE4upEK_q4uEVFmYsUaGvkw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: sfp: skip PHY probe on bridge-less OEM
 SFP-10G-T revisions A and B
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux@armlinux.org.uk, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	petr.wozniak@gmail.com, maxime.chevallier@bootlin.com, olek2@wp.pl, 
	hkallweit1@gmail.com, "kabel@kernel.org" <kabel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, Nov 19, 2026, Andrew Lunn wrote:
> If i'm reading this correctly, it never worked before? So this is not
> a regression? I don't think this is net material, it should go via
> net-next.

Correct, rev A never worked without the stall; it eventually links up
after ~9 minutes, so it is not a regression. I will send v3 to net-next
without the Fixes: tag.

> When sending to net-next, you can move this function in one patch, and
> then make use of it in the next patch.

Will do, v3 splits the sfp_strlen() move into its own patch.

Thanks for the review,
Daniel

czw., 19 lis 2026 o 00:16 Andrew Lunn <andrew@lunn.ch> napisa=C5=82(a):
>
> On Wed, Nov 18, 2026 at 11:14:50PM +0100, Daniel Pawlik wrote:
> > "OEM SFP-10G-T" modules with vendor revision "A" have no RollBall
> > I2C-to-MDIO bridge: page 3 of the 0x51 EEPROM passively echoes written
> > bytes, so every RollBall command times out. With instrumented mdio-i2c,
> > the CMD register reads back exactly the written command byte (0x02)
> > forever, with no DONE and no I2C errors. 0x56 reads back all 0xff, so t=
he
> > PHY is not reachable at all. A genuine RollBall module with the same
> > vendor and part number (revision "02", AQR113C PHY) on the same board
> > answers DONE on the first poll and its PHY attaches within ~2 seconds.
> > A rev B module with an RTL8261BE PHY, reported on the OpenWrt tracker,
> > hits the same RollBall timeouts. The bridge probe added by
> > commit 8fe125892f40 ("net: phy: sfp: probe for RollBall I2C-to-MDIO
> > bridge in mdio-i2c"), since reverted, found no bridge on it, after
> > which the module worked.
> > That module reaches this quirk entry only because its part number is
> > "SFP-10G-T" at that point: it is a rate-adapting module which reports
> > "SFP-10G-T" with a 2.5G or faster peer and "SFP-10G-T-I" with a 1G
> > peer, and only the former matches this entry, which is the sole entry
> > forcing RollBall on it. The "SFP-10G-T-I" variant matches no quirk and
> > keeps the default behaviour either way.
> >
> > Because the SFP-10G-T quirk forces RollBall, the kernel retries the PHY
> > probe 25 times at ~21 seconds per attempt, i.e. for over nine minutes,
> > before giving up and falling back to inband mode. Each attempt runs fro=
m
> > sfp_timeout() with rtnl_lock held, so for the whole window every rtnl
> > user on the system stalls in ~21 second chunks, including the state
> > machines of other SFP cages: insertion and removal of a module in anoth=
er
> > cage is only processed after the current attempt ends. In one test, a
> > module pulled from the other cage kept being polled by phylib until the
> > attempt ended, triggering a WARN from phy_error_precise().
> >
> > Give the SFP-10G-T entry its own fixup that skips the PHY probe for
> > revisions "A" and "B", while keeping the forced extended compliance cod=
e
> > so that the module still links up in 10GBASE-R inband mode as before.
> > Other revisions keep the RollBall fixup unchanged.
> >
> > Tested on a Banana Pi BPI-R4 with rev A and rev 02 modules: the rev A
> > module links up at 10G ~16 s after insertion instead of over nine
> > minutes, and the rev 02 module is unaffected. No rev B module was
> > available for testing; its match is based on the report above.[1]
> >
> > [1] https://github.com/openwrt/openwrt/pull/22910
> >
> > Fixes: 324e88cbe3b7 ("net: sfp: add support for multigig RollBall trans=
ceivers")
> > Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> > Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.woznia=
k@gmail.com/
>
> If i'm reading this correctly, it never worked before? So this is not
> a regression? I don't think this is net material, it should go via
> net-next.
>
> > +static size_t sfp_strlen(const char *str, size_t maxlen)
> > +{
> > +     size_t size, i;
> > +
> > +     /* Trailing characters should be filled with space chars, but
> > +      * some manufacturers can't read SFF-8472 and use NUL.
> > +      */
> > +     for (i =3D 0, size =3D 0; i < maxlen; i++)
> > +             if (str[i] !=3D ' ' && str[i] !=3D '\0')
> > +                     size =3D i + 1;
> > +
> > +     return size;
> > +}
>
> When sending to net-next, you can move this function in one patch, and
> then make use of it in the next patch. That makes the code easier to
> review. Lots of small patches, with good commit messages, which are
> obviously correct.
>
>         Andrew



--=20
Z powa=C5=BCaniem,
Daniel Pawlik
