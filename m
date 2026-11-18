Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027225;
	b=LUSic3QhNc7VAxFjTl1/DsaT6bTZ/MnO3nC8yitY2TKqKKtjYIB0B0ZO/PHsCF/LkXyI
	 1clSBgd3ARCLwy+9uzezKIV3njvNu2w5NpupQA/QLsB2hBe3FQuycs6gZ5guajIM/S4Kz
	 bevdwytDMaws/c1ip/GvfbEwflvcgC0FHcudyC5SJ6tr3DrD/TdXsKkzY+whu7afCMty7
	 xGFGUjg4Pai0IJqr9UEzOHQzmdcPMGxn1jhpdf+MiNiH+lbQ670QqKzU9K4QEI7zqGp3H
	 jHfDvFAO+2OZ9LnJXI63gin6mk8w47pODxt6vzDdfVHOF9yFpuFpIe3Y2xCSz8vrrng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=24U4gclSF8EWBrOROCTXbFJ6yt1U2MCTRcDgtga58hY=;
	b=YEwCO7kK/lbQ5p6WPLafY7qHl0xYt6T0pS8oHxrMjiAaqdzf1LMcjccwnSyiCwmbcNzd
	 80zJwb54GYyg6tIfJzp/SoiosomeFq008//AROtNZvTTlgObL9UA8hEYnuhlLo+dNI7As
	 Gjvgn4/kekcv89kMeyjnQQH62A1koDhKTjjpazWd6boS9owd3DV7vTqmyG8S94+2D9vQL
	 s5mleKIEEbpV7y3DQIOSOJaZjuRR99URIKz6RZHStxCVYSm8LLOMBZ9EgSnPSVj82a2zG
	 GeFPQMeFL9O0KwkrioHbdUaL3mIhX80DD62AWERr69vCe4T3ocxbxK9vtmaPhuJH7ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=S6wgwRUu;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341260A383D;
	Wed, 18 Nov 2026 18:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B341260A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=S6wgwRUu
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id E97EDE83AE6;
	Wed, 18 Nov 2026 19:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24U4gclSF8EWBrOROCTXbFJ6yt1U2MCTRcDgtga58hY=;
	b=S6wgwRUu21M2iUXXIX8qut6WwEGsa7D5smp55YaH/+K1FyX5P/TQPJyQGgnnWWIMpZ9Asn
	z0rdVWwxiE3bqpDgMW1OoTQDVZQERJoOOmciUZ/3M+WTGV3okh3uWAgOqY5ks+7BcsVC23
	Vp0cx5qyQQGpBZDAfS6hj7KpMHOfG8nkdwQ4rQwWtCUJ8G+h5xBO9lVsq5cCnlGbAIXE5b
	spGBVYm+ayw727hUDwjyZ+ygjBmnr3yIn5mqhAembPPW0srNkkUVpWLoJWlrXjWjXiV3xr
	cpv7I2xxKauxsx3dKaxRmio0PKKXPDLVge76ff1rv3vP6jcw/aB8kZp4FrYNBg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id qp2sKxYZD0Lj; Wed, 18 Nov 2026 19:40:18 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 18 Nov 2026 19:40:18 +0100 (CET)
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
Subject: [PATCH net v5 14/14] net: pse-pd: pd692x0: defer probe while a manager supply is unresolved
Date: Wed, 18 Nov 2026 19:39:57 +0100
Message-ID: <20261118183957.2031311-15-github@szelinsky.de>
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

pd692x0_req_managers_pw_budget() uses each manager regulator's supply
without a NULL check. The supply is NULL while the vmain regulator is
described but not registered yet, because regulator_register() does not
wait for its supply. Probe then crashes.

Return -EPROBE_DEFER in that case.

Found by code inspection. Not reproduced.

Fixes: 359754013e6a ("net: pse-pd: pd692x0: Add support for PSE PI priority feature")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pd692x0.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index 019bc5861a8e..667e0b818811 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -1055,6 +1055,15 @@ pd692x0_req_managers_pw_budget(struct pd692x0_priv *priv)
 		struct regulator *supply = priv->manager_reg[i]->supply;
 		int pw_budget;
 
+		/* The regulator core registers the manager regulator even
+		 * when its vmain supply cannot be resolved yet and retries
+		 * later, leaving ->supply NULL until then.
+		 */
+		if (!supply)
+			return dev_err_probe(&priv->client->dev, -EPROBE_DEFER,
+					     "manager %d: vmain supply not resolved\n",
+					     i);
+
 		pw_budget = regulator_get_unclaimed_power_budget(supply);
 		if (!pw_budget)
 			/* Do nothing if no power budget */
-- 
2.43.0

