Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027223;
	b=T443KpPh1ox6NDAD3vriuOkgwBNEGlpDTOagOGUpBOr0hZsSC7624qJBhEIs8juuf7L8
	 GvcLsb8B0zSX3bIi0gyMOzemgBoG7aIhfeh559ngSyy8GbxuPoaqpT9NgqHPcHxzGYppL
	 oGoWq/xre7dKrclRAszy1oyQJ/z7SjnAEOgv3cH0gfFAjCy7wauy8jNhb+prA/B1JBBK5
	 yCwEL665rl8y+8wBniOtSlHfe0Qmba7pFD4dhVgYHa6cHpghS4OA3PS0CyvJSiwBGxMJt
	 6PVxHvmIufTNnw4sWV5smSNSCNdLHO1Lp8RFMTeYk9CMc3Nie1eLLqNq1MwZ0UKxFXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=LtCw/ZW/hQklWgrHf5mCigN6UvP6Ash2Qg4Zaav75PQ=;
	b=Aifg1NzxLTUpkC5/udUjfAVVnN/OdmKS4sKKD0NP0mibnhtaAypuoLMSAPmMt/v0mW2n
	 ATKwrJEumUnKFCzc7dQAIiV198qE16Ax3SgCcgXuvKXNHBa4atrVXo8vK1BebbWCbPwzS
	 hRRMhyt8rZYdzAec5UqF4LO6QCQjEwGGQd3q41JRmOuk5b0DeZ/4jDR7gcKgEeQct3W7d
	 zyOT1RjTQLyJhVibupVC5IiCYi4A9EApdKwj8HefDHPsUm84iP0sHBAyvPVs8GVM31NGb
	 xM/RLugqRaVfKZ50aSkE1JwWUOXIZYJDlNmOnCoR3bhQBdLbwdrD4KQDVJz7n/cX5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=VGNgcyFN;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC9160A2602;
	Wed, 18 Nov 2026 18:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC9160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=VGNgcyFN
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 999AFE83AA7;
	Wed, 18 Nov 2026 19:40:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtCw/ZW/hQklWgrHf5mCigN6UvP6Ash2Qg4Zaav75PQ=;
	b=VGNgcyFN33aGqcRr16md8vtrLz3zo79G4daJQD1shPBpXdghTtu6GIGoY+4kyE1QVUGHq9
	LgVYizZLjEHzjXoe1Ul/PV49cQ0m41Kg9xSAGZ6e4mw1elXfL8qvVzDoo05VNPtN3DaW+O
	rq+kNSX6PIr5nbikIdgvfBoBRAltH6aMe+wDSgsbMUmt8juapesVTSWXhQtHPmx2Hvpp4c
	uNXdYvGDkdP7s1JjeQVZGtMQjCdAjrhnvySxGu2nOvskFRfdQb9P8W5unJvDyMXXl4vg19
	IDhlLiSmw6c6/Jlc8nqX5a5FyRkbuqSq5lzVfjh41fU4PYTs5Im/RPWwFdW3sQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id PKxMTAybAEo2; Wed, 18 Nov 2026 19:40:14 +0100 (CET)
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
Subject: [PATCH net v5 03/14] net: pse-pd: fix module refcount leak in pse_control_get_internal()
Date: Wed, 18 Nov 2026 19:39:46 +0100
Message-ID: <20261118183957.2031311-4-github@szelinsky.de>
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

pse_control_get_internal() takes a module reference, but when
pse_pi_is_hw_enabled() fails, it skips module_put(). This happens on
any I2C or UART error. Each time, one more reference leaks, and the
PSE driver can no longer be unloaded.

Send this error path to put_module, like the regulator_get_exclusive()
error path.

Found by code inspection. Not reproduced.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 309adec93679..0cce17670d0b 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1424,7 +1424,7 @@ pse_control_get_internal(struct pse_controller_dev *pcdev, unsigned int index,
 	 */
 	ret = pse_pi_is_hw_enabled(pcdev, index);
 	if (ret < 0)
-		goto free_psec;
+		goto put_module;
 
 	pcdev->pi[index].admin_state_enabled = ret;
 	psec->ps = regulator_get_exclusive(pcdev->dev,
-- 
2.43.0

