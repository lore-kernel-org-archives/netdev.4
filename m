Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138205;
	b=ThnxWTCSBt/gF4dM3tUr/sj9slxj799cqPm0Quf0k4DzFj3PbV060FdeT8xEFQ2xU4wv
	 dbKfwIT9cmcgOEdF+neQRtXOHTGRGbv/cVKvrPYXF0yeuca2CDZ8oaJXv1QRp7+noKQ+A
	 Zw0PjbKsGAKMeCCFOrYe4XK+nn3hkKgmXg4DQcTpkeWDVV2pRSnRs9HuKaYQMeBaLAhYX
	 rtiM2Ra4tYsWAHbZ6WbodGSl+mzcln5XG81rEaK8PiGc8KomBFt7KnQHKe91zxHSacfaX
	 9V+C228LMt315cRxBalSSPFQ9JXpxc62/xINleT1NlYzcn72OUjtwDSDuRmVkWNPvZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138205;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=KeXCzqbyYQKddzMC3M56LTQ28bGLXYokTigL5PYc1Hc=;
	b=TRWGfTlBohr9GE9Kx9eIE6noWUVZhek6sN2scsR5aRU2ZELVqzCG1ibnmaUufZaZ7v0V
	 kKdXZ4p7wRY2DfzUn8a+OlqfeakG6wkU0L34EhyFMUzmpVNylvfiE4iPhH762pTUYSwn0
	 3F3rFo6u4qVhF524bcTboF0C8OXqJUtWC7j1Q6BkJBk3AeODFBWVVZzeRlY50eNBjN97v
	 Wr17bEgC8ASpsvjRjmOLmUDQiIG6rRPsveL0zZwX0IR9hpVnpPnVsNBMEuCHYvIFrpwZH
	 +wQ1xEHc0oTXzxS3PF8j3fJFyCJFJf8UlqRRhoJeaa7au7vh/LdFnV1ogBPbqQP0HPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CUJ6unJD;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D405C606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D405C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CUJ6unJD
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso178258a12.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138204; x=1795743004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeXCzqbyYQKddzMC3M56LTQ28bGLXYokTigL5PYc1Hc=;
        b=jjEKoMm5IzdaRciMMXLf3dx9VrhNCnmMfT03JOTtgcG/P3AROZ4XeZzTxSlkq/NC58
         hbO78JxkNDb4HGFfzP3JBB2g6HYdyjjMWMFOWoU/iL462YoLf4CS+8p7kZVi05VCeRWA
         dMFtXi5dRuCP4IMwpzB+WtGL+h4GT91aAVcsPW2ai40liBcx19If6yS696K9Wy6WvNPG
         kgTqt3XJt3qlSUtR2JiiYIJ+JaUkmpDh+Z/jY5zbnYgw2u2lpuV4VC0DxUVCpr/t0Nvu
         MH+vRQ1dGhu6n1wYhMrYhs0Azhq6dTQUetM0wXMiow+id7sixyiP8wU2tFd1IqBzp+Yz
         kxig==
X-Gm-Message-State: APuU4Z8bagyriXWd1DaYU0FpSWh8at5+OpHN42DipIhCgWqKNQPXb5uT
	Dx1Hp8WSXdGxB4n2AR3t1UAhFyaeEYIzEDMURIVLbOuVaErQgqJZ1WuM3L71vaEPikGOkl2q8xC
	WJFufsoKDnnZ/EErJYmFVe8hni9FD62wzM/5yIh+bZNEirBWE/HsbeXecgtDegRXW8PdDeeoJta
	GHCkoDm5yAQzmC2H/LglQ3vSYCizv70VZPdUKpaFoZ+FILb3FUCsrugP/fJJvhMu8M4h163cn7T
	MgRULc9mDM=
X-Gm-Gg: AZFdTZfwUFUPwewDnCtMNuXdAsRyIm4uBPIJ09x5PCEKXho5Zui+t7Gqfh/djL5t45c
	P7hylFUeja9FL9kwPv1rwC0hK5LXVjKJ93DlHufCl2AM3oCu1QHr/B2SOuS2MoK8ifs/5ydI2PN
	Owdxlwm65PB7XqbcjkDNHQoU90ybL+jD5wf7Wf8HpQBV2yOb5U8yUnR9pkldxKTwFjuO9eggdIa
	JRQBePgmk4AIcAucUBgvM5B8UuwFbmaWkQbKGMRA3AuCwGTicFOxlYamfcYiaDMwKMP4D7L2i07
	LSGsP2vp7WVnknlt2RKyxBfd+TM5eL/OmZC8Kj18UHxM2ci8Lv0XvIp79jlxQcUk6Z9L4+6+zoP
	YJL5Wob8nVj6j00AdARfZNpvkU+VWqfWFPDwK/CyzmxT4lSCA0UQCriO/34s4+FTKV8/9xFETgo
	2jThYW8mgr/FHAVKSAV+gCvyk+uV8UfjGUeie5Sw==
X-Received: by 2002:a17:90b:2f8c:b0:3ac:b867:81df with SMTP id 98e67ed59e1d1-3b41c959e23mr1110802a91.39.1795138203950;
        Thu, 19 Nov 2026 17:30:03 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d683sm2227127a91.3.2026.11.19.17.30.03
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:03 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213730b07eso4433866d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138202; x=1795743002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KeXCzqbyYQKddzMC3M56LTQ28bGLXYokTigL5PYc1Hc=;
        b=CUJ6unJDwaSNo4tD4D6W9oi+utMYKh9ALeCALG/OrUs/JZPJjnzwXtwtVM8v3VfyQa
         yBs7ln9SD+/z2RfH19SBmO3qguUvaiXLfQdu+VVZlxKDdxN3QmLg6bH+tUmPZZ0Ok2Zz
         nz1c4b7OJfN75B8qGxCQycP7hgjOR6GacyYkc=
X-Received: by 2002:a05:6214:411a:b0:91e:c6ec:1d9f with SMTP id 6a1803df08f44-92134aec834mr26658776d6.52.1795138202387;
        Thu, 19 Nov 2026 17:30:02 -0800 (PST)
X-Received: by 2002:a05:6214:411a:b0:91e:c6ec:1d9f with SMTP id 6a1803df08f44-92134aec834mr26658586d6.52.1795138201953;
        Thu, 19 Nov 2026 17:30:01 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:01 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 1/9] bnxt_en: Clear bp->total_irqs when disabling IRQs
Date: Thu, 19 Nov 2026 17:29:13 -0800
Message-ID: <20261120012921.2537903-2-michael.chan@broadcom.com>
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

bnxt_init_int_mode() and bnxt_clear_int_mode() will free bp->irq_tbl
but bp->total_irqs retains the old value.  If a subsequent
reinitialization happens, bnxt_reserve_rings() may see that
bp->total_irqs does not match a new irqs_required.  It will then
try to adjust if dynamic MSI-X is supported and call
bnxt_change_msix().  It will then crash when dereferencing the NULL
bp->irq_tbl.

Fix it by clearing bp->total_irqs when freeing bp->irq_tbl.  Dynamic
MSI-X adjustments should only proceed if bp->irq_tbl is valid which
means that MSI-X has been initialized and can be adjusted.
bnxt_ulp_start() and bnxt_ulp_irq_restart() also need a similar check
before filling the ULP MSI-X entries.

Add a bp->irq_tbl_size to prevent OOB bp->irq_tbl[] array access in
case MSI-X capabilities change during re-init.  For dynamic MSI-X,
allocate the biggest bp->irq_tbl that is configured in the NVRAM
without clamping it with maximum CP/NQ rings to allow dynamic MSI-X
to grow to the max.

In the AER path, if MSI-X capabilities change, bnxt_reserve_rings()
will initialize MSI-X if BNXT_NEW_RM() is true.  Add a check in
bnxt_io_resume() to skip doing it again later.

Fixes: e68256c8a73c ("bnxt_en: Support dynamic MSIX")
Fixes: c2d20a3814d1 ("bnxt_en: delay pci_alloc_irq_vectors() in the AER path")
Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
v5:
Fix a Sashiko issue: possible NULL bp->irq_tble issue in bnxt_ulp_start().

v4:
Clear bp->total_irqs in bnxt_clear_int_mode() to fix a possible NULL
bp->irq_tbl issue reported by Sashiko and Gregory Price on patch #8.

https://lore.kernel.org/netdev/20261016064427.496944-2-michael.chan@broadcom.com/

v3:
Added an additional Fixes tag.

https://lore.kernel.org/netdev/20261012220827.340998-2-michael.chan@broadcom.com/

v2:
https://lore.kernel.org/netdev/20260928041712.3467803-2-michael.chan@broadcom.com/
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     | 19 +++++++++++++++----
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |  1 +
 drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c |  7 ++++++-
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e78cf7ad3cbc..0808911186c5 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11529,6 +11529,12 @@ static int bnxt_change_msix(struct bnxt *bp, int total)
 	struct msi_map map;
 	int i;
 
+	if (!bp->irq_tbl)
+		return 0;
+
+	if (total > bp->irq_tbl_size)
+		return bp->total_irqs;
+
 	/* add MSIX to the end if needed */
 	for (i = bp->total_irqs; i < total; i++) {
 		map = pci_msix_alloc_irq_at(bp->pdev, i, NULL);
@@ -11672,12 +11678,13 @@ static int bnxt_init_int_mode(struct bnxt *bp)
 
 	tbl_size = total_vecs;
 	if (pci_msix_can_alloc_dyn(bp->pdev))
-		tbl_size = max;
+		tbl_size = bp->max_irqs;
 	bp->irq_tbl = kzalloc_objs(*bp->irq_tbl, tbl_size);
 	if (!bp->irq_tbl) {
 		rc = -ENOMEM;
 		goto msix_setup_exit;
 	}
+	bp->irq_tbl_size = tbl_size;
 
 	for (i = 0; i < total_vecs; i++)
 		bp->irq_tbl[i].vector = pci_irq_vector(bp->pdev, i);
@@ -11700,6 +11707,8 @@ static int bnxt_init_int_mode(struct bnxt *bp)
 	netdev_err(bp->dev, "bnxt_init_int_mode err: %x\n", rc);
 	kfree(bp->irq_tbl);
 	bp->irq_tbl = NULL;
+	bp->total_irqs = 0;
+	bp->irq_tbl_size = 0;
 	pci_free_irq_vectors(bp->pdev);
 	return rc;
 }
@@ -11710,6 +11719,8 @@ static void bnxt_clear_int_mode(struct bnxt *bp)
 
 	kfree(bp->irq_tbl);
 	bp->irq_tbl = NULL;
+	bp->total_irqs = 0;
+	bp->irq_tbl_size = 0;
 }
 
 int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
@@ -11751,7 +11762,7 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
 
 	if (irq_re_init && BNXT_NEW_RM(bp) && irqs_required != bp->total_irqs) {
 		irq_change = true;
-		if (!pci_msix_can_alloc_dyn(bp->pdev)) {
+		if (!pci_msix_can_alloc_dyn(bp->pdev) || !bp->irq_tbl) {
 			bnxt_ulp_irq_stop(bp);
 			bnxt_clear_int_mode(bp);
 			irq_cleared = true;
@@ -15137,7 +15148,7 @@ int bnxt_check_rings(struct bnxt *bp, int tx, int rx, bool sh, int tcs,
 			hwr.cp += bnxt_get_ulp_msix_num(bp);
 			hwr.cp = min_t(int, hwr.cp, bnxt_get_max_func_irqs(bp));
 		}
-		if (hwr.cp > bp->total_irqs) {
+		if (bp->irq_tbl && hwr.cp > bp->total_irqs) {
 			int old_total = bp->total_irqs;
 			int total_msix = bnxt_change_msix(bp, hwr.cp);
 
@@ -17842,7 +17853,7 @@ static void bnxt_io_resume(struct pci_dev *pdev)
 			err = bnxt_open(netdev);
 		} else {
 			err = bnxt_reserve_rings(bp, true);
-			if (!err)
+			if (!err && !bp->irq_tbl)
 				err = bnxt_init_int_mode(bp);
 		}
 	}
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307..75428a585577 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2489,6 +2489,7 @@ struct bnxt {
 	 */
 	unsigned long		*ring_affinity_set;
 	int			max_irqs;
+	int			irq_tbl_size;
 	int			total_irqs;
 	int			ulp_num_msix_want;
 	u8			mac_addr[ETH_ALEN];
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c
index a515c368bac0..0c27a6ec69f7 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ulp.c
@@ -334,6 +334,11 @@ void bnxt_ulp_start(struct bnxt *bp)
 			goto clear_flag_continue;
 		}
 
+		if (edev->ulp_tbl->msix_requested && !bp->irq_tbl) {
+			/* Stay stopped if there are no vectors */
+			mutex_unlock(&edev->en_dev_lock);
+			continue;
+		}
 		if (edev->ulp_tbl->msix_requested)
 			bnxt_fill_msix_vecs(bp, edev->msix_entries);
 
@@ -396,7 +401,7 @@ void bnxt_ulp_irq_restart(struct bnxt *bp, int err)
 		if (!ops || !ops->ulp_irq_restart)
 			return;
 
-		if (!err) {
+		if (!err && bp->irq_tbl) {
 			ent = kzalloc_objs(*ent, ulp->msix_requested);
 			if (!ent)
 				return;
-- 
2.51.0

