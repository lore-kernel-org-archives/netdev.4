Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744135;
	b=BboisnRrajuyujj9/FrO6YYi1ZEFbWvVQEVDhbzdNRZD3pO+VG62qf8WCMmDJyWL/6Yr
	 kSQA9MS/TJt5YH+/4z/pmHgbnYut5VyhW6PVfDGTQ3MlEpj4bN3fkpCkg/ftNRA5dL/ni
	 TwvzIoPocFiT2vbs1rmJmD6t4WazqJwIY9F+SyqMO9WGzLA00/mAKIo8QuKK12Lxphzdh
	 CAk6SjXS2cxVlmNl/oLbG/S9CXI7J0llndautRVBYtpA6dHfLIBCwttBPE5RdvdNPkltr
	 94ZXsz1yMARjvYPmyoT+1BUOrHqZCG1+vQ1kdOnGNZYb9MXsM3g2X6ZiNeh8PqELrWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744135;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Ei++BSoiRPEPSPeUH6i9lyE2YoFoQTgy3YvuapRfk+k=;
	b=jVGmS1eRcl4FhbjCYjlelnEB5QeTnprUt5fDG3JjXRNnyzc1wo8+04w1YI1HAB+3n1+S
	 N2lrq/xvgxf+AzEHq+WzJaEgWM4Qw7IJOSrFWZrp2cUaCVEeKsOGxUb1ga7qYiji6CgHM
	 jkx0ve5C27vSqmGtlhL3BItjynYaU6MQZ55RuvbmRCiwJn7vIU5AMxcc9/ZaGMJgdQeAx
	 DCtxXxDYOnQQGf80eFvUMgw2f5b3fSD31lwGkxOku5XFj/N1Bos/EHNlkxBjGc51nmR7u
	 1RCZXv3WrcFaFpKn/c5cFoNoWylsp6FYSSfYOpyeq0QWL29avIcRHEFNcO5WG3H/IBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JY8W6kHO;
	arc=none smtp.remote-ip=220.197.31.8
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5E606A31C;
	Fri, 27 Nov 2026 01:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JY8W6kHO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ei
	++BSoiRPEPSPeUH6i9lyE2YoFoQTgy3YvuapRfk+k=; b=JY8W6kHOxfjsockgoS
	/5q9DqafCT7QBbclYB5+hgvwS/hfNOuy5+LkGXf2v2t2JHaRkISgrzy7Xg32ERDa
	ODJnRX0AMaPPcPTnCAVcfLFrZCtJIAny+sjNWIyTgbpgMkbrTqLiJZJ411OF2xjt
	sT6XQ39iPY2adgzwZd1nAyvxg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgD33+1H4Qhr0l0ADg--.53262S2;
	Fri, 27 Nov 2026 09:47:52 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: [PATCH net v4] net: ibm: emac: attach and start the fixed-link PHY
Date: Fri, 27 Nov 2026 09:47:48 +0800
Message-Id: <20261127014748.2908781-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PSkvCgD33+1H4Qhr0l0ADg--.53262S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFyrZr4fury3Cw47tw15CFg_yoWxZFy5pa
	yktFyFkr4kJF4S9FsxCay8JFyku3Z7ta45C34Iv393uFy5GryxArWYg345tF1ayF95A3yj
	vw4UAa95uF4DJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlhFsUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqQlnPmsI4UkPNAAA3J

From: Linkui Xiao <xiaolinkui@kylinos.cn>

emac_init_phy() sets ndev->phydev by hand for a fixed link, so
phy_attach_direct() never runs. The PHY is missing from the netdev's PHY
link topology and ETHTOOL_MSG_PHY_GET dereferences the NULL link_topo in
phy_prepare_data().

Attach it with of_phy_connect(), as this driver already does for the
phy-handle case and as gianfar, fec, davinci_emac and nixge do, and start
it through emac_mdio_init_phy(), the handler that starts a real PHY here.
phylib then resolves the link and calls emac_adjust_link(), which fills in
the dev->phy speed, duplex and pause that emac_configure() reads to build
MR1. Nothing else fills those in since commit d99b408ed8e5 ("net: phy:
fixed_phy: remove not needed initialization of phy_device members"), so
today a fixed link is programmed as 10 Mbit/s half duplex with flow
control off, whatever the fixed-link property says.

phy_start() only queues the state machine, so an emac_open() that wins the
race against the first emac_adjust_link() still builds MR1 from the probe
defaults, and a fixed link never changes state again for a second callback
to correct it. That window is the one the phy-handle path has always had,
this driver starts its PHY at probe time rather than in ndo_open, and the
next ifdown/ifup closes it.

Attaching also means detaching, and commit baab9de385a8 ("net: ibm: emac:
use netdev's phydev directly") dropped the phy_disconnect() from
emac_remove() together with dev->phy_dev. Since then neither a fixed link
nor a phy-handle PHY is detached: unbind leaves phydev->attached_dev
pointing at a freed netdev, and the next probe fails with -EBUSY from
phy_attach_direct(). Restore it, and deregister the fixed PHY on the same
paths.

The PHY is stopped before unregister_netdev() rather than left to
phy_disconnect(). phy_stop() turns the carrier off, which queues a
linkwatch event, and unregister_netdev() is what drains the queue.
phy_disconnect() cannot move up with it, detaching a PHY from a
registered netdev wants RTNL.

Found during an audit of net/ethtool/ carried out with an AI coding
assistant (Codex), not on hardware.

Fixes: baab9de385a8 ("net: ibm: emac: use netdev's phydev directly")
Fixes: d99b408ed8e5 ("net: phy: fixed_phy: remove not needed initialization of phy_device members")
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 drivers/net/ethernet/ibm/emac/core.c | 33 +++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

v4:
  - start the fixed PHY through emac_mdio_init_phy(), the mii_phy_ops
    init handler this driver already starts a real PHY with, instead of a
    bare phy_start() (Andrew Lunn)
  - stop the PHY in emac_remove() before unregister_netdev(): phy_stop()
    turns the carrier off, and a carrier change after unregister_netdev()
    leaves this netdev on the linkwatch list for the linkwatch work to
    pick up after devres has freed it (Sashiko AI review)
  - name commit baab9de385a8 ("net: ibm: emac: use netdev's phydev
    directly") in the commit message as the one that dropped
    phy_disconnect() from emac_remove() (Sashiko AI review)
  - state how the issue was found and that there is no runtime test, plus
    the generated-content disclosure (netdev-bot+sinfo)
v3: https://lore.kernel.org/netdev/20261124083941.2480237-1-xiaolinkui@126.com/
  - dropped 2/2: no phy_read_status() and no hand called
    emac_adjust_link(); the fixed link is started and phylib calls the
    adjust link callback like it does for a real PHY (Andrew Lunn)
  - the of_phy_connect() failure branch no longer deregisters the fixed
    PHY itself: the err_detach_tah cleanup covers every probe failure
v2: https://lore.kernel.org/netdev/20261123093201.770552-1-xiaolinkui@126.com/
  - 1/2: rewrote the commit message by hand (Andrew Lunn)
  - 1/2: disconnect the PHY in emac_remove() and on probe failure, and
    deregister the fixed PHY when of_phy_connect() fails (Andrew Lunn,
    Sashiko AI review)
  - 2/2: new, read the link status so emac_adjust_link() no longer copies
    SPEED_UNKNOWN into dev->phy (Sashiko AI review)
v1: https://lore.kernel.org/netdev/20261112075321.3903875-1-xiaolinkui@126.com/

Cross compiled for powerpc out of ppc44x_defconfig with W=1, clean. No
hardware here, so no runtime test.

Per Documentation/process/generated-content.rst: the change and the commit
message were developed with an AI coding assistant; the analysis, the build
testing and the review are mine.

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 1b95b4d5deff..27b79f897e36 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2673,11 +2673,17 @@ static int emac_init_phy(struct emac_instance *dev)
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
+					    dev->phy_mode))
+				return -ENODEV;
+
+			/* Start it the same way as a real PHY. */
+			res = emac_mdio_init_phy(&dev->phy);
+			if (res)
+				return res;
 		}
 		return 0;
 	}
@@ -3190,6 +3196,10 @@ static int emac_probe(struct platform_device *ofdev)
 	/* I have a bad feeling about this ... */
 
  err_detach_tah:
+	if (ndev->phydev)
+		phy_disconnect(ndev->phydev);
+	if (of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
 	if (emac_has_feature(dev, EMAC_FTR_HAS_TAH))
 		tah_detach(dev->tah_dev, dev->tah_port);
  err_detach_rgmii:
@@ -3214,6 +3224,14 @@ static void emac_remove(struct platform_device *ofdev)
 
 	DBG(dev, "remove" NL);
 
+	/* Stop the PHY first: phy_stop() turns the carrier off and queues a
+	 * linkwatch event, which unregister_netdev() then drains.
+	 * phy_disconnect() has to stay below, detaching a PHY from a
+	 * registered netdev wants RTNL and we do not hold it here.
+	 */
+	if (dev->ndev->phydev)
+		phy_stop(dev->ndev->phydev);
+
 	/* Unregister network device before tearing down hardware
 	 * to prevent use-after-free during deferred cleanup. This ensures
 	 * the network stack stops all operations before hardware resources
@@ -3223,6 +3241,11 @@ static void emac_remove(struct platform_device *ofdev)
 
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

