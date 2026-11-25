Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612545;
	b=ovTkb0G4U4JTheG8jhnXLPO17mJ8/QvHCY1zm4W3n8d2YOI77szbx0km+g1jYRszJj8E
	 BBnOhaUC+FHcMsUY3GdgxWxSYZYaxaDQYRpY+ibwha3QucTm1STypDxoT1T9yItD2odgL
	 9rME6A4nFYLJA3yqrlwgy6YaTR9T3FcyjFapXWATb+2iLtPsTLo9zgWL+UfxOkS/Q/BHU
	 QCPsWW49hq2U5hXaB8sFxNN1G4N7tn+l/nf0EXOzMD0UJo/ood0tFRHUl60Ib08a4xTJc
	 IyObFf+azgz3T1W0KiWgvR1oH1T8fgzg/y5XIYZSX8HYHHVCefvzRN3aaDcvfpeMz0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612545;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mj/CbPwa52Qxf+2a0pSouH5ltX8soPQYZl0SwdD3AHw=;
	b=slcg4fzJ9XS2tjLg54GR5zlAmgW9GIXEifxPTpgQENsusjX8b9sHR4MNuCu8THoXR3xC
	 jg6vmFNjAEY1JhRRyGmSIwXZa/MhOlHS2kb75YgJbQN4JvObis6ukHTTW2pmtLrB6Imgh
	 CfzfSLU63OW0Kgy+xxi2xIb4dz/W7hHe+TaAiQo1YHZNbkyT0o5qG03dAzbeUZzL4j66a
	 zu2ga6c7vCyubCTa6oOHG6gXg5M35Gsc4tvMExwWafhkWUauBtO8pY6I3PHWozxvfqobg
	 pgYBq6aMF4nLoScZCEb98mIBX8cPpBq5CmNWBRALmLJ8x5LRdEFcvqVmA+meyEVDLHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMBDY8by;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04901606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMBDY8by
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9AE1F000D4
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612544;
	bh=mj/CbPwa52Qxf+2a0pSouH5ltX8soPQYZl0SwdD3AHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mMBDY8bysdhkH2Ck0YO31P69nEkqA7H3pnf07DUM9bAwwioV0PkkZdV86XrbjCmT0
	 zmzMXqJB0S2k18tFznRZ3jH8JrAPN3JjUFlTz3JQgl9slk5wilUpYr6qcUTaxhBXls
	 0VNOHwC6vuBw8LISB1zIif0nbCAUAcRFqgsAaQ7uvkemqXpuCM9DMbMKCSaPgIeFaT
	 baQB6m0P98m2pfOah2qWAO1FwNt0DM8sjjAQHXA1RcbXVB1AxFum0MtEZqoZvysiA1
	 4q7V+EgF9HPD9rAbtgIPbBSbK9jaNDhtsbEM3lQa7N8TOLqvySofmnxo0Stv634How
	 ZwOoTlTwuAtZw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so5241806e87.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:15:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE5EU5wH8LojwaVKw3YGEw729fM1JnOtShhPPSJK8Q83UEsYdGm1Z1vhzya2jowybX8/47+4M0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DVPxBDuiTJv6OpRMYERNLXhrjGtPYC61CS5f3hfQD5Ow0yGRh
	BJBpBMYlWJnKRPoiUmGULx/qT/joUu+L/72LzpgLwoDKhk4sJq5PieoRlSMBQS1ctAwg1a6IWya
	uwwmeRFnvAZbY7Ni8oQLRRNxgtYUo+3Y=
X-Received: by 2002:ac2:4e09:0:b0:5c1:5b62:8bb0 with SMTP id
 2adb3069b0e04-5c1bc8c3b20mr4965339e87.64.1795612543393; Wed, 25 Nov 2026
 05:15:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-gemini-ethernet-fixes-3-v9-11-298671d799d5@kernel.org> <179554499621.3135.11543355488056577743@kernel.org>
In-Reply-To: <179554499621.3135.11543355488056577743@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:15:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLktL21-XRhAQt+rNkdzRwfsPekNT=q6nLLwV2rZT1Gwrg@mail.gmail.com>
X-Gm-Features: Aa3M54qA_TGx-o7Zpd3mXi3gZjQvxsWo0UB2TC3ZNGG6CFrGuhftGTSLeYIhnHQ
Message-ID: <CAD++jLktL21-XRhAQt+rNkdzRwfsPekNT=q6nLLwV2rZT1Gwrg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 11/14] net: ethernet: cortina: Validate RX
 fragment lengths
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 7:29=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> - [Medium] The patch treats two descriptor layouts inconsistently.

This is about hardware failing and running out-of-spec.

We are currently not addressing such fringe errors in the patch series.

We can do it later, separately, it it turns out to be a practical concern.

Yours,
Linus Walleij
