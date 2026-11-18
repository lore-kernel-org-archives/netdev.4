Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027224;
	b=rEpNXM86n9xp92MWE4SvBi55znP6EQ9mFtNR9kymw2OJhu+iGoMRTzZiOnkgBp3KAUBE
	 +IfmtJwbFX3a0+6URQTPFuAGeeCJNZTsqELDnbW5ukSQJxqcWBuWdtdbRlcZtJ4xbqUXo
	 t4aCJNsfwnWj3Ha06N052ON8rqzrpAOJSp7LrxO5jOzfeuurnCBnjU0YJk5iVIjI5jXHZ
	 eF+42J0YiP2Ks5uO5RJMGC3rkXUg9liULXh/1wfXgzliwCqEFZj1RqFjvhCxDKxi4vPqD
	 +8Lth0I+lLS7PY0wjP0o3K33q31sERe4hS6aZhuGCxVVhNwPvuN3HVW0k6bkWycjy7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=s32Pe0Fi5AnPR46ou7cUGywHtePZPEoUm0LEF5HztYc=;
	b=HF2M7puWYAqU5nCv+OYC3eO6gaj98RF9eABKBz54wS06SZoLelML5bl9+355YWIcNb5g
	 l+cD/XWI9/i7fF0yLVTWWZlVwjMQxoba4iS+Hl6wuznZ7SJh65a4OfV7C0BBevwn3NrX9
	 s2Y4hgGdpJi4oE6lZF5eu6Ssoo4dpgk9SyLjRPW6URtoUl+TVZrUcI/4v0TEd0G95GbB6
	 0Dg+lkqSRmty0Qgml6PLbIp1gAgQOQTMK1bj7znZtgA2D384L6q3ORVoUtxvUvHQsTnlH
	 RREPQWaeP+U4rAxRl6HGye4xKzJWHUGmAGlgaYwnqSYmxxtQxeutLmRz3OjbpkCe5WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=A6YErSni;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B060A380D;
	Wed, 18 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2B060A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=A6YErSni
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 8D74AE83AC3;
	Wed, 18 Nov 2026 19:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s32Pe0Fi5AnPR46ou7cUGywHtePZPEoUm0LEF5HztYc=;
	b=A6YErSni/JAtwmMJViurvynorzRm3jwldSsuwHGBAp5usfYp5VTJQzKViv7/Cahmh7Qc3a
	l0uXzPOscAP0Is76BW4WrPGx+rho5RosZma1+C2hOtWTSsDMV8NsYlup1oRTnJHPd/xZo7
	PQXj0FdBsu26srI57aTF1F/zGCsDxdoXyQT7Uz9T7svDhoB8dEDJhdBlNT4lojyNUTUk1a
	Z9N/VowXf8nReLKOwthj5KpvWxUzJdWW0wbcI9MfyXOwG7PVWVw3G2XOD03lP2rIkIPhd6
	9QR8QoChC/4oErQOOvnq+fO5nsZCpzGvBIKZunSr2JSZxp7JbGMdrjxUWFEfOw==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 8Ff2QIWk8ySd; Wed, 18 Nov 2026 19:40:16 +0100 (CET)
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
Subject: [PATCH net v5 08/14] net: pse-pd: stop async event sources before freeing PI data in unregister
Date: Wed, 18 Nov 2026 19:39:51 +0100
Message-ID: <20261118183957.2031311-9-github@szelinsky.de>
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

pse_controller_unregister() flushes the power domains and frees the PI
array before it disables the IRQ, while pse_isr() uses both. No in-tree
driver hits this: tps23881, the only user of devm_pse_irq_helper(),
requests its IRQ after it registers the controller, so devres frees
the IRQ before unregister runs. A driver that keeps its IRQ across
unregister would read freed memory.

Disable the IRQ and drain the notification worker first, and only then
flush the power domains and release the PI array.

The worker can also be queued again after the drain. With the static
budget strategy, powering a PI can switch off a PI of lower priority
through pse_disable_pi_pol(), which queues the worker. A PI is powered
from pse_isr(), from a priority change, from the retry after a disable,
and when a consumer enables it. All of these go through pse_pi_enable()
or _pse_pi_delivery_power_sw_pw_ctrl().

So pse_controller_unregister() now first sets pcdev->unregistering
under pcdev->lock. After that, both functions return -ENODEV, and
pse_isr() does not try to power a PI, so it does not report a false
power control error. Disabling a PI still works.

The next patches in this series build on this order.

Found by code inspection and AI review.

Fixes: ffef61d6d273 ("net: pse-pd: Add support for budget evaluation strategies")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 31 ++++++++++++++++++++++++++++---
 include/linux/pse-pd/pse.h    |  3 +++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 8041ad3e330b..22f2d8041bd4 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -616,6 +616,13 @@ static int _pse_pi_delivery_power_sw_pw_ctrl(struct pse_controller_dev *pcdev,
 	struct pse_pi *pi = &pcdev->pi[id];
 	int ret, pw_req;
 
+	/* pse_isr(), a priority change and the retry after a disable all
+	 * power a PI through here, so stop them here once unregistering
+	 * has started.
+	 */
+	if (pcdev->unregistering)
+		return -ENODEV;
+
 	if (!ops->pi_get_pw_req) {
 		/* No power allocation management */
 		ret = ops->pi_enable(pcdev, id);
@@ -672,6 +679,11 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 
 	id = rdev_get_id(rdev);
 	mutex_lock(&pcdev->lock);
+	if (pcdev->unregistering) {
+		mutex_unlock(&pcdev->lock);
+		return -ENODEV;
+	}
+
 	if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[id].pw_d)) {
 		/* Manage enabled status by software.
 		 * Real enable process will happen if a port is connected.
@@ -1158,11 +1170,22 @@ EXPORT_SYMBOL_GPL(pse_controller_register);
  */
 void pse_controller_unregister(struct pse_controller_dev *pcdev)
 {
-	pse_flush_pw_ds(pcdev);
-	pse_release_pis(pcdev);
+	/* From now on the PSE core must not power a PI, so nothing queues
+	 * a new notification once the worker is drained below.
+	 */
+	mutex_lock(&pcdev->lock);
+	pcdev->unregistering = true;
+	mutex_unlock(&pcdev->lock);
+
+	/* Stop the IRQ and the notification worker first: pse_isr() uses
+	 * pcdev->pi and the power domains that pse_flush_pw_ds() drops,
+	 * and the worker reads the kfifo that is freed below.
+	 */
 	if (pcdev->irq)
 		disable_irq(pcdev->irq);
 	cancel_work_sync(&pcdev->ntf_work);
+	pse_flush_pw_ds(pcdev);
+	pse_release_pis(pcdev);
 	kfifo_free(&pcdev->ntf_fifo);
 	mutex_lock(&pse_list_mutex);
 	list_del(&pcdev->list);
@@ -1266,7 +1289,9 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 		struct netlink_ext_ack extack;
 
 		pcdev->pi[id].isr_pd_detected = true;
-		if (pcdev->pi[id].admin_state_enabled) {
+		/* Powering a PI fails once unregister started, do not try */
+		if (pcdev->pi[id].admin_state_enabled &&
+		    !pcdev->unregistering) {
 			ret = _pse_pi_delivery_power_sw_pw_ctrl(pcdev, id,
 								&extack);
 			if (ret == -ERANGE)
diff --git a/include/linux/pse-pd/pse.h b/include/linux/pse-pd/pse.h
index 4e5696cfade7..a917ac32dc0c 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -298,6 +298,8 @@ struct pse_ntf {
  * @ntf_work: workqueue for PSE notification management
  * @ntf_fifo: PSE notifications FIFO
  * @ntf_fifo_lock: protect @ntf_fifo writer
+ * @unregistering: set under @lock when unregistering starts; the PSE
+ *		   core switches no PI on after that
  */
 struct pse_controller_dev {
 	const struct pse_controller_ops *ops;
@@ -317,6 +319,7 @@ struct pse_controller_dev {
 	struct work_struct ntf_work;
 	DECLARE_KFIFO_PTR(ntf_fifo, struct pse_ntf);
 	spinlock_t ntf_fifo_lock; /* Protect @ntf_fifo writer */
+	bool unregistering;
 };
 
 /**
-- 
2.43.0

