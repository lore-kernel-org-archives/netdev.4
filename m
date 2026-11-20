Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214600;
	b=0FU9PHhBZNOhHKuu87TMA9tbVxczuCONoYmNqI0JjHFKmPmETw1JzGmnue26bzy7dnbY
	 T5c+IjNzW1+stL3uVdtwRVPZFnigp6N/vGmBaDLliLVufRlkYZDDljz4zA5SqYvmYpYnb
	 uAmIUYm9t698pFFAWdkS6GbshbGl/P2LVKvAaAadWR3L7w8CzeY/f4Utza4WKAPUrKCRv
	 Zx5LVrbyE0/mekegbwBHt7NfwY2YI+aottlKIwH3Q5cWHda2prWpQNtElAbmRWFfZ/G07
	 m6112BzZslUkbYLXXARx48RYHB+Y2Y/gFP3PlbSw/+tF1I8CCKPE6d4K7+mu+rF/dmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214600;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=k7///D2GpwDVsxdaecpWEeDbjNHzOzf2WS/HKDmWM6o=;
	b=f1mekIJaSnScFun59Ot+XfmE7trP2JuHzPqBWwc9yj66wKXNmWy6miSsMASfvsSuVPa2
	 /vc370Ra4cOj91MqlHIbyRRfYHjh8NT+jRFYUmqRB/acnMaBRYFm1TAAFIAXRdbJIWKTp
	 hfNwI+2S1Sy1+suVkaaNNyiNx9EKAPZSYQgMDRMQL4vI3MLH7BjyA3tfvcdGEfZ4dR3l1
	 jD8w4gWTFEIaBDIMv8o8frNqmdM8RKPT/j5Zt8B/Y/KLiZ4mepG+ra7nzxE60tE2ijslY
	 9vqIM384bLq24PbxEGrtkpKvKJ94ohhsyEitGCjsmPRHXiw+wYVHuoiS7m5nT+q39Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ojnz9cUk;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2612606A690;
	Fri, 20 Nov 2026 22:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2612606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ojnz9cUk
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B1FBA4C35;
	Fri, 20 Nov 2026 23:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795214589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k7///D2GpwDVsxdaecpWEeDbjNHzOzf2WS/HKDmWM6o=;
	b=ojnz9cUk+nVbpninVIQT3Xy5i7W/KapsCZujeFo2hXAE9wKptf2Mo+mlv4RA8S4IuLEjws
	cZj7dtAZmmAUZpM/t8LQyfRSboAF4nsbl1OYCP5ctxEhZnyNKwfc5q6DgcAhlJ8CkP40OB
	tN5cJ02Ytq0pQ4JUiHgO9ZdbvQyKGTmplkGYgnjB3xDUqfLvxu8dbl+aE5xi8qvQNZFxgH
	qI9qfBuLE8LZo1rg53BK+zLmGjDtDYwNAXV0yPLw3L/zZarAXdcMNsnoQIdcIbhK4igxup
	dO4tdf0KGOxu2i/9GmAUpZbqefUTwyqzC7mKEMQ4qlY9T6apMqdUvSSlXvqLHA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 20 Nov 2026 23:42:36 +0100
Subject: [PATCH net v2 2/5] net: bcmgenet: accumulate the DIM packet and
 byte counters
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
Message-Id: <20261120-nb-genet-dim-stats-net-v2-2-1a7cece7dd1a@tipi-net.de>
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

net_dim() computes rates from the difference between two samples and
needs running totals, but bcmgenet_desc_rx() passes the counts of the
last poll. Adaptive coalescing then picks profiles from wrong rates.

On a CM4 at a steady 300 Mbit/s UDP, DIM changed profile about 1000
times in 20 s. With the fix it settles, and Rx interrupts drop from about
4500/s to 2240/s.

Accumulate the counters instead.

Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index f702916e7bfa..f9f38445568f 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2486,8 +2486,8 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 		bcmgenet_rdma_ring_writel(priv, ring->index, ring->c_index, RDMA_CONS_INDEX);
 	}
 
-	ring->dim.bytes = bytes_processed;
-	ring->dim.packets = rxpktprocessed;
+	ring->dim.bytes += bytes_processed;
+	ring->dim.packets += rxpktprocessed;
 
 	return rxpktprocessed;
 }

-- 
2.53.0

