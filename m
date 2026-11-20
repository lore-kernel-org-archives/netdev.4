Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138211;
	b=1HPQbvRQ53dCEPFIoVtSfjL6do3O/YOV1whGhBzJmM/0g1oxapCSCsLLhOUpE2dYFpZr
	 p/wGst75CuODKzH8asmUUPt03HBDRMngElFhlXbXNxm6Q5Qv7ESs7M5fTnRiiidtXiXxi
	 Tvp3nNcBo1Q7K8RUDVsWQpzQAQudTKl75M2dVsPNICzg0l8b+p/CN1cbiZJM3xfDyb3qN
	 352uzb5TrfnWL/bE4tUtoftAWEPvR7pjPeNMa4TAkJZrc5+OcktUogmYizaDs/7qYxtmo
	 LFVsPBf/rK9d7/bZx3hLmQ10Ucqtt/V/yIhsZv9AD3gTGvj/VO/eDHLsdNzemtsV86g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138211;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=DogjnX7odJq4nJPh28tR4uppaDz3yFM8sHDB/Ua/LW4=;
	b=S+ZOs1NonNQmlMPpFhW8EhFcmHlnFHSv1QyNLgE7doZ8dFTUWwI/62hsliQZnIPjUFi3
	 tk7XFdNGpD6RXhWR2S7Jrvjt4dMFQpIRmOmoJeRvBMdzqKubYf7YHe2X4xi0b/hsv/z6b
	 j3dj2avjOvZ1Ys/GsxUBJTWg4okg8kwnr3tC75/vcNY3e2gt9P1e23ww5K1k46/nwsOyo
	 F8TfOq9u2yFOHxKA4XktzdNlezQvIYq1IoOhWzBBiloHbPm+dyBSLbyrMJO0sFspAEDDB
	 aE32NsyDUjlnjPH6YpY+D6EGzlXeLcqxctSZdYQSJmURokpofH3SabmrVR35lwDzPKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JHYzlEYQ;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1DF606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D1DF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JHYzlEYQ
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso284447a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138210; x=1795743010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DogjnX7odJq4nJPh28tR4uppaDz3yFM8sHDB/Ua/LW4=;
        b=y8cKDrrWZnlvVJGFj7087Y9srECb1bwbKfB4ETg1ebLWCrGrxH5WXsIyeTCJZm3C8f
         /AZVasNOOki/hV9mfNISIqzKx/H4bi8xfY+KV4JUs0xhuExB8ClZhrPz7NZhN+tQbF31
         oCGsHUnKwyb4T6NU+w3aKp5X8zj6Lbr9mY8jzRaGcv+ggXO49aulmn7T8zZPKgjMsAxX
         lRF7pvjvnGGCkfJ5vTDu1Ttvf4tO7nQp+QzaKOVxUKFaolRXWz5RGEicjJ6enrnpPIbB
         hdEcs3v21K99ixvMNGtPuG7Q6pXTwj/Vxlrmd/0KYSyyl431rkYlhh+/+1FZUk3xkQ5W
         FWzA==
X-Gm-Message-State: APuU4Z+WABicxQseMBZMILQG0N9/We7a4q8MzY/lb5rNM7vaNTbWSJ7C
	HDFBRlJxz9wybkMh46FADAfgtLyDkUSrqP3+eKslfgNn3xYRlsbH+EllP6vzBCaaV+tFC3ylw9E
	4OWbb1ZHPqQVDKlowzZTmZpIrKQBj39Qb2xz9Z5dNxts7iwQav+5Ggu3srFEZl2721Q0QDo3aPr
	2kzITnxrBFJwicvdshGSv1zHCuDKbRkhNFUa7MK5dxyW2UlYsPg7vUBADejAG9dc3xxF0G5GdC+
	LRaTxJshbA=
X-Gm-Gg: AZFdTZdep5KpLoqUuCC3iPphRk5i6p6zHKXFz2ZfRt4womweGYibWUIO9vt8subxj4J
	jDwU7nVVe8mBWhz7IUVgBJdM00fSVbQ68pJcnq335j5f7AiSHxpDYFAijJTX3RQEI55hMBobO8/
	yO5Qv6wSkw35FN3S9mvDkafc9dpoYbtQqbutOhuIhB+Y29cNmcUpqpp2VxecwFh+0h1y3Z3wDZQ
	/zb7xnX6M/0QG6sGrUV8dMCb6TBzGpBQdwBq2dMbWt/NuPLpIkg3EYOChbLPrvZH00Wp9MTZX0D
	EVmq+uDBeq/hm6McjAjVI0K/rKDX8/f9ARGNZdAg/qxh+pO29PkG+2iG9dboV/WBb3328G04FJI
	+xTFvEOBoaxQi4wqLMVQiqJkDPi4oySLM8rRUWyh1R/FVNiICnBxNX6puP/8a3S7UDf6WBXqtUn
	6Ai7+1TUy0c70d5Ei4AiQbptbKC8rfLb6th09Eew==
X-Received: by 2002:a17:90b:3f43:b0:3ad:43c1:7d41 with SMTP id 98e67ed59e1d1-3b41c9080f2mr1039680a91.33.1795138209886;
        Thu, 19 Nov 2026 17:30:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm2066674a91.8.2026.11.19.17.30.08
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55ba5fccc4aso8812651cf.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138208; x=1795743008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DogjnX7odJq4nJPh28tR4uppaDz3yFM8sHDB/Ua/LW4=;
        b=JHYzlEYQaekJFARih9aNfOaDcfnFdVdNs+/2Lk3N14+mfrC6cVg1e+DdR47B6KIQ2C
         BYAoDCt5T3w33ewL7Mn4UXC8OxV6bSNOhn+rZSDZJTsacvoY5sfcKqlPPgg6Ik4ZV1GP
         o59ItF/GbmJZF9g48bxEqjN1lqZ4cA6fzKvrI=
X-Received: by 2002:ac8:5acd:0:b0:55d:48e2:1acc with SMTP id d75a77b69052e-55d76a2049emr30887391cf.35.1795138207690;
        Thu, 19 Nov 2026 17:30:07 -0800 (PST)
X-Received: by 2002:ac8:5acd:0:b0:55d:48e2:1acc with SMTP id d75a77b69052e-55d76a2049emr30887111cf.35.1795138207228;
        Thu, 19 Nov 2026 17:30:07 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:06 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v5 4/9] bnxt_en: Refactor IRQs required logic
Date: Thu, 19 Nov 2026 17:29:16 -0800
Message-ID: <20261120012921.2537903-5-michael.chan@broadcom.com>
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

Refactor the logic to determine the required IRQ vectors into a new
helper.  Later patches in the series will make additional use of the
helper.  There is no change in behavior.

Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 26 +++++++++++++----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 35dabc5adf04..f4eff048eea5 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11732,9 +11732,22 @@ static void bnxt_clear_int_mode(struct bnxt *bp)
 	bp->irq_tbl_size = 0;
 }
 
-int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
+static int bnxt_irqs_required(struct bnxt *bp)
 {
 	struct bnxt_en_dev *edev = bp->edev[BNXT_AUXDEV_RDMA];
+
+	if (BNXT_NEW_RM(bp) && !bnxt_ulp_registered(edev)) {
+		int ulp_msix = bnxt_get_avail_msix(bp, bp->ulp_num_msix_want);
+
+		if (ulp_msix > bp->ulp_num_msix_want)
+			ulp_msix = bp->ulp_num_msix_want;
+		return ulp_msix + bp->cp_nr_rings;
+	}
+	return bnxt_get_num_msix(bp);
+}
+
+int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
+{
 	bool irq_cleared = false;
 	bool irq_change = false;
 	int tcs = bp->num_tc;
@@ -11758,16 +11771,7 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
 		}
 		return 0;
 	}
-
-	if (BNXT_NEW_RM(bp) && !bnxt_ulp_registered(edev)) {
-		int ulp_msix = bnxt_get_avail_msix(bp, bp->ulp_num_msix_want);
-
-		if (ulp_msix > bp->ulp_num_msix_want)
-			ulp_msix = bp->ulp_num_msix_want;
-		irqs_required = ulp_msix + bp->cp_nr_rings;
-	} else {
-		irqs_required = bnxt_get_num_msix(bp);
-	}
+	irqs_required = bnxt_irqs_required(bp);
 
 	if (irq_re_init && BNXT_NEW_RM(bp) && irqs_required != bp->total_irqs) {
 		irq_change = true;
-- 
2.51.0

