Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417185;
	b=GTOqHXiXMqKni/2KhC6SIDCalS7J0cdEkn7W6j5XI78g5L5QFGweGTstqk+FHL0nTZGK
	 bHtTx7+AdfwOhuMpzbmCIgMZnGP9I8YqWZFhwVIrod79XvOeXkswxLZJvNK194wOXIcHl
	 JNMqVZVCQkSWSVqhOWChNmddpMEAkgE9Y3Z3fK3VneGRlXqXSdUHRCQ9dv08+0B79jkje
	 WFKzHkBs2MFsVKLdAE6YpAhXs9kOPKFeobOSKSmBdJeBcL7S59Ws4HxiWXkF1Z6wBL2bX
	 VRtQhsnE8mQ71zFqbthGDu8fb52t8PIVtx18+l1q0tg8KeWDP5tBI9Ax5ANkHz5r87w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-Id:From:Date:
	 Subject:To:Cc;
	bh=k/7X2LCq5GJYBOy/M+xu6XNBMe0qdeGs2S6qILBKKsY=;
	b=SPTSMw1nyNJjXmLDoh+5MU7TVp1gdev+iwt6Ou8OM6WWrTIoRPwXDUImrYsywQQv11g0
	 AuCZcLf/+Ty5pQo5lRwnA/+rPRfGGtrWS2K0F+Ufr5KpBaJgtSleuma7lHW+eHvnhfAuX
	 OJF6oQ8w8CQihnY3Ii4UylGfM6RF0NEpC2XqN8Zax+QOhzvVfJnSyRgLgWX+NB4Z/LLLJ
	 6nazNXqICLgl1tufNiBZylDYYS3ql/XQqZ1UlHkfhPV4hR5BlTl0LxvZVf7VTrypBv6Ij
	 fExueNOsbJOh40R2T1DD4ujwWzdbJYmRcQSq8AI07e11cP3UtVu5OE3EboerO/5ZKyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqAAH8zZ;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AA6606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AA6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqAAH8zZ
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b497279c25so288849a91.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417185; x=1796021985; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/7X2LCq5GJYBOy/M+xu6XNBMe0qdeGs2S6qILBKKsY=;
        b=uqAAH8zZvQjt2N8tHeB9Mkz9ejeGUZyJd2ILHh9aOvhXQTBb/Bu2wqOA9pDXEenGbF
         wGaa7BIWmvtLvwQS5OhubLrVP9miHaOVkkxgoYyEJ0rsS43FhNeNxRiT4jqrbLmNjPec
         T2i+hWzDAvQeVE/6cx/EBFTvIhCYnCCt0dfRhvVD1mfXFyk6rv92Oi4OlCuhl2T7X3JG
         mj3R7P4Rci/tEjG+Ehqi0k4pTIUjjsigvHt20LmG09YFpYkeDcc8JhF3LqcDEGaEsVuu
         Gi7HkjAzCkuIB010u9Dnjo+/KTuiYzFSmjcBo/sP1yxjn7kJLwqu/fKLgxcNfeIlO07E
         lp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417185; x=1796021985;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/7X2LCq5GJYBOy/M+xu6XNBMe0qdeGs2S6qILBKKsY=;
        b=HWrwCWZzxmIljmvotbLs5959Og84KdRkJ/8MmwskzlY2iY2VWhDOEsehGZB5mxFYgf
         vwdaffS4ckHi+paXzUCb0m5y4L/5so0Ll8gGIWtG/PGvt96RUBdGxy7kvVWcgecGR4zO
         fKpjgBFuQBLpvXLG5cQctperlgpAIRYQwbsoKwrWEEQaVddtWWkocRd93QKmhhxbi6KS
         c+eq5OWyB5V0YB9v18scLJcf/nPtoxYVzTkaBJdEJMxuuyE5G3ookuaKb7tBiOGyJ3cl
         qwbAFb5Pk9G91DG+7ZS0eDNGzQ6VSAz1y7kU5smbNwYtPJc0I9i0fjxLu8PBVeg4HAjK
         CDGg==
X-Gm-Message-State: APuU4Z+ZkRDo4ZxcTozakHtrgzyY6db3laPnndlKtQW6gw65q6GIpba5
	SgmzuRZnNXguaBpS1MNGYQnGHgM1m/PIhNNBpvqIy1vxfqjzOoME5uV9Me4oGGBXWimV4SQrZAM
	=
X-Gm-Gg: AZFdTZfp8XP4+ZobMCPuA6hoB9cYatMNQs3zPg2LRxymLqLh8OWtjj7CUrQPxICovjI
	kkJEElnOihqw44YRsCB31Zl5S1h5dXFsTNOWsIjUHprOnBpFB8W2HB79nON6Z2PpSuncMRtxAqK
	WycdZZpFAftp9CGvt5QixC5dRUKFKBnsxRws3czU41h7I1K2+IpaxrZKMeHKn0sX6ii7Ia7BD9A
	lcDDXjOyspqJUXd0CtrwRbDHTjtGzxjUtmrJUZjojhtuXYM2Hnc0N8eLHL+kQydGppMOtO3zC7A
	cSK4002BmpGcg+WrjS2APUTLzpJEO0Z8meR2grh3LAOzd0AXbupmsub91hFrSWLALrn2OVKJ9F2
	2Ni/bQEZqA/JMhAAbGh6ZdWBcHLjDtKhcnfSYNCHkuC2XeuqahhPrpdTyE7nMCMlMGKC70x3qQx
	2fWAU9y4t33Fui3OCLTmQQU017qaQxLHR5arIH24u+8QBG9QdsA9sRlg3opX6JnxbTFeLl+FqlT
	1N5H5EUXkxOZi3As4uzeaXEAMPkTTLtFQpmNBQJXFA2aa04Nl4zMtsg2pU297HfNAV7a6Otp4df
	GaauvmhZMkmHdBvUNIVRLQ12WtwrKkI7dfyTMoLO8hPp2HZ/XD0XViXH
X-Received: by 2002:a17:90b:5546:b0:3b3:c44b:b779 with SMTP id 98e67ed59e1d1-3b41c935639mr10465956a91.46.1795417184963;
        Sun, 22 Nov 2026 22:59:44 -0800 (PST)
Received: from smtp.n0ps1edzz.local ([120.253.139.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm19344239a91.7.2026.11.22.22.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:59:44 -0800 (PST)
Message-Id: <20261123133000.2.n0ps1edzz@gmail.com>
From: Zhou Qiuyue <n0ps1edzz@gmail.com>
Date: Mon, 23 Nov 2026 13:30:00 +0800
Subject: [PATCH net] ipv4: route: fix use-after-free in ipv4_confirm_neigh()
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


ipv4_confirm_neigh() loads dst->dev with dst_dev() and hands the
resulting net_device to the neighbour lookup.  The load is outside any
RCU read-side section: __ipv4_confirm_neigh() does take rcu_read_lock(),
but only after the pointer has been read, which is too late to protect
it.  The load is only a READ_ONCE(); it does not pin the device.
udp_sendmsg(), raw_sendmsg() and ping_v4_sendmsg() reach
dst_confirm_neigh() when sendmsg() is issued with MSG_CONFIRM and
MSG_PROBE, without holding RCU or a net_device reference.

The first stale field read is dev_net(dev) in arp_table(), reached from
the neighbour lookup.  Route teardown drops the reference the dst held on
the device: dst_dev_put() does it for dsts removed from the fib tree, and
rt_flush_dev() does it for uncached routes.  Both replace dst->dev with
blackhole_netdev, so a reader that loaded the old pointer just before the
replacement can dereference a freed net_device.

Take rcu_read_lock(), load the device with dst_dev_rcu(), and keep the
section through the gateway dispatch and __ipv4_confirm_neigh().

KASAN reports (trimmed to the relevant frames):

 BUG: KASAN: slab-use-after-free in ipv4_confirm_neigh+0x89d/0x9c0
 Read of size 8 at addr ffff888104bea108 by task confirm_race4/125

 Call Trace:
  <TASK>
  dump_stack_lvl+0x55/0x70
  print_report+0xcb/0x5d0
  kasan_report+0xb8/0xf0
  ipv4_confirm_neigh+0x89d/0x9c0
  udp_sendmsg+0x11b9/0x1dd0
  ____sys_sendmsg+0x7af/0x9b0
  ___sys_sendmsg+0x145/0x220
  __sys_sendmsg+0xf8/0x190
  do_syscall_64+0xee/0x500
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>

 Allocated by task 117:
  __kasan_kmalloc+0xaa/0xb0
  __kvmalloc_node_noprof+0x216/0x5d0
  alloc_netdev_mqs+0x7e/0x11c0
  rtnl_create_link+0xaa6/0xe30
  rtnl_newlink+0xd22/0x1de0
  rtnetlink_rcv_msg+0x697/0xa00

 Freed by task 117:
  __kasan_slab_free+0x61/0x80
  kfree+0x201/0x440
  device_release+0xc8/0x240
  kobject_put+0x101/0x1e0
  netdev_run_todo+0x611/0xe70
  rtnl_dellink+0x343/0xa50
  rtnetlink_rcv_msg+0x697/0xa00

 The buggy address is located 264 bytes inside of
  freed 4096-byte region [ffff888104bea000, ffff888104beb000)

The faulting address is object offset 264, the dev_net(dev) read of
dev->nd_net in arp_table().

The lifetime bug comes from the v4.13 series that removed the dst gc
list.  Commit 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly") made
route teardown release the net_device reference held by the dst, so
dst->dev no longer pins the device for the lifetime of the dst.
Later commits changed the replacement target to blackhole_netdev and
added dev_rcu, but did not add RCU protection to this reader.

The lifetime change is present from v4.13 onward.  Kernels that reach
this callback are affected, including current mainline, net-next, and
the 5.4.y, 5.10.y, 5.15.y, 6.1.y, 6.6.y and 6.12.y stable branches.
dst_dev_rcu() is available in current 5.15.y and newer; 5.10.y and
older need the equivalent rcu_dereference(dst->dev) backport.

Fixes: 95c47f9cf5e0 ("ipv4: call dst_dev_put() properly")
Cc: stable@vger.kernel.org
Signed-off-by: Zhou Qiuyue <n0ps1edzz@gmail.com>
---
Window amplification for the KASAN run only:

 struct net_device *dev = dst_dev(dst);
+if (in_task())
+	msleep(2000);
 const __be32 *pkey = daddr;

The sleep runs in process context (udp_sendmsg), so RTM_DELLINK can
reach netdev_run_todo() and device_release() before dev_net(dev) is read.
It is a verification aid, not part of the fix.

Report context: 7.4.0-rc2 #27, CONFIG_KASAN=y, PREEMPT(full),
kasan.fault=panic.  Full log: evidence/dyn-confirm/qemu-kasan-confirm4.log.

Object detail from the report:

 The buggy address belongs to the object at ffff888104bea000
  which belongs to the cache kmalloc-4k of size 4096

Base tree: netdev/net.git main at af6737b90668.  The pre-image blob in
this patch matches that tip exactly.  The same hunk also applies to
netdev/net-next.git main at eb6d6c80d354; the target function is
unchanged there.

 net/ipv4/route.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/route.c b/net/ipv4/route.c
index cd69242..5ceea01 100644
--- a/net/ipv4/route.c
+++ b/net/ipv4/route.c
@@ -441,19 +441,25 @@ static struct neighbour *ipv4_dst_neigh_lookup(const struct dst_entry *dst,
 static void ipv4_confirm_neigh(const struct dst_entry *dst, const void *daddr)
 {
 	const struct rtable *rt = container_of(dst, struct rtable, dst);
-	struct net_device *dev = dst_dev(dst);
+	struct net_device *dev;
 	const __be32 *pkey = daddr;
 
+	rcu_read_lock();
+	dev = dst_dev_rcu(dst);
+
 	if (rt->rt_gw_family == AF_INET) {
 		pkey = (const __be32 *)&rt->rt_gw4;
 	} else if (IS_ENABLED(CONFIG_IPV6) && rt->rt_gw_family == AF_INET6) {
-		return __ipv6_confirm_neigh(dev, &rt->rt_gw6);
+		__ipv6_confirm_neigh(dev, &rt->rt_gw6);
+		goto out;
 	} else if (!daddr ||
 		 (rt->rt_flags &
 		  (RTCF_MULTICAST | RTCF_BROADCAST | RTCF_LOCAL))) {
-		return;
+		goto out;
 	}
 	__ipv4_confirm_neigh(dev, *(__force u32 *)pkey);
+out:
+	rcu_read_unlock();
 }
 
 /* Hash tables of size 2048..262144 depending on RAM size.

base-commit: af6737b9066832a2017c281159950ba92385ce00
-- 
2.34.1


