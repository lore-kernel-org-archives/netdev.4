Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253384;
	b=YRsa2JuGHThpiXinYGuE6mLX4fEjtVDpemrOgw2NjhfVm6YJgbkWUa/NK3p5EWriWqdS
	 PrIziYU8gHegnDybu4GqB9JzddkEtA4AuHvzw0t6mzVJMtyv2GNFxZMcrqjg/jwDoxpjY
	 Kfelx1xDKfITTPkAf7Z65kCwnSFcmsXJL/nfTtbUOXVR7NMJJHYLYAWzB8OBQ3V1/QBUa
	 Mbrel8JxZAGx1bGP5vG9NUFEpNGCLlSRCwKecSDzmHjfOVeZ6YiSIJ2HKEkthoEbTcKRw
	 NSanoZyJkJ/eoISX3/WcpWp2NIYk/hVpEIBYnIDJu1b8mBmDkCPy/OhVRI1winClthQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253384;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Debian-User;
	bh=XEMLomkRYjVFAGSgdBsQ30iuJaHeuFjw8UOUtIs9VfM=;
	b=dJPV2QfjxSGO5xUdlUn5vL1UYwftRgADw7GflJTUMX8Hn2BZg6+EIs9UTH71J7ZFWc6K
	 0aJWyJEL47/QgJQWw9ZZ2BeCQGEdk3HxP8PfVuBLJQUPFmLeL6kAG/x15xzJjzvziDvi6
	 GFkVWkJIHlcFLQ3Obx/SOCzGk/y/nk3TZWofjZ0lv7XDOlSrgEmEbXyTzkjF+PbayEWZ8
	 1Yk2MVlm+zzXHcDm3fEUjjhEwZ2phhLUkPYo/CVoLjLCIjjZSEUuXhxPe7tl9bQH/+dxG
	 Gz6FYSg0OPLlVYMqBj8PF2UdWJ6wu2W7m9Dbtoouf8NGLjTKm9jTmBW4NBXdZSASF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=sbpfsdIC;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E9606A320;
	Sat, 21 Nov 2026 09:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7E9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=sbpfsdIC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XEMLomkRYjVFAGSgdBsQ30iuJaHeuFjw8UOUtIs9VfM=; b=sbpfsdIClPshry40ab8H01ZWrB
	HmLz+H9qUJasDwjVRZ1YyQxMkcSg7fKcuh6kPfRBkW4JUAYBfCRkbfF3VXhIJR3bDl7+TsMjZTwgM
	i7dpt5rVrOdL+/RVx2vHddNidLp4AYY7RXrcugaO7c3WyRlyCH2bW9fUcJAt9RwlNXi1g8SY4KDhS
	fvGzWghHp39spopHKOwQufBfnP7YAYuY7JsoHv2ZAUPSpptA+C9DFYsU+gGe3uUjxiAxM+yEnfMoS
	O/EtdOBWIBiKVtpKs8KVAkn79P80oolTcr33mcVqS4SmGK/EDmGOprc6WAxGjw5Z6qbK8HhEkymMq
	+AFLEMRA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1xUhPd-003Y7V-09;
	Sat, 21 Nov 2026 09:29:37 +0000
From: Bastian Germann <bage@debian.org>
To: andrew@lunn.ch
Cc: hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	olteanv@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bastian Germann <bage@debian.org>
Subject: [PATCH net-next v2] net: mdio: handle broken-turn-around for non-PHY MDIO devices
Date: Sat, 21 Nov 2026 10:29:33 +0100
Message-ID: <20261121092933.186731-1-bage@debian.org>
X-Mailer: git-send-email 2.55.0
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
X-Debian-User: bage

The "broken-turn-around" property is documented in mdio.yaml for any
MDIO device, but the MDIO core currently parses it only for PHY devices
in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
switches, are registered through of_mdiobus_register_device(), where the
property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
still treat the turn-around/read failure as an error.

Parse the property in of_mdiobus_register_phy() and
of_mdiobus_register_device() instead, so it is handled in one place for
both PHYs and other MDIO devices, and drop it from
fwnode_mdiobus_phy_device_register().

Signed-off-by: Bastian Germann <bage@debian.org>
---
 drivers/net/mdio/fwnode_mdio.c | 3 ---
 drivers/net/mdio/of_mdio.c     | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/mdio/fwnode_mdio.c b/drivers/net/mdio/fwnode_mdio.c
index ba7091518265..129481e8a910 100644
--- a/drivers/net/mdio/fwnode_mdio.c
+++ b/drivers/net/mdio/fwnode_mdio.c
@@ -89,9 +89,6 @@ int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
 		phy->irq = mdio->irq[addr];
 	}
 
-	if (fwnode_property_read_bool(child, "broken-turn-around"))
-		mdio->phy_ignore_ta_mask |= 1 << addr;
-
 	/* Associate the fwnode with the device structure so it
 	 * can be looked up later
 	 */
diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..c03fcf34b3a6 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -46,6 +46,9 @@ EXPORT_SYMBOL(of_mdiobus_phy_device_register);
 static int of_mdiobus_register_phy(struct mii_bus *mdio,
 				    struct device_node *child, u32 addr)
 {
+	if (of_property_read_bool(child, "broken-turn-around"))
+		mdio->phy_ignore_ta_mask |= BIT(addr);
+
 	return fwnode_mdiobus_register_phy(mdio, of_fwnode_handle(child), addr);
 }
 
@@ -56,6 +59,9 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	struct mdio_device *mdiodev;
 	int rc;
 
+	if (fwnode_property_read_bool(fwnode, "broken-turn-around"))
+		mdio->phy_ignore_ta_mask |= BIT(addr);
+
 	mdiodev = mdio_device_create(mdio, addr);
 	if (IS_ERR(mdiodev))
 		return PTR_ERR(mdiodev);
