Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924017;
	b=DjdtjPlr5b/zvShOl5gFctKZuYQphw2pljZxSEGPScI+v0Ueh7WjALHCPqzzQ+YZOYG7
	 6TmWeGo3myN2HytoV1UHjLQLhzUdFkXuMzKlsT26stiOiq8ja4WyGdD/ADC1t3hWli1m7
	 spCvxQ3luOyBnB0PuNF6fxa3+QDlJdjMDbHkFtnk8hQDPlNTkiObbZghGkbnfIENm3Z5D
	 gf8WTFrKoUipP61hoXfvBGe1kdAzKpM/gUJiKACzYd70YI7NbVVxpreMsuZ6ZYakmMonj
	 +/MFEf3zzzpTWyeZ6Q2jpu8jwnJEOuUUV0bBpe+xwfZ8gdwZS//AZuQi2lI6fIXF6SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=toeVTsCBGnzPd1bYnIUruWVWZ7PF2L9oaPIgH25BZdA=;
	b=P5ntAGvt7k3GVPBdZGFgD/Uekltq5J4WglbBkxl/4v3p1IP7ikr9N78xV6XIWH00x5E8
	 Gf/zrVRxfUNkxp6cl/5hywqfm0ahtVzs6HohhdOFoni5z++8DziMCk7ejs1fDuuhiq8b/
	 t1g82bANtiWbANTg8ujHLGT/8pWiq1Uje85MNc0YCOZK6x4mLX4ZiVKNC4YIRv3g92nuN
	 poUyiy8TKdySdi85c7tdn/shWlgDfrtFn+ZxzbyV4w7Bk2DvFhDP5AW2rMcYgAwIyx5mn
	 l5u8Y6sXvs1FOy/VfkVE1vPizCoA4BEvwPFDsUyZDFFFHd4DlYTD8K6g+5X+uArzwvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=iSf1vEtO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88754606A335
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88754606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=iSf1vEtO
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a0673d9bd2so3438248b3a.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 06:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924016; cv=none;
        d=google.com; s=arc-20260327;
        b=hk9ruOqykGSBqJfyjE1+pQSiEvALnzrXc32esV97TzW27Bl5pho8OpxmcxdbYl4BoT
         qKir4UBXBVo4Gt9A1y/vNnHCK/hddDD6fL7KJkulmQyRA0PbIeZF4KXlzDkejzKv2+EL
         2vN9vAe8ViHxQ7bZw6op/1DRw0Pj0U+Jm/Va78zXSZOB4vL1Nm5gDZ7kU+8wbLAM574X
         GjS2wR0w8kZifSlBjPi8mArZZ3zKia43wkWZnhH0NGxD0PVI1g+mBGzpcEwl8R8TazZq
         mO7NJ2ZqRdcbNhRLKAPt50U5OchFtQznAFQqZdJAHhM349S5W9vN3KvBX3ToK6UVpzsn
         zsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=toeVTsCBGnzPd1bYnIUruWVWZ7PF2L9oaPIgH25BZdA=;
        fh=aLZqss/aq+NuTNBfJo217weQC9LPEdnaursDMXULNeU=;
        b=Nnhp2amvCaRFDHaqORScQzZ0CF/XYskNDQEiMOi2W+vbseCRcpqITHZuojqkokG2y1
         2aHZCsxNU31RaZ6+MbGgMOIO1hYF3uT8nUFVk9CmxQk3H43s+sqVdqE5n8v4KdWbBDLO
         J1DV0MPJoH7WqchJgBV9H9vXoUxnT7ABdkAmZFkdLgbeT0ZesUn7XN1MO9OktQmfPdw3
         eRbolSDqRcCJKaVEQy4zK/B0u/vie48TaKjOGw6XmFnsmIVzsfXvb0mBZTgaoVVJMWEQ
         J335iVXaainvlmwYeHX3JxsSvCzrOkMr2CP2mjEF3YtxQQnRCwI9RxPru3mlPXNeg6B7
         u3Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794924016; x=1795528816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=toeVTsCBGnzPd1bYnIUruWVWZ7PF2L9oaPIgH25BZdA=;
        b=iSf1vEtOgCV5zFdc2hdbGG7AaaBHRJ1JECVp3Lr7GLwd25xCPn4j9fOt3SNSDmwc6/
         iK2Gd3WVEvyTOVBsomfzTOOI/Wh0iKOIqDkXZ0gad3wU5JhcRt2MHZFLWGaD3vrheXaq
         brciqxn4fBKW9qdMUDPfDep6TkOr9BKEmpqm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924016; x=1795528816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toeVTsCBGnzPd1bYnIUruWVWZ7PF2L9oaPIgH25BZdA=;
        b=H9zXseEs/JmssK+cYBC0G/daTiHt6QuMBPDZ51x3NIdHFV4giyR//eXWTKtONIBX6/
         hG/mybTj7yifxSCuJDFaeL3Fkt6dpHslX4ANyzwZsXjeWzHO9wcrbAbBV1YXKechgrZP
         KmGO5nM6AJkHqdjsCEANY3LiothSIrHBYsrFiZtTQR1XfWqYQg6LNCNODzCdQBssoQ3I
         b6ja3glLGzhTF35p4IsfepyPtUC0aUqr9IKmTCMeKz6uBtkdhA5P2RQHSPKduWhDNbBM
         nZfDpC6YVZVdWFpXCvmcOrY1uN24nrvtLZ10Q7mx8DHcB2M9+LauKdP22DrUNgvvfCYq
         L10w==
X-Gm-Message-State: APuU4Z/p96cKSE0qjsnXauUH6dLcIReA/hQH47LAFiNoQ2iep4bDk/7c
	fN+35/JUC5n2G879GNgERbNXJaoDwMPSxhSzt1rAMwpuB2AGHadwS+B92tYR20rwYd+lbeZfD5U
	TFByc+X2NiA9qxqtMFW2pgJunDII4eelAE1FMMn3z
X-Gm-Gg: AYBFou1S2MCqfsXKT9hbW8gwvmhXcnzvLHTQwMbAfFDIrbo2dUh8sUSC588QxQlV6MY
	taHX2R+ccylBErrnthyxuvsAoX7IUrFBRpI04iQ1UWY0Rw/9Ms7G/FiewRYje+pTlon4P/vwAZL
	0nsyb2AV9YmlxQlt+YblT7jsuNL8Xl1dgmt+UqLmA+Gjlx5WLpE5JPVEednM+MZGMimFUA1PkQR
	BqtsfVyD0UOD3nM7fe5DfqO/4MiloKYN0DofHcKtgDk9gFkWvCBUkXBXgPAGj5VjVLJx9tnMOis
	ZMP5vmM+hvXZ074vWfd0mjR/vgnXxj4NIItDUgfuWtwvh06UebzYDv6vUp/RUuXHbeZ/+8jg9P7
	8JzAsbj+4N8Y1/wwKbEQUhfO/PpK3mrbpCbXLuTAg17wCDQnOaVqwEm7/9b0Bc88wiIL5M9+Gcp
	IISooo3r4RpsZmZWc=
X-Received: by 2002:a05:6a00:1a8f:b0:8b6:12fd:7285 with SMTP id
 d2e1a72fcca58-8beb21cd241mr13169857b3a.2.1794924015427; Tue, 17 Nov 2026
 06:00:15 -0800 (PST)
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
 <DMX7RM93TMGR.AXFN4YJ55REF@gmail.com> <CAM0EoMkqwoJdzChpCVcw+c_XXsR7hw1_Wy6J-zQbq4JjogqTSA@mail.gmail.com>
In-Reply-To: <CAM0EoMkqwoJdzChpCVcw+c_XXsR7hw1_Wy6J-zQbq4JjogqTSA@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 17 Nov 2026 09:00:03 -0500
X-Gm-Features: AclHuK9CfZthz6j1EC-BGKHuAHo1niCjgl5St1TdPP-FTsHNCovLTpcJrywdai0
Message-ID: <CAM0EoMnngtO+nt7OWHNKY9DYW05Prow_A32nstsxOkbZF8U6bA@mail.gmail.com>
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

On Tue, Nov 17, 2026 at 8:15=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Mon, Nov 16, 2026 at 11:50=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Nov 16, 2026 at 02:06 PM Jamal Hadi Salim <jhs@mojatatu.com> wr=
ote:
> > > encap ip/ip6 or encap xfrm template the tunnel template lives in
> > > dst->lwtstate  that wont work (packet reaches the tunnel or xfrm
> > > device with no encapsulation).
> >
> > ok. agree.
> >
> > > For that reason we cant drop 3 and 4. I see the change in 2/4 (I see
> > > 1/4 not changing either) .  The change is not that small because it
> > > will have to touch multiple core files (although just small mechanica=
l
> > > surgeries). Summary it will still be 4 patches..
> >
> > can we keep the route and fix neigh_update_process_arp_queue() instead =
?
> > The bug is its lookup via dst. Only teql needs that lookup, I think.
>
> Didn't look closely - eql moves skb->dev to a slave the same way, but
> has no neighbour code of its own, so it looks like teql is the main
> player.
> But the drain is not the only reader: skb_tunnel_info() reads
> skb_dst(skb)->lwtstate, so keeping the route leaves dst->dev=3DA on a
> skb bound for B. With the 2/4 I was planniong for v5 no drain change
> is needed at all, since dst_neigh_lookup_skb() returns NULL on the
> replacement metadata dst and the existing n2 =3D=3D NULL path already
> outputs on the parking neighbour.
>
> > A is the device of the route, B is the target of the redirect:
> >
> >   skb is queued by        skb->dev  neigh->dev  lookup via dst gives
> >   ----------------------  --------  ----------  --------------------
> >   ip_finish_output2()     A         A           the same neigh
> >   bpf_redirect_neigh(nh)  B         B           neigh on A, the bug
> >   nft fwd                 B         B           neigh on A, the bug
> >   __teql_resolve()        master    slave       neigh on master
> >
> > The diff skips the lookup when skb->dev is neigh->dev.
> > lwtstate, NBMA tunnels, realm and ICMP errors work as today.
> > The fast path doesn't change. No need for patches 2, 3 and 4.
> > and 1/4 is not a prerequisite.
> >
> > Your teql 3/3 queues the skb with skb->dev =3D=3D slave. With this diff
> > the neigh of the slave adds the header and sends the skb.
> >
> > thoughts?
> >
> > diff --git a/net/core/neighbour.c b/net/core/neighbour.c
> > index d6e9c7c..04758ca 100644
> > --- a/net/core/neighbour.c
> > +++ b/net/core/neighbour.c
> > @@ -1331,9 +1331,11 @@ static void neigh_update_process_arp_queue(struc=
t neighbour *neigh)
> >                  * the packet in the output path.  So what we need to d=
o
> >                  * here is re-lookup the top-level neigh in the path so
> >                  * we can reinject the packet there.
> > +                * When skb->dev is neigh->dev 'neigh' is the top-level=
 one.
> > +                * dst can be a route via another device after a redire=
ct.
> >                  */
> >                 n2 =3D NULL;
> > -               if (dst &&
> > +               if (dst && skb->dev !=3D neigh->dev &&
> >                     READ_ONCE(dst->obsolete) !=3D DST_OBSOLETE_DEAD) {
> >                         n2 =3D dst_neigh_lookup_skb(dst, skb);
> >                         if (n2)
>
> This will fix the cases you showed in the table above i.e nft(6),
> bpf(6) but will break any xfrm and many lwt paths (including
> bpf_lwt/6).

After more coffee: let me correct myself on "will break any xfrm and
many lwt paths" after re-reading your first sentence in the response.
The guard keeps the route, so the encapsulation is still there:
lwtstate survives and skb_tunnel_info() / skb_xfrm_md_info() find
their templates. So i take back what i said there.

What the guard changes is only which neighbour the drain picks where
skb->dev =3D=3D neigh->dev while dst->dev differs. Everything else the
route carries stays on the packet.

On re-evaluation, I agree that 1/4 is not a prerequisite for the
guard: it stands on the bpf_skb_set_xfrm_info() overwrite, which warns
on DEBUG_NET by itself. It is a prerequisite for 2/4's xfrm case,
though: 2/4 hands the route to the interface as dst_orig on a metadata
dst, and an interface with a configured if_id only puts that route
back if 1/4 restores it. Without it the dst is the metadata one, whose
family is AF_UNSPEC, and the packet is dropped as a link failure.

The rest of what I said is the reason 3/4 and 4/4 release the dst
instead of leaving it on the packet. If your answer is that a route
for A is acceptable on a frame leaving B, then they have nothing left
to fix - I'll drop them and the metadata helper they use, keep the
xfrm fix in 1/4, and we can take your guard as its own change.

Boils down to: is a route for A acceptable on a frame leaving B?

cheers,
jamal

>Apologies if i am stating something that might be already
> obvious, but let me illustrate with one example: lwt.
>
> A is the device of the route, B is the target of the redirect, and lwt
> is the lwtstate that route carries (encap type ip/ip6).
>
> skb is queued by nft_fwd_neigh_eval(), skb->dev=3DB, neigh->dev =3D B
> Lookup via dst gives neigh on A  - because the dst is still the
> arrival route and dst->dev is A; ipv4_dst_neigh_lookup() takes the
> device from the dst and the address from the skb  _ only when the
> route has no gw_  (the device is never taken from the skb)
> (Essentially, this is the bug) i.e a non-NULL neigh means the drain
> reinjects on A's neighbour, so the frame leaves B with A's neighbour
> and A's source.
> dst also carries lwtstate (outer endpoints) that B's tunnel needs.  A
> drop takes it down with the route.
> Note on skb_valid_dst(): "true" means only "the slot is a route", not
> "the route carries nothing". A route may carry an lwtstate that this
> test cannot rule out.
>
> So a skb_dst_drop() will result in dropping the packet in the cases i
> described. Example for gre:
> skb_tunnel_info() then finds neither a METADATA_IP_TUNNEL template nor
> a dst->lwtstate(encap type ip/6) and gre tx will then drop the skb
>
> I have a patch for 2/4 i can share if it would help the discussion.


cheers,
jamal
