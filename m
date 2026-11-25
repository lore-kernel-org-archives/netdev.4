Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607712;
	b=nRNnDxYpMvML2yubCfN0/Y4Tk077Ad3GeIXpbYBoH72Vd3yMAZHwjX87KHvICkzR7LN+
	 B8xZLy4cehxVNwXuX8YsKpE0EPcefKk7UHoUq6CVF41GPKJ0G+aOwYh3HGJGfqyhDIaCO
	 xRvnHuEb1TAZNrxdVnNBVxURyhVBcvbtqKu9BNhmhKTy61iaDHsDMf4ItlDCaFFt1y9de
	 0BKXCx6lZXqQFmn5MefLPXk6BYvLgaWKtIKwCoN1ckih2hLiHJTOzoGzSQlFwX3j/Nxpj
	 T+9m5kSsNgm0kf2Tl2NujXhx2WQ90buKwXCunxWRoKlmMadvrpkAfijwab6pAh/mngA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607712;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
	b=dovjhM4IZ1LRXSQDV9OQuJ0wkg/SciFOvtmfbTdZVJihpZoLCTolx4OhFJXI2b23YQEN
	 gHZYeCgomthMmZk+uWH+ZmhvRzp2WgnY0VUBtuhpLUrxdYy8FeG3t0QVOKLWPbFuNQICz
	 W9+uwgRgnNZgRGdPrCu0nyyIeEB2fUI5uZwxn/5AeEk9CkJBoBnjbZQ5IBurFzAZ6LVHO
	 isRoUfKA5Go+yO857FU0AIEnNvpwFznIWbjLXK9SsmizoGmkxUGUX8JyghbaRJTLyQFY6
	 b6F8t8c9x0zgTmPDNEv104YwogblMfWi4PpLsRxUZxPIcvEQ0hFCmeoDKDioi9Lu4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N2Ch7llE;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F6606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C8F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N2Ch7llE
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-3282db206d3so5586268eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607711; x=1796212511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=Q8jURg3xfxgcBvAIYuwDRen2QgLME/Orw15SIB9vQq4XyHVSyUQVSf3MhrCix/ws55
         /JnffLVIDIdzPISE0dpzb1nmrtjIeg6bA6+5ZfBezcv6DsHUtDQrUfEUeW7GPUJ8wMRm
         4x0AWTntd+vLlG4ePL2KqqZOuu0scygnnFxvkrXXUEmK4KWj1JtR5UoCV2ygLIpXFAjS
         cCLY4hm5zNrXO6fQ5RrTpjMj16pf+ONKE8zaGDn74XBueEzQrk+Y265BQwHUoFypQvl8
         DZJY0ekWfqVuM1PGcKXQWS7OrtzllBAe37NSRmV9YO4Hno6J5gelL+RJSpEl74q1i6wA
         L61g==
X-Gm-Message-State: APuU4Z8x1lnqQqghEr/U8IdOzEN81wwNxHiocx6GE7IgmlDt4ydAxfEI
	eSNpKPLR17JkKYDNll/wZO7sQxeUTNBktL1U5vgSBv4ux8IVZO+9iP//UHZIj7ibqBl4quXcord
	dSPszGVxcMiBHA1rDmFPWg1igJilwSILnw8Zan3iKYdmjl72QiJdS+LSSEbx615QYYnk7ZGVkZJ
	TWx0XcgaO4mvebTYK1HTLhy2L/1FlDpo+GBqjL6ldB8igvgrh+9NzezWtpOcgiSqqKSizTJku+Y
	pN/PEThHA==
X-Gm-Gg: AZFdTZd/f7ZxGgLbSj0fgZ/D5r5CRRaxpe7qLi28MSLlfAXpxYRSmjCC6PIpuaIyerO
	BITF6ZqyVe74Ivlu38llESnO47pxxrS76qdpZ8elwRDnhfyU5rw8UoiISvnqIuRLKE+pfgjj5Tm
	YgdwXe4iPQlM8xN/xcrlI26r4x3KqozINcKv+vx3Q/TFMQrpLmvkXk0RrmTe+oX/Mu3ZOSlHfaZ
	X41lMVGkVzsb3YHnHkTv6IRygNcdx/zCZKnaRrnW/z+APvCSO0YwCtqrBRAD5txqMB+jxydmjoO
	o5UPr0okGJOxVtKPWpsqU8dzDXDXC3m6hgTDJkpkQdtavRm7ZrV1tiBtAJ9rzOcYqJRPdPNtNP4
	VUkjw+b6D88p4U5ZBdn5gsJrv3ejiB8JdVbNJTaRL4EmF+ve5+Mv/OIA6O1yYckSDkcZPWgD4TX
	1++AAEXQDs0uXTsEiNHCrqaEWkTv+VPAIIdJjp
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr2052321eec.13.1795607711081;
        Wed, 25 Nov 2026 03:55:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-386c24ff26csm1050643eec.27.2026.11.25.03.55.10
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so1330436eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607709; x=1796212509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rSIEZcCmE8wfKBYee1PB/mZPx7D6ZfxybOWWwa5yU5c=;
        b=N2Ch7llE71wKKZAslcU9u3AibxLpFgi9w7ujnRiJurrMu9MmMjEI/fUFS6q5vcP3wg
         6cJbZgSkgFpFYZMv1+cnm/mbPKDbiGvOPUR6/KxblQZeOKxBahF+029fil4480KdUf9i
         mqqeKhyQyMEhkM/2SATi8QGsSUJJM65JiTw6g=
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr9530247eec.22.1795607709047;
        Wed, 25 Nov 2026 03:55:09 -0800 (PST)
X-Received: by 2002:a05:7300:1c1e:b0:386:b0db:944b with SMTP id 5a478bee46e88-386b0db98c0mr9530215eec.22.1795607708356;
        Wed, 25 Nov 2026 03:55:08 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:07 -0800 (PST)
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
Subject: [PATCH net-next v10 03/10] bnge: add helper functions for multi RSS contexts
Date: Wed, 25 Nov 2026 17:24:27 +0530
Message-ID: <20261125115434.2080590-4-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
References: <20261125115434.2080590-1-vikas.gupta@broadcom.com>
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

