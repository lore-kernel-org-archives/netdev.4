Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222256;
	b=tZ9CsJ4vE7rCKmY497Spn0DLBLcqpRqhJc6pDZH75RpihqPgMfBO/Nn5qzL7MoupPCq7
	 N57GHYuanhheMGHU+VRiWVfvfMsiS1/H653OH7X+1pwEmBSmuz+FAonajWwLEU9CB4/zH
	 mGC/PKx2NptqUh7RfkFAoT3FEteKkF3lACTPJEQV4naPuGrbaMwY1ydFORzrZhXCcckVx
	 SlOuBV2F4Q4qlwI/kh5OLrl8DSu/foNsW4h4e7DsqdZ1e48XAOPjERyH3Ftx3mfeJpDGf
	 Yv9Im/c43LTYz1TB8EmgTwN3/VGAcw20oA+slRdUO3UNWhEI8tROG3dpw5nlyuN5SrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=W5sY+zS/TOg2lOvxZM8Q1MkQ4jh/WNf1fnLbgtqWJ2A=;
	b=Rqjr/IleNaK8YpUBBXzPiHj4jn5K3BWvsAlKqv0Ao807QzfnI16w8k1jjg8QNRz9zJh1
	 ASz9tx1hu+rkn+/S+LCpzZ4hVI9VPScVdmPrOIm8qmSOiIOIJl95khEV/g5SulwRvYU48
	 sznsoVj2OH+SBMYhbU4Yih5//sWjuQUZAEgSyBdzEZ6t4YRWtm9WnpPzuVBVqDNeq1EMt
	 e7fr0SAQTUlY4KTLk3PMBVOq6VseoV6T0vVY0dPCFm1F/LYSSde1ZC4Ys+X8LE9trbq1M
	 XlFReBqsxGwYP/HMaksFgfGPA+ja1MdrdHS2ExiAXn3ilbYAs3d0+2oHw9nE6dSoO4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LyqRF7GK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B992606A6AD
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B992606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LyqRF7GK
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1aefd1bf74aso959870c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795222254; cv=none;
        d=google.com; s=arc-20260327;
        b=QjWdqLMAWAWfqr6RoTbUef0MqTA6YYzvCtjAPbLmHB6uyJeErdJHBf0hZVWsxozaem
         uaplSyu3yG+98wtt/QvbsaYYobWFvkeJbETxsFtGdlfEysPvzd5jVtbvJ0xBI6QoJOPR
         IZb/aUFOGF0X1K+LUfBmd8y/+R2p1FkMTr2URfDoPDqsjB5wJcbPrXBOyK7oTtbXKXrz
         lPYqJEQzMvJm9qUEoCyob2Tu7ZJKNIYKxFmXTTe7g9J8DIqIqnCMsTQzHcFwP+I2pgKI
         MycVyjptfHPz06Q71C32bL8ayO9elk5U62XvidM2Tg5HWEuBagL0udjLMqY7czPfT8OF
         SYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W5sY+zS/TOg2lOvxZM8Q1MkQ4jh/WNf1fnLbgtqWJ2A=;
        fh=sN2qBbBZIuD2ACwhS2Dqun1BTwTbkspBBDouBWpeZSc=;
        b=YOnH/XhvTcOsFkjswQlpkCjY+S25cF3g76Do7AtSEMtQsMkC5CY1wKoLVsfQfe3Cp/
         Ye1NSlHRIjpAlpIQwRR47KAOlUlGom5EPfKbrKU0Rf1w43gU0DiaaVUTXsekc+rjohfq
         PquU/V6SUs/SDvd4AXnU6c286loO/S+WjhXxBHlCdsPUYZzYOb+Snqm/MxAQ7mjT9hRk
         87UTeA+jKxfmdO9hJc+nWrRacBexUHdT/KqsUEy/4iMUmOcZoAKB/MZFmqrtDJ+pTLCS
         AAT2oxuM6CeiCjt251Vzo72q6mMehbG6XoyMe9Nj6SDr9fk6P0QGrBzj2bCMwuwkIfQL
         pC6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795222254; x=1795827054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5sY+zS/TOg2lOvxZM8Q1MkQ4jh/WNf1fnLbgtqWJ2A=;
        b=LyqRF7GK0kKjTSjtBT2UGhwu8JrpuOpjkc1QgkAQyewesKnd9Jpk33ZkQTnRI4/xUn
         eD1S2BbU9h92nuK4O5XPgqkPplK2KXRPlptK5fStY8ezNglvvsRZ56OQsU2hb+zy9vKh
         Ci9Da+5LNq8/4Pn7pRt4GX7iIU+Ymvi8JghBJR9rp/8RQmKXSLyRs6R+GpjseOo1SyYO
         9Wmsd0wPihbTWO0vxeWxRNuoCuhMthcvQ/27DLJhwZf1WETsj6wuq3iKdDwXQqMvdlu7
         ZKxuGdU++HFJKaCanWdpWPzXjR1bXq7iFO/Wh6+C5XCZ1LhrSx/TKA1NKqHO9DxTd2YZ
         13Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222254; x=1795827054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5sY+zS/TOg2lOvxZM8Q1MkQ4jh/WNf1fnLbgtqWJ2A=;
        b=WZmvd3bKd0nEc4mYxWiITA6V5MYWEPFhhNiGHyKoZdQQim77FrDCzZtNbykakEgSGp
         D93zE0JctwH8b3ezyPeExzlsDBs97XFrYmUqghtEAsDTzMNghNaxst9g0S1OGNIJX2SV
         S+dLsU5J8sqV4Tsh/D6fnkHvy2bb8QFljU2zJ8/YW+QkMrdjsjMG6jKp6fFZXMb6JO+3
         Y+wWz/vd27My/ODNlHbhmJIwBi222ItFtsqOiLkkEA6fjdwq90gIwd56n4zI+gPT7DWk
         EUBQW+fe79kRtynn3calOep4gWdSPC6/8ZZz0i0cbykpJ0JFrZf956ZZn+7kVgiXPFbA
         d91g==
X-Forwarded-Encrypted: i=1; AL+hErGiEAqHWhNIFgq7hMkBW+Su9FLtmk9Az9SiY0BifeZgo6g09+59Wm9o+MP8beIzQuNa6SqfQD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZM2vdBwJIic+bonrJA7AD4wno1SlIGYSHTfXipRqgCqNWJ1Uo
	DOrGYy/SxbBsKzG8h3BpVtMaJSEgiQZQPRuYWeARCrPRRzzlyLAopgw3efqXxLNgnCNVEKGKILh
	3i813/R2z93hKlNFZia9F0Hia74qe0yxKlO4cDHUv
X-Gm-Gg: AYBFou0EZFS5U9po05OTlgkRbWQZORnfCi6iflyeqQWQN6sGgDkNU0NHF0VQILp0us+
	2yG9eSOR3HW/xHAn93z0AgN50+bVdpvnQB8jabtLefP0v3/WCR19TZpPssTPmXod2vHOEAqRSKJ
	OInwFnl9NlRQBbGPudFhCiBH67Ln7ShO9V11vPZrkBRVlGG94CFDqhrsLRsYl/1VyB+/Xv3yIHa
	PHRyNrom00eJ574aOKDHmnRUVLqPaZqYzwshf0FeQPhcH6o/UXfB4FDFh9+YfC3aHV8LLrok0Sw
	cB0RLAhXqCLE78lWPnZ0mk4Hit9XKQHernLoWmoWzTo0VqTBrUFmfCvhaquV3oXL+aTS27nsJ91
	ldFIsC6EPHnr1PDimmnm0h6ORdTUZjCgQa9Xn
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id
 a92af1059eb24-1b55692849fmr4583976c88.20.1795222253498; Fri, 20 Nov 2026
 16:50:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <26fb4276-5615-45fb-9cb9-fa5e872d8e7b@kernel.org>
 <0469d224-3baa-48c2-9d28-ac0d9fa2ec73@kernel.org> <CAHwYsirFS4nAuvXQA-eOgqq8n=29tfvvUvuk2QygrbCt0pcz3w@mail.gmail.com>
In-Reply-To: <CAHwYsirFS4nAuvXQA-eOgqq8n=29tfvvUvuk2QygrbCt0pcz3w@mail.gmail.com>
From: Sheena Mohan <sheenamo@google.com>
Date: Fri, 20 Nov 2026 16:50:41 -0800
X-Gm-Features: AclHuK81nO6kq7kntkYWtpugWCghCo173RFFUUCXVnkfdKs1CVC-4B41j7xcptQ
Message-ID: <CADWJPTvhKh9twnA3Hs8w5-yA0uq6wnY=eXANf4hT4jjmVOz1Ag@mail.gmail.com>
Subject: Re: [TEST] Google's Netdev-CI: missing results
To: Pin-yen Lin <treapking@google.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Netdev <netdev@vger.kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:19=E2=80=AFPM Pin-yen Lin <treapking@google.com> =
wrote:
>
> Hi Matthieu,
>
> On Fri, Nov 20, 2026 at 1:08=E2=80=AFAM Matthieu Baerts <matttbe@kernel.o=
rg> wrote:
> >
> > Hi Sheena,
> >
> > (+ cc Pin-yen)
> >
> > On 23/10/2026 17:52, Matthieu Baerts wrote:
> > > I'm working on the Netdev CI, and I notice that the runners on Google
> > > side are frequently missing results:
> > >
> > > https://netdev.bots.linux.dev/flakes.html?tn-needle=3Dgoogle.*vlan-py=
&min-flip=3D0&br-pfx=3Dnet-next-hw
> > >
> > > (Look at the non-coloured blocks.)
> > >
> > > Is it normal? Do you mind looking at that please? :)
> > >
> > > Note that when an active runner doesn't process a branch, we cannot m=
ark
> > > the whole batch being validated as "not causing regression" because i=
t
> > > is lacking some validations. So when this happens, the end result is
> > > marked as "pending". That's not an issue when it is once in a while, =
but
> > > here, it looks "too frequent" not to be reported.
> >
> > Lately, it looks like the situation got worst: 3 days without results.
> > Because it is blocking all the other HW tests, I temporarily disabled
> > the two Google runners: results (if any) are still fetched, but ignored=
.
> >
> > Do you mind improving the situation, please?
>
> Thanks for looping me in.
>
> This was caused by two conflicting patches ([1], [2]) on the mailing
> list. [2] removed .resizing from struct htable, which [1] references.
> Our runners currently build from a full distro kernel config (which
> enables CONFIG_IP_SET), so kernel compilation failed and no test
> results were uploaded.
>
> Results for google-gve are being reported again today now that [2] is
> no longer in the testing branches. Sorry for the inconvenience and for
> blocking the other HW tests.
>
> We will update our testing infrastructure to use a minimal kernel to
> avoid unrelated build breakage in the future.
>
> [1]: https://lore.kernel.org/all/20261117092731.14656-1-onleaf322@gmail.c=
om/
> [2]: https://lore.kernel.org/all/20261117101018.523826-1-fuchen.dust@gmai=
l.com/
>
> Thanks and regards,
> Pin-yen

Thanks Matthieu and Pin-yen. Yes the kernel build failed on the last
few Google runners. It is fixed, and both GVE and IDPF should report
results from the most recent run.
