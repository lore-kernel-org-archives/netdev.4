Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778735;
	b=FCqQvl2pHY5kxMD9Cl/Z7W+74wkEo7BG/nxx0jmUhm3hPknmP0g+ROjqxgeAHSQAmUQL
	 lUMzkmlcpURsbfXMiwU60niU3DYinT3iYE0G07P+2/M87rAzr8B51jsosEKpAwb7ZAH5Z
	 PfGE9i3VKrmgyNVoHewQZVA6vFgz/nxLqWCYDOj7phqaPjl320P+pBRvYVYs3aHMN/Hn5
	 X6A/hIWrgXx1a7crwvEd3szCGA1SzWYW9Q6C7JMWLSHc1+04J2B7gYmcjcAlWGMqPWPia
	 QDsKACTbWLB20F/1MIGRkKHtshuh5MI5rL9xq6nPcrWHK6XDHnc4yJiQEY4XwaJ43kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778735;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=dTB3bs0wjkPxmIOZbsgvLc6TFaqy4EaLGf0Kul8UYlQ=;
	b=rbVJnSKqvFWdXbQtMmB87mW3430CVQqTqwq5vqFlIbs/oicPdD4GJ/Egt9Tfhwo2TQUY
	 Hqd7BEJCOGiE1savbSGUVodsO3n9YIfiUvfAgRHDZA27wDCi2AmIKwbb0WwZHsobr/GdA
	 Lqp+y64diApzVz3UXp4ZGq3fGTFnGI2+8k7skZnsinZFJYfC+bNAYuYwTx6XWsjunzQnr
	 XA6WzVP1TVJ8Q/KcAIvmKo/0e55DdWBA8yF9Gzh0UCdsfHQLEkcHR7drRD1zvqOWaYtmH
	 5tZr+5htc6NQUw03FEfatts6uDf6Qs2vOPWR/QR8GAIBFKG5yCGM0aJnnVh+y+WuKfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=xiKECtES;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B0606A31E;
	Fri, 27 Nov 2026 11:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=xiKECtES
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C6B4A1674;
	Fri, 27 Nov 2026 12:25:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795778730; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dTB3bs0wjkPxmIOZbsgvLc6TFaqy4EaLGf0Kul8UYlQ=;
	b=xiKECtES0JXNksk3FuYYo0HIe1QW2TOBVGBxUn+PwXbKOl2mwXDsYQYKY3FIgqswWRPdIK
	MGNz/JWwS25QAoJrrVpVC3L7hixSTi8oHPh12sRX+0+xiZ6Z/4dcKcrVsd+DsXGHmS0GzW
	WFIAp3C+sgDfKf+9RKtjziWBTHFctjAp84U8Ok1bqtYHoz+vgc+UH8IAJA2o+L5dUbDr2E
	VB6SRlNhwxD+h8lzasmgf4yuiZjtn7VHH3SFHipeRnvSVDHpN9wxto5q7r7qPbjDBVZuk6
	XQlvxW/17u64WxbLygw5lqx0owhd5zpfyINT9yQ2jFS7Xv+6Mnku3fu3zhDgdw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net-next v10 0/8] net: bcmgenet: support larger MTUs
Date: Fri, 27 Nov 2026 12:25:10 +0100
Message-Id: <20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97@tipi-net.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33RQW7DIBAF0KtErEsFAwymq96j6sLAkLAoiWzXS
 hXl7iXelMq0Sxh4/C9ubKYp08xeDjc20ZrnfC51IcXTgYXTWI7Ec6wbDASgFAJ48fxIhRb+sXz
 yUvgKXAvwhjApgYnVi5eJUr5u6ht7HC10Xdh7nZzyvJynr+25VW7z/+BVcsEdxoDR6OCJXpd8y
 ZVbniNt4Aotgl0EKhK0J5DSSCdhj6gWsV1EVcTq0ToMQrrQSaIbRPbr6IoAASmfxjSEsEdMi6g
 uYioiLHpMAbTwnST4g0jRR7AiKKNBJdEimT1iG+SPOrYiWo0mOuEVGNwjQ4sMXWR4JBmSNTTGp
 KjzO65BoF/HPZIkpyJF6bz3v5H7/f4N/jXUw+kCAAA=
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

This is v10 of my genet series which adds larger MTU / jumbo packet support.

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
Changes in v10:
- Patch 5: Link to the split proposal (sashiko)
- Patch 5: only a v5 is known to hold 0x80 in the threshold (sashiko)
- Patch 7: reuse the rings when the MTU keeps the buffer size (Daniel)
- Patch 7: drop the tx_cbs check, the core returns -ENODEV first (sashiko)
- Rebased on net-next (my dim series was merged and conflicted)
- Link to v9: https://patch.msgid.link/20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de

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

 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 792 +++++++++++++++++++------
 drivers/net/ethernet/broadcom/genet/bcmgenet.h |  38 +-
 2 files changed, 646 insertions(+), 184 deletions(-)
---
base-commit: e20a00eb02ca87ab8e6e57468ed77268062bac74
change-id: 20261002-nb-genet-mtu-nn-v2-402b5e6f306f

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>

