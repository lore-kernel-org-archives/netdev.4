Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218049;
	b=iWTKV19+DRZLA4022mguWzxQquslBfmhLWkaqZ9VDJhFEOP+P18Wt5Lcqj8KxmJPaiWB
	 rjye4lkGY3BcapCcOv4G30c2vi29Z//nvCt116Ep197TBjRmG64J2CKte0iK85gY0NIm0
	 KC1TuG0Z38qctC1yv7o1G5zKW9DmSgShHaHFHBmvgvlBe4aw7O/v5QhIX2myLOYxw9W2A
	 WqdysgqIMtzVUBHio64vE5oknEUnZLeQS7RVjEMsW5JAM7aWVDfLERoBHqThhfeazIltt
	 PNMXToA+8ez/1UCq6PZsYYE3G4+iPuiIpFEE8EjXAj7ucwuBcc1iF4NT4Z1FqhTKbEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218049;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0926q6E519qhJndH9WtPtKIA6ZPUyX35AR5W7ZOXklo=;
	b=TByYBJwTuDmb51hlzbMVa1txFm6ZmLpcHHuOvuf/PCW8m0mJZTz4rtzkDHDddIDgOgfY
	 c1+Y675OhTUbvMsIHBTvbDsTpGOgq7EdaKSMYKC/iiUsv3aKbXtnOBJC2tQ1nuwk6Zeg4
	 awGGWbXLWXXmk5gMDZYt+3Dp9IRdIf08gjunyXVIrbFGIJHhqvF8AO7IHCGOjaM91plzO
	 8gMGfQZbv9lt6F1A8U6ELzOq995DRDE3rasgyUCaBdysIZSqS3n3gka0Csb6WE+FjzTpW
	 fAwAiHDjLsZLcpUfBBD2amRqIrElXCOyToOX4dJxKjBAYR5gAXzD58Lbl55cLft0pJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJhOVh+N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061B606A6A6
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KJhOVh+N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6855A1F000CF
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218049;
	bh=0926q6E519qhJndH9WtPtKIA6ZPUyX35AR5W7ZOXklo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KJhOVh+N0IuCSxwjeODFJYDKCP6Uw2GuwSNzKofvJF5hjSw2F/+LRJlursAErkeJV
	 k4PhHCYi0LTDM8UruUzs8lCwY5KHuHqZScQWAQVjZ6m31YZG/fS8TSnhzMSUcyG7l/
	 GDOgUhhkL89B/DDQScFpeIkmqGHBHEmniwre5DWrqvtn0+01TmVjpA9UPyY23dUiKb
	 d/1FfKGcYNG5dZHKhtcMvrfv4+19dHOCurkiG8GrUKAVhTGdXZVROawXfAbfzNQ1JC
	 OdwxrpEXfEiezJWgd0Ky1Ropf0CFuJWWJBdTFnvzp6lRI2ydlX911gknJQeD6qlUyj
	 BpGoPbwC5IfjQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso1672666e87.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:40:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH0RjqQzghFY6C0n6W6OEHjXfw8+2MIV6jvK5X69SIBBNmRpR5jHPH5/jygnTeJBuRb8d7Hoks=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sbI/PrM0grzacyUVuqADurI0LREFyypFKYcl6VI9muGRayG0t
	sVAvIuKpZiEQIeaMdLHgli4L9MFAebnVSOvoJF5TGZViZNXhzzveKQMEgkbZpPIrSr0Z4nZ6xlO
	Z1vZJ1tyTriJHoMwHkFEHXmckn0FdkKc=
X-Received: by 2002:ac2:4c47:0:b0:5c1:56fd:1890 with SMTP id
 2adb3069b0e04-5c1b7c9623emr1578877e87.38.1795218048105; Fri, 20 Nov 2026
 15:40:48 -0800 (PST)
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
 <CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
 <20261119165240.293dfbd6@kernel.org> <CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
 <20261120102155.19670caa@kernel.org>
In-Reply-To: <20261120102155.19670caa@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 00:40:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLngy9srWgH2r5AyKh9PAOMGtkbmpvz2moabwHWLf9CR7Q@mail.gmail.com>
X-Gm-Features: Aa3M54rtEzcOvT3NNM-DDGYoGIUL_7q8-gYeRO6inPbkTUAsIx2b07Vba7unTLw
Message-ID: <CAD++jLngy9srWgH2r5AyKh9PAOMGtkbmpvz2moabwHWLf9CR7Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
To: Jakub Kicinski <kuba@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:21=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
> On Fri, 20 Nov 2026 11:26:15 +0100 Linus Walleij wrote:
> > > Ugh, not only is this pile over 15 patches
> >
> > I blame that on Sashiko's constant "oh by the way fix this too"
> > and ability to find otherworldly error paths...
> >
> > > it also fell victim to the
> > > mass rename of kmalloc to kmalloc_obj that landed in Linus's tree :/
> >
> > Oh Christ :D
>
> None of this is funny to maintainers on the receiving end of the slop
> cannons. Please pay attention to what you're doing. No excuses.

I'm sorry, I just try to see some light in the slop, sometimes
that is indeed hard.

Linus Walleij
