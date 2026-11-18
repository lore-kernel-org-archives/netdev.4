Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035211;
	b=1NUXqRIvGEFy4Odenqc41GKtG8C39pNLzA7FAHpCnAVCuvQOFAG0h3whB6QFLOCYFLR8
	 JAiXgkeapm5mvV/wQ+w7elA1rstBc8WyAmLC08KB5gQCPcEj+ZlstOOfGy4Zn8b0h/Y6L
	 y2lSLu3fRr46oB36csEH0G1CSEaop5Z8hvdjoKp6qOuaaqKWd7ComU8Cw1ZnyUbtGrmrh
	 lYjf/congwdD6yG2YMJaxm1a1jjhS+Q3r/pKcnbvFQIMaUtAKG0/eLJA0bezQcAswEUfA
	 QhdrWUcaYGLe/2+OuFTAC0kJnCGhZlndoPfQ/03rXoRRUrlSyktEyKtAzlwG1+tLS8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035211;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=BUa2xGmozg4c12vLWCRNsA8GK6QkWn4SmUNIxnLaH5A=;
	b=hTyrYXmn5wHbCu+lLvf6VIMrzUHQ5BV/8TEd3d2IGrchFUVoNR8UGv/3AYkDXfsGRwjD
	 ZDHdkegPDJq/eE1TenbJcvNuA3RHqWkfxVK6qbT6nOE+9TD/AFzvlpgfyNAiy1TfeRdhE
	 ZNguRkZpaAEurGXiGMUGA0Tg2JZfH4wc5ofP18B0OfoMG5pOjZ3ys5t6w0v4g02bflTAI
	 QVZpByPfeQn4lSPQkm9KpiXGWlStWsIdgWtCMhXOFCUs1lvHQnVEpPOc4BZH3DJ0HvkeO
	 z6wUisABTUMEZob2ZMWQoBdf9S/NmfW56aIm+kYWBw/H6y7PZE2BMWpFTHWp+USyuEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XTog0jrY;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A3606A333;
	Wed, 18 Nov 2026 20:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8A3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XTog0jrY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5D5CC4F76D;
	Wed, 18 Nov 2026 20:53:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B84C65FE9B;
	Wed, 18 Nov 2026 20:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C3C611BC3098;
	Wed, 18 Nov 2026 21:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795035208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BUa2xGmozg4c12vLWCRNsA8GK6QkWn4SmUNIxnLaH5A=;
	b=XTog0jrYx7TKBQFMHVHjCAbW1KRObh/c8m7wQCKA53zj5eN5aRjyBrfszzzzovpKs17gV2
	JyvMQxeOdrcdpPLKMilOh/JbUXxYhDjZk0fpV8kabSEAC7MnIj9qSF4Cq692e6lV9TQuXm
	kxO9EpAJ38zVWJNTXPEqGIi358Sb6YoVU2UZUBrkmb1SPRDKHZwGXdGV1Lw4lpsr+8Eg7Z
	iz48d1sxD8SyUoDw1JazZAjWcMwO0+YA6Hdl1A5M5KjSqMNB6qPYWkwwiFfLGCNZ8HxDUt
	nl5ChW51TP9+PBgTD6HnKKnjBoAx8pJe67DSke50UWKSCKdn/duzs/GofADCRA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v7 0/3] net: macb: implement ethtool set channels
 count operation
Date: Wed, 18 Nov 2026 21:53:22 +0100
Message-Id: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAEIQ/moC/33Py07DMBAF0F+pvMZobMePsOI/EAs/xtRSa6M4i
 oqq/DtuFhAUi+XozpzRvZOKU8JKXk53MuGSaiq5DfrpRPzZ5g+kKbSZcOAKBEh6td7RijN9xBk
 vlUoXFYKOgmsg7e5zwphum/lGctvMeJvJe0vOqc5l+tqeLWzL/3EXRoFyg8KOyorgxasrZb6k/
 OzLdfMWvjMY6xm8GaPhahSWRRn90RB7Q/QM0QyvlNPasBCcORrD3tA9Y2gGc2GIQ4w+ens05I/
 BgKmeIR9dwCN4cAa1PBrq12D9LqoZMqAcw4g6Av9rrOv6DQ9vXdMSAgAA
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
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
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
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

---
Théo Lebrun (3):
      net: macb: cache ENST config across link down/up
      net: macb: implement ethtool_ops.get|set_channels()
      net: macb: distribute evenly Tx SRAM segments

 drivers/net/ethernet/cadence/macb.h      |  66 +++-
 drivers/net/ethernet/cadence/macb_main.c | 512 +++++++++++++++++++++----------
 2 files changed, 397 insertions(+), 181 deletions(-)
---
base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
change-id: 20260305-macb-set-channels-5bf6e07f3270

Best regards,
--  
Théo Lebrun <theo.lebrun@bootlin.com>

