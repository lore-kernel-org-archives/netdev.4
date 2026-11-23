Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425454;
	b=p9+WtVq/rM5imR4LHwbNeg9RDCwDsmPWinh70a8eLr0wGbkl4tkXA0aADB5PwdFfcV/4
	 mN+/PehJ1zdbRxV2Uc19Di1/aoQDxXkNPmD2TAyHLp8w/CMqasf0w7X1EiNqZvmWf+PVr
	 Bqzti+iH96Tm7aiv8AwRhbEzLfWAWcyVj/Dbu6ScwAAc0EXDz/t6yREvM0YI96y7ZiEID
	 i/cu3rW1ecXCRuF+TkQLlzkz1Y90/2qAJS3ftMSBlOWgJ/J9dN2beGjm6wPUXzUvxkyrP
	 Dt0aMA9DaAuFI4wFMAT4EZEJc6j/EztqLdqWqRwATAflE3yMKhsz6WD6lTrGtFi3sWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425454;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=GGVqoHM+KKBJo0C82Wkjw/21Q2PXYTZiP8lDiYrSUfc=;
	b=B2VLOfAgWzoMjYWwTM8bjrlD2mJ3y/3+P0UMu/1jqwPZMZ72KQraL6DMjClGx+zDrI7H
	 2naFlFVEtTob4jsIB5vWBw3Srk0XgYF6FW4bv2hCKIurDs04Fah43bfVr1z2LjyYipxKT
	 4WLCjkTLoqe+TveStQTlo6EKoTd7hKXzljMvkpEDBfgwwtA/qvoSOD+5zQqWEBdIcJXy7
	 NdksnHE1ESW1tsdWoaVY7RwR6PpZNs/Q8rqBWE3IFW/bt6mjLEuBAe45TEpKz/Vkhd1D0
	 4Z1uxIGewLFnAKySIkcijzXUA+765nvnkwzTYLF0ysiYdKpN9T2Hof6spTpYPz3jrKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=OihSSxJY;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6513E606A6B3;
	Mon, 23 Nov 2026 09:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6513E606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=OihSSxJY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B498A167B;
	Mon, 23 Nov 2026 10:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795425452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GGVqoHM+KKBJo0C82Wkjw/21Q2PXYTZiP8lDiYrSUfc=;
	b=OihSSxJYZ4zca+OjuGx963tI2eyllP7p5VY0FX37TdvF/YSiij3E+TRqYkKfGyMBIkW08u
	iXY2lwQkuVA5DWPWZuIVOy8Frq7mJGSTDhDioBI0x1LX1t0L3q92R7TvhXOEFYZlXHakQe
	D3fOmD2dRbenNCRaVHRJ9Jmi2MewvOLEdMHGYXnhV8h1vIQutvUfN/rRVbst/TMD4OEkr0
	Xg3U64Pfohkrc/Z8aBBUfY5HPbWCy0m6q9p0ltRrYLhg2P0tVXhs9CfF4wDFONCyQ9cNgx
	lIJM85C3FAazC2taMePL1AcxtTbPSuNpgtA6BOhuaPwBTaLlaTdwFROg4G7fAw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Mon, 23 Nov 2026 10:17:10 +0100
Subject: [PATCH net-next v9 2/8] net: bcmgenet: allow a continuation
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
Message-Id: <20261123-nb-genet-mtu-nn-v2-v9-2-4f93ded19bbb@tipi-net.de>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
In-Reply-To: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
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
index 77c1b4088a7e..c4f190212e46 100644
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
 
@@ -2358,6 +2359,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 		unsigned int rx_offset, rx_size;
 		struct status_64 *status;
 		struct page *rx_page;
+		unsigned int min_len;
 		void *hard_start;
 		__be16 rx_csum;
 
@@ -2394,8 +2396,12 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
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

