Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183419;
	b=0CMWVKzTtW5XbR1PVcpzwqcXRyUBBUAo+Nz9LDeLWn85Xt2xRkrUkwhSyxVSy5YNL11x
	 rwewINVpDlyev5Jp5ZKx0PpYtIkUxwKAh5yuhpTKkMPz2gmg1OFLFOR+8VWXXUE4Z/Vhh
	 b9nDRXVEcJGNOHijUeZyf1TNYTKDXtqItRaSoWFqLBsfRDsWQrpG1s3nyxkj44bn41VUg
	 XspjzKNFdjWWtD14KTE2MHCJhtMeyVM2khSCHSsMeegB2vIk7/kkl1fVGhBgf2K/u0ZyZ
	 me90GE5L68snqiRNif7yJfWSB6Yjvlg6kADXkzsFrrKqmxtK7oGlt4djfrW2OOz9lWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183419;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=4+syWqY/lnxKoYS1jvcWWXvKjEtqhzboTnziuyBrgao=;
	b=gBHiCTj/gLm6LTkKDp0Jiad/FCQCB8XyTjcZ0laxyKWcYW3Pn2+KUIf4obJQxSg3vHLB
	 29oPa9leagw6ZPrC8Vmo8XPqLpRT7ylTnyaTXb9dyaw/cE+V7E+vOi/PH5jF41diotf0Y
	 me2TXTkIxs21Q62CBcjTfySLkDib8XMZNs8WUIG+FQFOWZ7tvKfwSD1h6+TTdqzj/Mk2g
	 ypZkxnEslM+8pmPA7z9NYFzQcocg+d5VJ/hR3/pqkCOqmV0CQiqgdmFlPglZcXJceyWO4
	 HYJE5gFbnFIaT+Z2yVhtAh5xVO1Ol2rb0dRqY1CLu0vdL2jx8wBjp3LNoCtTlV0YQNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66E606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B66E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4db3db8687fso1229781b6e.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183418; x=1795788218;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4+syWqY/lnxKoYS1jvcWWXvKjEtqhzboTnziuyBrgao=;
        b=R0Uquaamph9yxdyEtMNekoTd7CubRMPk10sfy4LW/I5IEp6Ehx1x9Yk1774QjF8DtG
         +lFMGxUQwo29HzyKW5Le/nnZkFXkb/d4T5liHvaqQPvLhcJ+TmJhnlH/BHCH1dToHFiv
         jcYdQBkPa7NcNOMWn3drwz1RRKZZrcFmd6qeCLZTGeZVNaSV5jV/c4+ph7cN596dvWQ7
         AA6BOoE2dhqOMlu/XzDEIAJOQAX5PvLDkhu5kNWa9P/kV6mRcwD/2nQwbyHAwHse2kdN
         +kRwnptvt+y4IA6teqnpHFKjD191z84pYuj0uGJmkHUXJYCpJnYTsh07KbK8xKd85OhI
         OtFw==
X-Forwarded-Encrypted: i=1; AL+hErGh7ShEbsauC3OQLtBtjwIIXNaGiamyEPMNbgXbc6BNikBH1QIHYRbl5StaNayeU2I0yPX2ulY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2vCG0SgBVMe84/ygK4eY/f9ojNVJUxdQtj5mPFK4ay03azhbX
	jH0LVpHFE6r2TzBA6qgdPTqtyPvxoukGCwMAoTYwUvw/luANyTYJxIH/eyFyzhDhizti78dH7H4
	7oGHZLfkO6Q1wWyaChi/feq4HJFo2kZnN63MRCX0Vlgcb/RVXqEU5Y+5WrX8=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3384:b0:4f3:6c2b:5f22 with SMTP id
 5614622812f47-57a0b44a292mr3448839b6e.29.1795183417909; Fri, 20 Nov 2026
 06:03:37 -0800 (PST)
Date: Fri, 20 Nov 2026 06:03:37 -0800
In-Reply-To: <6afadb28.371d364b.254eb1.0017.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b005339.800a86e2.12ce6f.0001.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in add_ext_adv_params_complete
From: syzbot <syzbot+fc55a609cd9deea4ea37@syzkaller.appspotmail.com>
To: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lm0963hack@gmail.com, luiz.dentz@gmail.com, luiz.von.dentz@intel.com, 
	marcel@holtmann.org, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0742ef27cd72 net: pcs: xpcs: add 10000baseCR_Full to 10GBA..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=163bc2bd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2d0fd941bcd2fb5
dashboard link: https://syzkaller.appspot.com/bug?extid=fc55a609cd9deea4ea37
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ae1bbe580000

The issue was bisected by AI to:

commit 1c66bee492a5fe00ae3fe890bb693bfc99f994c6
Author: Min Li <lm0963hack@gmail.com>
Date:   Sat Mar 4 13:50:35 2023 +0000

    Bluetooth: Fix race condition in hci_cmd_sync_clear

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=5984fd05-f227-4d9b-91df-08015fba0856

AI-generated root cause summary:
An ABBA circular locking dependency exists between hdev->lock and
hdev->cmd_sync_work_lock in the Bluetooth subsystem. Callers holding
hci_dev_lock(hdev) (such as MGMT command handlers and HCI event handlers)
acquire hdev->cmd_sync_work_lock when enqueuing or looking up cmd_sync work via
hci_cmd_sync_queue()/hci_cmd_sync_queue_once(). Conversely, hci_cmd_sync_clear()
(and related cancellation paths in net/bluetooth/hci_sync.c) acquires
hdev->cmd_sync_work_lock and calls _hci_cmd_sync_cancel_entry(), which invokes
entry->destroy (e.g. add_ext_adv_params_complete) while still holding
hdev->cmd_sync_work_lock. Because entry->destroy attempts to acquire
hci_dev_lock(hdev), this inverts the lock hierarchy and causes a deadlock.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=fc55a609cd9deea4ea37

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fc55a609cd9deea4ea37@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: 1c66bee492a5 ("Bluetooth: Fix race condition in hci_cmd_sync_clear")

Bluetooth: MGMT ver 1.23
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor256/6049 is trying to acquire lock:
ffff8880206f00b8 (&hdev->lock){+.+.}-{4:4}, at: add_ext_adv_params_complete+0xd5/0x890 net/bluetooth/mgmt.c:9253

but task is already holding lock:
ffff8880206f07c0 (&hdev->cmd_sync_work_lock){+.+.}-{4:4}, at: hci_cmd_sync_clear+0xfb/0x3f0 net/bluetooth/hci_sync.c:684

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&hdev->cmd_sync_work_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       hci_cmd_sync_lookup_entry net/bluetooth/hci_sync.c:871 [inline]
       hci_cmd_sync_queue_once+0x42/0x250 net/bluetooth/hci_sync.c:808
       hci_update_passive_scan+0x1bf/0x210 net/bluetooth/hci_sync.c:3596
       le_conn_complete_evt+0xee9/0x18d0 net/bluetooth/hci_event.c:6106
       hci_le_conn_complete_evt+0x187/0x470 net/bluetooth/hci_event.c:6117
       hci_event_func net/bluetooth/hci_event.c:8104 [inline]
       hci_event_packet+0x67a/0xf10 net/bluetooth/hci_event.c:8158
       hci_rx_work+0x2b4/0x1110 net/bluetooth/hci_core.c:4156
       process_one_work kernel/workqueue.c:3495 [inline]
       process_scheduled_works+0xc3d/0x1630 kernel/workqueue.c:3578
       worker_thread+0xa47/0xfb0 kernel/workqueue.c:3659
       kthread+0x38b/0x480 kernel/kthread.c:436
       ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (&hdev->lock){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       add_ext_adv_params_complete+0xd5/0x890 net/bluetooth/mgmt.c:9253
       _hci_cmd_sync_cancel_entry net/bluetooth/hci_sync.c:669 [inline]
       hci_cmd_sync_clear+0x1b4/0x3f0 net/bluetooth/hci_sync.c:686
       hci_unregister_dev+0x1b4/0x5c0 net/bluetooth/hci_core.c:2703
       vhci_release+0x182/0x1d0 drivers/bluetooth/hci_vhci.c:709
       __fput+0x408/0xa40 fs/file_table.c:512
       fput_close_sync+0x11f/0x240 fs/file_table.c:618
       filp_close_sync fs/open.c:1574 [inline]
       __do_sys_close fs/open.c:1597 [inline]
       __se_sys_close+0xa2/0x160 fs/open.c:1584
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&hdev->cmd_sync_work_lock);
                               lock(&hdev->lock);
                               lock(&hdev->cmd_sync_work_lock);
  lock(&hdev->lock);

 *** DEADLOCK ***

locks held by syz-executor256/6049: 1, on CPU#1:
 #0: ffff8880206f07c0 (&hdev->cmd_sync_work_lock){+.+.}-{4:4}, at: hci_cmd_sync_clear+0xfb/0x3f0 net/bluetooth/hci_sync.c:684

stack backtrace:
CPU: 1 UID: 0 PID: 6049 Comm: syz-executor256 Not tainted syzkaller #0 PREEMPT(full) 
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
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
 add_ext_adv_params_complete+0xd5/0x890 net/bluetooth/mgmt.c:9253
 _hci_cmd_sync_cancel_entry net/bluetooth/hci_sync.c:669 [inline]
 hci_cmd_sync_clear+0x1b4/0x3f0 net/bluetooth/hci_sync.c:686
 hci_unregister_dev+0x1b4/0x5c0 net/bluetooth/hci_core.c:2703
 vhci_release+0x182/0x1d0 drivers/bluetooth/hci_vhci.c:709
 __fput+0x408/0xa40 fs/file_table.c:512
 fput_close_sync+0x11f/0x240 fs/file_table.c:618
 filp_close_sync fs/open.c:1574 [inline]
 __do_sys_close fs/open.c:1597 [inline]
 __se_sys_close+0xa2/0x160 fs/open.c:1584
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd736358be
Code: 08 0f 85 55 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 56 41 55 49 89 fd 48 89 d7 41 54 41 89 cc 55 48 89 f5 53
RSP: 002b:00007ffe530b8c28 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 000055557f5ed400 RCX: 00007fcd736358be
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007ffe530b8cd0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007fcd736af5a0 R15: 0000000000000002
 </TASK>
