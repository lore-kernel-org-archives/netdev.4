Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014257;
	b=D62n1agCP8EWnuzNBg9/HXDesEPoH7F+A6Lvj05ORpZY/V3Yhbc7SfMlKqEztNMkghMX
	 1iWiZPlgC4M1gQtos96sMpIhIChNNVSfv1mnLWsxRoYpCvy5w9BQKJ37mOqpkwf4JNWSm
	 TbFomxJHinzXrS3a9QtyYlgETOc/DRoZm5YBRxjuoXGtC4LYqHBUTvilrlnhuyXgW0VD6
	 NmpA7aNa+hf0/SLi7FGA5aSGCPxaa4jxHJi5h0Qfg/8JWaYTc1miuPBZ+4e9wCHsmRjm/
	 AoXJZlE3zepyoauTArksgQDPmtEpej57p/RlO0yPT+LlTNaTzBfzEfW78iMJNytw9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014257;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=NdbALHgz1Vwxel+lqSyBshxnu1busdyowNp2dws4o0o=;
	b=MTYNZVNx6+/vkI6uNEpZkJNwXNP51a74xCZyZlFfDrxKi78p+ibDpQ/Fs7FiotQHkl2y
	 BlrYgVPQoo52v8oPyqvQxS+uHC7sSLjS3mn97iflqXFFgA6cxgQAW6uasfPQjeWgCXU1k
	 fww8fQLh90gFHepo6kPwpxZKUPdNiv51v79W2pNFtqImmgyUvGCO9sgVuEqy/2mtcpSUO
	 +WR0gaMfqAWJ2BkqWE9hL+wTrXKTpTa9mGLQYFjn+hRp+u8/eacYfFPtTL8deaZTskIN6
	 xOgOiUpada+bKApDEHKzuCIfW0naS7aqbpKmh67EFWbbbdVLku+0aiV11dIb3eQZP2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=1nEH+Si6;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A898606A336;
	Wed, 18 Nov 2026 15:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A898606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=1nEH+Si6
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22DC2A2067;
	Wed, 18 Nov 2026 16:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795014250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NdbALHgz1Vwxel+lqSyBshxnu1busdyowNp2dws4o0o=;
	b=1nEH+Si67YIeLukvA8bksD6SMC6RU2dyWiKp8rjDSJm+7TkOhT3z/OXXVPvIGFCPfukN6H
	Ctk9Lfj6x2NhqNmtgSc4lLjWfMl/sVmsB8sVhNY7uvgxq6CAmzHs0MNRGwvg4yZUQLx3LF
	Pt1vS5P5l1t/ytd3lNtGqAiOjzsHkbmJ3pLLOO74g3oizoJtaEF5bCz5qm5Rkmz8HcV+6d
	JsNzIYvnLwXw+oiELwrpVfzGwbtcnncm+PjBBvCS7DxJ5P+JcRcaRDs/kOViJqLXmAvj2U
	CGEJshU7SFBMjcOAQRMqf8JHKGDhMM0thDXsCyOmoooZNDN/WPeUmsmAeDwcfw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 16:03:34 +0100
Subject: [PATCH net-next v8 1/9] net: bcmgenet: ring the doorbell when the
 last frame of a batch is dropped
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
Message-Id: <20261118-nb-genet-mtu-nn-v2-v8-1-68f75eadf3e2@tipi-net.de>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

bcmgenet_xmit() only writes the producer index at the end of a batch. The
error exits return before that write. If the dropped frame was the last of
an xmit_more batch, the frames queued before it stay in the ring until the
next transmit. The queue is still running, so the watchdog does not fire.

It came out of a sashiko review, not a bug report. Those exits only run
when a clone, an allocation or a DMA mapping fails, and a later patch adds
one more.

Write the producer index on those exits too.

Fixes: ddd0ca5d60b3 ("net: bcmgenet: add support for xmit_more")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 31 +++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 61f5a4c2f0cd..1114fe46d2f7 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2122,6 +2122,15 @@ static void bcmgenet_hide_tsb(struct sk_buff *skb)
 	__skb_pull(skb, sizeof(struct status_64));
 }
 
+static void bcmgenet_tx_kick(struct bcmgenet_priv *priv,
+			     struct bcmgenet_tx_ring *ring,
+			     struct netdev_queue *txq)
+{
+	if (!netdev_xmit_more() || netif_xmit_stopped(txq))
+		bcmgenet_tdma_ring_writel(priv, ring->index,
+					  ring->prod_index, TDMA_PROD_INDEX);
+}
+
 static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
@@ -2153,8 +2162,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 		if (!skb) {
 			spin_lock(&ring->lock);
 			BCMGENET_STATS64_INC((&ring->stats64), dropped);
-			ret = NETDEV_TX_OK;
-			goto out;
+			goto drop;
 		}
 		nr_frags = 0;
 	}
@@ -2173,8 +2181,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	skb = skb_share_check(skb, GFP_ATOMIC);
 	if (!skb) {
 		BCMGENET_STATS64_INC((&ring->stats64), dropped);
-		ret = NETDEV_TX_OK;
-		goto out;
+		goto drop;
 	}
 
 	/* Retain how many bytes will be sent on the wire, without TSB inserted
@@ -2184,10 +2191,8 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	/* add the Transmit Status Block */
 	skb = bcmgenet_add_tsb(dev, skb, ring);
-	if (!skb) {
-		ret = NETDEV_TX_OK;
-		goto out;
-	}
+	if (!skb)
+		goto drop;
 
 	for (i = 0; i <= nr_frags; i++) {
 		tx_cb_ptr = bcmgenet_get_txcb(priv, ring);
@@ -2212,7 +2217,6 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 		if (ret) {
 			priv->mib.tx_dma_failed++;
 			netif_err(priv, tx_err, dev, "Tx DMA map failed\n");
-			ret = NETDEV_TX_OK;
 			goto out_unmap_frags;
 		}
 		dma_unmap_addr_set(tx_cb_ptr, dma_addr, mapping);
@@ -2254,10 +2258,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (ring->free_bds <= ring->stop_thld)
 		netif_tx_stop_queue(txq);
 
-	if (!netdev_xmit_more() || netif_xmit_stopped(txq))
-		/* Packets are ready, update producer index */
-		bcmgenet_tdma_ring_writel(priv, ring->index,
-					  ring->prod_index, TDMA_PROD_INDEX);
+	bcmgenet_tx_kick(priv, ring, txq);
 out:
 	spin_unlock(&ring->lock);
 
@@ -2274,6 +2275,10 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	dev_kfree_skb(skb);
+drop:
+	/* The dropped frame may have been the last one of the batch */
+	bcmgenet_tx_kick(priv, ring, txq);
+	ret = NETDEV_TX_OK;
 	goto out;
 }
 

-- 
2.53.0

