Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902505;
	b=fcqcdrgvr6s09vU21NGOs6XjxVc30u5dYeKkHZHo9JAyI1MiCNZKBEY1dz92MGj3tzMM
	 0ts246jFLq8lq2A8fpR8/lK16H+pF4ifbcIDiI4elYnNfhEkHo+C8BSMn/M+WugEhyiFV
	 NU7mrE7XV3HzByZ0wIjGnileoN/32Ggm4ChpRG/NF/HvGhVr11+/un6mugIUELKgU001r
	 SMnwQ9yO4xU6xeB9PYP9MwRTt8/nSBJQC2BNSkotKXKrDFUEYrEuAWSw1gBOCX043+D+G
	 bcS2PQV2fUF2nSg5Cl7RzCZp5MVO1dlX8JyGB2b4cAbuIonfp/IDEVAa6TRfeO60beg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902505;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mu6llHdjmKdTG/gL1WWlY0QVvX4gLUhKjNXvAap1uEU=;
	b=Br8t3yL/CmoNVkvUYYv2pHTIXwPgHYoyKvvSUyol/EG6TjuOtlPb2X9ihPRuZRrRzFXR
	 0O7KnV4cQPxx7upaKEvT2LVyqDn02PH63XqvAPV4OeNNTJCIKsz2xbVXVa5qOx3XljT25
	 D82jT03fhZa23BNrtN7eRpG8ytBkU//JfqmphLE1FYMZ4U8bV+MB/4Jwui9W/34zP+DB0
	 3k+EwZlO+kOY8NeB0SFWWM838dIZD+bN1fK8D2TCCJNkJmlMuHBi/4G2c38qElg697lW1
	 4jfzqhSBYfhSPPKOlgNU3elLlzlMAfljZwwu4jb11dGkXUnCSxSiP/9ff9aRJL37kWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m9/oHxpD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FF606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9/oHxpD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEFD1F000C4
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902505;
	bh=mu6llHdjmKdTG/gL1WWlY0QVvX4gLUhKjNXvAap1uEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m9/oHxpD35XgtzjsbLfPeP4Eu82zml2HWmDwMdjBDCgSweovgO9Hxf5GOc4cXT6Bc
	 2saQY305vSBgLLWAq4GSnsU00dnrky0X1JvJE6xWWb2b5gxGjRGp7+ind+gVzD7qQa
	 34A/6HkA+KWDx7PA8znp5y0u9zqAtW9FJ30v1jUV2XCg4LwNZxCip8BHgxYXNNDU8m
	 43JiHIjx4gEhEk93EyTewdOGiLBjiHEolBMm7fN6kIKNocfX5zoT6jn31ALm0BPKbJ
	 4uBYv7LypY+JDfdzNLuUxdHBNHI+ue85flQ8VtMLcp1TROeyUUG4xivNONrnPwUn27
	 SSKyqXDreKK3g==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14a204305so3822467e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 00:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEEt8ysO+i9FOfyXmQVeH8khJV/oBX5BKuHCNC3JHjXnrGQ6u0ZJQZuc0PmgdBs5WdPJY0BecM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nJg9L8P1EFpUNAShsPn68tyxoNMZYkRv5ARpseDaua0bgd/Wi
	sPqkfreZQJfPCX5E+60zX6aj3SeB4ww2uuiZRfSkpcuL1sIPKnECLlsZBUrQBNn58zrv1O9JVoP
	Pi91X33+tMg3VqUlwYP4oHq+ZWTNnjeQ=
X-Received: by 2002:ac2:4bd4:0:b0:5c1:5975:66da with SMTP id
 2adb3069b0e04-5c170746339mr5826150e87.2.1794902504106; Tue, 17 Nov 2026
 00:01:44 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-gemini-ethernet-fixes-3-v8-7-f55bd43e02d3@kernel.org> <179484034674.3136.17017391064607605132@kernel.org>
In-Reply-To: <179484034674.3136.17017391064607605132@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 09:01:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=sFzuo-9bYgiXtdkQpufqeumj1KpsVp7gTjgs6RUj1Sg@mail.gmail.com>
X-Gm-Features: Aa3M54qNSyDLZsH9h_l-ioDv4C1KwwW7SDr5bzwF5vkTayw6zNUUJwW5fxEi4oQ
Message-ID: <CAD++jL=sFzuo-9bYgiXtdkQpufqeumj1KpsVp7gTjgs6RUj1Sg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 07/19] net: ethernet: cortina: Preserve
 in-flight free queue pages
To: netdev-bot+sashiko@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl, 
	mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> What happens to a fragment that the hardware takes from the free queue
> but never returns as a usable RX descriptor?
(...)
> Would it make sense to reclaim these fragments some other way, or to
> size the pool with more headroom?

So now we are down to unexpected hardware failure recovery
on this patch which is where Sashiko tends to end up when it can't
find anything else, I think this is fine to apply.

Yours,
Linus Walleij
