Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014260;
	b=oCz8oYnAKZxXtMCImrqS/tIHKkUIeAl/d7NDUozfD/mAerZ2QvV0VSCRA+HTj11bikZ6
	 hRQKBtqSQSeEMSejZmoNSwdh9JGNc/UCCy4r8q9/7euYn9QQs7oekjHm4kb/bvc7DT73u
	 JSxDLw7dbGLmHinb+ZGpesWvPe2UpqnRv/LqrqfgnFxTE5p5CSXivWjbkJP6PiLcYEKdf
	 LFbk+W4Nk25TfHVz6xWqEG0TJYw3SQmMFr3r7WxeUjAQcGw6Vv4dP5RfIY5ldwl4g/bnf
	 i84xVf81m200cRFTiEFCDPOt35NScLA9d0ipp4H2QT8LBi/E3zOjU27oaKHUmfBftOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014260;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=INMDdEoLlYJa+M4R/u+HV0i5haZkZeRUYllFAjvR4jw=;
	b=qroBkfjslfs6jleMQhx+CPJMxDmxHcLjzQPQp1UsIGtcYXpSvVjY6eE+Ekwf6Im+/oqv
	 K7olPOW44fCXzHqqgFMQ/xwhzGtOTDg/yv4X/dQ9xg1x91XsZzmh8CL397LJI1bQiyBsn
	 waDxjpsKyKmdTiJDYmD1spGcBhBgxBUTW05V7gQCSXPo77LSJYzipslfQXsX1zaPdm9yQ
	 qELfA3bMoOVojYd1dDujIkxzMrgoajT+0/zHGVIf5SSklkmLBXpvEvm2R1ebjJ2Jqq2rD
	 Gep8VjnngIJduCA6JZ5gSb4crv+tsja2iMFiN0kSXOY/xNgI7Z2jESubgoB1FGYaljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=u5+nJHLF;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD909606A32A;
	Wed, 18 Nov 2026 15:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD909606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=u5+nJHLF
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F34DA21D8;
	Wed, 18 Nov 2026 16:04:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795014258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=INMDdEoLlYJa+M4R/u+HV0i5haZkZeRUYllFAjvR4jw=;
	b=u5+nJHLFC+OCqM2oBrTR8tXUPJ0tagz0bvCwKoGkZRkVCT0ip6uZcg+U4lWgDUkJiID8d4
	WM1hfZBLYbTu7b9eXirdFZW7FNxPIJn2IjsWkqLlXnWF3+WDFK2CoXIuJq9TR68VoNBuPB
	e4S+X9vPV4NcDzpbAxezxm0hARiAsA1e/WQeUpBKLv/e1Gqi7KOAijCZR4eGXpq6VnM2Lq
	Wb6xoOFPlvLgy5v/ej4uupRtUq4ZOIejhvnYHdJz7zMiiwdq4FLxUgLH4F6ChdfKmwHZKY
	Y2UBFDEpIkqdoD4pQmuVcopGHY7nJai/9AGY/n2/4rXaF0O1AzYx3FJfqIWu5Q==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 16:03:36 +0100
Subject: [PATCH net-next v8 3/9] net: bcmgenet: allow a continuation
 descriptor without the alignment pad
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
Message-Id: <20261118-nb-genet-mtu-nn-v2-v8-3-68f75eadf3e2@tipi-net.de>
References: <20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2@tipi-net.de>
In-Reply-To: <20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

A frame longer than the packet ready threshold arrives in several
descriptors, each with its own status block. Only the first one also
carries the two alignment bytes. The length check assumes the pad is always
there, so a continuation holding a single byte looks a byte too short and
the whole frame is dropped.

Account for the pad on the first descriptor only.

The MTU cannot produce a frame past the threshold yet, so nothing hits this
today. It is preparation for the larger MTU.

Tested-by: Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 4c2a38eaab10..d4eac993368f 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -53,7 +53,8 @@
 
 /* Page pool RX buffer layout:
  * RSB(64) + pad(2) | frame data | skb_shared_info
- * The HW writes the 64B RSB + 2B alignment padding before the frame.
+ * The HW writes the 64B RSB before every descriptor of a frame. Only the
+ * first one also gets the 2B alignment padding.
  */
 #define GENET_RSB_PAD		(sizeof(struct status_64) + 2)
 
@@ -2363,6 +2364,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 		unsigned int rx_offset, rx_size;
 		struct status_64 *status;
 		struct page *rx_page;
+		unsigned int min_len;
 		void *hard_start;
 		__be16 rx_csum;
 
@@ -2399,8 +2401,12 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 			  __func__, p_index, ring->c_index,
 			  ring->read_ptr, dma_length_status);
 
+		/* Only the first descriptor carries the alignment pad */
+		min_len = dma_flag & DMA_SOP ? GENET_RSB_PAD
+					     : sizeof(struct status_64);
+
 		/* Reject lengths that would underflow the SKB build path. */
-		if (unlikely(len > RX_BUF_LENGTH || len < GENET_RSB_PAD)) {
+		if (unlikely(len > RX_BUF_LENGTH || len < min_len)) {
 			netif_err(priv, rx_status, dev,
 				  "invalid packet length %d\n", len);
 			BCMGENET_STATS64_INC(stats, length_errors);

-- 
2.53.0

