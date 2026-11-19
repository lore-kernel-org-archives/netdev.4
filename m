Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082132;
	b=CcsrFwCIkcUsnbzDbROYw9VIVqc3ZuCQqIZd9bAc/4nd0/e2SHtz6+eS9H/ZZ8KW5BAK
	 H1Y7iRzBztdXUqkpP4tyG88ntqIxhcmv3U5ly1kVh3xfBtY6TgFLlIIG4p3/0htPwlg7m
	 BFEPeznGXmKaCzFfC0xWsP/Q/Rk3W/V9rKrCiiRJyNjyZxD6QrSBpYBfcGVuKLd7/rKQL
	 44SN3Bo+sEnH9ZfhmZ5II44FWN8+tr4tFhnIfFbqWdBK5oobJJZIWgPydWb0j5cn0VfxE
	 UAgfYcYhnBk3QQzGqBlnRxjSz2o9RUAyYv/nqIrx8yk2JvBEuvYPJpRiNpdqnFvcxzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pm7Hd0hzUtoHByqnTKuK22z9l6hq5ZK5lAdKqbbdMJM=;
	b=1nOpLSFkz1AdlOwc7THmOYZ4Eae5LYAUe49ngXcCMB0R6jlctNc1E7KTX5SVSWuKPDfW
	 nC8okcskNH34yJbJhZU0m2xdVfgs8Ro5JIzpcwe7MVz8Ly1y3TGva96LcY6ICBMtebpGO
	 OJulmraCyH4in5RiW3HQj4Me+smB/Y4XHtv0Tzy072XxkzsGEBzBUITbx+1eRBH8JXZc6
	 MUJ+TTbdkcHyvMoQq7eiwWyCCDj02CcVjl9HovXp5i0y15iyR14M4SwI9o0ESejOsIu+5
	 UIDv+NnFNtHGymsOCXpYdEe3xnd+eryv2skrKI6/3weKTE0bEIYlGX27irMMLj9K2iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z63CXzV;
	arc=none smtp.remote-ip=74.125.228.139
Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113BB606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 113BB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Z63CXzV
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c504c069dcaso177375966b.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082130; x=1795686930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pm7Hd0hzUtoHByqnTKuK22z9l6hq5ZK5lAdKqbbdMJM=;
        b=0Z63CXzV/fH5a34Jotdt0MnvMwqjxY6PcxChoNhMzhHjMrg1eswYkQrQnN3Qc8+Cd9
         hz2hrDa4u+BxaE5V26eKyv087GVqb17CtdsPpF2w21x9Tu1yVLM2F/1nCksmOj0Y7YQR
         ba54pVPjCxKuCzHUU/4/T/+xn98Fdn8ZgrzXPRByjzsGxyYM4+bWuwTWSCSwhoJ0wd9r
         N+bJ6zfNGdZplI/087Ekwg5al3Go3PuNwZQSmM+Q7p8whDKafFWCZlplARIDewFbvcBY
         dkGRQtbTewigBXNDIAQ1D4JuUWqrbgP1TPBfS98gjlsUy9hd+dPWDkbN1DdNxJYwpIfz
         STKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082130; x=1795686930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pm7Hd0hzUtoHByqnTKuK22z9l6hq5ZK5lAdKqbbdMJM=;
        b=xBRsbzsOk8BHz6MhJ1v3UG+4vi/y9Zv/k7J/6NYKFEvfIbWMaPXAXodZHTmwu8zt97
         79WvNRGoFHa8OtvP0eE3IQB8SBvau97fRL6f4LaToUUSuAfGw0WFYk9/rhsN5JeOs6Vh
         BYIHn+rKCKAPDX7vLgtlD/X7Z01SXO4/aIFqeskIC6ynzJhvxXrK4S+MetZDMDYcWpMY
         uOdn3Sot2uVgWRkMwZXQONE1S1vc7n+SkX42+0Bz+ffgEt+fKamJrptf3aDt6MwIlsJZ
         XBCS83Ne/wozKN/gy9QCOtzlYDbAKdor5pCnQmdF2v2vlzyuPnRC6RGv0xq28eq9OXTz
         yS0A==
X-Forwarded-Encrypted: i=1; AL+hErHrq3+hLdoB9t5Ba7bYjGMJZa0K6To18ONte2ANKrxaP4jPVLu5l/UjVSpAtDN9A7ikGTaGxSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z//FkNznAqfP0YSl4cehrsNIJLbmy3qM+lLGO7Lil/xiNFuqbAY
	iwnwDMYsT1p6i5TLWObDEhjhpaZUrrVmOnXJLqGEEbL8fwONnV/fMbKR
X-Gm-Gg: AYBFou3olhQmZoFFGB7sFOg9nkaNSDbdPdsYDVBI2FAbeme+IZOsBQWXOu9h+FFv2id
	pkebCKBmdsktIJAdcZSMx3pFN2Qc4m7eUDK3FChVyj9owGxym0NuwLjS4W5+wIUoix3LlZXPEjv
	i2gSvbx5AZ/IqPpUsBtHx8r8PvbTQ4uOi/36rnYhqx08BjF9R5QMBm2NedhgVJ9+5HT7695wnG2
	Y6I6WkFq2uwF8tpg3nS41gDCOTH8lJ9QKk13U1BK+WILvBgfDCTX8RjMKcyR1g1qAd+5n1Ba+GC
	gMRhIOnk4Yo8ZlyOqbkYuHL/4g7SOOHaleDje/JTL9++0Wq88xklIphon/mH+6dwwWErMvD+YD7
	P+5/UgBnIKv+olqu+WjK76mJKvTpeJohbgnBCDcUIbvTdcipXEGFoBoOkB5rH+J6z9rq6iXklNY
	RZ/rVlqSxfSQKiDCOdRLJEFuXsuYeHnXGClxvXOkuqFsfzwoLVI7hpkWGZgkf1aaPYemeVjFTeu
	FHJe0aMulqdfP/515xbhM2IGkBcu4x1n2+Yy80E0RV41qBb6EdEhoz7oNa8u428YoaqJMK8yv3n
	oOBjYy7BtL9VAJlW0Yv75phaaqxmxJkfmAxY5OyuJVQymX8/pIh30Bo0sWgp69rKcxxZXaF8h8Y
	slDEYiDfanMdDD5yNIAxhpK+lUe0YAoWuxsYvTuwqb7XafafYVkFyH7bO
X-Received: by 2002:a17:907:2d13:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c510e330f13mr490422466b.35.1795082130315;
        Thu, 19 Nov 2026 01:55:30 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231baa96sm95238666b.4.2026.11.19.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:55:29 -0800 (PST)
Date: Thu, 19 Nov 2026 10:55:27 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v1 1/1] net: phylink: keep initial advertising
 settings
Message-ID: <av7Hj_S_B2qSpNsk@thi-server.fritz.box>
References: <PNYPR01MB1144420346F647D64C23775D2FD732@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PNYPR01MB1144420346F647D64C23775D2FD732@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Nov 09, 2026 at 09:58:33AM +0000, Anandu Padinhare wrote:

Hi Anandu, 

Thanks for testing this nad giving feedback.

...

> Hi Thilo,
> 
> Results from an ADSP-SC598 board (stmmac, RGMII, TI DP83867 PHY) with
> a 6.18-based kernel, with and without this patch.
> 
> 1. The case in the commit message is fixed, with both the dp83867 and
>    the generic PHY driver:
> 
>      ip link set eth0 down
>      ethtool -s eth0 speed 100 duplex full autoneg on
>      ip link set eth0 up
> 
>    Without the patch the link comes up at 1000 Mb/s; with it, at
>    100 Mb/s.
> 
> 2. In that same case the pause bits are lost: with the patch the link
>    comes up with flow control off; without it, pause stays on. Same
>    with both PHY drivers. While the interface is down, ethtool shows
>    no advertised modes and no pause, before and after the
>    "ethtool -s" (phylink_ethtool_ksettings_get() reports none when no
>    PHY is attached), and the AND then drops the pause bits the PHY
>    advertises.
> 
> 3. Sashiko's sequences (a) and (b) both reproduce with the dp83867
>    driver:
> 
>    (a) advertise 100baseT/Full while up, ifdown/ifup: 100 Mb/s.
>        advertise 10/100/1000baseT/Full while up: 1000 Mb/s.
>        ifdown/ifup: back to 100 Mb/s, advertising only 100baseT/Full.
> 
>    (b) continuing, advertise 1000baseT/Full while up: 1000 Mb/s.
>        ifdown/ifup: "Advertised link modes: Not reported", and the
>        link stays down (NO-CARRIER).
> 
>    Without the patch, both keep the last setting: (a) comes back at
>    1000 Mb/s, and (b) at 1000 Mb/s with 1000baseT/Full advertised.
> 
> Happy to test a v2 on this board.

Ack, I have to rethink how a proper solution should look like.
This has some issues.

Kind regards, 

Thilo


