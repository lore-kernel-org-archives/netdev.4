Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175835;
	b=uAzSh2RHliAiFzAptmaFNnss597ZmrxdCLNXJvXwCA3bnfGuCDJpLd/RAE60n77JhToW
	 ug45OHEYYKjBHYPJXojlogHwzH52bkx3x73zKy9j1vZxj47bJuhkLzl9yBiQ0+uJewzrG
	 oAGcu2wGCnepMBFnL2IJmT1iuyyRSiuA1IU92NL+AFVY7IUQR8dOr1AGoWUZ6PCxy3JG8
	 KxeC+vd/ONNiBRoCq8DJTNSmBy8myryk1Sw9HlhM1e1qX8ly/JZCgtGr9AxHtW18149Ry
	 7ZKCqsH7HuGjsAPLAA3djK1nrprQiKVAfULzwKuW68jtsbYz9op+iZP89bWwY7N41dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175835;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=oCdr+PwiWxnHEBHyM6wpXGYbjiWS3gQP9jStR6G63R8=;
	b=5HBrHJ3SY4SHZFAKpX8LoKakakFjWdmFaOuHQ+Jm7MJdAhz5vAjm/Z0A0MZJyNnh7Jaz
	 cMIGezERHFmapTocuE5OipktBBRKy2JMfuPYGHw1jXXsir7NaqLhPOa6hLAddIw66s/tT
	 bgqM15tW9SSVg66FeOuoKr5UO5BqJj8sjTTLppDa+F0QhAJyljv3KMwkdZSN3Rl8DYrlu
	 CYjnnW1Qy9Ddh9deJGY3jsONvMyxZ6Igo8NyLboWXQ6KHZqmS5AwMhdE8stAbvrlMcMHh
	 vW7ZkYHUcL+B0Tk5HMN1ByYu1ucbj/A7RFNQLsmGBH0VT9E1X8nZbAD0ycJ/kCut/Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=065WFYHY;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20388606A325;
	Fri, 20 Nov 2026 11:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20388606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=065WFYHY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795175843; x=1826711843;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=nwRRbBo4QR08d+uEn4AGZsszpR6P1gLn0y/z3Dsp2G4=;
  b=065WFYHYwOgFDQhB/zIp7I0Eb7wOzTWQq4+B5VfHodM46Svo7EEnISwY
   nUaaHHTe8iUqSgbdD7ECbpeOGyR+S9VNezVbpeKO5x4CjkJ/BtCnzaaNQ
   Hiq/Kzozz5vW2TAys8z7aNV1QkyFBfsHMj9beJuRza74oDrkUOsNfwOYP
   HnIBHVsmpTDpRIWMu/76qPklDJaAPAjjEUbJVph7smuHxrkiu7BEnGvHe
   TYe7Qyebst/p4acdPuPFtA9IUlkntSYacPXq99jzGr6amfoAid+QEqGNJ
   sm49enKbOGs28hnQvkyLcEcXLpNBf3AqsaIOey92J7JOo+pSaueZC9/0U
   A==;
X-CSE-ConnectionGUID: x6sG15HiRgSWNyvCIZW25g==
X-CSE-MsgGUID: fdBJd2GDRk+aeC0G9qD1uA==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="77589742"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 04:57:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 20 Nov 2026 04:57:13 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 04:57:10 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v3 0/9] net: sparx5/lan969x: add support for
 changing the MTU
Date: Fri, 20 Nov 2026 12:56:57 +0100
Message-ID: <20261120-sparx5-mtu-change-v3-0-55c272fe1acc@microchip.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIk1AGsC/23NTQ7CIBAF4Ks0rMXwI8W68h7GBdDBsihtAElN0
 7uLxIUxXb68ed+sKEJwENGlWVGA7KKbfAn80CAzKP8A7PqSESOsJR0nOM4qLAKP6Ym/B70Eram
 S1iiFym4OYN1SzRvykLCHJaF7aQYX0xRe9Vmmtf+4lBKx42aKCbZMaqXFmZxafh2dCZMZ3Hw00
 1jFzH4USvcUVhTRmY5yIeFs239l27Y3DXufcQYBAAA=
X-Change-ID: 20260930-sparx5-mtu-change-d7ebb1a7fcaa
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.3

This series adds support for changing the MTU on Sparx5 and lan969x.

Currently, there is no ndo_change_mtu callback, and the MAC maximum
frame length, the FDMA buffers, the queue watermarks and the TAS guard
band are all fixed for a 1518 byte frame. This series makes them follow
the MTU, and sets the maximum MTU from the 14000 byte frame limit of the
MACs. As the FDMA is shared by all ports, new buffers are allocated
while the FDMA keeps running, and the FDMA is only stopped briefly to
replace them. Details are in the commits.

Patch 1 makes the FDMA stop sequence actually stop the channels, and
patch 2 frees the FDMA buffers on init errors and deinit. Until now, the
stop sequence was only used on deinit. This series also uses it, and the
new free functions, to resize the buffers.

Patches 3-4 prepare for the MTU change, by adding a helper for setting
the MAC maximum frame length, and by making the FDMA init and alloc
functions operate on the rings passed to them.

Patches 5-6 size the FDMA buffers from the port MTUs, and add support
for resizing them.

Patches 7-8 scale the queue watermarks and the TAS guard band with the
MTU.

Patch 9 adds the ndo_change_mtu callback and sets the maximum MTU.

Tested on Sparx5 (PCB135) and lan969x (EV23X71A), by forwarding frames
up to the MTU and checking that frames one byte over the MTU are
dropped, by sending jumbo frames to and from the CPU while stepping the
MTU up and down between 1500 and 9216, and by changing the MTU
repeatedly while flooding the CPU with frames in both directions.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v3:
- Rebase on net-next, which now has commits 81d2cf1c6d56 ("net: sparx5:
  fix RX ring stall on frames from inactive ports") and 1a47bc214d00
  ("net: lan969x: fix RX ring stall on frames from inactive ports").
- Patches 1-2: drop the Fixes tags and the testing notes.
- Patch 2: on Sparx5, clear the RX buffer slot as soon as the skb leaves
  the ring, so that a frame dropped because of an inactive source port
  is not freed again by sparx5_fdma_rx_free().
- Patch 6: likewise on lan969x, clear the RX buffer slot as soon as the
  page leaves the ring, also when it goes back to the page_pool.
- Patch 9: extend the top RMON histogram range to the maximum frame
  length.
- Patches 5, 6, 9: use SKB_WITH_OVERHEAD() for the lan969x DB size,
  and fit lines to 80 columns.
- Link to v2: https://lore.kernel.org/r/20261111-sparx5-mtu-change-v2-0-59c91357e8f6@microchip.com

Changes in v2:
- Patch 1: add a Fixes tag.
- Patch 2: also release the lan969x TX buffers that are still in flight
  on deinit, store the length of the mapped TX buffers so that two-step
  PTP skbs are not touched when unmapping, and add Fixes tags.
- Patch 6: reuse the lan969x TX buffer release from patch 2, and mention
  in the commit message that frames still in flight are dropped.
- Rebase on net-next, which now has commit 873363ac591a1 ("net:
  sparx5/lan969x: release the in-flight slot of a stale TX skb"), so
  that a two-step PTP frame dropped by a resize no longer leaks its
  timestamp slot.
- Link to v1: https://lore.kernel.org/r/20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com

---
Daniel Machon (9):
      net: sparx5/lan969x: stop the FDMA channels properly
      net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
      net: sparx5/lan969x: add a helper for setting the MAC max frame length
      net: sparx5/lan969x: pass the FDMA rings to the init and alloc functions
      net: sparx5/lan969x: size the FDMA buffers from the port MTUs
      net: sparx5/lan969x: add support for resizing the FDMA buffers
      net: sparx5/lan969x: scale the queue watermarks with the MTU
      net: sparx5/lan969x: scale the TAS guard band with the MTU
      net: sparx5/lan969x: add support for changing the MTU

 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |  10 +
 .../ethernet/microchip/sparx5/lan969x/lan969x.h    |   2 +
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 185 ++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   2 +-
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 322 ++++++++++++++++++---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   2 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  14 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  34 +++
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  |  48 ++-
 .../net/ethernet/microchip/sparx5/sparx5_port.c    | 123 +++++---
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tas.c |  43 ++-
 12 files changed, 687 insertions(+), 103 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20260930-sparx5-mtu-change-d7ebb1a7fcaa

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

