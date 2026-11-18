Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027224;
	b=ZAt+5xlFn+mNpVDNuxO7ryJPURaigTXMy1iIgeh3/wvdgeoPWD54oAwak4WMj8urpv2U
	 KN6kduQYVfhT9/NjY6ZLjaJqMbIh8TNqBpTm0JKGDbHt6rSterzfZTHxMVerWIfK2OOzh
	 D6K4FpkTvfuDLm2c7+GD85d+MQAuiDLVbnONPAGf36c5LZNWD727XFJczjfNkVtrUzmuU
	 XWmNoHMrZvG0ww83BZGslTdvGVrfVi0EJWYvvxKnE/1dYhqAAuyZIa+pUFw6IT1dn6OHv
	 lTv2yMV6lthBjHA9V3ANNq4dJvjhfyG5hPpNpiDOho3jU/Glimfi9jDs1Bnic7YsSUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Sr7vf+SFkssrnc9KbqlXYbg5jl/Kfa3M9hZnigDcNWM=;
	b=P+Hyr9McqddN0mnaj/MhZhwaXMs1lET0fPAHdlQ1uOxr2TA+oTyhEF8UGxglbZrDyAZD
	 hRl/OSeFqg5/pThQ6KyWpoM3ak6Vrytw+/Sv+npExuWZbPyPnaalY/sSRTQiJ6/P4Az3u
	 aBxBIFykXpm7ZpLoSVcpbR9Uh2uiyvmXREPBksKeouachjeKADDTf5suwkKg3daENCTS0
	 xfpCYNo0xKTkAjyJBI98XnOPPynyU467LGoDQVTp2Phtzikv++Zdna4I1Bhf4afCs/9Ab
	 c4UtpbM3K9pFzuzFKO/Y4tDeU8kl0cTvKa4gGJwbI2uaBKgLsk38h7geavOWCB8ZmeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=hKL4rXvr;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F660A261D;
	Wed, 18 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6F660A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=hKL4rXvr
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 4A83FE83AB1;
	Wed, 18 Nov 2026 19:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1795027215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sr7vf+SFkssrnc9KbqlXYbg5jl/Kfa3M9hZnigDcNWM=;
	b=hKL4rXvrZXxViDWACLjgRLUkBwVwikzEivCjNaDzNsIMF+zOYIxw3SXDMmfMd3ZkUjYDfS
	S/3u7qNbq/cQiJU1FgdToofKZYrpAlhxoJISKEYfLJHu6gAYlYJ6kpcfZBAFrXyrMdUTUv
	tw6fR8oKhSiEViT4udo/0GBgrm3uMWSrfT9zC82P3NCTiIYuImmWQ58WVTmuk4CzjbB8Tv
	huacMV/Ub71i7Iwn8NoW+yJFrf5UfXrAqR2cPGq2Ysm1IXlbuLS8w8tPIQ0LeUbaipTPNh
	/U0y3YSQlyvQOixCcqhyLddUxRU+l9a/3o8Mrwy2rCa7RGhSiOVF53quG+HCXg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id 1KkhodlPozkt; Wed, 18 Nov 2026 19:40:15 +0100 (CET)
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
Subject: [PATCH net v5 05/14] net: pse-pd: do not reach a freed PHY from the notification worker
Date: Wed, 18 Nov 2026 19:39:48 +0100
Message-ID: <20261118183957.2031311-6-github@szelinsky.de>
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

The notification worker holds a reference on the pse_control, but not
on the PHY that psec->attached_phydev points to. If the PHY is removed
while the worker runs, the pse_control survives and the worker reads the
freed PHY. The same happens without a race when two PHYs share one PI:
attached_phydev keeps pointing at the first PHY after it is removed.

pse_control_put() unlinks and frees a pse_control under pse_list_mutex,
and phy_device_remove() calls it before the PHY is freed. So instead of
taking a reference, let the worker look the pse_control up and use
attached_phydev under pse_list_mutex. This nests pse_list_mutex inside
rtnl; nothing under pse_list_mutex takes rtnl.

For a PI shared by two PHYs there is no single netdev to report to, so
clear attached_phydev when a second PHY takes the pse_control, and warn.
Events for that PI are then no longer reported, even after one PHY goes
away. Failing the second PHY instead would fail its whole MDIO bus.

Triggered in QEMU (arm64, KASAN) with a test-only PSE controller:
removing a PHY while the worker waits for rtnl, and removing one of
two PHYs on a shared PI, both give

  BUG: KASAN: slab-use-after-free in pse_send_ntf_worker+0x2b0/0x2bc

With this patch both are gone.

Fixes: fc0e6db30941 ("net: pse-pd: Add support for reporting events")
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 42 ++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 0894613515e0..b8cba6f86a7f 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -31,7 +31,9 @@ static DEFINE_MUTEX(pse_pw_d_mutex);
  * @list: list entry for the pcdev's PSE controller list
  * @id: ID of the PSE line in the PSE controller device
  * @refcnt: Number of gets of this pse_control
- * @attached_phydev: PHY device pointer attached by the PSE control
+ * @attached_phydev: PHY device pointer attached by the PSE control, or NULL
+ *                   when several PHYs share the PI. Read it only under
+ *                   pse_list_mutex.
  */
 struct pse_control {
 	struct pse_controller_dev *pcdev;
@@ -238,24 +240,22 @@ static int of_load_pse_pis(struct pse_controller_dev *pcdev)
  * @pcdev: a pointer to the PSE
  * @id: index of the PSE control
  *
- * Return: pse_control pointer or NULL. The device returned has had a
- *	   reference added and the pointer is safe until the user calls
- *	   pse_control_put() to indicate they have finished with it.
+ * Must be called with pse_list_mutex held. No reference is taken: the
+ * pointer is only valid until pse_list_mutex is released.
+ *
+ * Return: pse_control pointer or NULL.
  */
 static struct pse_control *
 pse_control_find_by_id(struct pse_controller_dev *pcdev, int id)
 {
 	struct pse_control *psec;
 
-	mutex_lock(&pse_list_mutex);
+	lockdep_assert_held(&pse_list_mutex);
+
 	list_for_each_entry(psec, &pcdev->pse_control_head, list) {
-		if (psec->id == id) {
-			kref_get(&psec->refcnt);
-			mutex_unlock(&pse_list_mutex);
+		if (psec->id == id)
 			return psec;
-		}
 	}
-	mutex_unlock(&pse_list_mutex);
 	return NULL;
 }
 
@@ -263,11 +263,14 @@ pse_control_find_by_id(struct pse_controller_dev *pcdev, int id)
  * pse_control_get_netdev - Return netdev associated to a PSE control
  * @psec: PSE control pointer
  *
- * Return: netdev pointer or NULL
+ * Must be called with rtnl and pse_list_mutex held.
+ *
+ * Return: netdev pointer, or NULL if no single PHY is attached
  */
 static struct net_device *pse_control_get_netdev(struct pse_control *psec)
 {
 	ASSERT_RTNL();
+	lockdep_assert_held(&pse_list_mutex);
 
 	if (!psec || !psec->attached_phydev)
 		return NULL;
@@ -1014,13 +1017,18 @@ static void pse_send_ntf_worker(struct work_struct *work)
 		struct net_device *netdev;
 		struct pse_control *psec;
 
-		psec = pse_control_find_by_id(pcdev, ntf.id);
+		/* pse_control_put() frees the pse_control under
+		 * pse_list_mutex before its PHY is freed, so the mutex
+		 * keeps attached_phydev valid.
+		 */
 		rtnl_lock();
+		mutex_lock(&pse_list_mutex);
+		psec = pse_control_find_by_id(pcdev, ntf.id);
 		netdev = pse_control_get_netdev(psec);
 		if (netdev)
 			ethnl_pse_send_ntf(netdev, ntf.notifs);
+		mutex_unlock(&pse_list_mutex);
 		rtnl_unlock();
-		pse_control_put(psec);
 	}
 }
 
@@ -1410,6 +1418,14 @@ pse_control_get_internal(struct pse_controller_dev *pcdev, unsigned int index,
 
 	list_for_each_entry(psec, &pcdev->pse_control_head, list) {
 		if (psec->id == index) {
+			if (psec->attached_phydev &&
+			    psec->attached_phydev != phydev) {
+				dev_warn(pcdev->dev,
+					 "PI %u shared by several PHYs, not reporting its events\n",
+					 index);
+				psec->attached_phydev = NULL;
+			}
+
 			kref_get(&psec->refcnt);
 			return psec;
 		}
-- 
2.43.0

