Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795293341;
	b=JpTjPg6G3m+XDCu57OQewTsINegq01wYzciWvYg3W0I1US8BJIRj+VJtG5gJTKhOcN2y
	 pVLSJ3tDLdJ8Up9rgoYdNkpLcn3xNeDpzCY3SFbnxhEeaMrWgfgT3uK4Hepuf7clUBJrY
	 WigC+1cRjrsgijyaB3sERyhp6zoJh9DJm9D9PjzoRAaF5RsZqyS+PdEIvhK1SKlA7yq1X
	 Jm2BV0QTb34/KqdFnt0u1T2V6+YvIsO2AcB/0tTyU4+EWnCOC/mlb1qFladay/qDOkzf0
	 /sPLQ5tHkoqCZlfiG37p2EyG0nh7Iqv6Nx7zcpVcDxzkTtNgX6nUxnHWeRBLJ8ZYyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795293341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pOTuHvezpiFXq86+EB4R9oPI2G2W+RnJ+wr9wT+PyzI=;
	b=3mRLuddWWgRFdIVWQIKzjGcRsM2iSEUNblyagjD7HWe6kw+RcN6896ohG4oSMVp6vRYx
	 zjs2fyd6T1royUf4xrl0IIsbkpWv/FxQBVqLt9hXjzEocYk0USw5FCGUS3qZOWs9feuZq
	 V6gCOv966t3LqV5NY9M/3+2k+HIzT1uVwQYegwKkxYIn+gahMGBNquO469QIXtAOJv1n+
	 rCFaTY5uJ+i1FvtQbgLXqq8D0wTasKQ/D7eSAw84wRBCU1P/CSmQPIte3AaB8G7JaLfgF
	 eLEePnE8x2sx8UJMo+8K8K2pYLMwrLdD41QlHUQDJkRa9Yday4iIDCHrAR76II/e1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aCHXgs4c;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134BD606A685
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134BD606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aCHXgs4c
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1357859a12.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 12:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795293339; x=1795898139; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOTuHvezpiFXq86+EB4R9oPI2G2W+RnJ+wr9wT+PyzI=;
        b=aCHXgs4cJZZ7ZbFBtFjyZ8kjOZnPfVgM/LT0Y9/Pu1ssf96p65BMYoyHznD6Tvzoo3
         r/L7u37JCkqW0xD7J979k5PV7ZwTxoy/OoLZtyuunf5LOS0/x5pU43FRkVXcTAwWG+gl
         1Lz4t4VIL56UKMH3WRB8OocpFLk55U20nF92ctFGTDyxJTv+po46y5nia2deOKy0MUE0
         qIsfp5fa5iYo9gZ0kSlpvK7p+v2ZLEjOwrfAhaNmLfhiVt9ElCP5QnGq+cBQ3z2Wm+Yk
         iYc89ipvapEc5sJrIPb9OW+tJ7i+qn/BvUHrXt5+3G8lav8oWBCxzuQ1FwujXiC6Y0fd
         yKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795293339; x=1795898139;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOTuHvezpiFXq86+EB4R9oPI2G2W+RnJ+wr9wT+PyzI=;
        b=ThwpmQEl3+XgWhD2ruNd/p9os4RPG0TMNgD/sWSVs/4WDA1c6n4+MEj7fpFNOlXFMo
         y3XLwehUf/IYAUMs1UDQpxeDvDSO9BKRlhp6HPk/4cNB+Pb3d0Xlx7gzTU0wMmLJ5jT1
         nz3uCD9lP1R128YrQctmZCHXEz5FrcXRIuuIRkRc303cX0neXCWVkw+ODU4F+3QUarUS
         5E4FaSmjQa0Yq9F9WwjIXxirZyfPmcXfL6AqhEgffNpizWlryVXlHGY6zla7qL1Chc2A
         mqtmJyeSTzBv+Z9ixiiEN0GAT7L0I8CSt63zyZYfbfyqfawSg4PC+7ZMIP+p896iL5Fy
         T7Dw==
X-Forwarded-Encrypted: i=1; AL+hErHPRWAk9M1QAKzB/Z0n7FrtwyZhszuCMWBPrkqbZRvwDtmDVYwk6ljLWZfPpwYYd2Mv+15Q648=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B5yiDGvdDPTeD0VPQOF/V0e84axBP2Qv4CkCdMrm8XyrGfCv2
	E/PVlNkW5a8FH2VnAxvpNUZelQTCHPuq6yWpKYXIslEWU3765pzgr90gkWluF2HDhTEIKki6QmZ
	tiNZXUQ==
X-Received: from plq11.prod.google.com ([2002:a17:903:2f8b:b0:2f0:3fc0:c08])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce85:b0:2ed:1350:59ff
 with SMTP id d9443c01a7336-2f03ef594c0mr67967415ad.3.1795293338956; Sat, 21
 Nov 2026 12:35:38 -0800 (PST)
Date: Sat, 21 Nov 2026 20:35:27 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121203537.341320-1-kuniyu@google.com>
Subject: [PATCH v1 net] tcp: Don't clear saddr before ->put_port().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Joanne Koong <joannelkoong@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When CGROUP_INET4_POST_BIND or CGROUP_INET6_POST_BIND prog fails,
__inet_bind() / __inet6_bind() calls sk->sk_prot->put_port().

For TCP, __inet_put_port() calls inet_bhashfn_portaddr() to get
the corresponding bhash2 bucket.

inet_bhashfn_portaddr() requires saddr, but it is cleared before
__inet_put_port(), leading to bhash2 lock mismatch.

This triggers list corruption or use-after-free by a conccurent
thread touching the same bhash2 bucket, e.g. tcp_diag_dump()
with TCPF_BOUND_INACTIVE. [0]

Let's clear saddr after calling sk->sk_prot->put_port().

[0]:
BUG: KASAN: slab-use-after-free in tcp_diag_dump (net/ipv4/tcp_diag.c:415)
Read of size 8 at addr ffff88810ae0e7a0 by task a/1007

CPU: 10 UID: 0 PID: 1007 Comm: a Not tainted 7.4.0-rc3-00456-gd5b89d55a322 #295 PREEMPT(lazy)
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.17.0-debian-1.17.0-1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:120)
 print_address_description (mm/kasan/report.c:378)
 print_report (mm/kasan/report.c:482)
 kasan_report (mm/kasan/report.c:595)
 sock_recvmsg (net/socket.c:1154)
 __sys_recvfrom (net/socket.c:2333)
 __x64_sys_recvfrom (net/socket.c:2348 net/socket.c:2344 net/socket.c:2344)
 do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:89)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
RIP: 0033:0x7f2f268f8e92
Code: 08 0f 85 91 41 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 55 bf 01 00
RSP: 002b:00007f2f26874d28 EFLAGS: 00000246 ORIG_RAX: 000000000000002d
RAX: ffffffffffffffda RBX: 00007f2f26879ce4 RCX: 00007f2f268f8e92
RDX: 0000000000004000 RSI: 00007f2f26874db0 RDI: 00000000000007d7
RBP: 00007f2f26874d50 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000021
R13: 00007ffcbb216e70 R14: 0000000000000000 R15: 00007ffcbb216f77
 </TASK>

Allocated by task 1009:
 kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:79)
 __kasan_slab_alloc (mm/kasan/common.c:354 mm/kasan/common.c:380)
 kmem_cache_alloc_noprof (./include/linux/kasan.h:257 mm/slub.c:4720 mm/slub.c:5033 mm/slub.c:5047)
 inet_bind2_bucket_create (net/ipv4/inet_hashtables.c:162)
 inet_csk_get_port (net/ipv4/inet_connection_sock.c:573)
 __inet_bind (net/ipv4/af_inet.c:544)
 inet_bind_sk (net/ipv4/af_inet.c:470)
 __sys_bind (net/socket.c:1947 net/socket.c:1978)
 __x64_sys_bind (net/socket.c:1983 net/socket.c:1981 net/socket.c:1981)
 do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:89)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

Freed by task 1009:
 kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:79)
 kasan_save_free_info (mm/kasan/generic.c:599)
 __kasan_slab_free (mm/kasan/common.c:267 mm/kasan/common.c:299)
 kmem_cache_free (./include/linux/kasan.h:239 mm/slub.c:2780 mm/slub.c:6637 mm/slub.c:6764)
 inet_put_port (net/ipv4/inet_hashtables.c:178)
 __inet_bind (net/ipv4/af_inet.c:554)
 inet_bind_sk (net/ipv4/af_inet.c:470)
 __sys_bind (net/socket.c:1947 net/socket.c:1978)
 __x64_sys_bind (net/socket.c:1983 net/socket.c:1981 net/socket.c:1981)
 do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:89)
 entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

The buggy address belongs to the object at ffff88810ae0e780
 which belongs to the cache tcp_bind2_bucket of size 80

Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
Found while reviewing
https://lore.kernel.org/netdev/20261119192133.2632936-1-dmnk@google.com/
---
 net/ipv4/af_inet.c  | 2 +-
 net/ipv6/af_inet6.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 8822bae439f8..5d03a9149b40 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -549,9 +549,9 @@ int __inet_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 		if (!(flags & BIND_FROM_BPF)) {
 			err = BPF_CGROUP_RUN_PROG_INET4_POST_BIND(sk);
 			if (err) {
-				inet->inet_saddr = inet->inet_rcv_saddr = 0;
 				if (sk->sk_prot->put_port)
 					sk->sk_prot->put_port(sk);
+				inet->inet_saddr = inet->inet_rcv_saddr = 0;
 				goto out_release_sock;
 			}
 		}
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b42a1a..b85125c3f14b 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -398,10 +398,10 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 		if (!(flags & BIND_FROM_BPF)) {
 			err = BPF_CGROUP_RUN_PROG_INET6_POST_BIND(sk);
 			if (err) {
-				sk->sk_ipv6only = saved_ipv6only;
-				inet_reset_saddr(sk);
 				if (sk->sk_prot->put_port)
 					sk->sk_prot->put_port(sk);
+				sk->sk_ipv6only = saved_ipv6only;
+				inet_reset_saddr(sk);
 				goto out;
 			}
 		}
-- 
2.56.1.750.gf70dc682cf-goog

