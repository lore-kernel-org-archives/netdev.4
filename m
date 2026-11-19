Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106808;
	b=Q9PtRn61mjLXLrL60owvWsJ4Qvma/NPoSnRk9yVWRhEw1985FLqu3VFrI3ePqCIqq3rO
	 YdsaB5Hx+BzlWQCQcH2bwdPICG9Gonxrkf7+fFrou+El4YPAI+GHmyfYf283r7nWErv/R
	 /qG3ka0dBtcHXNxOmtHyXRHANT8MUOEvMMTbJc9iu2Y2RRRXgRoeMWFqzmBh/3SoDDnZa
	 ETWLLPrRulsjjbympb8e7uq3Wrjfcn+llqT1QBE29nqMiZU/exJaIV8D7Tu3GXArQjbtc
	 0qK2y+aoTWvhyGZ00wCzvNOXcMVH0gKlqebW4IGaGH0uTfvjjwGxCbpLhPVhGKvSwaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106808;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=v5I0JfCt+2h9iMujFxbhWPUqraa/Wr+tvCoGhxYu0v0=;
	b=EG6ECmS1TxDnH2xgJiYim91sknvpGTEFQA/Z6H/bIB1e6po4y+DMXzQrFX69sx+hnCO1
	 GnZunsdJ0vJ2zYq42YC7BpKmS7ZNWkMLcFrTYbzZLhc2PsQ7VGfNNFkcMqxcGOIXBJqiX
	 1+IgWBeCK56SqYhp/HsOSVAAQ+KP0+I6P1HQ2qwgbZbtVelSSsu4qdUBhE41L+GFkPtXS
	 Thtr1TXu4XN/heXo4+0NfEdeUwEr3y5WKah1GPmeo2oycmwgqBUcYXVs1xtpwweab7krG
	 dSGE9waRI1RabyLHGoVeEBB7r6WLwdwZFIPAjT6tzlyc//LOH+3Dd48UbX5FRjcHW6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JjKuQNIu;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BC260A2604
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BC260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JjKuQNIu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795106808; x=1826642808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8XrJwvw7Vvxo2l7cIxqqcHVaiwoQNNCv1TSe5+vPFA8=;
  b=JjKuQNIuq2yVEgHevaLGvZmHYh/XV/IcTXZmsZywagXXR/LfjZRUrkVF
   k6fVG+cjj3YQiSBl9IFtZZIH5XtV3+D09Jj3Tv7XACWKiLDkH03wXoU6U
   hwlAcHyC7kKtRCCa0hhgqJ9EkwBAjGcbjeBbvUyQl3UwFMIn1CyRlV8w2
   CCFY82cG9+uH4CThkt8ZOgBVaBy5mE9cd/kUg8GRnGzzsO6asdueJJH8A
   lbWkOP+haW0jYBeQui6W9limKF/WcrZUGhHXTgv3z4ruuhbxNFJVtETc9
   h6hSJAiCdYw8fcgIkJ9qffcoWvPII2k0J/78V6/zkYHL9wnEBBU+U6Syd
   Q==;
X-CSE-ConnectionGUID: ldTTkU7/Sm2ldg4p/JfLTw==
X-CSE-MsgGUID: 4vNJV2+PR/CjFFPlypCGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3991078"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3991078"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:46:48 -0800
X-CSE-ConnectionGUID: Wh653/HwTwyA/xk1qQpAZQ==
X-CSE-MsgGUID: WhcSu+HoRv6CPgGxKIS3dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10843340"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2026 08:46:46 -0800
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
Subject: [PATCH v5 net-next 02/13] selftests: xsk: size the TX UMEM in HW_SW_MAX_RING_SIZE
Date: Thu, 19 Nov 2026 17:46:25 +0100
Message-Id: <20261119164636.1071385-3-maciej.fijalkowski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
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

HW_SW_MAX_RING_SIZE gives the RX UMEM 8k frames and 8k rings, then
sends batches of 2k and of the maximum HW TX ring size minus 8. This
only works in the single-interface mode, where the TX socket uses the
RX UMEM, and veth, which cannot change its ring sizes, skips the case.
With two interfaces, TX has its own UMEM of DEFAULT_UMEM_BUFFERS (1k)
frames and 2k rings: the in-flight limit in __send_pkts() turns
negative for a 2k batch, so TX never sends and RX times out, and the
second batch would not fit in the TX ring anyway.

The next patch removes the single-interface mode, so size the TX UMEM
like the RX one. The shared UMEM setup copies the RX UMEM over the TX
one and is not affected.

With a HW TX ring of more than 8200 descriptors, the second batch would
also outgrow the 8k XSK TX ring, and __send_pkts() would spin forever
waiting to reserve it, so cap the batch below the XSK ring size.
A HW TX ring of 8 descriptors or fewer would leave that batch empty
or underflow it, so skip the case on such a ring.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
---
 .../testing/selftests/net/lib/xsk/test_xsk.c  | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/lib/xsk/test_xsk.c b/tools/testing/selftests/net/lib/xsk/test_xsk.c
index 74eea4a4dfeb..0b2aa6919d72 100644
--- a/tools/testing/selftests/net/lib/xsk/test_xsk.c
+++ b/tools/testing/selftests/net/lib/xsk/test_xsk.c
@@ -2504,8 +2504,16 @@ int testapp_hw_sw_min_ring_size(struct test_spec *test)
 int testapp_hw_sw_max_ring_size(struct test_spec *test)
 {
 	u32 max_descs = XSK_RING_PROD__DEFAULT_NUM_DESCS * 4;
+	u32 batch_size;
 	int ret;
 
+	/* The second step sends batches of tx_max_pending - 8 descriptors. */
+	if (test->ifobj_tx->hw_ring_size_supp &&
+	    test->ifobj_tx->ring.tx_max_pending <= 8) {
+		ksft_print_msg("HW TX ring too small.\n");
+		return TEST_SKIP;
+	}
+
 	test->set_ring = true;
 	test->total_steps = 2;
 	test->ifobj_tx->ring.tx_pending = test->ifobj_tx->ring.tx_max_pending;
@@ -2513,6 +2521,9 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
 	test->ifobj_rx->xsk->umem->num_frames = max_descs;
 	test->ifobj_rx->xsk->umem->fill_size = max_descs;
 	test->ifobj_rx->xsk->umem->comp_size = max_descs;
+	test->ifobj_tx->xsk->umem->num_frames = max_descs;
+	test->ifobj_tx->xsk->umem->fill_size = max_descs;
+	test->ifobj_tx->xsk->umem->comp_size = max_descs;
 	test->ifobj_tx->xsk->batch_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
 	test->ifobj_rx->xsk->batch_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
 
@@ -2521,10 +2532,12 @@ int testapp_hw_sw_max_ring_size(struct test_spec *test)
 		return ret;
 
 	/* Set batch_size to 8152 for testing, as the ice HW ignores the 3 lowest bits when
-	 * updating the Rx HW tail register.
+	 * updating the Rx HW tail register. __send_pkts() waits until a whole batch fits
+	 * in the XSK TX ring, so keep it below that ring's size on NICs with larger rings.
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

