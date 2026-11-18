Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989699;
	b=JiKOtDOFbX2IIcmUsmDAKEH+TFIBSs6v11oVUbUohxk1apVRNUokTAagtO49dMDMdMnn
	 95aMLeXjgKH7D6IDf68RSubO22nwMoGCcHuM63OO2SkD+UjcT/4eEKPsIHhrH3QvnFrm3
	 b4prwllYPS8G+tFR/EZckO2UsdgW1kt8VHWWmGmTfD2RdbT9ge2QBG+zu7ZWHtRdCjQbQ
	 4rISAlen2OSrJgt9y2V7RzQ5q5UorFl/QIXwbidxbThmmlEUsJwoHqJdv9F4AxPNuWkcu
	 BfD/OV8FQVqlAuhcJe6KDbr8f99tKueXh6qggiwHw/nwrgTlSLTPd7BScMM0Z+wzIyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989699;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=gsmNRCMmp3JCfYR5z5Z4owYPgH5RQg3k6zcYmm+9mwI=;
	b=JV6O7fV/WjcXlPA6z300EoZt983xbG5ssh/zvm/z8V0kB3UtagNXL8xnzpgd9h4pX4g3
	 EfL4RXkg50UPsbRKBvDrvo2XNI0FgnxQPtgQxFzu0zWC6JzeQCFNFY3xxpZhePHR71k+r
	 3TaIqt9lIaPKkNv/hD2SMTxOas4AOjjKG5wfB8kWoWta82L99rLhVXkcNbWSR4DoNboNv
	 EpmdxIbQS9h6zWhXXcftywgXHoICupEi5jc1BAi+Ia+HykyvluK8CYXqUTdtOsWjlRQ8G
	 n9iN22i202nnfehRk+O9MVw1vMRKUBdpvOb/xqXgCpnKS260BqttMhy89cI19yg5arg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4D4606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: esmtpsz10t1794989629t8c2d3269
X-QQ-Originating-IP: 1ydyjLi/UMxVI+/z5Ho0GoAUlTvzUfgQREw1Tw5ox6c=
Received: from localhost.localdomain ( [115.204.248.161])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 16:13:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12917928615573975087
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
Subject: [PATCH net v8 2/2] net: wangxun: access queue counts consistently
Date: Wed, 18 Nov 2026 16:13:29 +0800
Message-Id: <20261118081329.39551-3-mengyuanlou@net-swift.com>
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
X-QQ-XMAILINFO: Nx4EXkkxBg4ERvBfvk+FbWGaIPqJv5NkXKt7U3F8rwG13gaghKN7rWrm
	DE8EePEroKw56grsl7ibXGko83pn/WXQfShkEi0zgqi/6ydGRjVtvie6f2AL6DJqQZwXQEc
	hTvl3pBL7Fgm33d+UnqtlGJiHmSwq2f9fnsdQQIiBH7ssZtsk1wiIJRojiEpTj38kwLpRM7
	qb1RnKMYcT44PHeY5VWP+VL+Vv1ko7wt0PlA1ZOL8+NiEqKMqKJnElpOHqy4kBslB0WvbFW
	HyeuIL+Hz4faBmmdOO+XlD4eCyVPHBy7kLeE9w7asW28TS45LlYPtZ/iZD1YjvNk3QOxvaB
	Wvg+bhFTeN2heU5oYNFi10w/+XmFwutoYNgvr1Gkhk+lwA+ix2513vCF2+GgUzI4nhLSZbO
	PupTpfMjMd/EwrBmdtPWFQN0j5/whAoOCGB2Bne7oDYkA/w8x2vUm8RV6KlVzhZIB9z7K7x
	4WiyTxp2tfVd9+tq8DEnNfdtF6zHG6oVOV2lVxVqkswL+yP5hO3XT2pqYK9AbWRkISx57LE
	RCxDQq+MczlmdzBKi/x+8B/X9iRRigj+UyN8amVgL1LwJVNmN+pVtuEEzoHGJrnnjkpKtaG
	1m0UKP044XumxeBFJqRccAdzmoVXByvFmxKW/mGVPyDNdVdqfFXYC1YZadXJh+XiFYOIzgK
	3wJLhfIoq7znWZyNg2itNGtXFkY11UGjZ2tjhrcZEvbzaMaNWusdO9yXuM2XV8OqkvZ6HiF
	HquGOE/KijIN6c4g0TMwauROwNWmB5xjVEZzmW95x21YuBPqLWxwk7Qsh2krpMN655ZvEtI
	b33WNFadpms+qB+69qGLprWD2AdrQMeKk3Zmi/8F/InF46aSKYqfG5nlkw3TuF2FDPhz5XW
	gdKKpQAthiABYQ5fRFTElht6GJ6cj7sORazX3cAU1aFGbhrbuwL6IPpY8HELwDoqTczAINB
	qmxSUp48Ac2vxwE1120wQubEGesN9Y1/nzsvmq4vZ4oQ+smIFV2mf1FXj1+KPJ8wQGbH1J+
	+KJb01NMczLfJsMPx+wJk8EGXoyCYdEORtIn+ho9isioex6UaCXpn9XA0ESQrFWHOoG84/m
	8ErDSioVJbQD0lmqagwHnjPAJNsn2VkZV6J0bYU0WIYdWo0T8pSwt+TPxkjbk9mvyDsQiUp
	/Gtjat+uZHRO2UzexiRXg9LQkt2pkJ1N5HBQzvIAG+ozK8kWonCs/2MjDg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Queue-vector teardown clears wx->num_tx_queues and
wx->num_rx_queues while the netdev can remain registered. Lockless
readers may use these counts as ring-array loop bounds while teardown
is clearing the ring slots. wx_xmit_frame() also uses the Tx count to
select a ring and must not divide by zero during teardown.

Use READ_ONCE() to take a single count snapshot in the lockless readers,
and use WRITE_ONCE() for queue-count updates during scheme setup,
teardown, and allocation-error handling, including the VF queue setup
callbacks. Keep the existing NULL checks so a reader that observed an
old non-zero count can safely skip ring slots that have since been
cleared. wx_xmit_frame() retains its zero-count guard before
queue-index modulo.

Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>
---
 drivers/net/ethernet/wangxun/libwx/wx_err.c   |  7 +++--
 drivers/net/ethernet/wangxun/libwx/wx_hw.c    | 23 ++++++++++-----
 drivers/net/ethernet/wangxun/libwx/wx_lib.c   | 29 ++++++++++---------
 drivers/net/ethernet/wangxun/libwx/wx_ptp.c   |  5 ++--
 .../net/ethernet/wangxun/ngbevf/ngbevf_main.c |  4 +--
 .../ethernet/wangxun/txgbevf/txgbevf_main.c   | 10 +++----
 6 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/libwx/wx_err.c b/drivers/net/ethernet/wangxun/libwx/wx_err.c
index 8eadb4d3abcff..fa0f7c57090f5 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_err.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_err.c
@@ -199,10 +199,11 @@ EXPORT_SYMBOL(wx_init_err_task);
 
 static bool wx_ring_tx_pending(struct wx *wx)
 {
+	int num_tx_queues = READ_ONCE(wx->num_tx_queues);
 	int i;
 
 	rcu_read_lock();
-	for (i = 0; i < wx->num_tx_queues; i++) {
+	for (i = 0; i < num_tx_queues; i++) {
 		struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
 
 		if (!tx_ring)
@@ -261,6 +262,7 @@ static void wx_watchdog_flush_tx(struct wx *wx)
 
 static void wx_detect_tx_hang(struct wx *wx)
 {
+	int num_tx_queues;
 	int i;
 
 	/* If we're down or resetting, just bail */
@@ -270,8 +272,9 @@ static void wx_detect_tx_hang(struct wx *wx)
 
 	/* Force detection of hung controller */
 	if (netif_carrier_ok(wx->netdev)) {
+		num_tx_queues = READ_ONCE(wx->num_tx_queues);
 		rcu_read_lock();
-		for (i = 0; i < wx->num_tx_queues; i++) {
+		for (i = 0; i < num_tx_queues; i++) {
 			struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
 
 			if (tx_ring)
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_hw.c b/drivers/net/ethernet/wangxun/libwx/wx_hw.c
index 24c539ce6acbe..c285c1de24ba9 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_hw.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_hw.c
@@ -1596,10 +1596,11 @@ EXPORT_SYMBOL(wx_enable_sec_rx_path);
 
 static void wx_vlan_strip_control(struct wx *wx, bool enable)
 {
+	int num_rx_queues = READ_ONCE(wx->num_rx_queues);
 	int i, j;
 
 	rcu_read_lock();
-	for (i = 0; i < wx->num_rx_queues; i++) {
+	for (i = 0; i < num_rx_queues; i++) {
 		struct wx_ring *ring = rcu_dereference(wx->rx_ring[i]);
 
 		if (!ring)
@@ -2777,6 +2778,7 @@ static void wx_disable_rx_drop(struct wx *wx, struct wx_ring *ring)
 
 int wx_fc_enable(struct wx *wx, bool tx_pause, bool rx_pause)
 {
+	int num_rx_queues = READ_ONCE(wx->num_rx_queues);
 	u16 pause_time = WX_DEFAULT_FCPAUSE;
 	u32 mflcn_reg, fccfg_reg, reg;
 	u32 fcrtl, fcrth;
@@ -2849,8 +2851,8 @@ int wx_fc_enable(struct wx *wx, bool tx_pause, bool rx_pause)
 	 *  and performance reasons.
 	 */
 	rcu_read_lock();
-	if (wx->num_rx_queues > 1 && !tx_pause) {
-		for (i = 0; i < wx->num_rx_queues; i++) {
+	if (num_rx_queues > 1 && !tx_pause) {
+		for (i = 0; i < num_rx_queues; i++) {
 			struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
 
 			if (!rx_ring)
@@ -2858,7 +2860,7 @@ int wx_fc_enable(struct wx *wx, bool tx_pause, bool rx_pause)
 			wx_enable_rx_drop(wx, rx_ring);
 		}
 	} else {
-		for (i = 0; i < wx->num_rx_queues; i++) {
+		for (i = 0; i < num_rx_queues; i++) {
 			struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
 
 			if (!rx_ring)
@@ -2875,6 +2877,7 @@ EXPORT_SYMBOL(wx_fc_enable);
 static void wx_update_xoff_rx_lfc(struct wx *wx)
 {
 	struct wx_hw_stats *hwstats = &wx->stats;
+	int num_tx_queues;
 	u64 data;
 	int i;
 
@@ -2893,8 +2896,9 @@ static void wx_update_xoff_rx_lfc(struct wx *wx)
 	if (!data)
 		return;
 
+	num_tx_queues = READ_ONCE(wx->num_tx_queues);
 	rcu_read_lock();
-	for (i = 0; i < wx->num_tx_queues; i++) {
+	for (i = 0; i < num_tx_queues; i++) {
 		struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
 
 		if (!tx_ring)
@@ -2915,6 +2919,7 @@ void wx_update_stats(struct wx *wx)
 	u64 non_eop_descs = 0, alloc_rx_buff_failed = 0;
 	u64 hw_csum_rx_good = 0, hw_csum_rx_error = 0;
 	u64 restart_queue = 0, tx_busy = 0;
+	int num_rx_queues, num_tx_queues;
 	u32 i;
 
 	if (test_bit(WX_STATE_DOWN, wx->state) ||
@@ -2923,9 +2928,11 @@ void wx_update_stats(struct wx *wx)
 
 	spin_lock(&wx->hw_stats_lock);
 
+	num_rx_queues = READ_ONCE(wx->num_rx_queues);
+	num_tx_queues = READ_ONCE(wx->num_tx_queues);
 	rcu_read_lock();
 	/* gather some stats to the wx struct that are per queue */
-	for (i = 0; i < wx->num_rx_queues; i++) {
+	for (i = 0; i < num_rx_queues; i++) {
 		struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
 
 		if (!rx_ring)
@@ -2944,7 +2951,7 @@ void wx_update_stats(struct wx *wx)
 		u64 rsc_count = 0;
 		u64 rsc_flush = 0;
 
-		for (i = 0; i < wx->num_rx_queues; i++) {
+		for (i = 0; i < num_rx_queues; i++) {
 			struct wx_ring *rx_ring = rcu_dereference(wx->rx_ring[i]);
 
 			if (!rx_ring)
@@ -2957,7 +2964,7 @@ void wx_update_stats(struct wx *wx)
 		wx->rsc_flush = rsc_flush;
 	}
 
-	for (i = 0; i < wx->num_tx_queues; i++) {
+	for (i = 0; i < num_tx_queues; i++) {
 		struct wx_ring *tx_ring = rcu_dereference(wx->tx_ring[i]);
 
 		if (!tx_ring)
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_lib.c b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
index 0fbaa585bb854..e931c57837578 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_lib.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_lib.c
@@ -1734,7 +1734,7 @@ netdev_tx_t wx_xmit_frame(struct sk_buff *skb,
 		return NETDEV_TX_OK;
 	}
 
-	num_tx_queues = wx->num_tx_queues;
+	num_tx_queues = READ_ONCE(wx->num_tx_queues);
 	if (unlikely(!num_tx_queues))
 		goto drop;
 
@@ -1897,8 +1897,8 @@ static bool wx_set_vmdq_queues(struct wx *wx)
 	wx->num_rx_pools = vmdq_i;
 	wx->num_rx_queues_per_pool = rss_i;
 
-	wx->num_rx_queues = vmdq_i * rss_i;
-	wx->num_tx_queues = vmdq_i * rss_i;
+	WRITE_ONCE(wx->num_rx_queues, vmdq_i * rss_i);
+	WRITE_ONCE(wx->num_tx_queues, vmdq_i * rss_i);
 
 	return true;
 }
@@ -1943,15 +1943,15 @@ static void wx_set_rss_queues(struct wx *wx)
 	}
 
 out:
-	wx->num_rx_queues = f->indices;
-	wx->num_tx_queues = f->indices;
+	WRITE_ONCE(wx->num_rx_queues, f->indices);
+	WRITE_ONCE(wx->num_tx_queues, f->indices);
 }
 
 static void wx_set_num_queues(struct wx *wx)
 {
 	/* Start with base case */
-	wx->num_rx_queues = 1;
-	wx->num_tx_queues = 1;
+	WRITE_ONCE(wx->num_rx_queues, 1);
+	WRITE_ONCE(wx->num_tx_queues, 1);
 	wx->queues_per_pool = 1;
 
 	if (wx_set_vmdq_queues(wx))
@@ -2288,8 +2288,8 @@ static int wx_alloc_q_vectors(struct wx *wx)
 	return 0;
 
 err_out:
-	wx->num_tx_queues = 0;
-	wx->num_rx_queues = 0;
+	WRITE_ONCE(wx->num_tx_queues, 0);
+	WRITE_ONCE(wx->num_rx_queues, 0);
 	wx->num_q_vectors = 0;
 
 	while (v_idx--)
@@ -2310,8 +2310,8 @@ static void wx_free_q_vectors(struct wx *wx)
 {
 	int v_idx = wx->num_q_vectors;
 
-	wx->num_tx_queues = 0;
-	wx->num_rx_queues = 0;
+	WRITE_ONCE(wx->num_tx_queues, 0);
+	WRITE_ONCE(wx->num_rx_queues, 0);
 	wx->num_q_vectors = 0;
 
 	while (v_idx--)
@@ -3085,13 +3085,16 @@ void wx_get_stats64(struct net_device *netdev,
 		    struct rtnl_link_stats64 *stats)
 {
 	struct wx *wx = netdev_priv(netdev);
+	int num_rx_queues, num_tx_queues;
 	struct wx_hw_stats *hwstats;
 	int i;
 
 	wx_update_stats(wx);
 
+	num_rx_queues = READ_ONCE(wx->num_rx_queues);
+	num_tx_queues = READ_ONCE(wx->num_tx_queues);
 	rcu_read_lock();
-	for (i = 0; i < wx->num_rx_queues; i++) {
+	for (i = 0; i < num_rx_queues; i++) {
 		struct wx_ring *ring = rcu_dereference(wx->rx_ring[i]);
 		u64 bytes, packets;
 		unsigned int start;
@@ -3107,7 +3110,7 @@ void wx_get_stats64(struct net_device *netdev,
 		}
 	}
 
-	for (i = 0; i < wx->num_tx_queues; i++) {
+	for (i = 0; i < num_tx_queues; i++) {
 		struct wx_ring *ring = rcu_dereference(wx->tx_ring[i]);
 		u64 bytes, packets;
 		unsigned int start;
diff --git a/drivers/net/ethernet/wangxun/libwx/wx_ptp.c b/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
index 3104a4d24474b..9dec1698c6d33 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_ptp.c
@@ -296,8 +296,8 @@ static void wx_ptp_rx_hang(struct wx *wx)
 {
 	struct wx_ring *rx_ring;
 	unsigned long rx_event;
+	int num_rx_queues, n;
 	u32 tsyncrxctl;
-	int n;
 
 	tsyncrxctl = rd32(wx, WX_PSR_1588_CTL);
 
@@ -311,8 +311,9 @@ static void wx_ptp_rx_hang(struct wx *wx)
 
 	/* determine the most recent watchdog or rx_timestamp event */
 	rx_event = wx->last_rx_ptp_check;
+	num_rx_queues = READ_ONCE(wx->num_rx_queues);
 	rcu_read_lock();
-	for (n = 0; n < wx->num_rx_queues; n++) {
+	for (n = 0; n < num_rx_queues; n++) {
 		rx_ring = rcu_dereference(wx->rx_ring[n]);
 		if (!rx_ring)
 			continue;
diff --git a/drivers/net/ethernet/wangxun/ngbevf/ngbevf_main.c b/drivers/net/ethernet/wangxun/ngbevf/ngbevf_main.c
index d79cf8d8484f9..c40b64564d41f 100644
--- a/drivers/net/ethernet/wangxun/ngbevf/ngbevf_main.c
+++ b/drivers/net/ethernet/wangxun/ngbevf/ngbevf_main.c
@@ -53,8 +53,8 @@ static const struct net_device_ops ngbevf_netdev_ops = {
 static void ngbevf_set_num_queues(struct wx *wx)
 {
 	/* Start with base case */
-	wx->num_rx_queues = 1;
-	wx->num_tx_queues = 1;
+	WRITE_ONCE(wx->num_rx_queues, 1);
+	WRITE_ONCE(wx->num_tx_queues, 1);
 }
 
 static int ngbevf_sw_init(struct wx *wx)
diff --git a/drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c b/drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c
index 8b16b900820aa..f1784c0ed114d 100644
--- a/drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c
+++ b/drivers/net/ethernet/wangxun/txgbevf/txgbevf_main.c
@@ -53,8 +53,8 @@ static void txgbevf_set_num_queues(struct wx *wx)
 	int ret = 0;
 
 	/* Start with base case */
-	wx->num_rx_queues = 1;
-	wx->num_tx_queues = 1;
+	WRITE_ONCE(wx->num_rx_queues, 1);
+	WRITE_ONCE(wx->num_tx_queues, 1);
 
 	spin_lock_bh(&wx->mbx.mbx_lock);
 	/* fetch queue configuration from the PF */
@@ -66,15 +66,15 @@ static void txgbevf_set_num_queues(struct wx *wx)
 
 	/* we need as many queues as traffic classes */
 	if (num_tcs > 1) {
-		wx->num_rx_queues = num_tcs;
+		WRITE_ONCE(wx->num_rx_queues, num_tcs);
 	} else {
 		rss = min_t(u16, num_online_cpus(), TXGBEVF_MAX_RSS_NUM);
 		queue = min_t(u16, wx->mac.max_rx_queues, wx->mac.max_tx_queues);
 		rss = min_t(u16, queue, rss);
 
 		if (wx->vfinfo->vf_api >= wx_mbox_api_13) {
-			wx->num_rx_queues = rss;
-			wx->num_tx_queues = rss;
+			WRITE_ONCE(wx->num_rx_queues, rss);
+			WRITE_ONCE(wx->num_tx_queues, rss);
 		}
 	}
 }
-- 
2.30.1

