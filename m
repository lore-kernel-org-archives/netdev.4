Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007145;
	b=jGnoZZe7tCJjItvFZmtgssYLdlbG3kXZFAK2jzV+YIMnWKKDE5f841ERIg9qDK6FnER6
	 VOR43lJk3tudzQIKii7z3yM7iavI45GECb/tn884Zc9wZC95hssabNwagbONWie3FerQ9
	 8sUnSUSuggjcSTwGLzx0/SrAPrZTeLzKXIjZ9dt98tEwmNvmwh/wQyKTHP0A0xbezg3iR
	 CsYtzz0s1FpNE1Y2os3FJXltckHVA0DtwhUYy82PPedcZMKwDs92AkxXOJY7epP2L9sjE
	 bewU5ASVlscHLjZxm4gIX3qvWQc3iXAya0bCf747xQk6BuAs4z1e0xp/bXeTf/EUxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007145;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=iFmQgMfWZASPiMYDBxPDQXCgDJ/WjcuQ3EEsY5zfEQg=;
	b=j+FT1xe+f1SWrFOvS8R2xVOr9zrB0nX5ZvPFrKs4oK7mjmgYSyf9FsrPb2wgVw3PxIA1
	 d3QVgHgO1wvzUwUuSq93dI+3YjDUE9nTXxth9tTnNMOHFDPHOKhdC5hipdSQcBov1Q4t1
	 Ty308axhwk3RipEHCoD7XbguwyIgF8DvbJe46aS6cBeDY5Osh3F7ygukq02PYTW2Q869U
	 LZy0Ab/XnfGdKjrYBvj9d8knqUEJxNX0UMVNLTBQ00WpcmaiVQPAsZehHaCNHYhif1aqv
	 HvKjwB/eoFygCsjywsTnCj5YZ3uXZu88Dh7LSZlgIfa/D9NXPmx68sthBF6oxU0g/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TH7BaOQb;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA700606A32A;
	Wed, 18 Nov 2026 13:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA700606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TH7BaOQb
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iFmQgMfWZASPiMYDBxPDQXCgDJ/WjcuQ3EEsY5zfEQg=;
	b=TH7BaOQbBi8LZyu48kdT2pHbj/NitfbvqLUCQD94xh1UEr+688rit+x5M7e3kVf+dX9wMAsxe
	IHnAuVgjET+rnzvEU8gW0CJKF8fvK9wG67yueuV2GaNLLJoDQtdHe/KMwOPiXYO4z9SqS6WN6b8
	ZoM97UWrxZQC8orKrEQnLDY=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jV1zk157mz1cyPx;
	Wed, 18 Nov 2026 21:05:22 +0800 (CST)
Received: from kwepemo500018.china.huawei.com (unknown [7.202.195.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 1551540565;
	Wed, 18 Nov 2026 21:05:42 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemo500018.china.huawei.com (7.202.195.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 18 Nov 2026 21:05:41 +0800
From: Jijie Shao <shaojijie@huawei.com>
To: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <andrew+netdev@lunn.ch>
CC: <shenjian15@huawei.com>, <liuyonglong@huawei.com>,
	<chenhao418@huawei.com>, <yangshuaisong@h-partners.com>,
	<ningwei15@huawei.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <shaojijie@huawei.com>
Subject: [PATCH v5 net 4/4] net: hns3: fix use-after-free in debugfs read during reset/unload
Date: Wed, 18 Nov 2026 21:03:30 +0800
Message-ID: <20261118130330.3026625-5-shaojijie@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118130330.3026625-1-shaojijie@huawei.com>
References: <20261118130330.3026625-1-shaojijie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo500018.china.huawei.com (7.202.195.199)

The seq_file refactoring of hns3 debugfs removed the per-file entry
state checks. Without them, debugfs show callbacks can access
priv->ring, priv->tqp_vector, and ring->desc while these resources
are being freed by reset, driver unload, or ethtool ring resize.

Plain state-bit checks leave a TOCTOU window between check and use.

Fix by adding a mutex (dbg_mutex) to struct hnae3_handle, used by
enet-layer debugfs callbacks. Readers acquire the mutex, then check
device state per iteration -- this lets an in-flight reader exit
promptly when reset begins mid-dump, keeping reset latency bounded
by one iteration, and also rejects a reader that arrives after the
writer has finished tearing down resources (priv->ring is NULL by
then). The dbg_uninit() call stays outside the mutex to avoid
deadlock with debugfs_remove_recursive().

Two kinds of writer paths are protected:

  * hns3_client_uninit() and hns3_reset_notify_uninit_enet() clear
    HNS3_NIC_STATE_INITED first so that readers running outside the
    mutex see the device as busy and return -EBUSY early, then take
    dbg_mutex before freeing resources.

  * hns3_set_ringparam() calls ndo_stop() first (which sets
    HNS3_NIC_STATE_DOWN) and then takes dbg_mutex around the ring
    re-allocation. The busy check does not test the DOWN bit, so
    readers that arrive here are blocked by the mutex itself rather
    than by the INITED signal.

Userspace-visible changes: debugfs reads under
/sys/kernel/debug/hns3/*/ that race with reset, driver unload, or
ethtool ring resize now return -EBUSY instead of potentially reading
freed or zero-filled memory. The per-iteration busy error is -EBUSY
instead of -EPERM, and a NULL priv->ring now returns -EBUSY instead
of -EFAULT. Reading page_pool_info when page pools are not
initialized now succeeds and prints "page pool not initialized" per
queue instead of failing with -EFAULT.

Fixes: a723fb8efe29d3 ("net: hns3: refine for set ring parameters")
Fixes: eced3d1c41db ("net: hns3: use seq_file for files in queue/ in debugfs")
Closes: https://lore.kernel.org/all/a0853cd9-cab5-441d-b181-8ba97f2f58b0@huawei.com/
Signed-off-by: Jijie Shao <shaojijie@huawei.com>
---
Changes in v5:
  - Document the page_pool_info and error-code changes in the commit
    message.
v4: https://lore.kernel.org/all/20261111125810.3359030-5-shaojijie@huawei.com/
Changes in v4:
  - Describe both writer paths (client_uninit/reset_uninit vs
    set_ringparam) explicitly and note the -EBUSY user-visible change.
  - Return -EBUSY from hns3_dbg_page_pool_info() instead of -EFAULT
    when priv->ring is NULL, matching the sibling readers.
v3: https://lore.kernel.org/all/20261030095633.377289-5-shaojijie@huawei.com/
Changes in v3:
  - Add Fixes tag for a723fb8efe29d3 ("net: hns3: refine for set ring
    parameters"): the ring resize path it introduced is the writer that
    can free and rebuild rings, which is the root cause of the UAF
    window exposed by the seq_file refactoring.
  - Add per-ring page_pool NULL check at the entry of
    hns3_dump_page_pool_info(), avoiding a NULL deref while holding
    dbg_mutex (which would deadlock reset on the mutex).
v2: https://lore.kernel.org/all/20261021121426.3096838-4-shaojijie@huawei.com/
Changes in v2:
  - Drop hclge_debugfs.c changes; mutex only protects enet-layer
    debugfs callbacks.
  - Replace guard(mutex) with explicit mutex_lock/unlock and
    "goto unlock" error-path labels.
  - Remove redundant if (!priv->ring) checks in
    hns3_dbg_rx_queue_info() and hns3_dbg_tx_queue_info().
  - Unify per-iteration return values from -EPERM to -EBUSY.
  - Reorder local variables to reverse-Christmas-tree order.
  - Reword changelog to drop the "PF-layer" description.
v1: https://lore.kernel.org/all/20260915132434.1141742-4-shaojijie@huawei.com/
---
 drivers/net/ethernet/hisilicon/hns3/hnae3.h   |   1 +
 .../ethernet/hisilicon/hns3/hns3_debugfs.c    | 127 +++++++++++-------
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |   7 +
 .../ethernet/hisilicon/hns3/hns3_ethtool.c    |   2 +
 4 files changed, 92 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hnae3.h b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
index 4286af9239b0..e94cc33da864 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hnae3.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
@@ -944,6 +944,7 @@ struct hnae3_handle {
 
 	u8 netdev_flags;
 	struct dentry *hnae3_dbgfs;
+	struct mutex dbg_mutex;	/* protect debugfs against reset/unload */
 
 	/* Network interface message level enabled bits */
 	u32 msg_enable;
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c b/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
index 39648d92b976..9225e6d3c281 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_debugfs.c
@@ -389,6 +389,12 @@ static const char * const dim_state_str[] = { "START", "IN_PROG", "APPLY" };
 static const char * const
 dim_tune_stat_str[] = { "ON_TOP", "TIRED", "RIGHT", "LEFT" };
 
+static bool hns3_dbg_is_device_busy(struct hns3_nic_priv *priv)
+{
+	return !test_bit(HNS3_NIC_STATE_INITED, &priv->state) ||
+	       test_bit(HNS3_NIC_STATE_RESETTING, &priv->state);
+}
+
 static void hns3_get_coal_info(struct hns3_enet_tqp_vector *tqp_vector,
 			       struct seq_file *s, int i, bool is_tx)
 {
@@ -434,7 +440,7 @@ static void hns3_get_coal_info(struct hns3_enet_tqp_vector *tqp_vector,
 	}
 }
 
-static void hns3_dump_coal_info(struct seq_file *s, bool is_tx)
+static int hns3_dump_coal_info(struct seq_file *s, bool is_tx)
 {
 	struct hnae3_handle *h = hnae3_seq_file_to_handle(s);
 	struct hns3_enet_tqp_vector *tqp_vector;
@@ -448,18 +454,34 @@ static void hns3_dump_coal_info(struct seq_file *s, bool is_tx)
 	seq_puts(s, "HW_GL  HW_QL\n");
 
 	for (i = 0; i < priv->vector_num; i++) {
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv))
+			return -EBUSY;
+
 		tqp_vector = &priv->tqp_vector[i];
 		hns3_get_coal_info(tqp_vector, s, i, is_tx);
 	}
+
+	return 0;
 }
 
 static int hns3_dbg_coal_info(struct seq_file *s, void *data)
 {
-	hns3_dump_coal_info(s, true);
+	struct hnae3_handle *h = hnae3_seq_file_to_handle(s);
+	struct hns3_nic_priv *priv = h->priv;
+	int ret;
+
+	mutex_lock(&priv->ae_handle->dbg_mutex);
+	ret = hns3_dump_coal_info(s, true);
+	if (ret)
+		goto unlock;
+
 	seq_puts(s, "\n");
-	hns3_dump_coal_info(s, false);
+	ret = hns3_dump_coal_info(s, false);
 
-	return 0;
+unlock:
+	mutex_unlock(&priv->ae_handle->dbg_mutex);
+	return ret;
 }
 
 static void hns3_dump_rx_queue_info(struct hns3_enet_ring *ring,
@@ -504,27 +526,22 @@ static int hns3_dbg_rx_queue_info(struct seq_file *s, void *data)
 	struct hns3_enet_ring *ring;
 	u32 i;
 
-	if (!priv->ring) {
-		dev_err(&h->pdev->dev, "priv->ring is NULL\n");
-		return -EFAULT;
-	}
-
+	mutex_lock(&priv->ae_handle->dbg_mutex);
 	seq_puts(s, "QUEUE_ID  BD_NUM  BD_LEN  TAIL  HEAD  FBDNUM  ");
 	seq_puts(s, "PKTNUM     COPYBREAK  RING_EN  RX_RING_EN  BASE_ADDR\n");
 
 	for (i = 0; i < h->kinfo.num_tqps; i++) {
-		/* Each cycle needs to determine whether the instance is reset,
-		 * to prevent reference to invalid memory. And need to ensure
-		 * that the following code is executed within 100ms.
-		 */
-		if (!test_bit(HNS3_NIC_STATE_INITED, &priv->state) ||
-		    test_bit(HNS3_NIC_STATE_RESETTING, &priv->state))
-			return -EPERM;
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv)) {
+			mutex_unlock(&priv->ae_handle->dbg_mutex);
+			return -EBUSY;
+		}
 
 		ring = &priv->ring[(u32)(i + h->kinfo.num_tqps)];
 		hns3_dump_rx_queue_info(ring, s, i);
 	}
 
+	mutex_unlock(&priv->ae_handle->dbg_mutex);
 	return 0;
 }
 
@@ -569,27 +586,22 @@ static int hns3_dbg_tx_queue_info(struct seq_file *s, void *data)
 	struct hns3_enet_ring *ring;
 	u32 i;
 
-	if (!priv->ring) {
-		dev_err(&h->pdev->dev, "priv->ring is NULL\n");
-		return -EFAULT;
-	}
-
+	mutex_lock(&priv->ae_handle->dbg_mutex);
 	seq_puts(s, "QUEUE_ID  BD_NUM  TC  TAIL  HEAD  FBDNUM  OFFSET  ");
 	seq_puts(s, "PKTNUM     RING_EN  TX_RING_EN  BASE_ADDR\n");
 
 	for (i = 0; i < h->kinfo.num_tqps; i++) {
-		/* Each cycle needs to determine whether the instance is reset,
-		 * to prevent reference to invalid memory. And need to ensure
-		 * that the following code is executed within 100ms.
-		 */
-		if (!test_bit(HNS3_NIC_STATE_INITED, &priv->state) ||
-		    test_bit(HNS3_NIC_STATE_RESETTING, &priv->state))
-			return -EPERM;
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv)) {
+			mutex_unlock(&priv->ae_handle->dbg_mutex);
+			return -EBUSY;
+		}
 
 		ring = &priv->ring[i];
 		hns3_dump_tx_queue_info(ring, s, i);
 	}
 
+	mutex_unlock(&priv->ae_handle->dbg_mutex);
 	return 0;
 }
 
@@ -604,14 +616,23 @@ static int hns3_dbg_queue_map(struct seq_file *s, void *data)
 
 	seq_puts(s, "local_queue_id  global_queue_id  vector_id\n");
 
+	mutex_lock(&priv->ae_handle->dbg_mutex);
 	for (i = 0; i < h->kinfo.num_tqps; i++) {
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv)) {
+			mutex_unlock(&priv->ae_handle->dbg_mutex);
+			return -EBUSY;
+		}
+
 		if (!priv->ring || !priv->ring[i].tqp_vector)
 			continue;
+
 		seq_printf(s, "%-16u%-17u%d\n", i,
 			   h->ae_algo->ops->get_global_queue_id(h, i),
 			   priv->ring[i].tqp_vector->vector_irq);
 	}
 
+	mutex_unlock(&priv->ae_handle->dbg_mutex);
 	return 0;
 }
 
@@ -661,8 +682,11 @@ static int hns3_dbg_rx_bd_info(struct seq_file *s, void *private)
 
 	ring = &priv->ring[data->qid + data->handle->kinfo.num_tqps];
 	for (i = 0; i < ring->desc_num; i++) {
-		desc = &ring->desc[i];
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv))
+			return -EBUSY;
 
+		desc = &ring->desc[i];
 		hns3_dump_rx_bd_info(priv, desc, s, i);
 	}
 
@@ -706,8 +730,11 @@ static int hns3_dbg_tx_bd_info(struct seq_file *s, void *private)
 
 	ring = &priv->ring[data->qid];
 	for (i = 0; i < ring->desc_num; i++) {
-		desc = &ring->desc[i];
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv))
+			return -EBUSY;
 
+		desc = &ring->desc[i];
 		hns3_dump_tx_bd_info(desc, s, i);
 	}
 
@@ -779,6 +806,11 @@ static int hns3_dbg_dev_info(struct seq_file *s, void *data)
 static void hns3_dump_page_pool_info(struct hns3_enet_ring *ring,
 				     struct seq_file *s, u32 index)
 {
+	if (!ring->page_pool) {
+		seq_printf(s, "%-10u %s\n", index, "page pool not initialized");
+		return;
+	}
+
 	seq_printf(s, "%-10u%-14u%-14d%-21u%-7u%-9d%uK\n",
 		   index,
 		   READ_ONCE(ring->page_pool->pages_state_hold_cnt),
@@ -796,28 +828,27 @@ static int hns3_dbg_page_pool_info(struct seq_file *s, void *data)
 	struct hns3_enet_ring *ring;
 	u32 i;
 
+	mutex_lock(&priv->ae_handle->dbg_mutex);
 	if (!priv->ring) {
-		dev_err(&h->pdev->dev, "priv->ring is NULL\n");
-		return -EFAULT;
-	}
-
-	if (!priv->ring[h->kinfo.num_tqps].page_pool) {
-		dev_err(&h->pdev->dev, "page pool is not initialized\n");
-		return -EFAULT;
+		mutex_unlock(&priv->ae_handle->dbg_mutex);
+		return -EBUSY;
 	}
 
 	seq_puts(s, "QUEUE_ID  ALLOCATE_CNT  FREE_CNT      ");
 	seq_puts(s, "POOL_SIZE(PAGE_NUM)  ORDER  NUMA_ID  MAX_LEN\n");
 
 	for (i = 0; i < h->kinfo.num_tqps; i++) {
-		if (!test_bit(HNS3_NIC_STATE_INITED, &priv->state) ||
-		    test_bit(HNS3_NIC_STATE_RESETTING, &priv->state))
-			return -EPERM;
+		/* Per-iteration check bounds reset latency to one iteration. */
+		if (hns3_dbg_is_device_busy(priv)) {
+			mutex_unlock(&priv->ae_handle->dbg_mutex);
+			return -EBUSY;
+		}
 
 		ring = &priv->ring[(u32)(i + h->kinfo.num_tqps)];
 		hns3_dump_page_pool_info(ring, s, i);
 	}
 
+	mutex_unlock(&priv->ae_handle->dbg_mutex);
 	return 0;
 }
 
@@ -826,17 +857,23 @@ static int hns3_dbg_bd_info_show(struct seq_file *s, void *private)
 	struct hns3_dbg_data *data = s->private;
 	struct hnae3_handle *h = data->handle;
 	struct hns3_nic_priv *priv = h->priv;
+	int ret;
 
-	if (!test_bit(HNS3_NIC_STATE_INITED, &priv->state) ||
-	    test_bit(HNS3_NIC_STATE_RESETTING, &priv->state))
+	mutex_lock(&priv->ae_handle->dbg_mutex);
+	if (hns3_dbg_is_device_busy(priv)) {
+		mutex_unlock(&priv->ae_handle->dbg_mutex);
 		return -EBUSY;
+	}
 
 	if (data->cmd == HNAE3_DBG_CMD_TX_BD)
-		return hns3_dbg_tx_bd_info(s, private);
+		ret = hns3_dbg_tx_bd_info(s, private);
 	else if (data->cmd == HNAE3_DBG_CMD_RX_BD)
-		return hns3_dbg_rx_bd_info(s, private);
+		ret = hns3_dbg_rx_bd_info(s, private);
+	else
+		ret = -EOPNOTSUPP;
 
-	return -EOPNOTSUPP;
+	mutex_unlock(&priv->ae_handle->dbg_mutex);
+	return ret;
 }
 DEFINE_SHOW_ATTRIBUTE(hns3_dbg_bd_info);
 
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index 60fc296020ab..d9583fa0d102 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -5452,6 +5452,7 @@ static int hns3_client_init(struct hnae3_handle *handle)
 	priv->min_tx_copybreak = 0;
 	priv->min_tx_spare_buf_size = 0;
 	set_bit(HNS3_NIC_STATE_DOWN, &priv->state);
+	mutex_init(&handle->dbg_mutex);
 
 	handle->msg_enable = netif_msg_init(debug, DEFAULT_MSG_LEVEL);
 
@@ -5565,6 +5566,7 @@ static int hns3_client_init(struct hnae3_handle *handle)
 	priv->ring = NULL;
 out_get_ring_cfg:
 	priv->ae_handle = NULL;
+	mutex_destroy(&handle->dbg_mutex);
 	free_netdev(netdev);
 	return ret;
 }
@@ -5588,6 +5590,7 @@ static void hns3_client_uninit(struct hnae3_handle *handle, bool reset)
 
 	hns3_free_rx_cpu_rmap(netdev);
 
+	mutex_lock(&handle->dbg_mutex);
 	hns3_nic_uninit_irq(priv);
 
 	hns3_clear_all_ring(handle, true);
@@ -5599,9 +5602,11 @@ static void hns3_client_uninit(struct hnae3_handle *handle, bool reset)
 	hns3_uninit_all_ring(priv);
 
 	hns3_put_ring_config(priv);
+	mutex_unlock(&handle->dbg_mutex);
 
 out_netdev_free:
 	hns3_dbg_uninit(handle);
+	mutex_destroy(&handle->dbg_mutex);
 	free_netdev(netdev);
 }
 
@@ -5878,6 +5883,7 @@ static int hns3_reset_notify_uninit_enet(struct hnae3_handle *handle)
 		return 0;
 	}
 
+	mutex_lock(&handle->dbg_mutex);
 	hns3_free_rx_cpu_rmap(netdev);
 	hns3_nic_uninit_irq(priv);
 	hns3_clear_all_ring(handle, true);
@@ -5890,6 +5896,7 @@ static int hns3_reset_notify_uninit_enet(struct hnae3_handle *handle)
 	hns3_uninit_all_ring(priv);
 
 	hns3_put_ring_config(priv);
+	mutex_unlock(&handle->dbg_mutex);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
index 14642f81efe1..7005d8b2d010 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_ethtool.c
@@ -1252,6 +1252,7 @@ static int hns3_set_ringparam(struct net_device *ndev,
 	if (if_running)
 		ndev->netdev_ops->ndo_stop(ndev);
 
+	mutex_lock(&h->dbg_mutex);
 	hns3_change_all_ring_bd_num(priv, new_ringparam.tx_desc_num,
 				    new_ringparam.rx_desc_num);
 	hns3_change_rx_buf_len(ndev, new_ringparam.rx_buf_len);
@@ -1270,6 +1271,7 @@ static int hns3_set_ringparam(struct net_device *ndev,
 		for (i = 0; i < h->kinfo.num_tqps * 2; i++)
 			hns3_fini_ring(&tmp_rings[i]);
 	}
+	mutex_unlock(&h->dbg_mutex);
 
 	kfree(tmp_rings);
 
-- 
2.43.0

