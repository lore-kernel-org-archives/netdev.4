Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281724;
	b=O8NdLAxXCEFo/WTOUvMlLhStfOcqq1lt+Wu7m3LdoWl0jEUj519zVnGuUOyBKSqhYtrE
	 WittAkt64GIiVAYFbRBKjFn31zyOY53c4HiWMNxjFMQxQTnSktVn800W2MZtohmCsHIZ4
	 g6wpN4TgPx2+uU6jTLbHMMiRebfeHC8ExO/B5u4e49ojsy8ndl5uc9mXpQPcWGvpq/JDq
	 ooLxaZCjww2gn0WgDm3ExLOBRP/ACwqrXGDzmHDfrEAs6Ion24GSYgkDrHKP3YK6dTkzs
	 cFNJeHhSkL0DiFHmygZeeEisjfjaXCize0yFslkr3xCA5x+aQUTQzJMCsbnX7wY8p1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ePFvBkH/2lgPeHgRGn3ywaoYuFfAZj1+wmWOZV/J9+A=;
	b=mKCICOMdgCILwFT0Rs1tniNHaeQpWAYVFpjdn1B8VH9DuW9JSw8g561hJXtBq9gsGHjJ
	 2BC8cJwKmwG5eVeFBEXUU5CCzZOtXGBKs1biDUy7kuKUWSJ1xdcNJaM9vsSrwefE+1+2o
	 dNrb2UxsT/1ZGOqEnTiIH28+CaLiZcQrrGFHU8vALh+cDOWCZF41mJ9xbf5rCiCd56EnD
	 OoKrvHlzImB4k0cOy6sgaO/UeiPFV9DlwqUfIQh0CLq41Z8TQ6hwIUqoUU8y2jRZtPxAt
	 QumXs00mPXdx5osCLLpzTMEhZjsLUU0kONShZLYZLS8pihbnXu1h4qHqGC6HwgyENDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/5uSnNT";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D0606A680
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 17:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27D0606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/5uSnNT
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so3190703c88.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281723; x=1795886523; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ePFvBkH/2lgPeHgRGn3ywaoYuFfAZj1+wmWOZV/J9+A=;
        b=X/5uSnNTi91LDYH/J2N15Ki5R8YCsuGepd2VbBp2pF2QVbDKtS38IVEAaI1sUz1h+c
         gG76ZpIxq5PII7aIsaswnfeyhDDAUHdYYG3F73KdKYRiXuZ2iEE0YM+Nvw3YPOf2osna
         0K8pBoAdEfrzseLp9mf9NytNLkVkPP0ofNw2TmJSsKCP1qeMQSjZ6rfN+ywEF/Vtw/kw
         EhDpQ7Pn9sByHq9hP06olhULEWW/oeHHs47G3FlhRbPU8MSqkdRFHkSqNWso0+ebFXkb
         aT2qgxOPNf6EdyYwHvoLG6PCPYDMFfj6KdsS8Za2DabY0p4cE6/QoOWDoBuRO2aVc1/w
         xJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281723; x=1795886523;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePFvBkH/2lgPeHgRGn3ywaoYuFfAZj1+wmWOZV/J9+A=;
        b=PxtRbccL282UUUeXVKD5KHhRxIf3GBQfXbINGR5EDFNxJuHNnYet1icesBFoUDQlol
         C8w06kIsYipFGG6X79+7avSFgNIOt2/2waZ136J/v6HI7Gt7arsL5JMej1CmNhWxqFJD
         d34nv4qglMl8rxfJf7CXQQSAWE8XMcfyIWbeL7+Rx65Mm+GXSOOQdZ6RuGmXOC1/OVlM
         h+2o+Z+fAeo1fiPk8YiahvOnv3PprcLKzHN05uKuflOw+ft9dVtyySWoBdp0yBPhlsK8
         VUnR5wKsuLscTlwqudpJVSEq/CK0+nhQn1nj8NpXJyUixI1N8USC8oFYJTVWadeQ0Tqm
         IW2g==
X-Forwarded-Encrypted: i=1; AL+hErE1Q5CC03RgJ2hCmIhOBH1QVJ/8tajxsl+Djs6sSlZSzD7OqMrDl3wL7903aViEMqVNfGvOHr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O0lsifOfJqmarXWOt+LXpDuKLF5HIlLV1mmuW7oqj5xL7wTTF
	I6HjN8kdCohaPD7xnxnlBPJOvBFiUWiuvYtLilPyx1jGtxWM9pOqH+kEHP5rbSJW
X-Gm-Gg: AZFdTZdvameYT1m42aO+TI1EbQA5aiAM+FWGQSC1eP3cwUDuLbptiiqgXoxa4xqnnRY
	hfk2CwQXtmmaPrk6jOYIhtquyXnF6Db3rKizL2B9KLYlrsCDhu81/VuOkTceVgnfIniKyBgmRqO
	n853O0BqHVWaLIhu90NTy/WrWiORuP/7kc6fjMNufJjH78m5OYOVyBY/rsxKlcJEstJgDCqAWIx
	jHfT/lNsa+yT+d0Pcx0KqO4xMrFOm1LF2C6A0sdSeKlvAq091B6R2mpbK/G8v2rBBN9rro5Pv86
	mBMOsbI5BtQmIWZTJFXgcdKG/jtyZdm4RgbBSVHc10W2QpOoifl2mmU0cAkFwuLMjZ8bFgPxieF
	TTUKB04jFiRLwskf07LZ/eGoq5xY8+Ua6kT2JekOcN/YK8LKI5weMyvJklXH12VlU6X6P2o768y
	8iILmqIcU+2KTbG0r35y3EUJBmiGHJMvFzh0fO/zgOpw9EwbXRdRWT9i+0KIjTIYy6ckkKauFl1
	BaOvsJus/h3Fl7YjJG+xYtFkeA7oaz+pxxnvBmrLGEEfpJTBgnCdV2pHhkAK2sC78mUhcx1YADo
	03GZj9FDX0SWDLC3MnmsDip7CB72BEATeXmeag==
X-Received: by 2002:a05:7022:f51b:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b5568af41amr4974747c88.23.1795281722735;
        Sat, 21 Nov 2026 09:22:02 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:5f92:c501:8e47:293d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm15421187c88.8.2026.11.21.09.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:22:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] tcp: fix division by zero in tcp_cong_avoid_ai()
From: mdshahid03@gmail.com
To: netdev-bot+sinfo@kernel.org
Cc: mdshahid03@gmail.com, edumazet@google.com, ncardwell@google.com, 
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
 horms@kernel.org, netdev@vger.kernel.org
In-Reply-To: <179517765144.3291.2370404794757115217@kernel.org>
References: <20261120122348.207708-1-mdshahid03@gmail.com>
 <179517765144.3291.2370404794757115217@kernel.org>
Date: Sat, 21 Nov 2026 22:51:43 +0530
Message-Id: <179528170353.493088.11313682897276891791.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

First ,This issue is reported by Clang.
218696:net/ipv4/tcp_cong.c:480:32: warning: Division by zero [clang-analyzer-core.DivideZero]

Second, I tested this issue on both original and patched kernels in qemu.

To reproduce it,I created a BPF TCP congestion-control implementation
using struct_ops.Its congestion avoidance callback deliberately call
tcp_cong_avoid_ai() with w = 0. 

..............................................................CRASH LOG START............................................................

[    2.632587][   T63] Oops: divide error: 0000 [#1] NOPTI
[    2.632922][   T63] CPU: 0 UID: 0 PID: 63 Comm: tcp_zero_loader Not tainted 7.3.0-13252-g4b33dc21137f #1 PREEMPT(lazy)
[    2.633123][   T63] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[    2.633262][   T63] RIP: 0010:tcp_cong_avoid_ai+0x50/0xa0
[    2.633537][   T63] Code: 81 f9 ff ff ff 7f 73 63 89 87 a4 05 00 00 8b 87 94 07 00 00 01 d0 89 87 94 07 00 00 39 f0 73 08 8b 87 a4 05 00 00 eb 1a 31 d2 <f7> f6 89 97 94 07 00 00 03 87 a4 05 00 00 85 c0 7e 33 89 87 a4 05
[    2.633718][   T63] RSP: 0018:ffffc900001c3a60 EFLAGS: 00000246
[    2.633797][   T63] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 000000000000000a
[    2.633860][   T63] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888005bbae40
[    2.633922][   T63] RBP: ffffc900001c3a68 R08: 0000000000000000 R09: 0000000000000000
[    2.633983][   T63] R10: 0000000000000000 R11: ffffffffc0000740 R12: 0000000000055506
[    2.634045][   T63] R13: 0000000000044502 R14: ffffc900001c3b40 R15: 0000000000000000
[    2.634137][   T63] FS:  00007f723dd62140(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    2.634209][   T63] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.634262][   T63] CR2: 00007f723d55e000 CR3: 0000000005b61000 CR4: 00000000000006f0
[    2.634387][   T63] Call Trace:
[    2.634826][   T63]  <TASK>
[    2.635067][   T63]  bpf_prog_a85a17f2ee3f38dd_tcp_zero_cong_avoid+0x35/0x37
[    2.635473][   T63]  bpf__tcp_congestion_ops_cong_avoid+0x54/0xb0
[    2.635549][   T63]  tcp_ack+0x154f/0x17a0
[    2.635601][   T63]  tcp_rcv_established+0x1bf/0x7a0
[    2.635644][   T63]  tcp_v4_do_rcv+0x5a/0x2c0
[    2.635682][   T63]  ? __sk_flush_backlog+0x1a/0xd0
[    2.635726][   T63]  __sk_flush_backlog+0x6c/0xd0
[    2.635769][   T63]  tcp_sendmsg_locked+0xc9e/0x1170
[    2.635821][   T63]  tcp_sendmsg+0x2c/0x50
[    2.635856][   T63]  __sock_sendmsg+0x67/0x90
[    2.635895][   T63]  sock_write_iter+0x122/0x170
[    2.635940][   T63]  vfs_write+0x2e6/0x450
[    2.635982][   T63]  ksys_write+0x74/0xe0
[    2.636019][   T63]  do_syscall_64+0xad/0x290
[    2.636060][   T63]  entry_SYSCALL_64_after_hwframe+0x74/0x7c
[    2.636172][   T63] RIP: 0033:0x7f723df3983d
[    2.636335][   T63] Code: e5 48 83 ec 20 48 89 55 e8 48 89 75 f0 89 7d f8 e8 e8 bd f7 ff 48 8b 55 e8 48 8b 75 f0 41 89 c0 8b 7d f8 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 45 f8 e8 3f be f7 ff 48 8b
[    2.636479][   T63] RSP: 002b:00007ffd27941000 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
[    2.636556][   T63] RAX: ffffffffffffffda RBX: 0000563e9d3212a0 RCX: 00007f723df3983d
[    2.636613][   T63] RDX: 0000000000100000 RSI: 00007f723d45e010 RDI: 000000000000000a
[    2.636669][   T63] RBP: 00007ffd27941020 R08: 0000000000000000 R09: 0000000000000000
[    2.636724][   T63] R10: 0000000000000022 R11: 0000000000000293 R12: 00007f723d45e010
[    2.636779][   T63] R13: 000000000000000a R14: 0000000000000000 R15: 00007f723e0ad000
[    2.636872][   T63]  </TASK>
[    2.636934][   T63] Modules linked in:
[    2.637267][   T63] ---[ end trace 0000000000000000 ]---
[    2.637450][   T63] RIP: 0010:tcp_cong_avoid_ai+0x50/0xa0
[    2.637463][   T63] Code: 81 f9 ff ff ff 7f 73 63 89 87 a4 05 00 00 8b 87 94 07 00 00 01 d0 89 87 94 07 00 00 39 f0 73 08 8b 87 a4 05 00 00 eb 1a 31 d2 <f7> f6 89 97 94 07 00 00 03 87 a4 05 00 00 85 c0 7e 33 89 87 a4 05
[    2.637469][   T63] RSP: 0018:ffffc900001c3a60 EFLAGS: 00000246
[    2.637476][   T63] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 000000000000000a
[    2.637480][   T63] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff888005bbae40
[    2.637483][   T63] RBP: ffffc900001c3a68 R08: 0000000000000000 R09: 0000000000000000
[    2.637487][   T63] R10: 0000000000000000 R11: ffffffffc0000740 R12: 0000000000055506
[    2.637491][   T63] R13: 0000000000044502 R14: ffffc900001c3b40 R15: 0000000000000000
[    2.637494][   T63] FS:  00007f723dd62140(0000) GS:0000000000000000(0000) knlGS:0000000000000000
[    2.637500][   T63] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.637504][   T63] CR2: 00007f723d55e000 CR3: 0000000005b61000 CR4: 00000000000006f0
[    2.639981][   T63] tcp_zero_loader (63) used greatest stack depth: 12352 bytes left
Killed
.....................................................CRASH LOG END...........................................................................

On the Patched Kernel,I ran the same test with the same BPF program ,The
callback excuted 224 times ,but no kernel crash occured .

This confirms that the new zero-value check prevents the
division-by-zero issue.

.....................................................SUCCESS LOG START........................................................................

Recent kernel messages:
[    2.152243][    T1] rtc_cmos PNP0B00:00: setting system clock to 2026-11-21T14:35:33 UTC (1795271733)
[    2.154790][    T1] rtc_cmos PNP0B00:00: alarms up to one day, y3k, 242 bytes nvram, hpet irqs
[    2.154977][    T1] i2c_dev: i2c /dev entries driver
[    2.156914][    T1] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    2.157092][    T1] device-mapper: uevent: version 1.0.3
[    2.160122][    T1] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
[    2.161740][    T1] usbcore: registered new interface driver usbhid
[    2.161756][    T1] usbhid: USB HID core driver
[    2.162294][    T1] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    2.166604][    T1] NET: Registered PF_PACKET protocol family
[    2.169587][    T1] 9pnet: Installing 9P2000 support
[    2.170649][    T1] Key type dns_resolver registered
[    2.197240][    T1] sched_clock: Marking stable (2171016244, 25654875)->(2200059312, -3388193)
[    2.201533][    T1] registered taskstats version 1
[    2.206129][    T1] Loading compiled-in X.509 certificates
[    2.226957][   T55] cryptomgr_probe (55) used greatest stack depth: 15120 bytes left
[    2.234348][    T1] Loaded X.509 cert 'Build time autogenerated kernel key: e8fda9cacabba08c333c311ed59e4dc8c8e12439'
[    2.263741][    T1] page_owner is disabled
[    2.266655][    T1] ima: No TPM chip found, activating TPM-bypass!
[    2.266883][    T1] Loading compiled-in module X.509 certificates
[    2.269914][    T1] Loaded X.509 cert 'Build time autogenerated kernel key: e8fda9cacabba08c333c311ed59e4dc8c8e12439'
[    2.269977][    T1] ima: Allocated hash algorithm: sha256
[    2.274434][    T1] ima: No architecture policies found
[    2.277392][    T1] netconsole: network logging started
[    2.359654][    T1] Freeing unused kernel image (initmem) memory: 2924K
[    2.359849][    T1] Write protecting the kernel read-only data: 32768k
[    2.360583][    T1] Freeing unused kernel image (text/rodata gap) memory: 372K
[    2.361723][    T1] Freeing unused kernel image (rodata/data gap) memory: 1052K
[    2.362634][    T1] rodata_test: all tests were successful
[    2.363066][    T1] Run /init as init process
[    2.363075][    T1]   with arguments:
[    2.363084][    T1]     /init
[    2.363093][    T1]     nokaslr
[    2.363097][    T1]   with environment:
[    2.363104][    T1]     HOME=/
[    2.363112][    T1]     TERM=linux
[    2.426402][   T58] mount (58) used greatest stack depth: 13520 bytes left
[    2.467512][   T62] ip (62) used greatest stack depth: 13208 bytes left
[    2.571410][    T9] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
[    2.714858][   T63] tcp_zero_loader (63) used greatest stack depth: 12888 bytes left

TCP test completed. Entering shell.


BusyBox v1.36.1 (Ubuntu 1:1.36.1-6ubuntu3.1) built-in shell (ash)
Enter 'help' for a list of built-in commands.

/bin/sh: can't access tty; job control turned off
~ #
~ #
~ #
---------------------------------------------------SUCCESS LOG END.......................................................
I have collected the logs from the both kernels runs.

Thanks
Shahid.

On 2026-11-20 12:27 +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
> 
> 


