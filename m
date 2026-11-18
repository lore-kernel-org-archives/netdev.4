Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022930;
	b=q2lXMwQTKhZ2dJjEAf8X3Yr19jLphpRoW5uAmc3U0tsmsWI602fOfLky2BVdCerou7oi
	 N7pAE1TdFJ1j0Cq1YEOLlx1kQPatBx420L24s0uGQ/LA+vZhg6aS9/e8sthzZQmf1skA6
	 6pBIhYa/3tsg8JnTvcV9k0ej/OfLbupUJRxF2Rm9xiMSGqGbIVlvCFIn63GL8RIHWXZId
	 2xpfwO/wrTMKA8cEBbZcsRRiYApmn1dxbae43SGLJ6Fga/hbYtHC3+BjcLp5cL+67MSdc
	 rqdeQUDWJRO7SMCCdkHxDGet5kcYn8A5JstxiCt3C6sK00xlXnT09NrQp1hrBFLR1dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2Y+IvdPWp8PJk6wSKvWKsu+RJKvBF/peDdPX+yZVPfo=;
	b=Z2YgnagJ99QccG3xc+tgEE/avcwH5Ql7Wvjsi0YToueEVdxsIzcrGIdgfAPhsglC7GUr
	 LEQcEL2tCUBW5L39mAcYzcKBhuy4senDdRPSPtvxlV1ZdXTSqrvRsufje46rXeRx+vWkJ
	 vopjaCh5kmQ12+z708hPVPD84E1IAv9AfI9mKtgJmOzuDaQyTqeIhm6eLBV3b9hDcNZfO
	 EYqJ/W3eyknugfo6xMZojxjk4GgVApV+jiU1yI+Tbx1MQJyzm3XTd/iwTnIKJSPUpxRjO
	 EMNI8hLQo5uRsiry9PVEv0wSz2ArEPLaztPqYMxuDb24tKp1XVmsh+jLCgODmgEjmeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a++J8abV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CD8606A758
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CD8606A758
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a++J8abV
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2761c69fbso1178663c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:28:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795022929; cv=none;
        d=google.com; s=arc-20260327;
        b=n331YawZ1vIzmri3/JI8LG5dszZU0Khbe3gZn+M8hGc44N3XDkbruS7lF0LnlCu9og
         lkR80mILTobx51vv1kjnFDxKDkw69dw8ATfw2ec4qXv3oucph4M9Vm3yz2idiJItLpnt
         B8YqemgZhnvOQlQdk7b6/QF2i+Z9MqeNQbsx3yE/LblxPj+yQtGs7hilv4TyqRsQY+dr
         SmeKT8wpsNX2sCIugDNFsAuoHiXngh/3TU2gJg9a2nw3kw+4RTK29Ren47fJ0wgTdk2x
         /YSiFPE3Ir/dBC0cwPPT0Ha/0wqoEBWLOCEccXaK9AcgZg7hBnsBMGeUSi9sujKlZp29
         KDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y+IvdPWp8PJk6wSKvWKsu+RJKvBF/peDdPX+yZVPfo=;
        fh=I23C1YWxmO1FyeGJix7o3c2maFaas2xVXSQGrtdxPPo=;
        b=nDeTwn958Sua8ainE9MelS+5ePeQlAPtGjasCpTScsvuWGMueg7yxjAoTPkOWB6m1z
         mIOv+F2zx6SD5Q5JUyu/vkvW0ag00x30nb8tghZKfrdy4ik7J/e7hIdfY2EB5qZqiROz
         k7nGRh+GmpX1yK6edPeaNOz1PrGREefJnEn6GrckhnSJ+pXA8md88InFmwKTBuRW/DfC
         skYVmsWhdBES5zr+dQdghYekTMJEYyeRSReAT0ABRog+F7J1SAlJQYRasBSO7yYZ7TN4
         TSpHwDfoboC8kfditOvQDIAegKAIBE+b3BcYDI8dXkUboArZA1uK+7MKzvUOQh6mf6KO
         8Y/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795022929; x=1795627729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Y+IvdPWp8PJk6wSKvWKsu+RJKvBF/peDdPX+yZVPfo=;
        b=a++J8abVFb7p1YuhAVm0HNldR3hqv6fqyfhy0WMvZ4lJv4D3zuOKda9tHf0FNIgrgn
         90uID4Y4eQTMTfMMoEOR9kyUGVKLN88Qiyj2qsc6PbwG9SFX9GWdu/ig86yElk58zTIW
         oSZ+p7i0IdTxuSTjT0cvxsFdm9zPArxYDkCd3ViXohVZ3omumZxT2XnpGA/oVK5JfZB8
         o/qLxM3kUpM8AxH0tm0hiOfXrcE0FqQKY72eT2rZJokHNXCErxyUIH6oqjw7jL6GHI/j
         fuyJWBFyZCPk3n27SPLqk2PfHPrIhd96I8UBSLxWXXMLkTHrBSoOh6meeEqhFAqkiF4M
         687A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022929; x=1795627729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Y+IvdPWp8PJk6wSKvWKsu+RJKvBF/peDdPX+yZVPfo=;
        b=f40tw1NQ/glgEnK+o4ZqmbyNPyWR0Lb9FS1p7ko/khaTQq7jAJl5CVYX6d6MUhd8dQ
         33a6LdB9P3GiodAglGNLbMxDisoT15O37J7IcGeI1OqsdluUjFdJ6XyyspAm4D77wXCF
         aAzgfy5EWCQFEzMsXlZwX2mbG/v4W3W7wa52Uf6iYC6RHW2LTwIRZ1ITaynVM98U+ma+
         JdODPnbw28AbmsQZomVBS13C3GFfOvlPiB67ECKZz5h7q1fZxlvpv6et6C4obOJlhApx
         YYvp4Hv7kLLvo+iiPosf7zNGh7+LYTU1GeMC6OBah1Bup/xGpgVXDDr951S7h6v/sku9
         ELbg==
X-Forwarded-Encrypted: i=1; AL+hErELMDsTULYSD6V0v/a9HwvYgTC+2iBhk/AGVXkySaOY5vLruMG+/bF5/fQGxkOPLy1SUaIq/Eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/35BEjJZ9LKVAIUytiWtATORk2e8J4YKk5xWD/WaYEl4XcWCuY
	yv1aTkOX1Vf+HVocC40MGPs37eeTnpdigEHKaLmHV4oieYlXc27T7XB1GliHDx9Twz+UALrWYAu
	JJOCTC1A6MzE6bpC4CEYfPE56EiNHPekKk7di5AHt
X-Gm-Gg: AYBFou3kL2mArLR8v6mLMdi4eRZX7ASwQuDObldLEYT5ORAhUoHY+g3KSa964DneRpL
	NUKTKf+n91WHVZDm/LYJ8pAQ0L0UQG5zBfLMJkDt4VEtbPLWM3h8Oyngg8Vnlk52jPLruu/OpZp
	OfcCejibhM3CL2xbhvpld69ni0IXuNx7IctUP7wRwYsLZz7JmKS8kON4/7e4aLlzjsacC4vbsH2
	fbRMOg98MIBphe0DY3njW4afN/oJgVuZE/bVxtkIVlt1J9zAShAhQVI8hV2wJ+c1fmMKmB7Y+T2
	2ttyujquArzuvXjPGnq/474FSoOZVR9QT/xSk6FU74FTBjtjk1zWHJeBb6MgNfNwpNxxaLchetE
	EUQbGvGoOIyahWc8fYinZpthmgal+I0WWjsb8yM84f8cPF1xP5vk4qfS070iVzdOOujZEeXji/v
	IXxs3Aa8gP4WNXleiCsFp6XATv379yUNVNMKoc4TqKepbPmk3+Zlf7JCi72Y0N5F55PRNg1DARm
	PM//A==
X-Received: by 2002:a05:701b:424d:20b0:199:7dff:f9cc with SMTP id
 a92af1059eb24-1b543c4406fmr3054304c88.42.1795022928342; Wed, 18 Nov 2026
 09:28:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116230555.2305867-1-kuniyu@google.com> <20261116230555.2305867-6-kuniyu@google.com>
 <CAL4WiipeiomdeRaSOpRn6Unu4-ohwrdkWCZ9mRn1ELfrW24+XQ@mail.gmail.com>
In-Reply-To: <CAL4WiipeiomdeRaSOpRn6Unu4-ohwrdkWCZ9mRn1ELfrW24+XQ@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 18 Nov 2026 09:28:37 -0800
X-Gm-Features: AclHuK9beCyfcAr2Tf5zPkHNPrvLNehHhhlsSBc8vMCDOU9Fs4eD5YF_D8xMZGw
Message-ID: <CAAVpQUA_yFd6b=z1zuts1HDzFs1C-++vovTLo7iZTQOr6wzjQw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 5/7] tcp: Allocate all new skb before collapsing.
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:28=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le mar. 17 nov. 2026 =C3=A0 00:06, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > At the final stage, tcp_collapse() iterates over collapsible
> > candidate skbs and repacks them to new skbs.
> >
> > In each iteration, a new skb is allocated and inserted to the
> > receive queue or a temporary list for RB tree.
> >
> > If alloc_skb() fails while splitting a large bloated skb across
> > multiple new skbs, the partially-copied skb is not removed and
> > new skbs remain in the queue as duplicates, consuming more memory.
> >
> > It is only when all candidates are properly collapsed that
> > we can save memory.
> >
> > To avoid complicated rollback, let's preallocate skbs before
> > collapsing.
> >
> > Now all skb in [start, sub_end) must be allocated in a batch,
> > so the section size is normally capped at TCP_COLLAPSE_MAX_TOTAL_SIZE
> > (16 skbs), except when a single bloated skb or overlapping OOO skbs
> > must be collapsed together to free the original skb or keep the
> > rbtree monotonic.
> >
> > Once the size exceeds the limit, the remaining skbs are re-evaluated
> > from restart:.
> >
> > Note that the next skb can be skipped if its density already meets
> > tp->scaling_ratio, and each cut adds at most one remainder skb
> > (~3.4% worst-case truesize overhead on 4 KiB pages), which is a
> > small tradeoff to bound the temporary allocation.
> >
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > ---
> >  net/ipv4/tcp_input.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 0815e1891fba..ca4cdb93373d 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -5812,6 +5812,7 @@ static struct sk_buff *tcp_skb_next(struct sk_buf=
f *skb, struct sk_buff_head *li
> >  #define TCP_COLLAPSE_SCALING_RATIO                             \
> >         ((TCP_COLLAPSE_MAX_SIZE << TCP_RMEM_TO_WIN_SCALE) /     \
> >          (SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE)))
> > +#define TCP_COLLAPSE_MAX_TOTAL_SIZE (TCP_COLLAPSE_MAX_SIZE * 16)
> >
> >  static bool tcp_collapse_skb_bloated(const struct sk_buff *skb,
> >                                      u32 start, u8 scaling_ratio)
> > @@ -5852,8 +5853,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
> >  {
> >         int old_truesize, new_truesize;
> >         struct sk_buff *skb =3D head, *n;
> > -       struct sk_buff_head tmp;
> > +       struct sk_buff_head tmp, pool;
> >         int remainder, nskbs;
> > +       struct sk_buff *nskb;
> >         u8 scaling_ratio;
> >         u32 sub_end;
> >
> > @@ -5861,6 +5863,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
> >                             TCP_COLLAPSE_SCALING_RATIO);
> >
> >         __skb_queue_head_init(&tmp);
> > +       __skb_queue_head_init(&pool);
> >
> >         /* First, check that queue is collapsible and find
> >          * the point where collapsing can be useful.
> > @@ -5908,8 +5911,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
> >
> >                 /* seq and end_seq must increase monotonically for rbtr=
ee. */
> >                 if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
> > -                   !tcp_collapse_skb_bloated(n, sub_end,
> > -                                             TCP_COLLAPSE_SCALING_RATI=
O))
> > +                   (TCP_SKB_CB(n)->end_seq - start >=3D TCP_COLLAPSE_M=
AX_TOTAL_SIZE ||
> > +                    !tcp_collapse_skb_bloated(n, sub_end,
> > +                                              TCP_COLLAPSE_SCALING_RAT=
IO)))
> >                         break;
>
> Sashiko has a point about the "overlapping OOO skbs" exception [1]:
> it is fully under control of the peer.
>
> For the ofo queue, as long as n->seq is before sub_end, neither the
> cap nor the density test is evaluated. tcp_data_queue_ofo() keeps
> partially overlapping segments, so a peer sending small segments,
> each of them overlapping the previous one by one byte, builds a chain
> that tcp_collapse() sees as a single section covering the whole
> ofo queue.

Exactly...


>
> >
> >                 sub_end =3D TCP_SKB_CB(n)->end_seq;
> > @@ -5924,6 +5928,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head=
 *list, struct rb_root *root,
> >         if (remainder) {
> >                 nskbs++;
> >                 new_truesize +=3D compute_skb_truesize(remainder, GFP_A=
TOMIC);
> > +       } else {
> > +               remainder =3D TCP_COLLAPSE_MAX_SIZE;
> >         }
> >
> >         if (old_truesize <=3D new_truesize) {
> > @@ -5932,14 +5938,19 @@ tcp_collapse(struct sock *sk, struct sk_buff_he=
ad *list, struct rb_root *root,
> >                 goto restart;
> >         }
> >
> > -       while (before(start, sub_end)) {
> > -               int copy =3D min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end =
- start);
> > -               struct sk_buff *nskb;
> > -
> > -               nskb =3D alloc_skb(copy, GFP_ATOMIC);
> > +       while (nskbs--) {
> > +               nskb =3D alloc_skb(nskbs ? TCP_COLLAPSE_MAX_SIZE : rema=
inder,
> > +                                GFP_ATOMIC);
> >                 if (!nskb)
> >                         goto end;
> >
> > +               __skb_queue_tail(&pool, nskb);
> > +       }
>
> Then this loop is only bounded by sk_rcvbuf.
>
> With a big tcp_rmem[2], this can be megabytes of GFP_ATOMIC memory
> allocated at once, not charged to the socket, while all the
> original skbs are still in the queue. Before this patch the
> overshoot was about one skb, because originals were freed while
> being copied.
>
> Also, a single alloc_skb() failure now discards the whole batch,
> so such a queue might never be collapsed, precisely when we are
> under memory pressure.
>
> I think TCP_COLLAPSE_MAX_TOTAL_SIZE must be a hard limit for anything
> but the single (first) skb case.
>
> Legitimate overlaps (retransmits with a different segmentation) only
> involve a few skbs. A long chain of overlapping skbs is not something
> we need to optimize for, so my preference would be to simply not
> collapse it:
>
> Keep walking the chain in the second loop so that sub_end is
> correct, remember that the cap has been exceeded, then skip the
> section the same way patch 4 does:
>
>         start =3D sub_end;
>         skb =3D n;
>         goto restart;
>
> tcp_prune_ofo_queue() will take care of these skbs if we are still
> over the limit.

Sounds good, I'll apply the strategy in v3.


>
> The alternative would be to cut the chain at the cap, but then the
> next section starts with an skb whose seq is before @start, and this
> skb would have to be collapsed unconditionally (even if not bloated,
> even if patch 4 says the result is not smaller) to keep the rbtree
> ordered. This also means @released could be negative in patch 6.
> This looks more fragile to me.
>
> Related to this: in patch 4, when the second loop breaks on
> !tcp_skb_can_collapse_rx() (or SYN/FIN, unreadable frags) with an
> overlapping @n in the rbtree, @n can stay in the tree and the last
> nskb of the previous section is inserted after it, with a smaller
> end_seq. To be fair, the current code has the same issue (goto end
> in the copy loop), but since you are making the ordering explicit
> in patch 3, it would be nice to cover it: the same "skip the
> section" logic could be used when the loop stops on an overlapping
> skb that can not be collapsed.
>
> Whatever option you choose, please add a comment next to
> TCP_COLLAPSE_MAX_TOTAL_SIZE describing what it bounds and its
> exceptions.

Will fix that and add a comment as it's a hard limit for
multiple skbs.

Thank you !

---
pw-bot: cr
