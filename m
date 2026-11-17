Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902241;
	b=rFt/CqeR08Y37MQFJL6p6nZ9PPvShXuyRUJmxVk++H28JxWgCFuCc4hBb2YI3+hKO7zI
	 HY5hxiPxrUfwQ283nxlJrZHDL2xPDRRDdSWB6BnCVRhL8ORBlzAM47mrGtAIspJQf1KsW
	 bPDykyCU5VByiHoV93WYmv2C33TFNxs0M9DZBcUt+DFceSu+Y7JhY880g0Nb/WCMx0FeY
	 gGJ6dxVkCqgviT3zK0FPsVOoZNb2JeR1mfxn/Ygg8ncVbylDJx26Wvwh1OkHnPTFfQluE
	 5jVZHeqI0FonzNr6YFLpwLKM8GDh3iOzRBdyOn8WYDQHZgL+YfcBTVbUZw1Vk83nUJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902241;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8gsokXl2noPECPycyNJRtOuTlolfT7oLMgYmtfXG9X8=;
	b=lCC6k7YTq+E5+wQrzNp53/1JrWgGlXKzDzboE8BcbGyv3w8gkZoHc3b3x57rUNvAkOot
	 XJkCBVIn6tA7/EGl2eKGpEkvfY0J3cdEYr0YLFeTsdazjS1HHiPuBD6xEWr6fT98E4kTH
	 2jwrxSsBEzdLa5lcowylrlEjDZpaTgewVF8wMSzESNIONJM1MD/1j/sPs/pfNGwhFxtZC
	 ZpTk+VwwJLZ1vjcjQc3T3I3uVoBJBewMc7Cn+hgRnKmRlPqwiE6lfpK+Ex6i0nPKDYwDO
	 rYt622wrNM1H8VsUlsicrNBvgaTIAZXQqd4ItJ7VC/hg3taGuKPY51NkRg9CYE79QQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIKLsO+O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC802606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIKLsO+O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C53B1F000CC
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902241;
	bh=8gsokXl2noPECPycyNJRtOuTlolfT7oLMgYmtfXG9X8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VIKLsO+OP+eGmcDTTGowNvL0gmUGgRPCYbfXUQNQm9x3jl5CtoR2yr31E+Nh+/bu7
	 rweSbZ1QmJWRexue+34GDfrIz5qksk74tZL6asnunimDUPQ5aeqrav7/z9jGDulKpO
	 nzrC4N/9YBdPd9E/DXDbynfMm4omfCaIBrGdyZdBNwwS526R+L42G5cnSJu8PBzBkk
	 8FZpeYCeQu/USaKw5zY9SkTUzW+RB+z9H0riUNl26eMMXVRlXtSC/fmJY4jt0/DUiC
	 Q8RZIoDijjyySN6pojnd2HD8x46OZkq/Z3M6WiA4eegcuBsi2ShwtYzveh5Lr0nXr9
	 ezFfZS4daC/Ug==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so2859425e87.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:57:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHwfFri83ZdBq0wSHjiLQRA79gC6bswc5xZYU0g42FBX+2ZOb4BqaPpurOIB/jQXIOqX8eU84c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uCwoI+hwLhPLNo+5WjAg1Qsys5CIM+dwtUbcs79pfZTdxPrfT
	sDm4RNfDO1RmeFltC6o3hOzTJUffcYJ3tL8CetdzbCV9Zf3yQAVwWIz4rLkrO3veH8dF9oq5cTm
	sCzJiGvLH04CvAIhqebK/yQllUrDEUo4=
X-Received: by 2002:a05:6512:618a:b0:5bf:c4d2:b074 with SMTP id
 2adb3069b0e04-5c170a159camr5040159e87.55.1794902240108; Mon, 16 Nov 2026
 23:57:20 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-6-f55bd43e02d3@kernel.org> <179484034552.3136.9115305674551947540@kernel.org>
In-Reply-To: <179484034552.3136.9115305674551947540@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 08:57:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLnvOaLeOrZaJWcc-EW1_wSygQiq-DaE+VAVmr=C=66hJA@mail.gmail.com>
X-Gm-Features: Aa3M54rDWDfU23Rn4fpz7EzOXoAt-B3WJ-YDYLCTCBPamaaqItrpSWxgxqiqfc0
Message-ID: <CAD++jLnvOaLeOrZaJWcc-EW1_wSygQiq-DaE+VAVmr=C=66hJA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 06/19] net: ethernet: cortina: Index free
 queue fragments with XArray
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Low]
> Should the commit message mention what this xa_insert() costs?

No. That is overanalyzing well known kernel abstractions known
to be performant.

> [Severity: Low]
> Does holding freeq_lock here mean the setup path builds the whole index
> from atomic reserves?

It's fine I thinkl, I have stress-tested it.

Yours,
Linus Walleij
