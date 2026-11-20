Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195814;
	b=UXCNTo7v9VH9ot72y3PfKMvQPhrt6IBa48SCK/F90EmhZF30UU/YuixXlZc6mkLLbaDn
	 5d1drzowUs9OCjJysGpWyXF8BIe1Pzy8eH8Zb+BY/phlm/nzgdfzeVQtEqJT6/N9knnfu
	 QHZWMvQ2Eygmv75XnyecEboyRukd4ClEcQP8FbfE9OW4RvjipVNB7w5Tbd+70m3KcyxaZ
	 0a+iKdmopNiCd78vzj6CAztoD1NCGLFo4pyhp0vg5dPhjjS/3IYFEUGiHqaxn5ZCBQtFN
	 vR15gXFG1yXgNH4e9b3salZXTyK+vvVjTXpH/eCZ92vwZBFYm3QsvAHe3mmKciB0aFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195814;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=BKcwwYObM26g/xeWF/vvvFirK1lb/Hw2evlm/NlKvdE=;
	b=lD0FIvnODnaAIbOq7GysQEhRupqJd4g0VjGdQzeKa9RDz9W0953A9z6ffo0hEMOObh8v
	 nFXFnjKRTRIC96SxLw58oz3o2+HC6o91Q7rJZG2BD+ys86zKEnkiSG5XDD4h5MHywKfpx
	 U9w0mfXVLoffB+35QhLFQqLvOT3k+zurRDjezjSZJ30YJ++7VRJcKw/XVceykYRsutrvH
	 4/hhgbTp2UhlebwnN1K4yf1ZWwbhv70zDRz87Ewb3IAAZpuYpu8m4m3I2uPeXP2iAWVoy
	 2T32S993BmWzoZvtIWz3CzH/u8Y6iesfZW4ZI6ptISqYO3CFUm1MdmxhP/RkUNI5NMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cfcywSR/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA7160A2635
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfcywSR/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD5B1F000C6;
	Fri, 20 Nov 2026 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195813;
	bh=BKcwwYObM26g/xeWF/vvvFirK1lb/Hw2evlm/NlKvdE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cfcywSR/y6cY5+DzoBLb9ZwXrbr78izI4RJlCuTR4GcYDqy50Fq29D4l3ztQKcD3C
	 Bb1nHGz+U319tbq6B+D3/wErQ96ZomS9W3FuUMqv2I6Q4XHZeSev//jpedfC/3u8GI
	 xp6Hj9k0X/KWUBJJmnxBPrUD+yQ/ykmSgc0+iqcQgA1ehGLMEKME1YGjjC0Lzkjpt3
	 P3M8/uq4hk/NJXahR0Uj6txRqQG2wgNV3uviTbV+NGf2BmwvnCCmqJA3TN8Cx8iBZP
	 FKIL+2hux+UpdMiwkkRaVw1hM4pEd1NkfA71d49uBKhmwsHmgK4RxfbtTYvq9KcoPy
	 r8XIjWpTiHW+w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:32 +0100
Subject: [PATCH net-next v9 13/14] net: ethernet: cortina: Release partial
 RX frames on stop
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
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-13-298671d799d5@kernel.org>
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

A NAPI poll can retain a partially assembled frame across invocations. The
stop path clears port->rx_skb without freeing the skb retained in
napi->skb. If the interface is reopened, napi_get_frags() returns that
stale skb. The next frame overwrites its fragment array from index zero
while len and data_len still include the partial frame.

This can lose page references belonging to the old fragments or pass an
skb with inconsistent fragment accounting to GRO. If the interface is
removed without reopening, NAPI teardown eventually frees the stale skb.

Free a pending fragment skb after disabling NAPI and before clearing the
saved RX state. Count the discarded frame as dropped under the RX
statistics sequence counter. Use the irqsave update helpers because
ndo_stop runs in preemptible process context while 32-bit statistics
writers must not be preempted.

The issue was found by inspecting the partial frame lifetime and statistics
writer contexts. The series was tested on a D-Link DIR-685 with media
playback and ksmbd transfers under ping load.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 5f8f220ad9d7..3d121eec8873 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2269,12 +2269,19 @@ static int gmac_open(struct net_device *netdev)
 static int gmac_stop(struct net_device *netdev)
 {
 	struct gemini_ethernet_port *port = netdev_priv(netdev);
+	unsigned long flags;
 
 	hrtimer_cancel(&port->rx_coalesce_timer);
 	netif_tx_stop_all_queues(netdev);
 	gmac_disable_tx_rx(netdev);
 	gmac_stop_dma(port);
 	napi_disable(&port->napi);
+	if (port->rx_skb) {
+		napi_free_frags(&port->napi);
+		flags = u64_stats_update_begin_irqsave(&port->rx_stats_syncp);
+		port->stats.rx_dropped++;
+		u64_stats_update_end_irqrestore(&port->rx_stats_syncp, flags);
+	}
 	port->rx_skb = NULL;
 	port->rx_frag_nr = 0;
 	port->rx_dropping = false;

-- 
2.56.1

