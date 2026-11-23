Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458358;
	b=cXujL2SfccLrhs0wkiUa2LH2MlhZ0UKqNYdS/ZykHkIGhVHgNfvdFAtl0geP4MJvyxht
	 vz5UM+UhdmTvFhr6mlxD2LLE6FHptuSLJotprT7XxOkFWU1lVR25oEJ36rtIaXQDWmoYC
	 Vr6o3TBldTT1SQROJ2qdXr153aqV8Q7RRtW14akVRHOvZUOMUm8IPZ5AprTx5EYCqfJnk
	 zKQpd4P9HW5qPGQQrrec7pzY4kRuco/ko6N4B8rSVu6suaWSEHsaO3V5gstPwMM7nVgaN
	 YYbUAIE9Np2L/0aaDNJxJlDDakhPaAJXKq1yjNFjZoUaPscbednvKVrA1J1CbJOqHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458358;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SaDWoOqIit5U64rjLHqniDWftXA6W7O7+XmPs7S3MZE=;
	b=wfE4CtGjHO4lRprc49RFtPc0VGGKAToKk/ju3D0cFFejQf7PAIFl7Q0nGAIe1lDRMNUE
	 DiQEE31g8wQFx48WluYHA5PzJzaDsH6R89Kq4LKuqOaSMb4H8OYrgHDAr/ybQWUxBZFl4
	 KdJDrIIR6bG4hFaTSmmmQSFSKbKsvgahRR4zBIUqHhRbg0vRjLVM6vomoO7ZzlxeIjhMM
	 t2xUI1g03pbM0b9VeIYvBEMD1BJ5j6S8UStRucTK2kSsypVTHADP55dXoZRmqSOoQPWl9
	 eNT3V7PlTjBN8xI8AWbRUyzs5elcHTqi/d/29BUpuhSs3lbCFO0v4Nqd3pYPkJUlAGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lT/ng6uR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374E606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lT/ng6uR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEFB1F000D4
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458357;
	bh=SaDWoOqIit5U64rjLHqniDWftXA6W7O7+XmPs7S3MZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lT/ng6uRnKsrw/yRVhG+89TcZIyE/GaACWEZ7JByvbOJuqxX4QbCfrFc/+GFxFbJr
	 bgnmu+Fi/qkj7iAPjOvIQ+whzIMs+vXmDhlfs9+o0p4lq+tKcCu3Jakft9YcSfiuHo
	 VHYSsDZTVVki7+ElTJJD0h863pn8xK9lrD037jSsHLzGgOfx3EkbXn2Eq2dhf27hg7
	 IqfgmMNaVNuuiSP16dXI1p/VzwRR/edaCHMAISlogZwLQqABSibBaKg6bNo4uLkQgY
	 P7agpyc0uyBZocO2taJcY4HDrlmrtx8ZCKUVJM6I2N2IKkk8F4lFGb7e6N1qkOWQTQ
	 9vwx29BEqTmLw==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-86156cf8a7eso3472115a34.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH9JMz7kIytYsR5h5NptVT6yOg8FijOVPQQwryNEzVBgzbGpuIKLps+mTu1cNWJyT15N9hNknw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CetEZPRsGxg6CNxv/kFKELDqGeYT0u8Y1aFYfG7CFIuld7DMM
	ztJXLiDPYjpjOBO6GGggkPqRFtzWv9e4E+Q/jrNtED1fjzkn1vjNmvWQujvFMu6id8abUaREz92
	QNFVv8ruylc4uvokoC8IE49ttuLVQFE8=
X-Received: by 2002:a05:6820:1628:b0:713:d536:1d33 with SMTP id
 006d021491bc7-71b3277f48fmr9431007eaf.46.1795458357018; Mon, 23 Nov 2026
 10:25:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
In-Reply-To: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 19:25:46 +0100
X-Gmail-Original-Message-ID: <CAL4WiipqqqU8KsqRDNOdzEenn+qWABu19xVqo4Fgmhfc9cf+7w@mail.gmail.com>
X-Gm-Features: Aa3M54qLtcxbFytXkPCthlQOB8VMAE863mdyrjJmdDkmUghBpqICfuldWFtu2H0
Message-ID: <CAL4WiipqqqU8KsqRDNOdzEenn+qWABu19xVqo4Fgmhfc9cf+7w@mail.gmail.com>
Subject: Re: [syzbot] [net?] KCSAN: data-race in fq_pie_reset / pie_calculate_probability
To: syzbot <syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com>, 
	Kyle Zeng <kylebot@openai.com>
Cc: davem@davemloft.net, horms@kernel.org, jhs@mojatatu.com, jiri@resnulli.us, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 19:14, syzbot
<syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com> a =C3=A9crit :
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    b6a9fa34ce41 Linux 7.4-rc4
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D118e58e958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D886d2ddd2d6b6=
64e
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D00f5a4ef4bcb8f4=
d19f1
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.=
8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/1cd533522ae8/dis=
k-b6a9fa34.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/19d6c1c369e3/vmlinu=
x-b6a9fa34.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/dfb541770724/b=
zImage-b6a9fa34.xz
>
> AI-generated root cause summary:
> During qdisc teardown in `dev_shutdown()` -> `qdisc_put()` ->
> `__qdisc_destroy()`, `qdisc_reset()` calls `fq_pie_reset()` without holdi=
ng any
> qdisc lock and before `fq_pie_destroy()` stops `q->adapt_timer`. Moreover=
,
> `shutdown_scheduler_queue()` has already replaced `dev_queue->qdisc_sleep=
ing`
> with `&noop_qdisc`, so `fq_pie_timer()`'s call to
> `qdisc_lock(qdisc_root_sleeping(sch))` acquires `noop_qdisc`'s lock rathe=
r than
> `sch`'s lock. As a result, `fq_pie_timer()` -> `pie_calculate_probability=
()`
> runs concurrently with `fq_pie_reset()`, racing on `pie_vars_init()` writ=
es to
> `flow->vars` (specifically `vars->accu_prob` and `vars->avg_dq_rate`).
>

This analysis is correct.

For fq_pie this particular race is harmless: the qdisc is being
destroyed, flow->vars is not read again, and q->flows is freed only
after timer_delete_sync() in fq_pie_destroy().

It is however one instance of a more general problem: __qdisc_destroy()
calls qdisc_reset() without the lock that the sfq, red, pie, fq_pie and
dualpi2 timers take, and these timers are only stopped later in
->destroy(). With sfq this is a real use-after-free since commit
47e8dbb6e763 ("net/sched: do not reset queues in graft operations").

This was discussed in:

https://lore.kernel.org/netdev/20261106161455.2412769-1-edumazet@kernel.org=
/
https://lore.kernel.org/netdev/20261110044450.51921-1-kylebot@openai.com/

Kyle's v2 takes the tree lock around the final qdisc_reset() and routes
shutdown_scheduler_queue() through dev_graft_qdisc(), which should cover
this report. It needs a respin, as Jakub requested.

Kyle, when you repost, please add:

Reported-by: syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com

Thanks.


> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D00f5a4e=
f4bcb8f4d19f1
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in fq_pie_reset / pie_calculate_probability
>
> write to 0xffff88811d293640 of 8 bytes by task 13 on cpu 1:
>  pie_vars_init include/net/pie.h:103 [inline]
>  fq_pie_reset+0x11e/0x1d0 net/sched/sch_fq_pie.c:552
>  qdisc_reset+0x51/0x2e0 net/sched/sch_generic.c:1118
>  __qdisc_destroy+0x60/0x220 net/sched/sch_generic.c:1157
>  qdisc_put net/sched/sch_generic.c:1189 [inline]
>  dev_shutdown+0x2e0/0x390 net/sched/sch_generic.c:1558
>  unregister_netdevice_many_notify+0x999/0x15e0 net/core/dev.c:12761
>  unregister_netdevice_many+0x19/0x20 net/core/dev.c:12845
>  ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
>  ops_undo_list+0x21d/0x410 net/core/net_namespace.c:249
>  cleanup_net+0x38d/0x5e0 net/core/net_namespace.c:713
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
>  worker_thread+0x56c/0x770 kernel/workqueue.c:3659
>  kthread+0x248/0x2a0 kernel/kthread.c:436
>  ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> write to 0xffff88811d293640 of 8 bytes by interrupt on cpu 0:
>  pie_vars_init include/net/pie.h:103 [inline]
>  pie_calculate_probability+0x425/0x4c0 net/sched/sch_pie.c:417
>  fq_pie_timer+0xf6/0x1d0 net/sched/sch_fq_pie.c:403
>  call_timer_fn+0x36/0x280 kernel/time/timer.c:1749
>  expire_timers kernel/time/timer.c:1800 [inline]
>  __run_timers kernel/time/timer.c:2375 [inline]
>  __run_timer_base+0x40c/0x610 kernel/time/timer.c:2387
>  run_timer_base kernel/time/timer.c:2396 [inline]
>  run_timer_softirq+0x31/0x70 kernel/time/timer.c:2406
>  handle_softirqs+0x109/0x310 kernel/softirq.c:669
>  __do_softirq kernel/softirq.c:703 [inline]
>  invoke_softirq kernel/softirq.c:542 [inline]
>  __irq_exit_rcu+0x40/0xf0 kernel/softirq.c:786
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inli=
ne]
>  sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1062
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.=
h:674
>  __preempt_count_dec_and_test arch/x86/include/asm/preempt.h:123 [inline]
>  __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:211 [inlin=
e]
>  _raw_spin_unlock_irqrestore+0x1a/0x30 kernel/locking/spinlock.c:221
>  free_frozen_page_commit+0x223/0x3a0 mm/page_alloc.c:2909
>  free_unref_folios+0x8c0/0x980 mm/page_alloc.c:3099
>  folios_put_refs+0x2cd/0x320 mm/folio.c:1065
>  folios_put include/linux/mm.h:2429 [inline]
>  __folio_batch_release+0x8e/0xb0 mm/folio.c:1125
>  folio_batch_release include/linux/folio_batch.h:101 [inline]
>  truncate_inode_pages_range+0x287/0x780 mm/truncate.c:452
>  truncate_inode_pages mm/truncate.c:530 [inline]
>  truncate_inode_pages_final+0x68/0x80 mm/truncate.c:565
>  ext4_evict_inode+0x459/0xea0 fs/ext4/inode.c:273
>  evict+0x301/0x570 fs/inode.c:829
>  iput_final fs/inode.c:2036 [inline]
>  iput+0x44f/0x5d0 fs/inode.c:2085
>  dentry_unlink_inode+0x29a/0x2b0 fs/dcache.c:510
>  dentry_kill+0x135/0x4f0 fs/dcache.c:857
>  finish_dput+0x16/0x1d0 fs/dcache.c:1032
>  dput+0x43/0x50 fs/dcache.c:1073
>  __fput+0x45c/0x660 fs/file_table.c:520
>  ____fput+0x1c/0x30 fs/file_table.c:541
>  task_work_run+0x145/0x1a0 kernel/task_work.c:233
>  exit_task_work include/linux/task_work.h:40 [inline]
>  do_exit+0x4a7/0x1530 kernel/exit.c:980
>  do_group_exit+0xfe/0x140 kernel/exit.c:1123
>  get_signal+0xc49/0xd30 kernel/signal.c:3113
>  arch_do_signal_or_restart+0x96/0x480 arch/x86/kernel/signal.c:337
>  __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
>  exit_to_user_mode_loop+0x161/0x940 kernel/entry/common.c:101
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline=
]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [=
inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
>  do_syscall_64+0x23b/0x3a0 arch/x86/entry/syscall_64.c:107
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 6734 Comm: syz.1.1114 Not tainted syzkaller #0 PREEMPT=
(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 11/06/2026
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
