Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989699;
	b=sYwELlMGwBH+wkVZizVIzPUhSpynUeNNmLXxNPli8xxZARsWRfi6LSpBOlmohgoonQdu
	 0mF4xmFoKiTj1USIkP6erhuajroAWRIdSHCZY+4B8JcQODZBuNtFC+11Ruri0r0gNXjzF
	 aKYpiYGFA11dbYOilcctlVVSYxwKJ3EbksiMkK2V7JTURNH2yTW7LiMNYl3hB7FYDb/L7
	 G9mxwlljgU/BqPfx/wwibERYqHbQYunN6Y5GjJn2zY+d7ZlspLrXKf8yXxqvFPt0rfgU6
	 wMZITym0a7Zq/2B0AtCJMrgZKAacMsy9f8Wdd98n/1RFKqg2M00XMLB/8MIwag+f+WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989699;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=LL5fE+todC7wJz39Y2ARR9Ij7j0uiPGw2pixEE4dEYA=;
	b=SegZ8GG3qSlJJZDlNXRLSQfS6l6dvKqLuyiFywnAHJ+Vc/64xXl1K1iGtgmJ/tMlvNPv
	 b0QbvfH+8M57ySBUpGwZcTOV56XG8e2x6Dld2RV7nmDoUoxwEcgf21DDIgpuhnCJu2nYC
	 H6Pjy/v0/Ie8Mfcxre+m5qIRYn5NEeUorQQgXXiEorz+74Kip/XTYN1Suv/AqvZu+eTJy
	 VYTK+RUMVLCzRzV1X5Lf2MlmOcJzq6itFUCitP8y5Beqz1bC6cjsjUKFSjFKmN2Z++Ju/
	 B73quYcuwIYOj9WQdKf48hUwtHMSov+7Erg4RphEQqxjUaUa0rQDBCa0OCE9HInjE+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1643606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1643606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: esmtpsz10t1794989626td15d164b
X-QQ-Originating-IP: eX+50kFLPusFF8jumRRmbKlo2HY58BzQpAftPXi1F1w=
Received: from localhost.localdomain ( [115.204.248.161])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 16:13:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6925879388458902356
EX-QQ-RecipientCnt: 13
From: Mengyuan Lou <mengyuanlou@net-swift.com>
To: netdev@vger.kernel.org
Cc: jiawenwu@trustnetic.com,
	duanqiangwen@net-swift.com,
	linglingzhang@net-swift.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	hramamurthy@google.com,
	jacob.e.keller@intel.com,
	przemyslaw.kitszel@intel.com,
	Mengyuan Lou <mengyuanlou@net-swift.com>
Subject: [PATCH net v8 1/2] net: wangxun: protect ring accesses with RCU
Date: Wed, 18 Nov 2026 16:13:28 +0800
Message-Id: <20261118081329.39551-2-mengyuanlou@net-swift.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20261118081329.39551-1-mengyuanlou@net-swift.com>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:net-swift.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MJaTj6odSZT1ieWrQiOC7D37fSxSbWW4edbTewcABmaw96EEPQQ1AO+F
	hJHHslFxq8ITcGj1NeXQ4h7RLLEBW6LOxTJdNNWZjKZmU4wJ6JpIndz2murbEH5jkZzrvz5
	1GU5snMTn4FuJL+3rKP0VbR8bGsTsYB+1YNZIfrtWXhq8LE7utq/5iGjNKsfUUZMCvlHw2l
	+eOKr4eyomNNd1G6mvmwbCwzGYj7d1mHFlDRO3LO3+mn5t7wYHsVbUXy7W90P9ZFBl0H8/a
	x1H0rcy9ol8VQnhWxzdPWM4OY/Tj1cWeZePGCluydgha9vlP6yPh/zUyh/8svXCRV7FGu0q
	uG0dbfPYLYsoqeqTHHc4fJAoe8Z5wFrOSzAHO2TxNESa5PHvrkxi0SX1hgTNgvpeOq38ugV
	V0699vyvJVr7CnGxvTpBKGLgqpVvw1edlC4Mn9KYemYW3h4k1cUELhf/J75pqj4CTnE5Zf8
	Lyrp6d8lsxCT/6f3u9BTpAxeUZSTm5zJ09K5hZdPFnF6ACUig3GbUU8w+9T6TTt3AUMBjf8
	gTX878vRmessO4jBvCfnz8Y/Dj4xZJLm6LdR0EnmjfKP/iIfGH6v5xRYundi7WhCGWQSwxC
	S78e1DakkR0UPzo77wvDKFYlRzAX7U0zfuOLgDWnASzHH/RZ2Kswp/SzynzSACe/JCXcHGo
	LKoOxCVofFvPmHqB6u9EpWRL+dpHicND2SHakd8uJpflrE+zwC747GJmlcuXKNmPl5KPiKn
	LGeSryLNw1OUrm03CHQ+2DKPM0T90IsGbW9E0am3vGAVC0pFgFtQnfSP55qcFs29LEZaa6V
	vrGnet1FhGDCm+Ab1M6/Mrpoyl8NkJv6sm7G0JabfbUlpBkVfmH2AjaUAP+9AQUCNWjRYKL
	SbzLRuk+/kbsnHNmYz8BMfQSiVTNj0iMOXolnX8lOYZ9cTArqYkGqRt1ddqPe5U4DEDeE8C
	QasonyXYZjBrI+d0CMaKGkwrE+VSZkysWGyNFbueMqNuqSyt/HA2yKp+n7e2Owzj8oMClVE
	5UKd/atBjRT0SBwfnf5I6fcIIXGUgN7qg3raduRsGb4oeHdb42DjhhKs/YlckqFX3Fy4AtV
	F+u+96Uvo4La6e8Mm6/DGklpC+W7h9Wq4DpbmNPiZF6Yy9OchUtVHqp9LuifhnDQyaPO7aN
	ZMhyapxRk4o9fmV8vc6dhF6TIz7SmGuNaVtvqaTUuIEnW7I=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

In the Wangxun driver family, ring pointers in wx->rx_ring[] and
wx->tx_ring[] can be published, cleared, or replaced during interrupt
scheme teardown, channel reconfiguration (e.g. via ethtool -L), or TC
setup.

Various lockless readers, including stats gathering, PTP watchdogs,
and flow control checks, access per-queue ring structures without
formal RCU annotations. Although q_vector memory lifetime is managed
via kfree_rcu(), the ring array accesses themselves lack explicit RCU
dereference semantics and barriers.

Annotate the ring arrays and convert their readers and writers to RCU
primitives. Move the queue-to-register index calculation from the
post-allocation wx_cache_ring_rss()/wx_cache_ring_vmdq() pass into per-ring
allocation via wx_get_reg_idx(). Initialize each ring's reg_idx before
publishing its pointer so lockless readers cannot observe an uninitialized
value.
Use rtnl_dereference() in control paths protected by RTNL, and RCU
read-side critical sections for lockless readers.

The ring arrays are managed by wx_alloc_q_vector() and
wx_free_q_vector(), reached through wx_init_interrupt_scheme() and
wx_clear_interrupt_scheme(). The probe paths call
wx_init_interrupt_scheme() before the netdev is registered; the
allocation path only publishes rings with rcu_assign_pointer(), so no
RTNL is needed there. wxvf_resume() defers rebuilding the interrupt
scheme to wxvf_reopen_subtask(), which runs under RTNL. wxvf_suspend()
holds RTNL across wxvf_close() and wx_clear_interrupt_scheme(),
protecting control-path readers and serializing teardown against the
reset subtask. The service timer and work are drained before the PCI
device is disabled.

ngbe_dev_shutdown() keeps RTNL held across the WoL setup as well.
That matches the locking of the other wx_configure_rx() callers and
keeps the WoL configuration from racing with a channel reconfiguration,
which re-creates the interrupt scheme. wx_clear_interrupt_scheme() has
already zeroed the queue counts before wx_configure_rx() runs, so its
ring loops do not access the ring arrays on this shutdown path.

wx_xmit_frame() also needs to handle teardown racing with transmission:
wx_free_q_vectors() can zero wx->num_tx_queues while the netdev remains
registered, which could otherwise cause a modulo-by-zero, and the ring
slot can be NULL. Bail out on either condition and account the dropped
skb. Also account for the carrier-off path and skb_put_padto() failure;
the latter frees the skb on error, so only the counter can be updated on
that path.

Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>
---
 drivers/net/ethernet/wangxun/libwx/wx_err.c   |  20 ++-
 .../net/ethernet/wangxun/libwx/wx_ethtool.c   |  10 +-
 drivers/net/ethernet/wangxun/libwx/wx_hw.c    |  73 ++++++++--
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   | 137 ++++++++----------
 drivers/net/ethernet/wangxun/libwx/wx_ptp.c   |   6 +-
 drivers/net/ethernet/wangxun/libwx/wx_type.h  |  12 +-
 .../net/ethernet/wangxun/libwx/wx_vf_common.c |   2 +-
 .../net/ethernet/wangxun/libwx/wx_vf_lib.c    |   7 +-
 .../net/ethernet/wangxun/ngbe/ngbe_ethtool.c  |   4 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c |  11 +-
 .../ethernet/wangxun/txgbe/txgbe_ethtool.c    |   6 +-
 .../net/ethernet/wangxun/txgbe/txgbe_fdir.c   |   2 +-
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |   4 +-
 13 files changed, 174 insertions(+), 120 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/libwx/wx_err.c b/drivers/net/ethernet/wangxun/libwx/wx_err.c
index b56fbdc959dec..8eadb4d3abcff 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_err.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_err.c
@@ -201,12 +201,18 @@ static bool wx_ring_tx_pending(struct wx *wx)
 {
 	int i;
 
+	rcu_read_lock();
 	for (i = 0; i < wx->num_tx_queues; i++) {
-		struct wx_ring *tx_ring = wx->tx_ring[i];
+		struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
 
-		if (tx_ring->next_to_use != tx_ring->next_to_clean)
+		if (!tx_ring)
+			continue;
+		if (tx_ring->next_to_use != tx_ring->next_to_clean) {
+			rcu_read_unlock();
 			return true;
+		}
 	}
+	rcu_read_unlock();
 
 	return false;
 }
@@ -264,8 +270,14 @@ static void wx_detect_tx_hang(struct wx *wx)
 
 	/* Force detection of hung controller */
 	if (netif_carrier_ok(wx->netdev)) {
-		for (i = 0; i < wx->num_tx_queues; i++)
-			set_bit(WX_TX_DETECT_HANG, wx->tx_ring[i]->state);
+		rcu_read_lock();
+		for (i = 0; i < wx->num_tx_queues; i++) {
+			struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
+
+			if (tx_ring)
+				set_bit(WX_TX_DETECT_HANG, tx_ring->state);
+		}
+		rcu_read_unlock();
 	}
 }
 
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_ethtool.c b/drivers/net/ethernet/wangxun/libwx/wx_ethtool.c
index 940d2e59876c7..2307149b07fdb 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_ethtool.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_ethtool.c
@@ -154,8 +154,9 @@ void wx_get_ethtool_stats(struct net_device *netdev,
 		}
 	}
 
+	rcu_read_lock();
 	for (j = 0; j < netdev->num_tx_queues; j++) {
-		ring = wx->tx_ring[j];
+		ring = rcu_dereference(wx->tx_ring[j]);
 		if (!ring) {
 			data[i++] = 0;
 			data[i++] = 0;
@@ -170,7 +171,7 @@ void wx_get_ethtool_stats(struct net_device *netdev,
 		i += 2;
 	}
 	for (j = 0; j < WX_NUM_RX_QUEUES; j++) {
-		ring = wx->rx_ring[j];
+		ring = rcu_dereference(wx->rx_ring[j]);
 		if (!ring) {
 			data[i++] = 0;
 			data[i++] = 0;
@@ -184,6 +185,7 @@ void wx_get_ethtool_stats(struct net_device *netdev,
 		} while (u64_stats_fetch_retry(&ring->syncp, start));
 		i += 2;
 	}
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL(wx_get_ethtool_stats);
 
@@ -805,9 +807,9 @@ static int wx_set_ringparam_vf(struct net_device *netdev,
 
 	if (!netif_running(wx->netdev)) {
 		for (i = 0; i < wx->num_tx_queues; i++)
-			wx->tx_ring[i]->count = new_tx_count;
+			rtnl_dereference(wx->tx_ring[i])->count = new_tx_count;
 		for (i = 0; i < wx->num_rx_queues; i++)
-			wx->rx_ring[i]->count = new_rx_count;
+			rtnl_dereference(wx->rx_ring[i])->count = new_rx_count;
 		wx->tx_ring_count = new_tx_count;
 		wx->rx_ring_count = new_rx_count;
 
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_hw.c b/drivers/net/ethernet/wangxun/libwx/wx_hw.c
index 111aadf792089..24c539ce6acbe 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_hw.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_hw.c
@@ -1598,13 +1598,17 @@ static void wx_vlan_strip_control(struct wx *wx, bool enable)
 {
 	int i, j;
 
+	rcu_read_lock();
 	for (i = 0; i < wx->num_rx_queues; i++) {
-		struct wx_ring *ring = wx->rx_ring[i];
+		struct wx_ring *ring = rcu_dereference(wx->rx_ring[i]);
 
+		if (!ring)
+			continue;
 		j = ring->reg_idx;
 		wr32m(wx, WX_PX_RR_CFG(j), WX_PX_RR_CFG_VLAN,
 		      enable ? WX_PX_RR_CFG_VLAN : 0);
 	}
+	rcu_read_unlock();
 }
 
 static void wx_vlan_promisc_enable(struct wx *wx)
@@ -1797,7 +1801,7 @@ static void wx_set_rx_buffer_len(struct wx *wx)
 	 * the Base and Length of the Rx Descriptor Ring
 	 */
 	for (i = 0; i < wx->num_rx_queues; i++) {
-		rx_ring = wx->rx_ring[i];
+		rx_ring = rtnl_dereference(wx->rx_ring[i]);
 		rx_ring->rx_buf_len = WX_RXBUFFER_2K;
 #if (PAGE_SIZE < 8192)
 		if (test_bit(WX_FLAG_RSC_ENABLED, wx->flags))
@@ -2021,8 +2025,11 @@ static void wx_configure_tx(struct wx *wx)
 	      WX_TDM_CTL_TE, WX_TDM_CTL_TE);
 
 	/* Setup the HW Tx Head and Tail descriptor pointers */
-	for (i = 0; i < wx->num_tx_queues; i++)
-		wx_configure_tx_ring(wx, wx->tx_ring[i]);
+	for (i = 0; i < wx->num_tx_queues; i++) {
+		struct wx_ring *tx_ring = rtnl_dereference(wx->tx_ring[i]);
+
+		wx_configure_tx_ring(wx, tx_ring);
+	}
 
 	wr32m(wx, WX_TSC_BUF_AE, WX_TSC_BUF_AE_THR, 0x10);
 
@@ -2247,8 +2254,11 @@ void wx_configure_rx(struct wx *wx)
 	/* Setup the HW Rx Head and Tail Descriptor Pointers and
 	 * the Base and Length of the Rx Descriptor Ring
 	 */
-	for (i = 0; i < wx->num_rx_queues; i++)
-		wx_configure_rx_ring(wx, wx->rx_ring[i]);
+	for (i = 0; i < wx->num_rx_queues; i++) {
+		struct wx_ring *rx_ring = rtnl_dereference(wx->rx_ring[i]);
+
+		wx_configure_rx_ring(wx, rx_ring);
+	}
 
 	/* Enable all receives, disable security engine prior to block traffic */
 	ret = wx_disable_sec_rx_path(wx);
@@ -2838,13 +2848,25 @@ int wx_fc_enable(struct wx *wx, bool tx_pause, bool rx_pause)
 	 *  This allows us to avoid head of line blocking for security
 	 *  and performance reasons.
 	 */
+	rcu_read_lock();
 	if (wx->num_rx_queues > 1 && !tx_pause) {
-		for (i = 0; i < wx->num_rx_queues; i++)
-			wx_enable_rx_drop(wx, wx->rx_ring[i]);
+		for (i = 0; i < wx->num_rx_queues; i++) {
+			struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
+
+			if (!rx_ring)
+				continue;
+			wx_enable_rx_drop(wx, rx_ring);
+		}
 	} else {
-		for (i = 0; i < wx->num_rx_queues; i++)
-			wx_disable_rx_drop(wx, wx->rx_ring[i]);
+		for (i = 0; i < wx->num_rx_queues; i++) {
+			struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
+
+			if (!rx_ring)
+				continue;
+			wx_disable_rx_drop(wx, rx_ring);
+		}
 	}
+	rcu_read_unlock();
 
 	return 0;
 }
@@ -2871,8 +2893,15 @@ static void wx_update_xoff_rx_lfc(struct wx *wx)
 	if (!data)
 		return;
 
-	for (i = 0; i < wx->num_tx_queues; i++)
-		clear_bit(WX_HANG_CHECK_ARMED, wx->tx_ring[i]->state);
+	rcu_read_lock();
+	for (i = 0; i < wx->num_tx_queues; i++) {
+		struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
+
+		if (!tx_ring)
+			continue;
+		clear_bit(WX_HANG_CHECK_ARMED, tx_ring->state);
+	}
+	rcu_read_unlock();
 }
 
 /**
@@ -2894,10 +2923,13 @@ void wx_update_stats(struct wx *wx)
 
 	spin_lock(&wx->hw_stats_lock);
 
+	rcu_read_lock();
 	/* gather some stats to the wx struct that are per queue */
 	for (i = 0; i < wx->num_rx_queues; i++) {
-		struct wx_ring *rx_ring = wx->rx_ring[i];
+		struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
 
+		if (!rx_ring)
+			continue;
 		non_eop_descs += rx_ring->rx_stats.non_eop_descs;
 		alloc_rx_buff_failed += rx_ring->rx_stats.alloc_rx_buff_failed;
 		hw_csum_rx_good += rx_ring->rx_stats.csum_good_cnt;
@@ -2913,19 +2945,28 @@ void wx_update_stats(struct wx *wx)
 		u64 rsc_flush = 0;
 
 		for (i = 0; i < wx->num_rx_queues; i++) {
-			rsc_count += wx->rx_ring[i]->rx_stats.rsc_count;
-			rsc_flush += wx->rx_ring[i]->rx_stats.rsc_flush;
+			struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
+
+			if (!rx_ring)
+				continue;
+
+			rsc_count += rx_ring->rx_stats.rsc_count;
+			rsc_flush += rx_ring->rx_stats.rsc_flush;
 		}
 		wx->rsc_count = rsc_count;
 		wx->rsc_flush = rsc_flush;
 	}
 
 	for (i = 0; i < wx->num_tx_queues; i++) {
-		struct wx_ring *tx_ring = wx->tx_ring[i];
+		struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
+
+		if (!tx_ring)
+			continue;
 
 		restart_queue += tx_ring->tx_stats.restart_queue;
 		tx_busy += tx_ring->tx_stats.tx_busy;
 	}
+	rcu_read_unlock();
 	wx->restart_queue = restart_queue;
 	wx->tx_busy = tx_busy;
 
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_lib.c b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
index dcbf5811046e9..0fbaa585bb854 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_lib.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
@@ -1721,23 +1721,35 @@ netdev_tx_t wx_xmit_frame(struct sk_buff *skb,
 	unsigned int r_idx = skb->queue_mapping;
 	struct wx *wx = netdev_priv(netdev);
 	struct wx_ring *tx_ring;
+	int num_tx_queues;
 
-	if (!netif_carrier_ok(netdev)) {
-		dev_kfree_skb_any(skb);
-		return NETDEV_TX_OK;
-	}
+	if (!netif_carrier_ok(netdev))
+		goto drop;
 
 	/* The minimum packet size for olinfo paylen is 17 so pad the skb
 	 * in order to meet this minimum size requirement.
 	 */
-	if (skb_put_padto(skb, 17))
+	if (skb_put_padto(skb, 17)) {
+		dev_core_stats_tx_dropped_inc(netdev);
 		return NETDEV_TX_OK;
+	}
+
+	num_tx_queues = wx->num_tx_queues;
+	if (unlikely(!num_tx_queues))
+		goto drop;
 
-	if (r_idx >= wx->num_tx_queues)
-		r_idx = r_idx % wx->num_tx_queues;
-	tx_ring = wx->tx_ring[r_idx];
+	if (r_idx >= num_tx_queues)
+		r_idx = r_idx % num_tx_queues;
+	tx_ring = rcu_dereference_bh(wx->tx_ring[r_idx]);
+	if (unlikely(!tx_ring))
+		goto drop;
 
 	return wx_xmit_frame_ring(skb, tx_ring);
+
+drop:
+	dev_core_stats_tx_dropped_inc(netdev);
+	dev_kfree_skb_any(skb);
+	return NETDEV_TX_OK;
 }
 EXPORT_SYMBOL(wx_xmit_frame);
 
@@ -2061,68 +2073,30 @@ static int wx_set_interrupt_capability(struct wx *wx)
 	return 0;
 }
 
-static bool wx_cache_ring_vmdq(struct wx *wx)
+static u16 wx_get_reg_idx(struct wx *wx, u16 queue_index, bool is_rx)
 {
 	struct wx_ring_feature *vmdq = &wx->ring_feature[RING_F_VMDQ];
 	struct wx_ring_feature *rss = &wx->ring_feature[RING_F_RSS];
 	u16 reg_idx;
 	int i;
 
-	/* only proceed if VMDq is enabled */
 	if (!test_bit(WX_FLAG_VMDQ_ENABLED, wx->flags))
-		return false;
+		return queue_index;
 
-	if (test_bit(WX_FLAG_MULTI_64_FUNC, wx->flags)) {
-		/* start at VMDq register offset for SR-IOV enabled setups */
-		reg_idx = vmdq->offset * __ALIGN_MASK(1, ~vmdq->mask);
-		for (i = 0; i < wx->num_rx_queues; i++, reg_idx++) {
-			/* If we are greater than indices move to next pool */
+	if (!test_bit(WX_FLAG_MULTI_64_FUNC, wx->flags))
+		return vmdq->offset + queue_index;
+
+	reg_idx = vmdq->offset * __ALIGN_MASK(1, ~vmdq->mask);
+	for (i = 0; i <= queue_index; i++, reg_idx++) {
+		if (is_rx) {
 			if ((reg_idx & ~vmdq->mask) >= rss->indices)
 				reg_idx = __ALIGN_MASK(reg_idx, ~vmdq->mask);
-			wx->rx_ring[i]->reg_idx = reg_idx;
-		}
-		reg_idx = vmdq->offset * __ALIGN_MASK(1, ~vmdq->mask);
-		for (i = 0; i < wx->num_tx_queues; i++, reg_idx++) {
-			/* If we are greater than indices move to next pool */
-			if ((reg_idx & rss->mask) >= rss->indices)
-				reg_idx = __ALIGN_MASK(reg_idx, ~vmdq->mask);
-			wx->tx_ring[i]->reg_idx = reg_idx;
+		} else if ((reg_idx & rss->mask) >= rss->indices) {
+			reg_idx = __ALIGN_MASK(reg_idx, ~vmdq->mask);
 		}
-	} else {
-		/* start at VMDq register offset for SR-IOV enabled setups */
-		reg_idx = vmdq->offset;
-		for (i = 0; i < wx->num_rx_queues; i++)
-			/* If we are greater than indices move to next pool */
-			wx->rx_ring[i]->reg_idx = reg_idx + i;
-
-		reg_idx = vmdq->offset;
-		for (i = 0; i < wx->num_tx_queues; i++)
-			/* If we are greater than indices move to next pool */
-			wx->tx_ring[i]->reg_idx = reg_idx + i;
 	}
 
-	return true;
-}
-
-/**
- * wx_cache_ring_rss - Descriptor ring to register mapping for RSS
- * @wx: board private structure to initialize
- *
- * Cache the descriptor ring offsets for RSS, ATR, FCoE, and SR-IOV.
- *
- **/
-static void wx_cache_ring_rss(struct wx *wx)
-{
-	u16 i;
-
-	if (wx_cache_ring_vmdq(wx))
-		return;
-
-	for (i = 0; i < wx->num_rx_queues; i++)
-		wx->rx_ring[i]->reg_idx = i;
-
-	for (i = 0; i < wx->num_tx_queues; i++)
-		wx->tx_ring[i]->reg_idx = i;
+	return reg_idx - 1;
 }
 
 static void wx_add_ring(struct wx_ring *ring, struct wx_ring_container *head)
@@ -2210,9 +2184,10 @@ static int wx_alloc_q_vector(struct wx *wx,
 		ring->count = wx->tx_ring_count;
 
 		ring->queue_index = txr_idx;
+		ring->reg_idx = wx_get_reg_idx(wx, txr_idx, false);
 
 		/* assign ring to wx */
-		wx->tx_ring[txr_idx] = ring;
+		rcu_assign_pointer(wx->tx_ring[txr_idx], ring);
 
 		/* update count and index */
 		txr_count--;
@@ -2236,9 +2211,10 @@ static int wx_alloc_q_vector(struct wx *wx,
 		/* apply Rx specific ring traits */
 		ring->count = wx->rx_ring_count;
 		ring->queue_index = rxr_idx;
+		ring->reg_idx = wx_get_reg_idx(wx, rxr_idx, true);
 
 		/* assign ring to wx */
-		wx->rx_ring[rxr_idx] = ring;
+		rcu_assign_pointer(wx->rx_ring[rxr_idx], ring);
 
 		/* update count and index */
 		rxr_count--;
@@ -2266,10 +2242,10 @@ static void wx_free_q_vector(struct wx *wx, int v_idx)
 	struct wx_ring *ring;
 
 	wx_for_each_ring(ring, q_vector->tx)
-		wx->tx_ring[ring->queue_index] = NULL;
+		rcu_assign_pointer(wx->tx_ring[ring->queue_index], NULL);
 
 	wx_for_each_ring(ring, q_vector->rx)
-		wx->rx_ring[ring->queue_index] = NULL;
+		rcu_assign_pointer(wx->rx_ring[ring->queue_index], NULL);
 
 	wx->q_vector[v_idx] = NULL;
 	netif_napi_del(&q_vector->napi);
@@ -2400,8 +2376,6 @@ int wx_init_interrupt_scheme(struct wx *wx)
 		return ret;
 	}
 
-	wx_cache_ring_rss(wx);
-
 	set_bit(WX_STATE_DOWN, wx->state);
 
 	return 0;
@@ -2680,7 +2654,7 @@ void wx_clean_all_rx_rings(struct wx *wx)
 	int i;
 
 	for (i = 0; i < wx->num_rx_queues; i++)
-		wx_clean_rx_ring(wx->rx_ring[i]);
+		wx_clean_rx_ring(rtnl_dereference(wx->rx_ring[i]));
 }
 EXPORT_SYMBOL(wx_clean_all_rx_rings);
 
@@ -2722,7 +2696,7 @@ static void wx_free_all_rx_resources(struct wx *wx)
 	int i;
 
 	for (i = 0; i < wx->num_rx_queues; i++)
-		wx_free_rx_resources(wx->rx_ring[i]);
+		wx_free_rx_resources(rtnl_dereference(wx->rx_ring[i]));
 }
 
 /**
@@ -2796,7 +2770,7 @@ void wx_clean_all_tx_rings(struct wx *wx)
 	int i;
 
 	for (i = 0; i < wx->num_tx_queues; i++)
-		wx_clean_tx_ring(wx->tx_ring[i]);
+		wx_clean_tx_ring(rtnl_dereference(wx->tx_ring[i]));
 }
 EXPORT_SYMBOL(wx_clean_all_tx_rings);
 
@@ -2844,7 +2818,7 @@ static void wx_free_all_tx_resources(struct wx *wx)
 	int i;
 
 	for (i = 0; i < wx->num_tx_queues; i++)
-		wx_free_tx_resources(wx->tx_ring[i]);
+		wx_free_tx_resources(rtnl_dereference(wx->tx_ring[i]));
 }
 
 void wx_free_resources(struct wx *wx)
@@ -2954,7 +2928,7 @@ static int wx_setup_all_rx_resources(struct wx *wx)
 	int i, err = 0;
 
 	for (i = 0; i < wx->num_rx_queues; i++) {
-		err = wx_setup_rx_resources(wx->rx_ring[i]);
+		err = wx_setup_rx_resources(rtnl_dereference(wx->rx_ring[i]));
 		if (!err)
 			continue;
 
@@ -2966,7 +2940,7 @@ static int wx_setup_all_rx_resources(struct wx *wx)
 err_setup_rx:
 	/* rewind the index freeing the rings as we go */
 	while (i--)
-		wx_free_rx_resources(wx->rx_ring[i]);
+		wx_free_rx_resources(rtnl_dereference(wx->rx_ring[i]));
 	return err;
 }
 
@@ -3057,7 +3031,7 @@ static int wx_setup_all_tx_resources(struct wx *wx)
 	int i, err = 0;
 
 	for (i = 0; i < wx->num_tx_queues; i++) {
-		err = wx_setup_tx_resources(wx->tx_ring[i]);
+		err = wx_setup_tx_resources(rtnl_dereference(wx->tx_ring[i]));
 		if (!err)
 			continue;
 
@@ -3069,7 +3043,7 @@ static int wx_setup_all_tx_resources(struct wx *wx)
 err_setup_tx:
 	/* rewind the index freeing the rings as we go */
 	while (i--)
-		wx_free_tx_resources(wx->tx_ring[i]);
+		wx_free_tx_resources(rtnl_dereference(wx->tx_ring[i]));
 	return err;
 }
 
@@ -3118,7 +3092,7 @@ void wx_get_stats64(struct net_device *netdev,
 
 	rcu_read_lock();
 	for (i = 0; i < wx->num_rx_queues; i++) {
-		struct wx_ring *ring = READ_ONCE(wx->rx_ring[i]);
+		struct wx_ring *ring = rcu_dereference(wx->rx_ring[i]);
 		u64 bytes, packets;
 		unsigned int start;
 
@@ -3134,7 +3108,7 @@ void wx_get_stats64(struct net_device *netdev,
 	}
 
 	for (i = 0; i < wx->num_tx_queues; i++) {
-		struct wx_ring *ring = READ_ONCE(wx->tx_ring[i]);
+		struct wx_ring *ring = rcu_dereference(wx->tx_ring[i]);
 		u64 bytes, packets;
 		unsigned int start;
 
@@ -3345,7 +3319,8 @@ int wx_set_ring(struct wx *wx, u32 new_tx_count,
 	 */
 	if (new_tx_count != wx->tx_ring_count) {
 		for (i = 0; i < wx->num_tx_queues; i++) {
-			memcpy(&temp_ring[i], wx->tx_ring[i],
+			memcpy(&temp_ring[i],
+			       rtnl_dereference(wx->tx_ring[i]),
 			       sizeof(struct wx_ring));
 
 			temp_ring[i].count = new_tx_count;
@@ -3361,9 +3336,11 @@ int wx_set_ring(struct wx *wx, u32 new_tx_count,
 		}
 
 		for (i = 0; i < wx->num_tx_queues; i++) {
-			wx_free_tx_resources(wx->tx_ring[i]);
+			struct wx_ring *tx_ring = rtnl_dereference(wx->tx_ring[i]);
 
-			memcpy(wx->tx_ring[i], &temp_ring[i],
+			wx_free_tx_resources(tx_ring);
+
+			memcpy(tx_ring, &temp_ring[i],
 			       sizeof(struct wx_ring));
 		}
 
@@ -3373,7 +3350,7 @@ int wx_set_ring(struct wx *wx, u32 new_tx_count,
 	/* Repeat the process for the Rx rings if needed */
 	if (new_rx_count != wx->rx_ring_count) {
 		for (i = 0; i < wx->num_rx_queues; i++) {
-			memcpy(&temp_ring[i], wx->rx_ring[i],
+			memcpy(&temp_ring[i], rtnl_dereference(wx->rx_ring[i]),
 			       sizeof(struct wx_ring));
 
 			temp_ring[i].count = new_rx_count;
@@ -3389,8 +3366,10 @@ int wx_set_ring(struct wx *wx, u32 new_tx_count,
 		}
 
 		for (i = 0; i < wx->num_rx_queues; i++) {
-			wx_free_rx_resources(wx->rx_ring[i]);
-			memcpy(wx->rx_ring[i], &temp_ring[i],
+			struct wx_ring *rx_ring = rtnl_dereference(wx->rx_ring[i]);
+
+			wx_free_rx_resources(rx_ring);
+			memcpy(rx_ring, &temp_ring[i],
 			       sizeof(struct wx_ring));
 		}
 
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_ptp.c b/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
index e2d60d6bcade9..3104a4d24474b 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
@@ -311,11 +311,15 @@ static void wx_ptp_rx_hang(struct wx *wx)
 
 	/* determine the most recent watchdog or rx_timestamp event */
 	rx_event = wx->last_rx_ptp_check;
+	rcu_read_lock();
 	for (n = 0; n < wx->num_rx_queues; n++) {
-		rx_ring = wx->rx_ring[n];
+		rx_ring = rcu_dereference(wx->rx_ring[n]);
+		if (!rx_ring)
+			continue;
 		if (time_after(rx_ring->last_rx_timestamp, rx_event))
 			rx_event = rx_ring->last_rx_timestamp;
 	}
+	rcu_read_unlock();
 
 	/* only need to read the high RXSTMP register to clear the lock */
 	if (time_is_before_jiffies(rx_event + 5 * HZ)) {
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_type.h b/drivers/net/ethernet/wangxun/libwx/wx_type.h
index a7f3c48e9603c..fdac611bd7f65 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_type.h
+++ b/drivers/net/ethernet/wangxun/libwx/wx_type.h
@@ -1359,8 +1359,16 @@ struct wx {
 	u32 tx_ring_count;
 	u32 rx_ring_count;
 
-	struct wx_ring *tx_ring[64] ____cacheline_aligned_in_smp;
-	struct wx_ring *rx_ring[64];
+	/* Ring pointers are published and cleared by the interrupt scheme
+	 * setup and teardown paths with RCU pointer operations. Control-path
+	 * readers use rtnl_dereference() while holding RTNL. Lockless readers
+	 * (such as xmit, stats, and watchdog paths) must use rcu_dereference()
+	 * inside an RCU read-side critical section and NULL-check the result.
+	 * RCU protects pointer lifetime; fields initialized after publication
+	 * need their own ordering guarantees.
+	 */
+	struct wx_ring __rcu *tx_ring[64] ____cacheline_aligned_in_smp;
+	struct wx_ring __rcu *rx_ring[64];
 	struct wx_q_vector *q_vector[64];
 	int num_rx_pools;
 	int num_rx_queues_per_pool;
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_vf_common.c b/drivers/net/ethernet/wangxun/libwx/wx_vf_common.c
index 26de78e9a69ef..61e138ac91784 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_vf_common.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_vf_common.c
@@ -205,7 +205,7 @@ static void wx_configure_rx_vf(struct wx *wx)
 	 * the Base and Length of the Rx Descriptor Ring
 	 */
 	for (i = 0; i < wx->num_rx_queues; i++) {
-		struct wx_ring *rx_ring = wx->rx_ring[i];
+		struct wx_ring *rx_ring = rtnl_dereference(wx->rx_ring[i]);
 #ifdef HAVE_SWIOTLB_SKIP_CPU_SYNC
 		wx_set_rx_buffer_len_vf(wx, rx_ring);
 #endif
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c b/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c
index 7325b475ee10c..0ccf1de4010dc 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c
@@ -175,8 +175,11 @@ void wx_configure_tx_vf(struct wx *wx)
 	u32 i;
 
 	/* Setup the HW Tx Head and Tail descriptor pointers */
-	for (i = 0; i < wx->num_tx_queues; i++)
-		wx_configure_tx_ring_vf(wx, wx->tx_ring[i]);
+	for (i = 0; i < wx->num_tx_queues; i++) {
+		struct wx_ring *tx_ring = rtnl_dereference(wx->tx_ring[i]);
+
+		wx_configure_tx_ring_vf(wx, tx_ring);
+	}
 }
 
 static void wx_configure_srrctl_vf(struct wx *wx, struct wx_ring *ring,
diff --git a/drivers/net/ethernet/wangxun/ngbe/ngbe_ethtool.c b/drivers/net/ethernet/wangxun/ngbe/ngbe_ethtool.c
index 1960f7154151d..2997a93f786c4 100644
--- a/drivers/net/ethernet/wangxun/ngbe/ngbe_ethtool.c
+++ b/drivers/net/ethernet/wangxun/ngbe/ngbe_ethtool.c
@@ -37,9 +37,9 @@ static int ngbe_set_ringparam(struct net_device *netdev,
 
 	if (!netif_running(wx->netdev)) {
 		for (i = 0; i < wx->num_tx_queues; i++)
-			wx->tx_ring[i]->count = new_tx_count;
+			rtnl_dereference(wx->tx_ring[i])->count = new_tx_count;
 		for (i = 0; i < wx->num_rx_queues; i++)
-			wx->rx_ring[i]->count = new_rx_count;
+			rtnl_dereference(wx->rx_ring[i])->count = new_rx_count;
 		wx->tx_ring_count = new_tx_count;
 		wx->rx_ring_count = new_rx_count;
 
diff --git a/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c b/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
index 0aea5a99a1e2c..bef7089d0e47e 100644
--- a/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
+++ b/drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
@@ -406,7 +406,7 @@ static void ngbe_disable_device(struct wx *wx)
 	/* disable all enabled rx queues */
 	for (i = 0; i < wx->num_rx_queues; i++)
 		/* this call also flushes the previous write */
-		wx_disable_rx_queue(wx, wx->rx_ring[i]);
+		wx_disable_rx_queue(wx, rtnl_dereference(wx->rx_ring[i]));
 	/* disable receives */
 	wx_disable_rx(wx);
 	wx_napi_disable_all(wx);
@@ -422,7 +422,7 @@ static void ngbe_disable_device(struct wx *wx)
 	wx_irq_disable(wx);
 	/* disable transmits in the hardware now that interrupts are off */
 	for (i = 0; i < wx->num_tx_queues; i++) {
-		u8 reg_idx = wx->tx_ring[i]->reg_idx;
+		u8 reg_idx = rtnl_dereference(wx->tx_ring[i])->reg_idx;
 
 		wr32(wx, WX_PX_TR_CFG(reg_idx), WX_PX_TR_CFG_SWFLSH);
 	}
@@ -580,8 +580,11 @@ static void ngbe_dev_shutdown(struct pci_dev *pdev, bool *enable_wake)
 	if (netif_running(netdev))
 		ngbe_close(netdev);
 	wx_clear_interrupt_scheme(wx);
-	rtnl_unlock();
 
+	/* Keep RTNL held across the WoL setup so wx_configure_rx() runs under
+	 * the same lock as its other callers, and cannot race with a channel
+	 * reconfiguration.
+	 */
 	if (wufc) {
 		wx_set_rx_mode(netdev);
 		wx_configure_rx(wx);
@@ -589,6 +592,8 @@ static void ngbe_dev_shutdown(struct pci_dev *pdev, bool *enable_wake)
 	} else {
 		wr32(wx, WX_PSR_WKUP_CTL, 0);
 	}
+	rtnl_unlock();
+
 	pci_wake_from_d3(pdev, !!wufc);
 	*enable_wake = !!wufc;
 	wx_control_hw(wx, false);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
index 3e32aca728065..d2d43fec01572 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
@@ -61,9 +61,9 @@ static int txgbe_set_ringparam(struct net_device *netdev,
 
 	if (!netif_running(wx->netdev)) {
 		for (i = 0; i < wx->num_tx_queues; i++)
-			wx->tx_ring[i]->count = new_tx_count;
+			rtnl_dereference(wx->tx_ring[i])->count = new_tx_count;
 		for (i = 0; i < wx->num_rx_queues; i++)
-			wx->rx_ring[i]->count = new_rx_count;
+			rtnl_dereference(wx->rx_ring[i])->count = new_rx_count;
 		wx->tx_ring_count = new_tx_count;
 		wx->rx_ring_count = new_rx_count;
 
@@ -366,7 +366,7 @@ static int txgbe_add_ethtool_fdir_entry(struct txgbe *txgbe,
 
 		/* Map the ring onto the absolute queue index */
 		if (!vf)
-			queue = wx->rx_ring[ring]->reg_idx;
+			queue = rtnl_dereference(wx->rx_ring[ring])->reg_idx;
 		else
 			queue = ((vf - 1) * wx->num_rx_queues_per_pool) + ring;
 	}
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c
index 59a47532618c8..e0a18aae27859 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_fdir.c
@@ -606,7 +606,7 @@ static void txgbe_fdir_filter_restore(struct wx *wx)
 
 			/* Map the ring onto the absolute queue index */
 			if (!vf)
-				queue = wx->rx_ring[ring]->reg_idx;
+				queue = rtnl_dereference(wx->rx_ring[ring])->reg_idx;
 			else
 				queue = ((vf - 1) * wx->num_rx_queues_per_pool) + ring;
 		}
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
index 184194200917b..3111409861590 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
@@ -239,7 +239,7 @@ static void txgbe_disable_device(struct wx *wx)
 	/* disable all enabled rx queues */
 	for (i = 0; i < wx->num_rx_queues; i++)
 		/* this call also flushes the previous write */
-		wx_disable_rx_queue(wx, wx->rx_ring[i]);
+		wx_disable_rx_queue(wx, rtnl_dereference(wx->rx_ring[i]));
 
 	netif_tx_stop_all_queues(netdev);
 	netif_tx_disable(netdev);
@@ -275,7 +275,7 @@ static void txgbe_disable_device(struct wx *wx)
 
 	/* disable transmits in the hardware now that interrupts are off */
 	for (i = 0; i < wx->num_tx_queues; i++) {
-		u8 reg_idx = wx->tx_ring[i]->reg_idx;
+		u8 reg_idx = rtnl_dereference(wx->tx_ring[i])->reg_idx;
 
 		wr32(wx, WX_PX_TR_CFG(reg_idx), WX_PX_TR_CFG_SWFLSH);
 	}
-- 
2.30.1

