Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779579;
	b=iBOXe/p6oV5y8+E954s1ackKvXunaYV3z827ZoHtpLas3WnEvEQz5H4gUtLFLbm6eE6R
	 r4qjGe+mt0Uc6p6BJcCx25aHoP/E5XgNtJvM1EHXplVvyWkALvR2tiQ+/B+YLkQXO5plv
	 fOpAtvw83KzIC4kXziPnNvDmWFhzs5sed/R4gxqnf1pL2Cm823UfxNwNyYyBPQ/Fj1Laa
	 aXm8eSSNOqLjlDdt8fwdGbwDvxEI1CVwLpvvUZDHHw97oyJf2dhF93IegMqxwLAxPPKQm
	 mFNgPJ9u4nA1BA3iXcKrZeTHcbRpRFqgd3eW706TGtXmZ72pCaEWBD5GJ7uI1l9uvPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=AdWs/iv4rTbBIAzg2NglTiD85oDIsy90LsJ1bofEwBc=;
	b=fabLJTSccdjygENKo4y3xHRiOX7bllRJFIEqnRRQci9BmEpdHKR4KfsL1rzEb40sYxMU
	 LscNzs1PUdzdiMuEtIQhol1PlsjSbPYojbChlYb5x9htj1Z86xCBnqr3oje4pJdAfly0/
	 YWKL/+903dheyU7k7dYeZnR9dPExcm/xJqzwOs4+/C+tPctnyRIZltUoKdH7gKtGpMbAH
	 4XGq9spobhVCPQKRPnkJTyu8c5hVoSx9fLcLROXs69tWKM4SWESuFLwgvnBEY6KHhPpBt
	 uyxOHWebMtQ8li0AN8dpbKLybHnU3MWZ1zeljOvNGEtcrMdugOOLZ/j9z9f8XaeFUZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b="Glr/8O1/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2739606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2739606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Glr/8O1/
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a594d313a3so5234127b3a.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:39:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795779578; cv=none;
        d=google.com; s=arc-20260327;
        b=qzc3NSKEMCSSyWV9wr8en/aN8mgg75KiZLVJqiDVdR74AqmzC9A3k9QlHBRdWX2Qo5
         r2e8vISdNQcdOxjicJG5yAKPO5yFn1+C2oAasA3PpX8prlzArUHrs1mMeuq5WDg+Q0a6
         P8MjG7G3gegDaj8gSB6Q3IZvWEigE70fQbAFj0ysLLyZWGDHqTxkGGaSjlCtulMQ5gkc
         XcgU9iKrLoswMzGFB94xCNcYZdnHUCWHyuYcPuX+YJXvrpJhOScoHTYxoB8PrqQEAIS2
         GmvQtHJlUad8jmU4sBj6X6PfSSczN7coqLD12BPfrExnpbZJXppvf2b0McCXEVqyuMJ/
         4ehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdWs/iv4rTbBIAzg2NglTiD85oDIsy90LsJ1bofEwBc=;
        fh=nMNRJdrwQ0vFIxtqsS3Qa+3MNm2vdzWJOicd177/JfY=;
        b=a9e/vHWhg30CWj//rsTkci3eoY7eQtGXFKNzuxDwoHytUQeteMISWQAdkvhghH/KGd
         vhSHbj+N1KP0ALXjYTdcfqJiE73d7YUUk6/fbX9KgagQ39+LfZgX1nh+RlNOBD4UCuuF
         b5herpLFkQhxsRDdA4Rvq+nzW58h7D5w+Ao150ADH/uf3h593wVVyNW9IX4IfFJaTfr8
         ae5bkZrmVpCefaswRtc1pVuwMFTKNxp0zopHeC/N/Q2SzzlSmcB1VX3oxDBaAk7otUWI
         pgUSnKqLE/dvoQXa5TDRduYA5L+scny3I94mGMsonoClanV5WjZwV3Hv/vZGkLq+dQ/D
         2k9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779578; x=1796384378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AdWs/iv4rTbBIAzg2NglTiD85oDIsy90LsJ1bofEwBc=;
        b=Glr/8O1/V/bqspFvgDtohP2DYqDQQ9Se7cSmTz0EnulFTv7Kpflf+iupGvoSRIzuML
         1Q/R66g+PNqFpu9amcv0Ya0YQYSsdZguIekQtC91UtmEU05PGUww2PsVzyLMzUBzq61P
         3J5yoRZp0BKeMTytDu9fhO1Sqn5KnJQmG1E04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779578; x=1796384378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdWs/iv4rTbBIAzg2NglTiD85oDIsy90LsJ1bofEwBc=;
        b=j0zeBZBV5+RcbsZ2tXp7tx5yW5exR/QU6UdxxeMw9Z4Zwm3TEkGzd3epEEMmdKGAmY
         0FZiQkuwlXIROm+1J2sbUNPL685vyEaoqQXxzz2llv0SKQSUX1Jnjm700cc2y+6BiPlT
         +OfQrZJMxtVsF2iI5lZP6nfOArnH0fDsVlN4gSY0awOSQPRBhv5s56cRm+Eo/s5yjqeI
         +tw2uAyUDGGTx82jUrmTBs0KgsKWkwFC5oRnFIFR5EFcQQMPqe3n+Qn1YjlAQGHxOQo6
         N+ueGw6XETa0HJNp92i7GhOyeb066ANffsHjxp21QrvrIjfHyTFCGwpTlwvgYgjZddZF
         teWQ==
X-Gm-Message-State: APuU4Z9pLi11NYgh+VKofKUFKw4Rh/u26hHtp+kzcOLqE1a6agsL+2tO
	IFmcUNHW7OjQ+KDrRLmrH//8ck/A9diKLv6SPIlJq0BqgHUoo/pGJ1jZ+1ys+K6lPByQw2deYNA
	NUfVgq8grLU05aNT83ScxHxFHtMduOICrGHrDp7RB
X-Gm-Gg: AZFdTZeVkTuJU9ZONycMTbDLewz/aTE5hCQ49QgsriYp5zmtxGPutNU1obQHDh0ZrSV
	dS0T2LcsSz5zU/5XSXvlcU7TiidvMDtEAPBOedmE0MQXiFth8mk9rOcEDoY2ib6heQGS/ZCyXhh
	AXk1g/MvWffKbEbbJ8Gk6lEr44yCAplFVEwDv8JAb2AxsQ7HW8MkfuJeal6Qec+EgEKD5aCSGLl
	1rHO7GYZyBumH+kQy/OS6xa0qW6b/jQ+e/t1KhtpH18lSM6EXpa39S98N6bQy1Q7+6LZazsvPfR
	W98VPK+1jPO0SBWHuxTbWLPAoAqsIQX4ghbmSSLfClTvGJrsHi6PWAjnTuDEcRd8VR3N3jHwHMP
	VqnFy1BidTFjjmlPyBCsPVueThk71hPken5Z2riRsPC/oiCoHNWkXxkIbf2Q5t0daOem7X0yWzl
	Mn2reTi0WyOVn8sns=
X-Received: by 2002:a05:6300:6bdc:b0:3e2:86b6:9beb with SMTP id
 adf61e73a8af0-4014e06961emr20469307637.74.1795779577953; Fri, 27 Nov 2026
 03:39:37 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ACT-WEXM.v4.r0.20261124074514-2@mojatatu.com> <179561611250.3135.13753422220190315891@kernel.org>
In-Reply-To: <179561611250.3135.13753422220190315891@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 27 Nov 2026 06:39:26 -0500
X-Gm-Features: Aa3M54qLSWCwzvEnJUnWP_V7LLsQQNti1UrS0jun0fwPhWmWJ5KYQSbFEZB8plA
Message-ID: <CAM0EoMmz_J-KbReOYjJPg1TqzOVk2ydQ1rfjuudnP4c+csQWRQ@mail.gmail.com>
Subject: Re: [PATCH net v4 2/3] net/sched: act_gate: refuse schedule entries
 shorter than 10 us
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, willemb@google.com, 
	horms@kernel.org, alexei.starovoitov@gmail.com, victor@mojatatu.com, 
	Po.Liu@nxp.com, stable@vger.kernel.org, 
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com, shawnq1@163.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 9:15=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The 10 us floor only limits a single gate action.

This is an "extra" feature you are asking for - and since you work in
"no deed goes unpunished" I will not be adding this change because a)
it is intrusive and b) it is a hardening issue
So the fix to this is going net-next once this series lands.


> - [Medium] The commit message says the bug needs 'CAP_NET_ADMIN in the

This is what Alexei brought up; i will fix.
Resending because the series broke tdc.

pw-bot: cr

cheers,
jamal
>   initial user namespace (netlink_capable() checks init_user_ns, so a=E2=
=80=A6
> - [Medium] The commit message says 'An act_gate schedule is not tied to a
>   device, so unlike taprio there is no frame time to derive a bound=E2=80=
=A6
> - [Low] entry_policy still declares TCA_GATE_ENTRY_INTERVAL as a plain `{
>   .type =3D NLA_U32 }`, while fill_gate_entry() enforces the new 10000 ns=
=E2=80=A6
> - [Low] The 'Some context' paragraph says 'The request that reproduces
>   the cycle-time stall also carries a 1 ns entry interval'.
>
> --
>
> net/sched: act_gate: refuse schedule entries shorter than 10 us
>
> This commit changes fill_gate_entry() so that act_gate schedule entries
> must be at least 10 us long (GATE_MIN_INTERVAL_NSEC). Before, only a zero
> interval was refused. The goal is to stop the soft hrtimer that
> gate_timer_func() re-arms from keeping a CPU busy in the timer softirq.
>
> Closes: https://sashiko.dev/#/patchset/tencent_4ED9536B0375C96183B2244CF7=
709768C605@qq.com
>
> > Some context:
> > The request that reproduces the cycle-time stall also carries a 1 ns
> > entry interval.  With the cycle time derived from the entries, that alo=
ne
> > sets a 1 ns timer period: the report covers both defects.
>
> [Severity: Low]
> Which request does this paragraph mean?
>
> The earlier commit in this series, "net/sched: act_gate: bound the cycle
> time and start time arithmetic", documents a cycle-time reproducer that
> uses TCA_GATE_BASE_TIME =3D 1, TCA_GATE_CYCLE_TIME =3D 0xffffffffffffffff=
 and
> "one schedule entry of 1000000 ns". That is 1 ms, not 1 ns.
>
> The second sentence is accurate. gate_timer_func() advances
> current_close_time by next->interval, so a single 1 ns entry does set a
> 1 ns period.
>
> If this refers to a different reproducer, such as the Sashiko one, could
> the message name it? As written, the two commits disagree about which
> input triggers which defect.
>
> > Conditions to recreate the bug:
> > CONFIG_NET_ACT_GATE=3Dy, and CAP_NET_ADMIN in the initial user namespac=
e
> > (netlink_capable() checks init_user_ns, so a user namespace of its own
> > does not help), in a new network namespace:
>
> [Severity: Medium]
> Is this accurate for every way a gate action can be created?
>
> The init_user_ns check is only in the standalone RTM_NEWACTION path:
>
> net/sched/act_api.c:tc_ctl_action() {
>     ...
>         if ((n->nlmsg_type !=3D RTM_GETACTION) &&
>             !netlink_capable(skb, CAP_NET_ADMIN))
>                 return -EPERM;
>     ...
> }
>
> A gate action can also be created inline with a classifier, for example:
>
>   tc filter add dev lo ingress matchall action gate sched-entry close 1
>
> That goes through:
>
>   RTM_NEWTFILTER
>     tc_new_tfilter()
>       tcf_exts_validate_ex()
>         tcf_action_init()
>           tcf_gate_init()
>
> The only capability check on that path is relative to the netns:
>
> net/core/rtnetlink.c:rtnetlink_rcv_msg() {
>     ...
>         if (kind !=3D RTNL_KIND_GET && !netlink_net_capable(skb, CAP_NET_=
ADMIN))
>                 return -EPERM;
>     ...
> }
>
> So it looks like an unprivileged user who runs unshare -Urn can set up
> the 1 ns stall on kernels without this patch.
>
> With Cc: stable on this patch, could the reachability description be
> corrected? Backport and security triage will rely on it.
>
> > diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
> > index 4835f65439011..797562dbde693 100644
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
> > +#define GATE_MIN_INTERVAL_NSEC       10000U
>
> [Severity: High]
> Does a per-entry floor bound the total timer softirq load on a CPU?
>
> Each gate action owns a soft hrtimer (HRTIMER_MODE_ABS_SOFT). That timer
> re-arms itself on every expiry with no exit condition:
>
> net/sched/act_gate.c:gate_timer_func() {
>     ...
>         gact->current_close_time =3D ktime_add_safe(gact->current_close_t=
ime,
>                                                   next->interval);
>     ...
>         hrtimer_set_expires(&gact->hitimer, close_time);
>
>         spin_unlock(&gact->tcf_lock);
>
>         return HRTIMER_RESTART;
> }
>
> Nothing limits how many gate actions a netns can have. tcf_gate_init()
> calls tcf_idr_check_alloc() with a u32 index, and every filter with an
> inline action gate creates a new instance and starts a new timer.
>
> The commit message puts one expiry at a few hundred ns. At that cost,
> about 33 actions with a single 10000 ns entry each, created from a task
> pinned to one CPU, would keep that CPU fully busy in the timer softirq.
>
> On the debug or PREEMPT_RT kernels the message mentions, where an expiry
> costs a few us, 3 to 5 actions would be enough.
>
> Wouldn't that bring back the "holds a CPU in the timer softirq for as
> long as it exists" condition this patch is meant to remove? Fully fixing
> it seems to need a limit on the combined load, for example a per-netns
> cap on active gate timers or on their total expiry rate.
>
> [ ... ]
>
> > @@ -199,8 +204,10 @@ static int fill_gate_entry(struct nlattr **tb, str=
uct tcfg_gate_entry *entry,
> >       if (tb[TCA_GATE_ENTRY_INTERVAL])
> >               interval =3D nla_get_u32(tb[TCA_GATE_ENTRY_INTERVAL]);
> >
> > -     if (interval =3D=3D 0) {
> > -             NL_SET_ERR_MSG(extack, "Invalid interval for schedule ent=
ry");
> > +     if (interval < GATE_MIN_INTERVAL_NSEC) {
> > +             NL_SET_ERR_MSG_FMT(extack,
> > +                                "Entry interval must be at least %u ns=
",
> > +                                GATE_MIN_INTERVAL_NSEC);
> >               return -EINVAL;
> >       }
>
> [Severity: Medium]
> The commit message says:
>
>   An act_gate schedule is not tied to a device, so unlike taprio there is
>   no frame time to derive a bound from
>
> Does that hold for offloaded gate actions? act_gate is offloaded as
> FLOW_ACTION_GATE to 802.1Qci PSFP hardware in sja1105, felix_vsc9959,
> ocelot_flower, enetc and sparx5.
>
> fill_gate_entry() runs for every gate action before the offload path
> does, including flower skip_sw rules. sja1105 accepts much finer
> schedules than 10 us:
>
> drivers/net/dsa/sja1105/sja1105_vl.c:sja1105_vl_gate() {
>     ...
>                 div_s64_rem(entries[i].interval,
>                             sja1105_delta_to_ns(1), &rem);
>                 if (rem) {
>                         NL_SET_ERR_MSG_MOD(extack,
>                                            "Interval must be multiple of =
200 ns");
>                         rc =3D -ERANGE;
>                         goto out;
>                 }
>
>                 if (!entries[i].interval) {
>                         NL_SET_ERR_MSG_MOD(extack,
>                                            "Interval cannot be zero");
>     ...
> }
>
> Schedules such as "sched-entry OPEN 5000 -1 -1 sched-entry CLOSE 5000
> -1 -1" used to install on sja1105. They now fail with -EINVAL and "Entry
> interval must be at least 10000 ns". The driver's zero-interval check als=
o
> becomes unreachable.
>
> The software hrtimer still runs for offloaded actions, so the CPU cost
> argument may still justify the floor. Could the commit message say that
> this rejects schedules that offload hardware used to accept? With
> Cc: stable, the new limit would also reach deployed TSN setups.
>
> [Severity: Low]
> This isn't a bug, but could the minimum go in the policy instead of being
> open-coded? entry_policy still declares the interval as a plain u32:
>
>         [TCA_GATE_ENTRY_INTERVAL]       =3D { .type =3D NLA_U32 },
>
> With NLA_POLICY_MIN(NLA_U32, GATE_MIN_INTERVAL_NSEC), nla_parse_nested()
> would report the bad attribute in extack, and the policy would advertise
> the correct range.
>
> Also, when TCA_GATE_ENTRY_INTERVAL is missing, interval stays 0 and the
> user is told the interval must be at least 10000 ns, even though no
> interval was sent. Would NL_SET_ERR_ATTR_MISS describe that case better?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/ACT-WEXM.v4.r0.20261124074514%40mojatatu.com
