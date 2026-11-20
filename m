Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170390;
	b=PIdGqAPw7nW4O41s4lIpRU+KCqF8HqCo5G8PIZsABVm5GBpcULRrX5t1nt8K7jviH9EI
	 4WV0EM3MuNt8TYPtcYrGcB33S575WkGwWBsMWw5BLMVkSYWXziwBsmEoFKZZzN1gpjtkI
	 w9BYcBYpmPfNleo9pRrg6ultavFXkrJG8Hd88QIW1m/90FgSNF4eVymbtA99FS5KXOjAE
	 PZso26w0dr8KOX9MIDmWBnCWF/y5WZr1hRE8ZCJ96zKJfvWexr8LsTUSTQPFx0HLe2WVz
	 B5qRLddkJr0/iRyyVHwESZEZb1SMAR0bSpeniFTShkrYRxkLwhj3gDnP4+PCeGXH8nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170390;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Q9cykivHH5mxJVtfGYRt3xlZL1C+m1wYeWWK/+Ovrs=;
	b=LN48QcVtbwKL9HEyYXmzCmxfoUaKq/scb+KbYgEjoCSbI+xAm1e1SYdckeSCQM9eygLL
	 BewK7/RJmjO+K+gTao9OATfqaJMwb0uvQYujWUldH/cgload3hdOStad2sdAyfwBiB6Vd
	 Hsv1Rf+BvdHYrvY3/CL1HOwu2HKnOuEDszmFUJJES64Is4kAPwNU+TLabVLhwyjUDxmHB
	 85Oj+gM5aQmTCf+LqKqcMlldT9ifrDLQmrCFjXCu2C37ZtJvxysDY2PtRERpsObib9b3B
	 C8dDSU/2UjBwJ9NtkXt3Phwe8sIzOEgXtRHuRDK9RyEseMNOCxmqbqZhPRFDOvXlq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZnaMncg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA4606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZnaMncg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFCD1F000CF
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170389;
	bh=4Q9cykivHH5mxJVtfGYRt3xlZL1C+m1wYeWWK/+Ovrs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jZnaMncglEptk+X7ntBjARCmWSIi5dqMIzRQ80OlPoVzq2f8cr9PXcjFUBHK89XT5
	 EVK7nFio69dLYg0iUCSvG0yyRjpaX6kHfWYnQwDyBJVF88SWt0Ju4iJMVrD31u88nu
	 gDXPpuUfLCnTawVUIf7VHugwNCZbbwtr7H0W8wtx9zkZfiRIj70CqG10Qfc2vPeQLG
	 LG5Eazuk8/Dtr3GItxIb8C2YyS9ExlejSCkhSNzi7AnD2+I/YNPP8TnM4KYJ1VMAwj
	 oh0qXHMg12bprUxehQ0S9ktdQurVEAyBEfTeBJ2PM8l3ON1XPFtl8x9yV5MiEmksrZ
	 4do2Xl1y+RRiw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c10dc41270so672464e87.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHRQGR/LCkokNdeFbh9zQ7VPdjLmDG938UBiEwj1QLQlQg8fy6iERrtrga9+gORvSQPBGvkpSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KGjwNZXhbqebe25m/Lw+B7QoPmqY6CnTPpL6zk8Cvr9JWOHjS
	TlKQ2UIcO48DZtQLkRfySsKt3wAmaXZO6ZlP76rrREvsQOmUPn+h+ftWykQ9nnO1fOcQ5pf1x9G
	jYb8FEo0j0O+WaD3M47NvlIaadY7sx9o=
X-Received: by 2002:ac2:4c49:0:b0:5bf:b5f8:645c with SMTP id
 2adb3069b0e04-5c1bc7ad590mr775346e87.11.1795170388330; Fri, 20 Nov 2026
 02:26:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
 <CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com> <20261119165240.293dfbd6@kernel.org>
In-Reply-To: <20261119165240.293dfbd6@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 11:26:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
X-Gm-Features: Aa3M54oyoQKq0BaLB8-y9ZWsKinjQ9sTQy8DFuv-whOKqt6XJr7_zIkX8m6kfUQ
Message-ID: <CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
To: Jakub Kicinski <kuba@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:52=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:

> > I think it could be applied and then maybe I can follow up some
> > of the comments later once this is landed and the ethernet is
> > working properly.
>
> Ugh, not only is this pile over 15 patches

I blame that on Sashiko's constant "oh by the way fix this too"
and ability to find otherworldly error paths...

> it also fell victim to the
> mass rename of kmalloc to kmalloc_obj that landed in Linus's tree :/

Oh Christ :D

> Please:
>  - rebase
>  - drop all the Fixes tags here, net-next =3D=3D no Fixes tags

NB: the Sashiko used by netdev insists on us adding these so we
are giving incoherent messages here. Clearly Sashiko can see
the prefix on each series and know whether Fixes: are applicable
or not. We need to fix the Sashiko
prompts. (I can perhaps do it if I know how, Roman?)

Sometimes Fixes: are used for "nonurgent fixes" in other kernel
trees but maybe it just doesn't work with netdev.

>  - chop off the stats patches (14 patches should be left for v9, reset
>    after the previous stuff is applied)
>
> Consider the 15 patch rule a hard one.

OK I fix the fixes! I'll also squash the patch that was
considered for squashing since it makes Sashiko happier.

Yours,
Linus Walleij
