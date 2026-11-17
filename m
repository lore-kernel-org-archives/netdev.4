Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907308;
	b=xlM/f2ObTWL9OB/FCwO0E8FfjKhNmoTVwOo+DEL941P63roLSSk78kgBdF8gFDtT72Pf
	 69FVf/3qhU3dEwzF0IbsLCWlV2M0pqU9aiaiUZyTFxjvZY2IkM78DOUtyK557SrKSGL9l
	 KNsFX8RUPHIvKZA8da5AVhRDZXlPCNXzRSXiYZ6l9Gk6OpYqemwylE03VqnUqxKcPgg8x
	 jXWSvrJ1nK8Tjt1eMqnWwrEs4VoBcLTmQwwlUVzZhRwlWKSir4qToeRkZDZBLnSi6VJEf
	 5SsnDp0K++oClmVNlePsEzSv30iVUb4Xp4hLFBnpDDKSurHNRr07E2olgUUAXRL83QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907308;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5jjqG/2QsTeJ42Rwn/Dxd1No5ky25cRIimeVBasuOp4=;
	b=HXz4JY6uwJCO8yH5H/HuNCfPu5LOF42C72C0WO7p0e48MB1eftTWqlsMBsowF+u6j4If
	 +E7/q8UerD+qT+08Ybx1WUMlG9lNHbkSCkeKAVQ8ebODcnKnKSGEdUy7+93cowoaqj+te
	 2LDWkdj4ZcHBG0oey92jZMQucXNEkWv4CCqQGFdlzHyvgQ8jMBqiNU0nY8RbDMDLkexaK
	 6kjq16iZ8XN6peHfMX/8VZbBFe1BTC2nKew6MzALwTbmzD1ZdqwKWFL/rFKR753YorJFs
	 bGyQfrRh6IfdUoW14nMWPeEnv0P8l9NdyGWqOhauGxn6JCZ6rTkYalSNgwWTZOgiUIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ek3RDsUJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFCD606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ek3RDsUJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DA31F000C4
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907307;
	bh=5jjqG/2QsTeJ42Rwn/Dxd1No5ky25cRIimeVBasuOp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ek3RDsUJN6DWo/1ypph4XujZASIGQ/D9MJYp9MO1mCkLYj4/Y3kVzp21wWcSBfpmz
	 mEuzwTgdwCv1V7tqrGp6Z096bKAo3OKeukr265UrsdeUMazjVQk3HhP3gceXvLxXN4
	 ZKf8LgGZX/Ch5V5kjAm9A/1oBaiWXaVYSyHHYpv8a1iPXi4w1WtSj5fjl677Xq9oJ6
	 A0igUybMrbxS+OkDMRpHqG3UXAZu3CesUtFqjwa8XjYmSubxaGMVOH2YrVUyxq3nik
	 Slx7HFMlENnGnDGjbalqKeZfHZbOOCmW85JDldNeYk+TCVuH5RnyVfTAlfzlv+CUNz
	 mqdi2HSMT9cDQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-499f20c7054so2692291fac.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGmEZVy15hTL8KlNtHgqtHQIO2kuO6YkaP78tFFovrSv9z6ziOQv+iVWJOews0A+gzdBOER+TI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F+Z6HNvsKsYhXDbw22H1+F5fO/A4Gn4pNo8teLeHPHPrMPYe6
	oC1vWVo3vHMJrk2coyvLNVmUpH2g509gSN/hRDAJ4cAAswaUIxNm9AmJQ35bcsxmSIhuzC8mQdj
	srJgJaWoBq2kJN3YnDLjTroiua+knrXU=
X-Received: by 2002:a05:6871:291:b0:4ad:5dcf:b8d6 with SMTP id
 586e51a60fabf-4afdf28cf75mr11608945fac.17.1794907307195; Tue, 17 Nov 2026
 01:21:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114155150.235743-1-edumazet@kernel.org> <20261116191750.6e5bf31c@kernel.org>
In-Reply-To: <20261116191750.6e5bf31c@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 10:21:35 +0100
X-Gmail-Original-Message-ID: <CAL4WiirYQSKcGBbAppnPJAh+8zSAjHa7V8bGqUXUtr11xERbDg@mail.gmail.com>
X-Gm-Features: AclHuK9e3d-cSgXA7lWabCz0SCDpvg9ZY15X50rwnetAGG_ocetAGQdF1QHn3r8
Message-ID: <CAL4WiirYQSKcGBbAppnPJAh+8zSAjHa7V8bGqUXUtr11xERbDg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/5] tcp: better visibility when receive queues
 are full
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 04:17, Jakub Kicinski <kuba@kernel.org> a =C3=
=A9crit :
>
> On Sat, 14 Nov 2026 16:51:45 +0100 Eric Dumazet wrote:
> > When a TCP socket can not queue an incoming packet, it is currently
> > hard to tell why, and how often the stack had to work to make room.
>
> Very nice, no more kprobing needed..
> I took the liberty of removing __sk_mem_raise_allocated()
> when applying, it was left with no callers.

SGTM, thanks Jakub.
