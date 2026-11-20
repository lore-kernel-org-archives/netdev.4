Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138216;
	b=VhLQBpI1qWtl84TOWx5zpFt+1SFDeL5GEigfiCjwb94EWxJFCjRaZEhfSNEP4wn9sipN
	 bnyhln2RiER//bUyOgjhbYgKEL6IAUXdMRqnXjuB5W8bOjl119V6d9PL/MAgbaK/bPCPc
	 ZHUJemlJR01Brd9MQJLWl8zY7HBYFiWLOkQZ1RlPSW5bmutj5UpWlhygrvzSgU/bKQLD5
	 +rkgPA4BN7aKRuGAc+hS0RIN42WUQjGTXLmnuB9x5mUPdt9qWMeXt8sluP+sZbNaMKEwU
	 ypQ7nOTInN9cWxZLRRnHl0IvxuA1zMZJCAkHSVAwI09K1qvRe7N1PEj7h8Nn8+7crow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138216;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OAImEmFIN02B9BiPT30msRevqV01ZsliLakYdCG34B8=;
	b=MOPeu0tT+A7nK85DGM6hf/z3G1XW32EU7+tlDDD7vQU1KIsWOlm5IORdf/iF6SXBg1ng
	 wWMQj6Dnf39xoZA6gN5l7vmvpE0PVuOG7i/YLKWmEzxC8a0DwnzWbm265Dx+jaebcQw2o
	 Q3TMBv3TwoL3yFk/GAKPJGn+geDAZSJfHO35OR7CEfYMVl3Ey44n0Hsb8MKCmTTVdnPjQ
	 4h3A4MNVJ1azTJVEBY0F7eqc5FrPObfXpYdIllxs8I3+uCfJ7t7iOTRR9vkXI3ZbzgEAY
	 iuxoUxgYJZsu+9qp+ummEGQivH6BXUEk6pTMqmzvhwe21UUjpLhP2VueN/0Q50gMNjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BwERKJS3;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8BD606A331
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8BD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BwERKJS3
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso829325a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138215; x=1795743015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAImEmFIN02B9BiPT30msRevqV01ZsliLakYdCG34B8=;
        b=ww5QM8Er960tuWZgSkZFolSTXkSVlUaPwoA1rqR7XzYWaQhf7L0H7cNp6s/+4dEnN1
         jE4Apz3PrTCntBAEyONJkAcd3XPVJCxDaHGPt6fXU3J18J0aR5Wjbz79OnvZFxgeKXnH
         JvTyPXOm33trU7/L5MLjj4FvVOGaagYmNHU3XML9h1GeqxSCmfmieuSWAa9kgv4MpV7j
         Wyg+xD+8AEUDh80Hi0mYBpxXiE2mcW91ISzOfadvBccGtbsEloroBrekpL810SCoAhJI
         HiNSVBgcBnZB4iuTXRGK068UMA6LDtgEmKJTN4q5bhbyB7eBoxqiSfJHVNDDRoGTtqSG
         voRQ==
X-Gm-Message-State: APuU4Z+Uz/pNCuyWTFtFvLkPbMrYyfMUUgtldrjNlGtX3owLKZsUBXTs
	qRtXnL1oACpIgmyc4PAYJwrUAlE6oNS3Qd+bueeoqv//Mt48LSZ8AyxFlIzHzRD6b9nP1OWcbP2
	7Jx0ukGpR6pWmMiW8L5SBQl4wzGgWK46kjioJbQvvi1vBwMczMcIwQLfUqSTjKY1fD7afn5pTBw
	1RQ5R4+vNS9c7696MN6uJLZXPDo55nkORdJus8TZQxsyw9/GYjX9QH3ybJ6Yv3kaK5s3evdexHR
	glWu/4EG4k=
X-Gm-Gg: AZFdTZcvSdWFmZKXScY36rFFN5O0ixFUvJ7+CrInyzkz2M/qLF+BbHZeyEP0Cg0nbzf
	Aq+uAgod5F2RksIN2Suz44Vd0Zq9EnP92XK/weYI0v9INL0uzQ3IemZ6DfAlrhb5PMwQIXiWfe5
	3saqIWx4sIUhOw0wlD0N7K0CLazNFxZk+dM/WXa30Enxzxk388OItsb06eAaSh8geA/PSX49ARW
	3WPSZ/RmKegwnjM8AeyGx6c81Km6lk0Ko+D39TfwOwngnMST1xcqr0Z4xszSugAeVeHDov44kF/
	Itv9NtZXBIGdJammF6n0G46hzbtHX6ZD5auD2RCC7fL3bokY9rI+Bllk0lqdYt/u5w+bJfu9bsQ
	6IU856AvrVhcpERWgQofm/n4mgJNH3yw9pEXVL98pmKhyol1+2i+6i5yf1h712raYUXCKX6YgZX
	QezB6pj3NPByepEDH0hyzdH+jBC3ziL1xVgPzUvA==
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b41c93fac6mr810791a91.30.1795138215066;
        Thu, 19 Nov 2026 17:30:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm1610005a91.1.2026.11.19.17.30.14
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 17:30:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92125693bc6so6943096d6.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795138214; x=1795743014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAImEmFIN02B9BiPT30msRevqV01ZsliLakYdCG34B8=;
        b=BwERKJS3lJdxPyuengrnPqDCTYWXjNN2lbYeaWNUL1ibVvycDVy4k8AigKhIyWlVBd
         X6ZU4RBeozOAWAbUrIWB9CJN8+FPTjVkChkI7REAzmDomq+gU/TH/Ix/DjuwP3rABS/f
         4+QFUuIeqeNuTXuatUI2dOUON8YZN2aBuFiNA=
X-Received: by 2002:a05:6214:248a:b0:91f:b9a:4569 with SMTP id 6a1803df08f44-9212e10f7d0mr43292596d6.30.1795138213233;
        Thu, 19 Nov 2026 17:30:13 -0800 (PST)
X-Received: by 2002:a05:6214:248a:b0:91f:b9a:4569 with SMTP id 6a1803df08f44-9212e10f7d0mr43291976d6.30.1795138212460;
        Thu, 19 Nov 2026 17:30:12 -0800 (PST)
Received: from lvnvda3289.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm12806616d6.12.2026.11.19.17.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:30:12 -0800 (PST)
From: Michael Chan <michael.chan@broadcom.com>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	pavan.chebbi@broadcom.com,
	andrew.gospodarek@broadcom.com
Subject: [PATCH net-next v5 7/9] bnxt_en: Refactor bnxt_num_cp_to_tx()/bnxt_num_tx_to_cp() helpers
Date: Thu, 19 Nov 2026 17:29:19 -0800
Message-ID: <20261120012921.2537903-8-michael.chan@broadcom.com>
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

Add 2 parameters tx_xdp and rx to these 2 helpers.  tx_xdp will be
passed in by the caller instead of always using bp->tx_nr_rings_xdp.
All current callers will pass in bp->tx_nr_rings_xdp so there is no
change in behavior.  The rx parameter is unused until the next patch
to clamp the XDP rings.  The callers now pass in the correct rx
value for this purpose.

To be consistent in bnxt_num_cp_to_tx(), tcs is now correctly set to 1
when bp->num_tc is 0.

Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
Signed-off-by: Michael Chan <michael.chan@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 +++++++++++------------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index b49e02fcde29..d76227d29282 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -8180,7 +8180,7 @@ static int __bnxt_reserve_rings(struct bnxt *bp)
 	rc = bnxt_trim_rings(bp, &rx_rings, &hwr.tx, hwr.cp, sh);
 	if (bp->flags & BNXT_FLAG_AGG_RINGS)
 		hwr.rx = rx_rings << 1;
-	tx_cp = bnxt_num_tx_to_cp(bp, hwr.tx);
+	tx_cp = bnxt_num_tx_to_cp(bp, hwr.tx, bp->tx_nr_rings_xdp, rx_rings);
 	hwr.cp = sh ? max_t(int, tx_cp, rx_rings) : tx_cp + rx_rings;
 	if (hwr.tx != bp->tx_nr_rings) {
 		netdev_warn(bp->dev,
@@ -11313,27 +11313,24 @@ static int __bnxt_num_tx_to_cp(struct bnxt *bp, int tx, int tx_sets, int tx_xdp)
 	return (tx - tx_xdp) / tx_sets + tx_xdp;
 }
 
-int bnxt_num_tx_to_cp(struct bnxt *bp, int tx)
+int bnxt_num_tx_to_cp(struct bnxt *bp, int tx, int tx_xdp, int rx)
 {
-	int tcs = bp->num_tc;
+	int tcs = bp->num_tc ? bp->num_tc : 1;
 
-	if (!tcs)
-		tcs = 1;
-	return __bnxt_num_tx_to_cp(bp, tx, tcs, bp->tx_nr_rings_xdp);
+	return __bnxt_num_tx_to_cp(bp, tx, tcs, tx_xdp);
 }
 
-static int bnxt_num_cp_to_tx(struct bnxt *bp, int tx_cp)
+static int bnxt_num_cp_to_tx(struct bnxt *bp, int tx_cp, int tx_xdp, int rx)
 {
-	int tcs = bp->num_tc;
+	int tcs = bp->num_tc ? bp->num_tc : 1;
 
-	return (tx_cp - bp->tx_nr_rings_xdp) * tcs +
-	       bp->tx_nr_rings_xdp;
+	return (tx_cp - tx_xdp) * tcs + tx_xdp;
 }
 
 static int bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
 			   bool sh)
 {
-	int tx_cp = bnxt_num_tx_to_cp(bp, *tx);
+	int tx_cp = bnxt_num_tx_to_cp(bp, *tx, bp->tx_nr_rings_xdp, *rx);
 
 	if (tx_cp != *tx) {
 		int tx_saved = tx_cp, rc;
@@ -11342,7 +11339,8 @@ static int bnxt_trim_rings(struct bnxt *bp, int *rx, int *tx, int max,
 		if (rc)
 			return rc;
 		if (tx_cp != tx_saved)
-			*tx = bnxt_num_cp_to_tx(bp, tx_cp);
+			*tx = bnxt_num_cp_to_tx(bp, tx_cp, bp->tx_nr_rings_xdp,
+						*rx);
 		return 0;
 	}
 	return __bnxt_trim_rings(bp, rx, tx, max, sh);
@@ -11556,7 +11554,8 @@ static int bnxt_init_int_mode(struct bnxt *bp)
 	if (rc)
 		goto msix_setup_exit;
 
-	tx_cp = bnxt_num_tx_to_cp(bp, bp->tx_nr_rings);
+	tx_cp = bnxt_num_tx_to_cp(bp, bp->tx_nr_rings, bp->tx_nr_rings_xdp,
+				  bp->rx_nr_rings);
 	bp->cp_nr_rings = (min == 1) ?
 			  max_t(int, tx_cp, bp->rx_nr_rings) :
 			  tx_cp + bp->rx_nr_rings;
@@ -15716,7 +15715,8 @@ static int bnxt_change_mtu(struct net_device *dev, int new_mtu)
 
 void bnxt_set_cp_rings(struct bnxt *bp, bool sh)
 {
-	int tx_cp = bnxt_num_tx_to_cp(bp, bp->tx_nr_rings);
+	int tx_cp = bnxt_num_tx_to_cp(bp, bp->tx_nr_rings, bp->tx_nr_rings_xdp,
+				      bp->rx_nr_rings);
 
 	bp->cp_nr_rings = sh ? max_t(int, tx_cp, bp->rx_nr_rings) :
 			       tx_cp + bp->rx_nr_rings;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 51a269d06c49..5ca98394a9ab 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -3003,7 +3003,7 @@ int bnxt_hwrm_set_coal(struct bnxt *);
 size_t bnxt_copy_ctx_mem(struct bnxt *bp, struct bnxt_ctx_mem_type *ctxm,
 			 void *buf, size_t offset);
 void bnxt_free_ctx_mem(struct bnxt *bp, bool force);
-int bnxt_num_tx_to_cp(struct bnxt *bp, int tx);
+int bnxt_num_tx_to_cp(struct bnxt *bp, int tx, int tx_xdp, int rx);
 unsigned int bnxt_get_max_func_stat_ctxs(struct bnxt *bp);
 unsigned int bnxt_get_avail_stat_ctxs_for_en(struct bnxt *bp);
 unsigned int bnxt_get_max_func_cp_rings(struct bnxt *bp);
-- 
2.51.0

