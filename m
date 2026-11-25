Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647118;
	b=0kD0QVxrs7tzSnIUbpUKnPwfSltFN2WjTA+EBlDsCJCp1Badic/WdiTOh42zDMXFFU8L
	 cHZwFkKpaVFH5NZjWyZBasoIEBWanmC5YEOgUeRzokhkin9E1dNcJAxieaWvRSez1Rv20
	 nBS5M19jg4RmeuzOXFuUoAtt9fAYBuOxhNNiE6uOkiP4BDWdmuJTcz5YxQxMB1bmTbghm
	 8ge8RiC8f9oh2oezPX8v8j/pmaStzOX1iJXwBrF2o78++UMlZyhVJXtfDie/SP3iW5rIz
	 ZQpkMHGvyBQ8EdefQaD5HJprgMP60MfEiGi9lgo1p+Bs/wvHuPJuncDp57tgSi806Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647118;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QAHcLA3ZamlEuLY5qeYNHPb/YVbjFpE8QoN3oZxH6M8=;
	b=FLez+JMnVgVkW58gPGdPFtM7tqp0gEWhsHp/mz77XodVoehFGIpXyQzPfw1kzLlT5aFe
	 BGa3VCTBvp30Of0CI+sa3apx2dlrg/Dy5Uu5YH2TouYRY/KGO6tvWM1E5GzI7mABhKjB2
	 UDXWVNrMR9/yY9ORlrXlORoUIy3nf95JoYSVK6f72ZTbUEqBhO8I6Vzs+Y85DJK41ZnK8
	 v0ZMsX/vV8XvhdmJmaVsM6N7mgcVzjyJdU5aPqjrOV9c0pw3Nq3yuURvp9MfFyH3kdl30
	 nPIFsJbg01P89MFpFtTrFCL3SCEC67Zu7d7lvDSwqBRqYUvCMW2zeofo1jHSZB9HqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hml7TZzJ;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5FC606A687
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5FC606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hml7TZzJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795647117; x=1827183117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kF5sZUD6R9dcktmP3VdQ09wxvGP8/tFxK3ZyJd+3w4U=;
  b=hml7TZzJsbk6qGz+UaTZDApttoITdVs8mpRnaEczCK/T72AIe7YnD5dG
   VWmqBJvo13XrWydfYtkN9RpqItGdteLXw+2O2ZcHLEvNViUL6uxf79lOw
   8pSJdHYnYf4R6dQQLdJdkhph5lfwzKs3IkHfwj2G5Cwbpoo7YabVNZ4xf
   wdFGoI5kyAHkVw0/ymSaI8IDgh3CBCSnyCOs8j1zuw9N079knstqei0A9
   VJss/mXJRSnbRqihCcoaD5A1BHfW0VeY0O0TbAB8+RljyAc5zLPC7/ByK
   FAZ9bMBdoEA191Rfhyewo1dDHcqmi9avJjOfuMZzh5tixdmeZKa2xxE90
   A==;
X-CSE-ConnectionGUID: m66wEWe0RBW8/4mVA/QzXA==
X-CSE-MsgGUID: dMQcgfdwQ3SAQ3Bx8q33ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4450653"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4450653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:51:54 -0800
X-CSE-ConnectionGUID: tdJvU1kCR0i2eivr9WjiUg==
X-CSE-MsgGUID: qjceYANMT7i9SqfJBh54dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11996933"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 14:51:55 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	netdev@vger.kernel.org
Cc: Yuho Choi <oss.patchbox@gmail.com>,
	anthony.l.nguyen@intel.com,
	tianxun.ng@bytedance.com,
	emil.s.tantilov@intel.com,
	richardcochran@gmail.com,
	milena.olech@intel.com,
	konstantin.ilichev@intel.com,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Rafal Romanowski <rafal.romanowski@intel.com>
Subject: [PATCH net 1/6] idpf: Fix vport IRQ name leak on request failure
Date: Wed, 25 Nov 2026 14:51:38 -0800
Message-ID: <20261125225145.4126333-2-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261125225145.4126333-1-anthony.l.nguyen@intel.com>
References: <20261125225145.4126333-1-anthony.l.nguyen@intel.com>
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

From: Yuho Choi <oss.patchbox@gmail.com>

idpf_vport_intr_req_irq() allocates a name for each vector IRQ before
calling request_irq(). On success, the name is released later through
kfree(free_irq()), but when request_irq() fails, the error path only
unwinds the previous vectors and the name for the failed one is leaked.

Free the allocated name on the request_irq() failure path, as done for
the mailbox IRQ in commit 9bff30482c10 ("idpf: Fix mailbox IRQ name leak
on request failure"). While at it, fail with -ENOMEM when the name
cannot be allocated instead of requesting the IRQ without a name.

Fixes: d4d558718266 ("idpf: initialize interrupts and enable vport")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Tested-by: Rafal Romanowski <rafal.romanowski@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index b346187bbf30..281b96daa5c1 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -4132,12 +4132,17 @@ static int idpf_vport_intr_req_irq(struct idpf_vport *vport,
 
 		name = kasprintf(GFP_KERNEL, "%s-%s-%s-%d", drv_name, if_name,
 				 vec_name, vector);
+		if (!name) {
+			err = -ENOMEM;
+			goto free_q_irqs;
+		}
 
 		err = request_irq(irq_num, idpf_vport_intr_clean_queues, 0,
 				  name, q_vector);
 		if (err) {
 			netdev_err(vport->netdev,
 				   "Request_irq failed, error: %d\n", err);
+			kfree(name);
 			goto free_q_irqs;
 		}
 
-- 
2.47.1

