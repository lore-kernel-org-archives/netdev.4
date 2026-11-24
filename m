Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510666;
	b=Ra/PXLMdvjgsgExK4FmATD/P1qJyZ2jklzfkkOlPO6fCjGkaW+B3dl78Plx/N/60/RGS
	 3No/nZ/bq8ruMc7RK5J/NJdpIkLbV1LqvcJMCcbyAkgWK+03UaWN5pQPEgcrHnRzSNx8G
	 LwwW2i8HZBydoJEs1DjNm8su4Cw+G9tGSgX1x7K5aU3VZ7U8wAwcF7SdJ4rLnBM0HeDlN
	 fnwlUkx2HRM2LpZ2vieTaYINGfenKbay4kT3DdDsmmU2gue/2BwcPImy3F61YNzhQyQBm
	 XLqnMD0o1GTC+Zjk49+G7PjmjiNjxDfAYTP/R2tFOBuF3wy1bo7V6qwSRzDO8YFcwyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510666;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:CC:X-Mailer;
	bh=U8w7txm/eaVpIyfjIYyXddy6tB1pTPcI3WhXK9JcyLo=;
	b=MPWVhzi4VT4dT4MSFNrJkpdRI4ZzKpFPQQOpSw4YWmiTcIax8PIeAjaTSZXDnOHx5ehe
	 bkUZMBeV7ULFSaGFgAVhFuoI1UGxbp3TdFSvIr8T9pPbGmoQ3Vy/aBAkKCOoT/xGmDsln
	 4VT+2+20sYl/xsIAL2HyQhFg/CzOTcpM3i2vpCW4oc2DZY2GaTsQQSJ1A6Fcvq+nd6Ljt
	 DzHUceIuBjVwN+JKSkUtEzoQ8ielxSlkQKbwa8oZgdN+airJK0roM1lgw0bANCclBpByr
	 CLv8xxnA2l8mmD6lVV0Kq+r6ZX5mF6Wb9hDHUN8pyHIY3QDEvI9jdFhR/KmbqC7Kl9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ZuSHv8ez;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A1606A337;
	Tue, 24 Nov 2026 08:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A55A1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ZuSHv8ez
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795510664; x=1827046664;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=4sxGjZt+mK0oUUet/l5stbDyXUXpx4CSRNHSRvR4TrQ=;
  b=ZuSHv8ez9LnDBw4B9UOk0yZ+TAQ1uM6UefYyaaG75Hl8EInARraGKJlr
   h93GJdD62pNlHFEOngX6y3mAYbPGdpVfCfrhYTsU3q3JnW8WwZ7MWc4Kn
   +4op/Ly6R3txwsj80xZdPieSCNCsdfEvOyN5ML7iV/gD1MaGMfmGhuZOS
   s8i4XzZizFj0Cg2zAdqYvIb/JhdMRIZjEcFnVQG/D//CNr6QRQRkLYSL/
   301+3f6XyTqoW1/fO8fbwQgkyofGfGxG1/HrTkTHsTDTRRgAA2TlzyMva
   Om0Z9GdpCZVp/phMdOiaaYg3/AGjChKkFCShLEnLQ04XCKzQMW2tmSOaC
   Q==;
X-CSE-ConnectionGUID: K+YESf9JSKmGqBiAWaKBSQ==
X-CSE-MsgGUID: PawDLGb2TaC5UOKANGxmtw==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="65995585"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 01:57:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Nov 2026 01:57:43 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 01:57:41 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH net-next 0/5] net: dsa: lan9645x: add VLAN and bridge
 offload
Date: Tue, 24 Nov 2026 09:57:06 +0100
Message-ID: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700@microchip.com>
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
X-B4-Tracking: v=1; b=H4sIAGJRBWsC/x3N0QrCMAyF4VcZuTZgq5bWVxEvMpNqYKTSjlEYe
 3eLlx/8nLNDk6rS4D7tUGXTpsUG3GmC14fsLag8DP7sg3MuIjfChSyF660jMeM2hGSMc1Uefcl
 5KcSYZh8lJJdjvMCY+1bJ2v9XDzBZ0aSv8DyOH8YdaeCEAAAA
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
at most 1 VLAN-aware bridge.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Jens Emil Schulz Østergaard (5):
      net: dsa: lan9645x: add the analyzer event register
      net: dsa: lan9645x: add vlan support
      net: dsa: lan9645x: add mac table integration
      net: dsa: lan9645x: add mdb management
      net: dsa: lan9645x: add bridge support

 drivers/net/dsa/microchip/lan9645x/Makefile        |   3 +
 drivers/net/dsa/microchip/lan9645x/lan9645x_mac.c  | 267 ++++++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.c | 564 ++++++++++++++++++++-
 drivers/net/dsa/microchip/lan9645x/lan9645x_main.h | 114 +++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c  | 256 ++++++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_port.c |  14 +
 drivers/net/dsa/microchip/lan9645x/lan9645x_regs.h | 196 +++++++
 drivers/net/dsa/microchip/lan9645x/lan9645x_vlan.c | 429 ++++++++++++++++
 8 files changed, 1832 insertions(+), 11 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261118-dsa-lan9645x-add-vlan-and-bridge-offload-9b28e691f883

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>

