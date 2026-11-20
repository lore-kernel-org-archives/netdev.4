Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795144343;
	b=FV4iPJx4LSyYTCYkWgRYega48rzOSt7uPXwcZ3XCqsW5Cec+nuJ7dXfnYIr7Lm8v3PZD
	 RBo8a8Xu2SDr/VVNQAva2/dL/ZdRmuKv42f3AfTWN2BjoW/RhyGEOmj+XeOgUM9q1m/vO
	 //pU55+s0tOh+pWk0qRtcandgIU0fSQ6NAekz6YNns8+00Wyno6YrAJhANzZykNvjV5uP
	 vPEmprl4CulPn+cZ26mS0b7nmJXlEO+xlFpfc6E2eA4RdzTfhZXd6sTuc0zS4Qxajvx/3
	 l67wfFB/aMovJj43u4TvwzfE93xntMOYrZ94djeFSpHHRsRUdnK5XtwO/4jVwVby8qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HOAJCIMKLkEmYe3CdYPWRvwAGWwY3sFgyaKQ4xBOJSA=;
	b=p+E5GTmaLAvdpOuBiY2iMfQ9FAEsYO3bjR0+VQmhhcQzkKv3+8XaPQQ41VaUlNXvG9QE
	 dFYP7JuPMLjADn5mZcVcxPRCA+XDZfxtCJD1w824xVXnsmAG7ZshY4bbTpwd200f6ozdR
	 oBI77JdCRopLSogPZnfv66bQ+woDneC1cRolDyWZkYzY0Xh+vYkyCgNE8M2rR73OHnHd1
	 aHHxlQnuKsLiEgjCKhE6xhjv+fTJ1+8AkfzaoiwOJjp8pKaaJLwMkfU1Wimv32D6HDqiI
	 MvYUS1SYSuc6iDqfKoSCq8jb5kMD6kYapjtFXn+MpBRefOe0sooz4hKYwCA9+Ql/xNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xs5ZIg3X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E2606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Xs5ZIg3X
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso235073a91.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:12:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795144342; cv=none;
        d=google.com; s=arc-20260327;
        b=O2QbuVFE77dlE/2IJUhX35d9pkdHZAeWAf8aOc+KLRWhBOxSXga7UiS3viNMoJ82hB
         l38R4Wp56lVikQ2WPhrEXYInG9VoT7SA4vUGJURYB+hF4aBl/dIzvfT31H0tzmsQbUON
         MT8A5bdOqDm2VJmQmGvVi6t5Z8H+9Vn/Q3S9T0zYoNTovyNI0i9jy/Es3bNknr8pTG+C
         mA7ZzHrF3y3orSMBDF+Q2i1bnOjx6au6NEiBqaMkD2TlCyi08uuDSKg4ccPzepEeRVRH
         GeLsIjiRY4jAB0JVH3ISEy8HfnAz3GgQOKuhGzzJyAgT5eqGtjsX2WguCPGyws7sbXsb
         otmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HOAJCIMKLkEmYe3CdYPWRvwAGWwY3sFgyaKQ4xBOJSA=;
        fh=frosMTW1anAssCwLMBfuHygXCXAag6vw22beXJ/pKc0=;
        b=YtflxOA8L7cQIN+aRVnDKuMb9hdfavnUoRB0FYAwTZQ1Ck1XE3KEQ+v70muHZKX8oR
         /TVxXkAqaNWWmtUUdMzOnypkIlFvK5OCWIvXuG0F0HUeXPbsfzRFvsQHxkTENSMBuDes
         rny6zJWrAxJaHLVwCMZ681mmhTFd/g9YmiAT7dvjqFOcJ4PNKhRFEyqzcMJ4/RgWgSLO
         GnKlAflprjMNY8ErXaH4WNtdnOjhl0dM6V38AweWHIkYXOwrDPSea2ARM7yDP+C5FBit
         Ki6nOUNDkAU0l5UF/nEEZsC0ILBnB1NooT0bggVNqLaWkK2aFAgDtpYH4HeDNWSUTcDc
         3uFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795144342; x=1795749142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HOAJCIMKLkEmYe3CdYPWRvwAGWwY3sFgyaKQ4xBOJSA=;
        b=Xs5ZIg3XsjEaDwNYjFGRnPx5DgadgJHqqVyecfw22yvvzZ9qjRhse/pe2hIx5PwJqs
         Ab4S6HKpGgAygmnLGYvvrcdzWgg94EeFcfwt0ct2UepHbs7rH/jSbGJmjkUzkhdBUrit
         /RlD1WsiWf3+WXujjOT0sCW+9X7R6actNt1kTThkzuP6tb3fBy2BKs/RVDO66W+UuD4e
         0mkuwjNuyyURH20b6E5iRvdSooQtJbOKR+BNJRF63/Yh565nqc4Mf3O68/LLsEFql+Yv
         UYmE9IBB3ZEnthEs0H0KtEgixUafk6LRfncjLaz9dxGzYxuO/77rmgCtDM6zxL/q7kAn
         7/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795144342; x=1795749142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HOAJCIMKLkEmYe3CdYPWRvwAGWwY3sFgyaKQ4xBOJSA=;
        b=m8XzRP0MWv+/3YZp2WHJc4Sk69ZlcJd3VThkNF3aaM3PCkwg9drj5xLDI2W+qTA3kt
         K9x9FToOQaTytDDPjnVS1KRuxCa0/tUJKFeRLmFX0BLYIXOPcwTKqn42lGLGylhcI4sH
         wyGUaszKYkn9aoUevgxlhqJwkn/p5ifH/8n13gwDUTXe79/UoS8AU/FPaYohgASAlTo7
         2V0Bb9t1oZsP8Nay3KP/sneDPyRcCagSpJQdL40BVGY/NwobOBjtJOCaZdO1KXfElzwB
         hTyoCRizU7wHyte76fstEgRrSGUg9D6s2DQ0Y1hAeqiiY/OwS9YBQcrYivUXV0ILX7ne
         FG8A==
X-Forwarded-Encrypted: i=1; AL+hErHl4RYATdClATh4XMIbN22TsUSNxVQMvGcvPiaqDFiBF6xEGMi9R7/2lFWLB+BgKpCRqOu3TD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lq7yGIXHxnxUMa238ZMNiMCCun1hivTTcUR0uVK9uOi2E6ieY
	ruIEBrCSDjtYFwJPS+RWItfxgJXkr3RPv7S2bc21Zqa4XzXbCman1WavbgzuTazxYKXganR3PK/
	wtfjy4hJg0yAr5Xx78TRuEVZi+C2KG7r+BLmYmLFn
X-Gm-Gg: AZFdTZdlddEQ3eLKn+46hd7HsKRUFiftE2yUc7LadPAQ8EyU9gyCNMdacoyYAGXY0AZ
	FUivdHPPGad46sI4aBuRE+AHaQHMafoTQlOFAytX91n1YWK7ZkAykDNLxFqpC7Jzs426ODOyfJc
	uGsIj1qhaSpemb7hQBDzsoWpNnT4KGw+te0FSm/KYwXos7zY9B6AJuuoirTjbLBzfW9L12KdicE
	QLR6i8bsbFlODjO6HNCQ8n0o/irbDgWXK/plftiZA388jQOoOxFgxMcYRIgs2wt/V/gePaVWa4K
	Iw0FZhUIZxZTAFl6LOvTFbWfNJpb7++tt+Jb9m4BU0Xy/VraQs8XM+wC+tbUnxGkK2i9uQxaaZX
	LotWgcwNhWMK8SMpFWe21BGHBCBogqDbq1ltUOK8As/EfVAHHTTZzCS0pWhDl5ABHepfNZUs7
X-Received: by 2002:a17:90b:5348:b0:3b3:b453:2453 with SMTP id
 98e67ed59e1d1-3b41c94ce8dmr1463704a91.37.1795144341460; Thu, 19 Nov 2026
 19:12:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <224334a7-150e-4794-af72-596c3821558c@kernel.org>
 <CADWJPTundpvzkpJrxva=M+6YF4zQ9dRSY78Xypi9B1NuH58Usw@mail.gmail.com> <a9e4655a-0a12-4b40-9641-36e7acc2cdcd@kernel.org>
In-Reply-To: <a9e4655a-0a12-4b40-9641-36e7acc2cdcd@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Thu, 19 Nov 2026 19:12:09 -0800
X-Gm-Features: AclHuK9n4mXKy_I_m9Kvg3U-SexLZNsVTT6pF6O7FnXOqb_ZO-_sCJLL2NXNUks
Message-ID: <CAHwYsiqOhntJR7D00vzRed1=eo+4xXnRdYtTD79zdL35RT9Kog@mail.gmail.com>
Subject: Re: [TEST] Google's Netdev-CI: a few flaky tests
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Sheena Mohan <sheenamo@google.com>, Willem de Bruijn <willemb@google.com>, 
	Netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthieu,

On Mon, Oct 26, 2026 at 9:41=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org=
> wrote:
>
> Hi Sheena,
>
> On 24/10/2026 19:49, Sheena Mohan wrote:
> > On Fri, Oct 23, 2026 at 9:02=E2=80=AFAM Matthieu Baerts <matttbe@kernel=
.org> wrote:
> >>
> >> Hi Sheena,
> >>
> >> I hope you are doing well.
> >>
> >> While looking at the results on the Netdev CI for the Google runners, =
I
> >> notice some tests are quite flaky or constantly failing. I marked them
> >> as "ignored" on the Netdev CI while this is being investigated.
> >>
> >> - IDPF: psp-py started to a month ago. I guess you are monitoring the
> >>   results, but then if it is normal, it might be easier if you block t=
he
> >>   known bad tests from running on your side. Just in case, a few links=
:
> >>
> >>   https://netdev.bots.linux.dev/flakes.html?tn-needle=3Dpsp-py&br-pfx=
=3Dnet-next-hw&ld-remote=3Dgoogle-idpf
> >>
> >>   Because the previous branch didn't get tested, the regression might =
be
> >>   due to the modifications introduced in the previous branch as well:
> >>
> >>   https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-09-23--=
16-00.html
> >>   https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-09-23--=
08-00.html
> >>
> >>
> >> - GVE: "queues-py" test started to fail recently: I *think* it is a
> >>   regression due to the following patch that has just been dropped, bu=
t
> >>   we will only know that in a couple of hours:
> >>
> >>   https://lore.kernel.org/20261021155611.68473-1-phx0fer@gmail.com
> >>
> >>   https://netdev.bots.linux.dev/contest.html?remote=3Dgoogle-gve&execu=
tor=3Dgve-nipa&test=3Dqueues-py
> >>
> >>   https://netdev.bots.linux.dev/branch_deltas/net-next-hw-2026-10-22--=
00-00.html
> >>
> >>
> >> - GVE: A few tests are unstable for a while and have been ignored: do
> >>   you mind looking at them, please?
> >>
> >>   https://netdev.bots.linux.dev/flakes.html?min-flip=3D0&pw-y=3D0&br-p=
fx=3Dnet-next-hw&ld-remote=3Dgoogle-gve
> >>
> >>
> >> - IDPF: sometimes, it takes ~4h to run the results (+1h to start).
> >>   That's fine because we have a 6h window, but just wondering: is it
> >>   normal? (The GVE runner seems to start quicker, but I guess that's
> >>   because one is on bare metal and the other in a VM)
> >>
> >> Thank you for your help!
> >>
> >> Cheers,
> >> Matt
> >
> > Hi Matt,
> >
> > Thanks for reaching out and flagging these issues. Here is an update
> > on each of the items:
> >
> > IDPF
> >
> >   - psp-py: We agree that blocking known bad tests on our side is
> > best. While we resolve these
> >     failures, we will disable the failing test cases to reduce noise
> > on the CI dashboard.
> >   - Run/Setup Duration: The longer setup and execution times are due
> > to running in a bare metal
> >     environment. We are looking into optimizing this to reduce the dura=
tion.
>
> Thank you!
>
> > GVE
> >
> >   - queues-py: We also noticed this failure recently. Since it is
> > suspected to be a kernel
> >     regression, we will continue monitoring the results.
>
> It looks like the issue has been fixed when the bad patch has been remove=
d.
>
> >   - Unstable/Ignored Tests:
> >       - devmem-py: Should be fixed by patch 4 of the series recently
> > sent upstream:
> >         https://lore.kernel.org/netdev/20261023204706.3112215-5-hramamu=
rthy@google.com/T/#m0f075c545d9de1c0ad3bd95da0f009a82e80b6c5
>
> Great! Indeed, it looks good so far.
>
> >       - napi-id-py & bond-options-sh: We will investigate both tests.
>
> When fixes are applied or unstable tests are blocked on your side, do
> you mind pinging me so I can remove them from this ignore list, please?
>
>   https://netdev.bots.linux.dev/contest/filters-hw.json

Both napi-id-py and devmem-py should be fixed now given that [1] has
been accepted and merged to net-next. Could you remove these two from
the ignore list?

The fix for bond-options-sh has been sent out as [2] and the
discussions are still ongoing on the mailing list.

[1]: https://lore.kernel.org/netdev/20261023204706.3112215-5-hramamurthy@go=
ogle.com/T/#m0f075c545d9de1c0ad3bd95da0f009a82e80b6c5
[2]: https://lore.kernel.org/all/20261112014942.2946303-1-treapking@google.=
com/

>
> Cheers,
> Matt

Regards,
Pin-yen
