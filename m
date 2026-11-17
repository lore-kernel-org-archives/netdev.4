Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908505;
	b=vDvUpxCBGBMveZaDrCDges55su4GPYVfSG3oPfRqIBExuHKmx6RYqBS1gqtCVWMOLVSi
	 aC6I1/ZYMaSoLzjxmgGAVRqx0pn32z43EW2qvMb10YtIDQMNF9bojAjGhe8WPXo6cKyR1
	 BiCYaYmdjvaOCkWg4NfFl5YybxbqYEunA2emJnyurlPAgKD7HdOGc6c6TybwnwuQ5CSuQ
	 AntPBxx80CD0lSJzeIwXUr1I6YMasGd8dC8/jAFhpYQENo9FGGRu4Xf9Q4LQxA7xl2n/u
	 JUU4TEJew4T03Mvhg4H2lCdI4vYgUH9azW1ULMg0x1iPlh5XVztLcSOLGk6DOymFkUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908505;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MqWf+cdaGs3hA0cjSFU+evyq/SSuM0yEVGAzCAdBpeo=;
	b=iPn1Xabpay9jjRhMFkpKwvJyuzRrwpO5CSu+mt4BVByTCMtcpQh8SPgom53K3egyMHzD
	 6lkxfhAS+Q2eZx05VbgpN1tRBpibI/dTjeN00FJadw6k0h5sepDTFh8wqDmsaRo3AVKbR
	 sWRtmGO+ZBeTiBZH1AP1Uh8ooFZQgj/N274el5XlrJYyvSEO8nLjQAZ6kI58b/X2dHrBc
	 iSww8+3nroSPEXPA7ag0XVsWytHLtvX+ml/mMlGANUmxsQ5Vac/UvAH8oP1thl+IMQir2
	 gxZMJ/s/fR3Rc4uXhgdG+3Ru/0oIL5pQ+a2DMYDM8v/4fr+4RdJ0LmTsbrMgVyKtAwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VonTSUFA;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4153606A338
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4153606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VonTSUFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908505; x=1826444505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wKUM9Uhqv03EouIXQqj+J4EPrdhH8WmiQi5EFXyY9Cw=;
  b=VonTSUFACxhef5ZyPyVF5a3WcRO+vdhRV0v/gdCogrwMnjepMKPbBx2e
   mr3m6OfzjGSbmEngG16jWMcKa+d2ZRyLrMr4rpX3xJ+JNQGmVemM9VAY5
   Ovy6/zRjWKRinna1eA3np9V0+Hdrt9KQdzUfkBDMBmlL6y58/SwkuK2cG
   jOK3Dcoxy3iPEYNDn5CL2o8OBE0ngcDy7EoMIuuJ0OXjNLligvV6H6H6Z
   kTK5+ngLOPAHCFgWkazBFMkV26cNdbvQ6ExjSQRMPkQh/uG3h/M/r0bTK
   AH3CNIG0CSKyGhTzR3A6bpdwvzJK8CNIBIHElSqtcQFYtbr+ZqqPvboYC
   w==;
X-CSE-ConnectionGUID: 5oc/zxCsSoSR4mo/1hjI9g==
X-CSE-MsgGUID: wrTDe19NQzurN0mm8XbXWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3553719"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3553719"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:44 -0800
X-CSE-ConnectionGUID: t1nPd2orRQefG8S80v3h1Q==
X-CSE-MsgGUID: sxbHGRp2TvuQqHlDr1ATRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11591345"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 01:41:37 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 513EE28197;
	Tue, 17 Nov 2026 09:41:35 +0000 (GMT)
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
Subject: [net-next v6 07/15] iavf: extend iavf_configure_queues() to support more queues
Date: Tue, 17 Nov 2026 10:44:45 +0100
Message-ID: <20261117094913.100756-8-przemyslaw.kitszel@intel.com>
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

Extend iavf_configure_queues() to support more queue pairs than fit
into a single virtchnl message (62).
Virtchnl opcode used was already generic, but we have just not needed
more than one message before.

Send one message per call, and keep IAVF_FLAG_AQ_CONFIGURE_QUEUES set
until all queue pairs are sent, similar to what iavf_add_ether_addrs()
does for MAC filters. The next message goes out on a later watchdog
run, once the reply to the previous one has cleared current_op, as for
any other op. Stop sending on a PF NACK.

Add helper, iavf_max_vc_entries(), that determines how many entries we
could fit into virtchnl message (ending by flex array member). Will be
also used on another op later in this series.

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v4:
 * send one message per watchdog run, instead of polling for the reply
   to each one with a 1s timeout, which could resend the whole config
   after a late ACK or NACK, and could take a stale reply for the
   awaited one (Sashiko)
 * stop sending the rest on a PF NACK, in iavf_virtchnl_completion()

v2:
 * fix typo (Sashiko)
 * abort iavf_configure_queues() at error (Sashiko)
 * report send and poll failures with dev_err(), they are not
   recoverable here (me)
 * cast via uintptr_t in iavf_match_vc_op_cb(), for clang W=1
   -Wpointer-to-enum-cast
 * commit message: the limit is the number of queue pairs that fit
   into a single virtchnl message (62), not 31
 * commit message: describe the switch to a synchronous op (Sashiko)
 * stop at PF NACK (Sashiko)
 * on timeout keep current_op and IAVF_FLAG_AQ_CONFIGURE_QUEUES set
   until the late reply arrives, instead of resending right away;
   clear both on other errors (no retry) (Sashiko)
 * fix dev_err() continuation alignment (Sashiko)
---
 drivers/net/ethernet/intel/iavf/iavf.h        |  2 ++
 drivers/net/ethernet/intel/iavf/iavf_main.c   |  1 +
 .../net/ethernet/intel/iavf/iavf_virtchnl.c   | 25 ++++++++++++++-----
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf.h b/drivers/net/ethernet/intel/iavf/iavf.h
index 8c45536fd502..a41d2726ebd8 100644
--- a/drivers/net/ethernet/intel/iavf/iavf.h
+++ b/drivers/net/ethernet/intel/iavf/iavf.h
@@ -269,6 +269,8 @@ struct iavf_adapter {
 	u8 rxdid;
 	int num_active_queues;
 	int num_req_queues;
+	/* queue pairs sent so far, for ops that take more than one message */
+	int cfg_qps_sent;
 
 	/* TX */
 	struct iavf_ring *tx_rings;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 2f8a80a11336..d39737dcd425 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1258,6 +1258,7 @@ static void iavf_configure(struct iavf_adapter *adapter)
 
 	iavf_configure_tx(adapter);
 	iavf_configure_rx(adapter);
+	adapter->cfg_qps_sent = 0;
 	adapter->aq_required |= IAVF_FLAG_AQ_CONFIGURE_QUEUES;
 
 	for (i = 0; i < adapter->num_active_queues; i++) {
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index e6b7e8f82c7c..356565aa41c8 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
@@ -8,6 +8,11 @@
 #include "iavf_ptp.h"
 #include "iavf_prototype.h"
 
+/* how many Flex Array Member entries do fit into VC message of type *ptr */
+#define iavf_max_vc_entries(ptr, flex_member) \
+	((IAVF_MAX_AQ_BUF_SIZE - virtchnl_struct_size(ptr, flex_member, 1)) / \
+	 sizeof(ptr->flex_member[0]) + 1)
+
 /**
  * iavf_send_pf_msg
  * @adapter: adapter structure
@@ -375,11 +380,12 @@ int iavf_get_vf_ptp_caps(struct iavf_adapter *adapter)
 void iavf_configure_queues(struct iavf_adapter *adapter)
 {
 	struct virtchnl_vsi_queue_config_info *vqci;
-	int pairs = adapter->num_active_queues;
 	struct virtchnl_queue_pair_info *vqpi;
+	int first = adapter->cfg_qps_sent;
 	u32 i, max_frame;
 	u8 rx_flags = 0;
 	size_t len;
+	int pairs;
 
 	max_frame = LIBIE_MAX_RX_FRM_LEN(adapter->rx_rings->pp->p.offset);
 	max_frame = min_not_zero(adapter->vf_res->max_mtu, max_frame);
@@ -391,6 +397,8 @@ void iavf_configure_queues(struct iavf_adapter *adapter)
 		return;
 	}
 	adapter->current_op = VIRTCHNL_OP_CONFIG_VSI_QUEUES;
+	pairs = min_t(int, adapter->num_active_queues - first,
+		      iavf_max_vc_entries(vqci, qpair));
 	len = virtchnl_struct_size(vqci, qpair, pairs);
 	vqci = kzalloc(len, GFP_KERNEL);
 	if (!vqci)
@@ -402,10 +410,7 @@ void iavf_configure_queues(struct iavf_adapter *adapter)
 	vqci->vsi_id = adapter->vsi_res->vsi_id;
 	vqci->num_queue_pairs = pairs;
 	vqpi = vqci->qpair;
-	/* Size check is not needed here - HW max is 16 queue pairs, and we
-	 * can fit info for 31 of them into the AQ buffer before it overflows.
-	 */
-	for (i = 0; i < pairs; i++) {
+	for (i = first; i < first + pairs; i++) {
 		vqpi->txq.vsi_id = vqci->vsi_id;
 		vqpi->txq.queue_id = i;
 		vqpi->txq.ring_len = adapter->tx_rings[i].count;
@@ -425,7 +430,9 @@ void iavf_configure_queues(struct iavf_adapter *adapter)
 		vqpi++;
 	}
 
-	adapter->aq_required &= ~IAVF_FLAG_AQ_CONFIGURE_QUEUES;
+	adapter->cfg_qps_sent += pairs;
+	if (adapter->cfg_qps_sent == adapter->num_active_queues)
+		adapter->aq_required &= ~IAVF_FLAG_AQ_CONFIGURE_QUEUES;
 	iavf_send_pf_msg(adapter, VIRTCHNL_OP_CONFIG_VSI_QUEUES,
 			 (u8 *)vqci, len);
 	kfree(vqci);
@@ -2551,6 +2558,12 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
 			dev_warn(&adapter->pdev->dev, "Failed to Config Queue BW, error %s\n",
 				 iavf_stat_str(&adapter->hw, v_retval));
 			break;
+		case VIRTCHNL_OP_CONFIG_VSI_QUEUES:
+			dev_err(&adapter->pdev->dev, "Failed to configure queues, error %s\n",
+				iavf_stat_str(&adapter->hw, v_retval));
+			/* don't send the remaining queue pairs */
+			adapter->aq_required &= ~IAVF_FLAG_AQ_CONFIGURE_QUEUES;
+			break;
 		default:
 			dev_err(&adapter->pdev->dev, "PF returned error %d (%s) to our request %d\n",
 				v_retval, iavf_stat_str(&adapter->hw, v_retval),
-- 
2.54.0

