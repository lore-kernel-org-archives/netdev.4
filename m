Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031771;
	b=w7eyMmJkJQ+DXOG7JCnJho230ND1hyPn6WXqteICuGacwKYYAU4Y5xcfil8Nu/LUQDna
	 duDLpPE3OiLb/hSK+57h0jbNp7yNaWysOn8yoUO8lQv2qK+72ShBda/baE81bjTlVCV2m
	 wQ0r9FG84X6K43D3EI9EwGY8NihsqhyWajGPtZj7VEFGRiSE1PHYQl0xXSZrCAEsYzZXu
	 v3BHu5SAP/AXAWK4bK492JJ8deJcezH2Tnz4QIqb+oppaCoTxIj5bl1c4JCH/b1eXIPw4
	 vO2ZDbJK7NpvrxdipM+FINNaANR5cCiad1ClMyMIPiLnPtmsjjztlsrnwK5iDyA+4EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031771;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=yOpjJnayY+MXiVhxxuaYASYK0OcqJoRCEArFDMmhwrQ=;
	b=sIusjvmDbMbVY0KHni7xkvst8ECxB/JV8ognDbsO6c/cT8GmjiFZd94+1SpGPgC+jnTV
	 wBcN/AU5CoYOFA9JODNtcfx9QYTutLKs41QRCRav+deg/bKDdJJtQPJzqLFYv22jsD9ga
	 SYmfyOsbbXhgwbTWtiKc45xxlkYk3YmuxqnyfVMPy/v6ATMzSmzVAzHpPqFkuwp7drLW8
	 uJrt6sv8PQ4uOdtOhSTEJjD1pHw8LsAgp8wBPXnwWOhOJ52a5bMKzdHTUPJ/dJbDawNwQ
	 ul6W57FaDJR5swuCveZ14Iv9ksifa1BlXwgEZmlZj8TBLcDuSNqSFTftaok4EfKVCWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=OC7g98i4;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF560A261D;
	Wed, 18 Nov 2026 19:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDF560A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=OC7g98i4
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D7F0A24BD;
	Wed, 18 Nov 2026 20:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795031769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yOpjJnayY+MXiVhxxuaYASYK0OcqJoRCEArFDMmhwrQ=;
	b=OC7g98i4lTGNmrn2zLWqkNOBEbitWvx/fKf8bpShaMBLMkNMiY388Gd/uQnbpL/ZS4diKi
	C7vTJ44e5MIhxyT8qK5AcKxdUo0aDwVvskxxqkwDvDwJcClAY66+gA4W4nIrNY5G7Tt1Oq
	HX0ieaCTj0mpQo18c4uJzvBSs1Hqn8MQzsBNzypBvnxmnGawkCWnQueKL27FA82gYPnrk1
	XH4LAxpBm0X0bs92qAkfLKEZZ3RPqchRsqhThuKCEUOLfJ9+YpDh4xR8PIPQokwKiQKhbK
	nM0WMpozhGjLFf034UZ7rKfU3PWOXOURjiBh9IKrYXvOh4jF/3orYt42K7udFQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 20:55:33 +0100
Subject: [PATCH net 4/4] net: systemport: accumulate the DIM packet and
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
Message-Id: <20261118-nb-genet-dim-stats-net-v1-4-13b275f1e088@tipi-net.de>
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
needs running totals, but bcm_sysport_desc_rx() passes the counts of the
last poll. Adaptive coalescing then picks profiles from wrong rates.

Accumulate the counters instead.

Fixes: b6e0e875421e ("net: systemport: Implement adaptive interrupt coalescing")
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index bc88a27da16b..d3041ad60698 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -844,8 +844,8 @@ static unsigned int bcm_sysport_desc_rx(struct bcm_sysport_priv *priv,
 			priv->rx_read_ptr = 0;
 	}
 
-	priv->dim.packets = processed;
-	priv->dim.bytes = processed_bytes;
+	priv->dim.packets += processed;
+	priv->dim.bytes += processed_bytes;
 
 	return processed;
 }

-- 
2.53.0

