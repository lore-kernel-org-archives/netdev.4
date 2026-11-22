Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333589;
	b=bs9OntnWeXScBJe8CFIUUZOjH7rHC/gvFBvqXsV6X+dbAoBHlS3j0w6Vu7xT3wwfxvQp
	 eyLn9R+VBcUMXKhYK52foCc9l1sNugbnmO5MiUJX/g1LPe46wo8BseUVnEEpxOqPB+Sk2
	 zlklr/usOqB1UPsttnlKTQZu/6rS/8G1Fuo4CXlv20E34Pd8tnytT1zFor9RG73cYsYjh
	 n6fNIum2LQ4u0YwczPO37NUdE7f62Db/ZOhtB+ZQ7dxMP17BXiR5JVrPbl8S747FLA+8U
	 lgdzbnXwY5LU2G6U72vjUEje7qwWUdjZoZu5rkvBaU4U/1W9NRdANF6XviCsQYiJITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
	b=0yTjO/lIU/DFQpE7QphXpkDHQsbGOWRDQqU50YEoauVqYCDX5I7M3Ip2xDDL6o6Fg3t0
	 3M+VtEmJWq6HN2hfp/qwpASybTSgOf37E9xKW3E72FSC+PclujSGF43D26ytDvRUXZDjv
	 D5XYMKd1YAVLu0V7YTZyEPW5flkTkmy1wA5VXV2BsGqNLNunXQ0feIAk7e3Od2M8qGxYX
	 WZrn6jDfeN0aT/pkrEuK45Wkou9CqmxhTbX5fav1FlwnwB+JsbbUrcInfmC51DpJuVdjU
	 Y5Vh0OsepJysK+0Z6h6l9TyjlT+UK3eswA8iH+iXs4u4ZQ7KHpUn4MONcqt/5QLAG/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVe8Hs4p;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A838606A336
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 07:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A838606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVe8Hs4p
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a451915d8aso1740954b6e.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333588; x=1795938388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
        b=qVe8Hs4piN7zzjFEx09qJDwDQF5OyoLm6Z2ycoetLj5q415NCNJ3VMfbkPhU3iDfKu
         bGjshfOnLlZbyUWeRK95PZzS7vSOPZe4AYM0XAYK+Th40+fdaAsVmruU+7OiK8oVuclg
         7VhCzaBzACmv++CIxvE1R5AD0z2w+Am/2x6zJ0U0LIE7F4PTlHHw6HbEksJHCspgAKNw
         hTPV9K5CHOIo4Nt+oeFPgdme+KP0rkjGei/D9J4vPM53OX8IdbUvYCeXGYhLaDE2gVtt
         JJwMPEYGEWwU5j9RU6t7cpVoeuFHzNquOS9trMbGp8huB20ed6bjyMatqWvvZF/AyWoi
         El5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333588; x=1795938388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8XgGvlVCCjPCeMynCuGBvpdTmWq070BiRu3GuXh4v0=;
        b=Z77ZmptZL3VW4DVJUR0z2WslhyeTHLX7fmsxIYu3NlBaCejS5O1VSDSMtRyrhk0w2u
         XfNWzOOaKybBkb2jjRu8SYRzTlUDDwwHTBTX5u3iHTY6t/wHAQMkd9GAhYF94W7OPb6e
         XIcwTT+htEaueXhA+xL3y902cjreNEJLmdUx+oTB8UiVjAiEAFK73iD8kXZV9lD1rPZX
         iXz099dXS8XyPBkmTGJ0c0K4DYb5ToTTW9vXHbBWYg7p4FdFB3AGqQCDXIcpTfSW9SJd
         HOxpVlrkXq9RX9kvR9B3y04PsFsa7wntG/kpMSIlGpyjXW3nRBaKs+JSinvJo+m0NLUt
         UUKQ==
X-Gm-Message-State: APuU4Z/bsvecIC+2JBLRShyP3bY5E5djqQTgCzYA3ot962V4I9dQOVHO
	AB1c8U7HLb+FF2DqpLG/pmHrWBeZ3YxpeBR6x/gQRPU3x9kPMeHvfY/+
X-Gm-Gg: AZFdTZefAfDv6/qP2OW9SDTnXBhqX9H3H+Pq6elimJgSvtRDwOe10681GJNxrY2hxm6
	jV1yP2XSNxcltHX4xS9AWK9W44z9u0ne2hdSuuE1PNzkbn9M/YjHuYnfcMtI5+gL6xlpJcbfPAG
	gxCLBMy7aSpnEKRIzDQbgix3hlDRVtLPpXQfyey/IOfT8JwgrVZ8btLg1cnK7v7QrGnMAAbFW2A
	ouQ3pJzO0+YRtuWIRrV7A48eT7VqzHM1xexoI832JS7dfJ6KNNepZQSGNypi5bLzMXw0fLGxZRd
	o8sKbp6WMbQely4GiYkWOg2wlyaccO8wlXWgspGF8TdxQCPb4ufzKGv94EBmIdEk5PYyEmkZPPa
	Mkqle6y29gRmBEnrsp/WUlA9qcEUkvzZwDGMoOhyM3dVAkNOCcK6j0k0DNunk+ZHub9CH9b8+1E
	5CFUtyVdMwqFDw+iK1/+S1t0CcQnGDg5+u3p2firaFiTfIGO8aACwH0sRmqv+YXXE3fNzZJZ2uN
	v0xrN51CURBpyr8t3M1lj9ZA+T+r1SdyYTYYrGw9NnMi9BAWU0k8Es0ipmPQPUZOsq1+FeYA424
	qgsC2KETtynnkGacDXuuOFjcKorUC6csI/gBXFvXoFwm9QHkZ/4uLtAHk2191grilm9mceyl8Se
	oHas6KHEsLyAs4TeTbfJj4Zy/9i5OLviXlUsD5bdgIXWGI9eNcacCWwcNASu8M2800t9x4QmqWe
	VC2p96HrJcqmRRAD4oUwdDbWW1uC89zxnSSd7iJCRB/7yv8RZer4p7
X-Received: by 2002:a05:6808:309f:b0:573:3cbc:9775 with SMTP id 5614622812f47-57a0900b93amr8494959b6e.27.1795333587934;
        Sat, 21 Nov 2026 23:46:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm6121800b6e.4.2026.11.21.23.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:46:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 00:45:46 -0700
Subject: [PATCH net-next 1/2] net: stmmac: add common RXALL handling
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
Message-Id: <20261122-submit-sun8i-rxall-v1-v1-1-607789772c56@gmail.com>
References: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
In-Reply-To: <20261122-submit-sun8i-rxall-v1-v1-0-607789772c56@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Allow a MAC to distinguish complete frames with wire errors from
descriptors that must always be discarded. When rx-all is enabled,
deliver the former without trusting their checksum or counting them
as good packets. Keep counting the errors in either mode.

Apply the same policy to page-pool and zero-copy RX. Advertise rx-all
only when the MAC supplies the receive-mode callback; leave it off by
default.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 3 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 706feb7bcbed..ab959ee3a5dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -360,6 +360,8 @@ enum rx_frame_status {
 	llc_snap = 0x4,
 	dma_own = 0x8,
 	rx_not_ls = 0x10,
+	/* Complete frame with a wire error, deliverable only with RXALL. */
+	rx_error_frame = 0x20,
 };
 
 /* Tx status */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 9ea76de030e4..c20babf8cb45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -321,6 +321,7 @@ struct stmmac_ops {
 	void (*set_mac)(void __iomem *ioaddr, bool enable);
 	/* Enable and verify that the IPC module is supported */
 	int (*rx_ipc)(struct mac_device_info *hw);
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Enable RX Queues */
 	void (*rx_queue_enable)(struct mac_device_info *hw, u8 mode, u32 queue);
 	/* RX Queues Priority */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 70157efc2255..32e7906522a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5646,10 +5646,12 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	skb_record_rx_queue(skb, queue);
 	napi_gro_receive(&ch->rxtx_napi, skb);
 
-	u64_stats_update_begin(&rxq_stats->napi_syncp);
-	u64_stats_inc(&rxq_stats->napi.rx_packets);
-	u64_stats_add(&rxq_stats->napi.rx_bytes, len);
-	u64_stats_update_end(&rxq_stats->napi_syncp);
+	if (likely(!(status & rx_error_frame))) {
+		u64_stats_update_begin(&rxq_stats->napi_syncp);
+		u64_stats_inc(&rxq_stats->napi.rx_packets);
+		u64_stats_add(&rxq_stats->napi.rx_bytes, len);
+		u64_stats_update_end(&rxq_stats->napi_syncp);
+	}
 }
 
 static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
@@ -5707,6 +5709,21 @@ static struct stmmac_xdp_buff *xsk_buff_to_stmmac_ctx(struct xdp_buff *xdp)
 	return (struct stmmac_xdp_buff *)xdp;
 }
 
+static bool stmmac_rx_discard(struct stmmac_priv *priv, int status, u32 *rx_errors)
+{
+	if (likely(!(status & (discard_frame | rx_error_frame))))
+		return false;
+
+	if (status & discard_frame) {
+		if (!priv->hwts_rx_en)
+			(*rx_errors)++;
+		return true;
+	}
+
+	(*rx_errors)++;
+	return !(READ_ONCE(priv->dev->features) & NETIF_F_RXALL);
+}
+
 static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 {
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
@@ -5797,11 +5814,8 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		if (unlikely(error)) {
 			xsk_buff_free(buf->xdp);
@@ -5995,11 +6009,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   status);
 		}
 
-		if (unlikely(!error && (status & discard_frame))) {
-			error = 1;
-			if (!priv->hwts_rx_en)
-				rx_errors++;
-		}
+		if (!error)
+			error = stmmac_rx_discard(priv, status, &rx_errors);
 
 		/* We do not support SG in XDP mode */
 		if (unlikely(!error && (status & rx_not_ls) &&
@@ -6161,8 +6172,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb_record_rx_queue(skb, queue);
 		napi_gro_receive(&ch->rx_napi, skb);
-		rx_packets++;
-		rx_bytes += len;
+		if (likely(!(status & rx_error_frame))) {
+			rx_packets++;
+			rx_bytes += len;
+		}
 next:
 		in_progress = false;
 		skb = NULL;
@@ -6444,6 +6457,11 @@ static int stmmac_set_features(struct net_device *netdev,
 {
 	struct stmmac_priv *priv = netdev_priv(netdev);
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	/* Keep the COE Type in case of csum is supporting */
 	if (features & NETIF_F_RXCSUM)
 		priv->hw->rx_csum = priv->plat->rx_coe;
@@ -8276,6 +8294,8 @@ static int __stmmac_dvr_probe(struct device *device,
 	}
 
 	ndev->features |= ndev->hw_features | NETIF_F_HIGHDMA;
+	if (priv->hw->mac->set_rx_all)
+		ndev->hw_features |= NETIF_F_RXALL;
 	ndev->watchdog_timeo = msecs_to_jiffies(watchdog);
 #ifdef STMMAC_VLAN_TAG_USED
 	/* Both mac100 and gmac support receive VLAN tag detection */

-- 
2.53.0

