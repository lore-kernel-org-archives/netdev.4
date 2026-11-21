Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257387;
	b=mMBW9g5lh4M3InbqQJhcfSxGpm4McJRPNr7A5Lbx2guZWQTRcedjW9T40qpuT3HhL0HN
	 OB0iZd0DFuZih2dEYmYZ+a+/Vb7jIcTZqTOSJ4RmKEo6UFFf2Rpsju206JbwfHp2J6tLy
	 H4bZBZoRMsduecl1ZluGCwG2V/Srn+CIXpKbUtMscNrJmqG79UIhG9XdvVUVKzqzmGoZd
	 KTZnM+h5Y8LNNwgBQES3fsIwRq2dci4INPLX9qQeK6L0tttanAwgJI+zNM8gftEQaTNgb
	 T5lQ3a6X1GBeRt2T4wunU4QjTwH7ODf/YW3MoXp0rodE1FMpyZ1nX2lKGNwHrTA3fFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257387;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=7YilFJHIMBhnIWQiW5Cx1KzDPc6CgaF1NrneZ3Yl9/c=;
	b=qb82boGtIt9pa0oi1m4se5LmgDXI4ZOjlJfsOZM+o2CZMJxjv1lCCgK3XRXpu5LfpBRW
	 xZdYSlFJc9WzaaRjGyNzyPiTnN29NKnXkxh1dvDF3b5JVhMrSitWpHv7uveRj6kOH4rDo
	 t0x1QXnUW10LEfTFjcSy3ZhwGB9dQmuqdGe9hrY031+ZPubKS7Ye0moNW5FUG9NB1/s4z
	 PYMG9cOvrakWkfNDPQk2mXWHa36AJrNot9pf7U7fQWJyb8cvp5c9mK9cjUHikV6qec2TA
	 ryX1kO9Ijw73oeNhdfQzx84jZgk+rdGtChAX9pl2nJLAJsIHM7wsX7bvGojZNSy8WeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="rk4l/VVL";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F711606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F711606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rk4l/VVL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ACFAA4E41694;
	Sat, 21 Nov 2026 10:36:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A5B6603CF;
	Sat, 21 Nov 2026 10:36:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 788A211BC045E;
	Sat, 21 Nov 2026 11:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795257384; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7YilFJHIMBhnIWQiW5Cx1KzDPc6CgaF1NrneZ3Yl9/c=;
	b=rk4l/VVLw7nlhVNhKX757qAzI0R2LnQyXJfiUk9qpvLXYPdQrjJOc/ascgg9Rg1wTCHI2X
	rjYlT7z4B82aGaqj8Hgxi+TafGjXshQXYbLH9W0AwKlp5R+Bjh0xDKvIXWh0+ZsheQFS0z
	ufF+FQff5HOSlzhSMLHTtx1P0XO8Bj0uKq5a7c/tszDE41Keqk6gtFvfI8P8CaHIvYh6fF
	3H7ON6SOAyOvlRLm0gAga+NaftEsoJ7xPHPN1dn+F39FUOAlh7y8OE9EM8ZNiqx4oFJKVM
	4FRYL9cwuQVXggDhyUlqE8iY6JHzQv1f9gt25xA66Kh4JZ7BtYo32KVWiYTFPw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	matttbe@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	thomas.petazzoni@bootlin.com
Subject: [PATCH iwl-next 1/3] igb: don't change the pause config when changing the link ksettings
Date: Sat, 21 Nov 2026 11:36:10 +0100
Message-ID: <20261121103613.166611-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121103613.166611-1-maxime.chevallier@bootlin.com>
References: <20261121103613.166611-1-maxime.chevallier@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

When enabling link autoneg, or changing any setting while link autoneg
is on, the flow control configuration is reset to the e1000_fc_default
mode.

Flow-control config should be changed through the .set_pauseparams()
ops, let the configuration as-is in the .set_ksettings() path.

Tested on i350-T4 cards.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/intel/igb/igb_ethtool.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
index ccc7302dc7bd..cfa36eab8b0a 100644
--- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
+++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
@@ -322,8 +322,6 @@ static int igb_set_link_ksettings(struct net_device *netdev,
 						     ADVERTISED_Autoneg;
 		}
 		advertising = hw->phy.autoneg_advertised;
-		if (adapter->fc_autoneg)
-			hw->fc.requested_mode = e1000_fc_default;
 	} else {
 		u32 speed = cmd->base.speed;
 		/* calling this overrides forced MDI setting */
-- 
2.56.1

