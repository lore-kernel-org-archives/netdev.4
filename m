Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921337;
	b=Ru57nx+xd/qkWT5VRtv1682rmf5AiPDbrAoOyjs2sHtp9+a1bB2WhP7ePbJtX/n4qsOl
	 ydPWXSBQeKTtHVa5PHtr3SQj4cvyyCNdeLXiq2nSlvmqPWAeLbxNdHN3Fsyr8Uag9GLWE
	 0ledZVXIJwen/tKzCmfxFrJG5VtWjU8rVpuzD2Lop3Ip6m2ZXUY3ZLaSGVpTh/FpSbTpS
	 weKHoyDv/0WOwgfuH2eDqqmV1Efnkk73uysfmxdXSq0Q8k3Mcy5CLX3g/7E6qtw7QsiWz
	 3zcBIz8Z4tAka9XWIAJqabDCIsmEmLoHdzeuvmAoGjUZeUbC0e+2SE1XrFjgrgBfjYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1jF6nkDRFB/GiZglzFtKPBujyqk5PL06Y3EZwEZ3anc=;
	b=UIUwNF611iyXz0RpphuVNWVB1QIStwcVjqThdiffc8MsrRzVpeoQi78SrGQdEPnFDP4p
	 lmI7DMoR5Sd1yS4LDEqKlqmJmznTM5JIORLWNmwF27ZPrqiiZU4pF6mYLMAczgTE07pFk
	 6Z0RPZ2poXmN+bH7/gqky8/bWq5UyV+M+E9Qp7rcy3BkV7Z5ny74Hw/yC7PR+vH4KClK1
	 pl2HyPIwW0ih69cfwvGkG6UYbCnf60sVDCxAtJAee4Ljgz1V1isD7naX5xvMp6bBU+uMU
	 MZ/nn+CdY4M+/3ZPDEYT5UwQ64DgTEjy+bhnn1HxXcasXfRA1mZPhby5xl3FHq3YKTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=NuJ2Ql3h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B183E606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B183E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=NuJ2Ql3h
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so5613087d50.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794921336; cv=none;
        d=google.com; s=arc-20260327;
        b=mztg9qC+7MqZHW85yOQwJ02nglsASh3Z76b0vHlzvRovHwTFfztUItVcHEQdtYFiW0
         2cFw/fpXo6ovGMXy2eYsS9GSoiyoZGhBUxJn0i1xChB8ZGgv7OVJ3eDb5ZwJN73rEr5B
         W62Yr8wZmCS36VdOwhMd7RCbDJblzjUrroiIUdxegnIomqs7bZAdNa5vRDbeHif/yjxF
         ZqgUSszt0W9DfX23rh+6folppdj5EyonimWbXbJqQDxY3qh8Xx+n5kZZMCq70100RuMO
         J/cIdzYwa5TH1y6n8g7FosiT0shBzRfZG/w+n1++NRYHu4TpV6TNEkHoyne6ATZEgJO4
         jP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1jF6nkDRFB/GiZglzFtKPBujyqk5PL06Y3EZwEZ3anc=;
        fh=aLZqss/aq+NuTNBfJo217weQC9LPEdnaursDMXULNeU=;
        b=Zsd9rwJIjuvB0Bhx8UZhKDeyCMBdrwq8mYF8rEFdseeu9aXLodyjmIFhPPFmWdDFOz
         gS1EFPCuKVEFctXaWq2Xw+owh4xTp7R5xc6D9uyp4eSM6fULEAXb24ToVDe0aQuVvOVI
         kWyCvC6IgnOHOI8hunZ6gV8y6QJo5uoMfhaT+dAGVxczRNB006gWArrR2O5Lzre/Cw4s
         teGWqeqLfDX1tdiMUbzRUCLs8KIvwXwMTeqZmB7U7gvRsUR3m0c22sD8P1IX7mBmSyfc
         suZY7MsxyYKauaH+9Gi8qZA7jgldiDYnR/Bnr6jM2OaSdgle+cbIL1lIplbJS1IU9Xaj
         KQHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794921336; x=1795526136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1jF6nkDRFB/GiZglzFtKPBujyqk5PL06Y3EZwEZ3anc=;
        b=NuJ2Ql3hrgR/TwVxkytKuMigdKpEd1OBYeXGjlBd6DYYX7OR56G74NgO/xIRG1Qjb/
         50W3GlzbUGfFkfeoOXFSnlco/IsS60ONNnpGLfKehD0RPM4wgiVgYGD/ZmTgaON7Mbz2
         jgbX0fr9r1aIJph7TctK020EWmnCkfY4Vr8Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921336; x=1795526136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jF6nkDRFB/GiZglzFtKPBujyqk5PL06Y3EZwEZ3anc=;
        b=nAJx6N+TeWkq7NG2qHbMBwJKeWaLEMk9aOfp73BvJ+VZmycQX0TXtxN8H/qZ2JDhSZ
         ebHx2Lc77UH9/P186yU2f+5Fe2gnpRZ1bDtfy8lbZ+bfZd9uP96ZjVHoM/pcXsgNnM4+
         KRtUjKSaJ8281vVgztUqZMDF5Aka/2v478pD4G4PagSOoYvjG/aJH3f+Tm9HciMQy1Hv
         vvf6oMvkqowspEY2bZdaPqlwJhcNEpjZSStMZXiBKFrB8xjllF8FZu7uJoz4egKoJudN
         5EDAP9IgDzCxVg26fSFslNIAUAHPn5IhLpCP89vCgUYtwXlbreRX4GzwA79EDAUrlqnt
         v7jQ==
X-Gm-Message-State: APuU4Z8soECaQ6Vw0gcWXlkdxFZ9cMhMnnIdRk0Hc2HiFofh2qwqIdnu
	qpKHN5MswEzIPTKu2YDBjbOQ9ccEGrcxIEEHP0ASEAAqsM6O/y/wDyLiTyQV3zQMc+6wPZjkZRF
	FjOfdPQS/QFQhwfKrCT7wInUiJZYtPUMubk8XqU5N
X-Gm-Gg: AZFdTZcwRuzm6Zpe/4vfunCslJ9d+t8Wdj05mpD9QR77S0JZxTsRLJzhKlT7veJkcdO
	pc0f2S9W88OFmdBSjGrwZ3GA5mE5WERTxjHtRJTIFcMzejq04zD+Jl73VRAo4lCUyr21zGf/hMK
	9jglBntCva/2gAtijCSnmZCAY9ywkAq6yj9qRINoYNHZUDJNN4OxhQV4ZzVd/2dnmi1TrFPOD3L
	jRPVSvUBTyfUFrWuf2UIuBdaH6/bFxQKY0JB53vcuBuXP0ySH1oAGbckXIxVNEJBXLNqrQa1ZU5
	KkRtheisb9S1jL6TsxeijBZJRdcvtoZIGil1OhxJt1FUsKx4hoKrl5r6ZsVc7aKvngLM46G/vyF
	C2wbsMG58aT61omoSZ8qvakUHNuJLLWKwsMN60SpTv0mN6QfNVumdBEB5LsdY0VlJqDmyKla7ys
	f7DOzAY93eY3V4i93XHHSKDHZm6kkniv6xqHTP
X-Received: by 2002:a05:690e:408e:b0:67d:abc4:a4d4 with SMTP id
 956f58d0204a3-67dabc4a519mr4026388d50.72.1794921335493; Tue, 17 Nov 2026
 05:15:35 -0800 (PST)
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
 <DMWXH28YQDYH.1SI4Y5WQ7EPSR@gmail.com> <CAM0EoMk10vCoAKZq0P=8A_jed=Z3SudLEUV8uvXO5F=ewNjnGQ@mail.gmail.com>
 <DMX7RM93TMGR.AXFN4YJ55REF@gmail.com>
In-Reply-To: <DMX7RM93TMGR.AXFN4YJ55REF@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 17 Nov 2026 08:15:23 -0500
X-Gm-Features: AclHuK-WzLYszVXBsuW9keMZDCNkdCoq7_wHfjFaf6G49fobSVbVlVyY5hH2KC4
Message-ID: <CAM0EoMkqwoJdzChpCVcw+c_XXsR7hw1_Wy6J-zQbq4JjogqTSA@mail.gmail.com>
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

On Mon, Nov 16, 2026 at 11:50=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Nov 16, 2026 at 02:06 PM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > encap ip/ip6 or encap xfrm template the tunnel template lives in
> > dst->lwtstate  that wont work (packet reaches the tunnel or xfrm
> > device with no encapsulation).
>
> ok. agree.
>
> > For that reason we cant drop 3 and 4. I see the change in 2/4 (I see
> > 1/4 not changing either) .  The change is not that small because it
> > will have to touch multiple core files (although just small mechanical
> > surgeries). Summary it will still be 4 patches..
>
> can we keep the route and fix neigh_update_process_arp_queue() instead ?
> The bug is its lookup via dst. Only teql needs that lookup, I think.

Didn't look closely - eql moves skb->dev to a slave the same way, but
has no neighbour code of its own, so it looks like teql is the main
player.
But the drain is not the only reader: skb_tunnel_info() reads
skb_dst(skb)->lwtstate, so keeping the route leaves dst->dev=3DA on a
skb bound for B. With the 2/4 I was planniong for v5 no drain change
is needed at all, since dst_neigh_lookup_skb() returns NULL on the
replacement metadata dst and the existing n2 =3D=3D NULL path already
outputs on the parking neighbour.

> A is the device of the route, B is the target of the redirect:
>
>   skb is queued by        skb->dev  neigh->dev  lookup via dst gives
>   ----------------------  --------  ----------  --------------------
>   ip_finish_output2()     A         A           the same neigh
>   bpf_redirect_neigh(nh)  B         B           neigh on A, the bug
>   nft fwd                 B         B           neigh on A, the bug
>   __teql_resolve()        master    slave       neigh on master
>
> The diff skips the lookup when skb->dev is neigh->dev.
> lwtstate, NBMA tunnels, realm and ICMP errors work as today.
> The fast path doesn't change. No need for patches 2, 3 and 4.
> and 1/4 is not a prerequisite.
>
> Your teql 3/3 queues the skb with skb->dev =3D=3D slave. With this diff
> the neigh of the slave adds the header and sends the skb.
>
> thoughts?
>
> diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> index d6e9c7c..04758ca 100644
> --- a/net/core/neighbour.c
> +++ b/net/core/neighbour.c
> @@ -1331,9 +1331,11 @@ static void neigh_update_process_arp_queue(struct =
neighbour *neigh)
>                  * the packet in the output path.  So what we need to do
>                  * here is re-lookup the top-level neigh in the path so
>                  * we can reinject the packet there.
> +                * When skb->dev is neigh->dev 'neigh' is the top-level o=
ne.
> +                * dst can be a route via another device after a redirect=
.
>                  */
>                 n2 =3D NULL;
> -               if (dst &&
> +               if (dst && skb->dev !=3D neigh->dev &&
>                     READ_ONCE(dst->obsolete) !=3D DST_OBSOLETE_DEAD) {
>                         n2 =3D dst_neigh_lookup_skb(dst, skb);
>                         if (n2)

This will fix the cases you showed in the table above i.e nft(6),
bpf(6) but will break any xfrm and many lwt paths (including
bpf_lwt/6). Apologies if i am stating something that might be already
obvious, but let me illustrate with one example: lwt.

A is the device of the route, B is the target of the redirect, and lwt
is the lwtstate that route carries (encap type ip/ip6).

skb is queued by nft_fwd_neigh_eval(), skb->dev=3DB, neigh->dev =3D B
Lookup via dst gives neigh on A  - because the dst is still the
arrival route and dst->dev is A; ipv4_dst_neigh_lookup() takes the
device from the dst and the address from the skb  _ only when the
route has no gw_  (the device is never taken from the skb)
(Essentially, this is the bug) i.e a non-NULL neigh means the drain
reinjects on A's neighbour, so the frame leaves B with A's neighbour
and A's source.
dst also carries lwtstate (outer endpoints) that B's tunnel needs.  A
drop takes it down with the route.
Note on skb_valid_dst(): "true" means only "the slot is a route", not
"the route carries nothing". A route may carry an lwtstate that this
test cannot rule out.

So a skb_dst_drop() will result in dropping the packet in the cases i
described. Example for gre:
skb_tunnel_info() then finds neither a METADATA_IP_TUNNEL template nor
a dst->lwtstate(encap type ip/6) and gre tx will then drop the skb

I have a patch for 2/4 i can share if it would help the discussion.

cheers,
jamal
