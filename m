Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903137;
	b=Mw8KGRNyUxPdH5lEUXxK+Rb8XToNA6u6YhVUk6o441EmTAMdSwnddX7akOf5YKgflTDM
	 MX0p2ikqFI1LIYi1VxLTPBsfjwOHXgVSW2F8+AJtgGPppsTtWQbpEQ3CKl72UmbV+8M2y
	 FwwBWbe8lbXOje3LijgWFbeRWcxkoHEB/kKjCpH7coeWzBKx/lXtc/J6ZNfBKk/Z3XOfM
	 eU3VgXDsXRP83+sUiZ9oNEhF2ECuKxC4uoYURnmcJQTOHSrykp9I4KY0XC0+AeM40ASsR
	 bjVo1j2v0FNEDGoTF2NUxichbHDhy0eapwC6eS8w5n9+cGQtO6PWMoqoQxdmTxHxi7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903137;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=tB9Urg2l6Hg8R69qVoWYFgJ8fRce6ItuRAeBhzIX9fo=;
	b=H1FP7VkyE7aZ6rsebZGNO8FQ8JoQHRfUq9K0VSlfoC7qTmbsfq0EmQvqcgDJ5j7sCt6h
	 ygJSYVqjp3B1A4whoPuSrjAYMqRb8rD79nkXi1HS0VC+yl7SzmPJu1K3wI+DFifYf8Twg
	 dMP+xUIta01sbYJ2iTCbOS21bm7xVIJRpoEWQ6z/PTkxkfij6kltMwZPZkBAHxe8NaXHo
	 eGv3s7bOkcjgSCDnjJa2o9hQrlLYA6886LK6/ZmnIwLp7jOutaY15EM4Mdo5v9E0+8VFl
	 q8cxZZUrQCIfzNMPVuKUa9KRRFMknP2ITAkGfc5vXA8V+q+wAdOqqTsSWyxloKV/6Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmrAWKsi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B490606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmrAWKsi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B421F000C7
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903136;
	bh=tB9Urg2l6Hg8R69qVoWYFgJ8fRce6ItuRAeBhzIX9fo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RmrAWKsigmNFbg5Wy1GeIOVEpmGBfhXIIw+3CIkTIqoJ8Xidr2SDamjk/gDrNdEj0
	 PgjFd+Eex5SFDIvAVAh8szGRcurdCldCzAnRKBBn1btcIl9F/6zTRLv8nY0YnB46CD
	 DwmGl+njPSy6t6zMyfVL7NK03RMPQa7keBCLS6rEupIdS9GFoYbmsy176GHfEA4Eji
	 ZlvvyU5+PgY9QrUiLGOzz4WUmp862bt2xDoCwxZz2QC5c3bXpOY56WiuyH5NRSUmBG
	 5YnEFt9F/75qGmtUE0niqkceqHODOBSMoRYzPQxyHFusmAL4Mcy/WLpkdO8IVFfqiK
	 h+C6ZuTi94snQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso2730971e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:12:16 -0800 (PST)
X-Gm-Message-State: APuU4Z9I81thztHvg06Zw3ollvQO662Dwpgd0sOjnptj6DSSZhzzETky
	3n9K4pPBSSE99QWnOPcFFpSt9CEcpfCm8xUOKtqVx1yL513tuojqfIkDoDjs0qxIZo8Y9Tlzz1m
	0TPgFYMWKKjPCPIVSsFvt+1eZI5kJSu8=
X-Received: by 2002:a05:6512:3e02:b0:5bf:ae0d:5c8e with SMTP id
 2adb3069b0e04-5c170b7e2admr5167348e87.57.1794903135556; Tue, 17 Nov 2026
 00:12:15 -0800 (PST)
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
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:12:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
X-Gm-Features: Aa3M54q-oRX9LgPoto5CPFXXx_wV1fKyF9G_Cwl_cYZ4Z-QiApsXlxZnVJbjUNA
Message-ID: <CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I think the Sashiko noise on this patch series is now down to
unexpected hardware failure, memory exhaustion and low-prio noise.

I think it could be applied and then maybe I can follow up some
of the comments later once this is landed and the ethernet is
working properly.

Yours,
Linus Walleij
