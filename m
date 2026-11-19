Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050944;
	b=f37BMBFZguZ5Ts9ZuFxi5PW4x/hEl104FhOZmkIXPZ35FpsVTl+3VXg2ZPgKpWF2ceB9
	 P3UmgeOekLUlGFaXVsFBtd7vBRNy8hC+OZTn1KCaDoIwy8tuHbqgAESHgDZ7+jDyEzHpy
	 8TN8J72rc2vA4ZkglX5AK/kr9mIPRnAKxRYG0VC0z6hd+7aePOIVLnKKqkyHQyokX4Tc5
	 1Td3gklCVSMqxRKlhoaKm3f9BkJLKxFqSafCtFSwtCBig3sSFOiLUHVNxS/ud/eiHVie1
	 H8BRUCR+h1v40OI6C6JA8JbmB/d/MmvJx7tAB2JYnGcogyCoUrFEhQRSvhz5YOTZxrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=R6Cb7o409qkbHnmedbWLlgtjDrV1DNM3uP2xpXoQHOA=;
	b=Tr3eUqIVK3wEgBAeAhqUT15vDyNMXTRViMVjHJEEXJr/qzVuEPTp6xEtkZuCX3LOhtBI
	 jnme9kClyMcWEE5iVyGwGVvVEETPCGoOmTw7GtdlAZW6fvahy+wQpleTJqS/XF4iSOUh8
	 Z83i6D4LdRKhSvnvJPPQfH3lrzMg3I1Yde/iBAo8djdq17B9d+Jj40dyVdRzksr7pYydK
	 5outhBorZLzNuVQQOeWsUDCYwdbCn4Mldk6xJrPqtvoyoF5sEoqJDqrOoKO1fgMtbpaF8
	 KcAViM2GlE2U23kVcE3wZ/jO4I4o+6c14U2Gu8XnnBsJqTxOIEH7es49p8qrpMyl0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DE6606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44DE6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab8b4887d4so1040813b6e.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050943; x=1795655743;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6Cb7o409qkbHnmedbWLlgtjDrV1DNM3uP2xpXoQHOA=;
        b=LEjcJaZ4ZRQZ5OBFw86IkTgVk63/0tF0r3J09NYwbi4AEpvtOyrT/s8ZqDgOgBl14S
         Kb9d13Jn3YlYpsnACAA86Nzb+eH4lgLSHPbmGRerFygruimnET8hI7OME/imkfIOeM/s
         VeiNZQ5dh0OFyS00niw+EpY6E12/L+01BqxdgH94VAhhccNHfldKH5Dikj2KJXZgqXdF
         /Za8td5/EglgD+p+O3NTPCiAJOAv2CyfW0RhNmmsNmN12cEQlXdo9VwdMnpjX6G657xC
         ah1d9IU99LzCbLocmjQTVfHRiKaKRdcz8tZHhrQdn3jRzAqefc0ZMVVzynkW/IQLaoHM
         hMlA==
X-Forwarded-Encrypted: i=1; AL+hErH6mL3UzyyOtfnVtElNfIvcpK/9G6gVx+JNplitAx/OwQ59OiE+5jU0ocqRtERG2HTeLLP6wUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jkUDDw+UZOioPTZ4Uvv8wzd6ZoF/PBFDQ8uc9+uc9As+Vocdj
	840Ee3uNsufqfNWLLmcJmmOTYHfgJ9p6e97lSL4/cRcTGJEnGY7TlIW3Hz8TR/7B3l7YaWWgSwR
	nGsiyE23kXUB3HkKUQW8Fd423/DHFlw9xReGnCXnaq9o2DTd/aLvfqE1pqFI=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4441:b0:573:52b1:bb02 with SMTP id
 5614622812f47-5773e047425mr5959097b6e.66.1795050943262; Wed, 18 Nov 2026
 17:15:43 -0800 (PST)
Date: Wed, 18 Nov 2026 17:15:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afe4dbf.a11fe2ad.1b4426.0011.GAE@google.com>
Subject: [syzbot] [net?] KCSAN: data-race in bpf_map_update_value / bpf_sk_storage_free
From: syzbot <syzbot+30dc80192107a6515bb5@syzkaller.appspotmail.com>
To: ameryhung@gmail.com, ast@kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, horms@kernel.org, josef@toxicpanda.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    666539eecdf4 Merge tag 'assoc-array-fixes-v2'
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12be594d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b949a9d3c1d44ceb
dashboard link: https://syzkaller.appspot.com/bug?extid=30dc80192107a6515bb5
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a943b9915869/disk-666539ee.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9bfd839d7ea5/vmlinux-666539ee.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0f20b9720a71/bzImage-666539ee.xz

AI-generated root cause summary:
A KCSAN data race occurs between task context and softirq context on the 2-byte
field current->migration_disabled. While a syscall thread in
bpf_map_update_value() calls migrate_disable() -> __migrate_disable(), it
disables preemption via guard(preempt)() and performs a plain store to
current->migration_disabled = 1. Preempt disable does not mask hardware
interrupts, allowing a timer interrupt on the same CPU to run softirq RCU
callbacks on irq exit, which invokes socket destruction (__sk_destruct() ->
bpf_sk_storage_free()). In bpf_sk_storage_free(), rcu_read_lock_dont_migrate()
unnecessarily invokes migrate_disable() in softirq context, re-entering
__migrate_disable() and reading current->migration_disabled concurrently with
the interrupted plain store.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=30dc80192107a6515bb5

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+30dc80192107a6515bb5@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in bpf_map_update_value / bpf_sk_storage_free

read to 0xffff888101d295b8 of 2 bytes by interrupt on cpu 1:
 __migrate_disable include/linux/sched.h:2483 [inline]
 migrate_disable include/linux/sched.h:2512 [inline]
 rcu_read_lock_dont_migrate include/linux/rcupdate.h:990 [inline]
 bpf_sk_storage_free+0x2b/0x210 net/core/bpf_sk_storage.c:52
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
 native_pause arch/x86/include/asm/vdso/processor.h:13 [inline]
 delay_tsc+0x43/0xa0 arch/x86/lib/delay.c:76
 udelay include/asm-generic/delay.h:64 [inline]
 delay_access kernel/kcsan/core.c:332 [inline]
 kcsan_setup_watchpoint+0x255/0x3f0 kernel/kcsan/core.c:622
 __migrate_disable include/linux/sched.h:2496 [inline]
 migrate_disable include/linux/sched.h:2512 [inline]
 bpf_disable_instrumentation include/linux/bpf.h:2875 [inline]
 bpf_map_update_value+0x1cf/0x570 kernel/bpf/syscall.c:270
 generic_map_update_batch+0x4e6/0x700 kernel/bpf/syscall.c:2125
 bpf_map_do_batch+0x26a/0x3b0 kernel/bpf/syscall.c:5849
 __sys_bpf+0x784/0xc50 kernel/bpf/syscall.c:-1
 __do_sys_bpf kernel/bpf/syscall.c:6582 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:6579 [inline]
 __x64_sys_bpf+0x69/0x80 kernel/bpf/syscall.c:6579
 x64_sys_call+0xf26/0x2550 arch/x86/include/generated/asm/syscalls_64.h:322
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

write to 0xffff888101d295b8 of 2 bytes by task 12002 on cpu 1:
 __migrate_disable include/linux/sched.h:2496 [inline]
 migrate_disable include/linux/sched.h:2512 [inline]
 bpf_disable_instrumentation include/linux/bpf.h:2875 [inline]
 bpf_map_update_value+0x1cf/0x570 kernel/bpf/syscall.c:270
 generic_map_update_batch+0x4e6/0x700 kernel/bpf/syscall.c:2125
 bpf_map_do_batch+0x26a/0x3b0 kernel/bpf/syscall.c:5849
 __sys_bpf+0x784/0xc50 kernel/bpf/syscall.c:-1
 __do_sys_bpf kernel/bpf/syscall.c:6582 [inline]
 __se_sys_bpf kernel/bpf/syscall.c:6579 [inline]
 __x64_sys_bpf+0x69/0x80 kernel/bpf/syscall.c:6579
 x64_sys_call+0xf26/0x2550 arch/x86/include/generated/asm/syscalls_64.h:322
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 12002 Comm: syz.0.4076 Not tainted syzkaller #0 PREEMPT(lazy) 
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
