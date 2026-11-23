Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467012;
	b=3tTgJ+iqSurOyll8BER9HE4jLT2oBf6PKtod2j+Wo0lJfZPHMk1mu7Ams9DMyiOExmnB
	 pZxNTpVSYjRgR1EJa+mDtM/GVgUe+CxDUMVujfkRa+6uhnT8MmXofHYL65q+I1pV60gWB
	 YLXAT5n/ZIVCXa9QCCnLLGaeLBdatEOzrJqLv0cjzX99h+LCcdOuErHg5+7XinyD7C8WJ
	 cVdLzdHOnCKvar6zUKyjT7r5EFuxqDxADr8gnMkohM0Ue2UabtHiOmk9b61OVCfSkdN7Q
	 amZoKSLS24qiJcJZdhEXrtN4KOcB6yvr796jANpJljhwFOUes3+Md2NQmRbKVtsUqwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wd8o0kgNN+E9xh1BMXBcFYWtU6z6KMuqwjn+H2Qxo5I=;
	b=N4Tg7BFNZUwKPSNCjfOtDVebR8VZLtX28f0jHg1aathCLrLAcIgw+ucm88cWvPQUE/lK
	 E2XpcH1IfIkp/l2IKzHT0RBjhfSoaeu8BzmhKqhht0iw/PWlth3nbfp3NdyslTPIDpzwd
	 d5hA/aiETlkAgUYytCpjOjWUyeaVCjoL/hhk9/CnZQF/EVs6Qyoh65xLFX9b63MCYgjou
	 23QP1gxjXmIci3TNvp8us+mSvU5Zfth6TVkzN6ZTt0jbJscY6PZ49cVDY2EjG/lnhGap1
	 Ag34FSAkAuFbdwQeGGKIjd6ko75/t5o97CjiO6V6Ru+Ili0ctNEqr0be9XuAEo0qxUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kFkF8HJc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A363606A334
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A363606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kFkF8HJc
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3282db206d3so525057eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795467011; cv=none;
        d=google.com; s=arc-20260327;
        b=oAaW4Q8wUP83VaqeGhr8v78OtopzEjCqXgK6Qksm0/A4wATdFNObf24Y3/X22mVm8s
         4fSz46ex7Wiw0vflu63WEALL/LX9+IvcLfgRHoMKWw4ByUPBM8vNNDxYTRowGbAhRlrt
         QYSsLJMUlsOLWz1fjspo0yrIMHsKkBzXKdKCbJv7tK6IVM6HmKTJXW3hruuAoQ0deZmX
         pxCB07+hHqkmylPQgINFMXLEtI316r4ZomYZgL9OMQEunJkboAWA+SycP3B1PNToTqHU
         M1rNZfPjHabHNYc6kGFDIrXdIfen7o+nfprJQV/yZBDSQNhAOJZ8F+eBvg9r67atWx30
         kxtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wd8o0kgNN+E9xh1BMXBcFYWtU6z6KMuqwjn+H2Qxo5I=;
        fh=InE4q9Rm9koqqy1vnuj5ddEeFLKozdjjWJ0zN4k5kbQ=;
        b=c27uZQ9DAEzJ5tLOpLeR98ijrjbJiKtudfrwELB+dA61twgQc45RHeVuhYuSQ/Jp2Y
         pJskvlI0dKlBevRvZdhQxqxUe+dflPVShtoHmeSO0WYt5qUV+ZO381bCYUMy+xVxk/AO
         XtoOVBZAVWLbgApC+WJe0CXSF+WVa6kyzNcg9YlWIMGwoZZ0c6vTcFgYfke3iGRYJQxr
         cAeId451NpYNFxOxVbCjfsQaaTuDw8cj39tP7NoZP02hhvRUIqu3Y6DhLXiFqZfgABu7
         VioxXGDQ9ECUjxjiz0NDb4GIPIeDhJ1UV4gFtrosz6Cqb67V+l9M91BDcs93AXK4AvaX
         A9UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795467011; x=1796071811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wd8o0kgNN+E9xh1BMXBcFYWtU6z6KMuqwjn+H2Qxo5I=;
        b=kFkF8HJcUJrPWwm20Fu/FyZOnv8otF+esqX+PKhme0uE7Y5afa64dXOVVfe4cK0cSc
         qhuLedN0WXLe9SefCM0tGlPW5KryopaH0uqQEq+nVYlZ2p6A2Rv1NFTKaCQPdMnENWpW
         XVgluYAgjpBOCwZvNjFCQOYy/o66nITxG067L+4RR8cbG+QuNuRUn6mVay93Y5lhJdcJ
         2l1/IC7xPhULUKl6liI8+EGotV722fNU8zf6QQ2IJjyGKYIaSB+LBBxGuptlIjaBTW9X
         x/Sciv6g/DbXPkkCgMPfL1E+MuGnAGRl+1In65XKlSQjloNu8MzMICXnrx6NS0J8gU2d
         MUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467011; x=1796071811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wd8o0kgNN+E9xh1BMXBcFYWtU6z6KMuqwjn+H2Qxo5I=;
        b=vQevotDjjeRPnS06LFoezghzR5eP0+2Lxky5eGkQAGVNef7Q/9Qss/peZ2LuY5PqX6
         9yHdnwL4heunN6l/S8k1P/Eo6IA4EhjUINALYJ3CHiAbzYYjMJ0wp4Qcs3fZfayICTpz
         pvVdPyCEENVORS6MgGl3qjudFyrctm4QLtTphPm3MH6zyCjUeyxVJyp1+yjG1FnCOG/c
         BmY6wjK/rBcUHZPqI0HZFcR2NBaTGbW6wsu1QQOrkMvvpPTGgYA4JRIm9phItbrUPhoS
         6mkqtJ7GEStu0O03bCWwDd71WAjpntTsBzuwqiLdfujGzOXDe/J3bjvoAxZgoZsSWrl4
         QipQ==
X-Forwarded-Encrypted: i=1; AL+hErGbTfcww1yAXYepoYeKYyIhUPKwdPgm3EYLrLw1ArM9vQY+/d8twYPzv7XPeJYHp3ykdlYiW3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z81vbYxCrOUSc4N0Rxy9V+bu49rWOP8WzuDSFH2h3ZRR20Za0y7
	BviloASqmSLEzdZW++Op/u8uEWN+oyskUlTjuStSoUhZjZ2aVLq69nLzynrfVS5GELNiQBmonNA
	MbrdZxxmwe0LlDXjCqYWNwIA4dLrfbYSHxEXdPoic
X-Gm-Gg: AZFdTZewX6jFtB3S2oRCnDsexB08jgvDJExQ72/eEqC/CeCihuDIqfYacZqs6CfOW4g
	j59cY0p+sZ48IrrxiJbFhwbkOc/rB5x4ApVeSbMHms387JTljmT6t22tWEkPkAu91uq9q5kuXTK
	o21rnO3B04JUnkzYxVtun7Y9PiV2VQCq19vQaTrADXXZO2mglr+R4NlNFLv1UmhETx4Q5DlqYJg
	A6lX+EiFjtztCxqOM3f3PS0CjhMZNVVU+R6O38LLRixdhJ7xdC9/gIGigMJIZiB16jwybEvNbG+
	mgUZfJ+UK+0Hnv/KD5T2XxXCnpabfe+nl5jK/rlP4rsnmGXlQlo07l3GJQ+hnE3SSyH9UCOWanG
	OM/6F+K05JI5MgSDPyaq3cfnTgDK55wTDfd0=
X-Received: by 2002:a05:701b:4512:10b0:1a6:7a2:cfc3 with SMTP id
 a92af1059eb24-1b558384c4fmr12882053c88.13.1795467010067; Mon, 23 Nov 2026
 12:50:10 -0800 (PST)
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
 <CADWJPTvhKh9twnA3Hs8w5-yA0uq6wnY=eXANf4hT4jjmVOz1Ag@mail.gmail.com> <b3795455-a237-48a0-890e-97165d218260@kernel.org>
In-Reply-To: <b3795455-a237-48a0-890e-97165d218260@kernel.org>
From: Sheena Mohan <sheenamo@google.com>
Date: Mon, 23 Nov 2026 12:49:58 -0800
X-Gm-Features: Aa3M54rA4v_vbDmTFSPvPIVjVTnP_dLAG-ejgz3dTMCyW3bYdbNzqWBTphbNRis
Message-ID: <CADWJPTvOQnFreBBRJdhhSX5vdp7pCh7VrVJFrGEDJdC=RpfW8Q@mail.gmail.com>
Subject: Re: [TEST] Google's Netdev-CI: missing results
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Pin-yen Lin <treapking@google.com>, Netdev <netdev@vger.kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:21=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org=
> wrote:
>
> Hi Sheena, Pin-yen,
>
> On 21/11/2026 01:50, Sheena Mohan wrote:
> > On Fri, Nov 20, 2026 at 2:19=E2=80=AFPM Pin-yen Lin <treapking@google.c=
om> wrote:
> >>
> >> Hi Matthieu,
> >>
> >> On Fri, Nov 20, 2026 at 1:08=E2=80=AFAM Matthieu Baerts <matttbe@kerne=
l.org> wrote:
> >>>
> >>> Hi Sheena,
> >>>
> >>> (+ cc Pin-yen)
> >>>
> >>> On 23/10/2026 17:52, Matthieu Baerts wrote:
> >>>> I'm working on the Netdev CI, and I notice that the runners on Googl=
e
> >>>> side are frequently missing results:
> >>>>
> >>>> https://netdev.bots.linux.dev/flakes.html?tn-needle=3Dgoogle.*vlan-p=
y&min-flip=3D0&br-pfx=3Dnet-next-hw
> >>>>
> >>>> (Look at the non-coloured blocks.)
> >>>>
> >>>> Is it normal? Do you mind looking at that please? :)
> >>>>
> >>>> Note that when an active runner doesn't process a branch, we cannot =
mark
> >>>> the whole batch being validated as "not causing regression" because =
it
> >>>> is lacking some validations. So when this happens, the end result is
> >>>> marked as "pending". That's not an issue when it is once in a while,=
 but
> >>>> here, it looks "too frequent" not to be reported.
> >>>
> >>> Lately, it looks like the situation got worst: 3 days without results=
.
> >>> Because it is blocking all the other HW tests, I temporarily disabled
> >>> the two Google runners: results (if any) are still fetched, but ignor=
ed.
> >>>
> >>> Do you mind improving the situation, please?
> >>
> >> Thanks for looping me in.
> >>
> >> This was caused by two conflicting patches ([1], [2]) on the mailing
> >> list. [2] removed .resizing from struct htable, which [1] references.
> >> Our runners currently build from a full distro kernel config (which
> >> enables CONFIG_IP_SET), so kernel compilation failed and no test
> >> results were uploaded.
> >>
> >> Results for google-gve are being reported again today now that [2] is
> >> no longer in the testing branches. Sorry for the inconvenience and for
> >> blocking the other HW tests.
> >>
> >> We will update our testing infrastructure to use a minimal kernel to
> >> avoid unrelated build breakage in the future.
> >>
> >> [1]: https://lore.kernel.org/all/20261117092731.14656-1-onleaf322@gmai=
l.com/
> >> [2]: https://lore.kernel.org/all/20261117101018.523826-1-fuchen.dust@g=
mail.com/
> >>
> >> Thanks and regards,
> >> Pin-yen
> >
> > Thanks Matthieu and Pin-yen. Yes the kernel build failed on the last
> > few Google runners. It is fixed, and both GVE and IDPF should report
> > results from the most recent run.
>
> Thank you for the fix and explanations!
>
> I only re-enabled GVE, because IDPF is still too unstable:
>
> https://netdev.bots.linux.dev/flakes.html?tn-needle=3Dgoogle-idpf&min-fli=
p=3D0&br-pfx=3Dnet-next-hw
>
> Also, many .py tests (e.g. vlan.py) are no longer tested on IDPF, see
> the bottom of the previous link.
>
> Can you look at all that please?
>
> Cheers,
> Matt

Hi Matt,

For IDPF, we temporarily disabled tests with failing sub-tests because
they triggered executor timeouts. A few test suites, such as vlan.py,
had all sub-tests failing (example
https://idpf-netdev-nipa.static.usercontent.goog/results/202611200839-ff3e4=
741-e35c-4950-aa4f-691a3771c7ac/vlan-py/stdout.txt),
so we disabled them until the underlying failures are resolved.

In parallel, we are looking into disabling only the specific failing
sub-tests rather than entire suites to prevent executor timeouts while
maintaining test reporting visibility.

Thanks,
Sheena
