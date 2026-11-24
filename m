Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541957;
	b=JoJLVD5iwC7QoP8f7ZtRhynoZG5YnLNY2j5Cb3i9cJPb++5nWDNYRQuylcHnUvVRtr/V
	 FPDGHuMDt9sv3GgAlR34teGcR+r/55xou49gqyFRRTp23UO3pq4o2eMGDAdvwTSLv/SHE
	 f+/3QMBDd32ierl1Fup5KgnCGxC4vcNXkuWq29YvYNWsc/4ZHd3Ze0m2chtoCNi4RbZS6
	 koAY9K0QrdT7jMn/bRw1LCs7lRrr/YopKvWaFc+lYq0KSS+b4jYihiHNoWZW0pvKhkadr
	 /QRFxkgthXp23xXmEFCqm1jbBXEY25lSZ25HV7ygadebzZ6ZCrv72nAuQUyDmsUyLrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qGcGut7eAi8H93LIdqn+Kee7P6v6fQ6Qx47rDjArsLg=;
	b=G7mm8JOV+pWIl7Na3A/XVaytCdIpcW8CFHoX0pVlGYjLDzg5PBR4exlfUAMgv+qmWngG
	 /UgBzNGiYwXvTA4t7EaPMwSKUArAiBbdPztmG7WOPiz85QerG2gXwHQ6PS1SucZBUh/tL
	 nL417LsGfAd3XQ2/LT/7Vry095cepwlJ0uUDKSVftEA9aXCkuAPNdkodMG6VN7T2JZME7
	 SqtMmV/IizZdRB7Mge6Z7K6n985htwOKFaZwA9/ns/saQxmkYPu04KXQ4k8N6q8AW/rfL
	 CNRQSpMYznX7FJJeE87UBHVCiK38pWJrFctTJMDUmRjBMgXri7lH9QhW04cAr1DQmDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=JIACiH0J;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C05606A335
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C05606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=JIACiH0J
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-845788309b4so2319708a34.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795541956; x=1796146756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGcGut7eAi8H93LIdqn+Kee7P6v6fQ6Qx47rDjArsLg=;
        b=JIACiH0JjJGqpvdFFrZoiJ/QF5X52W+XVK8P82BwuFPfNuK9pPLPMG4+cb1MfN12JL
         M30WNxMjIIm4lQDU0t5EfFFpWEsZrLjjma5mkvAlvaQ7+Sx/LqGaNeowge898vv6R74A
         hMIgKPFjkzqUi+8ZiAIBMd2ugg+3WQng2NbI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541956; x=1796146756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGcGut7eAi8H93LIdqn+Kee7P6v6fQ6Qx47rDjArsLg=;
        b=AsWg1UjllYOJUPP0DyeLhMguKqTXSmgxe7Gv2BKopWRQhumfTfADy1rd6uUZTOOe84
         we1fgEMECtExMiML+cy5jGD4RivdWDn55LQ/7eO7KmUb+kPUS1T9M6+CXYItf2OLNHMq
         U5kXpy+9yr8Z+cKt0CG4t3E2q6VISldnpL9H92Dx33ySwQesBe3YmSENdBaaZhdRplyW
         j4+lnrfgcPkR88p5ANk9M0n1JQEFHwvqtSTn+9oNivM/o1c9rnaGBMQcYWe/ezn7P6pE
         8GpqGUQTHXe2hsFjoUK6eq4jxITL37MzgkATGiaNI2uJI3KhnBf/uyOvaihhHLcZuTjO
         KG8g==
X-Gm-Message-State: APuU4Z/8Mo+eZUa4sFRSfQz0Tc5PHZpFkZsBaWdxOwfr60vLCcpNIoJK
	3lqF3fhRpS8yLHSeSBvxxebA4lEpm1Vw/zYEwbd5TlBYXcGquOaQOYm27QVTosHZOc7Li3adYXz
	hXKesA+g=
X-Gm-Gg: AZFdTZferWcHS7sHVEVjh1tTJgVM9MpzaVVB12ai4r8vHYVlz542b8n6FOKkNxkMFn1
	IqDalGbicjKigmJ8of+nsYeEaLUbtMilWd9seDc9AOzo+s3H+AIY8P4VHN/tAyZT0T0CZsXedVo
	LvCXziozcOIfCwv1hJHcG6/XXNJeioLpAk4CxMR+WWIN60o2iMPDnMRFWn9FfSEmdbxEv11Nhww
	xdn1W+eH5/YzCl3JK+xWZkUOsQObIWwCgiNmHcAZ1qeVO0HwQtiaTRnAu6+SSPD5sb6U0N2PelK
	/CH8Oz0zv4zFmfx2B9xPoqR4cfXlTIcOHAHvmlpteRPMQov0b2EzttuRnB+e90Fzy1l8beKZPxs
	ceFB9vTmmYFbAlG6JxbpOxHbBJrSbk3KdWDLVR5ClznurvAD3gqWzXOsZCbohCAMZRIdTpZ5Ojk
	A2FD4W6B/TD7m2iQCY+srQQG+zFXilrw7Vu9mYNnaQGkp1EPYDyobIbDlycBQcZ22D99T1TfwPq
	M8vJdwtIeTjkqhtW99szn01ByiLdQh6hRZOAMhsi0IsNe9AcRdcBbxKQMuERZUakjfAYFh0gAxf
	RBb44AS+bVCrcONa8eHyVUEo3xEmsoIR2OjiEzWsnM5PkSomEl9sDK/qmmr33aW8VY3YNNHJGxF
	YV29k1V0DOZ2RDiwX1HhkOsWaSvZMGpA=
X-Received: by 2002:a05:6830:25d1:b0:845:8d86:9f7a with SMTP id 46e09a7af769-863158f0dcemr15925423a34.10.1795541956463;
        Tue, 24 Nov 2026 09:39:16 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdaf7sm11667094a34.5.2026.11.24.09.39.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:39:16 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org,
	syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com
Subject: [PATCH net v3 1/2] net/sched: serialize autonomous timers with qdisc resets
Date: Tue, 24 Nov 2026 09:38:13 -0800
Message-ID: <c9a2eca12cf6ef23f4c102ce6d72ddd7ce791227.1795540952.git.kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795540952.git.kylebot@openai.com>
References: <20261110044450.51921-1-kylebot@openai.com> <cover.1795540952.git.kylebot@openai.com>
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

Autonomous qdisc timers can race with queue resets during graft and
destruction. A timer can read qdisc_sleeping before a graft, acquire
that root's lock after the graft, and modify queues protected by the
replacement root's lock. __qdisc_destroy() also resets detached qdiscs
without the tree lock before their destroy callbacks stop the timers.
In SFQ, either race can corrupt skb lists and flow-slot state.

Add a helper that acquires the sleeping-root lock under RCU and retries
if the root changed. Use it in the SFQ, RED, PIE, FQ-PIE and DualPI2
timers. Route default-qdisc attachment and scheduler shutdown through
dev_graft_qdisc(), so all live root replacements hold the previous
root's lock. For a fixed queue association, a validated root then
remains current until the timer unlocks.

Hold the tree lock across the final qdisc reset and release it before
calling the destroy callback so synchronous timer cancellation can
complete. Detached TAPRIO children can have different sleeping roots,
so defer their final resets to taprio_destroy() and lock each subtree
separately. Keep those resets before hardware offload is disabled.

The issue was found by an LLM.

Fixes: 225d9b89c937 ("sch_sfq: rehash queues in perturb timer")
Fixes: 47e8dbb6e763 ("net/sched: do not reset queues in graft operations")
Reported-by: syzbot+00f5a4ef4bcb8f4d19f1@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=00f5a4ef4bcb8f4d19f1
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share it via DM.

 include/net/sch_generic.h | 20 ++++++++++++++++++++
 net/sched/sch_dualpi2.c   |  3 +--
 net/sched/sch_fq_pie.c    |  3 +--
 net/sched/sch_generic.c   | 11 +++++++----
 net/sched/sch_pie.c       |  3 +--
 net/sched/sch_red.c       |  3 +--
 net/sched/sch_sfq.c       |  3 +--
 net/sched/sch_taprio.c    | 16 ++++++++++++++++
 8 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
index 1acaadb3e2cf..e234256e6ae8 100644
--- a/include/net/sch_generic.h
+++ b/include/net/sch_generic.h
@@ -608,6 +608,26 @@ static inline spinlock_t *qdisc_root_sleeping_lock(const struct Qdisc *qdisc)
 	return qdisc_lock(root);
 }
 
+/* The caller must hold rcu_read_lock().  dev_graft_qdisc() changes the
+ * sleeping root under the old root's lock, so retry if it changed while
+ * we were waiting for that lock.
+ */
+static inline spinlock_t *qdisc_lock_root_sleeping(const struct Qdisc *qdisc)
+{
+	struct Qdisc *root;
+	/* Lock of the sleeping root observed under RCU. */
+	spinlock_t *lock;
+
+	for (;;) {
+		root = qdisc_root_sleeping(qdisc);
+		lock = qdisc_lock(root);
+		spin_lock(lock);
+		if (root == qdisc_root_sleeping(qdisc))
+			return lock;
+		spin_unlock(lock);
+	}
+}
+
 static inline struct net_device *qdisc_dev(const struct Qdisc *qdisc)
 {
 	return qdisc->dev_queue->dev;
diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c49e..8a74ceaab29d 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -750,8 +750,7 @@ static enum hrtimer_restart dualpi2_timer(struct hrtimer *timer)
 	spinlock_t *root_lock; /* to lock qdisc for probability calculations */
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 
 	WRITE_ONCE(q->pi2_prob, calculate_probability(sch));
 	hrtimer_set_expires(&q->pi2_timer, next_pi2_timeout(q));
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..a1b5126db640 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -394,8 +394,7 @@ static void fq_pie_timer(struct timer_list *t)
 	int max_cnt, i;
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 
 	/* Limit this expensive loop to 2048 flows per round. */
 	max_cnt = min_t(int, q->flows_cnt - q->flows_cursor, 2048);
diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
index d2e0d20f3ba1..fbbc07700160 100644
--- a/net/sched/sch_generic.c
+++ b/net/sched/sch_generic.c
@@ -1106,7 +1106,7 @@ struct Qdisc *qdisc_create_dflt(struct netdev_queue *dev_queue,
 }
 EXPORT_SYMBOL(qdisc_create_dflt);
 
-/* Under qdisc_lock(qdisc) and BH! */
+/* Under sch_tree_lock(qdisc) and BH! */
 
 void qdisc_reset(struct Qdisc *qdisc)
 {
@@ -1154,8 +1154,10 @@ static void __qdisc_destroy(struct Qdisc *qdisc)
 #endif
 	gen_kill_estimator(&qdisc->rate_est);
 
+	/* Autonomous timers can still run after the qdisc was detached. */
+	sch_tree_lock(qdisc);
 	qdisc_reset(qdisc);
-
+	sch_tree_unlock(qdisc);
 
 	if (ops->destroy)
 		ops->destroy(qdisc);
@@ -1213,6 +1215,7 @@ struct Qdisc *dev_graft_qdisc(struct netdev_queue *dev_queue,
 	struct Qdisc *oqdisc = rtnl_dereference(dev_queue->qdisc_sleeping);
 	spinlock_t *root_lock;
 
+	/* Pairs with qdisc_lock_root_sleeping() in asynchronous callbacks. */
 	root_lock = qdisc_lock(oqdisc);
 	spin_lock_bh(root_lock);
 
@@ -1236,8 +1239,8 @@ static void shutdown_scheduler_queue(struct net_device *dev,
 	struct Qdisc *qdisc_default = _qdisc_default;
 
 	if (qdisc) {
+		qdisc = dev_graft_qdisc(dev_queue, qdisc_default);
 		rcu_assign_pointer(dev_queue->qdisc, qdisc_default);
-		rcu_assign_pointer(dev_queue->qdisc_sleeping, qdisc_default);
 
 		qdisc_put(qdisc);
 	}
@@ -1261,7 +1264,7 @@ static void attach_one_default_qdisc(struct net_device *dev,
 
 	if (!netif_is_multiqueue(dev))
 		qdisc->flags |= TCQ_F_ONETXQUEUE | TCQ_F_NOPARENT;
-	rcu_assign_pointer(dev_queue->qdisc_sleeping, qdisc);
+	dev_graft_qdisc(dev_queue, qdisc);
 }
 
 static void attach_default_qdiscs(struct net_device *dev)
diff --git a/net/sched/sch_pie.c b/net/sched/sch_pie.c
index 3b7863ffd284..9367065db4b1 100644
--- a/net/sched/sch_pie.c
+++ b/net/sched/sch_pie.c
@@ -429,8 +429,7 @@ static void pie_timer(struct timer_list *t)
 	spinlock_t *root_lock;
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 	pie_calculate_probability(&q->params, &q->vars, sch->qstats.backlog);
 
 	/* reset the timer to fire after 'tupdate'. tupdate is in jiffies. */
diff --git a/net/sched/sch_red.c b/net/sched/sch_red.c
index d7598214270b..a7601b879092 100644
--- a/net/sched/sch_red.c
+++ b/net/sched/sch_red.c
@@ -333,8 +333,7 @@ static inline void red_adaptative_timer(struct timer_list *t)
 	spinlock_t *root_lock;
 
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 	red_adaptative_algo(&q->parms, &q->vars);
 	mod_timer(&q->adapt_timer, jiffies + HZ/2);
 	spin_unlock(root_lock);
diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 8bbcfc9e85d9..2bd3fc65053a 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -611,8 +611,7 @@ static void sfq_perturbation(struct timer_list *t)
 
 	get_random_bytes(&nkey, sizeof(nkey));
 	rcu_read_lock();
-	root_lock = qdisc_lock(qdisc_root_sleeping(sch));
-	spin_lock(root_lock);
+	root_lock = qdisc_lock_root_sleeping(sch);
 	q->perturbation = nkey;
 	if (!q->filter_list && q->tail)
 		sfq_rehash(sch);
diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 4f69ef3d847a..b7489cf4bba9 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -2041,6 +2041,10 @@ static void taprio_reset(struct Qdisc *sch)
 
 	hrtimer_cancel(&q->advance_timer);
 
+	/* Destroy resets each detached subtree under its own root lock. */
+	if (!refcount_read(&sch->refcnt))
+		return;
+
 	if (q->qdiscs) {
 		for (i = 0; i < dev->num_tx_queues; i++)
 			if (q->qdiscs[i])
@@ -2063,6 +2067,18 @@ static void taprio_destroy(struct Qdisc *sch)
 	hrtimer_cancel(&q->advance_timer);
 	qdisc_synchronize(sch);
 
+	if (q->qdiscs) {
+		for (i = 0; i < dev->num_tx_queues; i++) {
+			struct Qdisc *child = q->qdiscs[i];
+
+			if (!child)
+				continue;
+			sch_tree_lock(child);
+			qdisc_reset(child);
+			sch_tree_unlock(child);
+		}
+	}
+
 	taprio_disable_offload(dev, q, NULL);
 
 	if (q->qdiscs) {
-- 
2.55.0.openai.911.g06873a30d2f3

