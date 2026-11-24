Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795539523;
	b=dPoyLEexRKpeU9bSsg3YMFEz5ilq+tl50avUH68EumcZxtF3pnK8stZZM1iCyR5qO5Uh
	 1GFMEud4F0Uj4YTNJiciuiHlWy4TPsf82fXvTKr98IUUKwemWxkkp08F+R5zg2jbyf3hU
	 X7r85eq/g0Z3ZOEzHuGUK11DL2d/hGuMJ0A7HduyHrj6wM5IMjH3/Qltc5bAvwA4G9zJy
	 6z1pVxieuIz35dPq4Xgy3N4nfzAY4WnzCIO5ruBK76tII0Q/5FLn6jFQN1hTYNxzSFzJH
	 DZe8cS8tvGiuD/+uz7T6JmMVODD9tZS7SJJOxkxWK9TUVcs8ShmECaOSBUbOLgewJ1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5HjZJAjY5u3Fowj7izRJvXnGMFA618no4HsUeAZCCbU=;
	b=Pe1POEZkHJxMxFcOwLZ+uZTf/IIrJOBgLBuytFOEE9Ee18uhQfXc9dW8zcstQXiv91j7
	 meo/b0eRKJGwLrxD5nZGoeCHTKRPpQV6ZsRn9n3ZFNYErK3X5Q7V2/oaxEv1scFKR+iEY
	 rQeR29N5NJ2ZZcnPvWf0EO1LWj5S6QwZtitTO4hVHRB6hSd43o0qBL26A3ejNm/fBAlvT
	 ONYwHMrJDGwZDmQJ3T/jjhQE25C+ObCsoAQcNNmInL3Xw6SVHMnL6stRWw8ov7YRpRLH2
	 iaSXPUZZRtRyiV+CJ0FNGWk/xzhx4KbO5+KJ/6zwcJ2AK0eBpK9QbMQzvDjAC8I/pNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=YeeksOgb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E357606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E357606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=YeeksOgb
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so1752563b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795539521; cv=none;
        d=google.com; s=arc-20260327;
        b=NLFgmYd2+Tp2shaiZSFFYz7t8oG748mlghJcdlRXVCHzXWhQoJ0xxw+7o/zAFUZ+Fp
         EjXxjkQruYTs+FwwvkGvdGxbllsF7CIlEF7ehoni9kb4wsukmmawiJbwbn6VpBpInHfu
         LmL3SqqDtvj53cMtRSxRXcpclc63sX/ScvKeoTdF/nZc+vBJKwyWagtF77bTV1KE9Z7P
         tcf+R0gr3Ekv/t25qaavNl7xDCwLFHmV6xwTPgG6Bhj5k8KxTRztns9R3O7RH5x4HFx9
         /NRVsZRWRe2l85AvU+aLjzMivfNt+RUQYEuQE/o3Tn+z7qnrMW5+/mbTYJUKGF/dkxF0
         cyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5HjZJAjY5u3Fowj7izRJvXnGMFA618no4HsUeAZCCbU=;
        fh=qASyZGPwl3aoNJMYPKk7NONDMpMxJ0d6QGIyXMj+joo=;
        b=pLYmuMmOGrqUSm1uhiZXrbiMu6gVaXXXiQ0WZLGHu8t/DaUMGD2AZ4szt52Fak8sFo
         jUu9aL0xHJLxKqg6rn+1DOARaXMf6XEXCEzSJJshYHl41lu/vbOyNanN1J3uNo5umOqn
         NQNaIVFHvLClqaEnp0zgk0SMsYCZLDwULy52UNm5AxKYt9H6kMWhiD1SQ2FaPsOc9cN8
         mxONrHzkFfU3UeyP1cIyQtRqkIqkdlks3+RI+EbGkrmO022XsB+TvfqSo/cH+t9QJSoO
         ukNIBiS/cxbFok/EZhc3W7Bt6hRBURBMMFqH1n+fsT/vZ69FJwu15g23QK9URPQg1prD
         CmUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795539521; x=1796144321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HjZJAjY5u3Fowj7izRJvXnGMFA618no4HsUeAZCCbU=;
        b=YeeksOgbP/Ulct0x6tumOGXv0wn/ZsspZGvZfAkR27B9GIzuFGk73NNFZQ5WF53eKh
         Wroaprl5KEkWpWNY4Mm5HDKZtzlzvVltshd/1Qg3x19fEijmQ4z/Ei5Tt0cqTy1ieCTa
         meoBLb/33SzPZUHLTbZOF2qYBX/qaxU7al0oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539521; x=1796144321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HjZJAjY5u3Fowj7izRJvXnGMFA618no4HsUeAZCCbU=;
        b=IgBvKlk5Z15oT2jl4EUOxH13KQv7/x0rdNKnk7zQrK33V1DFKa+aW6/QUr0Es8E+6a
         GbvYA+OzegmZm09sJ/iPCVK5ynWnN8f2hh26IqlskmP2/oWXnCrLj1J2e+Qwz3Y7erdO
         PS6PEXukubCdDzzg7Big1iRTt25GeYhaivV+kwUUskEBBUOWo+DhG4vKICPeDrqfjYZy
         Fmp8RWVQRu7iv+Aj5f6NRpjY2l3KuAYolHbxYDrCoK8p/vhb68vTNyMTIy6zLwrc5r/7
         kXLj4yfMl+1NlpgXmRJ6KQXfya5QDNmhLjNeC1qP1RfDMnJHlKwo+TOudwMrW150ChnA
         pxPQ==
X-Gm-Message-State: APuU4Z97gNwAZ5wtP45XXIpCaUiOSoIukhAkZU4KwiMWoptzxCRmXiRZ
	vleAlRVZNc6sxLccmH5dm6AddJh2K36vcypJXTFWO/f7eWZTchhiJ+ys5kwH1W4DrUbadMALCho
	oLfl5kcI0h4di5NO5zgGAG1T8ZmKZNBS/kOQkUiu9
X-Gm-Gg: AZFdTZdUCbPSbfQzoJs97XspggzNQKvX0/NxjjkbS8DJdkIiyquzMl6Esdch2Oq1gdD
	WsfUuoqdTnQ4k5c245DialukwKEWx+0tkbVJ72A0yVR+rmxaGSGXjSxdaTO3IaCgYruX3Dx4rQ8
	zMois8rlieDyyV677M1r0M4cuKqn+9Jp8KIHh3hfTnk5umglwufq5A/v8G7F73fEQgoNrYjMm57
	vaBf26kblt7Hc2kYJPzl3YMvFqWjp+pE3iUFLFnNv5I2erFsefCTIT4rh8XylvOaChDS5c2Nqwg
	AqNH0X47vjqppVfABGs+xLAvF6sytfzsrYVMZf50fyHAngWJPeK+bouo6mrohb6AWVsRK2G/sV+
	mX5D9p3wok2tPuQZU8mISvjaHzZ+v9TS1eo/VpTUXDBwykHsnJXy6qyQaH4AFs69KGZEqZoOk4p
	l+bgI20/q3j3MQTVU=
X-Received: by 2002:a05:6a21:6116:b0:3e2:1418:aae8 with SMTP id
 adf61e73a8af0-4014dd566d2mr15911153637.72.1795539521356; Tue, 24 Nov 2026
 08:58:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com> <ACT-WEXM.v4.r0.20261124074514-2@mojatatu.com>
 <20261124161258.vLyrm8Y4@linutronix.de>
In-Reply-To: <20261124161258.vLyrm8Y4@linutronix.de>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 11:58:29 -0500
X-Gm-Features: Aa3M54pJO0xlb2aFJWl13lvot59VCzXd4TbuAAatZjI5CYCOVCy7EsRNd2NC2Vk
Message-ID: <CAM0EoMmMio4kotBqbcJmFtf_c3Du=rhfvp+sMiAd0fHKowv6Vg@mail.gmail.com>
Subject: Re: [PATCH net v4 2/3] net/sched: act_gate: refuse schedule entries
 shorter than 10 us
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-rt-devel@lists.linux.dev, Victor Nogueira <victor@mojatatu.com>, 
	Po Liu <Po.Liu@nxp.com>, stable@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 11:13=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-11-24 09:12:09 [-0500], Jamal Hadi Salim wrote:
> > This is a followup of commit a51c328df310 ("net: qos: introduce a gate
> > control flow action") as reported by Sashiko.
> >
> > The issue:
> > fill_gate_entry() only rejects an interval of zero, but that interval i=
s
> > the period gate_timer_func() re-arms the hrtimer at, and a few
> > nanoseconds is below the cost of servicing one expiry: the next is due
> > before the current one finishes, so the action holds a CPU in the timer
> > softirq for as long as it exists.
>
> The timer is programmed in the past, fires immediately and hogs the
> CPU.
>
> > On a 2-vCPU guest, entries of 1 us and below hold 86% to 90% of a core,
> > 2 us holds 61%, and 3 us holds 22%; from 3.5 us on the cost falls to a
> > few percent and it reaches zero by 100 us.
> >
> > The Fix:
> > Require at least 10 us per entry.  An act_gate schedule is not tied to =
a
> > device, so unlike taprio there is no frame time to derive a bound from;
> > the bound has to come from the cost of servicing one expiry, with room
> > for a kernel that services it slower.
>
> The 10us sound sane. With enough debug (say kasan, lockdep, =E2=80=A6) th=
is
> might become tight again.
>

Agreed. Unfortunately, there is no way to derive a "good value" here
(it depends on workload, machine, utilization, etc, etc).
poor choice of wording on my part - should probably have said all of
what i said above for precisiness...
Cant wait to see the pedantic nitpicks the sashikos will get about
this. Regardless if this is all they came up with I am not resending.

> =E2=80=A6
> >
> > Fixes: a51c328df310 ("net: qos: introduce a gate control flow action")
> > Reported-by: Sashiko (gemini) <sashiko-bot@kernel.org>
>
> There is no syzbot report for this?
>

It's in 1/3

> > Closes: https://sashiko.dev/#/patchset/tencent_4ED9536B0375C96183B2244C=
F7709768C605@qq.com
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> > --- a/net/sched/act_gate.c
> > +++ b/net/sched/act_gate.c
> > @@ -25,6 +25,11 @@ static struct tc_action_ops act_gate_ops;
> >   */
> >  #define GATE_ENTRIES_MAX     1024U
> >
> > +/* An entry shorter than this lets the next expiry land before the sof=
tirq
> > + * servicing the current one can finish, so the timer stays permanentl=
y behind.
> > + */
>
> No strong opinion. I leave this here.
>
> | With a too small interval the next timer will be programmed in the past
> | and will fire immediately.
>

see above.

cheers,
jamal

> > +#define GATE_MIN_INTERVAL_NSEC       10000U
> > +
> >  static ktime_t gate_get_time(struct tcf_gate *gact)
> >  {
> >       ktime_t mono =3D ktime_get();
>
> Sebastian
