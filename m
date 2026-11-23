Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428657;
	b=ZnQKz4jwA9hH18m5q+uG+Z+6ptzm5ORC4cpRKov6TLidyMh4gLaFCBiDZOlXVlJs7Dx/
	 PnEHo8JlQ9F2n++ZouQ2hK6kI2AmB4Gds+wUh+5LX2kXMyI0PXcy4YE628udKgedf4mjn
	 1C5QyPEcO/7YxjInDGgyz8iBbvHNnRxzVFDQe/nZ9pFwrQ4viVgMR41xxAEea7jTmUJBg
	 gXja3J8WJ44eEZxq2+R2k4dRMZy9u57r8va0jUTTdXNYn4PQRmTVPyjhdCFqmR2LOWk/6
	 1RebG00v/2wR9JaKv5sAkDgHCpaomUMKzUMdpkoJDP1KfS2y+2anLB48jdfs2ssWSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428657;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
	b=G0Bq4hK+DZmKCM+shhvLv5MjOl3Bgr1eRyCGjstE8tPVjJA+CkPvQr5KRrE3Zq9daSu3
	 Qn1iYzmXj0dFsOvfWIrADKBooTwEtqWvN+ZG8xQxhxAUhs3926xzy35qA91f05dqNWYwL
	 /xq+v/uF/LM4eXy1iECfmGyv1HA8hTsH4wSQi3PVjXFrLiWFlyEdjVBw2oQ6nbc6qNh9y
	 BhFBPhEo1OELYfVfYiG08PctM9CDzWgkUcqStcIQeP0l8vtDXJgaj0osZC/A2iqb3sxco
	 0R27zT4soqeKb6bjE1Vu86YmXZ4z0clpT9fwuf4LPXdM4a2OUwqfG54JU62KwJu8cbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=davJAgUn;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A813606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A813606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=davJAgUn
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f04fab527eso21692525ad.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428654; x=1796033454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=PAo0Y9N9ukQwkSVPbgcFZ3HHzzUyNjKnUsv9MlQOkQ21wDllEM4hndesC+XHSq1uX0
         MJ+/VNUpqgtAlZ2ytJ8zGEbf7rQet0n+EWAHIFRec1KyVn7ZTkeNLbhElEc7VOuAdWc0
         DaBjTtjQfPw9B31D+RuDfecVEzkE2lKXoQAhpVTN8Lq9RA74ZeplR/rMhzz7Qv1D+nVQ
         GJ7d/KoTFsB+nrOeZM07/JlfybRh4EHYyQmp7QoYxPfIjuQBTdiO3jK5EX9G8riJ2zyd
         o54MwVL4BgwBxCMLUofcdejFu+k7vYB40K+pqijZ8feU+sBm1YVsLlVKPx1kUoCSk1Ha
         BkEg==
X-Gm-Message-State: APuU4Z/OzXJvnAJ9VQ5AEdN2xFP1MzNKTQ18go5jYwxqilQ2NLSjo0D4
	XaT+FC3xe1DNdFns7/eyI4lcWS7EqiAC4O3tzEQ8ca4BfQdOs+X+iZqo7TXAdSBaIJHNeMk1gYY
	ezTfPZ23BIXBUF0lm/IZoKOWgRa4ntlGcRRwElz8Pk2aGQ8HRiDVVkYt1/SB6KPq9HGtLgB9hxK
	SH+ZRL38GzUiZnsyOblpqYupiv/nnNJ9EMkpw1YQ6lVxoHq7IUf6PhOEOb9TvkI5Dun577XOMq0
	2AxIpLhqA==
X-Gm-Gg: AZFdTZddyulJGSgVlVo36WS43i7RP68zRwpHWL+fD9I1aMrxEYXDTZU1IL20kmsfP7I
	5pdbMumvGHOPOlKhqYR4NTeDx7kjfIArNTfIaRAzEN+g10nDpSkGH1s5ySKBkOM6Wh3MCCcKhZL
	mLUp8ktpL27F6sC70tmCpBQWf9/fSoSbEeZsnRCP4JjPagVKf0hp5KLtZbuB3cr4xH5p2Nj9XNk
	53XJLfjSoYDQFeeu3UamNNrgtH/ZsPi0l04e7YnceMCLebbiRCjVm9QHu6xdpAz8fh9wQzbbdEq
	5ch7HSFrzuIrmkSzfBPA0oSzcmPY3X9xaErAlnM1u5EdffxmiTDOOftBun+dkuI0ZBUpRCLWtvM
	EN6QZafRO5CmZUMdhcjlbjcxxqE2M+6zeCaQjMhg2+aLKXUdc4O4SthcXiDFI0ahYIKcZcOmWNo
	WJ+40beV+xj9ql5o3Wzqcx39fLVKmCS1lSGOyi
X-Received: by 2002:a17:90b:3d4d:b0:3b4:402:b3f5 with SMTP id 98e67ed59e1d1-3b41c8fe48amr11245619a91.22.1795428654419;
        Mon, 23 Nov 2026 02:10:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062aa58dsm8648796a91.5.2026.11.23.02.10.54
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:10:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so590928eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428652; x=1796033452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=davJAgUnUy03WHJV7PUhYd5Fz2pbPj6TwTqIFqEJkiEYA/EZlM5m19w+1X12aavpOo
         dDIpyIe0DiiyUNAmMx8lCNFi7uZb7ixarmV/nSh9++AS058prvnTgbmoAR3KiKsUDweN
         3gWr1jKYxK+Hqd4vMNa5KD6UvhsFAGBm5bxJE=
X-Received: by 2002:a05:7301:6a03:b0:385:556b:4df5 with SMTP id 5a478bee46e88-3856f94dbd3mr16337354eec.26.1795428652440;
        Mon, 23 Nov 2026 02:10:52 -0800 (PST)
X-Received: by 2002:a05:7301:6a03:b0:385:556b:4df5 with SMTP id 5a478bee46e88-3856f94dbd3mr16337306eec.26.1795428651754;
        Mon, 23 Nov 2026 02:10:51 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:10:51 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v9 03/10] bnge: add helper functions for multi RSS contexts
Date: Mon, 23 Nov 2026 15:37:39 +0530
Message-ID: <20261123100746.1975030-4-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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

Add infrastructure for creating, modifying, and deleting user-defined
RSS contexts. This helps the next patch implement commands for ethtool.
For each user RSS context, a VNIC is allocated.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  14 +--
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 113 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  15 +++
 4 files changed, 132 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index fef45dfa9179..45996d91dc55 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1126,7 +1126,7 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_vnic_info *vnic;
-	int i, size;
+	int i;
 
 	for (i = 0; i < bn->nr_vnics; i++) {
 		vnic = &bn->vnic_info[i];
@@ -1151,18 +1151,8 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 		}
 
 		/* Allocate rss table and hash key */
-		size = L1_CACHE_ALIGN(BNGE_MAX_RSS_TABLE_SIZE);
-
-		vnic->rss_table_size = size + HW_HASH_KEY_SIZE;
-		vnic->rss_table = dma_alloc_coherent(bd->dev,
-						     vnic->rss_table_size,
-						     &vnic->rss_table_dma_addr,
-						     GFP_KERNEL);
-		if (!vnic->rss_table)
+		if (bnge_alloc_vnic_rss_table(bn, vnic))
 			goto err_free_vnic_attributes;
-
-		vnic->rss_hash_key = ((void *)vnic->rss_table) + size;
-		vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
 	}
 	return 0;
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 13871d3d8286..e0462a0f4f2c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -376,6 +376,8 @@ struct bnge_net {
 
 	u8			pri2cos_idx[8];
 	bool			pri2cos_valid;
+
+	u16			num_rss_ctx;
 };
 
 #define BNGE_DEFAULT_RX_RING_SIZE	511
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index d98a6196c859..a44971a7c74d 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -129,3 +129,116 @@ int bnge_alloc_rfs_vnic(struct bnge_net *bn)
 	vnic = &bn->vnic_info[BNGE_VNIC_NTUPLE];
 	return bnge_alloc_and_setup_vnic(bn, vnic, bn->bd->rx_nr_rings);
 }
+
+void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
+		     struct bnge_rss_ctx *rss_ctx,
+		     const struct ethtool_rxfh_param *rxfh)
+{
+	struct bnge_dev *bd = bn->bd;
+
+	if (rxfh->key) {
+		if (rss_ctx) {
+			memcpy(rss_ctx->vnic.rss_hash_key, rxfh->key,
+			       HW_HASH_KEY_SIZE);
+		} else {
+			memcpy(bn->rss_hash_key, rxfh->key, HW_HASH_KEY_SIZE);
+			bn->rss_hash_key_updated = true;
+		}
+	}
+
+	if (rxfh->indir) {
+		u32 i, pad, tbl_size = bnge_get_rxfh_indir_size(bd);
+		u32 *indir_tbl = bd->rss_indir_tbl;
+
+		if (rss_ctx)
+			indir_tbl = ethtool_rxfh_context_indir(ctx);
+		for (i = 0; i < tbl_size; i++)
+			indir_tbl[i] = rxfh->indir[i];
+		pad = bd->rss_indir_tbl_entries - tbl_size;
+		if (pad)
+			memset(&indir_tbl[i], 0, pad * sizeof(*indir_tbl));
+	}
+}
+
+void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
+			  bool all)
+{
+	struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+	int i;
+
+	bnge_hwrm_vnic_free_one(bn->bd, &rss_ctx->vnic);
+	for (i = 0; i < BNGE_MAX_CTX_PER_VNIC; i++) {
+		if (vnic->fw_rss_cos_lb_ctx[i] != INVALID_HW_RING_ID)
+			bnge_hwrm_vnic_ctx_free_one(bn->bd, vnic, i);
+	}
+
+	if (!all)
+		return;
+
+	if (vnic->rss_table)
+		dma_free_coherent(bn->bd->dev, vnic->rss_table_size,
+				  vnic->rss_table,
+				  vnic->rss_table_dma_addr);
+	bn->num_rss_ctx--;
+}
+
+void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)
+{
+	u32 tpa_flags = bn->priv_flags & BNGE_NET_EN_TPA;
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+		struct bnge_vnic_info *vnic = &rss_ctx->vnic;
+
+		if (bnge_hwrm_vnic_alloc(bn->bd, vnic, bn->bd->rx_nr_rings) ||
+		    bnge_hwrm_vnic_set_tpa(bn->bd, vnic, tpa_flags) ||
+		    bnge_setup_vnic(bn, vnic)) {
+			netdev_err(bn->netdev, "Failed to restore RSS ctx %d\n",
+				   rss_ctx->index);
+			bnge_del_one_rss_ctx(bn, rss_ctx, true);
+			ethtool_rxfh_context_lost(bn->netdev, rss_ctx->index);
+		}
+	}
+}
+
+void bnge_clear_rss_ctxs(struct bnge_net *bn)
+{
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+
+	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+
+		bnge_del_one_rss_ctx(bn, rss_ctx, false);
+	}
+}
+
+struct bnge_rss_ctx *bnge_get_rss_ctx_from_index(struct bnge_net *bn, u32 idx)
+{
+	struct ethtool_rxfh_context *ctx;
+
+	ctx = xa_load(&bn->netdev->ethtool->rss_ctx, idx);
+	if (!ctx)
+		return NULL;
+	return ethtool_rxfh_context_priv(ctx);
+}
+
+int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
+			      struct bnge_vnic_info *vnic)
+{
+	unsigned int size = L1_CACHE_ALIGN(BNGE_MAX_RSS_TABLE_SIZE);
+
+	vnic->rss_table_size = size + HW_HASH_KEY_SIZE;
+	vnic->rss_table = dma_alloc_coherent(bn->bd->dev,
+					     vnic->rss_table_size,
+					     &vnic->rss_table_dma_addr,
+					     GFP_KERNEL);
+	if (!vnic->rss_table)
+		return -ENOMEM;
+
+	vnic->rss_hash_key = ((void *)vnic->rss_table) + size;
+	vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
+	return 0;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index 72357e0b37ac..382df442789e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -58,10 +58,25 @@ struct bnge_vnic_info {
 	u32		vnic_id;
 };
 
+struct bnge_rss_ctx {
+	struct bnge_vnic_info vnic;
+	u32 index;
+};
+
 void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic);
 int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
 int bnge_alloc_rfs_vnic(struct bnge_net *bn);
+int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
+			      struct bnge_vnic_info *vnic);
+struct bnge_rss_ctx *bnge_get_rss_ctx_from_index(struct bnge_net *bn, u32 idx);
+void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
+		     struct bnge_rss_ctx *rss_ctx,
+		     const struct ethtool_rxfh_param *rxfh);
+void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
+			  bool all);
+void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn);
+void bnge_clear_rss_ctxs(struct bnge_net *bn);
 #endif /* _BNGE_VNIC_H_ */
-- 
2.52.0

