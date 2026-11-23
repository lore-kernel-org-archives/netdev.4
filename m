Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457679;
	b=nWFqOK6tsMzC6a3hiTWO3s0dTmeYC99DP6nmYpF4zrtUZrqL5CtTvhD2H84gy904CdIC
	 f6H+JR6VixpT6oI7R3iIOm0XNTkI+UuAfGXKHDt8smOTg3LYvIM0OaUnwNoJ8TJxjpTsj
	 dnmcmaR45EylSsUBghY/FA/CAZ7I/J6FhUP+bi5TOpPhVs1NKD0fwswVa6W63/KrDz3IR
	 1dJZpU5ZFnqaL5HhuRz+/i1CBZEW4nImc8U5mvJjcYeynxLjA3oxm44q/6XI42xokDBb5
	 dfvJmgbuhuXuCSi8Hz8Xx4Pgpker5AkK+jVeWZRGWKBpqlgEUw4O158l2tZTucy0nlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457679;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=KZh03sQcNOrqV7JEiw95hkpukQ6zvsmGeYXVI4FeVzw=;
	b=5ltX1GXZOXRaOOP8OlMT3fPlkOH4MzcE6ETftqI34ue78mNY4zPeahAKn6CFtrRjAs39
	 o/x348OcJ/YXARo8ar5NBFC7lDjmEj3xJZZdBwFoqvOWFMLptcbv2ctnI30523KtQ/H7h
	 MLcQgx4ZO8BGVtv1AY6AzV5a4f+Uf02cmKKcB1D+BuWuw5O5BpHOgG/ilSBj07YGnOxfe
	 WWsUx6CU9ZqDHu9raMOwKW6RcIFrhBPI0GVqgFujYiqMRp+5QM7ASmANuofNXNziukO1a
	 cQmN+jWqMujdBumtumVhLgaTnVn0uvvJ6un6yxUigmm6OLL3ankDr+8fzXdbz5HDODw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B932606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B932606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5384e381fbbso3240349b6e.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457677; x=1796062477;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZh03sQcNOrqV7JEiw95hkpukQ6zvsmGeYXVI4FeVzw=;
        b=UHkpdHNzRkFFBW+wwxDSdbFt969IwjMy/u8VArXIy75BITwVT+E+3uJiGoss73SBRe
         3EV6o15QCTx2I9TD+//L0C+Z7+zKctQefKomCOZUa+D5QtXjQhWwjFaQcfXXQ8ApNS3e
         t2tn0J5o1NlCjtwOfnH9EEtwCoi3Rpd8WibvEbV1GF3Th8MPE6Jt861gLCXJX/DI4a8h
         srV2+IFoocgoApvwm29tpift5uRxTm+IBzS8pj1Qb5Fx+DxH+NPzEVlKatKO3/hgUzUK
         KCUZ6AxN4UuXhzWIT2n1RPKn2QZP/DR0NTJFI7zEsLaBdSZ+QZ1q8qCfIbXmJRGKPM8c
         eI9A==
X-Forwarded-Encrypted: i=1; AL+hErFR/1rk6PuPRvOO4CFQD4z5r1wb/s3rlGqt1PQAPS+FaXy8PWbPQ21j+AvV7uS/Tcd5cFOa7OI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8eHqyBxe2fk9wEkeUiFCvJK0FtWTz90AZ6bbY+n3jVeR1qikU
	Og5YAdt+TX7d4g7nuVjsj5ZjvuIK8GFsVv4KUBrDBUMBKV0z4sIIxB98V58coKXE0Ngu2Pf7M+W
	spZD2kZb8tGxjeXcaCKJ2ALexSNXdImXYkvMBquzjebDYfpGJ/gsYleD3REA=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11c4:b0:55c:8ee:a9c4 with SMTP id
 5614622812f47-57a0b6440efmr13263691b6e.43.1795457677642; Mon, 23 Nov 2026
 10:14:37 -0800 (PST)
Date: Mon, 23 Nov 2026 10:14:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b04828d.71deaa98.2984e6.000b.GAE@google.com>
Subject: [syzbot] [net?] KCSAN: data-race in fq_pie_reset / pie_calculate_probability
From: syzbot <syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, 
	jhs@mojatatu.com, jiri@resnulli.us, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b6a9fa34ce41 Linux 7.4-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118e58e9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
dashboard link: https://syzkaller.appspot.com/bug?extid=00f5a4ef4bcb8f4d19f1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1cd533522ae8/disk-b6a9fa34.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/19d6c1c369e3/vmlinux-b6a9fa34.xz
kernel image: https://storage.googleapis.com/syzbot-assets/dfb541770724/bzImage-b6a9fa34.xz

AI-generated root cause summary:
During qdisc teardown in `dev_shutdown()` -> `qdisc_put()` ->
`__qdisc_destroy()`, `qdisc_reset()` calls `fq_pie_reset()` without holding any
qdisc lock and before `fq_pie_destroy()` stops `q->adapt_timer`. Moreover,
`shutdown_scheduler_queue()` has already replaced `dev_queue->qdisc_sleeping`
with `&noop_qdisc`, so `fq_pie_timer()`'s call to
`qdisc_lock(qdisc_root_sleeping(sch))` acquires `noop_qdisc`'s lock rather than
`sch`'s lock. As a result, `fq_pie_timer()` -> `pie_calculate_probability()`
runs concurrently with `fq_pie_reset()`, racing on `pie_vars_init()` writes to
`flow->vars` (specifically `vars->accu_prob` and `vars->avg_dq_rate`).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=00f5a4ef4bcb8f4d19f1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in fq_pie_reset / pie_calculate_probability

write to 0xffff88811d293640 of 8 bytes by task 13 on cpu 1:
 pie_vars_init include/net/pie.h:103 [inline]
 fq_pie_reset+0x11e/0x1d0 net/sched/sch_fq_pie.c:552
 qdisc_reset+0x51/0x2e0 net/sched/sch_generic.c:1118
 __qdisc_destroy+0x60/0x220 net/sched/sch_generic.c:1157
 qdisc_put net/sched/sch_generic.c:1189 [inline]
 dev_shutdown+0x2e0/0x390 net/sched/sch_generic.c:1558
 unregister_netdevice_many_notify+0x999/0x15e0 net/core/dev.c:12761
 unregister_netdevice_many+0x19/0x20 net/core/dev.c:12845
 ops_exit_rtnl_list net/core/net_namespace.c:188 [inline]
 ops_undo_list+0x21d/0x410 net/core/net_namespace.c:249
 cleanup_net+0x38d/0x5e0 net/core/net_namespace.c:713
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
 worker_thread+0x56c/0x770 kernel/workqueue.c:3659
 kthread+0x248/0x2a0 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

write to 0xffff88811d293640 of 8 bytes by interrupt on cpu 0:
 pie_vars_init include/net/pie.h:103 [inline]
 pie_calculate_probability+0x425/0x4c0 net/sched/sch_pie.c:417
 fq_pie_timer+0xf6/0x1d0 net/sched/sch_fq_pie.c:403
 call_timer_fn+0x36/0x280 kernel/time/timer.c:1749
 expire_timers kernel/time/timer.c:1800 [inline]
 __run_timers kernel/time/timer.c:2375 [inline]
 __run_timer_base+0x40c/0x610 kernel/time/timer.c:2387
 run_timer_base kernel/time/timer.c:2396 [inline]
 run_timer_softirq+0x31/0x70 kernel/time/timer.c:2406
 handle_softirqs+0x109/0x310 kernel/softirq.c:669
 __do_softirq kernel/softirq.c:703 [inline]
 invoke_softirq kernel/softirq.c:542 [inline]
 __irq_exit_rcu+0x40/0xf0 kernel/softirq.c:786
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
 __preempt_count_dec_and_test arch/x86/include/asm/preempt.h:123 [inline]
 __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:211 [inline]
 _raw_spin_unlock_irqrestore+0x1a/0x30 kernel/locking/spinlock.c:221
 free_frozen_page_commit+0x223/0x3a0 mm/page_alloc.c:2909
 free_unref_folios+0x8c0/0x980 mm/page_alloc.c:3099
 folios_put_refs+0x2cd/0x320 mm/folio.c:1065
 folios_put include/linux/mm.h:2429 [inline]
 __folio_batch_release+0x8e/0xb0 mm/folio.c:1125
 folio_batch_release include/linux/folio_batch.h:101 [inline]
 truncate_inode_pages_range+0x287/0x780 mm/truncate.c:452
 truncate_inode_pages mm/truncate.c:530 [inline]
 truncate_inode_pages_final+0x68/0x80 mm/truncate.c:565
 ext4_evict_inode+0x459/0xea0 fs/ext4/inode.c:273
 evict+0x301/0x570 fs/inode.c:829
 iput_final fs/inode.c:2036 [inline]
 iput+0x44f/0x5d0 fs/inode.c:2085
 dentry_unlink_inode+0x29a/0x2b0 fs/dcache.c:510
 dentry_kill+0x135/0x4f0 fs/dcache.c:857
 finish_dput+0x16/0x1d0 fs/dcache.c:1032
 dput+0x43/0x50 fs/dcache.c:1073
 __fput+0x45c/0x660 fs/file_table.c:520
 ____fput+0x1c/0x30 fs/file_table.c:541
 task_work_run+0x145/0x1a0 kernel/task_work.c:233
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x4a7/0x1530 kernel/exit.c:980
 do_group_exit+0xfe/0x140 kernel/exit.c:1123
 get_signal+0xc49/0xd30 kernel/signal.c:3113
 arch_do_signal_or_restart+0x96/0x480 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x161/0x940 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x23b/0x3a0 arch/x86/entry/syscall_64.c:107
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 6734 Comm: syz.1.1114 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
