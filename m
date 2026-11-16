Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838079;
	b=TRNq3Y5cMygHE9aQm7xSFbQSGwDyRhEPultArXLawkw3ADH5GN1VLKdOXVNUu7/2lcbs
	 nQH2EYChB3JxfozUG6GC/AOgV+9Q0nmF4O1zi/5lnOsDs6yHtgryYkgi22H+ZfaVbQ9hJ
	 Cjn4iTD+Z9pyLEcnZiN67CWt5vo16A/h+4YMk2LJEmND9b6irp8Q3F1uyWaHyPIjxRqCx
	 ec8b/KAYIUniSo25TEstgcgyYTe2CqkH8oei+w8QjJFfKrqFP/uQpqDAx1VerRkI4wZYX
	 7GkJL/dv2gzpI9D5epKUbI5hhzE0ixQk+h1MB/J5xfUsGd4tmNVgYASQ0P/QrOI+cBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838079;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uORWjcb9voq4SPCe3ixnQfs5J1LiKu4QkgyD8xLJvEg=;
	b=H7T6eQxuRF3+Yjic81vUqIm6Z6vbw+AEIFtRUt7usLpDNhuL7aLjHRRNdCzDMGQJZ2lc
	 jhf7MJXxIh4MnilQJOeF/PGwBYM9dwlyEpqC4rNzjDOcDoza7fB1H/clCOxibRwKpIB6h
	 94xdP0Eg93mBkvc23FQxZrxb1btfc9MrNF+bliAnOnxe2stbRdE4RvGsnGKetLI1wyVNy
	 vZtG2C/ZW2GNPnrM435oePGf/RUR+5hv5V1BXXIsKLraN259Ga2CmPsfgYUZm9i91in4F
	 Wf5n6epBrOWWvsNHFKDVSZ3oohBo9y5xGTUQKYjgO0WatOcmdRzrL4vPQfzrs+lTO/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O+GkQJg8;
	arc=none smtp.remote-ip=209.85.161.97
Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0FC606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=O+GkQJg8
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-71ada4644f8so882413eaf.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838077; x=1795442877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uORWjcb9voq4SPCe3ixnQfs5J1LiKu4QkgyD8xLJvEg=;
        b=mKiEvf+QG76LRr9d+VF87S+z9mpEv3Eaje/vuGiYD9IGRxK5NO4KjcvSCz3PKm8Xge
         BX1UKtOWbvVAwdq/pZ6KTtZ2BQGb6DijVR3ozESCqD49e9eccn67TXfVH6X/1NdFE6hn
         xtPYQ+/x23SOpjijn/HHWA/GUGbv9zmEha61dRZSJT/8ny5rHA3B76GnjI5/bS9E9DzU
         nMd3PZjdoCf6EoOYKIk28E1hN9gSZZijEJ1nPSDsro4CsoV7T3lapVVGlJC47tyHa1Wt
         /QCOYNGXVVUIkWXtDQZqfftNKU123gbpZPmlU8i9gW8Xh/VHURLwxnvQ188jRJTevX4x
         Kq1g==
X-Gm-Message-State: APuU4Z/mgehyYdqzcYVCUecDEYb1bH7PBI5uLjrrdyjmAT4WliPnzfzV
	xqXz4lge+y06d6lgnLu/TcVvlfH4TAyEnpIV/Rj4QAovmyw1kuzmjGCTPkyLqtZ0p5g9Ou2cCpz
	V2gB+F7s3lzjK4Ut9zZO0zZQaLw/KgnsF1v/+I2k3OrUau7xWxAwYcUv3Voe1kpIt2f4MB9yLiE
	wJcIe6G2NZUKVxRyOdjxehH0FyMQZCWDEbLTlJ6NUyc0xqc5+gORoI1VygBuniPcXLvBP0yS9+s
	r+hwpk5+w==
X-Gm-Gg: AYBFou2wzsifMFAZ+5IqwYfXjxPrX5VqFvZGcAnTy5KBUMOqfKjoya1jXlBc5JiRQkg
	OZLwrYN0L2DbFf55oEqRJCvmj9oN/KzUDgZkCsesIeSzWA+64h7EvbFlrXnKemm5/S9aqkDCpAq
	qoSp4n0bldyR/oGXFErq6Tpc0WInx/PiTfKsfKv++joVyzX5lAfyPPqhu5LtvcWQIq8vEUEtX93
	UtMIRHmTW3yFNgIQx/d6k4F6AhJtjNNTUp6ICKwtPs5Rss2eCWBfr6sDdufWGopIUGdKQPQZ53J
	u/4V/LYYFJyNhojHOYmYbuL3Lp6NqfOcygD10XGwyBoJzbdh+VoyOeVTVoZ7Hb7BrW7ZGpaeqG/
	1G3G96KZTBM6rQeWis6vFnHh8ktANTXFUqjtEi8kfp46pJ+r528zcyGa7gDZjbPI2LIPnFarb4x
	yi/fNJI4DW+VQEv/I8hvlsILRI3cAs7bWv+A==
X-Received: by 2002:a05:6820:807:b0:71a:f035:824d with SMTP id 006d021491bc7-71af0358562mr2325686eaf.37.1794838077476;
        Mon, 16 Nov 2026 06:07:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-8629d6aa713sm118057a34.19.2026.11.16.06.07.56
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:07:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so3040473eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838076; x=1795442876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uORWjcb9voq4SPCe3ixnQfs5J1LiKu4QkgyD8xLJvEg=;
        b=O+GkQJg85G0UiTxSCChybZn2JcGCfOqVXD7R0HSvIfC6N1QG9540GCW2nXj10bAEzV
         c0bKS2qcTOYJxiPWhvL8cGq+b+6VXc/nY/qmc8NyGsY4jEY3iQZCtkpwWFVS69jemBu5
         n/gG5SOrWSyCi2FXZm/8vhdXVZyeIo5uYJg1g=
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr5067919c88.42.1794838075484;
        Mon, 16 Nov 2026 06:07:55 -0800 (PST)
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr5067169c88.42.1794838059483;
        Mon, 16 Nov 2026 06:07:39 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:07:38 -0800 (PST)
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
Subject: [PATCH net-next v8 02/10] bnge: add NTUPLE/ARFS VNIC
Date: Mon, 16 Nov 2026 19:36:45 +0530
Message-ID: <20261116140653.1685797-3-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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

Initialize the second VNIC, which is specifically used for the
NTUPLE/ARFS feature. This VNIC helps support the aRFS/NTUPLE
functionality. With this change, the total number of VNICs becomes 2.
Add bnge_set_dflt_rfs() to configure the default NTUPLE feature state
at netdev allocation time.

The NTUPLE/aRFS VNIC is always allocated, so the function needs at
least BNGE_BASE_VNICS (2) VNICs and the matching RSS contexts.
Firmware grants these to every supported function. If it grants fewer,
bnge_reserve_rings() fails with -ENOMEM and the device does not probe,
so there is no fallback to a single VNIC.

The patch also removes BNGE_FW_CAP_CFA_NTUPLE_RX_EXT_IP_PROTO and
BNGE_FW_CAP_CFA_RFS_RING_TBL_IDX_V3, which nothing uses, and renumbers
BNGE_FW_CAP_VNIC_RE_FLUSH from BIT_ULL(26) to BIT_ULL(24).

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  4 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 63 +++++++++++++++++--
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  1 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 29 ++++++---
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |  1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 33 +++++++++-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  8 ++-
 7 files changed, 120 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index bde54ba5d50f..3e8210626062 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -63,9 +63,7 @@ enum {
 	BNGE_FW_CAP_THRESHOLD_TEMP_SUPPORTED		= BIT_ULL(21),
 	BNGE_FW_CAP_DFLT_VLAN_TPID_PCP			= BIT_ULL(22),
 	BNGE_FW_CAP_VNIC_TUNNEL_TPA			= BIT_ULL(23),
-	BNGE_FW_CAP_CFA_NTUPLE_RX_EXT_IP_PROTO		= BIT_ULL(24),
-	BNGE_FW_CAP_CFA_RFS_RING_TBL_IDX_V3		= BIT_ULL(25),
-	BNGE_FW_CAP_VNIC_RE_FLUSH			= BIT_ULL(26),
+	BNGE_FW_CAP_VNIC_RE_FLUSH			= BIT_ULL(24),
 };
 
 enum {
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 31ca314fd52b..e79e05be25e1 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1149,12 +1149,7 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 
 static int bnge_alloc_vnics(struct bnge_net *bn)
 {
-	int num_vnics;
-
-	/* Allocate only 1 VNIC for now
-	 * Additional VNICs will be added based on RFS/NTUPLE in future patches
-	 */
-	num_vnics = 1;
+	int num_vnics = BNGE_BASE_VNICS;
 
 	bn->vnic_info = kzalloc_objs(struct bnge_vnic_info, num_vnics);
 	if (!bn->vnic_info)
@@ -1320,6 +1315,9 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	bn->vnic_info[BNGE_VNIC_DEFAULT].flags |= BNGE_VNIC_RSS_FLAG |
 						  BNGE_VNIC_MCAST_FLAG |
 						  BNGE_VNIC_UCAST_FLAG;
+	bn->vnic_info[BNGE_VNIC_NTUPLE].flags |= BNGE_VNIC_RSS_FLAG |
+						 BNGE_VNIC_NTUPLE_FLAG;
+
 	rc = bnge_alloc_vnic_attributes(bn);
 	if (rc)
 		goto err_free_nq_tree;
@@ -2578,6 +2576,13 @@ static int bnge_init_chip(struct bnge_net *bn)
 	if (rc)
 		goto err_out;
 
+	rc = bnge_alloc_rfs_vnic(bn);
+	if (rc) {
+		netdev_err(bn->netdev,
+			   "hwrm aRFS vnic alloc failure rc: %d\n", rc);
+		goto err_out;
+	}
+
 	if (bd->rss_cap & BNGE_RSS_CAP_RSS_HASH_TYPE_DELTA)
 		bnge_hwrm_update_rss_hash_cfg(bn);
 
@@ -3051,6 +3056,11 @@ static int bnge_close(struct net_device *dev)
 	bnge_hwrm_if_change(bn->bd, false);
 	bn->sp_event = 0;
 
+	/* netif_running() is false now. Apply an NTUPLE change that
+	 * bnge_fix_features() held back while the interface was up.
+	 */
+	netdev_update_features(dev);
+
 	return 0;
 }
 
@@ -3133,6 +3143,36 @@ static const struct netdev_stat_ops bnge_stat_ops = {
 	.get_base_stats		= bnge_get_base_stats,
 };
 
+static netdev_features_t bnge_fix_features(struct net_device *dev,
+					   netdev_features_t features)
+{
+	/* NTUPLE can only be changed while the interface is down. */
+	if (netif_running(dev)) {
+		if (dev->features & NETIF_F_NTUPLE)
+			features |= NETIF_F_NTUPLE;
+		else
+			features &= ~NETIF_F_NTUPLE;
+	}
+	return features;
+}
+
+static int bnge_set_features(struct net_device *dev, netdev_features_t features)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	u32 flags = bn->priv_flags;
+
+	flags &= ~BNGE_NET_EN_NTUPLE;
+	if (features & NETIF_F_NTUPLE)
+		flags |= BNGE_NET_EN_NTUPLE;
+
+	if (flags == bn->priv_flags)
+		return 0;
+
+	bn->priv_flags = flags;
+
+	return 0;
+}
+
 static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_open		= bnge_open,
 	.ndo_stop		= bnge_close,
@@ -3140,6 +3180,8 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_get_stats64	= bnge_get_stats64,
 	.ndo_set_rx_mode_async	= bnge_set_rx_mode,
 	.ndo_features_check	= bnge_features_check,
+	.ndo_fix_features	= bnge_fix_features,
+	.ndo_set_features	= bnge_set_features,
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
@@ -3265,6 +3307,13 @@ static void bnge_init_ring_params(struct bnge_net *bn)
 	bn->netdev->cfg->hds_thresh = max(BNGE_DEFAULT_RX_COPYBREAK, rx_size);
 }
 
+static void bnge_set_dflt_rfs(struct bnge_net *bn)
+{
+	bn->netdev->hw_features |= NETIF_F_NTUPLE;
+	bn->netdev->features |= NETIF_F_NTUPLE;
+	bn->priv_flags |= BNGE_NET_EN_NTUPLE;
+}
+
 int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 {
 	struct net_device *netdev;
@@ -3371,6 +3420,8 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	bnge_set_ring_params(bd);
 
 	bnge_init_l2_fltr_tbl(bn);
+	bnge_set_dflt_rfs(bn);
+
 	bnge_init_mac_addr(bd);
 
 	rc = bnge_probe_phy(bn, true);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index ee649cc644db..c47a874df4ba 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -152,6 +152,7 @@ enum {
 	BNGE_NET_EN_GRO		= BIT(0),
 	BNGE_NET_EN_LRO		= BIT(1),
 	BNGE_NET_EN_JUMBO	= BIT(2),
+	BNGE_NET_EN_NTUPLE	= BIT(3),
 };
 
 #define BNGE_NET_EN_TPA		(BNGE_NET_EN_GRO | BNGE_NET_EN_LRO)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 01205b161d82..506ceee775e1 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -206,12 +206,16 @@ int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 static u16 bnge_get_total_rss_ctxs(struct bnge_dev *bd,
 				   struct bnge_hw_rings *hwr)
 {
-	return bnge_cal_nr_rss_ctxs(hwr->grp);
+	u16 rss_ctx = bnge_cal_nr_rss_ctxs(hwr->grp);
+
+	rss_ctx *= hwr->vnic;
+
+	return rss_ctx;
 }
 
 static u16 bnge_get_total_vnics(struct bnge_dev *bd)
 {
-	return 1;
+	return BNGE_BASE_VNICS;
 }
 
 u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd)
@@ -237,8 +241,12 @@ static void bnge_copy_reserved_rings(struct bnge_dev *bd,
 
 static bool bnge_rings_ok(struct bnge_hw_rings *hwr)
 {
-	return hwr->tx && hwr->rx && hwr->nq && hwr->grp && hwr->vnic &&
-	       hwr->stat && hwr->cmpl;
+	/* The default and the NTUPLE VNICs each need a full set of RSS
+	 * contexts for the final number of ring groups.
+	 */
+	return hwr->tx && hwr->rx && hwr->nq && hwr->grp &&
+	       hwr->vnic >= BNGE_BASE_VNICS && hwr->stat && hwr->cmpl &&
+	       hwr->rss_ctx >= bnge_cal_nr_rss_ctxs(hwr->grp) * BNGE_BASE_VNICS;
 }
 
 static bool bnge_need_reserve_rings(struct bnge_dev *bd)
@@ -247,18 +255,21 @@ static bool bnge_need_reserve_rings(struct bnge_dev *bd)
 	u16 cprs = bnge_cprs_demand(bd);
 	u16 rx = bd->rx_nr_rings, stat;
 	u16 nqs = bnge_nqs_demand(bd);
-	u16 vnic;
+	struct bnge_hw_rings hwr = {};
 
 	if (hw_resc->resv_tx_rings != bnge_tx_rings_demand(bd))
 		return true;
 
-	vnic = bnge_get_total_vnics(bd);
+	hwr.grp = bd->rx_nr_rings;
+	hwr.vnic = bnge_get_total_vnics(bd);
 
 	if (bnge_is_agg_reqd(bd))
 		rx <<= 1;
 	stat = bnge_func_stat_ctxs_demand(bd);
 	if (hw_resc->resv_rx_rings != rx || hw_resc->resv_cp_rings != cprs ||
-	    hw_resc->resv_vnics != vnic || hw_resc->resv_stat_ctxs != stat)
+	    hw_resc->resv_vnics != hwr.vnic ||
+	    hw_resc->resv_rsscos_ctxs != bnge_get_total_rss_ctxs(bd, &hwr) ||
+	    hw_resc->resv_stat_ctxs != stat)
 		return true;
 	if (hw_resc->resv_irqs != nqs)
 		return true;
@@ -358,6 +369,10 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	bd->rx_nr_rings = rx_rings;
 	bd->nq_nr_rings = hwr.nq;
 
+	/* One ring group per rx ring, so rss_ctx is checked against the final
+	 * rx ring count.
+	 */
+	hwr.grp = rx_rings;
 	if (!bnge_rings_ok(&hwr))
 		return -ENOMEM;
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index c0b6992d7f82..97e8ef08974c 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -75,6 +75,7 @@ void bnge_aux_init_dflt_config(struct bnge_dev *bd);
 u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd);
 int bnge_cal_nr_rss_ctxs(u16 rx_rings);
 bool bnge_aux_has_enough_resources(struct bnge_dev *bd);
+bool bnge_arfs_capable(struct bnge_dev *bd, bool new_rss_ctx);
 
 static inline u32
 bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index 3a6c8f0a5954..d98a6196c859 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -42,7 +42,11 @@ void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	for (i = 0; i < tbl_size; i++) {
 		u16 ring_id, j;
 
-		j = bd->rss_indir_tbl[i];
+		if (vnic->flags & BNGE_VNIC_NTUPLE_FLAG)
+			j = ethtool_rxfh_indir_default(i, bd->rx_nr_rings);
+		else
+			j = bd->rss_indir_tbl[i];
+
 		rxr = &bn->rx_ring[j];
 
 		ring_id = rxr->rx_ring_struct.fw_ring_id;
@@ -98,3 +102,30 @@ int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	}
 	return rc;
 }
+
+static int bnge_alloc_and_setup_vnic(struct bnge_net *bn,
+				     struct bnge_vnic_info *vnic,
+				     u16 rx_rings)
+{
+	int rc;
+
+	rc = bnge_hwrm_vnic_alloc(bn->bd, vnic, rx_rings);
+	if (rc) {
+		netdev_err(bn->netdev, "hwrm vnic %u alloc failure rc: %d\n",
+			   vnic->vnic_id, rc);
+		return rc;
+	}
+
+	/* If bnge_setup_vnic() fails, the VNIC allocated above is not freed
+	 * here; the caller (bnge_init_chip) unwinds via its err_out path.
+	 */
+	return bnge_setup_vnic(bn, vnic);
+}
+
+int bnge_alloc_rfs_vnic(struct bnge_net *bn)
+{
+	struct bnge_vnic_info *vnic;
+
+	vnic = &bn->vnic_info[BNGE_VNIC_NTUPLE];
+	return bnge_alloc_and_setup_vnic(bn, vnic, bn->bd->rx_nr_rings);
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index c81d3a64561e..72357e0b37ac 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -22,13 +22,16 @@ struct bnge_l2_filter;
 #define BNGE_MAX_UC_ADDRS	4
 
 enum {
-	BNGE_VNIC_DEFAULT	= 0
+	BNGE_VNIC_DEFAULT	= 0,
+	BNGE_VNIC_NTUPLE	= 1,
+	BNGE_BASE_VNICS		= 2
 };
 
 enum {
 	BNGE_VNIC_RSS_FLAG	= BIT(0),
 	BNGE_VNIC_MCAST_FLAG	= BIT(1),
-	BNGE_VNIC_UCAST_FLAG	= BIT(2)
+	BNGE_VNIC_UCAST_FLAG	= BIT(2),
+	BNGE_VNIC_NTUPLE_FLAG	= BIT(3)
 };
 
 struct bnge_vnic_info {
@@ -60,4 +63,5 @@ int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic);
 int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
+int bnge_alloc_rfs_vnic(struct bnge_net *bn);
 #endif /* _BNGE_VNIC_H_ */
-- 
2.52.0

