Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902673;
	b=0h/cxF2KKpBfR2Ko2/mjyEiijm16r1tqWiq8/94Oj99iGKPjhhNgPLTWGfMCJqvMejaU
	 S95HdaO+tYARwS/LARVbBDz9kjVJ6DWrq8Wu6pOjSK/Sr2SW1U4iynGrJ52tbHIMeB0UY
	 owTsmTlyiokmxaWFqKS8fTiCv5wAayOsf55WqFxdgk1Hfl/kX3gE7AYlSbDmPLyfxfJoA
	 ttHwuM+WAmQRJ5so8SLuVVyGauEci8hhLtQdjaR/AZhaPqUfJCt5yoFj6HeOPrWxMXQlD
	 cN7dNUmcnRhXpMa3Vwf0yPapBtefETkG96qAGul9QQ2VfwXltRQm/fZSZ6stQPlnWiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902673;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HtFRB5bPt4TXgrizfZY31I/zFnSxSxxLaaw/5VrF4mw=;
	b=p16cYMqD8o1NnGAOWIZBEEG8M0Z83unvii6vDd4Ttk3mkB08+8KW+JINaEoIhOC+8Qys
	 2e1MinHd4j8iMW7l0Hje1J/xzf66dbe6F4IYkzqMTZ9b7LIJ1TdASM29E89o1xPI/p3Az
	 6UlVnZhlVlogF1nkm3b/jKMs5iFeqxg3VoX4JSsS0YUUyYOgW4KAF+bNhHjioJK+0etD9
	 AQJ+oAdOFWITccawVdjpJSCCME9Hj0fQ+0LQmVowYIZlGjibLSVj2sbx2Cy6rdQuQtc4m
	 NZnWPQ/w6UnI36B48pj2/GXF1beLyP6xSVFH2gS2ap+lOIeBxKHxT4kyEfdfB/cqIxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQq5GoU2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC755606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQq5GoU2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646121F000C7
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902673;
	bh=HtFRB5bPt4TXgrizfZY31I/zFnSxSxxLaaw/5VrF4mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gQq5GoU2x82vUZfeplduBHCnkV+vBQC5cqUDRM8IAtii1GaGNMdhVo5qKR1GDunSz
	 CSUYIML9VdwYnpUYS8d+CPj/3fDhTatFw//Os37KZzuyJh5fdeyGFmVL6Oju5JYMrl
	 kTHwhTGKAINqctcU1K0ECj15HRmUWZ1CjYYODuWXzDQYGcVb5ZJdtNhr96BrAT4Ny3
	 xDke5bXbQf8kjnNWW4ke9ITK3cQySBK8d8ajL+PizkqyC8UKkBLomHFbnSxXYQ2nzq
	 4IYQ8QlH+X7wUUTVjObwxWlnFEa2mDxQEfH6eAgvIVW1v6WfX+J+XxX4W8MwYLEQFZ
	 2yh5xihY4Qhtw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so40313841fa.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:04:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvjWTePAT3tbezX8yryHpmLpI57tFKfBEV2NNmntBTsETb5lHTsFcm+1DwV+02P6p2942p1Ko=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nOuBHQuziZcaR761AS2pLfLqwX9h4vJchRdrdU0SiDmBLX0x2
	E9KNLLMKyv0183a57SdbPaWk9ucXT2jYXWU931QSHh2gRTqkrtBO2/qlEJGYPp0OoBOR4ANijX1
	NH1LCCOEn+soQkw8yVxfxb4ld8agj8T0=
X-Received: by 2002:a05:6512:2342:b0:5c1:4cab:2ce4 with SMTP id
 2adb3069b0e04-5c170b5cf11mr4901474e87.42.1794902672130; Tue, 17 Nov 2026
 00:04:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-10-f55bd43e02d3@kernel.org> <179484034800.3136.6036481481685475062@kernel.org>
In-Reply-To: <179484034800.3136.6036481481685475062@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:04:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRzQdv_Jf_DuUzNNSxFmcbi5C-JBKcv_6veZDxY5MoEA@mail.gmail.com>
X-Gm-Features: Aa3M54r1SOGU5b1laXjxhDWeat1SGQPgl1Q-BG8zrQLhxhLwYxICU13TFzCo0dU
Message-ID: <CAD++jLnRzQdv_Jf_DuUzNNSxFmcbi5C-JBKcv_6veZDxY5MoEA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 10/19] net: ethernet: cortina: Separate RX
 buffer capacity from free queue size
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> > Fixes: 0bf8c8c94af2 ("net: ethernet: cortina: Normalize free queue poin=
ters on rebuild")
>
> [Severity: Low]
> Is this Fixes tag pointing at the right commit? 0bf8c8c94af2 does not
> resolve in the tree. The commit with this subject is 1e7aa52a9993,
> earlier in this same series.
(...)
> Would it be cleaner to squash this change into "Normalize free queue
> pointers on rebuild"? If not, could the Fixes tag be corrected to
> 1e7aa52a9993, with the backport pairing and prerequisites listed in both
> commit messages?

I see the point but the patches are big enough as they are, it's better
to solve one thing at the time.

Yours,
Linus Walleij
