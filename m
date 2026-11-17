Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908506;
	b=o4xixZrGafaO5nz5nPdS62g7N/KeVmLHw+Q6tiXZF7d5MO53TZoO+46mWlvt/8KY+xmv
	 Xv+q509XnZzY5j3MVmK+8y9/Q339jmdSuwgviu7I8kmDSRe8j5IVzQ36+Mx+FPuHqUkIO
	 UEGFj7h5RaL8VSTDkPhAIBiepCGwHpYgZ5bmDt80EZ8Dh4dfkYGVF4F/f5FoRO94aVKg4
	 YQUwC4xAKQ3t3XyGNWWX4RyITDtxOQ2Q7rc8tk3E5uzikaHu3N3hScrivbBbod5/+RUzC
	 FRMZij+uYuiaP0m3kGsAyGerB4xuPfv/EQFfQo+IQaLzYoaVycXYGpDK/KiV1EEmBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908506;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VvGYg4RKOcZoCIDjAJMuLObnilI7z0KtFsIeC3rNVvU=;
	b=qsKm8jj2f9LvAJmbY1qhy83PwgZkDkquD+72VtBiY2vKxJg+bf5GD1SXr3IqlwfvF6bK
	 8yCqvQzMsSvD8/Wea5xL7fBuymaU5skrgS993etni9xDMBNixuNcUxfEr5/L68IbRM1mT
	 AR4wo56x6sMPC5MwiY8QpQFa00n2guhtDJYPZ/joBWjZ3NDk18FSKLLlbsfbNbOTGz0LO
	 prsVCwfcVpW4nRo2JjOJRhLgPew1L4b/EALGckCtZkwWpTpc1KdMfzmiJMvQrmf1VbcLQ
	 xqfMFIih9IfrzBAbe7HdjORLTZmaa06HFWnVr4SC65PwaER9F8c33NMJPiRMX8UcHVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kCdEj7y5;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87644606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87644606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kCdEj7y5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908506; x=1826444506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ha6+beWen/HzF3HGCwu4M8XZKad/MO6jy85k6q7op0E=;
  b=kCdEj7y5tYATjFoBdPV4cz3cCcTd1vbllAaCI6d+7nUkZaVal5fPvqcq
   xeqAr2uPojlRSBN/V9fevG3edSwpa4A9DhWW1TgWMB8/+47s3Ic2NNv4W
   I4Ey42FYgJK1YXEszkFbDCmiCAOC6f098B1am2c1LQFqBJEDZ7YADaFFS
   +nQUI0cgBtQSeXzGYroZLLHoGL0BPbW98lTrrh01WDzypr9H570XZoVGa
   YXcTVbh5qHLUdlX6oWiQ/BetST/4Xu24XQdEdOKWXKlyDEBh/Eid2zb50
   xN0fJ1+Lv9zgNZM3tCjgOjkH5Hkk6YzQmSa+Jsqk+3epJJ/yGGfrrUTwq
   Q==;
X-CSE-ConnectionGUID: H14t/JNFQP+fJ677tIolYA==
X-CSE-MsgGUID: jVMAeIjISEKwwQ0btcv1iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3553732"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3553732"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:44 -0800
X-CSE-ConnectionGUID: UORq7qt9TwWO9QtbwMs1zw==
X-CSE-MsgGUID: L+2jrxUATm2mETOpYUX0mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11591348"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 01:41:39 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id D62D128198;
	Tue, 17 Nov 2026 09:41:36 +0000 (GMT)
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
Subject: [net-next v6 08/15] iavf: temporary rename of IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1
Date: Tue, 17 Nov 2026 10:44:46 +0100
Message-ID: <20261117094913.100756-9-przemyslaw.kitszel@intel.com>
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

Rename IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1, in preparation for
the next patch that will extend the max to 256, using old value of 16 for
the "v1" variant of virtchnl opcodes.

Suggested-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Suggested-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
 drivers/net/ethernet/intel/iavf/iavf.h          |  3 ++-
 drivers/net/ethernet/intel/iavf/iavf_main.c     |  2 +-
 drivers/net/ethernet/intel/iavf/iavf_virtchnl.c | 10 +++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf.h b/drivers/net/ethernet/intel/iavf/iavf.h
index a41d2726ebd8..053f34c4f710 100644
--- a/drivers/net/ethernet/intel/iavf/iavf.h
+++ b/drivers/net/ethernet/intel/iavf/iavf.h
@@ -87,7 +87,8 @@ struct iavf_vsi {
 #define IAVF_TX_DESC(R, i) (&(((struct iavf_tx_desc *)((R)->desc))[i]))
 #define IAVF_TX_CTXTDESC(R, i) \
 	(&(((struct iavf_tx_context_desc *)((R)->desc))[i]))
-#define IAVF_MAX_REQ_QUEUES 16
+/* for "old" virtchnl opcodes that accept up to 16 queues */
+#define IAVF_MAX_REQ_QUEUES_VCV1	16
 
 #define IAVF_HKEY_ARRAY_SIZE ((IAVF_VFQF_HKEY_MAX_INDEX + 1) * 4)
 #define IAVF_HLUT_ARRAY_SIZE ((IAVF_VFQF_HLUT_MAX_INDEX + 1) * 4)
diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index d39737dcd425..822d6e692d49 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -5371,7 +5371,7 @@ static int iavf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 
 	netdev = alloc_etherdev_mq(sizeof(struct iavf_adapter),
-				   IAVF_MAX_REQ_QUEUES);
+				   IAVF_MAX_REQ_QUEUES_VCV1);
 	if (!netdev) {
 		err = -ENOMEM;
 		goto err_alloc_etherdev;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index 356565aa41c8..69241cb146e0 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
@@ -260,19 +260,19 @@ int iavf_send_vf_ptp_caps_msg(struct iavf_adapter *adapter)
  **/
 static void iavf_validate_num_queues(struct iavf_adapter *adapter)
 {
-	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES) {
+	if (adapter->vf_res->num_queue_pairs > IAVF_MAX_REQ_QUEUES_VCV1) {
 		struct virtchnl_vsi_resource *vsi_res;
 		int i;
 
 		dev_info(&adapter->pdev->dev, "Received %d queues, but can only have a max of %d\n",
 			 adapter->vf_res->num_queue_pairs,
-			 IAVF_MAX_REQ_QUEUES);
+			 IAVF_MAX_REQ_QUEUES_VCV1);
 		dev_info(&adapter->pdev->dev, "Fixing by reducing queues to %d\n",
-			 IAVF_MAX_REQ_QUEUES);
-		adapter->vf_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
+			 IAVF_MAX_REQ_QUEUES_VCV1);
+		adapter->vf_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES_VCV1;
 		for (i = 0; i < adapter->vf_res->num_vsis; i++) {
 			vsi_res = &adapter->vf_res->vsi_res[i];
-			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES;
+			vsi_res->num_queue_pairs = IAVF_MAX_REQ_QUEUES_VCV1;
 		}
 	}
 }
-- 
2.54.0

