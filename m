Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640218;
	b=5s1n2qkcveJUd6oe/rY9DxpWZJQjO3ZeRVqJbHjDuDlf8u4dUywb8P/zle5so5SY3gsA
	 0udCuwxwEsijbg9cBiGnCUdnjvP4AQzTxtMUtW/viszRinDsEbEZDzVLAXM7mYRUbtgu9
	 fqK/yIeDkbUZRWWg/tfIxzG+6UHBlhmxG+mCjN1xii941H95C2Dy6KNrWJWHx7isUdQfa
	 z5i9U24cn68q8gwNwTxAW/jOe27Dkp1YcdeFVDj8f98wi8qI2TUfuxM7HOBTuOf1oZNT2
	 vs5JXAbe54NtIonFyuJCre9fvZVxhosiM7+2P5ZC1NrNhf8eeXSRkjHqzuWiWVasgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W6Gsf8QrffrX5EGpyvR7zzolZ5hNvKi5YdbzlZc4jQM=;
	b=AQjJE/CgcALNbqkhT7CyYX+fKYTHXzZl75gxYHI5zkTI/sJAD89muemsrNTLkwuhf/RE
	 vU7ulGweB2ZPzyU0ab5ApRwORPEqhGU4zpPCMWiNBDiquCzLv4rtSS50PULRUOWjcrthZ
	 3/KGTLZrQuQPttMDmQTypMbkBRyrefmlVDXCXftfh1DJ/eZJXg+VbZvD98qJbT1Hm3ljT
	 byCvMRAsTNLnBngcJ5VNAzNqOIZ+Zy5Eex1gdBV09hQi4Wytf8071IOKU8z5wv8PmcHCZ
	 2NKGrI+GtBxCLwP4RV+JtLURszxX+rZvp1ivyktEPdsycVHSWWc6oB5LEJiwZWqnPjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=ZPMkAQeT;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69245606A336
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 20:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69245606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=ZPMkAQeT
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so8173806eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795640217; x=1796245017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6Gsf8QrffrX5EGpyvR7zzolZ5hNvKi5YdbzlZc4jQM=;
        b=ZPMkAQeTFHEyTJ4CMgqG1N7dy+fWmXSI99wPfaB/eEP8EdUkgJL/Upczq7+xvs66AC
         6x3a2TE5rWp3n262l1Yua1s6PJ0nC9OKXcpFvlJ1d5o6N2WcfZ67A/j4sYP/MVg9AVaX
         dkKuSRMSpY9RY8c7REsiDkVx+DszpyjA+NXephOzbydiCb0BPp8sBVRkbvUZ32sL0GZ4
         rtMBiaPd6zkyhAmhAQX0zZFiMix5BAWskobmlt4niyOguB84RdCxPcinH2lmAwgjegJT
         H6PpVyCgyOaU0L7T9ze2fHa3CkbMEFB1yiYpMuKA+yApsOXKkEhxYBrrx9ndBiNQhL91
         +scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640217; x=1796245017;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6Gsf8QrffrX5EGpyvR7zzolZ5hNvKi5YdbzlZc4jQM=;
        b=I2eqkKlQD6erlR13kY23fKWq1vYoKyUF1hrmm54WJqj/Mg4Wg520Ak25jBBAaIX1cR
         8NsXfnUQB2kt4mLFmlotEM1AhVOlA2p3Xp8Cei/ArR0+MMe0toaKu7AQDJuBzwIyV8uH
         py4t9n746/DJUxOFT5fiZOvK9tREOAzAlAhIb+U0SraShmwk34kJfsUSseGdtlnW4qbF
         XiC46uivZ1lO/2NxA9ZrKKCe6YJwoFZpvSLJ3w6pSPW7xv4QokImjU1e3oSW4lVyanm6
         gjYrr1cuR2yaLWbXxU1s0zNPUMtAWHUV4SKx1+EAt/Wn3JqfEDQC0oTvgqd4PeyMSLGo
         FNAQ==
X-Forwarded-Encrypted: i=1; AL+hErH2BrX0mbLH309jkDTA9Sc9W+c+7gm6lPLGrwGUrzvS5DoF7jLTQUt+6v4Ol6MSHMks6fYslv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4oI2qfyGoo/FnusSAzDNlRhdQyNUZv4rkQmWXdWwblIypcRwz
	TCobzY7QiszfF8IkxiBrjSNDdUC48W78DPaKrunCAIi0E/oaeDDdz+ejPDBvAI7XDrU=
X-Gm-Gg: AZFdTZcZYxrh6+T2l1f9vcL4sr5mQ75dVAO9NBsg+Yboy9wU8wol/KuYygYV/L5FDGK
	PrNFYLgXXoEAqwLW2v4zHe+GzzlZhmuQ5MtsJpqPAEzjZ88r86jdQ6ZT0R4mb3AE32Xu7OgglFo
	+qpshL9z+FrF8m8Td7vP+tIyZIX6v0i1kRSkAa16s948g/gAuwUG19ldAjp3muVleDrRbasS3aq
	Djj+YJotim77YO17LkZW7yS29MCWl5XfGbJ77Z2/aFEbDkCegATjUou+MldYWU/g2Ovs81bloHO
	AAzcAjfqrziGehUyKc9KWd/St3MeCsNKPKOeS1xl3UZC55I7uWjDowmv8cKN5vyod8alv46uXJM
	OalQVSuEhHiAHG4+iUNmNAZPvE4jh+7/noo8bc+nsfWZ2ZLpB1D4xG3TQTUpehwD1cZs7ZMetMs
	tzEKrZTEbW7a9llhqWqWVyzyOKd3mWT3TJr5CdtIYbNsJW9UZfQpxFPavhM3EedNGVuo+JMleVk
	PNT8LcWoZ5AshVDiTPY+iftm5qFaxMRfhcdZnP/+Vu2XZboT9/HiOrnLpf0LF31tIu687nBPKUV
	LKTJGX6wDEBVTrfNDOZTXiqllbUrRDjiiTcmwa+FPUmqLi5Y44Zw96YGi4MDcRAdvMjhRS8j2Zt
	ztONKlJPWL8PNrVm3BqpyAl2mGQ==
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr28974062eec.21.1795640217441;
        Wed, 25 Nov 2026 12:56:57 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm63824963eec.26.2026.11.25.12.56.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 12:56:56 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kris.pan@intel.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH 6.18.y] net: flush skb_defer_nodes in dev_cpu_dead()
Date: Wed, 25 Nov 2026 15:56:53 -0500
Message-ID: <20261125205653.75303-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@google.com>
Date: Wed, 23 Sep 2026 13:03:18 +0000

[ Upstream commit 06e3f54e8b22040ada01a28343badf1990b4dd7d ]

When a CPU goes offline, dev_cpu_dead() drains its softnet queues
(completion_queue, output_queue, poll_list, process_queue, and
input_pkt_queue), but leaves net_hotdata.skb_defer_nodes untouched.

If oldcpu goes offline while holding pending skbs in its
skb_defer_nodes lists (e.g. below the sysctl_skb_defer_max >> 1 IPI
threshold, or if the IPI races with CPU teardown), those skbs remain
stranded until oldcpu is brought back online. If any of these skbs
hold page_pool fragments, page_pool_destroy() will stall indefinitely
waiting for inflight pages to be returned when a netdev or driver is
torn down while oldcpu is offline.

Additionally, if smp_call_function_single_async() fails in
kick_defer_list_purge() because the target CPU went offline, reset
defer_ipi_scheduled to 0 so future IPI kicks are not blocked when the
CPU comes back online.

Also, if oldcpu was the last online CPU on its NUMA node, drain that
node's slot across all CPUs so no skbs deferred from that node remain
stranded on idle remote CPUs (or if the node itself is subsequently
offlined).

Finally, in skb_attempt_defer_free(), re-check cpu_online(cpu) and
whether the caller migrated CPUs after llist_add(), flushing the node
list if so, to close the preemption TOCTOU race against CPU/node
teardown.

Fixes: 68822bdf76f1 ("net: generalize skb freeing deferral to per-cpu lists")
Fixes: 5628f3fe3b16 ("net: add NUMA awareness to skb_attempt_defer_free()")
Closes: https://lore.kernel.org/netdev/20260916003430.3612956-1-kris.pan@intel.com/
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Kris Pan <kris.pan@intel.com>
Link: https://patch.msgid.link/20260923130318.607255-1-edumazet@google.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>

[ Backport to 6.18.y: 6.18.y loads skb->alloc_cpu in the declaration of
  cpu and lacks the upstream skb_defer_disable_key and skb_zcopy()
  bypasses, so my_cpu is declared separately and the remaining hunks
  are adjusted for context. The 6.18.y flush loop has no prefetch();
  the new __skb_defer_free_flush() helper adds it as upstream does.
  skb_defer_free_flush() keeps the for_each_online_node() iteration
  from commit 58fb1e2a33ea ("net: iterate online nodes in
  skb_defer_free_flush()"), already in 6.18.y. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please apply this backport to 6.18.y. It fixes CVE-2026-98558.

The fix is in 7.2.9 and in mainline since 7.3. It carries no stable tag
and so far has been backported only to 7.2.y. 6.18.65 already contains
58fb1e2a33ea (upstream 56fbbb662795), whose changelog relies on
dev_cpu_dead() draining the deferred lists of offline nodes; this patch
adds that drain.

Compiled net/core/dev.o and net/core/skbuff.o for x86_64 with
CONFIG_WERROR=y on 6.18.65, with CONFIG_NUMA enabled and disabled, and
with CONFIG_NUMA enabled on 6.18.65 with the queue-6.18 patches at
stable-queue 42799ba370. The patch also applies to the current queue
(0fdc4475764), which was not built. No kernel boot or runtime test was
performed.

An LLM was used to prepare this backport and to check applicability and
stable-queue history; I reviewed the result.

Thanks,
Artem Dinaburg

 net/core/dev.c    | 46 +++++++++++++++++++++++++++++++++++-----------
 net/core/dev.h    |  2 ++
 net/core/skbuff.c | 11 +++++++++--
 3 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index e4216b78a1a4..da7818b91471 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5288,7 +5288,8 @@ void kick_defer_list_purge(unsigned int cpu)
 		backlog_unlock_irq_restore(sd, flags);
 
 	} else if (!cmpxchg(&sd->defer_ipi_scheduled, 0, 1)) {
-		smp_call_function_single_async(cpu, &sd->defer_csd);
+		if (smp_call_function_single_async(cpu, &sd->defer_csd))
+			WRITE_ONCE(sd->defer_ipi_scheduled, 0);
 	}
 }
 
@@ -6826,24 +6827,35 @@ bool napi_complete_done(struct napi_struct *n, int work_done)
 }
 EXPORT_SYMBOL(napi_complete_done);
 
-static void skb_defer_free_flush(void)
+static void __skb_defer_free_flush(struct skb_defer_node *sdn, int budget)
 {
 	struct llist_node *free_list;
 	struct sk_buff *skb, *next;
+
+	if (llist_empty(&sdn->defer_list))
+		return;
+	atomic_long_set(&sdn->defer_count, 0);
+	free_list = llist_del_all(&sdn->defer_list);
+
+	llist_for_each_entry_safe(skb, next, free_list, ll_node) {
+		prefetch(next);
+		napi_consume_skb(skb, budget);
+	}
+}
+
+void skb_defer_node_flush(struct skb_defer_node *sdn)
+{
+	__skb_defer_free_flush(sdn, 0);
+}
+
+static void skb_defer_free_flush(void)
+{
 	struct skb_defer_node *sdn;
 	int node;
 
 	for_each_online_node(node) {
 		sdn = this_cpu_ptr(net_hotdata.skb_defer_nodes) + node;
-
-		if (llist_empty(&sdn->defer_list))
-			continue;
-		atomic_long_set(&sdn->defer_count, 0);
-		free_list = llist_del_all(&sdn->defer_list);
-
-		llist_for_each_entry_safe(skb, next, free_list, ll_node) {
-			napi_consume_skb(skb, 1);
-		}
+		__skb_defer_free_flush(sdn, 1);
 	}
 }
 
@@ -12665,6 +12677,7 @@ static int dev_cpu_dead(unsigned int oldcpu)
 	struct sk_buff **list_skb;
 	struct sk_buff *skb;
 	unsigned int cpu;
+	int node;
 	struct softnet_data *sd, *oldsd, *remsd = NULL;
 
 	local_irq_disable();
@@ -12725,6 +12738,17 @@ static int dev_cpu_dead(unsigned int oldcpu)
 		rps_input_queue_head_incr(oldsd);
 	}
 
+	for_each_node(node)
+		skb_defer_node_flush(per_cpu_ptr(net_hotdata.skb_defer_nodes,
+						 oldcpu) + node);
+	node = cpu_to_node(oldcpu);
+	if (node_possible(node) &&
+	    !cpumask_intersects(cpumask_of_node(node), cpu_online_mask)) {
+		for_each_possible_cpu(cpu)
+			skb_defer_node_flush(per_cpu_ptr(net_hotdata.skb_defer_nodes,
+							 cpu) + node);
+	}
+
 	return 0;
 }
 
diff --git a/net/core/dev.h b/net/core/dev.h
index 6a84413e673a..7e5bce3c78e3 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -360,6 +360,8 @@ static inline void napi_assert_will_not_race(const struct napi_struct *napi)
 	WARN_ON(READ_ONCE(napi->list_owner) != -1);
 }
 
+struct skb_defer_node;
+void skb_defer_node_flush(struct skb_defer_node *sdn);
 void kick_defer_list_purge(unsigned int cpu);
 
 int dev_set_hwtstamp_phylib(struct net_device *dev,
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index e28802a46fd2..9cee07fc93b1 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7312,10 +7312,12 @@ void skb_attempt_defer_free(struct sk_buff *skb)
 	struct skb_defer_node *sdn;
 	unsigned long defer_count;
 	int cpu = skb->alloc_cpu;
+	int my_cpu;
 	unsigned int defer_max;
 	bool kick;
 
-	if (cpu == raw_smp_processor_id() ||
+	my_cpu = raw_smp_processor_id();
+	if (cpu == my_cpu ||
 	    WARN_ON_ONCE(cpu >= nr_cpu_ids) ||
 	    !cpu_online(cpu)) {
 nodefer:	kfree_skb_napi_cache(skb);
@@ -7326,7 +7328,7 @@ nodefer:	kfree_skb_napi_cache(skb);
 	DEBUG_NET_WARN_ON_ONCE(skb->destructor);
 	DEBUG_NET_WARN_ON_ONCE(skb_nfct(skb));
 
-	sdn = per_cpu_ptr(net_hotdata.skb_defer_nodes, cpu) + numa_node_id();
+	sdn = per_cpu_ptr(net_hotdata.skb_defer_nodes, cpu) + cpu_to_node(my_cpu);
 
 	defer_max = READ_ONCE(net_hotdata.sysctl_skb_defer_max);
 	defer_count = atomic_long_inc_return(&sdn->defer_count);
@@ -7336,6 +7338,11 @@ nodefer:	kfree_skb_napi_cache(skb);
 
 	llist_add(&skb->ll_node, &sdn->defer_list);
 
+	if (unlikely(!cpu_online(cpu) || my_cpu != raw_smp_processor_id())) {
+		skb_defer_node_flush(sdn);
+		return;
+	}
+
 	/* Send an IPI every time queue reaches half capacity. */
 	kick = (defer_count - 1) == (defer_max >> 1);
 
