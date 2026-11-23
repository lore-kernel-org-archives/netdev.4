Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426382;
	b=A+fcxcgwEggPEErFl4Z14m8WmQ4OQG2A3Pd2ommw38pS0iPY8YnTd6YokDxtjLDr+UWZ
	 nJWr+Wq7U9izmMvQnrb4uiG6R3xznNug3lSH9LYT/XbhK4dRnB5Dsq3/ZBEvCMauoNGIL
	 UYgOI/XI32IhZsIAeWxrMyMAyNUfAasDQttoOJ7Qrbbkl34FeuOSm16nXBi8Noq/ByvZW
	 s27KDIs5RkAd+DTqmCOTTG93k4E0saXF8lrtO6RLrlaEWB71gX1So/id9LHSoNoJJ6n4a
	 V9hswXu5YRsWatnoqdiKf7FX3hzqyoMe76MbH254XI3GELUrXOV4oSwpiX3s3NBdIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426382;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=wrjg8TZ8INRRg9uXoP5xNjhHU0X/jN5Y6VKk62t4djE=;
	b=GCstBIKjjIRCXGu6fNHkjyUqjN+FTh20IDrmpwx6Mgl95QXBvOGt6pRL426VggH8jGKZ
	 IhRy9/1AqQkeag+sIB+BFQwXTQdWJUEFT5SxhseI00QBwcoWret3L4tdJRjRBAln+l7cR
	 d87FxJVl0BoENyVmppRpyBDXGy5HyIcbOlOPbnoTqSZoGFHkGsx3XmM+gZ0hk0u9EDJ6a
	 eOMXxTeI03AD6FghvaTo8JeBBf533g4dk6PXbBQvtmfLx8jRDWHPQdwPNM6BNYlI3p9v0
	 HvBxMjnWKQGaaqbXRUZKpGzFo1cr8PrAknFqfdb7S9E76HLNB33/XpJtPyBQ4f/wXCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=U45FqInJ;
	arc=none smtp.remote-ip=220.197.31.7
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFBB606A31A;
	Mon, 23 Nov 2026 09:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFBB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=U45FqInJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wr
	jg8TZ8INRRg9uXoP5xNjhHU0X/jN5Y6VKk62t4djE=; b=U45FqInJt1Kh9ViYd3
	KJSC1WYpRG7MT2YPq09FQjocb47vFnShY5xcspQLvmF9f0bOSI7uMhC9YTc4aXhK
	XLOwJxw4Uk8rykXvVdGE7kTIeFzrfGz2alIiUqO6S6pHn/adB3SnjXJVQwMCibLg
	yom2Z1zgx7GfsuvoMrOP6oJJg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3l7UTCARrlp7DDw--.2488S3;
	Mon, 23 Nov 2026 17:32:06 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: andrew@lunn.ch
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	rosenp@gmail.com,
	jacob.e.keller@intel.com,
	daniel.machon@microchip.com,
	chunkeey@gmail.com,
	kees+treewide@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xiaolinkui@kylinos.cn
Subject: [PATCH net v2 1/2] net: ibm: emac: attach the fixed-link PHY with of_phy_connect()
Date: Mon, 23 Nov 2026 17:32:00 +0800
Message-Id: <20261123093201.770552-2-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123093201.770552-1-xiaolinkui@126.com>
References: <20261123093201.770552-1-xiaolinkui@126.com>
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
X-CM-TRANSID:PykvCgD3l7UTCARrlp7DDw--.2488S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW5ur43Zr1fXF15ZFyfCrg_yoW5Ww15pa
	ykGFySvrykJF1fWanxArWUAFW5ua1xta48t34Iyws3WF9xGr1kAFy5ZF1Utr1ayFZ5ZrWU
	Xw47Jay3uF4DXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVGQDUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqBbiuWsECBZl7AAA3d

From: Linkui Xiao <xiaolinkui@kylinos.cn>

emac_init_phy() sets ndev->phydev by hand for a fixed link, so
phy_attach_direct() never runs: the PHY stays out of the netdev's PHY
link topology, and ETHTOOL_MSG_PHY_GET then dereferences a NULL
link_topo in phy_prepare_data().

Use of_phy_connect(), as gianfar, fec, davinci_emac and nixge do, and as
this driver already does for the phy-handle case.  It attaches the PHY
and drops the of_phy_find_device() reference, so put_device() goes away.
It only installs emac_adjust_link() as phydev->adjust_link though, and
the state machine is not started for a fixed link, so the explicit call
that copies the link parameters into dev->phy stays.

Attaching also means detaching.  Without phy_disconnect(), unbind leaves
phydev->attached_dev pointing at a freed netdev and the next probe fails
with -EBUSY from phy_attach_direct().  This fixes the phy-handle path as
well, which calls phy_start() but never phy_stop().

Fixes: baab9de385a8 ("net: ibm: emac: use netdev's phydev directly")
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 drivers/net/ethernet/ibm/emac/core.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 1b95b4d5deff..ba02cf878a12 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2673,11 +2673,16 @@ static int emac_init_phy(struct emac_instance *dev)
 				return res;
 
 			res = of_phy_register_fixed_link(np);
-			ndev->phydev = of_phy_find_device(np);
-			if (res || !ndev->phydev)
-				return res ? res : -EINVAL;
-			emac_adjust_link(dev->ndev);
-			put_device(&ndev->phydev->mdio.dev);
+			if (res)
+				return res;
+
+			if (!of_phy_connect(ndev, np, &emac_adjust_link, 0,
+					    dev->phy_mode)) {
+				of_phy_deregister_fixed_link(np);
+				return -EINVAL;
+			}
+
+			emac_adjust_link(ndev);
 		}
 		return 0;
 	}
@@ -3190,6 +3195,10 @@ static int emac_probe(struct platform_device *ofdev)
 	/* I have a bad feeling about this ... */
 
  err_detach_tah:
+	if (ndev->phydev)
+		phy_disconnect(ndev->phydev);
+	if (of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
 	if (emac_has_feature(dev, EMAC_FTR_HAS_TAH))
 		tah_detach(dev->tah_dev, dev->tah_port);
  err_detach_rgmii:
@@ -3223,6 +3232,11 @@ static void emac_remove(struct platform_device *ofdev)
 
 	cancel_work_sync(&dev->reset_work);
 
+	if (dev->ndev->phydev)
+		phy_disconnect(dev->ndev->phydev);
+	if (of_phy_is_fixed_link(ofdev->dev.of_node))
+		of_phy_deregister_fixed_link(ofdev->dev.of_node);
+
 	if (emac_has_feature(dev, EMAC_FTR_HAS_TAH))
 		tah_detach(dev->tah_dev, dev->tah_port);
 	if (emac_has_feature(dev, EMAC_FTR_HAS_RGMII))
-- 
2.25.1

