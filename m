Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839177;
	b=KTxy2nEAexzg4HL/vvHClFhLkPciQxgcI2npoeOxYC7cLQxOa476QuOL7iLCTx9NxtQy
	 ug3TZem6jWCI2C5kFh3m9I7cuSP80QCVJrT1I/7mdH55N0pT61hC5OLxTeADjVRD22JBH
	 lOMi097hZ4elL8/nAQFLGqCcogXjGcmZyjMRbTEe34ydLdHhoszwxSMO11s8LWDbMUgQ5
	 /6Tl/tRUR1YUu0b4grgMFqU3LZa18ZmhYcS7JqWEZTZRxoqjd81DtTjzeU4sjfjtSIi4j
	 LZBo6lsrwD1MBNRSq9ZgXFxrE6gVAnFEJOBR6BC7XdHkmiB57NwnTVAibgM2k80Y66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839177;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/qgRLj3TmLlduzU95fYB0bv19eiLNro4gaBf8+k1+HY=;
	b=AfyKjwUMhrcEFHo1zuLlryjz2OsF1Kjo7rGU73/4EDi8+GcliFu4xDpRL2NKudbhpFRE
	 q4CIadXyO5BLe/VPTEn41O4hW4altS+i44ZWVhcu6Cp1DjoQDMOin4T8DAk3hojL58Y/J
	 1uzt9clH3JbcdftCVmtuSxE0HeMKCxLhfKb9E3+Pp9373MHl/r8/+nLjJuiacrappOTmz
	 BZCUf0qQhTlYTSgKSnvm+XQp1N0ZEZ4bF507MXO7Ns03Fs9g59oHkzpIhgSSSZn8ZFLKZ
	 RIRMsPuXshGafDcS6qjUJmMTy7Wyejzs30ZOEQuY4yQWChsn6sJRTbMcZGz6WfK+gFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRNDTKs3;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BDF606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BDF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TRNDTKs3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794839177; x=1826375177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2S9FJWQ8eg2XQeZkt0K4aKR0oKr54HfahBoAfcBqMxU=;
  b=TRNDTKs3OQDJZLvYrmNlAEFTkMYgtk8+tVxVx39Pv7hbjhmcVnCFYFGN
   m0eZYU8OnD2buL+MFw6YoghqXx0eNBoU2EnjW+gjVjz2WkMOiKIvhEb0Z
   7QhWfStdOQwxJ2nwCftMDlsG/FCk97aUP0cTaT0+DxxRbCBzYVp5yI2CG
   TuKOux9mFgKRexkIu8ksmrkwayubJSG4UUL5mqKK/eg9IEIcQIco2F6iq
   LILG3BHx/wB9EwI8+a93QZCYfG2mYtKkZ52oZClNzb3qFuuTRZbrl6WgP
   SbbJvuPF23uW9n/S7vaxQvJAnFtXgFbJFjM5LjOjmNQeCruFQtaYS44wJ
   Q==;
X-CSE-ConnectionGUID: IaBCM4TiQ3GAHqRAqZnMuQ==
X-CSE-MsgGUID: fv5GdMBrRZ2vVNaxrvKbuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3573476"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3573476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:26:16 -0800
X-CSE-ConnectionGUID: NHHL3YkpSTacNz5YZWYn3w==
X-CSE-MsgGUID: dlXz3nb0SYmaNHgGNDny4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9809209"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2026 06:26:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B935C9B; Mon, 16 Nov 2026 15:26:13 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/3] net: thunderbolt: Stop queueing Rx buffers if allocation fails
Date: Mon, 16 Nov 2026 15:26:11 +0100
Message-ID: <20261116142613.876208-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116142613.876208-1-mika.westerberg@linux.intel.com>
References: <20261116142613.876208-1-mika.westerberg@linux.intel.com>
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

Sashiko pointed out that there is a bug in the driver when Rx buffer
allocation fails, we silently release the memory but leave the
descriptor in the hardware ring. This could cause all kinds of memory
corruption to happen. Fix this by making tbnet_alloc_rx_buffers() not
release the buffers already queued and modify the call sites accordingly.

If tbnet_poll() runs out of Rx buffers and was not able to post new ones
it keeps the polling enabled to allow retrying the allocation in the
next pass. We prevent tbnet_poll() from being called when the connection
is torn down and buffers are released by disabling NAPI before the rings
are stopped (and enabling it only after the rings are started and Rx
buffers are filled in).

Fixes: e69b6c02b4c3 ("net: Add support for networking over Thunderbolt cable")
Closes: https://sashiko.dev/#/patchset/20260902082128.1148463-1-mika.westerberg%40linux.intel.com
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/net/thunderbolt/main.c | 84 +++++++++++++++++++++++++---------
 1 file changed, 62 insertions(+), 22 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index cf51b9c39f4e..1593ad76e645 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -154,6 +154,7 @@ struct tbnet_ring {
  * @handler: ThunderboltIP configuration protocol handler
  * @dev: Networking device
  * @napi: NAPI structure for Rx polling
+ * @napi_enabled: Is NAPI currently enabled
  * @stats: Network statistics
  * @skb: Network packet that is currently processed on Rx path
  * @command_id: ID used for next configuration protocol packet
@@ -185,6 +186,7 @@ struct tbnet {
 	struct tb_protocol_handler handler;
 	struct net_device *dev;
 	struct napi_struct napi;
+	bool napi_enabled;
 	struct tbnet_stats stats;
 	struct sk_buff *skb;
 	atomic_t command_id;
@@ -366,6 +368,21 @@ static void tbnet_free_buffers(struct tbnet_ring *ring)
 	ring->prod = 0;
 }
 
+static inline void tbnet_napi_enable(struct tbnet *net)
+{
+	napi_enable(&net->napi);
+	net->napi_enabled = true;
+	/* Run once in case an Rx interrupt arrived while NAPI was disabled */
+	napi_schedule(&net->napi);
+}
+
+static inline void tbnet_napi_disable(struct tbnet *net)
+{
+	if (net->napi_enabled)
+		napi_disable(&net->napi);
+	net->napi_enabled = false;
+}
+
 static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 {
 	netif_carrier_off(net->dev);
@@ -404,6 +421,8 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 		if (ret)
 			netdev_warn(net->dev, "failed to disable DMA paths\n");
 
+		tbnet_napi_disable(net);
+
 		tb_ring_stop(net->rx_ring.ring);
 		tb_ring_stop(net->tx_ring.ring);
 		tbnet_free_buffers(&net->rx_ring);
@@ -506,7 +525,7 @@ static unsigned int tbnet_available_buffers(const struct tbnet_ring *ring)
 static int tbnet_alloc_rx_buffers(struct tbnet *net, unsigned int nbuffers)
 {
 	struct tbnet_ring *ring = &net->rx_ring;
-	int ret;
+	int ret = 0;
 
 	while (nbuffers--) {
 		struct device *dma_dev = tb_ring_dma_device(ring->ring);
@@ -524,14 +543,16 @@ static int tbnet_alloc_rx_buffers(struct tbnet *net, unsigned int nbuffers)
 		tf->page = dev_alloc_pages(TBNET_RX_PAGE_ORDER);
 		if (!tf->page) {
 			ret = -ENOMEM;
-			goto err_free;
+			break;
 		}
 
 		dma_addr = dma_map_page(dma_dev, tf->page, 0,
 					TBNET_RX_PAGE_SIZE, DMA_FROM_DEVICE);
 		if (dma_mapping_error(dma_dev, dma_addr)) {
+			__free_pages(tf->page, TBNET_RX_PAGE_ORDER);
+			tf->page = NULL;
 			ret = -ENOMEM;
-			goto err_free;
+			break;
 		}
 
 		tf->frame.buffer_phy = dma_addr;
@@ -540,16 +561,19 @@ static int tbnet_alloc_rx_buffers(struct tbnet *net, unsigned int nbuffers)
 		trace_tbnet_alloc_rx_frame(index, tf->page, dma_addr,
 					   DMA_FROM_DEVICE);
 
-		tb_ring_rx_more(ring->ring, &tf->frame);
+		ret = tb_ring_rx_more(ring->ring, &tf->frame);
+		if (ret) {
+			dma_unmap_page(dma_dev, dma_addr, TBNET_RX_PAGE_SIZE,
+				       DMA_FROM_DEVICE);
+			__free_pages(tf->page, TBNET_RX_PAGE_ORDER);
+			tf->page = NULL;
+			break;
+		}
 
 		ring->prod++;
 	}
 
 	tb_ring_notify(ring->ring);
-	return 0;
-
-err_free:
-	tbnet_free_buffers(ring);
 	return ret;
 }
 
@@ -678,7 +702,9 @@ static void tbnet_connected_work(struct work_struct *work)
 
 	ret = tbnet_alloc_tx_buffers(net);
 	if (ret)
-		goto err_free_rx_buffers;
+		goto err_stop_rings;
+
+	tbnet_napi_enable(net);
 
 	ret = tb_xdomain_enable_paths(net->xd, net->local_transmit_path,
 				      net->tx_ring.ring->hop,
@@ -686,7 +712,7 @@ static void tbnet_connected_work(struct work_struct *work)
 				      net->rx_ring.ring->hop);
 	if (ret) {
 		netdev_err(net->dev, "failed to enable DMA paths\n");
-		goto err_free_tx_buffers;
+		goto err_napi;
 	}
 
 	netif_carrier_on(net->dev);
@@ -695,13 +721,13 @@ static void tbnet_connected_work(struct work_struct *work)
 	netdev_dbg(net->dev, "network traffic started\n");
 	return;
 
-err_free_tx_buffers:
-	tbnet_free_buffers(&net->tx_ring);
-err_free_rx_buffers:
-	tbnet_free_buffers(&net->rx_ring);
+err_napi:
+	tbnet_napi_disable(net);
 err_stop_rings:
 	tb_ring_stop(net->rx_ring.ring);
 	tb_ring_stop(net->tx_ring.ring);
+	tbnet_free_buffers(&net->rx_ring);
+	tbnet_free_buffers(&net->tx_ring);
 	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
 	tbnet_connect_failed(net);
 }
@@ -826,9 +852,16 @@ static bool tbnet_check_frame(struct tbnet *net, const struct tbnet_frame *tf,
 static int tbnet_poll(struct napi_struct *napi, int budget)
 {
 	struct tbnet *net = container_of(napi, struct tbnet, napi);
-	unsigned int cleaned_count = tbnet_available_buffers(&net->rx_ring);
 	struct device *dma_dev = tb_ring_dma_device(net->rx_ring.ring);
-	unsigned int rx_packets = 0;
+	unsigned int cleaned_count, rx_packets = 0;
+	bool no_buffers = false;
+
+	if (!budget)
+		return 0;
+
+	/* Buffers a previous run was not able to return to the ring */
+	cleaned_count = tb_ring_size(net->rx_ring.ring) -
+			tbnet_available_buffers(&net->rx_ring);
 
 	while (rx_packets < budget) {
 		const struct thunderbolt_ip_frame_header *hdr;
@@ -845,7 +878,9 @@ static int tbnet_poll(struct napi_struct *napi, int budget)
 		 * time.
 		 */
 		if (cleaned_count >= MAX_SKB_FRAGS) {
-			tbnet_alloc_rx_buffers(net, cleaned_count);
+			if (tbnet_alloc_rx_buffers(net, cleaned_count) ==
+			    -ENOMEM)
+				no_buffers = true;
 			cleaned_count = 0;
 		}
 
@@ -917,12 +952,20 @@ static int tbnet_poll(struct napi_struct *napi, int budget)
 		}
 	}
 
-	if (cleaned_count)
-		tbnet_alloc_rx_buffers(net, cleaned_count);
+	if (cleaned_count &&
+	    tbnet_alloc_rx_buffers(net, cleaned_count) == -ENOMEM)
+		no_buffers = true;
 
 	if (rx_packets >= budget)
 		return budget;
 
+	/*
+	 * We were not able to fill the RX ring for more buffers on this
+	 * run. Keep the polling enabled to retry the allocation.
+	 */
+	if (no_buffers && !tbnet_available_buffers(&net->rx_ring))
+		return budget;
+
 	napi_complete_done(napi, rx_packets);
 	/* Re-enable the ring interrupt */
 	tb_ring_poll_complete(net->rx_ring.ring);
@@ -988,7 +1031,6 @@ static int tbnet_open(struct net_device *dev)
 	tb_ring_throttling(net->tx_ring.ring, TBNET_THROTTLING);
 	tb_ring_throttling(net->rx_ring.ring, TBNET_THROTTLING);
 
-	napi_enable(&net->napi);
 	start_login(net);
 
 	return 0;
@@ -998,8 +1040,6 @@ static int tbnet_stop(struct net_device *dev)
 {
 	struct tbnet *net = netdev_priv(dev);
 
-	napi_disable(&net->napi);
-
 	cancel_work_sync(&net->disconnect_work);
 	tbnet_tear_down(net, true);
 
-- 
2.50.1

