Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795540278;
	b=F7Tu7WuSv0KCqO5/qHJZIihIScg4tl3mwbOehXRJk4Nc5UmAwMGWoNVNtMfhNzNjcK73
	 lYFGaTDGc1+KOYNESWgCPEgT4fpFi2PLHehr2vgx+zCEGdsAiA7mJ2f6TLCOp1kJP0oWL
	 NpzWyfUXZptFscUEW63Z17i3GY/N6DRLPC+Msm1EMhEeWWdC/SQC563HI19bIOdlmJkeL
	 /d12qhjYuZEvE83L3HK5Npiyw4xw1VZXSWIr/g8Stg5CG+jlQ/3RMnVT1QFpw0RKIE7QM
	 EfJgf4kAP/0LYTpvumCGym3cvAGk8g5XP9UMJnu0VMaGwz5Z/yIXWTAV+MoG6i+vtBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ke4DMY/5oHPgUmAeqSFagfiX14Vkl9nfeTs1w7gvuG8=;
	b=Z5mLOHr88UQ44NbvfHbx009oKY26O108FHrGInY/ltr6hXfaOM4Q80nbp1BVso7xpJgZ
	 c02SZh6sFnIZtOlwsHSZsXBpVDKlLUqTmPbKBrLuuLxAdL72bNXpTt59iU4e3L/5DQkjf
	 MOBpv6yvBMu7X8qa63XgUtGh7lq2LlirTa8vvt60q/r+TXDqUOJkM90oIcTzI1vAfPbHF
	 Nevr9RHU9Q1zsWJPY5DAznx9drF/sNhzz+W3aaUERpGb5ufNwU4S4IjRh2iQoO4l28tK9
	 deXl9zGDjwkr24yw+OmEXUBqd9L/+QYQkUjgPAHXhUqkxEj+jdFIWmjaAgme7MQ3xeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=aKkNx6z8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E7606A6B0
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257E7606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=aKkNx6z8
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso2935837b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795540277; cv=none;
        d=google.com; s=arc-20260327;
        b=hWJFfbIxeNhZJ2eWxCNERUel1t7fwKIf+G2P+xetdrJfGi2TbbnVw23SazKwojiFIH
         LW0v9RI3wnpzsPyz/kifdmhNqjd5LHuLLUzpAQZUZpV/FxgOUNmaHucZ63hwNYIfVPYG
         aKzm3qeTXDEgMBTbnlMYQ/zNPlt0m+BFnmRSGPVNMt2JyJG/UwfEI57ogtm2v8lkK8j2
         ZmmX8pQ1XqRPEYIJOMVtkZeYidc4+9g/uYXZzEPPKGtgZWbdOdDe2g40LmjRO2O9tYaD
         TkuBlrCJZgVl0sEXuFyuX3J5Pw8kjtQyrAlG7IlUmRrTNzICI17Ka8tbSpT+lip0Ibe4
         KWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ke4DMY/5oHPgUmAeqSFagfiX14Vkl9nfeTs1w7gvuG8=;
        fh=qASyZGPwl3aoNJMYPKk7NONDMpMxJ0d6QGIyXMj+joo=;
        b=WyCZzSZUzvX3j6G0zyLP5bwJXALyamSndUBwmbWA/AMYzKmUvfCp+3QPvCWTKSP3Hh
         4JIJbj/PppxtIAPfrxa7TmuFIM3tC1nP/+YWCPv7aErNzr/Oew/CV/kIg4WYiArJPGrT
         jny/PPaxumXrVcK/KJY7Y9NkGUJVglKjZZM9lNQw9RgrlZZPVEhBshJryRmVZ9PHSLaC
         a/8wbPnGOpX7prwENY8pXfb5Gx9Yv+sBRkJ0v4Zqctg0jEADra2Zh4pkSpk4a+FqQPTr
         0hPwUmA8r8eTYSNOY1jqT5g45lx366npnfg1xBb5eVTC15ubnKtvlu7GsreG2i+GAiam
         i16w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795540277; x=1796145077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ke4DMY/5oHPgUmAeqSFagfiX14Vkl9nfeTs1w7gvuG8=;
        b=aKkNx6z8zf1GFQJFVfRbdvXUoIdS76x/L8IotURk7AtYZABQ+Agu7L2ft+MyU/oCZ1
         8RacuoMqNGIGTKMEeRMuCym+SPEGH5myefDjMl6p2+1MlVUqXgckoKAsD9pE9oVD9+kj
         iUp0zCdOOqhicYBxWhfEqQiaYmS7KKQeO9daw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540277; x=1796145077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ke4DMY/5oHPgUmAeqSFagfiX14Vkl9nfeTs1w7gvuG8=;
        b=yo9BtGvdAPG8SWNSympj4REMwmO6WIkfre4VTxslkEaCSTjXor82PywwurQRgQMb39
         u567aj38pQwLlpS63dnjLK1Qs04WkpVJHNeZUS4UTncaDaYEanq3gR81fOKoBOzL1eDH
         yxxJ9iifY3ZtMfbKqxLmgAtnXtIQ/Zq1Dj9JgTlL1dzEH/rdjLoYVGIQVaGa2bcJAh0s
         Uu08nwj1GZldC1xzlzqs20RMjL2OtS+XpsaNZspg1mYcZ3DsRa9pRPp3kXSXQSdgFmv/
         2T/ZkjoI84L0f84qxFO9RUWNuhFkywAa1aTLFpg9zZ6STr+gW84UjDMCalUcS80Ii+d8
         QU9A==
X-Gm-Message-State: APuU4Z/zBAF4MANw1Oa3Wh6BBfwUSFG6P7yEFYu8z8ioE0qqd56l16ul
	cRPYGPFXptnrOSlszv5DV3uSj3MoET/j2QhxPqkQIWuh1pfTeg+P5HgW7/fd32AkccRArcFO2Oc
	7xB2cey5nDgow8Zm9Oh/AKgWW8zGYlwyQF57ST7jy
X-Gm-Gg: AZFdTZd2Q/j9ypuoKHbaQ+nScPl3XwAiBWGt5WzniMNGDqEntRochW6jsf4v7IH+3kD
	ZAAxkxGgHC73xewOZz3O3Ql6Vjpy+33/VAw94kJl05ZEH9xtexmArpKo74E/ljVqz/nxsH5FdSH
	GNwk4fAA8YwyNXMKjh6bOIXBHYlCM9vu41RRJ2QtBbHdu6MiqlkxHqA8K3fFfCgg1F7XdKwkNBr
	RjgSoa5Abfa2FzNKX+Cqgebu2RsgaDCsy1Y6V8eygEECHxkutYMKhpQZWzD/4WXzC9O68rTckJs
	j9nYAm8V+YZn3voWFc+M4RcQ7hMBYn3UQdRMyUo2Jdby7+quN9bohCeIQk1IOVMU2YL/kPkqK92
	twFUFHLWLaJLl1eDCh3GFoCK88hH3mlHxhQUoWhopqD1KJdhohrxg7zPs3YRP1yWcsjil7LOXlu
	PcCVB6tMs3bH7CfNo=
X-Received: by 2002:a05:6a21:e089:b0:3d8:e57a:5a5b with SMTP id
 adf61e73a8af0-40149f7bc79mr13550670637.5.1795540277488; Tue, 24 Nov 2026
 09:11:17 -0800 (PST)
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
 <20261124161258.vLyrm8Y4@linutronix.de> <CAM0EoMmMio4kotBqbcJmFtf_c3Du=rhfvp+sMiAd0fHKowv6Vg@mail.gmail.com>
In-Reply-To: <CAM0EoMmMio4kotBqbcJmFtf_c3Du=rhfvp+sMiAd0fHKowv6Vg@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 12:11:05 -0500
X-Gm-Features: Aa3M54oig4IWsvcX3iSlWHrklygop5_tvIrr2s7WuHfHlt2lcJnss6T7_wTd3Ko
Message-ID: <CAM0EoMkEjxCo6K9k3MZH0U+3na9soMNE0gouddwOTzUYXcEunA@mail.gmail.com>
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

On Tue, Nov 24, 2026 at 11:58=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com=
> wrote:
>
> On Tue, Nov 24, 2026 at 11:13=E2=80=AFAM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > On 2026-11-24 09:12:09 [-0500], Jamal Hadi Salim wrote:
> > > This is a followup of commit a51c328df310 ("net: qos: introduce a gat=
e
> > > control flow action") as reported by Sashiko.
> > >
> > > The issue:
> > > fill_gate_entry() only rejects an interval of zero, but that interval=
 is
> > > the period gate_timer_func() re-arms the hrtimer at, and a few
> > > nanoseconds is below the cost of servicing one expiry: the next is du=
e
> > > before the current one finishes, so the action holds a CPU in the tim=
er
> > > softirq for as long as it exists.
> >
> > The timer is programmed in the past, fires immediately and hogs the
> > CPU.
> >
> > > On a 2-vCPU guest, entries of 1 us and below hold 86% to 90% of a cor=
e,
> > > 2 us holds 61%, and 3 us holds 22%; from 3.5 us on the cost falls to =
a
> > > few percent and it reaches zero by 100 us.
> > >
> > > The Fix:
> > > Require at least 10 us per entry.  An act_gate schedule is not tied t=
o a
> > > device, so unlike taprio there is no frame time to derive a bound fro=
m;
> > > the bound has to come from the cost of servicing one expiry, with roo=
m
> > > for a kernel that services it slower.
> >
> > The 10us sound sane. With enough debug (say kasan, lockdep, =E2=80=A6) =
this
> > might become tight again.
> >
>
> Agreed. Unfortunately, there is no way to derive a "good value" here
> (it depends on workload, machine, utilization, etc, etc).
> poor choice of wording on my part - should probably have said all of
> what i said above for precisiness...

And now that you bring this up - this should really have been
targetting net-next not net.
I dont want to resend (unless sashikos find something sinister) - but
Jakub/Paolo consider applying this to net-next instead when the time
comes.


cheers,
jamal

> Cant wait to see the pedantic nitpicks the sashikos will get about
> this. Regardless if this is all they came up with I am not resending.


> > =E2=80=A6
> > >
> > > Fixes: a51c328df310 ("net: qos: introduce a gate control flow action"=
)
> > > Reported-by: Sashiko (gemini) <sashiko-bot@kernel.org>
> >
> > There is no syzbot report for this?
> >
>
> It's in 1/3
>
> > > Closes: https://sashiko.dev/#/patchset/tencent_4ED9536B0375C96183B224=
4CF7709768C605@qq.com
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
> >
> > Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> >
> > > --- a/net/sched/act_gate.c
> > > +++ b/net/sched/act_gate.c
> > > @@ -25,6 +25,11 @@ static struct tc_action_ops act_gate_ops;
> > >   */
> > >  #define GATE_ENTRIES_MAX     1024U
> > >
> > > +/* An entry shorter than this lets the next expiry land before the s=
oftirq
> > > + * servicing the current one can finish, so the timer stays permanen=
tly behind.
> > > + */
> >
> > No strong opinion. I leave this here.
> >
> > | With a too small interval the next timer will be programmed in the pa=
st
> > | and will fire immediately.
> >
>
> see above.
>
> cheers,
> jamal
>
> > > +#define GATE_MIN_INTERVAL_NSEC       10000U
> > > +
> > >  static ktime_t gate_get_time(struct tcf_gate *gact)
> > >  {
> > >       ktime_t mono =3D ktime_get();
> >
> > Sebastian
