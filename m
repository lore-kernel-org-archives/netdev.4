Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214596;
	b=Ht707fTd0roY98eU5O5Po5TjWqCoH+q6yVi8WOLQThEPXVuP7NK2nwDCRLuppuPja16S
	 UfEcM23XHzuKDvQtJnfuStDGhrLl7XPejmwQp/08QvpZ6iw8bx1kkiasL1FHSt9wtq3Jy
	 J9Rxgf4fUBhopT2Vm+BYS+uC7dB4XhkjUmom4GfQlOhrL1yXygSAlufKn+NH3EeFLTYl/
	 bVNqUmSfvyCAshy6FnuBwgz3zA4j5cDjE/Y3+ElnPkAZ2l+Nh0T4HusjRzM1OiS6Acg5L
	 XfYD7UoK8fIqa8opu0eqMZkj1IUG0pYEELIDJd0/Og4YEYSy7CKhWvDXcG+XJsXAZAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214596;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=Y6B1qlUZWjZO+GSdjVFEgrQK8iWfGeM64GnIiZ+w6F4=;
	b=hlp4FHn+lXJ5HdrfZ4QVk/5DCQi0qKkgaV4tcs2katkafmD560ihcKpINmYZZrMReQbw
	 nxyIRCmV95MXOOQkxdO5jjJ2DMEwT2qYnymTC+2TyPZK95mIrle5Y6VkvzyvvusaqMtT0
	 OeHAzpEQenh5pTd7BgRpn8gaDXJvuiO3Qb9Yj3fb/ueriRBCkysVMlya/veV/+A1KdJYM
	 eOb02P0z1BOnZndQFKPH9ZY5uIrTkgKlb1eOBUkvKUqMFAZwf0UKFHGmNpgyFN9G92RJY
	 zWl0HyfZ9z2Sh4kfCNSUV6SQSX5SPD5l007u19ioqklC2EHcTL/RlXnKKcC7T5uY6ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=UyNVNUuV;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA5606A68A;
	Fri, 20 Nov 2026 22:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AA5606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=UyNVNUuV
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57E41A4C4E;
	Fri, 20 Nov 2026 23:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795214591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y6B1qlUZWjZO+GSdjVFEgrQK8iWfGeM64GnIiZ+w6F4=;
	b=UyNVNUuVleHIObwHZ462iMXCiQKfjXOhooFMHMPwnT+xEYWjjxIZfktq2CwoBdh2zesYvo
	owB/db4c4ZOWr3j3kanqJEJGbm6oKyqr9FIYCbVkGhqQsWzE2x7IwmAea+URHNQkpoElRD
	kHxc+GAy23cOkkxQ2i7h1qevuTX3K9C353/lcUIjTSNVHMbCFV3fMtrQdFzlmiKFZFUWLC
	JKoGZ7Kj0rr+m9P3ZNb6o7DbR0Od0IAgTJslVadeMjqKzhs4xXJmb8UbufpQjmBtxUQ8vm
	oxoxZWtRDDtVEaeEx59jhI4xErFOL9jIwSQzQtFmiwUqoo9C85pABGI4o00/Bw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 20 Nov 2026 23:42:38 +0100
Subject: [PATCH net v2 4/5] net: systemport: restart DIM from the default
 profile on start
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-nb-genet-dim-stats-net-v2-4-1a7cece7dd1a@tipi-net.de>
References: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
In-Reply-To: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Petri Gynther <pgynther@google.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

A close or suspend can cancel the pending profile work and leave DIM in
DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive coalescing
then stays stuck after the next open or resume. The poll also calls
net_dim() after napi_complete_done(), so it can queue new work after
napi_disable() has returned.

Run net_dim() before completing NAPI. Reset the DIM state on start and
begin from the default profile, which is what
bcm_sysport_init_rx_coalesce() programs.

Fixes: b6e0e875421e ("net: systemport: Implement adaptive interrupt coalescing")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index bc88a27da16b..29e608e7daaf 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -1012,18 +1012,19 @@ static int bcm_sysport_poll(struct napi_struct *napi, int budget)
 	else
 		rdma_writel(priv, priv->rx_c_index << 16, RDMA_CONS_INDEX);
 
-	if (work_done < budget) {
-		napi_complete_done(napi, work_done);
-		/* re-enable RX interrupts */
-		intrl2_0_mask_clear(priv, INTRL2_0_RDMA_MBDONE);
-	}
-
+	/* net_dim() can queue work, so run it while NAPI is still owned */
 	if (priv->dim.use_dim) {
 		dim_update_sample(priv->dim.event_ctr, priv->dim.packets,
 				  priv->dim.bytes, &dim_sample);
 		net_dim(&priv->dim.dim, &dim_sample);
 	}
 
+	if (work_done < budget) {
+		napi_complete_done(napi, work_done);
+		/* re-enable RX interrupts */
+		intrl2_0_mask_clear(priv, INTRL2_0_RDMA_MBDONE);
+	}
+
 	return work_done;
 }
 
@@ -1452,8 +1453,11 @@ static void bcm_sysport_init_dim(struct bcm_sysport_priv *priv,
 {
 	struct bcm_sysport_net_dim *dim = &priv->dim;
 
+	memset(&dim->dim, 0, sizeof(dim->dim));
 	INIT_WORK(&dim->dim.work, cb);
 	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
+	/* Match the profile bcm_sysport_init_rx_coalesce() programs */
+	dim->dim.profile_ix = NET_DIM_DEF_PROFILE_EQE;
 	dim->event_ctr = 0;
 	dim->packets = 0;
 	dim->bytes = 0;

-- 
2.53.0

