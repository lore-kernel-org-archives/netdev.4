Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027227;
	b=cZZI5XpCuWAyRXs/B9Yyd/Zs0fDGm1ggeCwDP4d/Wh+fwcd72qmqmybduV7xjqu3Byy1
	 7uv8G1Baw5Jo5wzctQHN+vqHdpGgCr/OblKAbKQ63uRHCSUT055tgavnX+saGpYXtrvZ0
	 T8ffve2WOs2PTn+j/5odFdHej8djybaauQUjiR49MzDI1vEl9SfSkDuM5g2SAw2C+wMHZ
	 T6SqjxTlaeu7lT1dI9ZMRyQRSPk9Sbl+NQYGgvpV0WQEf9sse/7ydvPzwLXSeB4IkSu7x
	 sM94W+OC1EQ6DDJqdKTJW2YEU1MCfZNRyido+FrIaffZL5v1h0oYFFdIcIYpHUAY/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=eBfy3C/qatKvrXugrVDBOzdGAnD9yCzVqwvXlNIQDTE=;
	b=Ozk1lhG/N9rw1Eus9dvq1QW35F4DOcdFB2wV5ZxEVQpWfHgi823oU2L0keDLrTd9MTzK
	 jRdMvbzWs003DhhJjBt0jPHoIV99W79zSQ2HnzpPulVQGPNvXDM8hPIw1Z2UAU5Z6YJk6
	 IXqNGqyHwk4IWDKwqY2ydTxIsWVCsjMRPhZBLpfUszz9MxN6mRVXY4jIgEYJ7zN/w4zgH
	 DQYA+np6aoxdR5pT5MlHyzO6co8FJNh6LclSkgLc9JLZDPpZaWIMIAbMrUlh/ZRkorECV
	 nxYDtbyqGd+mGE4gkJv/gQ6g0gyfNbXw057utArfOZ9OyGH4ASi1MpKKqSuUA8+T3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=CXNyRe4p;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D33460A3829;
	Wed, 18 Nov 2026 18:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D33460A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=CXNyRe4p
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 869ACE83AD0;
	Wed, 18 Nov 2026 19:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eBfy3C/qatKvrXugrVDBOzdGAnD9yCzVqwvXlNIQDTE=;
	b=CXNyRe4pqTg5mz4C07G7Wdwun4vjMbwSGj5kVQOF3LFxXsmqJv8BlmRDczQ56JJWVnOGjJ
	Mz537jyE4OyimmhNfnVmcEsR1cWELrjc0hR8LlcIH5l2F0AOG/AWOCdJljanwfzOHNJAym
	EKMhng5u53zxSF9/VfhVAQqL+0GVlYyuyW/XzRKIq6M0o2iOpnt+mPyfMYRDpRz6spBDe/
	CvI5roH5c9yzznaVWmiZOdaq7WxIaE86YlYeH9ebbpoBHsUxXOLn3Cj/yCxDJfXuYOa9o5
	bEL+D2ysDiUCNooK95Qin+cRhyhv2b33DPAauIl93kZWy9PSa0Svyo/c8RZ2xQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id h2J8Vemafvbo; Wed, 18 Nov 2026 19:40:17 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 18 Nov 2026 19:40:17 +0100 (CET)
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
Subject: [PATCH net v5 11/14] net: pse-pd: free the notification kfifo when registration fails
Date: Wed, 18 Nov 2026 19:39:54 +0100
Message-ID: <20261118183957.2031311-12-github@szelinsky.de>
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

When pse_controller_register() fails after it allocated the
notification kfifo, it returns without freeing it.

Free the kfifo on every error path.

Found by code inspection and AI review.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 134c273487ba..c86e2c44e3ff 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1119,24 +1119,25 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	    !pcdev->ops->pi_get_pw_status) {
 		dev_err(pcdev->dev,
 			"Mandatory status report callbacks are missing");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_kfifo;
 	}
 
 	ret = of_load_pse_pis(pcdev);
 	if (ret)
-		return ret;
+		goto free_kfifo;
 
 	/* The PI regulator ops use pcdev->pi until devres unregisters the
 	 * regulators, so free it from devres too, after them.
 	 */
 	ret = devm_add_action_or_reset(pcdev->dev, devm_pse_release_pis, pcdev);
 	if (ret)
-		return ret;
+		goto free_kfifo;
 
 	if (pcdev->ops->setup_pi_matrix) {
 		ret = pcdev->ops->setup_pi_matrix(pcdev);
 		if (ret)
-			return ret;
+			goto free_kfifo;
 	}
 
 	/* Each regulator name len is pcdev dev name + 7 char +
@@ -1153,26 +1154,33 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 			continue;
 
 		reg_name = devm_kzalloc(pcdev->dev, reg_name_len, GFP_KERNEL);
-		if (!reg_name)
-			return -ENOMEM;
+		if (!reg_name) {
+			ret = -ENOMEM;
+			goto free_kfifo;
+		}
 
 		snprintf(reg_name, reg_name_len, "pse-%s_pi%d",
 			 dev_name(pcdev->dev), i);
 
 		ret = devm_pse_pi_regulator_register(pcdev, reg_name, i);
 		if (ret)
-			return ret;
+			goto free_kfifo;
 	}
 
 	ret = pse_register_pw_ds(pcdev);
 	if (ret)
-		return ret;
+		goto free_kfifo;
 
 	mutex_lock(&pse_list_mutex);
 	list_add(&pcdev->list, &pse_controller_list);
 	mutex_unlock(&pse_list_mutex);
 
 	return 0;
+
+free_kfifo:
+	cancel_work_sync(&pcdev->ntf_work);
+	kfifo_free(&pcdev->ntf_fifo);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pse_controller_register);
 
-- 
2.43.0

