Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795252479;
	b=oBfHzSbH6xL1M9b1WBzzD8lYB48HfoHy/427jw/GvepHL6d2Y7GPZslpg9OjeAgWFDd+
	 jzpBGsyrP3jqlKYYAVXn0bGfEu/kpcbzsCt7jPfV4a2BrA3W0xd/ipVb7zJ/ld0l1GsFT
	 72lImeOUBj6C34mJfe+3gniojSox7j49qUf1a8dE8rYoopQffXQou+41UB6mf+pp4Qepp
	 LKPz+F0l4i9uyoEa04CTp5kV4VENJ+x8LCgWiA6/iOOofmFmB68sYI/Q/RCQeW0xIsanc
	 PuII2vhW/1SCkEeoNLEgiyI4bgkFASdEqN/t7NdkPkkxKjyiKbo4xkyMwhKUeeZr5Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AQLR1NFlS8zLGgmzly+M8HKRGur0R01IlWqDEQJJAek=;
	b=ac9FtHJQXGc2TNg2KFF+jtgRVeV4tiRvc9muexmil9tWZc+zPVwVa+3J8HXz3TQTCMhF
	 VBuxztduxFT78KFieF0w07Gd4289NrPZGV9xnp6jznJ57bp4q47uRk0iH7dxvVWduM1NG
	 z46382ozCDmOdnG6PqYZzJl/9Ekv/bHno76RkuvyrTJSBYk5C2zOq94KUN/bfFVITYREU
	 LrUfoFcZSmTDKZrXZto1fg19n0yHkA1/i9YhgQERZyaynu5HN8WpX1M5q3K+/5QnyQSD3
	 CHdmCtOeVRwvSqfUtqSdjHDG9UsgxWxW083dQ/xYj23D/kJvuP6FFrezS24O/JGcKfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b="RT/tyFkw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B351606A336
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B351606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=RT/tyFkw
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ba380cd8dbso2190678a12.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 01:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795252476; cv=none;
        d=google.com; s=arc-20260327;
        b=iFXmkonQCG935zhb2mlzOmF6QRFIeqU4zagpWcAxJWW5/EaVz5o9Ail1TkRLZjFJBj
         HS/6oacBhuhoHrHIf8X2540B/79U9FgQ8ff5chpLfMeWUbv85N08XVZMj1XwgrsAOYIn
         8309RjDPHnaC52Z8mYpMzTzDM7zoHug/ZruB/N7Y43azu2q5ZDtoWWq/u8KvoLsbw4Ju
         jWmEWgCkO5Tz6FSZX0eO4iJbl/OWWkKl0qjniVv3ckkklVbqOJnnogW8gWNsE7sT0vau
         c7+kUuP0FXPJvNfjJ2/v/ZDb7A7Y7oTS/FxF9NDxc1KPcOazA+0Oy+TjLwZRUtTwDazn
         KjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQLR1NFlS8zLGgmzly+M8HKRGur0R01IlWqDEQJJAek=;
        fh=E9q2KwDKyZY530Rfb1Adm/QD+31ujtFa7xtXjgjfPIM=;
        b=G9bcGqYxsOsmGZAm1hm3exRPiR2fx2FnLEhDqV3Ab5CcZRVyTaaG2bot1Ge1bsijlD
         uAS63nhbK+InAyZx8n3NQTX4KZupnJnHnpkJGYPdV7d2iWNFjEwsfVj0FP6vgaxFta/r
         Y2Bn6wmIIhVaG6qv9tlYQmI9ExFYnfB/T4318rimIkFGKs22DeeLqVIaQNpR0JtyI6U4
         27aEEAzyXPY9Rum6G3hAgYxjpVD7x5txa+IrtAvHtr4SAUzKhhlyAs27ismLC6b5XUi/
         YPf1MGocQ8+iRtcbSppaIvHD/CZMoc0yv079xaeHwKkQuNKEOvUEJPuPYRGxQ10MIfgU
         Gs1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795252476; x=1795857276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQLR1NFlS8zLGgmzly+M8HKRGur0R01IlWqDEQJJAek=;
        b=RT/tyFkw/fmAoObHB4sjE7EYbNjgpCo4tPLHk3YOZ7OfpuOoudKOTMpL48K1njTlh8
         LivWFAX/7FKthv81k66k81RAhPq9EWXCT5yr8Eyc2D0HjOZOPd4ZpEn0S0jOJc5Zt/R0
         U5zrt/+2hJ9Aiq8gbZXM4SYVIWeOrLQjv/g34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795252476; x=1795857276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQLR1NFlS8zLGgmzly+M8HKRGur0R01IlWqDEQJJAek=;
        b=o5uMiMgC4a86OqvTwZOOzmlNSkNXHKDKaBGuI3tOqtY+N261CNTK6a9dJ9GpsJK378
         O52jYRszhFUzXrey5iiC/1AH/qSgEoQvUm5qalyXSxF66iSx9LJUKZa1mCbPra7HGIzz
         PPPrKEV0h8AJ5OhkoY3PfN7tZxiRq8/f4n1nGPqN6SgGs1S5ZlV9ZiYRoDoxDXburWVF
         vztHDgy9e2F21FbtkutV3mkpDqqyJQ+4poDUaob1wY1IJx1zORHQpcrzXaLyMaZESEqB
         zenALXn+5iu4SBSyjJNI4Yca7Cnu3jSyVzgq9uZVqbN6aHxFZMWK4TI2919P6WKPWzKH
         X25Q==
X-Forwarded-Encrypted: i=1; AL+hErE4aNmbQUcvSl6aPTs5h/omxRGxPs0ftzN2jNfW/O6p/dZjiMdXRGxmpHuJRmFGQehsFmBfwOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HIGGW/PHpbSB35RqQYTkYZwseIX52y229zSlSOFAJBUC4vRB+
	/kwtVE6mXltT0lbE6rZijQovv9+lyGgP8BVOMyyhA4+mncVUdY4XD6gpGeZOOmTTOKCPGU1a8If
	bKILk2AOQhSEJ0OnIOxzzmbSEqlnH1AkabwH4eGnLgg==
X-Gm-Gg: AZFdTZdaNvrb/oarL59x589OHv0q21CLhSF5BFTtwjj0MIHwfxjQf8l5n7p9jjvlELk
	d96cuvMPUU4mBqEGuBV2IX3xN9kV79GHJ8yKLhVvYUqTyatRPMsKrcKw6t7FN+JKYOD9UG7ig1B
	dZk9AGnrUDYWuwyTUBJEzym+8vxIaBsaZy2gL/j7PdaEnGtyCFiTLfoKy/Xm8lut98P37s26U9h
	5q2mHWkac6BKa6+PGoReHoYxnw/VADjvFGmYX+oLwp/DsFN7MxnWSOae6VBpzGQMxRpAmlwac9I
	Br7xYGLw0w9WWmPWoqeh2McOB4AEUlwG0r9XXzIoUDVypCaJrasS86mSFmjkeN2Am25MHyPCfPW
	nsP1M/F5jo5QknQGSsruNvJpNF9FqSW0bL7FmwkE/FGr9Zc4U5sw7tIQwsFFAYbK91hOHY3Bn+5
	XujuGRxFTuwHHhFuXlq0LeVna2tDl6Xzb142pOMBrwUOHigDykSfI0LhU=
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43d:893 with SMTP id
 4fb4d7f45d1cf-6ba37ee46b3mr4249485a12.35.1795252475593; Sat, 21 Nov 2026
 01:14:35 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117062046.3286096-1-piyus@iiitd.ac.in> <179524501671.3135.15869590714107061136@kernel.org>
In-Reply-To: <179524501671.3135.15869590714107061136@kernel.org>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Sat, 21 Nov 2026 14:44:22 +0530
X-Gm-Features: Aa3M54pv48BnV6bUe9xMg7qwt-0qTUcA8-W8zgM4gXDqAKcVwrilM7mhQfZstg0
Message-ID: <CADq=QSxEQHUiLXQro_9=w-udyvNsY8+vbyAmZ3uTtop-UWhxsQ@mail.gmail.com>
Subject: Re: [PATCH net v2] xfrm: do not write the ethernet header when the
 mac header is unset
To: netdev-bot+sashiko@kernel.org
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, andrea.mayer@uniroma2.it, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, kapil@presceralabs.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review. This issue has already been resolved through
a different patch (suggested by Eric) that has been merged into the
upstream kernel.

Best regards,
Piyus Kedia
Kapil Vaswani


On Sat, Nov 21, 2026 at 12:40=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 (1) =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix stops the h_proto store, but the skb still leaves decap
>   with an unset mac header.
> - [Medium] The changelog correctly finds where the malformed skb comes
>   from but does not fix it there.
> - [Medium] In __input_process_payload() (net/xfrm/xfrm_iptfs.c) the
>   commit message cites the old_mac branch as precedent ('what=E2=80=A6
> - [Low] The patch fixes an out-of-bounds write but has no Fixes: tag and
>   no Cc: stable.
> - [Low] The Signed-off-by chain is malformed.
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is the same
>   out-of-bounds-write-via-mac_header pattern, in the function the patch=
=E2=80=A6
>
> --
>
> xfrm: do not write the ethernet header when the mac header is unset
>
> This patch adds a skb_mac_header_was_set() check before the eth_hdr()
> h_proto store at three sites: xfrm4_remove_tunnel_encap(),
> xfrm6_remove_tunnel_encap(), and the IPTFS skb reuse path in
> __input_process_payload(). The skb state it guards against comes from
> end_dt_vrf_rcv(), which calls skb_unset_mac_header() and leaves mac_len
> at the Ethernet value.
>
> Link: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac.i=
n
>
> > Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> > Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
>
> [Severity: Low]
> The author is Piyus Kedia, but Kapil Vaswani's Signed-off-by comes first
> and there is no Co-developed-by: tag.
>
> Should there be a Co-developed-by: Kapil Vaswani <kapil@presceralabs.ai>
> line right before his Signed-off-by, as described in
> Documentation/process/submitting-patches.rst? If he did not co-write the
> patch, should the trailers be reordered?
>
> [Severity: Low]
> This fixes an out-of-bounds write, but it has no Fixes: tag and no Cc:
> stable. The notes say the introducing commit could not be found. The
> history is in tree, though:
>
>   The producer, skb_unset_mac_header() in end_dt_vrf_rcv(), came in with
>   664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior").
>
>   The xfrm_iptfs.c site came in with 3f3339885fb3 ("xfrm: iptfs: add
>   reusing received skb for the tunnel egress packet").
>
>   The xfrm_input.c lines blame to b3284df1c86f ("xfrm: remove input2
>   indirection from xfrm_mode"), which moved older code.
>
> Should this carry separate Fixes: tags, or be split into two patches? The
> IPTFS hunk will not apply to trees that predate IPTFS.
>
> > diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
> > index 5ed87d51392a5..624ff8055e470 100644
> > --- a/net/xfrm/xfrm_input.c
> > +++ b/net/xfrm/xfrm_input.c
> > @@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_st=
ate *x, struct sk_buff *skb)
> >
> >       skb_reset_network_header(skb);
> >       skb_mac_header_rebuild(skb);
> > -     if (skb->mac_len)
> > +     if (skb_mac_header_was_set(skb) && skb->mac_len)
> >               eth_hdr(skb)->h_proto =3D skb->protocol;
> >
> >       err =3D 0;
>
> [Severity: High]
> The store is now skipped, but xfrm4_remove_tunnel_encap() still returns 0
> with mac_header =3D=3D 0xffff and mac_len still non-zero. Can the same sk=
b
> still be read through the unset header later on, in GRO?
>
> In the tunnel decaps branch, xfrm_input() passes the skb to GRO:
>
>     gro_cells_receive(&gro_cells, skb);
>
> skb->dev is the VRF device. It has NETIF_F_GRO, and ether_setup() gives i=
t
> hard_header_len =3D=3D ETH_HLEN, so GRO is not skipped:
>
> gro_cell_poll()
>   napi_gro_receive()
>     gro_receive_skb()
>       dev_gro_receive()
>         gro_list_prepare()
>
> For each held packet p with a matching hash, gro_list_prepare() does:
>
>     if (maclen =3D=3D ETH_HLEN)
>         diffs |=3D compare_ether_header(skb_mac_header(p),
>                                       skb_mac_header(skb));
>
> skb_mac_header() only issues a DEBUG_NET_WARN and returns
> skb->head + 0xffff. That makes this a 14-byte read, for both skbs, at the
> same fixed address 64KB past head that the commit message describes.
>
> The held packet p is also still unset. At found_ptype, dev_gro_receive()
> only calls skb_reset_mac_len(), which leaves mac_header at 0xffff. Two
> packets of one inner flow in the same NAPI poll, such as two consecutive
> TCP segments, look like enough to trigger this.
>
> The skb_reset_mac_len() warning used as the control in the test notes
> looks like this same skb reaching found_ptype in dev_gro_receive(), or
> __netif_receive_skb_core(), on the patched kernel.
>
> Would it work better to normalise the skb, either in end_dt_vrf_rcv() or
> here by resetting the mac header and setting mac_len =3D 0 when it was
> unset? That would remove both the write and this read.
>
> > @@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_st=
ate *x, struct sk_buff *skb)
> >
> >       skb_reset_network_header(skb);
> >       skb_mac_header_rebuild(skb);
> > -     if (skb->mac_len)
> > +     if (skb_mac_header_was_set(skb) && skb->mac_len)
> >               eth_hdr(skb)->h_proto =3D skb->protocol;
> >
> >       err =3D 0;
>
> [Severity: Medium]
> The commit message identifies where the bad state comes from, but the fix
> is applied at three consumers instead. Is there a reason to leave
> end_dt_vrf_rcv() and skb_unset_mac_header() unchanged?
>
> net/ipv6/seg6_local.c:end_dt_vrf_rcv() {
>     ...
>         skb_unset_mac_header(skb);
>
>         skb =3D dev->l3mdev_ops->l3mdev_l3_rcv(dev, skb, family);
>     ...
> }
>
> skb_unset_mac_header() writes the ~0 sentinel and leaves mac_len alone.
> That breaks the rule skb_reset_mac_len() enforces:
>
>         if (!skb_mac_header_was_set(skb)) {
>                 DEBUG_NET_WARN_ON_ONCE(1);
>                 skb->mac_len =3D 0;
>
> vrf_ip_rcv() and vrf_ip6_rcv() only rebuild the header when
> !list_empty(&vrf_dev->ptype_all). Without a sniffer attached, the skb goe=
s
> through the IP stack and xfrm with mac_header unset and
> mac_len =3D=3D ETH_HLEN.
>
> After this patch, the skb still leaves tunnel decap in that state through
> gro_cells_receive(). Any later consumer that trusts mac_len or
> skb_mac_header() is still exposed, and the GRO read above is one of them.
>
> There are two ways to fix this at the source. One is to give the skb a
> valid mac header with mac_len =3D 0 after l3mdev_l3_rcv() when VRF did no=
t
> rebuild it. The other is to have skb_unset_mac_header() clear mac_len.
> Would either one make the original "if (skb->mac_len)" checks correct
> again?
>
> > diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
> > index 0313a43aa8a97..41af72a9206ad 100644
> > --- a/net/xfrm/xfrm_iptfs.c
> > +++ b/net/xfrm/xfrm_iptfs.c
> > @@ -1099,7 +1099,7 @@ static bool __input_process_payload(struct xfrm_s=
tate *x, u32 data,
> >
> >                               skb->protocol =3D protocol;
> >                               skb_mac_header_rebuild(skb);
> > -                             if (skb->mac_len)
> > +                             if (skb_mac_header_was_set(skb) && skb->m=
ac_len)
> >                                       eth_hdr(skb)->h_proto =3D skb->pr=
otocol;
> >
> >                               /* all pointers could be changed now rese=
t walk */
>
> [Severity: Medium]
> The commit message says:
>
>     This mirrors what xfrm4_transport_input() already does, ... and what
>     __input_process_payload() already does for old_mac
>
> Does the old_mac branch really check as much as this one? old_mac depends
> only on skb_mac_header_was_set():
>
>         old_mac =3D skb_mac_header_was_set(skb) ? skb_mac_header(skb) : N=
ULL;
>
> The alloc path then writes h_proto without looking at mac_len:
>
>                         skb->protocol =3D protocol;
>                         if (old_mac) {
>                                 /* rebuild the mac header */
>                                 skb_set_mac_header(skb, -first_skb->mac_l=
en);
>                                 memcpy(skb_mac_header(skb), old_mac, firs=
t_skb->mac_len);
>                                 eth_hdr(skb)->h_proto =3D skb->protocol;
>                         }
>
> When first_skb->mac_len is 0, the mac header lands at skb->data, which is
> the start of the inner IP header that was just copied in. The h_proto
> store then writes 0x0800 or 0x86dd at data + 12.
>
> For IPv4 that overwrites the first two bytes of saddr. For IPv6 it
> overwrites bytes 4-5 of saddr, after ESP authentication has already been
> done.
>
> A set mac header with mac_len =3D=3D 0 is normal on L3 receive devices su=
ch as
> tun with IFF_TUN, ipgre without header_ops, and ip6_tunnel. Every inner
> packet after the first in an aggregated IPTFS payload takes this alloc
> path.
>
> Should both branches check old_mac && first_skb->mac_len, or, better,
> require a real Ethernet header?
>
> [Severity: High]
> This is a pre-existing issue, not one introduced by this patch. The same
> alloc path in __input_process_payload() has a related out-of-bounds write
> through mac_header. Is the headroom checked before these lines?
>
>         skb_set_mac_header(skb, -first_skb->mac_len);
>         memcpy(skb_mac_header(skb), old_mac, first_skb->mac_len);
>
> The new skb is allocated by iptfs_alloc_skb(..., false), called from
> iptfs_pskb_extract_seq() or iptfs_pskb_add_frags(). That only reserves:
>
> #define XFRM_IPTFS_MIN_L2HEADROOM (L1_CACHE_BYTES > 64 ? 64 : 64 + 16)
>
> If first_skb->mac_len is larger than that headroom, the u16 mac_header
> wraps to roughly 0xfff4-0xffff. memcpy() then writes mac_len bytes about
> 64KB past skb->head, and the h_proto store after it is out of bounds too.
>
> ipgre with ipgre_header_ops can get there, in ipgre_rcv():
>
>         if (tunnel->dev->header_ops =3D=3D &ipgre_header_ops)
>                 skb_pop_mac_header(skb);
>
> That sets mac_len to the outer IP header plus the GRE header, up to 76
> bytes. This is more than the 64 bytes reserved on arches with
> L1_CACHE_BYTES > 64, and the copied bytes come from outer headers that ES=
P
> does not authenticate.
>
> A tc ingress BPF program using bpf_skb_change_head() can also make mac_le=
n
> larger than the headroom on any arch, though that needs privileges.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261117062046.3286096-1-piyus%40iiitd.ac.in
