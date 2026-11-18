Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019686;
	b=3CrjLBcoLsIOcxRpuMZSF9zFw0hfve25NxsEOR2jKfXotKauhH9IJLFaYqDbjN3GBdNt
	 I2tqZNwz+jkGQSeI7qRhLVZpgb9VxnkfC+8qwRm1RIQvfRVCyrnKkFTTt2gwR88IiRrzY
	 xBXUBY5dZ9+CCtR6wg0fi380f+PHO8vlQyr9fdt8zYrfadDT+3JCmikHWd6/oGF/QId+S
	 eVB8fzR0T9/gBm8uFD5T6Fw68KnutkhBhHXd4LE2tCLKAxT6pZiSTIb0H/0y7bnTr+eFd
	 g8ebTY9JWeXD0dwb9FE5JXrDl0HlcaCAFqrevkYfg2Y4/XIUFrqvhcbFh1PaKUdmVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019686;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5wR5zM6vhPf+AYQ3hGmjEY/5qmiybh5sIQfaO4YFM6o=;
	b=tD5BIEB+6A+rXG4sSradCkpr7r/ze+8QbDmkiHdlTLx0SYVku3xBp/HxIxoEuO0J85kw
	 c7uaAXZDxDOa/5tBM3xpAfCS+DcpxbAr/vf/uHNFLxJMqUrrcZSKzB7zEgA/wCUCpVHII
	 HosuqwO0eH7dJgRkYek0EqRI+psHc1fEmrOt0YGxbi7f3RxxamsoVZkytQJMRR7gaCpPm
	 9CppmZ4165xxuEum24KpYvGNtvj55WwiUx7bqbtur4pT7+doFaADjr/LwryB2SmSOHlCY
	 TNBxLqOMwNWuEaqSAoM2XMvc6bPTTBdpvq9QdQwujBuAawFY/1a536i0KvpFgWxLDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojhU4GR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A449F606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojhU4GR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DC81F000CD
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019686;
	bh=5wR5zM6vhPf+AYQ3hGmjEY/5qmiybh5sIQfaO4YFM6o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ojhU4GR5DC89JFOo059YzLC+Ws9RQHbuJHEOoQtGukFqeL3pP3QoIJXcvlVluWjnQ
	 VgrqO7wAvd6ggOgpmz77AQ5XGacmLJP/PHgxQemmZWLUVvt1d7kLLQJlXUjx1POgLe
	 icITDF2R+PA94GuFHi+/F7foeaiAO7v6YL6cfs8pbt8yUFvOI7AINMO4lpK+tGmDHY
	 lSmcxsENLBccqLvOGXvhbriwGjqRgAhwMTRIzzHoI9SeX9Ad5izK4tWW13OCAueJpZ
	 NkeSjTFvYW6m0BTp9o4XKDTpkK3teFYg7v8QXidvCipjTlBoDXIsxBzLAYC9dMP2wB
	 zHNHqHa+THi3A==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-71acdd32a53so474456eaf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:34:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEOoEw1w4qabj9lJXqeYBZWeCavuZtQzWefKjnd8LSD6GJX8sLtnEKZ7LjIOgd0PCMIJwEIwXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q++bN9ALGah0kNd5xlnUHXvZsjTPjhgLUNrqf/YkxhbDMY2sQ
	9C6MMsOg75NS6pXLCw+kBhhsk1bGrsTEEFQrBu1VSZb31+Q+dUsQYRzNXH86P8T+2mX0FhfepBx
	ywVAVoIHSbaKDZipacpJ1QxBjejTCBtk=
X-Received: by 2002:a05:6820:a75a:10b0:71a:f5b7:e0c1 with SMTP id
 006d021491bc7-71b18609662mr1248292eaf.74.1795019685717; Wed, 18 Nov 2026
 08:34:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118155144.18393-1-mason@kernel.org> <20261118155144.18393-5-mason@kernel.org>
In-Reply-To: <20261118155144.18393-5-mason@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 18 Nov 2026 17:34:34 +0100
X-Gmail-Original-Message-ID: <CAL4WiiprQbDE9GDMOG7ZtWSPCKUaQ7zV0qe+vZ8S33AV539GGg@mail.gmail.com>
X-Gm-Features: AclHuK97qatPEmcaPNn7Gw1pqZZMejCHLG1RKCRlFJULE7n2DzLPHSH_CcoMZGk
Message-ID: <CAL4WiiprQbDE9GDMOG7ZtWSPCKUaQ7zV0qe+vZ8S33AV539GGg@mail.gmail.com>
Subject: Re: [PATCH net v2 4/5] tcp: clamp the samples in tcp_rcv_rtt_update()
To: Chris Mason <mason@kernel.org>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com, 
	josef@toxicpanda.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 18 nov. 2026 =C3=A0 16:51, Chris Mason <mason@kernel.org> a =C3=A9c=
rit :
>
> tcp_rcv_rtt_update() starts with sample << 3 in u32 arithmetic, so a
> sample of 536.9 s or more wraps.
>
> tcp_rcv_rtt_measure() can hand it one. Its sample is the time the sender
> took to fill one receive window, and a low rate flow can take longer
> than that. This caller only looks for a minimum, so the wrapped value is
> kept whenever it is below the current estimate. A 540 s sample ends up
> as an estimate of about 3.1 s.
>
> Clamp the sample to TCP_RTT_MAX_US in tcp_rcv_rtt_update(), like
> tcp_rtt_estimator() does on the send side. That covers both callers, and
> the smoothed estimate now tops out at 8 * 120 s, which fits in a u32.
>
> Found by code inspection (Eric Dumazet), who also suggested the fix.
> Confirmed with an LLM generated reproducer on an unmodified kernel, and
> tested with the reproducer and existing kernel selftests.
>
> Fixes: 645f4c6f2ebd ("tcp: switch rcv_rtt_est and rcvq_space to high reso=
lution timestamps")
> Suggested-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Chris Mason <mason@kernel.org>
> ---
>
> Notes:
>     v1->v2: new patch (Eric), with min() instead of min_t() (David)

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
