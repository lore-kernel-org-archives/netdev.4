Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302123;
	b=xaRlGQOLCUp/A8p0c/YLdQ43xyKT3lJji3YhDfyRNU8l5drUxvVddqRa/aq1j/uXiPvr
	 78o4RdURuWbjAElEVxsTKm6KIF/CvqF8OCP6iqL/vAs6D+RyAv1hnmC7/TRAD23/cnd8W
	 hFO5fqBkHbJvZy5mb9XIMgEkb/CSmeziVrIhHMXrpP8VhGHFQjIAXuWHBmbziGFzkK74A
	 W34ekGMag2lgfbz/Pd9nBADctBxPs61w4565d31DYH6epEqhR30ZxdWF8tEG496ZvDSUV
	 N60zVdFFTVbH3ozqXXi8Hh5WmLPpFsIRsP6u6GXlhsdaDVQYY5uKBWOvE0TTsxfEA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302123;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z9C6KNwo2afvwSSyO/owurJ3s/8Vbrw/h4J4mFjcRC0=;
	b=EiQwXBzlnBzyARINOeVW7Lp91wSbl2CZqscmerZKGEqEa0IwwmwTB49i/izoo7iZI94B
	 LtL9fLyJHrzGA+zNybeqELe45qUgjv1+h/lXI/er9WQwOMTl7WlovJQ14ip1Qe3wv45ue
	 Ef5dZK3mw3vOjYoAkL5XwqWZUXBEnJ6hv8MMJaJHAOqDRltpa62Dtb2ULn7LHlpaI+gwN
	 MQ77w9iXV6gXOd23FqBXhsnuCNiUnOKrCrBWzruyKu7cN56MLgBo+7p+C1c+rE7b3wk+X
	 8A1cWYptmzP2c3vrKVZ3tCpPSarU3rN9Lkrqaz4oTkjEYrIcwuRzXFvyxsVV3njrdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyJJNpy0;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942F606A334
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C942F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iyJJNpy0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302123; x=1826838123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AkIyG2nNRZpY8WQ/tUMRpru/IWVrIMML4c4rpWHTg0E=;
  b=iyJJNpy0aF6qC4lQJW5gopNm0Qp55z/8yF0uA/KqU2xHbkV0E09BUKWL
   7/BZo5dxP4JA0Nuq5d2LMadmJGw1IU8YSxImffGre38KhR+Q/T7tpvxxz
   rvGxsMDYFggdrD4EUccNTH/NQTcZXq4OypYW2yoGBwq5xsjQqQYwG+1Ia
   OTXf75X8Yfo5Q5olDV9Lw2ZDQRYBaYIgd+h7gkeKpMNqc2ch6LcGrFMft
   XrwISB/L1XMLQ7/35bLz288bX3cZceKJw6TwY6s0S1eyg4duDy4LqzSOw
   EnxiXWs4UNGoCTMbFsauhXWz/d5cebRn9zpxj6X5VdI9bsVSp5VsCXQX2
   w==;
X-CSE-ConnectionGUID: SjEavVErTP2/CxLxjJhoBQ==
X-CSE-MsgGUID: m4rCFi+ZTXi4e3Sge8ICuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040257"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040257"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:02:02 -0800
X-CSE-ConnectionGUID: xGHiRioaTm2fCBtCn6H80w==
X-CSE-MsgGUID: wZpD7v0XRj29Ln2x1O8hjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857071"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:01:56 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id E6F9A33BC5;
	Sat, 21 Nov 2026 23:01:53 +0000 (GMT)
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
Subject: [PATCH net-next v7 11/15] ice: introduce handling of virtchnl LARGE VF opcodes
Date: Sat, 21 Nov 2026 23:55:38 +0100
Message-ID: <20261121230123.316391-12-przemyslaw.kitszel@intel.com>
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

From: Brett Creeley <brett.creeley@intel.com>

With new virtchnl offload/capability VFs are able to make use of more than
16 queues. But the old opcodes were designed with a max of 16 queues,
so new ones were added (by iavf/virtchnl commit of this series).
Add handlers for VIRTCHNL_OP_ENABLE_QUEUES_V2,
VIRTCHNL_OP_DISABLE_QUEUES_V2 and VIRTCHNL_OP_MAP_QUEUE_VECTOR here.
Bigger RSS LUT support, later in the series, hooks them up, with the
get_q_vector callback of SR-IOV VFs, and adds the handler of
VIRTCHNL_OP_GET_MAX_RSS_QREGION, which is only allowlisted here.

Widen num_ring_{rx,tx} of struct ice_q_vector to u16, with the ring
counts in ice_vsi_map_rings_to_vectors(), which the PF uses too, as a
VF can map all its 256 queues to one vector.

If a VF wishes to request >16 queues it should first make sure that the
PF supports the VIRTCHNL_VF_LARGE_NUM_QPAIRS capability.

Thanks to Alex Loktionov for the message length validation.

Signed-off-by: Brett Creeley <brett.creeley@intel.com>
Signed-off-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Co-developed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v7:
 * cap the total count of queues of each type in the chunks of
   ENABLE_QUEUES_V2 and DISABLE_QUEUES_V2, overlapping chunks made PF
   repeat the work on the same queues many times (Sashiko)
 * accept only the itr_idx values of enum virtchnl_itr_idx in
   VIRTCHNL_OP_MAP_QUEUE_VECTOR, 2 was accepted (me)
 * widen the u8 ring counts in ice_vsi_map_rings_to_vectors() to u16,
   as num_ring_{rx,tx} (Sashiko)
 * thank Alex for the message length validation in place of his
   Co-developed-by tag with a "# msglen val" note, which checkpatch
   did not match with his Signed-off-by
 * commit message: the handlers get hooked up only later in the series;
   mention the u16 ring counts (me)

v5:
 * widen num_ring_{rx,tx} of struct ice_q_vector to u16, mapping all
   256 queues of a VF to one vector wrapped them around (Sashiko)

v4:
 * limit queue chunks to ICE_MAX_QS_PER_VF, the size of
   vf->{rx,tx}q_ena, as num_vf_qs could be set higher via
   sriov_vf_msix_count (Sashiko)
 * VIRTCHNL_OP_MAP_QUEUE_VECTOR: set ring->q_vector, num_ring_{rx,tx}
   and {rx,tx}.itr_idx, as VIRTCHNL_OP_CONFIG_IRQ_MAP does (Sashiko)
 * look up the VF VSI once per message, make ice_vc_ena_txq_chunk()
   void (Sashiko)

v3:
 * reject VIRTCHNL_OP_MAP_QUEUE_VECTOR entries with an out of range
   itr_idx (me)

v2:
 * fix error response in one case of ice_vc_map_q_vector_msg() (Alex)
 * use ice_get_vf_vsi() instead of plain array access (Sashiko)
 * return VIRTCHNL_STATUS_ERR_PARAM on error (Sashiko)
 * commit message: GET_MAX_RSS_QREGION is handled only later
---
 drivers/net/ethernet/intel/ice/ice.h          |   4 +-
 drivers/net/ethernet/intel/ice/ice_vf_lib.h   |   1 +
 drivers/net/ethernet/intel/ice/virt/queues.h  |   3 +
 drivers/net/ethernet/intel/ice/ice_base.c     |   8 +-
 .../net/ethernet/intel/ice/virt/allowlist.c   |   8 +
 drivers/net/ethernet/intel/ice/virt/queues.c  | 349 ++++++++++++++++++
 6 files changed, 366 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index d28ff576a342..4de947165a08 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -474,8 +474,8 @@ struct ice_q_vector {
 
 	u16 v_idx;			/* index in the vsi->q_vector array. */
 	u16 reg_idx;			/* PF relative register index */
-	u8 num_ring_rx;			/* total number of Rx rings in vector */
-	u8 num_ring_tx;			/* total number of Tx rings in vector */
+	u16 num_ring_rx;		/* total number of Rx rings in vector */
+	u16 num_ring_tx;		/* total number of Tx rings in vector */
 	u8 wb_on_itr:1;			/* if true, WB on ITR is enabled */
 	/* in usecs, need to use ice_intrl_to_usecs_reg() before writing this
 	 * value to the device
diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.h b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
index a9e95c85bc98..396dfb2b2d97 100644
--- a/drivers/net/ethernet/intel/ice/ice_vf_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
@@ -125,6 +125,7 @@ struct ice_vf_ops {
 	void (*clear_reset_trigger)(struct ice_vf *vf);
 	void (*irq_close)(struct ice_vf *vf);
 	void (*post_vsi_rebuild)(struct ice_vf *vf);
+	struct ice_q_vector *(*get_q_vector)(struct ice_vsi *vsi, u16 vec_id);
 };
 
 /* Virtchnl/SR-IOV config info */
diff --git a/drivers/net/ethernet/intel/ice/virt/queues.h b/drivers/net/ethernet/intel/ice/virt/queues.h
index c4a792cecea1..223f609dd4f3 100644
--- a/drivers/net/ethernet/intel/ice/virt/queues.h
+++ b/drivers/net/ethernet/intel/ice/virt/queues.h
@@ -16,5 +16,8 @@ int ice_vc_cfg_q_bw(struct ice_vf *vf, u8 *msg);
 int ice_vc_cfg_q_quanta(struct ice_vf *vf, u8 *msg);
 int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg);
 int ice_vc_request_qs_msg(struct ice_vf *vf, u8 *msg);
+int ice_vc_ena_qs_v2_msg(struct ice_vf *vf, u8 *msg, u16 msglen);
+int ice_vc_dis_qs_v2_msg(struct ice_vf *vf, u8 *msg, u16 msglen);
+int ice_vc_map_q_vector_msg(struct ice_vf *vf, u8 *msg, u16 msglen);
 
 #endif /* _ICE_VIRT_QUEUES_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice_base.c b/drivers/net/ethernet/intel/ice/ice_base.c
index f65634e3d44e..2d58a92f2942 100644
--- a/drivers/net/ethernet/intel/ice/ice_base.c
+++ b/drivers/net/ethernet/intel/ice/ice_base.c
@@ -935,12 +935,11 @@ void ice_vsi_map_rings_to_vectors(struct ice_vsi *vsi)
 
 	for (v_id = 0; v_id < q_vectors; v_id++) {
 		struct ice_q_vector *q_vector = vsi->q_vectors[v_id];
-		u8 tx_rings_per_v, rx_rings_per_v;
+		u16 tx_rings_per_v, rx_rings_per_v;
 		u16 q_id, q_base;
 
 		/* Tx rings mapping to vector */
-		tx_rings_per_v = (u8)DIV_ROUND_UP(tx_rings_rem,
-						  q_vectors - v_id);
+		tx_rings_per_v = DIV_ROUND_UP(tx_rings_rem, q_vectors - v_id);
 		q_vector->num_ring_tx = tx_rings_per_v;
 		q_vector->tx.tx_ring = NULL;
 		q_vector->tx.itr_idx = ICE_TX_ITR;
@@ -956,8 +955,7 @@ void ice_vsi_map_rings_to_vectors(struct ice_vsi *vsi)
 		tx_rings_rem -= tx_rings_per_v;
 
 		/* Rx rings mapping to vector */
-		rx_rings_per_v = (u8)DIV_ROUND_UP(rx_rings_rem,
-						  q_vectors - v_id);
+		rx_rings_per_v = DIV_ROUND_UP(rx_rings_rem, q_vectors - v_id);
 		q_vector->num_ring_rx = rx_rings_per_v;
 		q_vector->rx.rx_ring = NULL;
 		q_vector->rx.itr_idx = ICE_RX_ITR;
diff --git a/drivers/net/ethernet/intel/ice/virt/allowlist.c b/drivers/net/ethernet/intel/ice/virt/allowlist.c
index a07efec19c45..ef769b843c6f 100644
--- a/drivers/net/ethernet/intel/ice/virt/allowlist.c
+++ b/drivers/net/ethernet/intel/ice/virt/allowlist.c
@@ -95,6 +95,13 @@ static const u32 tc_allowlist_opcodes[] = {
 	VIRTCHNL_OP_CONFIG_QUANTA,
 };
 
+static const u32 large_num_qpairs_allowlist_opcodes[] = {
+	VIRTCHNL_OP_GET_MAX_RSS_QREGION,
+	VIRTCHNL_OP_ENABLE_QUEUES_V2,
+	VIRTCHNL_OP_DISABLE_QUEUES_V2,
+	VIRTCHNL_OP_MAP_QUEUE_VECTOR,
+};
+
 struct allowlist_opcode_info {
 	const u32 *opcodes;
 	size_t size;
@@ -117,6 +124,7 @@ static const struct allowlist_opcode_info allowlist_opcodes[] = {
 	ALLOW_ITEM(VIRTCHNL_VF_OFFLOAD_VLAN_V2, vlan_v2_allowlist_opcodes),
 	ALLOW_ITEM(VIRTCHNL_VF_OFFLOAD_QOS, tc_allowlist_opcodes),
 	ALLOW_ITEM(VIRTCHNL_VF_CAP_PTP, ptp_allowlist_opcodes),
+	ALLOW_ITEM(VIRTCHNL_VF_LARGE_NUM_QPAIRS, large_num_qpairs_allowlist_opcodes),
 };
 
 /**
diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
index a8a2f5e5b322..e8635236cb6c 100644
--- a/drivers/net/ethernet/intel/ice/virt/queues.c
+++ b/drivers/net/ethernet/intel/ice/virt/queues.c
@@ -1046,3 +1046,352 @@ int ice_vc_request_qs_msg(struct ice_vf *vf, u8 *msg)
 				     v_ret, (u8 *)vfres, sizeof(*vfres));
 }
 
+static bool ice_vc_supported_queue_type(s32 queue_type)
+{
+	return queue_type == VIRTCHNL_QUEUE_TYPE_RX ||
+	       queue_type == VIRTCHNL_QUEUE_TYPE_TX;
+}
+
+/**
+ * ice_vc_validate_qs_v2_msg - validate all qs_msg parameters
+ * @vf: VF the message was received from
+ * @qs_msg: contents of the message from the VF
+ * @msglen: length of @qs_msg
+ *
+ * Used to validate both the VIRTCHNL_OP_ENABLE_QUEUES_V2 and
+ * VIRTCHNL_OP_DISABLE_QUEUES_V2 messages. This should always be called before
+ * attempting to enable and/or disable queues on behalf of a VF in response to
+ * the previously mentioned opcodes.
+ *
+ * Return: If all checks succeed, then return true. Otherwise return
+ *         false, indicating to the caller that the qs_msg is invalid.
+ */
+static bool ice_vc_validate_qs_v2_msg(struct ice_vf *vf,
+				      struct virtchnl_del_ena_dis_queues *qs_msg,
+				      u16 msglen)
+{
+	u32 max_qs = min_t(u32, vf->num_vf_qs, ICE_MAX_QS_PER_VF);
+	u32 num_rxq = 0, num_txq = 0;
+
+	if (msglen < virtchnl_struct_size(qs_msg, chunks, 0))
+		return false;
+
+	if (msglen < virtchnl_struct_size(qs_msg, chunks, qs_msg->num_chunks))
+		return false;
+
+	if (!qs_msg->num_chunks)
+		return false;
+
+	if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states))
+		return false;
+
+	if (!ice_vc_isvalid_vsi_id(vf, qs_msg->vport_id))
+		return false;
+
+	for (int i = 0; i < qs_msg->num_chunks; i++) {
+		struct virtchnl_queue_chunk *chunk = &qs_msg->chunks[i];
+		u32 end;
+
+		if (!ice_vc_supported_queue_type(chunk->type))
+			return false;
+
+		if (!chunk->num_queues)
+			return false;
+
+		end = chunk->start_queue_id + chunk->num_queues;
+		if (end > max_qs)
+			return false;
+
+		/* chunks may overlap, cap the total work */
+		if (chunk->type == VIRTCHNL_QUEUE_TYPE_RX)
+			num_rxq += chunk->num_queues;
+		else
+			num_txq += chunk->num_queues;
+		if (num_rxq > max_qs || num_txq > max_qs)
+			return false;
+	}
+
+	return true;
+}
+
+#define ice_for_each_q_in_chunk(chunk, q_id) \
+	for ((q_id) = (chunk)->start_queue_id; \
+	     (q_id) < (chunk)->start_queue_id + (chunk)->num_queues; \
+	     (q_id)++)
+
+static int
+ice_vc_ena_rxq_chunk(struct ice_vf *vf, struct ice_vsi *vsi,
+		     struct virtchnl_queue_chunk *chunk)
+{
+	u32 vf_qid;
+
+	ice_for_each_q_in_chunk(chunk, vf_qid) {
+		int err;
+
+		err = ice_vf_vsi_ena_single_rxq(vf, vsi, vf_qid);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static void
+ice_vc_ena_txq_chunk(struct ice_vf *vf, struct ice_vsi *vsi,
+		     struct virtchnl_queue_chunk *chunk)
+{
+	u32 vf_qid;
+
+	ice_for_each_q_in_chunk(chunk, vf_qid)
+		ice_vf_vsi_ena_single_txq(vf, vsi, vf_qid);
+}
+
+/**
+ * ice_vc_ena_qs_v2_msg - message handling for VIRTCHNL_OP_ENABLE_QUEUES_V2
+ * @vf: source of the request
+ * @msg: message to handle
+ * @msglen: length of the @msg
+ *
+ * Return: 0 on success or negative on error.
+ */
+int ice_vc_ena_qs_v2_msg(struct ice_vf *vf, u8 *msg, u16 msglen)
+{
+	struct virtchnl_del_ena_dis_queues *ena_qs_msg =
+			(struct virtchnl_del_ena_dis_queues *)msg;
+	enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_ERR_PARAM;
+	struct ice_vsi *vsi;
+
+	if (!ice_vc_validate_qs_v2_msg(vf, ena_qs_msg, msglen))
+		goto error_param;
+
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi)
+		goto error_param;
+
+	for (int i = 0; i < ena_qs_msg->num_chunks; i++) {
+		struct virtchnl_queue_chunk *chunk = &ena_qs_msg->chunks[i];
+
+		if (chunk->type == VIRTCHNL_QUEUE_TYPE_RX &&
+		    ice_vc_ena_rxq_chunk(vf, vsi, chunk))
+			goto error_param;
+		else if (chunk->type == VIRTCHNL_QUEUE_TYPE_TX)
+			ice_vc_ena_txq_chunk(vf, vsi, chunk);
+	}
+
+	v_ret = VIRTCHNL_STATUS_SUCCESS;
+	set_bit(ICE_VF_STATE_QS_ENA, vf->vf_states);
+
+error_param:
+	return ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_ENABLE_QUEUES_V2,
+				     v_ret, NULL, 0);
+}
+
+static int
+ice_vc_dis_rxq_chunk(struct ice_vf *vf, struct ice_vsi *vsi,
+		     struct virtchnl_queue_chunk *chunk)
+{
+	u32 vf_qid;
+
+	ice_for_each_q_in_chunk(chunk, vf_qid) {
+		int err;
+
+		err = ice_vf_vsi_dis_single_rxq(vf, vsi, vf_qid);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int
+ice_vc_dis_txq_chunk(struct ice_vf *vf, struct ice_vsi *vsi,
+		     struct virtchnl_queue_chunk *chunk)
+{
+	u32 vf_qid;
+
+	ice_for_each_q_in_chunk(chunk, vf_qid) {
+		int err;
+
+		err = ice_vf_vsi_dis_single_txq(vf, vsi, vf_qid);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/**
+ * ice_vc_dis_qs_v2_msg - message handling for VIRTCHNL_OP_DISABLE_QUEUES_V2
+ * @vf: source of the request
+ * @msg: message to handle
+ * @msglen: length of @msg
+ *
+ * Return: 0 on success or negative on error.
+ */
+int ice_vc_dis_qs_v2_msg(struct ice_vf *vf, u8 *msg, u16 msglen)
+{
+	struct virtchnl_del_ena_dis_queues *dis_qs_msg =
+			(struct virtchnl_del_ena_dis_queues *)msg;
+	enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_ERR_PARAM;
+	struct ice_vsi *vsi;
+
+	if (!ice_vc_validate_qs_v2_msg(vf, dis_qs_msg, msglen))
+		goto error_param;
+
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi)
+		goto error_param;
+
+	for (int i = 0; i < dis_qs_msg->num_chunks; i++) {
+		struct virtchnl_queue_chunk *chunk = &dis_qs_msg->chunks[i];
+
+		if (chunk->type == VIRTCHNL_QUEUE_TYPE_RX &&
+		    ice_vc_dis_rxq_chunk(vf, vsi, chunk))
+			goto error_param;
+		else if (chunk->type == VIRTCHNL_QUEUE_TYPE_TX &&
+			 ice_vc_dis_txq_chunk(vf, vsi, chunk))
+			goto error_param;
+	}
+
+	v_ret = VIRTCHNL_STATUS_SUCCESS;
+	if (ice_vf_has_no_qs_ena(vf))
+		clear_bit(ICE_VF_STATE_QS_ENA, vf->vf_states);
+
+error_param:
+	return ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_DISABLE_QUEUES_V2,
+				     v_ret, NULL, 0);
+}
+
+/**
+ * ice_vc_validate_qv_maps - validate parameters sent in the qs_msg structure
+ * @vf: VF the message was received from
+ * @qv_maps: contents of the message from the VF
+ * @msglen: length of the @qv_maps
+ *
+ * Used to validate VIRTCHNL_OP_MAP_QUEUE_VECTOR messages. This should always
+ * be called before attempting map interrupts to queues. If all checks succeed,
+ * then return success indicating to the caller that the qv_maps are valid.
+ * Otherwise return false, indicating to the caller that the qv_maps are
+ * invalid.
+ *
+ * Return: true if parameters are valid, false otherwise.
+ */
+static bool ice_vc_validate_qv_maps(struct ice_vf *vf,
+				    struct virtchnl_queue_vector_maps *qv_maps,
+				    u16 msglen)
+{
+	struct ice_vsi *vsi;
+	int total_vectors;
+
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi)
+		return false;
+
+	if (msglen < virtchnl_struct_size(qv_maps, qv_maps, 0))
+		return false;
+
+	if (msglen < virtchnl_struct_size(qv_maps, qv_maps, qv_maps->num_qv_maps))
+		return false;
+
+	if (!qv_maps->num_qv_maps)
+		return false;
+
+	if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states))
+		return false;
+
+	if (!ice_vc_isvalid_vsi_id(vf, qv_maps->vport_id))
+		return false;
+
+	total_vectors = vsi->num_q_vectors + ICE_NONQ_VECS_VF;
+
+	for (int i = 0; i < qv_maps->num_qv_maps; i++) {
+		if (!ice_vc_supported_queue_type(qv_maps->qv_maps[i].queue_type))
+			return false;
+
+		if (qv_maps->qv_maps[i].queue_id >= vf->num_vf_qs)
+			return false;
+
+		if (qv_maps->qv_maps[i].vector_id >= total_vectors ||
+		    qv_maps->qv_maps[i].vector_id < ICE_NONQ_VECS_VF)
+			return false;
+
+		if (qv_maps->qv_maps[i].itr_idx != VIRTCHNL_ITR_IDX_0 &&
+		    qv_maps->qv_maps[i].itr_idx != VIRTCHNL_ITR_IDX_1 &&
+		    qv_maps->qv_maps[i].itr_idx != VIRTCHNL_ITR_IDX_NO_ITR)
+			return false;
+	}
+
+	return true;
+}
+
+/**
+ * ice_vc_map_q_vector_msg - message handling for VIRTCHNL_OP_MAP_QUEUE_VECTOR
+ * @vf: source of the request
+ * @msg: message to handle
+ * @msglen: length of @msg
+ *
+ * Return: 0 on success or negative on error
+ */
+int ice_vc_map_q_vector_msg(struct ice_vf *vf, u8 *msg, u16 msglen)
+{
+	enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_ERR_PARAM;
+	struct virtchnl_queue_vector_maps *qv_maps;
+	struct ice_vsi *vsi;
+
+	qv_maps = (struct virtchnl_queue_vector_maps *)msg;
+
+	if (!ice_vc_validate_qv_maps(vf, qv_maps, msglen))
+		goto error_param;
+
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi)
+		goto error_param;
+
+	for (int i = 0; i < qv_maps->num_qv_maps; i++) {
+		struct virtchnl_queue_vector *qv_map = &qv_maps->qv_maps[i];
+		struct ice_q_vector *q_vector;
+		u16 vector_id;
+		int vsi_q_id;
+
+		vsi_q_id = qv_map->queue_id;
+		vector_id = qv_map->vector_id;
+
+		q_vector = vf->vf_ops->get_q_vector(vsi, vector_id);
+		if (!q_vector)
+			goto error_param;
+
+		if (!ice_vc_isvalid_q_id(vsi, vsi_q_id))
+			goto error_param;
+
+		/* keep SW state in sync with HW, as ice_cfg_interrupt() does */
+		if (qv_map->queue_type == VIRTCHNL_QUEUE_TYPE_RX) {
+			struct ice_rx_ring *ring = vsi->rx_rings[vsi_q_id];
+
+			if (ring->q_vector && ring->q_vector->num_ring_rx)
+				ring->q_vector->num_ring_rx--;
+			ring->q_vector = q_vector;
+			q_vector->num_ring_rx++;
+			q_vector->rx.itr_idx = qv_map->itr_idx;
+			ice_cfg_rxq_interrupt(vsi, vsi_q_id,
+					      q_vector->vf_reg_idx,
+					      qv_map->itr_idx);
+		} else if (qv_map->queue_type == VIRTCHNL_QUEUE_TYPE_TX) {
+			struct ice_tx_ring *ring = vsi->tx_rings[vsi_q_id];
+
+			if (ring->q_vector && ring->q_vector->num_ring_tx)
+				ring->q_vector->num_ring_tx--;
+			ring->q_vector = q_vector;
+			q_vector->num_ring_tx++;
+			q_vector->tx.itr_idx = qv_map->itr_idx;
+			ice_cfg_txq_interrupt(vsi, vsi_q_id,
+					      q_vector->vf_reg_idx,
+					      qv_map->itr_idx);
+		}
+	}
+
+	v_ret = VIRTCHNL_STATUS_SUCCESS;
+
+error_param:
+	return ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_MAP_QUEUE_VECTOR,
+				     v_ret, NULL, 0);
+}
-- 
2.51.1

