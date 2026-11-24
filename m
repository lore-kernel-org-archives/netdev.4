Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553086;
	b=YQpjfJ4UcugnXOTCx7OwWLloSlIP50AEPVOtdRB7st4Sis0REt/ngzVEusOYIVWHSIVd
	 BKLBoG18/IMTcJm38qdm/KWdhhBeP1ZbGNvca12CEli4CSTKAFIe9zPcZcgtOlqORuwBn
	 QNWMel2oEDBoXD0XmfQ1sOzSSm9/LE0e/s2lg50LU0qLx8ZwmEWL5YpJkwE3nloZd0dcr
	 K0j6FV0P7KMIPT92S3mC0Zv4tjevHzqWW1EXIYKfmpRFE3u7xBKGuzYGk2Qt7XVsuGWh/
	 lCNHa+ZZm20lui3oWwHXH6bl+Rpcbp2vF4++akHdX2QGggLf9giNZFW/wMYT/MNOqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553086;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=S6IK/eQSPXmy8NKFSPevPiw8R+a5bSKtcPkmMVukDls=;
	b=IucF76YE3Yz+C7Ow6ZOwPSesguFoTCz1IvcPTvdEqbZ94APJ3gjtWqnmek+kVLGtGitT
	 XOcyW2sCNEOGH+0cgTGZeZbqOw/w2sICAdzM3Ll3Y8AXXKw2JwOB7VfkWYrqRqUibq/Lo
	 D3KEj4HeK9riAolNzuZvQdloQw8aCzOoAffjd87NOR6lDy13bkSIVIbPV5vzC4CZTm2wW
	 qXUzY5JeOdHGGIKdV841Mx0y++/1OnqyzpkDcI/ZAPPsGhu/JIpBs+9RVDYqeWAEWaSSB
	 w7aVDwNwkom3N58CtonqD+XfURIvHLRsfSZbelulvJ2A0o2VQWFAjUaHPVw0Zp5a3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21012606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21012606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso3940791fac.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553085; x=1796157885;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6IK/eQSPXmy8NKFSPevPiw8R+a5bSKtcPkmMVukDls=;
        b=ZfjV0H5T6fiGMBg/CYcS4sOgYiZG4lK/HEG95TFK2iHkO5kPA+1MeeWVoGnGW1gZtr
         avI7KhxBdEOJ8xs9iXkLIIRow2mnwqysRY67c/QklXdD83GIJr5xrnQXT+TeExhYiyMW
         uExjU2how6wvUceIxrmSRFgiJFxGrvxVQcxrkMqFuvaZMRku4vxI7DOZJyI4veKoyxek
         Qo9HEJs45KXUPJE5u9c2zPwAZ57cDTNUp+CFsRTs92KBi6L0ZtCqq5DbqE+M8spfWvry
         hfNdJc6GVLXY1yV6lYw1+Tkwpvs4NJX9vbV+7v+oWhmuhGHWekv84bWaEQTxHHTpzMC1
         eLKg==
X-Forwarded-Encrypted: i=1; AL+hErGIxwf+y4WEgm5cu2rPmHy0/zv03yWeWW/8QE1wlfKRe8dV/YKLNqz971dTnGI/eAPLVXUHCKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e+e0DsfdgBuBEdqu15qq/ZGvbHpd4ddc8cbGsM4todWYiusAo
	/XNVjq6r8FZtxZ27KXnrVQVuomCDOosL6+W/OvAR4tYdpAhxtxFHB65T1Jz2o57nDaRb+ZkbtSh
	Qb7fBaHBTa4GU7xDIcHpINMjhKgk1r4rIJPrp9zjpoKVeQmKPTw/kBj+diHA=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3193:b0:4cb:f21c:a794 with SMTP id
 5614622812f47-57a0ac257d3mr17297111b6e.28.1795553085174; Tue, 24 Nov 2026
 12:44:45 -0800 (PST)
Date: Tue, 24 Nov 2026 12:44:45 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b05f73d.3f72aad1.34e135.0011.GAE@google.com>
Subject: [syzbot] [net?] inconsistent lock state in tap_sock_destruct
From: syzbot <syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	jasowang@redhat.com, jasowangio@gmail.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    65e4fd942f72 Merge tag 'selinux-pr-20261119' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15fbc4ff980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10a298e9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b2d46d580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/98fce4d0b21b/non_bootable_disk-65e4fd94.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8915d3e3fec0/vmlinux-65e4fd94.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1adab97839ca/bzImage-65e4fd94.xz

The issue was bisected by AI to:

commit 362899b8725b35e32802882c67f99cbf42bce2af
Author: Jason Wang <jasowang@redhat.com>
Date:   Fri Jul 15 07:46:31 2016 +0000

    macvtap: switch to use skb array

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=7efe4b40-c5a8-4d41-b3fb-f1798f272e25

AI-generated root cause summary:
In drivers/net/tap.c, tap_sock_destruct() calls ptr_ring_cleanup(&q->ring,
__skb_array_destroy_skb), which drains the ring via ptr_ring_consume() and
acquires &q->ring.consumer_lock with plain spin_lock() (without disabling
softirqs/BH). Because tap_alloc_skb() attaches transmitted sk_buffs to &q->sk
via sock_alloc_send_pskb() -> skb_set_owner_w(), an in-flight TX skb can outlive
tap_release() -> tap_put_queue() and later drop the final sk_wmem_alloc
reference in softirq context via sock_wfree() -> __sk_free() -> sk_destruct() ->
__sk_destruct() -> tap_sock_destruct(). Since &q->ring.consumer_lock is normally
acquired with plain spin_lock() in process context (e.g., tap_do_read(),
tap_peek_len(), or synchronous tap_sock_destruct() in tap_release()), acquiring
it in softirq context violates lockdep's {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} rule.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=a2220efe757ca2a7358d

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 362899b8725b ("macvtap: switch to use skb array")

================================
WARNING: inconsistent lock state
syzkaller #0 Not tainted
--------------------------------
inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
syz.0.18/6057 [HC0[0]:SC0[0]:HE1:SE1] takes:
ffff888053358720 (&r->consumer_lock#4){+.?.}-{3:3}, at: spin_lock include/linux/spinlock.h:347 [inline]
ffff888053358720 (&r->consumer_lock#4){+.?.}-{3:3}, at: ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
ffff888053358720 (&r->consumer_lock#4){+.?.}-{3:3}, at: ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
ffff888053358720 (&r->consumer_lock#4){+.?.}-{3:3}, at: tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
{IN-SOFTIRQ-W} state was registered at:
  lock_acquire kernel/locking/lockdep.c:5942 [inline]
  lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
  __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
  _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
  spin_lock include/linux/spinlock.h:347 [inline]
  ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
  ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
  tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
  __sk_destruct+0x85/0xb70 net/core/sock.c:2386
  sk_destruct+0xc8/0xf0 net/core/sock.c:2448
  __sk_free+0xf4/0x3e0 net/core/sock.c:2459
  sock_wfree+0x254/0x7f0 net/core/sock.c:2754
  skb_release_head_state+0x35f/0x400 net/core/skbuff.c:1167
  skb_release_all net/core/skbuff.c:1187 [inline]
  __kfree_skb net/core/skbuff.c:1203 [inline]
  sk_skb_reason_drop+0xc4/0x1b0 net/core/skbuff.c:1242
  kfree_skb_reason include/linux/skbuff.h:1330 [inline]
  kfree_skb include/linux/skbuff.h:1339 [inline]
  llc_rcv+0x4d5/0xa70 net/llc/llc_input.c:112
  __netif_receive_skb_one_core+0x1b2/0x1e0 net/core/dev.c:6451
  __netif_receive_skb+0x1f/0x120 net/core/dev.c:6564
  process_backlog+0x487/0x1600 net/core/dev.c:6915
  __napi_poll.constprop.0+0xaf/0x450 net/core/dev.c:8001
  napi_poll net/core/dev.c:8064 [inline]
  net_rx_action+0xa40/0xf20 net/core/dev.c:8221
  handle_softirqs+0x216/0xa20 kernel/softirq.c:669
  run_ksoftirqd kernel/softirq.c:1133 [inline]
  run_ksoftirqd+0x38/0x60 kernel/softirq.c:1125
  smpboot_thread_fn+0x41f/0xb90 kernel/smpboot.c:162
  kthread+0x373/0x450 kernel/kthread.c:436
  ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
irq event stamp: 2807
hardirqs last  enabled at (2807): [<ffffffff81d94222>] raw_spin_rq_unlock_irq kernel/sched/sched.h:1739 [inline]
hardirqs last  enabled at (2807): [<ffffffff81d94222>] finish_lock_switch kernel/sched/core.c:5315 [inline]
hardirqs last  enabled at (2807): [<ffffffff81d94222>] finish_task_switch.isra.0+0x2c2/0x10d0 kernel/sched/core.c:5433
hardirqs last disabled at (2806): [<ffffffff8bf2b378>] __schedule+0x2ec8/0x7de0 kernel/sched/core.c:7237
softirqs last  enabled at (2774): [<ffffffff81cbcddf>] do_softirq kernel/softirq.c:569 [inline]
softirqs last  enabled at (2774): [<ffffffff81cbcddf>] do_softirq+0xaf/0xf0 kernel/softirq.c:556
softirqs last disabled at (2221): [<ffffffff81cbcddf>] do_softirq kernel/softirq.c:569 [inline]
softirqs last disabled at (2221): [<ffffffff81cbcddf>] do_softirq+0xaf/0xf0 kernel/softirq.c:556

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&r->consumer_lock#4);
  <Interrupt>
    lock(&r->consumer_lock#4);

 *** DEADLOCK ***

locks held by syz.0.18/6057: 0, on CPU#2

stack backtrace:
CPU: 2 UID: 0 PID: 6057 Comm: syz.0.18 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_usage_bug.part.0+0x258/0x340 kernel/locking/lockdep.c:4086
 print_usage_bug kernel/locking/lockdep.c:4054 [inline]
 valid_state kernel/locking/lockdep.c:4100 [inline]
 mark_lock_irq kernel/locking/lockdep.c:4311 [inline]
 mark_lock+0x956/0x1020 kernel/locking/lockdep.c:4797
 mark_usage kernel/locking/lockdep.c:4710 [inline]
 __lock_acquire+0x8e2/0x1f40 kernel/locking/lockdep.c:5242
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __raw_spin_lock include/linux/spinlock_api_smp.h:190 [inline]
 _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
 spin_lock include/linux/spinlock.h:347 [inline]
 ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
 ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
 tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
 __sk_destruct+0x85/0xb70 net/core/sock.c:2386
 sk_destruct+0xc8/0xf0 net/core/sock.c:2448
 __sk_free+0xf4/0x3e0 net/core/sock.c:2459
 sk_free+0x61/0x90 net/core/sock.c:2470
 sock_put include/net/sock.h:2024 [inline]
 tap_put_queue drivers/net/tap.c:179 [inline]
 tap_release+0x2fc/0x450 drivers/net/tap.c:517
 __fput+0x3fb/0xb50 fs/file_table.c:512
 fput_close_sync+0x118/0x250 fs/file_table.c:618
 filp_close_sync+0x75/0xa0 fs/open.c:1574
 __range_close+0x4a6/0x8b0 fs/file.c:919
 __do_sys_close_range fs/file.c:1003 [inline]
 __se_sys_close_range fs/file.c:954 [inline]
 __x64_sys_close_range+0x1f8/0x430 fs/file.c:954
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x7b0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f56833a9559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffceb470b88 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: ffffffffffffffda RBX: 00007ffceb470c70 RCX: 00007f56833a9559
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00000000000100ee R08: 0000000000000001 R09: 0000000000000000
R10: 0000001b30d20000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f5683625fac R14: 00007f5683625fa8 R15: 00007f5683625fa0
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
