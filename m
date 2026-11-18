Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969552;
	b=wIcgam/CH6FUTR1N8kSX3iIXIhkF0UPNQBPkvk6QWTXyp6X9w28a+a/56QR+St58pfZB
	 bcwE7PelhsjKehhTKOuGKwWvmoAqni+nxSaDmPMrKNaR7TRcs2wpLzTMNTWvtGn2Z/9Ex
	 N5TG2G8mH6wqsAQLVBP4DpqtgczL3ZXZRbYEcO/DYoXv+esW8qzTJMQpEvJA6Ii3I23l/
	 dMf4SlS9uln6XjQ4dOwL/mpjSPZYefsirBPRgDJp9BbN/XddsZYcuKUfRZB/ZFs7JBAz4
	 YY6C0oaYKyNA8I7oedmA/qAJH81ueVjpeNqojCqS6QB+qsG/pKPu654wWNw+4AnJHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969552;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xMST5v9eEPCd7lhbM9hSl4/w5+I+UGboTadm1fyBXTY=;
	b=4lC7KsTvag8jdo9XdvM1QR/aHx/8EsSj257HfT0Zsjzap+uoSCttgBcPDh149tT3wdmL
	 uPTjByYZHtf3Wt3OaLkHP0EgBJ/TRWXCGfAVLyXH38B9Ykge7h23PYUneV3SMNcnCt/Um
	 fp1Nz3rfcOmk2uxLTcxHD16u6qfEleS8S2pNlrzqg1y6iArWTYeoWXKUMM4zv99+IoOAS
	 J0oTtLhlXj5fxXXIa6QSoZvSyy/DmNUL/ipHIYmtphIW937tXdAPA7Dorgur5vWbZy4P+
	 QDvoFCoUJ2Ywap5XVHiNW0FCLkd7g9XPkccWOEZKjxwl/7OqCI5xzkopUV/vFqHjUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbKsnAOX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FED4606A89B
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbKsnAOX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58821F000C5;
	Wed, 18 Nov 2026 02:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969552;
	bh=xMST5v9eEPCd7lhbM9hSl4/w5+I+UGboTadm1fyBXTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XbKsnAOXa1v5RPTE2939pEm/daflWUaOmnWoJx2Ljm2HPIlMRug/xAepyBUA1RhqP
	 0uhq26HHdx5GL9rzcI0yXeKz32KoGHPG+/38I8RhyEpW8/1kSxhkN1G/1zNUm8nIaS
	 mHXBJSbK0COrKqD+xb3SaX+bONBHfR1cm48iIH+3nLX1ZVNdo1NVZHDA5re+bE/B4D
	 XuOIMB+SqANw5fvGMGKFDr74EtbDNpIk/JnFLYL9mMueosSoL+rC//UO0JWFc6P9vH
	 2e0eRYk/2HKGB1wsDs0riQ4q5XNzL/P6G51pSKXri16GtIAAF191BUyEmUJBMbLLUy
	 0C7QpaXpFBH1Q==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 6/6] eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA node
Date: Tue, 17 Nov 2026 18:39:05 -0800
Message-ID: <20261118023905.3050661-7-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118023905.3050661-1-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
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

Rx queue memory is allocated on the node of the CPU servicing the queue
when the device is opened. On a running device it only follows IRQ
affinity changes if TPH is enabled, as a side effect of the queue
restart which applies the new TPH Steering Tag.

Schedule the affinity update work whenever the device supports the
queue API, not just when TPH Steering Tag changed. Queue restart places
all the memory it reallocates, other than the ring page tables, on
the page pool's node, so compare the page pool's nid to decide if
the queue has to move.

Since we need queue state of the currently allocated queue to compare
nid - check that the device is still up after errors.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 46 ++++++++++++++---------
 2 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 86fc2e8a5816..4b80b20288ba 100644
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
index 134b24842c4f..5f4a8db1f8b5 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11931,18 +11931,17 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 	}
 #endif
 
-	if (!irq->bp->tph_mode)
+	/* Only Rx queues can be restarted to follow the IRQ */
+	if (!BNXT_SUPPORTS_QUEUE_API(irq->bp) ||
+	    irq->ring_nr >= irq->bp->rx_nr_rings)
 		return;
 
-	if (irq->ring_nr >= irq->bp->rx_nr_rings)
-		return;
+	if (irq->bp->tph_mode &&
+	    !pcie_tph_get_cpu_st(irq->bp->pdev, TPH_MEM_TYPE_VM,
+				 cpumask_first(mask), &tag))
+		WRITE_ONCE(irq->new_tag, tag);
 
-	if (pcie_tph_get_cpu_st(irq->bp->pdev, TPH_MEM_TYPE_VM,
-				cpumask_first(mask), &tag))
-		return;
-
-	WRITE_ONCE(irq->new_tag, tag);
-	bnxt_queue_sp_work(irq->bp, BNXT_TPH_UPDATE_SP_EVENT);
+	bnxt_queue_sp_work(irq->bp, BNXT_IRQ_AFFINITY_SP_EVENT);
 }
 
 static void bnxt_irq_affinity_release(struct kref *ref)
@@ -14663,7 +14662,10 @@ static void bnxt_rtnl_unlock_sp(struct bnxt *bp)
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
@@ -14673,6 +14675,8 @@ static void bnxt_tph_update(struct bnxt *bp)
 		goto unlock;
 
 	for (i = 0; i < bp->rx_nr_rings; i++) {
+		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
+		bool new_tag = false, new_node = false;
 		struct bnxt_irq *irq;
 		int map_idx, err;
 		u16 tag;
@@ -14680,20 +14684,26 @@ static void bnxt_tph_update(struct bnxt *bp)
 		map_idx = bnxt_cp_num_to_irq_num(bp, i);
 		irq = &bp->irq_tbl[map_idx];
 		tag = READ_ONCE(irq->new_tag);
-		if (irq->tag == tag)
+		if (irq->tag != tag &&
+		    !pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
+			new_tag = true;
+		if (rxr->page_pool->p.nid != bnxt_cp_num_to_node(bp, i))
+			new_node = true;
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
@@ -15137,8 +15147,8 @@ static void bnxt_sp_task(struct work_struct *work)
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

