Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795813728;
	b=4Fjlkr0BYrNZnEj8fkC59B7JTdb5ST1q1DEoUzOYsX446dZANxzmdTNN0sBFIM7L1BXi
	 RlzAuGthtafW2mZVCivLx1xAbS1C3lEfl7DFHvRBNRdhzdtg74TsnTn4jGw29gXu07ywp
	 60wWMn6Y2xIwt6tN7xT8N33Vg/OYwzMIAbUXZjNPkw5DftIORxZTsRFg9Vxezj9Z7BDNk
	 keYZzAlkT1NE/Ev2Mi+udjgXpLj5KZYj2sA4VOuYdUstS5d6FzIqGfb2te8p/+zO9+VAb
	 cTHzu1iel+d3Zsrigy6KvYwjgQPz0DOPdu1iM+h2WJADSHHBLASot7nfVROsjTg2Ygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813728;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=RSktmJET6gB18EJ3z0Sjriwq/HxA9y3PiF8XdHM96Jk=;
	b=bskTRjYdWY00GpvRerPnZ3eTRUk/s6SvbCoNJz5Ggw4Ramy595qAh7XD7xUpz+pd0JN7
	 AAFhf5ls8Vc0nSlIbOFln66IPjD0eIBQEhpkRcWL+xMTvkRdgeQTvy8kZoC3DWwr78n5W
	 dcaRXojW5rcO8c57UHzHwiYbyHwgMX2zOXToaHghbAN6HlmOL/qgkyg0ZwSS7DnyHZpyi
	 tiqCRtfpWrTb7MmmE/xJIhplKdOXZPCELuGO5OAn90wVoE4ly+qDOcUpF4RfxIi0AXPax
	 dqAUc/a932BI9tSfIWGEcadinfcBhByE8/bY55jJkdtFi9XndQQ/vDwbWV9A5Ux96jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B992606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 21:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B992606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862ad1e3959so4891399a34.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795813726; x=1796418526;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSktmJET6gB18EJ3z0Sjriwq/HxA9y3PiF8XdHM96Jk=;
        b=YGpFhONziXyv7QKWUX/obuBXqz2p0iZNEZBuvYtP9C2zKqzGslkQ4Ziq5WZ0sOREEc
         2iYAGiNshg4d5ZTVE4twQvZUdmsvjTlFRGeeu0W2vWmX1LoRtyqMiCWDHJ9qVnlursH9
         kAdyywMg/ND569pGZkesnLhKjbcdyj1jQS1BWMJkX09GHiQxLx2ONa2mRoV3s+bw7faH
         9v/nC557DweL+668g+FQL3qsA+dUlSfMOeMtc710OrBBrIqChKsQkkvMSeidvjqCCgFx
         AaDsspsVYhl4UtUUom7sQtrg3esM4qW2ZARkctfzd+RjnltgKdCopPQ2HUxZu9sX5FaY
         tVcA==
X-Forwarded-Encrypted: i=1; AL+hErGn7HcBorbkk7SwCy1AQdFTqckMNO/foukDXF2eUf0j6pCgMXqQFvJvepouMolEJwQIw//DRfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z84J2F35mRONvy9eiqCejuE3sd7mSo5H4+lFhed9hM7Qanwirh6
	rZEib1ms2eioEn6gW9Y2gr24yBFQKsAQ8dxDvynflMt7cXuT51VgT8vVE7s9ahMocUd7NkQsshI
	DF7t/NkXwhBnm1ohWukc1SwRy/AuPwarN6k3wa5dqiWK4OZr36//8jjHDXlo=
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f28:b0:576:4595:983f with SMTP id
 5614622812f47-57a0a214e8fmr26124470b6e.14.1795813726088; Fri, 27 Nov 2026
 13:08:46 -0800 (PST)
Date: Fri, 27 Nov 2026 13:08:46 -0800
In-Reply-To: <6acb3491.a150a118.27e199.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09f15e.15291bde.1a1328.022e.GAE@google.com>
Subject: Re: [syzbot] [net?] INFO: task hung in addrconf_verify_work (10)
From: syzbot <syzbot+95263979a9c3af871646@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, idosch@nvidia.com, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has found a reproducer for the following issue on:

HEAD commit:    a9c48428cbd8 Add linux-next specific files for 20261126
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1289db09580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D36a5378b608da72=
a
dashboard link: https://syzkaller.appspot.com/bug?extid=3D95263979a9c3af871=
646
compiler:       Debian clang version 22.1.8 (1~deb13u5), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D177e9ab558000=
0

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2173c7cd9cd6/disk-=
a9c48428.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d179c702a8c6/vmlinux-=
a9c48428.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d47d09296975/bzI=
mage-a9c48428.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+95263979a9c3af871646@syzkaller.appspotmail.com

INFO: task kworker/R-ipv6_:65 blocked for more than 146 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/R-ipv6_ state:D stack:22368 pid:65    tgid:65    ppid:2      t=
ask_flags:0x4208060 flags:0x00080000
Workqueue: ipv6_addrconf addrconf_verify_work
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5629 [inline]
 __schedule+0x1b9d/0x6000 kernel/sched/core.c:7452
 __schedule_loop kernel/sched/core.c:7529 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7544
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7601
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c4/0x15a0 kernel/locking/mutex.c:821
 rtnl_net_lock include/linux/rtnetlink.h:134 [inline]
 addrconf_verify_work+0x19/0x30 net/ipv6/addrconf.c:4816
 process_one_work kernel/workqueue.c:3513 [inline]
 process_scheduled_works+0xc5d/0x1650 kernel/workqueue.c:3596
 rescuer_thread+0x84a/0x12a0 kernel/workqueue.c:3821
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
locks held by kthreadd/2: 1, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by kworker/0:1/11: 3, last CPU#0:
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90000107c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc90000107c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc90000107c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc90000107c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff888037c32ad0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
locks held by kworker/u8:0/13: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90000127c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000127c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000127c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90000127c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff8880599e0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff8880599e0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/R-mm_pe/15: 1, last CPU#0:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_detach=
_from_pool kernel/workqueue.c:2955 [inline]
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: rescuer_threa=
d+0xdbe/0x12a0 kernel/workqueue.c:3849
locks held by kworker/1:0/28: 2, on CPU#1:
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90000a2fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc90000a2fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc90000a2fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc90000a2fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
locks held by pr/ttyS0/34: 1, on CPU#0:
 #0: ffffffff904349d8 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire =
include/linux/rcupdate.h:314 [inline]
 #0: ffffffff904349d8 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisaf=
e include/linux/srcu.h:538 [inline]
 #0: ffffffff904349d8 (console_srcu){....}-{0:0}, at: console_srcu_read_loc=
k+0x30/0x60 kernel/printk/printk.c:291
locks held by khungtaskd/35: 1, on CPU#0:
 #0: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #0: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #0: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks=
+0x2e/0x180 kernel/locking/lockdep.c:6871
locks held by kworker/u8:2/47: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90000b77c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000b77c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000b77c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90000b77c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff888059800820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff888059800820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/u8:3/55: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90000bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90000bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90000bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90000bf7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff88805bdb0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff88805bdb0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/R-ipv6_/65: 3, last CPU#1:
 #0: ffff88801d768948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_l=
ock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801d768948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: rcu_r=
ead_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801d768948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: proce=
ss_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801d768948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: proce=
ss_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90001567c40 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)=
){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90001567c40 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)=
){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90001567c40 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)=
){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90001567c40 ((work_completion)(&(&net->ipv6.addr_chk_work)->work)=
){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:=
3596
 #2: ffffffff91ac87e0 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/l=
inux/rtnetlink.h:134 [inline]
 #2: ffffffff91ac87e0 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_verify_work+0x=
19/0x30 net/ipv6/addrconf.c:4816
locks held by kworker/R-ksmbd/120: 1, last CPU#0:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by kworker/u8:5/189: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003017c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003017c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003017c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003017c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff888059be0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff888059be0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/1:2/994: 3, on CPU#1:
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90005007c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc90005007c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc90005007c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc90005007c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff888037c35c58 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
locks held by kworker/0:2/1568: 3, on CPU#0:
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc9000616fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc9000616fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc9000616fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc9000616fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff888079969700 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
locks held by kworker/1:3/3222: 4, on CPU#1:
 #0: ffff888031800148 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888031800148 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888031800148 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888031800148 ((wq_completion)wg-kex-wg1#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc9000de4fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc9000de4fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc9000de4fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc9000de4fc40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff88807996b4b8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by kworker/R-bat_e/3233: 6, on CPU#1:
 #0: ffff88802da9f148 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88802da9f148 ((wq_completion)bat_events){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88802da9f148 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88802da9f148 ((wq_completion)bat_events){+.+.}-{0:0}, at: process_=
scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc9000decfc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000decfc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000decfc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc9000decfc40 ((work_completion)(&(&bat_priv->tt.work)->work)){+.+.=
}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: local_lock_acquire i=
nclude/linux/local_lock_internal.h:46 [inline]
 #2: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: process_backlog+0x3d=
e/0x18b0 net/core/dev.c:6957
 #3: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #3: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #3: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1224 [inline]
 #3: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
 #4: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #4: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #4: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: nf_hook include/linu=
x/netfilter.h:249 [inline]
 #4: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: NF_HOOK+0xa2/0x3f0 i=
nclude/linux/netfilter.h:323
 #5: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #5: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #5: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1224 [inline]
 #5: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by klogd/4993: 2, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1224 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by udevd/5004: 1, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by dhcpcd/5298: 2, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1224 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by dhcpcd/5299: 2, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire inc=
lude/linux/rcupdate.h:309 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock includ=
e/linux/rcupdate.h:849 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructo=
r include/linux/rcupdate.h:1224 [inline]
 #1: ffffffff9055b1a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x=
8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by crond/5377: 1, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by getty/5393: 2, last CPU#0:
 #0: ffff8880279b90a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait=
+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000324b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_rea=
d+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/0:0/5732: 2, on CPU#0:
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88802c2bd948 ((wq_completion)wg-kex-wg0#4){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc900044d7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc900044d7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc900044d7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc900044d7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
locks held by kworker/u8:1/5808: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003a17c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003a17c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003a17c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003a17c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff88807ba90820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff88807ba90820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/1:1/5815: 3, on CPU#1:
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888031803548 ((wq_completion)wg-kex-wg2#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003ba7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc90003ba7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc90003ba7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc90003ba7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff88807996a0e8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
locks held by kworker/u8:4/5816: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003b97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003b97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003b97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003b97c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff8880792b0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff8880792b0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by syz-executor/5832: 2, on CPU#0:
 #0: ffffffff91ac87e0 (rtnl_mutex){+.+.}-{4:4}, at: tun_detach drivers/net/=
tun.c:668 [inline]
 #0: ffffffff91ac87e0 (rtnl_mutex){+.+.}-{4:4}, at: tun_chr_close+0x3e/0x1c=
0 drivers/net/tun.c:3671
 #1: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #1: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by syz-executor/5833: 1, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by syz-executor/5837: 4, on CPU#0:
 #0: ffffffff9063afb0 (dup_mmap_sem){.+.+}-{0:0}, at: dup_mm kernel/fork.c:=
1544 [inline]
 #0: ffffffff9063afb0 (dup_mmap_sem){.+.+}-{0:0}, at: copy_mm+0xf6/0x640 ke=
rnel/fork.c:1610
 #1: ffff888035798f80 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_kil=
lable include/linux/mmap_lock.h:590 [inline]
 #1: ffff888035798f80 (&mm->mmap_lock){++++}-{4:4}, at: dup_mm kernel/fork.=
c:1545 [inline]
 #1: ffff888035798f80 (&mm->mmap_lock){++++}-{4:4}, at: copy_mm+0x110/0x640=
 kernel/fork.c:1610
 #2: ffff88807db6ccc0
 (&mm->mmap_lock/1){+.+.}-{4:4}, at: mmap_write_lock_nested include/linux/m=
map_lock.h:580 [inline]
 (&mm->mmap_lock/1){+.+.}-{4:4}, at: dup_mmap+0x1f6/0x1c80 mm/mmap.c:1733
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by syz-executor/5842: 1, on CPU#0:
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #0: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by kworker/1:4/5844: 4, on CPU#1:
 #0: ffff88801cc6a148 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acq=
uire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801cc6a148 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_loc=
k include/linux/rcupdate.h:849 [inline]
 #0: ffff88801cc6a148 ((wq_completion)events){+.+.}-{0:0}, at: process_one_=
work kernel/workqueue.c:3478 [inline]
 #0: ffff88801cc6a148 ((wq_completion)events){+.+.}-{0:0}, at: process_sche=
duled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003927c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003927c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003927c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003927c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0=
}, at: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff8880373cf258 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_wor=
k+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by kworker/u8:6/5851: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003b07c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003b07c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003b07c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003b07c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff888059ad0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff888059ad0820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/u8:7/5852: 3, on CPU#0:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003af7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003af7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003af7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003af7c40 ((work_completion)(&rdev->wiphy_work)){+.+.}-{0:0}, a=
t: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffff888059b80820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_const=
ructor include/net/cfg80211.h:7065 [inline]
 #2: ffff888059b80820 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_wo=
rk+0xb4/0x430 net/wireless/core.c:595
locks held by kworker/R-wg-cr/5886: 1, on CPU#1:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by kworker/R-wg-cr/5894: 1, last CPU#1:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by kworker/R-wg-cr/5895: 1, last CPU#1:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by kworker/R-wg-cr/5913: 1, last CPU#1:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by kworker/R-wg-cr/5917: 1, last CPU#0:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_detach=
_from_pool kernel/workqueue.c:2955 [inline]
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: rescuer_threa=
d+0xdbe/0x12a0 kernel/workqueue.c:3849
locks held by kworker/R-wg-cr/5921: 1, last CPU#0:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_detach=
_from_pool kernel/workqueue.c:2955 [inline]
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: rescuer_threa=
d+0xdbe/0x12a0 kernel/workqueue.c:3849
locks held by kworker/R-wg-cr/5922: 1, last CPU#0:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_detach=
_from_pool kernel/workqueue.c:2955 [inline]
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: rescuer_threa=
d+0xdbe/0x12a0 kernel/workqueue.c:3849
locks held by kworker/1:5/5961: 1, last CPU#1:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by kworker/1:6/5983: 4, on CPU#1:
 #0: ffff888034479d48 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888034479d48 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888034479d48 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888034479d48 ((wq_completion)wg-kex-wg1#6){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc900035c7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc900035c7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc900035c7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc900035c7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff888077585c58 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #3: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365
locks held by kworker/0:3/6022: 4, on CPU#0:
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff8880322b1d48 ((wq_completion)wg-kex-wg0#2){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc900034a7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc900034a7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc900034a7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc900034a7c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff88807fced440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_response+0x14e/0x9f0 drivers/net/wireguard/noise.c:678
 #3: ffff88807996bea0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_response+0x15f/0x9f0 drivers/net/wireguard/noise.c:679
locks held by kworker/1:7/6059: 3, on CPU#1:
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888078415548 ((wq_completion)wg-kex-wg2#6){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90002f27c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc90002f27c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc90002f27c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc90002f27c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff888037c32ad0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_begin_session+0x36/0xbf0 drivers/net/wireguard/noise.c:821
locks held by kworker/0:4/6067: 3, on CPU#0:
 #0: ffff88802fa99148 ((wq_completion)wg-kex-wg2#8){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88802fa99148 ((wq_completion)wg-kex-wg2#8){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88802fa99148 ((wq_completion)wg-kex-wg2#8){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88802fa99148 ((wq_completion)wg-kex-wg2#8){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003427c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 =
[inline]
 #1: ffffc90003427c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [in=
line]
 #1: ffffc90003427c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inli=
ne]
 #1: ffffc90003427c40 ((work_completion)(&({ do { const void __attribute__(=
(btf_type_tag("percpu"))) *__vpp_verify =3D (typeof((worker) + 0))((void *)=
0); (void)__vpp_verify; } while (0); ((typeof((__typeof_unqual__(*((worker)=
)) *)(( unsigned long)((worker)))))((unsigned long)((__typeof_unqual__(*((w=
orker))) *)(( unsigned long)((worker)))) + (((__per_cpu_offset[(cpu)])))));=
 })->work)){+.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/wo=
rkqueue.c:3596
 #2: ffff888036c09440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_consume_response+0x214/0xbf0 drivers/net/wireguard/noise.c:741
locks held by kworker/u8:8/6221: 4, last CPU#1:
 #0: ffff888037fc9148 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: rcu_lock=
_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888037fc9148 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: rcu_read=
_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888037fc9148 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: process_=
one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888037fc9148 ((wq_completion)wg-kex-wg1){+.+.}-{0:0}, at: process_=
scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003847c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003847c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003847c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003847c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:359=
6
 #2: ffff888077ba5440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff88807996b4b8 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/u8:9/6222: 3, last CPU#1:
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_=
read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff88801ccac148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: proc=
ess_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003567c40 ((linkwatch_work).work){+.+.}-{0:0}, at: rcu_lock_acq=
uire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003567c40 ((linkwatch_work).work){+.+.}-{0:0}, at: rcu_read_loc=
k include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003567c40 ((linkwatch_work).work){+.+.}-{0:0}, at: process_one_=
work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003567c40 ((linkwatch_work).work){+.+.}-{0:0}, at: process_sche=
duled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #2: ffffffff91ac87e0 (rtnl_mutex){+.+.}-{4:4}, at: linkwatch_event+0xe/0x6=
0 net/core/link_watch.c:313
locks held by kworker/u8:10/6223: 4, last CPU#0:
 #0: ffff888033d66148 ((wq_completion)wg-kex-wg2#5){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888033d66148 ((wq_completion)wg-kex-wg2#5){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888033d66148 ((wq_completion)wg-kex-wg2#5){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888033d66148 ((wq_completion)wg-kex-wg2#5){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90004447c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90004447c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90004447c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90004447c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:359=
6
 #2: ffff888036c0d440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff888037c32ad0 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/u8:11/6224: 4, last CPU#0:
 #0: ffff888034f3c948 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: rcu_lo=
ck_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888034f3c948 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: rcu_re=
ad_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888034f3c948 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: proces=
s_one_work kernel/workqueue.c:3478 [inline]
 #0: ffff888034f3c948 ((wq_completion)wg-kex-wg0#3){+.+.}-{0:0}, at: proces=
s_scheduled_works+0x99a/0x1650 kernel/workqueue.c:3596
 #1: ffffc90003547c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90003547c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90003547c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3478 [inline]
 #1: ffffc90003547c40 ((work_completion)(&peer->transmit_handshake_work)){+=
.+.}-{0:0}, at: process_scheduled_works+0x99a/0x1650 kernel/workqueue.c:359=
6
 #2: ffff88807ff1d440 (&wg->static_identity.lock){++++}-{4:4}, at: wg_noise=
_handshake_create_initiation+0x12e/0x810 drivers/net/wireguard/noise.c:529
 #3: ffff888037c35c58 (&handshake->lock){++++}-{4:4}, at: wg_noise_handshak=
e_create_initiation+0x13f/0x810 drivers/net/wireguard/noise.c:530
locks held by kworker/0:5/6225: 1, last CPU#0:
 #0: ffffffff903f65e0 (wq_pool_attach_mutex){+.+.}-{4:4}, at: worker_attach=
_to_pool+0x31/0x390 kernel/workqueue.c:2897
locks held by syz-executor/6227: 2, on CPU#0:
 #0: ffff88807e07d900 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock incl=
ude/linux/mmap_lock.h:640 [inline]
 #0: ffff88807e07d900 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_mayb=
e_expand+0xca/0x400 mm/mmap.c:1702
 #1: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_lock_acquir=
e include/linux/srcu.h:249 [inline]
 #1: ffffffff906b41b0 (remove_cache_srcu){.+.+}-{0:0}, at: srcu_read_lock+0=
x27/0x60 include/linux/srcu.h:365

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 35 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(ful=
l)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 11/06/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x17d/0x390 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x13a/0x180 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:377 [inline]
 watchdog+0x1073/0x10f0 kernel/hung_task.c:598
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 3233 Comm: kworker/R-bat_e Not tainted syzkaller #0 PREE=
MPT(full)=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 11/06/2026
Workqueue: bat_events batadv_tt_purge
RIP: 0010:unwind_next_frame+0x44c/0x2550 arch/x86/kernel/unwind_orc.c:511
Code: 49 bc 00 00 00 00 00 fc ff df 75 27 48 89 ef e8 2a 0f 62 00 48 c7 c1 =
a0 bd 3b 90 31 d2 84 c0 48 0f 45 d1 48 89 15 94 53 be 13 <48> 85 d2 0f 84 2=
e 02 00 00 48 8d 5a 04 48 89 54 24 18 4c 8d 6a 05
RSP: 0018:ffffc90000a476c0 EFLAGS: 00000206
RAX: 0000000000000006 RBX: ffffffff921a4f64 RCX: ffffffff921a4f68
RDX: ffffffff929c3824 RSI: ffffffff929c3818 RDI: ffffffff8cb04f20
RBP: ffffffff816d9cc3 R08: 0000000000000003 R09: 0000000000000000
R10: ffffc90000a477b8 R11: ffffffff81b46450 R12: dffffc0000000000
R13: 0000000000000002 R14: ffffc90000a47768 R15: ffffffff921a4f68
FS:  0000000000000000(0000) GS:ffff888122ff0000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f347c7abff8 CR3: 00000000749be000 CR4: 00000000003526f0
Call Trace:
 <IRQ>
 arch_stack_walk+0x11b/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0xa9/0x100 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3f/0x90 mm/kasan/common.c:79
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:599
 poison_slab_object mm/kasan/common.c:267 [inline]
 __kasan_slab_free+0x70/0x90 mm/kasan/common.c:299
 kasan_slab_free include/linux/kasan.h:239 [inline]
 slab_free_hook mm/slub.c:2807 [inline]
 slab_free mm/slub.c:6672 [inline]
 kmem_cache_free+0x184/0x660 mm/slub.c:6816
 skb_ext_del include/linux/skbuff.h:5143 [inline]
 nf_bridge_info_free net/bridge/br_netfilter_hooks.c:158 [inline]
 br_nf_dev_queue_xmit+0x4f6/0x25c0 net/bridge/br_netfilter_hooks.c:857
 NF_HOOK+0x64e/0x6e0 include/linux/netfilter.h:325
 br_nf_post_routing+0xa51/0xee0 net/bridge/br_netfilter_hooks.c:965
 nf_hook_entry_hookfn include/linux/netfilter.h:165 [inline]
 nf_hook_slow+0xc5/0x220 net/netfilter/core.c:633
 nf_hook include/linux/netfilter.h:280 [inline]
 NF_HOOK+0x23e/0x3f0 include/linux/netfilter.h:323
 br_forward_finish+0xd3/0x130 net/bridge/br_forward.c:80
 br_nf_hook_thresh net/bridge/br_netfilter_hooks.c:1166 [inline]
 br_nf_forward_finish+0xa76/0xea0 net/bridge/br_netfilter_hooks.c:668
 NF_HOOK+0x64e/0x6e0 include/linux/netfilter.h:325
 br_nf_forward_ip+0x7e7/0xa30 net/bridge/br_netfilter_hooks.c:722
 nf_hook_entry_hookfn include/linux/netfilter.h:165 [inline]
 nf_hook_slow+0xc5/0x220 net/netfilter/core.c:633
 nf_hook include/linux/netfilter.h:280 [inline]
 NF_HOOK+0x23e/0x3f0 include/linux/netfilter.h:323
 __br_forward+0x41e/0x5d0 net/bridge/br_forward.c:130
 br_flood+0x402/0x650 net/bridge/br_forward.c:352
 br_handle_frame_finish+0x11fc/0x1ae0 net/bridge/br_input.c:231
 br_nf_hook_thresh+0x3dd/0x4c0 net/bridge/br_netfilter_hooks.c:-1
 br_nf_pre_routing_finish_ipv6+0x90c/0xc40 net/bridge/br_netfilter_ipv6.c:-=
1
 NF_HOOK include/linux/netfilter.h:325 [inline]
 br_nf_pre_routing_ipv6+0x382/0x6f0 net/bridge/br_netfilter_ipv6.c:183
 nf_hook_entry_hookfn include/linux/netfilter.h:165 [inline]
 nf_hook_bridge_pre net/bridge/br_input.c:298 [inline]
 br_handle_frame+0x1356/0x1620 net/bridge/br_input.c:461
 __netif_receive_skb_core+0x9ad/0x3120 net/core/dev.c:6376
 __netif_receive_skb_one_core net/core/dev.c:6495 [inline]
 __netif_receive_skb net/core/dev.c:6610 [inline]
 process_backlog+0x727/0x18b0 net/core/dev.c:6961
 __napi_poll+0xaa/0x330 net/core/dev.c:8110
 napi_poll net/core/dev.c:8173 [inline]
 net_rx_action+0x61d/0xf50 net/core/dev.c:8330
 handle_softirqs+0x265/0x8d0 kernel/softirq.c:669
 do_softirq+0x77/0xd0 kernel/softirq.c:569
 </IRQ>
 <TASK>
 __local_bh_enable_ip+0x100/0x140 kernel/softirq.c:473
 spin_unlock_bh include/linux/spinlock.h:407 [inline]
 batadv_tt_global_purge net/batman-adv/translation-table.c:2937 [inline]
 batadv_tt_purge+0x4ee/0xa40 net/batman-adv/translation-table.c:4342
 process_one_work kernel/workqueue.c:3513 [inline]
 process_scheduled_works+0xc5d/0x1650 kernel/workqueue.c:3596
 rescuer_thread+0x84a/0x12a0 kernel/workqueue.c:3821
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
