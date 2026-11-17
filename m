Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794930969;
	b=0oo1TMz5Y6/80JOMFeFj8LYSh01s08Xf70NSfnK0XD6/QBjB4IlzOsNIj+btZWw/DbZa
	 r5TxZcmD3RR4WLaDNHMvexmAyIXcfvbWhGqdFxIGMAN0halXt5YoTFXbgY9u4/BJWWFWH
	 shdHJii5NDYgkZTcqWYivYLAqRwIVxBlf2ErTgTtv4aO3Tv63Df4xonQ5ZfEZ7GHLKcBm
	 XKZLHuCkENSamiyFTnRv0WqfLrPlSwK1rvwQcRus9FJbl+jyOHnJFyL0SdaYxFYgcZ+1w
	 qDty1bfN4UTjY3fTcKNw7jZiLSJcQYq15QhdKJHe0LPjPy7oh/srWlBtQ58sXt9KNmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
	b=BfK7MY30da/feRQQbZXQl8kDGK4+9sTg6kLk5N/ug8MP4pwCE2CwLGZi+r5BwHccv9vS
	 3TjSZaTQdOFD6EgC8fB10BZSYk6jI61vkIQOgkpRIqZoHb75L0huqS6g8ocz/RhkblgVn
	 bBSzLZUBGFHwrZdkIf3jXND+TBXuWpah7tIarR3LosxfItvOxPHcUDpp4cqFAaMy/cHVU
	 Q/Qh2sQrA+mxagBL/A4STYo6gZpTv04uA9JPfTf7icjsBCb5c3iRU6NeXxS2uITVIVSNb
	 eUA5v/D8o1IPoVCICIuCLXSRhPMY5jfIk0zpRV4zYRHtt+9LS51bgJhMTITipj+Jppw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2IzWg7B;
	arc=fail smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFECF606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFECF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2IzWg7B
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so3880442a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794930967; cv=none;
        d=google.com; s=arc-20260327;
        b=rohr4YKBY3yVdcymgbbj3aAM8vyCH9CCHFUDNj7TNEP6r6PD0gknfveQDieIuxJeM0
         pV4UinLmPM4YkNSqMlU0OrDabsFUGWA5/tu7mh53TZ49OTSGrDU9uKBOr6me4uA9B9kE
         hMvw6dJj+VBOb/5idOISSlga3kv//R+UfMXu17ZCZM6ObTGmdez0E3funmGZorQToa27
         V3ZamPFlO6O48eq69BeRdBrQJJqBqlnEP4H40XtGsKw2jiC+soiJ5243nlWmuZkFa1jH
         0OpNLUKIV/YHoAu8L8G9Txv9q2PnzsGnLQcLz/hmAJp2r/j0a3qFGwqRX+MpqCaQqep0
         hTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
        fh=rgDAsI9T15muBRRMHPsfJCzgcMk3CJswiZbninpUHMg=;
        b=OAQqaJulgeyAkolXaby3qi9CR8IYDWNL+jF3IntfVa3vEn9DlRDRJO/+FktpBh9aoa
         2MaMTEYOAmUDnOBFo4elJbDMDB1HGW7h1OFabX+cPd00LO5Ig+Zrr+5b7r+5+HDAfx/h
         RVI1pRbOLQZ3VQgF/Mq8ZBx1oxX2ktZQlguzAH4vkARFUyxPmiJLOJuNZApyTflD6VTx
         /hN/gfx0lGjsv4BYTGx6iFbwBv4VC+Mx2rCiBe/yOJMKkuRuJJogd569paJJ2z22cgGS
         YegdWJSLqjz7NoP6yDWAGpl+G43mU3Nyz+9hKdwbfI08Vxbx5tXIQD/l3OXjMhm6dief
         OD5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794930967; x=1795535767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
        b=o2IzWg7BzXnSmALOLRwk3h0Gg76tfT7on6R+S3g5tzbj8ELJ3rQg373YwqmgDjvBXD
         geqMauUB5OSm4lkv6tUhYQhRN7yZX7Iql1cAiihf3EwoK7507esxi//imuUZcCYCNO0z
         Gc6Eq4djPh0ycjapIlylED0fRrGN6vlGJDp8JD5zoYOqDH17YaeBJ++qiEw3oKle1G8a
         d9NmQnCz9c7Qf8HyK7M5sxTweyZO12g4Op4uafirMuirjE6HVjzWvCfuDWAhHwSs2T++
         lhEi26+rAzDx3Kbsh517ooG6tvsMOQxV13kXV4xGS4G7Eaidr2EZqldoFkdJ5H2WsPUM
         988Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930967; x=1795535767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBvSlqcah1Nv0XCMM1HHM4bATdZSzarA4Ja8t39qtOM=;
        b=V3MLxpFOqLflRrX+pNxWqTghSCtVyPoxy86c9FB4Lk/S4onVZ8fgH6tg7oKIMGtqBL
         R9Moi541at7C9fF0h0BEW/xY1qC3GDbI8q3lz0XoytkiUFbBNg9AMPIGREVWqdfCSPvH
         jXTcZR/ekkVPzRJp6ZY12PpCPX9gci42XkPDXYXyFB7CkBmrb/AIG1auZl/dynsPoI9q
         OX3WooyHLfkFVNIFQM3HNZ5Y1vmQr4DrwIRnNiqLbc8w3slsLo1uko+341Er2C38ECR9
         saCnzz6/NwdITj18NFO4CE/8x9mEmPSwKp3Vv3MbUdH3GIurUafwpk5puon10v/f0mKo
         lvNw==
X-Forwarded-Encrypted: i=1; AL+hErHn+JeTg5rsR/NbNg3+r2uSKRVnUXAHpzZb9MI4SMzGCYMg7f9MiH32YJSqH9HvbnahzhtmvKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9USzykOUFtOaSNqbCqG/bgzsw9Q3KGChepajsRZ3obS+3hl6ec
	JGXUj31j4jlL+uPmhIaqbStsYy6yoFAUVWHbwiC0Hf9EZfsDIjmn4YpZgo8bdW1RrpdsUPNvwmM
	eIWcne61rxAYMUClaLQu3OcQ3+9kktgMH4w29ZnQ=
X-Gm-Gg: AYBFou0OAxGVo8tPCrpGr8Hzv9js5MAe5DmYkNBlX9Zgo2HgJVpq4gDSlcBYPFt/6PE
	v6f33RcBnaD8rwbCviz7oFhp276Rht1hZLyuBnqiOFBxctqQqXoxrjVbCSh2oosiKNVVsFin30P
	yxBlB3rj65NbxsSVqCQOCpgZzK1iHdxoNxOC0c6JFcHMYt25QeBNiapIZ5waaLNzgpWQH/wQglP
	ScdW6MTSNjbn5S7BH5YFrIsfj9/2imJTkeT5mdkaOsJ3b5qPiTDzz4mbQpSnKj04Uqot4VFC3u4
	j8SN6PwiKACMK+XSQvMqhKoxvJsULjWz4pS/ASOVfDMP8KpDDlstvhG5M2PL9eBMz4Z7XJVZNxc
	Vui3uzA0n1ZW3Rt2q7VkNkISAPMkuVMOsCHA928xNgDdG+vHlP95Y/9Fz6Hn0miJuVsyb4Oy2l9
	rcDqZ8FmXCgnoWj5zGWA6xTXWwYPtWaOPPDO+2HzNg6+HTT8cyQDt7aSlZSE4Iu78dkouoKGGwV
	HPdpiN3ODS2vTt/nBc0rrN6smSXT6Yy7Af2NqNmSQiyFNFckAY=
X-Received: by 2002:a05:6402:191:b0:6b4:203:a1a1 with SMTP id
 4fb4d7f45d1cf-6b7c0bc3606mr8801687a12.25.1794930966800; Tue, 17 Nov 2026
 07:56:06 -0800 (PST)
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
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch> <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch> <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch> <avtHbulALsI61uVr@pengutronix.de>
 <CADvTj4ocz9_rMDbDG1xOPALNw1yx9ypXp0S59sh04wSv_YMyrg@mail.gmail.com> <avwPa1MTMjf53lWN@pengutronix.de>
In-Reply-To: <avwPa1MTMjf53lWN@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 08:55:50 -0700
X-Gm-Features: AclHuK8qG37XEcbg14a3PfNYWvevsV6OWpW3NnnFEnzwuN5zMG3zNjx8OCYGh2s
Message-ID: <CADvTj4q8Yxi3SyS+Uiue1SwwujFcAABTD3+2BsdSwS3fs89wnw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:25=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Mon, Nov 16, 2026 at 02:20:50PM -0700, James Hilliard wrote:
> > On Mon, Nov 16, 2026 at 11:12=E2=80=AFAM Oleksij Rempel <o.rempel@pengu=
tronix.de> wrote:
> > >
> > > On Mon, Nov 16, 2026 at 02:14:38PM +0100, Andrew Lunn wrote:
> > > > > > Think about it.
> > > > > >
> > > > > > If you don't have a MAC, you don't have FCS.
> > > > >
> > > > > There are existing mainline PHY drivers exposing this functionali=
ty.
> > > > > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enab=
le
> > > > > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error c=
ount
> > > > > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also e=
xposes
> > > > > a phy_crc_errors counter separately from phy_symbol_errors [1].
> > > > >
> > > > > This demonstrates frame-aware diagnostic functionality within the=
se
> > > > > PHYs, rather than something every PHY necessarily implements.
> > > > >
> > > > > The generic byte counter need not require that functionality. My
> > > > > question was whether rx_bytes should count received bytes without
> > > > > conditioning the count on FCS validity. ACx00 could then report i=
ts
> > > > > hardware byte total through that field, including bytes from fram=
es
> > > > > which its separate CRC checker identifies as bad.
> > > >
> > > > Read 802.3. What does an 802.3 defined PHY actually allow. That is
> > > > ideally what the kernel should support with these counters. Lowest
> > > > common denominator.
> > > >
> > > > So i would say RX bytes does not differentiate between the frames t=
he
> > > > MAC will later throw away because the FCS is wrong. I would say it =
is
> > > > also O.K. to include the preamble, and the FCS, any padding up to 6=
4
> > > > byte frames, etc.
> > > >
> > > > Since this counter is not actually defined by 802.3, i would also
> > > > allow some flexibility in its meaning. Different PHYs might have
> > > > slightly different meanings.
> > > >
> > > > Look at it from the other direction. What is your use case? Does th=
e
> > > > exact definition actually matter? Does it matter if a different
> > > > vendors PHY counts it differently? Does your use case require cross
> > > > device compatibility?
> > > >
> > > > You have not actually said what your use case is. For new board
> > > > bringup, debugging broken networking, the exact definition generall=
y
> > > > does not matter. The PHY RX counter is going up, the MAC is not,
> > > > something between the MAC and the PHY. Neither the MAC nor the PHY
> > > > counters are going up, something between the RJ45 and the PHY. The
> > > > absolute values don't matter, its that they change which matters. B=
ut
> > > > maybe your use case is different?
> > >
> > > I agree that for bring-up the deltas are enough.
> > >
> > > In the field the question is usually: is the board broken, or somethi=
ng
> > > outside of it? The MAC counts FCS errors both when the line is noisy =
and
> > > when the xMII corrupts frames. The PHY is the natural place to tell t=
he
> > > two apart, but only if we know whether its error counter checked the
> > > FCS. Without that, the wrong part gets replaced.
> >
> > For ACx00, rx_errors specifically reports Ethernet FCS failures, not
> > symbol errors. We verified that with PHY loopback and MAC FCS insertion
> > disabled: a software-generated valid FCS did not increment the PHY
> > CRC-error counter, while flipping an FCS bit did.
> >
> > That establishes what this particular counter detects. It does not
> > distinguish corruption on the link from a peer transmitting an invalid
> > FCS, but comparing PHY and MAC observations could help locate where
> > the frame became invalid.
> >
> > > I have seen a board where MAC and PHY both provided the xMII clock.
> > > Frames were lost only when the clocks drifted into a bad phase, so
> > > production tests did not catch it. A PHY that checks the FCS would sh=
ow
> > > a clean PHY side, while the MAC counts FCS errors from time to time.
> > >
> > > So the meaning has to be known, even if it differs between PHYs. I am
> > > fine with that, as long as rx_packets and rx_bytes describe the same
> > > frames and the driver says what they include, for example which error=
ed
> > > frames are counted and whether rx_errors counts CRC or symbol errors.
> > > That is the metadata I suggested in the v6 thread. The ACx00 byte tot=
al
> > > also counts frames with a bad CRC, while its rx_packets does not, so =
it
> > > does not fit rx_bytes.
> >
> > In the original v1/v2 implementation, rx_packets and rx_bytes both
> > reported the inclusive hardware totals, including CRC-bad frames [0].
> > They described the same traffic, with CRC errors reported separately.
> >
> > The packet count was later changed to subtract CRC errors to match
> > the existing "Total successfully received frames" definition. That
> > introduced the mismatch: the hardware does not separately count bytes
> > in CRC-bad frames, so the equivalent subtraction is unavailable for
> > rx_bytes.
> >
> > Should we revisit the original approach, with both rx_packets and
> > rx_bytes reporting inclusive totals and rx_errors reporting CRC
> > failures separately?
>
> Before we decide that, I have one question about your test setup. In
> your mail [0] you wrote that the MAC drops the 63-byte bad-FCS frames
> without creating a descriptor, even with error and runt forwarding
> enabled, and that MAC-internal loopback shows the same. Which MAC is
> this, and does it count the frames it drops in hardware? If it does, I
> would expect the numbers in the ethtool rmon group (etherStatsFragments
> for bad-FCS runts, etherStatsUndersizePkts for valid-FCS runts, per RFC
> 2819) or in ethtool -S.

This is Allwinner H616 EMAC1, using dwmac-sun8i/stmmac, connected to an
AC200 PHY over RMII. The driver reports no MAC management counters.
The CRC and length-error statistics in ethtool -S are software counters
updated from RX descriptor status, not independent hardware counters.

I also checked the MAC register aperture before and after controlled
traffic, including CRC-error traffic, and sampled registers during
reception and descriptor starvation. I did not identify an additional
packet, byte or error counter. That does not rule out undocumented
counters, but we currently have no MAC counter that accounts for these
descriptor-less drops.

> The answer tells us whether a PHY/MAC comparison can account for these
> frames. As you noted, a difference between PHY and MAC counts alone does
> not indicate a fault. But if the MAC does not count these drops, nothing
> tells a user whether the difference is such a drop or real loss between
> PHY and MAC. The same holds for your valid-FCS runts and length-error
> frames. The PHY counts them without an error, and the MAC discards them
> or reports a length error.

The exposed counters cannot make that distinction on this MAC. The
controlled tests identify the missing frames because their contents and
counts are known; a PHY/MAC counter difference in ordinary traffic does
not provide that information.

The tested length-field mismatches did produce descriptors and increment
rx_length_errors. The accounting gap is specifically for frames discarded
before an RX descriptor is returned, including those bad-FCS runts.

> Could you hold off on v7 until we have this answer?
>
> [0]
> https://lore.kernel.org/r/CADvTj4qMgKrRZ_uq3K4t2+w_3eai4dwuCPod_vhEKEOsO8=
5_Wg@mail.gmail.com/
>
> Oleksij
