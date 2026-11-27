Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778734;
	b=lfTaVnJTOZWJ2zrM3vDvq51Az89pLoWe8qYT2FY1mu//+y6tGsCNp5UuX0iDALQG22rP
	 xW4LnLNAIjp4l4fKBbGQ9YyKMRuqYC3hREx5otYWt4NUeC2IKoO3/SE3CClYnL721/zg2
	 tE+Whg64j9a+E2YTF1MOFrk3+xiKL6/OwxzPe2BHdQO2i7GqwmP3pYOQzqS98+ZsuWGh0
	 GXV5hSZDyP3UKY/ZhLcKZnqNpILvnE/y/ny0QtvIZFgMkxjqJWzeg282VNVNHtWPA2ttx
	 tgDvi837Y/RBJPO74Ugn/B41rr+oPu0lybwmZwUIkrpzFQH0MUbUVXoFHu//GG45ltA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778734;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=TxFbfNAnKJCCAcmwO2TL4Yw7LV8KogECTrX6wE8zQhI=;
	b=ugwPxrVTcxYqOiKVeKfjI1tA1nm0RVpXWTpXLOvWuJZ3uvOB3UBOoYCQ6HNg2N/phaw+
	 B+GQaZZI6XSc86aiIAs9kYyMzjbgMBbgywbgXgn4M3/zxPaK6Q1oRdmw/e6V4GzE6gFvC
	 PSSGQRvUmnkP2+6IHhCBmpHFuoqJumo87KD1/XJuYwM4HTiq2qeqVRE6dPdrJLjSIiQpg
	 Be2xt4CeDH5S5mN3YzhioX4GLDvD+dil2/SYXWJ0Yya/A1XUzZV2FwkKqqen2FrCpUJhM
	 TFmSm5ICFBb6PO05znxqGSHYaHXniEL1xwgeNCULoV2APrA7FP0EaAACE6uFgqK3HFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=B1g2jspO;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2EE606A31C;
	Fri, 27 Nov 2026 11:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D2EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=B1g2jspO
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90EF4A20CC;
	Fri, 27 Nov 2026 12:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795778732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TxFbfNAnKJCCAcmwO2TL4Yw7LV8KogECTrX6wE8zQhI=;
	b=B1g2jspOvfRTOjyJER2jJO36/J4oLaDNJWJ/9tT/9GmJ4NSh42/og2PIoze92XzzkR0m8V
	G4q87TZHnEOc1z7aOJoZocWdIlAPKWusZq6asH+7pDDEHme5AzRLTht56skXPdBSBIOVbn
	ivQs5HiFfG+Xcl84PTjbPUgxLKoI4mv/HO68gHxSu5knayqSxD9wlK+YWpKi2GnJGir2RM
	fgVPBrvFhM4NWzxG9CBscahNKbETH9TYYxDjSMa8ttAL9MQUQzO8/s8+mkPYvfjlOlE3pi
	ojb5Rw/B9trbIhXVpC+f+sk6zoVZX6tYtcz9LmnEBqd45wMKZoIKlyY0cOc5Dg==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 27 Nov 2026 12:25:12 +0100
Subject: [PATCH net-next v10 2/8] net: bcmgenet: allow a continuation
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
Message-Id: <20261127-nb-genet-mtu-nn-v2-v10-2-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97@tipi-net.de>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97@tipi-net.de>
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
index 7e78db243442..67296eb22a5c 100644
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

