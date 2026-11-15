Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794780585;
	b=1+OeGhSNd2IpP93xtOnK0sT3tvB5ZQHIF3AU5a42Ry+4pgq80SkXMj9PgJQc4JV7ciSs
	 6WczNRafv/zTagYKN2b4WhnaU1wTLKneGU9GZWKHb5pixFwgXBsapzRDTT0FocfKeUuc4
	 5Dby9hxwJC/Pd590RqBY/KfjAwtQcP1gHwXtuNtu5qnR8OfhaicSvQPozpdhkLwLmx/Df
	 juzO1WqCPMcgv87Sf+sbt1OJej0gLXkOG4JObmccGz7pe7AojX6BtOhZnh3S+Qf6ASpxU
	 87MkoC7jcnEldpBZfJqTFVO5zQQbHCdblq9rbnuCdm9hsu/S2uGaEb+BAESqpVE4PfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ho/wZGc1oAeiTgg3BwYQjWFIdQwxPbuaNNwg/HhMHZA=;
	b=T8a7GGuYRuC8kKkB+65NFKlSagdMlHefPRH6Je0exIfldoYBO4PrYOw7fns0xAqlAE5n
	 kFL2YshVZz8HqFbzx3kFZ+7u3BXfKqGAsLZ5AX76aQ0bZ4ry2zbcFwJRiqOkNEMduJHjO
	 PTRHVN9v6yXL3h4AbKsBn5LR1sGEW/VexjM8k/N63QawGI1alInHrXREKGo3mRJOs2pB0
	 oOjQMalueHi+No8TXWoV9K2Z8DApErZOqgwGFiT1uioKnqYWoCAl6AFiGdEOYCctjTaPU
	 4p/cTPyaprd803hwZ+XTGJVCaPIwgNVoCYYjr96eOOXlJmVjsrfVD5+tNqsXGVpRilA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=e0GCsMMO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F85606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F85606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=e0GCsMMO
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058315c79so1562648b3a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 14:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780584; cv=none;
        d=google.com; s=arc-20260327;
        b=Fo2Ga0k7SqECkdeFLK3kK3FbpGnJSFMfLd5JHUEVZ8MwTmepCDXGsRvZN5gkICsIDF
         UK3mrqd6qr5cwk4w3ifOYUvpZi10CB7UqmtTefTenC/+6mZhhlcvTjJmr0rzxqmiCrXi
         RtSICMI/zWm+ZAPzd6yFmbXwZQA4v/Zcbi9HeSxYlxIBJbc/NlvmTG5zaqOX9tZAw2z4
         hpco1f1+tNulLesVRfG+M05bioPNkDCgsZKZJ5p+vS4Li9BoYQhpzH5yXEL9ZeKFgg2P
         Ds+ljSmXLW8ekKj7WQ3ZB0ZDYUq3jNbmY2qzU31BzPluYGDDK9EZ6UIddp5Rrn4UPK7a
         IdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ho/wZGc1oAeiTgg3BwYQjWFIdQwxPbuaNNwg/HhMHZA=;
        fh=UyW7bxqDxxz7dIjng7twnnmcUL3bSFsjnyL9KQTtYWs=;
        b=bOelmtpoVqNi1icBXyY6QLafSw2OVawr/qiS4H5U2sjAJWzG8Ath4/G+7o41HT9IhE
         yYHuFp6ulOMcq1V42AJGtE8Bwq2VAoFC/W6ZVOtJBzdSziZRuYykzcstW/SDJfD1KX5O
         MPM1meuWAV7OW0h7lAIiK3k2huEXHnFs7/5/xbbE7Z3/9gm7JJp9rmW4K9C5rbjdDVS+
         SQUhreFZsAwPS2b1OuAoWM4NofOBz4gcSJkrvcH0mqZ5HZkIUA5whx/bFnI7jRXZt73e
         UwijGhHbeiU4WVrA+b94p1FGCaFccuKKsGqLbz8/xaOFikjqiGIUc/LVqeigNnivlsY5
         ascA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794780584; x=1795385384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ho/wZGc1oAeiTgg3BwYQjWFIdQwxPbuaNNwg/HhMHZA=;
        b=e0GCsMMOp1Dao9zeusMhZYvci8yLuyBL4czmaO42yrtXUVn/Y8umMrreu4S4XmqbWx
         H2HaZ9aAu57cwNLZETXntFNeo1neShIjyUys8qo6KJRAmfWdqxKstAqk/MItHnFd2iRt
         Gtvtx6t+aQkmrEe4BOk4r6OvTlzYdPp0RgT7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780584; x=1795385384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho/wZGc1oAeiTgg3BwYQjWFIdQwxPbuaNNwg/HhMHZA=;
        b=wOf2JuG2XGX5A4p7hqDm7Xre2+RWvTbAxbjKSptwHeVQO4HfH7v4AX4NHd4ErOG9q5
         3frUhW18voGJ9et4+KHTsA6wqhDbdRQtorDM7S8D92iLBDBKFmDcSfZESVXbJxoKXizm
         tEv3WpBJn5E7aypmJE5LbE5vPCk975p6StxmPFUOmQ/aV8pXXVW4QUPaZE9FZRCFdcFl
         Fp06KbexieUr+64KzXTjvtHljR1zrsCJhFnP19phgNxSiEV3KpLauCI6H1CWWB+QYqEj
         83qJCtPg36JwbQZT6m5RBDj1K4bnuiTn1fsLr04jUmj5cDAuL77SzP1/QFXR2FV2hSu7
         pCCw==
X-Gm-Message-State: APuU4Z8k6F63wb0CpDSmOIIhPx1IRIUGSSX7F5CPy8AIyNmXBtm9JsU1
	t693PLLDfevzgDfKWnSKOMFsDBWOax0r0zqQtIUadO1dskQozdhRqwwiSLYcANcQRSIobrnSlgP
	pvsyMEhBcNZrqXGo2nBPHqzyQ7rjP7GJwEfroK/9U
X-Gm-Gg: AYBFou3p1Y7CQgQcwrSTDj1dhi55hvRmrtDD0gZpa728VQJaqX9/mSo9Z2sd5hTbJDL
	eW2clhzJ2w6F64l1n/6PXlk2XrQD4817Id25R2jItfH00NZqk7KpXpWDQXFCrtiUlC84LptuOUJ
	0b+DeknmFaPG/2ApYFv4fX3PRQsDJbTkTbL72x9dQCO1brMfWq4LnsS2DvxoBs3Md78D+z+3iT9
	36TOg9Mo8VYYt6t2zpwcD//hxoSc3jaxMyV0/n7lUGNQt6BwnbuKyv9hGsPPmObvkYZIniZuiIb
	O/RzJjhJfwlq/t1BtfzdIVy45OpXBsFPgOilBFDTCtCY7jMrtYjNlv1RnptBhu+ycxcbv0G+BPa
	fJB7j6RYWUTZexlpvIGlhevxx9I+ASwt4P48HTY5Z0VfCaLcPA22eemAjhe0vUnmq3wfA29XnxZ
	kyyhtB0qpwiT0K0wN/yOnP
X-Received: by 2002:a05:6a00:4f90:b0:886:ead5:6d36 with SMTP id
 d2e1a72fcca58-8beb7442276mr7434876b3a.45.1794780584568; Sun, 15 Nov 2026
 14:09:44 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-9NOG.v1.r0.20261111073528-1@mojatatu.com> <179475377256.2199510.7063513352863534262@kernel.org>
In-Reply-To: <179475377256.2199510.7063513352863534262@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 15 Nov 2026 17:09:32 -0500
X-Gm-Features: AclHuK96qBlwP4faLIuMLL_7nmfrPum2P-_Cevt3cb_lwGWMT9vftm0n26OY5as
Message-ID: <CAM0EoM=kEnHcDyuZNBNQDdJ67ZEOcYWESWKBDCy0V8Kqzi+ZMA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] netfilter: nft_fwd_netdev: drop the stale
 dst when steering to a device
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, pablo@netfilter.org, fw@strlen.de, phil@nwl.cc, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	victor@mojatatu.com, jiri@resnulli.us, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:42=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The commit fixes a real wire-level bug in nft_fwd_neigh_eval()
>   (net/netfilter/nft_fwd_netdev.c) but has no Fixes: tag and no Cc:=E2=80=
=A6
> - [Low] The commit message says the rule supplies both the device and the
>   nexthop "so the route dst is never consulted", which implies dropping=
=E2=80=A6
>

You should be reviewing v3 bud. A bit rude to show up with v1 now...
If you have something meaningful to say on v3 other than these
comments then we can talk.

cheers,
jamal

> --
>
> netfilter: nft_fwd_netdev: drop the stale dst when steering to a device
>
> This patch makes nft_fwd_neigh_eval() drop the skb's dst before it
> switches skb->dev to the configured output device and calls neigh_xmit().
> Without the drop, a packet parked on an incomplete neighbour's arp_queue
> can be re-resolved through the stale dst when the queue drains. It then
> leaves the configured device carrying another device's link-layer
> addresses.
>
> Link: https://lore.kernel.org/netdev/QDISC-6HS9.v3.r0.20261103062649-2@mo=
jatatu.com/
>
> > Reported-by: Sashiko (nipa) <sashiko-bot@kernel.org>
> > Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-6HS9.=
v3.r0.20261103062649-2@mojatatu.com
> > Link: https://lore.kernel.org/netdev/QDISC-6HS9.v3.r0.20261103062649-2@=
mojatatu.com/
> > Reviewed-by: Victor Nogueira <victor@mojatatu.com>
> > Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
>
> [Severity: Low]
> Should this have a Fixes: tag and Cc: stable?
>
> The skb->dev =3D dev; followed by neigh_xmit() in nft_fwd_neigh_eval(),
> with the skb's dst still attached, came in with:
>
> d32de98ea70f ("netfilter: nft_fwd_netdev: allow to forward packets via ne=
ighbour layer")
>
> The bug became much easier to hit once nft_fwd_validate() allowed
> NF_NETDEV_EGRESS, because egress skbs always carry the output route's
> dst:
>
> f87b9464d152 ("netfilter: nft_fwd_netdev: Support egress hook")
>
> The reproducer in the commit message uses an egress chain. Without a
> Fixes: tag, stable backporters can't tell which trees need this fix.
>
> > diff --git a/net/netfilter/nft_fwd_netdev.c b/net/netfilter/nft_fwd_net=
dev.c
> > index a48c2f765bbaa..ad4d61d64cdde 100644
> > --- a/net/netfilter/nft_fwd_netdev.c
> > +++ b/net/netfilter/nft_fwd_netdev.c
> > @@ -175,6 +175,7 @@ static void nft_fwd_neigh_eval(const struct nft_exp=
r *expr,
> >               }
> >       }
> >
> > +     skb_dst_drop(skb);
>
> [Severity: Low]
> The commit message says:
>
>     Both lookup inputs the neighbour transmission needs, the device and
>     the nexthop, are supplied by the rule, so the route dst is never
>     consulted.
>
> Is that accurate? The arp_queue drain is not the only place that reads
> the dst. If the target neighbour never resolves, the neighbour's
> error_report hook also reads it:
>
> neigh_xmit()
>   neigh->output()
>     ... resolution fails ...
>     arp_error_report() / ndisc_error_report()
>       dst_link_failure(skb)
>
> include/net/dst.h:dst_link_failure() {
>     ...
>         if (dst && dst->ops && dst->ops->link_failure)
>                 dst->ops->link_failure(skb);
>     ...
> }
>
> Before this patch, an egress skb handled by "fwd ip to <nh> device <dev>"
> whose nexthop never resolved still had its route dst. So
> ipv4_link_failure() or ip6_link_failure() sent ICMP host unreachable or
> ICMPv6 address unreachable back to the sender, and expired or
> invalidated the original route.
>
> Once the dst is dropped, dst_link_failure() returns without doing
> anything. __icmp_send() also needs skb_rtable(skb_in), so the packet is
> now dropped silently. Local senders no longer get EHOSTUNREACH feedback,
> and the route is not expired.
>
> The new behaviour is arguably more correct. The old ICMP and route
> expiry applied to a route and device the packet was no longer using,
> and the new behaviour matches the ingress hook, where skbs normally have
> no dst.
>
> Could the commit message mention this change in user-visible behaviour?
>
> The follow-up patch "bpf: drop the stale dst when redirecting to an
> explicit nexthop" makes the same claim for bpf_redirect_neigh(), so the
> same question may apply there.
>
> >       skb->dev =3D dev;
> >       skb_clear_tstamp(skb);
> >
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/CORE-9NOG.v1.r0.20261111073528%40mojatatu.com
