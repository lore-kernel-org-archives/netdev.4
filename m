Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257391;
	b=hqjCLdHNqOgLcOEfA5Ib2MA2tV1y7DkxHIGBJmbDwV+Lkn+FJIFRwF2fayk6aoE283Ep
	 Ukaw2U7/qicqvambnL5i8j6etjSgML+ZjSQtxn8lM3DViuxBnvIcjH6puUL0HCrKuC9tO
	 T1jsfi0apKFViKKAg7CruXBC3ucYE2myk1x5t681er4HoPyU7uCXujBa9SBlNaxA5mym9
	 7dQLSz3DmPVKhy/+rS65CD8Fc8FIqTq7sPeQEdDNTSjhOTpQ/iv7Dv6IVnueKx9OxVwJu
	 w5Tg5123JgiY1XNR1za0pxEwHJNZoP/Yp1B/dyAwGbmM0G4CkjqVB6zuvBZmMGfEKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257391;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=a24bhYwRQlrJ8z4mZ8p6S5WIN7NkVtJONVg17lD3DVs=;
	b=nkes3CUUjbs6fCdoKRD82ygGLzThmli3KjmLwGe5sFVtxi6e55FE/MuwhXUOf2ZG0qM/
	 qn+bBPfjNjyuzWmyq3x8ET4Bco28nz+Ry3yiDeIJljNRAtvrrrhZBCCclhScEIGdt/RDP
	 yaKeNBDeV9l51qEBAn6j929XLwTiThljyessXS9uraS0kMRWBKpqYQq+ZOz6cF1eONxka
	 6oUq9qmEONXCnAYhQO4hL7pRLa1HCVB+wUZ/a1V3l/diJPsEJO19gMnTwFqoAkZN22MqZ
	 Fk5S+tliFaVicO5VIhH4Mwtlsqtj98H9OzsCdpu9B0/zXTxf9Th1QTi6Nmx8nK5pb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KN5OIDCJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39347606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39347606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KN5OIDCJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D3CFA4E4168A;
	Sat, 21 Nov 2026 10:36:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3723603CF;
	Sat, 21 Nov 2026 10:36:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3DDA11BC0EEE;
	Sat, 21 Nov 2026 11:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795257388; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a24bhYwRQlrJ8z4mZ8p6S5WIN7NkVtJONVg17lD3DVs=;
	b=KN5OIDCJS3mC0DV+/tecB4+KKiXxsNzUimcVpOio47YJDKwEcksfwVowgpNyRg1ZD2lcIF
	GQCVvuCIkvP3d2JHjffbMwDCyfNKdse6/EdBSRrf5HSrgciILsrR4FraaWAwOBqZmmo7wn
	mc0JOhkUpwqBedgOLZngfuIqLKHmR9DgaMfctLk0qrQohs8x5857cQFqvHPjVsEXLRZJ+b
	FIB63DuigV4QMezJhfc6TWMijigY8AG/YdQqDWlFWEgRF0gGkXbUpqCVCQEeA5gEv3rHLe
	I0nxZtrA+tjwtcDhSiDJdxleiZz4LD0I8m2QzayyCkwLDvwVakqY90Ce5hWi5Q==
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
Subject: [PATCH iwl-next 3/3] igb: advertise symmetric pause only for full flow control
Date: Sat, 21 Nov 2026 11:36:12 +0100
Message-ID: <20261121103613.166611-4-maxime.chevallier@bootlin.com>
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

When flow-control is "rx on, tx on", the "Pause" bit alone should be
advertised, as per te linkmode_set_pause() implementation, which follows
the 802.3 specs.

The Asym bit is for asymetric configs, such as "rx on tx off" or
"rx off tx on".  Let's align with the specs and not advertise ASYM for
full flow control.

Tested on I350-T4 PCIe cards.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/intel/igb/e1000_phy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igb/e1000_phy.c b/drivers/net/ethernet/intel/igb/e1000_phy.c
index cd65008c7ef5..98dda73d507b 100644
--- a/drivers/net/ethernet/intel/igb/e1000_phy.c
+++ b/drivers/net/ethernet/intel/igb/e1000_phy.c
@@ -1043,7 +1043,8 @@ static s32 igb_phy_setup_autoneg(struct e1000_hw *hw)
 		/* Flow control (both RX and TX) is enabled by a software
 		 * over-ride.
 		 */
-		mii_autoneg_adv_reg |= (NWAY_AR_ASM_DIR | NWAY_AR_PAUSE);
+		mii_autoneg_adv_reg |= NWAY_AR_PAUSE;
+		mii_autoneg_adv_reg &= ~NWAY_AR_ASM_DIR;
 		break;
 	default:
 		hw_dbg("Flow control param set incorrectly\n");
-- 
2.56.1

