Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749178;
	b=is9zGGFd+CiyWj/CnzDJ0EXhh+JbU0v8aQ63XvbGYYhPSXp81/aE+JgJwUe28XI332Sz
	 wPT+twAxx9cyne86J2eKLvBAqs+rQjk77Ee7w6F8BROIV5ryLNeXRSd67suPDAgaW3DBX
	 3IZQxfO8VdzuuuL8jP8EQLgukm3fFR7xFXPEH6bDgEFCgEREdXawPmwpghVqzKVkSOvgH
	 5reiZN7FGYqDg8zbM6Al3tS2OLBPOfIsNfHZDUjeppf6FyRHu34QkXxg5NhbZi5QNOdo5
	 F/jVElBh85vlhFODeAY58Ts5iZfp1IuC8fbYCjsjn3MNw55E/1mUp7olzwq3VKnQWMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
	b=QFTvNAiLug66hSgcstN8yAklmHjRS2Tnn1jcxjFA0VWi997X9VbN23i/KKWF+EIdOl1o
	 VxhjZ51+6hvbWacVacsNO6dv5Meqi8KeLWRuS0BaFz3CsDtBfJ360QBElDLL9+JXqkeJK
	 rsSRrpTL0y7ZXJv6qq7j0fC9hbmXdGaAb+zcITUneKrK9CIkp0twrTeBf0wr3zQbRSkZ8
	 6p6YPQVZ6fEczGBKROOfwU2XvDq1Q2TM352Tdj2KK67ht8CVC5qJeptG78GiVHx3YdVyu
	 H5hd5ejH7cILDbCdIOTxC0X9TEUNu0SiXLwZ1Hm1ZI5d5XGIN5djADK0oHpaCzPXCJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA6slowg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814A606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4814A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA6slowg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so3721588c88.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794749177; x=1795353977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
        b=WA6slowgRj1VJByjh1ROMR0y30Jy0uu6JUq+8Scgum+oZRppAyM6CP6gBGgn8XU0Zu
         e0VJZ8IWpZ8L8mOlnpyiSHi9hhtk9jomRqhg9KOoL9DExWedZL1FH8d2m3uWM1WCXyK4
         /tJ6qsAnEeQ2vkCDOfonSC651rP8Bg3HrzwujTbhGS081nn0PtKiNj4Ztq3oYNooPNkg
         +PI0dtFHxXPfXmnKctSWUrAWWFwrSdNL+e+bqNvTZDfTquV6+KJS9F+HrQLuSdvZz0+4
         Cd6Dl7S9GEzKdslQ0kCV+F1cMKNO3sJfMhN1Gxk1zBSzWgtq9vAppsZD+5EST4c9v09Z
         ih5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749177; x=1795353977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
        b=kgLE9eXQ9/10zHxIkeNma5bvbVD+1qedyWaMT7exkzQvIuFehhsRaGIlnXVWPwkeNE
         yueFaF543SGqnvuD8+oND9UqyuPjMpbvaPeMWHCUt1BNElfiapH2NG/0uN0haDlX3Iem
         V6pb0QQco2mZleH2R8PXP0qReJ1dxv2IcJ9SJVqFnx9P7hGPE4WEh7UkXLKC/YumDxSM
         5Wm0h36F1i67sMlxa2dA+hOPrVOtSsmMNylMLRQMYDSk9qPnIy47VI9EcgqaGK6EapU9
         v66AqmmYqP9xufRZT4EgXRkn09NSeUFU4RsltBHbmnzeOH8hr7gsVb2BAHgvnW0fqGQu
         bUbA==
X-Forwarded-Encrypted: i=1; AL+hErERsvXpQq87eAozqg5u++XaANchsQqkbTvdv9b74ylxXhyywqSIQESMaMR79IUynQ2XE8ZZ70E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wpCh0l1yrcFqiY5vaFO3vasDZhUBsTJpzb2wjp8dnjAaM06v7
	vhpNrPEPI5RTjda0565rofFHeXwkt2r8FEfAYttdJ7tGow94MV1kT6NS
X-Gm-Gg: AYBFou1Bz+U42uPEzbyaba/R5wyCQv9wGt/r2Rj0eC8R/Zg3SSXK30m5pnQvJKnpOyd
	45NG8f5TGtsxqqlOM4ZgPmwA3XlFypuPf+kZcD2N+ZKLXqEFAxM834gsktXvT0oBggmhBQ9d6Ie
	8+M0q2ue/S39BmRBC4zvNTndfP22fK2/UrBxfDFm3MsLjIPD9NKWFnkU5WXXPzBiFEJXURANR6O
	shn3pFCglQUYXE/OtSLrfBkK8Nd7+ltQs3AhjnEI4eBTsiy1238+yLDh410BMAF4Uj/smuZMAzC
	cQezVK+pexnwiUh5a9Pb+Qztp9JgZCR6B/1SKigw5rsPV/2pHN7SNPAnTBeT+d4L31Eo1BwROxF
	tTdtkXCqcmslmZLRv7tvnLbDNRghF3xOHLKhg4jbrXzReEa4mwjnQDoVFqA2Z4EI+WFDe8YYX6N
	dS8h/OfWNT7FlrvFwhLXwUWxKtyCfZRy+HDynF0chRSgkPG5ihErPo7tQWRTTIN5U3RXJB9/gxi
	rFRQ/kLysF2wf9FdwJYbN3FCLS8P0+3Hzz2YIrbvYGZ549J3M4sxhsJty6NTObwh1NnVqAWPsim
	LiT14g5zLWGliND7eus7EFSfKzNG
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr6467112eec.14.1794749177124;
        Sun, 15 Nov 2026 05:26:17 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d45c:e6::17:34a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm24465309eec.26.2026.11.15.05.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:26:16 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Christian Hopps <chopps@labn.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
Subject: [PATCH ipsec] xfrm: iptfs: force a dst reference before queueing an skb
Date: Sun, 15 Nov 2026 20:26:11 +0700
Message-ID: <20261115132611.427311-1-ngocthang2710.1999@gmail.com>
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

iptfs_output_collect() is the dst->output hook and runs under the
caller's RCU read lock. It queues the skb and sends it later from the
iptfs hrtimer. The skb may still carry a noref dst, e.g. one set by
__ip_queue_xmit() via skb_dst_set_noref(). Once the RCU section ends,
nothing keeps that dst alive.

When the timer fires, xfrm_output_one() calls skb_dst_force() outside
any RCU section:

  WARNING: include/net/dst.h:326 at xfrm_output_resume+0x41d9/0x64e0
  Call Trace:
   xfrm_output_one net/xfrm/xfrm_output.c:549 [inline]
   xfrm_output_resume+0x41d9/0x64e0 net/xfrm/xfrm_output.c:597
   iptfs_output_queued net/xfrm/xfrm_iptfs.c:2325 [inline]
   iptfs_delay_timer+0x3803/0x4310 net/xfrm/xfrm_iptfs.c:2362
   __run_hrtimer kernel/time/hrtimer.c [inline]
   __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c
   hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2153
   handle_softirqs+0x265/0x8d0 kernel/softirq.c:669

The warning also means the queued skb may point to a dst that has
already been freed.

Take a reference with skb_dst_force() while still under RCU, as other
deferred xmit paths do, and drop the skb if its dst is already gone.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Reported-by: syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=622de7e1f18a30fc404a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU with the syzbot C reproducer on origin/master (23c62304dde2),
60s per run: unpatched kernel hits 48 of these warnings; patched kernel
hits 0 in 3 runs, with no KASAN reports.

 net/xfrm/xfrm_iptfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..3fff835497b9 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1914,6 +1914,13 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 			continue;
 		}
 
+		/* The queued skb outlives our RCU section, so pin its dst. */
+		if (!skb_dst_force(skb)) {
+			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
+			kfree_skb(skb);
+			continue;
+		}
+
 		/* Enqueue to send in tunnel */
 		ok = iptfs_enqueue(xtfs, skb);
 		if (!ok)
-- 
2.43.0

