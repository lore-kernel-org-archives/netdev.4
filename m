Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107237;
	b=UStRCz5jMMeJs64NX05CA4WplJjvnOHLPWuV09XaaCR1vsLYRqknAkAEqqaHrdk5z+z1
	 u2w7vvq9WmEgPS1CCTBT/3hfChvF7nilPjZQ5rIGNvtXqpUsvy8DO8jsM87tblyp6fyxD
	 1zlVEnJKgVNzhE13kVo+DutFRUygAqtCPGGf1sH22sc6R2kwJi4ir9k5hHdhQ9yFbqKGg
	 8by3kbh6yhEWQwUpI8BDPlOK0E6bm0BjOhhlCnpdcO5Giea7qayy8QkUWqOIDvScTcVp2
	 lcmxSAU7KSe3nz5MZfeZuzVo1ePw9sjg055I/o5mjO140lEfDKGGT3ZPjsrB4wmGyQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107237;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6SvA+pkRBMRpq24NpX9HZNQOq8KgZn46Uhy234I9+b0=;
	b=2oKFPdqEHqfVWTjA1XnEY+1Zo6G7gt5Rk1slzA+KjIMPjXCy4TxTEZgWiiUIbquZeN7E
	 aVDsvjCJ5D5WNZNpdiqyKFGKGBzz09Lhr0fbLMZf4hCyDEqcgw5KNt2EBg4/mQyjM9IBv
	 c8qvNmHIw+AQCfWrUqSBM/++Dw3iLiUlLMZMRbG4LBINoT8i1qsxjGUSaZXApJ7ayAFVZ
	 Fcs5TzwoO4NY1ycc/Dposvh+C1kdxaPTDaOxfB3eHXeqYML2XdPLx+ntf2uCfdCL+dxn/
	 s37oqn2Q+sOppKaZ//KIAxJ0L9smzr020Qd9h3Qd2I6YPLJAoZiTExCiXcJO3dXzzHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rbw2M0eX;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85D606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F85D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rbw2M0eX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795107237; x=1826643237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UMw6ARRAFAVP+Ou5ERAkRodfC7ut/ARXjq2NLsx6cKo=;
  b=Rbw2M0eXgnKBgcj9nidKRXTvN4ontQR3iVtKPpPX6XjmNk1STsvworC5
   biktoYmEGyUhS2cWRsEOgynTJZr3IlVdvNOLD4AKX3aAaa9HlOc18wmYL
   zGgqOSvJGDffTlS2ce16mGEKj1XH+BwQAkvGOVywxkK9GoGhj1ur+m6yt
   R/GFFo6ltb0+ZjzdD+kwBaaShFfTxkrbpnBWJ78frff4nPe1J8845qRK5
   oOAqKKoq6rr6WwNWxLtmG60A5ia1LO7cuLCOli2BKp9ITMqP26iR4LE1z
   fLud21DB8AAdt5bZ7GRWptQ/grDDzMSeXGpC7tS+sjrBVBe7HPsQAM/oM
   g==;
X-CSE-ConnectionGUID: 9IxlIOf7QIOOVwAoXpJTkw==
X-CSE-MsgGUID: z+IHadkXRSCVr/lqWbsU6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4045397"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4045397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:53:56 -0800
X-CSE-ConnectionGUID: 6EtDbPtjRr2UAQz651n5qg==
X-CSE-MsgGUID: n2G2dIZ/SnCW0uw2YxxOKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10774884"
Received: from boxer.igk.intel.com ([10.102.20.173])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2026 08:53:52 -0800
From: Magnus Karlsson <magnus.karlsson@intel.com>
To: netdev@vger.kernel.org,
	magnus.karlsson@intel.com,
	magnus.karlsson@gmail.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	bjorn@kernel.org,
	kerneljasonxing@gmail.com
Cc: intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	jacob.e.keller@intel.com
Subject: [PATCH net-next 0/5] xsk: ice: USO support for AF_XDP
Date: Thu, 19 Nov 2026 17:53:35 +0100
Message-Id: <20261119165340.1071525-1-magnus.karlsson@intel.com>
X-Mailer: git-send-email 2.38.1
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

This series adds UDP Segmentation Offload (USO) to AF_XDP. An
application submits one Ethernet frame holding a single IP and UDP
header followed by the aggregate UDP payload, and the device emits a
train of MTU-sized UDP datagrams. Patch 1 implements it for copy mode
(the skb path). Patch 2 is an ice preparation that adds Tx descriptor
builders, and patch 3 implements USO for zero-copy mode in the ice
driver.

AF_XDP never segments these packets itself: a request is rejected
unless the device offers USO. For the ice zero-copy path, the
segmentation is done in HW. In copy mode, the packet is passed
unsegmented to the bound device's driver, and as with UDP_SEGMENT
sockets, how the driver carries out the segmentation is up to it.
Stacked devices (VLAN, bonding, macvlan) forward the packet to a lower
device that may segment it in SW.

The design extends the existing Tx metadata support in AF_XDP. One new
flag, XDP_TXMD_FLAGS_USO, is added, and the reserved u32 in the request
part of struct xsk_tx_metadata is split into two u16 fields called
gso_size and network_offset. Zero-copy support is advertised through
the new tx-uso-zc netdev XSK feature.

network_offset is part of the uAPI because csum_start only locates L4,
while segmentation also needs the start of L3: the device rewrites the
IP header of every datagram and needs the L2 and L3 lengths, and on
the skb path it becomes the network header. With it, the kernel does
not need to understand the link layer, and the fields can be reused
later. Any future extension for tunnel segmentation would treat
network_offset as the outer L3 offset and csum_start as the inner L4
offset, adding only the outer L4 and inner L3 offsets.

To request USO, bind the socket in XDP_COPY mode, or in XDP_ZEROCOPY
mode on a driver advertising tx-uso-zc, and set XDP_TXMD_FLAGS_USO |
XDP_TXMD_FLAGS_CHECKSUM in the Tx metadata. Reserve at least 16 bytes
of metadata and set XDP_TX_METADATA on the first descriptor of the
packet.

Submit an Ethernet frame containing one IP header, one UDP header, and
the aggregate UDP payload. Set network_offset to the IP header offset,
csum_start to the UDP header offset, and csum_offset to the UDP
checksum field offset (6 bytes). Header offsets are measured from the
first descriptor's packet-data address, excluding metadata. Set
gso_size to the number of UDP payload bytes per output datagram,
excluding headers; the last datagram may of course be shorter.

USO is only available on Ethernet devices. IPv4 headers may carry
options but must not be fragmented. In IPv6, the UDP header must
directly follow the fixed header; extension headers are not supported.

The IP and UDP lengths must describe the aggregate packet. Initialize
the UDP checksum field with the partial pseudoheader checksum seed for
that packet. The device generates the per-datagram lengths and UDP
checksums and, for IPv4 segmentation, the IP header checksums. You must
supply a valid IPv4 header checksum as well, since a request that fits
in one datagram uses ordinary checksum offload without segmentation.

All headers through UDP must be in the first buffer. Multi-buffer
packets use XDP_USE_SG and XDP_PKT_CONTD, with metadata only on the
first descriptor. Each output IP packet must fit the device MTU, and
requests remain subject to the device's segmentation limits. Query
tx-udp-segmentation through ethtool to check whether skb UDP
segmentation offload is enabled.

USO cannot be combined with XDP_UMEM_TX_SW_CSUM or
XDP_TXMD_FLAGS_TIMESTAMP. Launch time can be combined with USO in copy
mode, but not in zero-copy mode as that has not been implemented on
ice or tested on any other device for that matter.

A USO request that is rejected is dropped: its buffers are completed
and counted in tx_invalid_descs. This is the only indication of the
failure, whatever its cause: invalid metadata or headers, the MTU,
segmentation limits, or a device without the offload. Errors in other
Tx metadata keep failing sendmsg() in copy mode, so the behaviour for
existing non-USO users is unchanged. Zero-copy drivers without
tx-uso-zc do not drop USO requests; they ignore the Tx metadata and
send the frame unsegmented and without offloads. ice behaves the same
way when it has fewer XDP Tx rings than CPUs, as queues then share XDP
Tx rings. This can be supported in a follow up patch series as it
would require quite some changes to the driver. Note that tx-uso-zc is
still reported in this case, since it is a static driver capability.

In both modes, requests that produce more than one datagram need
tx-udp-segmentation to be enabled; tx-uso-zc only reports driver
capability. In zero-copy mode, a packet may use at most
xdp-zc-max-segs descriptors, and ice specifically allows at most eight
buffers per output datagram, counting the copied header.

The header validator works on a raw header copy instead of an skb, so
that it can be shared by the skb and zero-copy paths. It lives in
net/xdp/xsk_tx_uso.c and include/net/xsk_tx_uso.h. In zero-copy mode,
ice copies the headers into kernel-owned memory before validating them
and handing them to the NIC, while the payload stays in the UMEM. I
tried finding an existing packet header validator that works on raw
buffers that could be reused, but I could not find one. Therefore this
small validator was added.

Testing was done on an ice NIC in loopback mode with a USO selftest,
in both copy and zero-copy mode. Patch 5 adds it as
selftests/net/xsk_uso. It checks the segment count, lengths, checksums
and payload of the received datagrams for IPv4 and IPv6, single and
multi-buffer requests, and that invalid requests are rejected. Patch 4
adds KUnit tests for the header validation helpers. Note that patch 5
should really be integrated into either xskxceiver or Stan's
xdp_hw_metadata tests. But as these are currently being modified to
fit into selftests/net and maybe even merged, I kept the USO tests
separate for now.

The tables below show the UDP packet rate achieved by a single socket
on my rather old 2.1 GHz Cascade Lake server with PCIe3, relative to
no offloads at 1472 bytes. Each request carries a UDP payload that is
segmented into 1472-byte datagrams, either in user space (no offloads,
so UDP checksum is also performed in SW using the kernel's
csum_partial() algorithm) or by the NIC (USO). The application and the
queue's interrupt are pinned to the same core, and the socket is
driven by preferred busy polling with napi_defer_hard_irqs=100 and
gro_flush_timeout=2000000, so there are virtually no device
interrupts. Each table's performance numbers are normalized to the
performance for 1472 byte packets with no offloads in that table.

SKB mode - write all packet data for each packet

+---------------+-------------+---------------+
| Payload bytes | No offloads | USO + HW csum |
+---------------+-------------+---------------+
|          1472 |       +0.0% |        +86.2% |
|          4416 |       +2.2% |       +192.1% |
|          7360 |       +2.6% |       +290.0% |
|         10304 |       +2.4% |       +301.5% |
|         13248 |       +2.4% |       +322.2% |
|         16192 |       +2.1% |       +355.6% |
+---------------+-------------+---------------+

SKB mode - write only headers for each packet

+---------------+-------------+---------------+
| Payload bytes | No offloads | USO + HW csum |
+---------------+-------------+---------------+
|          1472 |       +0.0% |        +88.7% |
|          4416 |       +2.3% |       +211.3% |
|          7360 |       +2.5% |       +342.0% |
|         10304 |       +2.6% |       +367.7% |
|         13248 |       +2.8% |       +394.1% |
|         16192 |       +2.8% |       +444.8% |
+---------------+-------------+---------------+

ZC mode - write all packet data for each packet

+---------------+-------------+---------------+
| Payload bytes | No offloads | USO + HW csum |
+---------------+-------------+---------------+
|          1472 |       +0.0% |       +185.6% |
|          4416 |       +4.1% |       +279.6% |
|          7360 |       +4.8% |       +332.1% |
|         10304 |       +4.4% |       +325.5% |
|         13248 |       +3.6% |       +333.4% |
|         16192 |       +3.5% |       +339.1% |
+---------------+-------------+---------------+

ZC mode - write only headers for each packet

+---------------+-------------+---------------+
| Payload bytes | No offloads | USO + HW csum |
+---------------+-------------+---------------+
|          1472 |       +0.0% |       +163.9% |
|          4416 |       +2.9% |       +260.0% |
|          7360 |       +3.1% |       +291.9% |
|         10304 |       +3.6% |       +303.9% |
|         13248 |       +4.2% |       +307.6% |
|         16192 |       +4.1% |       +315.8% |
+---------------+-------------+---------------+

At 1472 bytes the request fits in one datagram, so USO is not
segmenting anything and the gain comes from the checksum offload
alone. As soon as multiple UDP packets have to be produced on the
wire, USO becomes really beneficial.

For the zero-copy tests, my system seems to bottleneck at around 50
Gbps (about 4 Mpps) with 7K payloads or above. The board only has x8
lanes of PCIe3, though the slot is x16. In any case, there is a
benefit to USO even on this system.

Patch series:
1: Implements USO for skb path
2: Adds Tx descriptor builders and a header length check to ice
3: Implements USO for ice zero-copy driver
4: KUnit tests for the USO header helpers
5: selftests/net: AF_XDP USO functional test


Magnus Karlsson (5):
  xsk: add USO support for skb path
  ice: add Tx descriptor builders and header length check
  xsk: ice: add USO zero-copy support
  xsk: add KUnit tests for AF_XDP USO header helpers
  selftests: net: add AF_XDP USO test

 Documentation/netlink/specs/netdev.yaml       |   4 +
 Documentation/networking/xsk-tx-metadata.rst  | 124 +++
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/intel/ice/ice.h          |  10 +-
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |   2 +
 .../net/ethernet/intel/ice/ice_lan_tx_rx.h    |   1 +
 drivers/net/ethernet/intel/ice/ice_main.c     |  13 +-
 drivers/net/ethernet/intel/ice/ice_sf_eth.c   |   1 +
 drivers/net/ethernet/intel/ice/ice_txrx.c     |  23 +-
 drivers/net/ethernet/intel/ice/ice_txrx.h     |  22 +-
 drivers/net/ethernet/intel/ice/ice_txrx_lib.h |  48 +
 drivers/net/ethernet/intel/ice/ice_xsk.c      | 502 ++++++++-
 drivers/net/ethernet/intel/ice/ice_xsk.h      |  13 +
 include/net/xdp_sock.h                        |   5 +
 include/net/xdp_sock_drv.h                    |  18 +
 include/net/xsk_buff_pool.h                   |   4 +
 include/net/xsk_tx_uso.h                      |  50 +
 include/uapi/linux/if_xdp.h                   |  14 +-
 include/uapi/linux/netdev.h                   |   3 +
 net/core/netdev-genl.c                        |   2 +
 net/xdp/.kunitconfig                          |   6 +
 net/xdp/Kconfig                               |  12 +
 net/xdp/Makefile                              |   2 +
 net/xdp/tests/xsk_tx_uso_kunit.c              | 620 ++++++++++++
 net/xdp/xsk.c                                 | 154 ++-
 net/xdp/xsk_buff_pool.c                       |   6 +
 net/xdp/xsk_queue.h                           |   6 +
 net/xdp/xsk_tx_uso.c                          | 174 ++++
 tools/include/uapi/linux/if_xdp.h             |  14 +-
 tools/include/uapi/linux/netdev.h             |   3 +
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |  10 +-
 tools/testing/selftests/net/xsk_uso.c         | 954 ++++++++++++++++++
 33 files changed, 2751 insertions(+), 71 deletions(-)
 create mode 100644 include/net/xsk_tx_uso.h
 create mode 100644 net/xdp/.kunitconfig
 create mode 100644 net/xdp/tests/xsk_tx_uso_kunit.c
 create mode 100644 net/xdp/xsk_tx_uso.c
 create mode 100644 tools/testing/selftests/net/xsk_uso.c

-- 
2.38.1

