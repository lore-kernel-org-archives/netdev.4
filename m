Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696341;
	b=hw51cVNCnnBVNYOD66gTLr6GySg10eZ8WzHR7cNHUqlaBuHn4pH6b0no8DeWkNW1bpme
	 b3Dde2kp77do9go51oWXjlr49uWCnStZ4oxML0b9v8zJI4gBBUC/+NG6MV8JktpR7Ihh0
	 mAhf1BcRh/ue6st2Huo8GZ5pRF2EQU5Yk2BBMEibOg2SZnYYvEdvTpPX+XqdqsGxn3OjW
	 Q2abRLzM6HmIYmlHM8T6uO0qcQlvfLcn+CEuim2S89TzEkG5dLvbcNuxIOSPGLZV8SAS4
	 PxE4JcN++rbN+2abbImvIK2e7LHjonCxcAziM5rIo5L7fT4/8nTZqG+gBKS2r+1dvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696341;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=jYdprvKHgALhiZvOt2hidC2jQNK5vY2AQybH6B6LG4c=;
	b=2enAivQTT1shjGziVWqsABmnN6Xc31dO3JexYvi4PbAlndc7/kLHpt7KdpGu+Cmx/XPG
	 yk+5WNlLVjJBDUZo2nOIbIUdy7NL6EFcq2C317LAAOvlY2jYRVq8BzMoh0oIR4ucpXz8+
	 tlarkKxdj8y2JffNazvfhhJUEL4a1is1oT4fhVx1jF98nVOb707lGvNSAE0jvyMQaiVs6
	 f3GVWHJEgxXiYsIydUcZ2RFtjktlXnaT5MeSLcyaPPWjvr0fj9vQQ9SCfs6ezGBA3Quih
	 /prcNLhZKNkQfp4cDXyqerFaEsVpM8gXBrtGUUy8GbI0AUCWG7hPEXHecTjtPvmHyDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PsGQPCPH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2A9606A334
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F2A9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PsGQPCPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYdprvKHgALhiZvOt2hidC2jQNK5vY2AQybH6B6LG4c=;
	b=PsGQPCPHfnt7rMo0Rr3EfYXvlpg7OEOD2WK/t+xX205XDZ1SL46JezO7bYb+3x1rU6NDNH
	YmN6HGpMEHM8pNGWHeo5otbhBnDY9wb3CHdJFpUjyJnz7/lDeBm8za8YGNgcZq3h1U+zlL
	JRgByC7Gi0VSqQNyNW9RPaQuGjX6NgY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-s8z-D7hCPYmf1_JK3cIcHA-1; Thu,
 26 Nov 2026 12:32:15 +0000
X-MC-Unique: s8z-D7hCPYmf1_JK3cIcHA-1
X-Mimecast-MFC-AGG-ID: s8z-D7hCPYmf1_JK3cIcHA_1795696333
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2FEB18001FE;
	Thu, 26 Nov 2026 12:32:13 +0000 (UTC)
Received: from jramaseu-thinkpadt14gen5.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2FD7E3000229;
	Thu, 26 Nov 2026 12:32:10 +0000 (UTC)
From: Jakub Ramaseuski <jramaseu@redhat.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	Jakub Ramaseuski <jramaseu@redhat.com>
Subject: [PATCH iwl-next 3/3] ice: share all RSS hash profiles between PFs
Date: Thu, 26 Nov 2026 13:31:14 +0100
Message-ID: <20261126123114.893916-4-jramaseu@redhat.com>
In-Reply-To: <20261126123114.893916-1-jramaseu@redhat.com>
References: <20261126123114.893916-1-jramaseu@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The previous patch lets the PFs of a device share the profile IDs of the
default RSS configuration. RSS profiles added later still take an ID per
PF, even when the same profile exists on all PFs: with a VF on each of
8 PFs, the default RSS of the VF VSIs and the same "ethtool -N <vf>
rx-flow-hash" settings on all VFs take 4 more IDs per PF.

A profile ID depends only on the extraction sequence, everything else
(TCAM entries, VSI groups) is per PF. Share the ID of every RSS profile
added through the flow API: besides the defaults, the ones added by
ethtool, by VFs (advanced RSS and the AVF hash enable bits) and on replay.
As before, profiles using field masks or symmetric hashing, and raw
profiles, keep IDs of their own.

The shared flag of the RSS hash configuration is not needed any more,
remove it.

Measured on an E810-CQDA2 split to 8 PFs (NVM 4.30), with all PFs bound,
then one VF created on each PF and "rx-flow-hash {tcp,udp}{4,6} fn" set on
it, reading the IDs the PFs hold from firmware:

               IDs in use     IDs in use after   failed profile ID
               after probe    VFs and ethtool    allocations
  before       33             65                 0
  after        33             37                 0

Signed-off-by: Jakub Ramaseuski <jramaseu@redhat.com>
---
 drivers/net/ethernet/intel/ice/ice_flow.c | 49 +++++++----------------
 drivers/net/ethernet/intel/ice/ice_flow.h |  2 -
 drivers/net/ethernet/intel/ice/ice_lib.c  | 10 ++---
 3 files changed, 18 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_flow.c b/drivers/net/ethernet/intel/ice/ice_flow.c
index 9be769b105cca..02337d9d3de56 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.c
+++ b/drivers/net/ethernet/intel/ice/ice_flow.c
@@ -1444,7 +1444,6 @@ ice_flow_rem_entry_sync(struct ice_hw *hw, enum ice_block __always_unused blk,
  * @segs: array of one or more packet segments that describe the flow
  * @segs_cnt: number of packet segments provided
  * @symm: symmetric setting for RSS profiles
- * @shared: the HW profile may be shared with other PFs
  * @prof: stores the returned flow profile added
  *
  * Assumption: the caller has acquired the lock to the profile list
@@ -1453,7 +1452,7 @@ static int
 ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 		       enum ice_flow_dir dir,
 		       struct ice_flow_seg_info *segs, u8 segs_cnt,
-		       bool symm, bool shared, struct ice_flow_prof **prof)
+		       bool symm, struct ice_flow_prof **prof)
 {
 	struct ice_flow_prof_params *params;
 	struct ice_prof_id *ids;
@@ -1490,7 +1489,6 @@ ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 	params->prof->dir = dir;
 	params->prof->segs_cnt = segs_cnt;
 	params->prof->symm = symm;
-	params->prof->shared = shared;
 
 	/* Make a copy of the segments that need to be persistent in the flow
 	 * profile instance
@@ -1504,11 +1502,14 @@ ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 		goto out;
 	}
 
-	/* Add a HW profile for this flow profile */
+	/* Add a HW profile for this flow profile. An RSS profile without
+	 * field masks and symmetric hashing may share its ID with the other
+	 * PFs, see ice_prof_can_share().
+	 */
 	status = ice_add_prof(hw, blk, prof_id, params->ptypes,
 			      params->attr, params->attr_cnt, params->es,
 			      params->mask, symm,
-			      ICE_PROF_FD_SWAP | (shared ? ICE_PROF_SHARED : 0));
+			      ICE_PROF_FD_SWAP | ICE_PROF_SHARED);
 	if (status) {
 		ice_debug(hw, ICE_DBG_FLOW, "Error adding a HW flow profile\n");
 		goto out;
@@ -1716,23 +1717,21 @@ ice_flow_set_parser_prof(struct ice_hw *hw, u16 dest_vsi, u16 fdir_vsi,
 }
 
 /**
- * __ice_flow_add_prof - Add a flow profile for packet segments and fields
+ * ice_flow_add_prof - Add a flow profile for packet segments and matched fields
  * @hw: pointer to the HW struct
  * @blk: classification stage
  * @dir: flow direction
  * @segs: array of one or more packet segments that describe the flow
  * @segs_cnt: number of packet segments provided
  * @symm: symmetric setting for RSS profiles
- * @shared: the HW profile may be shared with other PFs
  * @prof: stores the returned flow profile added
  *
  * Return: 0 on success, negative error code otherwise.
  */
-static int
-__ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk,
-		    enum ice_flow_dir dir, struct ice_flow_seg_info *segs,
-		    u8 segs_cnt, bool symm, bool shared,
-		    struct ice_flow_prof **prof)
+int
+ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
+		  struct ice_flow_seg_info *segs, u8 segs_cnt,
+		  bool symm, struct ice_flow_prof **prof)
 {
 	int status;
 
@@ -1752,7 +1751,7 @@ __ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk,
 	mutex_lock(&hw->fl_profs_locks[blk]);
 
 	status = ice_flow_add_prof_sync(hw, blk, dir, segs, segs_cnt,
-					symm, shared, prof);
+					symm, prof);
 	if (!status)
 		list_add(&(*prof)->l_entry, &hw->fl_profs[blk]);
 
@@ -1761,25 +1760,6 @@ __ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk,
 	return status;
 }
 
-/**
- * ice_flow_add_prof - Add a flow profile for packet segments and matched fields
- * @hw: pointer to the HW struct
- * @blk: classification stage
- * @dir: flow direction
- * @segs: array of one or more packet segments that describe the flow
- * @segs_cnt: number of packet segments provided
- * @symm: symmetric setting for RSS profiles
- * @prof: stores the returned flow profile added
- */
-int
-ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
-		  struct ice_flow_seg_info *segs, u8 segs_cnt,
-		  bool symm, struct ice_flow_prof **prof)
-{
-	return __ice_flow_add_prof(hw, blk, dir, segs, segs_cnt, symm, false,
-				   prof);
-}
-
 /**
  * ice_flow_rem_prof - Remove a flow profile and all entries associated with it
  * @hw: pointer to the HW struct
@@ -2300,7 +2280,6 @@ ice_add_rss_list(struct ice_hw *hw, u16 vsi_handle, struct ice_flow_prof *prof)
 	rss_cfg->hash.addl_hdrs = prof->segs[prof->segs_cnt - 1].hdrs;
 	rss_cfg->hash.hdr_type = hdr_type;
 	rss_cfg->hash.symm = prof->symm;
-	rss_cfg->hash.shared = prof->shared;
 	set_bit(vsi_handle, rss_cfg->vsis);
 
 	list_add_tail(&rss_cfg->l_entry, &hw->rss_list_head);
@@ -2645,8 +2624,8 @@ ice_add_rss_cfg_sync(struct ice_hw *hw, u16 vsi_handle,
 	}
 
 	/* Create a new flow profile with packet segment information. */
-	status = __ice_flow_add_prof(hw, blk, ICE_FLOW_RX, segs, segs_cnt,
-				     cfg->symm, cfg->shared, &prof);
+	status = ice_flow_add_prof(hw, blk, ICE_FLOW_RX,
+				   segs, segs_cnt, cfg->symm, &prof);
 	if (status)
 		goto exit;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_flow.h b/drivers/net/ethernet/intel/ice/ice_flow.h
index 97de59776cdd4..6c6cdc8addb12 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.h
+++ b/drivers/net/ethernet/intel/ice/ice_flow.h
@@ -383,7 +383,6 @@ struct ice_rss_hash_cfg {
 	u64 hash_flds; /* hash bit field (ICE_FLOW_HASH_*) to configure */
 	enum ice_rss_cfg_hdr_type hdr_type; /* to specify inner or outer */
 	bool symm; /* symmetric or asymmetric hash */
-	bool shared; /* may share the HW profile with other PFs */
 };
 
 enum ice_flow_dir {
@@ -483,7 +482,6 @@ struct ice_flow_prof {
 	DECLARE_BITMAP(vsis, ICE_MAX_VSI);
 
 	bool symm; /* Symmetric Hash for RSS */
-	bool shared; /* HW profile may be shared with other PFs */
 };
 
 struct ice_rss_raw_cfg {
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index d2e1dc102ce35..f3fefab09f8c1 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -1778,15 +1778,13 @@ static void ice_vsi_set_rss_flow_fld(struct ice_vsi *vsi)
 		return;
 	}
 	for (i = 0; i < ARRAY_SIZE(default_rss_cfgs); i++) {
-		struct ice_rss_hash_cfg cfg = default_rss_cfgs[i];
+		const struct ice_rss_hash_cfg *cfg = &default_rss_cfgs[i];
 
-		/* the defaults are the same on all PFs, share their profiles */
-		cfg.shared = true;
-		status = ice_add_rss_cfg(hw, vsi, &cfg);
+		status = ice_add_rss_cfg(hw, vsi, cfg);
 		if (status)
 			dev_dbg(dev, "ice_add_rss_cfg failed, addl_hdrs = %x, hash_flds = %llx, hdr_type = %d, symm = %d\n",
-				cfg.addl_hdrs, cfg.hash_flds,
-				cfg.hdr_type, cfg.symm);
+				cfg->addl_hdrs, cfg->hash_flds,
+				cfg->hdr_type, cfg->symm);
 	}
 }
 
-- 
2.56.0

