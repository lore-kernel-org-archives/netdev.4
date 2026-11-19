Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795120158;
	b=hWL3EBqnf0gLhN/slIkpWa0zTZFOHuHkCG4Y+12rd/T3SnTeF4CdERKCZOllFZrHzI2n
	 UVaF1EjOCQ8u5efpZ7YnlE178m/axIwaq9Fovi+ujzID6bHMhyLuj0M0/yDCqYTN3jeNX
	 tsx6uJYD7F7k9SJuhfxvOTmqOM/IQmAHsLUbL3zrR3pimalddV5FSKUcr8Yb1OXmkePQ2
	 FFMkKXi5GZGW6FeQ86VEOXt444HP80G2o86kh/S5R4zMCqP3JJqZ/6exZQ5190mLp9B5+
	 VS5/Mdpqq3j4lav/ogDJ7stEyzW4Nd1y1KBjOnaprNGRnPVY/ZeN5MD0QxEW1RMGtZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VaNqnaKYVBxAY+39/+snBNP55py7Um9F6TtNyKeIsEE=;
	b=LSwkYWiXqh+zqpG3XAiecmGBRMMw8QmUYpYqwuDYWgBtVBom+T3FiR2Lie5MZAdGXQZo
	 DjxFcmQmmvdhXN3EljMQ6QqPTilWZufW303Bp1saxPVBa7yaJ2mH1Kc/yUnjjftF9+19X
	 WWOeB1hv+rGE0f0HQ6Loub7KdaYdQCD/PA+/FApR6629s3RUgwlUvrg0N9usISMByrbt7
	 IXiWi4Hxf/CyW4i9+bpKIl3DRlNL3Phq8pM1j536gRf4QNbOEgQRGwIRPzj/tQYh4crZO
	 o6pRvvwicItmTlBewlKsJFLcFU0pojX6WOjQ/Hu2jxo59niXN/CEku9muzdZbu3qGtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jSZ+6KQD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E3C606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E3C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jSZ+6KQD
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b904d10882so112873b3a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795120157; cv=none;
        d=google.com; s=arc-20260327;
        b=pwEvtK5BubnGIy7p+y3k56arGPzuly/bGQEi7kJKATWnRr89+Q2M527uvkZr5P1rgn
         9GyinpAvBXb527IjT9b8afYElmLd6Bp2RaQNWpSDh6zO+4J7Mhw6fgk5fAx1D/0gjn5a
         g3em1Sb9YMeQI19OEGgpoK61OnW31QYmIoWj6OCEwhYcN3/4E60Aj5+lLxC6VQWydOGy
         88gGeOBzov6Nl2PJAYeVA7YaduyO5zv32Z31JOsNYYdDoLuRH9ukg3PBQadBTLOQ2Lp/
         WPH+ptimzbP56BidrSOlb05lkwkrAdlbXdL3MUT/PwO4rf9xmoYpMdRHeSdsGhc2ueMT
         8Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VaNqnaKYVBxAY+39/+snBNP55py7Um9F6TtNyKeIsEE=;
        fh=yzN3/gOmgne7Tom8WxeXrWFLcGVvPBL+B9jOr1yaDdA=;
        b=pA6cw8T7hoEkbr6/zpo169eRfcefwDlTIV7MwGsTQ2pz6gXuqRNJgfb9F33CqeeVtn
         UegH0jmoS1Y7o9KNEPBp9x7msdrCivmrNgwMKLvtL67Xhq0zFtJ+djdGZ2cYTzrq5EqJ
         Bg/xAKX2gPWBv+RIEw40vhqB4XPjpRzm9lI0E2sibDWF/WFbpZ/1Xp5sNrvzz1zb57Tj
         7qwZjXIMhTYk44WcmA+7qIQyvTLNNSQL1HyM08iTWVRbOoRLEBZ6xkZhbmPyzfgGK4/B
         /tyC0PJYJyDcgdNReyItnWuOg36Sgs8L297rK62+hIBHiD0nqQ5SLCtyb02ORmiwqZhf
         JRRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795120157; x=1795724957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VaNqnaKYVBxAY+39/+snBNP55py7Um9F6TtNyKeIsEE=;
        b=jSZ+6KQD5xKgjGX6InXuwUCnleGA0oi9Jieh50NwikLivOEkIX777npmeFW57bo4/e
         ALl4nQc5WIJBkTNiDl2+5pAruZh/bwcLjbwffuagsD+i4AfalNbqpdIdZ1AvbbefYbc3
         EMxWNuyO3bwQE2oBcvRnm8mAfKEgS3S+gf/70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120157; x=1795724957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaNqnaKYVBxAY+39/+snBNP55py7Um9F6TtNyKeIsEE=;
        b=X+BiD08iVfEmn3fecgtl1OefKEQLA6L/iKFdXgUXPhvEPCEsRmUGjop1Xf9LlfAskT
         qHay6rlbMJ5xdGqTg4jPQQS3S1tivbvrvWgK3Rqg8MwYx93pEl8LY6+08r6hrhhAbHvs
         3eEjSm6peVpBsoprD7/1ZQIQZttjbrM1zAbR8fWzs0fIEMIAtYoUKKWJzqNSCV73bjhY
         A1HliV1swQkkBnfydTOZz0Ms5ANI5buUWxNWLqQFNRybn/n1H+5FmFkQh/BBEDBVtIcD
         5QuxBxNVmwf+02hMIWF1/SfOtwsxTWr5lgrHtphHg1pAbDUso1Mj7HvLGMuo7GGPs7JC
         U9ag==
X-Gm-Message-State: APuU4Z8dDUBFXcS6qlSatQN/LpexRsULRKzrd8fWwifmA201a4P/Ri+s
	9uz6fFKdf9vikMjeG+vgZdzUG2bGwCvogzZ+o2uQEfHBiXMtcX7F6z4s0D+id/FhQlxS+2e7kl+
	Xxmqzv6CjpghnEeEEACYluhdnSa5wwqWW81OHJT9q
X-Gm-Gg: AYBFou2lDR6wZaB2UKB/+kRV0o/R9mKEuIiHxLySn2j4DeNzzxAigFy3P7naY2h6zOl
	jmg2Q2/Ogupz+LKp2BDB2yngXH8jTP1uhvtN6nXbjmWVTbE1EHudm70mECrSLbac0si1bz179dN
	2/Ip8aTsDF0JOe0Y1u9Pt3ka2HchqvTGjhOMxDVAhhi6bynCjA8PL2/ZopYspUBnCEe8OHDHvvv
	fBqXpLZm5nlrgLSJKLNJ7PG8lCyF3fVgsbbXmHiJx9d4ykVdtzecgIOhGjhoktdx9m1V9Lbn+5K
	yPTyrDSKPrvXuDiAM7Lssfv/r2NUCg8X4mR3UzbIvy0wUUsSddvAJFQCtEms7Lya0OCzfkEzmbi
	YuVKtlxBbwZkY66wBbi+6/GATmuNSwJnGMP/YyNulxnChz5+m1kOst2oiQ1Qpnrq5usrf0QHHX/
	MSmgzG8juXcPxz9JuV
X-Received: by 2002:a05:6a00:b42:b0:8b6:12fd:7271 with SMTP id
 d2e1a72fcca58-8c87c38846bmr710703b3a.25.1795120156313; Thu, 19 Nov 2026
 12:29:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com> <179511856597.3136.7846835490904436138@kernel.org>
In-Reply-To: <179511856597.3136.7846835490904436138@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 19 Nov 2026 15:29:05 -0500
X-Gm-Features: AclHuK8yAi4mDoEg2Fjwj9CTASd_XfeaP5nznF0v3utPb3bDCPcw5_zH_LgmqFM
Message-ID: <CAM0EoMkppFKECwmjw+E3tWpXEL3=cyg2VYhgpL+StaSiQf+WAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] bpf: drop the stale dst when redirecting
 to an explicit nexthop
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com, 
	sdf@fomichev.me, martin.lau@linux.dev, ast@kernel.org, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, bpf@vger.kernel.org, jiri@resnulli.us, victor@mojatatu.com, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:02=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In the explicit-nexthop branch of __bpf_redirect_neigh_v4(),
>   the new skb_dst_drop_keep_metadata() call can replace a real struct=E2=
=80=A6
> - [Low] The patch fixes a long-standing, user-visible bug but has no
>   Fixes: tag and no Cc: stable.
>

This is still under discussion with Alexei  - so:

pw-bot: cr

I will consider this feedback if we have to resend the whole series or
per Alexei's pov 1 or 2.

cheers,
jamal

> --
>
> bpf: drop the stale dst when redirecting to an explicit nexthop
>
> This patch changes __bpf_redirect_neigh_v4() and __bpf_redirect_neigh_v6(=
)
> so they release the arrival dst through skb_dst_drop_keep_metadata() when
> the BPF program supplies an explicit nexthop. Without it, a packet parked
> on the target device's incomplete neighbour can later leave with the
> original device's link-layer header. Encapsulation parameters carried by
> the route are moved onto a metadata dst.
>
> Link: https://lore.kernel.org/netdev/QDISC-6HS9.v3.r0.20261103062649-2@mo=
jatatu.com/
> Link: https://lore.kernel.org/netdev/avTfQjFQYR2NNdRg@chamomile/
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index bd98d29ed7f8f..ae5346d6abd23 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -2318,6 +2318,8 @@ static int __bpf_redirect_neigh_v6(struct sk_buff=
 *skb, struct net_device *dev,
> >               skb_dst_set(skb, dst);
> >       } else if (nh->nh_family !=3D AF_INET6) {
> >               goto out_drop;
> > +     } else if (!skb_dst_drop_keep_metadata(skb)) {
> > +             goto out_drop;
> >       }
> >
> >       err =3D bpf_out_neigh_v6(net, skb, dev, nh);
>
> [Severity: Low]
> Should this patch carry a Fixes: tag, and maybe Cc: stable?
>
> The nh !=3D NULL branch in __bpf_redirect_neigh_v4() and
> __bpf_redirect_neigh_v6() skips the FIB lookup and keeps the incoming
> dst. That branch appears to come from commit ba452c9e996d ("bpf: Fix
> bpf_redirect_neigh helper api to support supplying nexthop"). Before that
> commit, bpf_redirect_neigh() always did a FIB lookup on the target device
> and installed the resulting route.
>
> The commit message gives a reproducer that puts wrong addresses on the
> wire. Would a tag like this one help stable trees that carry ba452c9e996d
> pick up the fix?
>
> Fixes: ba452c9e996d ("bpf: Fix bpf_redirect_neigh helper api to support s=
upplying nexthop")
>
> > @@ -2433,6 +2435,8 @@ static int __bpf_redirect_neigh_v4(struct sk_buff=
 *skb, struct net_device *dev,
> >
> >               skb_dst_drop(skb);
> >               skb_dst_set(skb, &rt->dst);
> > +     } else if (!skb_dst_drop_keep_metadata(skb)) {
> > +             goto out_drop;
> >       }
> >
> >       err =3D bpf_out_neigh_v4(net, skb, dev, nh);
>
> [Severity: Medium]
> Can this pass a metadata_dst to code that still casts the skb dst to a
> struct rtable?
>
> Suppose the arrival route has lwtstate of type LWTUNNEL_ENCAP_IP,
> LWTUNNEL_ENCAP_IP6 or LWTUNNEL_ENCAP_XFRM. Then
> skb_dst_drop_keep_metadata() replaces the rtable with a METADATA_IP_TUNNE=
L
> or METADATA_XFRM dst, and that dst uses dst_blackhole_ops:
>
> net/core/dst.c:skb_dst_drop_keep_metadata() {
>     ...
>                 md_dst =3D metadata_dst_alloc(src->options_len,
>                                             METADATA_IP_TUNNEL, GFP_ATOMI=
C);
>     ...
>         skb_dst_drop(skb);
>         if (md_dst)
>                 skb_dst_set(skb, &md_dst->dst);
>     ...
> }
>
> If the redirect target is a non-collect_md NBMA tunnel, its transmit path
> still calls skb_rtable() on that dst. For an IPv4 payload with raddr set
> to any:
>
> net/ipv6/ip6_tunnel.c:ip6_tnl_xmit() {
>     ...
>                 } else if (payload_protocol =3D=3D htons(ETH_P_IP)) {
>                         const struct rtable *rt =3D skb_rtable(skb);
>
>                         if (!rt)
>                                 goto tx_err_link_failure;
>
>                         if (rt->rt_gw_family =3D=3D AF_INET6)
>                                 memcpy(&fl6->daddr, &rt->rt_gw6, sizeof(f=
l6->daddr));
>                 }
>     ...
> }
>
> ip_tunnel_xmit() falls back the same way when skb_tunnel_info() gives no
> usable AF_INET key dst. That covers METADATA_XFRM, an AF_INET6 key from
> LWTUNNEL_ENCAP_IP6 on an IPv4 route, and a key.u.ipv4.dst of zero:
>
> net/ipv4/ip_tunnel.c:ip_tunnel_xmit() {
>     ...
>                 } else if (payload_protocol =3D=3D htons(ETH_P_IP)) {
>                         rt =3D skb_rtable(skb);
>                         dst =3D rt_nexthop(rt, inner_iph->daddr);
>                 }
>     ...
> }
>
> On 64-bit, rt_gw_family and rt_gw4/rt_gw6 land on the tun_info.key
> address fields in the metadata_dst union. So rt_gw_family reads the first
> byte of key.u.ipv4.src, and rt_gw6 starts at key.u.ipv4.dst.
>
> Here is an example. An IPv4 route carries "encap ip ... src 10.x.x.x dst
> D", and a tc egress program redirects with a supplied nexthop to an NBMA
> ip4ip6 tunnel. Then rt_gw_family reads as 10, which is AF_INET6.
> ip6_tnl_xmit() copies 16 bytes starting at key.u.ipv4.dst into
> fl6->daddr, and the packet is encapsulated towards an outer IPv6 address
> made of tunnel key bytes.
>
> Before this patch the skb kept the real rtable on this path, so the cast
> read real route fields.
>
> The METADATA_XFRM layout does not seem to match AF_INET or AF_INET6.
> IPv6 payloads coming from __bpf_redirect_neigh_v6() look like they are
> dropped, because dst_blackhole_neigh_lookup() returns NULL. So this looks
> limited to IPv4 payloads in the IP/IP6 encap case.
>
> The commit message says:
>
>   The release here can leave one behind as well, when the parameters a
>   route carries are not usable for the payload. The cast is repaired
>   separately.
>
> ip_tunnel_xmit() and ip6_tnl_xmit() are unchanged at this commit. Should
> this patch go after the skb_rtable() fix, or include it? Otherwise this
> path is exposed until that fix lands.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/CORE-9NOG.v4.r0.20261116135311%40mojatatu.com
