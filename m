Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027224;
	b=PqHrgSW1O7gMs3J9NCDrV6mRigzzaOWSq0dTc0z/B+DVn/jXRACtBTRi8T7fSZ9/42gf
	 873KRlA8+fZkLqCtnm7I1HVhmJpzTybXd8iCj7eyhYzWtlIsmc6qQkB2PfvwsPonTei3D
	 LRi77VsINhFICtvCJ4ykfP4b2QoPkV0owV8wz63ZSOmuIMINVHLB7Qs2AcKopsuUyOOr4
	 nJOhMIJzTv1/euBRfULTzF5MxDCGARc5Cxd4xV8IWLPtTQOPsWvhPWVuni+Rn26CH87Lg
	 /1GsW5v3P4T9xF7idEX58urePBGfGapwU4ElT9zHbJh1P6gE5MdYQcX5G9i8NRnUNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=EheC/ZPFw6WDRRYzYxjFFav4WADbTdBmCs1opvY1pkc=;
	b=OnJroU9jCO41+vfDEo/Uf1VDK7x5il1ldc4jPpJkwSSORRj3wGkCulj373EqvuIwp27w
	 KMT5LjilFcJA1FOBAGC71AXpgx0SLi87dalfj2Gs5h0JCF6LSOA2hSzbmZLQFrKI4Fk2n
	 fv0I1BPS/J9TccRx93+PYobMB+RZaYvJMMW5VeBchzOY0yVqMg4/9mPJlZ80wbxaz53mX
	 QlD+lbzaG4cx0b2MquhuCMO+E2TfWz1bpEkG6vEmWSKhLP9ZQkdjjZzndClueP3pHtdDG
	 6sUhjr9HON9eoTyWnvMhhQnJn25ni98OZ0nSCL0KgeSKqFMvyxaffY78+fi2lt94e/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=TwS5O13R;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251660A3814;
	Wed, 18 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E251660A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=TwS5O13R
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 33CC4E83ACA;
	Wed, 18 Nov 2026 19:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EheC/ZPFw6WDRRYzYxjFFav4WADbTdBmCs1opvY1pkc=;
	b=TwS5O13Rsi9JLacL6uPU998PNy9JUUqdOagno3eGh4Wt+VwI9DDI0+WiPJvzvmClVsDSaX
	RQxgH46xsUf4FCuTz43EKR2TnawdyJj9fQirhUbMfDLVLDUnfLNHRf+xSykM+gcGrgP4N4
	IFSaFvIWDx4W0lUvsGm6+7s39wsbK1Xhxvzj9DrF7CzsB0qxxqHu7X4Y3XWnmrgvyUKqLT
	8kpUS7pZpZXI6Y81/b/V4CGXnDGi4wffZLFeG8l8bGHLZSBYNyfEsqToCeY2s5EenlBfBR
	DdYe3ZMONzjZj1ud8KUeokqh4acOnzLQKwvP4lmE6kCFudksx4YThjPpp9zGUw==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id dg8E9SbR5LWI; Wed, 18 Nov 2026 19:40:17 +0100 (CET)
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
Subject: [PATCH net v5 10/14] net: pse-pd: keep the PI data until the PI regulators are gone
Date: Wed, 18 Nov 2026 19:39:53 +0100
Message-ID: <20261118183957.2031311-11-github@szelinsky.de>
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

pse_controller_unregister() frees the PI array, but the PI regulators
are only unregistered after it, by devres. Until then their ops still
run, for example on a read of the regulator's sysfs "state" or when a
consumer enables or disables the PI, and they read the freed array.

Free the PI array from a devm action that is added before the PI
regulators, so devres frees it after them. This also frees it when
registration fails, where it was leaked before.
A consumer that still holds the PI after the unbind is an older
problem that this patch does not fix, see the cover letter.

This needs "net: pse-pd: do not tie a shared power domain to its
creator's devres" and "net: pse-pd: stop async event sources before
freeing PI data in unregister". Without them, the regulator ops still
reach a freed power domain, or a kfifo and work item that are already
torn down.

Triggered in QEMU (arm64, KASAN) with a test-only PSE controller:
reading the PI regulators' sysfs "state" while the controller unbinds
gives

  BUG: KASAN: slab-use-after-free in pse_pi_is_enabled+0x294/0x2d4

With this patch it is gone.

Fixes: d83e13761d5b ("net: pse-pd: Use regulator framework within PSE framework")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index edca02438727..134c273487ba 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -149,6 +149,11 @@ static void pse_release_pis(struct pse_controller_dev *pcdev)
 	kfree(pcdev->pi);
 }
 
+static void devm_pse_release_pis(void *data)
+{
+	pse_release_pis(data);
+}
+
 /**
  * of_load_pse_pis - load all the PSE PIs
  * @pcdev: a pointer to the PSE controller device
@@ -1121,6 +1126,13 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	if (ret)
 		return ret;
 
+	/* The PI regulator ops use pcdev->pi until devres unregisters the
+	 * regulators, so free it from devres too, after them.
+	 */
+	ret = devm_add_action_or_reset(pcdev->dev, devm_pse_release_pis, pcdev);
+	if (ret)
+		return ret;
+
 	if (pcdev->ops->setup_pi_matrix) {
 		ret = pcdev->ops->setup_pi_matrix(pcdev);
 		if (ret)
@@ -1191,7 +1203,6 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
 	mutex_unlock(&pse_list_mutex);
 	cancel_work_sync(&pcdev->ntf_work);
 	pse_flush_pw_ds(pcdev);
-	pse_release_pis(pcdev);
 	kfifo_free(&pcdev->ntf_fifo);
 }
 EXPORT_SYMBOL_GPL(pse_controller_unregister);
-- 
2.43.0

