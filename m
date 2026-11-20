Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795185925;
	b=zN/lrtDp457N+GN17HokqH28pHb44zPAfJMaNT4VE5F8uAZjy4IhyJIcIKyEowRMhLjc
	 W/2gi/Etxbw6JQnED2hzZFScrLHBZZ70U6kSTrC4+BxRaXjkChOQPeqqoxqImTO28p4vc
	 +otDqCGG+KSuCN2LmFkJU0OK+dzgb8NmLl4j86UWN7Cyw52VqI+iS2zdBj4zARIh2JOYI
	 EX166G8EInvK8Hs+yGsgh5pbv5pb3Rv0HVXuPWyiIscENDtMKODLZvSnc+2cAWKZJYpmB
	 iUYf3PvaMwyXotcC7/LM2WWSYr67/5Js+Mj42dQqPeakvo4eB+o58ua4kZxiU3F+h9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
	b=VTfI7PX18+NVZ09eY7APT8cWmHIOFtUVGZlPN4/RND8BLZSq+PqQXZ00Jw0dXZwiWwyd
	 MEs4qafZlTbncf5LB+qqqp6zn4++Jd6x+0FC3INTnZxrnJkdezFBSrmk5+aHUJeI6+Nwp
	 wf8lkMqRAxdT6MxhBmU9SLO+W3jtgOV9PXJXTZx1J4+H0g07jSXQdzysVg/f4wbRcmPBN
	 PVdVPZjDBv3TvVNCkhbyyyiBMWU2m101aLNzaBonRQobx+VtwhL4gJiz9uAVbkYJawoIm
	 JwrSR5E4jG2IBeUBSpgkBw4UfkX2z122XPo4V0FP/5ofdWmRTWmkkhkTJf4x3vUEjRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f633lngd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D071606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D071606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f633lngd
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so11394985e9.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795185923; cv=none;
        d=google.com; s=arc-20260327;
        b=K6Qpzmd/PUoUyT7h6ossi9y0vT87ItpHwLojBaJZCS7hefKkAi2Hm74o3ANGibTY9n
         YDwws0KrVy8pNW3CpNAscpG1tvv1qYXfliqY74yrwFTjuDToraNj5jv0RR4l86caLcrU
         XiBaVu3edHKSIDB8LzSX0fYBL0Yo/UGd+UKM3asi7zXzkLC9l6UaVSu4ENHf6YO+M8Ie
         /2jcegTVfwO/L+5njFceObDgijKUjWLESR1a9MJW+RtUZKdU3pYAzCujOSEgswvyrW8X
         YUMsgrsZYQf9/HhGxkN0dGuRo7o32W2gm3AYUfUfwdfJP+d/kIBgsTSVf36FaeZpXGJH
         q94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        fh=it/ShN8qZKjjt/xfPjriL2Flddn9H4akBSYn/Vz/hu4=;
        b=WpyuPYCWsMpwgOYn6Z78yUJtAlY19zFJ+PECPwe6JMjVJ0D+b1l6kNvbz7DR/sZhfA
         kCnALMR18MP6xXlboHz4HRZ0MC94BYBwV7toYUinjOANrvh6Yq76Qy59uJ1kvbyLLSKT
         0T390+m1SZtMWn+OLuG3uj23ARV0nJNgl95kM/ro9E3AtvQSFephJtFM1s7bE044x/uz
         a4WZWJ9Ig5AQrPcCa6vEPtj/JRqB6mQZMqzE9yW0keDBaUwp4bmRl4YkE5GoDsrS1xyT
         9cPLY2shYC33tkc8MhdX2j5XT2lH5gy4ThgUjZGhOQRUwCK94EDdm6WztUiypFjHnQIE
         LC6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185923; x=1795790723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        b=f633lngdGyeQgB25tTiMalyiPph+6hN8WmbHgECT82SJswThbaePLCy4l4EPftPtIp
         PKShHiUnceLJ8YtKkiJ9WD4HOohsmUPru2Rk54Jp7v+h+lt0sXRUB2JmL+vGrnho9nNL
         iNvOIx3kaDiNtxVzZSBikjptHRr4HrX4686RYbGwj4IMuKoAKLuUfOqJAi8gSRPaPPW8
         BMOEIsSuJsOCSRF04JxQaO5ZeWJ6yMpC3+5AFtTLpXCYCXRwHkR2Kh9vOi95U2BEzdFO
         6gFFqoSY53nH/uARMgEdZ9SRE2KvMbI/pXAxGuLZuo5Spmz6F1berC8LPUD2OBeVwLrd
         2gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185923; x=1795790723;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM7YsIV/hvTviymzlQvqiY7ZSEwp78sZGDcRYlQvLWQ=;
        b=rS1i3o0Uau1gjbmBUUp+jgBuyQaBwTPsHvEPUXzD+uOKijbUTefQxDVhBil6y43XyE
         eq6w/8DscKoAGMmBd68VBdgF+y477m57wA+dDVHA4WuZ9nscDAC9rlcSqHcLsriAUMcY
         aOsxL7LpJKAo2MbNgbd9Ic+jrSJQ0Em/KAD12epngoh/0ft5cmkkeeDyyamTmFZUIHs9
         9MTaXx+1mFL9zOR3x0DoBfvgf/M3C1SJNlxIBfFbz3XQ1KCjiBZp6Edkx2eP1cen51Uw
         5a6aoFehHJV952s2qSUUqusYNeElE1ujln+XtFtMTbcIc0C6/ZRq0Ai1MkqtrzRAvOT7
         6a5g==
X-Forwarded-Encrypted: i=1; AL+hErETFGtFwEzhQgWpEzMOuLW0HxWsiCB11yVQ18Z4teDp6aQtRE9gwiw4LzK7tKztnJ9pHaK3Was=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KOcHhr8m5/OR6fU+BvNFCwBn8LCnSUI7Ru2DRMfRidcQywKSU
	xs/YX6s1ZPQRi3p0qFmNBBKWzwYT6vjk4NzdSud8hKl+jSQvKKnJAvtybTgpg9tnkak9ssvRkiA
	2G5asJlMDQMqIf48UHYvpITeYYsYrK5g=
X-Gm-Gg: AYBFou08c8UFa2EbyFv1gFbHdeq1CnyheFw1U+aHG8myb3CAZElDu7YH/PF5aRZN6B4
	xCAL6YtxNSo01u1ETOm00z2X2fIa+JJN84re4AMiSG4DjWjYUkBaGISu9zBsVtvJhHkC7B0sgqX
	kJQiuSUdPawtnBhQtPpentLfOVhutKS0PcUrhXNoPsqBxquqIKRBwlfMob8EZnsbe3dEY3QVLNw
	+9G3jdxCc6xOnzz18s+nuNxrSoZuD5ZyrMYp5S7/iqxhNquL+NhAZA4I7J+JiVQDM0JrFKJ8q52
	zckGKSuDFRdZ6NQsNKSaJY0ycjhuzcUOcO0FezxqXERIfCGjToUDwZkTjHegu7x4HDsXGFGqL6H
	Hm86bMtUcsCvdXmHEAz0socNOReYxwmHG5Kk3Q53c3/zp6TI8qKQ6WkF4Yp+d6xxKwFY5iRf17O
	HI52j1uE5HKcRlwyolDcnmcPRJlt8VdUI64peYqGEY8bA4wRoRucnXdYSPW/mOJGArgi4X989m6
	CY5PjzSzbVKtK6YE0lh
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4bb887fb678mr70511175e9.4.1795185923328; Fri, 20 Nov 2026
 06:45:23 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20261119191426.54709f08@kernel.org>
In-Reply-To: <20261119191426.54709f08@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Nov 2026 14:44:56 +0000
X-Gm-Features: Aa3M54pSOd6vTx4q0dKEkhbWmYi38SveFg9iQJwARff5g85g_o0F_47BDGOOQQk
Message-ID: <CA+V-a8vB25ypt5693HqdaRMefWUu5Dea52xY156jTT6roQ=q3g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H
 and RZ/N2H SoCs
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@linux.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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

Hi Jakub,

On Fri, Nov 20, 2026 at 3:14=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 20 Nov 2026 00:25:10 +0000 Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The max series size in netdev is 15 patches:
>
> Quoting documentation:
>
>   tl;dr
>   -----
>
>    - designate your patch to a tree - ``[PATCH net]`` or ``[PATCH net-nex=
t]``
>    - for fixes the ``Fixes:`` tag is required, regardless of the tree
>    - don't post large series (> 15 patches), break them up
>    - don't repost your patches within one 24h period
>    - reverse xmas tree
>
> See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#=
tl-dr
>
Thank you for the pointer; I'll make a note of it.

Cheers,
Prabhakar

> Looks like CI has already wasted time processing this, so we'll let it
> finish, but if you break this rule again you will get banned from the
> list for 3 months.
