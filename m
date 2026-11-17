Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794956080;
	b=Kfm/COP3HscQ3N6w+6iRAeOKKI8yCtklblZoZan/f5wcCoRTDqBPNeGK+MT4SW3FIQBg
	 MGB2s4XeMWiejC1I8jxb0Wh63cnsfWqcsCtz/VCtjYit5P7qM+8gMPpqR9pkmqKWrQHbB
	 IQvDohvGcIl1b9uaygzwmHur16pePW1uwtGHwkez3VNHr2OyMLf/hkiA0es1F8unw/8As
	 efqHYYzOE/0XKn6UAR1dCw/0IvQqiD+r+IpAA9BDNwC7BQtHXmZCHtT/C5Djrk3zg+wC5
	 oZBA5tba+eZY4iGGJAl1D35EhmnW0/NnPL4Dfr5DMWsb8WCvpJ8BMV5kwl4+bgFjnLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FA+rhSXirxH2tEEiRfmQ53GOxVuNr6q4Vt/d4V46XNs=;
	b=dDJXPAxJzW33EQfcKVkQGRE0so38nZR4n2q8JSawzCXWVyXClTlnSQw1gDpgoI6TF8H3
	 jJVMFteGxB6npGdDfGcJ//uOHZ6iRyFHm58IYtoTtvVAGbLbO114QUcXQhyN8tZdFQfMf
	 39irNyqrvWoLlAevn6kwmeqLCrTha0zE8GUzidemg6HYKtEQjKixG7uw19jnnHhQTP9jt
	 nUgjFVsBNkNDcpWN3fdf0ndnXHZZ4huLEUt6tTJuBuWabcq3yHQb+9mw3XUcOSRom1H98
	 jsK87usW9svo8iKvS/Cct+0cAAIvkiYwYcriW9uHhvaQ8Hn2Jkr43Yv6KHZIvVyOkgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jR2CeCVo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA1606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jR2CeCVo
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so157165b3a.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956079; cv=none;
        d=google.com; s=arc-20260327;
        b=RAWAjFBLH+njftFghm5qZNTuTrWhtYwl6Ia+EjC3ZY5knDP81Hssayhwbfp/h4ir0L
         D4t1K3d5vE/Ax3wgrtO59MGpFG/gOLl6z2WJI6z1bMNGUGzK6LeJbxP4QEujNtWW0mRJ
         eZcpsBgYekHFPoSI9BdNeRpsj4W6lXFFiESV1mQ04pSqiwz78MSKnCcZu+7VIiMATUWm
         ULxmcFV6XABDD1esEQ2appDG7hT2ErbqUX14EqENUNkEzeIqWdBdWcTkEuBCz56GBPTx
         uENIIihJtM/DfHkxHAK1e1S9kbGkxxaoqgzRkpuaENNL9WNX3ZWG8/hOZpDCAczTYSWz
         h3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FA+rhSXirxH2tEEiRfmQ53GOxVuNr6q4Vt/d4V46XNs=;
        fh=MlVgmAbqRm3fP3NwTTJltGsVvSBiqy0lcHGhNF8l9iA=;
        b=CkFWVuid/P2IzjvjChxsqUopQ64vLu4DEAKbHz63oOqZ3Ofv+T14qw2S9N8+A337mK
         j8F68wN6NXUdaYDhwrLkNhObekh9G9YOGhX60hpyhxY95LIoRLo7klISGG5lqchGjngA
         xPnwo/TfoqSCfG2/VAeVMJtbs0QTgAnz8LtAJJf1/4abLUjImsMLvAsHCRrKGUHC1Lnk
         PoT+9xiHqtf2oQkjYS1IbVMHxdA/mEgnqbems/P3qs5dmNqA5iKJgeF6V/YyTK61kKV5
         JZ/QzoSxtWSdb4gbsFjFBOdrW/IKri3iaiBwQBjoxe4qrm325CU00uBN7eehrjx4wHIE
         jrSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794956079; x=1795560879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FA+rhSXirxH2tEEiRfmQ53GOxVuNr6q4Vt/d4V46XNs=;
        b=jR2CeCVoBMwowOEsklnkqoG9nv4FpIA4DlHOGYK/qlJa9A8cDc7WSC60ODv8vKKkDa
         kwb1d75yZ+eiik11AMu1OedAAXxEBLLQ6/PbqsV1WWIRBhuBTmLTxHCiTCo7kTcGEF2r
         rc3QWV62GOghMnn0cVrY97HMABKOm6nSmsOxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956079; x=1795560879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FA+rhSXirxH2tEEiRfmQ53GOxVuNr6q4Vt/d4V46XNs=;
        b=uNmUAsT+/FQq/EwtBGKS5tuiIjF2beOjLuz+qyVOjWAKqC4sjQwWP9uHe9UwNAkpVA
         MMBilkEMhk5pFRqy4Dc1wDftWvhum+uIa21N3uLLtw8mLT71LKy/albztjLL3rEzlSTf
         GLyF00CHf+AO18lULN3mlXbUfSirSD6EJALp/KfAu3CeT9yla5OUu5cpBSkgrV3T47C+
         OCKyXDeqM534JTM/byP1GNwH5GrbzrvQ9cNax88cSs2NJTV+vNUEnUuBVIfQPXaNFPyY
         yiD0Y8eue9JNaayOAw776k0G7atMoiKLuFcHr97qa4QhylkRuvOu3wR0XYU++jkVdZqI
         1xvg==
X-Forwarded-Encrypted: i=1; AL+hErHlOfwhUubWJexUNHIOAreorEmzdUHTZG2kkJgYilOXpvGPnq/BDyoR/AV/NXKLMaEBswg2f88=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wvDQTGp14Y8ehDmnMli/Ml9Py0l+97GewgpwgbS/bnNfMfzRP
	BHGeCgqwub/lmTmi7R9wfDeeyehy10CEhixPuMkync7Qv6llLdLrT0UdNCtwPuvMGQVAFCNIlUb
	uYFEqruQSVBEBkW+Ru6GRNkOAGzMWzkNJE6nUywXb
X-Gm-Gg: AYBFou17k06vPgoNcp0kHbgsP+r1DedroLqlmUOQHYvoBQBwqudAsadPB580QjKJ4V1
	zXp5ycykgwFwKpqZWdRBCjHzUZ+EPShzocoU7E5xMP7oEwP0PO7p/V+K8+UawWF4tm4UMBqNa+G
	SMBtgJGW9X7fYly+xJzJ8gapLqxTq1KtyS6P2BYjZ9yrp1p4ASftc6oVl/Ny/vXZgHWhTkporlr
	Iq1cXULBeE4Sbx7gS38riB+e0Wf43qHGVzAtoUNMZBFeRtNYbfU4s+CZ+KOsKoGBtUo0Jb2mOhf
	38+T8Qmal2QFM3IZzyEt3oRFPxx79//mqOs+9bazBnNYIpintxY1DcdY6hbbHP3aouDBu/fw5iH
	QD7Du4A7dRb/KAZvhaCSjD01cSHdK5emKvYmE+PlnfTN/8h4e1KFfC9Hk13drCz/IDFMgnSyMnn
	tV/aHeS0UNXR3LUYM4AtHA
X-Received: by 2002:a05:6a00:e1b:b0:8b0:5438:86a4 with SMTP id
 d2e1a72fcca58-8c5d35376dcmr566150b3a.16.1794956079440; Tue, 17 Nov 2026
 14:54:39 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com> <20261117141653.60ce5d92@phoenix.local>
In-Reply-To: <20261117141653.60ce5d92@phoenix.local>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 17 Nov 2026 17:54:28 -0500
X-Gm-Features: AclHuK-hFaA95g5uFSvVeDeVeN-PXsOd2jPKaUjgxaMJ4b7_r6UNwbtUHk4SRQk
Message-ID: <CAM0EoMm5jkHBnkdxKq_TDs9uwBWiJSqrJLXc_CWOOoT+_+X6mw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Victor Nogueira <victor@mojatatu.com>, netdev@vger.kernel.org, 
	Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 5:16=E2=80=AFPM Stephen Hemminger
<stephen@networkplumber.org> wrote:
>
> On Fri, 13 Nov 2026 16:10:03 -0300
> Victor Nogueira <victor@mojatatu.com> wrote:
>
> > This is a followup of commit 9c572a83037a ("net/sched: fix potential
> > stack infoleak in em_text_dump()") as reported by Sashiko.
> >
> > The issue: em_text_dump() appends the text pattern with nla_append(),
> > which is a bare skb_put_data() and does not pad the attribute to a 4-by=
te
> > boundary.  When pattern_len is not a multiple of four the skb tail is l=
eft
> > unaligned.
> >
> > tcf_em_tree_dump() records the raw span as the ematch entry's nla_len a=
nd
> > then writes the next ematch's nlattr header at that unaligned tail.
> > Userspace walks the list with RTA_NEXT()/NLA_NEXT(), which rounds each
> > attribute length up to four bytes, so it looks for the next entry at an
> > aligned offset the kernel did not write.  The ematch list is therefore
> > misparsed as soon as a text ematch has a pattern length that is not a
> > multiple of four.
> >
> > The Fix: append the pattern with nla_put_nohdr(), which reserves
> > NLA_ALIGN(attrlen) bytes and zero-fills the padding, so the following
> > ematch stays aligned.  The emitted ematch entry then carries the paddin=
g
> > in its nla_len, which is what NLA_NEXT() already assumes.  em_text_chan=
ge()
> > only checks that len covers the struct and the pattern, so a dump repla=
yed
> > as a request is still accepted.
> >
> > A padded text ematch is the same size as the request that installed it:
> > both sides carry the 8-byte match header and the 24-byte configuration
> > followed by the pattern rounded up to four bytes, so a tree that instal=
ls
> > can still be dumped.
> >
> > The kernel has no explicit bound on pattern_len; it comes from the
> > request. TCA_OPTIONS carries a u16 nla_len, and for cls_cgroup it holds
> > 56 bytes of nested headers, the ematch header and struct tcf_em_text
> > ahead of the 4-byte-aligned pattern. So the largest pattern that can be
> > installed is 65476 bytes (65532-byte options). At 65477 the aligned
> > options length wraps to 0, the attribute is dropped by
> > nlmsg_parse_deprecated() and cls_cgroup_change() returns -EINVAL. Since
> > the dump is no larger than the request, the padding cannot push the
> > dumped TCA_OPTIONS past U16_MAX.
> >
> > This also removes the last variable-length nla_append() caller (sch_gre=
d's
> > is a fixed-size, already aligned struct).
> >
> > Conditions to recreate the bug:
> > - CAP_NET_ADMIN on the target netns (unshare -Urn is enough)
> > - add a basic filter with two text ematches whose pattern_len is not a
> >   multiple of 4 (e.g. 1 and 2), then dump it with RTM_GETTFILTER; the f=
irst
> >   entry comes back with an unaligned nla_len and the next entry's nlatt=
r
> >   header is written at that raw offset, while RTA_NEXT() reads an align=
ed
> >   offset three bytes later
>
> Teach your AI to write shorter commit messages please

What is the problem? This is the standard format sashiko likes:
1) you describe how you came across the problem,
2) you describe what the issue being resolved is
3) you describe what the fix is
4) you provide any extra context
5) you describe what the conditions are to recreate the issue.

If you leave any of those you will end up in version 5 in no time. In
fact you will immediately get a note from Jakub's bot to ask you to
explain #1
Where do you see the sumarization/shortening happening?

cheers,
jamal
The majority of the reviews are don
