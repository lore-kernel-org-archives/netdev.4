Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795120031;
	b=cgvEt5DFAwvyAuqI+c7//dI6GKuNn8b21POTa+IA7QF0mmhnTuYGL4XOsZlxJqUK8QJq
	 XxF1v29EoLrr4T7HVs/wiuyVq+C8uVU+6nx5mgE5LuppWj2oaUOKVohMNiFF9rAVg2JLa
	 XNaj6oRic6WRlsV42FQD6UTgmkDmfOppaVqJSMGxGSX4Fa/f0NXN8jLJF3eBMSr/qAj12
	 pWLtm8udRQwaSfgMSGk87ng0NGbF+lbmy7LEi/StDiSqHiW2HRAS45qFy63fxC2lqPvxJ
	 BerLy+JWKyCJBm33vW5evMEVp4oCKxlfioywqIHlCTZM0Jpk2MF35YWnqzeZdinO+6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZoxhHCNPXhJR3tLG7mSx/X3owvYp5j4DXpht8eltBa8=;
	b=yS//1rtekKyo+PVBgUBvB/7IvP2rVttOWvoyAjbKgJZ4qVQA8QNax6JkjJrpbUFxKUjv
	 sPxN6VdrWowkcZeV/xZSokZOKvdRr9jVmgISc1G1VKGK9G5V5YpvgKCLwQZbelaOxY/8c
	 5l3faS9bVaxmKcCSDpltJX2fIHAF90qGmezgSKXNJXbVwA+MaqPs+7wiy5NCUGae34qlo
	 WAkldHkrRiY8CjDLKywO/Ql/Z9vWfwLBa5x1S1uqYMgt1xWipo/Lu0daJRsWVg3oLgqun
	 Z+59BN9Y2h7amQ1n2uPRQXjvuBmrDycofb09PLsc+LEglCpIwgL5UlQw/7L/f2i7lsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Wmc986pR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF36A606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF36A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Wmc986pR
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso108801b3a.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795120029; cv=none;
        d=google.com; s=arc-20260327;
        b=W4gzgMAHurWnyab13YLdBT0QVnlXR5/25h3UXmfjOJNf1CaTkw/sBTXQ81u2GKE8fh
         kcQW20S+ObUpIWKkvgSV+jsSaczv6x0LsW5wi6Hv9Er6dGpzrTJwucKlEt1MQAlL0hRO
         0BkiXBQiX95SIuIU3bknp0IM/ko5L0QhB7527LSbp90p6u0yUCUlBVJr6gfmMvrkFxUY
         /TD1COu+kj4OWse0UVHfrfgsf5XHJ3NiuC1GtnjvPVrnVvxkKNDrPdVfRq9YuwIgxg0t
         A6o/M3UFrKxiopOh5ixkN9CvpHwg70sOQiRDSlgd9G1166qzpeeX8Qs+9RXFTfJ7fv11
         ErCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZoxhHCNPXhJR3tLG7mSx/X3owvYp5j4DXpht8eltBa8=;
        fh=tRHd24vaZfMr8BFbmSiqd/+H5pKrKlfovTmhruj8Dlk=;
        b=Mt4xnDsusYYHB630c1VhYC4WFozo+aIr0DpQpMvu1DCXDG0rAZvY2DqIC1kuQluI9U
         xO9k7yggMR3Oj2ZycOasSQIxMEDFxcqxSAw5Fr2LbY024WR1gPqftQqoQWlVPZ4aFxk4
         5pMyArwjSo6BPw8mha6MrydXCMbp/pjMlxEh+1I5CNyTwHERpk6+TgW3etcZZxx+DBKF
         NL7iY6PwChRJWsDvYXRTG3+wyNa0Mzmq6dOa7xk/400owBgZ26a1EPWvI21zQBBCfyBq
         IfMfWAXyApDtgEZcSKnuoSUnppkkK64LloBuPM7Iuoayh+tiUE+TrEsksKfYil21JHMN
         qy7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795120029; x=1795724829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoxhHCNPXhJR3tLG7mSx/X3owvYp5j4DXpht8eltBa8=;
        b=Wmc986pRBGXbKLXE4119Gctmg4JjaBtlEZPJSXnLoO9TDpuhX2st6sMZzrd9xQylB9
         IJtDNp/1Fmc7havcQt//g+yi8Uv7XEV0fcKak+xdT8NhemQhdUSFlRZ/KLkn4SWFTT+3
         mH1endb/+Wn30JJfD/K9Wk8godETsTgMLY6JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120029; x=1795724829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoxhHCNPXhJR3tLG7mSx/X3owvYp5j4DXpht8eltBa8=;
        b=FoO7E0xksMscxYrDeJz+SpSSrNbovR3ySdq3e5moc6UNVTxvis3BowglWNZ29cM+eH
         GqGQ1Kkk5OKBqSS60pyZbgHP72aJEnL46KmoRfBRQRjCVRzQ2RsNdjqTwSkRUU3M8TFW
         TA4aquQ1fgdvBNfPA+JG+D1r3iYD8v4Va8yGsIHGI82IoNke8jcCaSxSQK9MQoDM00Qg
         sA98Tq2vP25piXUFJz59TlVAEudoDse7IX6q1ovG8M68cSn+pjI9tcA5II3gw1MpswKt
         EqD+wrD8tWNM1SeedQqRQaYDzTM3atxrm1kibvc32uwkydz+JSpPJN7pI4jGpbmMXxrp
         ddhA==
X-Forwarded-Encrypted: i=1; AL+hErF08C/HhhIaX0Ffco/5VgPGLSCjLuvKekzLZe+LFVqgsMqjKShpqivH4TptwJXy1etQJFv0u/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YezAaQKR0JuqwiN2JOP219TwMW54gqujkOTP25oqEZOYHjk65
	sKB/BZS51s4lS3qIqxFEzrPvd/hCx2F7DCPUgxm7aoZNnGshEII760n5Mrpo62ZQP2LgFPJ1j1b
	BmpKeZK3m2QFa7Vycjfk3fYVeWY/qPjfOzGZLm7uQ
X-Gm-Gg: AYBFou3GuvO9O08ydpeUNJIx+5i46u+20r0XzZHUBBCLpYBhDMWXAsi4SrtCOhxofdo
	1TJ1bTUVdPlPCam6EJCb1pCRM/Ud7mS7M2yJqxjSA33L/oJs2Hp7K1Bhf0UuFwHObdOZ4bLV4On
	O2fzp/+MuGZ2B/w63Txsjo4WvHCJsGQQ7yzoVRBbXJrdgbI3ah2iywzj+OH081e2Pc3FQ7Roe4q
	g27et0+7kxFW6S1JzihRUmMveGL59B/jBhTw67qxtFdIJl1fykbx9RYbwgjH2uFN2FJMZWkNh7+
	VtNK1yWv604Cpd1pVrzZZYwK1deCuaH/4u6d4b3Z2OZvSploycpUrrR2J2vkCovTaCbDLC14TFc
	Z7EQFN9UNU0HWj0qFXGtm8tuJvRfndaMNiSe75q1MmFmSpCR1fLTzRgxPTjk8Z+EW7tTGl7Pyg7
	ZoaLkCBVn9ZuO8zCs=
X-Received: by 2002:a05:6a00:2e95:b0:8b5:7fc8:8677 with SMTP id
 d2e1a72fcca58-8c87cc4251fmr644396b3a.39.1795120029210; Thu, 19 Nov 2026
 12:27:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com> <179494556684.3136.3254895311432959761@kernel.org>
In-Reply-To: <179494556684.3136.3254895311432959761@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 19 Nov 2026 15:26:57 -0500
X-Gm-Features: AclHuK-a1TohZyEZcaOhtgrNY8l6DLG4MiHa3Eod_UYFLyn8nJF7eK0fAgKKOig
Message-ID: <CAM0EoMkLQ3ctDGxOTLr=BHURnRd8uCX_rinEM9Fwe18cKCb3-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
To: netdev-bot+sashiko@kernel.org
Cc: victor@mojatatu.com, netdev@vger.kernel.org, jiri@resnulli.us, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 2:59=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
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
> - [Medium] The commit message says "A padded text ematch is the same size
>   as the request that installed it ... Since the dump is no larger than=
=E2=80=A6
> - [Low] The patch fixes a long-standing, user-visible netlink dump bug
>   but carries no Fixes: tag.
> - [Low] The commit message describes the impact as "the ematch list is
>   therefore misparsed", and its reproducer needs two text ematches.
>

Unless someone forces us to - we dont plan to send an update to this patch.
The medium issue is a misrepresentation. It has nothing to do with
this patch specifically.
The problem is if you have a large enough message that doesnt fit in
the response it will be impossible to retrieve.
A get or dump can collectively include other TLVs that don't fit in the TLV=
.
It's a netlink architecture issue - not specific to this patch.
Since this is a generic issue it will happen in other code areas.
We have a followup patch to try and address some dumping issues, but
there is no way to fix create.

Also (for about the 100th time): net-next patches dont carry Fixes
tags. This patch is a hardening issue hence net-next.

cheers,
jamal


> --
>
> net/sched: em_text: pad the text pattern in the ematch dump
>
> This patch changes em_text_dump() to append the text pattern with
> nla_put_nohdr() instead of nla_append(). The pattern is now padded to a
> 4-byte boundary, so the next ematch in the dump stays aligned. The commit
> message also argues that a padded dump can never be larger than the
> request that installed the filter.
>
> Link: https://lore.kernel.org/netdev/e0f4776a-0457-4069-9f79-3c97de2a54d0=
@redhat.com/
>
> > This is a followup of commit 9c572a83037a ("net/sched: fix potential
> > stack infoleak in em_text_dump()") as reported by Sashiko.
>
> [Severity: Low]
> Should this patch have a Fixes: tag? Commit 9c572a83037a fixed a differen=
t
> issue: it zero-initialized conf to plug a stack infoleak. It did not
> introduce the misalignment.
>
> The unpadded append goes back to the original em_text implementation in
> d675c989ed2d ("[PKT_SCHED]: Packet classification based on textsearch
> (ematch)"):
>
>     RTA_PUT_NOHDR(skb, sizeof(conf), &conf);
>     RTA_APPEND(skb, conf.pattern_len, textsearch_get_pattern(tm->config))=
;
>
> add93b610a4e ("[NET_SCHED]: Convert classifiers from rtnetlink to new
> netlink API") converted this directly to nla_put_nohdr() plus nla_append(=
),
> so the bug stayed in.
>
> Without something like:
>
>     Fixes: d675c989ed2d ("[PKT_SCHED]: Packet classification based on tex=
tsearch (ematch)")
>
> the stable tooling may not pick this up.
>
> > tcf_em_tree_dump() records the raw span as the ematch entry's nla_len a=
nd
> > then writes the next ematch's nlattr header at that unaligned tail.
> > Userspace walks the list with RTA_NEXT()/NLA_NEXT(), which rounds each
> > attribute length up to four bytes, so it looks for the next entry at an
> > aligned offset the kernel did not write.  The ematch list is therefore
> > misparsed as soon as a text ematch has a pattern length that is not a
> > multiple of four.
>
> [Severity: Low]
> Is the impact wider than the ematch list? em_text_dump() leaves the skb
> tail unaligned. tcf_em_tree_dump() then uses that raw tail for
> match_start->nla_len and for both nla_nest_end() calls.
>
> cls_basic_dump() and cls_cgroup_dump() close TCA_OPTIONS at the same
> unaligned tail and then write the action stats after it:
>
> net/sched/cls_basic.c:basic_dump() {
>     ...
>         if (nla_nest_end_safe(skb, nest) < 0)
>                 goto nla_put_failure;
>
>         if (tcf_exts_dump_stats(skb, &f->exts) < 0)
>     ...
> }
>
> tcf_fill_node() then sets nlh->nlmsg_len =3D skb_tail_pointer(skb) - b,
> which is also unaligned. In a filter dump, the next filter's nlmsghdr fro=
m
> nlmsg_put() and the NLMSG_DONE from netlink_dump() go into the same skb a=
t
> that unaligned offset.
>
> Userspace NLMSG_NEXT() steps by NLMSG_ALIGN(nlmsg_len), so every later
> message in that recv buffer is read from the wrong offset. This means a
> single text ematch with pattern_len % 4 !=3D 0 can corrupt a whole tc fil=
ter
> show batch. The reproducer in the commit message, by contrast, uses two
> text ematches.
>
> Could the commit message describe this, so stable maintainers can judge
> backport priority?
>
> > diff --git a/net/sched/em_text.c b/net/sched/em_text.c
> > index bc45edb8c03bf..1e7b41e579e24 100644
> > --- a/net/sched/em_text.c
> > +++ b/net/sched/em_text.c
> > @@ -128,8 +128,8 @@ static int em_text_dump(struct sk_buff *skb, struct=
 tcf_ematch *m)
> >
> >       if (nla_put_nohdr(skb, sizeof(conf), &conf) < 0)
> >               goto nla_put_failure;
> > -     if (nla_append(skb, conf.pattern_len,
> > -                    textsearch_get_pattern(tm->config)) < 0)
> > +     if (nla_put_nohdr(skb, conf.pattern_len,
> > +                       textsearch_get_pattern(tm->config)) < 0)
>
> [Severity: Medium]
> Does the size argument in the commit message hold when the request uses
> unaligned trailing lengths? The commit message says:
>
>   Since the dump is no larger than the request, the padding cannot push t=
he
>   dumped TCA_OPTIONS past U16_MAX.
>
> The kernel does not seem to require the request lengths to be 4-byte
> aligned. nla_ok() only checks that nla_len fits in the remaining length.
> So the last attribute at each nesting level can have an unaligned nla_len=
,
> including in tcf_em_tree_validate():
>
>     for (idx =3D 0; nla_ok(rt_match, list_len); idx++) {
>
> and em_text_change() only checks:
>
>     if (len < sizeof(*conf) || len < (sizeof(*conf) + conf->pattern_len))
>         return -EINVAL;
>
> rtm_tca_policy does not validate TCA_OPTIONS at all, and cgroup_policy
> and em_policy only mark the nests as NLA_NESTED.
>
> A hand-built RTM_NEWTFILTER for cls_cgroup with exact, unpadded lengths
> appears to be accepted:
>
>     TCA_OPTIONS                nla_len 65533
>       TCA_CGROUP_EMATCHES      nla_len 65529
>         TCA_EMATCH_TREE_HDR    nla_len 8
>         TCA_EMATCH_TREE_LIST   nla_len 65517
>           ematch               nla_len 65513 (data_len 65501 =3D 24 + 654=
77)
>
> Before this patch, that filter dumps back to an identical 65533-byte
> TCA_OPTIONS. With nla_put_nohdr(), the pattern now takes
> NLA_ALIGN(65477) =3D 65480 bytes, so the dumped sizes become:
>
>     ematch 65516, list 65520, TCA_CGROUP_EMATCHES 65532,
>     TCA_OPTIONS 65536
>
> The dump then fails:
>
> cls_cgroup_dump()
>   nla_nest_end_safe() -> -EMSGSIZE
> tcf_fill_node() -> -EMSGSIZE
> tfilter_notify_prep()
>     if (size > U16_MAX + NLMSG_GOODSIZE)
>         return ERR_PTR(-EMSGSIZE);
>
> After that, RTM_GETTFILTER for this filter always fails. The RTM_NEWTFILT=
ER
> notification is never sent, and tfilter_del_notify() deletes the filter
> without a notification. Any pattern_len from 65477 to 65479 triggers this=
,
> and cls_basic has the same 56-byte overhead.
>
> Should em_text_change() reject a pattern_len whose padded size cannot be
> dumped? If not, the claim in the commit message should be corrected.
>
> >               goto nla_put_failure;
> >       return 0;
> >
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/QDISC-7SHE.v2.r0.20261109072128-1%40mojatatu.com
