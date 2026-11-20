Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146408;
	b=ljydf7j5seRpEN3jYa176+LygF0+qdg5MvkZ6+7SM5FsHakAr8rwmkaQDu0PR/MK7EQ+
	 +E/RIvoueIZAAc8KzhSPySCdeNhhZmL9zoEN1z0UKq8q2FIkUPQRQfKtW67M/HKVnvLkd
	 YfvfL4JJYXeenFBWg5Y97o9ZpFndIfr4+hus08E5mayJPhvfIT6hpHBvyovXrfYq+8O1G
	 sP4I5CgWmP0499kAe7mzECOPdSJEIIaCXm85LHtrXTkLvarRHx33+uDWy2AJt23Iy/fsy
	 puT295oQKkVGOpvfYOsYuUp+g93wzMSNcJu7THDk0tVpGuZiU/v74j1csjlUn6I+WuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146408;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DKCxcb/gbR2hshH8HVcoRRDR6rYGtOYzXRda6jRpZ7Q=;
	b=j75BhgrxGlQNoL16ipeBf7frIulfWKlj5g0lQhWVYAPF9ima/GofPV82aZ8ZpZTB4ZPi
	 i3nxQ7G7TPaJ1jKCVHm6pa/RIB7JKaDK3veEuUtblBqamLzmLBU6Za2BnY0p9ndfwPtY4
	 moOIM4aoC/Z3OAFrYpm0nhcH9PD/QJa3vP/Iep3tY/0FULPiaz8ooJYdYlrxB7Mfr9cct
	 d+xJ30ijD3N9Fc4BC8MLwUxMO2Ogi/yAqK9nbj1nqI2gmlhPXwpTcNFuBj7qG7D28DzpA
	 grBQiO7KWTUpS3B3Njtfwd/UY2woVSXze8TFf7z/DGFMHooNPsb6MaMua07CE2IzKIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zv/931hK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24296606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv/931hK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A213B1F000C4;
	Fri, 20 Nov 2026 03:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146408;
	bh=DKCxcb/gbR2hshH8HVcoRRDR6rYGtOYzXRda6jRpZ7Q=;
	h=From:To:Cc:Subject:Date;
	b=Zv/931hKXonsGb4eC+zFt6y02oC8kN7ucRYKka4xR6bx73VFrcceq4CuYoNmv8jzP
	 iIyGAc3MsMO4ceIQdWIrzxTG8TSXbYuHs3sFsaVw+v7YqadWCeIsq2N2u+JVg2zPgC
	 bHPUv7lhIpcNKB9GEOhQq7Cw/o80QirpjtOkdryMjhF3G2Ql81qoJiyQuC4Kx0mqGU
	 m5Jzrma5jhwC/mmWIaiNBFc3c5oTNC6TfjGKX2ALhNB8qWTqg92v84mGPM841/mT1r
	 nuB/JV8aNIktBx9A5IXf8l9JO05IedzeCKCPYJLsQ5eoWjXU9TLgLVe+eB+Y+medaM
	 Wb/+ZkzN66RwA==
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
Subject: [PATCH net 1/2] eth: bnxt_en: restore Rx coalescing after re-allocating the completion ring
Date: Thu, 19 Nov 2026 19:46:44 -0800
Message-ID: <20261120034645.364630-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
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

With TPH enabled, queue restart frees and re-allocates the Rx
completion ring in the FW, to apply the new Steering Tag. The new
FW ring starts with default interrupt coalescing parameters. The
driver programs coalescing only at open, from ethtool and from DIM,
so after a restart the ring ignores the configured settings, while
ethtool keeps reporting them.

Re-program Rx coalescing of the ring after allocating it. Use DIM's
current profile if adaptive coalescing is enabled, the static
settings otherwise. The per-ring DIM values may be stale when DIM is
off, ethtool changes to static coalescing don't update them.

With rx-usecs 1000, re-allocating the ring on a BCM57508 lowers the
latency of a 1 byte ping-pong on that queue by ~250us. Latency goes
back up once ethtool re-programs coalescing.

Fixes: 6b6bf60fc95f ("bnxt_en: Reallocate RX completion ring for TPH support")
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index e78cf7ad3cbc..25d7c4cc3377 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -8618,6 +8618,25 @@ int bnxt_hwrm_set_coal(struct bnxt *bp)
 	return rc;
 }
 
+/* Program Rx coalescing of a single ring, e.g. after its completion ring
+ * was re-allocated in the FW, which resets the coalescing parameters.
+ */
+static int bnxt_hwrm_set_rx_ring_coal(struct bnxt *bp, struct bnxt_napi *bnapi)
+{
+	struct hwrm_ring_cmpl_ring_cfg_aggint_params_input *req;
+	int rc;
+
+	if (bp->flags & BNXT_FLAG_DIM)
+		return bnxt_hwrm_set_ring_coal(bp, bnapi);
+
+	rc = hwrm_req_init(bp, req, HWRM_RING_CMPL_RING_CFG_AGGINT_PARAMS);
+	if (rc)
+		return rc;
+
+	bnxt_hwrm_set_coal_params(bp, &bp->rx_coal, req);
+	return bnxt_hwrm_set_rx_coal(bp, bnapi, req);
+}
+
 static void bnxt_hwrm_stat_ctx_free(struct bnxt *bp)
 {
 	struct hwrm_stat_ctx_clr_stats_input *req0 = NULL;
@@ -16643,6 +16662,11 @@ static int bnxt_queue_start(struct net_device *dev,
 		rc = bnxt_hwrm_cp_ring_alloc_p5(bp, rxr->rx_cpr);
 		if (rc)
 			goto err_reset;
+
+		rc = bnxt_hwrm_set_rx_ring_coal(bp, bnapi);
+		if (rc)
+			netdev_warn(bp->dev, "HWRM set coalescing failure rc: %d\n",
+				    rc);
 	}
 
 	rc = bnxt_hwrm_rx_agg_ring_alloc(bp, rxr);
-- 
2.56.1

