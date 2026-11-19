Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088806;
	b=OhOjpFvYOv4bEDS9KWb+/nowj8pROQA0CaDxNEoG3Caa6ggDy4l1VHWhdnQJtin6qDbA
	 x5ihw92Xmy6LWGRNtlA4E2G/R8HzMlwAfbUai4IaCpyMTjVHbhrTu6oslE0Bgg7cRViiN
	 spfpSlb0ekQFcJsbcGCTBfVFtVmCQF0/wTFjTzG3sAttHCP8Mdbo/lB14H8vgiZOgM/+L
	 a3bX7dVCZ6wasSfRb9mgtF+0h4HjfVvyEPXVBzyskab5SmUFHnneA17JRkL6EXaMtxCqh
	 o0osuv3ki+VtTOxOSimT0FIOVOfotpvr+Xng4gsWCfOvsMzFTxSuy/NVlgjTKG+MWkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=n3NKvZrmFHDvhIsjI4a9eQW4iq3tg5C0X/EydFEpmyI=;
	b=X7fEYG1wTJ7pLSBx0CCbLHpO+2Dg+iv/w+SkzG/XuhSvIcNZPoCU599hyn4ulj56rGxZ
	 syFaDtAd/+UqtBJ1pVpiocwzYUHa8t+PQVLWejQvadtTe7EYySMxCk87SogJDPZOE1Qdc
	 2k24qnh+2MSPSZUIjDGZ+nXTh0N0AQix1LWB2mueiTplAQqMYKMJ5uogAwke/UPaXCm2H
	 00Q6THJDio98ljboHh4fncc7ymy3lZoliC9q3jJMoEmJu0WuPIM3FqEJVTE5S74Wz/nuw
	 YM/z0cslPU54akAI83SF1Usx0UVabjLIz3Dhzo+Kl8NZixIgrEqBxe/dIX1/GV4d5pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=y2K722iD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076D9606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=y2K722iD
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1690996a12.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:46:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088805; cv=none;
        d=google.com; s=arc-20260327;
        b=kDDD9Lywe1a94DLZ0TagSn/7PfJMUK9hRz50f3b4U/88CWMbw00IkhNETdVm6WZzeV
         AT3rPsChW+kCYMyalxII4zbuOZduM+f3YdNbuR9DXuEmo71Ks9ZmQtZPLo6wMj9T41oT
         ALp2u3SzA6TnKJm45e4OkMDx0AqqvM72ptY5BiiFR0rP7SkeY4cP10fGfJHIe7iJvfKH
         tw0Sn+MCPK4fZBgJHRELPDYhwAiy9hPujrwTK8j6tk1Xvt8zsupRM2ODXbn7YtyPMXvm
         87pWiXyrFY/GXhKclONmWffVZintO2rtskmXVQaSIRYCzWaLMnd2DNNlsFXvDVSTgakG
         wG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3NKvZrmFHDvhIsjI4a9eQW4iq3tg5C0X/EydFEpmyI=;
        fh=8RmJ1TkJL7iN+NvlkjYMunY5KmL2jMvo7FSORUvpFYc=;
        b=H3YQsCUiBFYLQsi7DfLvOxGpC4N3OP1uheKuDz8H4ykCMpBHg79iJzlMnj3j5dy2zp
         Lf+zsa312srC4ZsRTs/aYtE178oWikokEWuRp8BSTV377jjTULyeM7oqcxE0YAFTGQgx
         zdF4yV3RdPccJeBumEqqFKsKcz46RIjFp5LnhlATW1PCPxJt2Qr09v1UfEceSOtUrduE
         ypWLhWrnnw+oyDMuVUPVrqeL7OPGuJ9w0uZn6qoKGsWF3M/UuTs6oIdQzDJKXvBWCNVU
         0VtEe4vWxULlYo+gtUUeTn0VfBuaP4f/rwi5fptShoj+o77lO5AUlUI3xAxUREIXukuP
         lDJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795088805; x=1795693605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3NKvZrmFHDvhIsjI4a9eQW4iq3tg5C0X/EydFEpmyI=;
        b=y2K722iD4TZBAt1+ApF9lkntXDYvDI2UdBkVLdYXYM09H1T1qQZ/L8lgwuVRvL9rfv
         Ly8h0bCiOCHN3KS2Xq1wAfQW0BTfciTxK9j/B5Yc1NMCQUcW4I8ZTipdGq78/tIV5J1S
         LjAq7LHU6F/o1kcfMbyzj0Idft+b7DyiZRRWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088805; x=1795693605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3NKvZrmFHDvhIsjI4a9eQW4iq3tg5C0X/EydFEpmyI=;
        b=PlaPxeUUrTZdBTWTYOCJhbBP9/D9e3Eprf41xT0PHjld19pEme1jy3HAPF9yoQ6MI+
         Kj4Z1x01NrbfGnEogpbrJWEqwc+jLs4ciiY9sbvH/eSZEgOtPfMoRsB4SgwWCYPCMJKw
         06FTgSUEKID9A10Px3wsmDwd/qT1whm95MFTkDFYhQIrw25ua3trNTxOtvSR1lQaUP79
         vjxs+/eRdLE950FKFzySmZgXxdv6TJKuGw9wuKv9X5CrShlDs62j5qQ+bugvDZUi+Kbe
         oxhnVzaihrqY2HrKG8Cb9PC/ys609rwXdHHkGwpMsL1fyOxDgouiLlJFZJm9T+Ubr3Zq
         aU9g==
X-Gm-Message-State: APuU4Z9ZA8V+gyYOfYLGzxdfVfhNrWcY1CUJHzUfiKCGcUbwInUd1jeh
	5TROclOMs+EgLl4M4RXo0eWUJHFdTkEfNrH+Fb9Okzusiz2WDl4dox8k6XuvcUDujfatpGk0pKl
	dwMnsocb/sdvWiHP4r+/pMFYii/uiUK8hR8sm8Obq
X-Gm-Gg: AYBFou01qiBH40uEokOBQIPTL2/ikMyMjAVLSUqkHXFAzMqgAwm/dQwNIMxG61YE6YI
	4YzLvdGLPHtbA1cWZM/Fy7QgE6lgk9/dsCaQQtVWUu0khynjERZmpdLGo0jJb2BougPV5SK/KHY
	dDxGJLIblZetCVy6aEt4mm0S2H+kXsksJv7SaeZyPlXtu0jcJuqmKFxRl0nffMV2HeppY+HKRwV
	jtqrt83HFB7CHoTQ3fU1m+1NbTi0H8tJob4W8EucACuPwMUvs3YzYRcRK27di5sbfRoF3Z4mgE5
	wg9KnjWA4lggp6hQRBpfaHu9KLW5wJr4WJ7vA+n0lZ1VkYCn62OnV1Y+qc0Sd6V0iO+UY0Uuxzm
	VI2CsaC5euwNQ5byM5oMYDpuwo2xtZN8pGZ4r4NPzirTJxs54WA3tU3FYCLv4MTEZlZ9gu4QSmh
	Wc/SpvA363H8gw8oQ=
X-Received: by 2002:a05:6a21:a8d:b0:3eb:292d:6667 with SMTP id
 adf61e73a8af0-3fe8a70ccbamr6504022637.45.1795088805334; Thu, 19 Nov 2026
 03:46:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-6HS9.v5.r0.20261116052927-1@mojatatu.com> <179508471843.3136.7272721682226577890@kernel.org>
In-Reply-To: <179508471843.3136.7272721682226577890@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 19 Nov 2026 06:46:34 -0500
X-Gm-Features: AclHuK_PySmCHoLheqoX5I-yhkl7sxxQIvgxTN4EizCqKQ_gZio1vjuLcbHanCo
Message-ID: <CAM0EoMmHD-kxZZDyiV8ezTFzJ4D5ZSG16fimgyCq6Vq=wVcf+w@mail.gmail.com>
Subject: Re: [PATCH net v5 1/3] net/sched: sch_teql: unshare the header before
 writing and fix retry strip
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, victor@mojatatu.com, jiri@resnulli.us, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, stable@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:38=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] This patch changes how teql_master_xmit()
>   (net/sched/sch_teql.c) retries when an skb has a dst attached and=E2=80=
=A6
>

yes, this is legit. I will send a v6.

pw-bot: cr

cheers,
jamal
> --
>
> net/sched: sch_teql: unshare the header before writing and fix retry stri=
p
>
> This patch calls skb_cow_head() in __teql_resolve() before the slave
> neighbour can write or queue the skb, so a cloned header is not
> corrupted. It also changes the retry path in teql_master_xmit(). The
> retry now pulls back only the bytes the current slave pushed, instead of
> pulling to the network header, so AF_PACKET frames without a dst keep
> their own link header.
>
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.v4.r=
0.20261111094338-1%40mojatatu.com
> Link: https://lore.kernel.org/netdev/20260824115928.4099988-1-victor@moja=
tatu.com/
> Link: https://lore.kernel.org/netdev/20261110101908.2e64e8e9@kernel.org/
>
> > diff --git a/net/sched/sch_teql.c b/net/sched/sch_teql.c
> > index dc21cd9704a25..626dc001ec231 100644
> > --- a/net/sched/sch_teql.c
> > +++ b/net/sched/sch_teql.c
>
> [ ... ]
>
> >       if (neigh_event_send(n, skb_res) =3D=3D 0) {
> > +             int off =3D skb_network_offset(skb);
> >               char haddr[MAX_ADDR_LEN];
> >
> >               neigh_ha_snapshot(haddr, n, dev);
> >               if (dev_hard_header(skb, dev, ntohs(skb_protocol(skb, fal=
se)),
> >                                   haddr, NULL, skb->len) < 0)
> >                       err =3D -EINVAL;
> > +             /* The bytes prepended above skb->data, pulled back on re=
try. */
> > +             *hlen =3D skb_network_offset(skb) - off;
> >       } else {
> >               err =3D (skb_res =3D=3D NULL) ? -EAGAIN : 1;
> >       }
>
> [ ... ]
>
> > @@ -408,8 +421,10 @@ static netdev_tx_t teql_master_xmit(struct sk_buff=
 *skb, struct net_device *dev)
> >                       nores =3D 1;
> >                       break;
> >               }
> > +             /* Pull back only the header this slave added. */
> > +             if (hlen > 0)
> > +                     __skb_pull(skb, hlen);
> >               skb->dev =3D dev;
> > -             __skb_pull(skb, skb_network_offset(skb));
> >       } while ((q =3D rcu_dereference(NEXT_SLAVE(q))) !=3D start);
>
> [Severity: Medium]
> What happens on retry when the skb has a dst and already carries
> link-layer bytes in front of its network header?
>
> The old retry reset skb->data to the network header. That matches what
> neigh_resolve_output() and neigh_connected_output() do before building
> a header:
>
> net/core/neighbour.c:neigh_resolve_output() {
>     ...
>                 do {
>                         __skb_pull(skb, skb_network_offset(skb));
>                         seq =3D read_seqbegin(&neigh->ha_lock);
>                         err =3D dev_hard_header(skb, dev, ntohs(skb->prot=
ocol),
>                                               neigh->ha, NULL, skb->len);
>     ...
> }
>
> __teql_resolve() pushes the slave header at skb->data without pulling
> to the network header first, and hlen only counts that push. So with
> the new retry, any L2 bytes already present when teql_master_xmit() was
> entered stay in place across every retry.
>
> One path that still delivers such an skb, even with the rest of the
> series applied, is nft fwd ... neigh on a netdev egress chain.
> nft_fwd_validate() allows NF_NETDEV_EGRESS, and nft_fwd_neigh_eval()
> neither pulls to the network header nor drops the dst:
>
> net/netfilter/nft_fwd_netdev.c:nft_fwd_neigh_eval() {
>     ...
>         skb->dev =3D dev;
>         skb_clear_tstamp(skb);
>
>         nf_dev_xmit_recursion_inc();
>         neigh_xmit(neigh_table, dev, addr, skb);
>     ...
> }
>
> teql0 has no header_ops, so arp_constructor() installs
> neigh_direct_output() for it:
>
> nft_fwd_neigh_eval()
>   neigh_xmit()
>     neigh_direct_output()
>       dev_queue_xmit(teql0)
>         teql_master_xmit()
>           __teql_resolve()
>
> The skb arrives with eth0's header in front of the IP header (network
> offset 14) and eth0's route dst still attached. Because dst->dev !=3D
> slave, __teql_resolve() looks up the slave's neighbour. From there:
>
> If the slave neighbour is resolved, dev_hard_header() pushes 14 bytes
> and hlen =3D 14. If the trylock then fails or the slave returns
> NETDEV_TX_BUSY, the retry pulls only 14 bytes. The next slave sends
> slave header + eth0 header + IP, while the old code pulled 28 bytes
> and sent a single header.
>
> If the slave neighbour is unresolved (-EAGAIN, nores), hlen =3D 0 and
> nothing is pulled. The next slave in the same pass gets the double
> header, while the old code pulled the stale 14 bytes.
>
> At this commit alone there is a second trigger: an arp_queue skb
> drained back into teql0 after neigh_resolve_output() wrote an eth0
> header. Here skb->dev =3D slave is only set inside case 0, so the parked
> skb still has skb->dev pointing at teql0.
>
> That second trigger is closed later in the series. "net/sched: sch_teql:
> keep skb->dev consistent on the arp-queue path" sets skb->dev =3D slave
> before teql_resolve(). "net: neighbour: reinject a parked skb through a
> headerless output device" only reverts skb->dev to a headerless
> n1->dev, whose output is neigh_direct_output(), so no header is written
> in that case. The nft fwd path above is not affected by either change.
>
> The AF_PACKET case in the commit message only seems to need the
> dst =3D=3D NULL early return in teql_resolve(), where hlen is always 0.
> Would it work to keep pulling to the network header for skbs with a
> dst? Another option would be to pull to the network header in
> __teql_resolve() before dev_hard_header(), as neigh_resolve_output()
> does.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-6HS9.v5.r0.20261116052927%40mojatatu.com
