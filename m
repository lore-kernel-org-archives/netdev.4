Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999454;
	b=d9H+OpJsro2ZQljX+XBzNw0OeA76ZoTYLxxUoUMDB75IHJX4IhTT7KUg+RnaAh9f8NZP
	 Nw4obOuvTzqSq5pXRY6yPaRVtkyb7XdEI1N7ZMQa/P4PES2+bKersAlGBwnVE5BXsuSgM
	 /Cc6VQlC29R7J1k3oGwXzMYbk7W74vA/VmLzRpZvscARnBI1EzfWgyT9xxWhDFIMAWtBM
	 RcyAZwJvM3LeC0bzgNMVbYsndIjYUHaiRfAWsyyuFDeoA6jD248miVoBaOKjuW6gCiiZa
	 MiDSTMV2iS1bt2FijFpvjYlB6ivXYknxmkU4Ey913lsSquX2z4/JNilg8B3K3ZgCR4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
	b=Crhb80cubVcsZcwtPb+/j7iCqJz9sZUJq+u/RJEdobzJG0idfxOnPtM00bVvgZaAm6gF
	 qltGKlzTo4DgQZ1ORHSwsXbIC9bV2bi5TU3YVxU2N0732M9smR0C1Xrb+Fo/PXCYtXApc
	 vzG//z9DQtX2HtJDkE2Jgdz5mmOr0m+VoRPGnDPcnAx+1RSYcgiro8O0+VoREp+sXYPvC
	 wAIxGyctGTftJQt5bavhjej6xzMvW8eIw3TvG1M7+kbt0+wDkM2u8xJ/kG8Jqyqnvhw8L
	 MTYZy35DQMzY4AWyq+7SfXU9PGdHpcALvdSh4Sxjoc3CB4ZISaueO/OBmW6SIE0Ko/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCiX+gda;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14F606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E14F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SCiX+gda
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-5725b4210ffso217799b6e.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999453; cv=none;
        d=google.com; s=arc-20260327;
        b=LhtEiw/9QNOk1olsivyUsziz4X6d/bDOY/rvYearItdBpcrlZmDymgqzl7Jtv/dxlv
         dS9Z9jbKzwQEd8/2IAnHu61mBrBBiklKf7vEPx5rBhrWYSUUUJDEH9E0ItrlO1TOFiRu
         vbdOUdWkNmnfLbuW81FRwuB2S+VN7KilUEhwGEfb4gzTH+fgTVJ7qV1Yip0D1JC3/F0f
         bt1LU13WBvwy15TqL4VQIiYzARNWUtPFhc9LKpnxHYPkFWVXj1tcK9p/qaPfj9OAWHOM
         8O1YZTcFeAiTNzqcdiSymjNcTW/o37aM3LFYREOt9YzB+G2vuaeYNmmUN4xPJ4ex93rb
         ExCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
        fh=TNKyuP5sWtG7wsRbyayI3fFWT6lfcYHpgtTJW4cbzUI=;
        b=FSYI+7zl/iwx1YGJy6/8Mt+FzWsyY6oktANJG8Tz6x/EJjH+I9rzz5kqziC4+4PM8m
         iDehYU2m6T13zpiWUWHEjBiO4bETe41OM2LvElyIPplthSk3+vhnpW7QvQ3lVFSWILG+
         mMcgqgiTiQQgAMPyCaFaY3S0iTFo+mf8dl7CPtl8CMSbCW9jjorJFjHlQMz/WqJJT0ly
         CawkBtahQVBmtL0UKLkcOyAsKTzz8iDtW789mwfw86WuFe/qtzj9588Hiuf1SCccHo6j
         pVcDmtfxQZA/sufGD+ADMWjp7axEZR+EYVNsBwOovDfcmeHi8s0WOg3VdXTqEXSG9Q/O
         s8Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999453; x=1795604253; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
        b=SCiX+gdagQMSb6XvZ8933xAebg6muvz2hl4ihZ1YmtXJlKP2Pjy75qs9nO1o8P49OY
         GsKDyZmZAc0MA+10LRyLfBgP1P4LIFNboEbFmxGF0+wCArYLoyE81LzGZJ7LbrhnaKKC
         hXCH9hiaqkl9mxkSTrP9504lLu4Yx2VNZ6b276/xQjPEAEdEhvh8Y7ndMn3sb48uFGEU
         47euiz1wkzO1kfAm8PPjHbUjk+GmsY9Z+Y2r0GTqmdKxjtoKlLgcyVYcyTdFNIDbLipZ
         TxkaYrS05NUaSCMgACItdzYnDrEq2XccfhHQ+bKG/s695Df6wOGGquvh1KS8fGu/Be7x
         rnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999453; x=1795604253;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEcloWoQSOSl7rz692vEiAQjXGZ++rtckC5eyqv8kLk=;
        b=l3zvPFCtBJM78WEpY9zeJon1zKHs4GxSfOxzzV2CvqDU6F3qTdgTuF6p7yrSAYnHs1
         dWE7cOseeLD32ni7z1skUsB+XtNfsR4fohSYUE9RwWK6I8LAH44gvf+eYD880nkGYs5m
         FWgojXyr5mdz72424DS91XbJjmhzZeEhOJ7QWJPUIokz2Y0jVzdWrbLRXUXovFIo+1CY
         oT9c5G/i9QH8/w2XZBQTdl1rKZh7aOp/kWNjhsJpIilgxUzCB3lPf9F5VvQuaD4X9aFu
         ke1OXuEdqZMqH/6hGL+sBnk4+6QWPaUgt3vXYxVpkK39Q6huG1tPIHdfSCWPTNYE8VZ0
         8+Mw==
X-Forwarded-Encrypted: i=1; AL+hErE5nvBX+73k2OrWGvkMwltJo5HdfEPOD2wTK3qvrV3Su/+mqVTryOo1/U8uooEnEIfn4s9K8kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RHyrTU50YhT79BflqBgIYyiY6GEbWvjngy6Is2cvuUWX5VOkE
	nAAAv38yKPTAN+n2oSvo+M779dRRCYVNtD8akg02TwKqUhozyCZ//4hovQaaaE/Ib/Htj3evaQa
	9DtsqI5j1sMvOOLUeg1CD0LNWbNSVd3I=
X-Gm-Gg: AYBFou3Ln4v4n/JxcCsznqwWw0TTNSDTbM8IMyAIP6XpOu+B+Da0BhI21+80JNSrjSC
	hUhxkkTKcLlGPTBhp8Y6lWA8SQp3X+s2nDmO3C1SodK71oMjPy8zOJb3CcP4KZpTe1h3XSKCXH4
	tvGeJhc8zkm2WW8bXLFg1VmmaSHx8ZEcGwIYq/iAPsAvGEyt+4WrJ6lBjNpdqDLvgzAAP8TBwVQ
	7DQhWgP7Bd8YLjEK8IDMsrOdy+BC22e2ndp1HgINMoKc0g6CLmZVjNbag4KLPqKW4+4iOa3A6jK
	NXJ9YcmX1Z0O6lse/4ZDNGGiU4tBUN3UvfhihwOAFNS506UPWLbo044drBDux+rWpBjnJ2Ajpku
	GdocEUCqI3efpIqZielqRTbDB8jBFhyld1887BA==
X-Received: by 2002:a05:6808:1385:b0:4f4:f5b9:8c74 with SMTP id
 5614622812f47-57736f96840mr2811966b6e.0.1794999452991; Wed, 18 Nov 2026
 02:57:32 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:57:32 -0500
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
In-Reply-To: <179499832232.3291.8192759477709019638@kernel.org>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
 <179499832232.3291.8192759477709019638@kernel.org>
Date: Wed, 18 Nov 2026 05:57:32 -0500
X-Gm-Features: AclHuK8muBKj1nIv2D6vArXPRtf9o__0MzrQcXww4sWxtk4rC_y30JUhZOF10Ao
Message-ID: <CAD-64Dee2PZpdOshS-TdjXRsGKxV-nw7ppvBzDtpePLJZnyHiA@mail.gmail.com>
Subject: Re: [PATCH net 0/2] net: phy: fix timestamping lifetime after probe failure
To: netdev-bot+sinfo@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

The issue was found during a targeted source audit of PHY hardware
timestamping lifetime and probe-error paths. The source audit was assisted
by an LLM; it was not a production report or a syzbot finding.

The resulting hypothesis was then validated against the current Linux
source with a focused KUnit/KASAN reproducer. The test registers a real
mii_bus, phy_device and phy_driver, follows phylib's probe failure and the
driver core's devres cleanup, attaches the generic PHY driver, and calls
skb_defer_rx_timestamp() with a non-PTP skb. KASAN reported the
use-after-free before the fix, and the same test passed after the fix.

The concrete BCM54210E/BCM54213PE publication-before-failure ordering and
the missing PHC cleanup were also checked directly in the driver source.
No physical hardware reproduction has been completed.

On Wed, 18 Nov 2026 10:38:42 +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
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
