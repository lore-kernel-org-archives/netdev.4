Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670626;
	b=utg5SMpb+tSLep8VXRD8/7J1PfIw8hZxQVhx1tjdNWfVCHwfYqHZWlFlbFu/T3y9m5ZU
	 JaqklOWUjzHOipj2mGE8OoJI5B2r5ce4i/TyvITlBfVtLy6n/dOiQS8YQt5cf2/lgC5gr
	 2ULCXEa1t4x4FTOZAvXpBmBVPRCJ09Ft8dxuXqDXe797stLwvxNfVBkVvmXv0chXABp45
	 P22ngGkQwGI5A/XaTndjTigwR1MJbV210BUXSNK7OOIgtCJL907azVRxsLChboUK7EA0u
	 rOtUlzQ3kLC+e68bBD1V7Y4JK1U7DpuAfMiUItcKz+cVnXH/4pd4YVPyC8bhKq+CO7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670626;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oRefWtX8Pu2W+mOByw0R79zA6iG0BY9x6AwxjAXt4qE=;
	b=BUSP/x1GEg3mmb0At85y9HIIlUDE+cRjShPhrz3IuOaqmL1YIhXXn5pWfKQ3gvAqxsc8
	 CUDj58Zm4O5SZIdbBis8WqLX6FXcuBOro2Z/WBDYIPemtw3VfMxbvBYaJpfiAejpsvWyW
	 VwAhh/WB2cInflEIQCcWmfvl4zpWBj5qr1/lIhiXM8B3LpN2FDFJ8wjq051/lSjYKCKkR
	 K9krbhHgL8Oruq7Sq5OjfjnavLoiV5FCwDGqpDg6q/bb+QVjN6hNWx6+Jg8QAt515RFEQ
	 Wlwv/wCOGusA0iu48zeJ73JhPRovxTUnVqVQBC4l4+SfDnHZZPZgUip0pejdYJDQSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qhq1wn0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B340606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qhq1wn0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419CE1F000C5
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670626;
	bh=oRefWtX8Pu2W+mOByw0R79zA6iG0BY9x6AwxjAXt4qE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qhq1wn0ejOMOMflz0uLZdB2bqIaeGxvEXFRZ8yz8lWBMcYeSHIQiLELpJ9Jpb2/w7
	 ytDYAtxcifvG3SYQ6qP4EAcJqX/6X/Wui/djBmHd1VjjKFIuwTid2FfC+ghliTK5zq
	 spIag0MlZti67JUfUd0O9npf0/WH0Dt0OmMRMw2N6iTQxIIJE4dxImXRAkTHm/SNMZ
	 fxCbc/GmuqWXGFBz0DNv/nKAJyh6GKYIa1Fe2Q+ngkZWPE6u5N4dbO+CdQ/WkVRnRX
	 XgXF2DCPETwe1SJePPg/pFfAaUMlGU2bPzHkY7h8KfAeX8YR5cyWfSmaROUccobb3d
	 I/kTDGHTufC0g==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71ac798b8bbso911949eaf.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:37:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFE33q7nl9WcTPtgFpFqA9jrZ/d6nv6+hKE0R1He4Tt9lmBmP8C6JLEh5NceHS6bFs1Re/YG98=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j3vL0eUX8+NNfS4GcXPRbkt8RCOMmgMuJuTXkhm4VxIqjG7h7
	kBQLiJU15yqhHpC20flvMoLvRjtRjiZmx0gOeV+4MWrME+0JIgKov0+0ol4LGuOTP9JW/53y6b7
	C6zfp0bVGe+Ko5Oj3l2tyeGR9LUuRYZo=
X-Received: by 2002:a05:6820:7097:20b0:6d8:3caa:a469 with SMTP id
 006d021491bc7-71ab520b463mr2278455eaf.88.1794670625595; Sat, 14 Nov 2026
 07:37:05 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-6-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-6-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:36:54 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqFAcFVH94yNZGOTyYuhQuwfcD6EXhO1UQ5cDZaONN8ag@mail.gmail.com>
X-Gm-Features: AclHuK9-WWk39T9UQXHLXgwgiD03hwwGKBpfU23VDsbupOeaEuZbcu8M9oCL9GQ
Message-ID: <CAL4WiiqFAcFVH94yNZGOTyYuhQuwfcD6EXhO1UQ5cDZaONN8ag@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 5/8] tcp: Skip collapsing if collapsed skb is less-dense.
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> Once tcp_collapse() finds a collapsible skb, it collapses
> consecutive bloated skbs.
>
> However, the end result could be the same or larger than
> as is in some cases:
>
>   1. skb is already minimum
>
>      If SKB_HEAD_ALIGN(len) <=3D SKB_SMALL_HEAD_CACHE_SIZE,
>      skb is allocated from skbuff_small_head, and skb->truesize
>      never changes.
>
>   2. SKB_HEAD_ALIGN() and kmalloc_size_roundup() in alloc_skb()
>
>      Assume two bloated skbs with len =3D 1448 B (truesize =3D
>      2304 B, scaling_ratio =3D 160) and len =3D 300 B (truesize =3D
>      896 B, scaling_ratio =3D 85), whose total truesize is
>      3200 B.
>
>      Collapsing them calls alloc_skb(1748), which rounds up
>      SKB_HEAD_ALIGN(1748) =3D 2112 B to 4096 B and allocates a
>      new skb with truesize =3D 4352 B (+1152 B!).
>
> Even worse, in case 1, such a skb is reallocated repeatedly
> by every tcp_collapse() in vain.
>
> Let's calculate the final collapsed truesize before collapsing
> skbs and skip the range if it does not shrink.
>
> We could allocate skbs first and calculate the new truesize,
> but given tcp_collapse() is called under memory pressure,
> we want to avoid unnecessary allocation.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
>  include/linux/skbuff.h |  7 +++++++
>  net/ipv4/tcp_input.c   | 24 +++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index d36fbb88b3f6..618e629df15a 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -292,6 +292,13 @@
>                          SKB_DATA_ALIGN(sizeof(struct sk_buff)) +       \
>                          SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
>
> +/* return estimated truesize allocated by alloc_skb(X) via kmalloc_reser=
ve() */
> +#define SKB_ALLOCSIZE(X)                                       \
> +       ((SKB_HEAD_ALIGN(X) <=3D SKB_SMALL_HEAD_CACHE_SIZE ?      \
> +         SKB_SMALL_HEAD_CACHE_SIZE :                           \
> +         kmalloc_size_roundup(SKB_HEAD_ALIGN(X))) +            \
> +        SKB_DATA_ALIGN(sizeof(struct sk_buff)))
> +

This duplicates the logic of kmalloc_reserve() in a header, far from
it. Nothing will remind us to update the macro when kmalloc_reserve()
changes.

This matters after patch 7: if the estimation is smaller than what
alloc_skb() really provides, @released can be negative, and
sk_forced_mem_schedule() is no longer there to protect
sk->sk_forward_alloc.

Please add a function in net/core/skbuff.c, next to
kmalloc_reserve(), returning the truesize of an skb allocated by
alloc_skb(size, GFP_ATOMIC), and ideally make kmalloc_reserve() and
this function share the size computation.

Then patch 4 is not needed.

>  struct net_device;
>  struct scatterlist;
>  struct pipe_inode_info;
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 5bd42a74c6f5..fe71305f6e67 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5850,8 +5850,10 @@ static void
>  tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root =
*root,
>              struct sk_buff *head, struct sk_buff *tail, u32 start)
>  {
> +       int old_truesize, new_truesize;
>         struct sk_buff *skb =3D head, *n;
>         struct sk_buff_head tmp;
> +       int remainder, nskbs;
>         u8 scaling_ratio;
>         u32 sub_end;
>
> @@ -5891,6 +5893,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *=
list, struct rb_root *root,
>
>         /* Second, find consecutive collapsible skb. */
>         sub_end =3D TCP_SKB_CB(skb)->end_seq;
> +       old_truesize =3D skb->truesize;
>
>         for (n =3D tcp_skb_next(skb, list); n && n !=3D tail; n =3D tcp_s=
kb_next(n, list)) {
>                 if (!skb_frags_readable(n) ||
> @@ -5898,8 +5901,10 @@ tcp_collapse(struct sock *sk, struct sk_buff_head =
*list, struct rb_root *root,
>                     !tcp_skb_can_collapse_rx(skb, n))
>                         break;
>
> -               if (!after(TCP_SKB_CB(n)->end_seq, sub_end))
> +               if (!after(TCP_SKB_CB(n)->end_seq, sub_end)) {
> +                       old_truesize +=3D n->truesize;
>                         continue;
> +               }
>
>                 /* seq and end_seq must increase monotonically for rbtree=
. */
>                 if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
> @@ -5908,6 +5913,23 @@ tcp_collapse(struct sock *sk, struct sk_buff_head =
*list, struct rb_root *root,
>                         break;
>
>                 sub_end =3D TCP_SKB_CB(n)->end_seq;
> +               old_truesize +=3D n->truesize;
> +       }
> +
> +       /* Third, check if the new skbs have high density. */
> +       nskbs =3D (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
> +       new_truesize =3D nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
> +
> +       remainder =3D (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
> +       if (remainder) {
> +               nskbs++;
> +               new_truesize +=3D SKB_ALLOCSIZE(remainder);
> +       }
> +
> +       if (old_truesize <=3D new_truesize) {
> +               start =3D sub_end;
> +               skb =3D n;
> +               goto restart;
>         }
>
>         while (before(start, sub_end)) {
> --
> 2.56.0.611.g1030f0b940-goog
>
