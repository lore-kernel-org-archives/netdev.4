Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559083;
	b=sj7g8YikSxpu6WHjVMCa4R9SIt5MczIa8T81geO4OC6PT50bgc94hdUm5kIZ16NPrnHP
	 aYuQtmiNk3wD2NDDR/l8jKDumRpVzojD2NxCNlAePJ3T2sf041+sRVpSIHL52ufOcLt+P
	 /BJwA3gPB22wYzvuuXirOInxHf7rsuzAuNztqszYUSLYWsSGk0KO8paWVA8iYz84igeKa
	 ZqaorqKuyiTa2/WXrSagznocGUW1JToPgiUUXL6LNrWo/feYhdGGKG4k7KqknYqNdFikE
	 YDQlNhlqEwkxGwp3/Ht6TLaDNfwGWQ6sCvahYn7qcZgXBLJRLFsfuLpd8D55JYxaVMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559083;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=kIxtExBELn7SeoxzbJabhSlRGlT4UchM+BcTDqdeb3M=;
	b=uvmHjFTQcicou6g0B1mqADotwBD73vCFszoOowEer/fzZBpbAriITwH8wtHbzKFRBON9
	 5kASVkylRlFmchQi4MYiZj26IqJYKOOzmHg5Dc6BoXIoFOt+kQjMqpSKnMfL7+LRjDS5K
	 lrKC7VuGROqCeRqcvbqCpDMmSrf7GtOZnT0+qwCnwKI9XS/tv0jG4/GoI+oSSMJo835yj
	 +s8WKhojGJFJcFp1KA/x3jqiDtwMJSd6Dy7vI+sNlPmKid4wNoC/YQtiB+QTIhJ//U3SS
	 k+Qjl+ayudnTdLEZ0tKcCO3pPqG4hOIMUKt+Zg9cH78LOWSE0JXqKQnOLp78shVXSGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6F2606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so5765160b6e.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:24:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559082; x=1796163882;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIxtExBELn7SeoxzbJabhSlRGlT4UchM+BcTDqdeb3M=;
        b=ze2BINt23q+lukZycfFpP5gLuI60h19Yc9nYtLkbL9ytJBN1RM21v6mtqUiI7CqwcA
         Hi5SVrtyDof9WEilU8dJy4TDqC6Q6KoTv3Ta8jfJkWdTxGOlwmA4/slEzFbndbgpq9jm
         Bs3BILTIrpq8Y+l6lbvCsuHOpHHm2cHMAVXBUJhjTuTQdXveW3fhQQTQlTTfuZWBkQsb
         oVt96xAFvTq1HgPh37qb05uRM8+vShjz4548fOe2c7vJvDGFMj5Qk35D1SliJjVVEdF5
         f1rNXSFxpNTB9pCO2INuLU9QXB4H1ZDZdJIznB5/E9v7DED4NIjWxgW2B5iGtI7CEZR6
         LdoQ==
X-Forwarded-Encrypted: i=1; AL+hErHzmbVblqUzYZtFqFrefaSvYZl9rOa/iRfMbG1kAEROn5LY+5S+W3bmKaDEGmg2DcvflWVQHpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NlS4AJmcv0p/6lLwzbtOCJWVIHqA2oMi9yEQBibDA8BJlBd2r
	XVNn2Ot3+BDyZdcLelQJWycnCVoyUHFLJkPVueR739bQZv4g5sT9a3Y0dmPQm5ZE7M9Pls4fRgR
	hCmQhh/2WkoE0cPAqvLgY/QowNUvDzq0vQjmHxPJ5GE5y71B+bEJi8Xb/Xi4=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f2c:b0:4d6:90f4:48b4 with SMTP id
 5614622812f47-57a0cae5223mr18069529b6e.54.1795559082190; Tue, 24 Nov 2026
 14:24:42 -0800 (PST)
Date: Tue, 24 Nov 2026 14:24:42 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b060eaa.44b41460.34b83f.0040.GAE@google.com>
Subject: [syzbot] [net?] possible deadlock in gup_fast_fallback (4)
From: syzbot <syzbot+a248631c3876e5616b8c@syzkaller.appspotmail.com>
To: axboe@kernel.dk, davem@davemloft.net, edumazet@google.com, 
	edumazet@kernel.org, horms@kernel.org, jiayuan.chen@linux.dev, 
	kartikey406@gmail.com, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2388bb763e32 vsock: only deliver taps to namespaces that c..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1494da03580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7c6e8aa85c823ea1
dashboard link: https://syzkaller.appspot.com/bug?extid=a248631c3876e5616b8c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b841983d2243/disk-2388bb76.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/594cfcd1a79e/vmlinux-2388bb76.xz
kernel image: https://storage.googleapis.com/syzbot-assets/40f2d7665b0c/bzImage-2388bb76.xz

The issue was bisected by AI to:

commit 9280e6edf65662b6aafc8b704ad065b54c08b519
Author: Deepanshu Kartikey <kartikey406@gmail.com>
Date:   Sun Jun 21 23:52:55 2026 +0000

    nbd: don't warn when reclassifying a busy socket lock

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=5962c4db-cae6-420d-9065-19f85abbc6f5

AI-generated root cause summary:
Lockdep detects a circular locking dependency between `&mm->mmap_lock` and
`sk_lock-AF_INET6` because `nbd_reclassify_socket()` in `drivers/block/nbd.c`
silently skips reclassifying the socket's `sk_lock` class when
`sock_allow_reclassification(sk)` returns false (i.e., when `sk->sk_lock` or
`sk->sk_lock.slock` is held by another thread or softirq at the time
`nbd_add_socket()` runs). Leaving the NBD socket in the generic
`sk_lock-AF_INET6` class causes lockdep to alias it with ordinary userspace
`AF_INET6` sockets such as kTLS sockets in `tls_sw_sendmsg()`, which acquire
`&mm->mmap_lock` via `gup_fast_fallback()` while holding `sk_lock`.
Additionally, because `nbd_add_socket()` does not prevent userspace from
continuing to use the socket FD (including kTLS sockets), concurrent userspace
`sendmsg`/`writev` and NBD block I/O under `fs_reclaim` on the same socket can
form a real AB-BA deadlock.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=a248631c3876e5616b8c

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a248631c3876e5616b8c@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 9280e6edf656 ("nbd: don't warn when reclassifying a busy socket lock")

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.3.1126/10806 is trying to acquire lock:
ffff88807caee540 (&mm->mmap_lock){++++}-{4:4}, at: gup_fast_fallback+0x1f8/0x27f0 mm/gup.c:3235

but task is already holding lock:
ffff888036172ba0 (sk_lock-AF_INET6){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1743 [inline]
ffff888036172ba0 (sk_lock-AF_INET6){+.+.}-{0:0}, at: tls_sw_sendmsg+0x189/0x2c10 net/tls/tls_sw.c:1032

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (sk_lock-AF_INET6){+.+.}-{0:0}:
       lock_sock_nested+0x41/0x100 net/core/sock.c:3911
       lock_sock include/net/sock.h:1743 [inline]
       inet_shutdown+0x6a/0x390 net/ipv4/af_inet.c:913
       nbd_mark_nsock_dead+0x2cb/0x550 drivers/block/nbd.c:319
       sock_shutdown+0x15e/0x260 drivers/block/nbd.c:420
       nbd_clear_sock+0x24/0x170 drivers/block/nbd.c:1463
       nbd_config_put+0x477/0x7e0 drivers/block/nbd.c:1492
       nbd_genl_connect+0x19b8/0x1cd0 drivers/block/nbd.c:2319
       genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2585
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1336 [inline]
       netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1362
       netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1921
       sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
       __sock_sendmsg net/socket.c:818 [inline]
       ____sys_sendmsg+0x49f/0x790 net/socket.c:2713
       ___sys_sendmsg+0x2f8/0x3d0 net/socket.c:2770
       __sys_sendmsg net/socket.c:2802 [inline]
       __do_sys_sendmsg net/socket.c:2807 [inline]
       __se_sys_sendmsg net/socket.c:2805 [inline]
       __x64_sys_sendmsg+0x1b1/0x290 net/socket.c:2805
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #6 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x373/0xff0 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2141
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x167/0x2f0 block/blk-mq.c:2556
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #5 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       nbd_queue_rq+0xc1/0xff0 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x499/0x1990 block/blk-mq.c:2141
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xd36/0x1580 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x167/0x2f0 block/blk-mq.c:2556
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #4 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:261 [inline]
       __synchronize_srcu+0xca/0x2f0 kernel/rcu/srcutree.c:1662
       elevator_switch+0x1e8/0x7b0 block/elevator.c:576
       elevator_change+0x2fa/0x480 block/elevator.c:681
       elevator_set_default+0x375/0x440 block/elevator.c:754
       blk_register_queue+0x404/0x4f0 block/blk-sysfs.c:992
       __add_disk+0x6b8/0xdb0 block/genhd.c:531
       add_disk_fwnode+0x100/0x3a0 block/genhd.c:600
       add_disk include/linux/blkdev.h:799 [inline]
       nbd_dev_add+0x733/0xb60 drivers/block/nbd.c:2026
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2743
       do_one_initcall+0x250/0x870 init/main.c:1419
       do_initcall_level+0x10a/0x1a0 init/main.c:1481
       do_initcalls+0x59/0xa0 init/main.c:1497
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1732
       kernel_init+0x22/0x1d0 init/main.c:1622
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       elevator_change+0x1af/0x480 block/elevator.c:679
       elevator_set_none+0xb5/0x140 block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5168 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5213 [inline]
       blk_mq_update_nr_hw_queues+0x60b/0x1b70 block/blk-mq.c:5281
       nbd_start_device+0x189/0xb30 drivers/block/nbd.c:1530
       nbd_genl_connect+0x167d/0x1cd0 drivers/block/nbd.c:2310
       genl_family_rcv_msg_doit+0x233/0x340 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x614/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2585
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1336 [inline]
       netlink_unicast+0x8ef/0xa80 net/netlink/af_netlink.c:1362
       netlink_sendmsg+0x7f0/0xb20 net/netlink/af_netlink.c:1921
       sock_sendmsg_nosec+0x14e/0x190 net/socket.c:800
       __sock_sendmsg net/socket.c:818 [inline]
       ____sys_sendmsg+0x49f/0x790 net/socket.c:2713
       ___sys_sendmsg+0x2f8/0x3d0 net/socket.c:2770
       __sys_sendmsg net/socket.c:2802 [inline]
       __do_sys_sendmsg net/socket.c:2807 [inline]
       __se_sys_sendmsg net/socket.c:2805 [inline]
       __x64_sys_sendmsg+0x1b1/0x290 net/socket.c:2805
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&q->q_usage_counter(io)#49){++++}-{0:0}:
       blk_alloc_queue+0x544/0x690 block/blk-core.c:505
       blk_mq_alloc_queue block/blk-mq.c:4468 [inline]
       __blk_mq_alloc_disk+0x194/0x390 block/blk-mq.c:4515
       nbd_dev_add+0x494/0xb60 drivers/block/nbd.c:1996
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2743
       do_one_initcall+0x250/0x870 init/main.c:1419
       do_initcall_level+0x10a/0x1a0 init/main.c:1481
       do_initcalls+0x59/0xa0 init/main.c:1497
       kernel_init_freeable+0x29d/0x3e0 init/main.c:1732
       kernel_init+0x22/0x1d0 init/main.c:1622
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4388 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4402
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4673 [inline]
       slab_alloc_node mm/slub.c:5011 [inline]
       kmem_cache_alloc_noprof+0x5f/0x600 mm/slub.c:5047
       mt_alloc_one lib/maple_tree.c:139 [inline]
       mas_alloc_nodes+0x291/0x350 lib/maple_tree.c:1049
       mas_preallocate+0x42a/0x840 lib/maple_tree.c:5080
       vma_iter_prealloc mm/vma.h:698 [inline]
       vma_link+0x123/0x460 mm/vma.c:1981
       insert_vm_struct+0x439/0x840 mm/vma.c:3674
       create_init_stack_vma+0x607/0xa40 mm/vma_exec.c:155
       bprm_mm_init fs/exec.c:279 [inline]
       alloc_bprm+0x507/0x640 fs/exec.c:1570
       class_bprm_constructor fs/exec.c:1580 [inline]
       kernel_execve+0x85/0x9a0 fs/exec.c:1976
       try_to_run_init_process+0x13/0x60 init/main.c:1548
       kernel_init+0xb2/0x1d0 init/main.c:1678
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (&mm->mmap_lock){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       gup_fast_fallback+0x211/0x27f0 mm/gup.c:3235
       __iov_iter_get_pages_alloc+0x378/0xa40 lib/iov_iter.c:1111
       iov_iter_get_pages2+0x5e/0xa0 lib/iov_iter.c:1157
       sk_msg_zerocopy_from_iter+0x21b/0x8c0 net/core/skmsg.c:329
       tls_sw_sendmsg_locked net/tls/tls_sw.c:889 [inline]
       tls_sw_sendmsg+0x126f/0x2c10 net/tls/tls_sw.c:1033
       sock_sendmsg_nosec+0x90/0x190 net/socket.c:800
       __sock_sendmsg net/socket.c:818 [inline]
       sock_write_iter+0x2de/0x3e0 net/socket.c:1269
       do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
       vfs_writev+0x33d/0x9a0 fs/read_write.c:1038
       do_writev+0x154/0x2e0 fs/read_write.c:1084
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &mm->mmap_lock --> &nsock->tx_lock --> sk_lock-AF_INET6

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(sk_lock-AF_INET6);
                               lock(&nsock->tx_lock);
                               lock(sk_lock-AF_INET6);
  rlock(&mm->mmap_lock);

 *** DEADLOCK ***

locks held by syz.3.1126/10806: 2, on CPU#1:
 #0: ffff8880570b10e8 (&ctx->tx_lock){+.+.}-{4:4}, at: tls_sw_sendmsg+0x14e/0x2c10 net/tls/tls_sw.c:1029
 #1: ffff888036172ba0 (sk_lock-AF_INET6){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1743 [inline]
 #1: ffff888036172ba0 (sk_lock-AF_INET6){+.+.}-{0:0}, at: tls_sw_sendmsg+0x189/0x2c10 net/tls/tls_sw.c:1032

stack backtrace:
CPU: 1 UID: 0 PID: 10806 Comm: syz.3.1126 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 gup_fast_fallback+0x211/0x27f0 mm/gup.c:3235
 __iov_iter_get_pages_alloc+0x378/0xa40 lib/iov_iter.c:1111
 iov_iter_get_pages2+0x5e/0xa0 lib/iov_iter.c:1157
 sk_msg_zerocopy_from_iter+0x21b/0x8c0 net/core/skmsg.c:329
 tls_sw_sendmsg_locked net/tls/tls_sw.c:889 [inline]
 tls_sw_sendmsg+0x126f/0x2c10 net/tls/tls_sw.c:1033
 sock_sendmsg_nosec+0x90/0x190 net/socket.c:800
 __sock_sendmsg net/socket.c:818 [inline]
 sock_write_iter+0x2de/0x3e0 net/socket.c:1269
 do_iter_readv_writev+0x612/0x8c0 fs/read_write.c:-1
 vfs_writev+0x33d/0x9a0 fs/read_write.c:1038
 do_writev+0x154/0x2e0 fs/read_write.c:1084
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc9e65a9519
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc9e739b028 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
RAX: ffffffffffffffda RBX: 00007fc9e6835fa0 RCX: 00007fc9e65a9519
RDX: 0000000000000010 RSI: 00002000000007c0 RDI: 0000000000000004
RBP: 00007fc9e6639136 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc9e6836038 R14: 00007fc9e6835fa0 R15: 00007fff87de8258
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about AI bisection see: https://goo.gl/tpsmEJ#ai-bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
