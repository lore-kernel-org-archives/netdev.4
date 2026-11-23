Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457072;
	b=plJcITR9waJmUIWbQQo3Kokh/OwwgY/0D29NRkGsh0K8w3pv+NwqQ4/ec1IgMwHlgZVH
	 VTxc757q+ppJSCSgE4MYD1mlbB3hmk5IYgTwKOSek+ozM9tmg3GkTb3B9f1KsYEZbacQh
	 AUDX4eJH2NPQ8wb+xKdJPF+KnNAW/MvuMbDaDnjGdPvn4wWqkh66Cbdahz5G02j24NDDY
	 dlcv46mNZXmKZdmYrX8omNkioADECjAEmGNneNDe4CDas2lMKSQ0Uh/TKH4+me0vugIMv
	 t8EiJFTMzvNOrjIiEBNKhdKVYGWqiGwvShbhMTblVn/jg3NVXtOZsiqZPCIxsl2yK0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457072;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=L11swEeJ1ew2lZyx0Wb6tGFYANDYS1G/jL/Lf64CdLo=;
	b=lQYlhrSGccoNMsFisFironN9wGFBzC+uApsxntF8LHy2p8i7Lr+APio22wk2f1piXdBm
	 bOoboTBA7xuQgBfsdxR1LV5MmlesPIrEc0CIKyPvA8KjR7Soq5ayzr9BbZsuX9r59ur8/
	 sukMS6L/6uvAFC0z55M8C69Il3wzWGsOr22SL3x2lMovUg1IXs1qyTU4XKxWylRy+9UMU
	 12Du1hnp5fFAuX5QfmsFuBw6hady9OycCjH8f/PnPT0a00JLoMcY6vMq1JflKUo1e/uvx
	 Yl6qXFMDcrg71qsjPnjkKA7xMT90fyy0vVnFQOClQReAlnRn1zyZpSZyTbH1CaSDD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhOzJrXN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE5606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhOzJrXN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8100B1F0089E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795457072;
	bh=L11swEeJ1ew2lZyx0Wb6tGFYANDYS1G/jL/Lf64CdLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GhOzJrXNGsU8hDynlqn3CUBYZv6ZoubPJCZhHoORLW4DVgH0wfkA59gLLfclxOjII
	 vBQdW7xfClRHGR0Kt0R6c4NY/jCDXT7OtyfaWD8eMJAag41ke3hIBUAGJ5wh3zJ5FW
	 7UtvbDXkU9fO8+ock2XRyVy9tYVUG3TGnnSUoYRxLU6EMsWVU8JurkHbdZYGTMDnms
	 6ccd/EIUZ6ZljD0GIgQBLaC/nCLmgUICmNozIRugDdcVEVHMgid6Sycu1695Dua5Vx
	 SgPE/FXGGEjlSgxkM3ctXmTKnGT3kkU+xLPPnCxLye0k3mLsLNUuIMyJr/4zM93iEg
	 dYHU9qRsb8pkA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-71ac9e15640so2321196eaf.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:04:32 -0800 (PST)
X-Gm-Message-State: APuU4Z8qx9fventrOhMRhNPaY3OF32zpAy7QugZx9s1GyfB9gn9aALmE
	8E73JLG+iqmEeqraXMxh0PifwM87wmpbaPZ1iXPFBlWmLA1GEdhA7UtFuudB4+gscJBFk6476vs
	Xkd4NscwLlbLv0WpGbOI/hsnARt0fh3g=
X-Received: by 2002:a05:6820:55da:10b0:71a:f794:49c2 with SMTP id
 006d021491bc7-71b39501d54mr6792362eaf.55.1795457071843; Mon, 23 Nov 2026
 10:04:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123122432.297135-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261123122432.297135-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 19:04:20 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqMpfQr_m8O+=nSM=0f=UwktPVZaizs9Q0mCm_7ceZfeA@mail.gmail.com>
X-Gm-Features: Aa3M54pBQ5tMrvyFxMT1C74KMmB0wbelc_7xhsKqHOGLaFEDly8f9a5KtMvXsdw
Message-ID: <CAL4WiiqMpfQr_m8O+=nSM=0f=UwktPVZaizs9Q0mCm_7ceZfeA@mail.gmail.com>
Subject: Re: [PATCH net v3] tcp: fix negative sk_forward_alloc after
 MSG_ZEROCOPY append
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Wei Wang <weiwan@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Soheil Hassas Yeganeh <soheil@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 13:24, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
> Our local syzbot reported the following warning:
>
>
>
> The problem is here:
>
>   if (!skb_zcopy_pure(skb)) {
>           copy =3D tcp_wmem_schedule(sk, copy);
>           if (!copy)
>                   goto wait_for_space;
>   }
>
> When MSG_ZEROCOPY data is appended to a skb that already holds copied
> data, only the user length is scheduled, but the pinned pages are then
> charged by their truesize:
>
>  skb_zerocopy_iter_stream
>    __zerocopy_sg_from_iter
>     zerocopy_fill_skb_from_iter  //truesize +=3D PAGE_ALIGN(copied + star=
t)
>     sk_mem_charge(sk, truesize)  //sk_forward_alloc goes negative
>
> For example, sending 8 iovecs of 1 byte each schedules 8 bytes and
> charges 32768 with 4K pages.
>
> On a later sendmsg() without MSG_ZEROCOPY, if sk_wmem_schedule() fails
> (e.g. tcp_mem hard limit is reached), tcp_wmem_schedule() returns
> min(copy, sk->sk_forward_alloc), which is negative. The negative copy
> is passed to skb_copy_to_page_nocache() and triggers the warning, and
> sendmsg() fails with -EFAULT.
>
> A few options were considered:
>
> 1) Schedule the truesize up front. It is not known before the pages
>    are pinned, it depends on the iovec layout.
> 2) Do not append zerocopy data to a non pure skb. This splits a small
>    header and its zerocopy payload into two skbs.
> 3) Schedule the missing part right after the pages are charged. They
>    are already in the skb at this point, so this can not fail.
>
> Go with 3).
>
> Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under memory pr=
essure")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
