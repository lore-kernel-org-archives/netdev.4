Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861820;
	b=2GrGKti+nsSAY1RTEbHEN0zk1KJMpWkYyP+V0659rfn7t7iiYSU0xKWDXwvQ+bWXeYnc
	 +0NTyq7Z9+8Z6y0ZYZQLR+XBadrWAV4YpCDsA/DJhw1QDMeljyLWthBAC8uaQa5USayR5
	 bD1U0CAXoW1fhtUQ4EDSCNvyV/F2LLbixmNe7AoXzJKcPpOhrg/R6JgVrtni3vlKPwOCB
	 usDtyk1d/luwu4z5pkMRS6YX9qJjZrkdfnUO2QDceSwn/VEE02Nu8kVmM3LLmYAsAo5Jo
	 XYjAkUUWqY01REk2n2fOSJrqfWzGwmzaHC/wYMVuV4u50RJPMoXJ5zOsAscMh/ysqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gqeQBfawp/CuNUJUgbqqZA+eeMwF0xg03pXezmBQj6s=;
	b=PajU4s9+f+PqwMLVUQ4/lzLzMMvOrAbovALXMv8f9JFGjj+SCNz8XQ9ytq3sT0yAKvQ7
	 dSUau8mgxSoPClHggORuF85JhuyPzsqZacy24V9dTinMbVJL9fzRz+DdIP6KpaGBxJRU4
	 S7tLKyaCFGZF5CDhZG1gkNc3yKm1MKqqwOGQCd37MgJrIbjQgi1xqyPqjg1R82bbn8FPt
	 lga4TJNTOJUTuYJST8wTrXdKxwsadNjWVOAusGNtswR4g+mBSx1jFfT6U1hZg4bM/pmPP
	 bofCQAf+x6oYHVeqvNVH0qSa+LpSs00l2ocLifrsKjwhCyGbNFYSFAast8ZDuCFWblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3xwZNCL;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24851606A32F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24851606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3xwZNCL
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3712b6d9843so3263734eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861819; x=1795466619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqeQBfawp/CuNUJUgbqqZA+eeMwF0xg03pXezmBQj6s=;
        b=X3xwZNCLwkCYysF0BNoJST97rLqLD+Ft75vqdFXH7b9O88lZA/TFmBF5omZIORKjQ+
         Wne5+onlyOhtvhKicM7T0SRBRoq6ufTf/OcG1fr0rr/YI53smvnuSANgt6diJ/d0mmLO
         PG/yPE8hjyluIxTY+O/UsuWtwknfRoAdz/M/nJkLPArlttlC6fROSgRl8cax3SJY7s86
         MxW3G+NYDBwe21TUex+9Ww5hL79xsiPt+/duWv3QjZxORLPZdgZ58qCrYFapZKtVxm9q
         kteeXi3UVHHc1Tpu4rhZwglHJp8aU1HMjqQClIStnLDKlr0i5LeaDn48akosH2sbNDe8
         AIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861819; x=1795466619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqeQBfawp/CuNUJUgbqqZA+eeMwF0xg03pXezmBQj6s=;
        b=UYwYGoJ4w45KEDCGrLrbFbvMEt8UvieuTW/zdYGsOcKZ+AXZHM9gdTqDI6APsTbiax
         MujyaHPSLopF6yeL+O6SSKKPlAJSxhRawdShCKcvotlt3dOgADWchwrRewUZtcYk4tOv
         zHUpbyBiYZjBqzjbZhztm9vt6kAoxZi+MUpgQxXeRj6qsRqERVNi8LtDRy9Ql/HJU2Go
         yhuBTqFgKoCGolaTwivpsyWaeP8rP6I8N9WzXrjetCkz1ar4raMZREsR8xQmCgzaLhBS
         CUHsDNysJ7nN9HsRdekqt3N0QBy0I3DsSMS8chktAMbuycnCT4XfdL+Ba1nF79R+lrBe
         OMaA==
X-Gm-Message-State: APuU4Z/63o5X/PRM+9K3nApW0CiaaG3ynF55me14wj5APVu3Wt9WUGJF
	g+WnXu8+AmekOeG6PVbHMysBvNjiSJ1Z3esxozuUYwan3CXfH+2RXTzI
X-Gm-Gg: AZFdTZc+sD0q7Arj3cBh4mUzFg/1vkzC3C/dZboE8HfNyBnUIZGyF6K20FP3Jz7U/kt
	Y2igMZbx/PWbZG16jkAUwnXQ4xaENj7Pz0QaEtqs9HMxsIRxgEafH4wI6f/LZY5QpT064DoXVbn
	HxuhWx/Ic4jyCg/0mueI3EzTQ4TNKl1X7TfgPh+CU9B7hJwfWjlf7ViYOok6XeGWd3L4Ag++VR4
	VBnWTkwgE3pGLHcCgQf+/HJs/1znXJCuDJb2+cVZbvngIz0r73brwV9K92Aj6umglxiYIXpNTUy
	HNV7LlEsnsNop7dF33dtZbdBGnm/kGMaGL4bbf10EU9NNuasw62EjjXtUm+JSZFDHm0GY9C3tQ5
	irmF/lgn438cXfnSaiGxMnpodWPcZEGHUPIBtg2GoHgTfRSOWDLI15f9EejqjxKlFKWl1MSR/WH
	4AdoQSMG6L0qfcy1pEzjFxc4Q4LvmVnUBF/krOGxh0e4ZRNSnzMIqEB4M1LzNBIhdqhAOWVa8ef
	5gDI+fztb/zbsQSRtTTB+wLdDJLQxuzScWqsnnJynS2z/AD20BgQ3+16KO5HKtWEb/sRcKOFE6Z
	qzC+/S04LWGgW1ewph33+wdYLEsalny8PszQ0FDcTyYHX7JRJVEv7zpj3mzfUX6sMw==
X-Received: by 2002:a05:7300:546:b0:380:f8fd:d19c with SMTP id 5a478bee46e88-380f8fdd828mr1175048eec.35.1794861819021;
        Mon, 16 Nov 2026 12:43:39 -0800 (PST)
Received: from narcisav-mac.corp.tfbnw.net ([2620:10d:c090:500::7:8f78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm49553549eec.19.2026.11.16.12.43.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 12:43:38 -0800 (PST)
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narcisa Vasile <narcisav.kernel@gmail.com>
Subject: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Date: Mon, 16 Nov 2026 12:43:13 -0800
Message-ID: <20261116204313.23023-1-narcisav.kernel@gmail.com>
X-Mailer: git-send-email 2.53.1
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

Expose counters for HW GSO skbs and the wire packets they produce through
netdev queue statistics. Update the counters when TX completions are
processed.

The tso.py selftests are skipped for drivers that don't report
these counters, so this also lets them run on bnxt.

Signed-off-by: Narcisa Vasile <narcisav.kernel@gmail.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 ++++++++++++++++++++---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  6 +++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 6846a27bfef4c..1a7a93bf684ac 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -869,6 +869,11 @@ static bool __bnxt_tx_int(struct bnxt *bp, struct bnxt_tx_ring_info *txr,
 		cons = NEXT_TX(cons);
 		tx_pkts++;
 		tx_bytes += skb->len;
+		if (skb_is_gso(skb) && !tx_buf->is_sw_gso) {
+			txr->tx_hw_gso_packets++;
+			txr->tx_hw_gso_wire_packets +=
+				skb_shinfo(skb)->gso_segs;
+		}
 		tx_buf->skb = NULL;
 		tx_buf->is_ts_pkt = 0;
 
@@ -13820,6 +13825,17 @@ void bnxt_get_ring_drv_stats(struct bnxt *bp,
 
 	for (i = 0; i < bp->cp_nr_rings; i++)
 		bnxt_get_one_ring_drv_stats(bp, stats, &bp->bnapi[i]->cp_ring);
+
+	if (!bp->tx_ring)
+		return;
+
+	for (i = 0; i < bp->tx_nr_rings; i++) {
+		struct bnxt_tx_ring_info *txr = &bp->tx_ring[i];
+
+		stats->tx_total_hw_gso_packets += txr->tx_hw_gso_packets;
+		stats->tx_total_hw_gso_wire_packets +=
+			txr->tx_hw_gso_wire_packets;
+	}
 }
 
 static bool bnxt_mc_list_updated(struct bnxt *bp, u32 *rx_mask,
@@ -16350,15 +16366,15 @@ static void bnxt_get_queue_stats_tx(struct net_device *dev, int i,
 				    struct netdev_queue_stats_tx *stats)
 {
 	struct bnxt *bp = netdev_priv(dev);
-	struct bnxt_napi *bnapi;
+	struct bnxt_tx_ring_info *txr;
 	u64 *sw;
 
 	if (!bp->tx_ring)
 		return;
 
 	bnxt_sync_ring_stats(bp);
-	bnapi = bp->tx_ring[bp->tx_ring_map[i]].bnapi;
-	sw = bnapi->cp_ring.stats.sw_stats;
+	txr = &bp->tx_ring[bp->tx_ring_map[i]];
+	sw = txr->bnapi->cp_ring.stats.sw_stats;
 
 	stats->packets = 0;
 	stats->packets += BNXT_GET_RING_STATS64(sw, tx_ucast_pkts);
@@ -16369,6 +16385,9 @@ static void bnxt_get_queue_stats_tx(struct net_device *dev, int i,
 	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_ucast_bytes);
 	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_mcast_bytes);
 	stats->bytes += BNXT_GET_RING_STATS64(sw, tx_bcast_bytes);
+
+	stats->hw_gso_packets = txr->tx_hw_gso_packets;
+	stats->hw_gso_wire_packets = txr->tx_hw_gso_wire_packets;
 }
 
 static void bnxt_get_base_stats(struct net_device *dev,
@@ -16385,6 +16404,9 @@ static void bnxt_get_base_stats(struct net_device *dev,
 
 	tx->packets = bp->net_stats_prev.tx_packets;
 	tx->bytes = bp->net_stats_prev.tx_bytes;
+	tx->hw_gso_packets = bp->ring_drv_stats_prev.tx_total_hw_gso_packets;
+	tx->hw_gso_wire_packets =
+		bp->ring_drv_stats_prev.tx_total_hw_gso_wire_packets;
 }
 
 static const struct netdev_stat_ops bnxt_stat_ops = {
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307a..51c1568432b67 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -1016,6 +1016,10 @@ struct bnxt_tx_ring_info {
 	struct bnxt_ring_struct	tx_ring_struct;
 	/* Synchronize simultaneous xdp_xmit on same ring */
 	spinlock_t		xdp_tx_lock;
+
+	/* Updated on TX completion, kept per ring */
+	u64			tx_hw_gso_packets;
+	u64			tx_hw_gso_wire_packets;
 };
 
 #define BNXT_LEGACY_COAL_CMPL_PARAMS					\
@@ -1176,6 +1180,8 @@ struct bnxt_total_ring_drv_stats {
 	/* end of ethtool -S stats */
 	u64			rx_total_hw_gro_packets;
 	u64			rx_total_hw_gro_wire_packets;
+	u64			tx_total_hw_gso_packets;
+	u64			tx_total_hw_gso_wire_packets;
 };
 
 struct bnxt_stats_mem {
-- 
2.53.1-Meta

