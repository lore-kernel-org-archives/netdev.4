Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138220;
	b=fhsl8Uw524vRMI3UEDCpCkY2F3c1DSmUv0O9bif4y3g74EOU8GEFVRdxXoHB12iXvfLI
	 lfZGNx00KjzcLEBYfxC0iwYy29bANvIDpf6h7gdumAf8pNzNdySrMogH1kYuuXDW8/LAT
	 8xmWdMAF+vbiIaIgl0ynZ6MagSH6ePnxZLzvF6lCcjFzNXzJzcFUyMMx42eEmpUk8yMs3
	 dMdYjfWX2TZm2BcGkt240h41KU0Y1Ig5SNWjp/mNbdDmTLaHR2ZZAWRxBHhdQ0pSM/iwy
	 nXPdWoWjWmBoH/cvUBMqDPYUdP/Vmi9keFuIbP+ykY9iHwQMYrdUoyv0BCWIjFC2RzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138220;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=5+xXVb0je35JnMnstViCjX1uQUFP2uH8soBnBjulc8I=;
	b=Ne5ONeSU9Xc6aQAdBx4H/pylfeJyu+6Vh0Jm4amcdhX4nz4DPTnf3LM1dHA02TdfKRkP
	 h/itcmEaCoDpAOvT7wWEjaXEnulzjbuSBuVuCAsEghR42TqQRyam3AhUVfxMcWrLXci77
	 AnEALFacc0xuCzOhsLkkZvoX25O4dk6wq5aASJjS4v5MJI/hxMySsvL8Vpge0fCOPU+zM
	 JBCRqUcelADYHtdKGjgDHoJ4o78NUkw3p639rLQ1/a3k+nmI8TbmCkGxsSDL55W5Vro4o
	 C6ClX2e43OPvCNN//PyvmBLp9HIjBC3CNOLNE33uEqHb+Qcs0sUluuF/h77JCqeu0qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gHCgy1IL;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5A606A333
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A5A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gHCgy1IL
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so170659a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138219; x=1795743019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+xXVb0je35JnMnstViCjX1uQUFP2uH8soBnBjulc8I=;
        b=rD3CzLsv1f3I9lF+d2SAH2dltcvtxG7TmhJ3sxxM2whzarKsz3ot+IXyPt6eixbUV/
         YN7lmwPkvkxE0dgRBAuycpGkMUX7C+oeXwgUAgvBotlwNvNJ09zu4OTyTyaFuwO6lpxs
         /BWRhdKZG1KhSLSn1Lz93qSC/GFLAIIuaikRlHK6jDnSxX8RtUcFmGls1MQE1QMHASzz
         U3jbC+Svu1+O7yap9zFspIvHDOSbAOt7H30sJ49peFLbDCC8g+u2GklJ2eQBPsmIHQCr
         FzbKNATaSgXMBSxOfRv6q2D/1xpujbLCB9/hHoN56+WgIWMCejvx+GxiIBrAD+RQ14+9
         e0dA==
X-Gm-Message-State: APuU4Z+PnS6qA/f5Xp94ECvejwzncJBwLCXOa+h6H9D+9zdCEVxXQHQr
	nOC0nBskoe/qP/JEG0kBfNaEO0a4Rx7sbgS2+AmFzSjuJBS8d0Ehoed/s66COwDExgLlNiVyYRO
	c483gxyIrdyDQ1QWhjXR9iRSEpmBKCEPgMGYSind86QQfXw0e3UwDphGLat9zpyW9DhGwLwT6wo
	ebLemzKXCy4NDep1dkSALzw/S/RLF7u72WLsNjpvglMlfYl07xuO5iuzRMH1TiuBBNi5w8ZsbKj
	w1EWrhR+pc=
X-Gm-Gg: AZFdTZcHs3Zx/eHGdXa1WAQbZp6ApqW4Cf2MAznHwmrUMsIvor4L9JUfv4lgIprCxtJ
	N3ygh0KMkdVbU80oLZ+ND23GzXLGLzulHZoqDDeBxlgSqNQuDxkSSbMYpwnCICEgnRbsho1a7GR
	xxf54a5rbx6eiZxn1iZr69qGU5xQKwLFhIsh87G9xA+skMI32k+IwN/2Zn6SH5BVzNqynTm11zv
	e34UpRVywRGWiEUh8H+oZVZEF6tZ/ovsfkxeFtZrH2g+G/fCfyBCdPZbAzUtaBWGiEEXcZsGeq1
	Bx0WxyJd0yZX1ZNtvrYn3C/1oBuXUw1QmUoZbxILkKhFqWxGC2PwYGndlawdGf4ce4/xv/9lAtX
	e07ynGHpTNHEsa1E2AqMb7FD7OCMukFDuyjnb+Wmg8xeT8IjIimZP84hEv5eEdtOhsl4HfhB4+8
	opVfNiisaQDkNLpTRpgYY6Om0mOq9xdtYPPZya8Q==
X-Received: by 2002:a17:90b:4c12:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b41c95408emr1167535a91.42.1795138218680;
        Thu, 19 Nov 2026 17:30:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ab582a3sm929019a91.0.2026.11.19.17.30.18
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210ad74fdeso9582486d6.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138217; x=1795743017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+xXVb0je35JnMnstViCjX1uQUFP2uH8soBnBjulc8I=;
        b=gHCgy1IL9hvgSLhgl0Kxro6MrY3kGXpiDYMEkWxtEmlmWykoqvc4/10UUOj3qSKKsQ
         FQndNL0Rm6biGd3EG9PJWjunRgXbA9zTsMNIlCHjaaAxzlTBWzhPG+mEMIODs18+dJN3
         nkYibiw5/ebKdjbcICU3cuVwhh9SLjtLaijy8=
X-Received: by 2002:a05:6214:398c:b0:920:fd9e:f141 with SMTP id 6a1803df08f44-92134b208camr26833696d6.46.1795138216933;
        Thu, 19 Nov 2026 17:30:16 -0800 (PST)
X-Received: by 2002:a05:6214:398c:b0:920:fd9e:f141 with SMTP id 6a1803df08f44-92134b208camr26833016d6.46.1795138216269;
        Thu, 19 Nov 2026 17:30:16 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:15 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 9/9] bnxt_en: Fix ring accounting/validation when IRQs are constrained
Date: Thu, 19 Nov 2026 17:29:21 -0800
Message-ID: <20261120012921.2537903-10-michael.chan@broadcom.com>
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

Similar to the previous patch that handles ring shortages from the FW,
this patch handles MSI-X vector shortages.  We use the similar logic
and infrastructure to adjust the rings if there are not enough MSI-X
vectors to satisfy the current ring configuration.

Add a new bnxt_adj_rings_to_irqs() helper to adjust rings to the
available MSI-X vectors.  The helper will be used when static or
dynamic MSI-X vectors are constrained.  Note that the helper will
return success early if rings have not been reserved yet.

We can now centralize ring adjustments during ring reservations and
IRQ allocations.  Other ring adjustments and checks scattered elsewhere
can now be deleted.

We now remove the error path at the end of bnxt_reserve_rings() to abort
and reset the TCs if the rings cannot satisfy the TC requirements.  The
open will now fail and the user will have to reduce the TCs and retry.
This failure should be very rare because we first call
bnxt_check_rings() to make sure there is high likelihood of success
before committing.

Just like the previous patch, we have similar existing issues regarding
RSS tables for non-default RSS contexts and user defined n-tuple filters
when RX rings shrink due to MSI-X constraints.  The fixes for these are
deferred to a separate patchset.

Fixes: 1ee581c24dfd ("bnxt_en: Adjust TX rings if reservation is less than requested")
Fixes: 674f50a5b026 ("bnxt_en: Implement new method to reserve rings.")
Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
v5:
New patch split from patch #8.
Fixed a Sashiko issue in bnxt_init_int_mode() with no rings reserved.
Rebased to handle dynamic MSI-X vectors after:

af449230bd8d ("bnxt_en: Don't keep MSI-X vectors added before FW reserves them")
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 110 ++++++++++++++--------
 1 file changed, 73 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 565099088969..8ec9576371cb 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11569,9 +11569,74 @@ static int bnxt_get_num_msix(struct bnxt *bp)
 	return bnxt_nq_rings_in_use(bp);
 }
 
+/* Adjust rings to fit bp->total_irqs */
+static int bnxt_adj_rings_to_irqs(struct bnxt *bp)
+{
+	int req_rx_rings, req_tx_rings, req_cp_rings, req_tx_per_tc, req_tx_xdp;
+	int ulp_msix = bnxt_get_ulp_msix_num(bp);
+	int min_tx, rc;
+
+	/* Nothing to adjust if rings have not been setup yet, e.g. after
+	 * bnxt_clear_reservations() during devlink reload, or on a VF with
+	 * 0 rings provisioned by the PF.  The caller must ensure that genuine
+	 * ring shortage cannot reach here.
+	 */
+	if (!bp->tx_nr_rings)
+		return 0;
+
+	req_tx_rings = bp->tx_nr_rings;
+	req_tx_per_tc = bp->tx_nr_rings_per_tc;
+	req_tx_xdp = bp->tx_nr_rings_xdp;
+	req_rx_rings = bp->rx_nr_rings;
+	req_cp_rings = bp->cp_nr_rings;
+
+	/* Trim rings based upon num of vectors allocated */
+	rc = bnxt_trim_rings(bp, &bp->rx_nr_rings, &bp->tx_nr_rings,
+			     bp->total_irqs - ulp_msix,
+			     bp->flags & BNXT_FLAG_SHARED_RINGS);
+	if (rc)
+		goto adj_irqs_err;
+
+	min_tx = bnxt_min_tx_rings(bp);
+	if (bp->tx_nr_rings < min_tx) {
+		netdev_err(bp->dev, "Not enough MSI-X to satisfy minimum TX rings\n");
+		rc = -ENOMEM;
+		goto adj_irqs_err;
+	}
+
+	bnxt_adj_rings(bp);
+
+	if (bp->bnapi && (req_tx_rings != bp->tx_nr_rings ||
+			  req_rx_rings != bp->rx_nr_rings)) {
+		netdev_err(bp->dev, "Cannot shrink rings once NAPI is allocated\n");
+		rc = -ENOSPC;
+		goto adj_irqs_err;
+	}
+
+	if (req_tx_rings != bp->tx_nr_rings)
+		netdev_warn(bp->dev, "TX rings reduced from %d to %d\n",
+			    req_tx_rings, bp->tx_nr_rings);
+	if (req_rx_rings != bp->rx_nr_rings) {
+		netdev_warn(bp->dev, "RX rings reduced from %d to %d\n",
+			    req_rx_rings, bp->rx_nr_rings);
+		bnxt_check_rss_tbl_lost(bp, req_rx_rings, bp->rx_nr_rings);
+		if (!netif_is_rxfh_configured(bp->dev))
+			bnxt_set_dflt_rss_indir_tbl(bp, NULL);
+	}
+	return 0;
+
+adj_irqs_err:
+	bp->tx_nr_rings = req_tx_rings;
+	bp->tx_nr_rings_per_tc = req_tx_per_tc;
+	bp->tx_nr_rings_xdp = req_tx_xdp;
+	bp->rx_nr_rings = req_rx_rings;
+	bp->cp_nr_rings = req_cp_rings;
+	return rc;
+}
+
 static int bnxt_init_int_mode(struct bnxt *bp)
 {
-	int i, total_vecs, max, rc, min = 1, ulp_msix, tx_cp, tbl_size;
+	int i, total_vecs, max, rc, min = 1, ulp_msix, tbl_size;
 
 	total_vecs = bnxt_get_num_msix(bp);
 	max = bnxt_get_max_func_irqs(bp);
@@ -11606,18 +11671,10 @@ static int bnxt_init_int_mode(struct bnxt *bp)
 		bp->irq_tbl[i].vector = pci_irq_vector(bp->pdev, i);
 
 	bp->total_irqs = total_vecs;
-	/* Trim rings based upon num of vectors allocated */
-	rc = bnxt_trim_rings(bp, &bp->rx_nr_rings, &bp->tx_nr_rings,
-			     total_vecs - ulp_msix, min == 1);
+	rc = bnxt_adj_rings_to_irqs(bp);
 	if (rc)
 		goto msix_setup_exit;
 
-	tx_cp = bnxt_num_tx_to_cp(bp, bp->tx_nr_rings, bp->tx_nr_rings_xdp,
-				  bp->rx_nr_rings);
-	bp->cp_nr_rings = (min == 1) ?
-			  max_t(int, tx_cp, bp->rx_nr_rings) :
-			  tx_cp + bp->rx_nr_rings;
-
 	return 0;
 
 msix_setup_exit:
@@ -11658,7 +11715,6 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
 {
 	bool irq_cleared = false;
 	bool irq_change = false;
-	int tcs = bp->num_tc;
 	int irqs_required;
 	int rc;
 
@@ -11672,9 +11728,11 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
 			irqs_required = bnxt_get_num_msix(bp);
 			if (irqs_required > bp->total_irqs &&
 			    bnxt_change_msix(bp, irqs_required) != irqs_required) {
-				netdev_err(bp->dev, "Unable to allocate %d MSIX vectors, maximum available %d\n",
-					   irqs_required, bp->total_irqs);
-				return -ENOSPC;
+				netdev_warn(bp->dev, "Able to allocate only %d MSIX vectors out of %d requested\n",
+					    bp->total_irqs, irqs_required);
+				rc = bnxt_adj_rings_to_irqs(bp);
+				if (rc)
+					return rc;
 			}
 		}
 		return 0;
@@ -11700,23 +11758,12 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
 		 */
 		irqs_required = bnxt_get_num_msix(bp);
 		if (bnxt_change_msix(bp, irqs_required) != irqs_required)
-			rc = -ENOSPC;
+			rc = bnxt_adj_rings_to_irqs(bp);
 	}
 	if (rc) {
 		netdev_err(bp->dev, "ring reservation/IRQ init failure rc: %d\n", rc);
 		return rc;
 	}
-	if (tcs && (bp->tx_nr_rings_per_tc * tcs !=
-		    bp->tx_nr_rings - bp->tx_nr_rings_xdp)) {
-		netdev_err(bp->dev, "tx ring reservation failure\n");
-		netdev_reset_tc(bp->dev);
-		bp->num_tc = 0;
-		if (bp->tx_nr_rings_xdp)
-			bp->tx_nr_rings_per_tc = bp->tx_nr_rings_xdp;
-		else
-			bp->tx_nr_rings_per_tc = bp->tx_nr_rings;
-		return -ENOMEM;
-	}
 	return 0;
 }
 
@@ -13256,8 +13303,6 @@ static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 	if (rc)
 		return rc;
 
-	if (irq_re_init)
-		bnxt_adj_rings(bp);
 	rc = bnxt_alloc_mem(bp, irq_re_init);
 	if (rc) {
 		netdev_err(bp->dev, "bnxt_alloc_mem err: %x\n", rc);
@@ -16951,7 +16996,6 @@ static int bnxt_set_dflt_rings(struct bnxt *bp, bool sh)
 	if (rc && rc != -ECOMM)
 		netdev_warn(bp->dev, "Unable to reserve tx rings\n");
 
-	bnxt_adj_rings(bp);
 	if (sh)
 		bnxt_adj_dflt_rings(bp, true);
 
@@ -16960,7 +17004,6 @@ static int bnxt_set_dflt_rings(struct bnxt *bp, bool sh)
 		rc = __bnxt_reserve_rings(bp);
 		if (rc && rc != -ECOMM)
 			netdev_warn(bp->dev, "2nd rings reservation failed.\n");
-		bnxt_adj_rings(bp);
 	}
 	if (rc) {
 		bp->tx_nr_rings = 0;
@@ -16990,8 +17033,6 @@ static int bnxt_init_dflt_ring_mode(struct bnxt *bp)
 	if (rc)
 		goto init_dflt_ring_err;
 
-	bnxt_adj_rings(bp);
-
 	bnxt_set_dflt_rfs(bp);
 
 init_dflt_ring_err:
@@ -17385,11 +17426,6 @@ static int bnxt_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (rc)
 		goto init_err_pci_clean;
 
-	/* No TC has been set yet and rings may have been trimmed due to
-	 * limited MSIX, so we re-initialize the TX rings per TC.
-	 */
-	bp->tx_nr_rings_per_tc = bp->tx_nr_rings;
-
 	if (BNXT_PF(bp)) {
 		if (!bnxt_pf_wq) {
 			bnxt_pf_wq =
-- 
2.51.0

