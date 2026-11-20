Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146759;
	b=OX2fsr7gHLP0RTQvEWaaT+v3ZV16EmVnRv60nwWs66EoGcxJCYecl2X5mvdnpKMQTt3I
	 G1I30KmlQQz2QK+yyafc3VQcaSM34nyszUYymMcGut62oe35iE9QrvUaCGgNlOUXL5GFJ
	 gB7V/hBUebbKxFg9DHz0TpGhuJDjVI0yXSomYuwz1b3wtyW0ZxIXMTi1T8R32j5N76NoK
	 Fv1CMzDFyAs7EIKMsVNKVLu80TI+0JaRdE1knaNL/uCDsteCPET5S9owBhR8f5XdqgfdW
	 B325YBO2xPbp4GjlqTB5kMpom1nKbJd4fuu6mYtH208l4ViQu7BWJRkTNWNxWioZM6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146759;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tgAHFf5QdCKXpzZymrYAsJ6lRzilvKK6wOHsRBEK0j4=;
	b=AInVwbS8y7w7IgDkNoZQoa4kSZownPBG4AyEi7kBNYwUv6VMOq1+yMoZMcTvt5zSueoN
	 98BWp7v+bEdaitREDFKiwipOCTKYxQP2XZbm0Nv1F2SfJKIconMt/Hkeo6ZKEKBiNOAOl
	 fEqTh3b9kOfXE20meKuuRQU0nJcn7rJc4lcRbU6nxF+1QV0IJ9yzhWRDyrR/xdwOhvy/f
	 Tl6VckiMweE5XpQoJYERItk5QKFMbN4/jgojVef9Zw33dHgP+eLWrDjF47Vqe9NMio3t9
	 JWfkHqJb8yEj+rubINB+4ZqxpRgH8AQpYi3fYCBEpZLKr1KOFI0UHkdA0K/Nupt/gFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APcrWea4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBCE606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APcrWea4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5904B1F000D2;
	Fri, 20 Nov 2026 03:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146759;
	bh=tgAHFf5QdCKXpzZymrYAsJ6lRzilvKK6wOHsRBEK0j4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=APcrWea4XAoaZ2OBHw7yWBOh1VbBB5jBJDQCrp5XIc/b9BejIHansG9elrx8Ow2hl
	 +aPOPJsdvf5PTgwsszvhKUuOVL3pEOAR/Mr3gTTniBHbncEXj3uvODAg+8hM9qoq68
	 TbOr+4lh39XJQai03QlulMl9CKTDSFgMPtJrNbHMKg+Sfgt5bUJtmaHDb7PM2srmn0
	 taQMdXPe0Pea4yzIapghj1XbXybZqqSRk33IS6n+0RvfTEGXyJ3SwTyPPyaHEGrCJV
	 lJjvnc7CeUknTtXxK3ePmINalwWzQCif2AK+ZpgUtYLv8Tx+011/Ww4jvxM71cDCcq
	 86KS5F/UlUUeA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	bjorn@kernel.org,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 7/7] eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA node
Date: Thu, 19 Nov 2026 19:52:14 -0800
Message-ID: <20261120035214.369158-8-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035214.369158-1-kuba@kernel.org>
References: <20261120035214.369158-1-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rx queue memory is allocated on the node of the CPU servicing the queue
when the device is opened. On a running device it only follows IRQ
affinity changes if TPH is enabled, as a side effect of the queue
restart which applies the new TPH Steering Tag.

Schedule the affinity update work whenever the device supports the
queue API, not just when TPH Steering Tag changed. Queue restart places
all the memory it reallocates, other than the ring page tables, on
the page pool's node, so compare the page pool's nid to decide if
the queue has to move. Only consider queues whose IRQ affinity was set
from the outside, so that moving one IRQ doesn't restart other queues
just because CPU hotplug shifted our default spread.

Since we need queue state of the currently allocated queue to compare
nid - check that the device is still up after errors.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - split the TPH condition in the notifier (Joe)
 - only compare the node of queues with IRQ affinity set from the outside
v1: https://lore.kernel.org/20261118023905.3050661-7-kuba@kernel.org
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 53 +++++++++++++++--------
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 61b86fa9cadb..0334f24b7522 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2656,7 +2656,7 @@ struct bnxt {
 #define BNXT_RING_COAL_NOW_SP_EVENT	17
 #define BNXT_FW_RESET_NOTIFY_SP_EVENT	18
 #define BNXT_FW_EXCEPTION_SP_EVENT	19
-#define BNXT_TPH_UPDATE_SP_EVENT	20
+#define BNXT_IRQ_AFFINITY_SP_EVENT	20
 #define BNXT_LINK_CFG_CHANGE_SP_EVENT	21
 #define BNXT_THERMAL_THRESHOLD_SP_EVENT	22
 #define BNXT_FW_ECHO_REQUEST_SP_EVENT	23
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 2c80a39eb8f0..cbd249788198 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11978,18 +11978,17 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 	}
 #endif
 
-	if (!bp->tph_mode)
+	/* Only Rx queues can be restarted to follow the IRQ */
+	if (!BNXT_SUPPORTS_QUEUE_API(bp) || irq->ring_nr >= bp->rx_nr_rings)
 		return;
 
-	if (irq->ring_nr >= bp->rx_nr_rings)
-		return;
+	if (bp->tph_mode) {
+		cpu = cpumask_first(mask);
+		if (!pcie_tph_get_cpu_st(bp->pdev, TPH_MEM_TYPE_VM, cpu, &tag))
+			WRITE_ONCE(irq->new_tag, tag);
+	}
 
-	if (pcie_tph_get_cpu_st(bp->pdev, TPH_MEM_TYPE_VM,
-				cpumask_first(mask), &tag))
-		return;
-
-	WRITE_ONCE(irq->new_tag, tag);
-	bnxt_queue_sp_work(bp, BNXT_TPH_UPDATE_SP_EVENT);
+	bnxt_queue_sp_work(bp, BNXT_IRQ_AFFINITY_SP_EVENT);
 }
 
 static void bnxt_irq_affinity_release(struct kref *ref)
@@ -14709,7 +14708,10 @@ static void bnxt_rtnl_unlock_sp(struct bnxt *bp)
 	rtnl_unlock();
 }
 
-static void bnxt_tph_update(struct bnxt *bp)
+/* Restart the Rx queues whose IRQ moved, if the move changed the TPH
+ * Steering Tag or the node the queue memory should be allocated on.
+ */
+static void bnxt_irq_affinity_update(struct bnxt *bp)
 {
 	struct net_device *dev = bp->dev;
 	int i;
@@ -14719,27 +14721,40 @@ static void bnxt_tph_update(struct bnxt *bp)
 		goto unlock;
 
 	for (i = 0; i < bp->rx_nr_rings; i++) {
+		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
+		bool new_tag = false, new_node = false;
+		int map_idx, err, nid;
 		struct bnxt_irq *irq;
-		int map_idx, err;
 		u16 tag;
 
 		map_idx = bnxt_cp_num_to_irq_num(bp, i);
 		irq = &bp->irq_tbl[map_idx];
+
 		tag = READ_ONCE(irq->new_tag);
-		if (irq->tag == tag)
+		if (irq->tag != tag) {
+			if (!pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
+				new_tag = true;
+		}
+
+		nid = READ_ONCE(bp->ring_nid[i]);
+		if (nid != NUMA_NO_NODE && rxr->page_pool->p.nid != nid)
+			new_node = true;
+
+		if (!new_tag && !new_node)
 			continue;
 
-		if (pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
-			continue;
-
-		err = netdev_rx_queue_restart(dev, irq->ring_nr);
+		err = netdev_rx_queue_restart(dev, i);
 		if (err) {
 			netdev_err(dev, "RX queue restart failed: err=%d\n",
 				   err);
+			/* Failing to start a new queue may close the device */
+			if (!test_bit(BNXT_STATE_OPEN, &bp->state))
+				break;
 			continue;
 		}
 
-		irq->tag = tag;
+		if (new_tag)
+			irq->tag = tag;
 	}
 
 unlock:
@@ -15183,8 +15198,8 @@ static void bnxt_sp_task(struct work_struct *work)
 			bnxt_devlink_health_fw_report(bp);
 	}
 
-	if (test_and_clear_bit(BNXT_TPH_UPDATE_SP_EVENT, &bp->sp_event))
-		bnxt_tph_update(bp);
+	if (test_and_clear_bit(BNXT_IRQ_AFFINITY_SP_EVENT, &bp->sp_event))
+		bnxt_irq_affinity_update(bp);
 
 	smp_mb__before_atomic();
 	clear_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
-- 
2.56.1

