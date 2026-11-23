Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475271;
	b=OLxhY7KPq8MpXDzCjWakIBOy4GXs0FawHjujlkzjuBwZKIEaVKf2pbbpZig0mc+P1zSc
	 75JCWR4j0p+blR5WxbQjTPhfPJ7kSL7lFTZ6EY6Njx7H4AKo+O8Bx10AZMmdXU9VSTc9b
	 qMRCEP1a/K5RKJuQu7vQc2SQy1ReUeTac9cZkA78aUqktQH/BUsmysuMB7VC9zisd+m2N
	 k+8iM178xjKCVCwyD1s5FQzB2VHIukvbJa90687pZkxy3BEAMOyZzxp/KjqS4j6eicXfv
	 hInhFomnPzRsurtQX9NM0vcrqvccHBWWGO7e/J6gGUpk/aBQhE+3S2ynby3XhZ0laUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=N35mGn3V7LG3924eRYreFRpH4QakgRq0bchwvUBzg3U=;
	b=cEgLer8NCYXmNoNoCsygJ5hWBVyKv7I4hJpxXbTkwANrK/ve7W0AgyyKM5rJ+CK5d5nf
	 NnmuJY/lwBIHWnyyyVd0BmUDq8iAdBLluYQlv6B33bIZu0X+kNUdWkSTgk4DVMEzYO5j/
	 n1To9nqBbHYSXu72naGo6krU7nipfY0IOSI7eBpLY+kpbH+sWXuDiUK0OhDpvchI+9GkD
	 +CmSQOP08DmrN/d9saIsAB1CsFOCSbo/LqPlAkjRjdPACP1kIfxDd/3YampFVDEq0yGaF
	 QlP8M6vkcs9pxdemytMsaVo2K99BUCL/PCfuczUE05bvfMYDOdB1Ptuotz7r1fnDxQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=J37sXjX3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60E606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC60E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=J37sXjX3
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2498779b3a.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795475270; cv=none;
        d=google.com; s=arc-20260327;
        b=VsbQMmp2jb8RvRXxYiG8DJA/eqnjAUJjN0tIS22wdvg7Od0Vpi6qQzWBIGx/PhEx7J
         i2s+IHSNhP/k1LNsX/czOYkVJzRGo9Mz2hch5S8jHKagSCtjnpuNeq75AU3DHkEgs5DA
         7fGc2vds0D4HwxLpUV17jia/sICmtTmBA8zB9U7/tGyqwLIFjEVrOcr/owM3i3MaO3xi
         kGBxDc3M5VR7+myeJLa2g460wYa+Eos3oZLMP81ORxYE2xssqxZ1AkLd+tLN7XFCMMUE
         Q4E2ML0yZwjWh7H0rS0HqkabJvYH94SwVeJsabge0dp5zMWqpWTgUI2mqSQ61qJjA1GO
         WNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N35mGn3V7LG3924eRYreFRpH4QakgRq0bchwvUBzg3U=;
        fh=1sI/66ckX5FJsk19/tx4XmlG5AX6nYlpdm6pI+MKEAQ=;
        b=kbPqny5JeGkzjWACKGBX55dtuMk7i+zf/WNPrFhEiCK6+E8OxTzjH3yxmDe+OgnpTd
         wOiv6pF/ff2/i2dWURAmDhsknOPvp2Qwq5KiGHEawUjkDjCDzCc35tUHAEfrstC6HiZF
         QJ6eJmXlKIEGZlL3+/ZYZdz9Z/2GD6Spvm08cvF8xV0Z2XEhGeiK3O5wHZB+bh9CIag4
         b9pebix7SPnKGrI6wjFM00pEwWvIqOzqBg6xxQH7+ELK+CJX8PVLpqj0g+zCGQAc71e7
         OK4rFk3uZL3Q1pK7ILqZ5o+KCBO5aO8De3bd11040OpKx5Fe4kvIUXDRIkgSHoTKZSx9
         w+Hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795475270; x=1796080070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N35mGn3V7LG3924eRYreFRpH4QakgRq0bchwvUBzg3U=;
        b=J37sXjX3lwbifbcFUA15lGlik+cJgtHjX919vbiA7vrGyBos09O972DzpojX0kFOSx
         KBT+aXQuYKqlNY63tMGWZu9k64eSV6gJicT5Rdv901EyxXWl8qJvi6K1EVjjTkYxYN9X
         /KIqs8KPfx3RR2Y0WYl38S1ZwZ1p+tLFKRhkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475270; x=1796080070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N35mGn3V7LG3924eRYreFRpH4QakgRq0bchwvUBzg3U=;
        b=1M+GYCIWxO010xP3WRvuxznmj7DUSYtlwPIa5BATL6ecoLZlRrNJRjf4Ax3a4jQfCq
         ZuGUe5oyojc7kMlHnApeGU9Y/blPt+pE55JkufTqIeeBdlkmUjB79jJ88qNGRobJ9fZB
         Nu/tGtTok3771ptXJ204TzaMUlEkvPYjicMSWjMdjVdLdjlRLn0wdu6zrq6yDeBojHx9
         wKYSiJNezJZxndPXM5XvbjaOQsKsYrs1bUy1Y14PnC8lxkVTukWMVp88rBKaMGrJEP8f
         ueneCDQC1Fd9G/iCRwlXHbARRD85OmZrC6O41RzwddQUcm3cT93acmzkVL6yi+qf4bHc
         id3w==
X-Gm-Message-State: APuU4Z9pYjxCGPA83xy7Ek/j6Vm3oIIVfIM3c+Un1z//j/QXJSHXFVgP
	M2Lp/xmGhtzX80+3lbna7LfNLe0TiTibK+FPviwWkJW7e7ltO+vzcowfWbwJDqtAao2kUF/a3GZ
	JxIQdXxBgbT08XNylUethOzYirZSKCj3xEx5kmUcE
X-Gm-Gg: AZFdTZfypw9jdWi7nJxdzA9SJ0PP9v7UXjp9bujUypcBzxGL8+FD9K5CmsIfIdBnfIM
	2NjbrXVEvU4ekIco3Q2xYPMoaZmxU+HpA1L09FXVDHPorg4rKzjWS9Vm4KHFs3CG+iEKa8CkUi/
	LtiAMx+hIoHxmtd+RsRGBy9PC9RRXoWHJt0XOTwkU5EWFro4RUTfuW/5IGzpryyAPleMNE4ZA95
	cAuFYUTPnTwWikM2nw7W14/rDj9H7/rHnjFaTGP45jOfw77kQNAMTc4q5owlH+90c5Kt6nVTFEG
	/oz56yg5yYo6RP5EtgMWYFMj83BcURxO1DdJujfLXAitcHa64lYFJRIdEA/cu7V3NiKRw2yWWXS
	D3I03UhR9I/AAjAZgHKgYhACcDRFPzvFfdJYvKBWSSBIurl5xPNn1E1VT2zLmZjf0dT7ZNrPJdI
	ZSrNeFJDuVG2DfeLg=
X-Received: by 2002:a05:6a21:e089:b0:3d8:e57a:5a5b with SMTP id
 adf61e73a8af0-40149f7bc79mr11477810637.5.1795475270226; Mon, 23 Nov 2026
 15:07:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-6HS9.v6.r0.20261119070330-2@mojatatu.com> <179543888245.3135.17083845108187483466@kernel.org>
In-Reply-To: <179543888245.3135.17083845108187483466@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 23 Nov 2026 18:07:39 -0500
X-Gm-Features: Aa3M54q1ZQuOurGholQMRf5y1rqpOByOjJUneEMlFyPEGEHyFGCPb2ATSExZVIc
Message-ID: <CAM0EoMmaaamfTm8R0N6fzcv2FhnJzjACPzwcJQRps47OHJpSrw@mail.gmail.com>
Subject: Re: [PATCH net v6 2/3] net: neighbour: reinject a parked skb through
 a headerless output device
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, victor@mojatatu.com, jiri@resnulli.us, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, stable@vger.kernel.org, sashiko-bot@kernel.org, 
	Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:01=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new gate in neigh_update_process_arp_queue()
>   (net/core/neighbour.c:1345-1347) trusts the neighbour found through=E2=
=80=A6
> - [Low] The patch carries 'Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")' and
>   'Cc: stable', but the commit message says it fixes nothing reachable=E2=
=80=A6
> - [Low] The new comment ('headerless output transmits on skb->dev, not
>   n1->dev') and the commit message ('Such an output sends the skb out=E2=
=80=A6

Ok, i will withdraw this patch and the next one. Sashiko doesnt have
semantic knowledge of other threads
(https://lore.kernel.org/netdev/CORE-J9UK.v1.r0.20261120103344-1@mojatatu.c=
om/)
so it could get infuriating pointing other patches to it; a human
would have ended this a few postings back.
This may also (i think) align with what Alexei was probably hinting in
the other thread.
Once 1/3 merges i will send 2/3 and 3/3 as net-next.

pw-bot: cr

I will send tommorow am.

cheers,
jamal

> --
>
> net: neighbour: reinject a parked skb through a headerless output device
>
> This commit changes neigh_update_process_arp_queue() so that, before the
> output call, skb->dev is set back to n1->dev when n1->dev has no
> header_ops. It is the neighbour half of a pair with the sch_teql patch
> "net/sched: sch_teql: keep skb->dev consistent on the arp-queue path",
> which moves skb->dev =3D slave ahead of teql_resolve().
>
> Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org/
>
> > exists once the second half, "net/sched: sch_teql: keep skb->dev
> > consistent on the arp-queue path", moves skb->dev =3D slave ahead of
> > teql_resolve(): until then the parked skb still names the master, so th=
e
> > assignment is a no-op and the recipe below does not reproduce on this
> > patch alone. The two are taken together.
>
> [ ... ]
>
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org=
/
> > Cc: stable@vger.kernel.org
>
> [Severity: Low]
> Do the Fixes: and Cc: stable tags fit this patch when it is applied alone=
?
>
> In this tree teql_master_xmit() in net/sched/sch_teql.c calls teql_resolv=
e()
> before it sets skb->dev =3D slave:
>
>                 switch (teql_resolve(skb, skb_res, slave, slave_txq, &hle=
n)) {
>                 case 0:
>                         if (__netif_tx_trylock(slave_txq)) {
>                                 unsigned int length =3D qdisc_pkt_len(skb=
);
>                                 int rc =3D NETDEV_TX_BUSY;
>
>                                 skb->dev =3D slave;
>
> So an skb parked by __teql_resolve() still names the master. The master h=
as
> no header_ops, so n1->dev =3D=3D skb->dev and the new assignment does not=
hing
> for teql.
>
> The stable tag carries no prerequisite note. Could Fixes-driven stable
> selection pull this into a tree where the sch_teql companion patch isn't
> applied? In that tree the only visible effect would be the nft fwd /
> bpf_redirect_neigh() side effect that the commit message describes.
>
> Would a stable prerequisite annotation naming the sch_teql patch help her=
e?
>
> > diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> > index ae2db3912454a..d36d86cfc441c 100644
> > --- a/net/core/neighbour.c
> > +++ b/net/core/neighbour.c
> > @@ -1342,6 +1342,9 @@ static void neigh_update_process_arp_queue(struct=
 neighbour *neigh)
> >                       if (n2)
> >                               n1 =3D n2;
> >               }
> > +             /* headerless output transmits on skb->dev, not n1->dev *=
/
>
> [Severity: Low]
> Is this comment accurate? It reads as if only the headerless output
> transmits on skb->dev.
>
> neigh_resolve_output() and neigh_connected_output() use neigh->dev only f=
or
> dev_hard_header(), and then call dev_queue_xmit(skb):
>
> neigh_resolve_output():
>                 if (err >=3D 0)
>                         rc =3D dev_queue_xmit(skb);
>
> neigh_connected_output():
>         if (err >=3D 0)
>                 err =3D dev_queue_xmit(skb);
>
> Both of these transmit on skb->dev too, the same as neigh_direct_output()=
.
> The real difference is whether n1->dev's link header gets written, not wh=
ich
> device sends the frame.
>
> Could the comment, and the matching sentence in the commit message ("Such
> an output sends the skb out whatever device skb->dev names, not out
> n1->dev"), say that instead?
>
> > +             if (!n1->dev->header_ops)
> > +                     skb->dev =3D n1->dev;
>
> [Severity: Medium]
> Can this gate send a redirected skb back out the original device, so that
> its egress hook runs a second time?
>
> Two producers steer an skb to another device but leave the original route=
's
> dst attached. nft_fwd_neigh_eval() in net/netfilter/nft_fwd_netdev.c does
> not drop the dst:
>
>         skb->dev =3D dev;
>         skb_clear_tstamp(skb);
>
>         nf_dev_xmit_recursion_inc();
>         neigh_xmit(neigh_table, dev, addr, skb);
>
> __bpf_redirect_neigh_v4() and __bpf_redirect_neigh_v6() in net/core/filte=
r.c
> replace the dst only in the !nh branch:
>
>                 skb_dst_drop(skb);
>                 skb_dst_set(skb, &rt->dst);
>
> Suppose one of these runs on egress of a device A that has NULL
> header_ops, such as the teql master (teql_master_setup() never sets
> header_ops). It redirects to an Ethernet device B whose neighbour is
> unresolved:
>
> neigh_resolve_output() on B's neighbour
>   __neigh_event_send()
>     skb_dst_force(skb);            /* A's dst is kept */
>     __skb_queue_tail(&neigh->arp_queue, skb);
>
> B resolves:
>
> neigh_update_process_arp_queue()
>   n2 =3D dst_neigh_lookup_skb(dst, skb);   /* A's neighbour */
>   if (!n1->dev->header_ops)
>       skb->dev =3D n1->dev;                /* skb->dev =3D A */
>   neigh_direct_output()
>     dev_queue_xmit()                     /* A's egress hook runs again */
>
> For nft fwd, TTL/hop_limit is lowered a second time. A packet that arrive=
d
> with TTL 2 would then hit the iph->ttl <=3D 1 drop. Stateful nft expressi=
ons
> and BPF map side effects would also run twice.
>
> If the second pass does not redirect (a quota or limit is used up, or a
> conditional rule no longer matches), the packet leaves via A instead of B=
.
>
> The commit message acknowledges this and calls the producer fix "a
> separate change to the producers". That change doesn't appear in this
> series: after this commit only sch_teql.c changes, and nft_fwd_netdev.c a=
nd
> filter.c still keep the dst. With Cc: stable, does this patch ship that
> behaviour on its own?
>
> Common L3 tunnels such as ipip, sit, ip6tnl, vti, L3 tun and wireguard se=
t
> ip_tunnel_header_ops, so the gate does not match them. Before this patch =
the
> same path was already broken in a different way: the frame left B without=
 a
> link header.
>
> >               READ_ONCE(n1->output)(n1, skb);
> >               if (n2)
> >                       neigh_release(n2);
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-6HS9.v6.r0.20261119070330%40mojatatu.com
