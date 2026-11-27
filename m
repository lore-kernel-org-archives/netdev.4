Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791959;
	b=qCxdgxXCfDdqA4XxFRlNAVMPKEvfelEalRfLKtSBqCHbPrui9DU9qxYRcOTTubfy11zA
	 jHA1ius6N+3Ps9Ja5KmMvfA8A8eLVnbYylf9cs+5YDvgpz+eShGbAvZFYVy4elHyyxXeo
	 rmWDn7+Hv++Hf5ynzPE1Yxqc7qUxxpoJJZRTJ45twgrSlq2sSLfbKa+PHwUfMs28jHTcE
	 cWdqQgkImUVmN+FRKePHyv3U/5tFAcakMG6s+RTUXqz5yPsbv1AK0L5D5xBTo2/Qpvdb5
	 wihEZ8t3CdWuctgyzNiTs9ilSEEUqltjXC1I8r+oOXyvclfuP0R/kbbnjsI+edEisuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791959;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=niZWL1YOknZl4pd7kUK6MH2qn4wkf9xsyRN04DOh9xc=;
	b=oh5CwaUz5PmRxS6fLHrLXnHD7EjqPgn+6XWtMgGhO6Yzpt71VjzrVhYDlJrh5AIDFbQd
	 AvmA/PESXgZvN9ojtiH6rMWVsHThBHRd5bChCzohWzFMJlj9Bas3sFqMtmakIZFqMfsE4
	 c4MtfLQUttIoEzMS+pW648+dhYQR9PsrddABLEkolEEW1Er7eZ0yabilCkb9KIO40xtQT
	 /as0tOZ+SUJc0UtEnQYVgO6sv8gTwkkXyqePQireSQATVDHf1+d0y1fRER7b9Te8fkykN
	 0eSPcQx17FJ3hlMVGuOLp5tvsbYiHTT/T8Btwuw6Rvej/XhNXOxDvIHfJbGbV5ddycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A53lR3Hu;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463B606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 15:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A463B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A53lR3Hu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795791958; x=1827327958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CTXeqMK7ANxxp7vYgMkTudOSVSMKFnjjIP5lQZ7axW0=;
  b=A53lR3Hukd8w5EYQux7gN7HXLGqR+5z/GmVT0wJlpFv99UT0pMlE7Ufx
   xOrLptAwvsD7YRejUMLXbG0WwSgVRVQjENFp5SAyCFsK+BmnLVQDc25KE
   zsT2Jv6m/n0wFUGBqC1X/6iBUxPFuJdAtWA5d/nOZvUNqcARFYUAEtOD/
   kFW64uRaM7gt5K8y0DaAcEV1y6bpZMxKQHjb4yZQZybX1EkWdQFcbnl01
   NSaxPSNfYp1vhngD+lh5zrozhkMShQ+7tbyNwyaqLiQLP6hrIwAaQ8bcY
   XhR5WOsJo6mqXq/iZnVsnb2i3K/0MG7ak/ZSxowNKP1WYxW1i04IcfYbP
   g==;
X-CSE-ConnectionGUID: B64Nxc91TcOLsx/nJwg35A==
X-CSE-MsgGUID: 2rytkRMcTJi0jvoIS8uKVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4666001"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4666001"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:05:54 -0800
X-CSE-ConnectionGUID: bzkoEHm7R3SmI+QllFgYQQ==
X-CSE-MsgGUID: a7gBqPEKQyS0MRJGMqn20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12202660"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 07:05:52 -0800
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com,
	stfomichev@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tushar.vyavahare@intel.com,
	kerneljasonxing@gmail.com,
	bjorn@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: [PATCH v6 net-next 03/15] selftests: xsk: size the TX UMEM in HW_SW_MAX_RING_SIZE
Date: Fri, 27 Nov 2026 16:05:15 +0100
Message-Id: <20261127150527.1122049-4-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
References: <20261127150527.1122049-1-maciej.fijalkowski@intel.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HW_SW_MAX_RING_SIZE sizes the RX UMEM and rings for 8k frames, but on
two NIC ports TX has its own default UMEM of 1k frames and 2k rings.
The in-flight limit in __send_pkts() then goes negative for a 2k batch,
so TX never sends and RX times out. Size the TX UMEM like the RX one.

The second batch, the HW TX ring size minus 8, does not fit the 8k UMEM
and XSK TX ring either once the HW TX ring has 8200 descriptors or
more, as on nfp, octeontx2 and fbnic. Cap it 8 below their size, and
skip the case on a HW TX ring of 8 descriptors or fewer.

Fixes: c53908b254fc ("selftests/xsk: Add new test case for AF_XDP under max ring sizes")
Fixes: e4a195e2b95e ("selftests/xsk: Enhance batch size support with dynamic configurations")
Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index 73f6e0302ee3..850bbd20c405 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -2482,8 +2482,18 @@ int testapp_hw_sw_min_ring_size(struct test_spec *test)
 int testapp_hw_sw_max_ring_size(struct test_spec *test)
 {
 	u32 max_descs = XSK_RING_PROD__DEFAULT_NUM_DESCS * 4;
+	u32 batch_size;
 	int ret;
 
+	/* The second step sends batches of min(tx_max_pending, max_descs) - 8
+	 * descriptors.
+	 */
+	if (test->ifobj_tx->hw_ring_size_supp &&
+	    test->ifobj_tx->ring.tx_max_pending <= 8) {
+		ksft_print_msg("HW TX ring too small.\n");
+		return TEST_SKIP;
+	}
+
 	test->set_ring = true;
 	test->total_steps = 2;
 	test->ifobj_tx->ring.tx_pending = test->ifobj_tx->ring.tx_max_pending;
@@ -2491,6 +2501,9 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
 	test->ifobj_rx->xsk->umem->num_frames = max_descs;
 	test->ifobj_rx->xsk->umem->fill_size = max_descs;
 	test->ifobj_rx->xsk->umem->comp_size = max_descs;
+	test->ifobj_tx->xsk->umem->num_frames = max_descs;
+	test->ifobj_tx->xsk->umem->fill_size = max_descs;
+	test->ifobj_tx->xsk->umem->comp_size = max_descs;
 	test->ifobj_tx->xsk->batch_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
 	test->ifobj_rx->xsk->batch_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
 
@@ -2498,11 +2511,15 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
 	if (ret)
 		return ret;
 
-	/* Set batch_size to 8152 for testing, as the ice HW ignores the 3 lowest bits when
-	 * updating the Rx HW tail register.
+	/* Keep the batch 8 below the HW TX ring size, as the ice HW ignores
+	 * the 3 lowest bits when updating the Rx HW tail register. Keep it 8
+	 * below max_descs, the UMEM and XSK TX ring size, too: __send_pkts()
+	 * sends only while fewer packets than the UMEM size minus a batch are
+	 * in flight, and reserves a whole batch in the TX ring.
 	 */
-	test->ifobj_tx->xsk->batch_size = test->ifobj_tx->ring.tx_max_pending - 8;
-	test->ifobj_rx->xsk->batch_size = test->ifobj_tx->ring.tx_max_pending - 8;
+	batch_size = min(test->ifobj_tx->ring.tx_max_pending, max_descs) - 8;
+	test->ifobj_tx->xsk->batch_size = batch_size;
+	test->ifobj_rx->xsk->batch_size = batch_size;
 	if (pkt_stream_replace(test, max_descs, MIN_PKT_SIZE)) {
 		clean_sockets(test, test->ifobj_tx);
 		clean_sockets(test, test->ifobj_rx);
-- 
2.43.0

