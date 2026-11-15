Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735858;
	b=jyyM6b2wCIX8ynANUHPh4g7nQEjmHeAZpAEYi/L/O+oHphnjY9oRa099U8Fb0G9sYlRh
	 wHVVgNdgZUw5wb3xdJrhtycZh6usCjNKbdsR4jxbgAKhfl9U878ZUzbEzaNiQTzNIGRe9
	 7w4uxGOWSlWSBsf42Nx05oY4QIFTkNWumEaNG2b4XOMo+Rq4FMcfEzgv2MR8Tq8LE4PFb
	 cfYbWqL5VnDVA4efSIutLPcRniczOvtNDY7x7mYCYk74ilZCWDBj0l4WdiCC6R0t7xpZB
	 WFYtw39Eev2pZQybdA+ys9RY6Ed1zX/SezY0yWzlRKO2GpcYtaNz3ZZOzHu/YblHMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
	b=xfjEMlGn5HuS6ROhWKHLnWwQGkklNtqqMPRM0XAFHDJqPawHqk/MCcU8Nz/pxlxPEPDu
	 F0gfK0smruIngiSt3sUih8Vv5RMuHHa6b8UvLxddMTI+SOhaVoAAEJ6+uw5HiNZ26pylm
	 BCTRfsHvDaLfLLAL4UdN6WDEnHPCVmktogAOSY7LpxXC9PjpfixqgY/O/RMC4TdbfOfXU
	 z4ABxzktgdmIZYuPYyBt2ZOetzQkhyW8zWCHgUfrCMmJKkZgBTEto6yjYS2BD+Eu3n7H4
	 86yB3K6FcuXZVAYad5UWuVPQFhFahahphd+XdNxe9cdfntf5zq5U4+3mooMqqjW31bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOfQDald;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE20606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE20606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOfQDald
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso951892b3a.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 01:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735857; x=1795340657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
        b=GOfQDaldGTg+3iSZt443wCUFyijBYPG0bDX9ddiALS4zA11nAqzVD6JqxC7fla52eh
         57Z5pwVhhcDhlf4jm3jOWWsqneJgYO8Hpwyve9RbXGHZhZAZDwXCKSfD+Vx9as9SpZsO
         0fEm4NwA3UzojpSH0Hstu8VUHpp37HN+ydJgWyha5+MfGPl4Frmbx1mjZj370edVR95S
         ZZ7VrIJCturV469hIZGiBHtucAqr6uA7hqcXK1asThgLEKfH1+EXwXGnb+2LY2Ab4oPC
         I5oF56JKCA+KxQRh6Nj+vkeYRzLHHwZ5nawDF8FMV40natW3onPja6eU8gbV2HqZIVTB
         TyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735857; x=1795340657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
        b=YqgOrSjNUYIwGhJF3u/INcTe9dboNeEwz38Bm7kGmp3i4n5QkhnWSsZMyOt1J0N/Ha
         hbAowyGjU9YecqFDzBGheGqOQpZG2ld56qSPKOdG6deJbqjAGwispMExFyO03R4Hhwmm
         wSBBCYh+zKN/lRNZQcLsSyn4WYAadLLqes4qN2F2BDRrzG9LrA1hfftk2Rn1KW/VeVo0
         Hfr0Qpznv0uXm3JgpGOe6GmsE0xsVtLS35eiFsvqTW/Ve92Smru+7SlKG8rnMOYk2MbO
         z5Q3U7Bqp4Ew6Mo6wOgLwWwMURV5jgM5QmcSGrUSyJ9TLCsyQ6ji7D6vV4+v3+eaOVTp
         PR0A==
X-Gm-Message-State: APuU4Z+8yNBdnOAk8L0NuXbhJqYGBEF6FL74cqS+Ojow8wylYmQiL0Om
	+McCMtvNTsRQpCyKOZmcMD7AP1N942KqHBz8Wlwr81wnUDapT5u9LqPPycsd4IcRkz589t1L
X-Gm-Gg: AYBFou1mRVE3ufpfrBw7GvhoDQYA4lMmuPCOwDiL5ygts7WXoK7NMdLh56sgNb5zVfQ
	YK90AI8TwvmKWOx4BMXgztJ0t4JTN4tr/Dfafjl7K8LA/Q56iK6heutfb3eKHkBabY4zclvWdnI
	Ch88iadO4Oq15ZchmmuOJFDizgzDeGc7c0r00cY7P+2rOqTcnu5XvdllKROuKhYmdTYN9gz4PCH
	T6WOOQtwwLnpNRezAZsaUUzfDUgjXYUvWD/cr3Ukw8jfbpj/9+sUtorqzQaWBpkx63k2Zn1QIdK
	8sBKUXRMYkONibmGpvDUyzXg0w/M4X794qC8W+D8vXO9T9QiWUbSv3FsmmfCNzcSRciK5oB7w0e
	swzZnNy7tKO7O5UT7YNtj1CtkuBdQTb71vCygqUyU460Fx3iVWLK+dewZm32UaA4xlIXpQa9bOC
	cTqGmm6gUTIUWdYT8XJUHnmxknJzWQi0Ep/GmTz059h0x4VgJPUAfEYrbVT+VIgPTA5vTDNQibA
	fk4FZjrGY8tfXzGkHa13lNTuBd/jdl6NlSIVjtUbo7tYpeoGSOyyZuLX7fM6iN9LZFNEFXUQOkx
	D1lE62qWmf6pnr2p8rzMPGeBXzLKL6/sjVmOPxYUngT629Q8ncC5CRIPLlRIZQH7HlZ7rn/Vh4k
	jzhO0DVaJ9BhBhEF6t+TexnPHJYc6n9VWcS+R7o3Wgeqithv7KnlIPAlBN0UuAahMqyjsq8Ypl+
	tSts/umVWktIQgUgYczAZq0q3PQ8R/gT+Qj3w7Q/L1xRatxlSqPrMpsJwAFk1LzS2yA5jl55txp
	C9S3mo+a5hH15oFqDSlJWuRZT5o66vok/uNt84OvN43MMzmFjPDTAxVcFpqmE97KUOCyrZl/Hkn
	pSC7QZGWSuU=
X-Received: by 2002:a17:90b:58e3:b0:3b0:d365:f8e8 with SMTP id 98e67ed59e1d1-3b1b0a1ff3fmr7212096a91.17.1794735856675;
        Sun, 15 Nov 2026 01:44:16 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce55c1sm17234882a91.3.2026.11.15.01.44.15
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:44:16 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH net] net: af_key: fix use-after-free in dump_sp() on policy migrate
Date: Sun, 15 Nov 2026 20:13:53 +1030
Message-ID: <20261114223529.1791-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
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
Message-ID: <20261115094353.f-tCsaakRLhAlPsk9zZX8j289E_3RJrXV0zDJivgo5M@z>

pfkey_xfrm_policy2msg_size() derives an exported policy's message length
from xfrm_vec[].encap_family. dump_sp() derives it twice: once through
pfkey_xfrm_policy2msg_prep(), which allocates the skb, and again in
pfkey_xfrm_policy2msg(), which fills it in.

dump_sp() holds net->xfrm.xfrm_policy_lock rather than pol->lock, so
xfrm_policy_migrate() can rewrite encap_family between the two
derivations. The second length is then up to 24 bytes per template
larger than the first, and pfkey_xfrm_policy2msg() opens with
memset(hdr, 0, size), clearing the difference into the skb's shared
info. Four BEET templates put 80 bytes there, which reaches dataref:
alloc_skb() had set it to 1, the memset makes it 0, and the skb_clone()
in pfkey_broadcast_one() leaves two skbs sharing one head with a dataref
of 1. Freeing the original releases a head the queued clone still points
at, so recvmsg() copies freed memory to user space and consume_skb()
frees it a second time. The CAP_NET_ADMIN that pfkey_create() and the
xfrm netlink receive path check is namespace-relative, so an
unprivileged user can reach this. SLUB's double-free check fires within
a second of starting the reproducer; the oops kills a task, or panics
the machine when the corruption lands in softirq context.

Racing SADB_X_SPDDUMP against XFRM_MSG_MIGRATE as an ordinary user gave
4585 use-after-free reports and 765 double-frees in 300s on mainline
with KASAN and 8 CPUs. The reads reach user space (addresses trimmed):

  BUG: KASAN: slab-use-after-free in _copy_to_iter+0x1d8/0x1430
  Read of size 240 at addr ffff88810f98d140 by task pfkey_dataref_o/433
  CPU: 3 UID: 65534 PID: 433 Comm: pfkey_dataref_o Not tainted 7.4.0-rc2
  Call Trace:
   <TASK>
   dump_stack_lvl+0x66/0xa0
   print_report+0xd0/0x600
   kasan_report+0xc6/0x100
   kasan_check_range+0x105/0x1b0
   _copy_to_iter+0x1d8/0x1430
   __skb_datagram_iter+0xf8/0x820
   skb_copy_datagram_iter+0x6c/0x1a0
   pfkey_recvmsg+0x1ff/0x500
   sock_recvmsg+0x15e/0x1a0
   __sys_recvfrom+0x182/0x260
   do_syscall_64+0x10b/0x5f0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  Allocated by task 433:
   kmalloc_reserve+0x108/0x2b0
   __alloc_skb+0x123/0x5b0
   dump_sp+0xdf/0x490
   xfrm_policy_walk+0x1d9/0x6c0
   pfkey_do_dump+0x61/0x420
   pfkey_recvmsg+0x358/0x500

Take xp->lock for reading across both calls, so both derivations see the
same encap_family. xfrm_policy_walk() already calls dump_sp() under
spin_lock_bh(), so the plain reader suffices, as in xfrm_policy_timer().
The other callers of this pair are already serialized against migrate by
net->xfrm.xfrm_cfg_mutex.

Fixes: 80c9abaabf42 ("[XFRM]: Extension for dynamic update of endpoint address(es)")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---

 net/key/af_key.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/key/af_key.c b/net/key/af_key.c
index d215b33..ab4aaca 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -2712,11 +2712,18 @@ static int dump_sp(struct xfrm_policy *xp, int dir, int count, void *ptr)
 	if (!pfkey_can_dump(&pfk->sk))
 		return -ENOBUFS;
 
+	/* Both halves derive the size from xfrm_vec[].encap_family, so
+	 * hold xp->lock against a concurrent xfrm_policy_migrate().
+	 */
+	read_lock(&xp->lock);
 	out_skb = pfkey_xfrm_policy2msg_prep(xp);
-	if (IS_ERR(out_skb))
+	if (IS_ERR(out_skb)) {
+		read_unlock(&xp->lock);
 		return PTR_ERR(out_skb);
+	}
 
 	err = pfkey_xfrm_policy2msg(out_skb, xp, dir);
+	read_unlock(&xp->lock);
 	if (err < 0) {
 		kfree_skb(out_skb);
 		return err;
