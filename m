Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815911;
	b=iyrKI/M+7doyu4S1DRpOjovjeG1M8qN7dE0ZpUUxo44A+pToArU3KGIENPnSaOVF939r
	 +6FdTVK7aLz5LYeEW133Bx0TXUQMF9q87Aa11Yah5u0IbngGLJ4cju50qXE7gyDzWDmch
	 0fMYnyDVom2P0Mo9zWSaNp3tIAmabrEUiRppArohUamsVJ8Q7pVg8HOif+aOzNHmmsnX+
	 VclD0Np9aAXoN6Ak+LNJ3ttsFLn8tUyaqB7KxBVLldr5liQWd7p4OBRIjA11/S5depJsq
	 DI4oX/jxSWpzw7FrQar+IS8h+5+pJejTNUvtL71S2yzWYaapEDTch/XKR3+CDg9ah2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815911;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=MaAX0lvuh7Jgtl6dDYBpVHV2MJSuoWS/YusvzoytD/k=;
	b=vAQ7GSsyiNICJk3kmXOknpY4fjmNAhM3ixJpQsnSwElmp9QVx/fZSqr98v1aG6CfiDJJ
	 GeYuIxBiXeVXFmvj3NCBNdq6jPglaIzQqVkM4UOxXTNXFpTUHS6tZR8L2RxD1d65xs0Dz
	 wKs53sH2o0rxGxboAKrBeRSiCz5w2gnFj4WULcm520zVomGq2qfKNI70IGFRaocC/62CO
	 qSDIyiX+h+IVanOiZjyz47xV0rWBXVAYKKv70h9hbyYrXl+8X5jmivUHkNRA4UM99QUGR
	 rQAzPJJf7JoeVZoYlA0odxPCnW6CMUFwzzAGEakAQl3EY1MqkJQ55h4DmJ0t4GklxiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aPKKLuy4;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D1606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 21:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343D1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aPKKLuy4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 718431A1843;
	Fri, 27 Nov 2026 21:45:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D5A06049C;
	Fri, 27 Nov 2026 21:45:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 702B411E90F5A;
	Fri, 27 Nov 2026 22:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795815902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=MaAX0lvuh7Jgtl6dDYBpVHV2MJSuoWS/YusvzoytD/k=;
	b=aPKKLuy4SWSQ/h+17NgwAi5mRe2DUpi4f/G+XxR0FSgj3OtxEQ/zMm7ygdxaooPL4bgrTX
	b58MZb7EQ8w/b/yswO1Z8wYn0QCo2nejCXE9dKSEpb3zjMjZlSa7uIiMk0KjUykUvlcwoR
	bqSUR1QNB/1Zsa9lCuFKMd2IaLIsC543me5h+KXLEqG5OqsgmL+ccP0Cb0nnJi6U6/CN5T
	chm4ieqHXBJoJFEM43hc9XmQ0TgUgDMo9EcvqkyX1/p2AJ6L3I4Z9mQHEKsOb6pC1s//uS
	vVssso3g8rehBk9+NSezs9u4ke3za9l0rTu6BrGP3x71JKiHjRWjPyxzjjvJRQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v9 0/3] net: macb: implement ethtool set channels
 count operation
Date: Fri, 27 Nov 2026 22:44:40 +0100
Message-Id: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAMj5CWsC/33RS2rEMAwG4KsMXtdFtuNHuuo9Shd+SB3DTFLiE
 KYMuXs9WbQpMV2KX/qE0J0VnDIW9nK6swmXXPI41KJ/OrF49sMH8pxqzSRIAwo0v/oYeMGZP+I
 BL4XrQAbBkpIWWJ37nJDybTPf2FA7B7zN7L0m51zmcfrali1iy/9xF8GBS4fK98arFNVrGMf5k
 ofnOF43b5E7Q4iWIavRO2l65QVpikdD7Q3VMlQ1ojHBWidSCu5odHvDtoyuGiKkjjqiSNEfDf1
 jCBCmZejHLRARIgSHVh8N82uI9i2mGjqh7lOPlkAeDbs3XMuwj7+kEAHIOOPpaLidIbuW4aphL
 URyqAFN+mus6/oNV9mljJoCAAA=
X-Change-ID: 20260305-macb-set-channels-5bf6e07f3270
To: Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add support for changing the active number of queues.
Tested on Mobileye EyeQ5.

If the interface is running, use context swapping to realloc rings on
the fly. To avoid introducing bugs with stale ENST config, we start by
fixing how ENST config gets applied in the first patch.

One pretty significant change to our context swapping implementation:
the set_channels callback needs to be able to fail in the context
swapping window. If it failed, then we keep using the old context and
don't reconfigure HW. From its standpoint, it got disabled then
re-enabled with no change to its rings.

I tried *not fixing* TAPRIO/ENST but that was hard, so instead I preface
this series with a commit reworking how ENST works. We now handle
close/open and refuse set_channels if a queue-to-be-disabled had an
ENST schedule attached.

Have a nice day,
Thanks,
Théo

---
Changes in v9:
- Patch 1 (cached ENST config):
  - Instead of dropping the cached ENST config on link-up with a
    different speed, we instead ignore it. Hopefully we'll restore our
    previous speed and be able to respect our qdisc again. This means
    bp->enst is now only modified by TC_SETUP_QDISC_TAPRIO operations.
  - I did *not* take Reviewed-by: Nicolai from v7 (which I had forgotten
    on v8) because the patch changed substantially.
- Patch 2 (set_channels implementation):
  - Improve the [PATCH 2/3] commit message to explain the changes made to
    the context swap implementation.
  - Read bp->enst under bp->mac_cfg_lock mutex. This requires moving the
    mutex responsibility from the swap helper functions to the caller
    because in set_channels, the lock section is longer than the swap.
- Patch 3 (SRAM segments distribution):
  - Prompt Sashiko, below the commit fold line, to avoid the same false
    positive report again.
  - Take Reviewed-by: Nicolai from v7 which I had forgotten.
- Link to v8: https://patch.msgid.link/20261124-macb-set-channels-v8-0-770cf8e50e6d@bootlin.com

Changes in v8:
- Reset BQL for all queues at swap end and at close. The minimal amount
  of work would be to reset only the active queues, but let's be safe
  about it. A bug here is a forever stale that will never resolve, not
  even on close+open.
- Shuffle the TX ring on swap failure. The HW resets its cursors
  automatically, so we must bring TX SKBs to the start of the ring
  before restarting the TX engine.
- Fix a stale comment in gem_sram_distribute_segments().
- Rebased onto latest net-next/main (c2621b518b38); nothing to report.
- Link to v7: https://patch.msgid.link/20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com

Changes in v7:
- Patch 1 (new ENST patch):
   - Preface the series by a patch fixing TAPRIO ENST config across
     interface flap and context swap operations.
   - It does so by storing a cached ENST config in bp and restoring it
     on context swap and link-up. Previously we could only write the
     ENST registers on TAPRIO callbacks.
- Patch 2 (ethtool set_channels implementation):
   - Fix context swap rollback: if the window failed (set_channels is the
     first context swap that can fail), then we need to *not* write HW
     ring cursors and *not* reset DQL.
   - macb_interrupt(): avoid NULL ptr deref when reading bp->ctx fields.
   - macb_poll_controller(): avoid bp->ctx NULL ptr deref by using
     bp->configured_num_queues rather than bp->ctx->num_queues.
   - gem_get_rx_ring_count(): use bp->configured_num_queues rather than
     bp->max_num_queues.
   - at91ether_open(): assign `bp->ctx->num_queues = 1` to avoid breaking
     shared code that iterates on queues (suspend PM ops mostly).
- Patch 3 (Tx SRAM segment distribution):
   - DCFG6 register has 4 bits to tell us the # of segments, not 3.
   - The config of the # of segments per queue is 3 bits (not 2): fix
     distribution algorithm to allow going up to the limit. I don't
     know of any hardware on which this could have an incidence.
   - SRAM segment distribution is also done at context swap end, for
     this new set_channels callback.
- Rebase onto latest net-next/main (d6816d9a93b6); tiny conflict inside
  macb_config caps.
- Link to v6: https://patch.msgid.link/20261113-macb-set-channels-v6-0-5de59d9e7f02@bootlin.com

Changes in v6:
- Rebase onto latest net-next/main (573af8015529). This means rebasing
  onto context swapping, which is now used on set_channels requests.
- Move the QUEUE_DISABLE caps patch out into a separate series.
  https://lore.kernel.org/netdev/20261113-macb-caps-v1-0-42e0984b2f09@bootlin.com/
- Drop kunit tests. Thanks Jakub.
- Fix the TAPRIO gate test if qdisc is destroyed while the interface is
  down (because bp->taprio_gated_queues was stall in that case).
  Thanks Nicolai.
- Link to v5: https://patch.msgid.link/20261016-macb-set-channels-v5-0-90ce0c0b8e75@bootlin.com

Changes in v5:
- New patch: add missing MACB_CAPS_QUEUE_DISABLE to 3 compatibles based
  on publicly available datasheets. That means they can benefit from
  the set_channels implementation.
- set_channels patch:
  - Refuse set_channels if it disables a queue with active TAPRIO.
  - Use TBQP.QUEUE_DISABLE bit to also disable transmit; previously we
    only disabled the receive engine.
  - Migrate code to newly introduced macb_queue_isr_clear() helper.
  - Adapt to newly introduced macb_quiesce_start(), where we want to
    synchronize_irq() on all queues, even the disabled ones.
  - IRQ handler now self-disarms on disabled queues.
  - Drop `old_count` unused stack variable.
  - Only allow TAPRIO rules on active queues.
  - Fix comments style and text in macb_set_channels(); in particular
    mention we'll use context-swapping once it is available.
- Distribute SRAM segments patch:
  - Introduce GEM_TXQSEGALLOC_MASK(q) and use field_prep|get() macros.
  - Introduce capability for this feature, as many publicly available
    GEM datasheets don't document the registers.
  - Remove upper register support. Lower register is enough to handle 8
    queues, which is the max we support.
  - Add edge case kunit for num_segments=128.
  - Introduce static_assert(MACB_MAX_QUEUES == 8) in
    gem_sram_distribute_segments() to signal that code will need
    updating if/when the constant changes.
- Update To/Cc list: drop Nicolas and Claudiu, add Conor and Nicolai.
- Rebase onto latest net-next/main (6b3e73774815).
- Link to v4: https://patch.msgid.link/20260317-macb-set-channels-v4-0-1bd4f4ffcfca@bootlin.com

Changes in v4:
- macb_set_channels(): drop `count == old_count` check, it is redundant
  with both netlink and ioctl codepaths. See early returns in
  ethnl_set_channels() and ethtool_set_channels(). Discussion @ V2.
- Rebase to latest net-next (8737d7194d6d); nothing to report.
- Link to v3: https://patch.msgid.link/20260313-macb-set-channels-v3-0-c66b7781ddb8@bootlin.com

Changes in v3:
- Makefile: fix compilation of kunit tests. This bug was hidden before
  because everything was builtin so it ended up linked together anyway.
  Now macb.o is the amalgation of macb_{main,ptp,utils}.o and
  macb_test.o is the amalgation of macb_{kunit,utils}.o.
- Kconfig CONFIG_MACB_KUNIT_TEST entry:
  - Turn into tristate; no good reason to restrict to bool.
  - Drop "depends on MACB". We do not need to compile the full MACB
    driver to test gem_sram_distribute_segments().
- Add usual MODULE_*() macros to macb_kunit.c.
- Drop unused init value of `ret` in macb_set_channels().
- Rebase to latest net-next; nothing to report.
- Link to v2: https://patch.msgid.link/20260311-macb-set-channels-v2-0-982693a1f5fc@bootlin.com

Changes in v2:
- Move gem_sram_distribute_segments() from macb_main.c to macb_utils.c
  and kunit tests from macb_main.c to macb_kunit.c.
- macb_set_channels():
  - Add comment about MACB_CAPS_QUEUE_DISABLE.
  - Refuse operation if netif_running(), with code comment.
  - Drop useless sanity checks on ch->{combined,rx,tx}_count.
- Add help text to CONFIG_MACB_KUNIT_TEST.
- Fix `checkpatch --max-line-length=80` warnings.
- Rebase onto latest net-next; nothing to report.
- Link to v1: https://lore.kernel.org/r/20260305-macb-set-channels-v1-0-28e3a96a3dc3@bootlin.com

To: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Paolo Valerio <pvalerio@redhat.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Benoît Monin <benoit.monin@bootlin.com>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

---
Théo Lebrun (3):
      net: macb: cache ENST config across link down/up
      net: macb: implement ethtool_ops.get|set_channels()
      net: macb: distribute evenly Tx SRAM segments

 drivers/net/ethernet/cadence/macb.h      |  66 +++-
 drivers/net/ethernet/cadence/macb_main.c | 537 +++++++++++++++++++++----------
 2 files changed, 417 insertions(+), 186 deletions(-)
---
base-commit: f89726ffabef1b08c52e6163b7ab94b0d5f15503
change-id: 20260305-macb-set-channels-5bf6e07f3270

Best regards,
--  
Théo Lebrun <theo.lebrun@bootlin.com>

