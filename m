Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421595;
	b=PguG2gRkqOiUlytclvJwjw1GJi192/PoJru2C3Y1naUkyPm+318nY7sKpsWk6XHEYGN8
	 WT2fENd78QiqeffRMPw3Q7xWjijJbPHnWMYuml7Sgf3VRPttZWQ/JPwKgMr4qDSMkB34B
	 QtN73f4ATfoS5aw8GoKFfIDw6axh3JqloNXLAyaAYyU0lAyhFaLmKSIF8H4nHuFfsFehy
	 mSEBy8w4GDojzwq6A1Q46Fk0V3OhCA2hUbnklihK0FAXma3c5qc4jE8BZD0rkuOxa8xGA
	 21TGrMlar+wT2O1mc5SOHHXnAg5g93CmjcrWb/AG52QYrlS6moOxBkjyML12Otvq4hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KFmwdLzfnogC49xeMoaGP9Os7baWgFpsppZ8KRt3Wh4=;
	b=0rQM+p98bN0EoDZ3xkt3HGO7/DzhA4/ijNcD3wkBDK1Zq2Y5oWJdNfqqdHo2H/BWCLD0
	 F10qm3QDrTFnSJsDC8m38kjmLkzFid/62eQqKEpfwI7o2Snl07+1f2BeZ5F4hA2XhGpfW
	 D58U9yWYFndb77Q8ql7qFIXmnIbvpb0u3UdekNh4t2rx822yuul9KEQlzK/BR2PKmmMn/
	 PGTWfir72dhcvqV27LPai/E8uORnzr3zHX54bppA18zt7Ep49n+e4alJM0j7vI7p65y09
	 21cT0auAs6UEqlsypuO+6adCkEeAVZQy9B/9hZ0Y8/AlIO1+/nBTATHEp6xFphhmXyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzGfxw61;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901E606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5901E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzGfxw61
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f02ee04378so23794335ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421595; x=1796026395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFmwdLzfnogC49xeMoaGP9Os7baWgFpsppZ8KRt3Wh4=;
        b=rzGfxw612Bifc8Aa8Vv+74lBeXFif7qRBKEs7H84D4p+pP1M9o1APf5SaLrD9ROfee
         vutdyjVxEKyJ440OqKU9i40cvCQVyQEv1Gvoy3vLjee0Pi3bESWw7JU0dsTZ1QVxZmOM
         B7rsqpJu3kSHrN/FcaVuqeaFg43OPAzxjst/3ElopzjlrDtekdA4wcXWsGPox4NcQnep
         pM2QRKWXKZiJfvPdutBAFIBxWZec02VI8fb2iKxl2XjXfELhvvLQ81oSNBxRcdteAbCj
         RWYL/3wx5Z+4OlxrcvioY5GQ3cHtUKBVu3CB2jKMcDoH/Unuhxbt80DplpoGf58aBQM4
         SnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421595; x=1796026395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFmwdLzfnogC49xeMoaGP9Os7baWgFpsppZ8KRt3Wh4=;
        b=JDbGu7ud5iTdjCjOfaEJQVCz1Y2xD2DsAw0yBBDMPlgx1UAv0IwnLowpmBKygw488E
         XlNwE1eU4B+YRZdleuIGH7lyxd4iS/jxSRrA/PsRTgnXW810AeBTUT26HYpr2prcmplY
         d0E8lyJanqyM+s6j+LYILFHkkmRbxV7nNTW0wBGd5aVa1TbgK08eLaybSdUlgTAYoyDT
         WcmNFrBJ5FkYN+uYMTDYJ/6a6OMyIj845MegmQWU7+vrOADhky2QbqkzGlryI23ApsJ7
         K+e6g5S2yI13r/N89W4DyzS0SrUxvENdZ9I0PVbbdZXQQqNbNm6GSCqXlz1M7PyWOeYh
         SGgQ==
X-Gm-Message-State: APuU4Z8di2/z8fMgIQiwrHj2aFVnVA8JMOmIHg8B56ZIldTrBY1Kc7hP
	kuNDwSs5ol19BVl9xdGGRxp9gkZcdpcYSJ5QkBezyTLMmHf48ylA4R6zKorB8g==
X-Gm-Gg: AZFdTZezPmE6MEe5N9ceoE2ZURgxbIRfItLL94ApN9GTpkjQO7w+RqkqD0SCUpf9TrN
	eXkr2Qwhejd8qo51v9kEAFHT/p5frgWIwezN/5Q0O6ls+8s0FBkGOm/njulO5geEFEXDSIefRSA
	rNha/4VFZc9VwGMUQUk4k+yaz3uT8pRgx1uPj+gWqQH3rEXhGEiZaL6VD8LpWB4Rf12Lh394IWl
	awm6Y51xcY18mOK2rX2K4CwlwWsrx2a8pUZv0CJ8369L8T+Hi0I7qiEwZkTOcm8OLu9Y1fAfStu
	JWf5xO7F4l+t7iN6+lh8urs3iHIyFlxg9OesXGwtNP4ZOwcyW873Z4ZmTJCNrg0Qco+ZdskJZVz
	43Psz2yS9pyS9nDcjgY07uBRRORV5ATcLQINNIRulupOwBjvCKYtNGIpm7HBIOF1Ftjan+OUIhm
	teDsMe9c0gc7sx0zKMMMDwbbPPIlilPL9n/qCYlmJKlq90SIg6pTSYU2IWJMELwM52id7ChhPrM
	dbjZkaTEhhn2xwKBI33JBunSVvGBJJOtpXvbXgVVe5Dri+87+Kof8AixbuEqWUU4xW14UIfqSiS
	y6CkJxUIr48N8sTaCJoWR2r+HZARWgKUMM0e5MFgC7iDpQUyS3GFGbA1OhCAwN6TR+Jt/grseRZ
	dSEUygWuDo9jf9KpkQsvcs/I+feVRYY1Yy1CxUefttEpReRkxKxxvaulU2+jyzKLW6g8N2jVBra
	x+Lg==
X-Received: by 2002:a17:903:19cb:b0:2e9:3dd0:c8d with SMTP id d9443c01a7336-2f03f1cf44emr118698335ad.14.1795421594438;
        Mon, 23 Nov 2026 00:13:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84364sm49923835ad.5.2026.11.23.00.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:13:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@openwrt.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v6] net: bgmac: fix RX frame length check
Date: Mon, 23 Nov 2026 00:13:12 -0800
Message-ID: <20261123081312.39427-1-rosenp@gmail.com>
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

- Program UMAC_MAX_FRAME_LEN to BGMAC_RX_MAX_FRAME_SIZE, so every frame
  the MAC accepts by its programmed limit fits in one RX buffer, and
  limit max_mtu so that a VLAN tagged frame at that MTU fits as well.
  max_mtu drops from 1532 to 1514. The limit does not follow the MTU,
  as receiving frames up to the buffer size regardless of the MTU is
  what the driver did before. bgmac_change_mtu() only wrote the MAC
  limit and never updated net_dev->mtu, so the MTU seen by the stack
  never changed. Remove it and let the core set the MTU.

- Check the RX header flags. The MAC is not set up to discard errored
  frames (CMD_RX_ERR_DISC is cleared), so frames above the programmed
  maximum still reach the host. The layout of the flags is taken from
  bcmgmacrxh.h in the Broadcom SDK: bits 11:8 hold the descriptor count
  minus one, bit 7 flags an RX FIFO overflow, bit 4 a frame longer than
  the maximum frame length and bit 3 a CRC error. Drop frames that have
  any of the error flags set and count them in the matching statistics.

- Drop frames that span more than one descriptor and recycle their
  continuation buffers without parsing them. Like b43 and brcmsmac, also
  derive the number of continuation buffers from the length, and use
  the larger of the two, so a length above the buffer size never leads
  to its continuation being parsed. The count is taken before a
  replacement buffer is allocated, so it is also known when that
  allocation fails, and it is kept in the ring so that it carries over
  into the next poll.

- The DMA engine writes the RX header once the frame ends, so the first
  slot of a multi-descriptor frame may be completed while its header
  still holds the poison pattern. The driver dropped such a slot and
  freed its buffer, which the engine could still write the header into,
  and then parsed the continuation as a frame. Read the header before
  doing anything else with the slot. If it is poisoned, stop and wait
  for the next poll, unless more slots have been completed than one
  frame can use. In that case the slot is dropped but its buffer is
  kept mapped and handed back to the hardware.

- Reject lengths below ETH_HLEN + ETH_FCS_LEN or above
  BGMAC_RX_MAX_FRAME_SIZE, and print the bad length.

Only compile tested. Not tested on hardware.

Fixes: dd4544f05469 ("bgmac: driver for GBit MAC core on BCMA bus")
Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")
Fixes: 752e5fcc2e77 ("bgmac: reduce max frame size to support just MTU 1500")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
v6:
- program UMAC_MAX_FRAME_LEN to the RX buffer size instead of deriving it
  from the MTU, so the MTU no longer filters RX, and remove
  bgmac_change_mtu()
- also derive the number of continuation buffers from the length, and
  set it on every drop path, not only from the descriptor count field
- read the RX header before anything else; on a poisoned header wait
  for the next poll instead of dropping the slot, unless more slots have
  been completed than one frame can use, and never free a buffer the
  engine may still write the header into
- count FIFO overflows and multi-descriptor frames in rx_over_errors
- v5: https://lore.kernel.org/netdev/20261122080257.119640-1-rosenp@gmail.com/
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

 drivers/net/ethernet/broadcom/bgmac.c | 104 ++++++++++++++++++++------
 drivers/net/ethernet/broadcom/bgmac.h |  19 ++++-
 2 files changed, 98 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef7307edd41..ec5bc1be41dd 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
 
 #include <linux/bcma/bcma.h>
+#include <linux/bitfield.h>
 #include <linux/etherdevice.h>
 #include <linux/interrupt.h>
 #include <linux/bcm47xx_nvram.h>
@@ -414,6 +415,21 @@ static void bgmac_dma_rx_poison_buf(struct device *dma_dev,
 				   DMA_FROM_DEVICE);
 }
 
+/* Number of continuation descriptors of the frame that starts with this RX
+ * header. The hardware reports it in the flags, but a frame longer than one
+ * buffer has continued into the next ones whatever the flags say.
+ */
+static u8 bgmac_rx_cont_descs(u16 len, u16 flags)
+{
+	unsigned int descs = FIELD_GET(BGMAC_RXF_DC_MASK, flags);
+
+	if (len > BGMAC_RX_MAX_FRAME_SIZE)
+		descs = max_t(unsigned int, descs,
+			      DIV_ROUND_UP(len - BGMAC_RX_MAX_FRAME_SIZE,
+					   BGMAC_RX_BUF_SIZE));
+	return descs;
+}
+
 static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 			     int weight)
 {
@@ -435,6 +451,46 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 		dma_addr_t dma_addr = slot->dma_addr;
 		u16 len, flags;
 
+		/* The rest of a multi descriptor frame that was dropped */
+		if (ring->rx_skip) {
+			ring->rx_skip--;
+			bgmac_dma_rx_poison_buf(dma_dev, slot);
+			goto next;
+		}
+
+		/* Get info from the header */
+		dma_sync_single_for_cpu(dma_dev, dma_addr, BGMAC_RX_BUF_SIZE,
+					DMA_FROM_DEVICE);
+		len = le16_to_cpu(rx->len);
+		flags = le16_to_cpu(rx->flags);
+
+		if (len == 0xdead && flags == 0xbeef) {
+			u32 done = (end_slot + BGMAC_RX_RING_SLOTS - ring->start) %
+				   BGMAC_RX_RING_SLOTS;
+
+			dma_sync_single_for_device(dma_dev, dma_addr,
+						   BGMAC_RX_BUF_SIZE,
+						   DMA_FROM_DEVICE);
+
+			/* The header is written when the frame ends, after
+			 * the slot of a frame spanning several descriptors is
+			 * completed. Wait for it, unless more slots have been
+			 * completed than one frame can use. Keep the buffer
+			 * mapped either way, the header may still be written.
+			 */
+			if (done <= BGMAC_RX_MAX_DESCS)
+				break;
+
+			if (net_ratelimit())
+				netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
+					   ring->start);
+			bgmac->net_dev->stats.rx_errors++;
+			goto next;
+		}
+
+		/* Do not parse the rest of the frame as frames */
+		ring->rx_skip = bgmac_rx_cont_descs(len, flags);
+
 		do {
 			/* Prepare new skb as replacement */
 			if (bgmac_dma_rx_skb_for_slot(bgmac, slot)) {
@@ -446,24 +502,31 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 			dma_unmap_single(dma_dev, dma_addr,
 					 BGMAC_RX_BUF_SIZE, DMA_FROM_DEVICE);
 
-			/* Get info from the header */
-			len = le16_to_cpu(rx->len);
-			flags = le16_to_cpu(rx->flags);
+			/* The frame did not fit in one buffer */
+			if (ring->rx_skip) {
+				put_page(virt_to_head_page(buf));
+				bgmac->net_dev->stats.rx_over_errors++;
+				bgmac->net_dev->stats.rx_errors++;
+				break;
+			}
 
-			/* Check for poison and drop or pass the packet */
-			if (len == 0xdead && flags == 0xbeef) {
-				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
-						   ring->start);
+			if (flags & BGMAC_RXF_ERR) {
 				put_page(virt_to_head_page(buf));
+				if (flags & BGMAC_RXF_OVF)
+					bgmac->net_dev->stats.rx_over_errors++;
+				if (flags & BGMAC_RXF_OVERSIZE)
+					bgmac->net_dev->stats.rx_length_errors++;
+				if (flags & BGMAC_RXF_CRC)
+					bgmac->net_dev->stats.rx_crc_errors++;
 				bgmac->net_dev->stats.rx_errors++;
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
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
@@ -493,6 +556,7 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 			handled++;
 		} while (0);
 
+next:
 		bgmac_dma_rx_setup_desc(bgmac, ring, ring->start);
 
 		if (++ring->start >= BGMAC_RX_RING_SLOTS)
@@ -735,6 +799,7 @@ static int bgmac_dma_init(struct bgmac *bgmac)
 
 		ring->start = 0;
 		ring->end = 0;
+		ring->rx_skip = 0;
 		for (j = 0; j < BGMAC_RX_RING_SLOTS; j++) {
 			err = bgmac_dma_rx_skb_for_slot(bgmac, &ring->slots[j]);
 			if (err)
@@ -1131,7 +1196,10 @@ static void bgmac_chip_init(struct bgmac *bgmac)
 	else
 		bgmac_umac_cmd_maskset(bgmac, ~CMD_LCL_LOOP_EN, 0, false);
 
-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
+	/* Every frame the MAC accepts fits in one RX buffer. The limit
+	 * includes the FCS.
+	 */
+	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, BGMAC_RX_MAX_FRAME_SIZE);
 
 	bgmac_chip_intrs_on(bgmac);
 
@@ -1263,14 +1331,6 @@ static int bgmac_set_mac_address(struct net_device *net_dev, void *addr)
 	return 0;
 }
 
-static int bgmac_change_mtu(struct net_device *net_dev, int mtu)
-{
-	struct bgmac *bgmac = netdev_priv(net_dev);
-
-	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + mtu);
-	return 0;
-}
-
 static const struct net_device_ops bgmac_netdev_ops = {
 	.ndo_open		= bgmac_open,
 	.ndo_stop		= bgmac_stop,
@@ -1279,7 +1339,6 @@ static const struct net_device_ops bgmac_netdev_ops = {
 	.ndo_set_mac_address	= bgmac_set_mac_address,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_eth_ioctl           = phy_do_ioctl_running,
-	.ndo_change_mtu		= bgmac_change_mtu,
 };
 
 /**************************************************
@@ -1559,8 +1618,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
 	net_dev->hw_features = net_dev->features;
 	net_dev->vlan_features = net_dev->features;
 
-	/* Omit FCS from max MTU size */
-	net_dev->max_mtu = BGMAC_RX_MAX_FRAME_SIZE - ETH_FCS_LEN;
+	net_dev->max_mtu = BGMAC_RX_MAX_MTU;
 
 	bgmac->in_init = false;
 
diff --git a/drivers/net/ethernet/broadcom/bgmac.h b/drivers/net/ethernet/broadcom/bgmac.h
index 6fee9a41839c..89702fcaa9df 100644
--- a/drivers/net/ethernet/broadcom/bgmac.h
+++ b/drivers/net/ethernet/broadcom/bgmac.h
@@ -2,6 +2,7 @@
 #ifndef _BGMAC_H
 #define _BGMAC_H
 
+#include <linux/if_vlan.h>
 #include <linux/netdevice.h>
 
 #include "unimac.h"
@@ -330,6 +331,13 @@
 						 BGMAC_RX_FRAME_OFFSET)
 #define BGMAC_RX_MAX_FRAME_SIZE			1536
 #define BGMAC_RX_BUF_SIZE			(BGMAC_RX_FRAME_OFFSET + BGMAC_RX_MAX_FRAME_SIZE)
+/* Largest MTU whose VLAN tagged frames, FCS included, fit in one RX buffer */
+#define BGMAC_RX_MAX_MTU			(BGMAC_RX_MAX_FRAME_SIZE - VLAN_ETH_HLEN - \
+						 ETH_FCS_LEN)
+/* Most descriptors one frame can use, with a 16 bit length */
+#define BGMAC_RX_MAX_DESCS			(1 + DIV_ROUND_UP(U16_MAX - \
+								  BGMAC_RX_MAX_FRAME_SIZE, \
+								  BGMAC_RX_BUF_SIZE))
 #define BGMAC_RX_ALLOC_SIZE			(SKB_DATA_ALIGN(BGMAC_RX_BUF_SIZE + BGMAC_RX_BUF_OFFSET) + \
 						 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
 
@@ -363,8 +371,6 @@
 #define BGMAC_CHIPCTL_7_IF_TYPE_MII		0x00000040
 #define BGMAC_CHIPCTL_7_IF_TYPE_RGMII		0x00000080
 
-#define ETHER_MAX_LEN	(ETH_FRAME_LEN + ETH_FCS_LEN)
-
 /* Feature Flags */
 #define BGMAC_FEAT_TX_MASK_SETUP	BIT(0)
 #define BGMAC_FEAT_RX_MASK_SETUP	BIT(1)
@@ -426,6 +432,7 @@ struct bgmac_dma_ring {
 	u32 index_base; /* Used for unaligned rings only, otherwise 0 */
 	u16 mmio_base;
 	bool unaligned;
+	u8 rx_skip; /* Continuation slots of a dropped RX frame */
 
 	struct bgmac_slot_info slots[BGMAC_RX_RING_SLOTS];
 };
@@ -436,6 +443,14 @@ struct bgmac_rx_header {
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

