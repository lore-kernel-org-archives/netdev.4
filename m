Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035691;
	b=E23XNAfi3ZBphOIBQt7mbn0+tO3xhKp+5hQbl6s7PtnminQ+0yhgS02BaVgk7nEZ8+N5
	 sAmxBPp+vMZCRhYuyrdhMAIdaE3l45nHxaw+Hop6fEh+8GF7rBX7wv7Anar7cgueX/s+H
	 vJTpJVuhGrwF+dB5PSPPpx2DukXA9VEbPwNHQiRCoxCLTVXw1/AQ/odpGgvBtMOAD/3q3
	 y7HOunb3D+p/ZjE+dUr8Yp+NHBMTSjroSrgwBPXy6TTA00gzS/Dnz6BVP7WudOh34PSTv
	 eWyWOB24PAplNrWis8U3+TGVoK0QMnJaivvQsk9eLhhOmRCn5IciCowllloDcH/w06g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035691;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PylunsmmRlkdtb/WyB0RyfvFvmaBo+MuhFihXCK5+co=;
	b=hK7Kk+pTbs9tkFfDfn6X3iA6kkgDnf4LcizObsQJ1MWXsuYIc3dNDTiJNxDgj1ArUgPC
	 s3U8gDmrut7xpXGACsAGVcMPvBbfr2+/eTc9PD4BMwSDnDn2d1DBOX1lcOU+2AAeAP83+
	 2Z/B7w3ZYgi7q8d+OIhKSgJ9M8+WLjpddgXkvF5am58nJd/S8lk0+FBBFb01hyL4gTeXP
	 HwFdi12Ig/vHqyCxL3ujD1xuVLb9vgCr343WDx6xZ855uFoAFt3X9OVoz3GPW8kxFPOBO
	 hHy3v2kGXOX1xNtc21w4MnyTpnGvw64gfalvucYYxF5RzgZ24eWW39/qlVbX2RLQwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPWXcIUB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD84D60A2602
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPWXcIUB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9413A1F000CD
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035691;
	bh=PylunsmmRlkdtb/WyB0RyfvFvmaBo+MuhFihXCK5+co=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QPWXcIUBVA2Ek1CnBkzV8Lw/qJMYxwFPKYDy+gUgDpPe9HW1bLeS4e8vrv8hEO9ml
	 E04gk7Ndbt9Dni58wWn3U3VHVW6hijz9dwdT71TKsR0BNtwuGYH4JrZYgutLAeqq0D
	 VLK1YGfNgNRK3yNuRK88ZKnYpJUpovl71856e9/eggafVF72RZB4RKJdxOKhLwgJ7M
	 Qn0AlAFvNbLPRk1wfaHArrERzbqZSidCDLsfvwpDxjXqD50S/N1SKToAz8lPJEQuJe
	 TpwZtcH270MueIYWOXxdg6GWkzRFUCv/uUIpRQd7B7vU2+TD0b2i+r1dsBcF8/lJ0u
	 MyQ2g64OrDf7g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1269703e87.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:01:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrjO3IyNYmUrnlo333+oql9VTukGfg1/MS1x0SHCLzSlFn66p5ZCHYk6Y5gySbY4/0cplCqnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z91SeKFzPYSE15tFrbXEMgA6TslN4IcAUcHugeKS27uMDI/mBKE
	4v0ALsm7mppZlsYFYCXNh5XLwT5UuXJGfv4qfNNr29t9r5gOAmIN8RkMNg39Csvz+El3OnfXbjq
	SdPMOxG7by/oWgoaXNacPgA9MHYYlW+s=
X-Received: by 2002:a05:6512:3502:b0:5c1:595f:b370 with SMTP id
 2adb3069b0e04-5c1a9b70a4dmr1341700e87.3.1795035690279; Wed, 18 Nov 2026
 13:01:30 -0800 (PST)
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
 <20261112-gemini-ethernet-fixes-3-v8-10-f55bd43e02d3@kernel.org> <20261118204954.GS860048@horms.kernel.org>
In-Reply-To: <20261118204954.GS860048@horms.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:01:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLmT0wTcb1eXkOoYzBTJ5m2FAqEud6=WwWt0OYwvQ9SYHQ@mail.gmail.com>
X-Gm-Features: Aa3M54oGCJcaacoHQx8_8lE1bB_IoQ_nH8etCuw7zxi8imF8z0hd-4-bJVEcNNg
Message-ID: <CAD++jLmT0wTcb1eXkOoYzBTJ5m2FAqEud6=WwWt0OYwvQ9SYHQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 10/19] net: ethernet: cortina: Separate RX
 buffer capacity from free queue size
To: Simon Horman <horms@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 9:49=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
> On Thu, Nov 12, 2026 at 02:30:25PM +0100, Linus Walleij wrote:

> > Containing a retained hardware read pointer can force an order-15 free
> > queue even whhttps://lore.kernel.org/netdev/20261112-gemini-ethernet-fi=
xes-3-v8-4-f55bd43e02d3@kernel.org/en the configured RX rings need far fewe=
r buffers. Filling
> > that descriptor ring requires nearly 64 MiB of pages on systems with
> > 32 to 128 MiB of RAM. Allocation failure persists across retries becaus=
e
> > the stopped DMA engine cannot advance the pointer.
> >
> > Keep the descriptor geometry required by the retained pointer, but size
> > the RX buffer budget from the configured port rings. Bound the posted
> > occupancy and refill work by that budget, including after dropping the
> > free queue lock to allocate a page. Size page metadata and the NAPI ref=
ill
> > threshold from the same budget.
> >
> > For a retained pointer of 16384 and a requested buffer order of 10, thi=
s
> > keeps the 512 KiB descriptor ring but posts 2044 KiB of RX pages instea=
d
> > of 65532 KiB. No hardware pointer-reset behaviour is assumed.
> >
> > Found by review and checked with a ring-geometry model covering every
> > supported retained pointer and buffer order.
> >
> > Fixes: 0bf8c8c94af2 ("net: ethernet: cortina: Normalize free queue poin=
ters on rebuild")
>
> Hi Linus,
>
> I don't see this commit in net-next. Perhaps it is a local commit?

Yeah well it's part of the series:
https://lore.kernel.org/netdev/20261112-gemini-ethernet-fixes-3-v8-4-f55bd4=
3e02d3@kernel.org/

So Sashiko wants me to squash the patches which is usually a good
idea (no introducing problems and then fixing them right) the thing is
that they are fixing different problems more like two lego bricks on
top of each other, it's not always as a clean cut as one would
like, it's two technical steps.

But I guess if this is how everyone wants it I'll cave in and just squash
it to one commit.

Yours,
Linus Walleij
