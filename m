Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146409;
	b=PLYuByJAunAkqpT8mh2akMXDDYcxPJpJMA41YYoIKHFEiOcn8AlzLb5P2Y2DWLdJoy67
	 YOCZZ4ZhTjOszvv51dpaqHhYKXfNJOY3OMZZXnCK0hEOJo3WNjC5Q8AgoGV6esQRiidAx
	 JERf9+llTOCwOYceEFBydMwdFLD5wKQw29j4SzIDW43ZRp5iqCrPlJWO2xyPETAkU0pQr
	 pWM6SGqC8cKLPPKtA4g9y4tApFbKSEnc1DXpygtiAy0/kZFrjgEUZnXMza8YCOzIG6AJx
	 zWQ6PhF+4Yjs2MGHCKvbqEq99JW1/vCLDYk92i/V5pgy8rfXqxaHEZxj4x8p7G+dJ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146409;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yBQPzg9edxnMpJSLZh/uydY0GUKz1UORhRy3AN4M/bI=;
	b=JA7ROpTZqHbHwpm9+31/i0W7KndXcIq2Z9A8UyXoDqxmCNZYnbReIGDR31piUvQCBSr0
	 Kt2ASO/pIB7WGmpo/qim0Z8jwC4+kKk/t2s6DnHfRaGDT0QBtW3oCNgn1ZcdT4gYHerGZ
	 oTy3PElOQxsVMK2qHgb0gZRTyVMzI4qXDTShq4Tod8xow49Lt1i56vVJgywkg1JRTQlVn
	 duqFdvcgQl+VeSiVeKO8AeHRbaRmZOSzVWkiAyrs5CbTIhNrX175KEdG1h9yiW2+oVWy6
	 VlEWYe31Iy0pBCGAbK10ijXmli4VWUFqn5jprayoIXpYlwSe/RLEyVRSDbwm6sJc5tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2rDShms;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F041D606A332
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d2rDShms
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241471F000C6;
	Fri, 20 Nov 2026 03:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146408;
	bh=yBQPzg9edxnMpJSLZh/uydY0GUKz1UORhRy3AN4M/bI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d2rDShmsznJ7CUYJjks5gYyusNongRpYBXVDFEWfXkTfRbfHZoUpBbwecCyu8fOSa
	 SpSUVfW/UYCnXO9eHdt+IyLeK/Fndo4HAJrG0aS0d4MLeV+WN9UeUBvRdnLvy/+pC0
	 TvlUsh+hYyN/nl4k6YcRcp5brsznuai8BTfX7teu2gV2GC7St4nbKRZ4KBD7+izNOH
	 Cr5EuvlcDb/f3rJ4pjWuX9jtkbo9KiwI9419EhjNcbKzckljJ9hf6OKWkuBq1IT1cc
	 YWwcac7A7tle9RQ6EzIYinqGrYbJJR0YledTaguEPHOUEfJSgZMj07WJWUYPx4jorn
	 aEEywYRWwy14A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	somnath.kotur@broadcom.com,
	ajit.khaparde@broadcom.com,
	michal.swiatkowski@linux.intel.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 2/2] eth: bnxt_en: restore Tx coalescing after re-allocating the completion ring
Date: Thu, 19 Nov 2026 19:46:45 -0800
Message-ID: <20261120034645.364630-2-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120034645.364630-1-kuba@kernel.org>
References: <20261120034645.364630-1-kuba@kernel.org>
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

With TPH enabled, queue restart also frees and re-allocates the Tx
completion rings which share the NAPI instance with the Rx queue.
Same as on the Rx side, the new FW rings start with default interrupt
coalescing parameters, and the configured settings are applied again
only at the next open or ethtool change.

On P5+ chips the Tx completion rings are separate from the Rx ones
even in combined channels, and the Tx settings do take effect. On a
BCM57508 the completion latency of sparse Tx traffic follows
tx-usecs, it's ~20us with tx-usecs 1 and ~220us with tx-usecs 200.

Re-program Tx coalescing of each completion ring after allocating it.
DIM only manages Rx, the static settings always apply to Tx.

Fixes: fe96d717d38e ("bnxt_en: Extend queue stop/start for TX rings")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 25d7c4cc3377..52606db3f7b4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -8637,6 +8637,24 @@ static int bnxt_hwrm_set_rx_ring_coal(struct bnxt *bp, struct bnxt_napi *bnapi)
 	return bnxt_hwrm_set_rx_coal(bp, bnapi, req);
 }
 
+/* Program Tx coalescing of the completion ring of a single Tx ring, e.g.
+ * after it was re-allocated in the FW.
+ */
+static int bnxt_hwrm_set_tx_ring_coal(struct bnxt *bp,
+				      struct bnxt_tx_ring_info *txr)
+{
+	struct hwrm_ring_cmpl_ring_cfg_aggint_params_input *req;
+	int rc;
+
+	rc = hwrm_req_init(bp, req, HWRM_RING_CMPL_RING_CFG_AGGINT_PARAMS);
+	if (rc)
+		return rc;
+
+	bnxt_hwrm_set_coal_params(bp, &bp->tx_coal, req);
+	req->ring_id = cpu_to_le16(bnxt_cp_ring_for_tx(bp, txr));
+	return hwrm_req_send(bp, req);
+}
+
 static void bnxt_hwrm_stat_ctx_free(struct bnxt *bp)
 {
 	struct hwrm_stat_ctx_clr_stats_input *req0 = NULL;
@@ -11857,6 +11875,11 @@ static int bnxt_tx_queue_start(struct bnxt *bp, int idx)
 		if (rc)
 			return rc;
 
+		rc = bnxt_hwrm_set_tx_ring_coal(bp, txr);
+		if (rc)
+			netdev_warn(bp->dev, "HWRM set coalescing failure rc: %d\n",
+				    rc);
+
 		rc = bnxt_hwrm_tx_ring_alloc(bp, txr, false);
 		if (rc)
 			return rc;
-- 
2.56.1

