Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670305;
	b=Z2Vi079xa5KbVN3G4Z1ICisaKuAwpW9jFXMBc7oPtqbe5TXwQeDKjZDE/BZcX3+Ynrk0
	 bq2cTxqx8iXAxManhldNvjiQRhx1DFh53gESBzG6xGjRk5hgMphtyNGApAi31L3ATezyp
	 Nk+pGEdNXrC+MOreQTktViXuRGV8uWeh5kxoOMsHbPEw+LlMVs3h3heA7ptHeH4ihhUhu
	 ND08xoFcN64AbxIR/b5qpi11NBpBlsiEFnOD2WRsPCFp6kzrYmZzA9YSJzG7WtiM6zVJv
	 OcE/oPVfPVEdsP7xixYkBm/uEIWa9eYahzkbBZDDZO91QPzWfXdfb8riqpWNvMVymiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670305;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VQl4+torRmWh44depGiD8RWKcnHcYoG2BZy0f7lfgaY=;
	b=J2W6ykuXB/h2DO5xKTux+6Xl62y1KjPqmHmTeyBpl6iGJKlxnzS+IAbj6W2M2rzevghW
	 1jswxCYhUpAeMOTdsqjd4HD/cT92gKgevtaEt2z0diyRSHmqKp1bkM1OP7Qh43+rouSiJ
	 dCFbD/uOMYoUyQGXC3jo2LmZvveXJt+G/DFgDhOCbubVkYXqQuYNQSJRvxh2ZXSngX48q
	 1fMgyJiiVASCM81pLpZAPfYU6GwjC6O6HcYgM20ms76KRiPkV7PD6EK8LEO0idKkrkmcy
	 8wgEJKCISKghOGtMtUddDVXJq5V0qVHybcJBCghrP1n33+UhBvkphcK3sVMQ9vTO+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqpfNtvR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A1606A323
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqpfNtvR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF881F000C4
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670305;
	bh=VQl4+torRmWh44depGiD8RWKcnHcYoG2BZy0f7lfgaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QqpfNtvRj6HqABjXGhF0fLr28QS6XholUynu0RyvIC1qohx1TvXDcR1RBqcfoNbnF
	 zLxu9zseEdfQyTr+bH5EBr0KutoEfxBrdqa8bksVv3hDZIpxSHvpcz80DqFV3QGWXh
	 TFgIuuY+vJbHqSTabjM/vJrpDSQ4Ervf9X7WpJGxVrIrQdpIiOxVQnS19pU2YaAfvT
	 8aIIgbxtpHv9sN0LReQqefYaiQvOy58psxRF3+PDz4sM41Il1InosbjPCc+dJQyBBE
	 Nev9eY3ogMMYCgDwg3pwrPsK9za4NQ5UIaZTodUrGtXgf74mBGdfK4PSSviYN39cqK
	 xZRFNUvwb55mA==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df5e315bd1so2428303eaf.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:31:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkLk9KR0YDHFp0RutTvGpfeTl5OGFFU+7IoOkWmw7EvvrSxT1uBhPyoH89YkzMNKRfWS+AFXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OceNwFtpKK8AWO9FAllH8y3jl1uMzMA3kJGQLK0DDbGHy+bs9
	DS3a2EblMlxCpYJOCFlL01FBGd0tluMwVPhgCL2fgmrXpwtGvozjxlNuwz87PNu9Xc74ESYKk2Y
	J3UJwfF2JlvACFp41LCTlQpfH2NopKa4=
X-Received: by 2002:a05:6820:7085:10b0:71a:deda:68ce with SMTP id
 006d021491bc7-71adeda6e86mr306725eaf.81.1794670304555; Sat, 14 Nov 2026
 07:31:44 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-1-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:31:31 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqekjxZw3EoDYXLc0Phd3i0GStE2ZHWQkH2iAkSM5D8TQ@mail.gmail.com>
X-Gm-Features: AclHuK9EqHKICbtgVYLFdumnaFtuCF-ZR2TMXGt0b3cUpY2XP5UFZp5GrVuvHm8
Message-ID: <CAL4WiiqekjxZw3EoDYXLc0Phd3i0GStE2ZHWQkH2iAkSM5D8TQ@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 0/8] tcp: Prevent tcp_collapse() from bloating queue.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> This is a follow-up for commit 031c403d13e5 ("tcp: do not let
> tcp_collapse() drive sk_forward_alloc negative").
>
> The core algorithm in tcp_collapse() is so simple and has not
> been changed since commit 1da177e4c3f4 ("Linux-2.6.12-rc2");
> finding a collapsible skb and repacking it into up-to-SKB_MAX_ORDER()
> skb.
>
> Now that we use 4K MSS and tp->scaling_ratio, the simple algorithm
> does not work well, and it could even end up consuming more memory
> contrary to the intention.
>
> For example, the scaling ratio of SKB_MAX_ORDER() is 222, but
> typically tp->scaling_ratio for 4K MSS flow is 252, and repacking
> data rather bloats high-density skb.
>
> Also, once a low-density skb starts collapsing, it drags all the
> following skbs into collapsing regardless of the density.
>
> This series changes the algorithm so that it skips high-density
> skb and a single low-density skb between high-density skbs, batches
> memory accounting at the end, and removes sk_forced_mem_schedule().
>

Thanks for working on this.

I went through the series and ran it on a KASAN + DEBUG_NET kernel:
your packetdrill test, a packetdrill test collapsing the out-of-order
queue, and a loopback stress test (1-byte writes, small SO_RCVBUF,
payload checked by the reader). No splat, no corrupted payload.

I have comments on patches 1, 3, 4, 5 and 8.

One general remark: the series keeps linear skbs of
SKB_MAX_ORDER(0, 0) bytes as the collapse target, and uses their
density (86 %) as the definition of a dense skb.

I have been working on a patch storing the collapsed payload in
order-0 page frags instead: alloc_skb(0), then up to MAX_SKB_FRAGS
pages added while copying. A full skb is then about 98 % dense, like
a 4K MSS GRO packet, and:

- There are fewer skbs in the receive queue and in the out-of-order
  rbtree (one skb per 68 KB instead of one per 3.7 KB).

- Payload sits in full page-aligned frags, usable by
  TCP_ZEROCOPY_RECEIVE.

This does not replace your series: the selection logic (skip dense
skbs, stop at the first non bloated skb, skip ranges that would not
shrink) is still needed. But TCP_COLLAPSE_MAX_SIZE,
TCP_COLLAPSE_SCALING_RATIO, the estimation added in patch 5 and the
pool added in patch 6 are all built around the linear format, so I
prefer to mention it now.
