Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138217;
	b=SyQ/rjprc/b8X8OaC6aIizncMTaEu+t9KfKazaSk1HY+7FGdH1YA1Hv/njQFg+Ca9NbP
	 YOvAqRAxwyCCitJ5MxJeqGLSRAR96B7mLjwYMhsZpbm3jHXDyK6NwyLOrwlceAjAhkQOd
	 F3bVFcvXLALKTDKVa8UVggYkl4nn8Ln+cWi4iBKlG/dkgFs4n+pBo0BYWKqEGUQqY26Jk
	 UpaN6vJ0J5RUao/RcDMfpuAhmbDNs4R6wIHhG+Yh12LbAEmzIEldzr4ThOvjqcLIoHZJp
	 eYsX8tBaST0EDGg8C5wKsKphtAgr0CLQH0RqoQjNydKjPvnXhQOF0T3/IdmsDw22SkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138217;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Z6oKTli3+px9SOuRzkweSgn7av/gVkkyyEMTzbXGDzQ=;
	b=YdfBXiSBbShIkGmvS9mCeKAlS4r+lCZtBnXZoNJ4RdCXU9LSynaV1i9w5IfYol3d3lgr
	 0SpupmvaYiL/bZlZx86aey9aRLfb0u1X/cSsbN2iKuCFE0XGXSaByHJ2YR8sj7WkuQdSu
	 PsRb+KRPj1YNxEQYeYRjC0Z4Cs3ZBeuXIQssiMEYKud4syMXNHd+8yRzHnKpk05b4ZCvM
	 uc6veSLKpABoK0yRmtwUBZq+SbO/SR7Am7Qn0xmksfkWsz3HQHxdxbsPerEQbs1IHUca+
	 zTiyN9g0ISItMqpGPdWUNYrnBhSJgTsHNvAXIsPLI56vN1NNYs4BW7+2+KQMMd6EAbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Wax2K0E1;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37353606A33E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37353606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Wax2K0E1
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso194976a91.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138216; x=1795743016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6oKTli3+px9SOuRzkweSgn7av/gVkkyyEMTzbXGDzQ=;
        b=ludJ1E+5myQc7FO2yK7zYp0KNPZSQusdbwqXxhvj5fanNKH1fNIwSLLqL5EJ4gaF2n
         kLs4dpvxk27icjFXJjXPclI9yj3NP+QGqKDUDfZxzbr1zMViYGqkRDabbeNI2Gc7Won+
         xIbMeQIE2ZZz9hT+G2+dhG/RngZsa1AnwTO3LlmKSRwCb9Dt/vE8cNVhynh8J1Sl8s+O
         1KSA9lIBiut5XRqy6MIduitX3OEteND0frh9RLmCmRHA5/cJl2WZmPBtxHOdaVdhwANs
         xSnlmdDR/xVMamJDJaaP6NhcFfGqV+BuiBWJ34WJRZMIcJiqcx0KE3lxazUgFZBN2LyJ
         q3Vg==
X-Gm-Message-State: APuU4Z+ibASQwpyLdREJdWMe5OH9NE2kD6cmmAEWe4iBIkAOVF/WxNhp
	bQN6bnCRKW86AK9TRZ/pO0p4wxN57/aLXwfU4E7Zvc3AS9QrJ9+/kG2emoBEWWzSmrP/CQ7l0Qm
	yb5UzP3b5QJyX2nROymyaVaZL734legfJJiBhnMSvTLrcBz/tsFgXdTK7GKUNsvQjcTJ+F6wXWa
	s1FD8etqu2cASnXSwhIjZnI8svRkm21j5wQixXhZCb9UjpRL1FbGNNv+Rx8+Va0Cw4PA0KOFE/J
	Y0MmBaWa1Q=
X-Gm-Gg: AZFdTZd9VmyhBXX2YRGoxfDo9Zx+D/IGIRmKFT8c3B/3Xw3dljcc1rzKZ5RVK3v6sJX
	0BkkRXsFbToo5u1xcK2VVSfW5a0Lq9i13y9s0e3fhZ2WhzVXse7TL5qBExYRCFleojgDbEUZgrz
	fctSc8Bytuj3BH9euiAaIZKjeAOXY9HvIyU5ThVE5oWylohWCsdbwaAJIdDXg9y0sPiW+qR2pxR
	JdNooYIq3XYH9aDEypWi0AW2Mh7EzelOQAF4ZHS2k+96j37I0JQI7AJtz2SRP3NxgYil/kqZTnn
	LBNX3dvbto0tsMyM5qRthgva0Iog3uFiS3P9yZD4hx0fiZlFALnmiVWRtkxiPI+rcTA+RW2sHRT
	4D/pPKTMeLW1IO1iozjUgQuG6mz89+67rp4baYpRmSJ8HPl4zhiJqXhu7thAkSaQnQ0cm5s32Sa
	BIAaxn6x531UBdkqCa1pefjA9+A76MN9YB5pSX8w==
X-Received: by 2002:a17:90a:e705:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3b41c938d83mr1043425a91.38.1795138216445;
        Thu, 19 Nov 2026 17:30:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d683sm2227592a91.3.2026.11.19.17.30.16
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5383c05fb2fso12401271cf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138215; x=1795743015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6oKTli3+px9SOuRzkweSgn7av/gVkkyyEMTzbXGDzQ=;
        b=Wax2K0E1+DlP68NsFOZAYr6TJhs54jwQCLpGT7vy2G6z6mcrBhxpoRtIGdmEDpMbl3
         W6hJ48eJkEZmlLyXGzeZkzN8Nc/eNdHZ7fUI4SLE7rZC8wM6BAvJh19nGXgvBJtlleyd
         b19ohmT4TGLz0h3wFFyjWnkhfC5mgr7DJaI2c=
X-Received: by 2002:a05:622a:60e:b0:535:a5f7:d588 with SMTP id d75a77b69052e-55d76a811d3mr30787471cf.66.1795138214753;
        Thu, 19 Nov 2026 17:30:14 -0800 (PST)
X-Received: by 2002:a05:622a:60e:b0:535:a5f7:d588 with SMTP id d75a77b69052e-55d76a811d3mr30786961cf.66.1795138214107;
        Thu, 19 Nov 2026 17:30:14 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:13 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 8/9] bnxt_en: Fix ring accounting/validation when rings are constrained by FW
Date: Thu, 19 Nov 2026 17:29:20 -0800
Message-ID: <20261120012921.2537903-9-michael.chan@broadcom.com>
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

When __bnxt_reserve_rings() reserves fewer TX rings than requested,
and an XDP program is attached, the driver used to blindly subtract
bp->tx_nr_rings_xdp from bp->tx_nr_rings, potentially causing an integer
underflow.

This patch mainly fixes the existing bnxt_adj_tx_rings(),
bnxt_rings_ok(), some ring helpers, and __bnxt_reserve_rings():

1. bnxt_adj_tx_rings() is now renamed bnxt_adj_rings() to reflect that
all rings (tx, rx, cp) may adjust if needed.  It will now correctly
scale down TX rings for XDP and TCs evenly.  In combined channel mode,
RX and TX rings are now clamped to match each other - required by
XDP's 1:1 TX/RX mapping and now applied to non-XDP mode for
consistency.  CP rings will also be reduced if necessary.  Any
leftover rings after integer division are intentionally left unused.

2. bnxt_rings_ok() is now updated to robustly check for the absolute
minimum viable ring configuration to support the TC and XDP settings.
We now call bnxt_rings_ok() first before calling bnxt_adj_rings() to
guarantee no math underflow or ring truncation to 0.

3. bnxt_num_cp_to_tx()/bnxt_num_tx_to_cp() helpers are used while
trimming the rings with possible ring shortages.  These helpers now
use the passed in tx_xdp (now used as boolean) and rx parameters to
accurately scale and clamp the XDP rings.

4. __bnxt_reserve_rings() now only calls bnxt_adj_rings() if
bp->bnapi has not been allocated.  In this context, we may be expanding
and asking for more rings than FW can grant and we need to call
bnxt_adj_rings() for possible adjustments.  We now abort
__bnxt_reserve_rings() for all fatal conditions through the common
reserve_rings_exit label.  We now leave the ring states unchanged and
the ULP resources reconciled during abort.

We also need to reset the RSS table of the default context as needed
if the RX rings have shrunk.  As noted in the cover letter, we have
similar existing issues regarding RSS tables for non-default RSS
contexts and user defined n-tuple filters when RX rings shrink due
to FW or MSI-X constraints.  The fixes for these are deferred to a
separate patchset.

The next patch will fix similar issues when MSI-X vectors are
constrained.

These existing issues were detected by Sashiko when reviewing the
new kTLS patchset (patch #3 of 15):

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260810051358.1244418-7-michael.chan@broadcom.com

Fixes: 1ee581c24dfd ("bnxt_en: Adjust TX rings if reservation is less than requested")
Fixes: 674f50a5b026 ("bnxt_en: Implement new method to reserve rings.")
Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
v5:
Split out the MSI-X changes to the new patch #9.

v4:
Fix bnxt_num_cp_to_tx()/bnxt_num_tx_to_cp() helpers to fix the
ring trimming issue reported by Sashiko.

https://lore.kernel.org/netdev/20261016064427.496944-9-michael.chan@broadcom.com/

v3:
No longer have to deal with dropped NITRO A0
Fix the dynamic IRQ code path in bnxt_reserve_rings().
Use the proper __bnxt_num_tx_to_cp() in bnxt_rings_ok().

https://lore.kernel.org/netdev/20261012220827.340998-8-michael.chan@broadcom.com/

v2:
Reduce RX and CP rings if needed when TX rings are reduced to keep it
consistent.
Handle NITRO_A0 special RX requirements to keep it consistent.
Fix all unwind issues in these code paths.

https://lore.kernel.org/netdev/20260928041712.3467803-7-michael.chan@broadcom.com/

v1:
https://lore.kernel.org/netdev/20260831024342.2161156-2-michael.chan@broadcom.com/
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 137 +++++++++++++++++-----
 1 file changed, 106 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d76227d29282..565099088969 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -8086,10 +8086,32 @@ static void bnxt_copy_reserved_rings(struct bnxt *bp, struct bnxt_hw_rings *hwr)
 	}
 }
 
+static int bnxt_min_tx_rings(struct bnxt *bp)
+{
+	int min_tx = bp->num_tc ? bp->num_tc : 1;
+
+	return bp->tx_nr_rings_xdp ? min_tx + 1 : min_tx;
+}
+
 static bool bnxt_rings_ok(struct bnxt *bp, struct bnxt_hw_rings *hwr)
 {
-	return hwr->tx && hwr->rx && hwr->cp && hwr->grp && hwr->vnic &&
-	       hwr->stat && (hwr->cp_p5 || !(bp->flags & BNXT_FLAG_CHIP_P5_PLUS));
+	int min_tx, min_tx_xdp = 0;
+	int min_rx = 1;
+	int min_cp;
+	int tx_cp;
+
+	min_tx = bnxt_min_tx_rings(bp);
+	if (bp->tx_nr_rings_xdp)
+		min_tx_xdp = 1;
+
+	tx_cp = bnxt_num_tx_to_cp(bp, min_tx, min_tx_xdp, min_rx);
+	if (bp->flags & BNXT_FLAG_SHARED_RINGS)
+		min_cp = max(tx_cp, min_rx);
+	else
+		min_cp = tx_cp + min_rx;
+	return hwr->tx >= min_tx && hwr->rx >= min_rx && hwr->cp >= min_cp &&
+	       hwr->grp && hwr->vnic && hwr->stat &&
+	       (hwr->cp_p5 || !(bp->flags & BNXT_FLAG_CHIP_P5_PLUS));
 }
 
 /* Check to see if we need to reset the user configured RSS table
@@ -8107,10 +8129,13 @@ static void bnxt_check_rss_tbl_lost(struct bnxt *bp, int old_rx, int new_rx)
 }
 
 static int bnxt_get_avail_msix(struct bnxt *bp, int num);
+static void bnxt_adj_rings(struct bnxt *bp);
 
 static int __bnxt_reserve_rings(struct bnxt *bp)
 {
 	struct bnxt_en_dev *edev = bp->edev[BNXT_AUXDEV_RDMA];
+	int req_rx_rings = bp->rx_nr_rings;
+	int req_tx_rings = bp->tx_nr_rings;
 	struct bnxt_hw_rings hwr = {0};
 	int rx_rings, old_rx_rings, rc;
 	int cp = bp->cp_nr_rings;
@@ -8153,7 +8178,7 @@ static int __bnxt_reserve_rings(struct bnxt *bp)
 
 	rc = bnxt_hwrm_reserve_rings(bp, &hwr);
 	if (rc)
-		return rc;
+		goto reserve_rings_exit;
 
 	bnxt_copy_reserved_rings(bp, &hwr);
 
@@ -8162,8 +8187,10 @@ static int __bnxt_reserve_rings(struct bnxt *bp)
 		if (hwr.rx >= 2) {
 			rx_rings = hwr.rx >> 1;
 		} else {
-			if (netif_running(bp->dev))
-				return -ENOMEM;
+			if (netif_running(bp->dev)) {
+				rc = -ENOMEM;
+				goto reserve_rings_exit;
+			}
 
 			bp->flags &= ~BNXT_FLAG_AGG_RINGS;
 			bp->flags |= BNXT_FLAG_NO_AGG_RINGS;
@@ -8178,49 +8205,67 @@ static int __bnxt_reserve_rings(struct bnxt *bp)
 		hwr.stat -= bnxt_get_ulp_stat_ctxs(bp);
 	hwr.cp = min_t(int, hwr.cp, hwr.stat);
 	rc = bnxt_trim_rings(bp, &rx_rings, &hwr.tx, hwr.cp, sh);
+	if (rc)
+		goto reserve_rings_exit;
+
+	if (bp->bnapi && (rx_rings < req_rx_rings ||
+			  hwr.tx < req_tx_rings)) {
+		netdev_err(bp->dev, "Unexpected ring shrinkage %d/%d RX/TX to %d/%d\n",
+			   req_rx_rings, req_tx_rings, rx_rings, hwr.tx);
+		rc = -ENOSPC;
+		goto reserve_rings_exit;
+	}
 	if (bp->flags & BNXT_FLAG_AGG_RINGS)
 		hwr.rx = rx_rings << 1;
 	tx_cp = bnxt_num_tx_to_cp(bp, hwr.tx, bp->tx_nr_rings_xdp, rx_rings);
 	hwr.cp = sh ? max_t(int, tx_cp, rx_rings) : tx_cp + rx_rings;
-	if (hwr.tx != bp->tx_nr_rings) {
-		netdev_warn(bp->dev,
-			    "Able to reserve only %d out of %d requested TX rings\n",
-			    hwr.tx, bp->tx_nr_rings);
+
+	if (!bnxt_rings_ok(bp, &hwr)) {
+		rc = -ENOMEM;
+		goto reserve_rings_exit;
 	}
 	bp->tx_nr_rings = hwr.tx;
+	bp->rx_nr_rings = rx_rings;
+	bp->cp_nr_rings = hwr.cp;
 
+	if (!bp->bnapi)
+		bnxt_adj_rings(bp);
+
+	if (req_tx_rings != bp->tx_nr_rings) {
+		netdev_warn(bp->dev,
+			    "Able to reserve only %d out of %d requested TX rings\n",
+			    bp->tx_nr_rings, req_tx_rings);
+	}
 	/* If we cannot reserve all the RX rings, reset the RSS map only
 	 * if absolutely necessary
 	 */
-	if (rx_rings != bp->rx_nr_rings) {
+	if (req_rx_rings != bp->rx_nr_rings) {
 		netdev_warn(bp->dev, "Able to reserve only %d out of %d requested RX rings\n",
-			    rx_rings, bp->rx_nr_rings);
-		bnxt_check_rss_tbl_lost(bp, bp->rx_nr_rings, rx_rings);
+			    bp->rx_nr_rings, req_rx_rings);
+		bnxt_check_rss_tbl_lost(bp, req_rx_rings, bp->rx_nr_rings);
 	}
-	bp->rx_nr_rings = rx_rings;
-	bp->cp_nr_rings = hwr.cp;
 
 	/* Fall back if we cannot reserve enough HW RSS contexts */
 	if ((bp->rss_cap & BNXT_RSS_CAP_LARGE_RSS_CTX) &&
 	    hwr.rss_ctx < bnxt_get_total_rss_ctxs(bp, &hwr))
 		bp->rss_cap &= ~BNXT_RSS_CAP_LARGE_RSS_CTX;
 
-	if (!bnxt_rings_ok(bp, &hwr))
-		return -ENOMEM;
-
-	if (old_rx_rings != bp->hw_resc.resv_rx_rings &&
+	if ((old_rx_rings != bp->hw_resc.resv_rx_rings ||
+	     req_rx_rings != bp->rx_nr_rings) &&
 	    !netif_is_rxfh_configured(bp->dev))
 		bnxt_set_dflt_rss_indir_tbl(bp, NULL);
 
+reserve_rings_exit:
 	if (!bnxt_ulp_registered(edev) && BNXT_NEW_RM(bp)) {
 		int resv_msix, resv_ctx, ulp_ctxs;
 		struct bnxt_hw_resc *hw_resc;
 
 		hw_resc = &bp->hw_resc;
-		resv_msix = hw_resc->resv_irqs - bp->cp_nr_rings;
+		resv_msix = max_t(int, hw_resc->resv_irqs - bp->cp_nr_rings, 0);
 		ulp_msix = min_t(int, resv_msix, ulp_msix);
 		bnxt_set_ulp_msix_num(bp, ulp_msix);
-		resv_ctx = hw_resc->resv_stat_ctxs  - bp->cp_nr_rings;
+		resv_ctx = max_t(int, hw_resc->resv_stat_ctxs - bp->cp_nr_rings,
+				 0);
 		ulp_ctxs = min(resv_ctx, bnxt_get_ulp_stat_ctxs(bp));
 		bnxt_set_ulp_stat_ctxs(bp, ulp_ctxs);
 	}
@@ -11317,14 +11362,27 @@ int bnxt_num_tx_to_cp(struct bnxt *bp, int tx, int tx_xdp, int rx)
 {
 	int tcs = bp->num_tc ? bp->num_tc : 1;
 
+	if (tx_xdp) {
+		tx_xdp = tx / (tcs + 1);
+		tx_xdp = min(tx_xdp, rx);
+	}
 	return __bnxt_num_tx_to_cp(bp, tx, tcs, tx_xdp);
 }
 
 static int bnxt_num_cp_to_tx(struct bnxt *bp, int tx_cp, int tx_xdp, int rx)
 {
 	int tcs = bp->num_tc ? bp->num_tc : 1;
+	int cp_per_tc;
 
-	return (tx_cp - tx_xdp) * tcs + tx_xdp;
+	if (tx_xdp) {
+		/* The CP rings are divided equally between XDP TX rings and
+		 * the regular TX rings.
+		 */
+		cp_per_tc = tx_cp / 2;
+		cp_per_tc = min(cp_per_tc, rx);
+		return cp_per_tc * (tcs + 1);
+	}
+	return tx_cp * tcs;
 }
 
 static int bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
@@ -13156,13 +13214,29 @@ static void bnxt_set_xdp_tx_rings(struct bnxt *bp)
 	bp->tx_nr_rings += bp->tx_nr_rings_xdp;
 }
 
-static void bnxt_adj_tx_rings(struct bnxt *bp)
+static void bnxt_adj_rings(struct bnxt *bp)
 {
-	/* Make adjustments if reserved TX rings are less than requested */
-	bp->tx_nr_rings -= bp->tx_nr_rings_xdp;
-	bp->tx_nr_rings_per_tc = bnxt_tx_nr_rings_per_tc(bp);
-	if (bp->tx_nr_rings_xdp)
-		bnxt_set_xdp_tx_rings(bp);
+	int tcs = bp->num_tc ? bp->num_tc : 1;
+	int rx = bp->rx_nr_rings;
+
+	/* Make adjustments to rings based on TC/XDP/shared rings policies */
+	if (bp->tx_nr_rings_xdp) {
+		tcs++;
+		bp->tx_nr_rings_per_tc = bp->tx_nr_rings / tcs;
+		bp->tx_nr_rings_xdp = bp->tx_nr_rings_per_tc;
+	} else {
+		bp->tx_nr_rings_per_tc = bnxt_tx_nr_rings_per_tc(bp);
+	}
+
+	if (bp->flags & BNXT_FLAG_SHARED_RINGS) {
+		bp->tx_nr_rings_per_tc = min(bp->tx_nr_rings_per_tc, rx);
+		bp->rx_nr_rings = bp->tx_nr_rings_per_tc;
+		if (bp->tx_nr_rings_xdp)
+			bp->tx_nr_rings_xdp = bp->tx_nr_rings_per_tc;
+	}
+
+	bp->tx_nr_rings = bp->tx_nr_rings_per_tc * tcs;
+	bnxt_set_cp_rings(bp, bp->flags & BNXT_FLAG_SHARED_RINGS);
 }
 
 static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
@@ -13182,7 +13256,8 @@ static int __bnxt_open_nic(struct bnxt *bp, bool irq_re_init, bool link_re_init)
 	if (rc)
 		return rc;
 
-	bnxt_adj_tx_rings(bp);
+	if (irq_re_init)
+		bnxt_adj_rings(bp);
 	rc = bnxt_alloc_mem(bp, irq_re_init);
 	if (rc) {
 		netdev_err(bp->dev, "bnxt_alloc_mem err: %x\n", rc);
@@ -16876,7 +16951,7 @@ static int bnxt_set_dflt_rings(struct bnxt *bp, bool sh)
 	if (rc && rc != -ECOMM)
 		netdev_warn(bp->dev, "Unable to reserve tx rings\n");
 
-	bnxt_adj_tx_rings(bp);
+	bnxt_adj_rings(bp);
 	if (sh)
 		bnxt_adj_dflt_rings(bp, true);
 
@@ -16885,7 +16960,7 @@ static int bnxt_set_dflt_rings(struct bnxt *bp, bool sh)
 		rc = __bnxt_reserve_rings(bp);
 		if (rc && rc != -ECOMM)
 			netdev_warn(bp->dev, "2nd rings reservation failed.\n");
-		bnxt_adj_tx_rings(bp);
+		bnxt_adj_rings(bp);
 	}
 	if (rc) {
 		bp->tx_nr_rings = 0;
@@ -16915,7 +16990,7 @@ static int bnxt_init_dflt_ring_mode(struct bnxt *bp)
 	if (rc)
 		goto init_dflt_ring_err;
 
-	bnxt_adj_tx_rings(bp);
+	bnxt_adj_rings(bp);
 
 	bnxt_set_dflt_rfs(bp);
 
-- 
2.51.0

