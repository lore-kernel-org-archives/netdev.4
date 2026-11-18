Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027226;
	b=0LYQNJkzJlEHK7BnPK30XbXRg6hlNCLbMCviMW7OQXmYCEEh3qXvGNJznrVL9Da1bGQO
	 bUt5lGEMR/uiC74XoSLzJot3B3f2qwoQAv0qI6KP5ethh0dUMPChjXRmgpVI1YVS2Qxk6
	 f/iryZOP0vcXNt8UVv0kDyHBY92TI5jwmXqJHj94Nbdr7N2kAhAHaMkZ2O0MVTxdvIBLM
	 CS361PgZ/T5x1OxVlZFwuLYZxScpUObcuGChZR01jeB4tfphKsuO/T9NXxTvE7IKgSQxB
	 XNKAcK64VKhRCveW1n3J6T0+cKxjK5FY4WYhNy1TWMXFPm/ZU0f84jafoWiXp+y5/tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=4R7ZajFW4odn0gyIYC6SbCChu1Q1QzdQND8A4x8947U=;
	b=3t1hCuOL+x/Lfe0cx1mB+ORrhuh0X3Hhk3LaQv4OcNRHq++Le4mHrJAp5Xq6EuOqeH13
	 e5tw70ypt1nfIc6lgqlcAPdXML/r0twPJQqDz+WbN4WyUaxBE8YMnnevkfTL1r4rov2Jt
	 xHY4AgkdXHhWALiuskRiu4D7EIQRvvhKFZmWBX+Vy4rtJeu4BAh5sKxjimLFLoPFCxhxj
	 pG2nBGKJbtilsTtgageZ7+8Ly9kahd0NgfJTFYrYJ5eBJUt0FWetkt+85nb1EXjmuueHa
	 ETJFqvnmSOmxpAd0W0Z8sMjaOJ4k+ekUIBJ568zSySns2TJJFc3+5MMr3B6/TyIzPQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Ipw9302R;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4060A262A;
	Wed, 18 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFD4060A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=Ipw9302R
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id D60BCE83AC9;
	Wed, 18 Nov 2026 19:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4R7ZajFW4odn0gyIYC6SbCChu1Q1QzdQND8A4x8947U=;
	b=Ipw9302R/mbKnXTZBDPFzVMCqovDHMXGFUYy1NsNvODZJh3ZMRRP4Q3k2PWJ+4HVM7Spu/
	ySHm5EdVvrNiegqmpebG28iwclbDVA/U85bBWf6WWaY+8x35l05UGiUvsXZG5dENQiTJSS
	mq9+ttTUcV7PO87LXzq7k5VS4cUxaTRMH6AQ7Cj62OBxmXVLhLoeqmAm0Phk2n1wsESV2x
	9qrTb/7slyAW3I+RGK6rSyPIXALGT1VnezIAeAvm+tTQMoAfqWM/UJHPsSdmsbNHQXI52E
	mcEfgWptYCQNKkCgrRN0wy8ZBbjUBI4jeULWTj7A5ibdkWvwoWEQaPD91oH85A==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id m4EI6uAwgQxC; Wed, 18 Nov 2026 19:40:16 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 18 Nov 2026 19:40:16 +0100 (CET)
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
Subject: [PATCH net v5 09/14] net: pse-pd: unregister from the controller list before freeing PI data
Date: Wed, 18 Nov 2026 19:39:52 +0100
Message-ID: <20261118183957.2031311-10-github@szelinsky.de>
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

pse_controller_unregister() frees the PI array while the controller is
still on pse_controller_list, and only removes it from the list
afterwards. of_pse_control_get() walks that list under pse_list_mutex
and reads pcdev->pi[i].np in of_pse_match_pi(). A consumer that probes
at that moment can read the freed PI array.

Remove the controller from the list first, before the worker is
drained, the power domains are flushed and the PI array is freed. Both
sides take pse_list_mutex, so once the controller is off the list, no
new lookup can find it, and a lookup that is already running finishes
before the PI array is freed.

Found by code inspection. Not reproduced.

Fixes: 9be9567a7c59 ("net: pse-pd: Add support for PSE PIs")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 22f2d8041bd4..edca02438727 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1183,13 +1183,16 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
 	 */
 	if (pcdev->irq)
 		disable_irq(pcdev->irq);
+	/* Unlink before the PI array is freed: of_pse_control_get() walks
+	 * the list and reads pcdev->pi[].
+	 */
+	mutex_lock(&pse_list_mutex);
+	list_del(&pcdev->list);
+	mutex_unlock(&pse_list_mutex);
 	cancel_work_sync(&pcdev->ntf_work);
 	pse_flush_pw_ds(pcdev);
 	pse_release_pis(pcdev);
 	kfifo_free(&pcdev->ntf_fifo);
-	mutex_lock(&pse_list_mutex);
-	list_del(&pcdev->list);
-	mutex_unlock(&pse_list_mutex);
 }
 EXPORT_SYMBOL_GPL(pse_controller_unregister);
 
-- 
2.43.0

