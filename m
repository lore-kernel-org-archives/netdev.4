Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027224;
	b=h8HECyvasTiL6DE2rqXGC+5J7GXuJ2su5VakDnB2hRfYQ3h8fBePxNzGLVX4dLPjJIe8
	 3LchiUUOn7z3OHIP+oo8zV+XuTKujYFv84GQP3/gtrRbdXEDirHHXdIV9YgNeBMAsfKPj
	 vgVp0jJh8N0S2LpTDczzr0hLrP9rrSYv6fo6RZUm9ujTbCeZtQbTk3rsXN4dyI3hi0ZZp
	 lQgAFRuumkTchvp/RmKsAtmBADM5i2XowiY1PQFRP8S2kGNoI7BfXR72Ky4GKp6T2vGlq
	 7BX4YkdHa4KSXq7vl5vFXYB6CVfCBxu5kn2F5CXdtO1/MKZkmzBvsUBUhV7QHXA0+2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=r+4UkR+yiZV9gtk03ydwsz12p/MmvIrhGf6rz9nPsCE=;
	b=Nwg7RrEw9rdPeQnBe59okwxCasqqxKX7E571sQY77CoNeELCC/Uj/BYPveqUuNk+2aoi
	 fTzMjM0izrhRjzn71/qmxbmkTcjK1TUX4kYo0Z4s8JNW6KmnnhzT0i54QM14wmmc6+jEx
	 O+oYlxUS1QVX43y9iHsbA8CEe5XRkFzoy2slMshvIydmYvlLqwajJ241/R2xUXZR+gge5
	 LR87R/4spyOn6Tmc7s25AAkr/oZle6kOD36azvEB9LKrueD4QDb/5+QdgPkFV2QQfbVgG
	 zB+dilkjOuIQAp43rheqY2uIOkLtLY4uoAYc3b/5iK+XlYc+qyrvQG1dN6cJnNn2W6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=S7En7j0H;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B904606A33E;
	Wed, 18 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B904606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=S7En7j0H
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id D2E02E83AB3;
	Wed, 18 Nov 2026 19:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+4UkR+yiZV9gtk03ydwsz12p/MmvIrhGf6rz9nPsCE=;
	b=S7En7j0H3x7/BnmXEgSKbgMweDVkaOhsrS2xRNzxAW+S36VdihZ71KlhPcEWXKYLnxctql
	PGyIKkN2JUzzUq5gI+RFV7j+o4f50pkaX8JiIEU7R0rr790m7OvhZYjz+kKpC/F6Rx4M5m
	tQuBJ1wz7+5x4CKfOdaFD5tITX2BbVOaiHSoP+S9mwFPDzxtOcPk1mIfztFn4w/X9Enpps
	wmvcKZy6bKlcPU/DCJGFMHtFXi5iHjTNQXL2z4HEpj+U8ihoQr1LAPVSxXlrNGXEQMznDr
	6rBlEMo+rKhZruzxqL0hQa97Dc5vb9RHIfcquLTLKdJ3Ep2/6vHUEl40mGJ/Sw==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id aa6sQbPq-m9t; Wed, 18 Nov 2026 19:40:15 +0100 (CET)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 18 Nov 2026 19:40:15 +0100 (CET)
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
Subject: [PATCH net v5 06/14] net: pse-pd: check the PI state under the lock when setting a power limit
Date: Wed, 18 Nov 2026 19:39:49 +0100
Message-ID: <20261118183957.2031311-7-github@szelinsky.de>
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

pse_ethtool_set_pw_limit() checks whether the PI is powered without
pcdev->lock. pse_isr() changes that state under the lock, so if the PD
disconnects in between, budget is reserved for a port that is no longer
powered. The next classification overwrites pw_allocated_mW without
freeing that budget, so it is lost until the controller is bound again.

Do the check in pse_pi_update_pw_budget() under the lock, and report
whether the budget was changed, so the rollback after a failed
regulator_set_current_limit() runs only then. This also rolls back a
budget that started from zero, which the old code skipped.

Found by code inspection. Not reproduced.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 41 ++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index b8cba6f86a7f..342fb27e3831 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1813,22 +1813,35 @@ EXPORT_SYMBOL_GPL(pse_ethtool_set_config);
  * @pcdev: a pointer to the PSE controller device
  * @id: index of the PSE PI
  * @pw_req: power requested
+ * @updated: set to true if the budget was changed
  * @extack: extack for reporting useful error messages
  *
- * Return: Previous power allocated on success and failure value on error
+ * Return: Power allocated before the update, or a negative error code.
+ *	   0 is also returned when the budget was not changed, so callers
+ *	   check @updated before they roll back.
  */
 static int pse_pi_update_pw_budget(struct pse_controller_dev *pcdev, int id,
-				   const unsigned int pw_req,
+				   const unsigned int pw_req, bool *updated,
 				   struct netlink_ext_ack *extack)
 {
 	struct pse_pi *pi = &pcdev->pi[id];
 	int previous_pw_allocated;
 	int pw_diff, ret = 0;
 
+	*updated = false;
+
 	/* We don't want pw_allocated_mW value change in the middle of an
 	 * power budget update
 	 */
 	mutex_lock(&pcdev->lock);
+	/* Only a PI under software power control that is enabled and has a
+	 * PD detected gets a budget. Check this here, as pse_isr() changes
+	 * it under the same lock.
+	 */
+	if (!pse_pw_d_is_sw_pw_control(pcdev, pi->pw_d) ||
+	    !pi->admin_state_enabled || !pi->isr_pd_detected)
+		goto out;
+
 	previous_pw_allocated = pi->pw_allocated_mW;
 	pw_diff = pw_req - previous_pw_allocated;
 	if (!pw_diff) {
@@ -1846,6 +1859,7 @@ static int pse_pi_update_pw_budget(struct pse_controller_dev *pcdev, int id,
 		regulator_free_power_budget(pi->pw_d->supply, -pw_diff);
 	}
 	pi->pw_allocated_mW = pw_req;
+	*updated = true;
 	ret = previous_pw_allocated;
 
 out:
@@ -1866,6 +1880,7 @@ int pse_ethtool_set_pw_limit(struct pse_control *psec,
 			     const unsigned int pw_limit)
 {
 	int uV, uA, ret, previous_pw_allocated = 0;
+	bool updated;
 	s64 tmp_64;
 
 	if (pw_limit > MAX_PI_PW)
@@ -1890,23 +1905,19 @@ int pse_ethtool_set_pw_limit(struct pse_control *psec,
 	uA = DIV_ROUND_CLOSEST_ULL(tmp_64, uV);
 
 	/* Update power budget only in software power control case and
-	 * if a Power Device is powered.
+	 * if the PI is enabled and has a PD detected.
 	 */
-	if (pse_pw_d_is_sw_pw_control(psec->pcdev,
-				      psec->pcdev->pi[psec->id].pw_d) &&
-	    psec->pcdev->pi[psec->id].admin_state_enabled &&
-	    psec->pcdev->pi[psec->id].isr_pd_detected) {
-		ret = pse_pi_update_pw_budget(psec->pcdev, psec->id,
-					      pw_limit, extack);
-		if (ret < 0)
-			return ret;
-		previous_pw_allocated = ret;
-	}
+	ret = pse_pi_update_pw_budget(psec->pcdev, psec->id, pw_limit,
+				      &updated, extack);
+	if (ret < 0)
+		return ret;
+	previous_pw_allocated = ret;
 
 	ret = regulator_set_current_limit(psec->ps, 0, uA);
-	if (ret < 0 && previous_pw_allocated) {
+	if (ret < 0 && updated) {
 		pse_pi_update_pw_budget(psec->pcdev, psec->id,
-					previous_pw_allocated, extack);
+					previous_pw_allocated, &updated,
+					extack);
 	}
 
 	return ret;
-- 
2.43.0

