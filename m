Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222232;
	b=oamkHGhsXQS/3yjGElfq75ydSZDBarl89yIxo6fYMG1mbAq78euTTSeMR1g0IZC5dlSy
	 WLzzyCFbVX00UKqRGKKDiWPg0FDnBHNdv7Q8LD/9ckZ+vjZpo+XrmROUKCjfliuLZEQUa
	 +odCZE/T3Lr3nd2CFcAG6yGS384aulPQLjo2+KUZsYJtya1mkuXK8hUy3aTF/C1YIMU3w
	 FtkrGVS39XlZu/kms+TCHio3Oed+ibao553ONY7t4AcQU4T5Q4xV6UbwuUJshNhdwMSxg
	 paoufGDhpNr3j4waqDPhSakdjYxaZ6brMZSBWRAq5f1p4GEpL0EKAejkWQUl2bAtOAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L63Qbmak6mOfcYBVPUulxHStqDg4C1uut9driDjJtrQ=;
	b=Rm8niKwrN3bUoSi5UXe+vIOQh2zObDS7AUZ3Xw0ktnVkpn6zmyHbz4Vt5T+QiWZ28O31
	 SYG6bk8kpecsMJC4BHxWlyinwIBHTTlQn/Aqszw1hoEQ0Vq7OdoukoXM/8sj1n0V6F0wG
	 n6MLv/EHqNhqQqdEQb9pbykc5T2uYnHiuJJZk+UhwsS3GeY+432D+8+5xi/UE6DiJXzCq
	 aUxQM5wnPzdTYEz7kS5fHinEeEQdAY81zcGzEkGLz6WJhY/S5OPpScbwgd738kvSIwF1I
	 EnU9IEYnSoOUkSI8YfG0rlh0uEi0I+t6oP0rTiHmILUXMkhaOhVQI3Ss8g5/nCAHh1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRnvqOgm;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1543606A6A1
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1543606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRnvqOgm
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9ae391a05so10003385ad.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222221; x=1795827021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L63Qbmak6mOfcYBVPUulxHStqDg4C1uut9driDjJtrQ=;
        b=zRnvqOgmeffrkAGfE8k9zU02OSUc6Mn6zl746zRrJCnVYjYdanEicixTbGNsOrjUDc
         V+NVmCGPN9sXawDk1H71nGUANvJWY+pfCqCQ69F7hjlnuCFcvkjNt7NvjpDfS2EUWt80
         SSqFtYtgejn8l9X61nQ8DtW/e9fY6y2IA+TS33351b7V8j7jfXvkD5A597kx9syNsRfu
         jqdIlPujyrLqMm3phtF67xXg928iMxlXEx0tGegMiAbyDNYIgZtmI1DaAqk75ou+RLOn
         TcE/3Sr4V6NPbW8SWCZ/OvTbCv8KxkmwW28/AS7qKUotstIi/JqTtVo2HggJCLDcgcoZ
         wVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222221; x=1795827021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L63Qbmak6mOfcYBVPUulxHStqDg4C1uut9driDjJtrQ=;
        b=O7fxzFmUFwFbvHdWeW5sZZpyr4JctXCzrp5yE2InvhVOusIMKszGAE5VWv6DR87xLd
         /bu0U/NgI4K7viedSPjxWEyWvgvlhqv+fcAnqHLV08FoU/+SmWFu1SowGhB+OYE6p2ak
         gPfLBJF4ny2RA0NKH+ugWuCoZH/YQ2w6k44T7eHtp0aJ/a8vEfEjapozrCERf23pdERK
         vQ5npABlqPaME4zPZ7VQ9MAS0KCzoiz1B71Sv+ZmPmtg7/wHPNK3aAzqNLTYjMNVF6FP
         OLrkabUYi3nUKxCRdiMcUeB3luFhaXhSclM8Rz34WyWByCAdgSor3Rn0xiFALD1UKvnb
         +hpw==
X-Forwarded-Encrypted: i=1; AL+hErF1NQmd3Afiy71XlgMEIB5zkDGzrSVWyzbmMypQ+tWZqK+ORQq4OUPJ4M9z3cKxcqICYfXtGE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nTvjRFIfMTe2NdWdLxQvRcoOCVAX+NoIbnJSjfvHcGgc8V0U4
	15q4/TR+7i7SDLAOAkFpdx9Ga6bhTIo7jvqaZMkRecCwirDy8KjOpO3c
X-Gm-Gg: AZFdTZcys4sV6noXTHMytr/tFM4UVcnjJaLBUdVREtZd6vaT8kE2NSntFWo3pmYMtWW
	mAQFNP/jGf7A/CpcxzTcI1Hq/R/Jer7GDMdSyEN1ysv2FVLb5eVkBVIPYqIaAo09IgFJe0nyexe
	v+DoP50AEbwmChK7mnPCkmEN/MUVF1bKHaltWOcC9TbEtAOUlFvrKcREEBpwGTmC/RHoFWdSvhd
	2STx6tMpcGi7llbIa5Bb7VkTR8bqjZ0OC126HZSFsku5+P6qoE6pwIdu9Wy839PEvEvakvPajrD
	siCltzpHBw7Fn9DHdPtE6Ld6Dt1/GRNjo8TCXcPFUxav7scgBe6LO7sbbQLaqgp3+bdfmWrblVt
	muEdiBVKxr6lisdWT8D1lHdmwvbRiK2N58g2v1hEQYk8CdEjJZLJZuXOEy4CafdGIk3nAhLOxej
	+XE4s34kic9dEeMtHZZY3lwOyVHeydZBCgkkxdn4stWtcZ9s+YPxbkQ8k3utOLJNDBV+SF7phIU
	ovPThkIRdJz7OZLm2v6Ek7W34KFSnY1ELqQWAS+ScXxv4UM/KoCBFqI1KzE0nrZiW/Qp5rHyL4h
	BxirPEk1F3tqbSXmIy+ceQ6G7dlv/wOV8gmUd4fLIyB50HB3+FLYmzdMxtvCeWx9ihOIrSNxg+m
	C5ChldIS7RQ4ZDBkXZExC1NHXH4ulAmM5/dPYKs9TC2Cb5FJ2BmN+BpvnX/tFAtPcrxeU3+Z4d5
	l7Zw==
X-Received: by 2002:a17:902:f54e:b0:2e9:8202:508a with SMTP id d9443c01a7336-2f031ee8f3fmr46802475ad.16.1795222221099;
        Fri, 20 Nov 2026 16:50:21 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc4f2sm21002375ad.30.2026.11.20.16.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:50:20 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	Simon Horman <horms@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net v4] net: bgmac: fix RX frame length check
Date: Fri, 20 Nov 2026 16:50:09 -0800
Message-ID: <20261121005009.59491-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

While reviewing commit 77dac783f113
("net: bgmac: rate limit RX error messages"), Florian spotted that the RX
length sanity check compares the length reported in the RX header against
BGMAC_RX_ALLOC_SIZE. That is the size of the whole fragment, including the
space reserved for struct skb_shared_info. The data area handed to the
hardware is only BGMAC_RX_BUF_SIZE bytes, and the frame starts
BGMAC_RX_FRAME_OFFSET bytes into it, so at most BGMAC_RX_MAX_FRAME_SIZE
(1536) bytes of a frame fit in one RX buffer.

A corrupted length well beyond that limit passes the check, and the
following skb_put() runs past the skb tailroom and calls skb_over_panic()
instead of dropping the frame. Lengths only slightly above the limit fit
in the alignment padding at the end of the buffer and were delivered,
with the data past the buffer end being stale memory.

The check has no lower bound either. A length below ETH_FCS_LEN wraps
when the FCS is subtracted, so skb_put() asks for almost 64 KiB and hits
the same skb_over_panic(). A length that leaves less than an Ethernet
header makes eth_type_trans() parse bytes the hardware never wrote.

The other limits in the driver do not agree with the buffer size either.
The MAC is programmed to accept up to 32 + ETHER_MAX_LEN = 1550 bytes in
bgmac_chip_init(), and up to 32 + mtu = 1564 bytes after
bgmac_change_mtu(). max_mtu is BGMAC_RX_MAX_FRAME_SIZE - ETH_FCS_LEN,
which leaves out the Ethernet header and any VLAN tag.

Such frames do not fit in one RX buffer. The DMA engine is the same dma64
engine used by b43 and brcmsmac, and with BGMAC_DMA_RX_OVERFLOW_CONT set it
continues the frame into the next descriptor's buffer. bgmac_dma_rx_read()
consumes only the first descriptor and parses the continuation buffer as
a new frame, taking its RX header from frame data the sender controls. A
bounds check on the length cannot catch that, and the stale memory in the
rest of that buffer is passed up the stack.

Fix all of this:

- Program UMAC_MAX_FRAME_LEN from the MTU plus a VLAN tagged Ethernet
  header and the FCS, and limit max_mtu so that the resulting frame fits
  in one RX buffer. At the default MTU of 1500 this gives 1522 bytes. A
  DSA conduit carrying a 4 byte Broadcom tag (MTU 1504) gives 1526 bytes.
  max_mtu drops from 1532 to 1514. bgmac_chip_init() runs on every
  ndo_open and used to reset the limit to the fixed default, so use the
  current MTU there. bgmac_change_mtu() also never updated net_dev->mtu,
  so the MTU seen by the stack never changed. Set it.

- Check the RX header flags. The MAC is not set up to discard errored
  frames (CMD_RX_ERR_DISC is cleared), so frames above the programmed
  maximum still reach the host. The layout of the flags is taken from
  bcmgmacrxh.h in the Broadcom SDK: bits 11:8 hold the descriptor count
  minus one, bit 7 flags an RX FIFO overflow, bit 4 a frame longer than
  the maximum frame length and bit 3 a CRC error. Drop frames that have
  any of the error flags set and count them in the matching statistics.
  Drop frames that span more than one descriptor and recycle their
  continuation buffers without parsing them. The skip count is kept in
  the ring so that it carries over into the next poll. The poison check
  stays first, since its 0xbeef pattern has descriptor count bits set.

- Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
  BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.

Only compile tested. Not tested on hardware.

Fixes: dd4544f05469 ("bgmac: driver for GBit MAC core on BCMA bus")
Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Fixes: 752e5fcc2e77 ("bgmac: reduce max frame size to support just MTU 1500")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v4:
- program UMAC_MAX_FRAME_LEN from the MTU plus a VLAN Ethernet header
  and FCS, and limit max_mtu to 1514, so every frame the MAC accepts by
  its programmed limit fits in one RX buffer
- check the RX header flags: drop errored frames and recycle the
  continuation buffers of frames that span more than one descriptor
  instead of parsing them as frames
- correct the commit message: lengths just above the limit fit in the
  SKB_DATA_ALIGN padding and were delivered, not panicked on
- AI coding assistant (Claude) used to help analyse the review and
  prepare this version; I have reviewed the result
v3: add a lower bound
v2: replace Suggested-by with description.

 drivers/net/ethernet/broadcom/bgmac.c | 55 +++++++++++++++++++++++----
 drivers/net/ethernet/broadcom/bgmac.h | 15 +++++++-
 2 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef7307edd41..d72e9c8577c4 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt

 #include <linux/bcma/bcma.h>
+#include <linux/bitfield.h>
 #include <linux/etherdevice.h>
 #include <linux/interrupt.h>
 #include <linux/bcm47xx_nvram.h>
@@ -435,6 +436,13 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 		dma_addr_t dma_addr = slot->dma_addr;
 		u16 len, flags;

+		/* The rest of a multi descriptor frame that was dropped */
+		if (ring->rx_skip) {
+			ring->rx_skip--;
+			bgmac_dma_rx_poison_buf(dma_dev, slot);
+			goto next;
+		}
+
 		do {
 			/* Prepare new skb as replacement */
 			if (bgmac_dma_rx_skb_for_slot(bgmac, slot)) {
@@ -460,10 +468,34 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}

-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			/* The frame did not fit in one buffer. The following
+			 * buffers hold the rest of its data, not RX headers.
+			 */
+			if (flags & BGMAC_RXF_DC_MASK) {
+				ring->rx_skip = FIELD_GET(BGMAC_RXF_DC_MASK, flags);
+				put_page(virt_to_head_page(buf));
+				bgmac->net_dev->stats.rx_length_errors++;
+				bgmac->net_dev->stats.rx_errors++;
+				break;
+			}
+
+			if (flags & BGMAC_RXF_ERR) {
+				put_page(virt_to_head_page(buf));
+				if (flags & BGMAC_RXF_OVF)
+					bgmac->net_dev->stats.rx_fifo_errors++;
+				if (flags & BGMAC_RXF_OVERSIZE)
+					bgmac->net_dev->stats.rx_length_errors++;
+				if (flags & BGMAC_RXF_CRC)
+					bgmac->net_dev->stats.rx_crc_errors++;
+				bgmac->net_dev->stats.rx_errors++;
+				break;
+			}
+
+			if (len < ETH_HLEN + ETH_FCS_LEN ||
+			    len > BGMAC_RX_MAX_FRAME_SIZE) {
 				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-						   ring->start);
+					netdev_err(bgmac->net_dev, "Found packet with invalid length %u at slot %d, DMA issue!\n",
+						   len, ring->start);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
@@ -493,6 +525,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 			handled++;
 		} while (0);

+next:
 		bgmac_dma_rx_setup_desc(bgmac, ring, ring->start);

 		if (++ring->start >= BGMAC_RX_RING_SLOTS)
@@ -735,6 +768,7 @@ static int bgmac_dma_init(struct bgmac *bgmac)

 		ring->start = 0;
 		ring->end = 0;
+		ring->rx_skip = 0;
 		for (j = 0; j < BGMAC_RX_RING_SLOTS; j++) {
 			err = bgmac_dma_rx_skb_for_slot(bgmac, &ring->slots[j]);
 			if (err)
@@ -1110,6 +1144,13 @@ static void bgmac_enable(struct bgmac *bgmac)
 	}
 }

+/* The MAC counts the FCS in the maximum frame length. */
+static void bgmac_set_max_frame_len(struct bgmac *bgmac, int mtu)
+{
+	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN,
+			 mtu + VLAN_ETH_HLEN + ETH_FCS_LEN);
+}
+
 /* http://bcm-v4.sipsolutions.net/mac-gbit/gmac/chipinit */
 static void bgmac_chip_init(struct bgmac *bgmac)
 {
@@ -1131,7 +1172,7 @@ static void bgmac_chip_init(struct bgmac *bgmac)
 	else
 		bgmac_umac_cmd_maskset(bgmac, ~CMD_LCL_LOOP_EN, 0, false);

-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
+	bgmac_set_max_frame_len(bgmac, bgmac->net_dev->mtu);

 	bgmac_chip_intrs_on(bgmac);

@@ -1267,7 +1308,8 @@ static int bgmac_change_mtu(struct net_device *net_dev, int mtu)
 {
 	struct bgmac *bgmac = netdev_priv(net_dev);

-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + mtu);
+	bgmac_set_max_frame_len(bgmac, mtu);
+	WRITE_ONCE(net_dev->mtu, mtu);
 	return 0;
 }

@@ -1559,8 +1601,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 	net_dev->hw_features = net_dev->features;
 	net_dev->vlan_features = net_dev->features;

-	/* Omit FCS from max MTU size */
-	net_dev->max_mtu = BGMAC_RX_MAX_FRAME_SIZE - ETH_FCS_LEN;
+	net_dev->max_mtu = BGMAC_RX_MAX_MTU;

 	bgmac->in_init = false;

diff --git a/drivers/net/ethernet/broadcom/bgmac.h b/drivers/net/ethernet/broadcom/bgmac.h
index 6fee9a41839c..7697c673c4d2 100644
--- a/drivers/net/ethernet/broadcom/bgmac.h
+++ b/drivers/net/ethernet/broadcom/bgmac.h
@@ -2,6 +2,7 @@
 #ifndef _BGMAC_H
 #define _BGMAC_H

+#include <linux/if_vlan.h>
 #include <linux/netdevice.h>

 #include "unimac.h"
@@ -330,6 +331,9 @@
 						 BGMAC_RX_FRAME_OFFSET)
 #define BGMAC_RX_MAX_FRAME_SIZE			1536
 #define BGMAC_RX_BUF_SIZE			(BGMAC_RX_FRAME_OFFSET + BGMAC_RX_MAX_FRAME_SIZE)
+/* Largest MTU whose VLAN tagged frames, FCS included, fit in one RX buffer */
+#define BGMAC_RX_MAX_MTU			(BGMAC_RX_MAX_FRAME_SIZE - VLAN_ETH_HLEN - \
+						 ETH_FCS_LEN)
 #define BGMAC_RX_ALLOC_SIZE			(SKB_DATA_ALIGN(BGMAC_RX_BUF_SIZE + BGMAC_RX_BUF_OFFSET) + \
 						 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))

@@ -363,8 +367,6 @@
 #define BGMAC_CHIPCTL_7_IF_TYPE_MII		0x00000040
 #define BGMAC_CHIPCTL_7_IF_TYPE_RGMII		0x00000080

-#define ETHER_MAX_LEN	(ETH_FRAME_LEN + ETH_FCS_LEN)
-
 /* Feature Flags */
 #define BGMAC_FEAT_TX_MASK_SETUP	BIT(0)
 #define BGMAC_FEAT_RX_MASK_SETUP	BIT(1)
@@ -426,6 +428,7 @@ struct bgmac_dma_ring {
 	u32 index_base; /* Used for unaligned rings only, otherwise 0 */
 	u16 mmio_base;
 	bool unaligned;
+	u8 rx_skip; /* Continuation slots of a dropped RX frame */

 	struct bgmac_slot_info slots[BGMAC_RX_RING_SLOTS];
 };
@@ -436,6 +439,14 @@ struct bgmac_rx_header {
 	__le16 pad[12];
 };

+/* bgmac_rx_header::flags */
+#define BGMAC_RXF_DC_MASK			0x0f00	/* Descriptors used - 1 */
+#define BGMAC_RXF_OVF				0x0080	/* RX FIFO overflow */
+#define BGMAC_RXF_OVERSIZE			0x0010	/* Frame > max frame length */
+#define BGMAC_RXF_CRC				0x0008	/* CRC error */
+#define BGMAC_RXF_ERR				(BGMAC_RXF_OVF | BGMAC_RXF_OVERSIZE | \
+						 BGMAC_RXF_CRC)
+
 struct bgmac {
 	union {
 		struct {

base-commit: fdb6fcabdbb8247f1647d54fb1b9dc3575d7fcc8
--
2.56.1

