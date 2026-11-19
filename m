Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103185;
	b=my90mUXEopBfKNpotIevDXn2IcL9HochhLUOLwtyb+NPTzvYOr8Mle9bTbZE99TP/dvX
	 xbOpb+x8nPCSt1eweickbeAgxtg+gxehvD1Fi0I/InGfWQpSY4WNtqTnIIEFJc2GvpP1K
	 bSMy1ViPp/D3SqmeV1mkgWg0X/SMeDOdq6bCf3bfN4WCgbXMzeC/qIKktQTLCTZ5xwbop
	 yyYSmx5gCY3MidBWwiDIzrc1ZbWHn6bMZt1BTyeieXwDg68YQ2oUTzcJoDi+pC/YCsLHl
	 ny5KN+YCnsLoXEswZpv+ir2vOQ/9+095QPyJOLkrbCKUT1CpeORGL0EDF68ezqZdBfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103185;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=OTDnmmV75yyZQInK2BKJzo8jDGznOVZ5EBIu/cVGvwk=;
	b=Iv6oI+ygs23W8UI4T00pVpWKxMK3pJze6PWinOGqxbcNFTSPdAP476G3BqYKWDoQJ7m8
	 cpS69+j0+Nf6C1EA9wIkB6CatGhCvBMRwqHtqFaQCvOjFehIirqZLbatCrQ2TYtQMnnz0
	 hcuLbQKFatY+wVjqIv2KiZAKkBRD8m2D6ImusmASr4peacazksLKT4v3t7iobU0vEe1c0
	 YzFqNA4LTPUk/c6vB6oNHaWa1OWF+jxzYJWa5ePLG7jvKWgG1JHJZjqMrQa/FvNhZrtSo
	 mYKZ+ZjhYfSNnbHogGc59aGg8qilnKINcrQ7v+d6261VT2q/fK60o7F0XMW18eGrD+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HVdjuiEi;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A88606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A88606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HVdjuiEi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795103183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OTDnmmV75yyZQInK2BKJzo8jDGznOVZ5EBIu/cVGvwk=;
	b=HVdjuiEi58VIA7L41ShcvJ6GAyqDEajM9y92OB2HrEy6EiMCs1GkuUO6K84RGsKkTBELSI
	r1pAPXsG9Z5cXm8Wn/TnphVUj/ocID9x6aQ6a4FVFvZjXyZxdq7oYiQFz62pkWmqj1kU9j
	cIkQzPTzam7o7N745q9EHKptkF7u5/M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-1A23tIWuNN-L0NcD9N5wiQ-1; Thu,
 19 Nov 2026 10:46:19 -0500
X-MC-Unique: 1A23tIWuNN-L0NcD9N5wiQ-1
X-Mimecast-MFC-AGG-ID: 1A23tIWuNN-L0NcD9N5wiQ_1795103178
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DBDF1954120;
	Thu, 19 Nov 2026 15:46:18 +0000 (UTC)
Received: from pabeni-thinkpadp1gen8.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C41C344;
	Thu, 19 Nov 2026 15:46:16 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: torvalds@linux-foundation.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Networking for v7.4-rc4
Date: Thu, 19 Nov 2026 16:46:06 +0100
Message-ID: <20261119154606.144368-1-pabeni@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Hi Linus!

The following changes since commit 7e1392a42ea288d70a266f6553fe06f57f8647ea:

  Merge tag 'net-7.4-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-11-12 12:26:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git net-7.4-rc4

for you to fetch changes up to b10c986f1769287270de248548476f6dc2275d59:

  net: prevent receive header offset overflow during decapsulation (2026-11-19 15:28:29 +0100)

----------------------------------------------------------------
Including fixes from netfilter and Bluetooth.

Current release - regressions:

  - ipvs: honor the overload state and do not enter it forever

Previous releases - regressions:

  - core:
    - prevent receive header offset overflow during decapsulation
    - avoid truncated transport header offsets

  - tcp:
    - fix NULL pointer dereference when restarting a fast open listener
    - fix the SO_REUSEPORT bind cache admitting a conflicting socket

  - sctp: do not free a new asoc peeled off while sendmsg slept

  - bridge: fix skb leak of reinjected link-local frames

  - bluetooth:
    - L2CAP: clear the SDU before the receive callback
    - vhci: serialize packet reception with device creation

  - ipvs:
    - avoid stack overflow from recursive connection expiration
    - fix problems during connection deletion

  - eth: virtio_net: check RX buffer length before DMA sync

  - eth: gve: fix RX page refcount overflow from INT_MAX pagecnt_bias

Previous releases - always broken:

  - core: make room for the tunnel header in skb_segment_list()

  - eth: i40e: fix freeing of TX rings on RX allocation failure

  - eth: stmmac: fix VXLAN over IPv6 with zero UDP checksum

Signed-off-by: Paolo Abeni <pabeni@redhat.com>

----------------------------------------------------------------
Aleksandr Loktionov (1):
      i40e: avoid resetting BQL state when freeing temporary Tx rings in set_ringparam

Alexey Charkov (1):
      net: via-rhine: Stop the NIC on platform device shutdown

Ali Tariq (2):
      net: spacemit: Fix TX timeout work deadlocking on itself
      net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()

Amaan Cheval (2):
      gve: refuse XDP on queue formats without XDP support
      gve: fix RX page refcount overflow from INT_MAX pagecnt_bias

Amir Abudubai (1):
      Bluetooth: L2CAP: Fix size check for receive buffer space

Anthony Pighin (1):
      net: gianfar: clear the pending Rx skb when freeing the Rx ring

Arnd Bergmann (1):
      net: kunit: move struct net_devmem_dmabuf_binding off stack

Arun Iyengar (1):
      net: stmmac: drop the rest of the frame when napi_build_skb() fails

Avi Weiss (1):
      net: ena: avoid double-counting TX DMA mappings on failure

Axel Mierczuk (2):
      ipvs: validate cport in received sync records
      ipvs: skip cport 0 connections in ip_vs_conn_out_get()

Cen Zhang (4):
      Bluetooth: hci_conn: Initialize the device before hash insertion
      Bluetooth: vhci: Flush suspend work after removing debugfs
      Bluetooth: vhci: Serialize packet reception with device creation
      Bluetooth: L2CAP: Protect the receive reject-list lookup

Chandrashekar Devegowda (1):
      Bluetooth: btintel_pcie: Fix SCP DBGC base address

Changyul Lee (1):
      net/mlx5e: Hold sync_lock while resetting VXLAN ports

Chris J Arges (1):
      net: prevent receive header offset overflow during decapsulation

Chris Mason (5):
      tcp: don't let __tcp_set_rto() return 0
      tcp: clamp RTT samples in tcp_rtt_estimator()
      tcp: reject RTT samples from TSecr above 120 s
      tcp: clamp the samples in tcp_rcv_rtt_update()
      tcp: bound the rto_min of a route in tcp_rto_min()

Christian Schmidbauer (3):
      net: stmmac: honour Rx checksum errors in the AF_XDP zero-copy path
      net: stmmac: dwmac1000: don't discard frames with only a checksum error
      net: stmmac: dwmac1000: stop hardware from dropping checksum-error packets

Chun-Yi Lee (1):
      Bluetooth: SMP: Fail if local and remote public key X coords match

Cunhao Lu (1):
      MAINTAINERS: exclude CAN documentation from general networking

Daniel Machon (2):
      net: sparx5: fix RX ring stall on frames from inactive ports
      net: lan969x: fix RX ring stall on frames from inactive ports

Daniel Wade (1):
      net: bridge: fix skb leak of reinjected link-local frames

Darong Lu (1):
      ipvs: wait grace period before reusing destinations

Eric Dumazet (6):
      tcp: purge Fast Open RST queue when listen() fails
      ipv6: gro: limit the number of extension headers
      ipv6: mcast: use skb_set_transport_header_careful() in ipv6_mc_check_exthdrs()
      net: openvswitch: use skb_set_transport_header_careful() in parse_ipv6hdr()
      sctp: use skb_set_transport_header_careful() in sctp_v6_err()
      udp: use skb_set_transport_header_careful() in __udp6_lib_err_encap()

Filip Balluch (1):
      i40e: fix freeing of TX rings on RX allocation failure

Gal Pressman (1):
      net/mlx5e: Fix XSK pool corruption when switching channels

Haishuang Yan (1):
      virtio_net: Disable AF_XDP pools on queues above curr_queue_pairs

Hangbin Liu (1):
      ipv6: ioam6: do not modify shared tuninfo eh.nexthdr

Hengyu Liang (1):
      neighbour: do not update an existing proxy entry on SIOCSARP

Henry Martin (2):
      sctp: fix skb_over_panic when adding addresses with a pending delete of another family
      ip6mr: prevent info-leak in ip6mr_cache_report()

Hex Lindqvist (1):
      Bluetooth: btintel: Don't log unsupported debug features as an error

Hyunwoo Kim (1):
      tcp: fix NULL pointer dereference when restarting a Fast Open listener

Jaeyeong Lee (1):
      net/tls: serialize context removal in tls_device_down()

Jakub Kicinski (9):
      Merge branch 'bnxt_en-fix-pm-resume-on-vfs'
      Merge branch 'tcp-fix-the-so_reuseport-bind-cache-admitting-a-conflicting-socket'
      Merge branch 'gve-fix-rx-page-refcount-overflow-with-the-pagecnt-bias'
      Merge tag 'for-net-2026-11-17' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth
      Merge branch 'net-spacemit-fix-tx-timeout-work-deadlock-and-rtnl-in-pm-callbacks'
      Merge branch 'net-sparx5-lan969x-fix-rx-ring-stall-on-frames-from-inactive-ports'
      Merge branch 'af_unix-fix-scm_stat-nr_fds-leak-in-unix_dgram_disconnected'
      Merge branch 'amt-relay-tunnel-lifetime-validation-and-request-path-hardening'
      Merge branch 'intel-wired-lan-driver-updates-2026-11-12-i40e-iavf'

Jeremy Dean Clifton (3):
      Bluetooth: hci_conn: Free the unset handle when adding a connection fails
      Bluetooth: hci_conn: Refuse new connections once HCI_UP is cleared
      Bluetooth: hci_sync: Disable connection works before draining

Joas Antonio dos Santos (4):
      Bluetooth: hci_qca: clear qca_memdump when discarding dump packets
      Bluetooth: L2CAP: validate MPS and MTU in ECRED connection response
      net: usb: smsc75xx: reject frames without a full header and FCS
      mac802154: llsec: reject secured frames with security level 0

Juan Agustin Niccolini (2):
      tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
      selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c

Julian Anastasov (5):
      ipvs: fix problems during connection deletion
      ipvs: update flags and seqs in backup server under lock
      ipvs: read flags and seqs in master atomically
      ipvs: honor the overload state and do not enter it forever
      ipvs: do not create conns from packets with port 0

Julius Bairaktaris (1):
      net: make room for the tunnel header in skb_segment_list()

Kalpesh Solanki (2):
      bonding: reject IEEE 802.15.4 and 6LoWPAN devices in bond_enslave
      tun: disallow setting ARPHRD_MCTP link type via TUNSETLINK

Keegan Freyhof (2):
      bnxt_en: Map HWRM_ERR_CODE_PF_UNAVAILABLE to -ECOMM
      bnxt_en: Wait for the PF in bnxt_resume()

Lorenzo Bianconi (1):
      net: stmmac: re-base EST after PTP settime64

Luiz Augusto von Dentz (1):
      Bluetooth: 6lowpan: Always consume the skb in chan_recv_cb

Mateusz Jończyk (1):
      net: phy: realtek: fix listing of sysfs directory tree

Maxime Chevallier (1):
      net: stmmac: Clear DMA errors for multi-channel interrupts

Michael McAllister (1):
      Bluetooth: hci_mrvl: Leave the serdev port lifetime to hci_serdev

Nathan Chancellor (3):
      mptcp: Avoid unsequenced accesses to jiffies in mptcp_reset_tout_timer()
      net: microchip: encx24j600: Avoid unsequenced accesses to jiffies in encx24j600_tx()
      qca_spi: Avoid unsequenced accesses to jiffies in qcaspi_netdev_tx_timeout()

Nguyen Ngoc Thang (1):
      Bluetooth: L2CAP: return LE credits from recvmsg under the conn lock

Omar Ramadan (6):
      amt: stop receiving before amt_dev_stop() tears down its state
      amt: fix use-after-free when a Membership Update re-arms a freed tunnel
      amt: reject a gateway Query or Data from 0.0.0.0 before a relay is learned
      amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
      amt: make pre-query report drops visible
      amt: create relay tunnels only from authenticated Updates

Paolo Abeni (5):
      Merge tag 'nf-26-11-16' of git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf
      Merge branch 'veth-fix-txqs-that-are-never-woken-after-backpressure'
      Merge branch 'net-stmmac-deliver-frames-with-rx-checksum-errors-to-the-stack'
      Merge branch 'net-avoid-truncated-transport-header-offsets'
      Merge branch 'tcp-avoid-integer-wraps-in-the-rtt-estimator-and-the-rto'

Piyus Kedia (1):
      Bluetooth: L2CAP: clear the SDU before the receive callback

Shay Drory (2):
      net/mlx5: IFC, enlarge active_port field to support 8 port LAG
      net/mlx5e: rep, Fix races between devcom PAIR event and uplink close

Shuai Zhang (2):
      Bluetooth: hci_qca: Reopen the UART after enabling QCA2066
      Bluetooth: hci_qca: Don't use the serdev port after a failed reopen

Siddharth Chintamaneni (2):
      af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
      selftest: af_unix: Test scm_fds on dgram disconnect.

Simon Schippers (2):
      veth: wake a stopped peer txq beyond real_num_tx_queues
      veth: wake the peer txq when deleting NAPI

Sung Byeongchan (1):
      ieee802154: require CAP_NET_ADMIN for SIOCSIFADDR

Suraj Gupta (1):
      MAINTAINERS: Add Suraj Gupta as AXI Ethernet co-maintainer

Svyatoslav Nikolenko (1):
      net: e1000: fix warning in iounmap on probe failure

Theodor Arsenij Larionov Trichkine (2):
      ipvs: ftp: skip conntrack templates in ip_vs_ftp_out
      fou: reserve headroom before pushing the encap header

Vladimir Petrzhikovskii (1):
      virtio_net: check RX buffer length before DMA sync

Wajeeh Atrash (1):
      net: ena: set admin device pointer before queue allocations

Weihong Guan (5):
      Bluetooth: hci_sync: Set random address on the set's handle
      Bluetooth: hci_sync: Remove an advertising set by its handle
      Bluetooth: hci_core: Add hci_free_adv_instance()
      Bluetooth: hci_event: Find the owner of a terminated adv set
      Bluetooth: hci_sync: Drop the command's sk reference

Wenbo Sun (2):
      net: dcb: flush rewrite table on device unregister
      team: validate the length of U32 and S32 option data

Xin Long (1):
      sctp: validate SACK pull length against chunk length, not skb length

Xu Rao (1):
      Bluetooth: MGMT: Fix runtime config status opcode

Xuanqiang Luo (3):
      iavf: fix QoS capabilities memory leak
      iavf: fix ASQ command buffer leak on init failure
      iavf: add missing PTP adjustment callbacks

Yves Bieri (1):
      sctp: do not free a new asoc peeled off while sendmsg slept

Zhao Li (1):
      Bluetooth: hci_serdev: serialize flush with transmit work

Zihan Xi (2):
      ipvs: avoid stack overflow from recursive connection expiration
      ipvs: reject FTP control ports as data ports

Zxyan Zhu (1):
      net: stmmac: re-enable on-chip parity checkers for XGMAC ASP 0x2

 MAINTAINERS                                        |   6 +
 drivers/bluetooth/btintel.c                        |  11 +-
 drivers/bluetooth/btintel_pcie.h                   |   2 +-
 drivers/bluetooth/btqca.c                          |   1 +
 drivers/bluetooth/hci_mrvl.c                       |  14 -
 drivers/bluetooth/hci_qca.c                        |  47 +-
 drivers/bluetooth/hci_serdev.c                     |  17 +-
 drivers/bluetooth/hci_vhci.c                       |   5 +
 drivers/net/amt.c                                  | 663 ++++++++++++++++-----
 drivers/net/bonding/bond_main.c                    |   7 +-
 drivers/net/ethernet/amazon/ena/ena_com.c          |   2 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c       |   1 -
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  51 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c     |   4 +-
 drivers/net/ethernet/freescale/gianfar.c           |   1 +
 drivers/net/ethernet/google/gve/gve.h              |   2 +-
 .../net/ethernet/google/gve/gve_buffer_mgmt_dqo.c  |   4 +-
 drivers/net/ethernet/google/gve/gve_main.c         |   6 +
 drivers/net/ethernet/google/gve/gve_rx.c           |   8 +-
 drivers/net/ethernet/google/gve/gve_utils.c        |  12 +-
 drivers/net/ethernet/google/gve/gve_utils.h        |   2 +-
 drivers/net/ethernet/intel/e1000/e1000_main.c      |   3 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c     |   9 +-
 drivers/net/ethernet/intel/iavf/iavf_adminq.c      |   1 +
 drivers/net/ethernet/intel/iavf/iavf_main.c        |   1 +
 drivers/net/ethernet/intel/iavf/iavf_ptp.c         |  12 +
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |  19 +
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |  21 +-
 .../net/ethernet/mellanox/mlx5/core/lib/devcom.c   |  14 +
 .../net/ethernet/mellanox/mlx5/core/lib/devcom.h   |   2 +
 .../net/ethernet/mellanox/mlx5/core/lib/vxlan.c    |  24 +-
 drivers/net/ethernet/microchip/encx24j600.c        |   3 +-
 .../microchip/sparx5/lan969x/lan969x_fdma.c        |  11 +-
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    |  12 +-
 drivers/net/ethernet/qualcomm/qca_spi.c            |   4 +-
 drivers/net/ethernet/spacemit/k1_emac.c            |  19 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |   8 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |   5 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   |   2 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   6 +-
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c     |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  37 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c   |   9 +
 drivers/net/ethernet/via/via-rhine.c               |  12 +
 drivers/net/phy/realtek/realtek_main.c             |   2 +-
 drivers/net/team/team_core.c                       |   8 +
 drivers/net/tun.c                                  |   3 +-
 drivers/net/usb/smsc75xx.c                         |   8 +
 drivers/net/veth.c                                 |   9 +-
 drivers/net/virtio_net.c                           |  66 +-
 include/linux/mlx5/mlx5_ifc.h                      |   4 +-
 include/linux/skbuff.h                             |   1 +
 include/net/amt.h                                  |  32 +-
 include/net/bluetooth/hci_core.h                   |   1 +
 include/net/bluetooth/l2cap.h                      |   1 +
 include/net/dropreason-core.h                      |   6 +
 include/net/inet_hashtables.h                      |   2 +
 include/net/ip_vs.h                                |   7 +-
 include/net/neighbour.h                            |   2 +-
 include/net/tcp.h                                  |  14 +-
 net/bluetooth/6lowpan.c                            |  18 +-
 net/bluetooth/hci_conn.c                           |  20 +-
 net/bluetooth/hci_core.c                           |  24 +-
 net/bluetooth/hci_event.c                          |  42 +-
 net/bluetooth/hci_sync.c                           | 131 +++-
 net/bluetooth/l2cap_core.c                         | 127 +++-
 net/bluetooth/l2cap_sock.c                         |  12 +-
 net/bluetooth/mgmt_config.c                        |   2 +-
 net/bluetooth/smp.c                                |  13 +-
 net/bridge/br_input.c                              |  18 +-
 net/core/dev.c                                     |   4 +
 net/core/neighbour.c                               |   9 +-
 net/core/net_test.c                                |  12 +-
 net/core/skbuff.c                                  |   4 +
 net/dcb/dcbnl.c                                    |   7 +
 net/ieee802154/socket.c                            |   4 +
 net/ipv4/arp.c                                     |   2 +-
 net/ipv4/fou_core.c                                |  19 +-
 net/ipv4/inet_connection_sock.c                    |  52 +-
 net/ipv4/ip_input.c                                |   6 +
 net/ipv4/ip_tunnel.c                               |   6 +-
 net/ipv4/tcp_input.c                               |  21 +-
 net/ipv6/ioam6_iptunnel.c                          |  16 +-
 net/ipv6/ip6_input.c                               |   4 +
 net/ipv6/ip6_offload.c                             |   8 +
 net/ipv6/ip6mr.c                                   |   2 +-
 net/ipv6/mcast_snoop.c                             |   3 +-
 net/ipv6/udp.c                                     |   7 +-
 net/mac802154/llsec.c                              |   2 +
 net/mptcp/protocol.c                               |   3 +-
 net/netfilter/ipvs/ip_vs_conn.c                    | 131 ++--
 net/netfilter/ipvs/ip_vs_core.c                    |   3 +-
 net/netfilter/ipvs/ip_vs_ctl.c                     | 140 +++--
 net/netfilter/ipvs/ip_vs_ftp.c                     |  20 +-
 net/netfilter/ipvs/ip_vs_lblc.c                    |   8 +-
 net/netfilter/ipvs/ip_vs_lblcr.c                   |  13 +-
 net/netfilter/ipvs/ip_vs_proto_sctp.c              |   7 +
 net/netfilter/ipvs/ip_vs_proto_tcp.c               |   7 +
 net/netfilter/ipvs/ip_vs_proto_udp.c               |   6 +
 net/netfilter/ipvs/ip_vs_sync.c                    |  53 +-
 net/openvswitch/flow.c                             |   3 +-
 net/sctp/ipv6.c                                    |   5 +-
 net/sctp/sm_make_chunk.c                           |  28 +-
 net/sctp/sm_statefuns.c                            |   3 +-
 net/sctp/socket.c                                  |  12 +-
 net/tls/tls_device.c                               |  10 +-
 net/unix/af_unix.c                                 |  59 +-
 tools/testing/selftests/net/af_unix/scm_rights.c   |  75 +++
 tools/testing/selftests/net/bind_wildcard.c        |  54 ++
 111 files changed, 1931 insertions(+), 581 deletions(-)

