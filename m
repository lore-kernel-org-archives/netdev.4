Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027222;
	b=nsYpt3JFbfAsvUtVmbX0s5dANWf52jTDxBmlyu2Ta/YYHAbsJr1ew9leQxqLOfkij/uW
	 uDSc29IeTd2ENNi6WTY3mW7hBX11zt+4KStj5b8i4LyStHDz2mSijhx2sJhURJZWYwi8S
	 js7v5h4MNKyHuICNJMb5l7yPHX44+BNorQ2H7+hurGzk0bxB+VO1LJ+zLg7cV2sfjtRh4
	 l4089IpcRWLI2G/hb6RxPkQFE1dWdTFb+tFG9CmvgexIXGVfa/7YhmSnU875UPpngQBGY
	 qsTDd8gQIfnDR8iz5SjX0UOzGM7ZNZxjYBtuPnLKRvRp7A39k0J98/wEvkuHRIHhzzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=gROTN1zvCOF4nJyz6SbDu9FhtzlOzM8TGq7x9iKfDwE=;
	b=wjBfifLmgSCJICRXrqTzffpqsnW4Al6GjZj2Tz7rfBEhtkb/8LJEoB6aH6j8vSVCUxJW
	 XM9/llU/Ln33tPLLoGNnGCIOb/BZLyLe5j9QVGHg0EZGkllsTird6unYpCaHX6FYIp2ub
	 ogMiDbD8torKVjgkBfamezGzBzJn3py8ApHhXHL6gBMWexKuXaYpseDQS8H74iPDYlQpm
	 i2IPYGH9aVe6oEYyLTbtRLiJXl7msVTA+FgvVMN43P+8obKbNMZ9Q5DJNQNWKHpOPDCw4
	 UomGzmee293WHDrIyl2gb+nApMpKShWT35I7you7Dn7StdVcaOcCp041H/LO+UsZHHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=AADRGOS4;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3760A260D;
	Wed, 18 Nov 2026 18:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F3760A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=AADRGOS4
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id EBA05E83AAF;
	Wed, 18 Nov 2026 19:40:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gROTN1zvCOF4nJyz6SbDu9FhtzlOzM8TGq7x9iKfDwE=;
	b=AADRGOS4iT+qi5xNZjEh+9IPMVVz8ud0ecf1tWPrOOGlqfLly0r+JzhhVhv1xIOziUIBlB
	5Qn9YUqdb2XYhLoRsFtLSaFbXSmB+QAQiv+B8BsAT93EQ4VLTIWCln2t2klRy/dTxpT/ap
	Bp3vr6udHFT/+boTnKAHO4j1rvWsvXsf34wtpIUCjY+Sd1YMnpAXsZN9BkydlSE0VlPAGM
	/sEMjNRn4gwEkTUld6/En0+4uhi3bIWm8Tw3p82+x4PdIadU6yq00DY6rYvKlu3ZVNU1Iz
	x121L5xMeems0vscIGbgoH9v6Vm21oiSPHODqee7SVLxgtOc7EmsQZavqH9IMA==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 1lsc_SxrpgzT; Wed, 18 Nov 2026 19:40:14 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 18 Nov 2026 19:40:14 +0100 (CET)
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
Subject: [PATCH net v5 04/14] net: pse-pd: do not keep a failed IRQ in pcdev->irq
Date: Wed, 18 Nov 2026 19:39:47 +0100
Message-ID: <20261118183957.2031311-5-github@szelinsky.de>
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

devm_pse_irq_helper() keeps the IRQ number in pcdev->irq even when the
IRQ request failed. The failed probe then runs
pse_controller_unregister(), which calls disable_irq() on that line. If
another device owns it, that device stops getting interrupts.

Clear pcdev->irq when the request fails. It is now set before the
request, because pse_isr() can run as soon as the IRQ is enabled and
pse_pw_d_is_sw_pw_control() reads it.

Found by code inspection. Not reproduced.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 0cce17670d0b..0894613515e0 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1341,14 +1341,20 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 	if (!h->notifs_mask)
 		return -ENOMEM;
 
+	/* pse_isr() can run as soon as the IRQ is enabled, and
+	 * pse_pw_d_is_sw_pw_control() reads pcdev->irq.
+	 */
+	pcdev->irq = irq;
 	ret = devm_request_threaded_irq(dev, irq, NULL, pse_isr,
 					IRQF_ONESHOT | irq_flags,
 					irq_name, h);
-	if (ret)
+	if (ret) {
+		pcdev->irq = 0;
 		dev_err(pcdev->dev, "Failed to request IRQ %d\n", irq);
+		return ret;
+	}
 
-	pcdev->irq = irq;
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(devm_pse_irq_helper);
 
-- 
2.43.0

