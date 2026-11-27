Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774612;
	b=QQUseyuUmAQS1/rRg0jUojUXH1zFPwm/8QWbdx47Ep8cRhiEcvQPMDll5hS7FcSw8ejN
	 hmAXlEuh9F/ATvFT+N5hEzTyGsubSrSLMQbenP+drD/KGL0PfogGqlxvHwbhXGmCRA3e8
	 5B3bzLNMs+jAngJdzVJQ9AR07JV55W7Q8kdPG/qTGUCKBM0MdpUUlQVGkaJdea2adRGBf
	 1KzgN2d7o33p+HohUsfzx1GHJ7ND7+MNKIpbadTtkYQdQBZ3rik9BVc6Yge5vyFhsPqHV
	 hdZ7bx5ePWe9sduTzcXYGQUiZn5ZbGcnX+GJOnQsigyD/G3C3apRpPuxaouBnv90TIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KPXb3DtqJNanqI7IPB3ZYAV4XR+6OEYsAvkDzB1Mb18=;
	b=2prZnbANty5Gd3QoYEyP1H4ddsDcIzAkGkVVRWX2evhnN5+bxJMeOJJAU37oj5UWU+HF
	 Ek31Bo1heEb8ugZP6JI1eJjsX7UWFFjnoTHHBLoekdjCgaB+q+FdwTg+nc1splkd9hll5
	 HqAu+9GJQ7Ape091TtgVi6Ro12Vz/J+2c/5A+QaGsWUnvjtEeh+elkorIseY5SHqLZzWR
	 A79Eyg71fbWNnjkk+RjgJcfyR1NbG+o8brHdvqoxwf4Y4HGIENrcggoEJ93jcXSc55t+t
	 1G5zLjZVCeNKgg3tTy89dGnZFEQmmUH0RzlvFsA11z9poLg9XwxAOygxHgicf3gre+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=bz6+I5jI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08961606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08961606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=bz6+I5jI
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a9f9473029so5964936b3a.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774611; cv=none;
        d=google.com; s=arc-20260327;
        b=dzinkzP1P4XvZGgwdYkdphaAIiwVtx3qupmC56D0m7NCWvQTKqLCra7KIl1W6vsSpP
         AVq+8ceF14OIFPP47fgQdHAsJzRCpYv7tITfMKYRBX2tHSDU3730dnIQe1EzM0Z+PxON
         p9qqLjWjTL3y4p5EIZ6aOxzG42yioHKohtOrIAh8hWaZe5Kzsi6K1dZ+JfqDuCSC0lUA
         3ZRw5bdzBiqARDH0QA3YtfwwR7gZIPCof/NptUn3zOhhmaGmVcnzx7s33RyH3o7kRMeP
         J0BsPv2iJov8hZHEATE/gw0eGR0w5CuWXx0ijqIxsQHP21Px5BvvlMqFebKP/SLLEimo
         fc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KPXb3DtqJNanqI7IPB3ZYAV4XR+6OEYsAvkDzB1Mb18=;
        fh=qLPdRXME22MGTFcIpniPXJjNNyDPHMz3Gt/SZLdFfhM=;
        b=dQ52nGz5PasOSrlxQ9/Nj8W/0jDMI6fqCtnJ4MrINC+ufTwa1A9uwgdDtgAXYWJFBu
         +YtRj2mDASSxCmrB1FYeNTobB6p+yfKQ4wCaPzC8zckc7KerrG28IG9w9Nlq5g6roFy0
         aNSUXe/+4hWIaSDVfdLWhdxxoWuQgrLSiGHG354tLEvsT+HMAJqFTKUvhSndYj7takGd
         23zJMGbZm5dDDy4zCAq7NjZhk6HxfYtXEhqgPHBkOpHeqeS4YKxGZeg0JU0lUeiuENZq
         oQ8euC8xn7TVrWFtIEuyOhfq2V/AInD+VNx97z3A6R1UWAYdA5V8/4+ETJjDIsZK+9aA
         ZeCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795774611; x=1796379411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KPXb3DtqJNanqI7IPB3ZYAV4XR+6OEYsAvkDzB1Mb18=;
        b=bz6+I5jIn0CXr8Hq35YeWBi7ua7lcqOOo+oFHX6xJ39sNrxxlGLAl/m45iBlrk8g3u
         XnnrvkEBj4Fz/C+03h80ZcCEEYT3Cj6kNrohV7pvv5BTkCE+5zICD31o66P9SLcrylBj
         bZm7xijBxwQqceTZLHKTDsjYXgAFX5v5mXwKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774611; x=1796379411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPXb3DtqJNanqI7IPB3ZYAV4XR+6OEYsAvkDzB1Mb18=;
        b=Bdn9j8KCvmIht8c1PKGp7Oz9iVxv+kwoVk7nHC/CmfcfEiNef6pHH1w2E+F1tn8gvs
         TQxl0QdNFAd2K4w9mLCc0jFBHwbGs/rfvNbm9UiwRpubKkh1Zifww1bG5+eldzCNen6d
         PxUjdhkritwADcrlF4IgBYO87N2yX9o30tm0jb/Swx8ddmBxXhEb++kgWvTiSjh3ahI7
         ivzSaRPHKaPNXpVVdpvf2kep7+3Gd/wBDyviWeSebR/h+1or0zwwPWrotbXFPM/fJOOv
         SUdLX2WWUbydAVvitm/udXHCe8RkmxvMrI078myFwvsCpRbr7HxrfmqL8o3cJeky8kch
         42lw==
X-Forwarded-Encrypted: i=1; AL+hErHM/ueGt7VfA0cd2lWf/7bkZ7ldimaCYJX1gWCIQp0Z9ULDB2e2a+U78iWMCD/ydsJEDIPvU94=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aZInpR+f+1P796QrkJrt1AwXFqS8k0U4VkvYE0EpD02fBPieb
	3mtf3q1GS9L88eAaQ9+y9qxz+qXZkTTqRxLzfFGIPqF4knZwbg65wW7L3uCu0RtgbLKZjhHQN7C
	1AYr657vALKTHm1gv7uYFPlurbwBTTg1v/MIwYs/v
X-Gm-Gg: AZFdTZcnShzEsXyHj0XXq3dZ27t8l6LzdykpuDbseFwcAEeIDR7mnOq1+NefBHgnyfq
	apzZ3zQ1iyQB84P7qPrBY3Z0IhgrfPvUhOTwzl+FUV58cRT55Cav8wrq0snRtZwnvlFRYf3dsMo
	W3xmZ45/YxulBJZwAmHZORnV2hCIxTzsE0d1uNX+I23SkYAGGfPglsND/pVigfREaH+tWvM7Psy
	k7ykOjGilG52WEiD6tS2ViHvsdgWFpcpfoXynesHms1PWYey/3h+l4QWutcgrREoyP1jV2ilF8T
	wcxvHvMPyNoxdQkDrJPO7+nlckJ6Qkwx+BeJIRYzp1DC2H1S7+H93W+jsAswpace9RjCO/DJjcC
	oWU0cleAZNbOd7N7Nc/JAZR/W6F3oQSfA84hB5zX40pi/Tq7kQgpK4doG9U6TQ1P501dkosFV9+
	akVTGB0tP1EC2rKis=
X-Received: by 2002:a05:6a00:f06:b0:88c:e59e:e168 with SMTP id
 d2e1a72fcca58-8c87d519a88mr24868251b3a.52.1795774611339; Fri, 27 Nov 2026
 02:16:51 -0800 (PST)
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
 <CAM0EoMkEjxCo6K9k3MZH0U+3na9soMNE0gouddwOTzUYXcEunA@mail.gmail.com> <398670d0-809d-4cdc-b03f-80bc3b5faa2a@kernel.org>
In-Reply-To: <398670d0-809d-4cdc-b03f-80bc3b5faa2a@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 27 Nov 2026 05:16:38 -0500
X-Gm-Features: Aa3M54pNs2p-3UyS5EML3h7jq6W69RH1lzjUNliy6esxdQanlDs19hCw9dfN8zc
Message-ID: <CAM0EoM=ZtRjDfV1TNNopPyON3szx4aDMn1Yp9oD-dVMVq2QyAg@mail.gmail.com>
Subject: Re: [PATCH net v4 2/3] net/sched: act_gate: refuse schedule entries
 shorter than 10 us
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, netdev@vger.kernel.org, 
	Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-rt-devel@lists.linux.dev, Victor Nogueira <victor@mojatatu.com>, 
	Po Liu <Po.Liu@nxp.com>, stable@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 5:14=E2=80=AFAM Matthieu Baerts <matttbe@kernel.org=
> wrote:
>
> Hi Jamal,
>
> On 24/11/2026 18:11, Jamal Hadi Salim wrote:
> > On Tue, Nov 24, 2026 at 11:58=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu=
.com> wrote:
> >>
> >> On Tue, Nov 24, 2026 at 11:13=E2=80=AFAM Sebastian Andrzej Siewior
> >> <bigeasy@linutronix.de> wrote:
> >>>
> >>> On 2026-11-24 09:12:09 [-0500], Jamal Hadi Salim wrote:
> >>>> This is a followup of commit a51c328df310 ("net: qos: introduce a ga=
te
> >>>> control flow action") as reported by Sashiko.
> >>>>
> >>>> The issue:
> >>>> fill_gate_entry() only rejects an interval of zero, but that interva=
l is
> >>>> the period gate_timer_func() re-arms the hrtimer at, and a few
> >>>> nanoseconds is below the cost of servicing one expiry: the next is d=
ue
> >>>> before the current one finishes, so the action holds a CPU in the ti=
mer
> >>>> softirq for as long as it exists.
> >>>
> >>> The timer is programmed in the past, fires immediately and hogs the
> >>> CPU.
> >>>
> >>>> On a 2-vCPU guest, entries of 1 us and below hold 86% to 90% of a co=
re,
> >>>> 2 us holds 61%, and 3 us holds 22%; from 3.5 us on the cost falls to=
 a
> >>>> few percent and it reaches zero by 100 us.
> >>>>
> >>>> The Fix:
> >>>> Require at least 10 us per entry.  An act_gate schedule is not tied =
to a
> >>>> device, so unlike taprio there is no frame time to derive a bound fr=
om;
> >>>> the bound has to come from the cost of servicing one expiry, with ro=
om
> >>>> for a kernel that services it slower.
> >>>
> >>> The 10us sound sane. With enough debug (say kasan, lockdep, =E2=80=A6=
) this
> >>> might become tight again.
> >>>
> >>
> >> Agreed. Unfortunately, there is no way to derive a "good value" here
> >> (it depends on workload, machine, utilization, etc, etc).
> >> poor choice of wording on my part - should probably have said all of
> >> what i said above for precisiness...
> >
> > And now that you bring this up - this should really have been
> > targetting net-next not net.
> > I dont want to resend (unless sashikos find something sinister) - but
> > Jakub/Paolo consider applying this to net-next instead when the time
> > comes.
>
> I'm sorry to say that, but a new version might be needed: it looks like
> the new tests you added in this series are not passing:
>
>   https://github.com/p4tc-dev/tc-executor/blob/storage/artifacts/928799/1=
-tdc-sh/stdout
>
> It started there:
>
>   https://netdev.bots.linux.dev/branch_deltas/net-next-2026-11-26--21-00.=
html
>
> Or is it due to conflicts with other WIP patches or something missing on
> the CI?
>

sorry I broke it - not sure why our system didnt catch it before
sending. I will send and fix the commit log whining from sashiko.

cheers,
jamal
> pw-bot: cr
>
> Cheers,
> Matt
