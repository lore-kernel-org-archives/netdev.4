Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795514621;
	b=irUsA7At7zr7Cl6oPAK0RMb/ADZR2dZSq6LA7DgrEsiLrc05Gs7fSIrDlUIQs38lIbbi
	 7dVnPrmhhP0agWXNAyJ65nckevFvDPi2sJhh0WyXvcgEYX46QggK09i7+agXN2k3K6/nk
	 93yBJG+yfVei4sI+7BRI4CBoh3BmHuBJRtd5HuShhXjpyxUxvafkT1qEjX84z8xSHnVAM
	 yTxh7Lyz/HBhTb2pEVcEqqNrxGgPRk+r2Sk/GNaLWt+Uxyp+XSUq0dOdNWITKRGhUYmdm
	 7s+eZPIe5ibkGHLSy8swbCWuIcXRxrJhFtJA6Oq4D31QpdjS8Bso12bfx5LTPCi0rdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
	b=t+Mz2CdrgdjkoM0+GlIvb+6FHpByRDHPa6V7CZgtOmydiv4VK+jY7EMPWiyzjs4Qkdvw
	 jB70AYWqH9spIaIPPcJyX8oaecSJfRcz0OHwlirvMPtzhSSQ7RMfEEk3DCPRgYwGLHpQ5
	 fe+1oTXu/D+8SvkSbX5Hi9YGuB6a4X4i+s0hY7zWWCJ86DsukpwYZ4pigcsTv9DGRL5W8
	 A5pb7uD52MikQ4A7aCrlyZAyXKXf+xj9R0MlSM4MzGTMlBDz10umIvzFOiAR2mE2R+jZz
	 VF+oce0/Sy73aeLTaqQqWUgNGz3ZWHmZWdRSemFxsAhpoG9tF9tt69v+2Z20BGfB7IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VmWAs86N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01F5606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E01F5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VmWAs86N
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a07078200fso2167559b3a.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795514620; cv=none;
        d=google.com; s=arc-20260327;
        b=cf908cJTNmdgZ/YYfyNijXHTm2QqeR8lJ0q89EsZPVAyFx9tBfUH98Ip8w4gr8Fbuy
         QYUzBrEn26BgHIHkUSFjdmm+r3CJUXGwWv1usmcM8v8gQ7iYJNl8Jv01ZwxOlhenSmbM
         YPu3oIVk6Z1z66EtG+dZGAbKQQarTKyYfIzkOb+kfSL9ZjE6C/tkCZQgSPRVLAXM0Q58
         lwMsoUXtk/5sLKlwIaIApMVbaV6pLNMQ5vmZRrC+XSeoyqHJmlerCIB51+GcSuuDmakd
         yLzfl9/OZgvuklhIinvhA0M66B3sR+hE7Fc8IfvpgrYVsrUVHySmXsRwHppLlWMyL9wX
         bCJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
        fh=SFrKRQP+HRDSRmJEXihgh/NXoC+4gUlunPXU5aEAkH8=;
        b=rH3UCLysX35jNRvwBRefgnE7N3TxrBRiAtNJK/9rAJrWpIRw16VniSvwjM8nNhwWLf
         t6QSaw4O0Q+PIztQIMcTAMmUmeI9TOXLs29Dn0k1RdedLVtglVtROiHQ/9DUmm0nMy5l
         3muUV9zjkbVEcRZ/tx0om7RQTtcD7XISRnbryrYhzVHmsa+bkgq6+PGmjUAAdJKXllZs
         2pvBwfV/cw8HmKOkoc6yAxUEr7QbfHqGVxC++rLB7WFzhJXzt+eV2Lpk5DJxx4fdssW2
         dgD+irzkMJ0yTyUdU5gYGohaBQUwIDUmD/VrheUOnJC/ohKsxRpVHR6+fQ/shZyRl740
         xmSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795514620; x=1796119420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
        b=VmWAs86Nz7sib60O4izbmOD6cZh1oJHcY4TIr9SaP6pD5C0G2T6As0XqGlZXCid52l
         D7UokUSGtJok+76yw43RikasNHy7al4rTLqNt+q+izWEJlO4nwef7uYHHiWgKe9yWWTM
         I5j2coA6k1F5B5uggw7O4grg7Mi+N5CcJvy20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514620; x=1796119420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGN5g9PtUGCG+wcdSVJumY3ZUtFUe8Es3+mlikmGYwY=;
        b=v+5m9tWk4PJX/qgtG42f7HcyX6YX+BOzKsPSED9FxYTARD2pq9/yO92eQy2cD9Yfno
         bBqtMqLLHHsKt2Fn9bl4NZzsiTF2rpMZCosqcSyzUZcby16/1cfvzeWfA9ebLDDt8Ggk
         cZ4vtVzqt8dHN0+oWSPyegkzyu60eBXLt6bAj3uLjuOAJ9Gsa6lPvXMe9YgSfvXLqxY2
         Me83wODCOpu5s3mRtGlfzxNSTjpKFD9bWZQA0WyDd6zLqSZrkm8aK79/uwC/qTWqEkJp
         U4eC/2TDT+gyKCZgSIt8MBYEAh/+Q9+rVHkUCoFzAvV6Sit65jW0PPTUfc+sHy871e8D
         N1mA==
X-Forwarded-Encrypted: i=1; AL+hErHdoKuw4cVdtdtypv7rVHQzTYNbWJ6xUDzPXuHhlfnMYrUfuMzcGvNxzG1tlKeDIEMgUwQ37ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dB872+XHSGHERw4mXHSalTHCtSea27X1qQIyPRV5Lg0mOD9an
	0/j6pqww4dIVab9WhcV6pippWlDV3JJjG1QON5cmMXyRWU8Z4MB7sCFEGFlm7y/QRefTY/DzXRW
	5hGyHyxUWOu9gzRXeN/i82JH2Hd5pe+uaC7ZzzMdw
X-Gm-Gg: AZFdTZcWSsMxuPikYheZ0HBH+WL9WuANJPTJU9dywcn5GcgdFYKi6gUFFMVEPoAdRRW
	WYT9sAZXOwlmVKHRQJLHbltOoR60rbbpVRgIQ1DzBj/RWxIrWg+y+VIRLf7posvuveUDVGITNly
	KbAEkZrtrxb3iC72BEyy7s7FXKOXR/Zkun5BBbhuDgksUAJ3g1n2WWY0CX6ENugVcY2rdpHtx3p
	cQJBjX8KkyYPyHuFICv7g/4e3C0e0duof/dVzuiIWXWoqf83NR6SAXUtF4MTN/plHhhXDcU31eM
	UA5fBd7BfZtPb3RQfKAFkFBfbFSGVBezy0zarjdygzhaNMMirNKl4eyxXcpSqKLWfRm3+aGHREg
	dHFfQalkmlo2GU0tpZ6Rbsl7xPFNwjT3wknamY1TBa1WCXTYUS92fjUS/opBHuIvo+v3Q3cP8Gp
	73FUhtiTrKWXiuDBRyGYQP
X-Received: by 2002:a05:6a00:3c84:b0:89e:ba55:119a with SMTP id
 d2e1a72fcca58-8c87d123bd5mr13499490b3a.47.1795514620227; Tue, 24 Nov 2026
 02:03:40 -0800 (PST)
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
In-Reply-To: <DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 05:03:29 -0500
X-Gm-Features: Aa3M54qvcfjcRlRGJK01N9tkR68vSDtEhX-HABSVQSN3K_q0am-4DoB8x5iA1ls
Message-ID: <CAM0EoMnVa=xGD3uiZKuzMfFL6oZNd=Umb0U7+_QUrTK7Ej-BYg@mail.gmail.com>
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

On Tue, Nov 24, 2026 at 1:00=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Nov 23, 2026 at 08:45 PM syzbot <syzbot+b6f8640465bdf47ca708@syzk=
aller.appspotmail.com> wrote:
> > rcu:           hardirqs   softirqs   csw/system
> > rcu:   number:     5264          0            0
> > rcu:  cputime:      138      52351           25   =3D=3D> 52490(ms)
>
> It's not tomoyo, mm or bpf. Looks like act_gate.
> Zero new softirqs in 52 sec, so one hrtimer_run_softirq() doesn't return.
>
> > RBP: ffff88807ed35538 R08: ffffffff91be1bbf R09: 1ffffffff237c377
> > R10: dffffc0000000000 R11: fffffbfff237c378 R12: ffff8880b8228600
> > R13: ffffffff89fd0480 R14: ffff8880b8228600 R15: 1ffff1101704514a
>
> The registers with lockdep struct sizes:
>
>   reg       value             points to
>   --------  ----------------  --------------------------------------
>   R14       ffff8880b8228600  cpu_base
>   R15 << 3  ffff8880b8228a50  clock_base[HRTIMER_BASE_TAI_SOFT].seq
>   RBP       ffff88807ed35538  kmalloc-512 + 0x138, tcf_gate->hitimer
>
> act_gate has the only soft hrtimer that can be on CLOCK_TAI.
> bpf_timer_init() rejects that clock.
>
> TCA_GATE_CYCLE_TIME is an unchecked u64. In gate_timer_func():
>
>   n =3D div64_u64(ktime_sub_ns(now, base), cycle);
>   close_time =3D ktime_add_ns(base, (n + 1) * cycle);
>
> With base =3D 0 and cycle =3D U64_MAX, n is 0 and close_time is -1.
> The timer restarts in the past and __hrtimer_run_queues() runs it again.
> It's there since
> commit a51c328df310 ("net: qos: introduce a gate control flow action").
>
> Jamal,
> taprio's INT_MAX limit doesn't fit. tdc uses cycle-time of 600 sec.
> The diff saturates the sum instead.

Looks familiar - i will take a look.

cheers,
jamal
> Here is a potential fix:
>
> diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
> index 711cf24..5422d60 100644
> --- a/net/sched/act_gate.c
> +++ b/net/sched/act_gate.c
> @@ -45,8 +45,9 @@ static void gate_get_start_time(struct tcf_gate *gact,
>                                 const struct tcf_gate_params *param,
>                                 ktime_t *start)
>  {
> -       ktime_t now, base, cycle;
> -       u64 n;
> +       u64 cycle =3D param->tcfg_cycletime;
> +       ktime_t now, base;
> +       u64 rem;
>
>         base =3D ns_to_ktime(param->tcfg_basetime);
>         now =3D gate_get_time(gact);
> @@ -56,10 +57,9 @@ static void gate_get_start_time(struct tcf_gate *gact,
>                 return;
>         }
>
> -       cycle =3D param->tcfg_cycletime;
> -
> -       n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> -       *start =3D ktime_add_ns(base, (n + 1) * cycle);
> +       /* cycle is an unchecked u64, the sum must not wrap into the past=
 */
> +       div64_u64_rem(ktime_sub(now, base), cycle, &rem);
> +       *start =3D ktime_add_safe(now, cycle - rem);
>  }
>
>  static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
> @@ -107,15 +107,8 @@ static enum hrtimer_restart gate_timer_func(struct h=
rtimer *timer)
>
>         now =3D gate_get_time(gact);
>
> -       if (ktime_after(now, close_time)) {
> -               ktime_t cycle, base;
> -               u64 n;
> -
> -               cycle =3D p->tcfg_cycletime;
> -               base =3D ns_to_ktime(p->tcfg_basetime);
> -               n =3D div64_u64(ktime_sub_ns(now, base), cycle);
> -               close_time =3D ktime_add_ns(base, (n + 1) * cycle);
> -       }
> +       if (ktime_after(now, close_time))
> +               gate_get_start_time(gact, p, &close_time);
>
>         gact->next_entry =3D next;
>
