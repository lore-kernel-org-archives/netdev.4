Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138209;
	b=w+3mF5CJuS1hDPE9TLk5nc+tQg7RCdI7JmjRPwYECYvPABkKvl5Jvrst+wesLSRSpyNd
	 0hcmrmJtkgccP8LEUJ0Nj54NKBHfcSzmTj0pzaxMdC6LXV+w8ZFirj7zLdgCBOM0l2TWz
	 GyZYPGw4yNtVnMMwohhdSy1GrqjluIkYol5szT+0c6YQARqrxbz2appnRTjZYZxfGKTQh
	 oVCiy1WYvOxnQRG9YiOI20rELAYxKEtUU9ayjcjNmLsjeQDL5FR82Pk4lUysySVeUsRIO
	 UGBlw8fGBdZOwgjcNTRvg+IWSbCIvz8xOBfSg1jJW0DQj8LmGiDCaGnR8AMtz+J4SnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138209;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qpGjoGiGHZjXwyuxwXmO4RBEm/0xUAOupxp6VVj4N4c=;
	b=cgFzKIwz6oi4UpKvzTKFnmBsET2mjfiBRmf6QLGRtH5vtIpPC4rfPZDMIxbw/An8jKZr
	 uUdr9lngCOlP0aPTk44XBKdxcIQQ+iWqEUc1ArM4H7YzI7dCBSLREAlukaR0G0xpyFTkV
	 28YREFMACMK8UcJ6W1SDXJoZ/BAKHnIzCjV2aMWb8UnKmr+tpOQHhfS+ApaTSj1PkZ9XP
	 q448jBYABHjZUuweMKmbA/RXVZgcCGxrsYf0EjKjnkx1+/6cYCn9cp7p7dI/ohKsxoT4w
	 MmNrwS/KdcvzaZu8+Hvrq3ebsqAtHCGciHRwQHqlYQHfaoJXD7tYjiGOmWved6Fz1Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bsf6IF2J;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C0606A33A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B6C0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bsf6IF2J
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so207147a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138207; x=1795743007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpGjoGiGHZjXwyuxwXmO4RBEm/0xUAOupxp6VVj4N4c=;
        b=sUk5VRzppoI6Clj+LKkoE7F2/hJi5TDr7Qb/LXKJ7SEzk4IPorqNJF3NyJGUL2uj56
         HyDaoMnjvGqlDd8fSjjAxxjdj/eid4+EiXl25op8P8/06u1sW9Wcsc4vIqQBIfDBvnJ4
         t+WZ+72FeTBadC/k3oABro0VJRoTCHJvDvcIvXP1soeuZrPVnwH0UG4PIoy1m7R3goqh
         9IWas2ZMgQyz0BjgXVvsLVUt8j3yvrcP7rUQhTyKeRweodFMbGALozOMoCrKVMouPsX1
         X1lnVIV68081/0uklDPg6hL76zeXvx6QdNB9Rj56b6D897b5OCKkBgm8svHN49HdfV5i
         hU6A==
X-Gm-Message-State: APuU4Z8Ssn+EiI8Ot3JsLBR0/pbnlFtjbFSll6PK913mEJ3wznd8TWei
	if9JRlA53uN5GEe1QBP1HO9P9z4fBX8INME9ki3CLk2wcbkNiIcc8ZorQYkwcaj+nK9K3GBxVd7
	2ofZ+ffUfFsMNbWtre455MqRYIn/thqsttGCFv0HxZ5YY+JKsvTosDtPH23MEGRZLFdBV91fbbJ
	5Icv5hcZ8TTfK5R+5awlOocO5wodayV8VCFp9fG+wmX5nqP3R6VBb+K4oysP1+VpKEVY2Nh9dak
	tQ57SDt9cw=
X-Gm-Gg: AZFdTZd+4OAkgHtQvnHBLOoSlRdw65tcUZRxoLJqarl93U6qxFGIMnt7MHs7y4RkVDP
	fLlP+yd0q4WjAf0d/1tG9ukCrIFTljBykdIcznkeFUyBVzmmADDpd96dpdYGsEwotdFJj8xdNIa
	nT5+Zxi9o3G3z4vatKUPoHCN5hXfXwzsGOL2xabeBatsDE7c+fm5513JrGlbg5hzf3V8vlQpvEt
	dBQK4NZxH7ltjunNfyHqL+/1GYs3dq2IQcfHQ/ZCE6QFhjRtBU0CmRqz29vZ5hIQnEeAgd5AMM7
	e6FxE4ubr1u9m6hrtLJyVsH0KsL6+Gb5pKb29lHf4aif+cvI7sE8pUywFLKHZfpEknw1zCKoWxx
	v5P3wU0rdo7GgD0rOU0isuFkVyy6ryR9pGcxyKMhiQJ5NgKc1i1iAs3euuMxn5JSEiagkKNjuo6
	++ywAKSKoK1p+uXlT4OXgBZuWNySuDYzJxF7hapw==
X-Received: by 2002:a17:90b:2701:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b41c7d5cbbmr993098a91.6.1795138207533;
        Thu, 19 Nov 2026 17:30:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b420017844sm210886a91.3.2026.11.19.17.30.07
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92137a721c7so2980186d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138206; x=1795743006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpGjoGiGHZjXwyuxwXmO4RBEm/0xUAOupxp6VVj4N4c=;
        b=bsf6IF2JB81pySRnxBd4le7/F9ZAfOTDELqwxmZHeuhbnWg9UPtNzAN9qTZALtr8+K
         M4TvKiYcDz03JeFWGRQ/6H0XdijEhC8aTMGyxFI4Tgtmz/OA7//7cTxTab1gAJxxi0uE
         pQB5BbwIYCVcankFBWu85IwcaaR8oQ+TmNsqU=
X-Received: by 2002:a05:6214:85c4:10b0:91e:c720:170b with SMTP id 6a1803df08f44-92134abf930mr20526196d6.32.1795138205903;
        Thu, 19 Nov 2026 17:30:05 -0800 (PST)
X-Received: by 2002:a05:6214:85c4:10b0:91e:c720:170b with SMTP id 6a1803df08f44-92134abf930mr20525916d6.32.1795138205458;
        Thu, 19 Nov 2026 17:30:05 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:04 -0800 (PST)
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
Subject: [PATCH net-next v5 3/9] bnxt_en: Refactor RSS table check logic
Date: Thu, 19 Nov 2026 17:29:15 -0800
Message-ID: <20261120012921.2537903-4-michael.chan@broadcom.com>
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

We have logic to see if we need to reset the user configured RSS
table for the default RSS context if the RX rings have changed
in __bnxt_reserve_rings().  Refactor this code into a helper that
will be used by other callers later in the patch series.  There is
no change in behavior.

Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 95a2227e45cc..35dabc5adf04 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -8187,6 +8187,20 @@ static bool bnxt_rings_ok(struct bnxt *bp, struct bnxt_hw_rings *hwr)
 	       hwr->stat && (hwr->cp_p5 || !(bp->flags & BNXT_FLAG_CHIP_P5_PLUS));
 }
 
+/* Check to see if we need to reset the user configured RSS table
+ * (default RSS context) because of change in RX rings from
+ * old_rx to new_rx.
+ */
+static void bnxt_check_rss_tbl_lost(struct bnxt *bp, int old_rx, int new_rx)
+{
+	if (netif_is_rxfh_configured(bp->dev) &&
+	    (bnxt_get_nr_rss_ctxs(bp, old_rx) !=
+	     bnxt_get_nr_rss_ctxs(bp, new_rx) ||
+	     bnxt_get_max_rss_ring(bp) >= new_rx)) {
+		ethtool_rxfh_indir_lost(bp->dev);
+	}
+}
+
 static int bnxt_get_avail_msix(struct bnxt *bp, int num);
 
 static int __bnxt_reserve_rings(struct bnxt *bp)
@@ -8276,12 +8290,7 @@ static int __bnxt_reserve_rings(struct bnxt *bp)
 	if (rx_rings != bp->rx_nr_rings) {
 		netdev_warn(bp->dev, "Able to reserve only %d out of %d requested RX rings\n",
 			    rx_rings, bp->rx_nr_rings);
-		if (netif_is_rxfh_configured(bp->dev) &&
-		    (bnxt_get_nr_rss_ctxs(bp, bp->rx_nr_rings) !=
-		     bnxt_get_nr_rss_ctxs(bp, rx_rings) ||
-		     bnxt_get_max_rss_ring(bp) >= rx_rings)) {
-			ethtool_rxfh_indir_lost(bp->dev);
-		}
+		bnxt_check_rss_tbl_lost(bp, bp->rx_nr_rings, rx_rings);
 	}
 	bp->rx_nr_rings = rx_rings;
 	bp->cp_nr_rings = hwr.cp;
-- 
2.51.0

