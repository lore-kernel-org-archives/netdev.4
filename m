Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257389;
	b=IpmAoroJJpOoRynlTWCXhrRFX2hXO4w7neYequiNbsFqjIBge/NcPBNv56/ZFji861We
	 OmXTPYzn/J3grqbBBfDep8eeF42oiFHYThwdP22Kj+mZoSFWzk+z7zOI42SWSOUTeXYcW
	 edIwyLmAoE6T4Jnvfycf8N1ZSWccproJHlxwoNHlAU87/0mR8J9g8A6qqGpx0e+Ol08CS
	 WR+qETg0GaDAQTZCJ0+g6nX7ddIkBOa1W2pYNLQlUUxElejfvG4YR9DcO1ejPU0awv4Pk
	 k3bI9PpFuFHp+GIE41U5pFM7SDsDcEQBwdqXdBfXfrdktnSCOPUBF+A0pedXNPMP7Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257389;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1HEjco31EGEWm3OKEP6kPdguqOM3laifo1Dc/FOQ61A=;
	b=LMFovzrkfCAV6zWRQUJAtKwtPXsf5ohVC5Lwsn6Ce6IY59EhA0kslBSpUHC1jxUUN8D8
	 4wGLXV+bCHop3rHrJCwgKDEoDSV3VsVGJZaEIowNQlEey33wGDZgieDzCP38er8ytjbXu
	 DsNeDwliiURGvB9/sBip9iKC8FdJXy/nPAwom0qyi+7oSCeqiF4cWIno1kNACTGW165NM
	 s6fS0cZji0oWOxBCVGmKcc0/Vgox3SLVpoPsQDIlNiYPa6NNCbWzp0izYf9PTmr4+BWEG
	 fAuL67USCN0yWlb7eLa2mqE+q7bIcSBScB9lK3rKFe8m1JgWb/t/RucX9rVOS75GABA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O0zJU9nN;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B2D606A33C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B2D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O0zJU9nN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E12A4E41699;
	Sat, 21 Nov 2026 10:36:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24723603CF;
	Sat, 21 Nov 2026 10:36:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0375711BC103D;
	Sat, 21 Nov 2026 11:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795257386; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1HEjco31EGEWm3OKEP6kPdguqOM3laifo1Dc/FOQ61A=;
	b=O0zJU9nNiuvDj6i3ujkkd6VDAFdI+bZ3QGiTP3UtBMlJEXRTkiOrpBYsl+cnrVAhiMa7Nc
	XcQKny8xCQ3GHvg+IEfqJEe4dvOBnrlVK++Pka8KQ4IAGkaA/AZOH08mAGU5iJUhSaR+E0
	8ZhhAcvvJ3CIGkXFDQfPhQI/qNTeT+n78QROVjc1B7zPcpqM/xFsjyksFIeYB5zAIT/mFS
	dj1wlYuWJ1aJRhfEo2OqVQBnblV8pHLvzlYA6TbaCNaKzTBpjccGisgmapXPdF1CnsXPhW
	RTSIY6ToqgaDTEFZ2ZQ0gf11dp150EIiA7yZ7sEBzc7Odp26iYjYVX0KcUchxA==
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
Subject: [PATCH iwl-next 2/3] igb: take the user intent into account when pause autoneg is on
Date: Sat, 21 Nov 2026 11:36:11 +0100
Message-ID: <20261121103613.166611-3-maxime.chevallier@bootlin.com>
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

Currently, the pause parameters on igb are set to the default value when
pause autoneg is enabled, regardless of the parameters supplied by the
user (i.e. it ignores the "rx on/off tx on/off" params when pause aneg
is on).

Let's take the user intent into account when enabling pause autoneg.
While at it, simplify the tests on tx/rx values.

Tested on i350-T4 cards.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/intel/igb/igb_ethtool.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
index cfa36eab8b0a..03c69409a6f4 100644
--- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
+++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
@@ -406,8 +406,16 @@ static int igb_set_pauseparam(struct net_device *netdev,
 	while (test_and_set_bit(__IGB_RESETTING, &adapter->state))
 		usleep_range(1000, 2000);
 
+	if (pause->rx_pause && pause->tx_pause)
+		hw->fc.requested_mode = e1000_fc_full;
+	else if (pause->rx_pause)
+		hw->fc.requested_mode = e1000_fc_rx_pause;
+	else if (pause->tx_pause)
+		hw->fc.requested_mode = e1000_fc_tx_pause;
+	else
+		hw->fc.requested_mode = e1000_fc_none;
+
 	if (adapter->fc_autoneg == AUTONEG_ENABLE) {
-		hw->fc.requested_mode = e1000_fc_default;
 		if (netif_running(adapter->netdev)) {
 			igb_down(adapter);
 			igb_up(adapter);
@@ -415,15 +423,6 @@ static int igb_set_pauseparam(struct net_device *netdev,
 			igb_reset(adapter);
 		}
 	} else {
-		if (pause->rx_pause && pause->tx_pause)
-			hw->fc.requested_mode = e1000_fc_full;
-		else if (pause->rx_pause && !pause->tx_pause)
-			hw->fc.requested_mode = e1000_fc_rx_pause;
-		else if (!pause->rx_pause && pause->tx_pause)
-			hw->fc.requested_mode = e1000_fc_tx_pause;
-		else if (!pause->rx_pause && !pause->tx_pause)
-			hw->fc.requested_mode = e1000_fc_none;
-
 		hw->fc.current_mode = hw->fc.requested_mode;
 
 		retval = ((hw->phy.media_type == e1000_media_type_copper) ?
-- 
2.56.1

