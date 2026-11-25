Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607706;
	b=KqRcsrJs1PsZodEFWqJ2HVP0H8mdubW9NwuOojQBNGjBZiHdtYnkLxal0ZkPfnNzYdIF
	 I0f/oThPjalJRGUQurrrrUac1dZDK4/Odq+bNvRi6ZZKPcG5tZG+1JPQCL0HJEQ7uHuuY
	 CE9vyPLbwVSR7pTV65OgWWh30wjmg0tzO8juLeuw2GMzDVJctfHvI4VNwrC14gjg43HkQ
	 uuo6Jh3WTr6estC0/Oa8/XVGFlk93AiazUIFXEDBm5LC8wpo0NG+YK1GFghdZ9ImAFh9O
	 Zkd85bRJrXWHdCKlFwicdRlTnrHjZe3huhteCb8eIg4tOj4MR7er1gYSAz1icUIJX6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607706;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=klBYaYmvlWeS248SUrrVSQiTO4fMqB8X3lbiV0iWWNo=;
	b=YLi1H5YWZhytYffQNNU5XY4reMyE/dTcHsjNFMIjX/Hj12oNM2uruPfuPdfobwNtZUuY
	 4OQtdZT0+ByDXnTVLwkRO4e3LKJOUjrLT4KdwehHvuiyjmRP2DgyPtAp8/O/AEeIqZRYI
	 iWJnA4mtNQj0H8MCY6PQ5xY8jIHVyNKqYuqM3Gt8HYhNPoBcpc3UgXZwPOmtaEPN0v6mu
	 RGNNAz7zthQl9EJc5vV+YzkRv0nSzhCcCWKnHQrc3VpM+vpDrKO+eQ+Qrs85H6CE7CXXh
	 BexQkaZVLXBwfiID5i7nMOe0f7CE6f2Z8FVBLRfw186l9mGThkWz4avjgZRHOjjfoqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZGe9nV8V;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFB5606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFB5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZGe9nV8V
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so2613971a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607705; x=1796212505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klBYaYmvlWeS248SUrrVSQiTO4fMqB8X3lbiV0iWWNo=;
        b=VGXoAuXCoTEF7TIWxs9E9lkp+NuvhYtZJ3GTmofB6uYX0jdtrdbrZNN46qjJ8aIiMK
         6GgifUFJ6j6cJgifTcbtwxYtdx2JnISOpRAlvA9ZdExzombUYkLCoQVGTFA+mQ3xD85p
         jyUoaDWUaqw9Xb93NcNb2xnz5IfYUDI6BYMUw7mC6p5uD/gPRs91D9+hvXMD96sEv/nC
         qpvUJqq4ysAF3paVcmFfsrhGnkD9lc5v5NHnre/IPHTNImgUscTqVMd9cQyw3/4Ctjjw
         vH3u40hKjQPQYP044Y7xR90UHdRWp4bsSvpWyjTLDgzNqi/swS/WxZHmnwpHKDSEbqt3
         +huw==
X-Gm-Message-State: APuU4Z9EKSJLo2gwAePTRUUpWfq0hV3pV5UC6sd+Vf5KaEV1SKReF1m8
	z9grWXsYZoaPLYwOhNee7BzbtD+nLcFqyAwLGDN5SbYROKR8CSMZlCI7zsTd8OC2Nbw/MdTsmdT
	myxBZpvAZs02g5FihBzijeCMvtmi2Fiv5QTcfyjEs6FjsZclmqVAoJrsxFkW8H0a1dG+9HsJ+Zw
	p5y+Z9Z5Z2NNM/JQRYzCqfQNmf+QsFONHwBtzTY09tSmevgAwUOtFEy0JR83n73Zf3JJ8QNFwXY
	YPf/HQk1Q==
X-Gm-Gg: AZFdTZexwpg84TwX40+BGYTH5j+ouVs3hKEqpTeA/FWvz7c/++ERooKVXzoHIZGhN+z
	b0e6pCsWRohfIwC+6wtmEUyzaATMmkh1kzIR1zeiMSykwEChntWqr6Htpgm5j6elHPT64iDx+8g
	8MSVkVfMgji85+sKXnshBEnQ2d6GcEexywI4niPIwXELPDpayvZd9FBfOxsCybWC3R1OEzNvgFO
	CyNO0+7wUyfMnAG0UGlKAGR2VXQUCGLa2iE1CR8udcJ1AvJQsPhq2d1KQkJ1Ne3HgV42mCkhQEJ
	SMND7kj1GBEsyo74xzF3STYzucJNUCrWwbkQqmOHyub+OHA/6dAjRAZcPo3FYse90u5DPZXUD/N
	LJNs5Taa8TtRw7mOgLrJMbor9FbyptXdxFf7LJrBSb/Genk35Qk1ly9FnH0ivqotDUcxXtqpNqg
	w6T+iU/vhOPFJK3FkqfWzEnjrQB6W6U/2k/HRJ
X-Received: by 2002:a17:90b:55c5:b0:3b4:5b2c:2959 with SMTP id 98e67ed59e1d1-3b45b2c29b9mr12197230a91.63.1795607705376;
        Wed, 25 Nov 2026 03:55:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm13401780a91.4.2026.11.25.03.55.04
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso7766412eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607703; x=1796212503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klBYaYmvlWeS248SUrrVSQiTO4fMqB8X3lbiV0iWWNo=;
        b=ZGe9nV8V9lFev9J2f5Qxi2sN6/p2N9sYGyr2FMisPPygzWfEUg9rp0OmmfgLy2j69K
         BDxgz1gPbyZPZiXrj1eOzZZoSKp2/bh6j/73Ssc7IKlUMQ+RqTGiKantXNTudW6N01KR
         m4Bhbtg5o/vCLoHZtmf+XBgmciJ9syAN6unYI=
X-Received: by 2002:a05:693c:6390:10b0:386:ac97:f670 with SMTP id 5a478bee46e88-386ac97f867mr9355197eec.12.1795607703362;
        Wed, 25 Nov 2026 03:55:03 -0800 (PST)
X-Received: by 2002:a05:693c:6390:10b0:386:ac97:f670 with SMTP id 5a478bee46e88-386ac97f867mr9355166eec.12.1795607702616;
        Wed, 25 Nov 2026 03:55:02 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:02 -0800 (PST)
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
Subject: [PATCH net-next v10 02/10] bnge: add NTUPLE/ARFS VNIC
Date: Wed, 25 Nov 2026 17:24:26 +0530
Message-ID: <20261125115434.2080590-3-vikas.gupta@broadcom.com>
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

Initialize the second VNIC, which is specifically used for the
NTUPLE/ARFS feature. This VNIC helps support the aRFS/NTUPLE
functionality. With this change, the total number of VNICs becomes 2.

The NTUPLE/aRFS VNIC is always allocated, so the function needs at
least BNGE_BASE_VNICS (2) VNICs and the matching RSS contexts.
Firmware grants these to every supported function. If it grants fewer,
bnge_reserve_rings() fails with -ENOMEM and the device does not probe,
so there is no fallback to a single VNIC.

NETIF_F_NTUPLE can only be changed while the interface is down.
bnge_fix_features() keeps the current NTUPLE state while the interface
is running, so a request made then stays in wanted_features.
bnge_close() calls netdev_update_features() once netif_running() is
false, which applies it through bnge_set_features(). The feature is not
advertised yet; the patch that adds the ethtool rxnfc ops enables it.

bnge_reserve_rings() checks bnge_rings_ok() before it changes the
driver ring counts (tx, rx and nq), so a failed reservation leaves
them as they were. bnge_net_init_dflt_rings() calls it a second time
at probe; a later call computes the reduction again and resets the
default indirection table, instead of finding the reduced counts
already in place.

The patch also removes BNGE_FW_CAP_CFA_NTUPLE_RX_EXT_IP_PROTO and
BNGE_FW_CAP_CFA_RFS_RING_TBL_IDX_V3, which nothing uses, and renumbers
BNGE_FW_CAP_VNIC_RE_FLUSH.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  4 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 55 +++++++++++++++++--
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  1 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 38 +++++++++----
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 33 ++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  8 ++-
 6 files changed, 117 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index b175d63021aa..66eed890953b 100644
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
index c8b5d3d6d331..fef45dfa9179 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -1173,12 +1173,7 @@ static int bnge_alloc_vnic_attributes(struct bnge_net *bn)
 
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
@@ -1355,6 +1350,9 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	bn->vnic_info[BNGE_VNIC_DEFAULT].flags |= BNGE_VNIC_RSS_FLAG |
 						  BNGE_VNIC_MCAST_FLAG |
 						  BNGE_VNIC_UCAST_FLAG;
+	bn->vnic_info[BNGE_VNIC_NTUPLE].flags |= BNGE_VNIC_RSS_FLAG |
+						 BNGE_VNIC_NTUPLE_FLAG;
+
 	rc = bnge_alloc_vnic_attributes(bn);
 	if (rc)
 		goto err_free_cp_rings;
@@ -2642,6 +2640,13 @@ static int bnge_init_chip(struct bnge_net *bn)
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
 
@@ -3260,6 +3265,11 @@ static int bnge_close(struct net_device *dev)
 	bnge_hwrm_shutdown_link(bn->bd);
 	bnge_hwrm_if_change(bn->bd, false);
 
+	/* netif_running() is false now. Apply an NTUPLE change that
+	 * bnge_fix_features() held back while the interface was up.
+	 */
+	netdev_update_features(dev);
+
 	return 0;
 }
 
@@ -3342,6 +3352,36 @@ static const struct netdev_stat_ops bnge_stat_ops = {
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
@@ -3349,6 +3389,8 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_get_stats64	= bnge_get_stats64,
 	.ndo_set_rx_mode_async	= bnge_set_rx_mode,
 	.ndo_features_check	= bnge_features_check,
+	.ndo_fix_features	= bnge_fix_features,
+	.ndo_set_features	= bnge_set_features,
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
@@ -3589,6 +3631,7 @@ int bnge_netdev_alloc(struct bnge_dev *bd, int max_irqs)
 	bnge_set_ring_params(bd);
 
 	bnge_init_l2_fltr_tbl(bn);
+
 	bnge_init_mac_addr(bd);
 
 	rc = bnge_probe_phy(bn, true);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index f6fd11de7de0..13871d3d8286 100644
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
index 01205b161d82..5207091a7290 100644
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
@@ -347,6 +358,16 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 		hwr.rx = rx_rings << 1;
 	tx_cp = hwr.tx;
 	hwr.nq = sh ? max_t(u16, tx_cp, rx_rings) : tx_cp + rx_rings;
+
+	/* One ring group per rx ring, so rss_ctx is checked against the final
+	 * rx ring count. Fail before the driver ring counts (tx, rx and nq) are
+	 * changed, so that a failed call does not leave reduced counts behind
+	 * for the next call to find unchanged.
+	 */
+	hwr.grp = rx_rings;
+	if (!bnge_rings_ok(&hwr))
+		return -ENOMEM;
+
 	bd->tx_nr_rings = hwr.tx;
 	if (!bd->num_tc)
 		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
@@ -358,9 +379,6 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	bd->rx_nr_rings = rx_rings;
 	bd->nq_nr_rings = hwr.nq;
 
-	if (!bnge_rings_ok(&hwr))
-		return -ENOMEM;
-
 	if (old_rx_rings != bd->hw_resc.resv_rx_rings ||
 	    old_rx_nr_rings != bd->rx_nr_rings)
 		bnge_set_dflt_rss_indir_tbl(bd);
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

