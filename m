Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302103;
	b=Ym+3vWpzBy6+ALb1XvohsVQHmFCO8pVDnoIzLxdDgNp3PoyVPJ+g+d8KQeFn1sJaN5Sf
	 tZbKtZ6ykliFABUKVCVhw/Uct+nBh4x18krkwpsX55Cs0D7W0z8sNPdYR7KKa8O6pwxl2
	 Ug6HozGcoty0mbAymOOXeOPKDJLTBuzmz88fXWrer9g285MQZoqphdBYZssRVUm3JOwQb
	 /CgNNaOTa3GUjsgP3AaqHs3oi9zRvkL5q7yiQxw/PQ0jhTVHoykkQmucaYtgWrTUgP5DT
	 SMpesaHA7B1rLJdf9AomWl3PK13kp9dsNX702p93j9LtXJO08N8BUsvWQeG4AbAU2Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302103;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QO3HSa5qAdTw3mfQgLt/Dphy+QuUemIkG5T78n8ZtyQ=;
	b=sbQyfRR8rQH9Y4PNZShwID5j4WWXjFH8m5TNWnaHve1WfThkbvsXFkKy/Rs+l4UUNcsB
	 YEiOx6aVz8KoZq79PvtIpjdCUrI/ew8n2n4LGJld1/lcQwsIzA4XM0aNjpQUcKFz/tYqn
	 vRXPtc4zipwBrdTWtARXvTLvDK5z2P2vwLGWhjfLueNWy126mhnXpYXz8cAjr6K1nVb9E
	 L5Y8cvoyysWOUeRQeNhfEQJekxEodcH5GZZEb/Otqji7VPyMFwpoecJXR7PB/F9EkAxkl
	 kWvbYNL73VHypB4IJRbK06xDqOlo0ssmI2OzvBnDT0YXGooS4YNeRbHsjSjlpj+yVdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gv6JkGZ9;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2D8606A335
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D2D8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gv6JkGZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302102; x=1826838102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gyMMtMoqbmCAIvbb0u0BV7SJr1Q88toeLwLGaPEuA4Y=;
  b=gv6JkGZ9rfMJz39XR+RA8j1oC/rLlVNJDFgRR4w8ed9z16H8xFGukz/4
   jeTn1JlZCLjAOemyNC1bhpc8q9B9SwDKCZk0qNH55FhsRGywd4wlD4S/e
   lF/F9UkGdS0BQ/k1D0Xf225BVsZSCdAzMCfAWvGFmrhUwyoVfdVnmQ8e8
   NWcg5ZoE9gZGhZxCATg6yKsNerYexQHz0eBRZWdpROxdzC5atQPZU0L0M
   fJWVADHzRIPCKBAw2PiKpFwesM9jzenMl97xhahNn5WB+n/QtiZIs6fyb
   f7yiUg60U52SaE4yLmBhTITbhih47j8PVcmJObTEKfiZtk79qgb+SB4tU
   A==;
X-CSE-ConnectionGUID: /2SGZgPUTceoTUY/2Fqm3A==
X-CSE-MsgGUID: KCcihwoaRTqz1o6JBzJ/HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="3996952"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="3996952"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:01:41 -0800
X-CSE-ConnectionGUID: +Zkts9+HQyCua1sLcQkJ5Q==
X-CSE-MsgGUID: uhpR6HtUSbq6NxegkyXKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11273309"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2026 15:01:37 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 1FEF833BC5;
	Sat, 21 Nov 2026 23:01:34 +0000 (GMT)
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
Subject: [PATCH net-next v7 01/15] iavf: keep RSS config across resets
Date: Sat, 21 Nov 2026 23:55:28 +0100
Message-ID: <20261121230123.316391-2-przemyslaw.kitszel@intel.com>
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

The RSS key and the LUT set by the user are overwritten with the
defaults on every reset. Keep both. The LUT is replaced only when it
uses queues the VF no longer has, or when it can't be resized to a new
LUT size. ethtool_rxfh_indir_lost() needs rtnl, so it is called from
iavf_finish_config().

PF may report a different RSS key or LUT size after a reset (ice will,
once its VF RSS LUT can be changed via devlink), or stop offering
VIRTCHNL_VF_OFFLOAD_RSS_PF, which means the default sizes. Reallocate
both then, keep the key unless its size changed, and fold or unfold the
LUT set by the user with ethtool_rxfh_indir_resize(). When PF gives the
VF fewer queue pairs than it has in use (PF has lowered its limit on
reset), reinit queues and MSI-X with that count.

Keep the RSS buffers on reinit after iavf_disable_vf(), they leaked.

Zero adapter->vf_res on a failed VF resources message, as
iavf_disable_vf() does, instead of freeing it, ethtool ops use it while
init retries with the netdev registered. Skip the rest of the
VIRTCHNL_OP_GET_VF_RESOURCES reply handling when
iavf_parse_vf_resource_msg() fails. It schedules a reset that redoes it,
except when the reply has no LAN VSI.

Reset aq_wait_count when init starts over after the PF stopped
responding. It was never reset, so once it reached IAVF_AQ_MAX_ERR, the
first wait for a PF reply sent init back to __IAVF_COMM_FAILED.

Most of these issues are old and affect every PF, but are rarely hit.
The rest of this series makes them common: the VF is reset on each
change of its RSS LUT via devlink, and on init, after iavf asks the PF
for more queues and waits for them in __IAVF_INIT_FAILED. Hence fix
them first.

Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v7:
 * new patch, split out of "iavf: use new opcodes to request more than
   16 queues", as it applies to every PF (Jakub)
 * keep the RSS key and the LUT set by the user across resets, and fold
   or unfold the LUT with ethtool_rxfh_indir_resize() when the LUT size
   changes, instead of filling both with the defaults; when the LUT
   can't be kept, call ethtool_rxfh_indir_lost() from
   iavf_finish_config(), under rtnl (Jakub)
 * keep the RSS buffers on reinit after iavf_disable_vf(), they leaked
   (me)
---
 drivers/net/ethernet/intel/iavf/iavf.h        |   1 +
 .../net/ethernet/intel/iavf/iavf_ethtool.c    |   1 +
 drivers/net/ethernet/intel/iavf/iavf_main.c   | 141 +++++++++++++++---
 .../net/ethernet/intel/iavf/iavf_virtchnl.c   |   3 +-
 4 files changed, 128 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf.h b/drivers/net/ethernet/intel/iavf/iavf.h
index 8c45536fd502..d174202bcd79 100644
--- a/drivers/net/ethernet/intel/iavf/iavf.h
+++ b/drivers/net/ethernet/intel/iavf/iavf.h
@@ -294,6 +294,7 @@ struct iavf_adapter {
 #define IAVF_FLAG_SETUP_NETDEV_FEATURES		BIT(18)
 #define IAVF_FLAG_REINIT_MSIX_NEEDED		BIT(20)
 #define IAVF_FLAG_FDIR_ENABLED			BIT(21)
+#define IAVF_FLAG_RSS_LUT_LOST			BIT(22)
 /* duplicates for common code */
 #define IAVF_FLAG_DCB_ENABLED			0
 	/* flags for admin queue service task */
diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
index e7cf12eaa268..b76622fa9661 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
@@ -1846,6 +1846,7 @@ static int iavf_set_rxfh(struct net_device *netdev,
 		/* Each 32 bits pointed by 'indir' is stored with a lut entry */
 		for (i = 0; i < adapter->rss_lut_size; i++)
 			adapter->rss_lut[i] = (u8)(rxfh->indir[i]);
+		adapter->flags &= ~IAVF_FLAG_RSS_LUT_LOST;
 	}
 
 	return iavf_config_rss(adapter);
diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index 4de3ea8525b3..c7b12de63c2f 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -1769,16 +1769,67 @@ int iavf_config_rss(struct iavf_adapter *adapter)
 	}
 }
 
+static bool iavf_rss_lut_is_user(struct iavf_adapter *adapter)
+{
+	return netif_is_rxfh_configured(adapter->netdev) &&
+	       !(adapter->flags & IAVF_FLAG_RSS_LUT_LOST);
+}
+
+static void iavf_rss_lut_lost(struct iavf_adapter *adapter)
+{
+	adapter->flags |= IAVF_FLAG_RSS_LUT_LOST;
+	iavf_schedule_finish_config(adapter);
+}
+
+static int iavf_rss_lut_resize(struct iavf_adapter *adapter, u8 *lut, u16 size)
+{
+	struct net_device *netdev = adapter->netdev;
+	int old_size = adapter->rss_lut_size;
+	u32 *indir;
+
+	if (!iavf_rss_lut_is_user(adapter))
+		return 0;
+
+	indir = kmalloc_objs(*indir, max(old_size, size));
+	if (!indir)
+		return -ENOMEM;
+
+	for (int i = 0; i < old_size; i++)
+		indir[i] = adapter->rss_lut[i];
+	if (ethtool_rxfh_indir_can_resize(netdev, indir, old_size, size)) {
+		ethtool_rxfh_indir_resize(netdev, indir, old_size, size);
+		for (int i = 0; i < size; i++)
+			lut[i] = indir[i];
+	} else {
+		iavf_rss_lut_lost(adapter);
+	}
+
+	kfree(indir);
+	return 0;
+}
+
 /**
  * iavf_fill_rss_lut - Fill the lut with default values
  * @adapter: board private structure
+ *
+ * Keep the lut set by the user, unless it uses a queue out of range.
  **/
 static void iavf_fill_rss_lut(struct iavf_adapter *adapter)
 {
-	u16 i;
+	int max = adapter->num_active_queues;
 
-	for (i = 0; i < adapter->rss_lut_size; i++)
-		adapter->rss_lut[i] = i % adapter->num_active_queues;
+	if (iavf_rss_lut_is_user(adapter)) {
+		int max_q = 0;
+
+		for (int i = 0; i < adapter->rss_lut_size; i++)
+			max_q = max(max_q, adapter->rss_lut[i]);
+		if (max_q < max)
+			return;
+		iavf_rss_lut_lost(adapter);
+	}
+
+	for (int i = 0; i < adapter->rss_lut_size; i++)
+		adapter->rss_lut[i] = i % max;
 }
 
 /**
@@ -1805,7 +1856,6 @@ static int iavf_init_rss(struct iavf_adapter *adapter)
 	}
 
 	iavf_fill_rss_lut(adapter);
-	netdev_rss_key_fill((void *)adapter->rss_key, adapter->rss_key_size);
 
 	return iavf_config_rss(adapter);
 }
@@ -2014,6 +2064,12 @@ static void iavf_finish_config(struct work_struct *work)
 	rtnl_lock();
 	netdev_lock(adapter->netdev);
 
+	if (adapter->flags & IAVF_FLAG_RSS_LUT_LOST) {
+		adapter->flags &= ~IAVF_FLAG_RSS_LUT_LOST;
+		if (netif_is_rxfh_configured(adapter->netdev))
+			ethtool_rxfh_indir_lost(adapter->netdev);
+	}
+
 	if ((adapter->flags & IAVF_FLAG_SETUP_NETDEV_FEATURES) &&
 	    adapter->netdev->reg_state == NETREG_REGISTERED &&
 	    !test_bit(__IAVF_IN_REMOVE_TASK, &adapter->crit_section)) {
@@ -2459,16 +2515,19 @@ static void iavf_init_version_check(struct iavf_adapter *adapter)
 int iavf_parse_vf_resource_msg(struct iavf_adapter *adapter)
 {
 	int i, num_req_queues = adapter->num_req_queues;
+	struct virtchnl_vsi_resource *vsi_res = NULL;
 	struct iavf_vsi *vsi = &adapter->vsi;
+	u32 key_size, lut_size;
 
 	for (i = 0; i < adapter->vf_res->num_vsis; i++) {
 		if (adapter->vf_res->vsi_res[i].vsi_type == VIRTCHNL_VSI_SRIOV)
-			adapter->vsi_res = &adapter->vf_res->vsi_res[i];
+			vsi_res = &adapter->vf_res->vsi_res[i];
 	}
-	if (!adapter->vsi_res) {
+	if (!vsi_res) {
 		dev_err(&adapter->pdev->dev, "No LAN VSI found\n");
 		return -ENODEV;
 	}
+	adapter->vsi_res = vsi_res;
 
 	if (num_req_queues &&
 	    num_req_queues > adapter->vsi_res->num_queue_pairs) {
@@ -2486,19 +2545,62 @@ int iavf_parse_vf_resource_msg(struct iavf_adapter *adapter)
 
 		return -EAGAIN;
 	}
+	/* PF could cut our queues on reset, e.g. when RSS LUT got smaller */
+	if (adapter->state != __IAVF_INIT_GET_RESOURCES &&
+	    adapter->num_active_queues > adapter->vsi_res->num_queue_pairs) {
+		adapter->flags |= IAVF_FLAG_REINIT_MSIX_NEEDED;
+		adapter->num_req_queues = adapter->vsi_res->num_queue_pairs;
+		iavf_schedule_reset(adapter, IAVF_FLAG_RESET_NEEDED);
+
+		return -EAGAIN;
+	}
 	adapter->num_req_queues = 0;
 	adapter->vsi.id = adapter->vsi_res->vsi_id;
 
 	adapter->vsi.back = adapter;
 	adapter->vsi.base_vector = 1;
 	vsi->netdev = adapter->netdev;
 	vsi->qs_handle = adapter->vsi_res->qset_handle;
 	if (adapter->vf_res->vf_cap_flags & VIRTCHNL_VF_OFFLOAD_RSS_PF) {
-		adapter->rss_key_size = adapter->vf_res->rss_key_size;
-		adapter->rss_lut_size = adapter->vf_res->rss_lut_size;
+		key_size = adapter->vf_res->rss_key_size;
+		lut_size = adapter->vf_res->rss_lut_size;
+	} else {
+		key_size = IAVF_HKEY_ARRAY_SIZE;
+		lut_size = IAVF_HLUT_ARRAY_SIZE;
+	}
+
+	if ((adapter->rss_key && adapter->rss_key_size != key_size) ||
+	    (adapter->rss_lut && adapter->rss_lut_size != lut_size)) {
+		u8 *rss_key, *rss_lut;
+
+		rss_key = kzalloc(key_size, GFP_KERNEL);
+		rss_lut = kzalloc(lut_size, GFP_KERNEL);
+		if (!rss_lut || !rss_key ||
+		    iavf_rss_lut_resize(adapter, rss_lut, lut_size)) {
+			kfree(rss_key);
+			kfree(rss_lut);
+			/* old buffers and sizes are kept, retry via reset */
+			iavf_schedule_reset(adapter, IAVF_FLAG_RESET_NEEDED);
+			return -ENOMEM;
+		}
+
+		if (adapter->rss_key_size == key_size)
+			memcpy(rss_key, adapter->rss_key, key_size);
+		else
+			netdev_rss_key_fill(rss_key, key_size);
+
+		kfree(adapter->rss_key);
+		kfree(adapter->rss_lut);
+		adapter->rss_key = rss_key;
+		adapter->rss_lut = rss_lut;
+		adapter->rss_key_size = key_size;
+		adapter->rss_lut_size = lut_size;
+		/* no queues yet on init, iavf_init_config_adapter() sets RSS */
+		if (adapter->state != __IAVF_INIT_GET_RESOURCES)
+			iavf_init_rss(adapter);
 	} else {
-		adapter->rss_key_size = IAVF_HKEY_ARRAY_SIZE;
-		adapter->rss_lut_size = IAVF_HLUT_ARRAY_SIZE;
+		adapter->rss_key_size = key_size;
+		adapter->rss_lut_size = lut_size;
 	}
 
 	return 0;
@@ -2563,8 +2665,8 @@ static void iavf_init_get_resources(struct iavf_adapter *adapter)
 	return;
 
 err_alloc:
-	kfree(adapter->vf_res);
-	adapter->vf_res = NULL;
+	/* keep it allocated, ethtool ops may run on reinit */
+	memset(adapter->vf_res, 0, IAVF_VIRTCHNL_VF_RESOURCE_SIZE);
 err:
 	iavf_change_state(adapter, __IAVF_INIT_FAILED);
 }
@@ -2862,11 +2964,15 @@ static void iavf_init_config_adapter(struct iavf_adapter *adapter)
 	iavf_misc_irq_enable(adapter);
 	wake_up(&adapter->down_waitqueue);
 
-	adapter->rss_key = kzalloc(adapter->rss_key_size, GFP_KERNEL);
-	adapter->rss_lut = kzalloc(adapter->rss_lut_size, GFP_KERNEL);
-	if (!adapter->rss_key || !adapter->rss_lut) {
-		err = -ENOMEM;
-		goto err_mem;
+	/* kept on reinit after iavf_disable_vf() */
+	if (!adapter->rss_lut) {
+		adapter->rss_key = kzalloc(adapter->rss_key_size, GFP_KERNEL);
+		adapter->rss_lut = kzalloc(adapter->rss_lut_size, GFP_KERNEL);
+		if (!adapter->rss_key || !adapter->rss_lut) {
+			err = -ENOMEM;
+			goto err_mem;
+		}
+		netdev_rss_key_fill(adapter->rss_key, adapter->rss_key_size);
 	}
 	if (RSS_AQ(adapter))
 		adapter->aq_required |= IAVF_FLAG_AQ_CONFIGURE_RSS;
@@ -2967,6 +3073,7 @@ static int iavf_watchdog_step(struct iavf_adapter *adapter)
 			 */
 			iavf_change_state(adapter, __IAVF_STARTUP);
 			adapter->flags &= ~IAVF_FLAG_PF_COMMS_FAILED;
+			adapter->aq_wait_count = 0;
 		}
 		adapter->aq_required = 0;
 		adapter->current_op = VIRTCHNL_OP_UNKNOWN;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index e6b7e8f82c7c..5578525d550e 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
@@ -2622,7 +2622,8 @@ void iavf_virtchnl_completion(struct iavf_adapter *adapter,
 
 		iavf_activate_fdir_filters(adapter);
 
-		iavf_parse_vf_resource_msg(adapter);
+		if (iavf_parse_vf_resource_msg(adapter))
+			break;
 
 		/* negotiated VIRTCHNL_VF_OFFLOAD_VLAN_V2, so wait for the
 		 * response to VIRTCHNL_OP_GET_OFFLOAD_VLAN_V2_CAPS to finish
-- 
2.51.1

