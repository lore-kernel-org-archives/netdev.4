Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425454;
	b=sgbebbIG4rhWq1WgIYTSjKqWDnkPv3Vj3DnuXF/GwXCWq9NoBF/PTCIVnZbSG0G6E8nK
	 Gk0VSjN5Ue10wLzrfP9Y2DvcLtTciUQZV51V52G7DI6EpYB59SF9412XyFSxcN+LULJch
	 JUNRx2LlEc6p0R+VTSsQkiqdLIseRebylssI7stMAoTgsDQYzMouOrA6p/UDPdfJc2VOD
	 uD7aZDo0TkXC8dzalglAunC4JMiKaDxvue0rOq497H6b/0Xqu+3j5TIirmnaJhrzCeHTE
	 C04wNdsRxv3iMyGsGm/vnuaAJHWLKuYpKtRMLeMBW+1ioqaEspyyqWqlAW9zmX4Kwnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425454;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=/5Alh55N7J0oTlC8wVEZ9YwhN/6Efp5NyB3IsCS6rUY=;
	b=oFN4rP3l0/sleZW9w+I/K61EZRE0Q9Q5FBqhIIlvzvcFSKY2CsVTkQlP2JIj0oQjLPxp
	 ZmLGB8rZJPl6DnV2Sg/Ek0ePZwpU214QYWPOEYbR+dlzFQRkwsTB+eqdoPngp9DXEx+jh
	 zrt+raVGFAlZvNQx7Hju0B6FjaiQiAW4DLxWNUJUIpFQ3FcMHF6oJ4p2ZKT7U6AMWpiXi
	 3tlwOdIiL3sw2RNRabSdXd4WRmU3xKXf3amWsFcHSIfnnitXHVoMdsY2yw0aV0FwnYzFE
	 /Fx/fKUtPrDBGvri3EUMPE8/VNkXYJNP5kZ4e7Qb3bciEXvG7Q6hhPeFtJH7TSbP6CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=tIv7hIh7;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1EB606A321;
	Mon, 23 Nov 2026 09:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=tIv7hIh7
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EB4DA0011;
	Mon, 23 Nov 2026 10:17:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795425450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/5Alh55N7J0oTlC8wVEZ9YwhN/6Efp5NyB3IsCS6rUY=;
	b=tIv7hIh7MobSljNrpown+5g1FU1okuwmryMd7oSgT8TO4zM4FAhcn1mOCnvRWhzYMbpR+Z
	yHinDM3bwxX1NmZ82JZfjUA89qG6gsd93jkT7n0EJvN2E8msS2ptcalfUocXWQ1Us0bMoz
	wOLqeyopUkzQ1gtSwy3F47bN6Tl32Sw0Lxicb2My2rpkyYiVbNnIoS2kgKCarVTRNZAYoY
	COor/tzKfV4rSgB2MGQ0msZkQjLPplB3U9pDgXltJng+l7WtDUbZf4eoRpXKLX7iGEEAcM
	nGpp+6tgrWWch4Z1zj8K/UKwM1RKM8hm0XowI/xlCra5l9TMc/Brc/do+o5EdA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net-next v9 0/8] net: bcmgenet: support larger MTUs
Date: Mon, 23 Nov 2026 10:17:08 +0100
Message-Id: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33RwW7DIAwG4FepOI8JDJhkp73HtEMA03IYrRIWd
 ar67qO5DC1sR8vm829xYwvNiRb2crixmda0pHOuxfh0YP405SPxFGrNQABKIYBnx4+UqfCP8sl
 z5itwLcAZwqgERlYfXmaK6bqhb+wxmula2HvtnNJSzvPXtm2VW/8/eJVc8BGDx2C0d0SvJV1S5
 cpzoA1coUWwi0BFvHYEUho5StgjqkVsF1EVsXqyI3ohR99JohtE9s/RFQECUi5OcfB+j5gWUV3
 EVERYdBg9aOE6SfAHkaKPYEVQBoNKokUye8Q2yB/n2IpoNZkwCqfA4B4ZWmToIsMjyRCtoSlER
 b9+536/fwMh36aiowIAAA==
X-Change-ID: 20261002-nb-genet-mtu-nn-v2-402b5e6f306f
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Justin Chen <justin.chen@broadcom.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This is v9 of my genet series which adds larger MTU / jumbo packet support.

Larger MTU aka. jumbo frames are requested often by Raspberry Pi users, but
the hardware has its quirks with larger frames. Dave Stevenson's PoC [1] had
the receive side working, and thanks to Justin, who checked the RTL for what
the hardware does with long frames, I could add the missing puzzle pieces.

GENET never sets dev->max_mtu and the packet ready thresholds stay at their
2048 byte reset default, so long frames were dropped on receive and never
sent on transmit.

Patches 1 to 4 prepare the driver, patch 7 sets the MTU, as far as one
descriptor reaches (3564 bytes with 4K pages). Patch 8 reassembles what the
hardware hands up above that, which gets the ceiling to 16347 [2]. Patch 5
splits a frame ending just past the packet ready threshold, which otherwise
stops the transmitter [3]. Patch 6 builds the new rings before dropping the
old ones, so a failed MTU change leaves the interface alone.

Only v5 gets the larger MTU in this version. The TBUF sizing and the
transmit length width on v2 to v4 are unconfirmed, so those keep the
default until someone with the hardware or the RTL can say.

A split frame takes one descriptor more. Patch 5 adds it to the two limits
which 1e09af397bc7 and fbfd7cfd2019 put on the 32 descriptor rings, so the
queue stops one descriptor earlier and a frame is flattened one fragment
sooner.

Tested on a Raspberry Pi CM4 (GENET v5), peer at the same MTU:
- MTU 1500: iperf3 TCP 942/936 Mbit/s, UDP 956 Mbit/s, unchanged
- MTU 9000: iperf3 TCP 991/986 Mbit/s, UDP 992 Mbit/s, no transmit loss
- MTU 1500 to 16347 with traffic and ifdown/ifup's
- pktgen at line rate, 3858/3872/3886 byte frames mixed with 64 byte ones
- raw frames across every receive descriptor boundary, byte exact
- CONFIG_MAX_SKB_FRAGS 31, 29 to 31 fragment frames in the split window
- every frame length from two below the threshold to 79 past it, linear
  and paged, each followed by a short frame, no stall
- the same with CONFIG_DMA_API_DEBUG, no error and no leaked mapping

Pierre-Marin Leclercq tested v5 on a Raspberry Pi 4.

[1] https://github.com/raspberrypi/linux/pull/7614
[2] https://github.com/raspberrypi/linux/pull/7617#issuecomment-5669564355
[3] https://github.com/raspberrypi/linux/pull/7617#issuecomment-5735557324

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Changes in v9:
- Dropped the doorbell patch, it went in as 16cc4936fb8e
- Patch 7: unmask the MDIO interrupt before dropping the PHY lock
- Patch 7: do not rewrite rx_buf_len while the receive path reads it
- Rebased on net-next
- Link to v8: https://patch.msgid.link/20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2@tipi-net.de

To: Doug Berger <opendmb@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org

---
Nicolai Buchwitz (8):
      net: bcmgenet: let the caller decide whether to start the PHY
      net: bcmgenet: allow a continuation descriptor without the alignment pad
      net: bcmgenet: rename ENET_MAX_MTU_SIZE to ENET_MAX_FRAME_LEN
      net: bcmgenet: derive the receive buffer length from the MTU
      net: bcmgenet: split frames that end just past the transmit threshold
      net: bcmgenet: build the DMA rings before giving up the running ones
      net: bcmgenet: allow the MTU to be changed
      net: bcmgenet: reassemble jumbo frames from status block fragments

 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 738 +++++++++++++++++++------
 drivers/net/ethernet/broadcom/genet/bcmgenet.h |  38 +-
 2 files changed, 603 insertions(+), 173 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261002-nb-genet-mtu-nn-v2-402b5e6f306f

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>

