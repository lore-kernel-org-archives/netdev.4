Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594721;
	b=SSM4VHNCqyXix6m7WKumD2h663twvVJYxwjKM0RkC7FwzIwm9E6938twV9B8ZRz+Eibc
	 VszfIsfMU8H/xcsZRl0njBFSoAVvBcoxitCFtzf8VvILbu2ziTrQO0j6BXtyadyLkcMit
	 1D99dV9RFXBUJ2StWdeJMDILcBcIarHLYnX8teODyIl0mM5f7ObX4HFwpF3+SqFGzdOcC
	 B5ZvSxchwDRsVS3ri9ymvlhOo7Y0ScVrWYCv6kyFEQrrRc6O2HAIG7nnBYHp5rtH0Kwnt
	 CtBhId9S7MhADRSX0qQVyAphARJ6AJAm4wgQGylsmyqIv1EJuOwxTsNTBj7ERfY4OfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
	b=n6z7Bl4wwvowLN0N2HGo2lYrWx0+EoTTnlXyFDe2VXWV9ujEoWeHqDc+HDADQwnvEC+7
	 DL8tHC9IYP7JhumYmw+D0a3nBWXJwAbioEy6nDn7atZFASgNmRhZKXpU4jCMYu5gZCnRj
	 vcA/Yx+A74SNj8YD+kVZ9tSzwYWnNw6ulS4wwoOtgUCZ4AwdUaSrFki1rw05gYCZu9jdE
	 UXf+cqX+D7eFQTReC1XNdbEfHOANygOqiOgccHfvn8Nxg0MLnHkxwRImzSNGeFlUuEj0d
	 uYekmufXGKsiUDCefuFP0dOkFpcIWsRCev+U8xGZmrgeBSVnmhxDNhI/urZ1sxLETYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3MIuJT5;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF1606A33B
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3BF1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3MIuJT5
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862b76e3c8cso2522612a34.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594719; x=1796199519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
        b=G3MIuJT5Wyp8VFszI8iY1WLWF9sx+mNunPLOL2BrlNs+gbum9lGRQ71aboJ5MHPhQs
         +MbRvmYUd8D1wE0+P4fhdi7rVIFmwofRFJx9Es/vPi5Xw2XZ5VJMADSsYESaZXfRDIvd
         JGwmrAU2yV08BRpwY9eDUs8aCVVUjDyCCbpuQMo8MLfjFHWGZ0A5KZHuo15GbKutQrku
         L5v9a+hJR9Brk5X04g1DEOrKJCDBMeBqd5QU0gyulROIUFFxyhBzgqXrpYQpLw4lEjDE
         zkf7GgJAus23czZfs2c8d2ZhP4Z5e3Jyj9xpKk4rXn7zO9/hh+VHELq9ZejhOB0mCOtv
         dhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594719; x=1796199519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wed7YN090XJI15BSLSspXyr4CEJasWUhNpVfyB1hb9Q=;
        b=ILgIaHY6K76YDXzrpF3CrPHlk/liKDRTehNAzTP+17Gn/ClyRvkQb71kyAEfJ885kK
         b04tuPxdSmtwMZGdFN7uy561++OdIVRFRQP6OCPiA6NYUoOLmgFXeu+SS757gyVRHQd0
         38dMcOBTFjmFnol1fMG11j52LvLtc9XzOt/mNEvIx9mvNkCagyrbPhZLGVTQiXmiJjtN
         kjlTHp89iszrSUuw0iiniarPjer8X99+ca+ae89h5kvFHSN4sd3Mwo6kHLMQBD68YFHF
         ND+HD5uPnia/VhwC4TDf9dHxr83skHG1vJJLfWu6nqnpKSVzLDCLQsMnEwB4yQ1+Anh3
         j1lg==
X-Gm-Message-State: APuU4Z/q+rSSxZYrrhkxLF8M1KWRtstx3IUrWJ/8JlIvDzwXppfhVWUZ
	isS8HJYk2IGmc892o2SoYRE+77bdkvJ1ugc/8R1oM8d2KHcDl3ne0Bmx
X-Gm-Gg: AZFdTZcfl0f2NJaPRTTDvXubHHQkwSG/5BXiafXpYegpIlkSCiG++G/tHyRD1VwLMJZ
	/4/eEVJqzFMGn44M9ULgPiIzvS4K8EuIcjP+XO6kzFgKMzg2B1zYpdzrdIj4kwFuvnjtts9BKNN
	eoXQJOSb+pw5tlnyoptuZVgRORzWUNMst0v+sJsOhszCm2ViBzeccIqYOpJBfXoNCsXI//DqxsG
	0Mr5ygTto1TtjF/UY6CEMWcGYqy9hH24nsrOe0ZMKC5r3xvkgVm+/HQV16OH34YlrpzYqi5siNe
	BuOaWwSMtWXvdYZB08EHNP5HMZWloWXosthvVEAg94jSr/gwBbw/YxsFvc6uzbYITyeVY3u/cKh
	bQYt9cvnY3hGSJ+DqRugkjGktSDQrRGt1apJehulT4QiQNZuau+JgbIsmU+ahFCDqJDkuDOVlNW
	S4iPHNcMcoiVlapgSEUehqzOTAdn/I973MfpRAbpAHjLu//wpaP2m5p210rLrL0J6hYG9NeEPCb
	/uBev4AIlyQj+k8mkqwwCfmcx+jzozYBIn0zEwYWiLfPghwB6yPdhiOkhjazxQvB0SVw6oHtg4M
	Eu2UZZIE3FgnYxXSD+3he8tCQ+teuGZSYAJC3xeuy3YY4TPJJpYDp5UNnVwMRasjytUAwmLGLis
	6B0sja5lFNkkqj24KjmXnMnwnC1AOEvP6XZHSGzU3QIMwu7vAdGxgemsDRqpVW/7/oMUBu9vHCs
	QbrMC7eT2GhranyTBMsR2Il9RH7iHl0fXi421KhxO5paOvgiBMFWas
X-Received: by 2002:a05:6809:3cd:10b0:57e:3c4f:4b60 with SMTP id 5614622812f47-57e3c4f5310mr4622821b6e.58.1795594719588;
        Wed, 25 Nov 2026 00:18:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:31 -0700
Subject: [PATCH net-next v2 2/3] net: stmmac: add common RXALL handling
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
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-2-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
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
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 52 ++++++++++++++++-------
 3 files changed, 40 insertions(+), 16 deletions(-)

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
index 9ea76de030e4..81c8ac3756a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -354,6 +354,8 @@ struct stmmac_ops {
 				   struct mac_device_info *hw, u32 chan);
 	/* Multicast filter setting */
 	void (*set_filter)(struct mac_device_info *hw, struct net_device *dev);
+	/* Program the MAC receive mode for NETIF_F_RXALL. */
+	void (*set_rx_all)(struct stmmac_priv *priv, bool enable);
 	/* Flow control setting */
 	void (*flow_ctrl)(struct mac_device_info *hw, unsigned int duplex,
 			  unsigned int fc, unsigned int pause_time, u8 tx_cnt);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 70157efc2255..8102a72c52c5 100644
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
@@ -6462,6 +6475,11 @@ static int stmmac_set_features(struct net_device *netdev,
 			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
 
+	if (((netdev->features ^ features) & NETIF_F_RXALL) &&
+	    netif_running(netdev) && netif_device_present(netdev) &&
+	    priv->hw->mac->set_rx_all)
+		priv->hw->mac->set_rx_all(priv, features & NETIF_F_RXALL);
+
 	if (features & NETIF_F_HW_VLAN_CTAG_RX)
 		priv->hw->hw_vlan_en = true;
 	else
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

