Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027222;
	b=SVOLR+vzgQUPdjv+2HeDGlUEz+G5s7BDD+0kMr3bknWH60QKsp613zDFN+vkdGufCNRh
	 Sj2NM0KBmhak+/Ltg+sUP6UN4cqhD5uXFkuqhaDlSxIdiDWObXtgkIlPw4rd1JFAJ2lCa
	 dC5FST6PES9SAD3YP2wENd4vYRcdts/uvejq5lzP5FdMZ3HQ1ENRi2GpOdbFDEICQXwee
	 A+pLyR/8vqJ565eijo3xjOMUwp816f7tcMfq9DYA/XoPD07hf8jW1MJ941fhWgFNP20Dr
	 q3Gor3wDFytYmH5zpemu5SBi/TJ9g3usBhVQHf4xMm2ctLSDhcrBe7Zqv32puM8koaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=LV/A5tIOZa1lq2JSm9kNqwlNcEPOyfzUDdKJupm5Ajs=;
	b=BM/lb1i/AyXOBEN8eGIWjpVpQeNn8mpKEBygbke2Mftf2fiDhOAtkAOlsuzbxEnU8N0n
	 Vj5WYNQe6tvkZ2SEJvzb0aTQfFMwTd5NnReTcq5F7mPqroM/PlnPHiLnAqUAmIcPbReDh
	 Cgfn7hEcG7FzJE63xErve++zlqxUym2RKr9mnwVvH2lZxQKsPmSBN3dx7hxJtHK+6cgBH
	 WvawSh4VU8eiyIdvW4f/vHjELF3lo7PxyCTYDS7t9Mx3A77jE0tCeGkAiGIgc8NOUtjx7
	 t7U7K4LjVv84TGQ8B7vXQJ1uWFBZlWRALrUDNmUzNN6U4cE4/QRxORuHx7SazteZF1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Sm1elltE;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286E3606A32A;
	Wed, 18 Nov 2026 18:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Sm1elltE
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 75B07E838E4;
	Wed, 18 Nov 2026 19:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LV/A5tIOZa1lq2JSm9kNqwlNcEPOyfzUDdKJupm5Ajs=;
	b=Sm1elltEdo8bRGYuzRLu7sOUWDkd1fqIcXXvemsWJxLHkYzl16gfyRnh8EcW3ZN+MTYov7
	JTbP50ORua9pde11a7mta6IUEP5HC/w3st65WombWTE0RS/syak5gKib7QM44cHxIkC6xV
	DoIJJmX6aT4nMO4+GoFMtJceaqm8U/mfJVfh0IUVOU6dW41ZniitjMljIL6jbF/8JFePxW
	WZ4MkUAKu0iQDz5RxBvrfv8LNPoropjQXCohn3IrNpWYOHVKi722KGmzU5whij+l4qGICm
	E1lUn8Cg212VVl3xiCks+C6PaBLmfqpIj0ZL7ycJbZ0K5T0Q7c1jJYAYnOMmGg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 9FlkbnfALF5K; Wed, 18 Nov 2026 19:40:13 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 18 Nov 2026 19:40:13 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Kyle Swenson <kyle.swenson@est.tech>,
	Ross Cawston <ross@r-sc.ca>,
	netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net v5 01/14] net: pse-pd: size the notification kfifo after defaulting nr_lines
Date: Wed, 18 Nov 2026 19:39:44 +0100
Message-ID: <20261118183957.2031311-2-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118183957.2031311-1-github@szelinsky.de>
References: <20261118183957.2031311-1-github@szelinsky.de>
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

pse_controller_register() allocates the notification kfifo before it
turns nr_lines == 0 into 1, and kfifo_alloc() fails for a size below 2.
So a controller with nr_lines 0 or 1 cannot register. pse_regulator
(podl-pse-regulator) never sets nr_lines, so its probe has failed with
-EINVAL ever since the kfifo was added.

Apply the default first, and allocate at least two entries.

Triggered in QEMU (arm64) with a test-only PSE controller with
nr_lines 0: its probe failed with "failed to allocate kfifo
notifications". With this patch it registers.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index a3d4a3d7e525..972264b26036 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1043,16 +1043,19 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	mutex_init(&pcdev->lock);
 	INIT_LIST_HEAD(&pcdev->pse_control_head);
 	spin_lock_init(&pcdev->ntf_fifo_lock);
-	ret = kfifo_alloc(&pcdev->ntf_fifo, pcdev->nr_lines, GFP_KERNEL);
+
+	if (!pcdev->nr_lines)
+		pcdev->nr_lines = 1;
+
+	/* kfifo_alloc() rejects a size that rounds up to less than 2 */
+	ret = kfifo_alloc(&pcdev->ntf_fifo, max(pcdev->nr_lines, 2U),
+			  GFP_KERNEL);
 	if (ret) {
 		dev_err(pcdev->dev, "failed to allocate kfifo notifications\n");
 		return ret;
 	}
 	INIT_WORK(&pcdev->ntf_work, pse_send_ntf_worker);
 
-	if (!pcdev->nr_lines)
-		pcdev->nr_lines = 1;
-
 	if (!pcdev->ops->pi_get_admin_state ||
 	    !pcdev->ops->pi_get_pw_status) {
 		dev_err(pcdev->dev,
-- 
2.43.0

