Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853263;
	b=rydT0Uo/4FcO9LRkaDOD7yCfrl5RczPbWS5Y/xlhnJkYHVHwAU/w+xDw8eKa4Q97fAdt
	 V1/52X2rESMnf/MgJJWK9wz8CgTMsSt1KCnd19IbNx4J4PuoDPnJlpiMtgA78Bs8/XtQ5
	 xjW/r/WldRkv66zv03hVhy5h4XqT6c8HkaCk1OBed7hNVnjvGUOolzPono0FmNggTSI3g
	 Ee6vi7sbn9LKW4/SugiEOKw4R9sBT4xFniCMNKmUQD7/n6kfp2kh/nbbtWIXGm+OJYqKX
	 6wczjmbl3X3B7uUcb5ZPyAO60DaFtwhdGVd9QIH+vwtkaIFI9nx2tKgYx3/X5dIFIbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=bR99B9mosWiwLJ8gNkoYazMB9kmCIq1AGpM3BzWhODw=;
	b=FlTwJwdnDrbxDKzp6O1TfZm5lCDwYTkdqHQTbuDVbKrpg2pngXC2Kn1gzGy/TYyeImCX
	 dCo7WQKRcylcBKpM/OIfZ7EZdvRAAY45XtX+c0wtRHK3F++1J6EJ9s/6xaxIn+K++XubR
	 E7Zk3ACdW17pMOQbMpd/+GjFrlmfaPTij4RR+2lxaIhItvxaJr2lt8L9M+XVr56j0NVGP
	 oOVXIQajx2nGRDmbAYdu5HLzV1J4aSARx+J6eBEQWfblY60IrwV3uLo0b7tnJ1FyF8CXB
	 /BvZ9YKemZ50Mrwcw5WWIOBqHxc6Qm6Q7JJXrOUgLjaM4yybkL1buR9QVnNDGREl6Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EEMl72dS;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E2F606A336
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E2F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EEMl72dS
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so4935540a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853262; x=1795458062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bR99B9mosWiwLJ8gNkoYazMB9kmCIq1AGpM3BzWhODw=;
        b=EEMl72dSfK3SMOYNybCksn2Bwv7apml+VqNUhJL7zDIVt7lfw15r3Srov1+UMZTFNR
         DY+ilI0Rps2vqZ24vtejkHuY6pQRTKJd1VMwpBxpzkQFdHKLQbf6oCOPOxBQFCAevC8x
         ZQsOqL/uTQcKhwXeyTWNd//bW2nM3umFlG66AVIaeR6KeZ7mX0EP3JeRGfh4AM1XIsF4
         xZi2QxdGjfbm0G3BBEAL34U2Gkq9icFYohE90fkraOv383FSI+mqq/Y6eBikDIGabhIM
         vrGNELJE1Rhbk3rmxvR1Y8WUzsXzvxZ9KGLTkOaj96RzavRS50ZgsHCqcBpYC8xe5pjO
         duWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853262; x=1795458062;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bR99B9mosWiwLJ8gNkoYazMB9kmCIq1AGpM3BzWhODw=;
        b=jAMsZVIyBbH3huw5axxHjZP1c7gXgDqtdVKlREnLehd4RBcS0YkWJ/Y0BWrfK2P3GE
         tFXQuL+VABoIvrhXLKBnpyKv06hDBbGCLoBBPQG1Spucw5kLkbRIvys+7sInMJbxo71D
         DDdQ85bZpEGTXHycZs6reDfTdVuH9LAo2R9k8nECQcI1dZ0MM4bJCwtL00qF/cshcFYm
         NyZkL6hZ/CUPy/Nde1dGJECtRmIwGETxtIMTAJYh2TNxWsd8vScDDv2vlLmpGwnyhSGu
         aL+OI2NomQIelCkSbcmCmgsiSrCmW6a1h6PQ0trfuVy/o7pcTmOE58KI1NsSrSWd8ut8
         OxSw==
X-Forwarded-Encrypted: i=1; AL+hErHup10h3GoNoDZSanLtjqlXSKTSIUUsgb6sONVh/pQNebc/yjgZCGGT68HSjhUuFFSVMZat/Qk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NZtzGjSZFmSi1x9cXqWGLNQFP4Jz29i9HHYW874VHatcQVa3r
	izSQqLujBoLxUXuzeydCOUZ80cRexLm+rnWxQAFSObFcnHIAOTouAlwLJzf2+gfV/suwqqOr6uu
	8VplXPQ==
X-Received: from pjsc1.prod.google.com ([2002:a17:90a:bf01:b0:3b3:a425:613a])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fa0c:b0:3b3:8b61:c44f
 with SMTP id 98e67ed59e1d1-3b38b61cc33mr3102284a91.40.1794853261895; Mon, 16
 Nov 2026 10:21:01 -0800 (PST)
Date: Mon, 16 Nov 2026 18:21:01 +0000
In-Reply-To: <01c4e295-14b8-414e-9bf1-2be350466fe0@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-4-kuniyu@google.com>
 <CAL4Wiipd9jDp+rVAo44-JDVtXrGR_0cubE3yaZ5Qb6w8-s+6Zw@mail.gmail.com>
 <3d9efe33-f11d-4541-8000-01906197d2d1@kernel.org> <01c4e295-14b8-414e-9bf1-2be350466fe0@redhat.com>
Message-ID: <avtHGZHebosRBuav@google.com>
Subject: Re: [PATCH v1 net-next 3/8] tcp: Stop collapsing if not bloated.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Eric Dumazet <edumazet@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	MPTCP Linux <mptcp@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 19:07:35 +0100, Paolo Abeni wrote:
> On 11/16/26 17:15, Matthieu Baerts wrote:
> > Hi Eric, Kuniyuki, Paolo,
> >=20
> > (+cc MPTCP ML)
> >=20
> > On 14/11/2026 16:35, Eric Dumazet wrote:
> > > Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.c=
om> a =C3=A9crit :
> > > >=20
> > > > Even when a skb is not bloated, tcp_collapse() starts collapsing
> > > > if the next skb has overlapping data.
> > > >=20
> > > > Also, tcp_collapse() does not stop until it reaches the tail or
> > > > unmergable skb (SYN/FIN, unreadable frags).
> > > >=20
> > > > Assume we detect a low-density skb followed by fully-packed 4K-MSS
> > > > GRO skbs:
> > > >=20
> > > >               skb->len  truesize  scaling_ratio
> > > >    skb    #1      1448      2944      125 (49%)
> > > >    skb    #2     65536     66432      252 (98%)
> > > >    skb    #3     65536     66432      252 (98%)
> > > >    ...
> > > >    skb    #9     65536     66432      252 (98%)
> > > >    --------------------------------------------
> > > >    total                  534400
> > > >=20
> > > > Then, even the high-density skbs are repacked into lower-density
> > > > skbs, and we end up consuming much more memory.
> > > >=20
> > > >               skb->len  truesize  scaling_ratio
> > > >    nskb   #1      3776      4352      222 (86%)
> > > >    nskb   #2      3776      4352      222 (86%)
> > > >    ...
> > > >    nskb #139      3776      4352      222 (86%)
> > > >    nskb #140       872      2304       96 (37%)
> > > >    --------------------------------------------
> > > >    total                  607232 (+72832!)
> > > >=20
> > > > Even if we find a collapsible skb, we should not collapse
> > > > subsequent skbs with scaling_ratio >=3D TCP_COLLAPSE_SCALING_RATIO.
> > > >=20
> > > > Conversely, even if tp->scaling_ratio is smaller than
> > > > TCP_COLLAPSE_SCALING_RATIO, we should repack skbs once we
> > > > start collapsing, which results in higher-density skb.
> > > >=20
> > > > Let's remove the next skb condition in the first loop,
> > > > search for collapsible bloated skb range, and repeat
> > > > collapsing for each range.
> > > >=20
> > > > Note that even when the next skb is not bloated, we must
> > > > collapse it for OOO rbtree if it has overlapping data.
> > > >=20
> > > >          if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
> > > >              !tcp_collapse_skb_bloated(n, sub_end,
> > > >                                        TCP_COLLAPSE_SCALING_RATIO))
> > > >=20
> > > > For example, bloated skb_1 and non-bloated skb_2 have overlapping
> > > > data and only skb_1 is collapsed to nskb_1 and nskb_2.
> > > >=20
> > > >     skb_1 =3D [1000, 5000]
> > > >     skb_2 =3D [2000, 66000]
> > > >=20
> > > > Then, nskb_2 will be inserted after skb_2 in rbtree, wrongly
> > > > setting tp->ooo_last_skb to 5000.
> > > >=20
> > > >    nskb_1 =3D [1000, 4776]
> > > >     skb_2 =3D [2000, 66000]
> > > >    nskb_2 =3D [4776, 5000]
> > > >=20
> > > > This case is still inefficient, but a later patch handles this.
> >=20
> > Thank you for working on that!
> >=20
> > > > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > ---
> > > >   net/ipv4/tcp_input.c | 66 +++++++++++++++++++++++++--------------=
-----
> > > >   1 file changed, 37 insertions(+), 29 deletions(-)
> > > >=20
> > > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > > index e07f43347409..5bd42a74c6f5 100644
> > > > --- a/net/ipv4/tcp_input.c
> > > > +++ b/net/ipv4/tcp_input.c
> > > > @@ -5839,7 +5839,7 @@ static struct sk_buff *tcp_collapse_one(struc=
t sock *sk, struct sk_buff *skb,
> > > >   }
> > > >=20
> > > >   /* Collapse contiguous sequence of skbs head..tail with
> > > > - * sequence numbers start..end.
> > > > + * sequence numbers start..sub_end.
> > > >    *
> > > >    * If tail is NULL, this means until the end of the queue.
> > > >    *
> > > > @@ -5848,15 +5848,18 @@ static struct sk_buff *tcp_collapse_one(str=
uct sock *sk, struct sk_buff *skb,
> > > >    */
> > > >   static void
> > > >   tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct r=
b_root *root,
> > > > -            struct sk_buff *head, struct sk_buff *tail, u32 start,=
 u32 end)
> > > > +            struct sk_buff *head, struct sk_buff *tail, u32 start)
> > > >   {
> > > >          struct sk_buff *skb =3D head, *n;
> > > >          struct sk_buff_head tmp;
> > > >          u8 scaling_ratio;
> > > > +       u32 sub_end;
> > > >=20
> > > >          scaling_ratio =3D min(tcp_sk(sk)->scaling_ratio,
> > > >                              TCP_COLLAPSE_SCALING_RATIO);
> > > >=20
> > > > +       __skb_queue_head_init(&tmp);
> > > > +
> > > >          /* First, check that queue is collapsible and find
> > > >           * the point where collapsing can be useful.
> > > >           */
> > > > @@ -5872,38 +5875,48 @@ tcp_collapse(struct sock *sk, struct sk_buf=
f_head *list, struct rb_root *root,
> > > >=20
> > > >                  /* The first skb to collapse is:
> > > >                   * - not SYN/FIN and
> > > > -                * - the unread portion starting from "start" is bl=
oated, or
> > > > -                *   overlaps to the next one and mptcp allow colla=
psing.
> > > > +                * - the unread portion starting from "start" is bl=
oated.
> > > >                   */
> > > > -               if (!skb_frags_readable(skb) ||
> > > > -                   TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPH=
DR_FIN))
> > > > -                       goto skip_this;
> > > > -
> > > > -               if (tcp_collapse_skb_bloated(skb, start, scaling_ra=
tio))
> > > > -                       break;
> > > > -
> > > > -               if (n && n !=3D tail && skb_frags_readable(n) &&
> > > > -                   tcp_skb_can_collapse_rx(skb, n) &&
> > > > -                   TCP_SKB_CB(skb)->end_seq !=3D TCP_SKB_CB(n)->se=
q)
> > > > +               if (skb_frags_readable(skb) &&
> > > > +                   !(TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TC=
PHDR_FIN)) &&
> > > > +                   tcp_collapse_skb_bloated(skb, start, scaling_ra=
tio))
> > > >                          break;
> > > >=20
> > > > -skip_this:
> > > >                  /* Decided to skip this, advance start seq. */
> > > >                  start =3D TCP_SKB_CB(skb)->end_seq;
> > > >          }
> > > >=20
> > > >          if (!skb || skb =3D=3D tail)
> > > > -               return;
> > > > +               goto end;
> > > >=20
> > > > -       __skb_queue_head_init(&tmp);
> > > > +       /* Second, find consecutive collapsible skb. */
> > > > +       sub_end =3D TCP_SKB_CB(skb)->end_seq;
> > > > +
> > > > +       for (n =3D tcp_skb_next(skb, list); n && n !=3D tail; n =3D=
 tcp_skb_next(n, list)) {
> > > > +               if (!skb_frags_readable(n) ||
> > > > +                   TCP_SKB_CB(n)->tcp_flags & (TCPHDR_SYN | TCPHDR=
_FIN) ||
> > > > +                   !tcp_skb_can_collapse_rx(skb, n))
> > > > +                       break;
> > >=20
> > >=20
> > > Adding MPTCP maintainers.
> >=20
> > Thank you!
> >=20
> > > Before this patch, each candidate was tested against the current new
> > > skb:
> > >=20
> > >          !tcp_skb_can_collapse_rx(nskb, skb)
> > >=20
> > > and nskb is the result of mptcp_skb_ext_move(nskb, skb), done with
> > > the skb that was being copied when nskb was allocated.
> > >=20
> > > Now all candidates are tested against the first skb of the range,
> > > before any extension has been moved.
> > >=20
> > > mptcp_ext_matches() is not symmetric (a 'from' skb without extension
> > > matches anything), so the two are not equivalent when the range needs
> > > more than one new skb. For instance:
> > >=20
> > >    skb1 (ext A, 6000 bytes), skb2 (ext A)
> > >=20
> > > nskb1 gets ext A, nskb2 is allocated while skb1 is still being
> > > copied and gets no extension. Before the patch, skb2 was not merged
> > > into nskb2 (to_ext =3D=3D NULL, from_ext !=3D NULL). Now it is, and i=
ts
> > > extension is dropped.
> > >=20
> > > This might be fine since skb2 has the same mapping as nskb1, but
> > > I would like MPTCP folks to confirm, and the changelog should
> > > mention it.
> >=20
> > This looks fine to me for MPTCP, and this series should make collapsing
> > work better for MPTCP. If, by chance, Paolo has the opportunity to
> > confirm this, that would be nice as he worked on this part for MPTCP.
> > (But feel free to move on.)
>=20
> The above scenario looks fine to me, too. Also the in-tree implementation
> sends DSS (which get ext on the RX side) for each packet, so it should be
> the most common scenario.
>=20
> I spent some time trying to generate evil sequences of ext/noext that cou=
ld
> lead to bad results but I could not find any.
>=20
> In any case, definitely +1 for me to mention the functional change in the
> changelog.

Thank you Matt and Paolo !

I'll add this to changelog.

---8<---
    Another notable thing is that tcp_skb_can_collapse_rx() now checks
    candidates against the first skb before mptcp_skb_ext_move(),
    not against each nskb.
   =20
    When a skb with an MPTCP ext spans multiple nskbs, collapsing
    previously stopped at the next skb with the same ext because later
    nskbs lacked the ext.
   =20
       skb1 (ext A),                  skb2 (ext A)
      nskb1 (ext A), nskb2 (no ext)             ^
                            ^- not collapsible -'
   =20
    Now such skbs are also collapsed with the redundant ext dropped,
    while the first nskb still carries the same mapping in sequence
    order.
   =20
       skb1 (ext A),                  skb2 (ext A)
      nskb1 (ext A), nskb2 (no ext) <-' collapsed into nskb2
---8<---
