Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031770;
	b=n/KcVEDi6OI6baI4rmpcRy1kWLdbfvnn6kYv3f3EI6wWMjg7XDR5yGHR9wZw+wbc0n2X
	 5dawtawTrmKWLb7Da2ZbRPpy8EsPctRf9nILfi9MYf6ge180zStwkMETuT70L7rVpA2vP
	 /bO/iDn6bOJX99yHa+Mzy05RtompNR9GKxgBi7/lHokRNNrokOGF46LhN3w/l9jxRYYOe
	 UQhI+vLXg8o15TQHwaewzj1KHYDWl64bhKS1jzZVj7NbucnB6Os1rJ0eIixBZUjUlZsJy
	 5HBbHyiux8gL4cLegz5hnMK6h+jkp8KZWKvUct2Kq8ihX2OVRpsRAD2obidDJ1J6xWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031770;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=PQA+eM2ZmuP8sZzf49+j1vbkc1r7w3BDX+sdyod5IDQ=;
	b=J+ufOQaHhwdwHVdfQFK2AkfauC6dGO0gY0JzbF2SmS5W8QlY9RpmqcnftLOHIKWD96eS
	 jhZwTGq6Hv8mk340yOH9bOxPpKfIt1r2EbJhUMQt9n4mJRv62Jd7yK1CH21e7JBxeQBmj
	 XLcoUV/QsI9FyoxAsc1g3yf6WTbcoky01wAwMs3QOl8IpaTFygv6+olZ6UdXezS3keSD3
	 7BoZYPv1D7wVBhjtbSbpOFUuiSUldI7yBFIApfMfQPTnnsMY7cfXgOCd5E9h1By4TNfuK
	 9Omxg+Z1C85mExfyQFT/RbJhNGnoeqHsxO6ByM1gwXROMf/4eQQQid/eeoxUnepwn1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Vj9J7p2l;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3084606A333;
	Wed, 18 Nov 2026 19:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3084606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Vj9J7p2l
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1C81A2320;
	Wed, 18 Nov 2026 20:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795031768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PQA+eM2ZmuP8sZzf49+j1vbkc1r7w3BDX+sdyod5IDQ=;
	b=Vj9J7p2lvAcVOjdQXav1RIqtuR9IHNDI2+1WkPeu3joy3UiPXJt8/Ei8y9BLfJkGa8rA9T
	llmGUXdTcWDwgKLLpbEMMsSjIXJTYp9ioPtp8UuXBWgnZOcjBJGCxa9oHr/bx8ppHj89yE
	scWAg6Xgjtcp5NkUpJ122YGaqzCUsgVihL6KWY4L/T/6TPLvbrL7hwyOCajH8MBIUKOjdc
	mf1kdMNVfTsXzGcDDV6KY8NJ/ZApW+2ihVplPxLWO8OcJ5AdwNyxUliugW3fXGuvaXu8cm
	xtzedm7503upPQ5GxP+me5B3KfzPs3CbOQBQFcJiyZgmkOvIh8G7aPJ0n1gaWg==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 20:55:32 +0100
Subject: [PATCH net 3/4] net: bcmgenet: reset the Rx discard count with the
 ring
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
Message-Id: <20261118-nb-genet-dim-stats-net-v1-3-13b275f1e088@tipi-net.de>
References: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
In-Reply-To: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Petri Gynther <pgynther@google.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Ring init clears the hardware discard counter but not
ring->old_discards. Discards after an ifdown and ifup or a resume are
then missing from rx_missed. On a CM4, after an ifdown and ifup, 3666
discards showed up as 0 in rx_missed.

Reset old_discards together with the ring.

Fixes: d26ea6cc48da ("net: bcmgenet: collect Rx discarded packet count")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 96620d298677..69c6139d3b23 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2825,6 +2825,8 @@ static int bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
 	ring->read_ptr = start_ptr;
 	ring->cb_ptr = start_ptr;
 	ring->end_ptr = end_ptr - 1;
+	/* Zeroing RDMA_PROD_INDEX below also clears the discard counter */
+	ring->old_discards = 0;
 
 	ret = bcmgenet_rx_ring_create_pool(priv, ring);
 	if (ret)

-- 
2.53.0

