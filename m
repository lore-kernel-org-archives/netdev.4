Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646681;
	b=BT3QVs21tfueNfC89fhqT4HV68qRQbVnWFfs5AGkG/oOR/BUEeOFnEofHIijcfh//i3O
	 GN8soIfM2qWdRnYDq9qBhRYcTKVYNNCoXFWV0m1lV+65kNA7pziICEO/0sJPFWxKSDWvr
	 769RyFgaxOeAg8WTkReqy1wcKvCFmeeKvApzdwmVd7pJHyKYsRjfYTlEQXJ2JrGux+tdS
	 CTZOou7kw4tAFFhAtAO+VczkbCoQkKUiU9lTtIr1pGetEEdBAMgKCvgRfv0T4q4xBIQqt
	 QELyb88dl9V3HWNijsAM7cqh44+vBhFjqPPMmu1awHWwzMB4WWC1py4oz0OwO8VACag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646681;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oJrJyMNmrKL/ZQxW1vxX+5H2Q2kLOwqPRFLeu5FlTjE=;
	b=JPs7eqKaxeQDgC+vGRLvCRZGJorkXxwMsNHiMh0vmXXXZHYzWWe0m5ppvqDuXg1UUfFf
	 q8P8o1k3zLARrJmNxRB0sEjHVveN4XvrAvL+4nKQtoiUpBIcysUll2BNBwf6RfcqMI8TS
	 dRDpfHf06H/k4qKgBA95wNECnUGL0yLhhm7qNUe4ve+HR6edS5l8uR9QLtf0U7Vqap6Ec
	 Yiovu7RbHtuUeYPD5h0akKSrlkts6QShIzPIBPrSNh8k/OhoeicQa7MpsVDeIccJMoe+G
	 JEbtdvO53prwuyHj3MG0nsulUep7FVIf+hCI7uUdAAJbpsuS6R+QRjsIX0/WZBtmWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="cQwIxDu/";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689C606A33A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4689C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQwIxDu/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795646681; x=1827182681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e31Wfn10zItNjNrFueWWJQg9nRxpiz09nRpTqXBxlJQ=;
  b=cQwIxDu/8QI5r59QF6VU8KCqKqpI58X4NNqioG3RlYn65IoF4t9EPEv4
   TU4hjcLF4bDXIWFaGXJlehNrpY8HsivtYHjc4A/ttLznX+z7APgVIrxT7
   mT7MIIYxSl1D+xGuwzQMqciqCj2cvPEvI4PMlUwpuw7Xdty0DNZH44+ra
   57hNUQ8L4F4HsxOvBEeSDWtwOw7m3WVI3YYGdeqXGvkaWpnxU8mc/MWom
   VAN9viOyzB56Mq7vdoWanw79kaVZhAsVuEViwsCqzjyi0I6tg5D3uY8xS
   kch8o4J8uBmiTSquh5c8PQBI1ByLeROVYguZ968HvkIlnchZi7rlNOdiX
   A==;
X-CSE-ConnectionGUID: XQBx1XDzQHOePPh2iEp7vw==
X-CSE-MsgGUID: 7Yw73zTnSNKZTsc+ii75DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4449991"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4449991"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:44:38 -0800
X-CSE-ConnectionGUID: 1GAROXOBSdWxglMcSyAo9g==
X-CSE-MsgGUID: UfLSYSJ8T3SYelBlAGyQQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11862072"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 14:44:37 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	netdev@vger.kernel.org
Cc: Jacob Keller <jacob.e.keller@intel.com>,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	aaron.ma@canonical.com,
	maciej.machnikowski@intel.com,
	grzegorz.nitka@intel.com,
	paul.greenwalt@intel.com,
	maciej.fijalkowski@intel.com,
	richardcochran@gmail.com,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: [PATCH net 5/5] ice: fix computation of ETF timestamps for E830
Date: Wed, 25 Nov 2026 14:44:24 -0800
Message-ID: <20261125224428.4126195-6-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
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

From: Jacob Keller <jacob.e.keller@intel.com>

When Earliest TxTime First offload is enabled, the ice_tx_map() function
computes the appropriate timestamps for the timestamp ring used to set the
transmit times for each packet.

It computes this by converting the skb->tstamp into a timespec and then
taking the sub-second portion from tv_nsec and dividing it by the timestamp
resolution. This value is then inserted into the timestamp descriptor using
ice_build_tstamp_desc().

At first glance this may seem reasonable. After all, the Tx timestamp
descriptor field has a mask defined by ICE_TXTIME_STAMP_M which is
GENMASK(31,13). This is a 19-bit wide field. With a unit size of 128
nanoseconds, the maximum representable time is only ~67 milliseconds, far
below the size of the tv_nsec field (just shy of one second).

The E830 device time is represented as a single 64-bit nanosecond value as
seen by ice_ptp_read_src_clk_reg() using a simple rd64 on the GLTSYN_TIME_L
register.

According to the data sheet, the hardware uses the following flow to
determine when to transmit the next packet in the paced queue:

  half_window = window_size / 2
  if (ts <= timer) {
    if (timer - ts < half_window) {
      // timestamp expired
      pass
    } else {
      // wait before sending
      stall
    }
  } else {
    // Handle possible rollover case
    if (ts - timer < half_window) {
      // wait before sending
      stall
    } else {
      // timestamp expired
      pass
    }
  }

Here, window_size is the maximum value that fix in the 19 bit sized
timestamp field, ts is the next packet timestamp waiting in the queue, and
timer is the 19 bits of the GLTSYN_TIME MAC timer. The configured timestamp
"resolution" determines at which bit position to capture from the
GLTSYN_TIME registers. This logic does not perform any computation to
divide out seconds or to handle anything like a timespec. The timestamp and
timer values are compared directly with logic to account for handling
rollover.

Because of the faulty logic, all of the timestamps computed and placed in
the ring will result in the transmit time not matching the desired time per
the skb. Consider a timestamp exactly on a second boundary. The computed
timestamp will be 0, while the actual value should be (1,000,000,000 / 128)
mod 2^19 or 472,468 (0x73594).

Fix this by directly converting the ktime to nanoseconds rather than
converting to a timespec64.

Fixes: ccde82e90946 ("ice: add E830 Earliest TxTime First Offload support")
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_txrx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_txrx.c b/drivers/net/ethernet/intel/ice/ice_txrx.c
index 35a480a1e172..ca98394caa04 100644
--- a/drivers/net/ethernet/intel/ice/ice_txrx.c
+++ b/drivers/net/ethernet/intel/ice/ice_txrx.c
@@ -1522,10 +1522,9 @@ ice_tx_map(struct ice_tx_ring *tx_ring, struct ice_tx_buf *first,
 
 	if (ice_is_txtime_cfg(tx_ring)) {
 		struct ice_tstamp_ring *tstamp_ring;
-		u32 tstamp_count, j;
 		struct ice_ts_desc *ts_desc;
-		struct timespec64 ts;
-		u32 tstamp;
+		u32 tstamp_count, j;
+		u64 tstamp;
 
 		smp_rmb();	/* order flag read before pointer read */
 		tstamp_ring = READ_ONCE(tx_ring->tstamp_ring);
@@ -1535,8 +1534,8 @@ ice_tx_map(struct ice_tx_ring *tx_ring, struct ice_tx_buf *first,
 		tstamp_count = tstamp_ring->count;
 		j = tstamp_ring->next_to_use;
 
-		ts = ktime_to_timespec64(first->skb->tstamp);
-		tstamp = ts.tv_nsec >> ICE_TXTIME_CTX_RESOLUTION_128NS;
+		tstamp = ktime_to_ns(first->skb->tstamp);
+		tstamp >>= ICE_TXTIME_CTX_RESOLUTION_128NS;
 
 		ts_desc = ICE_TS_DESC(tstamp_ring, j);
 		ts_desc->tx_desc_idx_tstamp = ice_build_tstamp_desc(i, tstamp);
-- 
2.47.1

