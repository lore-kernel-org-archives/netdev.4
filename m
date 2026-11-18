Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027222;
	b=5NOmK70WBx6Wl6+EZOQP71a5HtErlCm1dP1UotNHGfCmIwV0qTVZVB3fu7YaQddgKZus
	 ZDremaLJq/PeShLlQtD2u0NQ6HoWtv9zFphpTWcmXJcD8y1Ejnw2Uxmv7HGJ9VbO8GlSY
	 Ml/Xz7GdJ8Ig8fLjToE2ttCOmP0XT5Gm6OlK4g9mMi3c7HURd7K7j/r5B6CgSQbzF8i2/
	 2OWOgg/0VeqhQ15GkALDZhDkrAFPxYW7ZPkaI3FG2mOyqw0PcOKN5BhojmDHtbyuURVra
	 wLXxRMYcGRdzwfHfRQOIfyL1LBOwdwEuV3qQ1+LEmZ/hTfkXHO3WR1CxHvkyZLSImxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=KNYr3ilNv2jRxQxc+GNh9GAPVKAnnLtBh3rUqOHQhuY=;
	b=jvXxLLIa4x4B+FMQ+bm5OkdRmCUOgQZcrJP9HC/B//tJR2W53njPTHBapGir1dx//jkk
	 nClVTujaHR/AFk3u8WC+OvHz5g+AmZlIWnS0Dp59vlYrG0WTR6yCnaxe1gOkvk9l7R6IH
	 0PKApCSq23k8b6CTbBTVXFFUc1dAmO3jvDO1+2AfFHp5onabRBPhXRc9SrKfjGkLYlDCv
	 9KNSfuuVj3i3p4VP+vBRL0I3ekyo9hcVncotmFxfqyjjNQMjD+axdWSEVYSaBIiwNO2Tj
	 6scRpBB6BVNULSEa20BMEdD/2GSQZvnVJJD41GcOW4H6t6B1/Q3QtRj3uA0se1S4OtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=hF4EwO6C;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2871A606A32C;
	Wed, 18 Nov 2026 18:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2871A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=hF4EwO6C
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 3A202E83AA5;
	Wed, 18 Nov 2026 19:40:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KNYr3ilNv2jRxQxc+GNh9GAPVKAnnLtBh3rUqOHQhuY=;
	b=hF4EwO6CL1FA385cym/udvoQFR0tAdV3ZlpMtbhKnvr8lKsI6Z9K3ErtJjnomHd4ccowIv
	bKnc8KdZVDCgKab2m9cr3Ug0g9g3/WKg0GvTsm5owbR2+83OsONPT+kAM7CylGW/oMOryT
	opej9jyDp2QgJyIbGR3s6JE844DTdznbNrpmZQoocwIwTbwU8IdjGEtAhegk2DuxtrHKuo
	4+QgcnvjyEbOi5Uv1bwyYf4c/MxMIgDnqB4yyDt4sO5R70HsTAoteLkWJd32zD59cdbBrE
	1D7u0o8xXiWxHlvOD+QrlC4ppeUrQp/G1cEXnGBxicZ2eQ9Qt/fv1P0/4m7Y8A==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id MQ_CH_SJCWQM; Wed, 18 Nov 2026 19:40:14 +0100 (CET)
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
Subject: [PATCH net v5 02/14] net: pse-pd: remove dead pi_get_admin_state() checks
Date: Wed, 18 Nov 2026 19:39:45 +0100
Message-ID: <20261118183957.2031311-3-github@szelinsky.de>
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

pse_controller_register() already fails when a driver has no
pi_get_admin_state() callback. So the checks for it in
pse_pi_is_enabled() and pse_control_get_internal() are never true.
Remove them.

No functional change. It makes the next patch, which fixes an error
path in pse_control_get_internal(), smaller.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 972264b26036..309adec93679 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -412,13 +412,8 @@ static bool pse_pw_d_is_sw_pw_control(struct pse_controller_dev *pcdev,
 static int pse_pi_is_enabled(struct regulator_dev *rdev)
 {
 	struct pse_controller_dev *pcdev = rdev_get_drvdata(rdev);
-	const struct pse_controller_ops *ops;
 	int id, ret;
 
-	ops = pcdev->ops;
-	if (!ops->pi_get_admin_state)
-		return -EOPNOTSUPP;
-
 	id = rdev_get_id(rdev);
 	mutex_lock(&pcdev->lock);
 	if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[id].pw_d)) {
@@ -1423,11 +1418,6 @@ pse_control_get_internal(struct pse_controller_dev *pcdev, unsigned int index,
 		goto free_psec;
 	}
 
-	if (!pcdev->ops->pi_get_admin_state) {
-		ret = -EOPNOTSUPP;
-		goto free_psec;
-	}
-
 	/* Initialize admin_state_enabled before the regulator_get. This
 	 * aims to have the right value reported in the first is_enabled
 	 * call in case of control managed by software.
-- 
2.43.0

