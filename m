Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541960;
	b=AFRcl4Eb2EJg8WAfOHO4Kw++GptMRSvQ1Gd94J1Qwx4lDR5D3dV3Ej1qXyKlmeReRXsU
	 4Jb0bH62pRQ+mtzO0VUB5DZVeIrf/o/gzkwJtSSX34lCXBWZgW5dFZBJNE4gPhne4jETV
	 W65S/Vz+ylBc0a9TmiGBxP3uflu3o8PxzCToq/8qtUSDrISdMZIVJoAz3ILd0Y2pkFxTm
	 hr15FYHDNP2/g//46gI00ogRxijvxl/0w1kmm17ue0blV0Ss/7Vsyfu+QVSiqyY5WZ6pI
	 kwqxqPlOO2hssjcaFyPR+DzwYuz6HrozwVC8W+F0EsQ7T0IV65u/y72oy/CwY0A1eIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/5aXYZOiCfmZpepVU5XcntNHJrd4O0PtQpD5cOGvrlc=;
	b=ieBXPXfWTfULHtebw5sDdelRPYB9+GDIrOEw/qDWYluF5OFFZodiwv6VX8uENASOGcGn
	 +lc7uBGXC1qmMmeKXp3/ad2g9HHuk1HZd6Q5iquYFQes6R3BEhFrL/EXgPPwkudva12Gd
	 aDNgH49azIaxy6NPE1qKd5pTctGV4q67b24BZn6B2YVAXu8SxMP3zy4I4Vp1NsT79YSQ/
	 nsX9Nt7mjOtDMW2YCi9+AoEAyo8RAE7BCGPji1SRbeWGnEWJnM3yRmCvIfdPOnDXRjmFn
	 pC1w/9Pe9p2WkGJXQCy63V94Kb+oXFGZr84hv36rUj/8alEa5Hy6004t9KBKkq++3Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=g+CsQD8V;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD5606A329
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EBD5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=g+CsQD8V
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-86288992de5so3675062a34.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795541959; x=1796146759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5aXYZOiCfmZpepVU5XcntNHJrd4O0PtQpD5cOGvrlc=;
        b=g+CsQD8V54qVIAt0fMSF2JLjZB8Sc4FGlKFaOY5d7F2cewuRxg+oUU33m11Wik04mv
         fUdwoV7+IT54bov+7BscT4T32vEdrx469i6HpM5behQbrPVUtatpMt5d4eLCq2ATbe9j
         x+uSFvGL+C9r81egeAdaDvlG6cM+XdqG239n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541959; x=1796146759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5aXYZOiCfmZpepVU5XcntNHJrd4O0PtQpD5cOGvrlc=;
        b=ZJzOIhuteAU9yRZrHRqHzMoMXsPYdETlzTRCTTlZqY672o9OygMlHibMVufMbSBpul
         pd8f62oRF3/TuWMu6xCsa6dmS249rXZ2NX1Wq7IM7KML1zfThRYSnxHAvHBcO5euWHSP
         +/YfU/IEk9oLCAucW72sg7p+pAfhff1NndmX8kNx8jMzVxAWqJ1oBZkuwvrdzqHWMh2s
         qyM+6aPFne3sN5f1jodxQp3lU1BgzeQBvnLGxGGsrM4ML6AZr5ZC6cB4h1UNz5Mztfrr
         RB5f5NVLxSVfyAKNGW/Vn2czM2VxBccjkStfFYVwg0nchV5zQyKy3rP+yfZhSBU1m0GC
         xTKw==
X-Gm-Message-State: APuU4Z9hqyDv3VUDriTFila6zb22GKKT7BiUOSyL79qtbQwW7g86RNV9
	zQxCyXmTwhDLNuBfEL50PagTJFlFIRrifmKmfyxia9yvlxtVcziOvrQRU/AAWQrIEBbs8IIJrbx
	pWYM6z3Y=
X-Gm-Gg: AZFdTZesxwclADBa78Az6tORGQkOlkxcBCW/Uh2/12JXBM0yVCYRBR1SLcu6Tg/QK1S
	1BmXyBpFsASWvzFhY9IYF9JZ1lzrLfmKkHfjtRmJr8IzV0U2KtxeNeA8Gm3iujzJMPLHYNFtFn6
	FyfrLh8BU26grRrzpVJ56zwm2BKbYnc+/ZfxI65lIQeidjHaK4qg9kIVLmnRj2A2RZTuqkFtejj
	cUGJE+cB3rp2BJKuLzEqS9SOAh6VO58Y0h24BIplNr3uuyRtro/KwSxuu43xYvk4+6nuhiCzoLQ
	6cby1TDvVPVVAJFN5hqeJKLV3o+TOphiidtPxp2kclSDTziPXHsjUFBM0BHXeVbXqQA43hCjCXw
	R4sWlOwrGwV6xtmjU2HZVvFcTLyJt975SP4lB3oBq9bChQeWbaCCVGgIxyQwKfxHJsXTzDjTGsx
	gS8GL6QciKirUv2TY5Vs3TvRkB9GZaSkU9PXMguopHmi7Lg4eXw7nSudcq4ky38ejpNbx6uLLpD
	cVUn7DTcbFd5FQSE6cbj8wR2TmOu5tY4E70LvgCrVoldNfHUs77aS6yvaCeSgiLiaOUsMOHOYr+
	9EMifU05FKkVKfF/+LkPWK3w6eFj2ffNvY+QzjyF/eFWUagVU5nlNkIo2Ww1Np0E0gh+6Kvl5jG
	20gsw2riAD9n4THoUsesnBOUNs7KNkw==
X-Received: by 2002:a05:6830:82ee:b0:85b:895:a015 with SMTP id 46e09a7af769-86309065b5amr12447788a34.4.1795541959275;
        Tue, 24 Nov 2026 09:39:19 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdaf7sm11667094a34.5.2026.11.24.09.39.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:39:19 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH net v3 2/2] net/sched: sfq: perturb the hash from the enqueue path
Date: Tue, 24 Nov 2026 09:38:14 -0800
Message-ID: <f2f59b9b0f7391a3b4c366cb0b04252af8e94eaa.1795540952.git.kylebot@openai.com>
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

A backlogged SFQ can remain alive after its root is unpublished. Its
perturbation timer takes the current sleeping-root lock, but rehashing
can still resolve the old parent handles through the live device. A
missing parent triggers a warning; a reused handle can make
qdisc_tree_reduce_backlog() subtract packets from a replacement tree.

Perform a due perturbation before classifying the next enqueued packet.
The packet path holds the queue's lock, so the key change and rehash
happen together without an autonomous callback. Preserve the initial
perturbation interval and pass dropped skbs through enqueue's
deferred-free list. Idle queues keep their key until another packet
arrives.

An AI review found this path.

Fixes: 18cb809850fb ("net_sched: sfq: extend limits")
Fixes: 47e8dbb6e763 ("net/sched: do not reset queues in graft operations")
Cc: <stable@vger.kernel.org> # d6f81fd6abe2: net: sched: prevent scheduling deactivated qdiscs
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 net/sched/sch_sfq.c | 49 ++++++++++++++-------------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 2bd3fc65053a..5810c458586e 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -130,11 +130,10 @@ struct sfq_sched_data {
 					 * dep[X] : list of flows with X packets
 					 */
 
+	unsigned long	perturb_time;	/* next hash perturbation */
 	unsigned int	maxflows;	/* number of flows in flows array */
 	int		perturb_period;
 	unsigned int	quantum;	/* Allotment per round: MUST BE >= MTU */
-	struct timer_list perturb_timer;
-	struct Qdisc	*sch;
 };
 
 /*
@@ -340,6 +339,8 @@ static int sfq_headdrop(const struct sfq_sched_data *q)
 	return q->headdrop;
 }
 
+static void sfq_perturbation(struct Qdisc *sch, struct sk_buff **to_free);
+
 static int
 sfq_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 {
@@ -351,6 +352,10 @@ sfq_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 	struct sk_buff *head;
 	int delta;
 
+	if (q->perturb_period &&
+	    unlikely(time_after_eq(jiffies, q->perturb_time)))
+		sfq_perturbation(sch, to_free);
+
 	hash = sfq_classify(skb, sch, &ret);
 	if (hash == 0) {
 		if (ret & __NET_XMIT_BYPASS)
@@ -531,7 +536,7 @@ sfq_reset(struct Qdisc *sch)
  * We dont use sfq_dequeue()/sfq_enqueue() because we dont want to change
  * counters.
  */
-static void sfq_rehash(struct Qdisc *sch)
+static void sfq_rehash(struct Qdisc *sch, struct sk_buff **to_free)
 {
 	struct sfq_sched_data *q = qdisc_priv(sch);
 	struct sk_buff *skb;
@@ -569,7 +574,7 @@ static void sfq_rehash(struct Qdisc *sch)
 drop:
 				qdisc_qstats_backlog_dec(sch, skb);
 				drop_len += qdisc_pkt_len(skb);
-				kfree_skb(skb);
+				__qdisc_drop(skb, to_free);
 				dropped++;
 				continue;
 			}
@@ -601,29 +606,14 @@ static void sfq_rehash(struct Qdisc *sch)
 	qdisc_tree_reduce_backlog(sch, dropped, drop_len);
 }
 
-static void sfq_perturbation(struct timer_list *t)
+static void sfq_perturbation(struct Qdisc *sch, struct sk_buff **to_free)
 {
-	struct sfq_sched_data *q = timer_container_of(q, t, perturb_timer);
-	struct Qdisc *sch = q->sch;
-	spinlock_t *root_lock;
-	siphash_key_t nkey;
-	int period;
+	struct sfq_sched_data *q = qdisc_priv(sch);
 
-	get_random_bytes(&nkey, sizeof(nkey));
-	rcu_read_lock();
-	root_lock = qdisc_lock_root_sleeping(sch);
-	q->perturbation = nkey;
+	q->perturb_time = jiffies + q->perturb_period;
+	get_random_bytes(&q->perturbation, sizeof(q->perturbation));
 	if (!q->filter_list && q->tail)
-		sfq_rehash(sch);
-	spin_unlock(root_lock);
-
-	/* q->perturb_period can change under us from
-	 * sfq_change() and sfq_destroy().
-	 */
-	period = READ_ONCE(q->perturb_period);
-	if (period)
-		mod_timer(&q->perturb_timer, jiffies + period);
-	rcu_read_unlock();
+		sfq_rehash(sch, to_free);
 }
 
 static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
@@ -746,11 +736,7 @@ static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
 	rtnl_kfree_skbs(to_free, tail);
 	qdisc_tree_reduce_backlog(sch, qlen - sch->q.qlen, dropped);
 
-	timer_delete(&q->perturb_timer);
-	if (q->perturb_period) {
-		mod_timer(&q->perturb_timer, jiffies + q->perturb_period);
-		get_random_bytes(&q->perturbation, sizeof(q->perturbation));
-	}
+	q->perturb_time = jiffies + q->perturb_period;
 	sch_tree_unlock(sch);
 	kfree(p);
 	return 0;
@@ -771,8 +757,6 @@ static void sfq_destroy(struct Qdisc *sch)
 	struct sfq_sched_data *q = qdisc_priv(sch);
 
 	tcf_block_put(q->block);
-	WRITE_ONCE(q->perturb_period, 0);
-	timer_delete_sync(&q->perturb_timer);
 	sfq_free(q->ht);
 	sfq_free(q->slots);
 	kfree(q->red_parms);
@@ -785,9 +769,6 @@ static int sfq_init(struct Qdisc *sch, struct nlattr *opt,
 	int i;
 	int err;
 
-	q->sch = sch;
-	timer_setup(&q->perturb_timer, sfq_perturbation, TIMER_DEFERRABLE);
-
 	err = tcf_block_get(&q->block, &q->filter_list, sch, extack);
 	if (err)
 		return err;
-- 
2.55.0.openai.911.g06873a30d2f3

