Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302115;
	b=Q3rPC20Lxn+eyKV6MCM5GBuuJNBcSy07qRSLY06kYGyRNoS2uFx1X+a5SkMSkQUytRJt
	 2jws4pnxmGFO2sMynABBj9Rn3QSyRHdDY/C2WzsNveNNuU2NxwKcvrGQcuGbRalvwPJF2
	 7hag5kq9ivvzCbNCfouhxydm1Vhe/NpNBonpv6AFRS/TmThd8GTkNnZYLyQAB5mtYGola
	 2dLD8kMN9DCyf0u1WSW45aWaJB9JZ557RpAYOUnJNuG3PmxnCsExlViZmwCeOXDLD/3qy
	 IFkurO1/ErrUBHboRcp2fzoEX0UPCZtm1hujLjXane0EyOoGbJxT8f7YZEJSWeCWk0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OvLilmksazGDcJIZIoSGitN+8jCDMPYWtCOnQa2kRew=;
	b=uWlNavR49Dj+Fm4WC5gnh3oZPlIIl9W660CCbhoJWlbjGEDoVL5lzqAnU3HwIJEX4Nd/
	 jL4yxiFSyaGwo/03QI9sCWehXLfMf284BjkmH+JSs1SYQnr/HuZR+P/UOSrEMYyikmboW
	 nY4BjUnJ/HIj6TCK+IaxjrE2x01VKTJ8jn0pyZMm6tJRb7ftYf9JRBuu9fpMJg6I07jf3
	 Fj8SWfULjaVzvfWRj2lGDMq28tPVgxjicDY2RvpBe8zogXxij2gnTKU2d+TgfW6xloKXi
	 Lx6IN4Y09CViY2OlsUeCVR9ycCTR89Nm+w5EydOrfJB6NP22PGF1zuvQI14tPIF5hXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Fv9gnku/";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063A606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3063A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fv9gnku/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302116; x=1826838116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4KO/xBTw7cYez5CEie5Bz72DPZmNdxGWecLzY08VTiM=;
  b=Fv9gnku/B4YVHi+JTZfiynaBoKTYsjxWpNas1sD/f7cUBJPa5dPVMuhk
   Swiqjr8zodAFvcuAjcB+O6JDQdu/UbbvGJirVi4kWdtkxl/KSB6SULXlV
   jOsCf428fcVorbzN7LSaIxS4TS6jAem6F8GScfGuD0baNHKjcU3sV0CId
   KKrvMb8tSxIor2gW+qrXMqvVVIVuDSNQN+mZPiZopJBgELhQBhbVsK7Cq
   OoCeABuhof7CDySODDGcnJkqnxIGuddxCgQjErU8lvoWxFVpGz8K92JhE
   /m+jNpd1oqV/37mc0HMcRHRJm6sMgezZWnJTnpkKa5TnuI+ZULuWYmn4P
   w==;
X-CSE-ConnectionGUID: yR5doDeDRT2ht+l57DqhlA==
X-CSE-MsgGUID: /EVJr9xZSZyPbkx8ogN4Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040233"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:01:56 -0800
X-CSE-ConnectionGUID: CJ2IylyPRhWTjtUVkGUolQ==
X-CSE-MsgGUID: mDEybqK7RR2vi1aXEkvCxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857065"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:01:50 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 0BD5A33BC2;
	Sat, 21 Nov 2026 23:01:47 +0000 (GMT)
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
Subject: [PATCH net-next v7 08/15] iavf: temporary rename of IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1
Date: Sat, 21 Nov 2026 23:55:35 +0100
Message-ID: <20261121230123.316391-9-przemyslaw.kitszel@intel.com>
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
index aac942ffae43..6af196467c5d 100644
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
index 1057c6158caa..4361ac225f47 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -5478,7 +5478,7 @@ static int iavf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_master(pdev);
 
 	netdev = alloc_etherdev_mq(sizeof(struct iavf_adapter),
-				   IAVF_MAX_REQ_QUEUES);
+				   IAVF_MAX_REQ_QUEUES_VCV1);
 	if (!netdev) {
 		err = -ENOMEM;
 		goto err_alloc_etherdev;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c b/drivers/net/ethernet/intel/iavf/iavf_virtchnl.c
index 6113541527d4..68a47bdf3dcc 100644
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
2.51.1

