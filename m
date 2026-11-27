Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778734;
	b=CsY77lplM2sChxFkCWc5E4O4IU4MfZZRJtMKw6i6D/M+fIKzpxpb8Nq7jkoWEOlKsfun
	 1NvTI2aN2MoTWdZ4osRUaGyJL/hZuA9+heWjHyn6Nv2BJ6tAYn9XA3B4LsLYwu95VC5Pq
	 0c+oEKhLAL3/SZTpfNUaxsL2t6D5pqGv9QWzZZss5NdrOrz8rS80bYcvpOW1xO92jmolx
	 EeAOWoxPEuZyWG+iR4yyXZWyLKsraTI3KciWMOC2By5+ip0RLI8bzIHEnApTVuJhjL2dy
	 IRDE6g4X3awGo77ZNXodGQTiS/4KjV/MiGOZdCCwjaypvjkzZEsM8eW2UwrY8o9pw7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778734;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=iAaGm1U3BHBOCgwYrgu/PMwiUGitcdVQyuG4eTo+c0o=;
	b=j8MU0l/fG/5P8b0wy8rtssX1e7wYDo1nogYJSCmmw5oYDBBPQtkXU2rsHr8BKLoVeool
	 IM+0tMlSWFczAvTAwtRZB+AykusXxAOoN8rkv1AziaApOPe/tL5xmCWOShLMoQxZqtH0x
	 i8pfJ+z28Fy9uQ7Pdxijn3YDKiUyjlZbzBPYuj2IGvN7gUUJ8u72Go9ttzia+WgK22W4t
	 PbSJnsKm1jVLrIUP+EMTUYzjFOsecIQLt5pIbqW5tmygkUNiZz0jVzLsB+7lyJBr2xz6o
	 yVEbu397H+a5UhZHY+cu6U7xPxKwmPHO7psr92mmIGv5X4WKxhrk+J7lxhml51Id55Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=e4Y9VPsW;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53446606A321;
	Fri, 27 Nov 2026 11:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53446606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=e4Y9VPsW
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 345C8A24BD;
	Fri, 27 Nov 2026 12:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795778732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iAaGm1U3BHBOCgwYrgu/PMwiUGitcdVQyuG4eTo+c0o=;
	b=e4Y9VPsWf6z15CPjAMl3T8YcFNBpGLykvDTHT/kh2n0lZSZEtXqfAudFLUpIeNAdGseOMR
	XvAY5prZNEBLTeCGKsjCn/vgS30PbphN9NqEEkbIqY3eR07Qje6kzYG+ZbvCIDR90ppcGN
	xtnZaJTGzujk9TZcZTOiAy2nUvHu2jHJvjaJbSexPKL+XSnpmJfjmMAvVXTAgWAAj8AgbC
	DP0XK00XkvUpWnXx2TaZTFVlO0P/DRjEDtUPsPuVwGUHQoHnhyKZIRZuiH8BkZpcrCby++
	omnAombQDzmuoB/h416Uet4slKHuqV8FL6hoekk2zDzo7KqaVLB03sK+O7jiLA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 27 Nov 2026 12:25:13 +0100
Subject: [PATCH net-next v10 3/8] net: bcmgenet: rename ENET_MAX_MTU_SIZE
 to ENET_MAX_FRAME_LEN
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
Message-Id: <20261127-nb-genet-mtu-nn-v2-v10-3-749c7cc45d97@tipi-net.de>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

ENET_MAX_MTU_SIZE holds a frame length, not an MTU. Both users program it
into hardware that expects a frame length. The name is wrong once the MTU
is no longer fixed at ETH_DATA_LEN.

No functional change.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 4 ++--
 drivers/net/ethernet/broadcom/genet/bcmgenet.h | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 67296eb22a5c..5c050331da69 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2669,7 +2669,7 @@ static void init_umac(struct bcmgenet_priv *priv)
 			     UMAC_MIB_CTRL);
 	bcmgenet_umac_writel(priv, 0, UMAC_MIB_CTRL);
 
-	bcmgenet_umac_writel(priv, ENET_MAX_MTU_SIZE, UMAC_MAX_FRAME_LEN);
+	bcmgenet_umac_writel(priv, ENET_MAX_FRAME_LEN, UMAC_MAX_FRAME_LEN);
 
 	/* init tx registers, enable TSB */
 	reg = bcmgenet_tbuf_ctrl_get(priv);
@@ -2780,7 +2780,7 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
 
 	/* Set flow period for ring != 0 */
 	if (index)
-		flow_period_val = ENET_MAX_MTU_SIZE << 16;
+		flow_period_val = ENET_MAX_FRAME_LEN << 16;
 
 	bcmgenet_tdma_ring_writel(priv, index, 0, TDMA_PROD_INDEX);
 	bcmgenet_tdma_ring_writel(priv, index, 0, TDMA_CONS_INDEX);
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
index 6ab3f7347555..afaccb769933 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
@@ -28,12 +28,11 @@
 /* which ring is descriptor based */
 #define DESC_INDEX				16
 
-/* Body(1500) + EH_SIZE(14) + VLANTAG(4) + BRCMTAG(6) + FCS(4) = 1528.
- * 1536 is multiple of 256 bytes
- */
 #define ENET_BRCM_TAG_LEN	6
 #define ENET_PAD		8
-#define ENET_MAX_MTU_SIZE	(ETH_DATA_LEN + ETH_HLEN + VLAN_HLEN + \
+
+/* Longest frame the MAC must accept for the default MTU */
+#define ENET_MAX_FRAME_LEN	(ETH_DATA_LEN + ETH_HLEN + VLAN_HLEN + \
 				 ENET_BRCM_TAG_LEN + ETH_FCS_LEN + ENET_PAD)
 #define DMA_MAX_BURST_LENGTH    0x10
 

-- 
2.53.0

