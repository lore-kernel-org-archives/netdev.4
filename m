Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334626;
	b=Pn0aFGOZnuAWzVI/d57x4kb51Q7ErxWyjMiVctVbDyY8Oxp41DnCYOyhLM6UFUlcQevq
	 8oJ8xnT7ulKWw6VXp7D+ZG1/f0Safww7HBSdn24ALtz6lDcDXkpld9ULSnuCP4dU7FWmx
	 1Ov2unujp4Rhj8p+xsW3G8CsEhaC7xCi6lAX+O5b3RiGzdG7x/MaLkC3EKGkVAys+gaX1
	 +Xw7G39PpEZicaxBvHaejLq8ZL32YoI+Ew4+UwXWfGf7JFXfDbmvs+23JHWHqGB+nE94i
	 vVhK3uA8x2yQArk6bTmvK+k5lLxR0BfijK8zj4JI8CTfiQTxP140t1CJRySzfSuueBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zuUgxBGZZmRv+M7/oVLa7yPYJDQhmWxJoHheW9RcUj8=;
	b=K6HDrwdbRKhFvHf+OXgLY1Zzg27Z4hXbnVVXPtOA3nkfQIQAR+25bi+rdt90JbgMIGFN
	 dUmZ6slVumWGzf8pGIjhLS6VpSW/9I42WGTOQz/EGbISOGPCucFSjoVWdNbLwRvKzjYer
	 RUl3vN8YvnyMFyUqdr2ql7WU8yjFwEYbxca70yqWL42NqeE44HeIda/pfrcbf09UleBwe
	 veEbwrJbGSqimUMUNOYjIuHThisV1i9YEH46M0GSZjP51CeJ6yBJ11GZUBxw53+uAds1R
	 A00KqbqHTIPsTl0sxAY9yFiCIzwSBPvpnoAamRsymFIHlCethWjBT05K5A1AsXb4+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktRokWjz;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4D606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 08:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C4D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktRokWjz
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso946713b3a.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 00:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795334625; x=1795939425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zuUgxBGZZmRv+M7/oVLa7yPYJDQhmWxJoHheW9RcUj8=;
        b=ktRokWjz6tntnt0LdBT0BfxfPuMUcAh/qHB605QWj1/DAfPnntzf2XGzVKQ254uGWp
         xCZDBmLwIoN2h3Gzsy8ZuSUChoMR1snJENQfwiZIR+sE6yygvUpgx7CH1Bh1fOww1xmi
         S2kDF7FwgCIFsPez7kOJfk1Xlk5eBh6jF1sXYQPaaVUeSA/s40WscBfQwmeM2Nf8LENw
         1o2EFgbtKWGuK1+33+QRoMhhgFrJaqxU1VYlLix2GrVwDwtgRV7Y4xJRhmokJrlX3lP1
         zGV7iPUaMI8mSb6nmsiiS3kSoga/LxAO9bgQ64RrBDGLE9J6W5+vIAOBq6JyHx6XnhhN
         YAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795334625; x=1795939425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuUgxBGZZmRv+M7/oVLa7yPYJDQhmWxJoHheW9RcUj8=;
        b=2xlFamBRwMj+npQH0rFdXTHST4vjDsqCVI083xU5h3+/0eGUUmB1TTFbI9kewybUqf
         hNllQW65DSNgClhnR7C2l/rai3BTsuG3tHKZ7fGcunhFZqX5in9yQw6xmso+nw/5Wkmh
         /5spjQoHjwewBg87zegdrgqKNSwywmA09HtCl8JS8XI3aRbg87FwlOMcqYLLY2O5+ePB
         sl5Oa31oHl8E1qRm1WIAxIHzcq+8T8bUJzbjT1vcqe9hq9hmxLc+zhYKHoSpX+ylL8OO
         1wata2eBrhf/aNPrEbAX4kuh7wer1ImNFTAj6+RW6AthbQPpocC5ssgAcV0C99pn87JZ
         GYDw==
X-Forwarded-Encrypted: i=1; AL+hErH3NmpV0QDD5lNyhFj9Qnw/WhBbFNbOQAEhCy93s5Ye1eNLW1DOFA8ArbX1ygc7wKXacCYfJv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/68HyZaPKKOrio/VXc5qOy0e949Ub/wsSBu7qEcFHG2pWfitId
	8nXdoMw1MJOIvhvuj4O373dADBd6BiuzTz55WzMj51LtHc8xb+fjnkQ4
X-Gm-Gg: AZFdTZffxeg//v+PBnd9nzxDVmFyJJgNKwYL0Tsr8eNX3bLY+Dv21x/XoyDvJQ4z0j2
	ViIuYN3JqLoEA3jBBIfH8oQ9H4QeYRb9jgl1O/wsMh344x/Xbl7GcezQxERsw8TjUzwijPjvtBs
	nR4Kay3GnBkFq6tS57f0ybrI+wjwWV6W0A5/GRo0v5TMY4GMcvz3cX9SYXbffSNRdE89zQW/kg8
	NN5+2QfTJsmPBh4CAekeSbpO4F0Q93dNJBCGkEn5ZyO7wQer8qHmQCCdTQdcHaUw+iY8zqZ/mWE
	yisZTt6tzfQZYYudxjLwIINjcV4O6NEO3tIM4lnGSIVXpd+axwrZp2qn2DHWu4SeUMoITe9D60b
	L+wcivN/l5UceruPc8ATyjSnSlyn38+wNw5cZqo7dCJnRlA6+iHUbP8234OKgxz6/0WBVbn1z2D
	fEm96mJ7D0MIxzfv8x0549ejoEk+Ljh9ID+PhoTr2Uad29v8n1HDVnGCQRubNZ8ItMFneVbQ/d3
	ivMkAFlJEj0Rjpf5djYTHPplrIpxshENeYAHL/ycbOYockUeZs1x/XhukfUASSk4+1JI+R5otXH
	j7W/CYMBlpqz0M4McMk5iP1tkMYSN27OSOwdNLPQVu1kzG6w+hpBnkzY1OVpL+E+pg9jaw5YCL2
	kDDYZuhGhF1xOVrhG3NGKUdgn7rJQZ4rMn1k/0kksh/0bF83uaa7H85H1/tJBQafVtjK++OFFtt
	toNr5/JPn3a/Q6VTlVhomJeY4=
X-Received: by 2002:a05:6a00:2d0b:b0:8b6:59a:2aa with SMTP id d2e1a72fcca58-8c87d70aeaamr7379511b3a.54.1795334624535;
        Sun, 22 Nov 2026 00:03:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm3727457b3a.7.2026.11.22.00.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:03:42 -0800 (PST)
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
Subject: [PATCH net v5] net: bgmac: fix RX frame length check
Date: Sun, 22 Nov 2026 00:02:57 -0800
Message-ID: <20261122080257.119640-1-rosenp@gmail.com>
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
  The skip count is also read when no replacement buffer can be
  allocated, since that path drops the frame without parsing its header.

- Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
  BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.

Only compile tested. Not tested on hardware.

Fixes: dd4544f05469 ("bgmac: driver for GBit MAC core on BCMA bus")
Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Fixes: 752e5fcc2e77 ("bgmac: reduce max frame size to support just MTU 1500")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v5:
- read the descriptor count from the RX header before poisoning it when
  no replacement buffer can be allocated, so the continuation buffers of
  that frame are not parsed as frames either
- v4: https://lore.kernel.org/netdev/20261121005009.59491-1-rosenp@gmail.com/
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

 drivers/net/ethernet/broadcom/bgmac.c | 72 +++++++++++++++++++++++----
 drivers/net/ethernet/broadcom/bgmac.h | 15 +++++-
 2 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef7307edd41..5264c778e0f5 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt

 #include <linux/bcma/bcma.h>
+#include <linux/bitfield.h>
 #include <linux/etherdevice.h>
 #include <linux/interrupt.h>
 #include <linux/bcm47xx_nvram.h>
@@ -401,13 +402,25 @@ static void bgmac_dma_rx_setup_desc(struct bgmac *bgmac,
 	ring->end = desc_idx;
 }

+/* If rx_skip is given, the buffer holds the start of a frame. Store the
+ * number of continuation descriptors of that frame, so that they are not
+ * parsed as frames.
+ */
 static void bgmac_dma_rx_poison_buf(struct device *dma_dev,
-				    struct bgmac_slot_info *slot)
+				    struct bgmac_slot_info *slot,
+				    u8 *rx_skip)
 {
 	struct bgmac_rx_header *rx = slot->buf + BGMAC_RX_BUF_OFFSET;
+	u16 len, flags;

 	dma_sync_single_for_cpu(dma_dev, slot->dma_addr, BGMAC_RX_BUF_SIZE,
 				DMA_FROM_DEVICE);
+	if (rx_skip) {
+		len = le16_to_cpu(rx->len);
+		flags = le16_to_cpu(rx->flags);
+		if (len != 0xdead || flags != 0xbeef)
+			*rx_skip = FIELD_GET(BGMAC_RXF_DC_MASK, flags);
+	}
 	rx->len = cpu_to_le16(0xdead);
 	rx->flags = cpu_to_le16(0xbeef);
 	dma_sync_single_for_device(dma_dev, slot->dma_addr, BGMAC_RX_BUF_SIZE,
@@ -435,10 +448,18 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 		dma_addr_t dma_addr = slot->dma_addr;
 		u16 len, flags;

+		/* The rest of a multi descriptor frame that was dropped */
+		if (ring->rx_skip) {
+			ring->rx_skip--;
+			bgmac_dma_rx_poison_buf(dma_dev, slot, NULL);
+			goto next;
+		}
+
 		do {
 			/* Prepare new skb as replacement */
 			if (bgmac_dma_rx_skb_for_slot(bgmac, slot)) {
-				bgmac_dma_rx_poison_buf(dma_dev, slot);
+				bgmac_dma_rx_poison_buf(dma_dev, slot,
+							&ring->rx_skip);
 				break;
 			}

@@ -460,10 +481,34 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
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
@@ -493,6 +538,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 			handled++;
 		} while (0);

+next:
 		bgmac_dma_rx_setup_desc(bgmac, ring, ring->start);

 		if (++ring->start >= BGMAC_RX_RING_SLOTS)
@@ -735,6 +781,7 @@ static int bgmac_dma_init(struct bgmac *bgmac)

 		ring->start = 0;
 		ring->end = 0;
+		ring->rx_skip = 0;
 		for (j = 0; j < BGMAC_RX_RING_SLOTS; j++) {
 			err = bgmac_dma_rx_skb_for_slot(bgmac, &ring->slots[j]);
 			if (err)
@@ -1110,6 +1157,13 @@ static void bgmac_enable(struct bgmac *bgmac)
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
@@ -1131,7 +1185,7 @@ static void bgmac_chip_init(struct bgmac *bgmac)
 	else
 		bgmac_umac_cmd_maskset(bgmac, ~CMD_LCL_LOOP_EN, 0, false);

-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
+	bgmac_set_max_frame_len(bgmac, bgmac->net_dev->mtu);

 	bgmac_chip_intrs_on(bgmac);

@@ -1267,7 +1321,8 @@ static int bgmac_change_mtu(struct net_device *net_dev, int mtu)
 {
 	struct bgmac *bgmac = netdev_priv(net_dev);

-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + mtu);
+	bgmac_set_max_frame_len(bgmac, mtu);
+	WRITE_ONCE(net_dev->mtu, mtu);
 	return 0;
 }

@@ -1559,8 +1614,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
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

