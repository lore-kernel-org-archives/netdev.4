Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417193;
	b=HsO7U5FUr6vD2Nh7L9Zy2tmNBWFZItjyf3+brFAUpl1cVd0d6YSB5aWiXIvyqwlads3B
	 vk5Yr86gigpK2szGXGv4cslxJ1t7QRVXU9RFvpJ1oooAGvoFLwvUzo7LupJtxXj3aG+zl
	 jjBtHpNW6A8IvSpiULrX+TNREw19sICEY6mB5G+w/zzwH4JHSWRACHvijHxlTg90aODG8
	 rMXUb0GsoX5va6xlI66bRCzdrwA2TZ2EPgen+qZ3y31eryLKN8HhnCanlpG7iAqjEGFEL
	 80DsUvqi003ampndye0CzTrCDq9yi/o0Yr/0p/aN4x8dffpWlLuVPHgJZNuEQBCUoTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-Id:From:Date:
	 Subject:To:Cc;
	bh=aNd/5TXn62wrV59NoqvHzu/qryqHBGcK3pYA9bcd7eI=;
	b=iGDouSQoR+FhbI7b9YqaHmpsGYl3cxrsQYSEJfHMwSFOil9MC9rmUPbiKaz511Cxwabp
	 PflmIR8AeRmxlVi+uPy22zST5dyr0tc3qe+l1RGtlmQ3i77H2oL20PYiaHD9aID7tUJjq
	 NWLVj6foevof9cXiSZZ21DIvzeiHBbCapz5Y4pjfbzUAitlMkeyYRhMxmOwjlCXOGvgud
	 bzwmfmRjfOEA4bEfrohypuUXMk/Zpe5CAFmndIEulIPEFBez5PRYNBDQT72PnN9aA23aU
	 Bqzj1HK/gM7HDMeim4Sd/QnWzZKjaSqVqmR3yEvrsyLQ3zWpMg7v7FKm/f3l9l1hlQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HotC2N/X";
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56971606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56971606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HotC2N/X
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3b41c8d9767so1720422a91.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417192; x=1796021992; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNd/5TXn62wrV59NoqvHzu/qryqHBGcK3pYA9bcd7eI=;
        b=HotC2N/XG+D3mj16YQNFOhwxtbfKCnLRBN1zKLKoaDiFWFHAQIwtTOVHikgpglJbx4
         tlw5EmtA76XCqZJy521d0QrmtenTNrChPHA6tw9f2cB4fJAol3tkt9KpwKyfOuhTFLIJ
         AbbhaPFKsz8+5llK4UfgxsCx7Lr/QdsY2yOQ00U93bu5aiP/IsW6NLfMNQsrtW/cuik2
         DzOApedhVZiejQjr8rQ6s4OGUi6mXbLJg70DD3Lhf2YuB4nMNkn+bsVl0oBUEn85xm+1
         i8iR7e+vyOBKqUUHwRj1ZWQy0bZYlerkXNZ6Pirqcy8IsBUgx4iLhC1HcbV8z9StwB5F
         AAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417192; x=1796021992;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNd/5TXn62wrV59NoqvHzu/qryqHBGcK3pYA9bcd7eI=;
        b=TFx424cXq962UXoIegBTas7oqHO7TeXTY5fuH7Ie0QjMASNE/lewnykbVh4nr1vAtR
         JgnM1CtDVBQBtu0H3n7uawb1d2zP+ZFtsQrE2ENQqL0SpM52a2uWrUT1+r6hGawcsK/B
         4J1/j0Z53cNPWpnJv63OWhqzANNTlHtdkmF1ltUTW0OXZhd2TcXpy3WOvAe+8lraadz3
         ysmksBV4SLWT1NJduWHdWut4ErcFPmdhxlH+0KrolNIoRRB2cr+nFWy6NO8iTXziXmZQ
         5DaQwHOVpJ2PvR7WKMC2vf8Lvw+bn1/PG3DcpJfyUyN8oddDnHO4rB27576v1ln9Wjaz
         +8ug==
X-Gm-Message-State: APuU4Z+9QyUL9Y1YT4/jptFbbtmGdIl7K1Xt1sKpG1XipWHYAb2PJDgs
	j5esXrDSEN+pXDxVftJgCM59Gf8neHeaoWn8zE51lCYIRdek7cHdngxgrx/bgLYsln44UxKu
X-Gm-Gg: AZFdTZcAS2Sr2m96OsQDGV9S3oO1qVKBStC/GHkIaMEdRmlG16mY6MHQoMpVRiJNWYT
	wQlCIwfN7Yt61Dqh/3gGrMjpD9Bzr5Yop+IKrwo1bWnVXEsAXg2rxViM4E2H+uZr3sQJvT8cbyV
	0mGJKHGPrpgD3Z3acicN6HJQeTJ9Kjy5pKeI0PscSol0zipqjr3EFFybYqF2304bsotff1d9gZG
	KudwppxhXoVtXrMXCpHWN1OX47Z23NJU0nM7NIS+ocA3quVT9bwxmmNRkYLn9UunbkdWtS3qCkk
	WkEqkzf7V0F0GrkCLi8NzzV6ddlvNtYa7N2Css+WNrS72Dkj1hBi9dgFRPBK84aZMa1K6PlRI2T
	YDoDFX6J5R4KOofuuXBfSTwzCLqVCJwJI0sOWmRx30oyRFtbCly/jzyElOvvbbPMkoC3JgljHdy
	tACwor0s8Gifipq27PBUgzstBP9onNgKoMULB9p7uAS+IVR1EPJRvRS0RB3WirC2zcFqpbETAq8
	C6ccut7zMwXoATqM2QUrVKZhwR3ZVmK2cdtaNBINbmCY1p/+KvGFt/bKfagGDYqUSGDv96tkJHV
	F9eFrUdAFzJfzbWHVB8ddt8gEygHJeGPCR2h+xo6Wuoam6puy43fGHe2
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr11290934a91.60.1795417191648;
        Sun, 22 Nov 2026 22:59:51 -0800 (PST)
Received: from smtp.n0ps1edzz.local ([120.253.139.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm16915461a91.12.2026.11.22.22.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:59:51 -0800 (PST)
Message-Id: <20261123133000.3.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Mon, 23 Nov 2026 13:30:00 +0800
Subject: [PATCH net] ipv4: ip_output: fix use-after-free in ip_mc_output()
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    David S. Miller <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Hangbin Liu <hangbin.liu@linux.dev>,
    linux-kernel@vger.kernel.org,
    stable@vger.kernel.org
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list


ip_mc_output() loads rt->dst.dev without RCU, stores it in skb->dev, and
passes that pointer to the POST_ROUTING netfilter hooks.  The stale
pointer is carried across the hook call, so the device can be
unregistered and freed before the hook dereferences it.

When the interface is unregistered, the route is torn down and the
net_device reference held by the dst is dropped.  A legacy iptables hook
then reads the freed dev->name through ifname_compare_aligned().  The
hook is a normal netfilter configuration inside the network namespace.

Use the same pattern as ip_output(): take rcu_read_lock(), load the device
with skb_dst_dev_rcu(), and hold the section until the final
NF_HOOK_COND() returns.  Drop the lock before freeing the skb on the
TTL-zero path.

KASAN reports (trimmed to the relevant frames):

 BUG: KASAN: slab-use-after-free in ipt_do_table+0xf88/0x1060
 Read of size 8 at addr ffff888105348120 by task mc_race/116

 Call Trace:
  <TASK>
  dump_stack_lvl+0x55/0x70
  print_report+0xcb/0x5d0
  kasan_report+0xb8/0xf0
  ipt_do_table+0xf88/0x1060
  nf_hook_slow+0xb8/0x1f0
  ip_mc_output+0x71e/0x9d0
  ip_send_skb+0x11e/0x150
  udp_send_skb+0x637/0xd60
  udp_sendmsg+0x12d5/0x1dd0
  __x64_sys_sendto+0xdb/0x1b0
  do_syscall_64+0xee/0x500
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 122:
  __kasan_kmalloc+0xaa/0xb0
  __kvmalloc_node_noprof+0x216/0x5d0
  alloc_netdev_mqs+0x7e/0x11c0
  rtnl_create_link+0xaa6/0xe30
  rtnl_newlink+0xd31/0x1e50
  rtnetlink_rcv_msg+0x697/0xa00

 Freed by task 122:
  __kasan_slab_free+0x61/0x80
  kfree+0x201/0x440
  device_release+0xc8/0x240
  kobject_put+0x101/0x1e0
  netdev_run_todo+0x611/0xe70
  rtnl_dellink+0x343/0xa50
  rtnetlink_rcv_msg+0x697/0xa00

 The buggy address is located 288 bytes inside of
  freed 4096-byte region [ffff888105348000, ffff888105349000)

The faulting address is object offset 288, the dev->name read in
ifname_compare_aligned().

The lifetime bug comes from the v4.13 series that removed the dst gc
list.  Commit 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly") made
route teardown release the net_device reference held by the dst, so
dst->dev no longer pins the device for the lifetime of the dst.
Later commits changed the replacement target to blackhole_netdev and
added dev_rcu, but did not add RCU protection to this reader.

The lifetime change is present from v4.13 onward.  Kernels that reach
this output path are affected, including current mainline, net-next, and
the 5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y and 6.12.y stable branches.
dst_dev_rcu() is available in current 5.15.y and newer; 5.10.y and
older need the equivalent rcu_dereference(dst->dev) backport.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
Window amplification: none in the kernel.  The KASAN report was produced
without any instrumentation; the race is widened entirely from userspace:

 - one veth pair veth0/veth1, veth0 10.0.0.1/24, veth1 10.0.0.2/24
 - multicast route 239.0.0.0/8 via veth0
 - 4 sender threads, each paired with a blocker pinned to the same CPU,
   both SCHED_IDLE; the blocker stops the sender inside sendto() for a
   random 30-4000 us
 - a deleter thread at SCHED_FIFO issues RTM_DELLINK veth0, waits 45 ms,
   then recreates the pair
 - a legacy iptables mangle table with a POST_ROUTING hook is installed
   via IPT_SO_SET_REPLACE; the rule reads outdev->name on every entry

Three independent boots hit.  The report below is from run 3
(mc-natural-run3.log).  Run 2 (mc-natural-run2.log) hit during the first
delete cycle with zero successful sends (every send returned ENETUNREACH),
which shows that only reaching ip_mc_output() matters.

Report context: 7.4.0-rc2 #38, CONFIG_KASAN=y, PREEMPT(full),
kasan.fault=panic.  Full log: evidence/dyn-mc/mc-natural-run3.log.

Object detail from the report:

 The buggy address belongs to the object at ffff888105348000
  which belongs to the cache kmalloc-4k of size 4096

Base tree: netdev/net.git main at af6737b90668.  The pre-image blob in
this patch matches that tip exactly.  The same hunk also applies to
netdev/net-next.git main at eb6d6c80d354; the target function is
unchanged there.

 net/ipv4/ip_output.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index d42d776..7e10339 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -367,7 +367,11 @@ static int ip_mc_finish_output(struct net *net, struct sock *sk,
 int ip_mc_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 {
 	struct rtable *rt = skb_rtable(skb);
-	struct net_device *dev = rt->dst.dev;
+	struct net_device *dev;
+	int ret;
+
+	rcu_read_lock();
+	dev = skb_dst_dev_rcu(skb);
 
 	/*
 	 *	If the indicated interface is up and running, send the packet.
@@ -405,6 +409,7 @@ int ip_mc_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 		/* Multicasts with ttl 0 must not go beyond the host */
 
 		if (ip_hdr(skb)->ttl == 0) {
+			rcu_read_unlock();
 			kfree_skb(skb);
 			return 0;
 		}
@@ -418,10 +423,12 @@ int ip_mc_output(struct net *net, struct sock *sk, struct sk_buff *skb)
 				ip_mc_finish_output);
 	}
 
-	return NF_HOOK_COND(NFPROTO_IPV4, NF_INET_POST_ROUTING,
-			    net, sk, skb, NULL, skb->dev,
-			    ip_finish_output,
-			    !(IPCB(skb)->flags & IPSKB_REROUTED));
+	ret = NF_HOOK_COND(NFPROTO_IPV4, NF_INET_POST_ROUTING,
+			   net, sk, skb, NULL, skb->dev,
+			   ip_finish_output,
+			   !(IPCB(skb)->flags & IPSKB_REROUTED));
+	rcu_read_unlock();
+	return ret;
 }
 
 int ip_output(struct net *net, struct sock *sk, struct sk_buff *skb)

base-commit: af6737b9066832a2017c281159950ba92385ce00
-- 
2.34.1


