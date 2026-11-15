Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784176;
	b=V5UyaAQ0Mqqimps2r5Gy7m29JvqJRFgbqnMRMmVgwRfUCjv/bEJiqfNve7r4CBuVzX+J
	 o7XqSh+0+vOKPQ0u+K7PcnpPGMZZMsw4bZstTHc0HOx8mAsyKmAwWulhOLLUgJ7mY7yuu
	 nBFU8bO+5SY8KYeMqA8d+PE5OQDrDCZK8HT4uBTZmo+ZqzIL4o2aME0IIvVh/PEb9TIhX
	 1GmahuJ5mMLTC8Qeuva7dw/PpU6i7vdSohmxoU1bl5OVXDZw3PZYnc6zu6KdUC37nwr5W
	 YyaTXNA/rZ9Jmih4rh6iWX38+pwEwkGe/unwEUBzYr7Xfzm+Xs/sBBqlwR9tyWR3eLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784176;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fcySjAgXRv1Omeu2uLTfEyvofesTjl/NbY/HSOVg4ec=;
	b=aSG9D6UqcFcrymuTlkFEkft1AXX2FCFUKeNhGAZp87kkeFCCiyc7aWHFD9L2Ir2r8FTV
	 Ly12SIiM603T/JkDfqF9/p/79Ptv5kDSofejEynq7kzUZQLo8BDV8Zg1UZXOGNijb59n3
	 RqJiLUXDMlCDiUZj0flckmet1jbBdajplVtli9o61trkxS7Iyne56fjE/hpDdbcmk9RoT
	 1FFLVGGjUYeV8ePln2VkjsZUV9qrWq9LkwfCJvIS6OHvOlY821nfcHdvppaXDlR6AbtEf
	 aCpCenwYEqGyA6Xy5uidEjl8Zy4VLRFqX6wIkUOj6fXNVu+S0vagyeGLFPFdHhiU7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMyHLiEA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4940C606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 23:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iMyHLiEA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAA91F000C4;
	Sun, 15 Nov 2026 23:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794784175;
	bh=fcySjAgXRv1Omeu2uLTfEyvofesTjl/NbY/HSOVg4ec=;
	h=From:To:Cc:Subject:Date;
	b=iMyHLiEABx76W2qPYcp0ne+sEnp5KPMJy5xjquofbvVyKJQWSukK2XnTkD4Lvvn1r
	 P6p1bFEMleM9RA9sp7i10x70XNa/43rnF2EP5pGa+lfKYsKK/0RyPHl96zu9yxmMWs
	 WEeEobMW1mKfgJaR91GUpKPQ6tjGkd+xtsG5Dju9+UH31QwnaqF2lswUNHJRWgeUzT
	 BtuMCV1l9ziMKT9ix6zMP74QqtH1a+rXMJhCLBYdU82GpBmqALpKiL6Miq/wljefrn
	 zr1X1y/YPjseLcpihooW0cZ5GvC5BdoqAlTVNe8utzm/g7UKSpIgemIau7H0L2m5zT
	 TnDN01xU0y+eQ==
From: Imre Kaloz <kaloz@kernel.org>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Elad Nachman <enachman@marvell.com>,
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>
Subject: [PATCH net v2] net: marvell: prestera: disable port before changing its MAC mode
Date: Mon, 16 Nov 2026 00:08:12 +0100
Message-ID: <20261115230812.29644-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

prestera_pcs_config() writes a new mode, speed or inband setting to an
enabled port. The firmware can then report link down until the port is
disabled and enabled again.

Disable the port before such a write. 2500BASE-X and SGMII share one MAC
mode, so SGMII sets its own speed and the speed is compared as well.
Exercising this needs a link partner, so no in-tree test covers it.

Fixes: 52323ef75414 ("net: marvell: prestera: add phylink support")
Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
Changes in v2:
- Also disable the port on a speed change and set the SGMII speed, so
  that a switch between 2500BASE-X and SGMII, which share one MAC mode,
  is covered.
- Elad's Reviewed-by from v1 is not carried over, given the changes to the logic.
- Link to v1: https://lore.kernel.org/netdev/20261111101521.9878-1-kaloz@kernel.org/

 .../ethernet/marvell/prestera/prestera_main.c   | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
index a82e7a8029851..3173145573600 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c
@@ -307,13 +307,14 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 			       bool permit_pause_to_mac)
 {
 	struct prestera_port *port = prestera_pcs_to_port(pcs);
-	struct prestera_port_mac_config cfg_mac;
+	struct prestera_port_mac_config cfg_mac, old;
 	int err;
 
 	err = prestera_port_cfg_mac_read(port, &cfg_mac);
 	if (err)
 		return err;
 
+	old = cfg_mac;
 	cfg_mac.admin = true;
 	cfg_mac.fec = PRESTERA_PORT_FEC_OFF;
 	cfg_mac.inband = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
@@ -329,6 +330,7 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 		cfg_mac.mode = PRESTERA_MAC_MODE_SGMII;
 		break;
 	case PHY_INTERFACE_MODE_SGMII:
+		cfg_mac.speed = SPEED_1000;
 		cfg_mac.mode = PRESTERA_MAC_MODE_SGMII;
 		break;
 	case PHY_INTERFACE_MODE_1000BASEX:
@@ -339,6 +341,19 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 		break;
 	}
 
+	/* Firmware may not report link up after the mode, speed or inband
+	 * setting of an enabled port changes until the port is disabled and
+	 * re-enabled.
+	 */
+	if (old.admin && (old.mode != cfg_mac.mode ||
+			  old.speed != cfg_mac.speed ||
+			  old.inband != cfg_mac.inband)) {
+		old.admin = false;
+		err = prestera_port_cfg_mac_write(port, &old);
+		if (err)
+			return err;
+	}
+
 	err = prestera_port_cfg_mac_write(port, &cfg_mac);
 	if (err)
 		return err;
-- 
2.47.3

