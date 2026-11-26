Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795665659;
	b=fTfWmNDE4WzRwU0Ku9nY2JFlofO8Aiy0COeazkuAng3pAvnkjNKoSKnIdtZL/taWSBjn
	 /wze972Y6qatC+AmBZ80RWKPvHItPWs70GQ16/CB6vKg2bNYQANurZPIiSi0k6WYZK7Kd
	 A7Se8yACihusBXwBYwIcgf2FUZ5tUJvx2X8c6eSMCcgXtvTYYu+A9Pw/g52TmTv8gbCZa
	 2nrEN3tUfiJMaK0KKHDei6gW0ia4X4GSM2O2u5KV3SRftWUJGLxqm09oo8SY/nVc1FsCl
	 bUFTvDVxi08cKn9SfRnv6GDPlrp67i7zkgjvirLMMxumWj+XxXUYBzSAM5ZLPk0n2kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9s47qpDipYfxU5B2eQ/S7N2ZVeyVvWv6KS2FqrxLTME=;
	b=qVkW0jg6h0ciu8FPhs/QmifhVREW7dmXZLUORqmCu4VkoCX4FxKIPL0SxbfUaDp0V7Mp
	 Y9vXdRhlql3EjSidzjx3Bwt73Hn3JKKj7yn4lFLDssULwjPXcEruMoKr4qTsRg/5Fofam
	 aLPvWyP+43WyDRrvWNR3bFP+rbvSncWsF7TqcOx7S63ilV0pk2oVK33gvbbpycJXVUQtX
	 63dX6VuB552EMSgljbF6NieNzbC6x9t5snIYnLrT8lVaOSR2R/kjchBoKyqmRCH1SevHX
	 auTaRTiuMcCegSkv+bQUPPQIL9smXu/AokmTjMjsxe3EqB+0/+hU5psOgwRRTJERIhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uY4cjIP0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E255606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E255606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uY4cjIP0
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-57e45405af6so1137880b6e.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795665658; cv=none;
        d=google.com; s=arc-20260327;
        b=B4JKuEvSmvsL2wO41qogr8+jQAZNLQDqFA1InGRLQQQ+J28TB4Bvjphi/Gu7x3KUXp
         T1qksST9BiYx6m8UNNYzLMDEOLoBX/nYW6gm/ePq1qefdFTW+0foNhBVA4CroXAxQvxA
         yJY9QlIeDTfUybD5prOcS4VheJHEnTS1pJOm1mJ1Gi9AKk/M0Y/YQyWsTHIyroVlFIlf
         oYLYWFOewyKQZ8ImxEaKu/j7VWV6Nqk/RvfFXDHJ+XbiTYa4lVS5ZDTwSLFGdV1PsVD0
         4144DGrZeMlROkwMsxrPoLtjSAw2gxeTOseKgq4Ut8qack9f6WJ8GdqrLIvRgyWXD2s0
         56fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9s47qpDipYfxU5B2eQ/S7N2ZVeyVvWv6KS2FqrxLTME=;
        fh=ETyMDPt3t0hLL74Rjkpk80XYeQAXRUjJTuQdk2T1NN0=;
        b=TXsBaygC9Myu/kXvzgZYEW+E+XFelbTRQZOhwUifyhsgktHgpoOA3IKorbztMxfevD
         AdW0SZ57t4h6Avs2rS5XMV1heHMfUU+GG1gQ/GtwkVuuFtTkJPghBY9YlnuuDjvCw8nH
         4XDwxF22pet19MppGqw7r+Dy9z/u5qPKjOUBxc6stcdVZM6siKXN9m5SxQExe7RJ49Mf
         lekVeqNOGkK5OZ/Z16tGH+Rvdh2OB4OCbimcG7K0tNLqtWEA+Q5dl8SoHwo1t4bRwZ4Z
         4uq9JAUXuWaE05A1kj9/l3lA4c2d3pXHNj9Fc+ceOXLn+zOJKs3eNH+f4ALnGn3oQl+O
         atMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795665658; x=1796270458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9s47qpDipYfxU5B2eQ/S7N2ZVeyVvWv6KS2FqrxLTME=;
        b=uY4cjIP0HIdF46LpWcpqNy5ExkB4O/pgOSAITNTlNBAsqB/FYV8JJQhSSXuZ2RRhN3
         4ouxxqGB47GX8RvGSrcQUCXZ6s7EDh54SoDGeGRtVgnSbge7pRPr51I+Dy7xXOYzcNhG
         11/0WSlTEPec1bL6gOVisDwvlagJNpAy5uu9L/DtLdqHL2mkoF1cdwJ9z4nrqX3O6qu7
         /Hkvb+pe1AYXdJgEiCEHsQ1XHb4kBm9o2cmpEcFNlExDIZs3WSfXsxxoIsqje73UlS3m
         A3zHnp+GhejVVzV/PFKo3tSMD9VcJCq/sUDP+vQ7+vekNuMO6lS0t7zdPyQAQIQQMMFQ
         /TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795665658; x=1796270458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9s47qpDipYfxU5B2eQ/S7N2ZVeyVvWv6KS2FqrxLTME=;
        b=2JgOoFIT2wEjGTnOoVfI/emofGArmG20JLTzw8xwsOO5B2dSwYw39Azsv0xz2pd4nw
         0/mSW/CHCxVtmytzZWXfBos1j8cFCi2UT5wdy8yPvv75fk8xeo1j5QrCe23NeBJg5ccV
         XXf9qK07F6AKZqJg8ZoBczMB7hQzBTkzLv7vwoV1AP/3TVwYakXhdA1b6pf65tYh2KH9
         n3IC+ILhAVk2DBl68RDMOYnNb7knTVvNAeDyRq60XJmnthucqXqVG2LOiycsVC7ZJT9V
         xW1tX46nNMfX09LOal/FzOpKAq3e+u6Mkd00bV499G2ojszE7SKzr9hZhjJgJuAFzz74
         FrNQ==
X-Gm-Message-State: APuU4Z/hsdLpY4yEJTOw4f2iX5rHn1l9OgyvFxkv6c3jRI/aobfElq+i
	KxdYomDkJzBcYI6QVsTUTuCnDSI1+7WD0nqsKWz8/lLlrhBm9Da0ZTR7MjAYLIFboe2zPV9YPIG
	6ZoJxhsA+Cfb3VXTDw2NRA7jJy9yWDbE=
X-Gm-Gg: AZFdTZe0Inz123xgQXQqbFavN/PNOcRxjt1KW91qY2Qhin+x5fmBsdnsvJ8q/RdwTbp
	n4i2ahUeo7POAJ/XM19a3g90B1SL2XIu8Sfo0G/6gnbv3ylOMcUbNlITyY5AhiKKgZq4RCU08he
	ZTprgiWt2m6n1ZU7ocLqe+xkZmtF+FPqqQAIb9WtHpLVaxfolitGwCFBMcLau12HREk9Hbn8dlh
	Biq/SJBx3D5nRCbFNEjH0g+4o3pxwWhr/eP4UhO3v04KXHhK6CV7Kvyu41ApBAUq8yM/oY/l1LX
	0ypxyzvkkS8n4kk7rxIMcruRSWBMS7sSx0oS+7SDPZVlwQeE5zFa0Fb64m2YwiwEx6qajOZSkcJ
	1bCG4LtLJy+3+eaReowv2qh0r+Lj4zBzQr1HPks/52v+1C5Z+BAy1LcbW1OoCAztxQLMn+A==
X-Received: by 2002:a05:6808:1687:b0:573:1dfa:f0c6 with SMTP id
 5614622812f47-57a0cdd71b5mr20470982b6e.68.1795665657907; Wed, 25 Nov 2026
 20:00:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126034725.64709-1-mmyangfl@gmail.com> <179566514108.3294.13714710222643559917@kernel.org>
In-Reply-To: <179566514108.3294.13714710222643559917@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Thu, 26 Nov 2026 12:00:21 +0800
X-Gm-Features: Aa3M54qWwqLhaRkvIcSwU_J29XmhWl5BuvyVRwxOmzNYAfgMSQLuM7vrQe11ob4
Message-ID: <CAAXyoMPzJRD5XGQZp_24feF6NG2FPZ5BsEWC9h3UsS1csB+kWA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Unregister the MDIO buses
 on teardown
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:52=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Not a fix, explained in the message
