Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509653;
	b=b7Dzvd0hF2Ksb6c68ZwEGwzefcp48DiYFuArBuEq1m/XVek0pAUN7DvJOo5+z09PPvQL
	 pFgi6lev/sQTGp/pDIeNhlNtvnoDY8Kv17yrUW/VFja4tR5/YT8Em1IsOPve3jG7CCRMF
	 t14QmRBd4dTEjR32P73WT98bzu4BdACPAv1dossLj3WtOubmeJguWst3fretver+hFt1l
	 OYrk3bfieom3QiYSqSJhdOEzyEFek2e3qYpovaO7yhtSXDe2o0P2zT0ZoCymFisIA8vjP
	 E9dziXjMz3XQ3uS/TE0AVynqhWlTGplFyoFziHA3OGiFxYEwlKtO90aW6i9stNQj/Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509653;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=agdxfkBYJojWWRIWLaHtSMtljmV2GpMfx1fx2xLKRYo=;
	b=voseRrDPHeuAVvMjSsQ3ZgrZhZhIS7BWVR8MEh78hxtGGan0JtSC9rM0UL0ndDdNkhFO
	 hJWPiwE1nwa20+ZdVLXkOQfwb5YyxxQxYi6LZgzIPSTsneX8oSVBYqhVG676BVMUATZON
	 eEX0CZbmEJN2aMAUbzhaQOghpFh8MZZfKn7CTPQaoUPvsxXV8H9XOlZGfRkv2cWQ1RN5C
	 //kj5+t7HqWqRzZipxio6q6z62ESU1FcNlMRfiNvWen1znv0AnAGx2NrHzYRWUh8tOMMS
	 RrYFaLtskeLjsXuSUW2Y4EwWoOzzOlphATwlINThCVTkg4WNNZIVnHoRI8qpwR0agaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b="gnMDpKS/";
	arc=none smtp.remote-ip=117.135.210.7
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCF606A68B;
	Tue, 24 Nov 2026 08:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BCF606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=gnMDpKS/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ag
	dxfkBYJojWWRIWLaHtSMtljmV2GpMfx1fx2xLKRYo=; b=gnMDpKS/1Qp9MY7DfZ
	mepiKUOCYPSo9TOmR4+KwmsbwceSY2DTpn3K7lUZwhCaXSnb/NeinIfArtCSWlgS
	AZ+4ctrlEfSxZH2sSiIcFaiTnRfiReOzWCrAS4L5aM3UcqNs5dZ2eD70R5DYH8MG
	gXZQfG2rKDR1jJwsCSFt/KqUg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnj6VPTQVrkz0bDQ--.63853S2;
	Tue, 24 Nov 2026 16:39:44 +0800 (CST)
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
Subject: [PATCH net v3] net: ibm: emac: attach and start the fixed-link PHY
Date: Tue, 24 Nov 2026 16:39:41 +0800
Message-Id: <20261124083941.2480237-1-xiaolinkui@126.com>
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
X-CM-TRANSID:_____wDnj6VPTQVrkz0bDQ--.63853S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW5CF1rCw1fJrW3XF1fJFb_yoWrZFWfpa
	y8tFySvr1kJ3WfuF4rCrW8JFWY9a1xta4Ut340yws3Wa45Grn7AFW5Aa15tF1ayFyvy3yU
	Zw4UCan3uF4DXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlhFsUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlBCDWmsFTVBYMAAA3G

From: Linkui Xiao <xiaolinkui@kylinos.cn>

emac_init_phy() sets ndev->phydev by hand for a fixed link, so
phy_attach_direct() never runs. The PHY is missing from the netdev's PHY
link topology and ETHTOOL_MSG_PHY_GET dereferences the NULL link_topo in
phy_prepare_data().

Attach it with of_phy_connect(), as this driver already does for the
phy-handle case and as gianfar, fec, davinci_emac and nixge do, and start
it with phy_start(). phylib then resolves the link and calls
emac_adjust_link(), the same as for a real PHY. That callback fills in the
dev->phy speed, duplex and pause that emac_configure() reads to build MR1.
Nothing else fills those in since commit d99b408ed8e5 ("net: phy:
fixed_phy: remove not needed initialization of phy_device members"), so
today a fixed link is programmed as 10 Mbit/s half duplex with flow
control off, whatever the fixed-link property says.

Attaching also means detaching. Without phy_disconnect(), unbind leaves
phydev->attached_dev pointing at a freed netdev, and the next probe fails
with -EBUSY from phy_attach_direct(). The disconnect also stops the
phy-handle path, which calls phy_start() but never phy_stop(). The fixed
PHY is deregistered on the same paths.

Fixes: baab9de385a8 ("net: ibm: emac: use netdev's phydev directly")
Fixes: d99b408ed8e5 ("net: phy: fixed_phy: remove not needed initialization of phy_device members")
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 drivers/net/ethernet/ibm/emac/core.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

v3:
  - dropped 2/2: no phy_read_status() and no hand called
    emac_adjust_link(); the fixed link is started with phy_start() and
    phylib calls the adjust link callback like it does for a real PHY
    (Andrew Lunn)
  - back to a single patch, so no cover letter
  - the of_phy_connect() failure branch no longer deregisters the
    fixed PHY itself: the new err_detach_tah cleanup covers every
    probe failure, so the call was redundant
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
index 1b95b4d5deff..ddf33c029334 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2673,11 +2673,14 @@ static int emac_init_phy(struct emac_instance *dev)
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
+				return -EINVAL;
+
+			phy_start(ndev->phydev);
 		}
 		return 0;
 	}
@@ -3190,6 +3193,10 @@ static int emac_probe(struct platform_device *ofdev)
 	/* I have a bad feeling about this ... */
 
  err_detach_tah:
+	if (ndev->phydev)
+		phy_disconnect(ndev->phydev);
+	if (of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
 	if (emac_has_feature(dev, EMAC_FTR_HAS_TAH))
 		tah_detach(dev->tah_dev, dev->tah_port);
  err_detach_rgmii:
@@ -3223,6 +3230,11 @@ static void emac_remove(struct platform_device *ofdev)
 
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

