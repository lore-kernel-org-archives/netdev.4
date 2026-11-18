Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035214;
	b=jNs2ySfrsRgE1WGojKqFUov6VNT7Y6Srqe2X4J/+GTL9q/ey0FM6J/uCVFHJ99OdTHMd
	 Qua7b9BaLZ5u4YJMFNUQuKUYP76Wtzj57KbuQf7dJkJjmHSeI1nTfc3CaFm2Rnj4HpY6u
	 XzopW0drYYeKa+STFOk5xaZxT6nKHTkkcwmu01VcLUU0QYThRQ/QP1b8IMkROZEsbSCUT
	 pIEBHW61yRmXqPWWnw4YEcfEPrM4hLNSEVnhyHvDL7pTRgSe4rdw/9GYiwHuXeN9TH72G
	 cWvMUNAqkcxAhNfTLFr5AnRZChyqO09A7ixX93PMxToRH99Pc38K4Eka3Lt8zbvCWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035214;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=i6/4AF1KDCqnwZIw2PcqWTUXeQX9+JVrqLJ7k8B3GDY=;
	b=IVMPPHyOujboofuPBTQUIKl+W2Tw85syfBDbc6UEJYAVTD1txWilXLcLxc6751XteBQg
	 65CEjmC6/7xnUUzWKh4qB6fJRWB/FVNZZLFoHYq2TiUqP4P4EcCXaPSZzHlx/xNRU3Sne
	 UIMMaSKmY7RcKXmNUTPhiRIXL0u4vfNpWD8xen/F2sCWQ5/6V0weQevCVRRhxwdRlWX/5
	 OUssQC2E0+o2RK60KBSaMLg8DyetB7DsffsmcqgLWoELDce9fOPAqwaBfaRyK78x+/kbZ
	 q2XGkH7f4D113BK7li82vIkv5ANKYcK3jOOivjMVPuaTLMjdra5Ofwz/lRMla1PsRmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0B2fZS5j;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FE260A2604
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FE260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0B2fZS5j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BB24EC4F77A;
	Wed, 18 Nov 2026 20:53:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2A125FE9B;
	Wed, 18 Nov 2026 20:53:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0823711BC3095;
	Wed, 18 Nov 2026 21:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795035210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i6/4AF1KDCqnwZIw2PcqWTUXeQX9+JVrqLJ7k8B3GDY=;
	b=0B2fZS5jFAXDdHfL7ZJ915ThzNZQPezL/s0OMOyL7XCF1yB6MqiBFJdgYLCBRcaXgt15ot
	ptPVHZxhsp956McZUIN10e5qMvl78ngyKwmfwrZ8lb9Yq70PscSXgKyQtdsozFcEKQgAzR
	ju12VpYkgYuTsKjav/UYpT6JLAkj+PoVFUf3a1EvWBv5Y7vcFuBhYrvMR82ca9egH3d3cc
	hwwFuqeHSDk7+LXhUyLlyKzG/d3GuufLGFbWUJbiftS9uTDDndx4vtrASey9NN2ddh2ak3
	B8TXfjK5l5SagDccN/YXnjubkNuqJB1PxV6cgxMgMA84C7WhMs0jLhwN+uPRCg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 18 Nov 2026 21:53:23 +0100
Subject: [PATCH net-next v7 1/3] net: macb: cache ENST config across link
 down/up
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-macb-set-channels-v7-1-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
In-Reply-To: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Currently, ENST is not explicitly restored across interface close/open.
If HW keeps its register state then ENST is kept, otherwise it is lost;
but we do not write the ENST schedule again on open.

This causes trouble if the config is not compatible with the new open
and link-up. The two issues that can occur are a link speed change (as
all timings are configured in a unit relative to the link speed) or a
change in the # of queues.

The latter is the main reason we do this change before implementing
ethtool -L support.

If on link-up, the cached ENST config is invalid (link speed changed),
then we drop the cached config, log a warning and explicitly override
all ENST timings previously configured in the registers. If it is
valid, we explicitly re-apply it.

Take this opportunity to replace a kmalloc in
macb_taprio_setup_replace() with a simple and tiny (104b) stack value.

Drop the old hack of checking for pm_runtime_suspended(), which has
little value because we could race with the runtime_suspend() call.

Synchronise our config using the existing bp->mac_cfg_lock mutex, taken
by macb_taprio_setup_replace() and macb_taprio_destroy(). To avoid an
ABBA deadlock between bp->mac_cfg_lock and phydev->lock taken by
phylink_ethtool_ksettings_get(), cache the link speed as bp->speed_mbps.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      |  47 +++++---
 drivers/net/ethernet/cadence/macb_main.c | 187 +++++++++++++++----------------
 2 files changed, 124 insertions(+), 110 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index b7b4b6a38298..00258866623f 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1327,6 +1327,35 @@ struct macb_context {
 	struct macb_txq		txq[MACB_MAX_QUEUES];
 };
 
+/**
+ * struct macb_queue_enst_config - Configuration for Enhanced Scheduled Traffic
+ * @start_time_mask:  Bitmask representing the start time for the queue
+ * @on_time_bytes:    "on" time nsec expressed in bytes
+ * @off_time_bytes:   "off" time nsec expressed in bytes
+ *
+ * This structure holds the configuration parameters for an ENST queue,
+ * used to control time-based transmission scheduling in the MACB driver.
+ */
+struct macb_queue_enst_config {
+	u32 start_time_mask;
+	u32 on_time_bytes;
+	u32 off_time_bytes;
+};
+
+/**
+ * struct macb_enst - Cached Enhanced Scheduled Traffic configuration
+ * @queues:     per-queue timing (zeroed for queues without schedule)
+ * @speed_mbps: link speed the timings were computed for, 0 if no schedule
+ * @queue_mask: queues enabled by the current schedule, 0 if no schedule
+ *
+ * The timings are expressed in bytes, so they depend on the link speed.
+ */
+struct macb_enst {
+	struct macb_queue_enst_config	queues[MACB_MAX_QUEUES];
+	u32				speed_mbps;
+	u32				queue_mask;
+};
+
 struct macb {
 	void __iomem		*regs;
 	bool			native_io;
@@ -1427,11 +1456,14 @@ struct macb {
 
 	/* Redundant to netif_carrier_ok(), but set under bp->mac_cfg_lock. */
 	bool			link_up;
+	u32			speed_mbps;
 
 	u32	rx_intr_mask;
 
 	struct macb_pm_data pm_data;
 	const struct macb_usrio_config *usrio;
+
+	struct macb_enst enst;
 };
 
 #ifdef CONFIG_MACB_USE_HWSTAMP
@@ -1532,19 +1564,4 @@ struct macb_platform_data {
 	struct clk	*hclk;
 };
 
-/**
- * struct macb_queue_enst_config - Configuration for Enhanced Scheduled Traffic
- * @start_time_mask:  Bitmask representing the start time for the queue
- * @on_time_bytes:    "on" time nsec expressed in bytes
- * @off_time_bytes:   "off" time nsec expressed in bytes
- *
- * This structure holds the configuration parameters for an ENST queue,
- * used to control time-based transmission scheduling in the MACB driver.
- */
-struct macb_queue_enst_config {
-	u32 start_time_mask;
-	u32 on_time_bytes;
-	u32 off_time_bytes;
-};
-
 #endif /* _MACB_H */
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 9f6111661b40..1e0666692116 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -847,6 +847,7 @@ static void macb_mac_link_down(struct phylink_config *config, unsigned int mode,
 	mutex_lock(&bp->mac_cfg_lock);
 
 	bp->link_up = false;
+	bp->speed_mbps = 0;
 
 	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC))
 		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
@@ -955,6 +956,43 @@ static void gem_shuffle_tx_rings(struct macb *bp)
 		gem_shuffle_tx_one_ring(queue);
 }
 
+static void macb_apply_enst_config(struct macb *bp)
+{
+	struct macb_queue_enst_config *config;
+	struct macb_queue *queue;
+	u32 queue_mask;
+	size_t q;
+
+	/* Short-circuit to avoid writing to invalid register offsets */
+	if (!(bp->caps & MACB_CAPS_QBV))
+		return;
+
+	guard(spinlock_irqsave)(&bp->lock);
+
+	/* Disable ENST for all queues.
+	 * Reconfiguring timings must be done with ENST disabled.
+	 */
+	queue_mask = BIT_U32(bp->num_queues) - 1;
+	gem_writel(bp, ENST_CONTROL,
+		   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
+
+	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		/* Configure queue timing registers.
+		 *
+		 * Those fields must be zero if the queue has ENST disabled:
+		 * notice we don't bother reading bp->enst.queue_mask & BIT(q).
+		 */
+		config = &bp->enst.queues[q];
+		queue_writel(queue, ENST_START_TIME, config->start_time_mask);
+		queue_writel(queue, ENST_ON_TIME, config->on_time_bytes);
+		queue_writel(queue, ENST_OFF_TIME, config->off_time_bytes);
+	}
+
+	/* Enable ENST for all configured queues in one write */
+	if (bp->enst.queue_mask)
+		gem_writel(bp, ENST_CONTROL, bp->enst.queue_mask);
+}
+
 static void macb_mac_link_up(struct phylink_config *config,
 			     struct phy_device *phydev,
 			     unsigned int mode, phy_interface_t interface,
@@ -972,6 +1010,7 @@ static void macb_mac_link_up(struct phylink_config *config,
 	spin_lock_irqsave(&bp->lock, flags);
 
 	bp->link_up = true;
+	bp->speed_mbps = speed > 0 ? speed : 0;
 
 	ctrl = macb_or_gem_readl(bp, NCFGR);
 
@@ -1009,6 +1048,15 @@ static void macb_mac_link_up(struct phylink_config *config,
 
 	spin_unlock_irqrestore(&bp->lock, flags);
 
+	if (bp->enst.speed_mbps && speed != bp->enst.speed_mbps) {
+		netdev_warn(bp->netdev,
+			    "TAPRIO dropped because link speed changed\n");
+
+		memset(&bp->enst, 0, sizeof(bp->enst));
+	}
+
+	macb_apply_enst_config(bp);
+
 	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
 		macb_set_tx_clk(bp, speed);
 		gem_shuffle_tx_rings(bp);
@@ -4754,19 +4802,23 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 				     struct tc_taprio_qopt_offload *conf)
 {
 	u64 total_on_time = 0, start_time_sec = 0, start_time = conf->base_time;
-	u32 configured_queues = 0, speed = 0, start_time_nsec;
-	struct macb_queue_enst_config *enst_queue;
-	struct ethtool_link_ksettings kset = {};
+	u32 configured_queues = 0, start_time_nsec;
 	struct macb *bp = netdev_priv(netdev);
 	struct tc_taprio_sched_entry *entry;
-	struct macb_queue *queue;
-	u32 queue_mask;
+	struct macb_enst config = {};
 	u8 queue_id;
-	size_t i, q;
-	int err;
+	u64 off;
+	size_t i;
+
+	guard(mutex)(&bp->mac_cfg_lock);
+
+	if (unlikely(!bp->speed_mbps)) {
+		netdev_err(netdev, "Invalid speed, link-down?\n");
+		return -EINVAL;
+	}
 
 	if (conf->num_entries > bp->num_queues) {
-		netdev_err(netdev, "Too many TAPRIO entries: %zu > %d queues\n",
+		netdev_err(netdev, "Too many TAPRIO entries: %zu > %u active queues\n",
 			   conf->num_entries, bp->num_queues);
 		return -EINVAL;
 	}
@@ -4777,23 +4829,6 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 		return -ERANGE;
 	}
 
-	/* Get the current link speed */
-	err = phylink_ethtool_ksettings_get(bp->phylink, &kset);
-	if (unlikely(err)) {
-		netdev_err(netdev, "Failed to get link settings: %d\n", err);
-		return err;
-	}
-
-	speed = kset.base.speed;
-	if (unlikely(speed == SPEED_UNKNOWN || !speed)) {
-		netdev_err(netdev, "Invalid speed %d, link-down?\n", speed);
-		return -EINVAL;
-	}
-
-	enst_queue = kzalloc_objs(*enst_queue, bp->num_queues);
-	if (unlikely(!enst_queue))
-		return -ENOMEM;
-
 	/* Pre-validate all entries before making any hardware changes */
 	for (i = 0; i < conf->num_entries; i++) {
 		entry = &conf->entries[i];
@@ -4801,25 +4836,23 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 		if (entry->command != TC_TAPRIO_CMD_SET_GATES) {
 			netdev_err(netdev, "Entry %zu: unsupported command %d\n",
 				   i, entry->command);
-			err = -EOPNOTSUPP;
-			goto cleanup;
+			return -EOPNOTSUPP;
 		}
 
 		/* Validate gate_mask: must be nonzero, single queue, and within range */
 		if (!is_power_of_2(entry->gate_mask)) {
 			netdev_err(netdev, "Entry %zu: gate_mask 0x%x is not a power of 2 (only one queue per entry allowed)\n",
 				   i, entry->gate_mask);
-			err = -EINVAL;
-			goto cleanup;
+			return -EINVAL;
 		}
 
 		/* gate_mask must not select queues outside the valid queues */
 		queue_id = order_base_2(entry->gate_mask);
 		if (queue_id >= bp->num_queues) {
-			netdev_err(netdev, "Entry %zu: gate_mask 0x%x exceeds queue range (max_queues=%d)\n",
-				   i, entry->gate_mask, bp->num_queues);
-			err = -EINVAL;
-			goto cleanup;
+			netdev_err(netdev, "Entry %zu: gate_mask 0x%x exceeds active queue range (num_queues=%u)\n",
+				   i, entry->gate_mask,
+				   bp->num_queues);
+			return -EINVAL;
 		}
 
 		/* Check for start time limits */
@@ -4828,34 +4861,33 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 		if (start_time_sec > GENMASK(GEM_START_TIME_SEC_SIZE - 1, 0)) {
 			netdev_err(netdev, "Entry %zu: Start time %llu s exceeds hardware limit\n",
 				   i, start_time_sec);
-			err = -ERANGE;
-			goto cleanup;
+			return -ERANGE;
 		}
 
 		/* Check for on time limit */
-		if (entry->interval > enst_max_hw_interval(speed)) {
+		if (entry->interval > enst_max_hw_interval(bp->speed_mbps)) {
 			netdev_err(netdev, "Entry %zu: interval %u ns exceeds hardware limit %llu ns\n",
-				   i, entry->interval, enst_max_hw_interval(speed));
-			err = -ERANGE;
-			goto cleanup;
+				   i, entry->interval,
+				   enst_max_hw_interval(bp->speed_mbps));
+			return -ERANGE;
 		}
 
 		/* Check for off time limit*/
-		if ((conf->cycle_time - entry->interval) > enst_max_hw_interval(speed)) {
+		off = conf->cycle_time - entry->interval;
+		if (off > enst_max_hw_interval(bp->speed_mbps)) {
 			netdev_err(netdev, "Entry %zu: off_time %llu ns exceeds hardware limit %llu ns\n",
-				   i, conf->cycle_time - entry->interval,
-				   enst_max_hw_interval(speed));
-			err = -ERANGE;
-			goto cleanup;
+				   i, off,
+				   enst_max_hw_interval(bp->speed_mbps));
+			return -ERANGE;
 		}
 
-		enst_queue[queue_id].start_time_mask =
+		config.queues[queue_id].start_time_mask =
 			(start_time_sec << GEM_START_TIME_SEC_OFFSET) |
 			start_time_nsec;
-		enst_queue[queue_id].on_time_bytes =
-			enst_ns_to_hw_units(entry->interval, speed);
-		enst_queue[queue_id].off_time_bytes =
-			enst_ns_to_hw_units(conf->cycle_time - entry->interval, speed);
+		config.queues[queue_id].on_time_bytes =
+			enst_ns_to_hw_units(entry->interval, bp->speed_mbps);
+		config.queues[queue_id].off_time_bytes =
+			enst_ns_to_hw_units(off, bp->speed_mbps);
 
 		configured_queues |= entry->gate_mask;
 		total_on_time += entry->interval;
@@ -4866,82 +4898,47 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 	if (total_on_time > conf->cycle_time) {
 		netdev_err(netdev, "Total ON %llu ns exceeds cycle time %llu ns\n",
 			   total_on_time, conf->cycle_time);
-		err = -EINVAL;
-		goto cleanup;
+		return -EINVAL;
 	}
 
 	netdev_dbg(netdev, "TAPRIO setup: %zu entries, base_time=%lld ns, cycle_time=%llu ns\n",
 		   conf->num_entries, conf->base_time, conf->cycle_time);
 
-	/* All validations passed - proceed with hardware configuration */
-	scoped_guard(spinlock_irqsave, &bp->lock) {
-		/* Disable ENST queues if running before configuring */
-		queue_mask = BIT_U32(bp->num_queues) - 1;
-		gem_writel(bp, ENST_CONTROL,
-			   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
+	config.queue_mask = configured_queues;
+	config.speed_mbps = bp->speed_mbps;
+	bp->enst = config;
 
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
-			/* Configure queue timing registers */
-			queue_writel(queue, ENST_START_TIME,
-				     enst_queue[q].start_time_mask);
-			queue_writel(queue, ENST_ON_TIME,
-				     enst_queue[q].on_time_bytes);
-			queue_writel(queue, ENST_OFF_TIME,
-				     enst_queue[q].off_time_bytes);
-		}
-
-		/* Enable ENST for all configured queues in one write */
-		gem_writel(bp, ENST_CONTROL, configured_queues);
-	}
+	macb_apply_enst_config(bp);
 
 	netdev_info(netdev, "TAPRIO configuration completed successfully: %zu entries, %d queues configured\n",
 		    conf->num_entries, hweight32(configured_queues));
 
-cleanup:
-	kfree(enst_queue);
-	return err;
+	return 0;
 }
 
 static void macb_taprio_destroy(struct net_device *netdev)
 {
 	struct macb *bp = netdev_priv(netdev);
-	struct macb_queue *queue;
-	u32 queue_mask;
-	unsigned int q;
+
+	guard(mutex)(&bp->mac_cfg_lock);
 
 	netdev_reset_tc(netdev);
-	queue_mask = BIT_U32(bp->num_queues) - 1;
+	memset(&bp->enst, 0, sizeof(bp->enst));
 
-	scoped_guard(spinlock_irqsave, &bp->lock) {
-		/* Single disable command for all queues */
-		gem_writel(bp, ENST_CONTROL,
-			   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
+	if (bp->link_up)
+		macb_apply_enst_config(bp);
 
-		/* Clear all queue ENST registers in batch */
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
-			queue_writel(queue, ENST_START_TIME, 0);
-			queue_writel(queue, ENST_ON_TIME, 0);
-			queue_writel(queue, ENST_OFF_TIME, 0);
-		}
-	}
 	netdev_info(netdev, "TAPRIO destroy: All gates disabled\n");
 }
 
 static int macb_setup_taprio(struct net_device *netdev,
 			     struct tc_taprio_qopt_offload *taprio)
 {
-	struct macb *bp = netdev_priv(netdev);
 	int err = 0;
 
 	if (unlikely(!(netdev->hw_features & NETIF_F_HW_TC)))
 		return -EOPNOTSUPP;
 
-	/* Check if Device is in runtime suspend */
-	if (unlikely(pm_runtime_suspended(&bp->pdev->dev))) {
-		netdev_err(netdev, "Device is in runtime suspend\n");
-		return -EOPNOTSUPP;
-	}
-
 	switch (taprio->cmd) {
 	case TAPRIO_CMD_REPLACE:
 		err = macb_taprio_setup_replace(netdev, taprio);

-- 
2.56.1

