Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528108;
	b=EnZqDahQVFdBjOjHYB/eUlj1mWT/r/k3hUHhpMcT0t9FwtkZEy6xGl3WuD3RhJ6d9VLL
	 smBOgYyeaYmYJRhfUiDI2HOdtHs/yKoGgkmoMSb43nKBn7FADDx/JdBXbURr0e6F0k6m1
	 ai+5Dko2MrCbqZuG0OQ0g6F0tWyyi2SgnEovkj8ucE+mY/bhTatGPQUPDBD9MWllyJJHH
	 FNexruku8kKAlJByqhok6RNwr7LuVYIizt20+G9Hljw/PhvIHNZ3m0jhBITe4Y0kSEIcY
	 irsYAAWkd0eYJiVr9RcZLYy2GfRh3P85pxnp2cU6UDvvsAnZKPQBGNFC22lT/fDpD7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528108;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=H3HzkJ3eAfuZxORPRV2t89lQWTxfNrd4ATqlb+lCfrI=;
	b=cIuEnfLx3fUHu0vmaqjOUtgxXKIjXg+2Ygs+FU0SfnXxeFPXUerAdGWT/JB3OIDXEewJ
	 bEh0cuFCM5CZpQXi6f0/ABGyh6j2RceugXPa9eHJvg+Q5lwHEclWfQiYFtBjIlqTaEgxk
	 H8sSXBRLhRkh5FjRKfQQz0KOeMTbNN2ssTuKI8Mu7Cw/B/R97D7y8YtD2FiGUnclJCNUI
	 LpLztmLxC5HVNbrzudlc5qdan4ybA9SQ30CYc9D2ObAqcBC9R21TPjbNwy4jE/cTFZNae
	 HLphTI3XcRrNBFmhTANR5Wyx6cZZlla17K2s+r6JtcYN+I4sUDtykKX0lO7mvUFAtqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nK1rv32J;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D6606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 654D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nK1rv32J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795528106; x=1827064106;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9D7pWatnu/Ch7Ny2SHbAEDFYUjmmim756vS1y6CkE4Q=;
  b=nK1rv32JSddHYXen3J+e32hXIF7w0dNLMhtCnq7wj2HGEZm04JJVmAB1
   wScms/wfkC+8XqyFhbm/QwxmapMDL6gBmdKHkr1n/TvL1BCBrH78zdhcN
   NL2vXdvCQyJFRdjt+K3JKzCc2Jc1pIrHHKmZcgHYqtEf+vVZhNGKv7jCm
   gPC/4KY54v5acUdop83tygy3oDcbeHjsxf3v8z9Ju6tXb4zdJbzqciP/H
   Ce1wznlqLWQ8mgoNE1ppgeygrGWWQ2kbtJufxB0sBbnYB3spnVqdKA8BE
   vJI0xLYEuO0tMZkpM5X62H8ZhKGlz03sfpdIeyHChUEq0wp8oO9mD8uc8
   w==;
X-CSE-ConnectionGUID: zPRW2LsgS6e0Gm0LeLpHcA==
X-CSE-MsgGUID: eRF19i4oQFWVRlSgdPH+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4425024"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4425024"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 05:48:26 -0800
X-CSE-ConnectionGUID: BuxT4pe0SCqABxX6/reutA==
X-CSE-MsgGUID: fLhr3JsKRIeTeC+mONqJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="13255760"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by fmviesa012.fm.intel.com with ESMTP; 24 Nov 2026 05:48:23 -0800
From: Magnus Karlsson <magnus.karlsson@intel.com>
To: netdev@vger.kernel.org,
	magnus.karlsson@intel.com,
	magnus.karlsson@gmail.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	bjorn@kernel.org,
	kerneljasonxing@gmail.com
Subject: [PATCH net] xsk: parse Tx batches in packet units for all shared-UMEM pools
Date: Tue, 24 Nov 2026 14:48:08 +0100
Message-Id: <20261124134808.1103307-1-magnus.karlsson@intel.com>
X-Mailer: git-send-email 2.38.1
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

Zero-copy drivers that use xsk_tx_peek_release_desc_batch() are meant to
receive only complete packets of at most xdp_zc_max_segs descriptors.
Single-socket pools and shared-UMEM pools with XDP_UMEM_SG_FLAG get this
from xskq_cons_read_desc_batch(), which also drains invalid and
oversized packets. Shared-UMEM pools without XDP_UMEM_SG_FLAG still use
xsk_tx_peek_release_fallback(), which peeks one descriptor at a time,
on the assumption that such pools never carry multi-buffer packets.

That assumption does not hold. Descriptor validation accepts
XDP_PKT_CONTD whether or not the UMEM has XDP_UMEM_SG_FLAG, so
descriptors from such a pool can form multi-buffer packets, as they
already do on a single-socket pool. The fallback then hands the driver
a batch that can end in the middle of a packet, packets longer than
xdp_zc_max_segs, and, as xsk_tx_peek_desc() moves on to another socket
when the per-socket budget runs out, descriptors of another socket in
the middle of a packet. On ice, a packet with more than eight data
descriptors triggers a malicious driver detection event.

Use xsk_tx_peek_release_shared_desc_batch() for all shared-UMEM pools,
so that they are parsed like a single non-SG socket, and remove the now
unused fallback.

Implemented a test for this in xskxceiver that opens two sockets in
shared_umem mode and from one socket sends a packet with too many
fragments in between two single-fragment packets. Without this patch,
the NIC resets, but with it the two single-fragment packets are
received and the test passes.

Fixes: d5581966040f ("xsk: support ZC Tx multi-buffer in batch API")
Signed-off-by: Magnus Karlsson <magnus.karlsson@intel.com>
---
 net/xdp/xsk.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index ab2e4fa87a4f..7d0701e0e025 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -604,18 +604,6 @@ bool xsk_tx_peek_desc(struct xsk_buff_pool *pool, struct xdp_desc *desc)
 }
 EXPORT_SYMBOL(xsk_tx_peek_desc);
 
-static u32 xsk_tx_peek_release_fallback(struct xsk_buff_pool *pool, u32 max_entries)
-{
-	struct xdp_desc *descs = pool->tx_descs;
-	u32 nb_pkts = 0;
-
-	while (nb_pkts < max_entries && xsk_tx_peek_desc(pool, &descs[nb_pkts]))
-		nb_pkts++;
-
-	xsk_tx_release(pool);
-	return nb_pkts;
-}
-
 static void xsk_tx_commit_batch(struct xsk_buff_pool *pool,
 				struct xsk_tx_batch *batch)
 {
@@ -763,11 +751,6 @@ u32 xsk_tx_peek_release_desc_batch(struct xsk_buff_pool *pool, u32 nb_pkts)
 
 	umem_shared = !list_is_singular(&pool->xsk_tx_list);
 
-	if (umem_shared && !(pool->umem->flags & XDP_UMEM_SG_FLAG)) {
-		rcu_read_unlock();
-		return xsk_tx_peek_release_fallback(pool, nb_pkts);
-	}
-
 	/* This is the backpressure mechanism for the Tx path. Try to
 	 * reserve space in the completion queue for all packets, but
 	 * if there are fewer slots available, just process that many
-- 
2.38.1

