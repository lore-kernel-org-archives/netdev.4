Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272529;
	b=cP9oYXZUKASVlN00HCtAhZgIDCEHbfL/8JwqDx/uXbZmaJ1U6zcnKYhJ5QNCaagYhSXm
	 P2fMSTZWZPcr3s3NZ+iZEPhKntmtabCGW96DEcGLPVxoZZwfyaO1LMO5u+NVz1IgxjyJy
	 /n10kwig48iqBD+D/sp9teCkC6RrGwWet7qe3chS0MLBzWfk5KQ8oXtMkpmPTCa/WRmhh
	 fj5qZWh/TK3eKGWvY4OrIyONQT9r7E+uNqvsPXDzxs6HcqBgIT/XVxoEiXEWzzuQ/yOR6
	 TgVFT21OWjNd79L0vXNJTYGKfXGwkh30MTjDFrRX+/uYu1Q/lMGPXQ/FC0FW9sh8zew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272529;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BQumXRQl87bc44nKVouFo9VGgnHpda2MT0aPk1KmvGk=;
	b=CDPhltoXj636GAfSSqhhSMVCcXPhiD2wpamPdRynjsjbVzq+uBAKkgwT63lzm+8EEsLO
	 ulZtJN58vEPKpfacT0R8Cm3cfkVx9Njn4gtyHLiwM/ylMEgEKk3HsblAepI6HwGM8ToHO
	 sya8EhZP1g0oiZkis4Duj9Us9VMfDE0BkB9Rp9TM0F3ER8tcSltXq9dHurmR2NbKZs+Et
	 zLPgaUsaxt0tGP/UQdzN+ZGwPs7onMaAvCDcpxpKpByQ10tgFNHxSpEIfO0NxMIWbxoPZ
	 kAvxtBd0JpMEPw03/b+sU1YjS3BpiBvV5kLPNfq8JLDsJd33iNMVv2OffpdyEUJW9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC22606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 14:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC22606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-57289376805so2108636b6e.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 06:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272528; x=1795877328;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQumXRQl87bc44nKVouFo9VGgnHpda2MT0aPk1KmvGk=;
        b=VrAtsm+OV2KEQDXBwf6YljySvEsJYw9O7v+1CjcDnz5XMcKaz0w1ZxpHYKX7c4GDs2
         4mVrMuDeKVlssDPTGipUmkEYjUmIvYX9LBk+Iz1A7QT/3R4Tny8lSedJjdzfEWy9sLGP
         Oglp8umIrFV4i5BfmQe9TWtj+sbhsQQcYv6TXoqf0zqI4f4nAd6NckWhYRelTOuA/Zz1
         N2XY1w/brv6z/h8k7NlOGEtBsl1RGirs30COYOF6/vkoq0j6puKrjfeCQtwDJWYtqpyK
         hAHBCV3BmS9SayW0QQD93zP2THcyIDARYSiS3bMmyJyagrVsJnDnekoFNNjQUfajcToK
         QPmA==
X-Forwarded-Encrypted: i=1; AL+hErH/RCVIhMAn0v3BR2jgn38vzOuNe+fg1sIJDbveViv3X9onBNmpqGTNY0aia/TiQAiFdR+OUV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xfpca2XYD+oQgl2RwmjqB7eKvQ14HrOgyvpkNTmx5vR/MI6CY
	3NJd7uvF+aC1AWmv87Va7CDTYjPLoS3+h70/ZDmGB9Y5WOqs47ROAKqM4/AdllwdD3GvE4Y5gBY
	V9HBeOflIYsObQR1RRnRPbWTGCbOafAcrsSpabKKtFWhtRKxkaT51JWMaDl8=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1916:b0:4f4:6421:5efe with SMTP id
 5614622812f47-57a0ba53122mr7079187b6e.36.1795272528263; Sat, 21 Nov 2026
 06:48:48 -0800 (PST)
Date: Sat, 21 Nov 2026 06:48:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b01af50.44b41460.34b83f.000c.GAE@google.com>
Subject: [syzbot] [wireguard?] KCSAN: data-race in wg_index_hashtable_lookup / wg_packet_decrypt_worker
From: syzbot <syzbot+434045ea68296f3f0219@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, jason@zx2c4.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c44104f3642d Merge tag 'drm-fixes-2026-11-21' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=131d3203580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
dashboard link: https://syzkaller.appspot.com/bug?extid=434045ea68296f3f0219
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3fc1eaf78772/disk-c44104f3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d89308c4a5cc/vmlinux-c44104f3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5eea3049fa3b/bzImage-c44104f3.xz

The issue was bisected by AI to:

commit e7096c131e5161fa3b8e52a650d7719d2857adfd
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Sun Dec 8 23:27:34 2019 +0000

    net: WireGuard secure network tunnel

AI reasoning:   https://syzkaller.appspot.com/ai_job?id=3b0df671-a26c-4b49-8c2e-0c6fac1004c7

AI-generated root cause summary:
In wg_index_hashtable_lookup() (drivers/net/wireguard/peerlookup.c:218), the
function mistakenly assigns the return value of
wg_peer_get_maybe_zero(entry->peer) to entry->peer instead of setting the
caller's output parameter *peer. The entry->peer pointer is intended to remain
immutable after keypair/handshake creation. This unintended write causes a data
race against concurrent readers (such as PACKET_PEER(skb) in
wg_queue_enqueue_per_peer_rx()) and concurrent lookups. If the peer's refcount
has dropped to zero, it overwrites entry->peer with NULL, leading to potential
NULL-pointer dereference crashes in subsequent teardown code.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=434045ea68296f3f0219

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+434045ea68296f3f0219@syzkaller.appspotmail.com

The cause commit was identified by AI and may be wrong.
If you agree with it, please also add:
Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")

==================================================================
BUG: KCSAN: data-race in wg_index_hashtable_lookup / wg_packet_decrypt_worker

read to 0xffff88811b843800 of 8 bytes by task 3420 on cpu 1:
 wg_queue_enqueue_per_peer_rx drivers/net/wireguard/queueing.h:195 [inline]
 wg_packet_decrypt_worker+0x45c/0x670 drivers/net/wireguard/receive.c:503
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
 worker_thread+0x56c/0x770 kernel/workqueue.c:3659
 kthread+0x248/0x2a0 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

write to 0xffff88811b843800 of 8 bytes by interrupt on cpu 0:
 wg_index_hashtable_lookup+0xcf/0x120 drivers/net/wireguard/peerlookup.c:218
 wg_packet_consume_data drivers/net/wireguard/receive.c:517 [inline]
 wg_packet_receive+0xa90/0x1260 drivers/net/wireguard/receive.c:576
 wg_receive+0x4e/0x80 drivers/net/wireguard/socket.c:325
 udp_queue_rcv_one_skb+0x85f/0x8b0 net/ipv4/udp.c:2433
 udp_queue_rcv_skb+0x355/0x430 net/ipv4/udp.c:2473
 udp_unicast_rcv_skb+0x196/0x1c0 net/ipv4/udp.c:2621
 udp_rcv+0xa3c/0xf20 net/ipv4/udp.c:2698
 ip_protocol_deliver_rcu+0x43d/0x810 net/ipv4/ip_input.c:207
 ip_local_deliver_finish+0x1f0/0x2e0 net/ipv4/ip_input.c:247
 NF_HOOK include/linux/netfilter.h:325 [inline]
 ip_local_deliver+0xe8/0x1e0 net/ipv4/ip_input.c:268
 dst_input include/net/dst.h:482 [inline]
 ip_rcv_finish+0x188/0x1a0 net/ipv4/ip_input.c:498
 NF_HOOK include/linux/netfilter.h:325 [inline]
 ip_rcv+0x62/0x160 net/ipv4/ip_input.c:618
 __netif_receive_skb_one_core net/core/dev.c:6451 [inline]
 __netif_receive_skb net/core/dev.c:6564 [inline]
 process_backlog+0x349/0x690 net/core/dev.c:6915
 __napi_poll+0x73/0x350 net/core/dev.c:8001
 napi_poll net/core/dev.c:8064 [inline]
 net_rx_action+0x33f/0x850 net/core/dev.c:8221
 handle_softirqs+0x109/0x310 kernel/softirq.c:669
 do_softirq+0x46/0x60 kernel/softirq.c:569
 __local_bh_enable_ip+0x79/0x80 kernel/softirq.c:473
 __raw_read_unlock_bh include/linux/rwlock_api_smp.h:283 [inline]
 _raw_read_unlock_bh+0x2f/0x40 kernel/locking/spinlock.c:319
 wg_socket_send_skb_to_peer+0x10c/0x130 drivers/net/wireguard/socket.c:183
 wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
 wg_packet_tx_worker+0x173/0x340 drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
 worker_thread+0x56c/0x770 kernel/workqueue.c:3659
 kthread+0x248/0x2a0 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 12 Comm: kworker/0:1 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: wg-crypt-wg2 wg_packet_tx_worker
==================================================================


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
