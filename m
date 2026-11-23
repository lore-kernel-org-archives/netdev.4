Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468096;
	b=wCg26fwWs+zzSTLLEQL6MHap4W5jKUOVsACp5wf6md4DrxhvRRJpKv8OmAd8HF4IvWPw
	 eRxb/Mwbj4l3VjGcf6GvEsXW4jsphE8t5/m9S0y1i7Ny3UztYeZ6qweE+jDrUhS1bQNsI
	 ZUyOkB4/eVmotQ10uRjgFqx3t34EL4cFfblsiPRDQGLBWLiilF0SYSJ3nbD8ynfY3j5iT
	 7C2vQMSiNjfaxIj5IQ6AmbRYUmuKS8MduI4uzOyAQ7/9uiXFpc4NPgukP6DTYAzk5ozvo
	 xyuDt4bkgYEufN2s04jchr2Av75OLqGUd12kcv7X8vfGUEsJIJk7Y62rH5Dun8Nw5xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Kdq8XE2WD+zE7mBxC4ot9PCOO+QuZNhp87JTabaeaC0=;
	b=3eNjnnSgwV6gvtEMSuMQaQnUo5fPfBjECVFf2op+Xc8UVEkO1ncMD0+90fkLMEX4eoi6
	 HLGuKSBTppWa7sbSkWSBBibaBazdSzJHBMhMr0iwsMXFmK6wS1NC+1fYm1M2okExCn1x8
	 gr0fwvE0hBLFU5szfZsFlUOAI2eyUXuwypPApXmFN6mA5pb6+noQo7hF+zLAenyzSx2nj
	 3Si6ioE3XKrKcJp6SWxc5hIyFluWuLNsUzSt5f3lws1SxH8Oi6YgBt12KubRhdYdP8J/h
	 7t7p/Yi9oThLyRt8+URD1849eNX+T4LBklgPdCh+5IXNhs1eWbrhtAzhNqf4tK2AU5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="onEe/Mw9";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AAA606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AAA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=onEe/Mw9
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so3625841f8f.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468094; x=1796072894; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kdq8XE2WD+zE7mBxC4ot9PCOO+QuZNhp87JTabaeaC0=;
        b=onEe/Mw9+fNgrKvUr/zqgx5v30AfvV0HTkhHE6tl2Z7GbiFvBxMllygfF2K3Pm6Juv
         A7MrOts1iIYgp6t49Uv4vN76A9wsGbqztd+tIxpMlxsFOCxruibTH9tRY5hnU2wL/3mp
         +q9Nq1kr51k7oql7DGV3l5mJkff1Qpu24KI9tLI7wT+EZ2j/QM/smAtkIhuT9H095HF0
         kOoemgpCzG4Zej5kX4CJIyWOtK8mNKPqw/3P2gbnQuytFYrFZfBj6+zJif6Fc0/xhqbm
         cDCxBFL0QxkjazYd56B8oJw0aAtKwV4CsZij6q3nNjeqVplBG1Kh9oUd9M2JpyhY/eQr
         /aZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468094; x=1796072894;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kdq8XE2WD+zE7mBxC4ot9PCOO+QuZNhp87JTabaeaC0=;
        b=Of1/Bu+c8Z0arsLlQRof+EcgSHI8bdlZ5Q5a5J3R2D/5Mlso1oD9YpqHnFl+azSrUG
         x7gd1sr6ZjV312SfFiy+kyIvJ5MA+pL4lAt097uUcEk6N/VdFfT9rpYfoseWR57JjNPu
         4N9NdxaYjcTbheluC/ZQ+XIPTVZw8WYQXalRLkUuNW5nDSXD6LQCZuUhfg9TR/dee+sR
         nGQDWRiq8XgdkGj1LAtawmubnGaZJNInl93ilEYzCLl70AlTEx8IjiPQUjQqrHxKt9Vh
         RFQCXLqYM7j5h3h/j3m1mb3wquuk/ABM74Gio5BeQQ/bmmxyDLZJiZaY1BW6pvOkVDnk
         vuMA==
X-Gm-Message-State: APuU4Z9ljMNwC841Y410WVd53K6Si2tylI8/lgwVKes6C2ZvC8xnwb6b
	jZpRZGwOtXDw860rQymdEry/B5vVATRTacUdSMbqnj3M1SRXWo0UdcNNBWm9r+g7f0k=
X-Gm-Gg: AZFdTZfEeFsAyShDIo6S95X4a9BCPBGvHYRFJgTbFotUg5YR2oCrVHEiiabpOqW2W9x
	0I1acOTw0B73p76DFiQrpxqQUOgBdhLOM3nXLbQfb5rQ3kre8/qkB94OnKo5+yUSewMbxRwoJhz
	rhS2xyL0qmQk+JZZLEGR5uR01o9Tb8nOKxGwCKMstxFGwD5fbVph2hyiQ/HY0tpIW4k3W2pNpsv
	B6i8snNhg66OFOwPm6ouw0t4NMpEdpNazNa2yTkzP3ut1HbLP6nsgmq3QvBvdWnEUILBsRYcdpQ
	BInFHSiCgdVaqEPH/vRrF4qVb1ONR09PUNdFqRZhbmIc+UDwLY3GOV4rKkFrqtXh4wLoel/eJ4t
	upNOPPLi/vEMZKVnUWF/QQCNjG+hW9eHZgMiCdtEqvzpRoMPyWq45T/XhDaJkhWFhbq2HNF+GvU
	oIACIvSkUeF16l1gSrFZG8Z8zTfpifwy/ShJbzHnxlFeqKe+ke5xtFGXwBdoK33i/xp1sueZco5
	iz/96k3Wxigj4FyT+sje56ULHdyuGtJd6uUGP9cYCWAK2ddbqmj/HNMiOpXwgMtPKjl/GzaK7za
	1s6jnsuvL2G0r0U5v9YzuWIm3hNCjB5+17qByUyZfZKaFdVp0eHudx0=
X-Received: by 2002:a05:6000:2382:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-4abab6de621mr26733936f8f.6.1795468094420;
        Mon, 23 Nov 2026 13:08:14 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm25636958f8f.11.2026.11.23.13.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:08:13 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/3] Add Cortina Systems CS7542 MDIO
 controller support
Date: Tue, 24 Nov 2026 00:08:12 +0300
Message-ID: <179546809264.4063936.5870536670274625147@gmail.com>
In-Reply-To: <25226a92-b234-4c1d-96c8-24ab5b9878fa@lunn.ch>
References: <20261123-b4-cs7542-mdio-v2-0-30465e831853@gmail.com>
 <25226a92-b234-4c1d-96c8-24ab5b9878fa@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Allow at least 24 hours to pass between postings.

Understood, sorry for the quick reroll. I will leave at least 24 hours
between netdev postings and collect further comments before sending
another revision.

Thanks,
Fil
