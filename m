Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425434;
	b=cd5RvSRXqDQuK5Pm8Y1amQ9uzmSwudVWg1sbvT6MM1ypLZ//YBGFOGUKI7O990BFWwkC
	 XmXL/edDGaNxvEjna2ah4P6bqvTnaoRk8fGlFGvDGnoQZwn6yUW9P2tC9pIJ+3DhkLLMj
	 751DAvWVX9fE5wwA9VP2MVIkrQAiACF4vuqrD4I0349TB4bBXBTgEEtJQhFr8wt8Ww7iZ
	 rxqpRJAfK0hnezl63ZAIdBH4tHkV56etWgwEApOaakGogudmdR9KPyAF7pyMmkouVzY/5
	 IgCzDjpK239nKv1Nd2IHdVemA83OH7ygS5ldak00TO/BO+FlzQ/9h4UwUyrA+hO5+Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425434;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2KIRo0DRE/jyfsT3OmSQz0ASdV76VBtH9uLmWxCW9h4=;
	b=YcN76IYAGQsQMNId6oP2u1eurO7Wq0cA0QueD07zbp/u/ScA+fB82Y3dkoRWnClQEsOc
	 p8vCXHzqrGlMq2CnT/lfByL9RZk4ju7RZOfs7O4kf4qudlvzeO0DJoLv2+q2Dzqj0re+i
	 V3k1vbPVP6npZxqKjKWenDjpOACf9iY4N5B3DgOsM/zZp3qmOVKO73IuyI6Wxp5NWUd8+
	 V5i10Dt/v53ukvxpy8JNELuMM3N/XBoDJ18yUCLvSIT1rKuxS11CV1IJKEVTfFpSsvJWM
	 jHE9oW3dUXC+ogk9BAXRdqPCemPqrL9AGriFLmTBxfA86A74kJRehjc1DDC1g7JQo4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOooB8xn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714F4606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hOooB8xn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F186A1F000E0
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425434;
	bh=2KIRo0DRE/jyfsT3OmSQz0ASdV76VBtH9uLmWxCW9h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hOooB8xnxn7Ht8+2tpIGOiz01ytHPjuguzuQSg6ZvYAIenVb8vXyMLUX0CuBR9cea
	 AnCUsYI02Jy9In7R1rhqRgyOAvaSu049/ST6X8uc59js1c154eZkAnKJClW1UeFZJK
	 JjRXuJF3B12T5h8YxMq7r5GBwgTznUDSP0Uz4+Z+7liDjc2b7U60oKPl8WgN6Kr9nn
	 +JfA6BpwVCpFvzxRE9a8lSDVua7ME0iMIhUceU0hZJlaHsfLqBoD8sfA2uTkxTPcUC
	 r/gIXrtMb0zWc4c19awO4n+dpFUyHNJmdYRYKmcUvbKqifMEAD1UqELlZBcx40TZFZ
	 AVtEkxpIezy/Q==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53c156ba662so1661324b6e.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:17:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGyy+EnSuZhBYUO7Sjaf4+MNwvaGzUO6eQg/cCWoOiiKQHBIjovwNuXp0u1PNBs7Ovf7aocprI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ULYq9vGQJ1qL68cVp9kZKYdKnAZZIcnLFPguSzLT/DIrisMSc
	OFZKQIyazmB2k31BY/dUC/2tZV1qwgEbaNgUyw7Lci4tESz9L4lgEQUVzJKv/h7ptPxgXmmb4cm
	muT46OC9cqS36UzcI1q28ROIQFnvXqxQ=
X-Received: by 2002:a05:6808:4fcb:b0:574:524d:f242 with SMTP id
 5614622812f47-57a0b34c96fmr12216631b6e.26.1795425433274; Mon, 23 Nov 2026
 01:17:13 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118224758.1617869-1-edumazet@kernel.org> <9013e41a-302d-4748-b9c7-058307140c3d@linux.dev>
In-Reply-To: <9013e41a-302d-4748-b9c7-058307140c3d@linux.dev>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 10:17:02 +0100
X-Gmail-Original-Message-ID: <CAL4WiiruW9sj=KsdYHXyJvAaRK8hxP-bm0=AGNrbSt7gEq8rXQ@mail.gmail.com>
X-Gm-Features: Aa3M54obqwv3gnptkNfg3cmRkSRl-M0WEsjC8WyKuQCQN5rm8J4C4UJQMDbSS8c
Message-ID: <CAL4WiiruW9sj=KsdYHXyJvAaRK8hxP-bm0=AGNrbSt7gEq8rXQ@mail.gmail.com>
Subject: Re: [PATCH net-next] tls: wait for a single RCU grace period in tls_device_down()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 05:08, Jiayuan Chen <jiayuan.chen@linux.dev> a =
=C3=A9crit :
>
>
> On 11/19/26 6:47 AM, Eric Dumazet wrote:
> > tls_device_down() calls synchronize_net() for each offloaded context
> > bound to the device going down. As this runs from the NETDEV_DOWN
> > notifier, a device with N offloaded sockets waits for N RCU grace
> > periods while RTNL is held.
> >
> > Split the loop:
> >
> > - First stop the offload for all contexts: switch to the software
> >   fallback, clear ctx->netdev and set TLS_RX_DEV_DEGRADED.
> >
> > - Then call synchronize_net() once, if there is at least one context.
> >
> > - Finally release the driver state and drop the reference of each
> >   context, as before.
> >
> > The contexts are on a private list with a reference held, and the
> > first step only writes to fields of each context. The only change in
> > behavior is that all contexts stop being offloaded before the driver
> > state of the first one is released.
> >
> > Compile tested only, with CONFIG_TLS_DEVICE=3Dy.
>
>
>
> I tested this with the netdevsim TLS offload emulation [1] (changed a lit=
tle locally): N sockets with
> TX and RX offloaded on one port, then "ip link set down" on it.
>

Thanks for testing !

> sockets    before    after
>     100   12.7 ms   8.6 ms
>    1000   39.1 ms   11.5 ms
>    5000  160.8 ms   19.2 ms
>   20000  577.2 ms   44.1 ms
>
>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> [1] https://lore.kernel.org/netdev/20261117140642.4008-1-jiayuan.chen@lin=
ux.dev/
>
