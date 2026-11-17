Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902361;
	b=4adMpdMvETSiJzTvSR7uPWErmwa1kX4nqDdcU8l780H6oFFt7rVSWSd0ItKy46fsJxDI
	 eg9petbeeEGimZRMFzZYBzHc5SSjVyoySF4w3WUm6HWyv4//QZrS/RK7/bCzVVYIuEWxO
	 lPkFeevKaVeUgEVZ/15UaknWcxAU24ZHmOB4lhtiFa8k7J2xg/h6oZS1eX16bRPa6Fu4u
	 yCHUir+VoiO92VB5xWjFubzeJcRTnu50glBZKQYtF71yjK0/i9CBK1bhaaRn+aJUFV4LG
	 1z2sHBZW+yjxjcjwmKoFI5Id+T4y9obR7JesS9DWOeeqgguU+yZkdbmpxi9Ft2UNRSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902361;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZD6ewcbkq8eFaWsVNEXN3cSwALav0rmJv9vmjm/ebc0=;
	b=5LLxZC/x080ETyhfok0W9VmJQa09IOye1moCIIVo1M77sk9hmpqct+aVvT0lxTktyBlD
	 eFaoXOZBNws4OcjZ2mcKKsseYRNXSOn8Aap06DX9srNvZ04/wMQ5wJjLAHn817hlEfWlH
	 2v0T654E0lPYiAbi1tXQvRM9T41Qke0qe4PKTC2gl/Wf1ooTPW6w465GH8VoP5wT0NHr5
	 BivtYGw9f1yydjvfonyvVjt7zBh80wb5FILVoS2gly1xHnDGV/GRwIDT6DVhuApj8c2BN
	 Z5KWU1c/qZQwMTzuAHKzXdzSLRqmLesOB1yHZifDi5xT6Ubyu+bVDmPaAG7eHgnifjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j6UlrS/J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055B606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6UlrS/J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553371F000C8
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902361;
	bh=ZD6ewcbkq8eFaWsVNEXN3cSwALav0rmJv9vmjm/ebc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j6UlrS/JmvKf//zILbgKCG8kPmHZZMvpxpRX/4CxoUvHgex3rWn2+ZJqj9B5G/cW4
	 x8PWNehtwropPRX4eoyo7asI3OrME3+Z784hJ2rrabUzj22mI7SJH3LiR0dhVRWIWx
	 OpgEqHqDuBiXjvXcBvkJpP0Ojp+CG5gTP1OqzRA7e5E6TzmGfTEKlEwSOH315ZOyJ/
	 w85ISQf82WTFc3Ay4K0dbYAMwHj6IEOuSyyBIoX4f3z4g53ael5uNzzqUww2eYJxyw
	 rzaMZs9M8jQAybzO1AvRs6QZ36aln9/KSF4FJVy+6lyH4Fh7BqKqm7mxd1uF9Rnbt9
	 CtV7nxljqmvvw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14470729eso3631380e87.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:59:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHcYjLMwQMB8nVD/jb+OShTVL64nOnx+cp4a+6l3Kad7Vy6gkmF2ItvjxrF9Ea406E+BMaybHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1LtnPhTT/4dQ2/5FDGSJHYKjaettW0x8OlNZtt6PwdsISx0HM
	AohLDTSA+D2DMrwsWbxbl/BgKoPM9YV+LTz1RNIQbuaTv9JwcxIeEPaCr1yOIpqZfWhgMWlquUy
	VeFduG/9DpnUNrKRGntgftUpl1jHWwVw=
X-Received: by 2002:a05:6512:15a8:b0:5c0:ca1:46c3 with SMTP id
 2adb3069b0e04-5c170b1c76fmr4478075e87.22.1794902360091; Mon, 16 Nov 2026
 23:59:20 -0800 (PST)
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
Date: Tue, 17 Nov 2026 08:59:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLnLzEgBqhvgx3FmhG4AViH_ibxCUpdVLaiARKikTDX1Aw@mail.gmail.com>
X-Gm-Features: Aa3M54ruUnvia2SsO74hEQ69TeC4F4l_Z0CSGNtIeboVgHu5freq7xlvXXXHJ8w
Message-ID: <CAD++jLnLzEgBqhvgx3FmhG4AViH_ibxCUpdVLaiARKikTDX1Aw@mail.gmail.com>
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

> - [Medium] This patch replaces position-indexed free queue metadata with
>   a fixed pool of page slots.

Yes that is the whole idea.

The current implementation is buggy.

An earlier iteration of the patch series created a custom pool allocator
and the networking maintainer thought it was overly complicated.

Yours,
Linus Walleij
