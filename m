Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670540;
	b=aVQg/vWveYPqXvS0gwwYAL4MqwiG/UiLad/r2ZmT9QJjKpKhUOubDCxZ5iPI22hjWBHI
	 kFY+MqWd12IQ0Ie/M8D7B5QfQn3HBuo/yF9uAVykArwg8VWqcuePYtriLiK01sWb4eoBy
	 fAUH8GOOQ8j1tp5BmlHo5fGTWtZa+MBMQV6AwZeH3qseEo5/Se8NREH4q5L35gjbCo/vB
	 LmCqRpQ+PobORyRlMPFDfTPZ25HMmn4merSGHamrUwtihavZ7PE/vtP3ev4fjaN7Qq/lS
	 MxzfPaxS4O2O5e04qWG8bkCqv7leaNMle/94DTF8AZdVWn5sf86TkQ70DARXklRHU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670540;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h6cJ0EyXNfGdIua7bIXNdAoaF3G6gbAhGttykx8Q5yg=;
	b=Cjm9RNeoYL4m3SjQYcE2oGi3yvfjdypeFl9yfn4Z1PHCP1M+m4OFpPYtu0FjkNqlNHgg
	 kqjEJnAaEIQIrEsxDzuTujzkU+D99zDvSoZt0WwD/3xn7EsBiMgV8JqtXBHv061NNVCT8
	 CAGMCZNEgHC8sMO7uqCCI2lrEu4npwBlKZt7Pv9qavfW9xtBs+cp0O/Ga7qsXpX3yIqdY
	 cMoa4JDLsc7Gut5aczMB/m+Q3KrMBDE/YeOizLsMXUaWvZBf39LRgz4bIELfEXum1uo8U
	 c1wlzt5u8rGd7fTCZZexEfDvJ+yybdyvw+/XCP1ODSdjkxoqU3mvdrMsrusE9qN+VUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpoN+Uwq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFB4606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpoN+Uwq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217561F000CB
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794670540;
	bh=h6cJ0EyXNfGdIua7bIXNdAoaF3G6gbAhGttykx8Q5yg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QpoN+UwqVnzefiBzmnCkBgafYRf1m/WjijpnRCFM6jh/4WiR+HtV8+Zn+DxQQUM+L
	 JnpLlWl5pxJSxA250cwq/vJ7Nyj+wvh8BM2oOHkW0inZOt8Yq+lCSPrDc1k+7h5F1m
	 2cg3Sh7u02UJGn/D0rwJPE25w3EjfsH9BIsaG33B35/1lxARyCW3YPFfV2uJYV40JU
	 rkbhcr3TnLQqEjem8mIjHU+U1fahCFaiH5tTdBqVIcfZyZ3LZEokJJFF7Etuo2GqTh
	 wqG0XH64n4RSOFiKkY4y/vg3W81Tce8RgQQS7OGGjN8yX7xsCvPl3vUv7tnQ3GxkE/
	 tC9sV0yV+2OjQ==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6d68de53053so1191142eaf.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:35:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH8yezKQw+YAAS6ygzVyFgHVS0Q6BsoQWuLPAWWtvNg6ZMLCiJLQFYb/JIbGnFpPyYo6/YT3jI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zrNdNpTHE1kT0xCXbi7Nkrk/9G0BT6OaG5RXFeYG329IcJqrm
	M2JoMds6O+J9SINhywlN1LMQNmLcdzVlaBMv+2BcWCokCovb/SzMbY9hb2TUsBlymgNMs/zT3Ug
	ooQZk2mq+hHH0WnGKbCjtgKWz6hX4Wcw=
X-Received: by 2002:a05:6820:f02a:b0:703:27e0:354 with SMTP id
 006d021491bc7-71ab51f5d68mr3284744eaf.66.1794670539365; Sat, 14 Nov 2026
 07:35:39 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-4-kuniyu@google.com>
In-Reply-To: <20261114040101.1043546-4-kuniyu@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sat, 14 Nov 2026 16:35:28 +0100
X-Gmail-Original-Message-ID: <CAL4Wiipd9jDp+rVAo44-JDVtXrGR_0cubE3yaZ5Qb6w8-s+6Zw@mail.gmail.com>
X-Gm-Features: AclHuK93VLY1LQEmztApsJAHQXZYNwJgF9B1wOHIR0kx6nw25Lq9PuEUju-ecXE
Message-ID: <CAL4Wiipd9jDp+rVAo44-JDVtXrGR_0cubE3yaZ5Qb6w8-s+6Zw@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 3/8] tcp: Stop collapsing if not bloated.
To: Kuniyuki Iwashima <kuniyu@google.com>, Matthieu Baerts <matttbe@kernel.org>, 
	Mat Martineau <martineau@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> a =
=C3=A9crit :
>
> Even when a skb is not bloated, tcp_collapse() starts collapsing
> if the next skb has overlapping data.
>
> Also, tcp_collapse() does not stop until it reaches the tail or
> unmergable skb (SYN/FIN, unreadable frags).
>
> Assume we detect a low-density skb followed by fully-packed 4K-MSS
> GRO skbs:
>
>              skb->len  truesize  scaling_ratio
>   skb    #1      1448      2944      125 (49%)
>   skb    #2     65536     66432      252 (98%)
>   skb    #3     65536     66432      252 (98%)
>   ...
>   skb    #9     65536     66432      252 (98%)
>   --------------------------------------------
>   total                  534400
>
> Then, even the high-density skbs are repacked into lower-density
> skbs, and we end up consuming much more memory.
>
>              skb->len  truesize  scaling_ratio
>   nskb   #1      3776      4352      222 (86%)
>   nskb   #2      3776      4352      222 (86%)
>   ...
>   nskb #139      3776      4352      222 (86%)
>   nskb #140       872      2304       96 (37%)
>   --------------------------------------------
>   total                  607232 (+72832!)
>
> Even if we find a collapsible skb, we should not collapse
> subsequent skbs with scaling_ratio >=3D TCP_COLLAPSE_SCALING_RATIO.
>
> Conversely, even if tp->scaling_ratio is smaller than
> TCP_COLLAPSE_SCALING_RATIO, we should repack skbs once we
> start collapsing, which results in higher-density skb.
>
> Let's remove the next skb condition in the first loop,
> search for collapsible bloated skb range, and repeat
> collapsing for each range.
>
> Note that even when the next skb is not bloated, we must
> collapse it for OOO rbtree if it has overlapping data.
>
>         if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
>             !tcp_collapse_skb_bloated(n, sub_end,
>                                       TCP_COLLAPSE_SCALING_RATIO))
>
> For example, bloated skb_1 and non-bloated skb_2 have overlapping
> data and only skb_1 is collapsed to nskb_1 and nskb_2.
>
>    skb_1 =3D [1000, 5000]
>    skb_2 =3D [2000, 66000]
>
> Then, nskb_2 will be inserted after skb_2 in rbtree, wrongly
> setting tp->ooo_last_skb to 5000.
>
>   nskb_1 =3D [1000, 4776]
>    skb_2 =3D [2000, 66000]
>   nskb_2 =3D [4776, 5000]
>
> This case is still inefficient, but a later patch handles this.
>
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
>  net/ipv4/tcp_input.c | 66 +++++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 29 deletions(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e07f43347409..5bd42a74c6f5 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5839,7 +5839,7 @@ static struct sk_buff *tcp_collapse_one(struct sock=
 *sk, struct sk_buff *skb,
>  }
>
>  /* Collapse contiguous sequence of skbs head..tail with
> - * sequence numbers start..end.
> + * sequence numbers start..sub_end.
>   *
>   * If tail is NULL, this means until the end of the queue.
>   *
> @@ -5848,15 +5848,18 @@ static struct sk_buff *tcp_collapse_one(struct so=
ck *sk, struct sk_buff *skb,
>   */
>  static void
>  tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root =
*root,
> -            struct sk_buff *head, struct sk_buff *tail, u32 start, u32 e=
nd)
> +            struct sk_buff *head, struct sk_buff *tail, u32 start)
>  {
>         struct sk_buff *skb =3D head, *n;
>         struct sk_buff_head tmp;
>         u8 scaling_ratio;
> +       u32 sub_end;
>
>         scaling_ratio =3D min(tcp_sk(sk)->scaling_ratio,
>                             TCP_COLLAPSE_SCALING_RATIO);
>
> +       __skb_queue_head_init(&tmp);
> +
>         /* First, check that queue is collapsible and find
>          * the point where collapsing can be useful.
>          */
> @@ -5872,38 +5875,48 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
>
>                 /* The first skb to collapse is:
>                  * - not SYN/FIN and
> -                * - the unread portion starting from "start" is bloated,=
 or
> -                *   overlaps to the next one and mptcp allow collapsing.
> +                * - the unread portion starting from "start" is bloated.
>                  */
> -               if (!skb_frags_readable(skb) ||
> -                   TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN=
))
> -                       goto skip_this;
> -
> -               if (tcp_collapse_skb_bloated(skb, start, scaling_ratio))
> -                       break;
> -
> -               if (n && n !=3D tail && skb_frags_readable(n) &&
> -                   tcp_skb_can_collapse_rx(skb, n) &&
> -                   TCP_SKB_CB(skb)->end_seq !=3D TCP_SKB_CB(n)->seq)
> +               if (skb_frags_readable(skb) &&
> +                   !(TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_F=
IN)) &&
> +                   tcp_collapse_skb_bloated(skb, start, scaling_ratio))
>                         break;
>
> -skip_this:
>                 /* Decided to skip this, advance start seq. */
>                 start =3D TCP_SKB_CB(skb)->end_seq;
>         }
>
>         if (!skb || skb =3D=3D tail)
> -               return;
> +               goto end;
>
> -       __skb_queue_head_init(&tmp);
> +       /* Second, find consecutive collapsible skb. */
> +       sub_end =3D TCP_SKB_CB(skb)->end_seq;
> +
> +       for (n =3D tcp_skb_next(skb, list); n && n !=3D tail; n =3D tcp_s=
kb_next(n, list)) {
> +               if (!skb_frags_readable(n) ||
> +                   TCP_SKB_CB(n)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN) =
||
> +                   !tcp_skb_can_collapse_rx(skb, n))
> +                       break;


Adding MPTCP maintainers.

Before this patch, each candidate was tested against the current new
skb:

        !tcp_skb_can_collapse_rx(nskb, skb)

and nskb is the result of mptcp_skb_ext_move(nskb, skb), done with
the skb that was being copied when nskb was allocated.

Now all candidates are tested against the first skb of the range,
before any extension has been moved.

mptcp_ext_matches() is not symmetric (a 'from' skb without extension
matches anything), so the two are not equivalent when the range needs
more than one new skb. For instance:

  skb1 (ext A, 6000 bytes), skb2 (ext A)

nskb1 gets ext A, nskb2 is allocated while skb1 is still being
copied and gets no extension. Before the patch, skb2 was not merged
into nskb2 (to_ext =3D=3D NULL, from_ext !=3D NULL). Now it is, and its
extension is dropped.

This might be fine since skb2 has the same mapping as nskb1, but
I would like MPTCP folks to confirm, and the changelog should
mention it.

The rest of the patch looks good to me.

> +
> +               if (!after(TCP_SKB_CB(n)->end_seq, sub_end))
> +                       continue;
> +
> +               /* seq and end_seq must increase monotonically for rbtree=
. */
> +               if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
> +                   !tcp_collapse_skb_bloated(n, sub_end,
> +                                             TCP_COLLAPSE_SCALING_RATIO)=
)
> +                       break;
>
> -       while (before(start, end)) {
> -               int copy =3D min_t(int, TCP_COLLAPSE_MAX_SIZE, end - star=
t);
> +               sub_end =3D TCP_SKB_CB(n)->end_seq;
> +       }
> +
> +       while (before(start, sub_end)) {
> +               int copy =3D min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - =
start);
>                 struct sk_buff *nskb;
>
>                 nskb =3D alloc_skb(copy, GFP_ATOMIC);
>                 if (!nskb)
> -                       break;
> +                       goto end;
>
>                 memcpy(nskb->cb, skb->cb, sizeof(skb->cb));
>                 TCP_SKB_CB(nskb)->has_rxtstamp =3D false;
> @@ -5942,15 +5955,11 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
>                         }
>                         if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
>                                 skb =3D tcp_collapse_one(sk, skb, list, r=
oot);
> -                               if (!skb ||
> -                                   skb =3D=3D tail ||
> -                                   !tcp_skb_can_collapse_rx(nskb, skb) |=
|
> -                                   (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR=
_SYN | TCPHDR_FIN)) ||
> -                                   !skb_frags_readable(skb))
> -                                       goto end;
>                         }
>                 }
>         }
> +
> +       goto restart;
>  end:
>         skb_queue_walk_safe(&tmp, skb, n)
>                 tcp_rbtree_insert(root, skb);
> @@ -5989,7 +5998,7 @@ static void tcp_collapse_ofo_queue(struct sock *sk)
>                         if (range_truesize !=3D head->truesize ||
>                             end - start >=3D SKB_WITH_OVERHEAD(PAGE_SIZE)=
) {
>                                 tcp_collapse(sk, NULL, &tp->out_of_order_=
queue,
> -                                            head, skb, start, end);
> +                                            head, skb, start);
>                         } else {
>                                 sum_tiny +=3D range_truesize;
>                                 if (sum_tiny > sk->sk_rcvbuf >> 3)
> @@ -6103,8 +6112,7 @@ static int tcp_prune_queue(struct sock *sk, const s=
truct sk_buff *in_skb)
>                 if (!skb_queue_empty(&sk->sk_receive_queue))
>                         tcp_collapse(sk, &sk->sk_receive_queue, NULL,
>                                      skb_peek(&sk->sk_receive_queue),
> -                                    NULL,
> -                                    tp->copied_seq, tp->rcv_nxt);
> +                                    NULL, tp->copied_seq);
>
>                 if (tcp_can_ingest(sk, in_skb))
>                         return 0;
> --
> 2.56.0.611.g1030f0b940-goog
>
