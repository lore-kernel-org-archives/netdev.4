Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285779;
	b=NNR2qv2ZNEHi13eGrV5/WPXjqbqYc2+1hSnS2jnXAIzIaDTTUrjuCNeMclIvmTkc9z8+
	 1I+S+TOyp4CwI4GoUSOTbfmo7FFjS+TFn8VrQiAqL+IseewLv3VYUNTs9OJ27UKDx04gm
	 b8Q3tvwyOEy92cTzTV9Gt2bCC/Qn6bSEusgi4v2B8gQ1/uXCNGXDsVxcvK2Z/i5JjeYAu
	 j9cVPTB2VGwlVXdFwnGU38fp1S4DnACewRcRw4pRAwu0FvnGz+1VNkGzNv8jYCGG/A2uf
	 wlsGASH6NSRTdM+SmcGyPuJ8OLMx5RcluYK9RwGyY74BjJNhPLWePMLlM+BysVQkNZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
	b=NBDbQib9rNr1up9iPhZhRH8QjUOSRrM2Xf7cLqZPoNLmWI1Yf/8O5FDND6F0qMOBfRWB
	 wsRLP9CEUVYILf/4U6UufieKuUi28voxMdRklrDawm6rEBxKKVhjI8m7Jw7Ct0YGH+gzT
	 6RwN5J523fJdBC7/xTMZTW7fQK/UryLyPPurOCZHUoFx1NoH6Qn4VqyEbq5H+Po3vNlgr
	 qaJGJzISGuotXXUBE0eeGrENg3lPg4Qv5w5VmjwPKK6+5FG+rPCs7RZXSGN5OZfJRgBa4
	 ndHyxgvdhOeALglM54QXcfKegRRgM7pSlhoReNtusEQWrNZ1Pyk3oijAwUqobO27O8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWZNnK5x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D902606A333
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D902606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWZNnK5x
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67dae7d3f7dso2525589d50.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285778; cv=none;
        d=google.com; s=arc-20260327;
        b=NfncD79UHNhY7GUO5wGa6VU5vJX5x6HYAIm3oCLOUxj+tmSKqghiAC/P6WW0BgDp0o
         l4fzKUgVU5sCUoaHoD2F5+5QHfEmY2H84j2UjbkLFIouYp3F7kQE3R0P3v7BlNiNUHgG
         fDgZMtIyZgZm5cmcCfknexcrHZQMmi9Hc8Ee+DUuoGeRL4VYeqpmzwyyht60d5+Wu7jB
         dhW6JZ+94de7oJTiTeV2RVps8/J/gsBQrgjDFNw9SArAwrg82lgf21tMTS4TDwOW6y3p
         sj5gKsU2nArzEbg7xBywE9IIHifVK/Ag5UbK7xnCfLF3OMewWPSGl9MB6eVGAUH8MJf3
         6Q4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
        fh=9+Nrt1nY4Y98qkRwTswHI+6LWhaHS6AqyLxSGs+LyAA=;
        b=ZhHFKrIj/ZSYCIOQHbjtuL2OL0EszllobUDztnCgyDwegzBzpsBOGHRcwnyAdBGele
         lNHhrdmRrIQB/wtNvTUAonHFT8hfziSHxYHDSDuYYgBbVyTYg7aSCTYC49dKdocbJ7Jd
         41whxBXiSG3gfbEzo/vsOzeBH+sYoTTLEpv8A9W3w8mE9nWfQw4pJbblAWJI2vyZjsrc
         BQJYCJ+h9U5qdwbnjZTmzej6xu1J5Nh0lEVM4EUUQRl4Er7D7si2eLK7dznhN7ZM+fiY
         kH9/0Sx0ejzKlPJe9vfFvQSUVEeXun7kRiqhyY5QUrvSeDCVgaewoy7BOqn8pZffwgbM
         3rOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285777; x=1795890577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
        b=bWZNnK5x3F5FBrc8XhkPCBtafzaCS54wkPJOnb8N3PHGUqZ2BX0pgjxNIN9HWDVyoq
         Ztl5ZnD8WC6TmXK7/KoPIvGGfwQRyfkYn5nXXq6b+IuBXY/3RtQaF7iG4xQI5Ywc87LK
         +u2pef2mwGo+GwP2s46dkDT3bPzc1CINJ+l9E6qYzmE5m4VZmIs6fR6CarS2/hbxhyj1
         OlUQK2+kZgAlIczrS51n9TotmAa00gIEQAS+4Sn9YL7FkafXxB19QUxx6arMmIoEbD3T
         mB1rMxHB5cQcCwy8yYEvP4KqbyJyLMsvVNcrIhb3fzS+WTRze1UX+Hv4myd8fIUYSH//
         Tdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285777; x=1795890577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lV1mlfunlG0Z+KIHHP7dGizpthdTB34pPO145VjCj0=;
        b=xi2khLLnIwnGhhDss7Tduaco9pwOcdbfm+yL75aeiiLgvegW8E2shPQKCU2UXz7ukm
         vg81JwsY60eI0ZPeOmCFfDzaIa+eDaICde3BBH1pXQCwBJkAd9bofG96GdlutRDnqK7n
         7TpRi8BhmcqaNHvE6kDXvNcplN7LlbOTnnakrjSoUtErkjxJX3MsRNQ169fCzVUK1OWp
         PpNrU/H0DZ85om+0+hoXOAyFx4EpHSk+jizyHkAInHaWOYjHtFz+d1ag8xJZ3eSt/VUH
         xbfu5l4+rbzTDcaKY7MZ88lwGUKRlC+v4nANf9ziuz/190aPMZXymiQwZ57vk+Q3fqE0
         LcSQ==
X-Forwarded-Encrypted: i=1; AL+hErHZeZISzlli/XPG9SlHvHAHznAxUWvhkayJc+w61hcl/aUOa6wNjGoNT/+N0VzDFYUO7KmDEwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z81I5Rbpu43GNY1ZjkoeZdQxBeugERMyFPMf6TeoJ9E23UJFI/c
	1VOzhR6FFP0CbkQre4Mq4nbsHHfy8tGqoYitHoH8Zdo4NnyW1g1jV8rZVQWR69wCehp6wEckdNY
	kGJhzo5Qe4PgL7UguIMtbVNtv/LWqy7c=
X-Gm-Gg: AZFdTZcsVnLPpgj8GCyLKUKT1CCRUzriK03C3juRVzyRe4+1MioLSsjWq9wbLCZXO8B
	CgJWkkB53Ee4cauZBJgAMP57B5PoUgCibatvOzq5jAnFXGtapW6PtajkOYGRh6AtW+AkGj6VAdO
	48b/oFRK3+m7xiPVsViuHyDVovPAXHiMDBzvZq0MBwEo2VGsBWoHEw6bN9KJXiF+719O+1z3OF6
	qy0Dd1E3/fKHvC0SrBtm/KcEL7FWdbMQsSn6digR9ZSH9EkYa1jk2f6hxFQnbq4FApcqT7gylZT
	AZapEu5IURgniWgoCh1mweuTkE1zv2J8bEVx4YGz2dLm2PrENI/ltdX9U8QUhkTAGnUjk2/+a7O
	PLUaCYMZf9SAWr9OGL2/FieoRnHg3rUjs1YKu6GmA00QqMZ56vQ0VPbbMw7doiyMpeeZRUOLX
X-Received: by 2002:a05:690e:4086:b0:67d:ac2d:d80c with SMTP id
 956f58d0204a3-67df42b59damr2470765d50.4.1795285777648; Sat, 21 Nov 2026
 10:29:37 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com> <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
 <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
In-Reply-To: <c848fe82-a534-410b-80a6-8d7fb35ab0ae@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Sat, 21 Nov 2026 15:29:26 -0300
X-Gm-Features: Aa3M54rpFSxZ7uu4Nu8kwXj4vOO1ZNNEv44XG4NuzhczSlabI7eoqMHvRg-6wHQ
Message-ID: <CAK+kzgxmgdFoBhzNhfxB29yS_Hz13LOm7rZvKb6fpyVKb8kwdw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev, o.rempel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

On 21/11/2026 Mieczyslaw Nalewaj wrote:
> 1. Does a non-zero value written to 0x0851 on your board change
>    anything (PCP of untagged frames, or the register reading back)?

Not yet answered: on my test image the switch registers are read-only
from userspace (regmap debugfs) and CONFIG_DCB is not set, so nothing
writes 0x0851 other than the baseline's 0. It needs a test kernel that
allows debugfs writes; I will report back if I do that.

> 2. Does the Realtek API in your stock firmware have an 802.1p
>    remarking table (internal priority -> PCP, with a per-port
>    enable) for this chip, and at which registers?

Yes. The family D functions write the same registers as family C's
rtl8367c_setAsicRemarkingDot1p*():

- dal_rtl8367d_qos_1pRemarkEnable_set(): per-port enable, bit 12 of
  0x000E + 0x20 * port
- dal_rtl8367d_qos_1pRemark_set(): internal priority -> PCP, 0x1211
  for priorities 0-3 and 0x1212 for 4-7, 3 bits per priority at a
  4-bit stride
- dal_rtl8367d_qos_1pRemarkSrcSel_set(): the remark source, 0x09DF
  bit 2

dal_rtl8367d_qos_init() clears the per-port enable on every port.

One thing to keep in mind: the remark applies to every frame that
leaves the port tagged, not only to the untagged ones. If I read the
baseline's priority decision right (port priority only, weights
0001 0000 0000 0000 at 0x087b), every frame gets internal priority 1,
so an inverse table would also turn tagged PCP 5 into PCP 0, while
today tagged frames keep their PCP (1 and 5 measured). With an
apptrust that includes PCP, the inverse table would keep the tagged
PCPs and give untagged frames PCP 0. I have not tried any of this on
hardware.

Thanks,
Gustavo
