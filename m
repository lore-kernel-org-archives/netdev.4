Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289846;
	b=g0nKIj+MZqJX3p6IJuQ2mzI6gLUPt7w8RMKVAAedwmGMrr4V/v4BgkskYUcKsS+QIIcu
	 RU5FkzOHsJSzZk8bi4h3RIPPaOBkCPdONYOcyrGbFh/meeWrujsdyByF2NAJkyVZGnT4c
	 5t1YDgOqwzKC+ThWCudi2ji1ULS/BbDS9IHV+/gAk81rtqyKa3ybwo3n/QQ16rA++7qa3
	 kO6mkA4HfnKQk/j1iyf5FDzvyu9418jVzXECFYh2grqlBUpBP97QsJrpJdclQiCYLNx5T
	 I2uTjWl19G5kAEgVEaN/lYePo+9eaeaega0lPT87AEorNkyzNQcXS3lhDycxBiJr6cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289846;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Debian-User;
	bh=ZioayeppIOBHdNjSq6qe74+lfa9kFKgG5lBRMMYto9c=;
	b=1Rk7hC+fKBf6T4ZxiXq0vd/YmLHny9yat77C7wVJktT98WdUVcyHHSKTAyHhT94Nieqh
	 qvHCqU3cKQRHFnRYuVN2kYwH6e7dceo1LqDXdLySbZyYMvukYzvjc+VUm9e8DhRpjREsw
	 7XQRjV8mB9oLHC4XYZkoA0nxZGpJ9S65LLaIeXMh9WGrYaq21CwVHxcfHJW0lfgUsWr7s
	 xUmkTEC2TssoIB5fWeJxON/yC1vkYbNokNBrjVkH0XeAtDjCbb4nobfpCTbg2/RVd888O
	 VkFe4qGy4qYyweGkFHc9jBCguZfZsXOIOIdpOzddK0MJQCTg1/QgqW/v63Ar3tYp3cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="RJ/qBsrZ";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23771606A320;
	Sat, 21 Nov 2026 19:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23771606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=RJ/qBsrZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ZioayeppIOBHdNjSq6qe74+lfa9kFKgG5lBRMMYto9c=; b=RJ/qBsrZj4wkbyyVigtC9dV/UB
	ab3MfTAA9Tc3nCpCYPpKvApyzwcD3vIy3rivSNawbm3dZLuJdl6tJiHDwLh7hTZG7sp30DYZnCVqe
	TR5nkXJot5myNNeYDdY3YXBY3NR0dyunBbLyR6pG3Dwev+ip1bOT2S/ThbHyr5eMoKItcKKNXe68M
	1/kGEwTtvwhwhbD7b6a8oOwO9zTJFa2GpprAZz4CP2MPw4Z/qeFNMtzc/FgXO193oEQWSKgkkNaNZ
	KSTl2ow+svZWYUk1PWr3YgnxtY9A2HAu8q6xPxhl02dT+uhCsdUMu9gyLfMG3LT1gnqyOWzFOtIJU
	oGKMrcsA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1xUqti-003swJ-1q;
	Sat, 21 Nov 2026 19:37:18 +0000
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
	"Signed-off-by: Bastian Germann" <bage@debian.org>
Subject: [PATCH net-next v3] net: mdio: handle broken-turn-around for non-PHY MDIO devices
Date: Sat, 21 Nov 2026 20:36:55 +0100
Message-ID: <20261121193655.225520-1-bage@debian.org>
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

From: "Signed-off-by: Bastian Germann" <bage@debian.org>

The "broken-turn-around" property is documented in mdio.yaml for any
MDIO device, but the MDIO core currently parses it only for PHY devices
in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
switches, are registered through of_mdiobus_register_device(), where the
property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
still treat the turn-around/read failure as an error.

Parse the property once in __of_mdiobus_parse_phys(), before the PHY and
non-PHY registration paths diverge, and drop it from
fwnode_mdiobus_phy_device_register().

Signed-off-by: Bastian Germann <bage@debian.org>
---
 drivers/net/mdio/fwnode_mdio.c | 3 ---
 drivers/net/mdio/of_mdio.c     | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

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
index b8d298c04d3f..fe321fa16188 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -164,6 +164,10 @@ static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 			continue;
 		}
 
+		/* Common to PHYs and other MDIO devices */
+		if (of_property_read_bool(child, "broken-turn-around"))
+			mdio->phy_ignore_ta_mask |= BIT(addr);
+
 		if (of_mdiobus_child_is_phy(child))
 			rc = of_mdiobus_register_phy(mdio, child, addr);
 		else
