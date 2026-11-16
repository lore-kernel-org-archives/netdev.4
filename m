Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838102;
	b=QrFTozSsTcCVGBhrnil2mOI/htKUB6j+b3ib5CFHLTQ1VIkOqhqeVYN4XOBWo3OHVLqd
	 AhWoZKf4P8GIhf3OPx5TEzSn2IwdGKgvj3HtORKWFOLi4QorpbqQQDxfCBfsCfRsUvmia
	 p62Q2U7cNjB6atSoEK7piHjOgxSO5YhAlmMTYMVQ7wYdryUJg8uAdOII6e9yVxfPRs6g/
	 vJnZJoTDVzlwPmY7tDjLer2m8nM9c2twWXCOncauxl59zme4Fs9TbM5yLmHr9itMbg6yb
	 mAtHgKrF4Cb128jR73kyHBbD8VOSCcesV3BE8ugLWMXWysr4CZDt6kbRVpxGhsu++SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838102;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=o/0rZPWSAPZEBJ1LVcvAAlWjkSlS63LdN+wkySzrfx4=;
	b=GeKozUAckyfBi7XtvmiaMkiZdSdNJFheeDWLBFrHCu0mm0XxzZIS5XIuJ1eO64+9GDTd
	 mDZBINDKGdEgivUmm1EG2VPgXQlKA3I27HPzUyPG21nRAwinnUJtuNMMAGoF0mrKFHy9S
	 31SaILoRb+SxaqDAgu8Rt8eVzdMS2lxGQbMcmVQmE6gOUcIvcl91ASY14prW1Bg8ov6nO
	 3anMuRDD3FOZdqW6HaSHN5fpWF9ao8rqXaCR8uyIoqwpVluZ2/G/quXKpX7gHYWnd7BCf
	 nYRfZKhfowj3n7iB06NiiIZsSDES7LTlSyCTEYxq251DgANqvLWVEeksdmCn7trPH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dxQx8R0R;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E55E606A333
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E55E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dxQx8R0R
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso151201a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838101; x=1795442901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/0rZPWSAPZEBJ1LVcvAAlWjkSlS63LdN+wkySzrfx4=;
        b=MhTV8C4LfBWKPLQ9wqbj60N3tyr88BjQ7vu47pD/xdW0C1Gy/QcpjoyKVdijHb+qr1
         7OBILXqSrWPKZx7g13Wv69uvIYtS7eVx9zFK0fhVB2CuaoP8HCFuSJP1JzAJSZ2CDJJi
         VoqklguYAJa3UGmp6+8Lgjii5SL0YIM/01+fcHnP2otlDQeCNZeJxk2AT21Z3ZI5dI21
         3tiFEYMDpO2IuuuGTFADO8rcvFB/DAz4OLoLxhUutSevLeVpCSmFlbmJAv2bYZI8uy69
         yHwOt+3ezRnYZGcE39NCyTcHpERNUnc1qe/8s6RU4fjDO9hHTIsNTsEefpM3qjAKhgX1
         Iflg==
X-Gm-Message-State: APuU4Z8nBySDH0c3bdXutb2YVpRqcfcAi4l172wbuwzZx1B4w6yobZ8D
	SighOtXM8aoH3CyE7IpESybVxng48GBHNugZ3ECphIW2Ey0PponZ8/XuUPY5031g2ZxoOQmFGGC
	4vfSkavibnTjAQYY4NV11q2sroVgo4oZvg7yQCWHqscxsue9gczHs2mYVpeETK3KrfAuoXjvqYe
	UxQ9tZE/ihoH78GKR+sKVs1QbGGyPyMIc7J0Tn6nWCVTJlW4ox6/UuLp6bJLlwTWc+eAf25vG70
	pHixTGLRQ==
X-Gm-Gg: AZFdTZdBdQOQkAJTH2+ooVxf1ZBCelqRDMnwzGT15RrZH/zUnLSO8hgRoD9xFNTpNY/
	wcHnFJYPUsZ+8ojtd6rrI2t5xsKUal0Q8ub37xDrqFlNBdvMOK+SFyXfxyk2syJkwiID8fm0vdn
	VZLOQTgyB4DW4kkZm82/9Xu/ocJCbjtIkGOcJ9OR4Ir5oI6Ed2tE55fwBT6C0CO6dHSbFhmdzoW
	Tn7MNsCWbZlbuLVKPgMptpFswLrBlqFJTl06QhORPxC8sQQX3th4q0PEdfmEqlfhHYTidbLt26j
	sF54BOxhZAfZslTmwtSuyZocwjdq2hihDqK/NVIyC3PxH3kOlXFQCx+33NWsKwN1RgTvwhR/Hnc
	bpGTnZq+nUBd2DzP+1vLpIpJGd12wfi1iW+4AkM8e5+5i7fvPXWDwiD93NlBpO9Yrw1ncViXN5s
	fuE8QkjL2W2/xlRjCh7DR7TGiUox69Mq8rrQ==
X-Received: by 2002:a17:90b:2642:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b1b0ba0a60mr9407905a91.27.1794838100727;
        Mon, 16 Nov 2026 06:08:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b335bdacsm5862797a91.1.2026.11.16.06.08.19
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso3047890c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838096; x=1795442896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/0rZPWSAPZEBJ1LVcvAAlWjkSlS63LdN+wkySzrfx4=;
        b=dxQx8R0RgpVZLD9eH5AJzV2hcF4ryOfJLjqYOFBVEYHE/7yGiKFkntXl2riSzjsYn4
         0s+u/eiEGP9tYLaczY6UkvI8cj8Zwu6QMYVSYSqbUos8iSp8u1SJ0wr59xjT9+t7a7HB
         GLp9fmzL2qGYYdT6X2Xv2hvUsq+uPMB32edLg=
X-Received: by 2002:a05:7022:3a8b:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b5031562c3mr11242688c88.43.1794838095398;
        Mon, 16 Nov 2026 06:08:15 -0800 (PST)
X-Received: by 2002:a05:7022:3a8b:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b5031562c3mr11242610c88.43.1794838094188;
        Mon, 16 Nov 2026 06:08:14 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:08:12 -0800 (PST)
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
Subject: [PATCH net-next v8 05/10] bnge: add ethtool support to manage RSS contexts
Date: Mon, 16 Nov 2026 19:36:48 +0530
Message-ID: <20261116140653.1685797-6-vikas.gupta@broadcom.com>
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

Introduce ethtool callbacks to manage RSS contexts.

Each context allocates a dedicated VNIC with its own RSS indirection
table and hash key, configured with TPA settings matching those of the
default VNIC.

The patch also changes existing behaviour:
  - bnge_reserve_rings() no longer always resets bd->rss_indir_tbl when
    the RX ring count drops. A user-configured default table is kept,
    and ethtool_rxfh_indir_lost() is called when it no longer fits.
  - bnge_fill_hw_rss_tbl() remaps out-of-range entries for every VNIC,
    including the default one.
  - bnge_del_one_rss_ctx() resets fw_rss_cos_lb_ctx[] and decrements
    rsscos_nr_ctxs, and bnge_hwrm_realloc_rss_ctx_vnic() takes rss_lock.
  - bnge_set_features() fails with -EBUSY when NTUPLE is cleared while
    RSS contexts exist.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 177 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |   9 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 114 +++++++++--
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |   2 +-
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 133 ++++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  16 +-
 6 files changed, 424 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 878fe4888160..1bb9c3019769 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -1073,6 +1073,180 @@ static u32 bnge_get_rx_ring_count(struct net_device *dev)
 	return bd->rx_nr_rings;
 }
 
+static int bnge_rxfh_context_check(struct bnge_net *bn,
+				   const struct ethtool_rxfh_param *rxfh,
+				   struct netlink_ext_ack *extack)
+{
+	if (rxfh->hfunc && rxfh->hfunc != ETH_RSS_HASH_TOP) {
+		NL_SET_ERR_MSG_MOD(extack, "RSS hash function not supported");
+		return -EOPNOTSUPP;
+	}
+
+	if (!(bn->priv_flags & BNGE_NET_EN_NTUPLE)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Enable ntuple filtering before adding RSS contexts");
+		return -EOPNOTSUPP;
+	}
+
+	if (!netif_running(bn->netdev)) {
+		NL_SET_ERR_MSG_MOD(extack, "Unable to set RSS contexts when interface is down");
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
+static int bnge_create_rxfh_context(struct net_device *dev,
+				    struct ethtool_rxfh_context *ctx,
+				    const struct ethtool_rxfh_param *rxfh,
+				    struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_rss_ctx *rss_ctx;
+	struct bnge_vnic_info *vnic;
+	int rc;
+
+	rc = bnge_rxfh_context_check(bn, rxfh, extack);
+	if (rc)
+		return rc;
+
+	if (bn->num_rss_ctx >= BNGE_MAX_ETH_RSS_CTX) {
+		NL_SET_ERR_MSG_FMT_MOD(extack, "Out of RSS contexts, maximum %u",
+				       BNGE_MAX_ETH_RSS_CTX);
+		return -EINVAL;
+	}
+
+	if (!bnge_rss_ctx_capable(bn->bd)) {
+		NL_SET_ERR_MSG_MOD(extack, "Out of hardware resources");
+		return -ENOMEM;
+	}
+
+	rss_ctx = ethtool_rxfh_context_priv(ctx);
+
+	bn->num_rss_ctx++;
+
+	vnic = &rss_ctx->vnic;
+
+	bnge_init_vnic_mem(vnic);
+	/* Number the VNIC after the base VNICs, so that its error messages
+	 * tell the RSS contexts apart. The invalid id prints as -1 for all.
+	 */
+	vnic->vnic_id = BNGE_BASE_VNICS + rxfh->rss_context;
+
+	vnic->rss_ctx = ctx;
+	vnic->flags |= BNGE_VNIC_RSSCTX_FLAG;
+	rc = bnge_alloc_vnic_rss_table(bn, vnic);
+	if (rc)
+		goto err_del_rss_ctx;
+
+	/* Populate defaults in the context */
+	bnge_set_dflt_rss_indir_tbl(bn->bd, ctx);
+	ctx->hfunc = ETH_RSS_HASH_TOP;
+	memcpy(vnic->rss_hash_key, bn->rss_hash_key, HW_HASH_KEY_SIZE);
+	memcpy(ethtool_rxfh_context_key(ctx),
+	       bn->rss_hash_key, HW_HASH_KEY_SIZE);
+
+	rc = bnge_hwrm_vnic_alloc(bn->bd, vnic, bn->bd->rx_nr_rings);
+	if (rc) {
+		NL_SET_ERR_MSG_MOD(extack, "Unable to allocate VNIC");
+		goto err_del_rss_ctx;
+	}
+
+	rc = bnge_hwrm_vnic_set_tpa(bn->bd, vnic,
+				    bn->priv_flags & BNGE_NET_EN_TPA);
+	if (rc) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Unable to set TPA settings to vnic");
+		goto err_del_rss_ctx;
+	}
+	bnge_modify_rss(bn, ctx, rss_ctx, rxfh);
+
+	rc = bnge_setup_vnic(bn, vnic);
+	if (rc) {
+		NL_SET_ERR_MSG_MOD(extack, "Unable to setup vnic");
+		goto err_del_rss_ctx;
+	}
+
+	rss_ctx->index = rxfh->rss_context;
+	return 0;
+
+err_del_rss_ctx:
+	bnge_del_one_rss_ctx(bn, rss_ctx, true);
+	return rc;
+}
+
+static int bnge_modify_rxfh_context(struct net_device *dev,
+				    struct ethtool_rxfh_context *ctx,
+				    const struct ethtool_rxfh_param *rxfh,
+				    struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	u8 old_key[HW_HASH_KEY_SIZE];
+	struct bnge_rss_ctx *rss_ctx;
+	u32 *old_indir = NULL;
+	u32 tbl_size;
+	int rc;
+
+	rc = bnge_rxfh_context_check(bn, rxfh, extack);
+	if (rc)
+		return rc;
+
+	rss_ctx = ethtool_rxfh_context_priv(ctx);
+	tbl_size = bnge_get_rxfh_indir_size(bn->bd);
+
+	if (ctx->indir_size != tbl_size) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "RSS context indirection table size mismatch");
+		return -EINVAL;
+	}
+
+	/* Snapshot the software state so it can be restored if the hardware
+	 * update fails, keeping the reported config consistent with the
+	 * hardware.
+	 */
+	if (rxfh->key)
+		memcpy(old_key, rss_ctx->vnic.rss_hash_key, HW_HASH_KEY_SIZE);
+	if (rxfh->indir) {
+		old_indir = kmemdup(ethtool_rxfh_context_indir(ctx),
+				    tbl_size * sizeof(*old_indir), GFP_KERNEL);
+		if (!old_indir)
+			return -ENOMEM;
+	}
+
+	bnge_modify_rss(bn, ctx, rss_ctx, rxfh);
+
+	rc = bnge_hwrm_vnic_rss_cfg(bn, &rss_ctx->vnic);
+	if (rc) {
+		if (rxfh->key)
+			memcpy(rss_ctx->vnic.rss_hash_key, old_key,
+			       HW_HASH_KEY_SIZE);
+		if (rxfh->indir)
+			memcpy(ethtool_rxfh_context_indir(ctx), old_indir,
+			       tbl_size * sizeof(*old_indir));
+		/* Part of the update may have reached the device */
+		if (bnge_hwrm_vnic_rss_cfg(bn, &rss_ctx->vnic))
+			netdev_warn(dev, "Failed to restore RSS context %u\n",
+				    rss_ctx->index);
+	}
+
+	kfree(old_indir);
+	return rc;
+}
+
+static int bnge_remove_rxfh_context(struct net_device *dev,
+				    struct ethtool_rxfh_context *ctx,
+				    u32 rss_context,
+				    struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_rss_ctx *rss_ctx;
+
+	rss_ctx = ethtool_rxfh_context_priv(ctx);
+
+	bnge_del_one_rss_ctx(bn, rss_ctx, true);
+	return 0;
+}
+
 static const struct ethtool_ops bnge_ethtool_ops = {
 	.cap_link_lanes_supported	= 1,
 	.get_link_ksettings	= bnge_get_link_ksettings,
@@ -1102,6 +1276,9 @@ static const struct ethtool_ops bnge_ethtool_ops = {
 	.set_rxfh		= bnge_set_rxfh,
 	.get_rxfh_fields	= bnge_get_rxfh_fields,
 	.set_rxfh_fields	= bnge_set_rxfh_fields,
+	.create_rxfh_context	= bnge_create_rxfh_context,
+	.modify_rxfh_context	= bnge_modify_rxfh_context,
+	.remove_rxfh_context	= bnge_remove_rxfh_context,
 };
 
 void bnge_set_ethtool_ops(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index e605448286d5..4b22152025d8 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -2793,6 +2793,8 @@ static int bnge_open_core(struct bnge_net *bn)
 	/* Poll link status and check for SFP+ module status */
 	bnge_get_port_module_status(bn);
 
+	bnge_hwrm_realloc_rss_ctx_vnic(bn);
+
 	return 0;
 
 err_free_irq:
@@ -3010,7 +3012,10 @@ static void bnge_close_core(struct bnge_net *bn)
 	clear_bit(BNGE_STATE_OPEN, &bd->state);
 
 	timer_delete_sync(&bn->timer);
+
+	bnge_clear_rss_ctxs(bn);
 	bnge_shutdown_nic(bn);
+
 	bnge_disable_napi(bn);
 
 	/* Save ring stats before shutdown */
@@ -3147,6 +3152,10 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)
 	if (flags == bn->priv_flags)
 		return 0;
 
+	if ((bn->priv_flags & BNGE_NET_EN_NTUPLE) &&
+	    !(flags & BNGE_NET_EN_NTUPLE) && bn->num_rss_ctx)
+		return -EBUSY;
+
 	bn->priv_flags = flags;
 
 	return 0;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 25aa6e7c43c3..d74ffd4f4117 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -193,6 +193,16 @@ static int bnge_adjust_rings(struct bnge_dev *bd, u16 *rx,
 	return bnge_fix_rings_count(rx, tx, max_nq, sh);
 }
 
+static unsigned int bnge_get_max_func_rss_ctxs(struct bnge_dev *bd)
+{
+	return bd->hw_resc.max_rsscos_ctxs;
+}
+
+static unsigned int bnge_get_max_func_vnics(struct bnge_dev *bd)
+{
+	return bd->hw_resc.max_vnics;
+}
+
 int bnge_cal_nr_rss_ctxs(u16 rx_rings)
 {
 	if (!rx_rings)
@@ -215,7 +225,15 @@ static u16 bnge_get_total_rss_ctxs(struct bnge_dev *bd,
 
 static u16 bnge_get_total_vnics(struct bnge_dev *bd)
 {
-	return BNGE_BASE_VNICS;
+	u16 vnics = BNGE_BASE_VNICS;
+
+	if (bd->netdev) {
+		struct bnge_net *bn = netdev_priv(bd->netdev);
+
+		vnics += bn->num_rss_ctx;
+	}
+
+	return vnics;
 }
 
 u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd)
@@ -224,6 +242,19 @@ u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd)
 	       BNGE_RSS_TABLE_ENTRIES;
 }
 
+static u16 bnge_get_max_rss_ring(struct bnge_dev *bd)
+{
+	u32 i, tbl_size, max_ring = 0;
+
+	if (!bd->rss_indir_tbl)
+		return 0;
+
+	tbl_size = bnge_get_rxfh_indir_size(bd);
+	for (i = 0; i < tbl_size; i++)
+		max_ring = max_t(u32, max_ring, bd->rss_indir_tbl[i]);
+	return max_ring;
+}
+
 static void bnge_copy_reserved_rings(struct bnge_dev *bd,
 				     struct bnge_hw_rings *hwr)
 {
@@ -280,10 +311,12 @@ static bool bnge_need_reserve_rings(struct bnge_dev *bd)
 int bnge_reserve_rings(struct bnge_dev *bd)
 {
 	u16 aux_dflt_msix = bnge_aux_get_dflt_msix(bd);
-	u16 rx_rings, old_rx_rings, old_rx_nr_rings;
+	u16 rx_rings, old_rx_rings;
 	struct bnge_hw_rings hwr = {0};
 	u16 nq = bd->nq_nr_rings;
 	u16 aux_msix = 0;
+	bool indir_lost = false;
+	bool rx_changed;
 	bool sh = false;
 	u16 tx_cp;
 	int rc;
@@ -317,7 +350,6 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	hwr.rss_ctx = bnge_get_total_rss_ctxs(bd, &hwr);
 	hwr.stat = bnge_func_stat_ctxs_demand(bd);
 	old_rx_rings = bd->hw_resc.resv_rx_rings;
-	old_rx_nr_rings = bd->rx_nr_rings;
 
 	rc = bnge_hwrm_reserve_rings(bd, &hwr);
 	if (rc)
@@ -358,27 +390,46 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 		hwr.rx = rx_rings << 1;
 	tx_cp = hwr.tx;
 	hwr.nq = sh ? max_t(u16, tx_cp, rx_rings) : tx_cp + rx_rings;
+
+	/* One ring group per rx ring, so rss_ctx is checked against the final
+	 * rx ring count. Fail before any driver state is changed, so that a
+	 * retry reserves again instead of finding the failed values in place.
+	 */
+	hwr.grp = rx_rings;
+	if (!bnge_rings_ok(&hwr))
+		return -ENOMEM;
+
 	bd->tx_nr_rings = hwr.tx;
 	if (!bd->num_tc)
 		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
 
-	if (rx_rings != bd->rx_nr_rings)
+	rx_changed = rx_rings != bd->rx_nr_rings;
+	if (rx_changed) {
 		dev_warn(bd->dev, "RX rings resv reduced to %d than earlier %d requested\n",
 			 rx_rings, bd->rx_nr_rings);
+		indir_lost = bd->netdev &&
+			     netif_is_rxfh_configured(bd->netdev) &&
+			     (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
+			      bnge_cal_nr_rss_ctxs(rx_rings) ||
+			      bnge_get_max_rss_ring(bd) >= rx_rings);
+		bnge_check_rss_ctxs_lost(bd, rx_rings);
+	}
 
 	bd->rx_nr_rings = rx_rings;
 	bd->nq_nr_rings = hwr.nq;
 
-	/* One ring group per rx ring, so rss_ctx is checked against the final
-	 * rx ring count.
-	 */
-	hwr.grp = rx_rings;
-	if (!bnge_rings_ok(&hwr))
-		return -ENOMEM;
+	if (old_rx_rings != bd->hw_resc.resv_rx_rings || rx_changed) {
+		if (!bd->netdev || indir_lost ||
+		    !netif_is_rxfh_configured(bd->netdev))
+			bnge_set_dflt_rss_indir_tbl(bd, NULL);
+		bnge_refill_dflt_rss_ctxs(bd);
+	}
 
-	if (old_rx_rings != bd->hw_resc.resv_rx_rings ||
-	    old_rx_nr_rings != bd->rx_nr_rings)
-		bnge_set_dflt_rss_indir_tbl(bd);
+	/* Notify only now, so the notification reports the new ring count
+	 * and the reset indirection table.
+	 */
+	if (indir_lost)
+		ethtool_rxfh_indir_lost(bd->netdev);
 
 	if (!bnge_aux_registered(bd)) {
 		u16 resv_msix, resv_ctx, aux_ctxs;
@@ -444,7 +495,7 @@ int bnge_alloc_irqs(struct bnge_dev *bd)
 
 	/* The indirection table may point at rings that were just removed */
 	if (bd->rx_nr_rings != old_rx)
-		bnge_set_dflt_rss_indir_tbl(bd);
+		bnge_set_dflt_rss_indir_tbl(bd, NULL);
 
 	tx_cp = bnge_num_tx_to_cp(bd, bd->tx_nr_rings);
 	bd->nq_nr_rings = (min == 1) ?
@@ -628,6 +679,39 @@ static int bnge_alloc_rss_indir_tbl(struct bnge_dev *bd)
 	return 0;
 }
 
+/* Check and reserve hardware resources for a new RSS context */
+bool bnge_rss_ctx_capable(struct bnge_dev *bd)
+{
+	struct bnge_hw_rings hwr = {};
+	int max_vnics, max_rss_ctxs;
+
+	hwr.grp = bd->rx_nr_rings;
+	hwr.vnic = bnge_get_total_vnics(bd) + 1;
+	/* The RSS context count scales with hwr.vnic, set it first */
+	hwr.rss_ctx = bnge_get_total_rss_ctxs(bd, &hwr);
+	max_vnics = bnge_get_max_func_vnics(bd);
+	max_rss_ctxs = bnge_get_max_func_rss_ctxs(bd);
+
+	if (hwr.vnic > max_vnics || hwr.rss_ctx > max_rss_ctxs) {
+		if (bd->rx_nr_rings > 1)
+			dev_warn(bd->dev,
+				 "Not enough resources to support RSS context\n");
+		return false;
+	}
+
+	if (hwr.vnic <= bd->hw_resc.resv_vnics &&
+	    hwr.rss_ctx <= bd->hw_resc.resv_rsscos_ctxs)
+		return true;
+
+	bnge_hwrm_reserve_rings(bd, &hwr);
+	if (hwr.vnic <= bd->hw_resc.resv_vnics &&
+	    hwr.rss_ctx <= bd->hw_resc.resv_rsscos_ctxs)
+		return true;
+
+	dev_warn(bd->dev, "Unable to reserve resources to support RSS context\n");
+	return false;
+}
+
 int bnge_net_init_dflt_config(struct bnge_dev *bd)
 {
 	struct bnge_hw_resc *hw_resc;
@@ -641,7 +725,7 @@ int bnge_net_init_dflt_config(struct bnge_dev *bd)
 	if (rc)
 		goto err_free_tbl;
 
-	bnge_set_dflt_rss_indir_tbl(bd);
+	bnge_set_dflt_rss_indir_tbl(bd, NULL);
 	hw_resc = &bd->hw_resc;
 	bd->max_fltr = hw_resc->max_rx_em_flows + hw_resc->max_rx_wm_flows +
 		       BNGE_L2_FLTR_MAX_FLTR;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index 97e8ef08974c..278d98ea9da6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -75,7 +75,7 @@ void bnge_aux_init_dflt_config(struct bnge_dev *bd);
 u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd);
 int bnge_cal_nr_rss_ctxs(u16 rx_rings);
 bool bnge_aux_has_enough_resources(struct bnge_dev *bd);
-bool bnge_arfs_capable(struct bnge_dev *bd, bool new_rss_ctx);
+bool bnge_rss_ctx_capable(struct bnge_dev *bd);
 
 static inline u32
 bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
index a44971a7c74d..7d587290c33a 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
@@ -12,21 +12,26 @@
 #include "bnge_filter.h"
 #include "bnge_resc.h"
 
-void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd)
+void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd,
+				 struct ethtool_rxfh_context *rss_ctx)
 {
 	u16 max_entries, pad;
 	u32 *rss_indir_tbl;
 	u16 i;
 
 	max_entries = bnge_get_rxfh_indir_size(bd);
-	rss_indir_tbl = &bd->rss_indir_tbl[0];
+
+	if (rss_ctx)
+		rss_indir_tbl = ethtool_rxfh_context_indir(rss_ctx);
+	else
+		rss_indir_tbl = &bd->rss_indir_tbl[0];
 
 	for (i = 0; i < max_entries; i++)
 		rss_indir_tbl[i] = ethtool_rxfh_indir_default(i,
 							      bd->rx_nr_rings);
 
 	pad = bd->rss_indir_tbl_entries - max_entries;
-	if (pad)
+	if (pad && !rss_ctx)
 		memset(&rss_indir_tbl[i], 0, pad * sizeof(*rss_indir_tbl));
 }
 
@@ -44,9 +49,18 @@ void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 
 		if (vnic->flags & BNGE_VNIC_NTUPLE_FLAG)
 			j = ethtool_rxfh_indir_default(i, bd->rx_nr_rings);
+		else if (vnic->flags & BNGE_VNIC_RSSCTX_FLAG)
+			j = ethtool_rxfh_context_indir(vnic->rss_ctx)[i];
 		else
 			j = bd->rss_indir_tbl[i];
 
+		/* Defensive fallback: custom contexts with stale indices are
+		 * invalidated via ethtool_rxfh_context_lost() during ring
+		 * reduction. Clamp here to prevent out-of-bounds array reads.
+		 */
+		if (j >= bd->rx_nr_rings)
+			j = ethtool_rxfh_indir_default(i, bd->rx_nr_rings);
+
 		rxr = &bn->rx_ring[j];
 
 		ring_id = rxr->rx_ring_struct.fw_ring_id;
@@ -63,13 +77,13 @@ int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 
 	rc = bnge_hwrm_vnic_set_rss(bn, vnic, true);
 	if (rc) {
-		netdev_err(bn->netdev, "hwrm vnic %d set rss failure rc: %d\n",
+		netdev_err(bn->netdev, "hwrm vnic %u set rss failure rc: %d\n",
 			   vnic->vnic_id, rc);
 		return rc;
 	}
 	rc = bnge_hwrm_vnic_cfg(bn, vnic);
 	if (rc)
-		netdev_err(bn->netdev, "hwrm vnic %d cfg failure rc: %d\n",
+		netdev_err(bn->netdev, "hwrm vnic %u cfg failure rc: %d\n",
 			   vnic->vnic_id, rc);
 	return rc;
 }
@@ -83,7 +97,7 @@ int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	for (i = 0; i < nr_ctxs; i++) {
 		rc = bnge_hwrm_vnic_ctx_alloc(bd, vnic, i);
 		if (rc) {
-			netdev_err(bn->netdev, "hwrm vnic %d ctx %d alloc failure rc: %d\n",
+			netdev_err(bn->netdev, "hwrm vnic %u ctx %d alloc failure rc: %d\n",
 				   vnic->vnic_id, i, rc);
 			return -ENOMEM;
 		}
@@ -97,7 +111,7 @@ int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic)
 	if (bnge_is_agg_reqd(bd)) {
 		rc = bnge_hwrm_vnic_set_hds(bn, vnic);
 		if (rc)
-			netdev_err(bn->netdev, "hwrm vnic %d set hds failure rc: %d\n",
+			netdev_err(bn->netdev, "hwrm vnic %u set hds failure rc: %d\n",
 				   vnic->vnic_id, rc);
 	}
 	return rc;
@@ -155,7 +169,7 @@ void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
 		for (i = 0; i < tbl_size; i++)
 			indir_tbl[i] = rxfh->indir[i];
 		pad = bd->rss_indir_tbl_entries - tbl_size;
-		if (pad)
+		if (pad && !rss_ctx)
 			memset(&indir_tbl[i], 0, pad * sizeof(*indir_tbl));
 	}
 }
@@ -168,8 +182,11 @@ void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
 
 	bnge_hwrm_vnic_free_one(bn->bd, &rss_ctx->vnic);
 	for (i = 0; i < BNGE_MAX_CTX_PER_VNIC; i++) {
-		if (vnic->fw_rss_cos_lb_ctx[i] != INVALID_HW_RING_ID)
+		if (vnic->fw_rss_cos_lb_ctx[i] != INVALID_HW_RING_ID) {
 			bnge_hwrm_vnic_ctx_free_one(bn->bd, vnic, i);
+			vnic->fw_rss_cos_lb_ctx[i] = INVALID_HW_RING_ID;
+			bn->rsscos_nr_ctxs--;
+		}
 	}
 
 	if (!all)
@@ -188,6 +205,10 @@ void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)
 	struct ethtool_rxfh_context *ctx;
 	unsigned long context;
 
+	/* Erasing lost contexts touches netdev->ethtool->rss_ctx and calls
+	 * ethtool_rxfh_context_lost(), which requires the ethtool rss_lock.
+	 */
+	mutex_lock(&bn->netdev->ethtool->rss_lock);
 	xa_for_each(&bn->netdev->ethtool->rss_ctx, context, ctx) {
 		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
 		struct bnge_vnic_info *vnic = &rss_ctx->vnic;
@@ -201,6 +222,89 @@ void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn)
 			ethtool_rxfh_context_lost(bn->netdev, rss_ctx->index);
 		}
 	}
+	mutex_unlock(&bn->netdev->ethtool->rss_lock);
+}
+
+void bnge_check_rss_ctxs_lost(struct bnge_dev *bd, u16 new_rx_rings)
+{
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+	struct bnge_net *bn;
+
+	if (!bd->netdev)
+		return;
+
+	bn = netdev_priv(bd->netdev);
+	mutex_lock(&bd->netdev->ethtool->rss_lock);
+	xa_for_each(&bd->netdev->ethtool->rss_ctx, context, ctx) {
+		struct bnge_rss_ctx *rss_ctx = ethtool_rxfh_context_priv(ctx);
+		u32 *indir = ethtool_rxfh_context_indir(ctx);
+		bool lost = false;
+		u32 i;
+
+		if (!ctx->indir_user_size)
+			continue;
+
+		if (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
+		    bnge_cal_nr_rss_ctxs(new_rx_rings)) {
+			lost = true;
+		} else {
+			for (i = 0; i < ctx->indir_size; i++) {
+				if (indir[i] >= new_rx_rings) {
+					lost = true;
+					break;
+				}
+			}
+		}
+
+		if (lost) {
+			bnge_del_one_rss_ctx(bn, rss_ctx, true);
+			ethtool_rxfh_context_lost(bd->netdev, rss_ctx->index);
+		}
+	}
+	mutex_unlock(&bd->netdev->ethtool->rss_lock);
+}
+
+void bnge_refill_dflt_rss_ctxs(struct bnge_dev *bd)
+{
+	struct ethtool_rxfh_context *ctx;
+	unsigned long context;
+	bool resize = false;
+	u32 tbl_size;
+
+	if (!bd->netdev)
+		return;
+
+	tbl_size = bnge_get_rxfh_indir_size(bd);
+	mutex_lock(&bd->netdev->ethtool->rss_lock);
+	xa_for_each(&bd->netdev->ethtool->rss_ctx, context, ctx) {
+		if (ctx->indir_size != tbl_size) {
+			resize = true;
+			break;
+		}
+	}
+	mutex_unlock(&bd->netdev->ethtool->rss_lock);
+
+	/* bnge_check_rss_ctxs_lost() already dropped every context with a
+	 * user table when the table size changed, even if the table could
+	 * have been folded. Only the default contexts are resized here.
+	 */
+	if (resize) {
+		if (ethtool_rxfh_ctxs_can_resize(bd->netdev, tbl_size)) {
+			dev_warn(bd->dev,
+				 "RSS contexts cannot be resized to %u entries\n",
+				 tbl_size);
+			return;
+		}
+		ethtool_rxfh_ctxs_resize(bd->netdev, tbl_size);
+	}
+
+	mutex_lock(&bd->netdev->ethtool->rss_lock);
+	xa_for_each(&bd->netdev->ethtool->rss_ctx, context, ctx) {
+		if (!ctx->indir_user_size)
+			bnge_set_dflt_rss_indir_tbl(bd, ctx);
+	}
+	mutex_unlock(&bd->netdev->ethtool->rss_lock);
 }
 
 void bnge_clear_rss_ctxs(struct bnge_net *bn)
@@ -242,3 +346,14 @@ int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
 	vnic->rss_hash_key_dma_addr = vnic->rss_table_dma_addr + size;
 	return 0;
 }
+
+void bnge_init_vnic_mem(struct bnge_vnic_info *vnic)
+{
+	int i;
+
+	vnic->fw_vnic_id = INVALID_HW_RING_ID;
+	vnic->vnic_id = BNGE_VNIC_ID_INVALID;
+
+	for (i = 0; i < BNGE_MAX_CTX_PER_VNIC; i++)
+		vnic->fw_rss_cos_lb_ctx[i] = INVALID_HW_RING_ID;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index d11bd33fe254..58f17579db3d 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -22,6 +22,11 @@ struct bnge_l2_filter;
 #define BNGE_MAX_MC_ADDRS	16
 #define BNGE_MAX_UC_ADDRS	4
 
+#define BNGE_VNIC_ID_INVALID	0xffffffff
+
+struct ethtool_rxfh_context;
+struct ethtool_rxfh_param;
+
 enum {
 	BNGE_VNIC_DEFAULT	= 0,
 	BNGE_VNIC_NTUPLE	= 1,
@@ -32,7 +37,8 @@ enum {
 	BNGE_VNIC_RSS_FLAG	= BIT(0),
 	BNGE_VNIC_MCAST_FLAG	= BIT(1),
 	BNGE_VNIC_UCAST_FLAG	= BIT(2),
-	BNGE_VNIC_NTUPLE_FLAG	= BIT(3)
+	BNGE_VNIC_NTUPLE_FLAG	= BIT(3),
+	BNGE_VNIC_RSSCTX_FLAG	= BIT(4)
 };
 
 struct bnge_vnic_info {
@@ -57,6 +63,8 @@ struct bnge_vnic_info {
 
 	u32		flags;
 	u32		vnic_id;
+
+	struct ethtool_rxfh_context	*rss_ctx;
 };
 
 struct bnge_rss_ctx {
@@ -68,7 +76,8 @@ void bnge_fill_hw_rss_tbl(struct bnge_net *bn, struct bnge_vnic_info *vnic);
 int bnge_hwrm_vnic_rss_cfg(struct bnge_net *bn,
 			   struct bnge_vnic_info *vnic);
 int bnge_setup_vnic(struct bnge_net *bn, struct bnge_vnic_info *vnic);
-void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd);
+void bnge_set_dflt_rss_indir_tbl(struct bnge_dev *bd,
+				 struct ethtool_rxfh_context *ctx);
 int bnge_alloc_rfs_vnic(struct bnge_net *bn);
 int bnge_alloc_vnic_rss_table(struct bnge_net *bn,
 			      struct bnge_vnic_info *vnic);
@@ -78,6 +87,9 @@ void bnge_modify_rss(struct bnge_net *bn, struct ethtool_rxfh_context *ctx,
 		     const struct ethtool_rxfh_param *rxfh);
 void bnge_del_one_rss_ctx(struct bnge_net *bn, struct bnge_rss_ctx *rss_ctx,
 			  bool all);
+void bnge_check_rss_ctxs_lost(struct bnge_dev *bd, u16 new_rx_rings);
+void bnge_refill_dflt_rss_ctxs(struct bnge_dev *bd);
 void bnge_hwrm_realloc_rss_ctx_vnic(struct bnge_net *bn);
 void bnge_clear_rss_ctxs(struct bnge_net *bn);
+void bnge_init_vnic_mem(struct bnge_vnic_info *vnic);
 #endif /* _BNGE_VNIC_H_ */
-- 
2.52.0

