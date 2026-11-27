Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795746674;
	b=rlgQxaXrBsa2nV1lrRnALqMvMNNJxDcB8H3N1UMSOOx7cEMc1wT0JznDCGKsITkVQLJv
	 tPLw3HXfKjPaRnaqZNu39oSWFiHD2dSX9mVU2MVcQTNcv0Io3/fuoC+dzu36ksiAYHCcU
	 AQGgJMHNedtzZab7lgy6mzoKyf5WxH2gAAFttCC0HDt/0fMFWc0mgxvfw+KqCFZ6KxJ5c
	 2Yb6TZGH/muqYsRxn2hNhAeC1mQuGJLFTUlxhOb/OJZ7NINOfTlflsDI9aZYOOHYdEwrr
	 IxMt2Q4+hZisJ9EUWxsB2+oXmqg1no+4dWtIsMAaMH/jwNaV/AkD+tSP6YoKMUrwYcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3mvD5SHJizr8aoJUr14kNfOc0+9+6jccMe+xxh5ocXI=;
	b=skOjE2oKJnXDgOhktO/URwyYgHsvTY9OaEiSfRrUvmSVFYjABpSuzJe7ZJ4IrfXUgWhG
	 9dM5xb7YB8fcJbv7veCV6uGvwi3ugqF9KTufBP6JumL19vGvWhRFAb5WG3K/YZSm35peO
	 w5z8ordJswZWzdv6tZaW/djmI1XjgQfBX2uilMydYNxIUgNU6Red1420Dl/cGrUQkAPnT
	 DMkCGjRb9J/L5WC8jQUL6qxVWZFgbYvxqsaWZ6QH67Vl0jy61lNY4pm/kgDCCXfJYnt/l
	 phr1siNs+LcuciDe5pQ4xQDKhn9ihw0DrxiaoTG1K7pe4HbdQMw+KrAuAho8FoC1SsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qERfAWsJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136F5606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 136F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qERfAWsJ
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14f7768acso6136597e87.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 18:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795746672; cv=none;
        d=google.com; s=arc-20260327;
        b=OuxdKolNzdFzwi/BqcN0XmuhtDd9/Hr7QBKnQdmagIAFDbO/Q+UL58kmGcCDhxyj/e
         vF0orC1gCZqOKf8m3iJ1R4St43kj5ZcypCzO9Ywl5PdcrwDRZROZQNR80ajDCyv7WDwq
         fgBhtKELTPqCGnjR5kIzRnEF1pdfHj8BysakUDuY3lTCTEEYsMKvtUsD3vx0dioODJb5
         R6jWQy8pqTa7qedMnWKglUmpThGFj+BgbC7tQIA7WvaqvyGUDWDlCx1KnSUOCMdHDA3I
         YyLLJ2Dk1UKygLb/i+tcgSQLIs2l0np+OGr5Zl0Jq2bvkzqKggFdwZ2gUo8HUYVwP0eQ
         4wog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3mvD5SHJizr8aoJUr14kNfOc0+9+6jccMe+xxh5ocXI=;
        fh=gcFIvIcG7RKY9uXiIAs2XkZBnjSiCnLwcZE5JT7eNuY=;
        b=qPpYJjG6Jl4ruV7qRrb2RaXXi/AYonr+5H/0zmt+wehTcwnjyFa0ynhMPgMX0iwmRI
         bjruqW/KBSMg5YMNUYhzN8U8vszizoGxSkWG4PZyNRYnCXY0AqjhvNVXa2kaLfOTqlbQ
         09ibhBqfgsb436VtokObkwt+xz/PC8uS0u9UpkXo6XaOIeRazvbDOTkrDB4lNycPz7Wn
         WOpJShBMy/RmFRRF5Xs7zNHIG2EdEl8sLOVKCzAuQ8rUuwZmUrQhxisVIB1JLGdP5nd3
         qM1p6xKo2F2hsXvjFw16TsVpueM728pRu9YDHgGgdvbEqK/BGGhdjF0gwajSUPdddGfA
         23Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746672; x=1796351472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3mvD5SHJizr8aoJUr14kNfOc0+9+6jccMe+xxh5ocXI=;
        b=qERfAWsJLcMKn5W1+KMjLc9CebAaBdsi/1G+woZOLgB3/twU0XYdloPUN2mWvrM0lq
         ZmjkPHBg6hE4TECOpPUuME67pi/+kIWTh6dKsrrg2kwClDgMCrryU3PA+g2T90pkxul4
         hulvBnFR65xIfs8Qyt50nkDQB4iBRRfQSVDpJfveyavzGjbuZdHPI/Q5Gx3Pv4qg64pr
         twJ8niXamQL5zeCiMh0Z0HwTWL19o5A2ey9bCjlwLKyqIEXD0+mzNGfUAQ86estOQGE5
         wuoacrdvsCesOjmpc4qxx5bixMVTpnUKCsyNl9aIRxasZxnefL3rulkYEJIQHET95FOZ
         8oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746672; x=1796351472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mvD5SHJizr8aoJUr14kNfOc0+9+6jccMe+xxh5ocXI=;
        b=OuylK/DYqecX/FbnxY12P0YXjVK3cjfLE4dWRtOlxsnOIcF3y+Jj1EY5cbokVUWt6Z
         153z/rBA+6FEhP3uVf2VSyD5SttL0ghHMSYBIWXJXSdRPNxT1MRQhCONhzz4O4U/UaS1
         DEslHiiOtlnyqVXeYrttPmCyjAAB+H52Fdj3+YbQp6zpNrcoW0p8ZJ4ctQ8LPP+HvrBY
         EwikdQHUqx9Ao76PnjQilW4gZLOT34Yh8V5Pn26ysR3cHx0rBn6VgKI+NsDERsBSTpe0
         USxwbsCNVt7my7a1/n+2dGwmDzjNZyWh93HK4z28UX5Hq3vaxdFxJaUw8HBrhghm0VCb
         bGAA==
X-Forwarded-Encrypted: i=1; AL+hErFFMHBEUuQhY7SM4Sc++o5Ch+rSvG4YvU7rL/jqNL/+dFzXGn0A3/UXuqDeenS7RXR6ctSV8K8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ls6XhzoBxmhBRzXizA8IdzPb+8CFkp+eUSvyTiNe1dz/VEnW9
	+2wsfKhkggJ2VLgQg6zo6X/vzV28ZRumv1ciQP+gz+nY9QHT2lA12cygUAfigbXKzPhaYr4H0aA
	GbqxmmMEsYMEwYLTN/OuYOfaSOId9990=
X-Gm-Gg: AZFdTZeqwA1tB20ge9+crwcbFnQuPuDlop/DWdfFgNoK9Cn6D3N+5mHyo0RyyLq1zE8
	KXyqYzMvHQ7+Uuq98zAAXrW8/A/clwBE+28doIfc+r2Wkyj9304Ai+zTLTkp5yAXAC/4hEEU7tD
	bVEVMIKV+VpPJJA+OUIsnSbv7Z6d6XQDf4p8flHypiIXWAf6BS0ld90GBMw6MAIiw1RNuOocp7N
	6Me8kBlw0wQaZhv+uJ3SIXBI93ql8hjifN+sK1blFRaCNB8EI/XMboouqxntG9Znx94+KGoqa7Y
	YDCmIXUgwGQ/Lma2zehVvCuhKWKvas6KKjN6x0i1soYZpP4AMlHz024qHIFvWVjuyUF1xwodd5W
	7OcJmtpUQikDPn5O0HVGJDXK2xADGv/01oldZrVdobtF7Abs8cb9B500qRMTYlmqDKhqNy8bLa1
	AlR0GpcfO8a/YkV6QpMCQxMLS00wAbeKZo78bG/MFLtBt1j9O2pdA=
X-Received: by 2002:a05:6512:b9d:b0:5c1:4f5e:4b59 with SMTP id
 2adb3069b0e04-5c1bc844972mr7043793e87.58.1795746672038; Thu, 26 Nov 2026
 18:31:12 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179562059260.3381969.13546710565371160648@gmail.com>
In-Reply-To: <179562059260.3381969.13546710565371160648@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 27 Nov 2026 10:30:33 +0800
X-Gm-Features: Aa3M54qQCzHWtPap6VwRTDk3zW_mgnH0uTaijvFXX22zIZb75qUgadyaUbnQ8mk
Message-ID: <CAL+tcoBzM3owy4tnRWW_ZV+0Tq0R=_GnrigL2Ud=2DhyviUivw@mail.gmail.com>
Subject: Re: [PATCH net v3] xsk: keep the charged page count when pinning a
 umem fails
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 10:08=E2=80=AFAM Kyuwon Cho <kyuwoncho18@gmail.com>=
 wrote:
>
> xdp_umem_reg() charges umem->npgs pages to the user's locked_vm before
> it pins the umem. When pin_user_pages() pins fewer pages than asked,
> xdp_umem_pin_pages() overwrites umem->npgs with the pinned count so that
> xdp_umem_unpin_pages() releases only those, and xdp_umem_unaccount_pages(=
)
> then gives back only that many. The rest of the charge is never returned.
>
> A short pin happens when the tail of the umem area is not mapped. With
> RLIMIT_MEMLOCK at 16 pages, three registrations of an 8-page area whose
> last 4 pages are unmapped leave the user able to register only 4 pages,
> for as long as the user has a process running.
>
> Unpin the pinned pages directly and leave umem->npgs as charged.
>
> Fixes: c0c77d8fb787 ("xsk: add user memory registration support sockopt")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260421172951.A7052C2BCB5@smtp.kerne=
l.org/
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

LGTM, thanks!

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
