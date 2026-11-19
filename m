Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107983;
	b=ena5wL2b2D/OhuPlj2h+4dmRNm/Tn6BB5vUKgwbeqc172KZbP0opud2AmjUaRXpOrdbF
	 dF1+ioLq8hKChg3oZZ25Kq0GQPw3mDwB6l5dU8NiJ5xYIMTk6hJZfgrD6aUOe3flUW2+9
	 FmL0nJ8WgnwISrFh3f3+nAK3+9/ceFtqRpdr7li/yEkzYLSNyCc4m0HgpasnYnvYH9jC7
	 akPVCdGMlu1bTj0U8VzBw5gWbQAQPuINUKcnOEKGkMRO11birxS4yzScU21ONVoptrt10
	 kpa7ZrlKL79CAA0/44tr8bedI7QPgDxCpOHL73K//XNAMqNtr8OKjk7aKGu/9UU0UJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
	b=g7SAiv4dQl8sdwfjarMYlytvYBgG0QUIiouE+5kWs8EaODhH86jWGbEpkRAuSiozEjBE
	 L+cXqt49A6QFyO53P0A06+WF8ekTEGEkarjEVIoNNjyh0xhhf5a2sMBDuy7EQ7QjBAMye
	 UnL12rQr+TvWyTXwsbqU2bBSiftMz+8GYMJMOQOosDH3y2xW3wQ+puCVV2eGi+u0T3Na9
	 YmZ7x5bXS4bRNke0kQr+w+vTRSHVNaVI6m2U9jzscYsdJgWObUp6e1VRm+us2ol/vYunt
	 o24GV/lc3qCo7ftUamCXmKo4llpR3MKwt0tsps/H0VVdJiF771h3S4Wxyi6OKPShg8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5FJymWa;
	arc=none smtp.remote-ip=209.85.161.70
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C14606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C14606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5FJymWa
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-70273936138so2274743eaf.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107981; x=1795712781; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
        b=I5FJymWahfLuJDZXebyzmrFVvBkmVjnDX5f2Cvw4WPshTFoe+pi6Mx1gtWyo7iJrCq
         6SIOUcUxLS8BuHgtZ464JDqdVSzT6zZdICyDCrPKmkygqoqM9qg8b4FY/TS0zc7gn41A
         V4Yar6nR+/wP51HHdqSGMA7elccd1zdhAbcTpNpggWQ8SwZSwJlDIqCj1QxoOsGGGSaW
         2QHwa63ih/r8iH4RI8tg7bDyTKBmQakMdAZcuELWJgt3lABcZ9A+O5ePIPTVQK/NQn8i
         4l8H0y9KLXI6BrBy+XyjqlS3A88T1vg3DVRUiZuzItLjJaa7JIiilz63wJgf8dECm64K
         pfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107981; x=1795712781;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLopLnqT37BG2OvCBZ1zm5sa3WM/aEFFGJMu/II3YXU=;
        b=wI+HRWSx3riKkmjOyEzjxAi6YYMgi31+8f2O9OBdJfGTwi9w4/YxYLB2IHx0REmc0C
         kSdKoA0vqJLVuzTVl+1wNhCVt9DZG3RXbWj3Htl+NOpx3ItiIO7tRW9obPjwc436nyhc
         WxJOaCIsTw9oIXY+NUNN6FS6as06rSpNkFMosdEE9dYXnoPRfOL7gi7vet/CQO6Houfu
         GmVbyPwrCCO6MmMA7piYQbeC+gDNeL8OM2dn4HuD7x0L/tcBpiEbRCsrrBCIk6q6z4hv
         l3ynn07BUEdJR2cxpUqdr06JoGqiYjqTghF4PBqi6Wd2632hyR/GYbO89Wnoy3khNh+u
         bEnQ==
X-Gm-Message-State: APuU4Z/am+xRhXFKYpeMzS6S4jJQo/qtd5BqM9y5eHSYwu69oTirM0y+
	35XDrz4l/61lj8bD83RGHGKidV3oqcjvv7h4cIT1Aea3yLI0hpprJl7mwgT3ECkMnq/4+HVAuKZ
	UfbkyfyJBxQ==
X-Received: from oaccw5.prod.google.com ([2002:a05:687c:2705:b0:4ad:bde3:7f14])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:1620:b0:716:d2b4:f895
 with SMTP id 006d021491bc7-71b395258b4mr197475eaf.62.1795107981165; Thu, 19
 Nov 2026 09:06:21 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:13 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170613.1519353-1-irogers@google.com>
Subject: [PATCH net] eth: funeth: Include FEC stats in fun_free_stats_area()
 DMA free size
From: Ian Rogers <irogers@google.com>
To: Dimitris Michailidis <dmichail@fungible.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

fun_init_stats_area() allocates coherent DMA memory for
(PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX)
64-bit counters (632 bytes), whereas fun_free_stats_area() omits
PORT_MAC_FEC_STATS_MAX and passes 616 bytes to dma_free_coherent(),
triggering DMA-API debug size-mismatch warnings on teardown.

Extract a shared fun_stats_area_size() helper used by both allocation and
deallocation paths, and cast the leading enum constant to unsigned int to
avoid cross-enum arithmetic.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wenum-enum-conversion; not tested on Fungible Ethernet hardware.

Fixes: ee6373ddf3a9 ("net/funeth: probing and netdev ops")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../ethernet/fungible/funeth/funeth_main.c    | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
index bad8276d26b0..e0d4e69abfa4 100644
--- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
+++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
@@ -1457,17 +1457,20 @@ void fun_set_ring_count(struct net_device *netdev, unsigned int ntx,
 	}
 }
 
-static int fun_init_stats_area(struct funeth_priv *fp)
+static size_t fun_stats_area_size(void)
 {
-	unsigned int nstats;
+	unsigned int nstats = (unsigned int)PORT_MAC_RX_STATS_MAX +
+			      PORT_MAC_TX_STATS_MAX + PORT_MAC_FEC_STATS_MAX;
+
+	return nstats * sizeof(u64);
+}
 
+static int fun_init_stats_area(struct funeth_priv *fp)
+{
 	if (!(fp->port_caps & FUN_PORT_CAP_STATS))
 		return 0;
 
-	nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX +
-		 PORT_MAC_FEC_STATS_MAX;
-
-	fp->stats = dma_alloc_coherent(&fp->pdev->dev, nstats * sizeof(u64),
+	fp->stats = dma_alloc_coherent(&fp->pdev->dev, fun_stats_area_size(),
 				       &fp->stats_dma_addr, GFP_KERNEL);
 	if (!fp->stats)
 		return -ENOMEM;
@@ -1476,11 +1479,8 @@ static int fun_init_stats_area(struct funeth_priv *fp)
 
 static void fun_free_stats_area(struct funeth_priv *fp)
 {
-	unsigned int nstats;
-
 	if (fp->stats) {
-		nstats = PORT_MAC_RX_STATS_MAX + PORT_MAC_TX_STATS_MAX;
-		dma_free_coherent(&fp->pdev->dev, nstats * sizeof(u64),
+		dma_free_coherent(&fp->pdev->dev, fun_stats_area_size(),
 				  fp->stats, fp->stats_dma_addr);
 		fp->stats = NULL;
 	}
-- 
2.56.1.708.g77570a6a1d-goog

