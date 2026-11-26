Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683806;
	b=JYVOw19wIrirrnMCwLsnCna1wxZRhvHCocmkS7ns6Ku1PAstlA0ZonG9emqG/GPpo8r2
	 kdLvF9IIxNNanZk0fCfnrpMEKQrmY9zfc8VD43umIqECpDWLBDJn8XOJPY2mv7f+0JP9G
	 BEe4KtIdEdEriBw6EJggWYSrJwHrTGWOw0n6fwZUBOznQzTmBzQKb1yaGcNMll7fwvQ7K
	 eFhBkZUccQQXmQ1hRLEtY6sz8ze6OqE7Tec2xnuFp3Qy24ugvTGGUQUYsHvE6HqSbNhvV
	 I4d39+AUk5dj+vnWI8ZhMwg+VTGx7oRvpgj1xKeTvJ4aYZCxS/lUZnJatLV1lWgDz0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k0DNiUp5NyvW/4XUsg9FRZJVc/nhkiHumSk1tHXzyqo=;
	b=pk+y2CDM0EZUgHSteLGLA/xVoZxrtcOwphClyXmI96c9oKZoJSeEP+0yzCI0KP1ushsW
	 MMc1/6VZeSfvzFMTtSGNUFfLBdxGYmO/y3SNQ5atTvzEageVh9HBosLk+udIWpM6RlU54
	 OjpyAYZb/Jie0XyG1wIfGufj5XNKu8RuZXDP4oX6FOF3ceGjDlpT8kDH6hGKItx6FqF9d
	 CiSHFUKgMA1sH+XdR1l2A83vVjI2XXItT0qU4Ac6uwC6XDfg1S5sURIrUFNMsVMrhgUjw
	 6N+ZJ+C78nF8dwHnRV+6kiu0c6dmUqKsI2N+TzX79Vq3/IaC0cWAcU/rDv/HQjxc09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YmjVwlmk;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A98606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YmjVwlmk
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1724903eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683805; x=1796288605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0DNiUp5NyvW/4XUsg9FRZJVc/nhkiHumSk1tHXzyqo=;
        b=YmjVwlmkJBvguOYJQ3CQlD0nNvWYdJ8p6VLHuvbpG+Cpdnn+XxYWkB0I9cAXk5oTW2
         O7Y/lkn+tpyJOUuYWB4SFQJumAd+SaKwVjdKrdGujdOS85419t+/3CF6/BP8jg1FAfrw
         F8+pSWh9vcpox1XrhvxJi+h+gtFkNtiG1QTjYLYn9oRgyHjGOS73metccjgNnNrfT/Kr
         VL84jeCFAqWeUpsKwKaL12LPDsCoucISPAEHVG1equIm5042uTBwrLC0QhZeVqDrF5jd
         hOg+Gzprz7yTVt4jwMxg8px84pSR0WsMP4zaq0d51dfKqKdOMMkpMyIipAqmFARcuboE
         zxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683805; x=1796288605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0DNiUp5NyvW/4XUsg9FRZJVc/nhkiHumSk1tHXzyqo=;
        b=0PBdAGjG2bXy3CPukQPvNJsps4+MmbRu6dwnr/EfIBW8zpQeAS6h86JxaHUqlQ9C/U
         HnZ/Z14hZjJitmoBsDgkmZt1WxKCHRLYf3zOdGBmg9B5tdABSoS49zZdDdIhyGxOw91L
         Q+x3TLsgR1THa1pclbHqgl6z/SxByXb9xT2W3h+Xgz65Kxfs1Aa3/hDr2TcgNAVZVE0p
         f2NjXvD8bTNeG92g88WwOjvieC0HDGGqFMp+DND4nWZBN1QN+hcNg/HU2vet/YfAeP9c
         NzCW26WBgvAMZfWLET2uZylIZ3X2dRjrP2oRN94x5fImVyjsQ/8hrtU6cCG1FYtxtXF6
         Rcrg==
X-Forwarded-Encrypted: i=1; AL+hErFXFyT9C7Q8jgugpyTiBdBKEaBvaY4z/PBPNt8r5A1y+QILXwoSSFxIK4JcFn9C7SRKGpsm6ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FaOm/+k/lAD7tJeO+wRnXGDHJK22edoNHVESBb4l0V757UIgw
	uLF50PhjcsSmXZa0Tr2xYUFhQ6Rd+02fcigmyyWzQTp41pm5JGxkf7+p
X-Gm-Gg: AZFdTZcoLCWfw7OHXz7w+rlyrqUf9SGJwuWeJU6JQoNJdFT51LrWa6DtYahFFBGyYVQ
	eepYDuRBKDc3asAnZ4mNhQi9MFHppZGdXdlu+GUtFSkrYXMjqaR1Hp/hpReZozkJ1XlEo9gUEPT
	OGxwp2D9wAhF5gLgUzfhthMlzCls5c1WXr//yzZEzVse43Fcj4EFY/74QqgN2W+cWM/yv4tnidf
	/hkxR4aJy+BBQOwux6rwm8gYMqV12jZmngkXT+jHVYZAoJl3hJKhyAHY8aEngkQZQ7SbXKqNO0P
	mIBVxiyfpIsBGN9Vye6SLx5cywzUBAxHbeLXWk9gtUI51yy72iMt6l/UVuaEELbAmvdapFL9WKI
	Pd2pbAsauEvHTEoDHvfnjCptxh4b+V3tCmWNNHpoq8cNF61eitmqIPRienoe0KND/oPlGMgIJ83
	aPH0Zw6RxNamBXikCjL5mFqngoDu9/ZqviKsHzN1vj5n5jwVEaVMbZOltKWe0DZBzjr+WTfFMXq
	hfgx1BD72hurw0xNtOC/mDw15Y2mlqRyaPz68FRB7uA1K1VLw4a8ow0BHYzcvG8Ik+jeHOmyZlk
	xphRaWdp5pd2lC2hmZCp6tWGGVkYm43kjCZN5ScXdZbxvfBuw5VUo6j5
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr19785351eec.28.1795683804902;
        Thu, 26 Nov 2026 01:03:24 -0800 (PST)
Received: from jiayi-vm-sprl-server17.local ([155.69.195.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm56816065eec.13.2026.11.26.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:03:24 -0800 (PST)
From: Jiayi Zhang <zhangjiayi1014@gmail.com>
To: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mst@redhat.com,
	847807867@qq.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Jiayi Zhang <zhangjiayi1014@gmail.com>
Subject: [PATCH net] tap: do not take consumer_lock in tap_sock_destruct()
Date: Thu, 26 Nov 2026 09:03:06 +0000
Message-ID: <20261126090306.3416278-1-zhangjiayi1014@gmail.com>
X-Mailer: git-send-email 2.53.0
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

syzbot reported an inconsistent lock state for the consumer_lock of the
ptr_ring of a tap queue:

  WARNING: inconsistent lock state
  inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
  (&r->consumer_lock#4){+.?.}-{3:3}, at: tap_sock_destruct+0x13b/0x330
  {IN-SOFTIRQ-W} state was registered at:
    ptr_ring_consume include/linux/ptr_ring.h:363 [inline]
    ptr_ring_cleanup include/linux/ptr_ring.h:700 [inline]
    tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
    __sk_destruct+0x85/0xb70 net/core/sock.c:2386
    sock_wfree+0x254/0x7f0 net/core/sock.c:2754
    [...]
    llc_rcv+0x4d5/0xa70 net/llc/llc_input.c:112
  Call Trace:
    tap_sock_destruct+0x13b/0x330 drivers/net/tap.c:444
    __sk_destruct+0x85/0xb70 net/core/sock.c:2386
    tap_put_queue drivers/net/tap.c:179 [inline]
    tap_release+0x2fc/0x450 drivers/net/tap.c:517

tap_sock_destruct() drains the ring with ptr_ring_cleanup(), which takes
consumer_lock with spin_lock(). The destructor runs in process context
when tap_release() drops the last reference. It also runs in softirq
context: skbs sent through the tap file are charged to the socket by
sock_alloc_send_pskb(), so if some of them are still in flight when the
file is closed, the socket is destroyed from sock_wfree() when the last
one is freed, here by llc_rcv().

All other users of the lock run in process context: tap_do_read(),
tap_poll(), tap_peek_len() and vhost-net's vhost_net_buf_produce() take
it with spin_lock(), tap_queue_resize() with spin_lock_bh().

This cannot deadlock: a ring that is being destroyed has no other user,
and lockdep complains because all tap rings share one lock class. When
the destructor runs, the file and the device have dropped their
references and the queue was unlinked from the device under RTNL.
tap_handle_frame() can no longer reach it either: tap_put_queue() waits
for an RCU grace period, and the dellink paths unregister the rx handler
before tap_del_queues().

So the destructor does not need the lock. Drain the ring with
__ptr_ring_consume() and let ptr_ring_cleanup() only free the array.
Making every user of the lock BH-safe instead would add work to the read
path of tap and of vhost-net for a ring that nobody else can access.

Tested with lockdep and KASAN, using the syzbot config. The syzbot
reproducer no longer triggers the report. I also wrote a test that
closes a macvtap queue while frames are still unread in its ring and
while frames it sent are held back by netem, so that the destructor
runs in softirq. It triggers the same report on an unpatched kernel and
runs clean with this patch. The tap selftest passes, and so does
tools/virtio/vhost_net_test changed to use a macvtap queue as backend.

Fixes: 362899b8725b ("macvtap: switch to use skb array")
Reported-by: syzbot+a2220efe757ca2a7358d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2220efe757ca2a7358d
Signed-off-by: Jiayi Zhang <zhangjiayi1014@gmail.com>
---
AI tools assisted with the analysis, the code and the changelog.

A patch for the same report was posted earlier today:
https://lore.kernel.org/r/tencent_934E899D4D24BB3B4827B2A0C9D73461E00A@qq.com
It takes the lock with spin_lock_irqsave() in the destructor only. With
it applied, the close test above still triggers the report: the lock is
taken in softirq by tap_sock_destruct() and with softirqs enabled by
tap_poll().

 drivers/net/tap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 2f19fb07bb2d..81dd616909d5 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -440,8 +440,12 @@ static void tap_sock_write_space(struct sock *sk)
 static void tap_sock_destruct(struct sock *sk)
 {
 	struct tap_queue *q = container_of(sk, struct tap_queue, sk);
+	struct sk_buff *skb;
 
-	ptr_ring_cleanup(&q->ring, __skb_array_destroy_skb);
+	/* The ring has no other user left: no need for consumer_lock. */
+	while ((skb = __ptr_ring_consume(&q->ring)))
+		kfree_skb(skb);
+	ptr_ring_cleanup(&q->ring, NULL);
 }
 
 static int tap_open(struct inode *inode, struct file *file)
-- 
2.53.0

