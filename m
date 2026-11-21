Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302114;
	b=PJah/5axJhGQVVrinSQ2V2K5KnI+NYaZSF4VYLyWCTofThI8KONVtxx79J32kt54WEzL
	 S2WvRTQQcv/QOuC99ZJ71wuRdgi+i7qlo0MfE8rI4fQG47rfHn5H9qatBL90vgP4cbVLQ
	 VZJ+W9YCLtcBpucF7VjybjIF2JJ+gdA33bXKzMymD0lxI9YXmpmkyELEfBWDzBgy0sHvd
	 xKM1eQo/nnKtF70JbxNMy1pNZBSIhM321QBUubwoL1yCHbQ/I8VeSCEoaYKRpYge8KBws
	 q6dA9nlw6BZ9T+zI0XDncUPf1qXGqk5XdIZyKTQDfSlj0Y54wcH8frULYWfx2VFQ0WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302114;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BS88K2VVoTY4YI1i4btAfwbYfZdIOCLBiJJTK32tqX4=;
	b=lY1IGjFs5h8F7DX841HJBkabnLTYQ2jn9D/rjk5wmphdbpRfVFIvSSz5hPAbb8tXAz47
	 QeYLrW4fpOEhPYMbxUd6HolTebtF43qaDKzqaM1Mg1Vq+xPCpq1BQZQAkL0HfEXXrVE1V
	 ZdxAKeDyE5efcRL/REikhu+SpYHpFluO0ASV48ufZKrlJquejb6zG9kQiYmMpkeZTLuwg
	 3RISlYL+TK23PU5PxHISAGIOusYysAyRRWE3RALCJrRL5ud0zEpdtcZp1XZhoxAe49TE0
	 HuZRy0HmTykW2/HCVs4tA/kWsV2qsf0cChSqRpO/fYCKwF9tcGC0x9oDTP+TFzGHfMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="UFFv/0HI";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE1606A334
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADE1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UFFv/0HI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302114; x=1826838114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7emTcq/O6yUUu8YjNW+aBX07xC2/rdknbWvw/UOoyzI=;
  b=UFFv/0HI1NIw+98y9foGJQ6dm443huqv+H/p9rH4KRuPkslhW4bCox/M
   wu5D7kM+poC8OG2Q3cVOZgy41e9KlntUwa+TNHS5hyR3jIl4ghCEyrAX5
   OmLjokTPEdMtxiut6elnBxY15b6gXcU8nAmGdEdCc5NEyuVTRcZ15+UbG
   oIN9dfaPRQneYXBoPVVlYXb8+sgJCsjY2vereLztftewRcUqlkzazLGFP
   vPp92YYjs/vW5JmC1wlwNMYtKknbCPr1cd3lsXWDCPStXgPjwlsHOWenz
   bqTeh+rcHdnwyzPkWSZsr8nBqDJD4YWekZS1JNMZT6E3LWjPiI/uZ+MdH
   Q==;
X-CSE-ConnectionGUID: SZWjIuIKQ/uuWNcRI7IuAQ==
X-CSE-MsgGUID: IXXeHaJEQAGPOKNeWKEfww==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040220"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:01:54 -0800
X-CSE-ConnectionGUID: VofTEKsnTF+QIflxbT9BLg==
X-CSE-MsgGUID: sLzOv2v8SzKLnT2QXj3TRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857062"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:01:48 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 18A6233BCD;
	Sat, 21 Nov 2026 23:01:46 +0000 (GMT)
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Michal Schmidt <mschmidt@redhat.com>,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	leon@kernel.org,
	mbloch@nvidia.com,
	jacob.e.keller@intel.com,
	jedrzej.jagielski@intel.com,
	anzaki@gmail.com,
	brett.creeley@amd.com,
	ohartoov@nvidia.com,
	Petr Oros <poros@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH net-next v7 07/15] iavf: extend iavf_configure_queues() to support more queues
Date: Sat, 21 Nov 2026 23:55:34 +0100
Message-ID: <20261121230123.316391-8-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
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
index d174202bcd79..aac942ffae43 100644
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
index c7b12de63c2f..1057c6158caa 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1258,6 +1258,7 @@ static void iavf_configure(struct iavf_adapter *adapter)
 
 	iavf_configure_tx(adapter);
 	iavf_configure_rx(adapter);
+	adapter->cfg_qps_sent = 0;
 	adapter->aq_required |= IAVF_FLAG_AQ_CONFIGURE_QUEUES;
 
 	for (i = 0; i < adapter->num_active_queues; i++) {
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index 5578525d550e..6113541527d4 100644
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
2.51.1

