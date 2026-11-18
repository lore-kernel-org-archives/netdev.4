Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014254;
	b=vyS38uq5G3+kh9DlPHonJzf0eHwHAd5SbOo8zC63jRPn9Y5iL/FFH5Tak7XM0dLBqvci
	 3ZyQBOUhTv5eI2Cr4059fbB1J4Vwa2cN/uiu5OlGznkPhwYlGTryAhcnPMCzKukGVfLYj
	 IX3vDNufIt4pDei85S+TcMS6HJ688pBshl9HIcBlHkXYFc2OtihXEuiMhIoJ+FOBFH7Ef
	 B/NaWT1u9aID7692NEWdHQxsREMISAgVWMui4XMhQmWuAxqrMAV64fOmlVpBrSsFYrVX9
	 7JPEa8msDK7/c+Zza9jJgS+WeJdC6tUo5S+sCUCpgvB9qoMCalY37OuSxN4BIKjv0NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014254;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=4INr3kY5jF3wunp/5qgNIrFjc4TwCkYK4FUtn3I72QM=;
	b=mCjI+bwnCiKLQLHO6RxaJB+y0XE7sDJy1mpgg9czxsQYNDwk1QeveFGlnPG5WJrD1o2x
	 bXzvfOO3q9RDTbW/t9gVBgZvFznElK8CfA/4cj4ZNEfTXpVG6wcxzSohPLqQPTyIeaYWz
	 uHTUqeWfIzFotOdc6WEikhcnE7Ly3Zd3NP4qgdkXhrI6uZJhG6oWRxzaOxTRPC1ciDPCb
	 iUCJkbCKXzBr+5xDgzYkdIuw1NKmT+bh1MkBkb1rmPSpu3CFnkJLf69qRo5mgwX/okF3r
	 7pSnKkzN0L24/5C02FNz2cnCWEtlg1VhxTLMDUMSHi35ItNI936JkxFyyolW/EppwlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=uEwHUsXT;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D99B606A320;
	Wed, 18 Nov 2026 15:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D99B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=uEwHUsXT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76BE8A02C3;
	Wed, 18 Nov 2026 16:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795014244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4INr3kY5jF3wunp/5qgNIrFjc4TwCkYK4FUtn3I72QM=;
	b=uEwHUsXTy4LJ6omsXM9ND62ZdeLedP7T3UypEX+VqzGC2i0fxQd7RNKYKmQXFOwhWcG9hn
	6SBBysG7/u6XEvoABLagB0zJvrhhZVhuRlJm9Qj1BZp+JFYhChEXdFLITBmsvQ5hluM2nS
	T/HwdJrqznrGp3N/qM+okboZyTpDpcVE6T6q/soNj5XvCiF8+Ir1e4IuP2mg7mRqIj+uxG
	cD1ljF927NerdkCK66ylHUyvy3aQVKtFxBa9SGMFROFerbKSqafxtiJYvRVh4o3wlARoxL
	/xn+toLKipdyCQ5yV32jvWlcHdpU6InXNCak02GjBUUtDy/UMkejTSFEqwvOtA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net-next v8 0/9] net: bcmgenet: support larger MTUs
Date: Wed, 18 Nov 2026 16:03:33 +0100
Message-Id: <20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2@tipi-net.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PwW7DIAwG4FepOI8JGzBNT3uPaYcATsthtEpY1
 KnKu4/lskxhO1q//dl+iInHxJM4HR5i5DlN6ZprcXw6iHDp85llirUWqJBAKZTZyzNnLvK9fMi
 c5YzSKPSWadCKBlEHbyMP6b6ir+K7NfO9iLeaXNJUruPnum2GNf8PnkEq2VEMFK0JnvmlpFuqX
 HmOvIIzbhFqIliRYDwjgIUOcI/oLeKaiK6IM73rKCjoQuMSs0Gg/Y6pCDKy9kM/HEPYI3aL6CZ
 iK6IceRoCGuUbl9APAqqNUEUIoiUN5IjtHnEb5I93XEWM7m3slNdo6TeyLMsX+qqbP14CAAA=
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

This is v8 of my genet series which adds larger MTU / jumbo packet support.

Larger MTU aka. jumbo frames are requested often by Raspberry Pi users, but
the hardware has its quirks with larger frames. Dave Stevenson's PoC [1] had
the receive side working, and thanks to Justin, who checked the RTL for what
the hardware does with long frames, I could add the missing puzzle pieces.

GENET never sets dev->max_mtu and the packet ready thresholds stay at their
2048 byte reset default, so long frames were dropped on receive and never
sent on transmit.

Patches 1 to 5 prepare the driver, patch 8 sets the MTU, as far as one
descriptor reaches (3564 bytes with 4K pages). Patch 9 reassembles what the
hardware hands up above that, which gets the ceiling to 16347 [2]. Patch 6
splits a frame ending just past the packet ready threshold, which otherwise
stops the transmitter [3]. Patch 7 builds the new rings before dropping the
old ones, so a failed MTU change leaves the interface alone.

Only v5 gets the larger MTU in this version. The TBUF sizing and the
transmit length width on v2 to v4 are unconfirmed, so those keep the
default until someone with the hardware or the RTL can say.

A split frame takes one descriptor more. Patch 6 adds it to the two limits
which 1e09af397bc7 and fbfd7cfd2019 put on the 32 descriptor rings, so the
queue stops one descriptor earlier and a frame is flattened one fragment
sooner.

Patch 8 needs bcmgenet_fini_dma() to clear rx_cbs and tx_cbs, which landed
in net as 1c1f51c3ee9c.

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
Changes in v8:
- Patch 5: the TDMA ring keeps its reset buffer size, it is unused (sashiko)
- Patch 6: the split window follows the DMA burst length, not a fixed 64
  (sashiko)
- Patch 6: track which descriptor owns the head mapping (sashiko)
- Patch 8: only v5 gets the larger MTU, v2 to v4 are unconfirmed
- Patch 8: replay a latched energy detect event after the MTU restart,
  bcmgenet_netif_stop() cancels the work that would have handled it
- Patch 9: count the frame a SOP with a bad length aborts (sashiko)
- Patch 9: clear frag_drop at the end of the dropped frame (sashiko)
- Dropped Florian's Reviewed-by on patch 5, it changed
- Link to v7: https://patch.msgid.link/20261112-nb-genet-mtu-nn-v2-v7-0-43a5d90b3256@tipi-net.de

To: Doug Berger <opendmb@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Nicolai Buchwitz (9):
      net: bcmgenet: ring the doorbell when the last frame of a batch is dropped
      net: bcmgenet: let the caller decide whether to start the PHY
      net: bcmgenet: allow a continuation descriptor without the alignment pad
      net: bcmgenet: rename ENET_MAX_MTU_SIZE to ENET_MAX_FRAME_LEN
      net: bcmgenet: derive the receive buffer length from the MTU
      net: bcmgenet: split frames that end just past the transmit threshold
      net: bcmgenet: build the DMA rings before giving up the running ones
      net: bcmgenet: allow the MTU to be changed
      net: bcmgenet: reassemble jumbo frames from status block fragments

 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 759 +++++++++++++++++++------
 drivers/net/ethernet/broadcom/genet/bcmgenet.h |  38 +-
 2 files changed, 613 insertions(+), 184 deletions(-)
---
base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
change-id: 20261002-nb-genet-mtu-nn-v2-402b5e6f306f

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>

