Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053227;
	b=io8kJgQZsP/dsbCjMqg7paOxRW7jhu10gEClo5iM3PrlVqsYuBYJP9JS7geFXvCUyp98
	 KZ80teI+oDDWqoxke0YuPfzYXjX+dOsAXQxwDwCeq3EfoNMdLMA9l3f3fNrj/WS6CmHPF
	 kh70++FpaJWI7CLauF8EEVm/sWW2SzlAlw7zWmuSFiWtBnvoUV/eC2/Cr02YawQg8JCAH
	 89Wor6034B0EepCTDueLiV1GEKD9t9G6R0cq8r5JdEEVBQI+YS3o9acOMr0/1RlB8/nHE
	 LnARHi+v7rsJ67Q2ojvQlcPe2fzfSVTa/GxE23fkIXGBNC9/viXnjWEN0WuYtDIqptw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053227;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=gvzfQtktNOvyW5//7hoshdOp/1nMTLlb7Vs+HdmJRGk=;
	b=BU9CguDlaCkGzKak6Fqyh3pqpXXN94scYaQMcK6OAgpJgpUeQcSCyo35WFDafryYXiMo
	 7FHentdebLU7p2JeO1AjBs1n4AopgvOjSIzF/d1IJejgkhMq9QP4jCpDQp2uxS+xXuZsd
	 M1Spr21M9jtaS+7q6Dr5QfEA18mWKk+UpftKvROOIbJtZXCnqlEJF07zHBwxEA4xtFX4w
	 efI3v9VKPTYZ5qxFKtXoVi1LX9NgOOItU96zOdgwDES4cm6wMefZO9Tkid77YsSRoKacB
	 WwAC3FA68gvQVOXSLQPurPxEFlVpqsp389d+4+8aAMdgZzGtqv1lDtriAI/HGM2DanA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9A606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED9A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-547ae874949so2204008b6e.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053226; x=1795658026;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvzfQtktNOvyW5//7hoshdOp/1nMTLlb7Vs+HdmJRGk=;
        b=jfAwOKuMx3W8UtQ7YrH6PDnjnXtqDIAHdH74ThHY+FSg+jTVQaVdivSONuy5Ho7Ygd
         Hc8J0/pETJU990tLwJ1YI9er8D5pQWqMB1rc2af1YR4i4niOUsluhz40j+3P6Wdl5tCk
         FII5tfBLioSHHu6ABeWwiWxzQP2Foj85yUmykwfAKF6NYkz21R0COXL8P3kbHo6hje1R
         9Q/Hg95ToCm71dlzhzYmwMMZIq8YcGfxDZEF6Rm7GIJQJxpUSeeiwNjSBvwCFbaSy9HR
         v9h0NfdNkkz34gT5HA+embQnMBGhhmA+0b1Cd+Ad/DE2FGg28QCxHtVhCOj6puVh6E8b
         A5LA==
X-Forwarded-Encrypted: i=1; AL+hErEUVe041lPP70mJQ4v9890ws/mNLweE2Qsf0gMkdzddaeX8OY81NDvhgR33Kbn22QvAtDuOW+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rgP17KYGzlaTdEOmUOiRdmd2OmcuaNAFu/R8ct/lRpronX8m5
	0JBOtJzBKDF2Xwf8cQUU0l8ta+AcqdJVX5WqwjLg4jKsthRgaeKHP7R3DqT+vYkcreIX007Tirh
	MXqsjrxDBILQl13ndXwBDBWKSj38V6iJSEBc/w1QuKbqMVzDQqI7WzjpqIgo=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bca:b0:4f5:6fff:3ac4 with SMTP id
 5614622812f47-5774210f9e9mr6374727b6e.41.1795053226025; Wed, 18 Nov 2026
 17:53:46 -0800 (PST)
Date: Wed, 18 Nov 2026 17:53:46 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afe56aa.a11fe2ad.1b4426.0013.GAE@google.com>
Subject: [syzbot] [net?] possible deadlock in dump_user_range (2)
From: syzbot <syzbot+2c7890e1b866abfd5b29@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	edumazet@kernel.org, horms@kernel.org, idosch@nvidia.com, 
	kartikey406@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6ff4c5942a30 selftests: xsk: drop asm/barrier.h to fix the..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=13327f55580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8fbc480f13a2deb8
dashboard link: https://syzkaller.appspot.com/bug?extid=2c7890e1b866abfd5b29
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/19a1decfe3a7/disk-6ff4c594.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a2107fa0e744/vmlinux-6ff4c594.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b8eaf318e50d/bzImage-6ff4c594.xz

The issue was bisected by AI to candidate commits (most relevant first):

commit 9280e6edf65662b6aafc8b704ad065b54c08b519
Author: Deepanshu Kartikey <kartikey406@gmail.com>
Date:   Sun Jun 21 23:52:55 2026 +0000

    nbd: don't warn when reclassifying a busy socket lock

commit d532cddb6c6049ced414d64d83c6ce7149a6421a
Author: Eric Dumazet <edumazet@google.com>
Date:   Sat Jun 13 04:26:19 2026 +0000

    nbd: Reclassify sockets to avoid lockdep circular dependency

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=588ad3ef-1223-45f6-80bd-5f4520faf18e

AI-generated root cause summary:
In drivers/block/nbd.c, NBD takes an arbitrary userspace socket file descriptor
and attempts to reclassify its lockdep class from the standard sk_lock class to
sk_lock-*-NBD via nbd_reclassify_socket() in order to prevent false circular
dependencies with fs_reclaim. However, if another thread concurrently holds the
socket lock, sock_allow_reclassification() returns false, causing
nbd_reclassify_socket() to silently exit without reclassifying the socket, and
nbd_add_socket() proceeds without returning an error. Furthermore,
nbd_genl_reconnect_sock_cb() omits socket reclassification entirely. When
nsock->tx_lock subsequently acquires lock_sock() during
nbd_mark_nsock_dead()/sock_shutdown(), it takes the generic sk_lock-AF_INET6
lock while in the block I/O reclaim path, completing a circular dependency cycle
with sk_lock -> mmap_lock -> fs_reclaim -> block queue locks -> tx_lock.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=2c7890e1b866abfd5b29

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2c7890e1b866abfd5b29@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.4.8309/7688 is trying to acquire lock:
ffffffff90295020 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:316 [inline]
ffffffff90295020 (fs_reclaim){+.+.}-{0:0}, at: prepare_alloc_pages+0x149/0x5f0 mm/page_alloc.c:5152

but task is already holding lock:
ffff8880472f8340 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable include/linux/mmap_lock.h:625 [inline]
ffff8880472f8340 (&mm->mmap_lock){++++}-{4:4}, at: dump_user_range+0x1be/0xca0 fs/coredump.c:1583

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (&mm->mmap_lock){++++}-{4:4}:
       __might_fault+0xcb/0x130 mm/memory.c:7575
       _inline_copy_from_user include/linux/uaccess.h:169 [inline]
       _copy_from_user+0x28/0xb0 lib/usercopy.c:18
       copy_from_user include/linux/uaccess.h:222 [inline]
       csum_and_copy_from_user include/net/checksum.h:31 [inline]
       copy_from_user_iter_csum net/core/skbuff.c:7976 [inline]
       iterate_ubuf include/linux/iov_iter.h:30 [inline]
       iterate_and_advance2 include/linux/iov_iter.h:302 [inline]
       csum_and_copy_from_iter_full+0x210/0x2000 net/core/skbuff.c:7988
       ip_generic_getfrag+0x149/0x2d0 net/ipv4/ip_output.c:949
       __ip6_append_data+0x3b40/0x40c0 net/ipv6/ip6_output.c:1744
       ip6_append_data+0x108/0x270 net/ipv6/ip6_output.c:1899
       rawv6_sendmsg+0x1298/0x18c0 net/ipv6/raw.c:917
       sock_sendmsg_nosec+0x10f/0x190 net/socket.c:801
       __sock_sendmsg net/socket.c:818 [inline]
       ____sys_sendmsg+0x49f/0x790 net/socket.c:2713
       ___sys_sendmsg+0x2f8/0x3d0 net/socket.c:2770
       __sys_sendmsg net/socket.c:2802 [inline]
       __do_sys_sendmsg net/socket.c:2807 [inline]
       __se_sys_sendmsg net/socket.c:2805 [inline]
       __x64_sys_sendmsg+0x1b1/0x290 net/socket.c:2805
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #6 (sk_lock-AF_INET6){+.+.}-{0:0}:
       lock_sock_nested+0x41/0x100 net/core/sock.c:3938
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
       do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #5 (&nsock->tx_lock){+.+.}-{4:4}:
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

-> #4 (&cmd->lock){+.+.}-{4:4}:
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

-> #3 (set->srcu){.+.+}-{0:0}:
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

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
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
       do_syscall_64+0x16a/0x530 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&q->q_usage_counter(io)#51){++++}-{0:0}:
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

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       prepare_alloc_pages+0x149/0x5f0 mm/page_alloc.c:5152
       __alloc_frozen_pages_noprof+0x189/0x450 mm/page_alloc.c:5477
       alloc_pages_mpol+0x21e/0x390 mm/mempolicy.c:2513
       alloc_frozen_pages_noprof mm/mempolicy.c:2584 [inline]
       alloc_pages_noprof+0xb1/0x2b0 mm/mempolicy.c:2604
       pagetable_alloc_noprof include/linux/mm.h:3953 [inline]
       __pte_alloc_one_noprof include/asm-generic/pgalloc.h:76 [inline]
       pte_alloc_one+0x22/0x370 arch/x86/mm/pgtable.c:18
       do_fault_around mm/memory.c:6064 [inline]
       do_read_fault mm/memory.c:6103 [inline]
       do_fault mm/memory.c:6246 [inline]
       do_pte_missing+0x1358/0x3570 mm/memory.c:4778
       handle_pte_fault mm/memory.c:6665 [inline]
       __handle_mm_fault mm/memory.c:6817 [inline]
       handle_mm_fault+0x1807/0x2f80 mm/memory.c:6984
       faultin_page mm/gup.c:1130 [inline]
       __get_user_pages+0x102b/0x1ea0 mm/gup.c:1432
       __get_user_pages_locked mm/gup.c:1696 [inline]
       get_dump_page+0x1b5/0x410 mm/gup.c:2211
       dump_user_range+0x208/0xca0 fs/coredump.c:1595
       elf_core_dump+0x346a/0x3a70 fs/binfmt_elf.c:2106
       coredump_write fs/coredump.c:1150 [inline]
       do_coredump+0x5ed1/0x6a60 fs/coredump.c:1237
       vfs_coredump+0xac3/0x10c0 fs/coredump.c:1312
       get_signal+0x11d1/0x1430 kernel/signal.c:3098
       arch_do_signal_or_restart+0xbb/0x860 arch/x86/kernel/signal.c:337
       __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
       exit_to_user_mode_loop+0x10e/0x770 kernel/entry/common.c:101
       __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
       syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
       syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
       do_syscall_64+0x32c/0x530 arch/x86/entry/syscall_64.c:107
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> sk_lock-AF_INET6 --> &mm->mmap_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(&mm->mmap_lock);
                               lock(sk_lock-AF_INET6);
                               lock(&mm->mmap_lock);
  lock(fs_reclaim);

 *** DEADLOCK ***

locks held by syz.4.8309/7688: 2, on CPU#0:
 #0: ffff88802824c478 (sb_writers#5){.+.+}-{0:0}, at: vfs_coredump+0xac3/0x10c0 fs/coredump.c:1312
 #1: ffff8880472f8340 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable include/linux/mmap_lock.h:625 [inline]
 #1: ffff8880472f8340 (&mm->mmap_lock){++++}-{4:4}, at: dump_user_range+0x1be/0xca0 fs/coredump.c:1583

stack backtrace:
CPU: 0 UID: 0 PID: 7688 Comm: syz.4.8309 Not tainted syzkaller #0 PREEMPT(full) 
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
 __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
 fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4389
 might_alloc include/linux/sched/mm.h:316 [inline]
 prepare_alloc_pages+0x149/0x5f0 mm/page_alloc.c:5152
 __alloc_frozen_pages_noprof+0x189/0x450 mm/page_alloc.c:5477
 alloc_pages_mpol+0x21e/0x390 mm/mempolicy.c:2513
 alloc_frozen_pages_noprof mm/mempolicy.c:2584 [inline]
 alloc_pages_noprof+0xb1/0x2b0 mm/mempolicy.c:2604
 pagetable_alloc_noprof include/linux/mm.h:3953 [inline]
 __pte_alloc_one_noprof include/asm-generic/pgalloc.h:76 [inline]
 pte_alloc_one+0x22/0x370 arch/x86/mm/pgtable.c:18
 do_fault_around mm/memory.c:6064 [inline]
 do_read_fault mm/memory.c:6103 [inline]
 do_fault mm/memory.c:6246 [inline]
 do_pte_missing+0x1358/0x3570 mm/memory.c:4778
 handle_pte_fault mm/memory.c:6665 [inline]
 __handle_mm_fault mm/memory.c:6817 [inline]
 handle_mm_fault+0x1807/0x2f80 mm/memory.c:6984
 faultin_page mm/gup.c:1130 [inline]
 __get_user_pages+0x102b/0x1ea0 mm/gup.c:1432
 __get_user_pages_locked mm/gup.c:1696 [inline]
 get_dump_page+0x1b5/0x410 mm/gup.c:2211
 dump_user_range+0x208/0xca0 fs/coredump.c:1595
 elf_core_dump+0x346a/0x3a70 fs/binfmt_elf.c:2106
 coredump_write fs/coredump.c:1150 [inline]
 do_coredump+0x5ed1/0x6a60 fs/coredump.c:1237
 vfs_coredump+0xac3/0x10c0 fs/coredump.c:1312
 get_signal+0x11d1/0x1430 kernel/signal.c:3098
 arch_do_signal_or_restart+0xbb/0x860 arch/x86/kernel/signal.c:337
 __exit_to_user_mode_loop kernel/entry/common.c:66 [inline]
 exit_to_user_mode_loop+0x10e/0x770 kernel/entry/common.c:101
 __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
 syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:230 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:343 [inline]
 do_syscall_64+0x32c/0x530 arch/x86/entry/syscall_64.c:107
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb5501a9559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb551096028 EFLAGS: 00000246 ORIG_RAX: 0000000000000141
RAX: 0000000000000000 RBX: 00007fb550426090 RCX: 00007fb5501a9559
RDX: 0000000000000048 RSI: 0000200000000600 RDI: 000000000000000a
RBP: 00007fb550238136 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fb550426128 R14: 00007fb550426090 R15: 00007fff1ba3bf68
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
