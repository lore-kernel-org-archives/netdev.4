Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831448;
	b=hyAeCDEfc5k/sBApoZ5WgjWAp5fdZAqRb5eyNa+d/b88VVccwtmfjRxXpDPFqr8503tw
	 KopALYzzcdx8XjW2gJrrX8YTmO1798mwnPH/X/SqFJ8WTg/SDtxnxDZNkeU6xK2RxFjOJ
	 DOhXrLEWMXkJgmhga2D7LhnRxWmXRjWW3XvK3+5z2bJ+GW4ahzAlvGtGPLoq6GRq2NEUc
	 JruJcqDn56COtF7KlJOzuJ1tvD8QlVxqSQh5l8x46atm2aft+Dx29GcmoAl+CN/XFrm3u
	 QWI6tWCuPMXdgabBRLvhr7V9Tc1up7Yl2ydAzs1DPq6rJu02b7wE7Lf5qgnAx/KfjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2DvzYjKrOUzMqNS33zIkMu1E1h8ZRESapVtIQDWP32I=;
	b=dPHKgLNBmCtmbYcNSbnkMWSixBcUZXMHRYvMNhNdyfKi1qHkG0Wk2Onuie8YiSSzl/bP
	 hfDoTOWpC109tk6QTvo1/JpSk6SOL7i7g0mEfyaTdk1Xm/Xhv6Jb6sLAu87/U7Jxtrjjj
	 Cz9QqP1mezvosZ2h5JGpXqqxQ9r9Zp0xQ6q9Z0LEhusCyCULjxnRjsYHYlfQ9pEjHNCs7
	 3TTqhN/oj6/H4V9zwQWdtxZUHvZLQXkt/CGLVcX6eeUNuYh+xLY8XbN3Jpsnu4yoUIGhR
	 6pujq3yL59R1esB3Jf5zfR/Xl1m85IwIt2tRcXE9o8701yzK6JNVFLzKusCkOIIt1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ07fxG0;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583F606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5583F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ07fxG0
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2919989a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831447; x=1795436247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DvzYjKrOUzMqNS33zIkMu1E1h8ZRESapVtIQDWP32I=;
        b=gZ07fxG0GDEsvNe+/QJVmTRxfgb2FWsXZ/lBK6luvLHmnXXJsoClsVy6w6cibCo/BZ
         W6JW7C0AxGumMIZd02DNEil/vj16J07rdtxwwSjrTwKB/GrZcIm/Tntka4IaN6tT/aGh
         aIaBvHPQy95jiSO4GnAZThpF8PiOOuEB0WjhTrFwFFLkju0t+UcLwBrL6K0wpvAN+ZRn
         Mn0xPUprvk8WahWgRYdJi1YfEezaUBJ8JGdu3CI3sEgJEkKM0XwKTBw/aZF1uR8jW5qT
         U68GFHJCLL7wAS0Knrie+BXLYzRukpXZtlvKbJ273YihjETl9ikeoUiGO0Q3ZL9VLFDX
         LxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831447; x=1795436247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DvzYjKrOUzMqNS33zIkMu1E1h8ZRESapVtIQDWP32I=;
        b=M3j+B2zW5pp/2zh+nDtjWj7CO1rI71wmwYa+Zr52TyoarnbN9xzOpL8kHOrsUCL5Jv
         HzyT3MfMIoTUoTD/w4Fe2IWXrhrak8rK8KnY0UzYL1sgSYmeLR488ggeTwhIJLhyfAaE
         3YnX3aMoCIZrU+ZRkb2CEGyqmKY6SgSJBhecLrQVda7s1OlXdFlIUKQxJ/fkn3wM4B/B
         0b98y5obaGovBYJsh7h9XlRd3p3G1nMYNtC/NzI3QiEGyAkmLeJpPhyHUsoVa/b4ISaX
         8L+Za5xsADX9v/2GUKiptufv7fUC/agmsJpB+/pVGNRkfheRj02WWUPCF0+k9v4SWlKQ
         9nRQ==
X-Forwarded-Encrypted: i=1; AL+hErEvJagkKLZXert0gZWGCgc8OkLfsbr5JB3MH8A3+pP++e+eXKQr8WgASfCsOye3bpeGjIUIjm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hZ+Lywsfs77Oarj2YzuS68o7P6TtLnBAdYlXwCr9MOkliXW8B
	qPZObXhALIZvNfa0d3rRLYKP1ePhXMbiaVvfA2cZHovZVCmcuEoeFs1A
X-Gm-Gg: AZFdTZcDnYQt3LlFrrpOGTenVu9cUAR60ckb3MRtqboajeeOyyCJqTDeUpzujXS0H/9
	mQ61uPV7M6b7elvR9QPOzCJq5jFicOyHBSubgQMgBL9tSrrOsR/34fGws32/XmJm9NmQwze2s2w
	WqZ8abCpGqEvQAqmL53fhunc03uVRJrXegKd/Ck5GYQ1niybZpxy4HJm0V/0ty87rbcy+LQNEsx
	rCsgQINqNruKsacEbWsXvtjsmGjePucKEcWAG2NNAyYAfvhGIURlqocIE9qHJg/9xnL1atZchKg
	XyYe+utgO35DK1PuG+PMetMb8mgsWrbhMXbwGtFrmiygZXTMmMyNERCwuFo0CXx8m7qXyX0dzrz
	gcprC8+N9VB6EEaF/uJNwPxx+Pe3w+E6EktmZOohWNS6bDpOqvB+mR1V3ef8zv4uLWYyXOyh9WM
	UQKt49L1YT081K73I9BLV33ey+2PG5N+XYEvXc03VC/4fFC5OTaTXpIyQaMFf5lini6/29R5VD2
	AJhCzZvSTEtfrLyGgHmCdszXWfMZ+ls3VXRV/2uOMrGGZL2tQLFefLobRHJllO33rCYsuxBb8LX
	hzvTHUI4XnZ9kXaU6AGd2xW/Ruc36PUpWFLKm3Dpg1fwTU0JAjXPclwU1OFduXccOYZmM57EJw=
	=
X-Received: by 2002:a17:90b:134b:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3b1b0cae71dmr10511167a91.38.1794831447522;
        Mon, 16 Nov 2026 04:17:27 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4352sm4384178a12.24.2026.11.16.04.17.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 04:17:26 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	paolo.valente@unimore.it,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net] net/sched: sch_qfq: bound backward slot rotation
Date: Mon, 16 Nov 2026 20:17:07 +0800
Message-ID: <20261116121710.77403-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

QFQ+ keeps aggregates in timestamp-ordered slots and rotates the
occupied-slot bitmap when a group's start time decreases, avoiding the need
to move the aggregates themselves. Insertions are capped so that occupied
slots leave room for a later backward adjustment.

A stale aggregate can make the start-time decrease larger than the bitmap
can represent. Rotating then pushes existing members beyond full_slots,
and a later qfq_slot_remove() clears a bit in the following slot-list
pointers. KASAN reports the resulting corruption when the group is
selected:
  BUG: KASAN: slab-use-after-free in qfq_choose_next_agg+0xd04/0xd90
  Read of size 8 at addr ff11000102f73010 by task repro/92
  CPU: 0 UID: 1000 PID: 92 Comm: repro
  Call Trace:
   kasan_report+0xe4/0x1a0
   qfq_choose_next_agg+0xd04/0xd90
   qfq_dequeue+0x365/0x14b0
   qdisc_peek_dequeued+0x91/0x280
   tbf_dequeue+0x91/0xcd0
  Allocated by task 91:
   qfq_change_class+0xca5/0x1c50
   tc_ctl_tclass+0x4ee/0x1400
  Freed by task 37:
   kfree+0x1b3/0x550
   qfq_rm_from_agg+0x228/0x300
   qfq_destroy_qdisc+0x118/0x1e0
  The buggy address belongs to the object at ff11000102f73000,
  which belongs to the cache kmalloc-128 of size 128.
  The buggy address is located 16 bytes inside of
  freed 128-byte region [ff11000102f73000, ff11000102f73080)
The report is followed by a kernel panic.

Limit the backward adjustment according to BITS_PER_LONG and the
largest insertion slot. If it exceeds that limit, move the activating
aggregate's S/F and rounded start time forward by the same slot-aligned
delta before rotating. This preserves the timestamp and physical-slot
mapping, keeps every removal offset inside full_slots, and leaves
representable rotations unchanged.

Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service at DRR cost")
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
 net/sched/sch_qfq.c | 13 +++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
index e900890e9c54..e83105ce9015 100644
--- a/net/sched/sch_qfq.c
+++ b/net/sched/sch_qfq.c
@@ -1300,7 +1300,7 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 static void qfq_schedule_agg(struct qfq_sched *q, struct qfq_aggregate *agg)
 {
 	struct qfq_group *grp = agg->grp;
-	u64 roundedS;
+	u64 roundedS, slot;
 	int s;
 
 	roundedS = qfq_round_down(agg->S, grp->slot_shift);
@@ -1318,6 +1318,17 @@ static int qfq_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		if (!qfq_gt(grp->S, agg->S))
 			goto skip_update;
 
+		slot = (grp->S - roundedS) >> grp->slot_shift;
+		if (unlikely(slot > BITS_PER_LONG - QFQ_MAX_SLOTS + 1)) {
+			u64 deltaS = grp->S - roundedS -
+				((u64)(BITS_PER_LONG - QFQ_MAX_SLOTS + 1) <<
+				 grp->slot_shift);
+
+			agg->S += deltaS;
+			agg->F += deltaS;
+			roundedS += deltaS;
+		}
+
 		/* create a slot for this agg->S */
 		qfq_slot_rotate(grp, roundedS);
 		/* group was surely ineligible, remove */
-- 
2.55.0

