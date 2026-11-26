Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696312;
	b=FFx4bWD4Xe5EbnYKMrGV8CHemRBh72CqB19fOOBpWQXuoVlxscHtzm/TzHWAbXJvRDlp
	 kwGSwlfk5/o9VX/p0McbYAm46Qp6xjkrg+rVUnw9epIiiFXT548jhQ1NErG7Pc4DxR46e
	 G/IZBTL6TAMtzUR+TLYJCyytWZvvJpA1TaFt6rDbA94/t2Ey7K4LRJd2+gCT2c/37BWqX
	 jUHvg3WoY09WcnVuq7985NztEu3UaDsH57OU6PlUgldhhAAqDRN+lYU7yr048guaQ2rRx
	 IBFIM2Zu5baV4VhyfBHmx13xmDjX6tliUGJvTepVC1ucA164E521GTIrjrKFab/eEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696312;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=4ewLyVk5V/SeylMai32lGrnGfZl5ch3uPwgm8/P5uWQ=;
	b=t2ZrfWI7c5NqT/BVKw37NvYDvgGXRyXbRdU3kS1rASFaUbHT+yaiCUrG7YMci6vGKNMY
	 nFqwwDwXvQQ/Sq7gv9UOQU8v7EbSSMZTavn9mUrLgF+6FKMlbKcJXSaVA9rOlFNfkLskX
	 08R7zQ3rtC8U1jxvU0Ys2/jjMGEFbZJoRF9XCLxZxFUBu7kxInVL2WzmvL5VWIYDxdBCZ
	 hWhv5sfml1WzHzJHlZ/7ED/fQi8wvvAVQQQk/abcdpi7nbGkuHyGDi50OH71WjfiayRMp
	 bUKl6gha42VCwX7TUClQ+l5LHRlpNByxlilscLzkGQawXjWKKQUGQSLu9ODyXniffAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FwJ6Fako;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3C606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D3C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FwJ6Fako
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ewLyVk5V/SeylMai32lGrnGfZl5ch3uPwgm8/P5uWQ=;
	b=FwJ6FakofxQUccuv/Fj4BFbcPBwH+6MkUDCBgCykWJsV0OGKiDqq8BzyiDpXTuGBQCYT24
	NYUhjpBck/h+vZH1lqJHLIZi7KafBbMvdNl/j9al/pnGvnQg3uiYGxlTQrqRx2GRylBoLw
	aTvvxosSrX3SV6Zayd4Rl+lRor7vBCE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-ec_oTWUvOI6cgEzxDp0kxw-1; Thu,
 26 Nov 2026 12:31:48 +0000
X-MC-Unique: ec_oTWUvOI6cgEzxDp0kxw-1
X-Mimecast-MFC-AGG-ID: ec_oTWUvOI6cgEzxDp0kxw_1795696306
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8586180059B;
	Thu, 26 Nov 2026 12:31:46 +0000 (UTC)
Received: from jramaseu-thinkpadt14gen5.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D6CC3000229;
	Thu, 26 Nov 2026 12:31:43 +0000 (UTC)
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
Subject: [PATCH iwl-next 2/3] ice: share default RSS hash profiles between PFs
Date: Thu, 26 Nov 2026 13:31:13 +0100
Message-ID: <20261126123114.893916-3-jramaseu@redhat.com>
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

RSS hash profile IDs are a firmware resource of the whole device: the DDP
package defines 128 of them, of which IDs 2-127 can be used by the PFs.
Each PF allocates its own IDs, and since
commit a6d63bbf2c52 ("ice: Implement RSS settings for GTP using ethtool")
its default RSS configuration takes 19 of them. On devices with 8 PFs,
like the E830-XXVDA8F, that is 152 IDs: the PFs probed last lose part
or all of their default RSS configuration, and RSS configurations requested
later, e.g. by VFs, fail:

  ice 0000:6c:00.0: ice_add_rss_cfg failed for VF 0, VSI 2, error:-5

The default configuration is the same on all PFs, and so are the profiles
it needs. The package, for E810 and E830 alike, defines the RSS profile
IDs as shared resources: firmware lets a PF allocate an ID another PF
holds, by allocating that index without ICE_AQC_RES_TYPE_FLAG_IGNORE_INDEX,
keeps the ID until its last user frees it, and a PF reset releases the IDs
of that PF. What firmware does not provide is a lookup of the ID
programmed with an extraction sequence.

Keep a list of the profile IDs shared by the PFs in struct ice_adapter,
keyed by extraction sequence. When a PF needs an ID for a default profile,
it joins the ID another PF uses for the same extraction sequence, or
allocates a new one and adds it to the list. Each PF takes and releases
its own firmware reference, through its own admin queue, when its
reference count of the profile goes from 0 to 1 and from 1 to 0; the PFs
never access the tables of each other.

Only profiles using neither field masks nor symmetric hashing are shared:
the GLQF_HMASK registers are split between the PFs, and GLQF_HSYMM is
programmed by every user of a profile. Such profiles, including the two
GTP-U ones hashing on the QFI field, keep one ID per PF. Raw (parser)
profiles program GLQF_HSYMM on their own and never use a shared ID.

A PF leaves the list on reset, devlink reload and remove, as firmware
releases its IDs then. CORER, GLOBR and EMPR empty the list: each PF
empties it while preparing for the reset, before it can allocate IDs
again, so no PF joins an ID the reset freed. A PF that prepares late
may drop entries a faster PF made after its rebuild; their IDs stay
valid and are freed as usual, only not shared. An ID firmware hands out
as a new one drops a stale entry for it. Sharing is off when an
ice_adapter can cover more than one device (E825C, devices without a
serial number).

While at it, replace the fd_swap parameter of ice_add_prof() with flags.

Measured on an E810-CQDA2 split to 8 PFs (NVM 4.30), with all PFs bound,
then one VF created on each PF and "rx-flow-hash {tcp,udp}{4,6} fn" set on
it, reading the IDs the PFs hold from firmware:

               IDs in use     IDs in use after   failed profile ID
               after probe    VFs and ethtool    allocations
  before       126            126                70 (30 at probe)
  after        33             65                 0

Also checked on an E830-XXVDA8F (8 PFs) with a RHEL 9.6 backport: one VF
per PF and "rx-flow-hash {tcp,udp}{4,6} fn" on each, all 32 input set
changes succeed with no ice errors.

Fixes: a6d63bbf2c52 ("ice: Implement RSS settings for GTP using ethtool")
Signed-off-by: Jakub Ramaseuski <jramaseu@redhat.com>
---
 .../net/ethernet/intel/ice/devlink/devlink.c  |   2 +
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  13 +
 drivers/net/ethernet/intel/ice/ice_adapter.h  |   7 +
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |   2 +-
 .../net/ethernet/intel/ice/ice_flex_pipe.c    | 351 +++++++++++++++++-
 .../net/ethernet/intel/ice/ice_flex_pipe.h    |   9 +-
 .../net/ethernet/intel/ice/ice_flex_type.h    |   1 +
 drivers/net/ethernet/intel/ice/ice_flow.c     |  51 ++-
 drivers/net/ethernet/intel/ice/ice_flow.h     |   2 +
 drivers/net/ethernet/intel/ice/ice_lib.c      |  10 +-
 drivers/net/ethernet/intel/ice/ice_main.c     |   5 +
 drivers/net/ethernet/intel/ice/virt/rss.c     |   2 +-
 12 files changed, 427 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/devlink/devlink.c b/drivers/net/ethernet/intel/ice/devlink/devlink.c
index 9851e6140a944..aba28e33eac58 100644
--- a/drivers/net/ethernet/intel/ice/devlink/devlink.c
+++ b/drivers/net/ethernet/intel/ice/devlink/devlink.c
@@ -460,6 +460,7 @@ static void ice_devlink_reinit_down(struct ice_pf *pf)
 	ice_vsi_decfg(ice_get_main_vsi(pf));
 	rtnl_unlock();
 	ice_deinit_pf(pf);
+	ice_put_shared_profs(&pf->hw);
 	ice_deinit_hw(&pf->hw);
 	ice_deinit_dev(pf);
 }
@@ -1326,6 +1327,7 @@ static int ice_devlink_reinit_up(struct ice_pf *pf)
 unroll_dev_init:
 	need_dev_deinit = true;
 unroll_hw_init:
+	ice_put_shared_profs(&pf->hw);
 	ice_deinit_hw(&pf->hw);
 	if (need_dev_deinit)
 		ice_deinit_dev(pf);
diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.c b/drivers/net/ethernet/intel/ice/ice_adapter.c
index eecad97c084d9..ea21c83155d81 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.c
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.c
@@ -53,7 +53,9 @@ static int ice_adapter_init(void *priv, void *init_param)
 {
 	const struct ice_hw *hw = init_param;
 	struct ice_adapter *adapter = priv;
+	struct ice_pf *pf = hw->back;
 	struct devlink *devlink;
+	u64 index;
 
 	devlink = shd_priv_to_devlink(adapter);
 	adapter->devlink = devlink;
@@ -84,6 +86,15 @@ static int ice_adapter_init(void *priv, void *init_param)
 
 	adapter->phc.use_timecounter = ice_adapter_use_timecounter(hw);
 
+	mutex_init(&adapter->rss_prof_lock);
+	INIT_LIST_HEAD(&adapter->rss_profs);
+	/* RSS hash profile IDs come from the firmware of a single device.
+	 * The NACs of E825C, and devices without a serial number,
+	 * may share one ice_adapter, but not the profile IDs.
+	 */
+	index = ice_adapter_index(pf->pdev);
+	adapter->rss_prof_share = index && !(index & ICE_ADAPTER_FIXED_INDEX);
+
 	return init_srcu_struct(&adapter->ports.srcu);
 }
 
@@ -92,10 +103,12 @@ static void ice_adapter_fini(void *priv)
 	struct ice_adapter *adapter = priv;
 
 	WARN_ON(!list_empty(&adapter->ports.list));
+	WARN_ON(!list_empty(&adapter->rss_profs));
 	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
 		mutex_destroy(&adapter->cpi_phy_lock[i]);
 	mutex_destroy(&adapter->cgu_synce_lock);
 	mutex_destroy(&adapter->rebuild_lock);
+	mutex_destroy(&adapter->rss_prof_lock);
 
 	cleanup_srcu_struct(&adapter->ports.srcu);
 	mutex_destroy(&adapter->ps_lock);
diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.h b/drivers/net/ethernet/intel/ice/ice_adapter.h
index 3778948730ef7..6e2d8b33ce71e 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.h
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.h
@@ -101,6 +101,9 @@ struct ice_phc {
  * @ctrl_pf: Control PF of the adapter
  * @rebuild_lock: serialize PFR recovery across PFs of the same adapter
  * @ports: Ports list
+ * @rss_prof_lock: Mutex protecting @rss_profs
+ * @rss_profs: RSS hash profile IDs shared by the PFs, see ice_flex_pipe.c
+ * @rss_prof_share: The PFs may share RSS hash profile IDs
  */
 struct ice_adapter {
 	struct devlink *devlink;
@@ -124,6 +127,10 @@ struct ice_adapter {
 	struct rw_semaphore ctrl_pf_lock;
 	struct ice_pf __rcu *ctrl_pf;
 	struct ice_port_list ports;
+	/* For access to the list of shared RSS hash profiles */
+	struct mutex rss_prof_lock;
+	struct list_head rss_profs;
+	bool rss_prof_share;
 };
 
 struct ice_adapter *ice_adapter_get(struct pci_dev *pdev);
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
index 4a5e2043447f1..ceba419233a70 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
@@ -2966,7 +2966,7 @@ ice_set_rxfh_fields(struct net_device *netdev,
 	struct ice_netdev_priv *np = netdev_priv(netdev);
 	struct ice_vsi *vsi = np->vsi;
 	struct ice_pf *pf = vsi->back;
-	struct ice_rss_hash_cfg cfg;
+	struct ice_rss_hash_cfg cfg = {};
 	struct device *dev;
 	u64 hashed_flds;
 	int status;
diff --git a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
index 6d619eeaf0190..427ea89aa091a 100644
--- a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
+++ b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
@@ -1215,12 +1215,13 @@ ice_prof_has_mask(struct ice_hw *hw, enum ice_block blk, u8 prof, u16 *masks)
  * @fv: field vector to search for
  * @masks: masks for FV
  * @symm: symmetric setting for RSS flows
+ * @skip_shared: do not return a profile ID shared with other PFs
  * @prof_id: receives the profile ID
  */
 static int
 ice_find_prof_id_with_mask(struct ice_hw *hw, enum ice_block blk,
 			   struct ice_fv_word *fv, u16 *masks, bool symm,
-			   u8 *prof_id)
+			   bool skip_shared, u8 *prof_id)
 {
 	struct ice_es *es = &hw->blk[blk].es;
 	u8 i;
@@ -1237,6 +1238,9 @@ ice_find_prof_id_with_mask(struct ice_hw *hw, enum ice_block blk,
 		if (blk == ICE_BLK_RSS && es->symm[i] != symm)
 			continue;
 
+		if (skip_shared && es->shared[i])
+			continue;
+
 		if (memcmp(&es->t[off], fv, es->fvw * sizeof(*fv)))
 			continue;
 
@@ -1376,6 +1380,324 @@ static int ice_free_prof_id(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
 	return ice_free_hw_res(hw, res_type, 1, &tmp_prof_id);
 }
 
+/**
+ * struct ice_shared_prof - RSS hash profile ID shared by the PFs of an adapter
+ * @list: entry in the list of shared profiles of the adapter
+ * @es: extraction sequence the profile ID is programmed with
+ * @pfs: bitmap of the PFs (by hw->pf_id) holding a reference to the ID
+ * @prof_id: the profile ID
+ *
+ * The DDP package defines the RSS profile IDs as shared resources: firmware
+ * lets every PF allocate an ID that another PF already holds, keeps the ID
+ * until its last user frees it, and a PF reset drops the references of that
+ * PF. Firmware cannot look up the ID programmed with an extraction sequence,
+ * the adapter keeps a list of these entries for that.
+ *
+ * Only profiles without field masks and symmetric hashing are shared, their
+ * only hardware state is the extraction sequence, which all PFs write the
+ * same. The GLQF_HMASK registers are split between the PFs, and GLQF_HSYMM is
+ * programmed by every user of a profile.
+ */
+struct ice_shared_prof {
+	struct list_head list;
+	struct ice_fv_word es[ICE_MAX_FV_WORDS];
+	unsigned long pfs;
+	u8 prof_id;
+};
+
+/**
+ * ice_shared_profs_adapter - get the adapter whose PFs share profile IDs
+ * @hw: pointer to the HW struct
+ * @blk: hardware block
+ *
+ * Return: the adapter of the PF, if its PFs may share profile IDs of @blk,
+ * NULL otherwise.
+ */
+static struct ice_adapter *
+ice_shared_profs_adapter(struct ice_hw *hw, enum ice_block blk)
+{
+	struct ice_pf *pf = hw->back;
+
+	if (blk != ICE_BLK_RSS || !pf->adapter || !pf->adapter->rss_prof_share)
+		return NULL;
+
+	return pf->adapter;
+}
+
+/**
+ * ice_prof_can_share - check if a profile ID may be shared with other PFs
+ * @hw: pointer to the HW struct
+ * @blk: hardware block
+ * @masks: masks for the extraction sequence
+ * @symm: symmetric setting for RSS profiles
+ *
+ * Return: true if the profile uses neither field masks nor symmetric hashing.
+ */
+static bool
+ice_prof_can_share(struct ice_hw *hw, enum ice_block blk, u16 *masks,
+		   bool symm)
+{
+	u16 i;
+
+	if (symm)
+		return false;
+
+	if (!masks)
+		return true;
+
+	for (i = 0; i < hw->blk[blk].es.fvw; i++)
+		if (masks[i] && masks[i] != 0xFFFF)
+			return false;
+
+	return true;
+}
+
+/**
+ * ice_find_shared_prof - find the shared profile ID for an extraction sequence
+ * @adapter: adapter of the PFs sharing the profile IDs
+ * @es: extraction sequence
+ * @fvw: number of words in @es
+ *
+ * Return: the shared profile, NULL if there is none.
+ */
+static struct ice_shared_prof *
+ice_find_shared_prof(struct ice_adapter *adapter, struct ice_fv_word *es,
+		     u16 fvw)
+{
+	struct ice_shared_prof *sp;
+
+	list_for_each_entry(sp, &adapter->rss_profs, list)
+		if (!memcmp(sp->es, es, fvw * sizeof(*es)))
+			return sp;
+
+	return NULL;
+}
+
+/**
+ * ice_find_shared_prof_id - find a shared profile by its ID
+ * @adapter: adapter of the PFs sharing the profile IDs
+ * @prof_id: the profile ID
+ *
+ * Return: the shared profile, NULL if there is none.
+ */
+static struct ice_shared_prof *
+ice_find_shared_prof_id(struct ice_adapter *adapter, u8 prof_id)
+{
+	struct ice_shared_prof *sp;
+
+	list_for_each_entry(sp, &adapter->rss_profs, list)
+		if (sp->prof_id == prof_id)
+			return sp;
+
+	return NULL;
+}
+
+/**
+ * ice_drop_shared_prof - remove a PF from the users of a shared profile ID
+ * @sp: the shared profile
+ * @pf_id: the PF
+ *
+ * Free the entry when it has no users left.
+ */
+static void ice_drop_shared_prof(struct ice_shared_prof *sp, u8 pf_id)
+{
+	sp->pfs &= ~BIT(pf_id);
+	if (sp->pfs)
+		return;
+
+	list_del(&sp->list);
+	kfree(sp);
+}
+
+/**
+ * ice_join_prof_id - take a reference to a profile ID another PF allocated
+ * @hw: pointer to the HW struct
+ * @blk: the block of the profile ID
+ * @prof_id: the profile ID
+ *
+ * Allocate the given profile ID, without ICE_AQC_RES_TYPE_FLAG_IGNORE_INDEX:
+ * firmware adds the PF to the users of the ID.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int ice_join_prof_id(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
+{
+	DEFINE_RAW_FLEX(struct ice_aqc_alloc_free_res_elem, buf, elem, 1);
+	u16 res_type, idx;
+	int status;
+
+	if (!ice_prof_id_rsrc_type(blk, &res_type))
+		return -EINVAL;
+
+	buf->num_elems = cpu_to_le16(1);
+	buf->res_type = cpu_to_le16(res_type | ICE_AQC_RES_TYPE_FLAG_DEDICATED);
+	buf->elem[0].e.sw_resp = cpu_to_le16(prof_id);
+
+	status = ice_aq_alloc_free_res(hw, buf, __struct_size(buf),
+				       ice_aqc_opc_alloc_res);
+	if (status)
+		return status;
+
+	idx = le16_to_cpu(buf->elem[0].e.sw_resp);
+	if (idx != prof_id) {
+		ice_free_hw_res(hw, res_type, 1, &idx);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/**
+ * ice_get_prof_id - get a profile ID for an extraction sequence
+ * @hw: pointer to the HW struct
+ * @blk: hardware block
+ * @es: extraction sequence of the profile
+ * @masks: masks for @es
+ * @symm: symmetric setting for RSS profiles
+ * @flags: ICE_PROF_* flags of the profile
+ * @prof_id: receives the profile ID
+ *
+ * Get a profile ID for @es, which the PF does not have yet. With
+ * ICE_PROF_SHARED, join the ID another PF of the adapter has for @es, or
+ * allocate a new one and make it available to the other PFs.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int
+ice_get_prof_id(struct ice_hw *hw, enum ice_block blk, struct ice_fv_word *es,
+		u16 *masks, bool symm, u32 flags, u8 *prof_id)
+{
+	struct ice_adapter *adapter = ice_shared_profs_adapter(hw, blk);
+	u16 fvw = hw->blk[blk].es.fvw;
+	struct ice_shared_prof *sp;
+	bool share;
+	int status;
+
+	if (!adapter)
+		return ice_alloc_prof_id(hw, blk, prof_id);
+
+	share = (flags & ICE_PROF_SHARED) &&
+		ice_prof_can_share(hw, blk, masks, symm);
+
+	guard(mutex)(&adapter->rss_prof_lock);
+
+	sp = share ? ice_find_shared_prof(adapter, es, fvw) : NULL;
+	if (sp) {
+		status = ice_join_prof_id(hw, blk, sp->prof_id);
+		if (!status) {
+			sp->pfs |= BIT(hw->pf_id);
+			hw->blk[blk].es.shared[sp->prof_id] = 1;
+			*prof_id = sp->prof_id;
+			return 0;
+		}
+
+		ice_debug(hw, ICE_DBG_PKG, "Failed to join profile ID %u, allocating a new one: %d\n",
+			  sp->prof_id, status);
+		share = false;
+	}
+
+	status = ice_alloc_prof_id(hw, blk, prof_id);
+	if (status)
+		return status;
+
+	/* Firmware hands out unused IDs only, an entry for the ID is a stale
+	 * one, left from before a reset that cleared the IDs of all PFs.
+	 */
+	sp = ice_find_shared_prof_id(adapter, *prof_id);
+	if (sp) {
+		list_del(&sp->list);
+		kfree(sp);
+	}
+
+	if (!share)
+		return 0;
+
+	/* without an entry the ID just stays private to the PF */
+	sp = kzalloc_obj(*sp);
+	if (!sp)
+		return 0;
+
+	memcpy(sp->es, es, fvw * sizeof(*es));
+	sp->pfs = BIT(hw->pf_id);
+	sp->prof_id = *prof_id;
+	list_add(&sp->list, &adapter->rss_profs);
+	hw->blk[blk].es.shared[*prof_id] = 1;
+
+	return 0;
+}
+
+/**
+ * ice_put_prof_id - release the reference of the PF to a profile ID
+ * @hw: pointer to the HW struct
+ * @blk: the block of the profile ID
+ * @prof_id: the profile ID
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+static int ice_put_prof_id(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
+{
+	struct ice_adapter *adapter = ice_shared_profs_adapter(hw, blk);
+	struct ice_shared_prof *sp;
+
+	if (!adapter || !hw->blk[blk].es.shared[prof_id])
+		return ice_free_prof_id(hw, blk, prof_id);
+
+	hw->blk[blk].es.shared[prof_id] = 0;
+
+	guard(mutex)(&adapter->rss_prof_lock);
+
+	sp = ice_find_shared_prof_id(adapter, prof_id);
+	if (sp)
+		ice_drop_shared_prof(sp, hw->pf_id);
+
+	return ice_free_prof_id(hw, blk, prof_id);
+}
+
+/**
+ * ice_put_shared_profs - remove the PF from the users of shared profile IDs
+ * @hw: pointer to the HW struct
+ *
+ * For a PF which forgets its profiles without freeing them one by one: before
+ * a reset or a devlink reload, which make firmware release the profile IDs of
+ * the PF, and before ice_adapter_put() on remove, after which the adapter
+ * holding the list may be gone.
+ */
+void ice_put_shared_profs(struct ice_hw *hw)
+{
+	struct ice_adapter *adapter = ice_shared_profs_adapter(hw, ICE_BLK_RSS);
+	struct ice_shared_prof *sp, *tmp;
+
+	if (!adapter)
+		return;
+
+	guard(mutex)(&adapter->rss_prof_lock);
+
+	list_for_each_entry_safe(sp, tmp, &adapter->rss_profs, list)
+		ice_drop_shared_prof(sp, hw->pf_id);
+}
+
+/**
+ * ice_flush_shared_profs - forget all profile IDs shared by the PFs
+ * @hw: pointer to the HW struct
+ *
+ * For a CORER, GLOBR or EMPR, which clear the profile IDs of all PFs.
+ */
+void ice_flush_shared_profs(struct ice_hw *hw)
+{
+	struct ice_adapter *adapter = ice_shared_profs_adapter(hw, ICE_BLK_RSS);
+	struct ice_shared_prof *sp, *tmp;
+
+	if (!adapter)
+		return;
+
+	guard(mutex)(&adapter->rss_prof_lock);
+
+	list_for_each_entry_safe(sp, tmp, &adapter->rss_profs, list) {
+		list_del(&sp->list);
+		kfree(sp);
+	}
+}
+
 /**
  * ice_prof_inc_ref - increment reference count for profile
  * @hw: pointer to the HW struct
@@ -1760,7 +2082,7 @@ ice_prof_dec_ref(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
 		if (!--hw->blk[blk].es.ref_count[prof_id]) {
 			ice_write_es(hw, blk, prof_id, NULL, false);
 			ice_free_prof_masks(hw, blk, prof_id);
-			return ice_free_prof_id(hw, blk, prof_id);
+			return ice_put_prof_id(hw, blk, prof_id);
 		}
 	}
 
@@ -2122,6 +2444,7 @@ void ice_free_hw_tbls(struct ice_hw *hw)
 		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].es.t);
 		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].es.ref_count);
 		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].es.symm);
+		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].es.shared);
 		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].es.written);
 		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].es.mask_ena);
 		devm_kfree(ice_hw_to_dev(hw), hw->blk[i].prof_id.id);
@@ -2155,6 +2478,8 @@ void ice_clear_hw_tbls(struct ice_hw *hw)
 {
 	u8 i;
 
+	ice_put_shared_profs(hw);
+
 	for (i = 0; i < ICE_BLK_COUNT; i++) {
 		struct ice_prof_redir *prof_redir = &hw->blk[i].prof_redir;
 		struct ice_prof_id *prof_id = &hw->blk[i].prof_id;
@@ -2187,6 +2512,7 @@ void ice_clear_hw_tbls(struct ice_hw *hw)
 		memset(es->t, 0, es->count * sizeof(*es->t) * es->fvw);
 		memset(es->ref_count, 0, es->count * sizeof(*es->ref_count));
 		memset(es->symm, 0, es->count * sizeof(*es->symm));
+		memset(es->shared, 0, es->count * sizeof(*es->shared));
 		memset(es->written, 0, es->count * sizeof(*es->written));
 		memset(es->mask_ena, 0, es->count * sizeof(*es->mask_ena));
 
@@ -2304,6 +2630,11 @@ int ice_init_hw_tbls(struct ice_hw *hw)
 		if (!es->symm)
 			goto err;
 
+		es->shared = devm_kzalloc_objs(ice_hw_to_dev(hw), *es->shared,
+					       es->count);
+		if (!es->shared)
+			goto err;
+
 		es->written = devm_kzalloc_objs(ice_hw_to_dev(hw), *es->written,
 						es->count);
 		if (!es->written)
@@ -3026,7 +3357,7 @@ ice_disable_fd_swap(struct ice_hw *hw, u8 prof_id)
  * @es: extraction sequence (length of array is determined by the block)
  * @masks: mask for extraction sequence
  * @symm: symmetric setting for RSS profiles
- * @fd_swap: enable/disable FDIR paired src/dst fields swap option
+ * @flags: ICE_PROF_* flags
  *
  * This function registers a profile, which matches a set of PTYPES with a
  * particular extraction sequence. While the hardware profile is allocated
@@ -3037,7 +3368,7 @@ int
 ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 	     unsigned long *ptypes, const struct ice_ptype_attributes *attr,
 	     u16 attr_cnt, struct ice_fv_word *es, u16 *masks, bool symm,
-	     bool fd_swap)
+	     u32 flags)
 {
 	DECLARE_BITMAP(ptgs_used, ICE_XLT1_CNT);
 	struct ice_prof_map *prof;
@@ -3050,13 +3381,15 @@ ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 	mutex_lock(&hw->blk[blk].es.prof_map_lock);
 
 	/* search for existing profile */
-	status = ice_find_prof_id_with_mask(hw, blk, es, masks, symm, &prof_id);
+	status = ice_find_prof_id_with_mask(hw, blk, es, masks, symm,
+					    flags & ICE_PROF_RAW, &prof_id);
 	if (status) {
 		/* allocate profile ID */
-		status = ice_alloc_prof_id(hw, blk, &prof_id);
+		status = ice_get_prof_id(hw, blk, es, masks, symm, flags,
+					 &prof_id);
 		if (status)
 			goto err_ice_add_prof;
-		if (blk == ICE_BLK_FD && fd_swap) {
+		if (blk == ICE_BLK_FD && (flags & ICE_PROF_FD_SWAP)) {
 			/* For Flow Director block, the extraction sequence may
 			 * need to be altered in the case where there are paired
 			 * fields that have no match. This is necessary because
@@ -3066,7 +3399,7 @@ ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 			 */
 			status = ice_update_fd_swap(hw, prof_id, es);
 			if (status) {
-				ice_free_prof_id(hw, blk, prof_id);
+				ice_put_prof_id(hw, blk, prof_id);
 				goto err_ice_add_prof;
 			}
 		} else if (blk == ICE_BLK_FD) {
@@ -3074,7 +3407,7 @@ ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 		}
 		status = ice_update_prof_masking(hw, blk, prof_id, masks);
 		if (status) {
-			ice_free_prof_id(hw, blk, prof_id);
+			ice_put_prof_id(hw, blk, prof_id);
 			goto err_ice_add_prof;
 		}
 
diff --git a/drivers/net/ethernet/intel/ice/ice_flex_pipe.h b/drivers/net/ethernet/intel/ice/ice_flex_pipe.h
index ee5d9f9c9d53a..29b0dbeb98fb2 100644
--- a/drivers/net/ethernet/intel/ice/ice_flex_pipe.h
+++ b/drivers/net/ethernet/intel/ice/ice_flex_pipe.h
@@ -8,6 +8,11 @@
 
 #define ICE_FDIR_REG_SET_SIZE	4
 
+/* ice_add_prof() flags */
+#define ICE_PROF_FD_SWAP	BIT(0)	/* FD: swap paired src/dst fields */
+#define ICE_PROF_SHARED		BIT(1)	/* RSS: may share the ID with other PFs */
+#define ICE_PROF_RAW		BIT(2)	/* parser profile: never use a shared ID */
+
 int
 ice_acquire_change_lock(struct ice_hw *hw, enum ice_aq_res_access_type access);
 void ice_release_change_lock(struct ice_hw *hw);
@@ -42,7 +47,7 @@ int
 ice_add_prof(struct ice_hw *hw, enum ice_block blk, u64 id,
 	     unsigned long *ptypes, const struct ice_ptype_attributes *attr,
 	     u16 attr_cnt, struct ice_fv_word *es, u16 *masks, bool symm,
-	     bool fd_swap);
+	     u32 flags);
 struct ice_prof_map *
 ice_search_prof_id(struct ice_hw *hw, enum ice_block blk, u64 id);
 int
@@ -61,6 +66,8 @@ void ice_free_seg(struct ice_hw *hw);
 void ice_fill_blk_tbls(struct ice_hw *hw);
 void ice_clear_hw_tbls(struct ice_hw *hw);
 void ice_free_hw_tbls(struct ice_hw *hw);
+void ice_put_shared_profs(struct ice_hw *hw);
+void ice_flush_shared_profs(struct ice_hw *hw);
 int ice_rem_prof(struct ice_hw *hw, enum ice_block blk, u64 id);
 struct ice_buf_build *
 ice_pkg_buf_alloc_single_section(struct ice_hw *hw, u32 type, u16 size,
diff --git a/drivers/net/ethernet/intel/ice/ice_flex_type.h b/drivers/net/ethernet/intel/ice/ice_flex_type.h
index 80c9e7c749c22..5751a9579cf95 100644
--- a/drivers/net/ethernet/intel/ice/ice_flex_type.h
+++ b/drivers/net/ethernet/intel/ice/ice_flex_type.h
@@ -148,6 +148,7 @@ struct ice_es {
 	struct list_head prof_map;
 	struct ice_fv_word *t;
 	u8 *symm;	/* symmetric setting per profile (RSS blk)*/
+	u8 *shared;	/* profile ID is shared with other PFs (RSS blk) */
 	struct mutex prof_map_lock;	/* protect access to profiles list */
 	u8 *written;
 	u8 reverse; /* set to true to reverse FV order */
diff --git a/drivers/net/ethernet/intel/ice/ice_flow.c b/drivers/net/ethernet/intel/ice/ice_flow.c
index 646bcdca13260..9be769b105cca 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.c
+++ b/drivers/net/ethernet/intel/ice/ice_flow.c
@@ -1444,6 +1444,7 @@ ice_flow_rem_entry_sync(struct ice_hw *hw, enum ice_block __always_unused blk,
  * @segs: array of one or more packet segments that describe the flow
  * @segs_cnt: number of packet segments provided
  * @symm: symmetric setting for RSS profiles
+ * @shared: the HW profile may be shared with other PFs
  * @prof: stores the returned flow profile added
  *
  * Assumption: the caller has acquired the lock to the profile list
@@ -1452,7 +1453,7 @@ static int
 ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 		       enum ice_flow_dir dir,
 		       struct ice_flow_seg_info *segs, u8 segs_cnt,
-		       bool symm, struct ice_flow_prof **prof)
+		       bool symm, bool shared, struct ice_flow_prof **prof)
 {
 	struct ice_flow_prof_params *params;
 	struct ice_prof_id *ids;
@@ -1489,6 +1490,7 @@ ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 	params->prof->dir = dir;
 	params->prof->segs_cnt = segs_cnt;
 	params->prof->symm = symm;
+	params->prof->shared = shared;
 
 	/* Make a copy of the segments that need to be persistent in the flow
 	 * profile instance
@@ -1505,7 +1507,8 @@ ice_flow_add_prof_sync(struct ice_hw *hw, enum ice_block blk,
 	/* Add a HW profile for this flow profile */
 	status = ice_add_prof(hw, blk, prof_id, params->ptypes,
 			      params->attr, params->attr_cnt, params->es,
-			      params->mask, symm, true);
+			      params->mask, symm,
+			      ICE_PROF_FD_SWAP | (shared ? ICE_PROF_SHARED : 0));
 	if (status) {
 		ice_debug(hw, ICE_DBG_FLOW, "Error adding a HW flow profile\n");
 		goto out;
@@ -1701,7 +1704,7 @@ ice_flow_set_parser_prof(struct ice_hw *hw, u16 dest_vsi, u16 fdir_vsi,
 
 	status = ice_add_prof(hw, blk, id, prof->ptypes,
 			      params->attr, params->attr_cnt,
-			      params->es, params->mask, false, false);
+			      params->es, params->mask, false, ICE_PROF_RAW);
 	if (status)
 		return status;
 
@@ -1713,19 +1716,23 @@ ice_flow_set_parser_prof(struct ice_hw *hw, u16 dest_vsi, u16 fdir_vsi,
 }
 
 /**
- * ice_flow_add_prof - Add a flow profile for packet segments and matched fields
+ * __ice_flow_add_prof - Add a flow profile for packet segments and fields
  * @hw: pointer to the HW struct
  * @blk: classification stage
  * @dir: flow direction
  * @segs: array of one or more packet segments that describe the flow
  * @segs_cnt: number of packet segments provided
  * @symm: symmetric setting for RSS profiles
+ * @shared: the HW profile may be shared with other PFs
  * @prof: stores the returned flow profile added
+ *
+ * Return: 0 on success, negative error code otherwise.
  */
-int
-ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
-		  struct ice_flow_seg_info *segs, u8 segs_cnt,
-		  bool symm, struct ice_flow_prof **prof)
+static int
+__ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk,
+		    enum ice_flow_dir dir, struct ice_flow_seg_info *segs,
+		    u8 segs_cnt, bool symm, bool shared,
+		    struct ice_flow_prof **prof)
 {
 	int status;
 
@@ -1745,7 +1752,7 @@ ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
 	mutex_lock(&hw->fl_profs_locks[blk]);
 
 	status = ice_flow_add_prof_sync(hw, blk, dir, segs, segs_cnt,
-					symm, prof);
+					symm, shared, prof);
 	if (!status)
 		list_add(&(*prof)->l_entry, &hw->fl_profs[blk]);
 
@@ -1754,6 +1761,25 @@ ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
 	return status;
 }
 
+/**
+ * ice_flow_add_prof - Add a flow profile for packet segments and matched fields
+ * @hw: pointer to the HW struct
+ * @blk: classification stage
+ * @dir: flow direction
+ * @segs: array of one or more packet segments that describe the flow
+ * @segs_cnt: number of packet segments provided
+ * @symm: symmetric setting for RSS profiles
+ * @prof: stores the returned flow profile added
+ */
+int
+ice_flow_add_prof(struct ice_hw *hw, enum ice_block blk, enum ice_flow_dir dir,
+		  struct ice_flow_seg_info *segs, u8 segs_cnt,
+		  bool symm, struct ice_flow_prof **prof)
+{
+	return __ice_flow_add_prof(hw, blk, dir, segs, segs_cnt, symm, false,
+				   prof);
+}
+
 /**
  * ice_flow_rem_prof - Remove a flow profile and all entries associated with it
  * @hw: pointer to the HW struct
@@ -2274,6 +2300,7 @@ ice_add_rss_list(struct ice_hw *hw, u16 vsi_handle, struct ice_flow_prof *prof)
 	rss_cfg->hash.addl_hdrs = prof->segs[prof->segs_cnt - 1].hdrs;
 	rss_cfg->hash.hdr_type = hdr_type;
 	rss_cfg->hash.symm = prof->symm;
+	rss_cfg->hash.shared = prof->shared;
 	set_bit(vsi_handle, rss_cfg->vsis);
 
 	list_add_tail(&rss_cfg->l_entry, &hw->rss_list_head);
@@ -2618,8 +2645,8 @@ ice_add_rss_cfg_sync(struct ice_hw *hw, u16 vsi_handle,
 	}
 
 	/* Create a new flow profile with packet segment information. */
-	status = ice_flow_add_prof(hw, blk, ICE_FLOW_RX,
-				   segs, segs_cnt, cfg->symm, &prof);
+	status = __ice_flow_add_prof(hw, blk, ICE_FLOW_RX, segs, segs_cnt,
+				     cfg->symm, cfg->shared, &prof);
 	if (status)
 		goto exit;
 
@@ -2826,7 +2853,7 @@ ice_rem_rss_cfg(struct ice_hw *hw, u16 vsi_handle,
  */
 int ice_add_avf_rss_cfg(struct ice_hw *hw, struct ice_vsi *vsi, u64 avf_hash)
 {
-	struct ice_rss_hash_cfg hcfg;
+	struct ice_rss_hash_cfg hcfg = {};
 	u16 vsi_handle;
 	int status = 0;
 	u64 hash_flds;
diff --git a/drivers/net/ethernet/intel/ice/ice_flow.h b/drivers/net/ethernet/intel/ice/ice_flow.h
index 6c6cdc8addb12..97de59776cdd4 100644
--- a/drivers/net/ethernet/intel/ice/ice_flow.h
+++ b/drivers/net/ethernet/intel/ice/ice_flow.h
@@ -383,6 +383,7 @@ struct ice_rss_hash_cfg {
 	u64 hash_flds; /* hash bit field (ICE_FLOW_HASH_*) to configure */
 	enum ice_rss_cfg_hdr_type hdr_type; /* to specify inner or outer */
 	bool symm; /* symmetric or asymmetric hash */
+	bool shared; /* may share the HW profile with other PFs */
 };
 
 enum ice_flow_dir {
@@ -482,6 +483,7 @@ struct ice_flow_prof {
 	DECLARE_BITMAP(vsis, ICE_MAX_VSI);
 
 	bool symm; /* Symmetric Hash for RSS */
+	bool shared; /* HW profile may be shared with other PFs */
 };
 
 struct ice_rss_raw_cfg {
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index f3fefab09f8c1..d2e1dc102ce35 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -1778,13 +1778,15 @@ static void ice_vsi_set_rss_flow_fld(struct ice_vsi *vsi)
 		return;
 	}
 	for (i = 0; i < ARRAY_SIZE(default_rss_cfgs); i++) {
-		const struct ice_rss_hash_cfg *cfg = &default_rss_cfgs[i];
+		struct ice_rss_hash_cfg cfg = default_rss_cfgs[i];
 
-		status = ice_add_rss_cfg(hw, vsi, cfg);
+		/* the defaults are the same on all PFs, share their profiles */
+		cfg.shared = true;
+		status = ice_add_rss_cfg(hw, vsi, &cfg);
 		if (status)
 			dev_dbg(dev, "ice_add_rss_cfg failed, addl_hdrs = %x, hash_flds = %llx, hdr_type = %d, symm = %d\n",
-				cfg->addl_hdrs, cfg->hash_flds,
-				cfg->hdr_type, cfg->symm);
+				cfg.addl_hdrs, cfg.hash_flds,
+				cfg.hdr_type, cfg.symm);
 	}
 }
 
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index e54ec9b21c62f..d446107b33ff1 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -672,6 +672,9 @@ ice_prepare_for_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
 		ice_fdir_clear_flow_handles(hw);
 	/* clear SW filtering DB */
 	ice_clear_hw_tbls(hw);
+	/* a CORER, GLOBR or EMPR also clears the profile IDs of the other PFs */
+	if (reset_type != ICE_RESET_PFR)
+		ice_flush_shared_profs(hw);
 	/* disable the VSIs and their queues that are not already DOWN */
 	set_bit(ICE_VSI_REBUILD_PENDING, ice_get_main_vsi(pf)->state);
 	ice_pf_dis_all_vsi(pf, false);
@@ -5390,6 +5393,7 @@ ice_probe(struct pci_dev *pdev, const struct pci_device_id __always_unused *ent)
 unroll_dev_init:
 	need_dev_deinit = true;
 unroll_adapter:
+	ice_put_shared_profs(hw);
 	ice_adapter_put(adapter);
 unroll_hw_init:
 	ice_deinit_hw(hw);
@@ -5506,6 +5510,7 @@ static void ice_remove(struct pci_dev *pdev)
 
 	ice_set_wake(pf);
 
+	ice_put_shared_profs(&pf->hw);
 	ice_adapter_put(pf->adapter);
 	ice_deinit_hw(&pf->hw);
 
diff --git a/drivers/net/ethernet/intel/ice/virt/rss.c b/drivers/net/ethernet/intel/ice/virt/rss.c
index 960012ca91b53..39bffc45b37ff 100644
--- a/drivers/net/ethernet/intel/ice/virt/rss.c
+++ b/drivers/net/ethernet/intel/ice/virt/rss.c
@@ -1646,7 +1646,7 @@ int ice_vc_handle_rss_cfg(struct ice_vf *vf, u8 *msg, bool add)
 				v_ret = VIRTCHNL_STATUS_ERR_PARAM;
 		}
 	} else {
-		struct ice_rss_hash_cfg cfg;
+		struct ice_rss_hash_cfg cfg = {};
 
 		/* Only check for none raw pattern case */
 		if (!ice_vc_validate_pattern(vf, &rss_cfg->proto_hdrs)) {
-- 
2.56.0

