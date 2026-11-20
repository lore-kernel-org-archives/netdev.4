Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214596;
	b=G6dAa5aG16Cz/A7cDgOHUm5RzuMociYkddSErUJ/bHqQOHg3mdEjTRZ2cC1nHSQsBKfW
	 ofzMsP4vvrFMWLvIFJnhYTwkWWMO4FOMNYI95p+866HaBBLDRiNeIgEWyem9jjFL4II2I
	 Yn89BBCsEuejyHvnt0EPhqHmYJscfw1sgUnNn4EXCndYvJ65BaluPNGnKOBAYqh+9TW0R
	 bEkw32KFLNwjuVPRG1WxcmNIZCd6v6uLJ9PG9rJuXx6RFt6BcSeir24ZXqi2RFEbJ7hIv
	 LU9efyh38iIVmtskLpppdvYa7pC8otXtS/F3mTR+lx50kHJoVMiezYsBxsX6HD1rivQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214596;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=beVIJzhO9G9mQP4NDpUbqUkjliEs+CDfS51LB2XvRJ0=;
	b=NPNuFUpQXdO17OrtYesFsgNRHV2H9z3hh1J2CDiXXw9mWKXYyGbliNF7tbyKjZVhFG4r
	 H/9jt1w27SK+txH+/kayipFSuzgzfuPnoXDTrP0VY/rsy7+t3nQYb6efnbs0/tcJUrFSO
	 SH1ij/0fHbpRY0uxbLw6FPUkuRbIBLgdPQxcOu2JSKEGsst1OPC+TGnQMwLA0oa4nqHSS
	 p7dxo+qvgXs2Rxdy+g7+WE9cjQnR9loNss6yLB1H/k/itjTAU+xZfD1sQemGTOLQ2E0MJ
	 fcS1Cfomx0TUv+9e1vRTSdN3nOGRGJVdd1FMc+Zzk4HWcP6rFQ0h7s0tAWhCPeXbmtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=dtENblfA;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDEF606A6B8;
	Fri, 20 Nov 2026 22:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDEF606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=dtENblfA
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53EF6A4C50;
	Fri, 20 Nov 2026 23:43:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795214591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=beVIJzhO9G9mQP4NDpUbqUkjliEs+CDfS51LB2XvRJ0=;
	b=dtENblfAm+MeYpcHD8/wT+ZABx7V5L7ljJw5Z9MYZ6IydLl/pMDdvdSnRs0vTrqe4jaX67
	Ryf5AyPsrMgwl8FhjslgqxW3neH+Gzlh6RH2t3+22tNRXIWa41AEJ7PmnniIRPtS9Fq9za
	Fe0KfKn2h27i8aMz7BZSwB6rChhiUEvwyI1Cvo7KdCsYfid7ipMv1kjNDKCGR90yP5O8qH
	CfdiCANZI194sxmRll+yxorE3E4mlbhIMqfKwRJ/gax1QFeb2bGo5y/6zjVAj/DUD8gRHI
	X2xoHlvWX58PSxnAsXFZ4GMDYlFF6YNeJ5XRPIaUzQkl2RCNIgfnOZpdsQ0PTw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 20 Nov 2026 23:42:39 +0100
Subject: [PATCH net v2 5/5] net: systemport: accumulate the DIM packet and
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
Message-Id: <20261120-nb-genet-dim-stats-net-v2-5-1a7cece7dd1a@tipi-net.de>
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
needs running totals, but bcm_sysport_desc_rx() passes the counts of the
last poll. Adaptive coalescing then picks profiles from wrong rates.

Accumulate the counters instead.

Fixes: b6e0e875421e ("net: systemport: Implement adaptive interrupt coalescing")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/bcmsysport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 29e608e7daaf..0902dd0dd94b 100644
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

