Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195817;
	b=PHgUwK2Qt75CSMr4k2IzuJWTw+l58dq3rjeuaIZL9amhrq0LWbey6eH0/1Bof+twd9pU
	 lFztV45wSAf21/7zNm3SV60GlS415iVMEsx+LVvBqHkmXB4JUJ0uYZ1HCsisPxrIul7dC
	 0XA8nqW9QX2b4+S/G7ZsoEY+3dm1p8dH2tmlcME+6OeCGOSX2DgKZTl0EYCpfo+cHx74n
	 Iw7mdkF0JKZU1OTsK7ncEpuqLlLtQ2CWAUhaASV2OV2yojarDTEi8O2QFpNiREwyykISN
	 fijYkpyYz4bcDFlKJmrNXgZijvZemkhhhwEKEHb1ykIJizX3zBTvFB7IKecvgwHx/rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195817;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=CliUf9wWtLphNXrURkVWfQ2vvLyIgTwN1dNuqjceY6k=;
	b=Ksy5pENX3RJ8mcE2jomFk08FW3gnhyME/P5XJC9qzTrrRa0VTQmGfgYtLP9X5bF8WSBF
	 jpo/VG9cRFZL1leKfqyir/PmriqRzR+QLDlV8SLVPQVyI/VHMN/s8wW3IbQHK9+MZkasX
	 1upO1hH/Da3dDXGHt9x8hu0MKMY5dgDCaDHkeogeLzdKc/tC1S8zt4TwIniIGtFs9sQAL
	 P+O45hVxnz2n4OF5b7Tggn+qD6piNLuyg8p6YwtaINKFTfo2KsvhPA0Prl1pTm7jq9HiB
	 2sYQCmebza7FduRL14Ew893RLt5qQti3ArKbmS5EhJGSvULLJlIfUxrOToCWVvCHYRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WNPVgaA8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D928F606A33C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WNPVgaA8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AD31F000D4;
	Fri, 20 Nov 2026 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195817;
	bh=CliUf9wWtLphNXrURkVWfQ2vvLyIgTwN1dNuqjceY6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WNPVgaA8XbFVbCNTTWTrnjnc7sOLRUrr2otG5wIoTx3eCzrLIH2ZwWBqz7k0D2Dgp
	 9psiOQssS5M+uWtfA/PCNRcywVZL2tRozANDKWwYFSI3dssidbAxaujctF8k+DqJeI
	 dIj1h54XwedJPV3QKvu19paK4/e3/ELRw/QNuaAPwtVUFhfCOWawpQlDGX/s6tGn4o
	 KmOrutSzvEeXCIm+Df+GefCDOBjz1yp6Fo8sRcf/ydagy1o6FYC7G2z4gE0pZBrNj6
	 x/q+0zYG8IQumDL6OfQ1rrQB/2/OKLNUKgR8x1qcM6hPr2s4bII+0nihJ3Xwy9GRqB
	 4BJe49OZ31kjg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:33 +0100
Subject: [PATCH net-next v9 14/14] net: ethernet: cortina: Scale Gemini RX
 queues to system memory
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-14-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The default RX queues contain 512 descriptors per port. The shared
software free queue is sized at twice their combined capacity, requiring
4 MiB of page fragments even on Gemini systems with only 32 or 64 MiB of
RAM.

Choose smaller default RX queues on memory-constrained systems. Use 256
descriptors per port and a 2 MiB free queue with at most 64 MiB of RAM,
and 128 descriptors per port with a 1 MiB free queue with at most 32 MiB.
Keep the existing defaults on systems with more memory.

This preserves the existing relationship between RX descriptor capacity
and the free queue. Users can still override the defaults with ethtool.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 3d121eec8873..ae59970e0f82 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/bitmap.h>
 #include <linux/init.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/net.h>
 #include <linux/platform_device.h>
@@ -37,6 +38,7 @@
 #include <linux/skbuff.h>
 #include <linux/phy.h>
 #include <linux/crc32.h>
+#include <linux/sizes.h>
 #include <linux/ethtool.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
@@ -509,6 +511,17 @@ static int gmac_pick_rx_max_len(unsigned int max_l3_len)
 	return -1;
 }
 
+static unsigned int gmac_pick_rxq_order(void)
+{
+	if (totalram_pages() <= (SZ_32M >> PAGE_SHIFT))
+		return DEFAULT_GMAC_RXQ_ORDER - 2;
+
+	if (totalram_pages() <= (SZ_64M >> PAGE_SHIFT))
+		return DEFAULT_GMAC_RXQ_ORDER - 1;
+
+	return DEFAULT_GMAC_RXQ_ORDER;
+}
+
 static int gmac_init(struct net_device *netdev)
 {
 	struct gemini_ethernet_port *port = netdev_priv(netdev);
@@ -577,7 +590,7 @@ static int gmac_init(struct net_device *netdev)
 	writel(sw_weigh.bits32,
 	       port->dma_base + GMAC_TX_WEIGHTING_CTRL_1_REG);
 
-	port->rxq_order = DEFAULT_GMAC_RXQ_ORDER;
+	port->rxq_order = gmac_pick_rxq_order();
 	port->txq_order = DEFAULT_GMAC_TXQ_ORDER;
 	port->rx_coalesce_nsecs = DEFAULT_RX_COALESCE_NSECS;
 

-- 
2.56.1

