Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771616;
	b=P5DLG+rW1MFWQmkqNtANdQm65kNo7peTdEMKMLNOiS5fXOVrR0jWfHxkEEZte66V3tuH
	 oT4/gpsiDa3cmn4GupQm9/2kQTLl5L+IhYul4UH2Etwfy6Sv/jXphl30ahwNMGKQA2YgQ
	 rKACb3t92UnNJX5tU1FOowLty5HsPViDXO0xccOck2x73f9xWgMpKyuB6ZQHDbIe4+B6+
	 I8NC5CtWaX/0vnbJmhSFvZ7UzmXPrfuQCK3Emo4GTklU7JZq808q5DmfAP9Uv19kszzw4
	 ZOdxm8fqbT5Lpf9knMD50SIF3aNH3ir1sF7YMoO4oD0svzrLTOVccGK+6AepXopc9UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771616;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:CC:X-Mailer;
	bh=1K7Os9kNp01kw3lZ3xR8LF8lzIlaDfbGvrHowVML8ss=;
	b=B5RaXI5VK6nW6G3fzKUsREh7AfU61uG+9rXvouoWn0J1J3cLwnEqc0s7k/4KCU4zvdTk
	 N88MQNHHWBPsck/RLd8tlc9OYXMtMfqvPaW+eyWb/tj2uA9l8idTeAvQZ9v3/cUfVK2xd
	 SHvfWJwovPw8y5D7sl4I5Twwc+7GnUGJf0rMNGW3drtaoVEl6NdnH3zD+im9fpO5POm4s
	 qdE9WMQOqVJFjPefXDO0Fxr4Ox1F93EnpIlZQQepGibOPUlJOIVruRkHpZwdkn6UmzzD+
	 LHAgNlXvbiDgh1T7vjkOcPngd/gXkQJhyEo+ARZSGb3hem/fhAZ2EMQ9QKXDPC3lPJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PPmMlkqv;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D95606A31C;
	Fri, 27 Nov 2026 09:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=PPmMlkqv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795771624; x=1827307624;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ESiUtp06v4f11SxK4wo2437P71P6mMlQUdGnD2Px/ws=;
  b=PPmMlkqvAqsskVv7viiYSLkzMD9/qaIVbsBKQEeIJ+wxMCULmKkSYcM1
   peTBJ5R22bTZvxOIUWOpWM5c80hpaOf4SAHgQLEI23aOH/4/Zv5gdvLdC
   ifetBuUZ4cf+zAHidy5a1hO3ZyNH+GaIbIwPzr8LBpPUhNNexi7tAid2k
   IcjE6J4ilDYGymQzDwTlU8Zw+D4IZpa8fT4t5chnSghrec0k5Gb5r5YT3
   bW9jmYezkshyLCKELtkb3DwlSdSM0Cl5HG3Gwi2qxhhjOgI0fVLLPqIol
   38AY9JKrFt9U4a1a8T3J7ON53sV+lpcWHT59PjjTtGf0eAIcrzoUU3QsG
   Q==;
X-CSE-ConnectionGUID: /MvkJ/3MTN6ZacVn1X8XCQ==
X-CSE-MsgGUID: YEpnHdGTQwmZWq4gGJDnpg==
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="67348989"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 02:27:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Fri, 27 Nov 2026 02:26:55 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 27 Nov 2026 02:26:52 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH net-next v2 0/5] net: dsa: lan9645x: add VLAN and bridge
 offload
Date: Fri, 27 Nov 2026 10:24:48 +0100
Message-ID: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-0-84adcd919dac@microchip.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGFMCWsC/42OQQqDMBBFryKz7pQkWhu76j2Ki2gmdUATSUQs4
 t0b7AW6fPzPf3+HRJEpwaPYIdLKiYPPoC4F9IPxb0K2mUEJVUspNdpkcDS+qavbhsZaXDOh8Ra
 7yDb3g3NjMBabTmmqG+m0LiHPzZEcb6fqBZ4W9LQt0OZk4LSE+Dk/rPLMfzpV/a9bJQrsmlIYa
 Q3dhXhO3MfQDzxf+zBBexzHF3FOKqTuAAAA
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew@lunn.ch>, "Vladimir
 Oltean" <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

This series adds bridge offload to the LAN9645x DSA driver.

The MAC table is keyed on (MAC, VID), so at most one VLAN-aware bridge
can be offloaded. VLAN-unaware bridges are kept apart by classifying
their ports to a reserved VID per bridge, so up to 8 bridges can be
offloaded in total, at most one of them VLAN-aware.

With FDB isolation and the FDB and MDB callbacks, DSA enables unicast
and multicast filtering on standalone ports. Host addresses are
installed as MAC table entries towards the CPU, and unknown unicast and
unregistered multicast only reach the CPU while a port is promiscuous or
allmulti. The flood masks are global, so one such port lets that traffic
from every port reach the CPU.

Patch 1 adds the ANA_ANEVENTS register to the generated register macros.

Patch 2 adds VLAN support for VLAN-aware and VLAN-unaware bridges. VIDs
4032-4095 are reserved for internal use. Standalone ports use VID 0, and
the ports of VLAN-unaware bridge n use VID 4096 - n, so each
VLAN-unaware bridge gets its own FDB domain in the (MAC, VID) keyed MAC
table.

Patch 3 adds the MAC table and the FDB callbacks, with FDB isolation and
assisted learning on the CPU port.

Patch 4 adds the MDB callbacks. Each L2 multicast group uses one of the
general purpose PGIDs as its port mask. IP multicast groups carry the
port mask in the MAC table entry.

Patch 5 adds bridge offload. We support offload of 8 unaware bridges, and
at most 1 VLAN-aware bridge. The vlan_filtering setting of a bridge
cannot be changed while switch ports are offloaded.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Changes in v2:
- patches 2 and 5: Move the 802.1ad check from .port_vlan_filtering to
  .port_bridge_join.
- patch 3: Clear ANA_ANEVENTS.CPU_LEARN_FAILED before each CPU learn, so
  the result only reflects that learn.
- patch 4: Do not offload MDB entries in the reserved VIDs 4032-4095.
- patch 5: Refuse a bridge number above max_num_bridges in
  .port_bridge_join, DSA can reuse a number allocated by another tree.
- patch 5: Refuse vlan_filtering changes on a bridge with switch ports,
  and do not install FDB and MDB entries with a VID of a VLAN-unaware
  bridge, which broke FDB isolation.
- Link to v1: https://lore.kernel.org/r/20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700@microchip.com

---
Jens Emil Schulz Østergaard (5):
      net: dsa: lan9645x: add the analyzer event register
      net: dsa: lan9645x: add vlan support
      net: dsa: lan9645x: add mac table integration
      net: dsa: lan9645x: add mdb management
      net: dsa: lan9645x: add bridge support

 drivers/net/dsa/microchip/lan9645x/Makefile        |   3 +
 drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c  | 264 +++++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.c | 635 ++++++++++++++++++++-
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.h | 106 ++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c  | 256 +++++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_port.c |  14 +
 drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h | 196 +++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c | 429 ++++++++++++++
 8 files changed, 1892 insertions(+), 11 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261118-dsa-lan9645x-add-vlan-and-bridge-offload-9b28e691f883

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>

