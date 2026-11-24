Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515470;
	b=yl5y3jkXKnsTHtEBDBCUdnQZ7ra4vL0kfqj5172MwjnVNNw/NvqCDYFdo5dSh3+FcIt3
	 RkAot3eW1ha6eZEh6GYtF6nQYmeUZpteORtLWsPkReDH0Q8shOrMuAFog4Iiod4ghkVqA
	 UoLspNQdvOCkAZvuoxD2i07QcE0bePvh0XGnwmNBwUZFg6Cv9gFU9Ktsne/4NL6GoYH24
	 MUHJ3Ss5dMp/XrLUYZj3ScNQr93l7kKb4df3qwzcKILswKQvYhDDct2GQ+86ynw4pHU08
	 rDvT+4TTAC7gH6lI3AbS/RE2fzvw8l3jZfLlM0oiP9hxgW+JR6hew0Dcmz8f7gMpiPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
	b=q+6NkbRh/eP2LX09007BBPDe3pJ0PKkYKGX76V4l9M02fG7zrZaE/iX+3sUJj2arYwUB
	 DmyF3UQi+LOPBRFomL7K9ZtD4z+xecRMth2osOGw8xMMl/qwxKN/ChZNnStDZr1K6E5Fk
	 xcsoSChKvtcw99ehNnQyRxjtmNkT/2jnuuppmQgyUAIUBO4Q5dYGWryuAP8c6q0DCmZUE
	 nXaehdgfd5Kqf4RwR/WTvO0I/SAByGE0wD9oMUWxfi7VT9dv0k/KMUZ4DcY6iFJNNu1rC
	 Kh/PSKLJSG5Z7gLWgn9PCvwpkRjvQ+sgV5P8G7Gd3SrVz6gPs3DeqsacfFOOYx3MsAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=boQDOESY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E2606A33E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8E2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=boQDOESY
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1819403a12.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515469; cv=none;
        d=google.com; s=arc-20260327;
        b=lwM9E8+0u3CilLOAlrxgaxjBoTOFsGS+LY1qS72avA91E5wQH203czp8Clg03tKBdl
         hQ2mEJGNdv4x8kJxTW+E7wVUwMZ5+RlNYZ4YsdKpdaOn9FTO6zjSWIkBIHiNq9Ws3qH8
         tpqfg4OcPVswIDUKab82ySWXS7sQzn/SgCEhCwasC0OStnzQtv1C/gdWvUFXzbYaDZFS
         Ten6l/F6BW+pwlE3HhG4jXUWTfYhHqhJCzYP00yfOwEbR9fuZq1o/h7MOpTj1jpS4cg8
         jVxBf4RdNYvSNt/YoQ+cFFm0Gk4f3cRrP9iA0dxHF9GJhGkBZnC8h9awFEGf40VWlysT
         0G3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
        fh=FZ/NlS++YWJua7DJCfSl7NHTHEYx38uu3hdJk2n/x5s=;
        b=a59ZgwoS01TqlGFQ3awM5dvpVV4s49MxkMm+69XFbFc4slJyq5gCG3q73UHSDgeLWH
         wSfHc8/SEUM50psM5Ve8fZa8hidnlGttk/3Kz+pEzvBSA95sfhAvfGNryN6gF8xz6v8g
         T7/88DgICf+eY8mD2hX+krKc6HHSCu7N9ZvyivtjNwM4jHBNZiZdeHgciIIjze45OB4i
         NxIyD6LKPvFp4GmDnKTtqGbRe+RbUyZ5LzuMQJBAtM1HOvyWGv5K7l2W6qNud64Wnc5t
         IA8lt2ugQtgenxKHpNaFiNMTQz52s5znvzwwM0mpJ2fyoaqJnrwvAnaV5p7gQ9eU3L6p
         uN6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795515469; x=1796120269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
        b=boQDOESYfuu+ei6nPbUoODpl/Ek47OYUgvhVk99ETOZyiaz2nZqCLusCouY2MPVsrf
         Lmi4VNPNuXk5gN0d8V16BfTeGNVTHqfHv8lmY2KZWvPzn/MwZzGSASY+bMZQ5SWPoW91
         4pw6s5nM+6RqviziclgIXLw7PFOAQx7tuzf3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515469; x=1796120269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDR7cjV4IRioJgp9xWXyZAeSRy7CXHNvvQiffZPND/Q=;
        b=V2XbGF43Ix0L+ozzCpZD2STh3+jIrGVMJRdGcdFoWjC4e4qKr7AuFryLnLdW9EQ7xL
         AEgJ09dBrfkw84FsjolyHlQotlSBvdFoYVaoeG4W0k2PPRVi5sThYhcaFR7pMT3c9q/V
         qMQ+ld9UkNn7NQyYL2m0sHKDcLOCG3j1+RPMbGcDqaDUgbyXmLUwrTVGylXfUy54+RVJ
         72Cn1UQXASI7Fn+ZOCJyJZu7d2aHocQdW0SWg+H4zVD3PIWf8XeOpkiEzNElXVbGeBVi
         6COc2vepUIdyDtkxDPoBmSpRHqsGFIK9nm7MVYZaVcS79Wp4ruZIONerz3KejpQl67Sm
         vnhA==
X-Forwarded-Encrypted: i=1; AL+hErHRkaMGbMvcV1RcLXWuVe2/w2krO1DCMwPaM7gMLgRc/LrTBC5bgU5q3As3+KMVnPTjfMGfIjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cpzha7QADEwP6FclZJP4PvnXE7FmdZsPJAshzJZSRMvVVOQVA
	BhcsXFigQEvhlCDBKBSjJG6GyGw0YvCPad05RWo78l2hGeZVHGqp7nI80lilw8u6epLulxB8FLl
	ej6mQvcvjtOO7SPH15b/YBYD8U2twHIWzNVQG0Xtx
X-Gm-Gg: AZFdTZcEkGWpNmVnwp/U/Xk9qgP+4IWYWkFh9ug0YlvCEfWOrgPnHKaXN69s1L0/2tk
	oU3QWP3v3Z7WNlSiMuYrUznjyG2ufHsV3cvtHiYF9mwW6wRxbWdcLz6xDQr2QMruhWQH1s8Yjec
	L9d6+DBxvXEmRb13v39xsqEBU/VQfdvQP4lzhoDlk0mnrIjrNLUe9FcFD9FSOcqYRDlZ6wC/hqN
	h9CaNNojRfF80XB2kVQElqE5f2OwrVUFPz+pcVcYB30WoPdZBPDWQdV2q7Y05nHsgy//0LweyBV
	3SHv2zqf4cVAmspfH/nW4Pndbk1QQ4j40JamuITAhIC394uv1F7kcxKRCZg7WTq+xxY0+tsvBBc
	Shk341sS2nadaDeAZYqDYO+2XmQhyod6TQQXPUjLkQCJv1QPnkJDspyJkxazvls506ZceN1zYaI
	KuiMKyO69ZK/E0L/ZZsscN
X-Received: by 2002:a05:6a21:4a8c:b0:3f2:acd9:132e with SMTP id
 adf61e73a8af0-4014db57e24mr12442219637.61.1795515469040; Tue, 24 Nov 2026
 02:17:49 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6b051681.58b41460.7037.0590.GAE@google.com> <DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com>
 <CAM0EoMnVa=xGD3uiZKuzMfFL6oZNd=Umb0U7+_QUrTK7Ej-BYg@mail.gmail.com>
In-Reply-To: <CAM0EoMnVa=xGD3uiZKuzMfFL6oZNd=Umb0U7+_QUrTK7Ej-BYg@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 05:17:38 -0500
X-Gm-Features: Aa3M54oAhgDu4a3QN-cUvm8ntTPorq0ToGdV6xzEFC1H8I-IekXAnPLMj4fFDqA
Message-ID: <CAM0EoMn=ZghG5KFu2Nc=W-=KjDv=epspFHZVDY4ww5a9GBUaHQ@mail.gmail.com>
Subject: Re: net: act_gate bug. was: [syzbot] [tomoyo?] [mm?] INFO: rcu
 detected stall in security_file_ioctl (9)
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: syzbot <syzbot+b6f8640465bdf47ca708@syzkaller.appspotmail.com>, 
	akpm@linux-foundation.org, andrii@kernel.org, bpf@vger.kernel.org, 
	brauner@kernel.org, daniel@iogearbox.net, jack@suse.cz, jmorris@namei.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, paul@paul-moore.com, 
	penguin-kernel@i-love.sakura.ne.jp, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com, takedakn@nttdata.co.jp, 
	tomoyo-users_en@lists.sourceforge.net, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:03=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Tue, Nov 24, 2026 at 1:00=E2=80=AFAM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Mon, Nov 23, 2026 at 08:45 PM syzbot <syzbot+b6f8640465bdf47ca708@sy=
zkaller.appspotmail.com> wrote:
> > > rcu:           hardirqs   softirqs   csw/system
> > > rcu:   number:     5264          0            0
> > > rcu:  cputime:      138      52351           25   =3D=3D> 52490(ms)
> >
> > It's not tomoyo, mm or bpf. Looks like act_gate.
> > Zero new softirqs in 52 sec, so one hrtimer_run_softirq() doesn't retur=
n.
> >
> > > RBP: ffff88807ed35538 R08: ffffffff91be1bbf R09: 1ffffffff237c377
> > > R10: dffffc0000000000 R11: fffffbfff237c378 R12: ffff8880b8228600
> > > R13: ffffffff89fd0480 R14: ffff8880b8228600 R15: 1ffff1101704514a
> >
> > The registers with lockdep struct sizes:
> >
> >   reg       value             points to
> >   --------  ----------------  --------------------------------------
> >   R14       ffff8880b8228600  cpu_base
> >   R15 << 3  ffff8880b8228a50  clock_base[HRTIMER_BASE_TAI_SOFT].seq
> >   RBP       ffff88807ed35538  kmalloc-512 + 0x138, tcf_gate->hitimer
> >
> > act_gate has the only soft hrtimer that can be on CLOCK_TAI.
> > bpf_timer_init() rejects that clock.
> >
> > TCA_GATE_CYCLE_TIME is an unchecked u64. In gate_timer_func():
> >
> >   n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> >   close_time =3D ktime_add_ns(base, (n + 1) * cycle);
> >
> > With base =3D 0 and cycle =3D U64_MAX, n is 0 and close_time is -1.
> > The timer restarts in the past and __hrtimer_run_queues() runs it again=
.
> > It's there since
> > commit a51c328df310 ("net: qos: introduce a gate control flow action").
> >
> > Jamal,
> > taprio's INT_MAX limit doesn't fit. tdc uses cycle-time of 600 sec.
> > The diff saturates the sum instead.
>
> Looks familiar - i will take a look.

Ok, found an abandoned related thread in my list:
https://lore.kernel.org/netdev/tencent_FAEDEECDD478AE6DFC2DE96D389440E96A0A=
@qq.com/
I will take it from here; it looks like your patch is still needed and
requires a fixup to the abandoned one as well. I need to reproduce
this first.

cheers,
jamal

> cheers,
> jamal
> > Here is a potential fix:
> >
> > diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
> > index 711cf24..5422d60 100644
> > --- a/net/sched/act_gate.c
> > +++ b/net/sched/act_gate.c
> > @@ -45,8 +45,9 @@ static void gate_get_start_time(struct tcf_gate *gact=
,
> >                                 const struct tcf_gate_params *param,
> >                                 ktime_t *start)
> >  {
> > -       ktime_t now, base, cycle;
> > -       u64 n;
> > +       u64 cycle =3D param->tcfg_cycletime;
> > +       ktime_t now, base;
> > +       u64 rem;
> >
> >         base =3D ns_to_ktime(param->tcfg_basetime);
> >         now =3D gate_get_time(gact);
> > @@ -56,10 +57,9 @@ static void gate_get_start_time(struct tcf_gate *gac=
t,
> >                 return;
> >         }
> >
> > -       cycle =3D param->tcfg_cycletime;
> > -
> > -       n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> > -       *start =3D ktime_add_ns(base, (n + 1) * cycle);
> > +       /* cycle is an unchecked u64, the sum must not wrap into the pa=
st */
> > +       div64_u64_rem(ktime_sub(now, base), cycle, &rem);
> > +       *start =3D ktime_add_safe(now, cycle - rem);
> >  }
> >
> >  static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
> > @@ -107,15 +107,8 @@ static enum hrtimer_restart gate_timer_func(struct=
 hrtimer *timer)
> >
> >         now =3D gate_get_time(gact);
> >
> > -       if (ktime_after(now, close_time)) {
> > -               ktime_t cycle, base;
> > -               u64 n;
> > -
> > -               cycle =3D p->tcfg_cycletime;
> > -               base =3D ns_to_ktime(p->tcfg_basetime);
> > -               n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> > -               close_time =3D ktime_add_ns(base, (n + 1) * cycle);
> > -       }
> > +       if (ktime_after(now, close_time))
> > +               gate_get_start_time(gact, p, &close_time);
> >
> >         gact->next_entry =3D next;
> >
