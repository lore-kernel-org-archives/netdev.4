Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389222;
	b=3VvwX39P5NUf5F2uMX+ReR+Yn/T1hz0tfuwz3px4UtpsDQrkc4Yl4wMzGraziu41zHhq
	 O6utraXTXJK5+k9YQKmtk8KxBB1Po+TkNlXxKOWc8Nt6LjwhaYWNMhLpGcHFtpFpMq2b5
	 TGy+u8GEu7Ww4Sbspsa7UZg4x78KtTVEaGcwFTF9pGzfcfCJBCDfhzxXGnhdNTfoda3DI
	 KS96hZGGfR8GPNCr3PnvRGPu5j2GwtF/g04A7kTNTRticVT3+/ybnzVN88/knfyd9pwXn
	 rZN6KYcp58wrmaVawUde1p0l5zmkfEeI1j1RhcZpto/cleZk8+biP7D0QG+ovm9lN3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389222;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JYjUeJbJJT641Fa0dfiF74fymkTKvoiaW5MSwhTKQcU=;
	b=FufD1vp5to4iceFlVIrz41Ztz2tkMBwfHygVVtbADTzxHYWgOS6M/4Tog/WK54XTuDJZ
	 g1jtdEkKkC+/bS/ohCesSIZLicwHnfIcTyoM85SlL1avfWnL1SOyOxU5W12IYeIbJ/GTe
	 KiVqC/gCFtu4UDwxswQBDMyO9mXAjBZHNK/hzXY6WdAON5gwM6mUV1oHcE1lHaYasPD3r
	 Us5sBy08S7bM2Z5KderFMz7+TAYyx3vlKM1IMVCY1ePWTLJvzLAqKKmUVWvw4RzTh7xpv
	 iEzZATnOwQcCIK1ieMmXOUyCGJTQwQq9Nka/vny+VhawQVufWafg69BmIyf8KkETBwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=WnNpnNb7;
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66BF606A31A;
	Sun, 22 Nov 2026 23:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B66BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=WnNpnNb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1795389216; bh=JYjUeJbJJT641Fa0dfiF74fymkTKvoiaW5MSwhTKQcU=;
	h=From:To:Cc:Subject:Date;
	b=WnNpnNb7Ovu/S68fkOFEIdRnyVDIuGYFtTNbCmlds8Iv/j+gOdq9dhU1tbppSzmAK
	 NbjTPOuC/hILk0wLQ9zzmYC146RlfT2m90w2MiQZbZWULrHbq+Trl+09Al1DovCnjv
	 EJifbOJH4RIUYgpjV7xcVw/Qor6Grmn9sd46EjoD7yQ0UIvdqeH1Y8MJjAVgKV9pkg
	 5juMkmhuRjTxQdNNswbcqy6fMFWTFVoQh9psveEObMXe+3qD4RPbtcQm8TzhCwut19
	 LAL4HWDGQ6rQyFrlcwKElbdtU/1Jy/bvbDr035O4wyd0ZHOaa1ZOh+p2LXIXDuX+nI
	 m+y7pTmDswGZg==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id B9E7827A08FD;
	Mon, 23 Nov 2026 01:13:36 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Mason Chang <mason-cw.chang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 0/3] net: ethernet: mtk_eth_soc: 9K jumbo frame support
Date: Mon, 23 Nov 2026 01:13:31 +0200
Message-Id: <patch-51fa5ed3bc801edb3f29b61ca7888382@loljews.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

This series makes the MediaTek SoC ethernet driver support 9K jumbo
frames on the 10G XGMII MACs (MT7988).  The driver advertises a
2030-byte max_mtu and programs the MAC max-rx field for at most 2048
bytes, so MTU > 2K is rejected and 9K frames are not usable.

Patch 1 fixes a pre-existing 36-bit DMA bug in mtk_poll_rx() that the
review of v3 found: a descriptor released without a new mapping is
handed back with the previous buffer's high address bits.  It is
independent of the rest of the series and carries a Fixes: tag for the
commit that introduced the bug, so the maintainers can route it to
net directly if they prefer.

Patch 2 gates the page_pool on the ring's descriptor length: the pool
hands out order-0 pages and maps at most MTK_PP_MAX_BUF_SIZE, so a
ring whose descriptor length is larger has to use the
netdev_alloc_frag()/mtk_max_buf_alloc() path.

Patch 3 adds the MTK_NETSYS_RX_9K capability, advertises a 9194-byte
max_mtu on the XGMII MACs (from the DT phy_mode at probe, so DSA can
raise the conduit MTU before the netdev is opened), programs
XMAC_RX_CFG2 and the PDMA RX SDL, derives the shared RX buffer length
from the largest MTU (802.1Q headroom included) and sizes the RX rings
from it, keeping the never-polled QDMA ring at its 2K buffers.  The
MAC max-rx limits stay in sync with that shared length, including
GMAC1's MCR jumbo field.  A runtime MTU change that needs larger
buffers is rejected with -EBUSY while DMA is running; shrinking is
allowed.  GMAC1, the built-in switch port, keeps its MCR programming
(bucket plus the jumbo field in 1024-byte units), written after the
MAC_MCR_FORCE_LINK_DOWN reset so it survives every mac_config();
whether the internal switch path enforces that field at all is a
hardware property the commit message documents.

This work is a forward-port of the MediaTek downstream jumbo work:
Mason Chang's "change default rx buffer length" and "add 9k jumbo
frame support" (MediaTek OpenWrt feed 999-eth-30/31, carried in
frank-w/BPI-Router-Linux), plus Frank Wunderlich's "try to fix crash
the right way".  The runtime reallocation of Mason's "dynamic rx
buffer adjustment" (feed 999-eth-33) is not included and will be sent
separately.  Attribution is prose plus Link: tags: Co-developed-by
requires the original authors' own Signed-off-by lines, which we do
not have, and the port diverges from the downstream implementation
(2K buffer floor, per-ring pool gate, the -EBUSY rule, the XDP checks
and the truesize fix are not in the downstream patches).

The equivalent change was tested on a BPI-R4 Pro 8X (MT7988, 10G
lan6 / MxL86252) on the 6.18.60 backport: with both ends at MTU 9000,
8K ICMP passes and iperf3 with MSS 8900 reaches ~9.87 Gbit/s (vs
~2.57 Gbit/s at MSS 1460); the DSA conduit is raised to 9004 at boot.
This series is compile-tested with CONFIG_NET_MEDIATEK_SOC=y and
COMPILE_TEST=y; no hardware run of this exact tree yet.

With the 1 KiB rounding the RX buffer length is order-1 (8 KiB) for
rx_buf_len 4096..7168 and order-2 (16 KiB) from rx_buf_len 8192 up;
at the 9K ring size the 16 KiB buffers pin around 64 MiB while DMA is
up and make the refill a high-order GFP_ATOMIC allocation.  That cost
is inherent to the downstream design; skb->truesize now reports the
allocation that was actually made.

Changes in v8 (the v7 review and the published reference manual):

- the 2K floor is now applied before the 802.1Q headroom is added, so
  MTU 2027..2030 stays at 2K and neither the SGMII/2500base-x MACs on
  MT7988 nor a DSA user port at 2023..2026 fails a runtime change with
  -EBUSY.  A tagged maximum-size frame in that class is still subject
  to the historical 2K limit;
- MTU changes, mtk_dma_init() and mtk_hw_init() now program every MAC
  with the shared ring length instead of only the device being changed,
  so no MAC keeps a limit larger than the buffers after a shrink or a
  partial reopen.  MACs whose interface mode is not known yet are
  skipped and left to their own mac_config();
- the XMAC max-RX limit is written again after the XMAC logic reset that
  mtk_xgdm_mac_link_up() pulses: the published MT7988A reference manual
  gives RX_CFG2 a reset value of 0x800 (2048 bytes), so a reset would
  otherwise cap the MAC at 2K;
- the PDMA SDL write is now described from the MT7988A reference
  manual: ADMA_RX_CFG[31:16] is the "ADMA LRO free buffer SDL", a
  buffer capacity, not the RX frame-length limit; the mask is widened
  to the documented GENMASK(31, 16).  The write itself is unchanged and
  matches the vendor driver;
- the MCR jumbo field keeps the vendor encoding; the reference manual
  defines only 4'h2 (2 Kbytes) for it and marks the rest reserved, but
  the vendor driver programs the length and jumbo passes on its
  reference hardware;
- the commit messages now describe the over-long descriptor drop and the
  exported rx_length_errors update, the all-MAC limit pass and the
  link-up rewrite; the page_pool comment names mtk_max_buf_alloc() after
  the rename; the new buffer-size helper is not inline;
- 1/3 is retitled to "reset dma_addr for every RX descriptor";
- 2/3 no longer carries Simon Horman's Reviewed-by: the predicate it was
  given for changed in v3, before the tag was carried over.

The 36-bit DMA fix in 1/3 was found by review of an earlier revision,
not in production, and has not been triggered at runtime here: it needs
MTK_36BIT_DMA, DRAM above 4 GiB and one of the early release paths in
mtk_poll_rx().

Tested on a BPI-R4 Pro 8X (MT7988, 10G port) on a 6.18.60 backport:
8K ICMP passes and iperf3 with MSS 8900 at MTU 9000 reaches about
9.87 Gbit/s.  The 36-bit fix itself was not exercised there, and this
series is compile-tested with CONFIG_NET_MEDIATEK_SOC=y and
COMPILE_TEST=y.

Changes in v7:

- respin reason: patchwork registered the v6 posting as superseded by the
  v5 posting that went out ten minutes before it, so the series that
  actually applies was hidden behind one that does not.  This repost
  restores a sane version order; the content below also folds in the v6
  review.
- only the SoCs with MTK_NETSYS_RX_9K grow the shared RX rings with the
  MTU.  Everywhere else the buffers stay at 2K, so the 2030-byte maximum
  those SoCs advertise keeps working at runtime and the -EBUSY rule no
  longer applies to them.
- the XDP admission checks now test the same descriptor length the
  page_pool gate uses, instead of the raw buffer length.
- mtk_get_stats64() adds the software rx_length_errors counter, so the
  new over-long descriptor drop is visible in the exported statistics.
- 2/3 names mtk_max_lro_buf_alloc(), the allocator that exists at that
  commit.
- 1/3 gives the commits in the right order and states that the change
  depends on the earlier SER fix it cites; the 3/3 message uses the
  real 32 MiB figure for the single polled ring.

Changes in v6:
- rebase onto current net-next (a76e8bf4be) so the series applies
  again: net-next converted mtk_rx_alloc() to kzalloc_objs(), which
  the hunk context depended on.  No functional change.

Changes in v5 (the v4 review, in full):

- 802.1Q headroom (Medium): the shared RX buffer length now includes
  VLAN_HLEN before the 1 KiB round-up, and the advertised max_mtu is
  lowered by the same four bytes to 9194, so a tagged maximum-size
  frame (9194 + 18 + 4) still fits in rx_buf_len 9216 and the XMAC
  9216 cap.  XMAC_RX_CFG2 and the ring buffers therefore cover a
  tagged frame at every MTU, including the maximum.
- GMAC1 MCR jumbo field (Medium): the vendor driver has a second MCR
  max-rx field we had not ported.  mtk_set_mcr_max_rx() now clears
  and programs the jumbo field (bits 31:28, 1024-byte units,
  MAC_MCR_MAX_RX_JUMBO) for GMAC1, so the driver can program the same
  shared length for the switch port as for the XGMII MACs.  The new
  field handling is limited to the MTK_NETSYS_RX_9K SoCs; every other
  SoC keeps its previous MCR programming bit for bit.
- QDMA ring sizing (Medium): the helpers now take the buffer length
  instead of struct mtk_eth, and mtk_rx_alloc() sizes the
  never-polled QDMA RX ring at the fixed 2K length instead of the
  jumbo length, so it no longer pins ~32 MiB of high-order pages.
  HW-LRO rings keep their 12288-byte sizing.
- pktlen bound (Medium): mtk_poll_rx() drops descriptors whose PLEN0
  exceeds ring->buf_size, with rx_length_errors, before the buffer
  can be passed up, so the larger build_skb() size can no longer hand
  stale memory to the stack if the engine over-reports the length.
- PDMA SDL encoding (Medium): kept as in v4; the comment and commit
  message now say explicitly that the GENMASK(30,16) encoding (frame
  length offset by MTK_PDMA_LRO_SDL) is the vendor's and not publicly
  documented, and that a datasheet confirmation would be welcome.
- XDP detach (Medium): the pool-size check now runs only when a
  program is attached, so a detach always succeeds.  The shared
  eth->prog weakness the review also points out is pre-existing and
  is left to a separate fix.
- 3/3 message (Low): the buffer-size math is corrected (order-1 for
  rx_buf_len 4096..7168, order-2 from 8192) and the message now says
  that the build_skb()/truesize change also covers the HW-LRO rings
  on mt2701, mt7622, mt7623 and mt7629.
- 1/3 subject and message (Low): retitled to describe the fix ("fix
  the RX descriptor address on the release path") and the message now
  cites the commit that introduced the release-path check and the one
  that later changed it, and states the fix's dependency on the latter.

The pre-existing High finding of the review (a failure while filling
an RX ring leaks the partially filled buffers and DMA mappings
because ring->dma_size is still 0) is not part of this series: it is
in the untouched upstream code and will be sent as a separate fix that
sets ring->dma_size before the fill loop.

Simon Horman's Reviewed-by is kept on patch 2 only: patches 1 and 3
are new or changed materially since his review of v1.

Previous versions:
https://lore.kernel.org/all/patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com/ (v7)
https://lore.kernel.org/all/patch-9e765e74d06edbba3fd85a0cd49c4bb5@loljews.com/ (v6)
https://lore.kernel.org/all/patch-f1e62a87eb0f914e1ea52a395f465998@loljews.com/ (v5)
https://lore.kernel.org/all/patch-fc08a7ef40667bf3017366e452e6d3c0@loljews.com/ (v4)
https://lore.kernel.org/all/patch-aad4cfa8d9522d1f7dbc9893ea12e813@loljews.com/ (v3)
https://lore.kernel.org/all/patch-2793186c653124c4c0b3d463bde2ea3a@loljews.com/ (v2)
https://lore.kernel.org/all/patch-4f863a941889f0bceca1c082f2d79624@loljews.com/ (v1)

Sandeep Haemoon (3):
  net: ethernet: mtk_eth_soc: reset dma_addr for every RX descriptor
  net: ethernet: mtk_eth_soc: skip page_pool for RX rings whose buffers
    do not fit
  net: ethernet: mtk_eth_soc: add 9K jumbo frame support

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 398 +++++++++++++++++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  16 +-
 2 files changed, 356 insertions(+), 58 deletions(-)

base-commit: a76e8bf4be552eed20801186188e5606365870a0
-- 
2.53.0

