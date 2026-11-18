Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027225;
	b=Rx/YReNc0K1JT3vu672i2hbquunuESQ+xJ8nfrz2RLJ8xo/NZhLmoZgOEGiJhGRjXEx5
	 PucOJIP/gAZJxhAevK0wcg94NOC5USM/JVYxiBmPKkfHMGnJdkX9WgvhBh2AxT0/WUCkZ
	 Q5OVRBDPIqRR7S4tlwqV+5uKWDM9khjLdHaMqljsRub62NfkeZWB9GABVkpTKxH94bKK6
	 Il4at8A15VfEnlsxFA+X3T5o1SFrUi5GKFfHrjj+QtY5pyu4MiHsPbMV59S7993jQMCQ0
	 c0sc1ptcIkXBBFGzVofUDikwqjLxz/TrxgLTsygOgeZ0e8C/a546lo9OON/xJ4YU+JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=LM+pTAATqZuJ4Rbj+gVxmhx6745okAkcEDwVootmEd4=;
	b=PgwYLIlN2l2RGWKeNFgfhLopbLlp2B1IlpECIFODhKl9EXblSXwghjHTByIex+Xf9+w7
	 k7maD2zC7/Bm0vefd9CXZPpmHZOpMHvxQq9EdRV2lKViufzwipXzI6S0om6mSHZdGFtA6
	 7/LOS0cXB1tXiTxTCr5RHSD9AvUhhYnPblNm7yQXUISGOw5JT3ZgzdnYKw6unGex/XwE9
	 GKitwSkD70zldUD6FO8/Pd2bhJMN7NYCOis+cDza7xP1SkLIHM7ZjfueFfjxFfDyKc8sA
	 UJAwPIQ4I27aVC6ZMn3kvB1qhjikY2ppx6ejcKFvDqxiI9TclnQegbwli8FjECVO3Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b="Wp/OCgdt";
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8560A383A;
	Wed, 18 Nov 2026 18:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B8560A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Wp/OCgdt
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 2D2B2E83AE2;
	Wed, 18 Nov 2026 19:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LM+pTAATqZuJ4Rbj+gVxmhx6745okAkcEDwVootmEd4=;
	b=Wp/OCgdt7rXXQxPNZ8ajRg6mY38sG0cMG0J6P7S8mgDHbOsFotmuu06+knwU5D4ZQXWRe+
	jWQkMogzV0xv6NM0I/g0IMBRHXg/dOnospyH3A6H9jJ3Fx+CVMbvtskeQts12izJynyHTl
	p2IeM+Uu61q7MlkdhCyrBIFy1t24ZlpAA0U4MDVEJeZffpfxCaROViS5N99Tc+IwYCLbnL
	kdpUUVXTzhlta8stqjPU4y/tyyrFnbVqoFNxaHzAKbZINnTItX6+wzuUja/ma1PQcdg5mc
	K+LSyqg6OSsJDvYxBKbsciShgAvVoFMjrLRHsTw3nNf5dzH6FeGzgpjVxiXB4w==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 55Fvtf-1UM9h; Wed, 18 Nov 2026 19:40:18 +0100 (CET)
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
Subject: [PATCH net v5 13/14] net: pse-pd: pd692x0: release the manager power budget through devres
Date: Wed, 18 Nov 2026 19:39:56 +0100
Message-ID: <20261118183957.2031311-14-github@szelinsky.de>
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

pd692x0 reserves a power budget on each manager's supply in
setup_pi_matrix(), but gives it back only on that function's own errors
and in remove(). If probe fails later, or the request fails for one
manager after others succeeded, the budget stays reserved on vmain. Each
probe retry, e.g. after -EPROBE_DEFER, reserves it again until nothing
is left.

Release the budget from a devm action instead, and drop the explicit
release calls.

Found by code inspection. Not reproduced.

Fixes: 1c67f9c54cdc ("net: pse-pd: pd692x0: Fix power budget leak in manager setup error path")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pd692x0.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index 7958f5741463..019bc5861a8e 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -1223,8 +1223,9 @@ static void pd692x0_of_put_managers(struct pd692x0_priv *priv,
 	}
 }
 
-static void pd692x0_managers_free_pw_budget(struct pd692x0_priv *priv)
+static void pd692x0_managers_free_pw_budget(void *data)
 {
+	struct pd692x0_priv *priv = data;
 	int i;
 
 	for (i = 0; i < PD692X0_MAX_MANAGERS; i++) {
@@ -1278,31 +1279,39 @@ static int pd692x0_setup_pi_matrix(struct pse_controller_dev *pcdev)
 	if (ret)
 		goto err_of_managers;
 
+	/* Frees whatever pd692x0_req_managers_pw_budget() manages to
+	 * request, on any later probe failure and on unbind. Added after
+	 * the manager regulators so that it runs before devres unregisters
+	 * them and their supply goes away.
+	 */
+	ret = devm_add_action_or_reset(&priv->client->dev,
+				       pd692x0_managers_free_pw_budget, priv);
+	if (ret)
+		goto err_of_managers;
+
 	ret = pd692x0_req_managers_pw_budget(priv);
 	if (ret)
 		goto err_of_managers;
 
 	ret = pd692x0_set_ports_matrix(priv, manager);
 	if (ret)
-		goto err_managers_req_pw;
+		goto err_of_managers;
 
 	/* Do not init the conf if it is already saved */
 	if (!priv->cfg_saved) {
 		ret = pd692x0_hw_conf_init(priv);
 		if (ret)
-			goto err_managers_req_pw;
+			goto err_of_managers;
 
 		ret = pd692x0_save_user_byte(priv);
 		if (ret)
-			goto err_managers_req_pw;
+			goto err_of_managers;
 	}
 
 	pd692x0_of_put_managers(priv, manager);
 	kfree(manager);
 	return 0;
 
-err_managers_req_pw:
-	pd692x0_managers_free_pw_budget(priv);
 err_of_managers:
 	pd692x0_of_put_managers(priv, manager);
 err_free_manager:
@@ -1854,7 +1863,6 @@ static void pd692x0_i2c_remove(struct i2c_client *client)
 {
 	struct pd692x0_priv *priv = i2c_get_clientdata(client);
 
-	pd692x0_managers_free_pw_budget(priv);
 	firmware_upload_unregister(priv->fwl);
 }
 
-- 
2.43.0

