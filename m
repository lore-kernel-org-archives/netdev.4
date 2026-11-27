Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772396;
	b=QkyOStZzfZfOMQWy/RrWpaVdpP1CpTbRzctRRncLjnG/JAVaBezkRgjqO82IHbiwNP7U
	 YjvZc/I5ihwFbFVa/clARRXXUDCvHQsejmfIWKQbWbNs1Xtn9tm1bdHMMybbHq+7mamto
	 sh79gxJXeS+ZVMrXukpTJL4Tadw+3lwSzIa3wkBHV8DU6GWGXXH1ZTxBjEgL5d+Sk/EoC
	 NNFht6bmMe15ypsBkvz77TSllIBO/E1D1Hszf55hEuabkWXIExzF7V1eXfx749mQKR7Zh
	 mK2qaVyieg0n4lhMQQZdBPw+pkmBZIkMrYmvPZWx+ysPhsBQCz7dm8w+SEDY7FQqeFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772396;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=q27QeHoS7UR2882yH+xfPYckzF6Be62Y/DrY6dpeN0c=;
	b=JzNWY0dZzk2jrzP4ceyNum/Wp937XvckqNJsQE04Qd1kuG/t46o5tjpRGEvjlsnoKZ96
	 hQ+O21QdjbKPVU05OXga61oXxKs65iEC585SDqwjtXrZUAFLveM5z8yBi42fq9J8Zf3mp
	 5AXFSaPoqSSqaYji3gIZkBH3SpjdumPJrxGVAM90h/6Qh3zISUzg0m5UKOI/BZB3OZRWI
	 bR+9stCByI41wXOyZtlahmeQ/kA+tMDR+/IiF/OFOlGiG8RU2vfhPmVNUV7Rq7OIdiUnT
	 Up+h1uRqYrEOmcN+HhJQIIha5JSUTHEyFVMUqssGTGNnKDHlJK5d1dT7+pV+eKcd+KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF2A606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF2A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso8411071b6e.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772395; x=1796377195;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q27QeHoS7UR2882yH+xfPYckzF6Be62Y/DrY6dpeN0c=;
        b=1dZqSPxwV256rWb+2yBhyG8CLtqCQ7AspUJ9cN2q8uNyPI91vzugd5Ct+zJ+vyqKda
         HXhq+ywYtLzosROzm2aXJie9l+w0no/E2TTIwK02wC5TwJFmYab37U6T3k6/tIFQ0WsX
         pHDNO0T0xoBcO0ZGPJ2Lh8+XQAHUR6ih6OisDnyz/lVKFAJUwu4j08EduvRB6O2HAkyw
         boQYE2lV8vfx1zvcon6QUDEUIbnnUV1WGmv626gb7waJgPB+nZKx9cf8AjqXIx5aHRAE
         W2MSyAM6N4vMnEbg8G4DiyMKKWR2E0WliAQPI0PL33tcdeRSIA44z70T3/AMk7cDIYpH
         QcKA==
X-Forwarded-Encrypted: i=1; AL+hErErkts/WbCb4ftWlsluoOSLWP6wYeK6eBfwpvwd/J7q0FygkEY/nDBjETxH4RX0Zw0OscsKpow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n4TDczrKmbS/NUDvV+dbUDNtrdHbh9n+NpvuHMkoQgE4MmDuX
	lX60bIidpD9QAS7nRgbiRtiEFZ1Bz5M7yWDqlIElyBvwiUd83opsGekYY8JEOhHxyUzmp+GZ8kp
	A1mQt/lzEh76u8HQlxkvYLSvY2J26GTCO+BU0H1pSPmGwwmDhPC9sJjLbvls=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:319b:b0:4f5:eaac:5173 with SMTP id
 5614622812f47-57a0b84fa3dmr21639331b6e.57.1795772395289; Fri, 27 Nov 2026
 01:39:55 -0800 (PST)
Date: Fri, 27 Nov 2026 01:39:55 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b094feb.b83081fb.4cb0e.0020.GAE@google.com>
Subject: [syzbot] [net?] KCSAN: data-race in xa_set_mark / xas_find_marked
From: syzbot <syzbot+cc64b6bdf649b54047e0@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, 
	jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ebb7a8dc1e74 Merge tag 'soc-fixes-7.4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=105ce153580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dc99102739636b09
dashboard link: https://syzkaller.appspot.com/bug?extid=cc64b6bdf649b54047e0
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/be1abd72bd4e/disk-ebb7a8dc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/317ea0b3db13/vmlinux-ebb7a8dc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4ec18c47ec34/bzImage-ebb7a8dc.xz

AI-generated root cause summary:
KCSAN reports a data race on `xa_node->marks` between `xa_set_mark()`
(`lib/xarray.c`) and `xas_find_marked()` / `xas_find_chunk()`
(`include/linux/xarray.h`). While writers hold `xa_lock` and update
`node->marks` using the non-atomic bitop `__test_and_set_bit()` in
`node_set_mark()`, lockless RCU readers in `xa_find()` -> `xas_find_marked()`
call `xas_find_chunk()`, which performs an unmarked plain read (`*addr & (~0UL
<< offset)`) without `READ_ONCE()` or `data_race()`. Because
`CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC` is disabled, KCSAN flags the
concurrent unmarked read against the non-atomic read-modify-write bitop.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=cc64b6bdf649b54047e0

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cc64b6bdf649b54047e0@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in xa_set_mark / xas_find_marked

read-write to 0xffff888106b77228 of 8 bytes by task 3329 on cpu 1:
 instrument_read_write include/linux/instrumented.h:56 [inline]
 __instrument_read_write_bitop include/asm-generic/bitops/instrumented-non-atomic.h:84 [inline]
 ___test_and_set_bit include/asm-generic/bitops/instrumented-non-atomic.h:99 [inline]
 node_set_mark lib/xarray.c:95 [inline]
 xas_set_mark lib/xarray.c:894 [inline]
 __xa_set_mark lib/xarray.c:2088 [inline]
 xa_set_mark+0xda/0x1b0 lib/xarray.c:2155
 devl_register+0x4c/0x70 net/devlink/core.c:413
 nsim_drv_probe+0x1e1/0x7c0 drivers/net/netdevsim/dev.c:1607
 nsim_bus_probe+0x15/0x20 drivers/net/netdevsim/bus.c:419
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x1ba/0x600 drivers/base/dd.c:707
 __driver_probe_device+0x176/0x1e0 drivers/base/dd.c:869
 driver_probe_device+0x63/0x380 drivers/base/dd.c:899
 __device_attach_driver+0x24e/0x350 drivers/base/dd.c:1027
 bus_for_each_drv+0x1c0/0x230 drivers/base/bus.c:500
 __device_attach+0x1d1/0x2a0 drivers/base/dd.c:1131
 device_initial_probe+0x6a/0xb0 drivers/base/dd.c:1190
 __bus_probe_device+0xfd/0x1b0 drivers/base/bus.c:614
 bus_probe_device+0x15/0x20 drivers/base/bus.c:632
 device_add+0x601/0x7c0 drivers/base/core.c:3778
 device_register+0x1d/0x30 drivers/base/core.c:3860
 nsim_bus_dev_new drivers/net/netdevsim/bus.c:468 [inline]
 new_device_store+0x2b0/0x460 drivers/net/netdevsim/bus.c:191
 bus_attr_store+0x57/0x80 drivers/base/bus.c:172
 sysfs_kf_write+0xfe/0x120 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x1d2/0x2e0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:575 [inline]
 vfs_write+0x57a/0x9b0 fs/read_write.c:667
 ksys_write+0xdc/0x1a0 fs/read_write.c:719
 __do_sys_write fs/read_write.c:730 [inline]
 __se_sys_write fs/read_write.c:727 [inline]
 __x64_sys_write+0x40/0x50 fs/read_write.c:727
 x64_sys_call+0x154e/0x2550 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888106b77228 of 8 bytes by task 3324 on cpu 0:
 xas_find_chunk include/linux/xarray.h:1752 [inline]
 xas_find_marked+0x211/0x650 lib/xarray.c:1516
 xa_find+0xa4/0x140 lib/xarray.c:2204
 __devlinks_xa_find_get+0x99/0xe0 net/devlink/core.c:375
 devlinks_xa_find_get+0x24/0x30 net/devlink/core.c:396
 devlink_get_from_attrs_lock+0xd8/0x390 net/devlink/netlink.c:225
 devlink_nl_inst_single_dumpit net/devlink/netlink.c:397 [inline]
 devlink_nl_dumpit+0x26d/0x300 net/devlink/netlink.c:456
 devlink_nl_port_get_dumpit+0x24/0x30 net/devlink/port.c:631
 genl_dumpit+0xac/0x110 net/netlink/genetlink.c:1026
 netlink_dump+0x46a/0x880 net/netlink/af_netlink.c:2360
 __netlink_dump_start+0x483/0x570 net/netlink/af_netlink.c:2475
 genl_family_rcv_msg_dumpit+0x1a5/0x210 net/netlink/genetlink.c:1075
 genl_family_rcv_msg net/netlink/genetlink.c:1191 [inline]
 genl_rcv_msg+0x3fd/0x470 net/netlink/genetlink.c:1209
 netlink_rcv_skb+0x11e/0x220 net/netlink/af_netlink.c:2585
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
 netlink_unicast_kernel net/netlink/af_netlink.c:1336 [inline]
 netlink_unicast+0x6fd/0x7e0 net/netlink/af_netlink.c:1362
 netlink_sendmsg+0x605/0x760 net/netlink/af_netlink.c:1921
 sock_sendmsg_nosec net/socket.c:800 [inline]
 __sock_sendmsg net/socket.c:818 [inline]
 __sys_sendto+0x429/0x480 net/socket.c:2283
 __do_sys_sendto net/socket.c:2290 [inline]
 __se_sys_sendto net/socket.c:2286 [inline]
 __x64_sys_sendto+0x76/0x90 net/socket.c:2286
 x64_sys_call+0x200c/0x2550 arch/x86/include/generated/asm/syscalls_64.h:45
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 3324 Comm: syz-executor Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
==================================================================
netdevsim netdevsim1 netdevsim0: renamed from eth0
8021q: adding VLAN 0 to HW filter on device netdevsim0
netdevsim netdevsim1 netdevsim1: renamed from eth1
8021q: adding VLAN 0 to HW filter on device netdevsim1
netdevsim netdevsim1 netdevsim2: renamed from eth2
8021q: adding VLAN 0 to HW filter on device netdevsim2
netdevsim netdevsim1 netdevsim3: renamed from eth3
8021q: adding VLAN 0 to HW filter on device netdevsim3
8021q: adding VLAN 0 to HW filter on device bond0
8021q: adding VLAN 0 to HW filter on device team0
hsr0: Slave A (hsr_slave_0) is not up; please bring it up to get a fully working HSR network
hsr0: Slave B (hsr_slave_1) is not up; please bring it up to get a fully working HSR network
8021q: adding VLAN 0 to HW filter on device batadv0
veth0_vlan: entered promiscuous mode
veth1_vlan: entered promiscuous mode
veth0_macvtap: entered promiscuous mode
veth1_macvtap: entered promiscuous mode
batman_adv: batadv0: Interface activated: batadv_slave_0
batman_adv: batadv0: Interface activated: batadv_slave_1
soft_limit_in_bytes is deprecated and will be removed. Writing any value to this file has no effect. Please report your usecase to linux-mm@kvack.org if you depend on this functionality.


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
