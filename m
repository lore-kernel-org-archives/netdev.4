Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031770;
	b=kL3kJZJ+Avdw82/4KIZz9l24d7+CZuCScrenEOGJlBQAv/F823fqr5eLf2hTyYH45wDL
	 5L3sMjZjzRUzbKkLD2lJq22v5rZCJDqM2TLm4fTVRy0JJRvgBVBd9t6ylFnyOET0JEw5x
	 a2oIxE0+JIcluFfzaD2f+JnJDZfg1jYj/OT7fdfIjjxs53EmvpUBTzCVnX5dqyObZVstW
	 SbWR08jGpCnBJ2xp8WePds2D1V90wiaS4TfMhIwB/QptnfFwiDLVsLj54ixShWiVkkEC7
	 2ZNFk5Yt+P7RHHY1SaZOzsL0pNQhAdJja/dOrZccU87cFD2z5Tbp7ff9huEdiz/NZ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031770;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=Fe6NwmngpGFMvh00hUNwLYVq+WURZ5Qeqr57JlWT/9w=;
	b=OE7fW+u5n2B4ykOIeLXuoD3BH1ubnTiYVb5A5jjbEqk4MfSkWz+VHjDozpotMLjO4kvH
	 z75Z0rXjuNl97BTeUtNYkh1TR1TdBALgRQXZbcmKffB7Fb0esrU9t3UMRMLAFVe5oiopT
	 C88cNfIJaF0KCVhRbv+jVhunX+vhtI3ocU0gG3a131NXE6kp2PtthmtSairs+skxJvLei
	 0iv19Hq/dZk4ARjqawjMxl11hFhKH03wMEGqsPB9myE6f1c5ESz/WhKfDL4JkMdP5Ye/8
	 PeGc/POk+e8mp/7jGkQRtjInyuUMqwrcFVQMRVczJd9u2EyDIaq5UQ3JNuTntj8rsTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=EPXY0pMs;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE96606A33E;
	Wed, 18 Nov 2026 19:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFE96606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=EPXY0pMs
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75221A21D7;
	Wed, 18 Nov 2026 20:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795031767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fe6NwmngpGFMvh00hUNwLYVq+WURZ5Qeqr57JlWT/9w=;
	b=EPXY0pMsn7zHc/2CjglYLq8ukmt2LfHl5NHCtsa8+s+KxAfgacRt8czW2orVeabqBkUvCC
	VgNPMGmOXZHW1C/0RTHgcE0u+1ioHEp8M41q5h20RI+uyiGMrvCwMliIgoffGvPir4Zpyu
	Y5Migvphqx5y5TnmfS/zsyRv0v3mnvG+FHWAxxMk09wEjB//3Csp92GhvcuOrd5v+l7+HH
	Fw7lXMD/ryctDrfczzjsLMcrmZE+5/Bbgfkbb37+q9PFzwFs4Ka6lKr4Dq/I8eR5ympU2d
	OdwPoEloFJE10O85rqYljZvM+jGx8kfvU1lEWfsrZp2nDdLfHV5sFtcbXkNt6g==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 20:55:30 +0100
Subject: [PATCH net 1/4] net: bcmgenet: accumulate the DIM packet and byte
 counters
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
Message-Id: <20261118-nb-genet-dim-stats-net-v1-1-13b275f1e088@tipi-net.de>
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

net_dim() computes rates from the difference between two samples and
needs running totals, but bcmgenet_desc_rx() passes the counts of the
last poll. Adaptive coalescing then picks profiles from wrong rates.

On a CM4 at a steady 300 Mbit/s UDP, DIM changed profile about 1000
times in 20 s. With the fix it settles, and Rx interrupts drop from about
4500/s to 2240/s.

Accumulate the counters instead.

Fixes: 9f4ca05827a2 ("net: bcmgenet: Add support for adaptive RX coalescing")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 4d2be2a21ed1..70c6a6465c81 100644
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

