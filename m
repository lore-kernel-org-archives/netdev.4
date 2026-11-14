Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794695771;
	b=M9efKK9/pR8zR5RnwIGMi2G3YQo5HqxJIZKooohsfj27Hy4FB2Or4bevmdzthFw5YfhM
	 7eYHOvYjnFbU17LcRl1jtyPeZptZGCMYEdPM7q6Vu/JOqca3uTdXTo0C9997FTBiG9M4p
	 pTtTMTxz2GHFx5VVeqrA63ztsRv/EXb9Imq3YHN9Y8Pmuy8KQixJLtyr+kVMymCI42r3N
	 vqbrDg6WKXfwoWbANXTtSb/NtiMvD0ZkIjuIdrEM2rgF7WPdObNCqh+fcW6EU8cf3YnMi
	 v2pREGJiVn5NOmFVSN/NiqegYFtcA+2/ASEzeetzVe8a+M/c5jlaK5rXS41TWL6QjTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794695771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
	b=vBaB65bZ/D6/BeadkCHeMDVaoz8WpCAOI5fih7xWIdLakG3/u/pFdET1WctJB4Vulq9n
	 0fcCkmO/GqOxaZ4nJcxUFgrSlEhDW076ZzuJB8FjIpUCWxmRaT6dJpqzsHc7awRsd2ISs
	 mbTryk+qKBc6jcYw7nWYHVQ7Lahck8VBxX4tCOjT9J5TJUKBEBaahpGYaI2Erdv2jmReo
	 B+VT8CqUHE+KvBYrOW6pjExAU38hpOWtR24ITk2ShKM9TEztZgkQmCKxTWaBVyq5lAQkV
	 /COyl5NaYDitIJniCC4WrWRm4SMSvRBP+dQro9wQW4vfnzIQ9C3hnZ1XH/yjNFHFXzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQQo9+7b;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09318606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09318606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQQo9+7b
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1180900b3a.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794695770; x=1795300570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
        b=LQQo9+7bAW11Hyfc8tgSBdoqnd2WgSJK81r2jvcKAUaN1XOZFBey+pcLWaRg4ne8H0
         mmn5ta7i3j20yF4rwzdoa0wO1EBXZkvAghQ9wqX5mbqdEHY6Qrx+h665mAwK4cvTh18m
         mQWcIq/H1AO3N1exTE3wsZSv0PiHOaEgMKw85LxSIYQTTxN5ILze8B51RteHnTtrkcbu
         W5gDnkwvQ1B/D2xduIwLIZkVcsJ0+B92fNiyblXyhlV7KgBD+ygEsnNzhR5ULjP+MvSW
         xSxuhrsyqiv5hXXJBMyUIKQc/n6S5ArHbZwKIFxlZGm1Q7hos1HJwU5u0x0HRh8rpMJH
         /WiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794695770; x=1795300570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/ukFAd/XYK3I3Tgr9bm54GIKr8QMqZXjs5Tmr3VZHk=;
        b=2mSQnX4FGpVM1rt10MlMewYPmrsX/L0rS0wmveqHbr58waBfoefb+XBYpUaoVQ6bVN
         /CeGjJ1XAB1yetNkORxgquKvvcjwMuMyWGO9dW9q2v+VXx/n5VQvqBcf76jaRr6vEWQg
         oR7wVxKRRPVfeh1ySxwAFAhqAaDepPdzalh4tglVuXRsPq5m1rnqvyHDyQS/2RM6JAYI
         RuuyMuuTVdQCSwVte5g6PrcHjOY8Z6+eM8dVGHYoglGKx7x6WBhYg0F5jIcRY9SprgWl
         O0wtwHxs/Ki8+jw8jZ6y489D3ML1ji/RFongVdHPtP6NYjF5TSRqBai4x8Pi+Cn42hts
         FXnA==
X-Forwarded-Encrypted: i=1; AL+hErGtZUsg03Yxi1VpozSTnue7Ph0KYHCCEbfYvWeA63YmtjIk0B/H4ufqrql6WtbLT5bbQYmupuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mb/Ol7hJV20CWGL6i7xKWZL6cYH/KAsF6GOmrgta0M+baJ4vy
	BWSgRCEsAQy0mU9yU+0Pkn1OKwGrRCnBdh+DZ9kjS+dXdvqApXhHLb6wySkxzCLNyIRd4CtG
X-Gm-Gg: AYBFou28hyskGI6Yo9L1D2yGdp0WNnLKx7DA+eWh/EnKH9X7GfFXeFcjpYrIIdVqoUE
	dd0pk6VHlIahkdjbmRmI+dlDZpdzGQNv8adoQJ4nb76qajinCXYTQAouiWOnIlQArfQ1bEkkIeU
	zjLpzA2+ePgLjLCk+r3FVrEk6w8u2n7HTkuDJ7RyyGSfmUyvDevk3kIxQhXlPxA1Dsg1LUOcgkA
	Y1hR6mvX1YNqjJ/+q2DQqFJhjXRC+btevC7RqOxL2/qEAR9FEbEWmXfzZkAJYeJCcvb8VMuiVAN
	B7D6lHGQxUiQJFpKeiN8B9NkS09m3Kjlha9oEq14GyNRhzsnZc4b6k1pRJc5WrPHa9Tt/INCMs+
	ycnxtLO8nieYp0RxcNw6I89sbz+++lTC//LwsE9HdpHwrP4kr2TVGSymTXiBYNCSiKN8e+shqO7
	Y4JufoLQgfTYnKBrOV3SpU50gP36c652K55bStup+hC0CpLsnEwpFvAzH3o/XJ4FMjD2+pZ3Hhd
	wQze6P6AGZZLbJHEj2RP2wQpxAc1WdJsfD+g/mserGALIKqImj1lVfPH5esBK00UBolFabsVrUg
	3nian3i0iWbAbxr8DP2Kwp7iwabDsqNh3x8YWyyzwFWnOSTHNstn6OTDJVSnJWkPcNQoLF9gjKo
	O8o7mM03ajzz6xALsWcdhLQbCiAbwkJbMKzc59aexmYjmXEBWdP2KB5sQt0yk+J3BIRz/YdxzSP
	SjNdMLj/3jOw8FcxF8zOP8f+K14cfHkYj3uPs5pTq0J9XyG60Z8UIXvxDH5O+AP7MXoarYrOsFE
	Ifr3msr5RRWZm2rYQGVqjhAJRPuGf5fB2H6xq6YrJuJa/40N9ycVt0ICnxNK/6t
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr5915116a91.49.1794695769893;
        Sat, 14 Nov 2026 14:36:09 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed74024sm10234804a91.15.2026.11.14.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:36:09 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: af_key: fix use-after-free in dump_sp() on policy migrate
Date: Sun, 15 Nov 2026 09:05:29 +1030
Message-Id: <20261114223529.1791-1-danjwade95@gmail.com>
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
