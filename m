Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612126;
	b=ttpsQ/Vak3Twm3mtaVJOv5laqi4THVYq3P52OXebLle4vvRCcTY6QzXCPD0lKe6GLtdh
	 1bV4NlCJ7HjplSYpX/ev2D6KXlnzPB9XoXCa+YJuW6NMszt6S2SI2ZbE7tETNRLllQ4AS
	 hnGZCn9dNwg4rCd1g9ckdJ2Wpzxi+/XagJUXLam7kfkLyXRah0nHC15gp4ztlf7AWT9hN
	 SWY5dNiQMUdzMtSkhYJbBHKuY6htF50zwCj36h5MaxNiqMA9HqagaHW1Y5qrugpx7Erxm
	 K7uqRbXYaxdR3pD0UBrT2ZeGXV2XcrDyDzZUX1txcfS0GOOTDFeObYr6+HE9rYmgaDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612126;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R67H1SGntALPpEpp2/O1JA7D3uYycySOxN/qb2aS01g=;
	b=2/M6pjQl1UuArsbvf1XAYg228+B2jLnFKElmQvy1R8kJFqpTyJXOi9fAO0dSMvt48HOH
	 1ITdoauaJaLh3ggYOqo5y/zvX8rNWTkLCbIRzsPm8Eb27sM5cuvHiU/S3hBYOwTTJpspf
	 7EXh9/BTFRmWVpsSIhi6iJtNmSqvQO6fGGdwUGT6/1qZ1S+3pjj3mQYaI94xce19s3FKR
	 Hb48/8Lk0s/Hb1eYByTDSLpZhtAbTwV+Bn2iiLSO/W06YNlz10gHGjICZs5OnzCAaGmpp
	 uJ+1eNFG0pZQopXc7GurWMJ89c7mBSqFnk9VHI9cDiOS/sxjl1UuZvSkLmZP0rXCuOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JztsBVSq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8965606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JztsBVSq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8941F0093E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612126;
	bh=R67H1SGntALPpEpp2/O1JA7D3uYycySOxN/qb2aS01g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JztsBVSqYp/5JDoEZVz/bbHMd9tSeacmrB4qQKAe90/6l7/mEiM6sLNQCky+Bn3tA
	 6zr80gB9Kqn38Wsl9FxNk+Dsm3Vt718YL+WRbNbH2KioV34YFWlKnwNkRIM28LOSU9
	 LB2gH2b3ZFbz0DteQM3hOKzuTOCVjUblaUSWrowfVErJayyiy5Mmm7cHPBcbthRZV4
	 c9OVdFiaHdrtIMyk8T1gqZDME8AThpApvK2yOa8GQSqCD2VjYK9MSZmxLXiJuHyG1w
	 +BJYT/U3hJbYj3pBqu8l4RSZgRKFAzKXrDcP/kQUhvEwtT4GCaBHXoAYZu3yAByHzI
	 UAQwUxWVAqVHQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so7629985e87.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGMsk5k9ht9iKopI3YatcpACXi7acnYbtv1tMyX6wQVqm3R5kisxIrmxTfPb1sbnHTZajjSF9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5xKPKchNXc/g/NkbirIarbw0SUGUael+HWiTdfjEgSut4E1aa
	/6AfXYoDgOzPW9RJnx2SDGwfkfx+42pTlsPNCOWwpxa74uQnZiVX2655vvuFOgtOohfEXki6bhR
	NadFBgj9w4mQqdYhnS0Rs9sJw7Jo9oW8=
X-Received: by 2002:a05:6512:234c:b0:5c1:53bc:cb65 with SMTP id
 2adb3069b0e04-5c1bc816d88mr5603994e87.52.1795612125115; Wed, 25 Nov 2026
 05:08:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-gemini-ethernet-fixes-3-v9-2-298671d799d5@kernel.org> <179554498899.3135.2703515763788273993@kernel.org>
In-Reply-To: <179554498899.3135.2703515763788273993@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:08:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+mAy736pmSA7M9PbwM9OOBLpoK60CUGG-b2SYEANEig@mail.gmail.com>
X-Gm-Features: Aa3M54oo-XeEfj35rLXshMjyQubQX2iDLNQiKrUQG77PZ5X38uo03Ux8hR42-Rk
Message-ID: <CAD++jLn+mAy736pmSA7M9PbwM9OOBLpoK60CUGG-b2SYEANEig@mail.gmail.com>
Subject: Re: [PATCH net-next v9 02/14] net: ethernet: cortina: Keep ports
 bound for shared IRQ
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 7:29=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> - [Medium] In the commit "net: ethernet: cortina: Keep ports bound for
>   shared IRQ", gmac_setup_phy()=E2=80=A6

This has been addressed in earlier replies to Sashiko, essentially
that would safeguard against unpredictable hardware failure
of the PHY which is not a priority as of now.

We could address this with follow-up patches later.

Yours,
Linus Walleij
