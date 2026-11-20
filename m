Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172245;
	b=4VTrkYAehN3oRKq0Yx4lGV7FMX1XFtGjQBbI5hAVQHazzeThRW5pWPa2KPlcVZDaExN5
	 8isrPyJGQ3j3ypiJ7SJxLkyUlrZNbFw7QG7eQVJL9KwfmyLFsD2eDQYtOsYrI3AzTBo/H
	 vaEtpnJAWPLuZ2CiK23pKAFANhIuk24Vn8mWYmKfgix6jOgRp7GNYuKwAN0wZiv+RWHPd
	 cn93tlPgH3jATo7wO3/jzjbzxXLyFM9nNOD9x5l3LLoYIf6wHl0C4/Ii1brFQ6Q2zn5wn
	 T/E95dbj7tO3B2Yn7G8dGolWGP+6J1ezKzIkdfLgQG/+KHPdzsN1497YGllBi+P4JRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DtNV5VxWZRYPm+qkkMJsylA6Vg/UOHe+uIII8BQIetA=;
	b=pQv46eIUJnoKmUJcpppt/ekQ/rkEnbWzou836kEiQCqExa/k8qfXfHgi8mEPv01rsc1f
	 Xl57GbGRfLs+Go90JmlPTxtxbVjJLwAx4Jr+1h9bOJxe0Gh179THcIfMYrcVyF3wc5qD4
	 1pbEzhtJL6XQgAEaYbCvxxOP93DAaq8Gw1ZLmeBKjz8uH0XsoMqaw0Laj3MelRktM5ltq
	 d9C2KxQMLjJyI06MppDIlQZH0m8JmvAvbBNXAQ++ZVYfyVjJyAyv4VqfR6eL0RhszRe7o
	 mqGslMFaAvLkhmFHhYTtyZNa3SzqC2+FNlzh3IuCN3TeI2pNUZFI9ycoTbwzMA7hHqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SoU36Rrp;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69AC606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C69AC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SoU36Rrp
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso451374a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172244; x=1795777044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DtNV5VxWZRYPm+qkkMJsylA6Vg/UOHe+uIII8BQIetA=;
        b=SoU36RrpP0fAvcxfHnVD1gS9A6b1JLHYlH953RVwxmM3EYg81GAjCqrR03smdAsG9X
         MUUQttVK7hSH6Bp/t+dU3YLFaGzwsQY0RosxNJOGVl/cCcTeB0sIOq5lDj+lGiUcUt/P
         3nMcbs0RABVK4edyFJiHfbBPwo1v70GsNfpYTxui4PP+TY7zFarBa0O+Fag0Qa7qy6eC
         N/6Q4fj8LqN3aL76KXZAVcqjxMPhc5xZhZn+qTKNqIHpjDI9J93r+hK/U6FPB5QU/jAu
         v7NwCdO7Q2opz+nXTbtCos5wZhHiYm5tbPZgJYrT512lDFSipRI3GGKAmj15+OdukaYh
         wl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172244; x=1795777044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtNV5VxWZRYPm+qkkMJsylA6Vg/UOHe+uIII8BQIetA=;
        b=K0nEkpWVXJkmOJSiAXuRr2Wxhxve2sKVwexkJOth+UZ7sgVGn3ixGS2QswGzeiCZE3
         U9qt1KLb8U+v+PcEZ0kE2ETD1JAytP8CQVJUxxxel7Ofl20LEK53hfyBf+yPUZec8i82
         dNh4JWiYf+twIwPdyo6hXXUrch+bTbIaeB8dVKPaDvJyQWQuVQmdK8L+pWi3MaQFXlys
         0mnoPE0Um6gsqDkF1rX787pwjgd4VqI2U2MXCk+ikoQbYR4CRWBtPfOFjma+kPf04maI
         V/rOWO3Xl19KdljQevA0jdfjixD1PKiuuV67oC1BdWkr9T1vQYmtZscvkmp39tiqESof
         g5MA==
X-Forwarded-Encrypted: i=1; AL+hErFxO5mJve85OOmubJf+KHKPqnf6E5VcLQXhwRIBj1I0fcOytkNqWn8VPMU9ANlEuFKqO34Bluw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+MUXpgFUmW2m3BZXxWeEI0394Way/HAf2fxHuSNVSrKIlmHzb
	NgGBLk5cAvVBCeO9VSFI/ugSun7DNZJTLbfBZ1aBe5VTXBZS/GhtrJOi
X-Gm-Gg: AZFdTZejufGt0GR58WaQub4hZ3IDNQ242emutqTZSxbwYhzX3pONCbOAJjsAveB471f
	MTLbqVgIg5c5zfFq0U0PiYzsJ2+YD3bc2OHLGA3q24RPGksbwFjBKDI1oKxEd8SSdxoMIRfRuBg
	9mZtH+ZA/3IkJNrpMg5x6SMoXAvkIq+S3kv9hgTxfZ6598jtrYzQrNWD/fX9g4Ozj/Djh6FBhl8
	VPzFb1wIKe85Ehw7s4PvgRZfvJv0aR1XKP/Y5rMKC3EzUJf9tnU2FBIXa5CpDQgPJO0Ifj+Q0iK
	yBqEnEnnQYqAnLZYwns61S0kuUy5qzmwmJHQ1CMBdoiot+uX4zzTaxd1saquACYAe/xdBXB2x2H
	1Sfnec2UVCWaTobddl4G7sRblanlngL69pGDJfb4GS+Lb7WJoCx72F0n5tMo+w1yrgI30QY0d8W
	4H4hl2nSWI+9Yr0MeXjqHCu2+C6CwCytukHbOtzSOBA7xjnvKxiSMw4OcgNGYWn8sGNtXOd+ySw
	5IPpFdeR4q/k+rM/6moR/lnwUSOavJNXuo2VYhzzEnOehuPvpJ2hrgGzJIWI5mvrcySRG6yjGmp
	ed4ZjjLULhfifeAPwjXAR928KWzlz0v+O7dn2HTWDxM8vv7u+SI=
X-Received: by 2002:a17:90a:d607:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3b41c7c776bmr2760098a91.8.1795172244164;
        Fri, 20 Nov 2026 02:57:24 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm4176886a91.5.2026.11.20.02.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:57:23 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH nf] netfilter: nfnetlink_queue: drain cleanup work on netns exit
Date: Fri, 20 Nov 2026 19:57:17 +0900
Message-ID: <20261120105718.866862-1-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NETLINK_URELEASE unlinks an NFQUEUE instance and schedules its
destruction through queue_rcu_work(). The RCU callback queues
instance_destroy_work() on nfq_cleanup_wq. Queued entries retain
entry->state.net, but nf_queue_entry_get_refs() pins only their
sockets and network devices.

A migratable device can return to init_net as the old namespace exits.
cleanup_net() waits for the RCU callback but not the work it queued.
It can free the namespace before instance_destroy_work() calls
nfqnl_reinject(entry, NF_DROP), which dereferences the old state.net
in nf_hook_entries_head().

A source review assisted by a coding agent identified this race. A
65,536-queue reproducer on unmodified mainline with
KASAN and lockdep enabled reported:

  BUG: KASAN: slab-use-after-free in nfqnl_reinject
  Workqueue: nfq_workqueue instance_destroy_work

The free stack included cleanup_net(). The trigger used
initial-namespace CAP_NET_ADMIN and a migratable virtio-net device;
it required no kernel modification or fault injection.

Drain NFQUEUE cleanup in the pernet exit batch. rcu_barrier() waits
for pending RCU callbacks to enqueue their work; flush_workqueue()
then completes that work before cleanup_net() frees the namespace.
The batch hook avoids a barrier for each exiting namespace.

The same mainline revision with this patch built without warnings and
completed two 90-second reproducer runs in KVM with no KASAN or
lockdep reports. No netfilter selftests were run.

Fixes: 936206e3f6ff ("netfilter: nfnetlink_queue: make hash table per queue")
Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
A custom LLM-based coding assistant helped identify this race and prepare the reproducer
and patch draft; both authors manually verified the source paths,
teardown ordering, and KVM test results. The standalone C reproducer
and complete serial logs are available on request.

 net/netfilter/nfnetlink_queue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index a8aa7ad832c3..5eaa314ed59f 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -2201,9 +2201,17 @@ static void __net_exit nfnl_queue_net_exit(struct net *net)
 		WARN_ON_ONCE(!hlist_empty(&q->instance_table[i]));
 }
 
+static void __net_exit nfnl_queue_net_exit_batch(struct list_head *net_exit_list)
+{
+	/* Wait for RCU callbacks to queue instance cleanup work. */
+	rcu_barrier();
+	flush_workqueue(nfq_cleanup_wq);
+}
+
 static struct pernet_operations nfnl_queue_net_ops = {
 	.init		= nfnl_queue_net_init,
 	.exit		= nfnl_queue_net_exit,
+	.exit_batch	= nfnl_queue_net_exit_batch,
 	.id		= &nfnl_queue_net_id,
 	.size		= sizeof(struct nfnl_queue_net),
 };

base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.43.0

