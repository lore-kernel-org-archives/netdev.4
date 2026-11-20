Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187414;
	b=wONSmUeweobfEFC/Ouqsoz1fvcd0P/kJnRfjFc39XPAr0Bh7O8brPBZcxVcE2bzZ7Ipv
	 CrsO6LHUD4O4kpfZOAuglpBGgrYAMAVQKa9qsveNNRiibWZiOjaXn1SG4WgKC+phieFYR
	 ui5k/gdzUIqGPw39TR+OglQxRAkNrK/FUsZzrUrFJiHUZKmT78trNBGhW20jHp5KWt9LH
	 /Y+jC7w3W9ylgJi2NPaO3cfjaYrXanvrG0A+p8XCXxkcyCaGPYaPHKLSDsx5w4xQDyySu
	 eHguhVqpwN+MTjnwy9IaKry//Sh33MQJEp8pyv3IT6OG65k3BWRSgPXXBHrsfXMLpNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187414;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=us7mbpzByrc6IYYiZEo/0XS2sJm4gcQN7+6PoaPd6bI=;
	b=WRZa5dfVDLckyLFyJ64d/9GaOiDxm59pxktFqp3RijJJgd3IEdFLeZfR47d2mXRwyG92
	 ygxPx0g+vlXhIExkLZ8BaZOxjRDIabPwMC/ctcK5LQ5X8UdnDxxGhcC0kBLeWCb7eLkV2
	 ANV9+8wmPHywizNaKmokm5q5SpgEozkoiDqdYa/saesAC1qxuqTCAxnA21zYHqYUtLBoK
	 OWDwJu5OY7OWbYrzdtp62/1hhUYA2SuMNyeTlT/5/UkMqEz5nZAl8iRb1zqGsKQ5BIJ4P
	 2zztssiZ9qgFYPXbEXi94R3DumrJdgcjtgwUWc74oi6iPBDlIBXuQ5aq50vY7GhrELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="fDE1ROF/";
	arc=none smtp.remote-ip=154.81.10.146
Received: from mail-m10146.netease.com (mail-m10146.netease.com [154.81.10.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E1606A320;
	Fri, 20 Nov 2026 15:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=fDE1ROF/
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5571b3b0d;
	Fri, 20 Nov 2026 23:10:00 +0800 (GMT+08:00)
From: David Wu <david.wu@rock-chips.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	joabreu@synopsys.com,
	peppe.cavallaro@st.com,
	luis.la@mail.de,
	lorenzo.bianconi@oss.qualcomm.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	Anandu.Padinhare@electrifex.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Wu <david.wu@rock-chips.com>
Subject: [RESEND PATCH net] net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable
Date: Fri, 20 Nov 2026 23:08:05 +0800
Message-Id: <20261120150805.763415-1-david.wu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
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
X-HM-Tid: 0aa1f981df5809cckunm25b76740482ac3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx5DVh1JS0xLGUJLHU5JSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fDE1ROF/HErXOzZTrk28RcFqanGnvxfppXJn0ml7GTDlqAr7HYyapRj46zeBq4jyjXe4IAoEghzTvvstOo7oUVtomK8Qg5sIfvvuImaDoKdwMd6FbmRgm4+yaBJfwLMQQ7TEgR4Mkhl0CRPnrPYWaCvA80JoLh1TWGQBbXXwNrk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=us7mbpzByrc6IYYiZEo/0XS2sJm4gcQN7+6PoaPd6bI=;
	h=date:mime-version:subject:message-id:from;

Once the RX ring is exhausted, the RX DMA enters the suspend state and
no more Receive Interrupts can be generated: incoming frames are kept
in the MTL RX FIFO and are dropped once it overflows. The RX DMA only
resumes after software refills the ring and updates the RX tail
pointer, which is done by the RX NAPI poll (stmmac_rx_refill()).

Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
enabled the RBU interrupt for dwmac4, but the interrupt handler only
updates the statistics counter without scheduling the RX NAPI. The RX
NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
the RX path hangs forever once the ring has been exhausted.

Schedule the RX NAPI when the RBU interrupt is received, aligning the
dwmac4 behaviour with XGMAC (commit 6338488356d2 ("net: stmmac: xgmac:
Add RBU handling in DMA interrupt")).

This can be observed on a GMAC4 based platform with Split Header (SPH)
enabled under high TCP RX pressure, where the slower RX refill path
lets the RX ring run dry.

Tested with Split Header (SPH) enabled, running a large file download
over TCP:

- Without this change, the RX path hangs permanently once the RX ring
  is exhausted: the RX tail pointer is never updated again and the
  DMA channel status register latches the RBU bit, while the TX path
  keeps running.

- With this change, each RBU interrupt is handled and the RX path
  recovers by itself. e.g. 3 RBU events within 6 ms during a download
  peak, each one self-recovered (the RX tail pointer resumes advancing
  right after), with no further RBU events afterwards.

Signed-off-by: David Wu <david.wu@rock-chips.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
index 02aa1a3dd1e2..de6bd6f8a7d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
@@ -155,8 +155,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 
 	/* ABNORMAL interrupts */
 	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
-		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
+		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU)) {
 			x->rx_buf_unav_irq++;
+			ret |= handle_rx;
+		}
 		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
 			x->rx_process_stopped_irq++;
 		if (unlikely(intr_status & DMA_CHAN_STATUS_ETI))
-- 
2.25.1

