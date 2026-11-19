Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130029;
	b=CEF/GEiwqx58B4FMUxCZTlarBMxSm2qY3J/9VJEthrx3CPKw5zvP5GzEs6NE+UW8qo2y
	 FiLVLMW9ZTLMjjbuicCPsVySeMLE1W4sYk4ETuRI3t1ZMDUFHaNW61HpPwee8DFXMcI9B
	 xBfq5lDSuFk0emNj07XS+P4gK1i3sm9m2eBCOKC6ugOdFwz9w62qoxNxmxwklsoP93RFX
	 a48twy5YVbmDQqaZxcsoG0PxWHU78wJfeZLIZEv2zKHhJsJARILZGz4dUlDfetk49jj/U
	 5NqYVTUdzVHKMfuNRUfVeZlSym0dnGXQSkXmOKt7frW4kWmnkxe169X3LkTzNovMbXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130029;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Debian-User;
	bh=/rLlHy1FIUyb4NEYReYmN+7UGMml1neZjczELrd3bG4=;
	b=OPy2xrfJaldLj99sAhb8K96Ub2EeMIQyvRrWPvbUZiMtSBPL7WgVXsBn5maWiyQD6DUa
	 /28GT0cuIk0CMuJYuSaBipbsVcrjN/ACume5ITTCQmSeNm/LfGmrttuF8LCTg56eIy3Fd
	 fBxl9EmDwLpYwmcfHtgEfKE/kelNuSePuDueP5bp5rAHSFmR5T85AhBzAzAc7ZKBLKPMg
	 Lfjp3LnEH4RtVZUy0QmPrtozjGyQGW4p/mJs+/MhxJQAAbb6QGm0ubmG/lAPLtjS/Q3dE
	 JIdJvHMdijVFinsACTDeI3I22eJwtc8m62HARqcgImQTwzEYHuALuWTQHp7U8wjLoaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Wr0LXI8t;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271A606A320;
	Thu, 19 Nov 2026 23:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8271A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Wr0LXI8t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/rLlHy1FIUyb4NEYReYmN+7UGMml1neZjczELrd3bG4=; b=Wr0LXI8tFN67gJSug0XV0/gwvu
	BibMCVk89OE2nC8VXsnydi2r1OoG69g3tJN+0kv9yvHPpkmog10LHllY2ZuRFyAbyRtyBGIBBV5/E
	FR3R3xdefsk3wGAi4RcTGG5ZV17hDumxPCT6dm4n9jxygonVyXt5A2dndwvbZf5C2ddJlItga7pmh
	R3KWN1LAC6oHlNCfXEOHio2byxzxnLt+z9OanrwXn3vw8Iux0wKLdfl5p5Ot3lWdZ5f+SOf1lXB0z
	3rSZ4kclCywOh65ALGxM8WrrNb5HFsJzXq+Mf5o/2xlvFYKwEG8W7c0xK4675fr3pMnTUtLdkPEiC
	dpLaiyYg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1xUBJt-002RVG-0U;
	Thu, 19 Nov 2026 23:13:33 +0000
From: Bastian Germann <bage@debian.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Oltean <olteanv@gmail.com>,
	Bastian Germann <bage@debian.org>
Subject: [PATCH net-next] net: mdio: handle broken-turn-around for non-PHY MDIO devices
Date: Fri, 20 Nov 2026 00:13:19 +0100
Message-ID: <20261119231319.1256419-1-bage@debian.org>
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

Parse the property when registering a non-PHY MDIO device and set the
corresponding bit in phy_ignore_ta_mask before registering the device.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 drivers/net/mdio/of_mdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..0695ae83b83b 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -56,6 +56,9 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	struct mdio_device *mdiodev;
 	int rc;
 
+	if (fwnode_property_read_bool(fwnode, "broken-turn-around"))
+		mdio->phy_ignore_ta_mask |= BIT(addr);
+
 	mdiodev = mdio_device_create(mdio, addr);
 	if (IS_ERR(mdiodev))
 		return PTR_ERR(mdiodev);
