Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524579;
	b=bnK+NNki3FAo+TrXsz8jyt+j/z9CmMbYkCtmoDP5jocQJEyINvKmPI2thsP+l218NRsl
	 WiK7crG1btdAYbdg7pZOk3P8MuQyRCOxym4ozKsjTLSgHPINnHDoYmatVVnozPj6GuBz6
	 nGvYFb+PqKtBGf1jmKqnN1zo+OJ6SZhSIiJpeYetWUSikXY6fFR3LrXazeny70UZWwE2/
	 cHL25OVJKs3lvqWxjUMvM+TsMhQIgZibRJGYpz/jpWGGU6rEGcbDN9ge7+286nDFRt0eU
	 nSiDkejYTbMOSYsTd1zCdqTX2hlIMBeSjc9ra1MmelMDisxiz8YsdgHPSswHG2bzELQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524579;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=ecbT272lXnxkAg0GcwcfYicRbBY+DE6g03a4IFhUgN8=;
	b=petvV3jv0NHkEqF5ZAQOWKwjYDwyVPqDzDny16sZvvHpajU4I7mrGI0IoZmGOR7Cu6eS
	 idhuOQ0HXtisrcwAvMpk+ecrRNqq7FjD37CSBvDxsokKq0l1NVvAFKmQUuAR455ogNlw9
	 EM6lqMRX71cGr4KzTkxEruqARaqw2xWk1kmDdXDkZTnWthmK4w91SvKH5fZuCHjKIkvm2
	 87FJ1TpzUY4Tfsp/N816b6w3HcsR+66Kb0DQmyxYAQicm8JRtYIl+7xSze8ezkhrgDzvZ
	 NIAw1h/N4t0Bpolahjpk0KtIUNbZPW6lS04TwjAO0gZQIHXdRAw8NgE/12Yzx2rYbXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="yTpxXt/a";
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015C606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3015C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=yTpxXt/a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795524587; x=1827060587;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Ooa4p+9rCnnJ6BOtyYksXLqJkTpnST00+ScrAayhnQ=;
  b=yTpxXt/alUtXCb+e3Ann1qQJzq72RErc872C6PxiHPz0K1fG9hAh/NV8
   bh7TJR5IgF/puitkzEmse0EfsUsu7J8xtYTL5oiywMA9EU/mKBc7yT9hr
   ma4VQ4Qb7ZOrNXgq1xWZZ8Bx5Tjo5C665ztwSoAJm81XsZJORD+Ygbr3k
   JRgo5KFR10c3Q5Dk7Hxu19ATIjHUxHtIc1gdyEhwCjVH9nuPIwNcaTNZy
   3F3pT6ywwWUnzCnOQmbPqv8jd1FxzV+HrTus6ByxU+AwK+YZZkFQzmh3d
   VPopluDuvlLcMXj4hIV2+uni0I0p7fK06UcdZsJiWHaKaqkul/tsFkdzY
   w==;
X-CSE-ConnectionGUID: EPOg6XoCQvCY6Cp4IKe/Dg==
X-CSE-MsgGUID: MbW6h+pBSWGGUpZxn1KX6Q==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="66986327"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 05:49:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Tue, 24 Nov 2026 05:49:37 -0700
Received: from che-ll-i17164.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Nov 2026 05:49:34 -0700
From: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>
Subject: [PATCH net-next RESEND v4 0/4] net: microchip_t1s: fix collision detection on PLCA status change
Date: Tue, 24 Nov 2026 18:19:26 +0530
Message-ID: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
X-Mailer: git-send-email 2.43.0
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
Content-Type: text/plain


In a 10BASE-T1S multidrop network, the PHY can autonomously change its PLCA
state based on BEACON availability. The existing collision detection logic
only synchronized CDEN on explicit PLCA configuration changes, leaving it
stale across autonomous PLCA status transitions.

This series fixes that gap by tracking PLCA status changes through the PHY
interrupt path, providing a polling fallback for PHYs without a routed
interrupt, and improving collision detection and link-status handling for
LAN867X Rev.D0.

The OA TC6 MAC-PHY SPI driver delivers the in-band PHY interrupt to phylib
through a nested virtual IRQ. LAN865X enables this path for its internal
PHY, which has no dedicated interrupt line. This allows the PHY driver to
receive PLCA status change interrupts through the MAC-PHY SPI interface.

For LAN86XX PHYs, collision detection state is synchronized across explicit
PLCA configuration changes, PHY interrupt handling, and the polling status
path. A per-PHY mutex serializes collision-detection control updates
between PHY configuration and interrupt handling.

LAN867X Rev.D0 uses its hardware CCMFC mechanism to autonomously gate
collision forwarding based on live PLCA_Status, avoiding the software CDEN
toggling used on older revisions. Its link-status handling also accounts
for the optional PRSCTL1 CSMA/CD fallback, selecting the semaphore source
when the PHY can autonomously fall back to CSMA/CD.

This series was previously posted as v4. The Sashiko review comments
received on the previous submission were addressed through follow-up
discussions and technical clarifications.

Reposting the series for review.

There are no code changes from the previously submitted v4 series.

Previous submission:
https://lore.kernel.org/netdev/20260929125928.611784-1-parthiban.veerasooran@microchip.com/

Changes in v4:
Addresses Sashiko AI review feedback on v3.
- Add a polling fallback to synchronize CDEN from the live PLCA status for
  PHYs without a routed PHY interrupt.
- Serialize accesses to the collision-detection control register across
  PLCA configuration, interrupt configuration, interrupt handling, and
  status polling to avoid races.
- Preserve the tri-state semantics of plca_cfg->enabled, so an ethtool
  request with the attribute set to -1 does not unintentionally modify CDEN
  or Rev.D0 link-status configuration.
- Fix the OA TC6 virtual IRQ masking path so disabling the nested PHY IRQ
  also masks the in-band PHY interrupt source, and retain deferred dispatch
  to phylib.
- Enable the OA TC6 virtual PHY interrupt for LAN865X and clarify that this
  completes the collision-detection fix for LAN865X. Add the corresponding
  Fixes tag.
- Update LAN867X Rev.D0 interrupt handling to use the cached PLCA enable
  state and current CSMA/CD fallback configuration instead of re-reading
  the complete PLCA configuration on every PLCA status change.
- Preserve cable-test polling when the Rev.D0 PHY interrupt path is
  enabled.
- Clarify the Rev.D0 CDEN/CCMFC behavior and document that CDEN remains
  enabled by default while CCMFC autonomously gates collision forwarding
  from PLCA_Status.
- Correct commit-message and register-comment details identified during
  review.

The LAN865X fix depends on the OA TC6 virtual IRQ support, so the series
should be applied together.

Changes in v3:
Addresses Sashiko AI review feedback on v2.
- Patch 1: Synchronize CDEN with live PLCA status before unmasking
  PSTCM, closing a window where a status change could be silently
  dropped. Use phy_interrupt_is_valid() instead of testing PHY_POLL
  alone. Treat plca_cfg->enabled as tri-state so an ethtool call that
  omits the enable attribute no longer disables collision detection.
  Factor shared STS1/IMSK1 sequences into helpers reused by patch 4.
- Patch 2: Replace dummy_irq_chip with a proper irq_chip implementing
  mask/unmask via bus_lock/bus_sync_unlock, closing an interrupt-storm
  risk. Select IRQ_DOMAIN in Kconfig. Defer PHY interrupt dispatch to a
  workqueue so the chunk-processing thread stays independent of
  phydev->lock.
- Patch 3: Add Fixes: 78341049fbcd, since this patch is required for
  the fix to take effect on LAN865X. Document that CDEN correctness
  relies on the hardware reset default.
- Patch 4: Give Rev.D0 its own config_intr() instead of branching
  inside the shared one, so CCMFC-owned CDEN can never be touched by
  the shared resync. Skip link-status updates when enabled == -1.
  Correct the AN1760 -> AN1699 reference. Resync Rev.D0 link status on
  interrupt (re-)enable, closing the same dropped-edge window as patch
  1. Account for Rev.D0's autonomous PLCA-to-CSMA/CD fallback
  (PRSCTL1): force semaphore mode when that fallback is enabled, since
  PLCA_Status is meaningless once the PHY has already fallen back.

Changes in v2:
- Patch 2: Introduce OA_TC6_PHY_INT quirk flag to guard the virtual IRQ
  infrastructure; PHYINT is optional per the OA TC6 standard. Move
  oa_tc6_phy_irq_setup()/oa_tc6_phy_irq_teardown() into
  oa_tc6_mdiobus_register()/oa_tc6_mdiobus_unregister(). Populate all
  mii_bus->irq[] entries with the virtual IRQ before mdiobus_register()
  so phy_device_create() picks it up regardless of the PHY's MDIO
  address, keeping mii_bus->irq[] and phydev->irq consistent.
- Patch 3 (new): Pass OA_TC6_PHY_INT quirk flag from the LAN865X driver
  to enable the virtual IRQ infrastructure for LAN865X.


Parthiban Veerasooran (4):
  net: phy: microchip_t1s: fix collision detection on PLCA status change
  net: ethernet: oa_tc6: deliver the PHY interrupt to phylib
  microchip: lan865x: enable PHY interrupt via virtual IRQ
  net: phy: microchip_t1s: fix collision detection for LAN867X Rev.D0

 drivers/net/ethernet/Kconfig                  |   1 +
 .../net/ethernet/microchip/lan865x/lan865x.c  |   4 +-
 drivers/net/ethernet/oa_tc6.c                 | 227 +++++++++++
 drivers/net/phy/microchip_t1s.c               | 365 +++++++++++++++++-
 include/linux/oa_tc6.h                        |   3 +
 5 files changed, 587 insertions(+), 13 deletions(-)


base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
-- 
2.43.0

