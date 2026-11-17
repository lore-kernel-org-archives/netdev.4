Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902857;
	b=hinC8tAL1DaQNj9bz7p/B/77x7O+Tih/0G/alNPhaJcuaKNTcZuaiunngq1OAUKDqp8X
	 Ht6RwMnL439+1eCP6W1xvNFb3uFD69KIziEHK/C2uNo9EUeGvYA2vqc3r/VfvVrBPAZgM
	 W/DddRlw0zPoKQmAYxGtH1IljxaHKhTO2L4jl+BY+rPtncDcrboUp64vV9agY0TYzwjep
	 VxsxZi07PPOQcd9Jp1IL9uGXW3O7m5kg44bS1X1EZjMBJOYz0qMGmcfO+TMHU3bQmrGPz
	 G/Nqi2Cpr6fNegRD8fKPzp4gLG4xUgoMstmMiMdGD3XVN1fHwagej18Z89AdgxxGAKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902857;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1nO9wfOGzMm/8FJ0wVO3Xlzm+SaPhM9rkt4oW8t+ug8=;
	b=qwTDXt1r2AKK1/FPhEx1c4Rl8RvTe0LRx8vinpt3N/6NOo9DVfxhyY8r6TLiwQQKwknY
	 zkTJsPDLFHBqQvtVm+o5E5QiKncdu+Li7+SE+XARaGsnNPTuTuNXiqpfaHy5iwefPn1pJ
	 +ST4SL7AbLhc8VFr/TJQAewBtABYtoiwaCL2jDNWodRP912IoviUy1+SjNAzIekTwpRVQ
	 6jzUL61x00/bxDT2qYFcgRuKBuPIns4bTK7RuJ9BcpsQD7d9+H2YT8q7oldqUhgA1rhep
	 HyhyPNWjUSv9XARrndMgpvniGTtUzE0x7CYvjjv9BSn4Y2fSio59+opAFFuejH2bkHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UK4eex8i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD59606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UK4eex8i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1551F000C7
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902856;
	bh=1nO9wfOGzMm/8FJ0wVO3Xlzm+SaPhM9rkt4oW8t+ug8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UK4eex8iN+Losl49v4sF6PBq1eowrdXGSOKUpiLeVIR3OHkBeFcudg/u8kHZYDaKW
	 AZ6+sQZXUqYlLVaZEqt1vFTGUjJsKJl2LM6GtRWmtKvjd6fONn62Jq8MgKaSqhzH/s
	 TA4M0ZATVVrnkR40BqqzSCxnya2b/3LRDRyTesLUzvUX9qHh7z/nmu0x+/ksG8eqUD
	 KIwWBjrJpsy7ru6w7JH33cSvsQykf42PAx+Y3b4cDIJQy+gb5F5pXR2L3gF3lISa5n
	 ofsdXBtCIlt4VAdDm03eASf2R9Vw+j0D9G68uNPzSqR2fGcPvIkrVQCqidQalOW6Qj
	 /cRDkr0gj5kVA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be47aa555cso4687815e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:07:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEOE3ZOZn58CFzyqfTpPbOVgva0NZi1YfGbqlBDf0lzlvf25n78i9ur/YQcf/GAQZsjR0YRu3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tSxo86zg9NH1j7W9Zuj3RQEitx6Qi/Vcl6KyV63CNqEbbnVA9
	vjlL52qgwkHq3LnFXxGWCAGf3tr65diSOeUuECcMxsIGqB8NWWrdxp5KeTOdDHHIMEIIFJRiRJs
	r9ok6ybWlx8qSvXP8IziLsF/GdQ0AY5Y=
X-Received: by 2002:a05:6512:2211:b0:5c0:a4e:5cf5 with SMTP id
 2adb3069b0e04-5c1709c9da4mr5065524e87.26.1794902855533; Tue, 17 Nov 2026
 00:07:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-11-f55bd43e02d3@kernel.org> <179484034918.3136.1025801687896166519@kernel.org>
In-Reply-To: <179484034918.3136.1025801687896166519@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:07:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmd9rQ2WXuTaD=uBKxT1zyHPkkQwRJd21zwR3r9cQT2qQ@mail.gmail.com>
X-Gm-Features: Aa3M54qnsrt16SbZICbntOhUQbSJRGpy0uez2yHkdpv98km6SO89_1CCZ78CzCY
Message-ID: <CAD++jLmd9rQ2WXuTaD=uBKxT1zyHPkkQwRJd21zwR3r9cQT2qQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 11/19] net: ethernet: cortina: Validate RX
 fragment lengths
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> > @@ -1864,6 +1865,9 @@ static unsigned int gmac_rx(struct net_device *ne=
tdev, unsigned int budget,
> >                       if (!skb)
> >                               goto err_drop;
> >
> > +                     if (frag_len < NET_IP_ALIGN)
> > +                             goto err_drop;
> > +
> >                       page_offs +=3D NET_IP_ALIGN;
> >                       frag_len -=3D NET_IP_ALIGN;
> >                       frag_nr =3D 0;
>
> [Severity: Low]
> Is this frame now counted as both received and dropped?
>
> By the time this check runs, gmac_skb_if_good_frame() has already counted
> the frame as received:
(...)
> Nothing takes back the earlier rx_packets and rx_bytes increments. The
> rx_bytes value also comes from the hardware byte_count, which this patch
> otherwise treats as untrusted.

This can be addressed with follow-up patches if desired.

Yours,
Linus Walleij
