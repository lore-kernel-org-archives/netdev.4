Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795533952;
	b=qvRf0Qmbe6AJb4X53X9W4ZTmS/IlZQsPM/KIlqyUrce6PBhW1u4RUIZ5nMgRL/Q1S+N5
	 kC/n4Yyri0/o41aCs682L8H6ode1+fEJcnFzTb10GIcIE313jW6Eqktw5R1olyibUQWwq
	 M1GLgZsciWqP5KybGsd82Gtz2OCLvqOGUHXBRy03U5MNc/yhwuKcyGUli9/IvMgXI/a7X
	 AE9ySCCgEi9JrlTowIDnEjmfgxzkQ+q9Mh0zDNrQKN9nLRr7oeoam5UPUbdIL6MDsg9Kc
	 g4HsD8krPJJkNgC9byaidNdaq7Y7JpK+cqC76twcqVyrcW4J3pTx8ljHArp13IFHGmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VMcGKhPzO6UJMnon2kMkUlCOmJ7o1gk83cZFhl5OdKw=;
	b=JMf9v2jyEZa9gG+Zqrr5st7twCksct4z7M3eJlCx/xP8PCYh+pfAq+1GyhYdEDOSd1YL
	 8kdjO1UhtcEt5HibVZeuNOqwm0FM1Q3J47T6b2p+9JxNVa32QOaV1KbdIY2tt69fzbeDz
	 1xhTNe0y6PEw2z/V+aKWTUwH+gYbF9S0wKjsEs3oRggJDniRrfZyUbUeJbDx8jAKp4Ca5
	 GpNoQcHGcV7L+hhfQflbeQBAXXtdy6vJdEGtPywXqspYNndAGHWjff721ocValVoOtbnk
	 UX0Ix+oQs3NF8yhcPYjqgeJLm/gz29YniFx1UKbvpiO/ulyX9VR2Gr1CEYUUWFkRTzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1hLrUTI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7539606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7539606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d1hLrUTI
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc91ddf447so1742490137.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:25:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795533950; cv=none;
        d=google.com; s=arc-20260327;
        b=PjX5UbZWY833RyJbY35zMmMBz8dm09hySYmS0uyXUr7/XMpRpqVZfBzQu7O5zy7aV+
         NwnD52XZdib+P5fLmFpYc2ltXSgb8zPaO9V3w4RvsuJyh5d4QKqVJDKWS341QG4bHJIV
         QgTneQxVttgCDwBT62SE+rTJ0CnoygPO5vi2jojHxAR77eq9xXWm/GxQ+OfvNlMEErKw
         UIZ0Y7PDJDzz8zleNT+zf6i5vEJrQIs44iwgfr+EviQdanVlue/w5wu6W19LGJF4bOI+
         jpclUvUmrxUjpWB/71thl2Z1HpyjbIYZLIjebUUgzUZ2/9F8EQl3umemt2UlSfTM1fV4
         /7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VMcGKhPzO6UJMnon2kMkUlCOmJ7o1gk83cZFhl5OdKw=;
        fh=QGYtNfsWn9+KIAsTKVa9ZFBrTuUZwlQc+TWcnEtgCAw=;
        b=XY2hCXCBe7nkDdsVzpsDI36c1TpaJNwIaFnqElYXekhoq89oC2pyktoOPufEYtBp2H
         mlvesu9DYsoL2ShZmM3W8mt7cPN9hfpKksQaT6X6J9sLPp1q+VZiihWw2pdYu+UnHqj2
         z3F9Uat9U2dgvj46cFl3plKyceFK/yJC4SZk79UcWG6S4gqrPFJulzhL9p9goWEEXdTR
         x+6uFv3eRito/WI8g/aM6lIvdXFp3N2MkHVsXnhV75aucft5eZg6Z3Gd+nRXx7kbsir5
         sEteeV6IVYRPgM30APl/BPtz+mMRCBTIkz1Im8aYsfYdLmM5HVJpPVLTdVbFIDa73DV3
         FBXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795533950; x=1796138750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VMcGKhPzO6UJMnon2kMkUlCOmJ7o1gk83cZFhl5OdKw=;
        b=d1hLrUTIMsRwXGQ+VOgt0H/D6cIzMsbe3vvOuq6HuZ+HEsyp5ePdN1iGiNlT6KMaXL
         ZVX5A9GyL1gMMg1a2yZ5gTVd9Yt7MthDMNLjLvn4BpVDBN4ewT/KFg7HI7fCKKOAgpgl
         YryFC9sbykhj+bfTTPwQ7ComXfhw+cMW/2/Fjx3SaHmCD5VrO3oP7KDAI0jhFRfGNHOI
         w2Va7iY/b6srWqRUPCGdXCJ3g6jnVXdhw3FS52mWX636X366HQHB/kziLSym8uEppOQ0
         ibNedqUqqEMjr9QFFQMnErBjye82/K52xPJhS8Ysqb3QVn0E1X2WObyf6s4xfsCIGlXP
         Ew0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533950; x=1796138750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMcGKhPzO6UJMnon2kMkUlCOmJ7o1gk83cZFhl5OdKw=;
        b=10jJUUTYulKkWc9lLI9OO2I2PbA3otakIjqyOLoFodW0PWkGlcUpoz0iYXiHO/w/Cv
         ZaQw0nJpM7IzWQINj3n22OcZ+yyA6OUKru153JAkv9TxX2g1iCeim96EtndGWJVurnKg
         Jmff7WXHE/eD2UuiMU2y/BC+DKH4d2oDtWEgSWv3O2mN9Fbi7Mwt7rVKVC/+Rhwsq8Zr
         S/NalWBzlPePwO9N6wgtAhAyxGWrr429KrWQI0WuxZohZAs4p1lXm1zY2qqNWwL+aTaX
         ojWd1IFhQYUE+XUvirRGEEJKiCpmVpH2LVorTAA02tNTgg2LRqJ4R5z/k5qxGX+MZ1jD
         Hz1Q==
X-Gm-Message-State: APuU4Z9roQA2dqyn3qS9ZvDUR1Bj+KZgvgKpdxGnwYj9ifXUY8XU+dkG
	RY9raF9lhs/LYpmZtNWwzghbVvhGGace9XIFp8KONK11aujduG1iNPDQu4QdSkkP+vcBfyaKF6y
	HrdtDo/m7Q+rsxddYqM6RCCXPkip+vk0=
X-Gm-Gg: AZFdTZfDRVi3ySsuGAE/s+Qz2FegnjMrq4FstrAIFtzQU+sfjEwD0+CbpBAZc/lIUMK
	lGRisnpMc8lZqfaLZA8x9DmgWd+XjyH8l9CJaBtf2fOUgHZLGVYXM323eDx9C3e/lNiaIk3Xbiq
	kY9qNGt9C2se7MdEYMBOB/YsKFVf8c09eqROssDQtOsf5h9EGo/RZUWhOsIhuHjMu3Y32yxiVFl
	QpWN07WGsxZeDnNn5Qpc59IiosCRZ2UJOYpE/DX7uJ8WFid7pGcunZjYXxTEkpz1e5wdjZSmfOh
	XLhnrlk04j7D7UhISmmE3SHvUf6PV0AKxnUu/Cl9exinyZLdVUB/+dDOuoWO2/+6+ZDkUwcK2NP
	jrRwzb3pytTuuJpzBFeRjIm9noD/vVD9lA3NqXbrlL+F64nFdkRolLl5Sc5+vpqkcSsjacV9L+B
	z//IoyTtvj4M26bnjaKMHClJCHTQemaEIqcwgFZg==
X-Received: by 2002:a05:6102:688c:b0:7cc:2cef:b341 with SMTP id
 ada2fe7eead31-7d72b35f75emr6352952137.4.1795533950401; Tue, 24 Nov 2026
 07:25:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20e1d469385153bcfa766080453e8d9c1d64c339.1795388574.git.lucien.xin@gmail.com>
 <179547753202.3135.11036747479037466293@kernel.org>
In-Reply-To: <179547753202.3135.11036747479037466293@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 10:25:37 -0500
X-Gm-Features: Aa3M54roA8iGsOFlKyM-ZXAmHd4P2JEDm5LsWjTGkVzymLJtZ8ZB3VPqso_IFs0
Message-ID: <CADvbK_dHe_OLAFN1ob3yv3toJQHOmvFEqOEOi48BL=rns4rGvQ@mail.gmail.com>
Subject: Re: [PATCH net] sctp: unshare GSO skb frag_list members instead of linearizing
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-sctp@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	marcelo.leitner@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] sctp_gso_unshare() (net/sctp/input.c) does not give SCTP
>   exclusive ownership of frag_list members, even though its comment says=
=E2=80=A6
> - [Medium] sctp_rcv() now skips skb_linearize() for every GSO-SCTP skb,
>   including nonlinear ones that have no frag_list.
> - [Low] The commit message misstates the history and the mechanism.
>
> --
>
> sctp: unshare GSO skb frag_list members instead of linearizing
>
> This patch stops sctp_rcv() from linearizing cloned SCTP GSO skbs. It add=
s
> sctp_gso_unshare() instead. That helper calls skb_unclone() on the outer
> skb and replaces each shared frag_list member with a private skb_clone().
> The aim is to avoid races on shared frag_list headers after a TEE
> pskb_copy(), and to keep per-segment boundaries so that SCTP-AUTH works.
>
> > The previous fix in commit fd60d8a08619 ("sctp: linearize cloned gso
> > packets in sctp_rcv") checked skb_cloned() on the outer skb and
> > linearized the entire GSO packet. This is insufficient for two reasons:
> >
> >  - A partial pull into the frag_list can privatize the head while later
> >    members stay shared.
>
> [Severity: Low]
>
> Does this match the TEE case? The TEE target goes through
> nf_dup_ipv4()/nf_dup_ipv6() and pskb_copy(). __pskb_copy_fclone() gives
> the new skb a private head and shares the frag_list:
>
> net/core/skbuff.c:__pskb_copy_fclone() {
>     ...
>         if (skb_has_frag_list(skb)) {
>                 skb_shinfo(n)->frag_list =3D skb_shinfo(skb)->frag_list;
>                 skb_clone_fraglist(n);
>         }
>     ...
> }
>
> Neither skb is marked cloned. So the skb_cloned() check added by
> fd60d8a08619 never fired here, and no partial pull is involved.
>
> If that's right, the bug goes back to commit 90017accff61 ("sctp: Add GSO
> support"). Should the Fixes: tag point there instead of fd60d8a08619?
>
> >  1. Calls skb_unclone() to unshare the outer skb header without
> >     flattening the frag_list.
>
> skb_unclone() only acts when skb_cloned() is true. It then calls
> pskb_expand_head(), which reallocates the data head and shared info. The
> sk_buff header is already private at that point.
>
> For the pskb_copy()/TEE skb, skb_cloned() is false, so skb_unclone() does
> nothing. Could this step be described more precisely?
>
> > diff --git a/net/sctp/input.c b/net/sctp/input.c
> > index 9494cfa51106c..cd84ee44b9f24 100644
> > --- a/net/sctp/input.c
> > +++ b/net/sctp/input.c
> > @@ -82,6 +82,38 @@ static inline int sctp_rcv_checksum(struct net *net,=
 struct sk_buff *skb)
> >       return 0;
> >  }
> >
> > +/* Ensure exclusive ownership of frag_list members for GSO skbs.
> > + * pskb_copy() shares them by reference; unshare by cloning in place.
> > + */
> > +static int sctp_gso_unshare(struct sk_buff *skb)
> > +{
> > +     struct sk_buff **pp, *p;
> > +
> > +     if (skb_unclone(skb, GFP_ATOMIC))
> > +             return -ENOMEM;
> > +
> > +     if (!skb_has_frag_list(skb))
> > +             return 0;
> > +
> > +     pp =3D &skb_shinfo(skb)->frag_list;
> > +     skb_walk_frags(skb, p) {
> > +             if (skb_shared(p)) {
> > +                     struct sk_buff *clone;
> > +
> > +                     clone =3D skb_clone(p, GFP_ATOMIC);
>
> [Severity: High]
>
> Does this give SCTP exclusive ownership of the frag_list member, as the
> comment above says? skb_clone() makes the sk_buff private. The data buffe=
r
> stays shared: dataref is bumped and both skbs are marked cloned.
>
> The SCTP receive path then writes into that shared data. For a
> cover-letter GSO skb, sctp_inq_pop() points chunk->skb at the frag_list
> member:
>
> net/sctp/inqueue.c:sctp_inq_pop() {
>     ...
>                         if (chunk->head_skb && chunk->skb->data_len =3D=
=3D chunk->skb->len) {
>                                 ...
>                                 chunk->skb =3D skb_shinfo(chunk->skb)->fr=
ag_list;
>     ...
> }
>
> sctp_sf_authenticate() then changes the digest in place:
>
> net/sctp/sm_statefuns.c:sctp_sf_authenticate() {
>     ...
>         save_digest =3D kmemdup(digest, sig_len, GFP_ATOMIC);
>         ...
>         memset(digest, 0, sig_len);
>
>         if (sctp_auth_calculate_hmac(asoc, chunk->skb,
>                                      (struct sctp_auth_chunk *)chunk->chu=
nk_hdr,
>                                      sh_key, GFP_ATOMIC)) {
>     ...
> }
>
> sctp_auth_calculate_hmac() writes the HMAC it computes back into the same
> digest location in the packet.
>
> In the TEE scenario from the commit message, both copies share the same
> frag_list data. Can this sequence let an unauthenticated packet through
> on the second copy?
>
> receiver A (first copy, on-wire digest D does not match)
>   sctp_sf_authenticate()
>     save_digest =3D D
>     memset(digest, 0, sig_len)
>     sctp_auth_calculate_hmac() writes valid H into the shared bytes
>     compare fails -> BAD_SIG
>
> receiver B (second copy)
>   sctp_sf_authenticate()
>     save_digest =3D H     <- read from the shared bytes
>     memset, then recompute H
>     compare(H, H) succeeds -> chunk->auth =3D 1
>
> If the two copies are processed at the same time, can valid packets also
> fail verification? The HMAC input would include the other receiver's
> partial writes.
>
> The cloned-outer case looks affected too, for example an AF_PACKET tap on
> lo. packet_rcv() clones the skb, and then
> skb_unclone()->pskb_expand_head()->skb_clone_fraglist() leaves the member=
s
> shared. Before this patch, skb_linearize() gave SCTP a private copy of th=
e
> data.
>
> With this patch, don't the memset() and the HMAC write land in data the
> tap's queued clone still references? The packet socket reader would then
> see zeroed or recomputed digest bytes instead of the bytes received on th=
e
> wire.
>
> Would it work to make the data private for the members SCTP writes to?
> That could be skb_copy() or pskb_expand_head() on shared or cloned member=
s,
> at least those carrying AUTH. Another option is to compute the HMAC into =
a
> private buffer instead of the packet.
>
I missed the AUTH chunk processing that will modify the skb.

I will change to using pskb_copy() instead.

Thanks.

pw-bot: cr

> > +                     if (!clone)
> > +                             return -ENOMEM;
> > +                     clone->next =3D p->next;
> > +                     consume_skb(p);
> > +                     p =3D clone;
> > +                     *pp =3D p;
> > +             }
> > +             pp =3D &p->next;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>
> [ ... ]
>
> > @@ -117,8 +149,14 @@ int sctp_rcv(struct sk_buff *skb)
> >        * it's better to just linearize it otherwise crc computing
> >        * takes longer.
> >        */
> > -     if (((!is_gso || skb_cloned(skb)) && skb_linearize(skb)) ||
> > -         !pskb_may_pull(skb, sizeof(struct sctphdr)))
> > +     if (!is_gso) {
> > +             if (skb_linearize(skb))
> > +                     goto discard_it;
> > +     } else if (sctp_gso_unshare(skb)) {
> > +             goto discard_it;
> > +     }
>
> [Severity: Medium]
>
> What happens to a nonlinear GSO-SCTP skb that has page frags but no
> frag_list? sctp_gso_unshare() returns early for it:
This can never happen.

>
>         if (!skb_has_frag_list(skb))
>                 return 0;
>
> So it reaches sctp_inq_pop() still nonlinear. There, head_skb is only set
> when frag_list is non-NULL. Otherwise chunks are bounded by
> skb_tail_pointer(), which covers only the linear area:
>
>         } else if (chunk->chunk_end > skb_tail_pointer(chunk->skb)) {
>                 /* Discard inside state machine. */
>                 chunk->pdiscard =3D 1;
>
> Such skbs can come from generic XDP with a frags-capable program:
>
> netif_receive_generic_xdp()
>   netif_skb_check_for_xdp()
>     skb_cow_data_for_xdp()
>       skb_pp_cow_data()
>
> veth native XDP can produce them as well. skb_copy_header() keeps gso_typ=
e
> as SKB_GSO_SCTP, and the payload ends up in page frags with no frag_list.
>
> If an AF_PACKET tap then clones the skb, the old skb_cloned() condition
> linearized it. With this change, are the chunks past the linear head now
> pdiscarded?
>
> The AUTH reasoning in the commit message only applies when a frag_list
> exists. Could the code still linearize when !skb_has_frag_list(skb)?
>
> > +
> > +     if (!pskb_may_pull(skb, sizeof(struct sctphdr)))
> >               goto discard_it;
> >
> >       /* Pull up the IP header. */
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20e1d469385153bcfa766080453e8d9c1d64c339.1795388574.git.lucien.xin%40gm=
ail.com
