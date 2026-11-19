Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795056819;
	b=0uQfnA8A+wZfgS15a+HezFZngDUYNO/dOfY1zwV0ng76LBtGtJGNkl4bvMQew/wfM8AZ
	 QyhhgUa4Al+smQBEboOkv1mSqfN9Yylz5WodzGALkrqQd8c3914JulVpIiMYL6kgUBhYw
	 8dU6R9QydRph8giUFiUfxsuYR5U0UERYHA8+9Yp+CWYH3uPARoonc7zxZu16CJH2v38Q9
	 qOuO6dWGTXZF1vDOmwtGdI63EmgB561q6tM4llN6y4EhzTBGoYXN4mHDd8Bw0K9ZX88f1
	 tgPMVIMm3PfcWh9OOopNIa8NiL2H3f+ovmNjm+Mei73NcvPayR3KRKfmLkY9D3FAqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056819;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=9tWToM0lifFSyYKYANxc0yn8qaqJFP/ZYyDXn3gAv98=;
	b=iYatpcOswkvgzbwpux/048wpmhGWw/MlMOJRou5j6pc7eioO0WziknYEkkQmLG2julrb
	 HByJgJL2GxX5S2gymZnGjJoSC2I9egEwbU4G5zb6/c1Y56U2ZhOb8ylHtEJ1w5CmcHyOW
	 6WriHhWUpy3G3sWgSPcwu+9b+AvjLR7YoLdtj/qjb4YG856FTYGKEDolTusxhPgQ9EDqt
	 fEc5JtA2i6DmMhEvJ8us/YM7s9rTQs2aujqlfEAkoFrsqOpeZMJpli/+PROYCQKN5tC6N
	 mHCwVn80EouWuu6MO8HzqI7FXT4dciXgZxQpmnD4hPGKd5jbY2IYuyttYOCecOWTrig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6449606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6449606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5384e381fbbso1308092b6e.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795056818; x=1795661618;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tWToM0lifFSyYKYANxc0yn8qaqJFP/ZYyDXn3gAv98=;
        b=DSmvj8Q0ZCwR/u687Gwt7mbW4JrmO2CB3+1BMHAwFnKm537TiZfaiVf+pAmgaP//Z9
         Z3peLIxd58pgQki5NSwbQNARBcCm/VdbFKNYCVUqrQSFpwpKx+36Q/FvbZdPMJbx373C
         tOKqC2bYk/oFie64ruWb+xrO3nJkKVCj7dDRJtjN6BUzKnd8brKVKVi1lyF1KdsoqE2D
         anSmgWivrL6z3T3nPt0VAWyI0nnV2zjXLeistTXyU7XW71pCdtJ3Rtz/0DktkCHp4w7n
         F1ORFD05xae42dQLEWCHnAmYcwW/X/ibnDGra0JqZSUGRVDY3nwuxT9J2UxcWZw14VYu
         ImoA==
X-Forwarded-Encrypted: i=1; AL+hErHB7U7KisXoUjuPBh+NX5XnO6TQtDBXDUf/57VFJjZvcwxoplyEd0ezO+lzGTPfLJvG9CXF94w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YecL02I1r8fnv57R2sZtQ5crNVYWVb1djfqKNmUalsDFZnsPI
	Byjj7g/rWj1oyOmV5UWDGpF8Lj4l+1ziv2Ib8U8gm2rzWuxW/uYMME2TIBJ0XuSWUzpy2uGDcKQ
	ZWCTRgdOlOrDwWsJfC2BmTsgdlPtBGpwA6Rzzv09R5C2GPVqXOdo6GfKrdQM=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f54:b0:4c3:db9b:3ead with SMTP id
 5614622812f47-5773db23e12mr5790184b6e.3.1795056817810; Wed, 18 Nov 2026
 18:53:37 -0800 (PST)
Date: Wed, 18 Nov 2026 18:53:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afe64b1.92f98041.20636d.0000.GAE@google.com>
Subject: [syzbot] [net?] KCSAN: data-race in __seccomp_filter / bpf_sk_storage_free
From: syzbot <syzbot+dbe9d09c93ae0bb86ae1@syzkaller.appspotmail.com>
To: ameryhung@gmail.com, ast@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, josef@toxicpanda.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=146ba4b5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b949a9d3c1d44ceb
dashboard link: https://syzkaller.appspot.com/bug?extid=dbe9d09c93ae0bb86ae1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a943b9915869/disk-666539ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9bfd839d7ea5/vmlinux-666539ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0f20b9720a71/bzImage-666539ee.xz

AI-generated root cause summary:
Commit 378b7708194f moved __migrate_disable() and __migrate_enable() inline from
kernel/sched/core.c (where KCSAN instrumentation is disabled via KCSAN_SANITIZE
:= n) into include/linux/sched.h. In __migrate_disable(), this_rq_pinned()++ is
updated with only preemption disabled (via guard(preempt)()), without disabling
hardware interrupts. When an interrupt fires on the same CPU while a task is
executing __migrate_disable(), the interrupt exit path invokes softirqs (such as
RCU core callbacks running deferred_put_nlk_sk -> bpf_sk_storage_free), which
calls rcu_read_lock_dont_migrate() -> migrate_disable(), resulting in an
uninstrumented/non-IRQ-safe nested read-modify-write on CPU 0's rq->nr_pinned
that triggers KCSAN.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=dbe9d09c93ae0bb86ae1

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dbe9d09c93ae0bb86ae1@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in __seccomp_filter / bpf_sk_storage_free

read-write to 0xffff888237c2ccf0 of 4 bytes by interrupt on cpu 0:
 __migrate_disable include/linux/sched.h:2495 [inline]
 migrate_disable include/linux/sched.h:2512 [inline]
 rcu_read_lock_dont_migrate include/linux/rcupdate.h:990 [inline]
 bpf_sk_storage_free+0x7b/0x210 net/core/bpf_sk_storage.c:52
 __sk_destruct+0x12e/0x4d0 net/core/sock.c:2398
 sk_destruct net/core/sock.c:2448 [inline]
 __sk_free+0x23c/0x280 net/core/sock.c:2459
 sk_free+0x55/0x90 net/core/sock.c:2470
 deferred_put_nlk_sk+0x89/0xc0 net/netlink/af_netlink.c:712
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x76e/0xcb0 kernel/rcu/tree.c:2919
 rcu_core_si+0xd/0x20 kernel/rcu/tree.c:2936
 handle_softirqs+0x109/0x310 kernel/softirq.c:669
 __do_softirq kernel/softirq.c:703 [inline]
 invoke_softirq kernel/softirq.c:542 [inline]
 __irq_exit_rcu+0x40/0xf0 kernel/softirq.c:786
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1062 [inline]
 sysvec_apic_timer_interrupt+0x74/0x80 arch/x86/kernel/apic/apic.c:1062
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:674
 delay_tsc+0x32/0xa0 arch/x86/lib/delay.c:71
 udelay include/asm-generic/delay.h:64 [inline]
 delay_access kernel/kcsan/core.c:332 [inline]
 kcsan_setup_watchpoint+0x255/0x3f0 kernel/kcsan/core.c:622
 __migrate_disable include/linux/sched.h:2495 [inline]
 migrate_disable include/linux/sched.h:2512 [inline]
 bpf_prog_run_pin_on_cpu include/linux/filter.h:836 [inline]
 seccomp_run_filters kernel/seccomp.c:426 [inline]
 __seccomp_filter+0x362/0x1400 kernel/seccomp.c:1283
 __seccomp_permit_syscall+0x7d/0x150 kernel/seccomp.c:1410
 syscall_trace_enter include/linux/entry-common.h:98 [inline]
 syscall_enter_from_user_mode_work include/linux/entry-common.h:147 [inline]
 do_syscall_64+0xce/0x3a0 arch/x86/entry/syscall_64.c:86
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read-write to 0xffff888237c2ccf0 of 4 bytes by task 6079 on cpu 0:
 __migrate_disable include/linux/sched.h:2495 [inline]
 migrate_disable include/linux/sched.h:2512 [inline]
 bpf_prog_run_pin_on_cpu include/linux/filter.h:836 [inline]
 seccomp_run_filters kernel/seccomp.c:426 [inline]
 __seccomp_filter+0x362/0x1400 kernel/seccomp.c:1283
 __seccomp_permit_syscall+0x7d/0x150 kernel/seccomp.c:1410
 syscall_trace_enter include/linux/entry-common.h:98 [inline]
 syscall_enter_from_user_mode_work include/linux/entry-common.h:147 [inline]
 do_syscall_64+0xce/0x3a0 arch/x86/entry/syscall_64.c:86
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 6079 Comm: syz.0.1215 Not tainted syzkaller #0 PREEMPT(lazy) 
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
