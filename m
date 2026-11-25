Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612407;
	b=fBezRYbbJG2TSaHxJAv2vO+mXHGGvsltpSDLFq40x1o5UG+KWZ78gTmF6cnzCen9sfhL
	 Fa2GtjZzBkdU9US+4Kc7LgoaPKNZ7PFuE0xc97EnzWw5iKtHVqJrFQc0s0CRuppig0n9F
	 50QIQjrLGE/vSqj8aWs2+sSQrJ/tJqQqLb1YSvmNTP0ionevOX1ac3EQOLAiFs3lHGz0I
	 Ui3t1ByOr4xQLkPrvDtg4Tl+mh9wS722eozUh+nuvqgx8RvRRUjLCs9pmkEZX1TeNVuf8
	 TOu70NY/Q+0JI8VdQSfsUzCAOTXnegxEHcl0zXFmkHvBtPqAViyUjVMr0QDFRLShOjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612407;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OjF6Af/faBBFYNNBnWEx7/8qXoWkcGSz+yxf8CEdrtE=;
	b=TzF2e8dvOhsdzu339blUGlWf/lcV1mdheQ6n+4N0+sfdi2wNaIcCoOFT9qHjCgSk19tN
	 7o4RBW0PQHuxqfGF22/bsLB81bNKmflFTObOvHUbCU1itRigXa5eHqRB5Ulh8Gbf0ncma
	 1+Ga3eZrzssnspZB+psEel7I4JWb0w2GvA3IgmYFX+flNNGCQxhzrGrRuZ4A3i+gWjm0t
	 P0z/STbyYcbbWdZfTIhGnzpnuKkXyXejxk/ce3ICj89c1daFPhaagNOiUlWe7lVXLalWl
	 DqRWtKemhzPWkUPlT9ajUUOMdR23DFqwrvYzw6gRT03kaEKVf3eO9kWsONfeh2FvuUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqvjYc1O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D0606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqvjYc1O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035D41F00A00
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612407;
	bh=OjF6Af/faBBFYNNBnWEx7/8qXoWkcGSz+yxf8CEdrtE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CqvjYc1OlRrZFEjerp95/0JB4dSkidL828YXsmYOXmTKkyObZ4fOe34CUo9MwSH9E
	 GaJgg5sp2mHoQLW56iy0x4HBFnS9g38Ltho4+tSZ+DFdfDKn9DJ27dnYGJwyiNL896
	 rNCFfERy1RvWTkOSo9PuaNAdwJdGSnxINnsgm9ZRDcZcoJH6jTVm20NmQcqpn8VIb9
	 5Rq3ajEZsy2XrbQeMuUXWDlsPBmsXkzGMxVQCLL8z40vJ8t2WbPv+2lLK2QqL5DTxS
	 ChkG6MCzKNo4/COqcWHMSlMEcDMXy0epOBJDf8qggT5bYjx10G848kaI0lTlhr9w08
	 YudLDX5VbBexA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bccecba199so5560643e87.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGuGL1J1tAyEIMtdjTsBI10QjLdaEDDOo0FIaJ/KzEM3SJtOLY15WtYFul9sGCnkLxCySqPnHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z3BK4x5nEtRv1lZ09PvjvRBzu8IKe4itsfeg0SdUMqaWKHsQK
	LoEFEfDT79A0shpR+LwVU+C8n99YAodzXDa8303vQawLOH+4PfJKg6wbEh4XUme5TXn7YKA0DAp
	Vi8Bb6kL3dYgwDvqh5HoXX1qzSs6qLEE=
X-Received: by 2002:a05:6512:61d2:20b0:5be:42c0:6cee with SMTP id
 2adb3069b0e04-5c1bc86975amr4507065e87.66.1795612405780; Wed, 25 Nov 2026
 05:13:25 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-gemini-ethernet-fixes-3-v9-7-298671d799d5@kernel.org> <179554499443.3135.14488059743650071074@kernel.org>
In-Reply-To: <179554499443.3135.14488059743650071074@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:13:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLkhGAT+Rt0HWXNeCV745g5LWgpPhNo3g-G=HZc7kkkoEA@mail.gmail.com>
X-Gm-Features: Aa3M54rYkX5UJyjuGJhUZnj1N3OKxtuwHpmGoZGGn7IHDIj57GqZH_R2GuTddNo
Message-ID: <CAD++jLkhGAT+Rt0HWXNeCV745g5LWgpPhNo3g-G=HZc7kkkoEA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 07/14] net: ethernet: cortina: Preserve
 in-flight free queue pages
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 7:29=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> - [Medium] After this patch, a page metadata slot is freed at runtime
>   only from geth_freeq_claim(), and only once every fragment of the page=
=E2=80=A6

This is asking to safeguard from memory exhaustion.

That can be worked on but should be done in separate patches.

> - [Medium] geth_resize_freeq() used to return early when the free queue
>   already existed with the same order (`if (geth->freeq_ring &&=E2=80=A6
> - [Medium] The patch now rebuilds the shared free queue on every open
>   with the peer down, and says the purpose is to reclaim fragments that=
=E2=80=A6

Fixes for these issues were at the tail of the series (among metadata
fixes) but the series got too long. Fixes will be forthcoming once
this set of patches is merged.

Yours,
Linus Walleij
