Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426391;
	b=fgGOUJHfBjsVGSl6jk7wssaL7MbWMtHAKTL0Z7Xnw/P3kn2+KuX+v3AZRVSIaIJautgO
	 mSeQL/pvYsOOaKB4PeR5b5mfxoyuRc6WXyvlMIpKfndHuL7uBY/4YRb/8kermERPIy4rK
	 n7516QIqM4LwAXWqCAQ2sA1CEZ7KuQheLMOh5PcxKEwEidJhepbA/CKZHavK5Hw9MwJQx
	 gOQB1+x+IIcFBTS6srywsiluiBoKAQEd6tbJkjyjh8kXt0W25yHo2GRNvJenNsWk39LRn
	 Pt4ZNfY/SK1Eee6+PGFbNpxKsDZQx62MJdX0Kn5GWF5zydbW1eimseWN85Dnu7Uhm4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426391;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qJHe16AAk+KmWy7GWmm4YsRuo6Hqr72WzJ5jnLonod8=;
	b=oI/z0hrbMv35sFZrgMp4+nfd5CSR+2BvkM1tYTDSxSUUa2crEOsWRch/nJLG0R65BBxH
	 09CKVc+xGsoXm0OI0alBCHheH3igB+7i2LUt/3Pt5QS7b9aZhEDewWkkgAr4fADBTw3U5
	 2u4idODiVPo5C28hPjKEBR3DD7wWsTPanog1oXjRJ3Qc4w2kMfOIxQTropRvvfWg3IV0W
	 ZrV/u6+4GC1qX+hu2kNu8i1oh9k0qbLBwa6chpMPehU3ZUO4pr8uhhjs0Y4UeNReV03Vi
	 eQr4QzgR/IO16SYf1GEbMrRUS3Qd80HlfxbP8mP4jOLy8b4YDLIJkyBSjFoiFEpK+lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VzrDHnCR;
	arc=none smtp.remote-ip=117.135.210.7
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77487606A321;
	Mon, 23 Nov 2026 09:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77487606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=VzrDHnCR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qJ
	He16AAk+KmWy7GWmm4YsRuo6Hqr72WzJ5jnLonod8=; b=VzrDHnCRtsSb6YjZsq
	UUEQ2d/rCI9GQ5rbiNNRkdGVG4+qX98ohXegL8E1AzN3l7tkM9qK9LRi3zNTbjFD
	MmzOxc7DozYNS+vf1mn/zSaJsAjbc3IKa8umkSmBjD4Hl/Ob9jmvVnEdHE7fZt/Y
	/Z2Jgr42em7Wr9Q2uG3zXI84g=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3l7UTCARrlp7DDw--.2488S4;
	Mon, 23 Nov 2026 17:32:07 +0800 (CST)
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
Subject: [PATCH net v2 2/2] net: ibm: emac: read the fixed-link status before adjusting the link
Date: Mon, 23 Nov 2026 17:32:01 +0800
Message-Id: <20261123093201.770552-3-xiaolinkui@126.com>
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
X-CM-TRANSID:PykvCgD3l7UTCARrlp7DDw--.2488S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw4DuFW5CFy7JFyxKw17Jrb_yoW8Zr4Up3
	yUXa4fZrykJ3WfWF45AFWUJrW5uayxKayxKF1Iyws3Wan8JrykJry5tFWUJr1YyrWvyFy5
	ZF18Ca9xuFs8Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0zuAUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlBfiuWsECBfLsQAA3S

From: Linkui Xiao <xiaolinkui@kylinos.cn>

For a fixed link emac_init_phy() calls emac_adjust_link() once to copy
the link parameters from the phy_device into dev->phy, and never starts
the PHY state machine.

That worked while fixed_phy_register() copied the device tree status into
the phy_device itself.  Commit d99b408ed8e5 ("net: phy: fixed_phy: remove
not needed initialization of phy_device members") dropped that, expecting
the state machine to fill the members in once the PHY is started.  EMAC
does not start it, so emac_adjust_link() now copies SPEED_UNKNOWN and
DUPLEX_UNKNOWN, and emac_configure() programs the MAC for 10 Mbit/s half
duplex with flow control off, whatever the fixed-link property says.

Read the status once after attaching, as emac_mdio_read_link() already
does for the phy-handle path.  The PHY is emulated, so genphy_read_status()
resolves speed, duplex and pause from the registers swphy generates out of
the device tree status.

Fixes: d99b408ed8e5 ("net: phy: fixed_phy: remove not needed initialization of phy_device members")
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 drivers/net/ethernet/ibm/emac/core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index ba02cf878a12..8b9ffbcd2ff4 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2677,9 +2677,16 @@ static int emac_init_phy(struct emac_instance *dev)
 				return res;
 
 			if (!of_phy_connect(ndev, np, &emac_adjust_link, 0,
-					    dev->phy_mode)) {
+					    dev->phy_mode))
+				res = -EINVAL;
+			else
+				res = phy_read_status(ndev->phydev);
+
+			if (res) {
+				if (ndev->phydev)
+					phy_disconnect(ndev->phydev);
 				of_phy_deregister_fixed_link(np);
-				return -EINVAL;
+				return res;
 			}
 
 			emac_adjust_link(ndev);
-- 
2.25.1

