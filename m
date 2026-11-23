Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470700;
	b=4V/u9BYpoW6tFY5lbnIiiB78Pl1ku0rSv11a1soYiJrWXT9uA6wwRx0mUua0CEKzHoOs
	 EccAG7VS8RvbiFJ+7KYOfc+/xG3Lt6P5Zm/ht3nY1wXQxbpqro6KsN0IxVn6oXsvGYDTT
	 lY965MtBMvNLUVH6wsx6tm/W20w+l/iSJVy3Vr/VnvfkZZ1z/2cKbLijO/L5t/Rvr4AGO
	 uZGvG5fzC8WaT1FJ6qOzqZZRUMrZDip1TUoc63hLk0L7htIr+wR+14+rC2Vu03DKQuyz1
	 jtnXIbBqk6uBFX7I1p/MtI06J2s7uUYmg55wBcjLrBTzEGOkKG91Zln+SHnbD3+meCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=2Hs8rCyGsw/DQ1uI+RqDlzXciGD3XvAd/zH1v+QjQxE=;
	b=ke8qg1Sch367GBCwmG2c7M9o/Hw4GSKWsMERTWrpN0fVirt7mnxXIgQ5dWHqOvNCB1SH
	 3oFC2B8pmJLNspl5377nuiY5dGK1wKw1oz2b5nBly7bWrq6prryY8OICqDfldE23NRQxS
	 y6K1+cYdE3i4Hv2yPSesOQgzuIpYSHUn6AIWo9uQu71IHMwBWkxEtDHh7GveqPhLs88bp
	 rGpSRVEG4IEcht8T6IcjYERx5Yxxx54ja9UjWZ5LCYAM6HtY65lvHdP/42+K08pA6cV21
	 ctowdynbkE5cejG0mkAZbNr99wezd3aob/JZ1ladD4ksWFe50KKg1+Q+1fP6aRoP95w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piCHQ0my;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E166606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E166606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=piCHQ0my
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso37530255e9.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795470699; x=1796075499; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2Hs8rCyGsw/DQ1uI+RqDlzXciGD3XvAd/zH1v+QjQxE=;
        b=piCHQ0myYf4CbDx9pBcTwF2BhbPVeA92N6bZ4QLuFa8KhORRfgJDbxWWP5rq4UEeuK
         mzkuJ9RwE+MoyYZyKDTzRbfab2+hcxJP1VlKiSxh/4xZXs8G5hQ2lhJqMTtSHVy6/8mm
         fWAqSh4nkvraOEQcqAoxwyJLVcGf8XhNfW2F8hBTo2ELMRJyQHZOWzhnQyi5XaooQDUZ
         0UsZq6VXCIwv8bY7lIYDNjOmQf6H1r7m4a0HWvOL4K/Mx8GCLyZKEA+O9irkjhxkTsxB
         nfAZ1HJ3+y5FSYIfLiqrs+v6HSJe2bdrHEiTP8+IEPZ5XebVFJiMYQ4FsGDOYkOkrtC6
         +/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470699; x=1796075499;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Hs8rCyGsw/DQ1uI+RqDlzXciGD3XvAd/zH1v+QjQxE=;
        b=l0FWkHL6JGiP5XLAfuRJN/AwiNMoj7R1hBr0mjlQ32P8JVL1oOnXmlt6pzdey6bpW6
         QFEZSYzQ4/4hZY2muadAxaSaxUa3NDU+W5E9OgL6SwqgU2NzUmfsWP2HKLfcLw6Nv0cJ
         02rJydWiTiFbtOkGw22hVbq1eX46EstjyZ6RKGk6+OLGOL+YHlz+LHhDrVowne4FOZJq
         5Hv2fwhZHeEa751FOp3qZi3X1vmQ+nspHsdz8VXcWfti7eIccmybaFpfkcnK/gFS4s1N
         /s/GBS1aq5exMc1hrUtLHMTMLBOXVkJiXnY7cyzGUvxWP/pPcIpwF3Vvmu/fgOZPQQmW
         cx2A==
X-Forwarded-Encrypted: i=1; AL+hErEMAm/Ln2ekfM3Zc69dwCVQSeeV0MJ6Qpt7CL+2uV5qp0JNEqBFBoVwn3qIjMMzsJkpa4fHaYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RDielGJDYrZbi9Aptj0B0VkhY4WBrXdrSuyVziZOA+/7Eintm
	gAaD84Of6B6jw7y9sAovJ5dosBx6E8DbtjB+yJrqwT67g6AIJaW1TJZnSNsxzkRYBQ==
X-Gm-Gg: AZFdTZebp57ts2NE1RMk0Tqvt45EP3+L3dJwIP0ikAx8mCsN7dck4RwJcuiv6GeZ92O
	83JIAvolt50C+tNgWEZxfE+PZTFKxJVy6e0bUdC/r3SPVzoy71Sdh3BRAJV70v/l/8CsBRskozz
	0mvgqLF1FtpBeJcEd7FQG0gOsVaZtCm8NNSc9jeZBaps5xbaXKdSXijQmkIRF+WbIWjo0YbLbmL
	CUjOeyUolbKjxp8n1dLQZS6DtTYXxIziwtUtH6sSfy7wYipE55S+EFc6oLGMpTf7Jzfdyi6jd9O
	QgytFuaO/UyyR261IXBAYtDRMGbdOxyUiqCsIMO3CTQIcMJdAFWkXns2zvQZuMDImjZ1WK9U9Yv
	Wza2mCdi2pTjGOG33R8zisuqflocGKNNdWPE2qsIuAwgMSey1x/pGpqwv27fclGPm0Q2GTalIu5
	L2qJVXWF+qyBJKhSKWbQ2x33YZteL21VzRbWptcDX5qmLXYaoRZscfmwAtdbbn18D+bwRtI0EoG
	wRB5cKOYUcTS4Vk9ljimXMmlWwFRn41Yt42nxHErQQJeUUmPhn2R98DCh37Yil9/EaUnySUgFiy
	Q7wzyJPnkRwhWKghysi8CFspYGffZrkZx6NcSDHxnOnO/ntiGXdd7zbwYLH172/QpB3az1E9Zd0
	=
X-Received: by 2002:a05:600c:1c08:b0:4bb:7757:fe6d with SMTP id 5b1f17b1804b1-4bb88804c5fmr321884935e9.11.1795470698614;
        Mon, 23 Nov 2026 13:51:38 -0800 (PST)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm24254809f8f.49.2026.11.23.13.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:51:37 -0800 (PST)
Date: Mon, 23 Nov 2026 21:51:33 +0000
From: Marco Elver <elver@google.com>
To: syzbot <syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org,
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] KCSAN: data-race in fq_pie_reset /
 pie_calculate_probability
Message-ID: <awS1ZXUKIPtEd4J-@elver.google.com>
References: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Mon, Nov 23, 2026 at 10:14AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b6a9fa34ce41 Linux 7.4-rc4
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=118e58e9580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
> dashboard link: https://syzkaller.appspot.com/bug?extid=00f5a4ef4bcb8f4d19f1
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/1cd533522ae8/disk-b6a9fa34.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/19d6c1c369e3/vmlinux-b6a9fa34.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/dfb541770724/bzImage-b6a9fa34.xz
> 
> AI-generated root cause summary:
> During qdisc teardown in `dev_shutdown()` -> `qdisc_put()` ->
> `__qdisc_destroy()`, `qdisc_reset()` calls `fq_pie_reset()` without holding any
> qdisc lock and before `fq_pie_destroy()` stops `q->adapt_timer`. Moreover,
> `shutdown_scheduler_queue()` has already replaced `dev_queue->qdisc_sleeping`
> with `&noop_qdisc`, so `fq_pie_timer()`'s call to
> `qdisc_lock(qdisc_root_sleeping(sch))` acquires `noop_qdisc`'s lock rather than
> `sch`'s lock. As a result, `fq_pie_timer()` -> `pie_calculate_probability()`
> runs concurrently with `fq_pie_reset()`, racing on `pie_vars_init()` writes to
> `flow->vars` (specifically `vars->accu_prob` and `vars->avg_dq_rate`).
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=00f5a4ef4bcb8f4d19f1

|  CPU0 (kworker: cleanup_net)              CPU1 (timer softirq)
|
|                                           fq_pie_timer()
|                                             // dev_queue->qdisc_sleeping is
|                                             &noop_qdisc
|                                             spin_lock(&noop_qdisc.q.lock)
|                                             pie_calculate_probability()
|                                               if (vars->avg_dq_rate > 0) // reads > 0
|  dev_shutdown()
|    qdisc_put()
|      __qdisc_destroy()
|        qdisc_reset()
|          fq_pie_reset()
|            pie_vars_init(&flow->vars)
|              WRITE_ONCE(vars->avg_dq_rate, 0)
|                                               // reloads vars->avg_dq_rate == 0
|                                               qdelay = (backlog << PIE_SCALE) / vars->avg_dq_rate;
|                                               // -> Divide-by-zero (#DE) crash!

> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com
> 
> ==================================================================
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
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
>  sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1062
>  asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
>  __preempt_count_dec_and_test arch/x86/include/asm/preempt.h:123 [inline]
>  __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:211 [inline]
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
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
>  do_syscall_64+0x23b/0x3a0 arch/x86/entry/syscall_64.c:107
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 6734 Comm: syz.1.1114 Not tainted syzkaller #0 PREEMPT(lazy) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> ==================================================================
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
> 
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/6b04828d.71deaa98.2984e6.000b.GAE%40google.com.
