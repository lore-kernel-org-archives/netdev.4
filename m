Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075005;
	b=R3UfHGnF6qpmX4q/XE3D5GVxk+cvUMQgfLiEM6v/8Z4JnsELOqwJBRkb3+sew9Pu+4Rj
	 ISIFiG7SjCiR2ZL0jaSAIcGHxcN93qcjoJ3xgUGwcRixbhU8+tjX9JVGDEXJX3x89MJFw
	 PBomblA8hPvZ0I3FjANFKqTJXqT+oPuLzfDMp1jFete33UN+Nf3nDm8WEVT/fNcNM7sg2
	 Apiv10SKpLVVjywDvkWNhvpJFRczTedWQ2ceZ4s8R0fFn3SCcoqTuOJweBM/8OQkoAN5j
	 GuKQvK+W5C/MR7QlXMJ/mwteLtFocH3PVy432AmH7tEJGnTqB9EHM4VaHz5XLksrr6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075005;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TkTQbJb7ZBAG3dKvrkB8K4SdQF87n1mSeZ/di/8jo5I=;
	b=NMUqxBsHZ9YJnqH96DRpijuM/GY7aoHFAVCldGwIFdZuMBoPz7vkVXWNbB42voiBW1TE
	 umNPR3fJfKdjqxYUPLyqEg2NX6l/H8evH4nedB0Qe1uNkK+c97xiMV457lvN9OD53x9ic
	 iCQLHsLXSX0aN/RSQFUXh3NnZudEfzd+frKAr7h2Jmfo0GUf9HICc6HmjjW5fsOFTMy1r
	 DDrWeYVsFboLMQpQOggE3xxuhDeGthTLl++HOZ4UgkDQyVfUTNS42kTtmSK9dnmyC5XKh
	 5FAAc4BvqiTCBuJ81xRfZXVgKRtMZk3F7oVn/ebdujcjmuK+ewOYobEsd9Qa0RpXk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oFn/TIXo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2911606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFn/TIXo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900E01F000C7
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795075004;
	bh=TkTQbJb7ZBAG3dKvrkB8K4SdQF87n1mSeZ/di/8jo5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oFn/TIXoG+Jq/iqJIWnO9NtoN5zFhYH0al+g7BexIu30nk3OvT35FVlEQBVQiAyxt
	 MZ8hSNL1qWDm4rfP3/YDYnSKkWM9ORWTVc5oTX8L8pOPrXbROKyZ5jN8GxQprSORCL
	 eSlMupBux4XrX6PFThmx5gYOPkZsLt1pU58qgm8EPcSMA4t8l6COVgUOJtuhX7P5VB
	 NvQ+E96UeYF96b1YOv6FsLOorJq4qnbNNIIHZCTS+jo85ymxrL2fiYUZzfuOIyKScs
	 pKGJ/SYbTbNnXLpIMTr8J/N6WwhSxshzcgSOux+j557cJjeGytHdSuQrS47dT0r6dq
	 8MKrsMDuXJoSA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ad047710aso1288689eaf.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:56:44 -0800 (PST)
X-Gm-Message-State: APuU4Z9gZ4H1fcP4l2tFVDG4po4JZnAro6IG0pqHK/MsDSp+SrYKDWhy
	NbpWp6Z3QtthtsyxPiF9yXaesJBN1mW2Z0EXFX4MZIIVNAdSLudQseYZ+voh4YIjtw0nLW2eSaX
	3dpqvtaH6fPcz9xTeUIINoHu1H7VAMB4=
X-Received: by 2002:a05:6820:718e:b0:709:1cc3:ddee with SMTP id
 006d021491bc7-71b18565791mr3232862eaf.30.1795075003834; Wed, 18 Nov 2026
 23:56:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117052200.1507847-1-llleigoing@outlook.com> <20261117052200.1507847-3-llleigoing@outlook.com>
In-Reply-To: <20261117052200.1507847-3-llleigoing@outlook.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 19 Nov 2026 08:56:32 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqM1E9wzfjCzHcOy2SN6j0CjN6r94JYdPNt=RoLLDL5hw@mail.gmail.com>
X-Gm-Features: Aa3M54oHoxM2jrktDV6WswGASwLmtrm_DrDU4DbPoPZZCDg5xjCqEnOqEYYDEHY
Message-ID: <CAL4WiiqM1E9wzfjCzHcOy2SN6j0CjN6r94JYdPNt=RoLLDL5hw@mail.gmail.com>
Subject: Re: [PATCH net 2/3] net: bound receive window predictions before narrowing
To: lei lei <llleigoing@outlook.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>, 
	"ncardwell@google.com" <ncardwell@google.com>, "kuniyu@google.com" <kuniyu@google.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "horms@kernel.org" <horms@kernel.org>, 
	"matttbe@kernel.org" <matttbe@kernel.org>, "martineau@kernel.org" <martineau@kernel.org>, 
	"geliang@kernel.org" <geliang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 06:22, lei lei <llleigoing@outlook.com> a =C3=
=A9crit :
>
> tcp_rcvbuf_grow() and mptcp_rcvbuf_grow() compute growth terms in u64 but
> accumulate the predicted receive window in u32. The prediction can wrap
> before conversion to a memory budget and application of tcp_rmem[2].
>
> For example, oldval=3D16 KiB and newval=3D4104 KiB produce a slow-start
> window prediction of 4 GiB + 8 MiB. Storing it in u32 leaves only 8 MiB,
> so the memory limit is applied to an already truncated prediction.


The arithmetic is right, but I do not see a bug worth a net patch
and stable backports.

This needs @newval to be ~256 times @oldval between two consecutive
measurements. The "allow the sender to double its rate" logic was
never meant to be meaningful for such a sample: a 4GB prediction
out of 4MB copied to user space is garbage, wrapped or not.

What happens today: this round gets a smaller sk_rcvbuf increase than
the formula asked for (or none). sk_rcvbuf never shrinks here, and
the next measurement has a sane @oldval. So we lose one step.

What happens with your patch: a single sample like this sends
sk_rcvbuf straight to tcp_rmem[2].

This is the kind of sk_rcvbuf inflation we have been trying to avoid
lately, see commit aa251c84636c and the tcp_rcvbuf_low_rtt logic.
I am not convinced this is an improvement.

>
> Keep rcvwin in u64 and promote newval before the initial shift. Clamp
> the completed prediction at INT_MAX before passing it to the existing
> int-input window-to-memory helpers. Since scaling_ratio is a nonzero
> u8, the required memory is at least as large as the window. Predictions
> above INT_MAX therefore already require a saturated receive budget.
> The helpers' return saturation and the existing tcp_rmem[2] limit then
> provide the appropriate memory bound.
>
> TCP and MPTCP loopback tests using small warm-up reads followed by a
> queued burst of about 4 MiB previously left the budget below the
> configured 64 MiB limit. With this change, both reach that limit.

For TCP, the slow start branch is only taken if the RTT is above
tcp_rcvbuf_low_rtt (1ms by default). I guess you had to change this
sysctl to get this result over loopback ? Please describe the full
setup, including tcp_rmem[1].

More importantly, reaching tcp_rmem[2] after a single 4MB burst is
not a goal. What is the user visible problem here ? Do you have
numbers (throughput, drops, rcv window) for a real flow ?

If there is a real case where growth is too slow, I would rather
discuss the heuristic than the type of @rcvwin.

If you send this again:

- net-next, no Fixes: tag, unless you can show a real regression.

- Please split TCP and MPTCP changes. One patch with a "net:" prefix
  touching both, with a single Fixes: tag pointing to a TCP commit
  is not right for mptcp_rcvbuf_grow().

>
> Fixes: aa251c84636c ("tcp: fix too slow tcp_rcvbuf_grow() action")
> Signed-off-by: lllei <llleigoing@outlook.com>

Same remark about the Signed-off-by: than for patch 1.

Thanks.
