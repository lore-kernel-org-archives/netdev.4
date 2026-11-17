Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902983;
	b=gOmArvsXFO0Hvjy5hmU1jHJFQAxfbt94YFeXn1jn4jRzbddtAr+q8pAeVOOIXC21tsJD
	 nf1lBt8voYC4pwAxWCk6NXuymmfp11E0l1B5P0fFBI8cSTRM+yZ0bC5cdy7oc9wcwfpwA
	 TPQTNX9Kk/RcKZfbu35msmSU4TOekAtvN6NpJI8AuI+TJTahsFp/EzFY5DFMH8zFb+Xqo
	 swIx2deIG7tlLjI4vVgr/6wCwCnmVU//+Qe3PZgXF3w+t96bMATAQaQQB1BpuwmW4QneV
	 xP0F1g+1PgQjj/Qlk1iqIpagNsRiakw8XWBY1IIv+VjdgCJ4uFNExgflYjCcIdMJ7nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902983;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j9QtIqR6dUYM+ncT2aW09nOLnwnxFH0GxTWtv/N8k08=;
	b=ZrXULWtyvax2P2s/jFYhfxafhxqjslqbCVGCuq7AQUMN9/l9qKG1VPGuR24oErSGrjhC
	 HQm8BIQFbLvib4tq/SVZHiwyOVHhD0GlY2vIg6+nUxLtoIfo0gZnvrpv9ymgscYtwWGwi
	 e+ZnhVd89adnXuJ3Tco+SVl42IUtp3NTJ1MAsk8cHt7w6Q/T5xR23eNHwwI9SHTI7fs1M
	 u5ADzpRKjJMX2T6tO9qp6YOAvbdMpf+IDrC1/GTF3kdRHrqPAcGlL+enjDRBQ2zJvNCCc
	 fpsp5W44z9Xpu9m7DGnjtn/YXW/RMuarWJ2QY3+rEUhv1KiQrLxPdp6/oJfqF4fz/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RsV13zvD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CF5606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RsV13zvD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D4D1F000C8
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902983;
	bh=j9QtIqR6dUYM+ncT2aW09nOLnwnxFH0GxTWtv/N8k08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RsV13zvD+nPEzlFmigueAZ+Sn0DGGo6TanHbUA1/9cTYEyoIb/VtJCvzKcrqz+Tlx
	 QEJ/b3WyoQ2fjT9DI8ZY+VwslmFq0AmKKKLKFAblRkoLXubL/a5cZFYE3l4BpUT6C8
	 i61w3FdM0xUIpng1d+MLFot4M9eSAXzEtqk5SBPARqPdODxAu9YLWl33d3lFIsd252
	 K1c+Z113KI4TrfdzVPUT222CLlzpnZ9DCKrLmsjfPBeRLOSP3KafhtsErhUtXcIOHp
	 QB3/H38egs91blwdthn6nkx+GepHlBBiuZQXbH5wWMlTHz0Q2dN/N+zWUnK0JbN5n3
	 bsdSKUj5CPysg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso2924348e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:09:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEc622NcU9qC4GZtxhqV8lTgPPF/ouSbpYJohhwby0AQuXc10uav4WR9G599BVfHDM4k+7PY8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z96tzg7BSdFXDvXL5ZjVb1u5bWMkwYzYO0Nea/zXVh2q9nNq/39
	Q6W5BYfsUtUzZ1kRYeHYrmrdGhTC/C6uvJAm2fp3j2CzdZq3vqMnJnS1fplqzqHxU3G2xauIy89
	0yETyPjKoyMLouqEKAhV9R93Gl7lYIxA=
X-Received: by 2002:ac2:568b:0:b0:5c1:5006:9e8e with SMTP id
 2adb3069b0e04-5c1709b49fdmr5657515e87.29.1794902981904; Tue, 17 Nov 2026
 00:09:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-19-f55bd43e02d3@kernel.org> <179484035158.3136.6315312321959459543@kernel.org>
In-Reply-To: <179484035158.3136.6315312321959459543@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:09:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLk7e8a8gWbF__=w08vHHNwdoFF862VBusD3gCB9Vw9Fdg@mail.gmail.com>
X-Gm-Features: Aa3M54oy3czM1ifM3YHUrdQmtaftOgudYtl-iKkvC_LGhkT36zHNI-Kv1e57nJ8
Message-ID: <CAD++jLk7e8a8gWbF__=w08vHHNwdoFF862VBusD3gCB9Vw9Fdg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 19/19] net: ethernet: cortina: Fix ethtool
 statistics reads
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Low]
> This isn't a bug, but should the comment above this loop be updated as
> well? It still says only:

That's overzealous, no big deal.

Yours,
Linus Walleij
