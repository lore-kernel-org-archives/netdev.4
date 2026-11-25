Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607724;
	b=StJ3I+uFKIjaBaHSlYOYDiwQK4XKDxZ6OhCq41ByBHz7QN7eZQhTo4u04gcHBrsaBmRF
	 BfK9F68G0gi4J7f4AgUh6ZQ7hx9hDrjRjFoOaBcZbGV+clhKEvBaHXblFTaR9E/5XJsAV
	 vceBTT19Tbc86KIfmxoGr5zhbw0G5S/DKzmDSmQzTzPv9b/PN9vHO8gGzchZugRE+Byc/
	 ZlqGpRdDQVnH66JCJZEt6alcSQmNb0qYhS385BrjvXstVywlM6wf1o/cX+4PwOUKCTYcI
	 hJ5wO2DSZk+u+YgTcevnjh/MqeuZRdYop69lT/J37mkrK9/V0j9rYWLSUEfH7u3yevA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607724;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=K1MJy6hpsvJnO3ZYPp++zsdaJS+a+ejxh3NTKTjHhdw=;
	b=KE1tqV5lpT/PGGPV4s3re+xrdYMXejWAp4k8+HK0Sh4f9pF8NzI4KD/me8yFH0XaaOJ1
	 WKr+t7N+nCl7rgRivCMguDCnBKamhnIllfSwwA7mEJxQECHnCp5/eg7Q50Rl+2SXX3F8U
	 a4bMkQqoHO9wccAilQXPDh0qDvImD721tz2uo26tClHHRMH6SdhzMlpB4oseLU7BFoAq/
	 viq70VNwWYROKZUgaB3c7ByVielNb+M+GQZVZgui5DjEdRShPEIcUlCnJxzzM27C8v0G2
	 n/AhIUeKKYm+VZZF0vdFEiDffs2TBacUxKJ6rO1Inbxcrg6+FKHqEJg4Na1kJjO/94Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Z/YFa2qh";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AD1606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AD1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z/YFa2qh
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2944774a91.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607723; x=1796212523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1MJy6hpsvJnO3ZYPp++zsdaJS+a+ejxh3NTKTjHhdw=;
        b=mM71W9Oq17krrWhpYjqNVeWICviYfb3MAwR4/hEDa+7flSpBV3L2QrVmkUrP4hD+Pm
         ShvXcm6S2Rq2SrndZi8KjBEnVCDzZHYC3vzzTYnPC7hXZx8y/tr3SNqfEsx5Bnq/9r+w
         I/HGarQHosPs+ijQfUZJZnRxpjI+PfHV27sZwx6hUdPYxqzRK/ZUk/SdLh5jsFMA97PW
         i/6KZaKvtySPlcNRTGELvxDBgm1r7fvJV9EkLuFeCS89iD5Nbk5cdOOwXnGgHzwV12dc
         MIcVCblsJhG83fU6c+SKTnUqSipapGlf1nDCVzv52Zs2xB1PYCI23oRaYFF4lBew0Aev
         u1KQ==
X-Gm-Message-State: APuU4Z/Eh0o65OR1qheypbZ8OpIS57YIbv8hz0Yf6+09K4L4T9QfBjEq
	2Q7n2Je7uB94loB6X0f+yDX9VCAKbCbluxbxwdp1Uz4HIsP9b3TWu3F0TEfPycbY6xIGH83AtlW
	62jx3TWSGv1jhQSgWMjXcFVj7ziYdn4Csh2z/0xmhNhlCDFdgXxlhVwpzFAQt3fjUxGtwvl/cA6
	8NNuaAFs0vIT5oIQetyS3QgyNuTARDkBhgSJ7c0ubzlTBpgTt6+PgQSwQvuxq2E6JFDos/CXG+v
	tGorauZfg==
X-Gm-Gg: AZFdTZf/othj9B+hTI2rBPPzWuTav7byYT9NdcCQiooqCuWTT0VTyESOYVIerDBeyVy
	IrMI07gCl5N7wKWDk41/PbWztO+kccW3WKcZXlVNtsmHw6FpxaQLY6cxTvannpyOH9ARB0Sin3d
	st9pMazvp/rHNRP35fclnrWxr9uE1+BRuZAGiGS3vMciZHSYRwvdG5T1775XxvWdrtTz9kxfykm
	xRC0linQcKkZ6BMAQfblY1LoMYvnau7qhB42Lj8bf6IRpyWdErhmtvhHmYTxhNeAXTZKXKzM79U
	RDVH83e6/ycT0KJ/28n7NUUdK3DMV0trKY1CQZ+k1neIUCFM319ZWBgq0bAlimUB6O4hm12bHTc
	duYePVrDgZ7SjLGqLyuY1z+epgJrHLlZVJwIhR5e7u0jDCattAWOybnj55tw8YyKmSY2aSql/cA
	Is6bfROP3DqW7lwoTWRynWB5OAQsRpQ4upXdCD
X-Received: by 2002:a17:90b:4fd1:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b41caecd5fmr14691158a91.42.1795607722972;
        Wed, 25 Nov 2026 03:55:22 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23cb9dsm5934206a91.1.2026.11.25.03.55.22
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:55:22 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so6018690eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795607721; x=1796212521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1MJy6hpsvJnO3ZYPp++zsdaJS+a+ejxh3NTKTjHhdw=;
        b=Z/YFa2qhuhEQEPEdfBJIBRSalg0D3CM9qXutIZ+vVjIfCOLqm0jwmvjrhW1xshOK9P
         J36fr+7qmpEHES87tS9AyXxN1OrQGhAe14AMmX+sFNrS3ZXE8xDn39IopuTHrjUoNbET
         zLhqMkivymqJvkxl9FLXz1aIme/IMJ67OGawQ=
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id 5a478bee46e88-3856fe59334mr20252535eec.8.1795607720738;
        Wed, 25 Nov 2026 03:55:20 -0800 (PST)
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id 5a478bee46e88-3856fe59334mr20252495eec.8.1795607719962;
        Wed, 25 Nov 2026 03:55:19 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm56693813eec.22.2026.11.25.03.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:55:19 -0800 (PST)
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
Subject: [PATCH net-next v10 05/10] bnge: add ethtool support to manage RSS contexts
Date: Wed, 25 Nov 2026 17:24:29 +0530
Message-ID: <20261125115434.2080590-6-vikas.gupta@broadcom.com>
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

Introduce ethtool callbacks to manage RSS contexts.

Each context allocates a dedicated VNIC with its own RSS indirection
table and hash key, configured with TPA settings matching those of the
default VNIC.

The patch also changes existing behaviour:
  - bnge_fill_hw_rss_tbl() remaps out-of-range entries for every VNIC,
    including the default one.
  - bnge_del_one_rss_ctx() resets fw_rss_cos_lb_ctx[] and decrements
    rsscos_nr_ctxs, and bnge_hwrm_realloc_rss_ctx_vnic() takes rss_lock.

RSS contexts do not depend on NTUPLE. They can be created and kept
whether NTUPLE is on or off. Turning NTUPLE off deletes the user rules
but keeps the contexts.

When the number of RX rings changes at open, a user RSS context whose
table no longer fits is deleted and reported with
ethtool_rxfh_context_lost(): either the RSS table size changes with
the ring count, or the table names a ring that no longer exists. A
table is not folded to the new size, even when that would be
possible. The NTUPLE rules steered to a deleted context (added later
in the series) are deleted with it. Contexts that use the default
table are resized.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 172 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |   4 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  61 ++++++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |   1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 133 +++++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  16 +-
 6 files changed, 372 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 878fe4888160..99a69f16a0a6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -1073,6 +1073,175 @@ static u32 bnge_get_rx_ring_count(struct net_device *dev)
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
+	 * tell the RSS contexts apart. The invalid id would print the same
+	 * for every context.
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
@@ -1102,6 +1271,9 @@ static const struct ethtool_ops bnge_ethtool_ops = {
 	.set_rxfh		= bnge_set_rxfh,
 	.get_rxfh_fields	= bnge_get_rxfh_fields,
 	.set_rxfh_fields	= bnge_set_rxfh_fields,
+	.create_rxfh_context	= bnge_create_rxfh_context,
+	.modify_rxfh_context	= bnge_modify_rxfh_context,
+	.remove_rxfh_context	= bnge_remove_rxfh_context,
 };
 
 void bnge_set_ethtool_ops(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index deb450929ded..f1fcac315380 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -2974,6 +2974,8 @@ static int bnge_open_core(struct bnge_net *bn)
 	/* Poll link status and check for SFP+ module status */
 	bnge_get_port_module_status(bn);
 
+	bnge_hwrm_realloc_rss_ctx_vnic(bn);
+
 	return 0;
 
 err_free_irq:
@@ -3219,6 +3221,8 @@ static void bnge_close_core(struct bnge_net *bn)
 	clear_bit(BNGE_STATE_OPEN, &bd->state);
 
 	timer_delete_sync(&bn->timer);
+
+	bnge_clear_rss_ctxs(bn);
 	bnge_shutdown_nic(bn);
 
 	bnge_nq0_napi_to_wq(bn);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index c1064e53cfbf..18f01b41b8cc 100644
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
@@ -395,6 +413,7 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 			     (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
 			      bnge_cal_nr_rss_ctxs(rx_rings) ||
 			      bnge_get_max_rss_ring(bd) >= rx_rings);
+		bnge_check_rss_ctxs_lost(bd, rx_rings);
 	}
 
 	bd->rx_nr_rings = rx_rings;
@@ -403,7 +422,8 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	if (old_rx_rings != bd->hw_resc.resv_rx_rings || rx_changed) {
 		if (!bd->netdev || indir_lost ||
 		    !netif_is_rxfh_configured(bd->netdev))
-			bnge_set_dflt_rss_indir_tbl(bd);
+			bnge_set_dflt_rss_indir_tbl(bd, NULL);
+		bnge_refill_dflt_rss_ctxs(bd);
 	}
 
 	/* Notify only now, so the notification reports the new ring count
@@ -476,7 +496,7 @@ int bnge_alloc_irqs(struct bnge_dev *bd)
 
 	/* The indirection table may point at rings that were just removed */
 	if (bd->rx_nr_rings != old_rx)
-		bnge_set_dflt_rss_indir_tbl(bd);
+		bnge_set_dflt_rss_indir_tbl(bd, NULL);
 
 	tx_cp = bnge_num_tx_to_cp(bd, bd->tx_nr_rings);
 	bd->nq_nr_rings = (min == 1) ?
@@ -660,6 +680,39 @@ static int bnge_alloc_rss_indir_tbl(struct bnge_dev *bd)
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
@@ -673,7 +726,7 @@ int bnge_net_init_dflt_config(struct bnge_dev *bd)
 	if (rc)
 		goto err_free_tbl;
 
-	bnge_set_dflt_rss_indir_tbl(bd);
+	bnge_set_dflt_rss_indir_tbl(bd, NULL);
 	hw_resc = &bd->hw_resc;
 	bd->max_fltr = hw_resc->max_rx_em_flows + hw_resc->max_rx_wm_flows +
 		       BNGE_L2_FLTR_MAX_FLTR;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index c0b6992d7f82..278d98ea9da6 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -75,6 +75,7 @@ void bnge_aux_init_dflt_config(struct bnge_dev *bd);
 u32 bnge_get_rxfh_indir_size(struct bnge_dev *bd);
 int bnge_cal_nr_rss_ctxs(u16 rx_rings);
 bool bnge_aux_has_enough_resources(struct bnge_dev *bd);
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

