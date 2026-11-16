Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794866778;
	b=K5ePzTYM/0irY1U/RlW1KmfFHPoKw4lYz36tucvRJtBoxsBq48fjUThYr72F4PDtL8xQ
	 vZmGxXHOjs2myNkvckMR/CJ7Ky23adMCDPH668B0pi0xVyz4iRtxaYDsG4nAFuI3q3koi
	 VDGwXvufKcLYdmi6/Px5yuAF3mVeDGja1htiCAIIH8K81WikeiyNqEUQOvMbKMeH1AzdN
	 Q2AUChzeKYWaY6dKvbtfTFdwQJ6cG0ITAgj6Wz6UNeHawO0dWtXnTj0KVNUjhE5hqsTdt
	 qHUg/Fq8mf72nojfW+EHDoCOF+QJ+8V+hiIvvVgW5vaPhSvlwmNjxVXpqJ148Csq6qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vMqdrlWyOAmekXsQEG1itPY1dEWj1QOm8mYmjBsq/aM=;
	b=a59Uo1P8U2smYsyyWPFdiOOkDcv/yti8WIpVhRdpXTwpwz2EU8i0f6SKTeVuDJxAtSCe
	 x+Ey8Qe1Qn1J8pxtBRuzMhhGRG1YnlnOj4FWy6TQ6JLdOrznFFTiVxl4pxdPvZf2Je891
	 qaSqEq+5g99AQDyD4N+Rjh9HifGSk2wgKN1A9LUT6I+B38tJ6tGmHtxRGsZJ0eiMDVOVT
	 5KGh20u5EWLbgY4PO/c4z4jHP4QnEJqL4YGnnwHpVcB68mhBqzJiLnOlbH1mV4GBcYsZX
	 9i+tumlUbU4sMhU5g+wgigp1axE2blgHeYahKm4wAIzui0YTyc1Tck+KX9Z9dgBay/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=AbgF2ZqY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34194606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34194606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=AbgF2ZqY
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1787496b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:06:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794866777; cv=none;
        d=google.com; s=arc-20260327;
        b=JxNxpqJebElL3jKTgvwbVO5zFQdJ3y3cdpvTGZEZIDB+XNnufUDbqPWUd4LcfrsDiO
         lV0KSAO0BmRZ/3TlUcNcVHcHyQTkCkpidOH1/o32qobetJLHHhsbnA9NmjVkI8w6AOMH
         Qg6pFIyAcJbYWgEKbwucF9cv0ecBlkooCDbbKsJ1/dykC8bGTZeRAiNYdt+Bf7y+6z7x
         ya4x82KCU/qIrJ7vd7sTXgK+8Nom7um6aHy1i9GjGBa4VdDCQMH1PGijEbiv5VqwuMZU
         OQhY8qDiMT/ZMsIOkZseO96f1PS9S8cokA1jK5HtGFe/mKDPMTC+5YAyXdBLGELveawd
         vFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vMqdrlWyOAmekXsQEG1itPY1dEWj1QOm8mYmjBsq/aM=;
        fh=aLZqss/aq+NuTNBfJo217weQC9LPEdnaursDMXULNeU=;
        b=iv8mdX22hkUDSKZMF/u43oGNtxXOo/bqvfN4bLh2sYtnxrQPdyl34+sWM5FkAGkH+6
         cY/IB60A8MpPxhp777EOU4RMuqOXodcCr7L9WnaxmH4eh3XEz7yBco/J237KjQ+WI6OK
         Fz2nvL8HWMT3CXJbponSl1wAYx2cooezc37/f9nWBxgNCqkf22BUKGsjbBM0QjFVmiZS
         PsQWRLt5LHJzaLVmK9WSdRZznnaEHeM6AOw2//mz+j5nnW6rqRYTR0yPElGvOSjMMJNC
         +Do5NoC/TPN9uoByHbx8Wh/ZCeaiicKQdnhqNPigxznv4RABAnyD3b6wuR86/H2VhQw0
         +lhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794866777; x=1795471577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMqdrlWyOAmekXsQEG1itPY1dEWj1QOm8mYmjBsq/aM=;
        b=AbgF2ZqY1HyslMGUCiQ6uP1x99OLZqVAaM1OrrEO4CH7mo1PNmgSxN1NhAOMMml7hr
         Kr8qpUxep5DYauQZpKDrctjJMaD0lup8nL+WN5Te0X1Xue+6X0iQFWdV1SB7ugAHYnu2
         4VERBbMxZnEKly8N6oAZzau77kTBfePEM5NYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866777; x=1795471577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMqdrlWyOAmekXsQEG1itPY1dEWj1QOm8mYmjBsq/aM=;
        b=zg12+lnRRJ9l1NLV6+xgeKhVk4b1vzeYPeemS+5GZ8ydp/I42ufDafFpryOIB9ztKg
         21YN/aTMaSKI7ipfdVwm1Ke54vUXc7BdDp/oIccTZ1GBeJ8sEcjmKFYDqcBhr+T3XxzU
         6+uzl5gRH3a3ZHRGv4fahnsETgBkxIRy65lfGknDIgQ1ohe1G2sNkFVKAz0wroKDhZ1c
         nI1RAu9Jd/EaG/dnll/nAkuWCfytZ8m4LyHRrDYfdm0Jvj9wgbDxLoaEtSK9Kqp8I9s3
         g2a6JGrZjkvBp/f0sl0Xysx9rPMWOwnFzmnH/7BlnA8lh1G5AiCReVP+eagmPRubqnYO
         HJTA==
X-Gm-Message-State: APuU4Z+/zibo7EyCTvg2/f4uR4hFEhk9lEcK7RnX5UgNPJdIxPP2qRv6
	TsZ3PqDI5CWPGYynthN8BZyaawTAXY7SBDtaCksg8L6OSBDDwtnqVdF+6Ie4A1tm3RtwxlObn0c
	xn8olfqRbX3t2EfBkADjgrwx4lepqD1WO+V63h4vg3fna3w1MOZdOFg==
X-Gm-Gg: AYBFou11uzfmad/6QH+60SWJFmXOFioYcUBjnpVRm5+zNkDEFqlxNWDWzbGoPfPFb+D
	5dRBij5GrhPyTLg0Lrbp1OKGiWI7XUcxAGN83C3OFYL5joR29GD1jVEAX+T82SpGmZwYh11Z6Fw
	da8PisXgvkDIUypqsdqjSbxD+ssuuI8gTasZqmjh70G2AUTRGjykMtCC5R6En6g4PgwOoUFUXaf
	d8z7a7KvLMo18j5oL+ZnFzZwuz68SfI5bjQZPjjP64eoPfHCfB+4MkcSUl0u//CSBk8gkv2kQta
	Nk8GKdcS24ssx7pRkpxo+SUWD4cecyDlWunFsJYIm3pAxizktVi4KMRfRJlqYZz4TTNHP8jxSAr
	OenCoKmDYgUqqUL1dK3radlrmKrylm+BBwCdXkY8KsKcZWlqjorOOzvGoqE1xjzxkX56x1KzDgD
	cSrOGCaZCHlj8X4h8=
X-Received: by 2002:a05:6a00:4ac7:b0:885:e2eb:23b6 with SMTP id
 d2e1a72fcca58-8beb53d9d07mr10583427b3a.11.1794866777097; Mon, 16 Nov 2026
 14:06:17 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-9NOG.v4.r0.20261116135311@mojatatu.com> <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com>
 <DMWXH28YQDYH.1SI4Y5WQ7EPSR@gmail.com>
In-Reply-To: <DMWXH28YQDYH.1SI4Y5WQ7EPSR@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Mon, 16 Nov 2026 17:06:05 -0500
X-Gm-Features: AclHuK9n7C752nA4wdQHdLQTklh2YsDwp5Gv59-pY4fMu60xseoLBKlaRL5BDRk
Message-ID: <CAM0EoMk10vCoAKZq0P=8A_jed=Z3SudLEUV8uvXO5F=ewNjnGQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] bpf: drop the stale dst when redirecting
 to an explicit nexthop
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	bpf@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	Victor Nogueira <victor@mojatatu.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:46=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Nov 16, 2026 at 11:01 AM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > The release goes through skb_dst_drop_keep_metadata(), so encapsulation
> > parameters a route carries are handed over to a metadata dst instead of
> > being lost, and a metadata dst already on the packet is left in place. =
Both
> > wrappers take their existing drop path when that copy cannot be allocat=
ed,
> > so a packet is never sent with the stale route.
>
> Just briefly looked at it. skb_dst_drop_keep_metadata() with kmalloc()
> in the fast path is really no go.
>
> Why not do something like this instead of patches 2, 3 and 4 ?
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 946b07a..13f2d57 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2470,6 +2470,10 @@ static int __bpf_redirect_neigh(struct sk_buff *sk=
b, struct net_device *dev,
>         skb_unset_mac_header(skb);
>         skb_reset_network_header(skb);
>
> +       /* The route is for the old skb->dev. Keep the tunnel key. */
> +       if (skb_valid_dst(skb))
> +               skb_dst_drop(skb);
> +
>         if (skb->protocol =3D=3D htons(ETH_P_IP))
>                 return __bpf_redirect_neigh_v4(skb, dev, nh);
>         else if (skb->protocol =3D=3D htons(ETH_P_IPV6))
> diff --git a/net/netfilter/nft_fwd_netdev.c b/net/netfilter/nft_fwd_netde=
v.c
> index 7447da9..d1ac4eb 100644
> --- a/net/netfilter/nft_fwd_netdev.c
> +++ b/net/netfilter/nft_fwd_netdev.c
> @@ -15,6 +15,7 @@
>  #include <net/netfilter/nf_tables_offload.h>
>  #include <net/netfilter/nf_dup_netdev.h>
>  #include <net/netfilter/nf_recursion.h>
> +#include <net/dst_metadata.h>
>  #include <net/neighbour.h>
>  #include <net/ip.h>
>
> @@ -176,6 +177,9 @@ static void nft_fwd_neigh_eval(const struct nft_expr =
*expr,
>                 }
>         }
>
> +       /* The route is for the old skb->dev. Keep the tunnel template. *=
/
> +       if (skb_valid_dst(skb))
> +               skb_dst_drop(skb);
>         skb->dev =3D dev;
>         skb_clear_tstamp(skb);
>

Agreed on the alloc cost (and i will send v5 to resolve that). Having said =
that:
skb_valid_dst() is  essentially  "a dst is present and it is not
DST_METADATA", so it is true for a route (skb_dst_drop() then releases
that route) and true for keys built with bpf_skb_set_tunnel_key(); for
encap ip/ip6 or encap xfrm template the tunnel template lives in
dst->lwtstate  that wont work (packet reaches the tunnel or xfrm
device with no encapsulation).
For that reason we cant drop 3 and 4. I see the change in 2/4 (I see
1/4 not changing either) .  The change is not that small because it
will have to touch multiple core files (although just small mechanical
surgeries). Summary it will still be 4 patches..

cheers,
jamal

> pw-bot: cr
