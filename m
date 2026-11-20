Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138212;
	b=t86QaVyUMD8wIcaSzGQjBu0ruaOfSCfFzs7PE1dUSUPPTqZ5hXsHcpbLcstuFouVmLZA
	 1kN9+OweXWJT3gw+Y6x+NUyR5zMsG/6iOCFellIzE4RS9WIN/gX/a3nv4ysu3eB+ydDRR
	 2dHb0/FgVWWwWJ1b1qMrIuHUB9RTXMILCI8I83sCCJMxL3+OtE0RHr9oel9t7ZWIwgA4F
	 P0PZfWvuuXdUldBxqM5jKE+k/1OHzHgse9uGFWk37nFXwL2ztsklSvujZ3iAcqTDdXX8z
	 xtCykDZQVTzMvktRoLdPbCxoou1xwT4mrnfdyEEMJp4hnjrgFYJMsk81P1IIepBhCDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Mk0Law1Gk18UNYa/iw+PdM+DrzxT4J8m/4kcydmECHk=;
	b=ZeIE249Th2W2GlI/rnGZ2ITqou7j+YArzCpphqBGuMSHTNU/JWxaesp0nxHOT795NQGQ
	 m7QtPKHrUIsm1DvjmEearSpnYBp77AjTOrioMl6ZjiWvOdlV9ouGg6Yx+YTSlytIKgDe5
	 qNAg0DBH/v7wHIjrnAapQp8Bdo/6/IqYajdi1P+6cZiEubJgGkTcue4Q7akuU1IDw9gsw
	 lvreKGscfJNrAlByAc5y+qXWOFq5bQjWwtFwrlQf+K0pKVJa0f7V1n9rNfSYqOEk0zSi7
	 Bl/0XVr2byy30DVQJkfZJIqLdgnn3HWQEnjlROrsvJKCWSXAyOwxi/Kz3YHBqSDp4tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZpYHCvI5;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3D9606A336
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3D9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZpYHCvI5
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso194299a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138211; x=1795743011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mk0Law1Gk18UNYa/iw+PdM+DrzxT4J8m/4kcydmECHk=;
        b=KveK+Fq3+2TSd6qJB972fRe6wRDCOhgvYIo07BywwWYgTd9CCMK1LFXNihvsB6cW6F
         ELTwwuK/cAzpAKkFPolxvu9NwOisC4Yxtwv/Er95NmwwxuiFz0jlO6o4H1yNdyRpXVpL
         N5UZayDwKHmWSsM4Nf9jmM29suDS4BlQh1y3jfe4hSJMwsbq+OD5bsHGiuVoz5IFEctl
         7vLLF+0XNFIrT+rpZY0ZqgaNMAhLQ5qqMbppht2YmqfE/TmxibNdzhHuZNDfQq4c4DXW
         CoVgbTAJt/h8dxPf16gyGf0iFUdRm2acyDCxynGvhbNAAPqsIOUE7FLPiu2kz8+fQJvR
         8QRw==
X-Gm-Message-State: APuU4Z9lBSq8mIGhHtR9bsxumuQB+j/KUefyJxjus9MtbSRHDowKv8es
	pWe0hfhJ4hgMAVnmV1V/ST8kOhtO0BWNm/fa+OBwwJigc+U5pJ9xqrucboSrJxp2ArntmGQ18Pm
	tzOpavjFCL7aQOocOXnRrJiLCQ+lyTJJEv0qbieb9AkgRHcn/y8ym3T2UCCtR3/d6fEYp/Yv1xp
	5yyMmDfXUGk+mq3MPe8ALPysSmguCEG4XE2kujj0v16VbIGcqaTc4Jy7J1k68j0Ir25DBIQDbGr
	8ZRsV49SBE=
X-Gm-Gg: AZFdTZc9fiQtBcrc/S4xWVLFI7GBJ4AO02UlXx5ZcIlDJ/CR+1Qvo0kjC6QCHxyK477
	tV54MBeT+Q696yDGAEs/qcXq3p7kP6Gzd33EPD2YFFNvJrePdJBA+HGznaZKhske67iOqJKD25O
	U97O60mRJM+UyZpiaB49OrhjteibDhBWAPFDoLN2lrCFsmnlXN8gRkNgHXvhSuUMh3VX6U1KK5P
	qyhnZamUfBc7rbWWRkhko8JAEGMkqGH5GSFIbDFL9v1oIpjQn5cxUk4/RG47xJ+D0FMdo80A67r
	tI5rqojomD+8xGtd34ia/kRbNqsw8K/lmvApafpunJMM7v8KazMjep1l7nLBlwJhYN4qNID/UIm
	FnvF9PYGBgIr5B3XlBtHmjBVqywepD4f/SMhhWr6/0Iswg+Z7ZX8R6904+AXcoX9QUZaSr8oI4i
	t6yiS81nDJpvZ50pOzbQE8smOnNqOqQn2dgdQ=
X-Received: by 2002:a17:90b:35c3:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b41c946374mr1042362a91.36.1795138211097;
        Thu, 19 Nov 2026 17:30:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062e6c29sm2192296a91.7.2026.11.19.17.30.10
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ad74fdeso9580066d6.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138210; x=1795743010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mk0Law1Gk18UNYa/iw+PdM+DrzxT4J8m/4kcydmECHk=;
        b=ZpYHCvI5zUtndlyGYIau8gZrm/ec4nTRSdwMuBHhghnKvXuiIuY2RtMhSkMC8AOBEK
         S99bDU7YeVGzBK4Euu87AMXmgxV05shhiDd07zjbYsBPiP12f7n/qKVlgoGD7Vcpa1zT
         7qWQq5FNo13YOy8OHEOTUzCT+dxEqIlrN8S1c=
X-Received: by 2002:a05:6214:20a7:b0:920:e412:e3df with SMTP id 6a1803df08f44-92134a6caaamr27785086d6.18.1795138209709;
        Thu, 19 Nov 2026 17:30:09 -0800 (PST)
X-Received: by 2002:a05:6214:20a7:b0:920:e412:e3df with SMTP id 6a1803df08f44-92134a6caaamr27784316d6.18.1795138209118;
        Thu, 19 Nov 2026 17:30:09 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:08 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 5/9] bnxt_en: Reinit IRQ when configuring LRO/GRO/HDS
Date: Thu, 19 Nov 2026 17:29:17 -0800
Message-ID: <20261120012921.2537903-6-michael.chan@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120012921.2537903-1-michael.chan@broadcom.com>
References: <20261120012921.2537903-1-michael.chan@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

When configuring LRO/GRO/HDS, a new set of RX Aggregation rings may be
required.  It is possible that the FW cannot grant the desired number
of Agg rings, causing the driver to reduce the number of ethtool
channels to adjust.  This means that the number of IRQs/NAPIs may
change and we must set irq_re_init to true to make that work.  Without
this patch, when the driver is eventually shutdown, some memory for the
unused NAPIs may never be freed properly if the rings have shrunk.

Fixes: 87c8f8496a05 ("bnxt_en: add support for tcp-data-split ethtool command")
Fixes: 674f50a5b026 ("bnxt_en: Implement new method to reserve rings.")
Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c         | 11 ++++++++---
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index f4eff048eea5..887a67d42bb3 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14154,10 +14154,11 @@ static int bnxt_set_features(struct net_device *dev, netdev_features_t features)
 {
 	bool update_tpa = false, update_ntuple = false;
 	struct bnxt *bp = netdev_priv(dev);
+	bool irq_re_init = false;
 	u32 flags = bp->flags;
+	bool re_init = false;
 	u32 changes;
 	int rc = 0;
-	bool re_init = false;
 
 	bp->tx_wake_thresh = max_t(int, bp->tx_ring_size / 2,
 				   bnxt_min_tx_desc_cnt(bp, features));
@@ -14184,8 +14185,12 @@ static int bnxt_set_features(struct net_device *dev, netdev_features_t features)
 		update_tpa = true;
 		if ((bp->flags & BNXT_FLAG_TPA) == 0 ||
 		    (flags & BNXT_FLAG_TPA) == 0 ||
-		    (bp->flags & BNXT_FLAG_CHIP_P5_PLUS))
+		    (bp->flags & BNXT_FLAG_CHIP_P5_PLUS)) {
 			re_init = true;
+			if (!(bp->flags & BNXT_FLAG_AGG_RINGS) &&
+			    (flags & BNXT_FLAG_AGG_RINGS))
+				irq_re_init = true;
+		}
 	}
 
 	if (changes & ~BNXT_FLAG_TPA)
@@ -14208,7 +14213,7 @@ static int bnxt_set_features(struct net_device *dev, netdev_features_t features)
 			return bnxt_reinit_features(bp, true, false, flags, update_tpa);
 
 		if (re_init)
-			return bnxt_reinit_features(bp, false, false, flags, update_tpa);
+			return bnxt_reinit_features(bp, irq_re_init, false, flags, update_tpa);
 
 		if (update_tpa) {
 			bp->flags = flags;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
index ef4bea4a0f8c..0739cd80a966 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
@@ -853,6 +853,7 @@ static int bnxt_set_ringparam(struct net_device *dev,
 {
 	u8 tcp_data_split = kernel_ering->tcp_data_split;
 	struct bnxt *bp = netdev_priv(dev);
+	bool irq_re_init = false;
 	u8 hds_config_mod;
 	int rc;
 
@@ -876,8 +877,13 @@ static int bnxt_set_ringparam(struct net_device *dev,
 		return -EINVAL;
 	}
 
+	if (hds_config_mod &&
+	    tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_ENABLED &&
+	    !(bp->flags & BNXT_FLAG_AGG_RINGS))
+		irq_re_init = true;
+
 	if (netif_running(dev))
-		bnxt_close_nic(bp, false, false);
+		bnxt_close_nic(bp, irq_re_init, false);
 
 	if (hds_config_mod) {
 		if (tcp_data_split == ETHTOOL_TCP_DATA_SPLIT_ENABLED)
@@ -891,7 +897,7 @@ static int bnxt_set_ringparam(struct net_device *dev,
 	bnxt_set_ring_params(bp);
 
 	if (netif_running(dev)) {
-		rc = bnxt_open_nic(bp, false, false);
+		rc = bnxt_open_nic(bp, irq_re_init, false);
 		if (rc)
 			return rc;
 	}
-- 
2.51.0

