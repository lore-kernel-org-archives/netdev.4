Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642489;
	b=htxTAvMeqbGw5PpgDHbpDDdIBtw4xJf9+1/gC9vXgsJf5hRNuNdOtfWStcy87/GVBCOM
	 SWfrppndipNbm10n+lNcafGkdaz2aw17SwI+rqCRUql7aUajZHEt0dUtxUEW+lbWzaGCS
	 rB0bxuiZ1nvaNuY0zTJzPhuW/3JQAb3L+ZmVJusa7w0eTA6BL9D5kp96ey31kPDKxc8Fu
	 YmkSsGQmLKldP5f8IW2hdgBEWO/GZ02MSmEXVWi6/o2VCu6cgG5VCaYnUtn8F7gnEtbOv
	 V/VNR0Cm75Eo3jM9lYZoTOLk73ZObjiQrAkOI67cN0daKJkdYyCRRkWQ4vaG5i0jKSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642489;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
	b=tTj5u9+VPrU9+4HQQlXv6kKcyQS2R+Rpm4ZtKNrLN7Z3aMMBPpFGyolv3P/UW7z1qtS3
	 29M4WL62eGno+BBjblbZIbtrZpDlJnSmMRjfOVMSztBNsvJmCCOLuDvcsIidBNGrrfBR8
	 I4sqSNnt2m5E2WYzx5JjWrjHn2YAWhrx52abK6Q4vgdOt8QYG9kadyX5h/DuF4VkulFTm
	 fi8E+UlacRoU79c7UzgmOB+BqQEi2jetKtHnGdWeLJlqIqjynpaMp1UJ5tmb47uIOIbQE
	 4xyF96Oh4sztJtcylUnn41ABeDBG+hFmD5ap0fo6fzEX7OExzR8CxVraDcrshgSbGTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fVJFT+ji;
	arc=none smtp.remote-ip=209.85.221.226
Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE0606A336
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 07:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFEE0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fVJFT+ji
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5ee3e658c70so225939e0c.0
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642488; x=1795247288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
        b=bZuhnFvTANOAf7FEh5TzaKC2I32IHIIXJDAVQhIvdedHQpmg/NbsJ6273JRBq+sQ6L
         Ul+Ms4qTd2sghz7phuyg3Qlek6KMPFar/P/nnLI/S33e1QB/v9Ik5bcQlI6QSaUBSokX
         T5VYmzNw8M+3T4qp1GxFtnfdkuNkNZF3fqo2URxj23J9NMzve9hmTwPXxD5w/Fy8Uh6l
         3Ev0tYdEZlZuBIYK9vVjn2XssR6znki2sAnway1pgM/RtTiKvh2CvKJcIejickgD2u5Q
         0OvpfJAtEPYItt2qxTeBGx3yI/Jxp/oeUBYqmJPVaX+i4i11pZUGX+dH+fEFEcZICf/q
         d+pQ==
X-Gm-Message-State: APuU4Z9CeJ9F1lzOYDxgwvbRbRlLHeG9KPBtX7LiVw20PwyDIAaesUor
	+OQ5a/uGNHca9EKwIlQvuWM4aO9Oxj2TN2F0Z5Z76g48SFHHcdTcU/HGjcWqZgFcfsHn7gypIwU
	Zi5Ie/pKnQEqoXBQE8Scz5PPD5edWBRZHgNCuM97OCp7jzlFjiDYeTMtLrHL/GyD5tmaLahkaCm
	8PzECw7qUAY2FtYFiAjP3MwViEkYcZPB12+YL57GtmsX+TmyDi03LQimYRHJ4zhXn1QzrBX2pHA
	/hHrNE+nQ==
X-Gm-Gg: AYBFou3RyrfS85Qd8y1kuxScsMCb4pA4HqbmS+MjFOXqp7aiN/6EpyGZBRhgPQ7J8rw
	QF7pUC/6MK/ZfrivwKnUKTIG170WcoiOxvjr4BDV8vJKchTuCJXcFT4CxZgEUdD5jPHan+Ylrn/
	l+yNLXj7CCBMfR54SPr9QauE03ROFd1zF2JawU3ZhZtSCm4uRCB0k6Uf9z7Q+7QIWba+6vmr9zT
	Wehl1svHdyxcjlRk245mS1OZvKF1LUgXmPntFLYVNY2lmU9qbp7zIsj9wS4p9J3ZBe1af9dcpvk
	MYGD64dAoP3MQQCbR7ow+xmDop6w40Um+E3DwhPsJAkAHSG22J3jgU7a8xnPUwGAbwecVOJdZ2s
	ygO2+eU1LRjbzpOfp0vRSgVcd4K74d8jFG1XNPecnFml2LjQIXlmUkm5DtLMNI7K6TKyPpcRkw8
	V0reaot/M1EZeObWRGSuR3upldRnFxniaHMUxv
X-Received: by 2002:a05:6122:2089:b0:5dd:bc1:93da with SMTP id 71dfb90a1353d-5ee34ac3ac4mr1669127e0c.17.1794642487532;
        Fri, 13 Nov 2026 23:48:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5ee34ea32d7sm159391e0c.18.2026.11.13.23.48.07
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:48:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so2767291eec.1
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 23:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642486; x=1795247286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hewMRascvr7AA+5OQppQsEVU0pRPp2P6p7ND6Q3Lz6o=;
        b=fVJFT+jigSg3uxMMxmffA46Jc5+Zpypi0Bbh5A5RSYnFaKVvH0Nb1SQL0Hs6NEjFKh
         VqdJng2SjeFXxN690lkNsIp36k/bDbxZo7v5LLVrJs7UeAVHsaSXLDGuLM8oX3i2nEyk
         wfY/fjUcBPQi3mv17JMwHcO0ZModMWD82gEJo=
X-Received: by 2002:a05:693c:3e0a:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-37966192e10mr4444985eec.19.1794642486165;
        Fri, 13 Nov 2026 23:48:06 -0800 (PST)
X-Received: by 2002:a05:693c:3e0a:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-37966192e10mr4444950eec.19.1794642485463;
        Fri, 13 Nov 2026 23:48:05 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:48:05 -0800 (PST)
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
Subject: [PATCH net-next v7 03/10] bnge: add helper functions for multi RSS contexts
Date: Sat, 14 Nov 2026 13:17:35 +0530
Message-ID: <20261114074742.1484603-4-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
References: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
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
index 3248aae88c8d..e81c7b8634c2 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1102,7 +1102,7 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	struct bnge_vnic_info *vnic;
-	int i, size;
+	int i;
 
 	for (i = 0; i < bn->nr_vnics; i++) {
 		vnic = &bn->vnic_info[i];
@@ -1127,18 +1127,8 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
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
index c47a874df4ba..3c0fea0a7608 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -371,6 +371,8 @@ struct bnge_net {
 
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

