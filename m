Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794673100;
	b=KyWDe9KPqZrgLWBxLEe9CrZA5XK6kpLcfgxvSja5kq+B4sB4Dhlwq0zC5AGHNXcRz6AS
	 Kcel4MnnWA0EYkYyv5uTGDaFiXApBbkGZncJ9QKBT+QKG2dR7DTqCyrfmbZWQ/LgUb9MH
	 NiOE7XzCJ3acCCILeO5p3NMY70ixrRGCybS8hdlnOzt8CaEEy2bsbeRVbEawMTIvmr6Jf
	 6hBwTtPXMzX49woj7d6pCbUJ6V3NbRiHbd/HacA0CkryX6b0jww4P7P+Es7NJCHKwll9h
	 CaENDoYjYxD8DRZbJhW8JaPHwNj/naxkHiEa0TFxYTLc6AcJwJIK29kWpASzzM/eBzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=exWpDPLwGWVYK5IsKpEdwc7KA5EMHkYY+o7DOUZ5iJI=;
	b=hRGpchH0eS6z6D7f9aBjCPvGbmEkUIAZ29ONZMbadZ3grfwFBFd/r3H3JX5k4ddLij3X
	 VHBwLxLsW/+mvAnxAIoaYq81CTkbrY0btQrSm0YA5JrgeN2sNAzgFibtBx81f72Z2PRD6
	 lqA+acBqR5g8x06q8KQiZM2my9hrVSH0in8HVlkqjEfTwUVQnr3LPCrV+Q5siBZLp6eIF
	 Lxtimq5CeSzXPDxp0G5K7rLmvInJ3xnw05Sze3qqZlMAOqEiGajXJzvQwbYWY3IsztEWc
	 zVl8RgNJCDJrAN2RZQzUQWQ7Sl8drG1BsceJEIJ+RlMZck61leFOIFeRy4XbXydj3xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mun+Nuf1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF2606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FF2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mun+Nuf1
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so5992279eec.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:18:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673099; cv=none;
        d=google.com; s=arc-20260327;
        b=TbM7FrZ7Mhr4vMkkh3kTwoYnY7Qnb2h4UxG94AHcTVTzjOQeUfA35SN45lauVjg7Wu
         gZW3Av3hTIu1D1ngITnJKJoWDYFyCDgOtPmOdGool0dte6jHU5+fcnQVsNtDO6QX4PTy
         PnvzZ7hfs3bBx/6/5EPhBzj0z5eBuksPw3lD5tGu/zxYUb5wDNAxFYR9sJsaLIKUT9Xq
         c0veiJOwJP99cH7Et4iS/XDnT0sRb7be6p5qJH4mJ7iyjavQmHC7s0NjTR3q5+9pbPm5
         BdS7tBIJmcgRiCpBrtVSOKUDlL3MLqf/JZ5jK++7UW3iGBqKEQqku/YSNECEsMeV0wmn
         82yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=exWpDPLwGWVYK5IsKpEdwc7KA5EMHkYY+o7DOUZ5iJI=;
        fh=+jifr2H8uYxuQZ4M4aR4wHgZIV1Jzn5fn0ah0REkOd8=;
        b=i416VSAFCvFLIwC8kBPLbMdtm5gqfGJrAblUwcFMAtKwtqZlkLxKT4UvL0+2JcT4Ij
         6tCfpdVeQD1s9yHceV3ecZbIFTPjY2uNVM4rsXLr991BV5nMPhfIW9aSGOoaStsyyx1y
         eAOOJU6j41KMkQFV+QmKHvxR/EOAjJsMxsnpBPY9699tb02zT36ec8oFzswTd7en3rrn
         sxgjEO0MytHt/kczhJGLiO//hB94DXA0aCO25ljc6+KoKHWYYjSQZDUFrWfRkNqgOo64
         QqjzRtoOXQsSaxLvJaiqN4nYL4E7MTAv0L+7HWjb7upas0BVPVm9pegtKHg+oB6aU0jF
         t4uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794673099; x=1795277899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=exWpDPLwGWVYK5IsKpEdwc7KA5EMHkYY+o7DOUZ5iJI=;
        b=mun+Nuf1EfCwb4/k9RI+N4Juiv+OSxnDKuSqRP6SAzsEy1vgyqgXGVxRqhgY/4XxWY
         Ye9C5kGiwFvyY1NDRIOL/TYZi2C7DOqxlLbyc4G2W/0Xe6GVEa8Lr8u0VpuKtSiHH0G4
         2qnCPCI5GqeDCPNyl8T5u7UOxM2+mAMin8Axp9b1iBvxe4hIhWuBZM4VuK3dvwAw+Y4u
         O6EYC4UfcAajGpJNd4ZQW1439vfP6aHhHF3L5PMyKmu34DpBt+dus6h2Ss+h/jxthdMf
         wm067HmcywmXnjAsgHbIehoPhE4pzNXrYCf04uQQvDif+xafNbJ4MQexdQsV9epceACc
         3KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673099; x=1795277899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exWpDPLwGWVYK5IsKpEdwc7KA5EMHkYY+o7DOUZ5iJI=;
        b=HCBMWRUXdbEYxnyF1xwHIOr7biinA6FK8cvQfO68DIxVWM8G/gO4JGVns/Co5oxyfb
         EAPThVTQDU7IN3pV/OyLcoo02qBKYNHI1Pj76mzeXjhMWC9NjV5UqDz4zs0uMmhf75y/
         Cv86ihioU6ZnpF6B7xVEu48AuyI14yB+CV/QkGcVZy+GWCo/0tpzysX0KHMn5u8d0RVQ
         zaIwi/xmUlqeqtB/2CCumtfTvvjZ8up2ghaWwJaoAHX9Ar9AJCN5aSU8EWk5MsKgp8bQ
         xrAh8viHerjnyyHw39LthgDh3yGGbxnF7d9HC1fdtps6M3XMWI/0STm2+oc2Gnn0/jBL
         hDzQ==
X-Forwarded-Encrypted: i=1; AL+hErGSUDBEiuBMbCAsYLPBrIonCFCfWVL2AU1c7irdkUgADnQIvUUmzFbvvnx9vLHh6eCKPrgrpcc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+MsViQcuhY7mYUkergByPBXFJwGWORFFOiWhkeZF31c2U9C/x
	JLpq70bWYAbZSxWmQyRUYjzqpyxTkIe6MXAHqWGkyvsg+aqOanbqR+4ldoPbvsOHZms2aIh+A7w
	cGFJwRha9vXtAes3z+/VW2vQN2aBnSwWX4/pCIYAr
X-Gm-Gg: AYBFou06ExmlHNSpnAvVS1uSGxoJ3/yUtpC00PsZkTRr0D3oExQJffovqYZI+bZZpYD
	50MS3EWuje4HYuxHfWvcsA7R09XhjIwUG4r5wiE04apTtoE6iR7WjvhQFpEMPQJYhbbx9oL1U5D
	zVe0hQTok6yCRLn+x7EoWMfE+jhmTpIEzYWd4t9ak+jKiP7X+pTOtLClWTuuodYzX5Ag1wVUy9W
	VtpCCQFLPSyiX2pcab6e4l/5vYL1aGzgzif++3kaoumF99IuKyFg2cDsCnSHWkkwMlQoiIdGfru
	AQYwPiRusnBlypqqp4ifeG8Szh6UMmN87Gep8tyfn9lEW6KA6jvw59DJ6ZC3mcw+GreWBK0iXbH
	mFdgyVKxdn9uY4Xxwv2iBIm2cb5VXoD0FgMTPkxggDPn8Sn2XxIwPYLe5LkvHNG4Qz+vT9JGKr6
	fhb2U5FlphtFf94L0P+TFguJlJYpVzWGo4K9kaLry0FqXGD3bVO0KCjDZH/SD8egcr6RF/XGufK
	1w2OAf5Tw==
X-Received: by 2002:a05:701b:251b:b0:17b:fed6:7449 with SMTP id
 a92af1059eb24-1b5031695bdmr6720885c88.47.1794673098409; Sat, 14 Nov 2026
 08:18:18 -0800 (PST)
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
 <CAL4WiiqFAcFVH94yNZGOTyYuhQuwfcD6EXhO1UQ5cDZaONN8ag@mail.gmail.com>
In-Reply-To: <CAL4WiiqFAcFVH94yNZGOTyYuhQuwfcD6EXhO1UQ5cDZaONN8ag@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:18:07 -0800
X-Gm-Features: AclHuK_zkC9OiF_WKeszHdYBHsUCbuXQ_iiXZ0UaDxWxv_0CUPQlHMtWNy7d2Ow
Message-ID: <CAAVpQUCoy6dhC5=f+cgazvXLB_8+r=g22_5gZLbfSus-pwmjgw@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 5/8] tcp: Skip collapsing if collapsed skb is less-dense.
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:37=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > Once tcp_collapse() finds a collapsible skb, it collapses
> > consecutive bloated skbs.
> >
> > However, the end result could be the same or larger than
> > as is in some cases:
> >
> >   1. skb is already minimum
> >
> >      If SKB_HEAD_ALIGN(len) <=3D SKB_SMALL_HEAD_CACHE_SIZE,
> >      skb is allocated from skbuff_small_head, and skb->truesize
> >      never changes.
> >
> >   2. SKB_HEAD_ALIGN() and kmalloc_size_roundup() in alloc_skb()
> >
> >      Assume two bloated skbs with len =3D 1448 B (truesize =3D
> >      2304 B, scaling_ratio =3D 160) and len =3D 300 B (truesize =3D
> >      896 B, scaling_ratio =3D 85), whose total truesize is
> >      3200 B.
> >
> >      Collapsing them calls alloc_skb(1748), which rounds up
> >      SKB_HEAD_ALIGN(1748) =3D 2112 B to 4096 B and allocates a
> >      new skb with truesize =3D 4352 B (+1152 B!).
> >
> > Even worse, in case 1, such a skb is reallocated repeatedly
> > by every tcp_collapse() in vain.
> >
> > Let's calculate the final collapsed truesize before collapsing
> > skbs and skip the range if it does not shrink.
> >
> > We could allocate skbs first and calculate the new truesize,
> > but given tcp_collapse() is called under memory pressure,
> > we want to avoid unnecessary allocation.
> >
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > ---
> >  include/linux/skbuff.h |  7 +++++++
> >  net/ipv4/tcp_input.c   | 24 +++++++++++++++++++++++-
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > index d36fbb88b3f6..618e629df15a 100644
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -292,6 +292,13 @@
> >                          SKB_DATA_ALIGN(sizeof(struct sk_buff)) +      =
 \
> >                          SKB_DATA_ALIGN(sizeof(struct skb_shared_info))=
)
> >
> > +/* return estimated truesize allocated by alloc_skb(X) via kmalloc_res=
erve() */
> > +#define SKB_ALLOCSIZE(X)                                       \
> > +       ((SKB_HEAD_ALIGN(X) <=3D SKB_SMALL_HEAD_CACHE_SIZE ?      \
> > +         SKB_SMALL_HEAD_CACHE_SIZE :                           \
> > +         kmalloc_size_roundup(SKB_HEAD_ALIGN(X))) +            \
> > +        SKB_DATA_ALIGN(sizeof(struct sk_buff)))
> > +
>
> This duplicates the logic of kmalloc_reserve() in a header, far from
> it. Nothing will remind us to update the macro when kmalloc_reserve()
> changes.
>
> This matters after patch 7: if the estimation is smaller than what
> alloc_skb() really provides, @released can be negative, and
> sk_forced_mem_schedule() is no longer there to protect
> sk->sk_forward_alloc.
>
> Please add a function in net/core/skbuff.c, next to
> kmalloc_reserve(), returning the truesize of an skb allocated by
> alloc_skb(size, GFP_ATOMIC), and ideally make kmalloc_reserve() and
> this function share the size computation.

Sure, I will add a thin function.

I was a bit afraid that touching kmalloc_reserve()
might affect non-FDO users.


>
> Then patch 4 is not needed.
>
> >  struct net_device;
> >  struct scatterlist;
> >  struct pipe_inode_info;
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 5bd42a74c6f5..fe71305f6e67 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -5850,8 +5850,10 @@ static void
> >  tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_roo=
t *root,
> >              struct sk_buff *head, struct sk_buff *tail, u32 start)
> >  {
> > +       int old_truesize, new_truesize;
> >         struct sk_buff *skb =3D head, *n;
> >         struct sk_buff_head tmp;
> > +       int remainder, nskbs;
> >         u8 scaling_ratio;
> >         u32 sub_end;
> >
> > @@ -5891,6 +5893,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
> >
> >         /* Second, find consecutive collapsible skb. */
> >         sub_end =3D TCP_SKB_CB(skb)->end_seq;
> > +       old_truesize =3D skb->truesize;
> >
> >         for (n =3D tcp_skb_next(skb, list); n && n !=3D tail; n =3D tcp=
_skb_next(n, list)) {
> >                 if (!skb_frags_readable(n) ||
> > @@ -5898,8 +5901,10 @@ tcp_collapse(struct sock *sk, struct sk_buff_hea=
d *list, struct rb_root *root,
> >                     !tcp_skb_can_collapse_rx(skb, n))
> >                         break;
> >
> > -               if (!after(TCP_SKB_CB(n)->end_seq, sub_end))
> > +               if (!after(TCP_SKB_CB(n)->end_seq, sub_end)) {
> > +                       old_truesize +=3D n->truesize;
> >                         continue;
> > +               }
> >
> >                 /* seq and end_seq must increase monotonically for rbtr=
ee. */
> >                 if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
> > @@ -5908,6 +5913,23 @@ tcp_collapse(struct sock *sk, struct sk_buff_hea=
d *list, struct rb_root *root,
> >                         break;
> >
> >                 sub_end =3D TCP_SKB_CB(n)->end_seq;
> > +               old_truesize +=3D n->truesize;
> > +       }
> > +
> > +       /* Third, check if the new skbs have high density. */
> > +       nskbs =3D (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
> > +       new_truesize =3D nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
> > +
> > +       remainder =3D (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
> > +       if (remainder) {
> > +               nskbs++;
> > +               new_truesize +=3D SKB_ALLOCSIZE(remainder);
> > +       }
> > +
> > +       if (old_truesize <=3D new_truesize) {
> > +               start =3D sub_end;
> > +               skb =3D n;
> > +               goto restart;
> >         }
> >
> >         while (before(start, sub_end)) {
> > --
> > 2.56.0.611.g1030f0b940-goog
> >
