Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908507;
	b=y9qtEaDoFcbYTogDmctAKXJXy4l2m7tRGfRngfW19KU2EW0D1AIpdPfnlTLneAwC2n46
	 HcHJ86fbH0vbwwIRXGlbrmMzJkTMZaOIezLEF0A/JMrSSlp8jR/sClb4h0olCZ7centre
	 zD7ESkJ9tIAUVigcgk0uD+J5Mkn8eVdbJMw9nS0LOOWjMoLk74YI3rabFT+AiZuiJstgc
	 M0AH+7gCzTQ8B/pJFw28wLADRduytgWfpDdPbpCpgZz6YAGIS/rnKXoNgqWYQ3c0bMg1a
	 pHMIRJABfJ+3TYPwi8fNw1Nb1GM2TC+x/iuN5JY2KJSfGtzBY7cqShUVAvp+LUBLgsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oFDxPRBHiOJydhVOOLi0DBON2ir38VNAPlzEmhB0XyU=;
	b=J0j+KgGbrXAyweFjs1xGb4KRqstB3rtnS48PtNtQZhKpDAfG6faMwXXE3sCh0D/NNVR/
	 pfILNMHYAnwC1jdOUuo/tQMLdDUS58/Yceju5EMaq8zso0I5MA3XxpwpE87pVNByg6wV7
	 E38FRHsiHinedH+UQLTkjatDlNsaezDr1WDmQjcklyXt3/nCZHfIr7rAfSlAmoZ24+1k1
	 k9Heu140F/hOkwz0td0Y3+XqT2kWXEtYCp2jBtyaL19qtQpAiHPuBFpTWtrz7Vfi0v2gr
	 btVB7Y8JOrA48Sqd3ABz0JHG6mvX9FGC26vaJ0Q2n1CasHktDhhcmO3HSl4/FfL29Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dolne9wQ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB7606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1CB7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dolne9wQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908507; x=1826444507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hBGdwo6cnBv+r69ZLwuid5YQ64+Y1nvcIBNjLCD6PFU=;
  b=dolne9wQpoei9TKFdlksWvrtjeUFxDzW7v9qhvvQon3kAnUcAfGBdESw
   oZrPEdUSqw7v9m2Ub+EZ4+mj7ATncrNptieD7DTHk3YdMu44iTEIz7Dix
   DSihNnBVj61wzIppsQ8QVsT3aK2g34FL7Twzet3kddvWxlIvyQ4em0FKU
   qmgMLBIIjrR1waZhCPgVqPXNB7dZxW38slAVdfFwGS9eikWJObR/gDgVj
   qD5r9hNpC5bmRJpusrcjcmV5H5vj6IEDhhwF8qr4sYApxwfTKKEnYOt7M
   8z5rCzBzpN7fwcUSY0VJyZNoxjnfe3r7cR5M2bKZkwNELga3QYWm23pH1
   g==;
X-CSE-ConnectionGUID: ClEpTLi7RJSOQw/2E3Au3Q==
X-CSE-MsgGUID: cU8JUsLQTbOUN078sB1RlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3553749"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3553749"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:46 -0800
X-CSE-ConnectionGUID: Fhx0Ga5qT3ChlZLMJ2orVw==
X-CSE-MsgGUID: 6XTpaO7TT76j5AhOeWR43A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11591359"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 01:41:40 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 705E528199;
	Tue, 17 Nov 2026 09:41:38 +0000 (GMT)
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: kuba@kernel.org,
	netdev@vger.kernel.org
Cc: aleksandr.loktionov@intel.com,
	andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	anzaki@gmail.com,
	brett.creeley@amd.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	jedrzej.jagielski@intel.com,
	jiri@resnulli.us,
	leon@kernel.org,
	mbloch@nvidia.com,
	mschmidt@redhat.com,
	ohartoov@nvidia.com,
	pabeni@redhat.com,
	poros@redhat.com,
	rdunlap@infradead.org,
	saeedm@nvidia.com,
	skhan@linuxfoundation.org,
	tariqt@nvidia.com,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [net-next v6 09/15] iavf: increase max number of queues to 256
Date: Tue, 17 Nov 2026 10:44:47 +0100
Message-ID: <20261117094913.100756-10-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
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

Increase the max number of queues that driver will handle to 256.
Use old legacy limit in the virtchnl handling of iavf_map_queues().
Limit the number of queue vectors to 64, as VF interrupt registers
cover no more.

The netdev is allocated at probe, before the PF tells the VF how many
queues it may use, so it now always has 256 Tx and Rx queues. Whatever
is sized by num_tx_queues grows 16 times: the default qdisc of an up VF
has a child per Tx queue (about 6 MB with pfifo_fast, 17 MB with
fq_codel), and ethtool -S lists 256 queue pairs, unused ones as zeros.

Reviewed-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v5:
 * cap the legacy VIRTCHNL_OP_{EN,DIS}ABLE_QUEUES bitmaps at 16 queues,
   as done for the IRQ map: PF rejects a wider mask, and BIT() above 63
   queues is undefined (me)

v4:
 * limit MSI-X budget to 64 queue vectors, VFINT_ITRN_64 and
   VFINT_DYN_CTLN1 have no room for more (Sashiko)
 * change ADQ total_qps to u16, a sum of 256 queues wrapped to 0 in u8
   (Sashiko)
 * commit message: mention the cost of the netdev sized for 256 queues
   (Sashiko)
 * program ITR of vectors 16..63 via VFINT_ITRN_64, VFINT_ITRN1 has room
   for 16 vectors only (Sashiko)
 * revert dropping of "_i=0...15" from IAVF_Q{R,T}X_TAIL1() comments

v2:
 * change iavf_q_vector::num_ringpairs to u16 (Sashiko)
 * drop the stale "_i=0...15" range from IAVF_Q{R,T}X_TAIL1()
---
 drivers/net/ethernet/intel/iavf/iavf.h        | 10 +++++---
 .../net/ethernet/intel/iavf/iavf_register.h   |  2 ++
 drivers/net/ethernet/intel/iavf/iavf_main.c   | 24 +++++++++++++------
 .../net/ethernet/intel/iavf/iavf_virtchnl.c   | 21 +++++++++-------
 4 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf.h b/drivers/net/ethernet/intel/iavf/iavf.h
index 053f34c4f710..60ee3a195567 100644
--- a/drivers/net/ethernet/intel/iavf/iavf.h
+++ b/drivers/net/ethernet/intel/iavf/iavf.h
@@ -87,8 +87,10 @@ struct iavf_vsi {
 #define IAVF_TX_DESC(R, i) (&(((struct iavf_tx_desc *)((R)->desc))[i]))
 #define IAVF_TX_CTXTDESC(R, i) \
 	(&(((struct iavf_tx_context_desc *)((R)->desc))[i]))
+
 /* for "old" virtchnl opcodes that accept up to 16 queues */
 #define IAVF_MAX_REQ_QUEUES_VCV1	16
+#define IAVF_MAX_REQ_QUEUES		256
 
 #define IAVF_HKEY_ARRAY_SIZE ((IAVF_VFQF_HKEY_MAX_INDEX + 1) * 4)
 #define IAVF_HLUT_ARRAY_SIZE ((IAVF_VFQF_HLUT_MAX_INDEX + 1) * 4)
@@ -108,9 +110,9 @@ struct iavf_q_vector {
 	struct napi_struct napi;
 	struct iavf_ring_container rx;
 	struct iavf_ring_container tx;
-	u32 ring_mask;
+	DECLARE_BITMAP(ring_mask, IAVF_MAX_REQ_QUEUES);
 	u8 itr_countdown;	/* when 0 should adjust adaptive ITR */
-	u8 num_ringpairs;	/* total number of ring pairs in vector */
+	u16 num_ringpairs;	/* total number of ring pairs in vector */
 	u16 v_idx;		/* index in the vsi->q_vector array. */
 	u16 reg_idx;		/* register index of the interrupt */
 	char name[IFNAMSIZ + 15];
@@ -134,6 +136,8 @@ struct iavf_q_vector {
 
 #define MIN_MSIX_Q_VECTORS 1
 #define MIN_MSIX_COUNT (MIN_MSIX_Q_VECTORS + NONQ_VECS)
+/* VF interrupt registers cover 64 queue vectors */
+#define MAX_MSIX_Q_VECTORS 64
 
 #define IAVF_QUEUE_END_OF_LIST 0x7FF
 #define IAVF_FREE_VECTOR 0x7FFF
@@ -182,7 +186,7 @@ enum iavf_tc_state_t {
 struct iavf_channel_config {
 	struct virtchnl_channel_info ch_info[IAVF_MAX_TRAFFIC_CLASS];
 	enum iavf_tc_state_t state;
-	u8 total_qps;
+	u16 total_qps;
 };
 
 /* State of cloud filter */
diff --git a/drivers/net/ethernet/intel/iavf/iavf_register.h b/drivers/net/ethernet/intel/iavf/iavf_register.h
index a19e88898a0b..47fd2d3f5e4b 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_register.h
+++ b/drivers/net/ethernet/intel/iavf/iavf_register.h
@@ -56,6 +56,8 @@
 #define IAVF_VFINT_ICR0_ENA1_RSVD_SHIFT 31
 #define IAVF_VFINT_ICR01 0x00004800 /* Reset: CORER */
 #define IAVF_VFINT_ITRN1(_i, _INTVF) (0x00002800 + ((_i) * 64 + (_INTVF) * 4)) /* _i=0...2, _INTVF=0...15 */ /* Reset: VFR */
+#define IAVF_VFINT_ITRN_64(_i, _INTVF) \
+	(0x00002C00 + ((_i) * 256 + (_INTVF) * 4)) /* _i=0...2, _INTVF=0...63 */
 #define IAVF_QRX_TAIL1(_Q) (0x00002000 + ((_Q) * 4)) /* _i=0...15 */ /* Reset: CORER */
 #define IAVF_QTX_TAIL1(_Q) (0x00000000 + ((_Q) * 4)) /* _i=0...15 */ /* Reset: PFR */
 #define IAVF_VFQF_HENA(_i) (0x0000C400 + ((_i) * 4)) /* _i=0...1 */ /* Reset: CORER */
diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 822d6e692d49..db769eead68f 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -419,6 +419,15 @@ static irqreturn_t iavf_msix_clean_rings(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/* VFINT_ITRN1 fits 16 vectors only, VFINT_ITRN_64 aliases it for up to 64 */
+static u32 iavf_itrn_reg(enum iavf_dyn_idx_t itr_idx, u16 reg_idx)
+{
+	if (reg_idx < 16)
+		return IAVF_VFINT_ITRN1(itr_idx, reg_idx);
+
+	return IAVF_VFINT_ITRN_64(itr_idx, reg_idx);
+}
+
 /**
  * iavf_map_vector_to_rxq - associate irqs with rx queues
  * @adapter: board private structure
@@ -439,8 +448,8 @@ iavf_map_vector_to_rxq(struct iavf_adapter *adapter, int v_idx, int r_idx)
 	q_vector->rx.count++;
 	q_vector->rx.next_update = jiffies + 1;
 	q_vector->rx.target_itr = ITR_TO_REG(rx_ring->itr_setting);
-	q_vector->ring_mask |= BIT(r_idx);
-	wr32(hw, IAVF_VFINT_ITRN1(IAVF_RX_ITR, q_vector->reg_idx),
+	set_bit(r_idx, q_vector->ring_mask);
+	wr32(hw, iavf_itrn_reg(IAVF_RX_ITR, q_vector->reg_idx),
 	     q_vector->rx.current_itr >> 1);
 	q_vector->rx.current_itr = q_vector->rx.target_itr;
 }
@@ -466,7 +475,7 @@ iavf_map_vector_to_txq(struct iavf_adapter *adapter, int v_idx, int t_idx)
 	q_vector->tx.next_update = jiffies + 1;
 	q_vector->tx.target_itr = ITR_TO_REG(tx_ring->itr_setting);
 	q_vector->num_ringpairs++;
-	wr32(hw, IAVF_VFINT_ITRN1(IAVF_TX_ITR, q_vector->reg_idx),
+	wr32(hw, iavf_itrn_reg(IAVF_TX_ITR, q_vector->reg_idx),
 	     q_vector->tx.target_itr >> 1);
 	q_vector->tx.current_itr = q_vector->tx.target_itr;
 }
@@ -1661,9 +1670,9 @@ static int iavf_set_interrupt_capability(struct iavf_adapter *adapter)
 	/* It's easy to be greedy for MSI-X vectors, but it really doesn't do
 	 * us much good if we have more vectors than CPUs. However, we already
 	 * limit the total number of queues by the number of CPUs so we do not
-	 * need any further limiting here.
+	 * need any further limiting here, except for the VF registers.
 	 */
-	v_budget = min_t(int, pairs + NONQ_VECS,
+	v_budget = min_t(int, min(pairs, MAX_MSIX_Q_VECTORS) + NONQ_VECS,
 			 (int)adapter->vf_res->max_vectors);
 
 	adapter->msix_entries = kzalloc_objs(struct msix_entry, v_budget);
@@ -3734,9 +3743,10 @@ static int __iavf_setup_tc(struct net_device *netdev, void *type_data)
 	struct tc_mqprio_qopt_offload *mqprio_qopt = type_data;
 	struct iavf_adapter *adapter = netdev_priv(netdev);
 	struct virtchnl_vf_resource *vfres = adapter->vf_res;
-	u8 num_tc = 0, total_qps = 0;
 	int ret = 0, netdev_tc = 0;
+	u16 total_qps = 0;
 	u64 max_tx_rate;
+	u8 num_tc = 0;
 	u16 mode;
 	int i;
 
@@ -5371,7 +5381,7 @@ static int iavf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 
 	netdev = alloc_etherdev_mq(sizeof(struct iavf_adapter),
-				   IAVF_MAX_REQ_QUEUES_VCV1);
+				   IAVF_MAX_REQ_QUEUES);
 	if (!netdev) {
 		err = -ENOMEM;
 		goto err_alloc_etherdev;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index 69241cb146e0..1296ea0f1716 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
@@ -260,19 +260,19 @@ int iavf_send_vf_ptp_caps_msg(struct iavf_adapter *adapter)
  **/
 static void iavf_validate_num_queues(struct iavf_adapter *adapter)
 {
-	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES_VCV1) {
+	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES) {
 		struct virtchnl_vsi_resource *vsi_res;
 		int i;
 
 		dev_info(&adapter->pdev->dev, "Received %d queues, but can only have a max of %d\n",
 			 adapter->vf_res->num_queue_pairs,
-			 IAVF_MAX_REQ_QUEUES_VCV1);
+			 IAVF_MAX_REQ_QUEUES);
 		dev_info(&adapter->pdev->dev, "Fixing by reducing queues to %d\n",
-			 IAVF_MAX_REQ_QUEUES_VCV1);
-		adapter->vf_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES_VCV1;
+			 IAVF_MAX_REQ_QUEUES);
+		adapter->vf_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
 		for (i = 0; i < adapter->vf_res->num_vsis; i++) {
 			vsi_res = &adapter->vf_res->vsi_res[i];
-			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES_VCV1;
+			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
 		}
 	}
 }
@@ -456,7 +456,8 @@ void iavf_enable_queues(struct iavf_adapter *adapter)
 	}
 	adapter->current_op = VIRTCHNL_OP_ENABLE_QUEUES;
 	vqs.vsi_id = adapter->vsi_res->vsi_id;
-	vqs.tx_queues = BIT(adapter->num_active_queues) - 1;
+	vqs.tx_queues = BIT(min(adapter->num_active_queues,
+				IAVF_MAX_REQ_QUEUES_VCV1)) - 1;
 	vqs.rx_queues = vqs.tx_queues;
 	adapter->aq_required &= ~IAVF_FLAG_AQ_ENABLE_QUEUES;
 	iavf_send_pf_msg(adapter, VIRTCHNL_OP_ENABLE_QUEUES,
@@ -481,7 +482,8 @@ void iavf_disable_queues(struct iavf_adapter *adapter)
 	}
 	adapter->current_op = VIRTCHNL_OP_DISABLE_QUEUES;
 	vqs.vsi_id = adapter->vsi_res->vsi_id;
-	vqs.tx_queues = BIT(adapter->num_active_queues) - 1;
+	vqs.tx_queues = BIT(min(adapter->num_active_queues,
+				IAVF_MAX_REQ_QUEUES_VCV1)) - 1;
 	vqs.rx_queues = vqs.tx_queues;
 	adapter->aq_required &= ~IAVF_FLAG_AQ_DISABLE_QUEUES;
 	iavf_send_pf_msg(adapter, VIRTCHNL_OP_DISABLE_QUEUES,
@@ -526,8 +528,9 @@ void iavf_map_queues(struct iavf_adapter *adapter)
 
 		vecmap->vsi_id = adapter->vsi_res->vsi_id;
 		vecmap->vector_id = v_idx + NONQ_VECS;
-		vecmap->txq_map = q_vector->ring_mask;
-		vecmap->rxq_map = q_vector->ring_mask;
+		vecmap->txq_map = bitmap_read(q_vector->ring_mask, 0,
+					      IAVF_MAX_REQ_QUEUES_VCV1);
+		vecmap->rxq_map = vecmap->txq_map;
 		vecmap->rxitr_idx = IAVF_RX_ITR;
 		vecmap->txitr_idx = IAVF_TX_ITR;
 	}
-- 
2.54.0

