Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214594;
	b=uOgyhTc2AGVhH8cjF33gAEGCmCRDg+ojUlvrEqH3nUPqJAbQ0s1bMpN3WYAPefxuO1WM
	 XhXSGnyia4ouccWIMDLn2nSkyHemiODRXRNiVflLow6H66GxW9W1W4TEEDpTENdQqhokX
	 m4pNCdUjrmVuyTjONEJAdnrq6O+A2pAB5ajZnQH+hjN/m2E2Q9qotRo+UAX+vxAlBReW4
	 clcpT7QZcXO6EcxGw0NtdMHKtn1DMyGR8na/HNmFQ5UfPpUwt7LzprxvGzXtjK6tE1ihx
	 W87Ru4EodGO1S1LIvibUy/KdOCdO5Fu3PBeAi/LOQjlcvmU8nj3iTxnR2xE2x0dpmqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214594;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=hn2bqEzOmfG5sa68D2kHFMqd1goW51V+KX1PGAnUV1E=;
	b=qiUJGfkwGXBt+XGFpZtWE9AYJf1WfKsbct6m3rAVzW29xfPILSJv3pB8mIFbddbpEITp
	 Y2BOm9uSbeWDOuPAYR6vkJycDyZ0rE7CipU2+qp6AaviGqF+muupIZ6Ls4PnH0mVGfsj8
	 LZTnhSMQQS7A2chzDNO61s4YTtICkziJZ/feJ2yKyETYTDeLAp0SdV6jKEZgc/sLqN9k/
	 DbM8XSapFn6PE//GBZik79Ez5b4nu2yiIO/8HYBTRTCJBI8GrPGO8U6qi2mIM4nI2RxGp
	 GVhryY26mPQDTaMbEFJeQgzlYysvucxUprWR5PvJP9ZPepQy2rCzZaQ4izJ37kTNnmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="BV7XLIo/";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6058606A332;
	Fri, 20 Nov 2026 22:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6058606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=BV7XLIo/
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8950DA4C30;
	Fri, 20 Nov 2026 23:43:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795214588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hn2bqEzOmfG5sa68D2kHFMqd1goW51V+KX1PGAnUV1E=;
	b=BV7XLIo//mjitl8UBTPpHyTtGPsJPHdQClNs075QDPIvK+iKqoh8yRQ3BozNwKiILQ2oxn
	ya1QjAweURilpqLje8fKAW7luXn1M0aBwyFB03B1GXCj1gSnrcxRz9FqJUPAxuG5pztyTi
	e3T5fx5cCQauYGoM8uqqAge8K6X8pY0u3HBjbuIGWjJ2VmianxufFGHDv+MzasYwAFLGOR
	5Nsx3eovEnlGwAZ86ofA7ADDGj56B6jC8FaReOlRIbSjwAEez6yx6e62v9CjItiyZcQJIH
	vcZdgOtQRzgDELgHhz0xaKhCo6l9SY6dlAW5U+QseOv9PoFEJlhVbRraFw5/kg==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 20 Nov 2026 23:42:35 +0100
Subject: [PATCH net v2 1/5] net: bcmgenet: keep DIM from getting stuck
 after close or suspend
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
Message-Id: <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
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

A close or WoL suspend cancels the pending profile work and can leave
DIM in DIM_APPLY_NEW_PROFILE, where net_dim() does nothing. Adaptive
coalescing then stays stuck after the next open or resume, and the
profile index no longer matches the hardware. The poll also calls
net_dim() after napi_complete_done(), so it can queue new work after
napi_disable() has returned.

Run net_dim() before completing NAPI and flush the work instead of
cancelling it, so the pending profile gets applied. Also reset the DIM
state on ring init and start from the default profile, which is what
bcmgenet_init_rx_coalesce() programs.

Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 4d2be2a21ed1..f702916e7bfa 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2502,15 +2502,16 @@ static int bcmgenet_rx_poll(struct napi_struct *napi, int budget)
 
 	work_done = bcmgenet_desc_rx(ring, budget);
 
-	if (work_done < budget && napi_complete_done(napi, work_done))
-		bcmgenet_rx_ring_int_enable(ring);
-
+	/* net_dim() can queue work, so run it while NAPI is still owned */
 	if (ring->dim.use_dim) {
 		dim_update_sample(ring->dim.event_ctr, ring->dim.packets,
 				  ring->dim.bytes, &dim_sample);
 		net_dim(&ring->dim.dim, &dim_sample);
 	}
 
+	if (work_done < budget && napi_complete_done(napi, work_done))
+		bcmgenet_rx_ring_int_enable(ring);
+
 	return work_done;
 }
 
@@ -2702,8 +2703,11 @@ static void bcmgenet_init_dim(struct bcmgenet_rx_ring *ring,
 {
 	struct bcmgenet_net_dim *dim = &ring->dim;
 
+	memset(&dim->dim, 0, sizeof(dim->dim));
 	INIT_WORK(&dim->dim.work, cb);
 	dim->dim.mode = DIM_CQ_PERIOD_MODE_START_FROM_EQE;
+	/* Match the profile bcmgenet_init_rx_coalesce() programs */
+	dim->dim.profile_ix = NET_DIM_DEF_PROFILE_EQE;
 	dim->event_ctr = 0;
 	dim->packets = 0;
 	dim->bytes = 0;
@@ -3014,7 +3018,8 @@ static void bcmgenet_disable_rx_napi(struct bcmgenet_priv *priv)
 	for (i = 0; i <= priv->hw_params->rx_queues; ++i) {
 		ring = &priv->rx_rings[i];
 		napi_disable(&ring->napi);
-		cancel_work_sync(&ring->dim.dim.work);
+		/* Cancelling would leave DIM stuck in DIM_APPLY_NEW_PROFILE */
+		flush_work(&ring->dim.dim.work);
 	}
 }
 

-- 
2.53.0

